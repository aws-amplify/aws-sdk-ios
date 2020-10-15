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
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSSESModel.h"

@interface AWSSESNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSSESAddHeaderAction API_AVAILABLE(ios(11));
- (void) test_AWSSESBody API_AVAILABLE(ios(11));
- (void) test_AWSSESBounceAction API_AVAILABLE(ios(11));
- (void) test_AWSSESBouncedRecipientInfo API_AVAILABLE(ios(11));
- (void) test_AWSSESBulkEmailDestination API_AVAILABLE(ios(11));
- (void) test_AWSSESBulkEmailDestinationStatus API_AVAILABLE(ios(11));
- (void) test_AWSSESCloneReceiptRuleSetRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESCloneReceiptRuleSetResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESCloudWatchDestination API_AVAILABLE(ios(11));
- (void) test_AWSSESCloudWatchDimensionConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSSESConfigurationSet API_AVAILABLE(ios(11));
- (void) test_AWSSESContent API_AVAILABLE(ios(11));
- (void) test_AWSSESCreateConfigurationSetEventDestinationRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESCreateConfigurationSetEventDestinationResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESCreateConfigurationSetRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESCreateConfigurationSetResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESCreateConfigurationSetTrackingOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESCreateConfigurationSetTrackingOptionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESCreateCustomVerificationEmailTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESCreateReceiptFilterRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESCreateReceiptFilterResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESCreateReceiptRuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESCreateReceiptRuleResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESCreateReceiptRuleSetRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESCreateReceiptRuleSetResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESCreateTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESCreateTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESCustomVerificationEmailTemplate API_AVAILABLE(ios(11));
- (void) test_AWSSESDeleteConfigurationSetEventDestinationRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESDeleteConfigurationSetEventDestinationResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESDeleteConfigurationSetRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESDeleteConfigurationSetResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESDeleteConfigurationSetTrackingOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESDeleteConfigurationSetTrackingOptionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESDeleteCustomVerificationEmailTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESDeleteIdentityPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESDeleteIdentityPolicyResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESDeleteIdentityRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESDeleteIdentityResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESDeleteReceiptFilterRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESDeleteReceiptFilterResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESDeleteReceiptRuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESDeleteReceiptRuleResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESDeleteReceiptRuleSetRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESDeleteReceiptRuleSetResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESDeleteTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESDeleteTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESDeleteVerifiedEmailAddressRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESDeliveryOptions API_AVAILABLE(ios(11));
- (void) test_AWSSESDescribeActiveReceiptRuleSetRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESDescribeActiveReceiptRuleSetResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESDescribeConfigurationSetRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESDescribeConfigurationSetResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESDescribeReceiptRuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESDescribeReceiptRuleResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESDescribeReceiptRuleSetRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESDescribeReceiptRuleSetResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESDestination API_AVAILABLE(ios(11));
- (void) test_AWSSESEventDestination API_AVAILABLE(ios(11));
- (void) test_AWSSESExtensionField API_AVAILABLE(ios(11));
- (void) test_AWSSESGetAccountSendingEnabledResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESGetCustomVerificationEmailTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESGetCustomVerificationEmailTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESGetIdentityDkimAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESGetIdentityDkimAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESGetIdentityMailFromDomainAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESGetIdentityMailFromDomainAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESGetIdentityNotificationAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESGetIdentityNotificationAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESGetIdentityPoliciesRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESGetIdentityPoliciesResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESGetIdentityVerificationAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESGetIdentityVerificationAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESGetSendQuotaResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESGetSendStatisticsResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESGetTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESGetTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESIdentityDkimAttributes API_AVAILABLE(ios(11));
- (void) test_AWSSESIdentityMailFromDomainAttributes API_AVAILABLE(ios(11));
- (void) test_AWSSESIdentityNotificationAttributes API_AVAILABLE(ios(11));
- (void) test_AWSSESIdentityVerificationAttributes API_AVAILABLE(ios(11));
- (void) test_AWSSESKinesisFirehoseDestination API_AVAILABLE(ios(11));
- (void) test_AWSSESLambdaAction API_AVAILABLE(ios(11));
- (void) test_AWSSESListConfigurationSetsRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESListConfigurationSetsResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESListCustomVerificationEmailTemplatesRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESListCustomVerificationEmailTemplatesResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESListIdentitiesRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESListIdentitiesResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESListIdentityPoliciesRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESListIdentityPoliciesResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESListReceiptFiltersRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESListReceiptFiltersResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESListReceiptRuleSetsRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESListReceiptRuleSetsResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESListTemplatesRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESListTemplatesResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESListVerifiedEmailAddressesResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESMessage API_AVAILABLE(ios(11));
- (void) test_AWSSESMessageDsn API_AVAILABLE(ios(11));
- (void) test_AWSSESMessageTag API_AVAILABLE(ios(11));
- (void) test_AWSSESPutConfigurationSetDeliveryOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESPutConfigurationSetDeliveryOptionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESPutIdentityPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESPutIdentityPolicyResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESRawMessage API_AVAILABLE(ios(11));
- (void) test_AWSSESReceiptAction API_AVAILABLE(ios(11));
- (void) test_AWSSESReceiptFilter API_AVAILABLE(ios(11));
- (void) test_AWSSESReceiptIpFilter API_AVAILABLE(ios(11));
- (void) test_AWSSESReceiptRule API_AVAILABLE(ios(11));
- (void) test_AWSSESReceiptRuleSetMetadata API_AVAILABLE(ios(11));
- (void) test_AWSSESRecipientDsnFields API_AVAILABLE(ios(11));
- (void) test_AWSSESReorderReceiptRuleSetRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESReorderReceiptRuleSetResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESReputationOptions API_AVAILABLE(ios(11));
- (void) test_AWSSESS3Action API_AVAILABLE(ios(11));
- (void) test_AWSSESSNSAction API_AVAILABLE(ios(11));
- (void) test_AWSSESSNSDestination API_AVAILABLE(ios(11));
- (void) test_AWSSESSendBounceRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESSendBounceResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESSendBulkTemplatedEmailRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESSendBulkTemplatedEmailResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESSendCustomVerificationEmailRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESSendCustomVerificationEmailResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESSendDataPoint API_AVAILABLE(ios(11));
- (void) test_AWSSESSendEmailRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESSendEmailResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESSendRawEmailRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESSendRawEmailResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESSendTemplatedEmailRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESSendTemplatedEmailResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESSetActiveReceiptRuleSetRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESSetActiveReceiptRuleSetResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESSetIdentityDkimEnabledRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESSetIdentityDkimEnabledResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESSetIdentityFeedbackForwardingEnabledRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESSetIdentityFeedbackForwardingEnabledResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESSetIdentityHeadersInNotificationsEnabledRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESSetIdentityHeadersInNotificationsEnabledResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESSetIdentityMailFromDomainRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESSetIdentityMailFromDomainResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESSetIdentityNotificationTopicRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESSetIdentityNotificationTopicResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESSetReceiptRulePositionRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESSetReceiptRulePositionResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESStopAction API_AVAILABLE(ios(11));
- (void) test_AWSSESTemplate API_AVAILABLE(ios(11));
- (void) test_AWSSESTemplateMetadata API_AVAILABLE(ios(11));
- (void) test_AWSSESTestRenderTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESTestRenderTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESTrackingOptions API_AVAILABLE(ios(11));
- (void) test_AWSSESUpdateAccountSendingEnabledRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESUpdateConfigurationSetEventDestinationRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESUpdateConfigurationSetEventDestinationResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESUpdateConfigurationSetReputationMetricsEnabledRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESUpdateConfigurationSetSendingEnabledRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESUpdateConfigurationSetTrackingOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESUpdateConfigurationSetTrackingOptionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESUpdateCustomVerificationEmailTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESUpdateReceiptRuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESUpdateReceiptRuleResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESUpdateTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESUpdateTemplateResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESVerifyDomainDkimRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESVerifyDomainDkimResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESVerifyDomainIdentityRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESVerifyDomainIdentityResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESVerifyEmailAddressRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESVerifyEmailIdentityRequest API_AVAILABLE(ios(11));
- (void) test_AWSSESVerifyEmailIdentityResponse API_AVAILABLE(ios(11));
- (void) test_AWSSESWorkmailAction API_AVAILABLE(ios(11));

