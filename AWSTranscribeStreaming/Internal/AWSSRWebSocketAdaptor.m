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
#import "AWSSRWebSocketAdaptor.h"
#import <AWSCore/AWSCore.h>
#import "AWSSRWebSocketDelegateAdaptor.h"
#import "AWSTranscribeStreamingEventDecoder.h"
#import "AWSTranscribeStreamingClientDelegate.h"

@interface AWSSRWebSocketAdaptor()

@property(nonatomic, strong, readwrite) AWSSRWebSocketDelegateAdaptor *delegate;

@end

@implementation AWSSRWebSocketAdaptor

/**
 Web socket protocol implementations
 Initializes the web socket socket rocket class with a url request
 @param urlRequest  the url request you are invoking the web socket with
 */
-(void)configureWithURLRequest:(NSURLRequest*)urlRequest {
    self.webSocket = [[AWSSRWebSocket alloc] initWithURLRequest:urlRequest];
    [self.webSocket setDelegateDispatchQueue:self.delegate.callbackQueue];
    [self.webSocket setDelegate:self.delegate];
}

-(void)setDelegate:(id<AWSTranscribeStreamingClientDelegate>)delegate
     dispatchQueue:(dispatch_queue_t)dispatchQueue {
    self.clientDelegate = delegate;
    AWSSRWebSocketDelegateAdaptor *adaptor = [[AWSSRWebSocketDelegateAdaptor alloc]
                                              initWithClientDelegate:delegate callbackQueue:dispatchQueue];
    self.delegate = adaptor;
}

/**
 @param data the data to send over the web socket
 */
- (void)send:(NSData *)data {
    AWSDDLogVerbose(@"Web socket %@ sends %@", self.webSocket, data);
    [self.webSocket send:data];
}

- (void)connect {
    AWSDDLogDebug(@"Web socket %@ is trying to open", self.webSocket);
    [self.webSocket open];
}

- (void)disconnect {
    [self.webSocket close];
}

@end

