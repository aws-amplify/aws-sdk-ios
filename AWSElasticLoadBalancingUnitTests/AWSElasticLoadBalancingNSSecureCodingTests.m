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
#import "AWSElasticLoadBalancingModel.h"

@interface AWSElasticLoadBalancingNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSElasticLoadBalancingAccessLog API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingAddAvailabilityZonesInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingAddAvailabilityZonesOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingAddTagsInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingAddTagsOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingAdditionalAttribute API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingAppCookieStickinessPolicy API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingBackendServerDescription API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingConfigureHealthCheckInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingConfigureHealthCheckOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingConnectionDraining API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingConnectionSettings API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCreateAccessPointInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCreateAccessPointOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCreateLoadBalancerListenerInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCreateLoadBalancerListenerOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCreateLoadBalancerPolicyInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingCrossZoneLoadBalancing API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDeleteAccessPointInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDeleteAccessPointOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDeleteLoadBalancerListenerInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDeregisterEndPointsInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDeregisterEndPointsOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeAccessPointsInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeAccessPointsOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeAccountLimitsInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeAccountLimitsOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeEndPointStateInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeEndPointStateOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeTagsInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDescribeTagsOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingHealthCheck API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingInstance API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingInstanceState API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingLBCookieStickinessPolicy API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingLimit API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingListener API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingListenerDescription API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingLoadBalancerAttributes API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingLoadBalancerDescription API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingModifyLoadBalancerAttributesInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingPolicies API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingPolicyAttribute API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingPolicyAttributeDescription API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingPolicyAttributeTypeDescription API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingPolicyDescription API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingPolicyTypeDescription API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingRegisterEndPointsInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingRegisterEndPointsOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingRemoveAvailabilityZonesInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingRemoveAvailabilityZonesOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingRemoveTagsInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingRemoveTagsOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingSourceSecurityGroup API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingTag API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingTagDescription API_AVAILABLE(ios(11));
- (void) test_AWSElasticLoadBalancingTagKeyOnly API_AVAILABLE(ios(11));

@end

@implementation AWSElasticLoadBalancingNSSecureCodingTests

- (void) test_AWSElasticLoadBalancingAccessLog {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingAccessLog class]];
}

- (void) test_AWSElasticLoadBalancingAddAvailabilityZonesInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingAddAvailabilityZonesInput class]];
}

- (void) test_AWSElasticLoadBalancingAddAvailabilityZonesOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingAddAvailabilityZonesOutput class]];
}

- (void) test_AWSElasticLoadBalancingAddTagsInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingAddTagsInput class]];
}

- (void) test_AWSElasticLoadBalancingAddTagsOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingAddTagsOutput class]];
}

- (void) test_AWSElasticLoadBalancingAdditionalAttribute {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingAdditionalAttribute class]];
}

- (void) test_AWSElasticLoadBalancingAppCookieStickinessPolicy {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingAppCookieStickinessPolicy class]];
}

- (void) test_AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput class]];
}

- (void) test_AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput class]];
}

- (void) test_AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput class]];
}

- (void) test_AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput class]];
}

- (void) test_AWSElasticLoadBalancingBackendServerDescription {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingBackendServerDescription class]];
}

- (void) test_AWSElasticLoadBalancingConfigureHealthCheckInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingConfigureHealthCheckInput class]];
}

- (void) test_AWSElasticLoadBalancingConfigureHealthCheckOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingConfigureHealthCheckOutput class]];
}

- (void) test_AWSElasticLoadBalancingConnectionDraining {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingConnectionDraining class]];
}

- (void) test_AWSElasticLoadBalancingConnectionSettings {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingConnectionSettings class]];
}

- (void) test_AWSElasticLoadBalancingCreateAccessPointInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCreateAccessPointInput class]];
}

- (void) test_AWSElasticLoadBalancingCreateAccessPointOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCreateAccessPointOutput class]];
}

- (void) test_AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput class]];
}

- (void) test_AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput class]];
}

- (void) test_AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput class]];
}

- (void) test_AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput class]];
}

- (void) test_AWSElasticLoadBalancingCreateLoadBalancerListenerInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCreateLoadBalancerListenerInput class]];
}

- (void) test_AWSElasticLoadBalancingCreateLoadBalancerListenerOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCreateLoadBalancerListenerOutput class]];
}

- (void) test_AWSElasticLoadBalancingCreateLoadBalancerPolicyInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCreateLoadBalancerPolicyInput class]];
}

- (void) test_AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput class]];
}

