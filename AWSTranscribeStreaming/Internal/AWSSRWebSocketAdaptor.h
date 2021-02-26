//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSTranscribeStreamingWebSocketProvider.h"
#import "AWSSRWebSocketDelegateAdaptor.h"
#import "AWSSRWebSocket+TranscribeStreaming.h"

NS_ASSUME_NONNULL_BEGIN

@interface AWSSRWebSocketAdaptor : NSObject <AWSTranscribeStreamingWebSocketProvider>

@property(nonatomic, strong, readonly) AWSSRWebSocketDelegateAdaptor *delegate;
@property(nonatomic, strong) id<AWSTranscribeStreamingClientDelegate> clientDelegate;
@property(nonatomic, strong) AWSSRWebSocket *webSocket;

-(void)configureWithURLRequest:(NSURLRequest *)urlRequest;
-(void)connect;

@end

NS_ASSUME_NONNULL_END
