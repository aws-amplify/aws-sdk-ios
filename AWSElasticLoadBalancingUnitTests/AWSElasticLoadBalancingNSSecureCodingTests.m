//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSElasticLoadBalancingModel.h"

@interface AWSElasticLoadBalancingNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSElasticLoadBalancingAction API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingAddListenerCertificatesInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingAddListenerCertificatesOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingAddTagsInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingAddTagsOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingAuthenticateCognitoActionConfig API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingAuthenticateOidcActionConfig API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingAvailabilityZone API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCertificate API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCipher API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCreateListenerInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCreateListenerOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCreateLoadBalancerInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCreateLoadBalancerOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCreateRuleInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCreateRuleOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCreateTargetGroupInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCreateTargetGroupOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDeleteListenerInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDeleteListenerOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDeleteLoadBalancerInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDeleteLoadBalancerOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDeleteRuleInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDeleteRuleOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDeleteTargetGroupInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDeleteTargetGroupOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDeregisterTargetsInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDeregisterTargetsOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeAccountLimitsInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeAccountLimitsOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeListenerCertificatesInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeListenerCertificatesOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeListenersInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeListenersOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeLoadBalancersInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeLoadBalancersOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeRulesInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeRulesOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeSSLPoliciesInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeSSLPoliciesOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeTagsInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeTagsOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeTargetGroupAttributesInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeTargetGroupAttributesOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeTargetGroupsInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeTargetGroupsOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeTargetHealthInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeTargetHealthOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingFixedResponseActionConfig API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingForwardActionConfig API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingHostHeaderConditionConfig API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingHttpHeaderConditionConfig API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingHttpRequestMethodConditionConfig API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingLimit API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingListener API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingLoadBalancer API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingLoadBalancerAddress API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingLoadBalancerAttribute API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingLoadBalancerState API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingMatcher API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingModifyListenerInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingModifyListenerOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingModifyLoadBalancerAttributesInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingModifyRuleInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingModifyRuleOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingModifyTargetGroupAttributesInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingModifyTargetGroupAttributesOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingModifyTargetGroupInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingModifyTargetGroupOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingPathPatternConditionConfig API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingQueryStringConditionConfig API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingQueryStringKeyValuePair API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingRedirectActionConfig API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingRegisterTargetsInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingRegisterTargetsOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingRemoveListenerCertificatesInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingRemoveListenerCertificatesOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingRemoveTagsInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingRemoveTagsOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingRule API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingRuleCondition API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingRulePriorityPair API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingSetIpAddressTypeInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingSetIpAddressTypeOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingSetRulePrioritiesInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingSetRulePrioritiesOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingSetSecurityGroupsInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingSetSecurityGroupsOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingSetSubnetsInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingSetSubnetsOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingSourceIpConditionConfig API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingSslPolicy API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingSubnetMapping API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingTag API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingTagDescription API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingTargetDescription API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingTargetGroup API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingTargetGroupAttribute API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingTargetGroupStickinessConfig API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingTargetGroupTuple API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingTargetHealth API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingTargetHealthDescription API_AVAILABLE(ios(11));

@end

@implementation AWSElasticLoadBalancingNSSecureCodingTests

- (void) test_AWSElasticLoadBalancingAction {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingAction class]];
}

- (void) test_AWSElasticLoadBalancingAddListenerCertificatesInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingAddListenerCertificatesInput class]];
}

- (void) test_AWSElasticLoadBalancingAddListenerCertificatesOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingAddListenerCertificatesOutput class]];
}

- (void) test_AWSElasticLoadBalancingAddTagsInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingAddTagsInput class]];
}

- (void) test_AWSElasticLoadBalancingAddTagsOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingAddTagsOutput class]];
}

- (void) test_AWSElasticLoadBalancingAuthenticateCognitoActionConfig {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingAuthenticateCognitoActionConfig class]];
}

- (void) test_AWSElasticLoadBalancingAuthenticateOidcActionConfig {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingAuthenticateOidcActionConfig class]];
}

- (void) test_AWSElasticLoadBalancingAvailabilityZone {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingAvailabilityZone class]];
}

- (void) test_AWSElasticLoadBalancingCertificate {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCertificate class]];
}

- (void) test_AWSElasticLoadBalancingCipher {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCipher class]];
}

- (void) test_AWSElasticLoadBalancingCreateListenerInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCreateListenerInput class]];
}

- (void) test_AWSElasticLoadBalancingCreateListenerOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCreateListenerOutput class]];
}

