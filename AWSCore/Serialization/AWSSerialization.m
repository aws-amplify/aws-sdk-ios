/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "AWSSerialization.h"
#import "AWSXMLWriter.h"
#import "AZCategory.h"
#import "AZLogging.h"
#import "XMLDictionary.h"

NSString *const AWSXMLBuilderErrorDomain = @"com.amazonaws.AWSXMLBuilderErrorDomain";
NSString *const AWSXMLParserErrorDomain = @"com.amazonaws.AWSXMLParserErrorDomain";

@interface AWSJSONDictionary()

@property (nonatomic, strong) NSDictionary *embeddedDictionary;
@property (nonatomic, strong) NSDictionary *JSONDefinitionRule;

@end

@implementation AWSJSONDictionary

- (instancetype)initWithDictionary:(NSDictionary *)otherDictionary JSONDefinitionRule:(NSDictionary *)rule {
    self = [super init];
    if (self) {
        _embeddedDictionary = [[NSDictionary alloc] initWithDictionary:otherDictionary];
        _JSONDefinitionRule = [rule copy];
    }
    return self;
}

- (id)parseResult:(id)result {
    if ([result isKindOfClass:[NSDictionary class]]) {
        return [[AWSJSONDictionary alloc] initWithDictionary:result JSONDefinitionRule:self.JSONDefinitionRule];
    } else {
        return result;
    }
}

- (NSUInteger)count {
    return [self.embeddedDictionary count];
}

- (id)objectForKey:(id)aKey {
    //If value found, just return value
    id value = [self.embeddedDictionary objectForKey:aKey];
    if (value) {
        return [self parseResult:value];
    }

    //find value in metadata dictionary, return the value if found
    id result = [[self.embeddedDictionary objectForKey:@"metadata"] objectForKey:aKey];
    if (result) {
        return [self parseResult:result];
    }

    //find value according to shapeName, return the value if found
    NSString *shapeName = [self.embeddedDictionary objectForKey:@"shape"];
    if (shapeName.length != 0 ) {
        NSDictionary *definitionResult = [self.JSONDefinitionRule objectForKey:shapeName];

        id result = [definitionResult objectForKey:aKey];
        if (result) {
            return [self parseResult:result];
        }

        id metaDataResult = [[definitionResult objectForKey:@"metadata"] objectForKey:aKey];
        if (metaDataResult) {
            return [self parseResult:metaDataResult];
        }
    }

    return nil;
}

- (NSEnumerator *)keyEnumerator {
    return [self.embeddedDictionary keyEnumerator];
}

@end

@implementation AWSXMLBuilder

+ (BOOL)failWithCode:(NSInteger)code description:(NSString *)description error:(NSError *__autoreleasing *)error {
    if (error) {
        *error = [NSError errorWithDomain:AWSXMLBuilderErrorDomain
                                     code:code
                                 userInfo:@{NSLocalizedDescriptionKey : description}];
    }
    return NO;
}

+ (NSString *)xmlStringForDictionary:(NSDictionary *)params actionName:(NSString *)actionName serviceDefinitionRule:(NSDictionary *)serviceDefinitionRule error:(NSError *__autoreleasing *)error {
    return [[self xmlBuildForDictionary:params actionName:actionName serviceDefinitionRule:serviceDefinitionRule error:error] toString];
}

+ (NSData *)xmlDataForDictionary:(NSDictionary *)params actionName:(NSString *)actionName serviceDefinitionRule:(NSDictionary *)serviceDefinitionRule error:(NSError *__autoreleasing *)error {

    if ([params count] == 0) {
        return nil;
    }
    NSData *resultData = [[self xmlBuildForDictionary:params actionName:actionName serviceDefinitionRule:serviceDefinitionRule  error:error] toData];

    return resultData;
}

