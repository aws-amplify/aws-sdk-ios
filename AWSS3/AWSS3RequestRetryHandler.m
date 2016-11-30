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

#import "AWSS3RequestRetryHandler.h"
#import "AWSService.h"

@implementation AWSS3RequestRetryHandler

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
       && currentRetryCount < self.maxRetryCount) {
        if (response.statusCode == 200
            && error
            && error.code != NSURLErrorCancelled) {
            retryType = AWSNetworkingRetryTypeShouldRetry;
        }
    }
    
    if (currentRetryCount < self.maxRetryCount
        && [error.domain isEqualToString:AWSServiceErrorDomain]) {
        switch (error.code) {
            case AWSServiceErrorSignatureDoesNotMatch:
                //may happened right after generating AWS temporary credentials due to the massively distributed nature of Amazon S3, just retry the request
                retryType = AWSNetworkingRetryTypeShouldRetry;
                break;
                
            default:
                break;
        }
    }
    
    return retryType;
}
@end