- (void) test_AWSElasticLoadBalancingCreateLoadBalancerInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCreateLoadBalancerInput class]];
}

- (void) test_AWSElasticLoadBalancingCreateLoadBalancerOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCreateLoadBalancerOutput class]];
}

- (void) test_AWSElasticLoadBalancingCreateRuleInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCreateRuleInput class]];
}

- (void) test_AWSElasticLoadBalancingCreateRuleOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCreateRuleOutput class]];
}

- (void) test_AWSElasticLoadBalancingCreateTargetGroupInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCreateTargetGroupInput class]];
}

- (void) test_AWSElasticLoadBalancingCreateTargetGroupOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCreateTargetGroupOutput class]];
}

- (void) test_AWSElasticLoadBalancingDeleteListenerInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDeleteListenerInput class]];
}

- (void) test_AWSElasticLoadBalancingDeleteListenerOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDeleteListenerOutput class]];
}

- (void) test_AWSElasticLoadBalancingDeleteLoadBalancerInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDeleteLoadBalancerInput class]];
}

- (void) test_AWSElasticLoadBalancingDeleteLoadBalancerOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDeleteLoadBalancerOutput class]];
}

- (void) test_AWSElasticLoadBalancingDeleteRuleInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDeleteRuleInput class]];
}

- (void) test_AWSElasticLoadBalancingDeleteRuleOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDeleteRuleOutput class]];
}

- (void) test_AWSElasticLoadBalancingDeleteTargetGroupInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDeleteTargetGroupInput class]];
}

- (void) test_AWSElasticLoadBalancingDeleteTargetGroupOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDeleteTargetGroupOutput class]];
}

- (void) test_AWSElasticLoadBalancingDeregisterTargetsInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDeregisterTargetsInput class]];
}

- (void) test_AWSElasticLoadBalancingDeregisterTargetsOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDeregisterTargetsOutput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeAccountLimitsInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeAccountLimitsInput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeAccountLimitsOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeAccountLimitsOutput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeListenerCertificatesInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeListenerCertificatesInput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeListenerCertificatesOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeListenerCertificatesOutput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeListenersInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeListenersInput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeListenersOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeListenersOutput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeLoadBalancersInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeLoadBalancersInput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeLoadBalancersOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeLoadBalancersOutput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeRulesInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeRulesInput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeRulesOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeRulesOutput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeSSLPoliciesInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeSSLPoliciesInput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeSSLPoliciesOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeSSLPoliciesOutput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeTagsInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeTagsInput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeTagsOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeTagsOutput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeTargetGroupAttributesInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeTargetGroupAttributesInput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeTargetGroupAttributesOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeTargetGroupAttributesOutput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeTargetGroupsInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeTargetGroupsInput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeTargetGroupsOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeTargetGroupsOutput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeTargetHealthInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeTargetHealthInput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeTargetHealthOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeTargetHealthOutput class]];
}

- (void) test_AWSElasticLoadBalancingFixedResponseActionConfig {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingFixedResponseActionConfig class]];
}

- (void) test_AWSElasticLoadBalancingForwardActionConfig {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingForwardActionConfig class]];
}

- (void) test_AWSElasticLoadBalancingHostHeaderConditionConfig {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingHostHeaderConditionConfig class]];
}

- (void) test_AWSElasticLoadBalancingHttpHeaderConditionConfig {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingHttpHeaderConditionConfig class]];
}

- (void) test_AWSElasticLoadBalancingHttpRequestMethodConditionConfig {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingHttpRequestMethodConditionConfig class]];
}

- (void) test_AWSElasticLoadBalancingLimit {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingLimit class]];
}

- (void) test_AWSElasticLoadBalancingListener {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingListener class]];
}

- (void) test_AWSElasticLoadBalancingLoadBalancer {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingLoadBalancer class]];
}

- (void) test_AWSElasticLoadBalancingLoadBalancerAddress {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingLoadBalancerAddress class]];
}

- (void) test_AWSElasticLoadBalancingLoadBalancerAttribute {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingLoadBalancerAttribute class]];
}

- (void) test_AWSElasticLoadBalancingLoadBalancerState {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingLoadBalancerState class]];
}

- (void) test_AWSElasticLoadBalancingMatcher {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingMatcher class]];
}

- (void) test_AWSElasticLoadBalancingModifyListenerInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingModifyListenerInput class]];
}

- (void) test_AWSElasticLoadBalancingModifyListenerOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingModifyListenerOutput class]];
}

- (void) test_AWSElasticLoadBalancingModifyLoadBalancerAttributesInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingModifyLoadBalancerAttributesInput class]];
}

