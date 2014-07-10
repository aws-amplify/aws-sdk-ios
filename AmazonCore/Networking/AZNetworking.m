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

#import "AZNetworking.h"

#import "Bolts.h"
#import "AZURLSessionManager.h"

NSString *const AZNetworkingErrorDomain = @"com.amazonaws.AZNetworkingErrorDomain";

#pragma mark - AZHTTPMethod

@implementation NSString (AZHTTPMethod)

+ (instancetype)az_stringWithHTTPMethod:(AZHTTPMethod)HTTPMethod {
    NSString *string = nil;
    switch (HTTPMethod) {
        case AZHTTPMethodGET:
            string = @"GET";
            break;
        case AZHTTPMethodHEAD:
            string = @"HEAD";
            break;
        case AZHTTPMethodPOST:
            string = @"POST";
            break;
        case AZHTTPMethodPUT:
            string = @"PUT";
            break;
        case AZHTTPMethodPATCH:
            string = @"PATCH";
            break;
        case AZHTTPMethodDELETE:
            string = @"DELETE";
            break;

        default:
            break;
    }

    return string;
}

@end

#pragma mark - AZNetworking

@interface AZNetworking()

@property (nonatomic, strong) AZURLSessionManager *networkManager;

@end

@implementation AZNetworking

- (instancetype)init {
    if (self = [super init]) {
        AZURLSessionManager *sessionManager = [AZURLSessionManager new];
        self.networkManager = sessionManager;
    }

    return self;
}

+ (instancetype)standardNetworking {
    static AZNetworking *_standardNetworking = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AZNetworkingConfiguration *configuration = [AZNetworkingConfiguration new];
        _standardNetworking = [AZNetworking networking:configuration];
    });

    return _standardNetworking;
}

+ (instancetype)networking:(AZNetworkingConfiguration *)configuration {
    AZNetworking *networking = [AZNetworking new];
    networking.networkManager.configuration = configuration;

    return networking;
}

- (BFTask *)sendRequest:(AZNetworkingRequest *)request {
    BFTaskCompletionSource *taskCompletionSource = [BFTaskCompletionSource taskCompletionSource];
    [self.networkManager dataTaskWithRequest:request
                           completionHandler:^(id responseObject, NSError *error) {
                               if (!error) {
                                   taskCompletionSource.result = responseObject;
                               } else {
                                   taskCompletionSource.error = error;
                               }
                           }];

    return taskCompletionSource.task;
}

- (BFTask *)sendDownloadRequest:(AZNetworkingRequest *)request {
    BFTaskCompletionSource *taskCompletionSource = [BFTaskCompletionSource taskCompletionSource];
    [self.networkManager downloadTaskWithRequest:request
                               completionHandler:^(id responseObject, NSError *error) {
                                   if (!error) {
                                       taskCompletionSource.result = responseObject;
                                   } else {
                                       taskCompletionSource.error = error;
                                   }
                               }];

    return taskCompletionSource.task;
}

- (BFTask *)sendUploadRequest:(AZNetworkingRequest *)request {
    BFTaskCompletionSource *taskCompletionSource = [BFTaskCompletionSource taskCompletionSource];
    [self.networkManager uploadTaskWithRequest:request
                             completionHandler:^(id responseObject, NSError *error) {
                                 if (!error) {
                                     taskCompletionSource.result = responseObject;
                                 } else {
                                     taskCompletionSource.error = error;
                                 }
                             }];

    return taskCompletionSource.task;
}

- (BFTask *)GET:(NSString *)URLString parameters:(NSDictionary *)parameters {
    AZNetworkingRequest *request = [AZNetworkingRequest requestForDataTask:AZHTTPMethodGET
                                                                 URLString:URLString];
    request.parameters = parameters;
    return [self sendRequest:request];
}

- (BFTask *)HEAD:(NSString *)URLString parameters:(NSDictionary *)parameters {
    AZNetworkingRequest *request = [AZNetworkingRequest requestForDataTask:AZHTTPMethodHEAD
                                                                 URLString:URLString];
    request.parameters = parameters;
    return [self sendRequest:request];
}

- (BFTask *)POST:(NSString *)URLString parameters:(NSDictionary *)parameters {
    AZNetworkingRequest *request = [AZNetworkingRequest requestForDataTask:AZHTTPMethodPOST
                                                                 URLString:URLString];
    request.parameters = parameters;
    return [self sendRequest:request];
}

- (BFTask *)PUT:(NSString *)URLString parameters:(NSDictionary *)parameters {
    AZNetworkingRequest *request = [AZNetworkingRequest requestForDataTask:AZHTTPMethodPUT
                                                                 URLString:URLString];
    request.parameters = parameters;
    return [self sendRequest:request];
}

- (BFTask *)PATCH:(NSString *)URLString parameters:(NSDictionary *)parameters {
    AZNetworkingRequest *request = [AZNetworkingRequest requestForDataTask:AZHTTPMethodPATCH
                                                                 URLString:URLString];
    request.parameters = parameters;
    return [self sendRequest:request];
}

- (BFTask *)DELETE:(NSString *)URLString parameters:(NSDictionary *)parameters {
    AZNetworkingRequest *request = [AZNetworkingRequest requestForDataTask:AZHTTPMethodDELETE
                                                                 URLString:URLString];
    request.parameters = parameters;
    return [self sendRequest:request];
}

@end

#pragma mark - AZURLRequestSerializer

@implementation AZURLRequestSerializer