+ (AWSXMLWriter *)xmlBuildForDictionary:(NSDictionary *)params actionName:(NSString *)actionName serviceDefinitionRule:(NSDictionary *)serviceDefinitionRule error:(NSError *__autoreleasing *)error {

    NSDictionary *actionRule = [[[serviceDefinitionRule objectForKey:@"operations"] objectForKey:actionName] objectForKey:@"input"];
    NSDictionary *definitionRules = [serviceDefinitionRule objectForKey:@"shapes"];

    if (definitionRules == (id)[NSNull null] ||  [definitionRules count] == 0) {
        [self failWithCode:AWSXMLBuilderDefinitionFileIsEmpty description:@"JSON definition File is empty or can not be found" error:error];
        return nil;
    }



    if ([actionRule count] == 0) {
        [self failWithCode:AWSXMLBuilderUndefinedActionRule description:@"Invalid argument: actionRule is Empty" error:error];
        return nil;
    }


    AWSXMLWriter* xmlWriter = [[AWSXMLWriter alloc]init];

    AWSJSONDictionary *rules = [[AWSJSONDictionary alloc] initWithDictionary:actionRule JSONDefinitionRule:definitionRules];
    [self serializeStructure:params rules:rules xmlWriter:xmlWriter error:error isRootRule:YES];
    return xmlWriter;
}

+ (BOOL)serializeStructure:(NSDictionary *)params rules:(AWSJSONDictionary *)rules xmlWriter:(AWSXMLWriter *)xmlWriter error:(NSError *__autoreleasing *)error isRootRule:(BOOL)isRootRule {

    AWSJSONDictionary *structureMembersRule = rules[@"members"]?rules[@"members"]:@{};

    //If it is RootRule, only process payload If it exists.
    if (isRootRule) {
        NSString *payloadMemberName = rules[@"payload"];
        if (payloadMemberName) {
            id value = params[payloadMemberName];
            if (value) {
                AWSJSONDictionary *payloadMemberRules = structureMembersRule[payloadMemberName];
                return [self serializeMember:value name:payloadMemberName rules:payloadMemberRules xmlWriter:xmlWriter error:error];
            }

        }
        return YES;
    }

    __block BOOL isValid = YES;
    __block NSError *blockErr = nil;
    [structureMembersRule enumerateKeysAndObjectsUsingBlock:^(NSString *memberName, id memberRules, BOOL *stop) {

        id value = params[memberName];
        if (value) {

            if (memberRules[@"xmlAttribute"]) {
                //It should be an attribute, will be proceed in applyNamespacesAndAttributesByRules
                return;
            }


            if (![self serializeMember:value name:memberName rules:memberRules xmlWriter:xmlWriter error:&blockErr]) {
                *stop = YES;
                isValid = NO;
                return;
            }
        }
    }];
    if (error) *error = blockErr;
    return isValid;
}

+ (BOOL)serializeList:(NSArray *)list name:(NSString *)name rules:(AWSJSONDictionary *)rules xmlWriter:(AWSXMLWriter *)xmlWriter error:(NSError *__autoreleasing *)error {

    AWSJSONDictionary *memberRules = rules[@"member"]?rules[@"member"]:@{};
    NSString *xmlListName = rules[@"locationName"]?rules[@"locationName"]:name;

    __block BOOL isValid = YES;
    __block NSError *blockErr = nil;
    if ([rules[@"flattened"] boolValue]) {

        [list enumerateObjectsUsingBlock:^(id value, NSUInteger idx, BOOL *stop) {
            if (![self serializeMember:value name:xmlListName rules:memberRules xmlWriter:xmlWriter error:&blockErr]) {
                *stop = YES;
                isValid = NO;
                return ;
            }
        }];
    } else {

        //Add a extra layer for non-flattened format.
        [xmlWriter writeStartElement:xmlListName];

        [list enumerateObjectsUsingBlock:^(id value, NSUInteger idx, BOOL *stop) {

            if (![self serializeMember:value name:name rules:memberRules xmlWriter:xmlWriter error:&blockErr]) {
                *stop = YES;
                isValid = NO;

                return ;
            }

        }];

        [xmlWriter writeEndElement:xmlListName];
    }
    if (error) *error = blockErr;
    return isValid;
}

