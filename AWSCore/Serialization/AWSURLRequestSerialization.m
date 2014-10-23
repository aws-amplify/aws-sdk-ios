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

#import "AWSURLRequestSerialization.h"

#import "AWSNetworking.h"
#import "AWSValidation.h"
#import "AWSSerialization.h"
#import "AWSCategory.h"
#import "AWSLogging.h"
#import "GZIP.h"
#import "Bolts.h"

@interface AWSJSONRequestSerializer()

@property (nonatomic, strong) NSDictionary *serviceDefinitionJSON;
@property (nonatomic, strong) NSString *actionName;

@end

@implementation AWSJSONRequestSerializer

+ (instancetype)serializerWithResource:(NSString *)resource
                            actionName:(NSString *)actionName {
    AWSJSONRequestSerializer *serializer = [self new];
    NSError *error = nil;
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:resource ofType:@"json"];
    if (filePath == nil) {
        AWSLogError(@"can not find %@.json file in the project",resource);
    } else {
        serializer.serviceDefinitionJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                           options:kNilOptions
                                                                             error:&error];
    }
    if (error) {
        AWSLogError(@"Error: [%@]", error);
    }

    serializer.actionName = actionName;

    return serializer;
}


- (BFTask *)serializeRequest:(NSMutableURLRequest *)request
                     headers:(NSDictionary *)headers
                  parameters:(NSDictionary *)parameters {
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

    //If parameters contains clientContext key, move it to http header. This is a sepcial case
    if ([parameters objectForKey:@"clientContext"]) {
        [request setValue:[[[parameters objectForKey:@"clientContext"] dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:kNilOptions]
       forHTTPHeaderField:@"x-amz-Client-Context"];
        [request setValue:@"base64"
       forHTTPHeaderField:@"x-amz-Client-Context-Encoding"];
        NSMutableDictionary *mutableParameters = [parameters mutableCopy];
        [mutableParameters removeObjectForKey:@"clientContext"];
        parameters = mutableParameters;
    }

    NSDictionary *actionRules = [[self.serviceDefinitionJSON objectForKey:@"operations"] objectForKey:self.actionName];
    NSString *inputName = [[actionRules objectForKey:@"input"] objectForKey:@"shape"];
    NSDictionary *inputRules = [[[self.serviceDefinitionJSON objectForKey:@"shapes"] objectForKey:inputName] objectForKey: @"members" ];


    NSMutableDictionary *mutableParameters = [parameters mutableCopy];
    for (NSString* memberName in inputRules) {
        NSDictionary* membersRules = [inputRules objectForKey:memberName];
        if([parameters objectForKey:memberName] && [[membersRules objectForKey: @"location"] isEqualToString: @"header"]){

            [request setValue: [parameters objectForKey:memberName] forHTTPHeaderField: [membersRules objectForKey:@"locationName"]];
            [mutableParameters removeObjectForKey:memberName];
            parameters = mutableParameters;
        }
    }

    NSError *error = nil;
    if (parameters) {
        if ([request.HTTPMethod isEqualToString:@"GET"]) {
            request.URL = [request.URL aws_URLByAppendingQuery:parameters];
        } else {
            NSData *bodyData = [AWSJSONBuilder jsonDataForDictionary:parameters actionName:self.actionName serviceDefinitionRule:self.serviceDefinitionJSON error:&error];

            if (!error) {

                if (headers[@"Content-Encoding"] && [headers[@"Content-Encoding"] rangeOfString:@"gzip"].location != NSNotFound) {
                    //gzip the body
                    request.HTTPBody = [bodyData gzippedData];
                } else {
                    request.HTTPBody = bodyData;
                }

            }


        }
    }
    AWSLogVerbose(@"Request body: [%@]", [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding]);

    if (!error) {
        for (NSString *key in headers) {
            [request setValue:[headers objectForKey:key] forHTTPHeaderField:key];
        }

        return [BFTask taskWithResult:nil];
    }

    return [BFTask taskWithError:error];
}

- (BFTask *)validateRequest:(NSURLRequest *)request {
    return [BFTask taskWithResult:nil];

}

@end

@interface AWSXMLRequestSerializer()

@property (nonatomic, strong) NSDictionary *serviceDefinitionJSON;
@property (nonatomic, strong) NSString *actionName;

@end

@implementation AWSXMLRequestSerializer

+ (instancetype)serializerWithResource:(NSString *)resource actionName:(NSString *)actionName {

    AWSXMLRequestSerializer *serializer = [self new];
    NSError *error = nil;
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:resource ofType:@"json"];
    if (filePath == nil) {
        AWSLogError(@"can not find %@.json file in the project",resource);
    } else {
        serializer.serviceDefinitionJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                           options:kNilOptions
                                                                             error:&error];
    }
    if (error) {
        AWSLogError(@"Error: [%@]", error);
    }

    serializer.actionName = actionName;

    return serializer;
}

