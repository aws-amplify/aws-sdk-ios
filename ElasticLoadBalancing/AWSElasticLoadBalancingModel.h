/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "AWSNetworking.h"
#import "AWSModel.h"

FOUNDATION_EXPORT NSString *const AWSElasticLoadBalancingErrorDomain;

typedef NS_ENUM(NSInteger, AWSElasticLoadBalancingErrorType) {
    AWSElasticLoadBalancingErrorUnknown,
    AWSElasticLoadBalancingErrorIncompleteSignature,
    AWSElasticLoadBalancingErrorInvalidClientTokenId,
    AWSElasticLoadBalancingErrorMissingAuthenticationToken,
    AWSElasticLoadBalancingErrorAccessPointNotFound,
    AWSElasticLoadBalancingErrorCertificateNotFound,
    AWSElasticLoadBalancingErrorDuplicateAccessPointName,
    AWSElasticLoadBalancingErrorDuplicateListener,
    AWSElasticLoadBalancingErrorDuplicatePolicyName,
    AWSElasticLoadBalancingErrorDuplicateTagKeys,
    AWSElasticLoadBalancingErrorInvalidConfigurationRequest,
    AWSElasticLoadBalancingErrorInvalidEndPoint,
    AWSElasticLoadBalancingErrorInvalidScheme,
    AWSElasticLoadBalancingErrorInvalidSecurityGroup,
    AWSElasticLoadBalancingErrorInvalidSubnet,
    AWSElasticLoadBalancingErrorListenerNotFound,
    AWSElasticLoadBalancingErrorLoadBalancerAttributeNotFound,
    AWSElasticLoadBalancingErrorPolicyNotFound,
    AWSElasticLoadBalancingErrorPolicyTypeNotFound,
    AWSElasticLoadBalancingErrorSubnetNotFound,
    AWSElasticLoadBalancingErrorTooManyAccessPoints,
    AWSElasticLoadBalancingErrorTooManyPolicies,
    AWSElasticLoadBalancingErrorTooManyTags,
};

@class AWSElasticLoadBalancingAccessLog;
@class AWSElasticLoadBalancingAddAvailabilityZonesInput;
@class AWSElasticLoadBalancingAddAvailabilityZonesOutput;
@class AWSElasticLoadBalancingAddTagsInput;
@class AWSElasticLoadBalancingAddTagsOutput;
@class AWSElasticLoadBalancingAppCookieStickinessPolicy;
@class AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput;
@class AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput;
@class AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput;
@class AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput;
@class AWSElasticLoadBalancingBackendServerDescription;
@class AWSElasticLoadBalancingConfigureHealthCheckInput;
@class AWSElasticLoadBalancingConfigureHealthCheckOutput;
@class AWSElasticLoadBalancingConnectionDraining;
@class AWSElasticLoadBalancingConnectionSettings;
@class AWSElasticLoadBalancingCreateAccessPointInput;
@class AWSElasticLoadBalancingCreateAccessPointOutput;
@class AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput;
@class AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput;
@class AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput;
@class AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput;
@class AWSElasticLoadBalancingCreateLoadBalancerListenerInput;
@class AWSElasticLoadBalancingCreateLoadBalancerListenerOutput;
@class AWSElasticLoadBalancingCreateLoadBalancerPolicyInput;
@class AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput;
@class AWSElasticLoadBalancingCrossZoneLoadBalancing;
@class AWSElasticLoadBalancingDeleteAccessPointInput;
@class AWSElasticLoadBalancingDeleteAccessPointOutput;
@class AWSElasticLoadBalancingDeleteLoadBalancerListenerInput;
@class AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput;
@class AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput;
@class AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput;
@class AWSElasticLoadBalancingDeregisterEndPointsInput;
@class AWSElasticLoadBalancingDeregisterEndPointsOutput;
@class AWSElasticLoadBalancingDescribeAccessPointsInput;
@class AWSElasticLoadBalancingDescribeAccessPointsOutput;
@class AWSElasticLoadBalancingDescribeEndPointStateInput;
@class AWSElasticLoadBalancingDescribeEndPointStateOutput;
@class AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput;
@class AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput;
@class AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput;
@class AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput;
@class AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput;
@class AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput;
@class AWSElasticLoadBalancingDescribeTagsInput;
@class AWSElasticLoadBalancingDescribeTagsOutput;
@class AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput;
@class AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput;
@class AWSElasticLoadBalancingHealthCheck;
@class AWSElasticLoadBalancingInstance;
@class AWSElasticLoadBalancingInstanceState;
@class AWSElasticLoadBalancingLBCookieStickinessPolicy;
@class AWSElasticLoadBalancingListener;
@class AWSElasticLoadBalancingListenerDescription;
@class AWSElasticLoadBalancingLoadBalancerAttributes;
@class AWSElasticLoadBalancingLoadBalancerDescription;
@class AWSElasticLoadBalancingModifyLoadBalancerAttributesInput;
@class AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput;
@class AWSElasticLoadBalancingPolicies;
@class AWSElasticLoadBalancingPolicyAttribute;
@class AWSElasticLoadBalancingPolicyAttributeDescription;
@class AWSElasticLoadBalancingPolicyAttributeTypeDescription;
@class AWSElasticLoadBalancingPolicyDescription;
@class AWSElasticLoadBalancingPolicyTypeDescription;
@class AWSElasticLoadBalancingRegisterEndPointsInput;
@class AWSElasticLoadBalancingRegisterEndPointsOutput;
@class AWSElasticLoadBalancingRemoveAvailabilityZonesInput;
@class AWSElasticLoadBalancingRemoveAvailabilityZonesOutput;
@class AWSElasticLoadBalancingRemoveTagsInput;
@class AWSElasticLoadBalancingRemoveTagsOutput;
@class AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput;
@class AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput;
@class AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput;
@class AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput;
@class AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput;
@class AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput;
@class AWSElasticLoadBalancingSourceSecurityGroup;
@class AWSElasticLoadBalancingTag;
@class AWSElasticLoadBalancingTagDescription;
@class AWSElasticLoadBalancingTagKeyOnly;

