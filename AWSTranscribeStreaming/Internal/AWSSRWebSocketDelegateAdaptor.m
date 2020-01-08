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

#import <AWSCore/AWSCore.h>
#import "AWSSRWebSocketDelegateAdaptor.h"
#import "AWSTranscribeStreamingEventDecoder.h"
#import "AWSTranscribeStreamingClientDelegate.h"
#import "AWSTranscribeStreamingWebSocketProvider.h"
#import "AWSSRWebSocketAdaptor.h"
#import "AWSSRWebSocket+TranscribeStreaming.h"

@interface AWSSRWebSocketDelegateAdaptor ()

@property (nonatomic, weak, readwrite) id<AWSTranscribeStreamingClientDelegate> clientDelegate;
@property (nonatomic, weak, readwrite) dispatch_queue_t callbackQueue;

@end

@implementation AWSSRWebSocketDelegateAdaptor

/**
 Initializes the adaptor with a client delegate
 
 @param clientDelegate the client delegate that will be invoked when the underlying AWSSRWebSocket delegate
 messages are received
 */
- (instancetype)initWithClientDelegate:(id<AWSTranscribeStreamingClientDelegate>)clientDelegate
                         callbackQueue:(dispatch_queue_t)callbackQueue {
    AWSDDLogVerbose(@"Initializing adaptor with client delegate %@", clientDelegate);
    if (self = [super init]) {
        _clientDelegate = clientDelegate;
        _callbackQueue = callbackQueue;
    }
    return self;
}

#pragma mark - Optional protocol methods to fulfill Socket Rocket protocol
/**
 @param webSocket the web socket receiving the message
 @param data the data received
 */
- (void)webSocket:(AWSSRWebSocket *)webSocket didReceiveMessage:(NSData *)data {
    
    AWSDDLogVerbose(@"Web socket %@ didReceiveMessage", webSocket);
    NSError *decodingError;
    AWSTranscribeStreamingTranscriptResultStream *result = [AWSTranscribeStreamingEventDecoder decodeEvent:(NSData *)data
                                                                                             decodingError:&decodingError];
    
    dispatch_async(self.callbackQueue, ^(void){
        [self.clientDelegate didReceiveEvent:result
                               decodingError:decodingError];
    });
}

/**
 Converts the AWSSR ready state to a AWSTranscribeStreamingClientDelegateConnectionStatus and invokes the client
 delegate `connectionStatusDidChange` callback
 @param webSocket the web socket that opened
 */
- (void)webSocketDidOpen:(AWSSRWebSocket *)webSocket {
    AWSDDLogVerbose(@"Web socket %@ opened", webSocket);
    if (![self.clientDelegate respondsToSelector:@selector(connectionStatusDidChange:withError:)]) {
        return;
    }
    
    NSInteger status = AWSTranscribeStreamingClientConnectionStatusConnected;
    dispatch_async(self.callbackQueue, ^(void){
        [self.clientDelegate connectionStatusDidChange:status withError:nil];
    });
}

/**
 The websocket failed due to an error
 @param webSocket the web socket that failed
 @param error the error causing the failure
 */
- (void)webSocket:(AWSSRWebSocket *)webSocket didFailWithError:(NSError *)error {
    AWSDDLogVerbose(@"Web socket %@ didFailWithError: %@", webSocket, error);
    if (![self.clientDelegate respondsToSelector:@selector(connectionStatusDidChange:withError:)]) {
        return;
    }
    
    NSInteger status = AWSTranscribeStreamingClientConnectionStatusUnknown;
    switch (webSocket.readyState) {
        case AWSSR_CONNECTING:
            status = AWSTranscribeStreamingClientConnectionStatusConnecting;
            break;
        case AWSSR_OPEN:
            status = AWSTranscribeStreamingClientConnectionStatusConnected;
            break;
        case AWSSR_CLOSING:
            status = AWSTranscribeStreamingClientConnectionStatusClosing;
            break;
        case AWSSR_CLOSED:
            status = AWSTranscribeStreamingClientConnectionStatusClosed;
            break;
    }
    
    dispatch_async(self.callbackQueue, ^(void){
        [self.clientDelegate connectionStatusDidChange:status withError:error];
    });
}

- (void)webSocket:(AWSSRWebSocket *)webSocket
 didCloseWithCode:(NSInteger)code
           reason:(NSString *)reason
         wasClean:(BOOL)wasClean {
    AWSDDLogVerbose(@"Web socket %@ didCloseWithCode: %ld (wasClean: %d, reason: %@)", webSocket, (long)code, wasClean, reason);
    if (![self.clientDelegate respondsToSelector:@selector(connectionStatusDidChange:withError:)]) {
        return;
    }
    
    NSInteger status = AWSTranscribeStreamingClientConnectionStatusClosed;
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
    
    dispatch_async(self.callbackQueue, ^(void){
        [self.clientDelegate connectionStatusDidChange:status withError:error];
    });
}

- (void)webSocket:(AWSSRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload {
    // Part of wss protocol, ignore
    AWSDDLogVerbose(@"%@ received pong %@", webSocket, pongPayload);
}
@end