/* need to overwrite this method to do serialization for self.parameter */
- (BFTask *)serializeRequest:(NSMutableURLRequest *)request
                     headers:(NSDictionary *)headers
                  parameters:(NSDictionary *)parameters {
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

    NSDictionary *anActionRules = [[self.serviceDefinitionJSON objectForKey:@"operations"] objectForKey:self.actionName];

    NSDictionary *actionHTTPRule = [anActionRules objectForKey:@"http"];
    //Construct HTTPMethod
    NSString *ruleHTTPMethod = [actionHTTPRule objectForKey:@"method"];
    if ([ruleHTTPMethod length] > 0) {
        request.HTTPMethod = ruleHTTPMethod;
    }

    //Construct URI and Headers and HTTPBodyStream
    NSString *ruleURIStr = [actionHTTPRule objectForKey:@"requestUri"];
    NSDictionary *shapeRules = [self.serviceDefinitionJSON objectForKey:@"shapes"];
    AWSJSONDictionary *inputRules = [[AWSJSONDictionary alloc] initWithDictionary:[anActionRules objectForKey:@"input"] JSONDefinitionRule:shapeRules];

    NSError *error = nil;
    [AWSXMLRequestSerializer constructURIandHeadersAndBody:request
                                                     rules:inputRules
                                                parameters:parameters
                                                 uriSchema:ruleURIStr
                                                     error:&error];

    if (!error) {
        //construct HTTPBody only if HTTPBodyStream is nil
        if (!request.HTTPBodyStream) {
            request.HTTPBody = [AWSXMLBuilder xmlDataForDictionary:parameters
                                                        actionName:self.actionName
                                             serviceDefinitionRule:self.serviceDefinitionJSON
                                                             error:&error];
        }
        AWSLogVerbose(@"Request body: [%@]", [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding]);

        //contruct addtional headers
        if (!error) {
            if (headers) {
                //generate HTTP header here
                for (NSString *key in headers.allKeys) {
                    [request setValue:[headers objectForKey:key] forHTTPHeaderField:key];
                }
            }
        }
    }

    if (error) {
        return [BFTask taskWithError:error];
    } else {
        return [BFTask taskWithResult:nil];
    }
}

- (BFTask *)validateRequest:(NSURLRequest *)request {
    return [BFTask taskWithResult:nil];
}