@interface AWSElasticLoadBalancingAccessLog : AWSModel

@property (nonatomic, strong) NSNumber *emitInterval;
@property (nonatomic, strong) NSNumber *enabled;
@property (nonatomic, strong) NSString *s3BucketName;
@property (nonatomic, strong) NSString *s3BucketPrefix;

@end

@interface AWSElasticLoadBalancingAddAvailabilityZonesInput : AWSRequest

@property (nonatomic, strong) NSArray *availabilityZones;
@property (nonatomic, strong) NSString *loadBalancerName;

@end

@interface AWSElasticLoadBalancingAddAvailabilityZonesOutput : AWSModel

@property (nonatomic, strong) NSArray *availabilityZones;

@end

@interface AWSElasticLoadBalancingAddTagsInput : AWSRequest

@property (nonatomic, strong) NSArray *loadBalancerNames;
@property (nonatomic, strong) NSArray *tags;

@end

@interface AWSElasticLoadBalancingAddTagsOutput : AWSModel


@end

@interface AWSElasticLoadBalancingAppCookieStickinessPolicy : AWSModel

@property (nonatomic, strong) NSString *cookieName;
@property (nonatomic, strong) NSString *policyName;

@end

@interface AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput : AWSRequest

@property (nonatomic, strong) NSString *loadBalancerName;
@property (nonatomic, strong) NSArray *securityGroups;

@end

@interface AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput : AWSModel

@property (nonatomic, strong) NSArray *securityGroups;

@end

@interface AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput : AWSRequest

@property (nonatomic, strong) NSString *loadBalancerName;
@property (nonatomic, strong) NSArray *subnets;

@end

@interface AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput : AWSModel

@property (nonatomic, strong) NSArray *subnets;

@end

@interface AWSElasticLoadBalancingBackendServerDescription : AWSModel

@property (nonatomic, strong) NSNumber *instancePort;
@property (nonatomic, strong) NSArray *policyNames;

@end

@interface AWSElasticLoadBalancingConfigureHealthCheckInput : AWSRequest

@property (nonatomic, strong) AWSElasticLoadBalancingHealthCheck *healthCheck;
@property (nonatomic, strong) NSString *loadBalancerName;

@end

@interface AWSElasticLoadBalancingConfigureHealthCheckOutput : AWSModel

@property (nonatomic, strong) AWSElasticLoadBalancingHealthCheck *healthCheck;

@end

@interface AWSElasticLoadBalancingConnectionDraining : AWSModel

@property (nonatomic, strong) NSNumber *enabled;
@property (nonatomic, strong) NSNumber *timeout;

@end

@interface AWSElasticLoadBalancingConnectionSettings : AWSModel

@property (nonatomic, strong) NSNumber *idleTimeout;

