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

#import "AWSElasticLoadBalancingModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSElasticLoadBalancingErrorDomain = @"com.amazonaws.AWSElasticLoadBalancingErrorDomain";

@implementation AWSElasticLoadBalancingAccessLog

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emitInterval" : @"EmitInterval",
             @"enabled" : @"Enabled",
             @"s3BucketName" : @"S3BucketName",
             @"s3BucketPrefix" : @"S3BucketPrefix",
             };
}

@end

@implementation AWSElasticLoadBalancingAddAvailabilityZonesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"loadBalancerName" : @"LoadBalancerName",
             };
}

@end

@implementation AWSElasticLoadBalancingAddAvailabilityZonesOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             };
}

@end

@implementation AWSElasticLoadBalancingAddTagsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerNames" : @"LoadBalancerNames",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTag class]];
}

@end

@implementation AWSElasticLoadBalancingAddTagsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingAdditionalAttribute

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSElasticLoadBalancingAppCookieStickinessPolicy

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cookieName" : @"CookieName",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             @"securityGroups" : @"SecurityGroups",
             };
}

@end

@implementation AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroups" : @"SecurityGroups",
             };
}

@end

@implementation AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             @"subnets" : @"Subnets",
             };
}

@end

@implementation AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subnets" : @"Subnets",
             };
}

@end

@implementation AWSElasticLoadBalancingBackendServerDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instancePort" : @"InstancePort",
             @"policyNames" : @"PolicyNames",
             };
}

@end

@implementation AWSElasticLoadBalancingConfigureHealthCheckInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheck" : @"HealthCheck",
             @"loadBalancerName" : @"LoadBalancerName",
             };
}

+ (NSValueTransformer *)healthCheckJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingHealthCheck class]];
}

@end

@implementation AWSElasticLoadBalancingConfigureHealthCheckOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthCheck" : @"HealthCheck",
             };
}

+ (NSValueTransformer *)healthCheckJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingHealthCheck class]];
}

@end

@implementation AWSElasticLoadBalancingConnectionDraining

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"timeout" : @"Timeout",
             };
}

@end

@implementation AWSElasticLoadBalancingConnectionSettings

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"idleTimeout" : @"IdleTimeout",
             };
}

@end

@implementation AWSElasticLoadBalancingCreateAccessPointInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"listeners" : @"Listeners",
             @"loadBalancerName" : @"LoadBalancerName",
             @"scheme" : @"Scheme",
             @"securityGroups" : @"SecurityGroups",
             @"subnets" : @"Subnets",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)listenersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingListener class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTag class]];
}

@end

@implementation AWSElasticLoadBalancingCreateAccessPointOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DNSName" : @"DNSName",
             };
}

@end

@implementation AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cookieName" : @"CookieName",
             @"loadBalancerName" : @"LoadBalancerName",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cookieExpirationPeriod" : @"CookieExpirationPeriod",
             @"loadBalancerName" : @"LoadBalancerName",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingCreateLoadBalancerListenerInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"listeners" : @"Listeners",
             @"loadBalancerName" : @"LoadBalancerName",
             };
}

+ (NSValueTransformer *)listenersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingListener class]];
}

@end

@implementation AWSElasticLoadBalancingCreateLoadBalancerListenerOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingCreateLoadBalancerPolicyInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             @"policyAttributes" : @"PolicyAttributes",
             @"policyName" : @"PolicyName",
             @"policyTypeName" : @"PolicyTypeName",
             };
}

+ (NSValueTransformer *)policyAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingPolicyAttribute class]];
}

@end

@implementation AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingCrossZoneLoadBalancing

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSElasticLoadBalancingDeleteAccessPointInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             };
}

@end

@implementation AWSElasticLoadBalancingDeleteAccessPointOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingDeleteLoadBalancerListenerInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             @"loadBalancerPorts" : @"LoadBalancerPorts",
             };
}

@end

@implementation AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingDeregisterEndPointsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instances" : @"Instances",
             @"loadBalancerName" : @"LoadBalancerName",
             };
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingInstance class]];
}

@end

@implementation AWSElasticLoadBalancingDeregisterEndPointsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instances" : @"Instances",
             };
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingInstance class]];
}

@end

@implementation AWSElasticLoadBalancingDescribeAccessPointsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerNames" : @"LoadBalancerNames",
             @"marker" : @"Marker",
             @"pageSize" : @"PageSize",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeAccessPointsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerDescriptions" : @"LoadBalancerDescriptions",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)loadBalancerDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingLoadBalancerDescription class]];
}

@end