+ (BOOL)serializeMember:(id)params name:(NSString *)memberName rules:(AWSJSONDictionary *)rules xmlWriter:(AWSXMLWriter *)xmlWriter error:(NSError *__autoreleasing *)error {
    NSString *xmlElementName = rules[@"locationName"]?rules[@"locationName"]:memberName;
    NSString *rulesType = rules[@"type"];
    if ([rulesType isEqualToString:@"structure"]) {
        [xmlWriter writeStartElement:xmlElementName];
        [self applyNamespacesAndAttributesByRules:rules params:params xmlWriter:xmlWriter];
        [self serializeStructure:params rules:rules xmlWriter:xmlWriter error:error isRootRule:NO];
        [xmlWriter writeEndElement:xmlElementName];
    } else if ([rulesType isEqualToString:@"list"]) {
        [self serializeList:params name:memberName rules:rules xmlWriter:xmlWriter error:error];
    } else if ([rulesType isEqualToString:@"map"]) {
        //TODO: handle map type
    } else if ([rulesType isEqualToString:@"timestamp"]) {
        NSDate *timeStampDate;
        //maybe a NSDate type or NSNumber type or NSString type
        if ([params isKindOfClass:[NSString class]]) {
            if ([params doubleValue] == 0.0) {
                //not a float type, just pass the string
                [xmlWriter writeStartElement:xmlElementName];
                [xmlWriter writeCharacters:params];
                [xmlWriter writeEndElement:xmlElementName];
            } else {
                //need to convert to NSDate type
                timeStampDate = [NSDate dateWithTimeIntervalSince1970:[params doubleValue]];
            }
        } else if ([params isKindOfClass:[NSNumber class]]) {
            //need to convert to NSDate type
            timeStampDate = [NSDate dateWithTimeIntervalSince1970:[params doubleValue]];

        } else if ([params isKindOfClass:[NSDate class]]) {
            timeStampDate = params;
        }

        //generate string presentation of timestamp
        NSString *timestampStr = [timeStampDate az_stringValue:AZDateISO8601DateFormat2];

        [xmlWriter writeStartElement:xmlElementName];
        [xmlWriter writeCharacters:timestampStr];
        [xmlWriter writeEndElement:xmlElementName];
    } else if ([rulesType isEqualToString:@"integer"] || [rulesType isEqualToString:@"long"] || [rulesType isEqualToString:@"float"] || [rulesType isEqualToString:@"double"]) {
        NSNumber *numberValue = params;
        [xmlWriter writeStartElement:xmlElementName];
        [xmlWriter writeCharacters:[numberValue stringValue]];
        [xmlWriter writeEndElement:xmlElementName];
    } else if ([rulesType isEqualToString:@"blob"]) {
        //TODO: validate if base64 format
        //just skip, will be handled as special case. may be streaming type
    } else if ([rulesType isEqualToString:@"boolean"]) {
        [xmlWriter writeStartElement:xmlElementName];
        [xmlWriter writeCharacters:[params boolValue]?@"true":@"false"];
        [xmlWriter writeEndElement:xmlElementName];
    } else if ([rulesType isEqualToString:@"string"]) {
        [xmlWriter writeStartElement:xmlElementName];
        [xmlWriter writeCharacters:params];
        [xmlWriter writeEndElement:xmlElementName];
    } else {
        [self failWithCode:AWSXMLBuilderUnCatchedRuleTypeInDifinitionFile description:[NSString stringWithFormat:@"uncatched ruletype:%@ for value:%@",rulesType,[params description]] error:error];
        return NO;
    }
    return YES;
}

+ (void)applyNamespacesAndAttributesByRules:(NSDictionary *)rules params:(id)params xmlWriter:(AWSXMLWriter *)xmlWriter {
    id xmlNamespaceValue = rules[@"xmlNamespace"];
    if (xmlNamespaceValue) {
        if ([xmlNamespaceValue isKindOfClass:[NSDictionary class]]) {
            NSString *xmlnsName = @"xmlns";
            if (xmlNamespaceValue[@"prefix"]) {
                xmlnsName = [xmlnsName stringByAppendingString:[NSString stringWithFormat:@":%@",xmlNamespaceValue[@"prefix"]]];
            }
            [xmlWriter writeAttribute:xmlnsName value:xmlNamespaceValue[@"uri"]];
        } else if ([xmlNamespaceValue isKindOfClass:[NSString class]]) {
            NSString *xmlnsName = @"xmlns";
            [xmlWriter writeAttribute:xmlnsName value:xmlNamespaceValue];
        }
    }

    if ([rules[@"members"][@"Type"][@"xmlAttribute"] boolValue]) {
        NSString *xmlName = rules[@"members"][@"Type"][@"locationName"];
        if (params[@"Type"]) {
            [xmlWriter writeAttribute:xmlName value:params[@"Type"]];
        }
    }
}