@end

@implementation AWSSESNSSecureCodingTests

- (void) test_AWSSESAddHeaderAction {
    [self validateSecureCodingForClass:[AWSSESAddHeaderAction class]];
}

- (void) test_AWSSESBody {
    [self validateSecureCodingForClass:[AWSSESBody class]];
}

- (void) test_AWSSESBounceAction {
    [self validateSecureCodingForClass:[AWSSESBounceAction class]];
}

- (void) test_AWSSESBouncedRecipientInfo {
    [self validateSecureCodingForClass:[AWSSESBouncedRecipientInfo class]];
}

- (void) test_AWSSESBulkEmailDestination {
    [self validateSecureCodingForClass:[AWSSESBulkEmailDestination class]];
}

- (void) test_AWSSESBulkEmailDestinationStatus {
    [self validateSecureCodingForClass:[AWSSESBulkEmailDestinationStatus class]];
}

- (void) test_AWSSESCloneReceiptRuleSetRequest {
    [self validateSecureCodingForClass:[AWSSESCloneReceiptRuleSetRequest class]];
}

- (void) test_AWSSESCloneReceiptRuleSetResponse {
    [self validateSecureCodingForClass:[AWSSESCloneReceiptRuleSetResponse class]];
}

- (void) test_AWSSESCloudWatchDestination {
    [self validateSecureCodingForClass:[AWSSESCloudWatchDestination class]];
}

