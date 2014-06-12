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

#import "AZNetworking.h"
#import "AWSValidation.h"
#import "AWSSerialization.h"
#import "AZCategory.h"
#import "AZLogging.h"

@interface AWSJSONRequestSerializer()

@property (nonatomic, strong) NSDictionary *serviceDefinitionJSON;

@end

@implementation AWSJSONRequestSerializer

- (BOOL)serializeRequest:(NSMutableURLRequest *)request
                 headers:(NSDictionary *)headers
              parameters:(NSDictionary *)parameters
                   error:(NSError *__autoreleasing *)error {
    
    //If parameters contains clientContext key, move it to http header. This is a sepcial case
    if ([parameters objectForKey:@"clientContext"]) {
        [request setValue:[parameters objectForKey:@"clientContext"] forHTTPHeaderField:@"x-amz-Client-Context"];
        NSMutableDictionary *mutableParameters = [parameters mutableCopy];
        [mutableParameters removeObjectForKey:@"clientContext"];
        parameters = mutableParameters;
    }
    
    
    if (parameters) {
        if ([request.HTTPMethod isEqualToString:@"GET"]) {
            request.URL = [request.URL az_URLByAppendingQuery:parameters];
        } else {
            request.HTTPBody = [NSJSONSerialization dataWithJSONObject:parameters
                                                               options:0
                                                                 error:error];
        }
    }
    AZLogVerbose(@"Request body: [%@]", [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding]);

    if (!*error) {
        for (NSString *key in headers) {
            if ([key isEqualToString:@"Content-Type"]
                && ![request.HTTPMethod isEqualToString:@"PUT"]
                && ![request.HTTPMethod isEqualToString:@"POST"]) {
                continue;
            }
            [request setValue:[headers objectForKey:key] forHTTPHeaderField:key];
        }

        return YES;
    }

    return NO;
}

- (BOOL)validateRequest:(NSURLRequest *)request
                  error:(NSError *__autoreleasing *)error {
    return YES;

    //    NSDictionary *header = request.allHTTPHeaderFields;
    //    NSArray *xAMZTargetArray = [[header objectForKey:@"X-Amz-Target"] componentsSeparatedByString:@"."];
    //    if ([xAMZTargetArray count] != 2) {
    //        if (error) {
    //            *error = [NSError errorWithDomain:AWSValidationErrorDomain code:AWSValidationHeaderTargetInvalid userInfo:[NSDictionary dictionaryWithObject:@"the key/value pair of 'X-Amz-Target' in the HTTP header is invalid" forKey:NSLocalizedDescriptionKey]];
    //        }
    //        return NO;
    //    }
    //    NSString *amzTargetPrefix = [xAMZTargetArray firstObject];
    //    NSString *amzAPIName = [xAMZTargetArray lastObject];
    //    //AZLogDebug(@"api request name is:%@",amzAPIName);
    //    if (amzAPIName.length == 0) {
    //        if (error){
    //            *error = [NSError errorWithDomain:AWSValidationErrorDomain code:AWSValidationHeaderAPIActionIsUndefined userInfo:[NSDictionary dictionaryWithObject:@"API Action is undefined." forKey:NSLocalizedDescriptionKey]];
    //        }
    //        return NO;
    //    }
    //    NSDictionary *paramsDic = [NSJSONSerialization JSONObjectWithData:request.HTTPBody options:0 error:error];
    //    //AZLogDebug(@"(Validate) paramsDic is: %@",[paramsDic description]);
    //    if (paramsDic == nil) {
    //        return NO;
    //    }
    //    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:amzTargetPrefix ofType:@"json"];
    //    if (!filePath) {
    //        if (error) {
    //            *error = [NSError errorWithDomain:AWSValidationErrorDomain code:AWSValidationHeaderDefinitionFileIsNotFound userInfo:[NSDictionary dictionaryWithObject:@"JSON definition File for validation can not be found." forKey:NSLocalizedDescriptionKey]];
    //        }
    //        return NO;
    //    }
    //    NSDictionary *rules = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:kNilOptions error:nil];
    //
    //    //AZLogDebug(@"rule has content size:%lu",(unsigned long)[rules count]);
    //    if (rules.count == 0) {
    //        if (error) {
    //            *error = [NSError errorWithDomain:AWSValidationErrorDomain code:AWSValidationHeaderDefinitionFileIsEmpty userInfo:[NSDictionary dictionaryWithObject:@"JSON definition File for validation has no rule in it." forKey:NSLocalizedDescriptionKey]];
    //        }
    //        return NO;
    //    }
    //    NSDictionary *rule = [[[rules objectForKey:@"operations"] objectForKey:amzAPIName] objectForKey:@"input"];
    //    //AZLogDebug(@"rule is: %@",rule);
    //    if (rules.count == 0) {
    //        if (error) {
    //            *error = [NSError errorWithDomain:AWSValidationErrorDomain code:AWSValidationHeaderAPIActionIsInvalid userInfo:[NSDictionary dictionaryWithObject:@"API Action is invalid." forKey:NSLocalizedDescriptionKey]];
    //        }
    //        return NO;
    //    }
    //
    //    return [AWSJSONValidator validateParams:paramsDic byRule:rule error:error];
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
    serializer.serviceDefinitionJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                       options:kNilOptions
                                                                         error:&error];
    if (error) {
        AZLogError(@"Error: [%@]", error);
    }

    serializer.actionName = actionName;

    return serializer;
}