@end

@interface AWSElasticLoadBalancingCreateAccessPointInput : AWSRequest

@property (nonatomic, strong) NSArray *availabilityZones;
@property (nonatomic, strong) NSArray *listeners;
@property (nonatomic, strong) NSString *loadBalancerName;
@property (nonatomic, strong) NSString *scheme;
@property (nonatomic, strong) NSArray *securityGroups;
@property (nonatomic, strong) NSArray *subnets;
@property (nonatomic, strong) NSArray *tags;

@end

@interface AWSElasticLoadBalancingCreateAccessPointOutput : AWSModel

@property (nonatomic, strong) NSString *DNSName;

@end

@interface AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput : AWSRequest

@property (nonatomic, strong) NSString *cookieName;
@property (nonatomic, strong) NSString *loadBalancerName;
@property (nonatomic, strong) NSString *policyName;

@end

@interface AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput : AWSModel


@end

@interface AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput : AWSRequest

@property (nonatomic, strong) NSNumber *cookieExpirationPeriod;
@property (nonatomic, strong) NSString *loadBalancerName;
@property (nonatomic, strong) NSString *policyName;

@end

@interface AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput : AWSModel


@end

@interface AWSElasticLoadBalancingCreateLoadBalancerListenerInput : AWSRequest

@property (nonatomic, strong) NSArray *listeners;
@property (nonatomic, strong) NSString *loadBalancerName;

@end

@interface AWSElasticLoadBalancingCreateLoadBalancerListenerOutput : AWSModel


@end

@interface AWSElasticLoadBalancingCreateLoadBalancerPolicyInput : AWSRequest

@property (nonatomic, strong) NSString *loadBalancerName;
@property (nonatomic, strong) NSArray *policyAttributes;
@property (nonatomic, strong) NSString *policyName;
@property (nonatomic, strong) NSString *policyTypeName;

@end

@interface AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput : AWSModel


@end

@interface AWSElasticLoadBalancingCrossZoneLoadBalancing : AWSModel

@property (nonatomic, strong) NSNumber *enabled;

@end

@interface AWSElasticLoadBalancingDeleteAccessPointInput : AWSRequest

@property (nonatomic, strong) NSString *loadBalancerName;

@end

@interface AWSElasticLoadBalancingDeleteAccessPointOutput : AWSModel


@end

@interface AWSElasticLoadBalancingDeleteLoadBalancerListenerInput : AWSRequest

@property (nonatomic, strong) NSString *loadBalancerName;
@property (nonatomic, strong) NSArray *loadBalancerPorts;

@end

@interface AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput : AWSModel


@end

@interface AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput : AWSRequest

@property (nonatomic, strong) NSString *loadBalancerName;
@property (nonatomic, strong) NSString *policyName;

@end

@interface AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput : AWSModel


@end

@interface AWSElasticLoadBalancingDeregisterEndPointsInput : AWSRequest

@property (nonatomic, strong) NSArray *instances;
@property (nonatomic, strong) NSString *loadBalancerName;

@end

@interface AWSElasticLoadBalancingDeregisterEndPointsOutput : AWSModel

@property (nonatomic, strong) NSArray *instances;

@end

@interface AWSElasticLoadBalancingDescribeAccessPointsInput : AWSRequest

@property (nonatomic, strong) NSArray *loadBalancerNames;
@property (nonatomic, strong) NSString *marker;
@property (nonatomic, strong) NSNumber *pageSize;

@end

@interface AWSElasticLoadBalancingDescribeAccessPointsOutput : AWSModel

@property (nonatomic, strong) NSArray *loadBalancerDescriptions;
@property (nonatomic, strong) NSString *nextMarker;

@end

@interface AWSElasticLoadBalancingDescribeEndPointStateInput : AWSRequest

@property (nonatomic, strong) NSArray *instances;
@property (nonatomic, strong) NSString *loadBalancerName;

@end

@interface AWSElasticLoadBalancingDescribeEndPointStateOutput : AWSModel

@property (nonatomic, strong) NSArray *instanceStates;

@end

@interface AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput : AWSRequest

@property (nonatomic, strong) NSString *loadBalancerName;

@end

@interface AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput : AWSModel

@property (nonatomic, strong) AWSElasticLoadBalancingLoadBalancerAttributes *loadBalancerAttributes;

@end

@interface AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput : AWSRequest