- (void) test_AWSSESCloudWatchDimensionConfiguration {
    [self validateSecureCodingForClass:[AWSSESCloudWatchDimensionConfiguration class]];
}

- (void) test_AWSSESConfigurationSet {
    [self validateSecureCodingForClass:[AWSSESConfigurationSet class]];
}

- (void) test_AWSSESContent {
    [self validateSecureCodingForClass:[AWSSESContent class]];
}

- (void) test_AWSSESCreateConfigurationSetEventDestinationRequest {
    [self validateSecureCodingForClass:[AWSSESCreateConfigurationSetEventDestinationRequest class]];
}

- (void) test_AWSSESCreateConfigurationSetEventDestinationResponse {
    [self validateSecureCodingForClass:[AWSSESCreateConfigurationSetEventDestinationResponse class]];
}

- (void) test_AWSSESCreateConfigurationSetRequest {
    [self validateSecureCodingForClass:[AWSSESCreateConfigurationSetRequest class]];
}

- (void) test_AWSSESCreateConfigurationSetResponse {
    [self validateSecureCodingForClass:[AWSSESCreateConfigurationSetResponse class]];
}

- (void) test_AWSSESCreateConfigurationSetTrackingOptionsRequest {
    [self validateSecureCodingForClass:[AWSSESCreateConfigurationSetTrackingOptionsRequest class]];
}

- (void) test_AWSSESCreateConfigurationSetTrackingOptionsResponse {
    [self validateSecureCodingForClass:[AWSSESCreateConfigurationSetTrackingOptionsResponse class]];
}

- (void) test_AWSSESCreateCustomVerificationEmailTemplateRequest {
    [self validateSecureCodingForClass:[AWSSESCreateCustomVerificationEmailTemplateRequest class]];
}

- (void) test_AWSSESCreateReceiptFilterRequest {
    [self validateSecureCodingForClass:[AWSSESCreateReceiptFilterRequest class]];
}

- (void) test_AWSSESCreateReceiptFilterResponse {
    [self validateSecureCodingForClass:[AWSSESCreateReceiptFilterResponse class]];
}

- (void) test_AWSSESCreateReceiptRuleRequest {
    [self validateSecureCodingForClass:[AWSSESCreateReceiptRuleRequest class]];
}

- (void) test_AWSSESCreateReceiptRuleResponse {
    [self validateSecureCodingForClass:[AWSSESCreateReceiptRuleResponse class]];
}

- (void) test_AWSSESCreateReceiptRuleSetRequest {
    [self validateSecureCodingForClass:[AWSSESCreateReceiptRuleSetRequest class]];
}

- (void) test_AWSSESCreateReceiptRuleSetResponse {
    [self validateSecureCodingForClass:[AWSSESCreateReceiptRuleSetResponse class]];
}

- (void) test_AWSSESCreateTemplateRequest {
    [self validateSecureCodingForClass:[AWSSESCreateTemplateRequest class]];
}

- (void) test_AWSSESCreateTemplateResponse {
    [self validateSecureCodingForClass:[AWSSESCreateTemplateResponse class]];
}

- (void) test_AWSSESCustomVerificationEmailTemplate {
    [self validateSecureCodingForClass:[AWSSESCustomVerificationEmailTemplate class]];
}

- (void) test_AWSSESDeleteConfigurationSetEventDestinationRequest {
    [self validateSecureCodingForClass:[AWSSESDeleteConfigurationSetEventDestinationRequest class]];
}

- (void) test_AWSSESDeleteConfigurationSetEventDestinationResponse {
    [self validateSecureCodingForClass:[AWSSESDeleteConfigurationSetEventDestinationResponse class]];
}

- (void) test_AWSSESDeleteConfigurationSetRequest {
    [self validateSecureCodingForClass:[AWSSESDeleteConfigurationSetRequest class]];
}

