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

#import <Foundation/Foundation.h>
#import "AZNetworking.h"
#import "AZModel.h"

@interface AWSRequest : AZModel

@property (nonatomic, copy) AZNetworkingUploadProgressBlock uploadProgress;
@property (nonatomic, copy) AZNetworkingDownloadProgressBlock downloadProgress;
@property (nonatomic, assign, readonly, getter = isCancelled) BOOL cancelled;
@property (nonatomic, strong) NSURL *downloadingFileURL;

- (BFTask *)cancel;
- (BFTask *)pause;

@end

@interface AWSNetworkingRequestInterceptor : NSObject <AZNetworkingRequestInterceptor>

@end
