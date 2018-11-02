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

typedef NS_ENUM(NSInteger, AWSIoTMQTTQoS) {
    AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce = 0,
    AWSIoTMQTTQoSMessageDeliveryAttemptedAtLeastOnce = 1
};

typedef void(^AWSIoTMQTTNewMessageBlock)(NSData *data);
typedef void(^AWSIoTMQTTExtendedNewMessageBlock)(NSObject *mqttClient, NSString *topic, NSData *data);
typedef void(^AWSIoTMQTTAckBlock)(void);

NS_ASSUME_NONNULL_END