- (void) test_AWSSESDeleteConfigurationSetResponse {
    [self validateSecureCodingForClass:[AWSSESDeleteConfigurationSetResponse class]];
}

- (void) test_AWSSESDeleteConfigurationSetTrackingOptionsRequest {
    [self validateSecureCodingForClass:[AWSSESDeleteConfigurationSetTrackingOptionsRequest class]];
}

- (void) test_AWSSESDeleteConfigurationSetTrackingOptionsResponse {
    [self validateSecureCodingForClass:[AWSSESDeleteConfigurationSetTrackingOptionsResponse class]];
}

- (void) test_AWSSESDeleteCustomVerificationEmailTemplateRequest {
    [self validateSecureCodingForClass:[AWSSESDeleteCustomVerificationEmailTemplateRequest class]];
}

- (void) test_AWSSESDeleteIdentityPolicyRequest {
    [self validateSecureCodingForClass:[AWSSESDeleteIdentityPolicyRequest class]];
}

- (void) test_AWSSESDeleteIdentityPolicyResponse {
    [self validateSecureCodingForClass:[AWSSESDeleteIdentityPolicyResponse class]];
}

- (void) test_AWSSESDeleteIdentityRequest {
    [self validateSecureCodingForClass:[AWSSESDeleteIdentityRequest class]];
}

- (void) test_AWSSESDeleteIdentityResponse {
    [self validateSecureCodingForClass:[AWSSESDeleteIdentityResponse class]];
}

- (void) test_AWSSESDeleteReceiptFilterRequest {
    [self validateSecureCodingForClass:[AWSSESDeleteReceiptFilterRequest class]];
}

- (void) test_AWSSESDeleteReceiptFilterResponse {
    [self validateSecureCodingForClass:[AWSSESDeleteReceiptFilterResponse class]];
}

- (void) test_AWSSESDeleteReceiptRuleRequest {
    [self validateSecureCodingForClass:[AWSSESDeleteReceiptRuleRequest class]];
}

- (void) test_AWSSESDeleteReceiptRuleResponse {
    [self validateSecureCodingForClass:[AWSSESDeleteReceiptRuleResponse class]];
}

- (void) test_AWSSESDeleteReceiptRuleSetRequest {
    [self validateSecureCodingForClass:[AWSSESDeleteReceiptRuleSetRequest class]];
}

- (void) test_AWSSESDeleteReceiptRuleSetResponse {
    [self validateSecureCodingForClass:[AWSSESDeleteReceiptRuleSetResponse class]];
}

- (void) test_AWSSESDeleteTemplateRequest {
    [self validateSecureCodingForClass:[AWSSESDeleteTemplateRequest class]];
}

- (void) test_AWSSESDeleteTemplateResponse {
    [self validateSecureCodingForClass:[AWSSESDeleteTemplateResponse class]];
}

- (void) test_AWSSESDeleteVerifiedEmailAddressRequest {
    [self validateSecureCodingForClass:[AWSSESDeleteVerifiedEmailAddressRequest class]];
}

- (void) test_AWSSESDeliveryOptions {
    [self validateSecureCodingForClass:[AWSSESDeliveryOptions class]];
}

- (void) test_AWSSESDescribeActiveReceiptRuleSetRequest {
    [self validateSecureCodingForClass:[AWSSESDescribeActiveReceiptRuleSetRequest class]];
}

- (void) test_AWSSESDescribeActiveReceiptRuleSetResponse {
    [self validateSecureCodingForClass:[AWSSESDescribeActiveReceiptRuleSetResponse class]];
}

- (void) test_AWSSESDescribeConfigurationSetRequest {
    [self validateSecureCodingForClass:[AWSSESDescribeConfigurationSetRequest class]];
}

- (void) test_AWSSESDescribeConfigurationSetResponse {
    [self validateSecureCodingForClass:[AWSSESDescribeConfigurationSetResponse class]];
}

- (void) test_AWSSESDescribeReceiptRuleRequest {
    [self validateSecureCodingForClass:[AWSSESDescribeReceiptRuleRequest class]];
}

- (void) test_AWSSESDescribeReceiptRuleResponse {
    [self validateSecureCodingForClass:[AWSSESDescribeReceiptRuleResponse class]];
}

- (void) test_AWSSESDescribeReceiptRuleSetRequest {
    [self validateSecureCodingForClass:[AWSSESDescribeReceiptRuleSetRequest class]];
}

- (void) test_AWSSESDescribeReceiptRuleSetResponse {
    [self validateSecureCodingForClass:[AWSSESDescribeReceiptRuleSetResponse class]];
}

- (void) test_AWSSESDestination {
    [self validateSecureCodingForClass:[AWSSESDestination class]];
}