@implementation AWSElasticLoadBalancingDescribeAccountLimitsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"pageSize" : @"PageSize",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeAccountLimitsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limits" : @"Limits",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)limitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingLimit class]];
}

@end

@implementation AWSElasticLoadBalancingDescribeEndPointStateInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instances" : @"Instances",
             @"loadBalancerName" : @"LoadBalancerName",
             };
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingInstance class]];
}

@end

@implementation AWSElasticLoadBalancingDescribeEndPointStateOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceStates" : @"InstanceStates",
             };
}

+ (NSValueTransformer *)instanceStatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingInstanceState class]];
}

@end

@implementation AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerAttributes" : @"LoadBalancerAttributes",
             };
}

+ (NSValueTransformer *)loadBalancerAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingLoadBalancerAttributes class]];
}

@end

@implementation AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             @"policyNames" : @"PolicyNames",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyDescriptions" : @"PolicyDescriptions",
             };
}

+ (NSValueTransformer *)policyDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingPolicyDescription class]];
}

@end

@implementation AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyTypeNames" : @"PolicyTypeNames",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyTypeDescriptions" : @"PolicyTypeDescriptions",
             };
}

+ (NSValueTransformer *)policyTypeDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingPolicyTypeDescription class]];
}

@end

@implementation AWSElasticLoadBalancingDescribeTagsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerNames" : @"LoadBalancerNames",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeTagsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagDescriptions" : @"TagDescriptions",
             };
}

+ (NSValueTransformer *)tagDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTagDescription class]];
}

@end

@implementation AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             @"subnets" : @"Subnets",
             };
}

@end

@implementation AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subnets" : @"Subnets",
             };
}

@end

@implementation AWSElasticLoadBalancingHealthCheck

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthyThreshold" : @"HealthyThreshold",
             @"interval" : @"Interval",
             @"target" : @"Target",
             @"timeout" : @"Timeout",
             @"unhealthyThreshold" : @"UnhealthyThreshold",
             };
}

@end

@implementation AWSElasticLoadBalancingInstance

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSElasticLoadBalancingInstanceState

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"instanceId" : @"InstanceId",
             @"reasonCode" : @"ReasonCode",
             @"state" : @"State",
             };
}

@end

@implementation AWSElasticLoadBalancingLBCookieStickinessPolicy

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cookieExpirationPeriod" : @"CookieExpirationPeriod",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSElasticLoadBalancingLimit

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"max" : @"Max",
             @"name" : @"Name",
             };
}

@end

@implementation AWSElasticLoadBalancingListener

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instancePort" : @"InstancePort",
             @"instanceProtocol" : @"InstanceProtocol",
             @"loadBalancerPort" : @"LoadBalancerPort",
             @"protocols" : @"Protocol",
             @"SSLCertificateId" : @"SSLCertificateId",
             };
}

@end

@implementation AWSElasticLoadBalancingListenerDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"listener" : @"Listener",
             @"policyNames" : @"PolicyNames",
             };
}

+ (NSValueTransformer *)listenerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingListener class]];
}

@end

@implementation AWSElasticLoadBalancingLoadBalancerAttributes

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessLog" : @"AccessLog",
             @"additionalAttributes" : @"AdditionalAttributes",
             @"connectionDraining" : @"ConnectionDraining",
             @"connectionSettings" : @"ConnectionSettings",
             @"crossZoneLoadBalancing" : @"CrossZoneLoadBalancing",
             };
}

+ (NSValueTransformer *)accessLogJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingAccessLog class]];
}

+ (NSValueTransformer *)additionalAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingAdditionalAttribute class]];
}

+ (NSValueTransformer *)connectionDrainingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingConnectionDraining class]];
}

+ (NSValueTransformer *)connectionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingConnectionSettings class]];
}

+ (NSValueTransformer *)crossZoneLoadBalancingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingCrossZoneLoadBalancing class]];
}

@end

@implementation AWSElasticLoadBalancingLoadBalancerDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"backendServerDescriptions" : @"BackendServerDescriptions",
             @"canonicalHostedZoneName" : @"CanonicalHostedZoneName",
             @"canonicalHostedZoneNameID" : @"CanonicalHostedZoneNameID",
             @"createdTime" : @"CreatedTime",
             @"DNSName" : @"DNSName",
             @"healthCheck" : @"HealthCheck",
             @"instances" : @"Instances",
             @"listenerDescriptions" : @"ListenerDescriptions",
             @"loadBalancerName" : @"LoadBalancerName",
             @"policies" : @"Policies",
             @"scheme" : @"Scheme",
             @"securityGroups" : @"SecurityGroups",
             @"sourceSecurityGroup" : @"SourceSecurityGroup",
             @"subnets" : @"Subnets",
             @"VPCId" : @"VPCId",
             };
}

