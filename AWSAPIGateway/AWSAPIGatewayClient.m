//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSAPIGatewayClient.h"
#import <AWSCore/AWSCore.h>

NSString *const AWSAPIGatewayErrorDomain = @"com.amazonaws.AWSAPIGatewayErrorDomain";

NSString *const AWSAPIGatewayErrorHTTPBodyKey = @"HTTPBody";
NSString *const AWSAPIGatewayErrorHTTPHeaderFieldsKey = @"HTTPHeaderFields";

static NSString *const AWSAPIGatewayAPIKeyHeader = @"x-api-key";

static NSString *const AWSAPIGatewaySDKVersion = @"2.4.2";

@interface AWSAPIGatewayClient()

@property (nonatomic, strong) AWSServiceConfiguration *configuration;

// Networking
@property (nonatomic, strong) NSURLSession *session;

@end

@implementation AWSAPIGatewayClient

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSAPIGatewaySDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSAPIGateway versions need to match. Check your SDK installation. AWSCore: %@ AWSAPIGateway: %@", AWSiOSSDKVersion, AWSAPIGatewaySDKVersion]
                                     userInfo:nil];
    }
}

- (instancetype)init {
    if (self = [super init]) {
        static NSURLSession *session = nil;

        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
            session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
        });

        _session = session;
    }
    return self;
}

- (AWSTask *)invokeHTTPRequest:(NSString *)HTTPMethod
                     URLString:(NSString *)URLString
                pathParameters:(NSDictionary *)pathParameters
               queryParameters:(NSDictionary *)queryParameters
              headerParameters:(NSDictionary *)headerParameters
                          body:(id)body
                 responseClass:(Class)responseClass {
    NSURL *URL = [self requestURL:URLString query:queryParameters URLPathComponentsDictionary:pathParameters];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    request.HTTPMethod = HTTPMethod;
    request.allHTTPHeaderFields = headerParameters;
    if (self.APIKey) {
        [request addValue:self.APIKey forHTTPHeaderField:AWSAPIGatewayAPIKeyHeader];
    }

    NSError *error = nil;
    if (body != nil) {
        NSDictionary *bodyParameters = [[AWSMTLJSONAdapter JSONDictionaryFromModel:body] aws_removeNullValues];
        request.HTTPBody = [NSJSONSerialization dataWithJSONObject:bodyParameters
                                                           options:0
                                                             error:&error];
        if (!request.HTTPBody) {
            AWSLogError(@"Failed to serialize a request body. %@", error);
        }
    }

    // Refreshes credentials if necessary
    AWSTask *task = [AWSTask taskWithResult:nil];
    task = [task continueWithSuccessBlock:^id(AWSTask *task) {
        id signer = [self.configuration.requestInterceptors lastObject];
        if (signer) {
            if ([signer respondsToSelector:@selector(credentialsProvider)]) {
                id<AWSCredentialsProvider> credentialsProvider = [signer performSelector:@selector(credentialsProvider)];
                return [credentialsProvider credentials];
            }
        }
        return nil;
    }];

    // Signs the request
    for (id<AWSNetworkingRequestInterceptor> interceptor in self.configuration.requestInterceptors) {
        task = [task continueWithSuccessBlock:^id(AWSTask *task) {
            return [interceptor interceptRequest:request];
        }];
    }

    return [task continueWithSuccessBlock:^id(AWSTask *task) {
        AWSTaskCompletionSource *completionSource = [AWSTaskCompletionSource new];

        void (^completionHandler)(NSData *data, NSURLResponse *response, NSError *error) = ^(NSData *data, NSURLResponse *response, NSError *error) {
            // Networking errors
            if (error) {
                [completionSource setError:error];
                return;
            }

            // Serializes the HTTP body
            id JSONObject = nil;
            if (data && [data length] > 0) {
                JSONObject = [NSJSONSerialization JSONObjectWithData:data
                                                             options:NSJSONReadingAllowFragments
                                                               error:&error];
                if (!JSONObject) {
                    NSString *bodyString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                    if ([bodyString length] > 0) {
                        AWSLogError(@"The body is not in JSON format. Body: %@\nError: %@", bodyString, error);
                    }
                    [completionSource setError:error];
                    return;
                }
            }

            // Handles developer defined errors
            NSHTTPURLResponse *HTTPResponse = (NSHTTPURLResponse *)response;

            NSDictionary *HTTPHeaderFields = HTTPResponse.allHeaderFields;
            NSInteger HTTPStatusCode = HTTPResponse.statusCode;
            if (HTTPStatusCode/100 == 4 || HTTPStatusCode/100 == 5) {
                NSMutableDictionary *userInfo = [NSMutableDictionary new];
                if (JSONObject) {
                    userInfo[AWSAPIGatewayErrorHTTPBodyKey] = JSONObject;
                }
                if (HTTPHeaderFields) {
                    userInfo[AWSAPIGatewayErrorHTTPHeaderFieldsKey] = HTTPHeaderFields;
                }

                if (HTTPStatusCode/100 == 4) {
                    NSError *clientError = [NSError errorWithDomain:AWSAPIGatewayErrorDomain
                                                               code:AWSAPIGatewayErrorTypeClient
                                                           userInfo:userInfo];
                    [completionSource setError:clientError];
                }
                if (HTTPStatusCode/100 == 5) {
                    NSError *clientError = [NSError errorWithDomain:AWSAPIGatewayErrorDomain
                                                               code:AWSAPIGatewayErrorTypeService
                                                           userInfo:userInfo];
                    [completionSource setError:clientError];
                }
                return;
            }

            // Maps a serialized JSON object to an Objective-C object
            if (JSONObject) {
                if (responseClass
                    && responseClass != [NSDictionary class]) {
                    if ([JSONObject isKindOfClass:[NSDictionary class]]) {
                        NSError *responseSerializationError = nil;
                        JSONObject = [AWSMTLJSONAdapter modelOfClass:responseClass
                                                  fromJSONDictionary:JSONObject
                                                               error:&responseSerializationError];
                        if (!JSONObject) {
                            AWSLogError(@"Failed to serialize the body JSON. %@", responseSerializationError);
                        }
                    }
                    if ([JSONObject isKindOfClass:[NSArray class]]) {
                        NSError *responseSerializationError = nil;
                        NSMutableArray *models = [NSMutableArray new];
                        for (id object in JSONObject) {
                            id model = [AWSMTLJSONAdapter modelOfClass:responseClass
                                                    fromJSONDictionary:object
                                                                 error:&responseSerializationError];
                            [models addObject:model];
                            if (!JSONObject) {
                                AWSLogError(@"Failed to serialize the body JSON. %@", responseSerializationError);
                            }
                        }
                        JSONObject = models;
                    }
                }
                [completionSource setResult:JSONObject];
            } else {
                [completionSource setResult:nil];
            }
        };
        NSURLSessionDataTask *sessionTask = [self.session dataTaskWithRequest:request
                                                            completionHandler:completionHandler];
        [sessionTask resume];

        return completionSource.task;
    }];
}

