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

#import "AWSCocoaLumberjack.h"
#import "MQTTEncoder.h"

@interface MQTTEncoder () {
    NSOutputStream* stream;
    NSRunLoop*      runLoop;
    NSString*       runLoopMode;
    NSMutableData*  buffer;
    NSInteger       byteIndex;
}

@property (nonatomic, strong) dispatch_semaphore_t encodeSemaphore;

@end

@implementation MQTTEncoder

- (id)initWithStream:(NSOutputStream*)aStream
             runLoop:(NSRunLoop*)aRunLoop
         runLoopMode:(NSString*)aMode {
    _status = MQTTEncoderStatusInitializing;
    stream = aStream;
    [stream setDelegate:self];
    runLoop = aRunLoop;
    runLoopMode = aMode;
    _encodeSemaphore = dispatch_semaphore_create(1);
    return self;
}

- (void)open {
    AWSDDLogDebug(@"opening encoder stream.");
    [stream setDelegate:self];
    [stream scheduleInRunLoop:runLoop forMode:runLoopMode];
    [stream open];
}

- (void)close {
    AWSDDLogDebug(@"closing encoder stream.");
    [stream close];
    [stream setDelegate:nil];
    [stream removeFromRunLoop:runLoop forMode:runLoopMode];
    stream = nil;
}

- (void)stream:(NSStream*)sender handleEvent:(NSStreamEvent)eventCode {
    if(stream == nil)
        return;
//
// This assertion no longer applies when WebSockets are used as the event
// can come from the NSOutputStream inside of AWSIoTWebSocketOutputStream
// rather than the AWSIoTWebSocketOutputStream instance used for output.
// It is left here for reference purposes only.
//
//   assert(sender == stream);
//
    AWSDDLogVerbose(@"%s [Line %d] EventCode:%lu, Thread: %@", __PRETTY_FUNCTION__, __LINE__, (unsigned long)eventCode, [NSThread currentThread]);
    switch (eventCode) {
        case NSStreamEventOpenCompleted:
            break;
        case NSStreamEventHasSpaceAvailable:
            AWSDDLogDebug(@"MQTTEncoderStatus = %d", _status);
            if (_status == MQTTEncoderStatusInitializing) {
                _status = MQTTEncoderStatusReady;
                [_delegate encoder:self handleEvent:MQTTEncoderEventReady];
            }
            else if (_status == MQTTEncoderStatusReady) {
                [_delegate encoder:self handleEvent:MQTTEncoderEventReady];
            }
            else if (_status == MQTTEncoderStatusSending) {
                UInt8* ptr;
                NSInteger n, length;
                
                ptr = (UInt8*) [buffer bytes] + byteIndex;
                // Number of bytes pending for transfer
                length = [buffer length] - byteIndex;
                n = [stream write:ptr maxLength:length];
                if (n == -1) {
                    _status = MQTTEncoderStatusError;
                    [_delegate encoder:self handleEvent:MQTTEncoderEventErrorOccurred];
                }
                else if (n < length) {
                    byteIndex += n;
                }
                else {
                    buffer = NULL;
                    byteIndex = 0;
                    _status = MQTTEncoderStatusReady;
                }
            }
            break;
        case NSStreamEventErrorOccurred:
        case NSStreamEventEndEncountered:
            if (_status != MQTTEncoderStatusError) {
                _status = MQTTEncoderStatusError;
                [_delegate encoder:self handleEvent:MQTTEncoderEventErrorOccurred];
            }
            break;
        default:
            AWSDDLogDebug(@"Oops, event code not handled: 0x%02lx", (unsigned long)eventCode);
            break;
    }
}

- (void)encodeMessage:(MQTTMessage*)msg {
    AWSDDLogVerbose(@"%s [Line %d], Thread:%@", __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread]);

    //Adding a mutex to prevent buffer from being modified by multiple threads
    AWSDDLogDebug(@"***** waiting on encodeSemaphore *****");
    dispatch_semaphore_wait(self.encodeSemaphore, DISPATCH_TIME_FOREVER);
    AWSDDLogDebug(@"***** passed encodeSempahore. *****");
    UInt8 header;
    NSInteger n, length;
    
    if (_status != MQTTEncoderStatusReady) {
        AWSDDLogInfo(@"Encoder not ready");
        return;
    }
    
    assert (buffer == NULL);
    assert (byteIndex == 0);
    
    buffer = [[NSMutableData alloc] init];
    
    // encode fixed header
    header = [msg type] << 4;
    if ([msg isDuplicate]) {
        header |= 0x08;
    }
    header |= [msg qos] << 1;
    if ([msg retainFlag]) {
        header |= 0x01;
    }
    [buffer appendBytes:&header length:1];
    
    // encode remaining length
    length = [[msg data] length];
    do {
        UInt8 digit = length % 128;
        length /= 128;
        if (length > 0) {
            digit |= 0x80;
        }
        [buffer appendBytes:&digit length:1];
    }
    while (length > 0);
    
    // encode message data
    if ([msg data] != NULL) {
        [buffer appendData:[msg data]];
    }
    
    n = [stream write:[buffer bytes] maxLength:[buffer length]];
    if (n == -1) {
        _status = MQTTEncoderStatusError;
        [_delegate encoder:self handleEvent:MQTTEncoderEventErrorOccurred];
    }
    else if (n < [buffer length]) {
        byteIndex += n;
        _status = MQTTEncoderStatusSending;
    }
    else {
        buffer = NULL;
        // XXX [delegate encoder:self handleEvent:MQTTEncoderEventReady];
    }
    AWSDDLogDebug(@"***** signaling encodeSemaphore *****");
    dispatch_semaphore_signal(self.encodeSemaphore);
}

@end
