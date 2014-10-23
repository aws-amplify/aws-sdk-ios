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

#import "AWSURLRequestRetryHandler.h"
#import "AWSURLResponseSerialization.h"

@interface AWSURLRequestRetryHandler ()

@property (atomic, assign) BOOL isClockSkewRetried;

@end

@implementation AWSURLRequestRetryHandler

- (instancetype)initWithMaximumRetryCount:(uint32_t)maxRetryCount {
    if (self = [super init]) {
        _maxRetryCount = maxRetryCount;
    }

    return self;
}

- (BOOL)isClockSkewError:(NSError *)error {
    if (error.code == AWSGeneralErrorRequestTimeTooSkewed
        || error.code == AWSGeneralErrorInvalidSignatureException
        || error.code == AWSGeneralErrorRequestExpired
        || error.code == AWSGeneralErrorAuthFailure) {
        return YES;
    }

    return NO;
}

- (AWSNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                            response:(NSHTTPURLResponse *)response
                                data:(NSData *)data
                               error:(NSError *)error {
    if (!self.isClockSkewRetried && [self isClockSkewError:error]) {
        self.isClockSkewRetried = YES;
        return AWSNetworkingRetryTypeShouldCorrectClockSkewAndRetry;
    }

    if (currentRetryCount >= self.maxRetryCount) {
        return AWSNetworkingRetryTypeShouldNotRetry;
    }

    if ([error.domain isEqualToString:NSURLErrorDomain]) {
        switch (error.code) {
            case NSURLErrorCancelled:
            case NSURLErrorBadURL:
            case NSURLErrorNotConnectedToInternet:

            case NSURLErrorSecureConnectionFailed:
            case NSURLErrorServerCertificateHasBadDate:
            case NSURLErrorServerCertificateUntrusted:
            case NSURLErrorServerCertificateHasUnknownRoot:
            case NSURLErrorServerCertificateNotYetValid:
            case NSURLErrorClientCertificateRejected:
            case NSURLErrorClientCertificateRequired:
            case NSURLErrorCannotLoadFromNetwork:
                return AWSNetworkingRetryTypeShouldNotRetry;

            default:
                return AWSNetworkingRetryTypeShouldRetry;
        }
    }

    switch (response.statusCode) {
        case 500:
        case 503:
            return AWSNetworkingRetryTypeShouldRetry;
            break;

        default:
            break;
    }

    return AWSNetworkingRetryTypeShouldNotRetry;
}

- (NSTimeInterval)timeIntervalForRetry:(uint32_t)currentRetryCount
                              response:(NSHTTPURLResponse *)response
                                  data:(NSData *)data
                                 error:(NSError *)error {
    return pow(0.2 * 10, currentRetryCount) / pow(10, currentRetryCount);
}

@end