/* need to overwrite this method to do serialization for self.parameter */
- (BOOL)serializeRequest:(NSMutableURLRequest *)request
                 headers:(NSDictionary *)headers
              parameters:(NSDictionary *)parameters
                   error:(NSError *__autoreleasing *)error {
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

    [self constructURIandHeadersAndBody:request
                                  rules:inputRules
                             parameters:parameters
                              uriSchema:ruleURIStr
                                  error:error];

    if (*error) {
        return NO;
    }

    //construct HTTPBody only if HTTPBodyStream is nil
    if (!request.HTTPBodyStream) {
        request.HTTPBody = [AWSXMLBuilder xmlDataForDictionary:parameters
                                                    actionName:self.actionName
                                         serviceDefinitionRule:self.serviceDefinitionJSON
                                                         error:error];
    }
    AZLogVerbose(@"Request body: [%@]", [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding]);

    //contruct addtional headers
    if (!*error) {
        if (headers) {
            //generate HTTP header here
            for (NSString *key in headers.allKeys) {
                [request setValue:[headers objectForKey:key] forHTTPHeaderField:key];
            }
        }
    }

    return *error ? YES : NO;
}

- (BOOL)validateRequest:(NSURLRequest *)request
                  error:(NSError *__autoreleasing *)error {
    return YES;
}

- (BOOL)constructURIandHeadersAndBody:(NSMutableURLRequest *)request
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
        NSString *xmlElementName = memberRules[@"xmlName"]?memberRules[@"xmlName"]:memberName;
        id value = params[xmlElementName];
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

            //If it is uri type, construct uri
            if ([memberRules[@"location"] isEqualToString:@"uri"]) {
                NSString *keyToFind = [NSString stringWithFormat:@"{%@}", xmlElementName];
                rawURI = [rawURI stringByReplacingOccurrencesOfString:keyToFind
                                                           withString:[valueStr az_stringWithURLEncoding]];
            }

            //if it is queryString type, construct queryString
            if ([memberRules[@"location"] isEqualToString:@"querystring"]) {
                [queryStringDictionary setObject:valueStr forKey:memberRules[@"locationName"]];
            }

            //If it is "Body" Type, contructBody
            if ([xmlElementName isEqualToString:@"Body"]) {
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

    if ([queryStringDictionary count]) {
        NSArray *myKeys = [queryStringDictionary allKeys];
        NSArray *sortedKeys = [myKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
        NSString *queryString = nil;
        for (NSString *key in sortedKeys) {
            if (!queryString) {
                queryString = [NSString stringWithFormat:@"?%@=%@",key,queryStringDictionary[key]];
            } else {
                NSString *appendString = [NSString stringWithFormat:@"&%@=%@",key,queryStringDictionary[key]];
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
            *error = [NSError errorWithDomain:AWSValidationErrorDomain code:AWSValidationURIIsInvalid userInfo:[NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"the constructed request URI is invalid:%@",rawURI] forKey:NSLocalizedDescriptionKey]];
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
        request.URL = [NSURL URLWithString: [NSString stringWithFormat:@"%@%@", request.URL,rawURI]];

        return YES;
    }
}

@end


@interface AWSQueryStringRequestSerializer()

@end

@implementation AWSQueryStringRequestSerializer

- (BOOL)serializeRequest:(NSMutableURLRequest *)request
                 headers:(NSDictionary *)headers
              parameters:(NSDictionary *)parameters
                   error:(NSError *__autoreleasing *)error {
    NSMutableString *queryString = [NSMutableString new];

    parameters = [parameters mutableCopy];
    [self.additionalParameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [parameters setValue:obj forKey:key];
    }];

    [parameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([queryString length] > 0) {
            [queryString appendString:@"&"];
        }

        if ([obj isKindOfClass:[NSString class]]) {
            [queryString appendString:[key az_stringWithURLEncoding]];
            [queryString appendString:@"="];
            [queryString appendString:[obj az_stringWithURLEncoding]];
        } else if ([obj isKindOfClass:[NSNumber class]]) {
            [queryString appendString:[key az_stringWithURLEncoding]];
            [queryString appendString:@"="];
            [queryString appendString:[[obj stringValue] az_stringWithURLEncoding]];
        } else if ([obj isKindOfClass:[NSDate class]]) {
            [queryString appendString:[key az_stringWithURLEncoding]];
            [queryString appendString:@"="];
            [queryString appendString:[[obj az_stringValue:self.dateFormat] az_stringWithURLEncoding]];
        } else {
            // TODO: This shouldn't happen. We should log this.
            [queryString appendString:[key az_stringWithURLEncoding]];
            [queryString appendString:@"="];
            [queryString appendString:[obj description]];
        }
    }];

    if ([queryString length] > 0) {
        request.HTTPBody = [queryString dataUsingEncoding:NSUTF8StringEncoding];
    }
    AZLogVerbose(@"Request body: [%@]", [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding]);

    if (!*error) {
        for (NSString *key in headers.allKeys) {
            [request setValue:[headers objectForKey:key] forHTTPHeaderField:key];
        }
        
        return YES;
    }
    
    return NO;
}

- (BOOL)validateRequest:(NSURLRequest *)request
                  error:(NSError *__autoreleasing *)error {
    return YES;
}

@end
