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
#import "GZIP.h"

@interface AWSJSONRequestSerializer()

@property (nonatomic, strong) NSDictionary *serviceDefinitionJSON;

@end

@implementation AWSJSONRequestSerializer

- (BFTask *)serializeRequest:(NSMutableURLRequest *)request
                     headers:(NSDictionary *)headers
                  parameters:(NSDictionary *)parameters {
    NSError *error = nil;

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
            NSData *bodyData = [NSJSONSerialization dataWithJSONObject:parameters
                                                               options:0
                                                                 error:&error];

            if (headers[@"Content-Encoding"] && [headers[@"Content-Encoding"] rangeOfString:@"gzip"].location != NSNotFound) {
                //gzip the body
                request.HTTPBody = [bodyData gzippedData];
            } else {
                request.HTTPBody = bodyData;
            }


        }
    }
    AZLogVerbose(@"Request body: [%@]", [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding]);

    if (!error) {
        for (NSString *key in headers) {
            if ([key isEqualToString:@"Content-Type"]
                && ![request.HTTPMethod isEqualToString:@"PUT"]
                && ![request.HTTPMethod isEqualToString:@"POST"]) {
                continue;
            }
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
        AZLogError(@"can not find %@.json file in the project",actionName);
    } else {
        serializer.serviceDefinitionJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                           options:kNilOptions
                                                                             error:&error];
    }
    if (error) {
        AZLogError(@"Error: [%@]", error);
    }

    serializer.actionName = actionName;

    return serializer;
}

/* need to overwrite this method to do serialization for self.parameter */
- (BFTask *)serializeRequest:(NSMutableURLRequest *)request
                     headers:(NSDictionary *)headers
                  parameters:(NSDictionary *)parameters {
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
    [self constructURIandHeadersAndBody:request
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
        AZLogVerbose(@"Request body: [%@]", [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding]);

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
                queryString = [NSString stringWithFormat:@"?%@=%@",[key az_stringWithURLEncoding],[queryStringDictionary[key] az_stringWithURLEncoding]];
            } else {
                NSString *appendString = [NSString stringWithFormat:@"&%@=%@",[key az_stringWithURLEncoding],[queryStringDictionary[key] az_stringWithURLEncoding]];
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
        AZLogError(@"can not find %@.json file in the project",actionName);
    } else {
        serializer.serviceDefinitionJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                           options:kNilOptions
                                                                             error:&error];
    }
    if (error) {
        AZLogError(@"Error: [%@]", error);
    }
    
    serializer.actionName = actionName;
    
    return serializer;
    
}
- (void)processParameters:(NSDictionary *)parameters QueryString:(NSMutableString *)queryString {
    for (NSString *key in parameters) {
        id obj = parameters[key];
        
        if ([obj isKindOfClass:[NSDictionary class]]) {
            [self processParameters:obj QueryString:queryString];
        } else {
            
            if ([queryString length] > 0) {
                [queryString appendString:@"&"];
            }
            
            if ([obj isKindOfClass:[NSString class]]) {
                [queryString appendString:[key az_stringWithURLEncoding]];
                [queryString appendString:@"="];
                NSString *urlEncodedString = [obj az_stringWithURLEncoding];
                [queryString appendString:urlEncodedString];
            } else if ([obj isKindOfClass:[NSNumber class]]) {
                [queryString appendString:[key az_stringWithURLEncoding]];
                [queryString appendString:@"="];
                [queryString appendString:[[obj stringValue] az_stringWithURLEncoding]];
            } else if ([obj isKindOfClass:[NSDate class]]) {
                [queryString appendString:[key az_stringWithURLEncoding]];
                [queryString appendString:@"="];
                [queryString appendString:[[obj az_stringValue:self.dateFormat] az_stringWithURLEncoding]];
            } else {
                AZLogError(@"key[%@] is invalid.", key);
                [queryString appendString:[key az_stringWithURLEncoding]];
                [queryString appendString:@"="];
                [queryString appendString:[[obj description]az_stringWithURLEncoding]];
            }
        }
    }

}

- (BFTask *)serializeRequest:(NSMutableURLRequest *)request
                     headers:(NSDictionary *)headers
                  parameters:(NSDictionary *)parameters {

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
    [self processParameters:formattedParams QueryString:queryString];

    if ([queryString length] > 0) {
        request.HTTPBody = [queryString dataUsingEncoding:NSUTF8StringEncoding];
    }
    AZLogVerbose(@"Request body: [%@]", [[NSString alloc] initWithData:request.HTTPBody
                                                              encoding:NSUTF8StringEncoding]);
    //contruct addtional headers
    if (headers) {
        //generate HTTP header here
        for (NSString *key in headers.allKeys) {
            [request setValue:[headers objectForKey:key] forHTTPHeaderField:key];
        }
    }
    
    return [BFTask taskWithResult:nil];


}

- (BFTask *)validateRequest:(NSURLRequest *)request {
    return [BFTask taskWithResult:nil];
}

@end