- (void) test_AWSElasticLoadBalancingCrossZoneLoadBalancing {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingCrossZoneLoadBalancing class]];
}

- (void) test_AWSElasticLoadBalancingDeleteAccessPointInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDeleteAccessPointInput class]];
}

- (void) test_AWSElasticLoadBalancingDeleteAccessPointOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDeleteAccessPointOutput class]];
}

- (void) test_AWSElasticLoadBalancingDeleteLoadBalancerListenerInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDeleteLoadBalancerListenerInput class]];
}

- (void) test_AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput class]];
}

- (void) test_AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput class]];
}

- (void) test_AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput class]];
}

- (void) test_AWSElasticLoadBalancingDeregisterEndPointsInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDeregisterEndPointsInput class]];
}

- (void) test_AWSElasticLoadBalancingDeregisterEndPointsOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDeregisterEndPointsOutput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeAccessPointsInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeAccessPointsInput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeAccessPointsOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeAccessPointsOutput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeAccountLimitsInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeAccountLimitsInput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeAccountLimitsOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeAccountLimitsOutput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeEndPointStateInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeEndPointStateInput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeEndPointStateOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeEndPointStateOutput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeTagsInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeTagsInput class]];
}

- (void) test_AWSElasticLoadBalancingDescribeTagsOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDescribeTagsOutput class]];
}

- (void) test_AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput class]];
}

- (void) test_AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput class]];
}

- (void) test_AWSElasticLoadBalancingHealthCheck {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingHealthCheck class]];
}

- (void) test_AWSElasticLoadBalancingInstance {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingInstance class]];
}

- (void) test_AWSElasticLoadBalancingInstanceState {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingInstanceState class]];
}

- (void) test_AWSElasticLoadBalancingLBCookieStickinessPolicy {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingLBCookieStickinessPolicy class]];
}

- (void) test_AWSElasticLoadBalancingLimit {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingLimit class]];
}

- (void) test_AWSElasticLoadBalancingListener {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingListener class]];
}

- (void) test_AWSElasticLoadBalancingListenerDescription {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingListenerDescription class]];
}

- (void) test_AWSElasticLoadBalancingLoadBalancerAttributes {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingLoadBalancerAttributes class]];
}

- (void) test_AWSElasticLoadBalancingLoadBalancerDescription {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingLoadBalancerDescription class]];
}

- (void) test_AWSElasticLoadBalancingModifyLoadBalancerAttributesInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingModifyLoadBalancerAttributesInput class]];
}

- (void) test_AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput class]];
}

- (void) test_AWSElasticLoadBalancingPolicies {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingPolicies class]];
}

- (void) test_AWSElasticLoadBalancingPolicyAttribute {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingPolicyAttribute class]];
}

- (void) test_AWSElasticLoadBalancingPolicyAttributeDescription {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingPolicyAttributeDescription class]];
}

- (void) test_AWSElasticLoadBalancingPolicyAttributeTypeDescription {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingPolicyAttributeTypeDescription class]];
}

- (void) test_AWSElasticLoadBalancingPolicyDescription {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingPolicyDescription class]];
}

- (void) test_AWSElasticLoadBalancingPolicyTypeDescription {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingPolicyTypeDescription class]];
}

- (void) test_AWSElasticLoadBalancingRegisterEndPointsInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingRegisterEndPointsInput class]];
}

- (void) test_AWSElasticLoadBalancingRegisterEndPointsOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingRegisterEndPointsOutput class]];
}

- (void) test_AWSElasticLoadBalancingRemoveAvailabilityZonesInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingRemoveAvailabilityZonesInput class]];
}

- (void) test_AWSElasticLoadBalancingRemoveAvailabilityZonesOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingRemoveAvailabilityZonesOutput class]];
}

- (void) test_AWSElasticLoadBalancingRemoveTagsInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingRemoveTagsInput class]];
}

- (void) test_AWSElasticLoadBalancingRemoveTagsOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingRemoveTagsOutput class]];
}

- (void) test_AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput class]];
}

- (void) test_AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput class]];
}

- (void) test_AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput class]];
}

- (void) test_AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput class]];
}

- (void) test_AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput class]];
}

- (void) test_AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput class]];
}

- (void) test_AWSElasticLoadBalancingSourceSecurityGroup {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingSourceSecurityGroup class]];
}

- (void) test_AWSElasticLoadBalancingTag {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingTag class]];
}

- (void) test_AWSElasticLoadBalancingTagDescription {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingTagDescription class]];
}

- (void) test_AWSElasticLoadBalancingTagKeyOnly {
    [self validateSecureCodingForClass:[AWSElasticLoadBalancingTagKeyOnly class]];
}

@end

