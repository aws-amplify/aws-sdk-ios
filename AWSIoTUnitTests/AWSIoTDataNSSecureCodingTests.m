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

#import <XCTest/XCTest.h>
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSIoTDataModel.h"

@interface AWSIoTDataNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSIoTDataDeleteThingShadowRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDataDeleteThingShadowResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDataGetRetainedMessageRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDataGetRetainedMessageResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDataGetThingShadowRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDataGetThingShadowResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDataListNamedShadowsForThingRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDataListNamedShadowsForThingResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDataListRetainedMessagesRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDataListRetainedMessagesResponse API_AVAILABLE(ios(11));
- (void) test_AWSIoTDataPublishRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDataRetainedMessageSummary API_AVAILABLE(ios(11));
- (void) test_AWSIoTDataUpdateThingShadowRequest API_AVAILABLE(ios(11));
- (void) test_AWSIoTDataUpdateThingShadowResponse API_AVAILABLE(ios(11));

@end

@implementation AWSIoTDataNSSecureCodingTests

- (void) test_AWSIoTDataDeleteThingShadowRequest {
    [self validateSecureCodingForClass:[AWSIoTDataDeleteThingShadowRequest class]];
}

- (void) test_AWSIoTDataDeleteThingShadowResponse {
    [self validateClassDoesNotSupportSecureCoding:[AWSIoTDataDeleteThingShadowResponse class]];
}

- (void) test_AWSIoTDataGetRetainedMessageRequest {
    [self validateSecureCodingForClass:[AWSIoTDataGetRetainedMessageRequest class]];
}

- (void) test_AWSIoTDataGetRetainedMessageResponse {
    [self validateClassDoesNotSupportSecureCoding:[AWSIoTDataGetRetainedMessageResponse class]];
}

- (void) test_AWSIoTDataGetThingShadowRequest {
    [self validateSecureCodingForClass:[AWSIoTDataGetThingShadowRequest class]];
}

- (void) test_AWSIoTDataGetThingShadowResponse {
    [self validateClassDoesNotSupportSecureCoding:[AWSIoTDataGetThingShadowResponse class]];
}

- (void) test_AWSIoTDataListNamedShadowsForThingRequest {
    [self validateSecureCodingForClass:[AWSIoTDataListNamedShadowsForThingRequest class]];
}

- (void) test_AWSIoTDataListNamedShadowsForThingResponse {
    [self validateSecureCodingForClass:[AWSIoTDataListNamedShadowsForThingResponse class]];
}

- (void) test_AWSIoTDataListRetainedMessagesRequest {
    [self validateSecureCodingForClass:[AWSIoTDataListRetainedMessagesRequest class]];
}

- (void) test_AWSIoTDataListRetainedMessagesResponse {
    [self validateSecureCodingForClass:[AWSIoTDataListRetainedMessagesResponse class]];
}

- (void) test_AWSIoTDataPublishRequest {
    [self validateClassDoesNotSupportSecureCoding:[AWSIoTDataPublishRequest class]];
}

- (void) test_AWSIoTDataRetainedMessageSummary {
    [self validateSecureCodingForClass:[AWSIoTDataRetainedMessageSummary class]];
}

- (void) test_AWSIoTDataUpdateThingShadowRequest {
    [self validateClassDoesNotSupportSecureCoding:[AWSIoTDataUpdateThingShadowRequest class]];
}

- (void) test_AWSIoTDataUpdateThingShadowResponse {
    [self validateClassDoesNotSupportSecureCoding:[AWSIoTDataUpdateThingShadowResponse class]];
}

@end

