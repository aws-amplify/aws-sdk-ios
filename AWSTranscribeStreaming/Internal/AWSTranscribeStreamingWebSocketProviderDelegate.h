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

- (void)didReceiveMessage:(id)webSocket
                  message:(id)message;
- (void)didConnect:(id)webSocket;
- (void)didError: (nullable id)webSocket
           error: (NSError *)error;
- (void)didDisconnect:(id)webSocket
     didCloseWithCode:(NSInteger)didCloseWithCode
               reason:(NSString *)reason
             wasClean:(BOOL)wasClean;

@end

NS_ASSUME_NONNULL_END
