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
#import "AWSMQTTEncoder.h"

@interface AWSMQTTEncoder () {
    NSMutableData*  buffer;
    NSInteger       byteIndex;
}

@property (nonatomic, strong) dispatch_queue_t encodeQueue;
@property (nonatomic, strong) NSOutputStream* stream;
@end

@implementation AWSMQTTEncoder

- (id)initWithStream:(NSOutputStream*)aStream
{
    _status = AWSMQTTEncoderStatusInitializing;
    self.stream = aStream;
    [self.stream setDelegate:self];
    self.encodeQueue = dispatch_queue_create("com.amazon.aws.iot.encoder-queue", DISPATCH_QUEUE_SERIAL);
    return self;
}

- (void)open {
    AWSDDLogDebug(@"opening encoder stream.");
    [self.stream setDelegate:self];
    [self.stream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [self.stream open];
}

- (void)close {
    AWSDDLogDebug(@"closing encoder stream.");
    [self.stream close];
    [self.stream setDelegate:nil];
    self.stream = nil;
}

//This is executed in the runLoop.
- (void)stream:(NSStream*)sender handleEvent:(NSStreamEvent)eventCode {
    if(self.stream == nil)
        return;

    AWSDDLogVerbose(@"%s [Line %d] EventCode:%lu, Thread: %@", __PRETTY_FUNCTION__, __LINE__, (unsigned long)eventCode, [NSThread currentThread]);
    switch (eventCode) {
        case NSStreamEventOpenCompleted:
            break;
        case NSStreamEventHasSpaceAvailable:
            AWSDDLogVerbose(@"MQTTEncoderStatus = %d", _status);
            if (_status == AWSMQTTEncoderStatusInitializing) {
                _status = AWSMQTTEncoderStatusReady;
                [_delegate encoder:self handleEvent:AWSMQTTEncoderEventReady];
            }
            else if (_status == AWSMQTTEncoderStatusReady) {
                [_delegate encoder:self handleEvent:AWSMQTTEncoderEventReady];
            }
            else if (_status == AWSMQTTEncoderStatusSending) {
                dispatch_assert_queue_not(self.encodeQueue);
                dispatch_sync(self.encodeQueue, ^{
                    [self writeBytes];
                });
            }
            break;
        case NSStreamEventErrorOccurred:
        case NSStreamEventEndEncountered:
            if (_status != AWSMQTTEncoderStatusError) {
                _status = AWSMQTTEncoderStatusError;
                [_delegate encoder:self handleEvent:AWSMQTTEncoderEventErrorOccurred];
            }
            break;
        default:
            AWSDDLogDebug(@"Oops, event code not handled: 0x%02lx", (unsigned long)eventCode);
            break;
    }
}

- (void)encodeMessage:(AWSMQTTMessage*)msg {
    dispatch_assert_queue_not(self.encodeQueue);
    dispatch_sync(self.encodeQueue, ^{
        [self encodeWhenReady:msg];
    });
}

# pragma mark - private/serial functions -

- (void)encodeWhenReady:(AWSMQTTMessage*)msg {
    dispatch_assert_queue(self.encodeQueue);
    UInt8 header;
    NSInteger n, length;

    if (_status != AWSMQTTEncoderStatusReady) {
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

    n = [self.stream write:[buffer bytes] maxLength:[buffer length]];
    if (n == -1) {
        _status = AWSMQTTEncoderStatusError;
        [_delegate encoder:self handleEvent:AWSMQTTEncoderEventErrorOccurred];
    }
    else if (n < [buffer length]) {
        byteIndex += n;
        _status = AWSMQTTEncoderStatusSending;
    }
    else {
        buffer = NULL;
        // XXX [delegate encoder:self handleEvent:MQTTEncoderEventReady];
    }
}

- (void)writeBytes {
    dispatch_assert_queue(self.encodeQueue);
    UInt8* ptr;
    NSInteger n, length;

    ptr = (UInt8*) [buffer bytes] + byteIndex;
    // Number of bytes pending for transfer
    length = [buffer length] - byteIndex;
    n = [self.stream write:ptr maxLength:length];
    if (n == -1) {
        _status = AWSMQTTEncoderStatusError;
        [_delegate encoder:self handleEvent:AWSMQTTEncoderEventErrorOccurred];
    }
    else if (n < length) {
        byteIndex += n;
    }
    else {
        buffer = NULL;
        byteIndex = 0;
        _status = AWSMQTTEncoderStatusReady;
    }
}

@end
