//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSIoTMQTTTypes.h"

NS_ASSUME_NONNULL_BEGIN

@interface AWSIoTMessage : NSObject

@property (assign) AWSIoTMQTTMessageType type;
@property (assign) AWSIoTMQTTQoS qos;
@property (assign) BOOL retainFlag;
@property (assign) BOOL isDuplicate;
@property (nonatomic, copy) NSData * rawData;
@property (nonatomic, copy) NSData * messageData;

@property (nonatomic, copy) NSString * topic;
@property (nonatomic, copy) NSString * message;

@end

NS_ASSUME_NONNULL_END