+ (NSValueTransformer *)backendServerDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingBackendServerDescription class]];
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)healthCheckJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingHealthCheck class]];
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingInstance class]];
}

+ (NSValueTransformer *)listenerDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingListenerDescription class]];
}

+ (NSValueTransformer *)policiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingPolicies class]];
}

+ (NSValueTransformer *)sourceSecurityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingSourceSecurityGroup class]];
}

@end

@implementation AWSElasticLoadBalancingModifyLoadBalancerAttributesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerAttributes" : @"LoadBalancerAttributes",
             @"loadBalancerName" : @"LoadBalancerName",
             };
}

+ (NSValueTransformer *)loadBalancerAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingLoadBalancerAttributes class]];
}

@end

@implementation AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerAttributes" : @"LoadBalancerAttributes",
             @"loadBalancerName" : @"LoadBalancerName",
             };
}

+ (NSValueTransformer *)loadBalancerAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingLoadBalancerAttributes class]];
}

@end

@implementation AWSElasticLoadBalancingPolicies

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appCookieStickinessPolicies" : @"AppCookieStickinessPolicies",
             @"LBCookieStickinessPolicies" : @"LBCookieStickinessPolicies",
             @"otherPolicies" : @"OtherPolicies",
             };
}

+ (NSValueTransformer *)appCookieStickinessPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingAppCookieStickinessPolicy class]];
}

+ (NSValueTransformer *)LBCookieStickinessPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingLBCookieStickinessPolicy class]];
}

@end

@implementation AWSElasticLoadBalancingPolicyAttribute

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"attributeValue" : @"AttributeValue",
             };
}

@end

@implementation AWSElasticLoadBalancingPolicyAttributeDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"attributeValue" : @"AttributeValue",
             };
}

@end

@implementation AWSElasticLoadBalancingPolicyAttributeTypeDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"attributeType" : @"AttributeType",
             @"cardinality" : @"Cardinality",
             @"defaultValue" : @"DefaultValue",
             @"detail" : @"Description",
             };
}

@end

@implementation AWSElasticLoadBalancingPolicyDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyAttributeDescriptions" : @"PolicyAttributeDescriptions",
             @"policyName" : @"PolicyName",
             @"policyTypeName" : @"PolicyTypeName",
             };
}

+ (NSValueTransformer *)policyAttributeDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingPolicyAttributeDescription class]];
}

@end

@implementation AWSElasticLoadBalancingPolicyTypeDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"policyAttributeTypeDescriptions" : @"PolicyAttributeTypeDescriptions",
             @"policyTypeName" : @"PolicyTypeName",
             };
}

+ (NSValueTransformer *)policyAttributeTypeDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingPolicyAttributeTypeDescription class]];
}

@end

@implementation AWSElasticLoadBalancingRegisterEndPointsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instances" : @"Instances",
             @"loadBalancerName" : @"LoadBalancerName",
             };
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingInstance class]];
}

@end

@implementation AWSElasticLoadBalancingRegisterEndPointsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instances" : @"Instances",
             };
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingInstance class]];
}

@end

@implementation AWSElasticLoadBalancingRemoveAvailabilityZonesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"loadBalancerName" : @"LoadBalancerName",
             };
}

@end

@implementation AWSElasticLoadBalancingRemoveAvailabilityZonesOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             };
}

@end

@implementation AWSElasticLoadBalancingRemoveTagsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerNames" : @"LoadBalancerNames",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTagKeyOnly class]];
}

@end

@implementation AWSElasticLoadBalancingRemoveTagsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             @"loadBalancerPort" : @"LoadBalancerPort",
             @"SSLCertificateId" : @"SSLCertificateId",
             };
}

@end

@implementation AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instancePort" : @"InstancePort",
             @"loadBalancerName" : @"LoadBalancerName",
             @"policyNames" : @"PolicyNames",
             };
}

@end

@implementation AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             @"loadBalancerPort" : @"LoadBalancerPort",
             @"policyNames" : @"PolicyNames",
             };
}

@end

@implementation AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSElasticLoadBalancingSourceSecurityGroup

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"ownerAlias" : @"OwnerAlias",
             };
}

@end

@implementation AWSElasticLoadBalancingTag

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSElasticLoadBalancingTagDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticLoadBalancingTag class]];
}

@end

@implementation AWSElasticLoadBalancingTagKeyOnly

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             };
}

@end