- (void) test_AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput class]];
}

- (void) test_AWSElasticLoadBalancingModifyRuleInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingModifyRuleInput class]];
}

- (void) test_AWSElasticLoadBalancingModifyRuleOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingModifyRuleOutput class]];
}

- (void) test_AWSElasticLoadBalancingModifyTargetGroupAttributesInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingModifyTargetGroupAttributesInput class]];
}

- (void) test_AWSElasticLoadBalancingModifyTargetGroupAttributesOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingModifyTargetGroupAttributesOutput class]];
}

- (void) test_AWSElasticLoadBalancingModifyTargetGroupInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingModifyTargetGroupInput class]];
}

- (void) test_AWSElasticLoadBalancingModifyTargetGroupOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingModifyTargetGroupOutput class]];
}

- (void) test_AWSElasticLoadBalancingPathPatternConditionConfig {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingPathPatternConditionConfig class]];
}

- (void) test_AWSElasticLoadBalancingQueryStringConditionConfig {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingQueryStringConditionConfig class]];
}

- (void) test_AWSElasticLoadBalancingQueryStringKeyValuePair {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingQueryStringKeyValuePair class]];
}

- (void) test_AWSElasticLoadBalancingRedirectActionConfig {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingRedirectActionConfig class]];
}

- (void) test_AWSElasticLoadBalancingRegisterTargetsInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingRegisterTargetsInput class]];
}

- (void) test_AWSElasticLoadBalancingRegisterTargetsOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingRegisterTargetsOutput class]];
}

- (void) test_AWSElasticLoadBalancingRemoveListenerCertificatesInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingRemoveListenerCertificatesInput class]];
}

- (void) test_AWSElasticLoadBalancingRemoveListenerCertificatesOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingRemoveListenerCertificatesOutput class]];
}

- (void) test_AWSElasticLoadBalancingRemoveTagsInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingRemoveTagsInput class]];
}

- (void) test_AWSElasticLoadBalancingRemoveTagsOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingRemoveTagsOutput class]];
}

- (void) test_AWSElasticLoadBalancingRule {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingRule class]];
}

- (void) test_AWSElasticLoadBalancingRuleCondition {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingRuleCondition class]];
}

- (void) test_AWSElasticLoadBalancingRulePriorityPair {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingRulePriorityPair class]];
}

- (void) test_AWSElasticLoadBalancingSetIpAddressTypeInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingSetIpAddressTypeInput class]];
}

- (void) test_AWSElasticLoadBalancingSetIpAddressTypeOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingSetIpAddressTypeOutput class]];
}

- (void) test_AWSElasticLoadBalancingSetRulePrioritiesInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingSetRulePrioritiesInput class]];
}

- (void) test_AWSElasticLoadBalancingSetRulePrioritiesOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingSetRulePrioritiesOutput class]];
}

- (void) test_AWSElasticLoadBalancingSetSecurityGroupsInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingSetSecurityGroupsInput class]];
}

- (void) test_AWSElasticLoadBalancingSetSecurityGroupsOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingSetSecurityGroupsOutput class]];
}

- (void) test_AWSElasticLoadBalancingSetSubnetsInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingSetSubnetsInput class]];
}

- (void) test_AWSElasticLoadBalancingSetSubnetsOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingSetSubnetsOutput class]];
}

- (void) test_AWSElasticLoadBalancingSourceIpConditionConfig {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingSourceIpConditionConfig class]];
}

- (void) test_AWSElasticLoadBalancingSslPolicy {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingSslPolicy class]];
}

- (void) test_AWSElasticLoadBalancingSubnetMapping {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingSubnetMapping class]];
}

- (void) test_AWSElasticLoadBalancingTag {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingTag class]];
}

- (void) test_AWSElasticLoadBalancingTagDescription {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingTagDescription class]];
}

- (void) test_AWSElasticLoadBalancingTargetDescription {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingTargetDescription class]];
}

- (void) test_AWSElasticLoadBalancingTargetGroup {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingTargetGroup class]];
}

- (void) test_AWSElasticLoadBalancingTargetGroupAttribute {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingTargetGroupAttribute class]];
}

- (void) test_AWSElasticLoadBalancingTargetGroupStickinessConfig {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingTargetGroupStickinessConfig class]];
}

- (void) test_AWSElasticLoadBalancingTargetGroupTuple {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingTargetGroupTuple class]];
}

- (void) test_AWSElasticLoadBalancingTargetHealth {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingTargetHealth class]];
}

- (void) test_AWSElasticLoadBalancingTargetHealthDescription {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingTargetHealthDescription class]];
}

@end

