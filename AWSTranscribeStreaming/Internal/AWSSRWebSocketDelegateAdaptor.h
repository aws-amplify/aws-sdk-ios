//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSSRWebSocket.h"
#import "AWSTranscribeStreamingClientDelegate.h"

NS_ASSUME_NONNULL_BEGIN

/**
 An AWSSRWebSocketDelegate adaptor for AWSTranscribeStreamingClientDelegate
 */
@interface AWSSRWebSocketDelegateAdaptor : NSObject <AWSSRWebSocketDelegate>

@property (nonatomic, weak, readonly) id<AWSTranscribeStreamingClientDelegate> clientDelegate;
@property (nonatomic, weak, readonly) dispatch_queue_t callbackQueue;

- (instancetype)initWithClientDelegate:(nullable id<AWSTranscribeStreamingClientDelegate>)clientDelegate
                         callbackQueue:(dispatch_queue_t)callbackQueue;

@end

NS_ASSUME_NONNULL_END