+ (BOOL)constructURIandHeadersAndBody:(NSMutableURLRequest *)request
                                rules:(AWSJSONDictionary *)rules parameters:(NSDictionary *)params
                            uriSchema:(NSString *)uriSchema
                                error:(NSError *__autoreleasing *)error {
    //If no rule just return
    if (rules == (id)[NSNull null] ||  [rules count] == 0) {
        return YES;
    }

    NSMutableDictionary *queryStringDictionary = [NSMutableDictionary new];

    rules = rules[@"members"] ? rules[@"members"] : @{};

    __block NSString *rawURI = uriSchema;
    [rules enumerateKeysAndObjectsUsingBlock:^(NSString *memberName, id memberRules, BOOL *stop) {

        NSString *xmlElementName = memberRules[@"locationName"]?memberRules[@"locationName"]:memberName;
        id value = nil;
        if (memberRules[@"locationName"]) {
            value = params[memberRules[@"locationName"]];
        }
        if (!value) {
            value = params[memberName];
        }

        if (value && value != [NSNull null] && [memberRules isKindOfClass:[NSDictionary class]]) {

            NSString *rulesType = memberRules[@"type"];
            NSString *valueStr = nil;

            if ([rulesType isEqualToString:@"integer"] || [rulesType isEqualToString:@"long"] || [rulesType isEqualToString:@"float"] || [rulesType isEqualToString:@"double"]) {
                valueStr = [value stringValue];

            } else if ([rulesType isEqualToString:@"boolean"]) {
                valueStr = [value boolValue]?@"true":@"false";
            } else if ([rulesType isEqualToString:@"string"]) {
                valueStr = value;
            } else if ([rulesType isEqualToString:@"timestamp"]) {
                valueStr = value; //timestamp will be treated as string here.
            } else {
                valueStr = @"";
            }

            //If it is headers type, add to headers
            if ([memberRules[@"location"] isEqualToString:@"header"]) {

                [request addValue:valueStr forHTTPHeaderField:memberRules[@"locationName"]];
            }

            //if it is a map type with headers tag, add to headers
            if ([value isKindOfClass:[NSDictionary class]] && [rulesType isEqualToString:@"map"] && [memberRules[@"location"] isEqualToString:@"headers"] ) {
                for (NSString *key in value) {
                    NSString *keyName = [memberRules[@"locationName"] stringByAppendingString:key];
                    [request addValue:value[key] forHTTPHeaderField:keyName];
                }
            }

            //If it is uri type, construct uri
            if ([memberRules[@"location"] isEqualToString:@"uri"]) {
                NSString *keyToFind = [NSString stringWithFormat:@"{%@}", xmlElementName];
                NSString *greedyKeyToFind = [NSString stringWithFormat:@"{%@+}", xmlElementName];

                if ([rawURI rangeOfString:keyToFind].location != NSNotFound) {
                    rawURI = [rawURI stringByReplacingOccurrencesOfString:keyToFind
                                                               withString:[valueStr aws_stringWithURLEncoding]];

                } else if ([rawURI rangeOfString:greedyKeyToFind].location != NSNotFound) {
                    rawURI = [rawURI stringByReplacingOccurrencesOfString:greedyKeyToFind
                                                               withString:[valueStr aws_stringWithURLEncodingPath]];
                }


            }

            //if it is queryString type, construct queryString
            if ([memberRules[@"location"] isEqualToString:@"querystring"]) {
                [queryStringDictionary setObject:valueStr forKey:memberRules[@"locationName"]];
            }

            //If it is "Body" Type and streaming Type, contructBody
            if ([xmlElementName isEqualToString:@"Body"] && [memberRules[@"streaming"] boolValue]) {
                if ([value isKindOfClass:[NSURL class]]) {
                    if ([value checkResourceIsReachableAndReturnError:error]) {
                        request.HTTPBodyStream = [NSInputStream inputStreamWithURL:value];
                    }

                } else {
                    request.HTTPBodyStream = [NSInputStream inputStreamWithData:value];

                }

            }
        }
    }];

    if (*error) {
        return NO;
    }

    BOOL uriSchemaContainsQuestionMark = NO;
    NSRange hasQuestionMark = [uriSchema rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"?"]];
    if (hasQuestionMark.location != NSNotFound) {
        uriSchemaContainsQuestionMark = YES;
    }

    if ([queryStringDictionary count]) {
        NSArray *myKeys = [queryStringDictionary allKeys];
        NSArray *sortedKeys = [myKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
        NSString *queryString = @"";
        for (NSString *key in sortedKeys) {
            if ([queryString length] == 0 && uriSchemaContainsQuestionMark == NO) {
                queryString = [NSString stringWithFormat:@"?%@=%@",[key aws_stringWithURLEncoding],[queryStringDictionary[key] aws_stringWithURLEncoding]];
            } else {
                NSString *appendString = [NSString stringWithFormat:@"&%@=%@",[key aws_stringWithURLEncoding],[queryStringDictionary[key] aws_stringWithURLEncoding]];
                queryString = [queryString stringByAppendingString:appendString];
            }
        }
        rawURI = [rawURI stringByAppendingString:queryString];
    }

    //removed unused query key
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\{.*?\\}" options:NSRegularExpressionCaseInsensitive error:nil];
    rawURI = [regex stringByReplacingMatchesInString:rawURI options:0 range:NSMakeRange(0, [rawURI length]) withTemplate:@""];

    //validate URL
    NSRange r = [rawURI rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"{}"]];
    if (r.location != NSNotFound) {
        if (error) {
            *error = [NSError errorWithDomain:AWSValidationErrorDomain code:AWSValidationURIIsInvalid userInfo:[NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"the constructed request queryString is invalid:%@",rawURI] forKey:NSLocalizedDescriptionKey]];
        }
        request.URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/", request.URL]];

        return NO;
    } else {
        // fix query string
        // @"?location" -> @"?location="

        NSRange hasQuestionMark = [rawURI rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"?"]];
        NSRange hasEqualMark = [rawURI rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"="]];
        if ( (hasQuestionMark.location != NSNotFound) && (hasEqualMark.location == NSNotFound) ) {
            rawURI = [rawURI stringByAppendingString:@"="];
        }

        NSString *finalURL = [NSString stringWithFormat:@"%@%@", request.URL,rawURI];
        request.URL = [NSURL URLWithString:finalURL];
        if (!request.URL) {
            if (error) {
                *error = [NSError errorWithDomain:AWSValidationErrorDomain code:AWSValidationURIIsInvalid userInfo:[NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"unable the assigned URL to request, URL may be invalid:%@",finalURL] forKey:NSLocalizedDescriptionKey]];
            }
            return NO;
        }

        return YES;
    }
}

