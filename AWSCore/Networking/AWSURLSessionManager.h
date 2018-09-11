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

#import <Foundation/Foundation.h>
#import "AWSNetworking.h"

@interface AWSURLSessionManager : NSObject <NSURLSessionDelegate, NSURLSessionDataDelegate>

@property (nonatomic, strong) AWSNetworkingConfiguration *configuration;

- (instancetype)initWithConfiguration:(AWSNetworkingConfiguration *)configuration;

- (AWSTask *)dataTaskWithRequest:(AWSNetworkingRequest *)request;

/**
 Invalidates the underlying NSURLSession to avoid memory leaks.
 
 @warning Before calling this method, make sure no method is running on this manager.
 */
- (void)invalidate;

@end
