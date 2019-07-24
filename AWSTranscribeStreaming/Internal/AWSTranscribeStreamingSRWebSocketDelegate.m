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

#import <AWSCore/AWSCore.h>
#import "AWSSRWebSocketDelegateAdaptor.h"
#import "AWSTranscribeStreamingEventDecoder.h"
#import "AWSTranscribeStreamingClientDelegate.h"

@interface AWSSRWebSocketDelegateAdaptor ()

@property (nonatomic, weak, nullable) id<AWSTranscribeStreamingClientDelegate> clientDelegate;

@end

@implementation AWSSRWebSocketDelegateAdaptor

/**
 Initializes the adaptor with a client delegate

 @param clientDelegate the client delegate that will be invoked when the underlying AWSSRWebSocket delegate
 messages are received
 */
- (instancetype)initWithClientDelegate:(id<AWSTranscribeStreamingClientDelegate>)clientDelegate {
    if (self = [super init]) {
        _clientDelegate = clientDelegate;
    }
    return self;
}

- (instancetype)initWithClientDelegate:(id<AWSTranscribeStreamingClientDelegate>)clientDelegate callbackQueue:(dispatch_queue_t)queue {
    if (self = [super init]) {
        _clientDelegate = clientDelegate;
    }
    return self;
}

/**
 Converts incoming WSS message to a AWSTranscribeStreamingTranscriptResultStream and invokes the client delegate
 `didReceiveEvent` callback

 @param webSocket the web socket receiving the message
 @param message the message
 */
- (void)webSocket:(AWSSRWebSocket *)webSocket didReceiveMessage:(id)message {
    AWSTranscribeStreamingTranscriptResultStream *result = [AWSTranscribeStreamingEventDecoder decodeEvent:(NSData *)message decodingError: NULL];
    [self.clientDelegate didReceiveEvent:result decodingError: NULL];
}

/**
 Converts the AWSSR ready state to a AWSTranscribeStreamingClientDelegateConnectionStatus and invokes the client
 delegate `connectionStatusDidChange` callback

 @param webSocket the web socket that opened
 */
- (void)webSocketDidOpen:(AWSSRWebSocket *)webSocket {
    if (![self.clientDelegate respondsToSelector:@selector(connectionStatusDidChange:withError:)]) {
        return;
    }

    NSInteger status = AWSTranscribeStreamingClientDelegateConnectionStatusConnected;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        [self.clientDelegate connectionStatusDidChange:status withError:nil];
    });
}

/**
 The websocket failed due to an error

 @param webSocket the web socket that failed
 @param error the error causing the failure
 */
- (void)webSocket:(AWSSRWebSocket *)webSocket didFailWithError:(NSError *)error {
    if (![self.clientDelegate respondsToSelector:@selector(connectionStatusDidChange:withError:)]) {
        return;
    }

    NSInteger status = AWSTranscribeStreamingClientDelegateConnectionStatusUnknown;
    switch (webSocket.readyState) {
        case AWSSR_CONNECTING:
            status = AWSTranscribeStreamingClientDelegateConnectionStatusConnecting;
        case AWSSR_OPEN:
            status = AWSTranscribeStreamingClientDelegateConnectionStatusConnected;
        case AWSSR_CLOSING:
            status = AWSTranscribeStreamingClientDelegateConnectionStatusClosing;
        case AWSSR_CLOSED:
            status = AWSTranscribeStreamingClientDelegateConnectionStatusClosed;
        default:
            break;
    }

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        [self.clientDelegate connectionStatusDidChange:status withError:error];
    });
}

- (void)webSocket:(AWSSRWebSocket *)webSocket
 didCloseWithCode:(NSInteger)code
           reason:(NSString *)reason
         wasClean:(BOOL)wasClean {
    if (![self.clientDelegate respondsToSelector:@selector(connectionStatusDidChange:withError:)]) {
        return;
    }
    
    NSInteger status = AWSTranscribeStreamingClientDelegateConnectionStatusClosed;
    NSError *error;
    if (!wasClean) {
        NSInteger errorCode = AWSTranscribeStreamingClientErrorCodeUnknown;
        NSDictionary<NSString *, id> *userInfo = @{
                                                   NSLocalizedFailureReasonErrorKey: reason,
                                                   @"AWSSRStatusCode": @(code),
                                                   @"AWSSRStatusReason": reason,
                                                   @"AWSSRWasClean": @(wasClean)
                                                   };

        switch (code) {
            case AWSSRStatusCodeNormal:
                break;
            case AWSSRStatusCodeGoingAway:
                errorCode = AWSTranscribeStreamingClientErrorCodeWebSocketClosedUnexpectedly;
                break;
            case AWSSRStatusCodeProtocolError:
                errorCode = AWSTranscribeStreamingClientErrorCodeWebSocketProtocolError;
                break;
            case AWSSRStatusCodeUnhandledType:
                errorCode = AWSTranscribeStreamingClientErrorCodeWebSocketClosedUnexpectedly;
                break;
            case AWSSRStatusNoStatusReceived:
                errorCode = AWSTranscribeStreamingClientErrorCodeWebSocketClosedUnexpectedly;
                break;
            case AWSSRStatusCodeInvalidUTF8:
                errorCode = AWSTranscribeStreamingClientErrorCodeWebSocketClosedUnexpectedly;
                break;
            case AWSSRStatusCodePolicyViolated:
                errorCode = AWSTranscribeStreamingClientErrorCodeWebSocketClosedUnexpectedly;
                break;
            case AWSSRStatusCodeMessageTooBig:
                errorCode = AWSTranscribeStreamingClientErrorCodeWebSocketClosedUnexpectedly;
                break;
            default:
                break;
        }

        error = [NSError errorWithDomain:AWSTranscribeStreamingClientErrorDomain
                                    code:errorCode
                                userInfo:userInfo];

    }

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        [self.clientDelegate connectionStatusDidChange:status withError:error];
    });
}

- (void)webSocket:(AWSSRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload {
    // Part of wss protocol, ignore
    AWSDDLogVerbose(@"%@ received pong %@", webSocket, pongPayload);
}

@end
