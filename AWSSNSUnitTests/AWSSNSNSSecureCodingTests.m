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
#import "AWSSNSModel.h"

@interface AWSSNSNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSSNSAddPermissionInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSCheckIfPhoneNumberIsOptedOutInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSCheckIfPhoneNumberIsOptedOutResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSConfirmSubscriptionInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSConfirmSubscriptionResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSCreateEndpointResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSCreatePlatformApplicationInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSCreatePlatformApplicationResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSCreatePlatformEndpointInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSCreateSMSSandboxPhoneNumberInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSCreateSMSSandboxPhoneNumberResult API_AVAILABLE(ios(11));
- (void) test_AWSSNSCreateTopicInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSCreateTopicResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSDeleteEndpointInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSDeletePlatformApplicationInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSDeleteSMSSandboxPhoneNumberInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSDeleteSMSSandboxPhoneNumberResult API_AVAILABLE(ios(11));
- (void) test_AWSSNSDeleteTopicInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSEndpoint API_AVAILABLE(ios(11));
- (void) test_AWSSNSGetEndpointAttributesInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSGetEndpointAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSGetPlatformApplicationAttributesInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSGetPlatformApplicationAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSGetSMSAttributesInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSGetSMSAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSGetSMSSandboxAccountStatusInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSGetSMSSandboxAccountStatusResult API_AVAILABLE(ios(11));
- (void) test_AWSSNSGetSubscriptionAttributesInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSGetSubscriptionAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSGetTopicAttributesInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSGetTopicAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSListEndpointsByPlatformApplicationInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSListEndpointsByPlatformApplicationResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSListOriginationNumbersRequest API_AVAILABLE(ios(11));
- (void) test_AWSSNSListOriginationNumbersResult API_AVAILABLE(ios(11));
- (void) test_AWSSNSListPhoneNumbersOptedOutInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSListPhoneNumbersOptedOutResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSListPlatformApplicationsInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSListPlatformApplicationsResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSListSMSSandboxPhoneNumbersInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSListSMSSandboxPhoneNumbersResult API_AVAILABLE(ios(11));
- (void) test_AWSSNSListSubscriptionsByTopicInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSListSubscriptionsByTopicResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSListSubscriptionsInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSListSubscriptionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSListTagsForResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSSNSListTagsForResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSListTopicsInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSListTopicsResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSMessageAttributeValue API_AVAILABLE(ios(11));
- (void) test_AWSSNSOptInPhoneNumberInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSOptInPhoneNumberResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSPhoneNumberInformation API_AVAILABLE(ios(11));
- (void) test_AWSSNSPlatformApplication API_AVAILABLE(ios(11));
- (void) test_AWSSNSPublishInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSPublishResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSRemovePermissionInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSSMSSandboxPhoneNumber API_AVAILABLE(ios(11));
- (void) test_AWSSNSSetEndpointAttributesInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSSetPlatformApplicationAttributesInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSSetSMSAttributesInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSSetSMSAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSSetSubscriptionAttributesInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSSetTopicAttributesInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSSubscribeInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSSubscribeResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSSubscription API_AVAILABLE(ios(11));
- (void) test_AWSSNSTag API_AVAILABLE(ios(11));
- (void) test_AWSSNSTagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSSNSTagResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSTopic API_AVAILABLE(ios(11));
- (void) test_AWSSNSUnsubscribeInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSUntagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSSNSUntagResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSSNSVerifySMSSandboxPhoneNumberInput API_AVAILABLE(ios(11));
- (void) test_AWSSNSVerifySMSSandboxPhoneNumberResult API_AVAILABLE(ios(11));

@end

@implementation AWSSNSNSSecureCodingTests

- (void) test_AWSSNSAddPermissionInput {
    [self validateSecureCodingForClass:[AWSSNSAddPermissionInput class]];
}

- (void) test_AWSSNSCheckIfPhoneNumberIsOptedOutInput {
    [self validateSecureCodingForClass:[AWSSNSCheckIfPhoneNumberIsOptedOutInput class]];
}