- (void) test_AWSSESEventDestination {
    [self validateSecureCodingForClass:[AWSSESEventDestination class]];
}

- (void) test_AWSSESExtensionField {
    [self validateSecureCodingForClass:[AWSSESExtensionField class]];
}

- (void) test_AWSSESGetAccountSendingEnabledResponse {
    [self validateSecureCodingForClass:[AWSSESGetAccountSendingEnabledResponse class]];
}

- (void) test_AWSSESGetCustomVerificationEmailTemplateRequest {
    [self validateSecureCodingForClass:[AWSSESGetCustomVerificationEmailTemplateRequest class]];
}

- (void) test_AWSSESGetCustomVerificationEmailTemplateResponse {
    [self validateSecureCodingForClass:[AWSSESGetCustomVerificationEmailTemplateResponse class]];
}

- (void) test_AWSSESGetIdentityDkimAttributesRequest {
    [self validateSecureCodingForClass:[AWSSESGetIdentityDkimAttributesRequest class]];
}

- (void) test_AWSSESGetIdentityDkimAttributesResponse {
    [self validateSecureCodingForClass:[AWSSESGetIdentityDkimAttributesResponse class]];
}

- (void) test_AWSSESGetIdentityMailFromDomainAttributesRequest {
    [self validateSecureCodingForClass:[AWSSESGetIdentityMailFromDomainAttributesRequest class]];
}

- (void) test_AWSSESGetIdentityMailFromDomainAttributesResponse {
    [self validateSecureCodingForClass:[AWSSESGetIdentityMailFromDomainAttributesResponse class]];
}

- (void) test_AWSSESGetIdentityNotificationAttributesRequest {
    [self validateSecureCodingForClass:[AWSSESGetIdentityNotificationAttributesRequest class]];
}

- (void) test_AWSSESGetIdentityNotificationAttributesResponse {
    [self validateSecureCodingForClass:[AWSSESGetIdentityNotificationAttributesResponse class]];
}

- (void) test_AWSSESGetIdentityPoliciesRequest {
    [self validateSecureCodingForClass:[AWSSESGetIdentityPoliciesRequest class]];
}

- (void) test_AWSSESGetIdentityPoliciesResponse {
    [self validateSecureCodingForClass:[AWSSESGetIdentityPoliciesResponse class]];
}

- (void) test_AWSSESGetIdentityVerificationAttributesRequest {
    [self validateSecureCodingForClass:[AWSSESGetIdentityVerificationAttributesRequest class]];
}

- (void) test_AWSSESGetIdentityVerificationAttributesResponse {
    [self validateSecureCodingForClass:[AWSSESGetIdentityVerificationAttributesResponse class]];
}

- (void) test_AWSSESGetSendQuotaResponse {
    [self validateSecureCodingForClass:[AWSSESGetSendQuotaResponse class]];
}

- (void) test_AWSSESGetSendStatisticsResponse {
    [self validateSecureCodingForClass:[AWSSESGetSendStatisticsResponse class]];
}

- (void) test_AWSSESGetTemplateRequest {
    [self validateSecureCodingForClass:[AWSSESGetTemplateRequest class]];
}

- (void) test_AWSSESGetTemplateResponse {
    [self validateSecureCodingForClass:[AWSSESGetTemplateResponse class]];
}

- (void) test_AWSSESIdentityDkimAttributes {
    [self validateSecureCodingForClass:[AWSSESIdentityDkimAttributes class]];
}

- (void) test_AWSSESIdentityMailFromDomainAttributes {
    [self validateSecureCodingForClass:[AWSSESIdentityMailFromDomainAttributes class]];
}

- (void) test_AWSSESIdentityNotificationAttributes {
    [self validateSecureCodingForClass:[AWSSESIdentityNotificationAttributes class]];
}

- (void) test_AWSSESIdentityVerificationAttributes {
    [self validateSecureCodingForClass:[AWSSESIdentityVerificationAttributes class]];
}

- (void) test_AWSSESKinesisFirehoseDestination {
    [self validateSecureCodingForClass:[AWSSESKinesisFirehoseDestination class]];
}

- (void) test_AWSSESLambdaAction {
    [self validateSecureCodingForClass:[AWSSESLambdaAction class]];
}

- (void) test_AWSSESListConfigurationSetsRequest {
    [self validateSecureCodingForClass:[AWSSESListConfigurationSetsRequest class]];
}

- (void) test_AWSSESListConfigurationSetsResponse {
    [self validateSecureCodingForClass:[AWSSESListConfigurationSetsResponse class]];
}

- (void) test_AWSSESListCustomVerificationEmailTemplatesRequest {
    [self validateSecureCodingForClass:[AWSSESListCustomVerificationEmailTemplatesRequest class]];
}

