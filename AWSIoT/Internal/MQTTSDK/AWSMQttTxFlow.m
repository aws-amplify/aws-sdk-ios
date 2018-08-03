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

#import "AWSMQttTxFlow.h"

@implementation AWSMQttTxFlow

+ (id)flowWithMsg:(AWSMQTTMessage*)msg
         deadline:(unsigned int)deadline {
   return [[AWSMQttTxFlow alloc] initWithMsg:msg deadline:deadline];
}

- (id)initWithMsg:(AWSMQTTMessage*)aMsg
         deadline:(unsigned int)aDeadline {
   _msg = aMsg;
   _deadline = aDeadline;
   return self;
}

@end
