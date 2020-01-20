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

#import <XCTest/XCTest.h>
#import "AWSPinpoint.h"
#import "AWSTestUtility.h"

FOUNDATION_EXPORT int const DEFAULT_BATCH_LIMIT;
FOUNDATION_EXPORT int const AWSPinpointClientByteLimitDefault;
FOUNDATION_EXPORT int const AWSPinpointClientBatchRecordByteLimitDefault;
FOUNDATION_EXPORT NSString *const AWSPinpointSessionKey;

@interface AWSPinpointEventRecorderTestBase : XCTestCase

@property (nonatomic, strong) AWSPinpoint *pinpointIAD;
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@property (nonatomic, strong) NSString *appIdIAD;
@property (nonatomic, strong) AWSPinpointConfiguration *configIAD;

+(AWSPinpoint *) initializePinpointWithConfig:(AWSPinpointConfiguration *)config;

- (void) removeAllEventsAndVerify:(AWSPinpoint *)pinpoint;

@end