- (void) test_AWSSNSCheckIfPhoneNumberIsOptedOutResponse {
    [self validateSecureCodingForClass:[AWSSNSCheckIfPhoneNumberIsOptedOutResponse class]];
}

- (void) test_AWSSNSConfirmSubscriptionInput {
    [self validateSecureCodingForClass:[AWSSNSConfirmSubscriptionInput class]];
}

- (void) test_AWSSNSConfirmSubscriptionResponse {
    [self validateSecureCodingForClass:[AWSSNSConfirmSubscriptionResponse class]];
}

- (void) test_AWSSNSCreateEndpointResponse {
    [self validateSecureCodingForClass:[AWSSNSCreateEndpointResponse class]];
}

- (void) test_AWSSNSCreatePlatformApplicationInput {
    [self validateSecureCodingForClass:[AWSSNSCreatePlatformApplicationInput class]];
}

- (void) test_AWSSNSCreatePlatformApplicationResponse {
    [self validateSecureCodingForClass:[AWSSNSCreatePlatformApplicationResponse class]];
}

- (void) test_AWSSNSCreatePlatformEndpointInput {
    [self validateSecureCodingForClass:[AWSSNSCreatePlatformEndpointInput class]];
}

- (void) test_AWSSNSCreateSMSSandboxPhoneNumberInput {
    [self validateSecureCodingForClass:[AWSSNSCreateSMSSandboxPhoneNumberInput class]];
}

- (void) test_AWSSNSCreateSMSSandboxPhoneNumberResult {
    [self validateSecureCodingForClass:[AWSSNSCreateSMSSandboxPhoneNumberResult class]];
}

- (void) test_AWSSNSCreateTopicInput {
    [self validateSecureCodingForClass:[AWSSNSCreateTopicInput class]];
}

- (void) test_AWSSNSCreateTopicResponse {
    [self validateSecureCodingForClass:[AWSSNSCreateTopicResponse class]];
}

- (void) test_AWSSNSDeleteEndpointInput {
    [self validateSecureCodingForClass:[AWSSNSDeleteEndpointInput class]];
}

- (void) test_AWSSNSDeletePlatformApplicationInput {
    [self validateSecureCodingForClass:[AWSSNSDeletePlatformApplicationInput class]];
}

- (void) test_AWSSNSDeleteSMSSandboxPhoneNumberInput {
    [self validateSecureCodingForClass:[AWSSNSDeleteSMSSandboxPhoneNumberInput class]];
}

- (void) test_AWSSNSDeleteSMSSandboxPhoneNumberResult {
    [self validateSecureCodingForClass:[AWSSNSDeleteSMSSandboxPhoneNumberResult class]];
}

- (void) test_AWSSNSDeleteTopicInput {
    [self validateSecureCodingForClass:[AWSSNSDeleteTopicInput class]];
}

- (void) test_AWSSNSEndpoint {
    [self validateSecureCodingForClass:[AWSSNSEndpoint class]];
}

- (void) test_AWSSNSGetEndpointAttributesInput {
    [self validateSecureCodingForClass:[AWSSNSGetEndpointAttributesInput class]];
}

- (void) test_AWSSNSGetEndpointAttributesResponse {
    [self validateSecureCodingForClass:[AWSSNSGetEndpointAttributesResponse class]];
}

- (void) test_AWSSNSGetPlatformApplicationAttributesInput {
    [self validateSecureCodingForClass:[AWSSNSGetPlatformApplicationAttributesInput class]];
}

- (void) test_AWSSNSGetPlatformApplicationAttributesResponse {
    [self validateSecureCodingForClass:[AWSSNSGetPlatformApplicationAttributesResponse class]];
}

- (void) test_AWSSNSGetSMSAttributesInput {
    [self validateSecureCodingForClass:[AWSSNSGetSMSAttributesInput class]];
}

- (void) test_AWSSNSGetSMSAttributesResponse {
    [self validateSecureCodingForClass:[AWSSNSGetSMSAttributesResponse class]];
}

- (void) test_AWSSNSGetSMSSandboxAccountStatusInput {
    [self validateSecureCodingForClass:[AWSSNSGetSMSSandboxAccountStatusInput class]];
}