@end


@interface AWSQueryStringRequestSerializer()

@property (nonatomic, strong) NSDictionary *serviceDefinitionJSON;
@property (nonatomic, strong) NSString *actionName;

@end

@implementation AWSQueryStringRequestSerializer

+ (instancetype)serializerWithResource:(NSString *)resource
                            actionName:(NSString *)actionName {

    AWSQueryStringRequestSerializer *serializer = [self new];
    NSError *error = nil;
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:resource ofType:@"json"];
    if (filePath == nil) {
        AWSLogError(@"can not find %@.json file in the project",resource);
    } else {
        serializer.serviceDefinitionJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                           options:kNilOptions
                                                                             error:&error];
    }
    if (error) {
        AWSLogError(@"Error: [%@]", error);
    }

    serializer.actionName = actionName;

    return serializer;

}
- (void)processParameters:(NSDictionary *)parameters queryString:(NSMutableString *)queryString {
    for (NSString *key in parameters) {
        id obj = parameters[key];

        if ([obj isKindOfClass:[NSDictionary class]]) {
            [self processParameters:obj queryString:queryString];
        } else {

            if ([queryString length] > 0) {
                [queryString appendString:@"&"];
            }

            if ([obj isKindOfClass:[NSString class]]) {
                [queryString appendString:[key aws_stringWithURLEncoding]];
                [queryString appendString:@"="];
                NSString *urlEncodedString = [obj aws_stringWithURLEncoding];
                [queryString appendString:urlEncodedString];
            } else if ([obj isKindOfClass:[NSNumber class]]) {
                [queryString appendString:[key aws_stringWithURLEncoding]];
                [queryString appendString:@"="];
                [queryString appendString:[[obj stringValue] aws_stringWithURLEncoding]];
            } else if ([obj isKindOfClass:[NSDate class]]) {
                [queryString appendString:[key aws_stringWithURLEncoding]];
                [queryString appendString:@"="];
                [queryString appendString:[[obj aws_stringValue:self.dateFormat] aws_stringWithURLEncoding]];
            } else {
                AWSLogError(@"key[%@] is invalid.", key);
                [queryString appendString:[key aws_stringWithURLEncoding]];
                [queryString appendString:@"="];
                [queryString appendString:[[obj description]aws_stringWithURLEncoding]];
            }
        }
    }

}

