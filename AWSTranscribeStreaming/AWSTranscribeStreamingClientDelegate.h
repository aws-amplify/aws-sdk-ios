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
#import "AWSTranscribeStreamingModel.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString *const AWSTranscribeStreamingClientErrorDomain;

typedef NS_ENUM(NSInteger, AWSTranscribeStreamingClientErrorCode) {
    AWSTranscribeStreamingClientErrorCodeEventSerializationError,
    AWSTranscribeStreamingClientErrorCodeInvalidMessagePrelude,
    AWSTranscribeStreamingClientErrorCodeInvalidMessageLengthHeader,
    AWSTranscribeStreamingClientErrorCodeWebSocketProtocolError,
    AWSTranscribeStreamingClientErrorCodeWebSocketCouldNotInitialize,
    AWSTranscribeStreamingClientErrorCodeWebSocketClosedUnexpectedly,
    AWSTranscribeStreamingClientErrorCodeUnknown
};

typedef NS_ENUM(NSInteger, AWSTranscribeStreamingClientConnectionStatus) {
    AWSTranscribeStreamingClientConnectionStatusConnecting,
    AWSTranscribeStreamingClientConnectionStatusConnected,
    AWSTranscribeStreamingClientConnectionStatusClosing,
    AWSTranscribeStreamingClientConnectionStatusClosed,
    AWSTranscribeStreamingClientConnectionStatusUnknown
};

@protocol AWSTranscribeStreamingClientDelegate <NSObject>

/**
 Invoked when the underlying web socket's connection status changes. If there is an error associated with the
 status change, the error will be included in the callback.
 
 Any error will have the following structure:
 - domain will be `AWSTranscribeStreamingClientErrorDomain`
 - code will be `AWSTranscribeStreamingClientErrorCode`
 - `userInfo` dictionary may be populated with the keys populated from
    `-[AWSSRWebSocketDelegate webSocket:didCloseWithCode:reason:wasClean:]`:
    - `NSLocalizedFailureReasonErrorKey`
    - `AWSSRStatusCode`
    - `AWSSRStatusReason`
    - `AWSSRWasClean`
 
 @param connectionStatus the web socket's new connection status
 @param error an optional error associated with the status change
 */
- (void)connectionStatusDidChange:(AWSTranscribeStreamingClientConnectionStatus)connectionStatus
                        withError:(nullable NSError *)error;

/**
 Invoked when the underlying web socket receives a Transcription event. The payload of the event may represent
 an error condition that would not be reported by the error callbacks. See
 `AWSTranscribeStreamingTranscriptResultStream` for details.

 @param event the event
 @param decodingError an optional error that occurred attempting to decode the event
 */
- (void)didReceiveEvent:(nullable AWSTranscribeStreamingTranscriptResultStream *)event
          decodingError:(nullable NSError *)decodingError;

@end

NS_ASSUME_NONNULL_END