- (void) test_AWSSNSGetSMSSandboxAccountStatusResult {
    [self validateSecureCodingForClass:[AWSSNSGetSMSSandboxAccountStatusResult class]];
}

- (void) test_AWSSNSGetSubscriptionAttributesInput {
    [self validateSecureCodingForClass:[AWSSNSGetSubscriptionAttributesInput class]];
}

- (void) test_AWSSNSGetSubscriptionAttributesResponse {
    [self validateSecureCodingForClass:[AWSSNSGetSubscriptionAttributesResponse class]];
}

- (void) test_AWSSNSGetTopicAttributesInput {
    [self validateSecureCodingForClass:[AWSSNSGetTopicAttributesInput class]];
}

- (void) test_AWSSNSGetTopicAttributesResponse {
    [self validateSecureCodingForClass:[AWSSNSGetTopicAttributesResponse class]];
}

- (void) test_AWSSNSListEndpointsByPlatformApplicationInput {
    [self validateSecureCodingForClass:[AWSSNSListEndpointsByPlatformApplicationInput class]];
}

- (void) test_AWSSNSListEndpointsByPlatformApplicationResponse {
    [self validateSecureCodingForClass:[AWSSNSListEndpointsByPlatformApplicationResponse class]];
}

- (void) test_AWSSNSListOriginationNumbersRequest {
    [self validateSecureCodingForClass:[AWSSNSListOriginationNumbersRequest class]];
}

- (void) test_AWSSNSListOriginationNumbersResult {
    [self validateSecureCodingForClass:[AWSSNSListOriginationNumbersResult class]];
}

- (void) test_AWSSNSListPhoneNumbersOptedOutInput {
    [self validateSecureCodingForClass:[AWSSNSListPhoneNumbersOptedOutInput class]];
}

- (void) test_AWSSNSListPhoneNumbersOptedOutResponse {
    [self validateSecureCodingForClass:[AWSSNSListPhoneNumbersOptedOutResponse class]];
}

- (void) test_AWSSNSListPlatformApplicationsInput {
    [self validateSecureCodingForClass:[AWSSNSListPlatformApplicationsInput class]];
}

- (void) test_AWSSNSListPlatformApplicationsResponse {
    [self validateSecureCodingForClass:[AWSSNSListPlatformApplicationsResponse class]];
}

- (void) test_AWSSNSListSMSSandboxPhoneNumbersInput {
    [self validateSecureCodingForClass:[AWSSNSListSMSSandboxPhoneNumbersInput class]];
}

- (void) test_AWSSNSListSMSSandboxPhoneNumbersResult {
    [self validateSecureCodingForClass:[AWSSNSListSMSSandboxPhoneNumbersResult class]];
}

- (void) test_AWSSNSListSubscriptionsByTopicInput {
    [self validateSecureCodingForClass:[AWSSNSListSubscriptionsByTopicInput class]];
}

- (void) test_AWSSNSListSubscriptionsByTopicResponse {
    [self validateSecureCodingForClass:[AWSSNSListSubscriptionsByTopicResponse class]];
}

- (void) test_AWSSNSListSubscriptionsInput {
    [self validateSecureCodingForClass:[AWSSNSListSubscriptionsInput class]];
}

- (void) test_AWSSNSListSubscriptionsResponse {
    [self validateSecureCodingForClass:[AWSSNSListSubscriptionsResponse class]];
}

- (void) test_AWSSNSListTagsForResourceRequest {
    [self validateSecureCodingForClass:[AWSSNSListTagsForResourceRequest class]];
}

- (void) test_AWSSNSListTagsForResourceResponse {
    [self validateSecureCodingForClass:[AWSSNSListTagsForResourceResponse class]];
}

- (void) test_AWSSNSListTopicsInput {
    [self validateSecureCodingForClass:[AWSSNSListTopicsInput class]];
}

- (void) test_AWSSNSListTopicsResponse {
    [self validateSecureCodingForClass:[AWSSNSListTopicsResponse class]];
}

