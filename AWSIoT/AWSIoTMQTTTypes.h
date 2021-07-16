//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

@class AWSIoTMessage;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, AWSIoTMQTTStatus) {
    AWSIoTMQTTStatusUnknown,
    AWSIoTMQTTStatusConnecting,
    AWSIoTMQTTStatusConnected,
    AWSIoTMQTTStatusDisconnected,
    AWSIoTMQTTStatusConnectionRefused,
    AWSIoTMQTTStatusConnectionError,
    AWSIoTMQTTStatusProtocolError
};

typedef NS_ENUM(NSInteger, AWSIoTMQTTMessageType) {
    AWSIoTMQTTMessageTypeConnect = 1,
    AWSIoTMQTTMessageTypeConnack = 2,
    AWSIoTMQTTMessageTypePublish = 3,
    AWSIoTMQTTMessageTypePuback = 4,
    AWSIoTMQTTMessageTypePubrec = 5,
    AWSIoTMQTTMessageTypePubrel = 6,
    AWSIoTMQTTMessageTypePubcomp = 7,
    AWSIoTMQTTMessageTypeSubscribe = 8,
    AWSIoTMQTTMessageTypeSuback = 9,
    AWSIoTMQTTMessageTypeUnsubscribe = 10,
    AWSIoTMQTTMessageTypeUnsuback = 11,
    AWSIoTMQTTMessageTypePingreq = 12,
    AWSIoTMQTTMessageTypePingresp = 13,
    AWSIoTMQTTMessageTypeDisconnect = 14
};

typedef NS_ENUM(NSInteger, AWSIoTMQTTQoS) {
    AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce = 0,
    AWSIoTMQTTQoSMessageDeliveryAttemptedAtLeastOnce = 1,
    AWSIoTMQTTQoSMessageDeliveryAttemptedExactlyOnce = 2
};

typedef void(^AWSIoTMQTTNewMessageBlock)(NSData *data);
typedef void(^AWSIoTMQTTExtendedNewMessageBlock)(NSObject *mqttClient, NSString *topic, NSData *data);
typedef void(^AWSIoTMQTTFullMessageBlock)(NSString *topic, AWSIoTMessage *message);
typedef void(^AWSIoTMQTTAckBlock)(void);

NS_ASSUME_NONNULL_END