- (void) test_AWSSESListCustomVerificationEmailTemplatesResponse {
    [self validateSecureCodingForClass:[AWSSESListCustomVerificationEmailTemplatesResponse class]];
}

- (void) test_AWSSESListIdentitiesRequest {
    [self validateSecureCodingForClass:[AWSSESListIdentitiesRequest class]];
}

- (void) test_AWSSESListIdentitiesResponse {
    [self validateSecureCodingForClass:[AWSSESListIdentitiesResponse class]];
}

- (void) test_AWSSESListIdentityPoliciesRequest {
    [self validateSecureCodingForClass:[AWSSESListIdentityPoliciesRequest class]];
}

- (void) test_AWSSESListIdentityPoliciesResponse {
    [self validateSecureCodingForClass:[AWSSESListIdentityPoliciesResponse class]];
}

- (void) test_AWSSESListReceiptFiltersRequest {
    [self validateSecureCodingForClass:[AWSSESListReceiptFiltersRequest class]];
}

- (void) test_AWSSESListReceiptFiltersResponse {
    [self validateSecureCodingForClass:[AWSSESListReceiptFiltersResponse class]];
}

- (void) test_AWSSESListReceiptRuleSetsRequest {
    [self validateSecureCodingForClass:[AWSSESListReceiptRuleSetsRequest class]];
}

- (void) test_AWSSESListReceiptRuleSetsResponse {
    [self validateSecureCodingForClass:[AWSSESListReceiptRuleSetsResponse class]];
}

- (void) test_AWSSESListTemplatesRequest {
    [self validateSecureCodingForClass:[AWSSESListTemplatesRequest class]];
}

- (void) test_AWSSESListTemplatesResponse {
    [self validateSecureCodingForClass:[AWSSESListTemplatesResponse class]];
}

- (void) test_AWSSESListVerifiedEmailAddressesResponse {
    [self validateSecureCodingForClass:[AWSSESListVerifiedEmailAddressesResponse class]];
}

- (void) test_AWSSESMessage {
    [self validateSecureCodingForClass:[AWSSESMessage class]];
}

- (void) test_AWSSESMessageDsn {
    [self validateSecureCodingForClass:[AWSSESMessageDsn class]];
}

- (void) test_AWSSESMessageTag {
    [self validateSecureCodingForClass:[AWSSESMessageTag class]];
}

- (void) test_AWSSESPutConfigurationSetDeliveryOptionsRequest {
    [self validateSecureCodingForClass:[AWSSESPutConfigurationSetDeliveryOptionsRequest class]];
}

- (void) test_AWSSESPutConfigurationSetDeliveryOptionsResponse {
    [self validateSecureCodingForClass:[AWSSESPutConfigurationSetDeliveryOptionsResponse class]];
}

- (void) test_AWSSESPutIdentityPolicyRequest {
    [self validateSecureCodingForClass:[AWSSESPutIdentityPolicyRequest class]];
}

- (void) test_AWSSESPutIdentityPolicyResponse {
    [self validateSecureCodingForClass:[AWSSESPutIdentityPolicyResponse class]];
}

- (void) test_AWSSESRawMessage {
    [self validateSecureCodingForClass:[AWSSESRawMessage class]];
}

- (void) test_AWSSESReceiptAction {
    [self validateSecureCodingForClass:[AWSSESReceiptAction class]];
}

- (void) test_AWSSESReceiptFilter {
    [self validateSecureCodingForClass:[AWSSESReceiptFilter class]];
}

- (void) test_AWSSESReceiptIpFilter {
    [self validateSecureCodingForClass:[AWSSESReceiptIpFilter class]];
}

- (void) test_AWSSESReceiptRule {
    [self validateSecureCodingForClass:[AWSSESReceiptRule class]];
}

- (void) test_AWSSESReceiptRuleSetMetadata {
    [self validateSecureCodingForClass:[AWSSESReceiptRuleSetMetadata class]];
}

- (void) test_AWSSESRecipientDsnFields {
    [self validateSecureCodingForClass:[AWSSESRecipientDsnFields class]];
}

- (void) test_AWSSESReorderReceiptRuleSetRequest {
    [self validateSecureCodingForClass:[AWSSESReorderReceiptRuleSetRequest class]];
}

- (void) test_AWSSESReorderReceiptRuleSetResponse {
    [self validateSecureCodingForClass:[AWSSESReorderReceiptRuleSetResponse class]];
}

- (void) test_AWSSESReputationOptions {
    [self validateSecureCodingForClass:[AWSSESReputationOptions class]];
}

- (void) test_AWSSESS3Action {
    [self validateSecureCodingForClass:[AWSSESS3Action class]];
}

