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
#import "AZCategory.h"
#import "AZModel.h"

@interface AWSRequest()

@property (nonatomic, strong) AZNetworkingRequest *internalRequest;
@property (nonatomic, assign) NSNumber *shouldWriteDirectly;

@end

@implementation AWSRequest

- (instancetype)init {
    if (self = [super init]) {
        _internalRequest = [AZNetworkingRequest new];
    }

    return self;
}

- (void)setUploadProgress:(AZNetworkingUploadProgressBlock)uploadProgress {
    self.internalRequest.uploadProgress = uploadProgress;
}

- (void)setDownloadProgress:(AZNetworkingDownloadProgressBlock)downloadProgress {
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
        _userAgent = [NSString stringWithFormat:@"aws-sdk-iOS/%@ %@/%@ %@", @"2.0.4", systemName, systemVersion, localeIdentifier];
    });

    return _userAgent;
}

- (BFTask *)interceptRequest:(NSMutableURLRequest *)request {
    [request setValue:[[NSDate date] az_stringValue:AZDateISO8601DateFormat2] forHTTPHeaderField:@"X-Amz-Date"];

    NSString *userAgent = [self userAgent];
    [request setValue:userAgent forHTTPHeaderField:@"User-Agent"];

    return [BFTask taskWithResult:nil];
}

@end