- (void) test_AWSSNSMessageAttributeValue {
    [self validateSecureCodingForClass:[AWSSNSMessageAttributeValue class]];
}

- (void) test_AWSSNSOptInPhoneNumberInput {
    [self validateSecureCodingForClass:[AWSSNSOptInPhoneNumberInput class]];
}

- (void) test_AWSSNSOptInPhoneNumberResponse {
    [self validateSecureCodingForClass:[AWSSNSOptInPhoneNumberResponse class]];
}

- (void) test_AWSSNSPhoneNumberInformation {
    [self validateSecureCodingForClass:[AWSSNSPhoneNumberInformation class]];
}

- (void) test_AWSSNSPlatformApplication {
    [self validateSecureCodingForClass:[AWSSNSPlatformApplication class]];
}

- (void) test_AWSSNSPublishInput {
    [self validateSecureCodingForClass:[AWSSNSPublishInput class]];
}

- (void) test_AWSSNSPublishResponse {
    [self validateSecureCodingForClass:[AWSSNSPublishResponse class]];
}

- (void) test_AWSSNSRemovePermissionInput {
    [self validateSecureCodingForClass:[AWSSNSRemovePermissionInput class]];
}

- (void) test_AWSSNSSMSSandboxPhoneNumber {
    [self validateSecureCodingForClass:[AWSSNSSMSSandboxPhoneNumber class]];
}

- (void) test_AWSSNSSetEndpointAttributesInput {
    [self validateSecureCodingForClass:[AWSSNSSetEndpointAttributesInput class]];
}

- (void) test_AWSSNSSetPlatformApplicationAttributesInput {
    [self validateSecureCodingForClass:[AWSSNSSetPlatformApplicationAttributesInput class]];
}

- (void) test_AWSSNSSetSMSAttributesInput {
    [self validateSecureCodingForClass:[AWSSNSSetSMSAttributesInput class]];
}

- (void) test_AWSSNSSetSMSAttributesResponse {
    [self validateSecureCodingForClass:[AWSSNSSetSMSAttributesResponse class]];
}

- (void) test_AWSSNSSetSubscriptionAttributesInput {
    [self validateSecureCodingForClass:[AWSSNSSetSubscriptionAttributesInput class]];
}

- (void) test_AWSSNSSetTopicAttributesInput {
    [self validateSecureCodingForClass:[AWSSNSSetTopicAttributesInput class]];
}

- (void) test_AWSSNSSubscribeInput {
    [self validateSecureCodingForClass:[AWSSNSSubscribeInput class]];
}

- (void) test_AWSSNSSubscribeResponse {
    [self validateSecureCodingForClass:[AWSSNSSubscribeResponse class]];
}

- (void) test_AWSSNSSubscription {
    [self validateSecureCodingForClass:[AWSSNSSubscription class]];
}

- (void) test_AWSSNSTag {
    [self validateSecureCodingForClass:[AWSSNSTag class]];
}

- (void) test_AWSSNSTagResourceRequest {
    [self validateSecureCodingForClass:[AWSSNSTagResourceRequest class]];
}

- (void) test_AWSSNSTagResourceResponse {
    [self validateSecureCodingForClass:[AWSSNSTagResourceResponse class]];
}

- (void) test_AWSSNSTopic {
    [self validateSecureCodingForClass:[AWSSNSTopic class]];
}

- (void) test_AWSSNSUnsubscribeInput {
    [self validateSecureCodingForClass:[AWSSNSUnsubscribeInput class]];
}

- (void) test_AWSSNSUntagResourceRequest {
    [self validateSecureCodingForClass:[AWSSNSUntagResourceRequest class]];
}

- (void) test_AWSSNSUntagResourceResponse {
    [self validateSecureCodingForClass:[AWSSNSUntagResourceResponse class]];
}

- (void) test_AWSSNSVerifySMSSandboxPhoneNumberInput {
    [self validateSecureCodingForClass:[AWSSNSVerifySMSSandboxPhoneNumberInput class]];
}

- (void) test_AWSSNSVerifySMSSandboxPhoneNumberResult {
    [self validateSecureCodingForClass:[AWSSNSVerifySMSSandboxPhoneNumberResult class]];
}

@end