- (NSURL *)requestURL:(NSString *)URLString query:(NSDictionary *)query URLPathComponentsDictionary:(NSDictionary *)URLPathComponentsDictionary {
    NSMutableString *mutableURLString = [NSMutableString stringWithString:URLString];

    // Constructs the URL path components
    for (NSString *key in URLPathComponentsDictionary) {
        [mutableURLString replaceOccurrencesOfString:[NSString stringWithFormat:@"{%@}", key]
                                          withString:[self encodeQueryStringValue:URLPathComponentsDictionary[key]]
                                             options:NSLiteralSearch
                                               range:NSMakeRange(0, [mutableURLString length])];
    }

    // Adds query string
    NSMutableString *queryString = [NSMutableString new];
    [self processParameters:query queryString:queryString];
    if ([queryString length] > 0) {
        [mutableURLString appendFormat:@"?%@", queryString];
    }

    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", self.configuration.baseURL, mutableURLString]];
}

// TODO: merge it with - (void)processParameters:(NSDictionary *)parameters queryString:(NSMutableString *)queryString in AWSURLRequestSerialization.m
- (void)processParameters:(NSDictionary *)parameters queryString:(NSMutableString *)queryString {
    for (NSString *key in parameters) {
        id obj = parameters[key];

        if ([obj isKindOfClass:[NSDictionary class]]) {
            [self processParameters:obj queryString:queryString];
        } else {
            if ([queryString length] > 0) {
                [queryString appendString:@"&"];
            }

            [queryString appendString:[self generateQueryStringWithKey:key value:obj]];
        }
    }
}

- (NSString *)generateQueryStringWithKey:(NSString *)key value:(id)value {
    NSMutableString *queryString = [NSMutableString new];
    [queryString appendString:[key aws_stringWithURLEncoding]];
    [queryString appendString:@"="];
    [queryString appendString:[self encodeQueryStringValue:value]];

    return queryString;
}

- (NSString *)encodeQueryStringValue:(id)value {
    if ([value isKindOfClass:[NSString class]]) {
        return [value aws_stringWithURLEncoding];
    }

    if ([value isKindOfClass:[NSNumber class]]) {
        return [[value stringValue] aws_stringWithURLEncoding];
    }

    if ([value isKindOfClass:[NSArray class]]) {
        NSMutableString *mutableString = [NSMutableString new];
        for (id obj in value) {
            if ([mutableString length] > 0) {
                [mutableString appendString:@","];
            }
            [mutableString appendString:[self encodeQueryStringValue:obj]];
        }
        return mutableString;
    }
    
    AWSLogError(@"value[%@] is invalid.", value);
    return [[value description] aws_stringWithURLEncoding];
}

@end
