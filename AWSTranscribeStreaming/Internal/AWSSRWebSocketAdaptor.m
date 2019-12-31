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

@interface AWSSRWebSocketAdaptor ()

@property(nonatomic, strong) AWSSRWebSocket* webSocket;

@end

@implementation AWSSRWebSocketAdaptor

/**
 Initializes the adaptor with a url request

 @param urlRequest  the url request you are invoking the web socket with
 
 */
- (instancetype)initWithURLRequest:(NSURLRequest *)urlRequest {
    AWSDDLogVerbose(@"Initializing adaptor with url request %@", urlRequest);
    if (self = [super init]) {
        _webSocket = [[AWSSRWebSocket alloc] initWithURLRequest:urlRequest];

    }
    return self;
}

/**
 Web socket protocol implementations

 @param message the message
*/
- (void)send:(id)message {
    if ( ![message isKindOfClass:[NSData class]]) {
        AWSDDLogVerbose(@"Web socket %@ sends %@", _webSocket, message);
    }   
    [self.webSocket send:message];
}

- (void)connect {
    AWSDDLogDebug(@"webSocket %@ is created and opened", _webSocket);
    [self.webSocket open];
}


- (void)disconnect {
    [self.webSocket close];
}

// @optional method

-(void)setDelegateDispatchQueue:(dispatch_queue_t)dispatchQueue
                                  delegate:(AWSSRWebSocketDelegateAdaptor*) delegate {
    [self.webSocket setDelegateDispatchQueue:dispatchQueue];
    [self.webSocket setDelegate:delegate];
}


@end