- (BFTask *)validateRequest:(NSURLRequest *)request {
    return [BFTask taskWithResult:nil];
}

- (BFTask *)serializeRequest:(NSMutableURLRequest *)request
                 headers:(NSDictionary *)header
              parameters:(NSDictionary *)parameters {
    if ([request.HTTPMethod isEqualToString:@"GET"]) {
        NSMutableString *URLparameters = [NSMutableString new];
        for (id o in parameters) {
            if ([URLparameters length] > 0) {
                [URLparameters appendString:@"&"];
            }

            [URLparameters appendFormat:@"%@=%@", o, [parameters objectForKey:o]];
        }

        NSString *escapedURLParameters = [[URLparameters stringByRemovingPercentEncoding] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        request.URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",
                                            [request.URL absoluteString],
                                            request.URL.query ? @"&" : @"?",
                                            escapedURLParameters]];
    }
    return [BFTask taskWithResult:nil];
}

@end

#pragma mark - AZNetworkingConfiguration

@implementation AZNetworkingConfiguration

+ (instancetype)defaultConfiguration {
    AZNetworkingConfiguration *configuration = [AZNetworkingConfiguration new];
    configuration.requestSerializer = [AZURLRequestSerializer new];

    return configuration;
}

- (NSURL *)URL {
    if (!self.URLString) {
        return self.baseURL;
    }

    return [NSURL URLWithString:self.URLString
                  relativeToURL:self.baseURL];
}

- (id)copyWithZone:(NSZone *)zone {
    AZNetworkingConfiguration *configuration = [[[self class] allocWithZone:zone] init];
    configuration.baseURL = [self.baseURL copy];
    configuration.URLString = [self.URLString copy];
    configuration.HTTPMethod = self.HTTPMethod;
    configuration.headers = [self.headers copy];
    configuration.requestSerializer = self.requestSerializer;
    configuration.requestInterceptors = [self.requestInterceptors copy];
    configuration.responseSerializer = self.responseSerializer;
    configuration.responseInterceptors = [self.responseInterceptors copy];
    configuration.retryHandler = self.retryHandler;

    return configuration;
}

@end

#pragma mark - AZNetworkingRequest

@interface AZNetworkingRequest()

@property (nonatomic, strong) id task;
@property (nonatomic, assign, getter = isCancelled) BOOL cancelled;

@end

@implementation AZNetworkingRequest

+ (instancetype)requestForDataTask:(AZHTTPMethod)HTTPMethod
                         URLString:(NSString *)URLString {
    AZNetworkingRequest *request = [AZNetworkingRequest new];
    request.HTTPMethod = HTTPMethod;
    request.URLString = URLString;

    return request;
}

+ (instancetype)requestForDownloadTask:(AZHTTPMethod)HTTPMethod
                             URLString:(NSString *)URLString
                    downloadingFileURL:(NSURL *)downloadingFileURL {
    AZNetworkingRequest *request = [AZNetworkingRequest new];
    request.HTTPMethod = HTTPMethod;
    request.URLString = URLString;
    request.downloadingFileURL = downloadingFileURL;

    return request;
}

+ (instancetype)requestForUploadTask:(AZHTTPMethod)HTTPMethod
                           URLString:(NSString *)URLString
                    uploadingFileURL:(NSURL *)uploadingFileURL {
    AZNetworkingRequest *request = [AZNetworkingRequest new];
    request.HTTPMethod = HTTPMethod;
    request.URLString = URLString;
    request.uploadingFileURL = uploadingFileURL;

    return request;
}

- (void)assignProperties:(AZNetworkingConfiguration *)configuration {
    if (!self.baseURL) {
        self.baseURL = configuration.baseURL;
    }

    if (!self.URLString) {
        self.URLString = configuration.URLString;
    }

    if (!self.HTTPMethod) {
        self.HTTPMethod = configuration.HTTPMethod;
    }

    if (configuration.headers) {
        NSMutableDictionary *mutableCopy = [configuration.headers mutableCopy];
        [self.headers enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [mutableCopy setObject:obj forKey:key];
        }];
        self.headers = mutableCopy;
    }

    if (!self.requestSerializer) {
        self.requestSerializer = configuration.requestSerializer;
    }

    if (configuration.requestInterceptors) {
        //self.requestInterceptors = [configuration.requestInterceptors arrayByAddingObjectsFromArray:self.requestInterceptors];
        self.requestInterceptors = configuration.requestInterceptors;
    }

    if (!self.responseSerializer) {
        self.responseSerializer = configuration.responseSerializer;
    }

    if (configuration.responseInterceptors) {
        //self.responseInterceptors = [configuration.responseInterceptors arrayByAddingObjectsFromArray:self.responseInterceptors];
        self.responseInterceptors = configuration.responseInterceptors;
    }
    
    if (!self.retryHandler) {
        self.retryHandler = configuration.retryHandler;
    }
}

- (void)setTask:(id)task {
    @synchronized(self) {
        if (!_cancelled) {
            _task = task;
        } else {
            _task = nil;
        }
    }
}

- (BOOL)isCancelled {
    @synchronized(self) {
        return _cancelled;
    }
}

- (void)cancel {
    @synchronized(self) {
        if (!_cancelled) {
            _cancelled = YES;

            if ([self.task respondsToSelector:@selector(cancel)]) {
                [self.task cancel];
            }
        }
    }
}

- (void)pause {
    @synchronized(self) {
            if ([self.task respondsToSelector:@selector(cancel)]) {
                [self.task cancel];
            }
    }
}
@end
