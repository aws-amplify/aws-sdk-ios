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
#import "AWSMQTTSession.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^OnMessageSessionDelegateBlock)(AWSMQTTSession*, NSData*, NSString*);
typedef void (^OnEventSessionDelegateBlock)(AWSMQTTSession*, AWSMQTTSessionEvent);
typedef void (^OnAckSessionDelegateBlock)(AWSMQTTSession*, UInt16);

@interface TestMQTTSessionDelegate : NSObject<AWSMQTTSessionDelegate>

- (instancetype)initWithOnMessageBlock:(nullable OnMessageSessionDelegateBlock)onMessageBlock
                               onEvent:(nullable OnEventSessionDelegateBlock)onEventBlock
                                 onAck:(nullable OnAckSessionDelegateBlock)onAckBlock;

@end

NS_ASSUME_NONNULL_END
