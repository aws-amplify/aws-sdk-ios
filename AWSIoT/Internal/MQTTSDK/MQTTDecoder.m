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
#import "MQTTDecoder.h"

@interface MQTTDecoder() {
        NSInputStream*  stream;
        NSRunLoop*      runLoop;
        NSString*       runLoopMode;
        UInt8           header;
        UInt32          length;
        UInt32          lengthMultiplier;
        NSMutableData*  dataBuffer;
    
}

@end

@implementation MQTTDecoder

- (id)initWithStream:(NSInputStream*)aStream
             runLoop:(NSRunLoop*)aRunLoop
         runLoopMode:(NSString*)aMode {
    _status = MQTTDecoderStatusInitializing;
    stream = aStream;
    [stream setDelegate:self];
    runLoop = aRunLoop;
    runLoopMode = aMode;
    return self;
}

- (void)open {
    AWSDDLogDebug(@"opening decoder stream.");
    [stream setDelegate:self];
    runLoop = [NSRunLoop currentRunLoop];
    [stream scheduleInRunLoop:runLoop forMode:NSDefaultRunLoopMode];
    [stream open];
}

- (void)close {
    AWSDDLogDebug(@"closing decoder stream.");
    [stream setDelegate:nil];
    [stream close];
    [stream removeFromRunLoop:runLoop forMode:NSDefaultRunLoopMode];
    stream = nil;
}

- (void)stream:(NSStream*)sender handleEvent:(NSStreamEvent)eventCode {
    AWSDDLogVerbose(@"%s [Line %d] EventCode:%lu, stream: %@, Thread: %@", __PRETTY_FUNCTION__, __LINE__, (unsigned long)eventCode, sender, [NSThread currentThread]);

    if(stream == nil)
        return;
    switch (eventCode) {
        case NSStreamEventOpenCompleted:
            _status = MQTTDecoderStatusDecodingHeader;
            break;
        case NSStreamEventHasBytesAvailable:
            if (_status == MQTTDecoderStatusDecodingHeader) {
                NSInteger n = [stream read:&header maxLength:1];
                if (n == -1) {
                    _status = MQTTDecoderStatusConnectionError;
                    [_delegate decoder:self handleEvent:MQTTDecoderEventConnectionError];
                }
                else if (n == 1) {
                    length = 0;
                    lengthMultiplier = 1;
                    _status = MQTTDecoderStatusDecodingLength;
                }
            }
            while (_status == MQTTDecoderStatusDecodingLength) {
                UInt8 digit;
                NSInteger n = [stream read:&digit maxLength:1];
                if (n == -1) {
                    _status = MQTTDecoderStatusConnectionError;
                    [_delegate decoder:self handleEvent:MQTTDecoderEventConnectionError];
                    break;
                }
                else if (n == 0) {
                    break;
                }
                length += (digit & 0x7f) * lengthMultiplier;
                if ((digit & 0x80) == 0x00) {
                    dataBuffer = [NSMutableData dataWithCapacity:length];
                    _status = MQTTDecoderStatusDecodingData;
                }
                else {
                    lengthMultiplier *= 128;
                }
            }
            if (_status == MQTTDecoderStatusDecodingData) {
                if (length > 0) {
                    NSInteger n, toRead;
                    UInt8 buffer[768];
                    toRead = length - [dataBuffer length];
                    if (toRead > sizeof buffer) {
                        toRead = sizeof buffer;
                    }
                    n = [stream read:buffer maxLength:toRead];
                    if (n == -1) {
                        _status = MQTTDecoderStatusConnectionError;
                        [_delegate decoder:self handleEvent:MQTTDecoderEventConnectionError];
                    }
                    else {
                        [dataBuffer appendBytes:buffer length:n];
                    }
                }
                if ([dataBuffer length] == length) {
                    MQTTMessage* msg;
                    UInt8 type, qos;
                    BOOL isDuplicate, retainFlag;
                    type = (header >> 4) & 0x0f;
                    isDuplicate = NO;
                    if ((header & 0x08) == 0x08) {
                        isDuplicate = YES;
                    }
                    // XXX qos > 2
                    qos = (header >> 1) & 0x03;
                    retainFlag = NO;
                    if ((header & 0x01) == 0x01) {
                        retainFlag = YES;
                    }
                    msg = [[MQTTMessage alloc] initWithType:type
                                                        qos:qos
                                                 retainFlag:retainFlag
                                                    dupFlag:isDuplicate
                                                       data:dataBuffer];
                    [_delegate decoder:self newMessage:msg];
                    dataBuffer = nil;
                    _status = MQTTDecoderStatusDecodingHeader;
                }
            }
            break;
        case NSStreamEventEndEncountered:
            _status = MQTTDecoderStatusConnectionClosed;
            [_delegate decoder:self handleEvent:MQTTDecoderEventConnectionClosed];
            break;
        case NSStreamEventErrorOccurred:
            _status = MQTTDecoderStatusConnectionError;
            [_delegate decoder:self handleEvent:MQTTDecoderEventConnectionError];
            break;
        default:
            AWSDDLogDebug(@"unhandled event code");
            break;
    }
}

@end
