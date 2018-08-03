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
#import "AWSMQTTMessage.h"

typedef enum {
    AWSMQTTEncoderEventReady,
    AWSMQTTEncoderEventErrorOccurred
} AWSMQTTEncoderEvent;

typedef enum {
    AWSMQTTEncoderStatusInitializing,
    AWSMQTTEncoderStatusReady,
    AWSMQTTEncoderStatusSending,
    AWSMQTTEncoderStatusEndEncountered,
    AWSMQTTEncoderStatusError
} AWSMQTTEncoderStatus;


@class AWSMQTTEncoder;

@protocol AWSMQTTEncoderDelegate

- (void)encoder:(AWSMQTTEncoder*)sender handleEvent:(AWSMQTTEncoderEvent)eventCode;

@end

@interface AWSMQTTEncoder : NSObject <NSStreamDelegate> 

@property (weak) id<AWSMQTTEncoderDelegate> delegate;
@property (assign) AWSMQTTEncoderStatus status;

- (id)initWithStream:(NSOutputStream*)aStream;

- (void)encodeMessage:(AWSMQTTMessage*)msg;
- (void)open;
- (void)close;

@end