@property (nonatomic, strong) NSString *loadBalancerName;
@property (nonatomic, strong) NSArray *policyNames;

@end

@interface AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput : AWSModel

@property (nonatomic, strong) NSArray *policyDescriptions;

@end

@interface AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput : AWSRequest

@property (nonatomic, strong) NSArray *policyTypeNames;

@end

@interface AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput : AWSModel

@property (nonatomic, strong) NSArray *policyTypeDescriptions;

@end

@interface AWSElasticLoadBalancingDescribeTagsInput : AWSRequest

@property (nonatomic, strong) NSArray *loadBalancerNames;

@end

@interface AWSElasticLoadBalancingDescribeTagsOutput : AWSModel

@property (nonatomic, strong) NSArray *tagDescriptions;

@end

@interface AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput : AWSRequest

@property (nonatomic, strong) NSString *loadBalancerName;
@property (nonatomic, strong) NSArray *subnets;

@end

@interface AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput : AWSModel

@property (nonatomic, strong) NSArray *subnets;

@end

@interface AWSElasticLoadBalancingHealthCheck : AWSModel

@property (nonatomic, strong) NSNumber *healthyThreshold;
@property (nonatomic, strong) NSNumber *interval;
@property (nonatomic, strong) NSString *target;
@property (nonatomic, strong) NSNumber *timeout;
@property (nonatomic, strong) NSNumber *unhealthyThreshold;

@end

@interface AWSElasticLoadBalancingInstance : AWSModel

@property (nonatomic, strong) NSString *instanceId;

@end

@interface AWSElasticLoadBalancingInstanceState : AWSModel

@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSString *instanceId;
@property (nonatomic, strong) NSString *reasonCode;
@property (nonatomic, strong) NSString *state;

@end

@interface AWSElasticLoadBalancingLBCookieStickinessPolicy : AWSModel

@property (nonatomic, strong) NSNumber *cookieExpirationPeriod;
@property (nonatomic, strong) NSString *policyName;

@end

@interface AWSElasticLoadBalancingListener : AWSModel

@property (nonatomic, strong) NSNumber *instancePort;
@property (nonatomic, strong) NSString *instanceProtocol;
@property (nonatomic, strong) NSNumber *loadBalancerPort;
@property (nonatomic, strong) NSString *protocol;
@property (nonatomic, strong) NSString *SSLCertificateId;

@end

@interface AWSElasticLoadBalancingListenerDescription : AWSModel

@property (nonatomic, strong) AWSElasticLoadBalancingListener *listener;
@property (nonatomic, strong) NSArray *policyNames;

@end

@interface AWSElasticLoadBalancingLoadBalancerAttributes : AWSModel

@property (nonatomic, strong) AWSElasticLoadBalancingAccessLog *accessLog;
@property (nonatomic, strong) AWSElasticLoadBalancingConnectionDraining *connectionDraining;
@property (nonatomic, strong) AWSElasticLoadBalancingConnectionSettings *connectionSettings;
@property (nonatomic, strong) AWSElasticLoadBalancingCrossZoneLoadBalancing *crossZoneLoadBalancing;

@end

@interface AWSElasticLoadBalancingLoadBalancerDescription : AWSModel

@property (nonatomic, strong) NSArray *availabilityZones;
@property (nonatomic, strong) NSArray *backendServerDescriptions;
@property (nonatomic, strong) NSString *canonicalHostedZoneName;
@property (nonatomic, strong) NSString *canonicalHostedZoneNameID;
@property (nonatomic, strong) NSDate *createdTime;
@property (nonatomic, strong) NSString *DNSName;
@property (nonatomic, strong) AWSElasticLoadBalancingHealthCheck *healthCheck;
@property (nonatomic, strong) NSArray *instances;
@property (nonatomic, strong) NSArray *listenerDescriptions;
@property (nonatomic, strong) NSString *loadBalancerName;
@property (nonatomic, strong) AWSElasticLoadBalancingPolicies *policies;
@property (nonatomic, strong) NSString *scheme;
@property (nonatomic, strong) NSArray *securityGroups;
@property (nonatomic, strong) AWSElasticLoadBalancingSourceSecurityGroup *sourceSecurityGroup;
@property (nonatomic, strong) NSArray *subnets;
@property (nonatomic, strong) NSString *VPCId;

@end

@interface AWSElasticLoadBalancingModifyLoadBalancerAttributesInput : AWSRequest

