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

#import "AWSNetworking.h"
#import <UIKit/UIKit.h>
#import "Bolts.h"
#import "AWSCategory.h"
#import "AWSModel.h"
#import "AWSURLSessionManager.h"

NSString *const AWSNetworkingErrorDomain = @"com.amazonaws.AWSNetworkingErrorDomain";
NSString *const AWSiOSSDKVersion = @"2.0.11";

#pragma mark - AWSHTTPMethod

@implementation NSString (AWSHTTPMethod)

+ (instancetype)aws_stringWithHTTPMethod:(AWSHTTPMethod)HTTPMethod {
    NSString *string = nil;
    switch (HTTPMethod) {
        case AWSHTTPMethodGET:
            string = @"GET";
            break;
        case AWSHTTPMethodHEAD:
            string = @"HEAD";
            break;
        case AWSHTTPMethodPOST:
            string = @"POST";
            break;
        case AWSHTTPMethodPUT:
            string = @"PUT";
            break;
        case AWSHTTPMethodPATCH:
            string = @"PATCH";
            break;
        case AWSHTTPMethodDELETE:
            string = @"DELETE";
            break;

        default:
            break;
    }

    return string;
}

@end

#pragma mark - AWSNetworking

@interface AWSNetworking()

@property (nonatomic, strong) AWSURLSessionManager *networkManager;

@end

@implementation AWSNetworking

- (instancetype)init {
    if (self = [super init]) {
        AWSURLSessionManager *sessionManager = [AWSURLSessionManager new];
        self.networkManager = sessionManager;
    }

    return self;
}

+ (instancetype)standardNetworking {
    static AWSNetworking *_standardNetworking = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSNetworkingConfiguration *configuration = [AWSNetworkingConfiguration new];
        _standardNetworking = [AWSNetworking networking:configuration];
    });

    return _standardNetworking;
}

+ (instancetype)networking:(AWSNetworkingConfiguration *)configuration {
    AWSNetworking *networking = [AWSNetworking new];
    networking.networkManager.configuration = configuration;

    return networking;
}

- (BFTask *)sendRequest:(AWSNetworkingRequest *)request {
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

- (BFTask *)sendDownloadRequest:(AWSNetworkingRequest *)request {
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

- (BFTask *)sendUploadRequest:(AWSNetworkingRequest *)request {
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
    AWSNetworkingRequest *request = [AWSNetworkingRequest requestForDataTask:AWSHTTPMethodGET
                                                                 URLString:URLString];
    request.parameters = parameters;
    return [self sendRequest:request];
}

- (BFTask *)HEAD:(NSString *)URLString parameters:(NSDictionary *)parameters {
    AWSNetworkingRequest *request = [AWSNetworkingRequest requestForDataTask:AWSHTTPMethodHEAD
                                                                 URLString:URLString];
    request.parameters = parameters;
    return [self sendRequest:request];
}

- (BFTask *)POST:(NSString *)URLString parameters:(NSDictionary *)parameters {
    AWSNetworkingRequest *request = [AWSNetworkingRequest requestForDataTask:AWSHTTPMethodPOST
                                                                 URLString:URLString];
    request.parameters = parameters;
    return [self sendRequest:request];
}

- (BFTask *)PUT:(NSString *)URLString parameters:(NSDictionary *)parameters {
    AWSNetworkingRequest *request = [AWSNetworkingRequest requestForDataTask:AWSHTTPMethodPUT
                                                                 URLString:URLString];
    request.parameters = parameters;
    return [self sendRequest:request];
}

- (BFTask *)PATCH:(NSString *)URLString parameters:(NSDictionary *)parameters {
    AWSNetworkingRequest *request = [AWSNetworkingRequest requestForDataTask:AWSHTTPMethodPATCH
                                                                 URLString:URLString];
    request.parameters = parameters;
    return [self sendRequest:request];
}

- (BFTask *)DELETE:(NSString *)URLString parameters:(NSDictionary *)parameters {
    AWSNetworkingRequest *request = [AWSNetworkingRequest requestForDataTask:AWSHTTPMethodDELETE
                                                                 URLString:URLString];
    request.parameters = parameters;
    return [self sendRequest:request];
}

@end

#pragma mark - AWSURLRequestSerializer

@implementation AWSURLRequestSerializer

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

#pragma mark - AWSNetworkingConfiguration

@implementation AWSNetworkingConfiguration

+ (instancetype)defaultConfiguration {
    AWSNetworkingConfiguration *configuration = [AWSNetworkingConfiguration new];
    configuration.requestSerializer = [AWSURLRequestSerializer new];

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
    AWSNetworkingConfiguration *configuration = [[[self class] allocWithZone:zone] init];
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

#pragma mark - AWSNetworkingRequest

@interface AWSNetworkingRequest()

@property (nonatomic, strong) NSURLSessionTask *task;
@property (nonatomic, assign, getter = isCancelled) BOOL cancelled;

@end

@implementation AWSNetworkingRequest

+ (instancetype)requestForDataTask:(AWSHTTPMethod)HTTPMethod
                         URLString:(NSString *)URLString {
    AWSNetworkingRequest *request = [AWSNetworkingRequest new];
    request.HTTPMethod = HTTPMethod;
    request.URLString = URLString;

    return request;
}

+ (instancetype)requestForDownloadTask:(AWSHTTPMethod)HTTPMethod
                             URLString:(NSString *)URLString
                    downloadingFileURL:(NSURL *)downloadingFileURL {
    AWSNetworkingRequest *request = [AWSNetworkingRequest new];
    request.HTTPMethod = HTTPMethod;
    request.URLString = URLString;
    request.downloadingFileURL = downloadingFileURL;

    return request;
}

+ (instancetype)requestForUploadTask:(AWSHTTPMethod)HTTPMethod
                           URLString:(NSString *)URLString
                    uploadingFileURL:(NSURL *)uploadingFileURL {
    AWSNetworkingRequest *request = [AWSNetworkingRequest new];
    request.HTTPMethod = HTTPMethod;
    request.URLString = URLString;
    request.uploadingFileURL = uploadingFileURL;

    return request;
}

- (void)assignProperties:(AWSNetworkingConfiguration *)configuration {
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
        self.requestInterceptors = configuration.requestInterceptors;
    }

    if (!self.responseSerializer) {
        self.responseSerializer = configuration.responseSerializer;
    }

    if (configuration.responseInterceptors) {
        self.responseInterceptors = configuration.responseInterceptors;
    }

    if (!self.retryHandler) {
        self.retryHandler = configuration.retryHandler;
    }
}

- (void)setTask:(NSURLSessionTask *)task {
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
            [self.task cancel];
        }
    }
}