@end

@implementation AWSXMLParser

+ (BOOL)failWithCode:(NSInteger)code description:(NSString *)description error:(NSError *__autoreleasing *)error {
    if (error) {
        *error = [NSError errorWithDomain:AWSXMLParserErrorDomain
                                     code:code
                                 userInfo:@{NSLocalizedDescriptionKey : description}];
    }
    return NO;
}

+ (NSMutableDictionary *)preprocessDictionary:(NSMutableDictionary *)fromDictionary operationName:(NSString *)operationName actionRule:(NSDictionary *)actionRule serviceDefinitionRule:(NSDictionary *)serviceDefinitionRule {

    NSString *serviceTypeStr = serviceDefinitionRule[@"metadata"][@"type"]?serviceDefinitionRule[@"metadata"][@"type"]:serviceDefinitionRule[@"metadata"][@"protocol"];
    

    if ([serviceTypeStr isEqualToString:@"query"]) {
        NSNumber *isResultWrapped = serviceDefinitionRule[@"metadata"][@"resultWrapped"];
        if (isResultWrapped && ![isResultWrapped boolValue]) {
            //If resultWrapped is false
            return fromDictionary;
        } else {
            //If not set, it is true by default
            if (actionRule[@"resultWrapper"] && fromDictionary[actionRule[@"resultWrapper"]]) {
                return fromDictionary[actionRule[@"resultWrapper"]];
            } else if ([operationName stringByAppendingString:@"Result"] && fromDictionary[[operationName stringByAppendingString:@"Result"]]){
                return fromDictionary[[operationName stringByAppendingString:@"Result"]];
            } else {
                return fromDictionary;
            }
        }

    } else if ([serviceTypeStr isEqualToString:@"rest-xml"]) {
        //TODO: handle rest-xml type for Route 53 and S3
        return fromDictionary;
    } else if ([serviceTypeStr isEqualToString:@"json"]) {
        return fromDictionary;
    } else if ([serviceTypeStr isEqualToString:@"rest-json"]) {
        return fromDictionary;
    } else {
        return fromDictionary;
    }
}

+ (NSMutableDictionary *)dictionaryForXMLData:(NSData *)data
                                   actionName:(NSString *)actionName
                        serviceDefinitionRule:(NSDictionary *)serviceDefinitionRule
                                        error:(NSError *__autoreleasing *)error {
    if (!data) {
        return [NSMutableDictionary new];
    }

    NSDictionary *actionRule = [[[serviceDefinitionRule objectForKey:@"operations"] objectForKey:actionName] objectForKey:@"output"];
    if (actionRule == (id)[NSNull null]) {
        actionRule = @{};
    }

    NSDictionary *definitionRules = [serviceDefinitionRule objectForKey:@"shapes"];
    if (definitionRules == (id)[NSNull null]) {
        definitionRules = @{};
    }
    if ([definitionRules count] == 0) {
        if (error) {
            *error = [NSError errorWithDomain:AWSXMLParserErrorDomain
                                         code:AWSXMLParserDefinitionFileIsEmpty
                                     userInfo:@{
                                                NSLocalizedDescriptionKey : @"JSON definition File is empty or can not be found"
                                                }];
        }
        return nil;
    }

    //[XMLDictionaryParser sharedInstance].attributesMode = XMLDictionaryAttributesModeDiscard;
    [XMLDictionaryParser sharedInstance].stripEmptyNodes = NO;
    //[XMLDictionaryParser sharedInstance].nodeNameMode = XMLDictionaryNodeNameModeNever;
    NSMutableDictionary *xmlDictionary = [[[XMLDictionaryParser sharedInstance] dictionaryWithData:data] mutableCopy]; //TODO: need error parameters for parsing
    NSString *rootNodeName = [xmlDictionary nodeName];
    [xmlDictionary removeObjectForKey:XMLDictionaryNodeNameKey];

    if (*error) {
        return nil;
    } else if ([rootNodeName isEqualToString:@"Error"]) {
        //This is an S3 error response, just return parsed xmlDictionary.
        return [@{rootNodeName:xmlDictionary} mutableCopy];
    } else if ([xmlDictionary objectForKey:@"Errors"]) {
        //This is EC2 error response.
        if ([[xmlDictionary objectForKey:@"Errors"] isKindOfClass:[NSDictionary class]]) {
            return [xmlDictionary objectForKey:@"Errors"];
        } else if  ([[xmlDictionary objectForKey:@"Errors"] isKindOfClass:[NSArray class]]) {
            return [[xmlDictionary objectForKey:@"Errors"] firstObject];
        }
        return nil;
    }else if ([xmlDictionary objectForKey:@"Error"]) {
        //This is mostly used error response, return xmlDictionary
        return [xmlDictionary mutableCopy];
    }else {
        AWSJSONDictionary *rules = [[AWSJSONDictionary alloc] initWithDictionary:actionRule JSONDefinitionRule:definitionRules];

        xmlDictionary = [self preprocessDictionary:xmlDictionary operationName:actionName actionRule:actionRule serviceDefinitionRule:serviceDefinitionRule];


        rules = rules[@"members"]?rules[@"members"]:@{};

        NSMutableDictionary *parsedData = [self parseStructure:xmlDictionary rules:rules error:error];

        return parsedData;
    };
}

