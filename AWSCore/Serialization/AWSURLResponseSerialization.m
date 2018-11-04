//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//
#import "AWSURLResponseSerialization.h"

#import "AWSCocoaLumberjack.h"

#import "AWSService.h"
#import "AWSValidation.h"
#import "AWSSerialization.h"

#pragma mark - Service errors

@interface AWSJSONResponseSerializer()

@property (nonatomic, strong) NSDictionary *serviceDefinitionJSON;
@property (nonatomic, strong) NSString *actionName;
@property (nonatomic, assign) Class outputClass;

@end

@implementation AWSJSONResponseSerializer

- (instancetype)initWithJSONDefinition:(NSDictionary *)JSONDefinition
                            actionName:(NSString *)actionName
                           outputClass:(Class)outputClass {
    if (self = [super init]) {

        _serviceDefinitionJSON = JSONDefinition;
        if (_serviceDefinitionJSON == nil) {
            AWSDDLogError(@"serviceDefinitionJSON is nil.");
            return nil;
        }
        _actionName = actionName;

        _outputClass = outputClass;
    }

    return self;
}

- (id)responseObjectForResponse:(NSHTTPURLResponse *)response
                originalRequest:(NSURLRequest *)originalRequest
                 currentRequest:(NSURLRequest *)currentRequest
                           data:(id)data
                          error:(NSError *__autoreleasing *)error {
    if([AWSDDLog sharedInstance].logLevel & AWSDDLogFlagDebug){
        if ([data isKindOfClass:[NSData class]]) {
            if ([data length] <= 100 * 1024) {
                AWSDDLogDebug(@"Response body:\n%@", [[NSString alloc] initWithData:data
                                                                           encoding:NSUTF8StringEncoding]);
            } else {
                AWSDDLogDebug(@"Response body (Partial data. The first 100KB is displayed.):\n%@", [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 100 * 1024)]
                                                                                                                         encoding:NSUTF8StringEncoding]);
                
            }
        }
    }

    NSString *responseContentTypeStr = [[response allHeaderFields] objectForKey:@"Content-Type"];
    if (responseContentTypeStr) {
        if ([responseContentTypeStr rangeOfString:@"text/html"].location != NSNotFound) {
            //found html response rather than json format. should be an error.
            if (error) {
                NSString *message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];


                *error = [NSError errorWithDomain:AWSServiceErrorDomain
                                             code:AWSServiceErrorUnknown
                                         userInfo:@{NSLocalizedDescriptionKey : message?message:[NSNull null]}];
                return nil;
            }
        }
    }

    if (![self validateResponse:response
                    fromRequest:currentRequest
                           data:data
                          error:error]) {
        return nil;
    }

    id result = nil;

    //parse JSON data
    result = [AWSJSONParser dictionaryForJsonData:data response:response actionName:self.actionName serviceDefinitionRule:self.serviceDefinitionJSON error:error];

    //Parse AWSServiceError
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary *anActionRules = [[self.serviceDefinitionJSON objectForKey:@"operations"] objectForKey:_actionName];
        NSDictionary *shapeRules = [self.serviceDefinitionJSON objectForKey:@"shapes"];
        AWSJSONDictionary *outputRules = [[AWSJSONDictionary alloc] initWithDictionary:[anActionRules objectForKey:@"output"] JSONDefinitionRule:shapeRules];
        result = [AWSXMLResponseSerializer parseResponse:response rules:outputRules bodyDictionary:[result mutableCopy] error:error];

        NSNumber *errorCode = [[AWSService errorCodeDictionary] objectForKey:[[[result objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]];
        if (errorCode != nil) {
            if (error) {
                *error = [NSError errorWithDomain:AWSServiceErrorDomain
                                             code:[errorCode integerValue]
                                         userInfo:result];
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

- (instancetype)initWithJSONDefinition:(NSDictionary *)JSONDefinition
                            actionName:(NSString *)actionName
                           outputClass:(Class)outputClass {
    if (self = [super init]) {

        _serviceDefinitionJSON = JSONDefinition;
        if (_serviceDefinitionJSON == nil) {
            AWSDDLogError(@"serviceDefinitionJSON of is nil.");
            return nil;
        }
        _actionName = actionName;

        _outputClass = outputClass;
    }

    return self;
}

- (BOOL)validateResponse:(NSHTTPURLResponse *)response
             fromRequest:(NSURLRequest *)request
                    data:(id)data
                   error:(NSError *__autoreleasing *)error {
    //Validation already performed during XML Parsing in AWSXMLParser Class.
    return YES;
}

+ (NSMutableDictionary *)parseResponse:(NSHTTPURLResponse *)response
                                 rules:(AWSJSONDictionary *)rules
                        bodyDictionary:(NSMutableDictionary *)bodyDictionary
                                 error:(NSError *__autoreleasing *)error {
    NSDictionary *responseHeaders = [response allHeaderFields];

    //If no rule just return
    if (rules == (id)[NSNull null] ||  [rules count] == 0) {
        return bodyDictionary;
    }

    rules = rules[@"members"] ? rules[@"members"] : @{};

    [rules enumerateKeysAndObjectsUsingBlock:^(NSString *memberName, id memberRules, BOOL *stop) {
        if ([memberRules isKindOfClass:[NSDictionary class]] && [memberRules[@"location"] isEqualToString:@"header"]) {
            NSString *locationName = memberRules[@"locationName"]?memberRules[@"locationName"]:memberName;
            if (locationName && responseHeaders[locationName]) {
                NSString *rulesType = memberRules[@"type"];
                if ([rulesType isEqualToString:@"integer"]) {
                    bodyDictionary[memberName] = @([responseHeaders[locationName] integerValue]);
                } else if ([rulesType isEqualToString:@"long"]) {
                    bodyDictionary[memberName] = @([responseHeaders[locationName] longLongValue]);
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

        //if the location may contain multiple headers if it is a map type
        if ([memberRules isKindOfClass:[NSDictionary class]] && [memberRules[@"location"] isEqualToString:@"headers"] && [memberRules[@"type"] isEqualToString:@"map"]) {
            NSString *locationName = memberRules[@"locationName"]?memberRules[@"locationName"]:@""; //if no locationName specified, match all headers.
            if (locationName) {
                NSPredicate *metaDatapredicate = [NSPredicate predicateWithFormat:@"SELF like[c] %@",[locationName stringByAppendingString:@"*"]]; //[c] means case insensitive
                NSArray *matchedArray = [[responseHeaders allKeys] filteredArrayUsingPredicate:metaDatapredicate];
                NSMutableDictionary *mapDic = [NSMutableDictionary new];
                for (NSString *fullHeaderName in matchedArray) {
                    NSString *extractedHeaderName = [fullHeaderName stringByReplacingOccurrencesOfString:locationName withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [fullHeaderName length])];
                    if (extractedHeaderName) {
                        mapDic[extractedHeaderName] = responseHeaders[fullHeaderName];
                    }
                }
                if ([mapDic count] > 0 && memberName) {
                    bodyDictionary[memberName] = mapDic;
                }
            }
        }

        //may also need to pass the response statusCode if the memberRule ask for it
        if (memberName && [memberRules isKindOfClass:[NSDictionary class]] && [memberRules[@"location"] isEqualToString:@"statusCode"]) {
            NSString *rulesType = memberRules[@"type"];
            NSNumber *statusCode = @(response.statusCode);
            if ([rulesType isEqualToString:@"integer"] || [rulesType isEqualToString:@"long"] || [rulesType isEqualToString:@"float"] || [rulesType isEqualToString:@"double"]) {
                bodyDictionary[memberName] = statusCode;
            } else if ([rulesType isEqualToString:@"string"]) {
                bodyDictionary[memberName] = [statusCode stringValue];
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
    if([AWSDDLog sharedInstance].logLevel & AWSDDLogFlagDebug){
        if ([data isKindOfClass:[NSData class]]) {
            if ([data length] <= 100 * 1024) {
                AWSDDLogDebug(@"Response body:\n%@", [[NSString alloc] initWithData:data
                                                                           encoding:NSUTF8StringEncoding]);
            } else {
                AWSDDLogDebug(@"Response body (Partial data. The first 100KB is displayed.):\n%@", [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 100 * 1024)]
                                                                                                                         encoding:NSUTF8StringEncoding]);
                
            }
        }
    }
    
    if (![self validateResponse:response fromRequest:currentRequest data:data error:error]) {
        return nil;
    }

    NSDictionary *anActionRules = [[self.serviceDefinitionJSON objectForKey:@"operations"] objectForKey:self.actionName];
    NSDictionary *shapeRules = [self.serviceDefinitionJSON objectForKey:@"shapes"];
    AWSJSONDictionary *outputRules = [[AWSJSONDictionary alloc] initWithDictionary:[anActionRules objectForKey:@"output"] JSONDefinitionRule:shapeRules];

    NSMutableDictionary *resultDic = [NSMutableDictionary new];

    // There is a small edge case where S3 returns a 200 response for an error.
    // http://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectCOPY.html
    if (response.statusCode / 100 == 2
        && ![originalRequest.HTTPMethod isEqualToString:@"PUT"]) {
        // status is good and it's not a PUT request, we can keep NSURL as data
    } else {
        //if status error indicates error or it's a PUT request, need to convert NSURL to NSData for error processing
        if ([data isKindOfClass:[NSURL class]]) {
            data = [NSData dataWithContentsOfFile:[(NSURL *)data path]];
        }
    }

    if ([resultDic count] == 0) {
        //if not blob type, try to parse as XML string
        resultDic = [[AWSXMLParser sharedInstance] dictionaryForXMLData:data
                                                             actionName:self.actionName
                                                  serviceDefinitionRule:self.serviceDefinitionJSON
                                                                  error:error];
    }

    //parse response header
    resultDic = [AWSXMLResponseSerializer parseResponse:response rules:outputRules bodyDictionary:resultDic error:error];

    //Parse AWSServiceError
    NSDictionary *errorInfo = resultDic[@"Error"];
    if (errorInfo) {
        if (errorInfo[@"Code"] && [AWSService errorCodeDictionary][errorInfo[@"Code"]]) {
            if (error && (*error == nil)) {
                *error = [NSError errorWithDomain:AWSServiceErrorDomain
                                             code:[[AWSService errorCodeDictionary][errorInfo[@"Code"]] integerValue]
                                         userInfo:errorInfo
                          ];
            }
        }
    }
    return resultDic;
}

@end