- (void)pause {
    @synchronized(self) {
        [self.task cancel];
    }
}

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;
@property (nonatomic, assign) NSNumber *shouldWriteDirectly;

@end

@implementation AWSRequest

- (instancetype)init {
    if (self = [super init]) {
        _internalRequest = [AWSNetworkingRequest new];
    }

    return self;
}

- (void)setUploadProgress:(AWSNetworkingUploadProgressBlock)uploadProgress {
    self.internalRequest.uploadProgress = uploadProgress;
}

- (void)setDownloadProgress:(AWSNetworkingDownloadProgressBlock)downloadProgress {
    self.internalRequest.downloadProgress = downloadProgress;
}

- (BOOL)isCancelled {
    return [self.internalRequest isCancelled];
}

- (BFTask *)cancel {
    [self.internalRequest cancel];
    return [BFTask taskWithResult:nil];
}

- (BFTask *)pause {
    [self.internalRequest pause];
    return [BFTask taskWithResult:nil];
}

- (NSDictionary *)dictionaryValue {
    NSDictionary *dictionaryValue = [super dictionaryValue];
    NSMutableDictionary *mutableDictionaryValue = [dictionaryValue mutableCopy];

    [dictionaryValue enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([key isEqualToString:@"internalRequest"]) {
            [mutableDictionaryValue removeObjectForKey:key];
        }
    }];

    return mutableDictionaryValue;
}

@end

@interface AWSNetworkingRequestInterceptor()

@end

@implementation AWSNetworkingRequestInterceptor

- (NSString *)userAgent {
    static NSString *_userAgent = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *systemName = [[[UIDevice currentDevice] systemName] stringByReplacingOccurrencesOfString:@" " withString:@"-"];
        NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
        NSString *localeIdentifier = [[NSLocale currentLocale] localeIdentifier];
        _userAgent = [NSString stringWithFormat:@"aws-sdk-iOS/%@ %@/%@ %@", AWSiOSSDKVersion, systemName, systemVersion, localeIdentifier];
    });

    return _userAgent;
}

- (BFTask *)interceptRequest:(NSMutableURLRequest *)request {
    [request setValue:[[NSDate date] aws_stringValue:AWSDateISO8601DateFormat2] forHTTPHeaderField:@"X-Amz-Date"];

    NSString *userAgent = [self userAgent];
    [request setValue:userAgent forHTTPHeaderField:@"User-Agent"];

    return [BFTask taskWithResult:nil];
}

@end