+ (NSString *)findKeyNameByXMLName:(NSString *)xmlName rules:(NSDictionary *)rules {
    __block NSString *result;
    [rules enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {

        if ([key isEqualToString:xmlName]) {
            result = key;
            *stop = YES;
            return;
        }

        if ([obj isKindOfClass:[NSDictionary class]] && ([obj[@"type"] isEqualToString:@"list"] || [obj[@"type"] isEqualToString:@"map"])) {
            if ([obj[@"flattened"] boolValue]) {
                NSString *objXMLName = obj[@"member"][@"locationName"]?obj[@"member"][@"locationName"]:obj[@"locationName"];
                objXMLName = objXMLName?objXMLName:@"member";
                if ([xmlName isEqualToString:objXMLName]) {
                    result = key;
                    *stop = YES;
                    return;
                }
            } else {
                if ([xmlName isEqualToString:obj[@"locationName"]]) {
                    result = key;
                    *stop = YES;
                    return;
                }
            }

        }

        if ([obj isKindOfClass:[NSDictionary class]] && [obj objectForKey:@"locationName"]) {
            if ([xmlName isEqualToString:[obj objectForKey:@"locationName"]]) {
                result = key;
                *stop = YES;
                return;
            }

        }




    }];
    return result;
}

+ (BOOL)validateConstraint:(id)value rules:(NSDictionary *)rules error:(NSError *__autoreleasing *)error {

    //    //validate the existence of  required parameters.
    //    while ([rules[@"required"] boolValue]) {
    //        //value is a structure or map
    //        if ([value isKindOfClass:[NSDictionary class]] && [value count]>0) break;
    //        //value is a list
    //        if ([value isKindOfClass:[NSArray class]] && [value count]>0) break;
    //        //value is a string
    //        if ([value isKindOfClass:[NSString class]] && [value length] > 0) break;
    //        //value is NSNumber( e.g long, integer, double, float)
    //        if ([value isKindOfClass:[NSNumber class]]) break;
    //
    //        return [self failWithCode:AWSXMLParserMissingRequiredXMLElements
    //                      description:[NSString stringWithFormat:@"Missing required key."]
    //                            error:error];
    //    }
    //
    //    //validate value of string according to enum list
    //    if (rules[@"enum"] && [value isKindOfClass:[NSString class]]) {
    //        NSArray *enumArray = rules[@"enum"];
    //        if (![enumArray containsObject:value]) {
    //            return [self failWithCode:AWSXMLParserInvalidXMLValue
    //                          description:[NSString stringWithFormat:@"got unexpected string:%@ not in the enum list:%@", value, [enumArray description]]
    //                                error:error];
    //        }
    //    }
    return YES;
}


