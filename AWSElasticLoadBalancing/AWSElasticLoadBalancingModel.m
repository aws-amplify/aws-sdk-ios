/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSElasticLoadBalancingModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSElasticLoadBalancingErrorDomain = @"com.amazonaws.AWSElasticLoadBalancingErrorDomain";

@implementation AWSElasticLoadBalancingAccessLog

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"loadBalancerName" : @"LoadBalancerName",
             };
}

@end

@implementation AWSElasticLoadBalancingAddAvailabilityZonesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             };
}

@end

@implementation AWSElasticLoadBalancingAddTagsInput

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

@end

@implementation AWSElasticLoadBalancingAppCookieStickinessPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cookieName" : @"CookieName",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             @"securityGroups" : @"SecurityGroups",
             };
}

@end

@implementation AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroups" : @"SecurityGroups",
             };
}

@end

@implementation AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             @"subnets" : @"Subnets",
             };
}

@end

@implementation AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subnets" : @"Subnets",
             };
}

@end

@implementation AWSElasticLoadBalancingBackendServerDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instancePort" : @"InstancePort",
             @"policyNames" : @"PolicyNames",
             };
}

@end

@implementation AWSElasticLoadBalancingConfigureHealthCheckInput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"timeout" : @"Timeout",
             };
}

@end

@implementation AWSElasticLoadBalancingConnectionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"idleTimeout" : @"IdleTimeout",
             };
}

@end

@implementation AWSElasticLoadBalancingCreateAccessPointInput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DNSName" : @"DNSName",
             };
}

@end

@implementation AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cookieName" : @"CookieName",
             @"loadBalancerName" : @"LoadBalancerName",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput

@end

@implementation AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cookieExpirationPeriod" : @"CookieExpirationPeriod",
             @"loadBalancerName" : @"LoadBalancerName",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput

@end

@implementation AWSElasticLoadBalancingCreateLoadBalancerListenerInput

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

@end

@implementation AWSElasticLoadBalancingCreateLoadBalancerPolicyInput

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

@end

@implementation AWSElasticLoadBalancingCrossZoneLoadBalancing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSElasticLoadBalancingDeleteAccessPointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             };
}

@end

@implementation AWSElasticLoadBalancingDeleteAccessPointOutput

@end

@implementation AWSElasticLoadBalancingDeleteLoadBalancerListenerInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             @"loadBalancerPorts" : @"LoadBalancerPorts",
             };
}

@end

@implementation AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput

@end

@implementation AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput

@end

@implementation AWSElasticLoadBalancingDeregisterEndPointsInput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerNames" : @"LoadBalancerNames",
             @"marker" : @"Marker",
             @"pageSize" : @"PageSize",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeAccessPointsOutput

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

@implementation AWSElasticLoadBalancingDescribeEndPointStateInput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             @"policyNames" : @"PolicyNames",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyTypeNames" : @"PolicyTypeNames",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerNames" : @"LoadBalancerNames",
             };
}

@end

@implementation AWSElasticLoadBalancingDescribeTagsOutput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             @"subnets" : @"Subnets",
             };
}

@end

@implementation AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subnets" : @"Subnets",
             };
}

@end

@implementation AWSElasticLoadBalancingHealthCheck

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSElasticLoadBalancingInstanceState

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cookieExpirationPeriod" : @"CookieExpirationPeriod",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSElasticLoadBalancingListener

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessLog" : @"AccessLog",
             @"connectionDraining" : @"ConnectionDraining",
             @"connectionSettings" : @"ConnectionSettings",
             @"crossZoneLoadBalancing" : @"CrossZoneLoadBalancing",
             };
}

+ (NSValueTransformer *)accessLogJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticLoadBalancingAccessLog class]];
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"attributeValue" : @"AttributeValue",
             };
}

@end

@implementation AWSElasticLoadBalancingPolicyAttributeDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"attributeValue" : @"AttributeValue",
             };
}

@end

@implementation AWSElasticLoadBalancingPolicyAttributeTypeDescription

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"loadBalancerName" : @"LoadBalancerName",
             };
}

@end

@implementation AWSElasticLoadBalancingRemoveAvailabilityZonesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             };
}

@end

@implementation AWSElasticLoadBalancingRemoveTagsInput

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

@end

@implementation AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             @"loadBalancerPort" : @"LoadBalancerPort",
             @"SSLCertificateId" : @"SSLCertificateId",
             };
}

@end

@implementation AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput

@end

@implementation AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instancePort" : @"InstancePort",
             @"loadBalancerName" : @"LoadBalancerName",
             @"policyNames" : @"PolicyNames",
             };
}

@end

@implementation AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput

@end

@implementation AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             @"loadBalancerPort" : @"LoadBalancerPort",
             @"policyNames" : @"PolicyNames",
             };
}

@end

@implementation AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput

@end

@implementation AWSElasticLoadBalancingSourceSecurityGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"ownerAlias" : @"OwnerAlias",
             };
}

@end

@implementation AWSElasticLoadBalancingTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSElasticLoadBalancingTagDescription

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             };
}

@end
