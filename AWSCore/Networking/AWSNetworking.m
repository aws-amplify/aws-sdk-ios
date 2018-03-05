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

#import "AWSNetworking.h"
#import <UIKit/UIKit.h>
#import "AWSBolts.h"
#import "AWSCategory.h"
#import "AWSModel.h"
#import "AWSURLSessionManager.h"
#import "AWSService.h"

NSString *const AWSNetworkingErrorDomain = @"com.amazonaws.AWSNetworkingErrorDomain";

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

- (void)dealloc
{
    //networkManager will never be dealloc'ed if session had not been invalidated.
    NSURLSession * session = [_networkManager valueForKey:@"session"];
    if ([session isKindOfClass:[NSURLSession class]]) {
        [session finishTasksAndInvalidate];
    }
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `- initWithConfiguration` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithConfiguration:(AWSNetworkingConfiguration *)configuration {
    if (self = [super init]) {
        _networkManager = [[AWSURLSessionManager alloc] initWithConfiguration:configuration];
    }

    return self;
}

- (AWSTask *)sendRequest:(AWSNetworkingRequest *)request {
    return [self.networkManager dataTaskWithRequest:request];
}
@end

#pragma mark - AWSNetworkingConfiguration

@implementation AWSNetworkingConfiguration

- (instancetype)init {
    if (self = [super init]) {
        _maxRetryCount = 3;
        _allowsCellularAccess = YES;
    }
    return self;
}

- (NSURL *)URL {
    // You can overwrite the URL by providing a full URL in URLString.
    NSURL *fullURL = [NSURL URLWithString:self.URLString];
    if ([fullURL.scheme isEqualToString:@"http"]
        || [fullURL.scheme isEqualToString:@"https"]) {
        NSMutableDictionary *headers = [self.headers mutableCopy];
        headers[@"Host"] = [fullURL host];
        self.headers = headers;
        return fullURL;
    }

    if (!self.URLString) {
        return self.baseURL;
    }

    return [NSURL URLWithString:self.URLString
                  relativeToURL:self.baseURL];
}

- (void)setMaxRetryCount:(uint32_t)maxRetryCount {
    // the max maxRetryCount is 10. If set to higher than that, it becomes 10.
    if (maxRetryCount > 10) {
        _maxRetryCount = 10;
    } else {
        _maxRetryCount = maxRetryCount;
    }
}

- (id)copyWithZone:(NSZone *)zone {
    AWSNetworkingConfiguration *configuration = nil;
    if ([self isMemberOfClass:[AWSServiceConfiguration class]]) {
        configuration = [[AWSServiceConfiguration allocWithZone:zone] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    } else {
        configuration = [[[self class] allocWithZone:zone] init];
    }
    
    configuration.baseURL = [self.baseURL copy];
    configuration.URLString = [self.URLString copy];
    configuration.HTTPMethod = self.HTTPMethod;
    configuration.headers = [self.headers copy];
    configuration.allowsCellularAccess = self.allowsCellularAccess;
    configuration.sharedContainerIdentifier = self.sharedContainerIdentifier;
    
    configuration.requestSerializer = self.requestSerializer;
    configuration.requestInterceptors = [self.requestInterceptors copy];
    configuration.responseSerializer = self.responseSerializer;
    configuration.responseInterceptors = [self.responseInterceptors copy];
    configuration.retryHandler = self.retryHandler;
    configuration.maxRetryCount = self.maxRetryCount;
    configuration.timeoutIntervalForRequest = self.timeoutIntervalForRequest;
    configuration.timeoutIntervalForResource = self.timeoutIntervalForResource;

    return configuration;
}

@end

#pragma mark - AWSNetworkingRequest

@interface AWSNetworkingRequest()

@property (nonatomic, strong) NSURLSessionTask *task;
@property (nonatomic, assign, getter = isCancelled) BOOL cancelled;

@end

@implementation AWSNetworkingRequest

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

- (AWSTask *)cancel {
    [self.internalRequest cancel];
    return [AWSTask taskWithResult:nil];
}

- (AWSTask *)pause {
    [self.internalRequest pause];
    return [AWSTask taskWithResult:nil];
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

@property (nonatomic, strong) NSString *userAgent;

@end

@implementation AWSNetworkingRequestInterceptor

- (instancetype)init {
    if (self = [super init]) {
        _userAgent = [AWSServiceConfiguration baseUserAgent];
    }

    return self;
}

- (instancetype)initWithUserAgent:(NSString *)userAgent {
    if (self = [super init]) {
        _userAgent = userAgent;
    }

    return self;
}

- (AWSTask *)interceptRequest:(NSMutableURLRequest *)request {
    [request setValue:[[NSDate aws_clockSkewFixedDate] aws_stringValue:AWSDateISO8601DateFormat2]
   forHTTPHeaderField:@"X-Amz-Date"];

    [request setValue:self.userAgent
   forHTTPHeaderField:@"User-Agent"];
    
    return [AWSTask taskWithResult:nil];
}

@end