- (void) test_AWSSESSNSAction {
    [self validateSecureCodingForClass:[AWSSESSNSAction class]];
}

- (void) test_AWSSESSNSDestination {
    [self validateSecureCodingForClass:[AWSSESSNSDestination class]];
}

- (void) test_AWSSESSendBounceRequest {
    [self validateSecureCodingForClass:[AWSSESSendBounceRequest class]];
}

- (void) test_AWSSESSendBounceResponse {
    [self validateSecureCodingForClass:[AWSSESSendBounceResponse class]];
}

- (void) test_AWSSESSendBulkTemplatedEmailRequest {
    [self validateSecureCodingForClass:[AWSSESSendBulkTemplatedEmailRequest class]];
}

- (void) test_AWSSESSendBulkTemplatedEmailResponse {
    [self validateSecureCodingForClass:[AWSSESSendBulkTemplatedEmailResponse class]];
}

- (void) test_AWSSESSendCustomVerificationEmailRequest {
    [self validateSecureCodingForClass:[AWSSESSendCustomVerificationEmailRequest class]];
}

- (void) test_AWSSESSendCustomVerificationEmailResponse {
    [self validateSecureCodingForClass:[AWSSESSendCustomVerificationEmailResponse class]];
}

- (void) test_AWSSESSendDataPoint {
    [self validateSecureCodingForClass:[AWSSESSendDataPoint class]];
}

- (void) test_AWSSESSendEmailRequest {
    [self validateSecureCodingForClass:[AWSSESSendEmailRequest class]];
}

- (void) test_AWSSESSendEmailResponse {
    [self validateSecureCodingForClass:[AWSSESSendEmailResponse class]];
}

- (void) test_AWSSESSendRawEmailRequest {
    [self validateSecureCodingForClass:[AWSSESSendRawEmailRequest class]];
}

- (void) test_AWSSESSendRawEmailResponse {
    [self validateSecureCodingForClass:[AWSSESSendRawEmailResponse class]];
}

- (void) test_AWSSESSendTemplatedEmailRequest {
    [self validateSecureCodingForClass:[AWSSESSendTemplatedEmailRequest class]];
}

- (void) test_AWSSESSendTemplatedEmailResponse {
    [self validateSecureCodingForClass:[AWSSESSendTemplatedEmailResponse class]];
}

- (void) test_AWSSESSetActiveReceiptRuleSetRequest {
    [self validateSecureCodingForClass:[AWSSESSetActiveReceiptRuleSetRequest class]];
}

- (void) test_AWSSESSetActiveReceiptRuleSetResponse {
    [self validateSecureCodingForClass:[AWSSESSetActiveReceiptRuleSetResponse class]];
}

- (void) test_AWSSESSetIdentityDkimEnabledRequest {
    [self validateSecureCodingForClass:[AWSSESSetIdentityDkimEnabledRequest class]];
}

- (void) test_AWSSESSetIdentityDkimEnabledResponse {
    [self validateSecureCodingForClass:[AWSSESSetIdentityDkimEnabledResponse class]];
}

- (void) test_AWSSESSetIdentityFeedbackForwardingEnabledRequest {
    [self validateSecureCodingForClass:[AWSSESSetIdentityFeedbackForwardingEnabledRequest class]];
}

- (void) test_AWSSESSetIdentityFeedbackForwardingEnabledResponse {
    [self validateSecureCodingForClass:[AWSSESSetIdentityFeedbackForwardingEnabledResponse class]];
}

- (void) test_AWSSESSetIdentityHeadersInNotificationsEnabledRequest {
    [self validateSecureCodingForClass:[AWSSESSetIdentityHeadersInNotificationsEnabledRequest class]];
}

- (void) test_AWSSESSetIdentityHeadersInNotificationsEnabledResponse {
    [self validateSecureCodingForClass:[AWSSESSetIdentityHeadersInNotificationsEnabledResponse class]];
}

- (void) test_AWSSESSetIdentityMailFromDomainRequest {
    [self validateSecureCodingForClass:[AWSSESSetIdentityMailFromDomainRequest class]];
}

- (void) test_AWSSESSetIdentityMailFromDomainResponse {
    [self validateSecureCodingForClass:[AWSSESSetIdentityMailFromDomainResponse class]];
}

- (void) test_AWSSESSetIdentityNotificationTopicRequest {
    [self validateSecureCodingForClass:[AWSSESSetIdentityNotificationTopicRequest class]];
}

- (void) test_AWSSESSetIdentityNotificationTopicResponse {
    [self validateSecureCodingForClass:[AWSSESSetIdentityNotificationTopicResponse class]];
}

- (void) test_AWSSESSetReceiptRulePositionRequest {
    [self validateSecureCodingForClass:[AWSSESSetReceiptRulePositionRequest class]];
}

