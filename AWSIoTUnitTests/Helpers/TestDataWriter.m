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

#import "TestDataWriter.h"

@implementation TestDataWriter {
    int bufferSize;
    NSUInteger byteIndex;
    NSData *data;
    NSOutputStream *stream;
    void (^onComplete)(void);
}

- (instancetype) initWithOutputStream:(NSOutputStream *)outputStream
                          dataToWrite:(NSArray<NSData *> *)dataArray
                           onComplete:(void (^)(void))block {
    if (self = [super init]) {
        stream = outputStream;

        NSMutableData *mutableData = [[NSMutableData alloc] init];
        for (NSData *data in dataArray) {
            [mutableData appendData:data];
        }
        data = [[NSData alloc] initWithData:mutableData];

        onComplete = block;

        byteIndex = 0;
        bufferSize = 1024;
    }
    return self;
}

- (void) open {
    [stream setDelegate:self];
    [stream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [stream open];

    while (!NSThread.currentThread.isCancelled) {
        NSDate *deadline = [NSDate dateWithTimeIntervalSinceNow:1.0];
        [NSRunLoop.currentRunLoop runUntilDate:deadline];
    }
}

- (void)close {
    [stream setDelegate:nil];
    [stream close];
    stream = nil;
}

#pragma mark - NSStreamDelegate

- (void) stream:(NSStream *)stream handleEvent:(NSStreamEvent)eventCode {
    if (!stream) {
        return;
    }

    switch (eventCode) {
        case NSStreamEventHasSpaceAvailable: {
            NSOutputStream *outputStream = (NSOutputStream *)stream;

            uint8_t *readBytes = (uint8_t *)data.bytes;

            readBytes += byteIndex;

            NSUInteger dataLength = data.length;
            NSUInteger remainingBytes = dataLength - byteIndex;

            if (remainingBytes == 0) {
                onComplete();
                return;
            }

            NSUInteger len = remainingBytes >= bufferSize ? bufferSize : remainingBytes;
            uint8_t buffer[len];

            [data getBytes:buffer range:NSMakeRange(byteIndex, len)];

            len = [outputStream write:(const uint8_t *)buffer maxLength:len];

            byteIndex += len;
        }
        default:
            break;
    }
}

@end