- (BFTask *)serializeRequest:(NSMutableURLRequest *)request
                     headers:(NSDictionary *)headers
                  parameters:(NSDictionary *)parameters {
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

    parameters = [parameters mutableCopy];
    [self.additionalParameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [parameters setValue:obj forKey:key];
    }];

    //Need to add version and actionName
    NSError *error = nil;
    NSDictionary *formattedParams = [AWSQueryParamBuilder buildFormattedParams:parameters
                                                                    actionName:self.actionName
                                                         serviceDefinitionRule:self.serviceDefinitionJSON error:&error];
    if (error) {
        return [BFTask taskWithError:error];
    }

    NSMutableString *queryString = [NSMutableString new];
    [self processParameters:formattedParams queryString:queryString];

    if ([queryString length] > 0) {
        request.HTTPBody = [queryString dataUsingEncoding:NSUTF8StringEncoding];
    }
    AWSLogVerbose(@"Request body: [%@]", [[NSString alloc] initWithData:request.HTTPBody
                                                               encoding:NSUTF8StringEncoding]);
    //contruct addtional headers
    if (headers) {
        //generate HTTP header here
        for (NSString *key in headers.allKeys) {
            [request setValue:[headers objectForKey:key] forHTTPHeaderField:key];
        }
    }

    if (!request.allHTTPHeaderFields[@"Content-Type"]) {
        [request addValue:@"application/x-www-form-urlencoded; charset=utf-8"
       forHTTPHeaderField:@"Content-Type"];
    }

    return [BFTask taskWithResult:nil];
}

- (BFTask *)validateRequest:(NSURLRequest *)request {
    return [BFTask taskWithResult:nil];
}

@end

@implementation AWSEC2RequestSerializer

//overwrite serializeRequest method for EC2
- (BFTask *)serializeRequest:(NSMutableURLRequest *)request
                     headers:(NSDictionary *)headers
                  parameters:(NSDictionary *)parameters {
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

    parameters = [parameters mutableCopy];
    [self.additionalParameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [parameters setValue:obj forKey:key];
    }];

    //Need to add version and actionName
    NSError *error = nil;
    NSDictionary *formattedParams = [AWSEC2ParamBuilder buildFormattedParams:parameters
                                                                  actionName:self.actionName
                                                       serviceDefinitionRule:self.serviceDefinitionJSON error:&error];
    if (error) {
        return [BFTask taskWithError:error];
    }

    NSMutableString *queryString = [NSMutableString new];
    [self processParameters:formattedParams queryString:queryString];

    if ([queryString length] > 0) {
        request.HTTPBody = [queryString dataUsingEncoding:NSUTF8StringEncoding];
    }
    AWSLogVerbose(@"Request body: [%@]", [[NSString alloc] initWithData:request.HTTPBody
                                                               encoding:NSUTF8StringEncoding]);
    //contruct addtional headers
    if (headers) {
        //generate HTTP header here
        for (NSString *key in headers.allKeys) {
            [request setValue:[headers objectForKey:key] forHTTPHeaderField:key];
        }
    }
    
    if (!request.allHTTPHeaderFields[@"Content-Type"]) {
        [request addValue:@"application/x-www-form-urlencoded; charset=utf-8"
       forHTTPHeaderField:@"Content-Type"];
    }
    
    return [BFTask taskWithResult:nil];
}


@end