+ (NSMutableDictionary *)parseStructure:(NSDictionary *)structure rules:(AWSJSONDictionary *)rules error:(NSError *__autoreleasing *)error {
    NSMutableDictionary *data = [NSMutableDictionary dictionary];

    if (![self validateConstraint:structure rules:rules error:error]) {
        return data;
    }

    __block NSError *blockErr = nil;
    [structure enumerateKeysAndObjectsUsingBlock:^(NSString *xmlName, id value, BOOL *stop) {
        if ([xmlName isEqualToString:@"$"]) {
            //TODO: do something
        } else {
            NSString *keyName = [self findKeyNameByXMLName:xmlName rules:rules];
            if (!keyName) {
                if (![xmlName isEqualToString:@"_xmlns"] && ![xmlName isEqualToString:@"requestId"]) {
                    AZLogWarn(@"Can not find the xmlName:%@ in definition to serialize xml data: %@", xmlName, [value description]);
                }
                
                /*[self failWithCode:AWSXMLParserXMLNameNotFoundInDefinition
                 description:[NSString stringWithFormat:@"Can not find the xmlName:%@ in definition to validate xml data", xmlName]
                 error:&blockErr];
                 *stop = YES;
                 */
                return;
            }
            AWSJSONDictionary *rule = rules[keyName];
            if ([rules count] == 0) {
                [self failWithCode:AWSXMLParserUnexpectedXMLElement description:[NSString stringWithFormat:@"Unexpected XML Element found:%@",xmlName] error:&blockErr];
                *stop = YES;
            } else {
                NSString *dicName = rule[@"name"]?rule[@"name"]:keyName;
                data[dicName] = [self parseMember:value rules:rule error:&blockErr];
                if (blockErr) *stop = YES;
            }

        }
    }];

    if (error) *error = blockErr;

    return data;
}

+ (NSMutableDictionary *)parseMap:(NSArray *)map rules:(AWSJSONDictionary *)rules error:(NSError *__autoreleasing *)error {
    AWSJSONDictionary *keyRules = rules[@"key"]?rules[@"key"]:@{};
    AWSJSONDictionary *valueRules = rules[@"value"]?rules[@"value"]:@{};
    NSString *keyName = keyRules[@"name"]?keyRules[@"name"]:@"key";
    NSString *valueName = valueRules[@"name"]?valueRules[@"name"]:@"value";

    __block NSMutableDictionary *data = [NSMutableDictionary dictionary];

    if (![self validateConstraint:map rules:rules error:error]) return data;

    if ([map isKindOfClass:[NSDictionary class]]) {
        // if 'map' isn't an array but a dictionary, we create a new array containing our object
        map = @[map];
    }

    if (![map isKindOfClass:[NSArray class]]) {
        [self failWithCode:AWSXMLParserUnExpectedType description:[NSString stringWithFormat:@"xml(map type) should be an array but got:%@",NSStringFromClass([map class])] error:error];
        return [NSMutableDictionary new];
    } else {
        __block NSError *blockErr = nil;
        [map enumerateObjectsUsingBlock:^(id entry, NSUInteger idx, BOOL *stop) {
            data[entry[keyName]] = [self parseMember:entry[valueName] rules:valueRules error:&blockErr];
            if (blockErr) *stop = YES;
        }];
        if (error) *error = blockErr;
        return data;
    }
}

