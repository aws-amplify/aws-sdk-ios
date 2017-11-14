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

#import <Foundation/Foundation.h>
#import "MQTTMessage.h"

typedef enum {
    MQTTEncoderEventReady,
    MQTTEncoderEventErrorOccurred
} MQTTEncoderEvent;

typedef enum {
    MQTTEncoderStatusInitializing,
    MQTTEncoderStatusReady,
    MQTTEncoderStatusSending,
    MQTTEncoderStatusEndEncountered,
    MQTTEncoderStatusError
} MQTTEncoderStatus;


@class MQTTEncoder;

@protocol MQTTEncoderDelegate

- (void)encoder:(MQTTEncoder*)sender handleEvent:(MQTTEncoderEvent)eventCode;

@end

@interface MQTTEncoder : NSObject <NSStreamDelegate> 

@property (weak) id<MQTTEncoderDelegate> delegate;
@property (assign) MQTTEncoderStatus status;

- (id)initWithStream:(NSOutputStream*)aStream
             runLoop:(NSRunLoop*)aRunLoop
         runLoopMode:(NSString*)aMode;

- (void)encodeMessage:(MQTTMessage*)msg;
- (void)open;
- (void)close;

@end


