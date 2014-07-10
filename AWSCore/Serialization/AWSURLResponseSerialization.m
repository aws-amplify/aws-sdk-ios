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

#import "AWSURLResponseSerialization.h"

#import "AZLogging.h"

#import "AWSService.h"
#import "AWSValidation.h"
#import "AWSSerialization.h"
#import "TMCache.h"

NSString *const AWSGeneralErrorDomain = @"com.amazonaws.AWSGeneralErrorDomain";

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;


@implementation AWSJSONResponseSerializer

+ (void)initialize {
    errorCodeDictionary = @{
                            @"RequestTimeTooSkewed" : @(AWSGeneralErrorRequestTimeTooSkewed),
                            @"InvalidSignatureException" : @(AWSGeneralErrorInvalidSignatureException),
                            @"RequestExpired" : @(AWSGeneralErrorRequestExpired),
                            @"SignatureDoesNotMatch" : @(AWSGeneralErrorSignatureDoesNotMatch),
                            @"AuthFailure" : @(AWSGeneralErrorAuthFailure),
                            };
}

- (instancetype)initWithOutputClass:(Class)outputClass {
    if (self = [super init]) {
        _outputClass = outputClass;
    }

    return self;
}

- (id)responseObjectForResponse:(NSHTTPURLResponse *)response
                originalRequest:(NSURLRequest *)originalRequest
                 currentRequest:(NSURLRequest *)currentRequest
                           data:(id)data
                          error:(NSError *__autoreleasing *)error {
    if ([data isKindOfClass:[NSData class]]) {
        AZLogVerbose(@"Response body: [%@]", [[NSString alloc] initWithData:data
                                                                   encoding:NSUTF8StringEncoding]);
    }
    
    NSString *responseContentTypeStr = [[response allHeaderFields] objectForKey:@"Content-Type"];
    if (responseContentTypeStr) {
        if ([responseContentTypeStr rangeOfString:@"text/html"].location != NSNotFound) {
            //found html response rather than json format. should be an error.
            if (error) {
                NSString *message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                
                
                *error = [NSError errorWithDomain:AWSGeneralErrorDomain
                                             code:AWSGeneralErrorUnknown
                                         userInfo:@{NSLocalizedDescriptionKey : message?message:[NSNull null]}];
                return nil;
            }
        }
    }
    
    if (!data) {
        return nil;
    }
    if (![self validateResponse:response
                    fromRequest:currentRequest
                           data:data
                          error:error]) {
        return nil;
    }

    id result = nil;

    if (data) {
        result = [NSJSONSerialization JSONObjectWithData:data
                                                 options:0
                                                   error:error];

        //Parse AWSGeneralError
        if ([result isKindOfClass:[NSDictionary class]]) {
            if ([errorCodeDictionary objectForKey:[[[result objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]]) {
                if (error) {
                    *error = [NSError errorWithDomain:AWSGeneralErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:[[[result objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]] integerValue]
                                             userInfo:@{NSLocalizedDescriptionKey : [result objectForKey:@"message"]?[result objectForKey:@"message"]:[NSNull null]}];
                }
            }
        }
    }

    return result;
}

- (BOOL)validateResponse:(NSHTTPURLResponse *)response
             fromRequest:(NSURLRequest *)request
                    data:(id)data
                   error:(NSError *__autoreleasing *)error {
    return YES;
}

@end

@interface AWSXMLResponseSerializer()

@property (nonatomic, strong) NSDictionary *serviceDefinitionJSON;
@property (nonatomic, strong) NSString *actionName;

@end

@implementation AWSXMLResponseSerializer

+ (void)initialize {
    errorCodeDictionary = @{
                            @"RequestTimeTooSkewed" : @(AWSGeneralErrorRequestTimeTooSkewed),
                            @"InvalidSignatureException" : @(AWSGeneralErrorInvalidSignatureException),
                            @"RequestExpired" : @(AWSGeneralErrorRequestExpired),
                            @"SignatureDoesNotMatch" : @(AWSGeneralErrorSignatureDoesNotMatch),
                            @"AuthFailure" : @(AWSGeneralErrorAuthFailure),
                            };
}

+ (instancetype)serializerWithResource:(NSString *)resource actionName:(NSString *)actionName {
    AWSXMLResponseSerializer *serializer = [self new];

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

- (BOOL)validateResponse:(NSHTTPURLResponse *)response
             fromRequest:(NSURLRequest *)request
                    data:(id)data
                   error:(NSError *__autoreleasing *)error {
    //Validation already performed during XML Parsing in AWSXMLParser Class.
    return YES;
}

- (NSMutableDictionary *)parsePayloadData:(NSData *)bodyData rules:(AWSJSONDictionary *)rules {
    NSMutableDictionary *resultDictionary = [NSMutableDictionary new];
    //If no rule or no data just return
    if (rules == (id)[NSNull null] ||  [rules count] == 0 || !bodyData) {
        return resultDictionary;
    }

    NSString *payloadMemberName = rules[@"payload"];
    if (payloadMemberName) {
        resultDictionary[payloadMemberName] = bodyData;
    }

    //    AWSJSONDictionary * allMemberRules = rules[@"members"] ? rules[@"members"] : @{};
    //    [allMemberRules enumerateKeysAndObjectsUsingBlock:^(NSString *memberName, id memberRules, BOOL *stop) {
    //        if ([memberRules isKindOfClass:[NSDictionary class]] && [memberRules[@"payload"] boolValue]) {
    //            resultDictionary[memberName] = bodyData;
    //        }
    //    }];
    return resultDictionary;
}

- (NSMutableDictionary *)parseResponseHeader:(NSDictionary *)responseHeaders
                                       rules:(AWSJSONDictionary *)rules
                              bodyDictionary:(NSMutableDictionary *)bodyDictionary
                                       error:(NSError *__autoreleasing *)error {
    //If no rule just return
    if (rules == (id)[NSNull null] ||  [rules count] == 0) {
        return bodyDictionary;
    }

    rules = rules[@"members"] ? rules[@"members"] : @{};

    [rules enumerateKeysAndObjectsUsingBlock:^(NSString *memberName, id memberRules, BOOL *stop) {
        if ([memberRules isKindOfClass:[NSDictionary class]] && [memberRules[@"location"] isEqualToString:@"header"]) {
            NSString *locationName = memberRules[@"locationName"];
            if (locationName && responseHeaders[locationName]) {
                NSString *rulesType = memberRules[@"type"];
                if ([rulesType isEqualToString:@"integer"]) {
                    bodyDictionary[memberName] = @([responseHeaders[locationName] integerValue]);
                } else if ([rulesType isEqualToString:@"long"]) {
                    bodyDictionary[memberName] = @([responseHeaders[locationName] longValue]);
                } else if ([rulesType isEqualToString:@"float"]) {
                    bodyDictionary[memberName] = @([responseHeaders[locationName] floatValue]);
                } else if ([rulesType isEqualToString:@"double"]) {
                    bodyDictionary[memberName] = @([responseHeaders[locationName] doubleValue]);
                }else if ([rulesType isEqualToString:@"string"]) {
                    bodyDictionary[memberName] = responseHeaders[locationName];
                } else if ([rulesType isEqualToString:@"timestamp"]) {
                    bodyDictionary[memberName] = responseHeaders[locationName];
                }
            }
        }
    }];

    return bodyDictionary;
}

- (id)responseObjectForResponse:(NSHTTPURLResponse *)response
                originalRequest:(NSURLRequest *)originalRequest
                 currentRequest:(NSURLRequest *)currentRequest
                           data:(id)data
                          error:(NSError *__autoreleasing *)error {
    if ([data isKindOfClass:[NSData class]]) {
        AZLogVerbose(@"Response body: [%@]", [[NSString alloc] initWithData:data
                                                                   encoding:NSUTF8StringEncoding]);
    }
    
    NSString *responseContentTypeStr = [[response allHeaderFields] objectForKey:@"Content-Type"];
    if (responseContentTypeStr) {
        if ([responseContentTypeStr rangeOfString:@"text/html"].location != NSNotFound) {
            //found html response rather than xml format. should be an error.
            if (error) {
                NSString *message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                
                
                *error = [NSError errorWithDomain:AWSGeneralErrorDomain
                                             code:AWSGeneralErrorUnknown
                                         userInfo:@{NSLocalizedDescriptionKey : message?message:[NSNull null]}];
                return nil;
            }
        }
    }

    if (![self validateResponse:response fromRequest:currentRequest data:data error:error]) {
        return nil;
    }
    NSDictionary *anActionRules = [[self.serviceDefinitionJSON objectForKey:@"operations"] objectForKey:self.actionName];
    NSDictionary *shapeRules = [self.serviceDefinitionJSON objectForKey:@"shapes"];
    AWSJSONDictionary *outputRules = [[AWSJSONDictionary alloc] initWithDictionary:[anActionRules objectForKey:@"output"] JSONDefinitionRule:shapeRules];

    //try to parse data if it is a blob type, do not process it if the response status code is not 2xx
    NSMutableDictionary *resultDic = nil;
    if (response.statusCode >= 200 && response.statusCode < 300 ) {
        resultDic = [self parsePayloadData:data rules:outputRules];
    } else {
        if ([data isKindOfClass:[NSURL class]]) {
            data = [NSData dataWithContentsOfFile:[(NSURL *)data path]];
        }
    }
    
    if ([resultDic count] == 0) {
        //if not blob type, try to parse as XML string
        resultDic = [AWSXMLParser dictionaryForXMLData:data
                                            actionName:self.actionName
                                 serviceDefinitionRule:self.serviceDefinitionJSON
                                                 error:error];
    }

    //parse response header
    resultDic = [self parseResponseHeader:[response allHeaderFields] rules:outputRules bodyDictionary:resultDic error:error];

    //Parse AWSGeneralError
    NSDictionary *errorInfo = resultDic[@"Error"];
    if (errorInfo) {
        if (errorInfo[@"Code"] && errorCodeDictionary[errorInfo[@"Code"]]) {
            if (error && (*error == nil)) {
                *error = [NSError errorWithDomain:AWSGeneralErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:@{NSLocalizedDescriptionKey :[errorInfo objectForKey:@"Message"]?[errorInfo objectForKey:@"Message"]:[NSNull null]}
                          ];
            }
        }
    }
    return resultDic;
}

@end
