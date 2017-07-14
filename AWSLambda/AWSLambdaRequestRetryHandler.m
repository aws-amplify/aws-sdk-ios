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

#import "AWSLambdaRequestRetryHandler.h"
#import "AWSLambdaModel.h"

@implementation AWSLambdaRequestRetryHandler

- (AWSNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                      originalRequest:(AWSNetworkingRequest *)originalRequest
                             response:(NSHTTPURLResponse *)response
                                 data:(NSData *)data
                                error:(NSError *)error {
    AWSNetworkingRetryType retryType = [super shouldRetry:currentRetryCount
                                          originalRequest:(AWSNetworkingRequest *)originalRequest
                                                 response:response
                                                     data:data
                                                    error:error];
    if(retryType == AWSNetworkingRetryTypeShouldNotRetry
       && [error.domain isEqualToString:AWSLambdaErrorDomain]
       && currentRetryCount < self.maxRetryCount) {
        if ([error.userInfo[@"NSLocalizedFailureReason"] isEqualToString:@"InvalidSignatureException"]) {
                retryType = AWSNetworkingRetryTypeShouldCorrectClockSkewAndRetry;
        }
        
    }
    
    return retryType;
}

@end