+ (NSArray *)parseList:(id)list rules:(AWSJSONDictionary *)rules error:(NSError *__autoreleasing *)error {

    AWSJSONDictionary *memberRules = rules[@"member"]?rules[@"member"]:@{};
    __block NSMutableArray *data = [NSMutableArray array];

    if (![self validateConstraint:list rules:rules error:error]) return data;
    __block NSError *blockErr = nil;

    //If not flattened, need to manually flatten it.
    if (![rules[@"flattened"] boolValue]) {
        NSString *memberName = memberRules[@"locationName"]?memberRules[@"locationName"]:@"member";
        if (![list isKindOfClass:[NSDictionary class]]) {
            [self failWithCode:AWSXMLParserUnExpectedType description:[NSString stringWithFormat:@"unflattened xml(list type) should be dictionary but got:%@",NSStringFromClass([list class])] error:error];
            return @[];
        }
        if ([list count] == 0) {
            return @[];
        }

        list = list[memberName];
        if (!list) {
            [self failWithCode:AWSXMLParserUnExpectedType description:[NSString stringWithFormat:@"Can not find the '%@' key-pair in un-falttened xml list type",memberName] error:error];
            return @[@"XMLPARSER:ERROR"];
        }
    }

    if ([list isKindOfClass:[NSDictionary class]]) {
        // if 'list' isn't an array but a dictionary, we create a new array containing our object.
        list = @[list];
    }

    if (![list isKindOfClass:[NSArray class]]) {
        [self failWithCode:AWSXMLParserUnExpectedType description:[NSString stringWithFormat:@"xml(list type) should be an array but got:%@",NSStringFromClass([list class])] error:error];
        return @[];
    }
    [list enumerateObjectsUsingBlock:^(id value, NSUInteger idx, BOOL *stop) {
        [data addObject:[self parseMember:value rules:memberRules error:&blockErr]];
        if (blockErr) *stop = YES;
    }];
    if (error) *error = blockErr;
    return data;
}

+ (id)parseMember:(id)values rules:(AWSJSONDictionary *)rules error:(NSError *__autoreleasing *)error {

    NSString *rulesType = rules[@"type"];

    //if value is nil, return error or empty array/dictionary.
    if (!values) {
        if ([rulesType isEqualToString:@"structure"]) return @{};
        if ([rulesType isEqualToString:@"list"]) return @[];
        if ([rulesType isEqualToString:@"map"]) return @{};
        return @"XMLPARSER:ERROR";
    }

    //if there is no 'type' key in rules, return nil with error
    if (!rulesType) {
        [self failWithCode:AWSXMLParserNoTypeDefinitionInRule description:[NSString stringWithFormat:@"can not find the 'type' keywords in definition file:%@ for value:%@",[rules description],[values description]] error:error];
        return @"XMLPARSER:ERROR";
    }

    //validate the value
    if (![self validateConstraint:values rules:rules error:error]) return @"XMLPARSER:ERROR";

    if ([rulesType isEqualToString:@"string"]) {
        return values;
    } else if ([rulesType isEqualToString:@"structure"]) {
        return [self parseStructure:values rules:rules[@"members"]?rules[@"members"]:@{} error:error];
    } else if ([rulesType isEqualToString:@"list"]) {
        return [self parseList:values rules:rules error:error];
    } else if ([rulesType isEqualToString:@"map"]) {
        return [self parseMap:values rules:rules error:error];
    } else if ([rulesType isEqualToString:@"integer"] || [rulesType isEqualToString:@"long"]) {
        if ([values isKindOfClass:[NSNumber class]]) {
            return values;
        } else if ([values isKindOfClass:[NSString class]]) {
            return [NSNumber numberWithInteger:[values integerValue]];
        }

    } else if ([rulesType isEqualToString:@"float"] || [rulesType isEqualToString:@"double"]) {
        if ([values isKindOfClass:[NSNumber class]]) {
            return values;
        } else if ([values isKindOfClass:[NSString class]]) {
            return [NSNumber numberWithDouble:[values doubleValue]];
        }
    } else if ([rulesType isEqualToString:@"boolean"]) {
        if ([values isKindOfClass:[NSNumber class]]) {
            return values;
        } else if ([values isKindOfClass:[NSString class]]) {
            return [NSNumber numberWithBool:[values boolValue]];
        }
    } else if ([rulesType isEqualToString:@"timestamp"]) {
        //a value with NSNumber type should be a good timestamp.
        return values;
    } else if ([rulesType isEqualToString:@"blob"]) {
        if ([values isKindOfClass:[NSString class]]) {
            return values;
        }
    }
    
    [self failWithCode:AWSXMLParserUnHandledType description:[NSString stringWithFormat:@"unhandled type for value:%@",[values description]] error:error];
    return @"XMLPARSER:ERROR";
}

@end