- (void) test_AWSSESSetReceiptRulePositionResponse {
    [self validateSecureCodingForClass:[AWSSESSetReceiptRulePositionResponse class]];
}

- (void) test_AWSSESStopAction {
    [self validateSecureCodingForClass:[AWSSESStopAction class]];
}

- (void) test_AWSSESTemplate {
    [self validateSecureCodingForClass:[AWSSESTemplate class]];
}

- (void) test_AWSSESTemplateMetadata {
    [self validateSecureCodingForClass:[AWSSESTemplateMetadata class]];
}

- (void) test_AWSSESTestRenderTemplateRequest {
    [self validateSecureCodingForClass:[AWSSESTestRenderTemplateRequest class]];
}

- (void) test_AWSSESTestRenderTemplateResponse {
    [self validateSecureCodingForClass:[AWSSESTestRenderTemplateResponse class]];
}

- (void) test_AWSSESTrackingOptions {
    [self validateSecureCodingForClass:[AWSSESTrackingOptions class]];
}

- (void) test_AWSSESUpdateAccountSendingEnabledRequest {
    [self validateSecureCodingForClass:[AWSSESUpdateAccountSendingEnabledRequest class]];
}

- (void) test_AWSSESUpdateConfigurationSetEventDestinationRequest {
    [self validateSecureCodingForClass:[AWSSESUpdateConfigurationSetEventDestinationRequest class]];
}

- (void) test_AWSSESUpdateConfigurationSetEventDestinationResponse {
    [self validateSecureCodingForClass:[AWSSESUpdateConfigurationSetEventDestinationResponse class]];
}

- (void) test_AWSSESUpdateConfigurationSetReputationMetricsEnabledRequest {
    [self validateSecureCodingForClass:[AWSSESUpdateConfigurationSetReputationMetricsEnabledRequest class]];
}

- (void) test_AWSSESUpdateConfigurationSetSendingEnabledRequest {
    [self validateSecureCodingForClass:[AWSSESUpdateConfigurationSetSendingEnabledRequest class]];
}

- (void) test_AWSSESUpdateConfigurationSetTrackingOptionsRequest {
    [self validateSecureCodingForClass:[AWSSESUpdateConfigurationSetTrackingOptionsRequest class]];
}

- (void) test_AWSSESUpdateConfigurationSetTrackingOptionsResponse {
    [self validateSecureCodingForClass:[AWSSESUpdateConfigurationSetTrackingOptionsResponse class]];
}

- (void) test_AWSSESUpdateCustomVerificationEmailTemplateRequest {
    [self validateSecureCodingForClass:[AWSSESUpdateCustomVerificationEmailTemplateRequest class]];
}

- (void) test_AWSSESUpdateReceiptRuleRequest {
    [self validateSecureCodingForClass:[AWSSESUpdateReceiptRuleRequest class]];
}

- (void) test_AWSSESUpdateReceiptRuleResponse {
    [self validateSecureCodingForClass:[AWSSESUpdateReceiptRuleResponse class]];
}

- (void) test_AWSSESUpdateTemplateRequest {
    [self validateSecureCodingForClass:[AWSSESUpdateTemplateRequest class]];
}

- (void) test_AWSSESUpdateTemplateResponse {
    [self validateSecureCodingForClass:[AWSSESUpdateTemplateResponse class]];
}

- (void) test_AWSSESVerifyDomainDkimRequest {
    [self validateSecureCodingForClass:[AWSSESVerifyDomainDkimRequest class]];
}

- (void) test_AWSSESVerifyDomainDkimResponse {
    [self validateSecureCodingForClass:[AWSSESVerifyDomainDkimResponse class]];
}

- (void) test_AWSSESVerifyDomainIdentityRequest {
    [self validateSecureCodingForClass:[AWSSESVerifyDomainIdentityRequest class]];
}

- (void) test_AWSSESVerifyDomainIdentityResponse {
    [self validateSecureCodingForClass:[AWSSESVerifyDomainIdentityResponse class]];
}

- (void) test_AWSSESVerifyEmailAddressRequest {
    [self validateSecureCodingForClass:[AWSSESVerifyEmailAddressRequest class]];
}

- (void) test_AWSSESVerifyEmailIdentityRequest {
    [self validateSecureCodingForClass:[AWSSESVerifyEmailIdentityRequest class]];
}

- (void) test_AWSSESVerifyEmailIdentityResponse {
    [self validateSecureCodingForClass:[AWSSESVerifyEmailIdentityResponse class]];
}

- (void) test_AWSSESWorkmailAction {
    [self validateSecureCodingForClass:[AWSSESWorkmailAction class]];
}

@end

