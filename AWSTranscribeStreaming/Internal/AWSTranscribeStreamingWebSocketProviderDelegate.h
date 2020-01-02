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

NS_ASSUME_NONNULL_BEGIN

@protocol AWSTranscribeStreamingWebSocketProvider;

@protocol AWSTranscribeStreamingWebSocketProviderDelegate <NSObject>

- (void)webSocket:(id<AWSTranscribeStreamingWebSocketProvider>)webSocket didReceiveData:(NSData *)data;

- (void)webSocketConnected:(id<AWSTranscribeStreamingWebSocketProvider>)webSocket;

- (void)webSocket:(nullable id<AWSTranscribeStreamingWebSocketProvider>)webSocket didError:(NSError *)error;

- (void)webSocketDisconnected:(id<AWSTranscribeStreamingWebSocketProvider>)webSocket
                     withCode:(NSInteger)code
                       reason:(NSString *)reason
                     wasClean:(BOOL)wasClean;

@end

NS_ASSUME_NONNULL_END