@property (nonatomic, strong) AWSElasticLoadBalancingLoadBalancerAttributes *loadBalancerAttributes;
@property (nonatomic, strong) NSString *loadBalancerName;

@end

@interface AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput : AWSModel

@property (nonatomic, strong) AWSElasticLoadBalancingLoadBalancerAttributes *loadBalancerAttributes;
@property (nonatomic, strong) NSString *loadBalancerName;

@end

@interface AWSElasticLoadBalancingPolicies : AWSModel

@property (nonatomic, strong) NSArray *appCookieStickinessPolicies;
@property (nonatomic, strong) NSArray *LBCookieStickinessPolicies;
@property (nonatomic, strong) NSArray *otherPolicies;

@end

@interface AWSElasticLoadBalancingPolicyAttribute : AWSModel

@property (nonatomic, strong) NSString *attributeName;
@property (nonatomic, strong) NSString *attributeValue;

@end

@interface AWSElasticLoadBalancingPolicyAttributeDescription : AWSModel

@property (nonatomic, strong) NSString *attributeName;
@property (nonatomic, strong) NSString *attributeValue;

@end

@interface AWSElasticLoadBalancingPolicyAttributeTypeDescription : AWSModel

@property (nonatomic, strong) NSString *attributeName;
@property (nonatomic, strong) NSString *attributeType;
@property (nonatomic, strong) NSString *cardinality;
@property (nonatomic, strong) NSString *defaultValue;
@property (nonatomic, strong) NSString *detail;

@end

@interface AWSElasticLoadBalancingPolicyDescription : AWSModel

@property (nonatomic, strong) NSArray *policyAttributeDescriptions;
@property (nonatomic, strong) NSString *policyName;
@property (nonatomic, strong) NSString *policyTypeName;

@end

@interface AWSElasticLoadBalancingPolicyTypeDescription : AWSModel

@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSArray *policyAttributeTypeDescriptions;
@property (nonatomic, strong) NSString *policyTypeName;

@end

@interface AWSElasticLoadBalancingRegisterEndPointsInput : AWSRequest

@property (nonatomic, strong) NSArray *instances;
@property (nonatomic, strong) NSString *loadBalancerName;

@end

@interface AWSElasticLoadBalancingRegisterEndPointsOutput : AWSModel

@property (nonatomic, strong) NSArray *instances;

@end

@interface AWSElasticLoadBalancingRemoveAvailabilityZonesInput : AWSRequest

@property (nonatomic, strong) NSArray *availabilityZones;
@property (nonatomic, strong) NSString *loadBalancerName;

@end

@interface AWSElasticLoadBalancingRemoveAvailabilityZonesOutput : AWSModel

@property (nonatomic, strong) NSArray *availabilityZones;

@end

@interface AWSElasticLoadBalancingRemoveTagsInput : AWSRequest

@property (nonatomic, strong) NSArray *loadBalancerNames;
@property (nonatomic, strong) NSArray *tags;

@end

@interface AWSElasticLoadBalancingRemoveTagsOutput : AWSModel


@end

@interface AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput : AWSRequest

@property (nonatomic, strong) NSString *loadBalancerName;
@property (nonatomic, strong) NSNumber *loadBalancerPort;
@property (nonatomic, strong) NSString *SSLCertificateId;

@end

@interface AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput : AWSModel


@end

@interface AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput : AWSRequest

@property (nonatomic, strong) NSNumber *instancePort;
@property (nonatomic, strong) NSString *loadBalancerName;
@property (nonatomic, strong) NSArray *policyNames;

@end

@interface AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput : AWSModel


@end

@interface AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput : AWSRequest

@property (nonatomic, strong) NSString *loadBalancerName;
@property (nonatomic, strong) NSNumber *loadBalancerPort;
@property (nonatomic, strong) NSArray *policyNames;

@end

@interface AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput : AWSModel


@end

@interface AWSElasticLoadBalancingSourceSecurityGroup : AWSModel

@property (nonatomic, strong) NSString *groupName;
@property (nonatomic, strong) NSString *ownerAlias;

@end

@interface AWSElasticLoadBalancingTag : AWSModel

@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *value;

@end

@interface AWSElasticLoadBalancingTagDescription : AWSModel

@property (nonatomic, strong) NSString *loadBalancerName;
@property (nonatomic, strong) NSArray *tags;

@end

@interface AWSElasticLoadBalancingTagKeyOnly : AWSModel

@property (nonatomic, strong) NSString *key;

@end
