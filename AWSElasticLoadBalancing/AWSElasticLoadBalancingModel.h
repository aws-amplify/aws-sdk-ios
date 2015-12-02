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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

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

/**
 
 */
@interface AWSElasticLoadBalancingAccessLog : AWSModel


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable emitInterval;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable s3BucketName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable s3BucketPrefix;

@end

/**
 
 */
@interface AWSElasticLoadBalancingAddAvailabilityZonesInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable availabilityZones;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 
 */
@interface AWSElasticLoadBalancingAddAvailabilityZonesOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable availabilityZones;

@end

/**
 
 */
@interface AWSElasticLoadBalancingAddTagsInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable loadBalancerNames;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable tags;

@end

/**
 
 */
@interface AWSElasticLoadBalancingAddTagsOutput : AWSModel


@end

/**
 
 */
@interface AWSElasticLoadBalancingAppCookieStickinessPolicy : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable cookieName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 
 */
@interface AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable securityGroups;

@end

/**
 
 */
@interface AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable securityGroups;

@end

/**
 
 */
@interface AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable subnets;

@end

/**
 
 */
@interface AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable subnets;

@end

/**
 
 */
@interface AWSElasticLoadBalancingBackendServerDescription : AWSModel


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable instancePort;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable policyNames;

@end

/**
 
 */
@interface AWSElasticLoadBalancingConfigureHealthCheckInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) AWSElasticLoadBalancingHealthCheck * _Nullable healthCheck;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 
 */
@interface AWSElasticLoadBalancingConfigureHealthCheckOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSElasticLoadBalancingHealthCheck * _Nullable healthCheck;

@end

/**
 
 */
@interface AWSElasticLoadBalancingConnectionDraining : AWSModel


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

@end

/**
 
 */
@interface AWSElasticLoadBalancingConnectionSettings : AWSModel


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable idleTimeout;

@end

/**
 
 */
@interface AWSElasticLoadBalancingCreateAccessPointInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable availabilityZones;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable listeners;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable scheme;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable securityGroups;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable subnets;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable tags;

@end

/**
 
 */
@interface AWSElasticLoadBalancingCreateAccessPointOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable DNSName;

@end

/**
 
 */
@interface AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable cookieName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 
 */
@interface AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput : AWSModel


@end

/**
 
 */
@interface AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable cookieExpirationPeriod;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 
 */
@interface AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput : AWSModel


@end

/**
 
 */
@interface AWSElasticLoadBalancingCreateLoadBalancerListenerInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable listeners;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 
 */
@interface AWSElasticLoadBalancingCreateLoadBalancerListenerOutput : AWSModel


@end

/**
 
 */
@interface AWSElasticLoadBalancingCreateLoadBalancerPolicyInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable policyAttributes;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable policyTypeName;

@end

/**
 
 */
@interface AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput : AWSModel


@end

/**
 
 */
@interface AWSElasticLoadBalancingCrossZoneLoadBalancing : AWSModel


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDeleteAccessPointInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDeleteAccessPointOutput : AWSModel


@end

/**
 
 */
@interface AWSElasticLoadBalancingDeleteLoadBalancerListenerInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable loadBalancerPorts;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput : AWSModel


@end

/**
 
 */
@interface AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput : AWSModel


@end

/**
 
 */
@interface AWSElasticLoadBalancingDeregisterEndPointsInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable instances;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDeregisterEndPointsOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable instances;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeAccessPointsInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable loadBalancerNames;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeAccessPointsOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable loadBalancerDescriptions;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeEndPointStateInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable instances;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeEndPointStateOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable instanceStates;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSElasticLoadBalancingLoadBalancerAttributes * _Nullable loadBalancerAttributes;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable policyNames;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable policyDescriptions;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable policyTypeNames;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable policyTypeDescriptions;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeTagsInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable loadBalancerNames;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDescribeTagsOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable tagDescriptions;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable subnets;

@end

/**
 
 */
@interface AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable subnets;

@end

/**
 
 */
@interface AWSElasticLoadBalancingHealthCheck : AWSModel


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable healthyThreshold;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable interval;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable target;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable unhealthyThreshold;

@end

/**
 
 */
@interface AWSElasticLoadBalancingInstance : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 
 */
@interface AWSElasticLoadBalancingInstanceState : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable reasonCode;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable state;

@end

/**
 
 */
@interface AWSElasticLoadBalancingLBCookieStickinessPolicy : AWSModel


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable cookieExpirationPeriod;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 
 */
@interface AWSElasticLoadBalancingListener : AWSModel


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable instancePort;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable instanceProtocol;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable loadBalancerPort;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable protocols;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable SSLCertificateId;

@end

/**
 
 */
@interface AWSElasticLoadBalancingListenerDescription : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSElasticLoadBalancingListener * _Nullable listener;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable policyNames;

@end

/**
 
 */
@interface AWSElasticLoadBalancingLoadBalancerAttributes : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSElasticLoadBalancingAccessLog * _Nullable accessLog;

/**
 
 */
@property (nonatomic, strong) AWSElasticLoadBalancingConnectionDraining * _Nullable connectionDraining;

/**
 
 */
@property (nonatomic, strong) AWSElasticLoadBalancingConnectionSettings * _Nullable connectionSettings;

/**
 
 */
@property (nonatomic, strong) AWSElasticLoadBalancingCrossZoneLoadBalancing * _Nullable crossZoneLoadBalancing;

@end

/**
 
 */
@interface AWSElasticLoadBalancingLoadBalancerDescription : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable availabilityZones;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable backendServerDescriptions;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable canonicalHostedZoneName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable canonicalHostedZoneNameID;

/**
 
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable DNSName;

/**
 
 */
@property (nonatomic, strong) AWSElasticLoadBalancingHealthCheck * _Nullable healthCheck;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable instances;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable listenerDescriptions;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 
 */
@property (nonatomic, strong) AWSElasticLoadBalancingPolicies * _Nullable policies;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable scheme;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable securityGroups;

/**
 
 */
@property (nonatomic, strong) AWSElasticLoadBalancingSourceSecurityGroup * _Nullable sourceSecurityGroup;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable subnets;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable VPCId;

@end

/**
 
 */
@interface AWSElasticLoadBalancingModifyLoadBalancerAttributesInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) AWSElasticLoadBalancingLoadBalancerAttributes * _Nullable loadBalancerAttributes;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 
 */
@interface AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSElasticLoadBalancingLoadBalancerAttributes * _Nullable loadBalancerAttributes;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 
 */
@interface AWSElasticLoadBalancingPolicies : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable appCookieStickinessPolicies;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable LBCookieStickinessPolicies;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable otherPolicies;

@end

/**
 
 */
@interface AWSElasticLoadBalancingPolicyAttribute : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable attributeValue;

@end

/**
 
 */
@interface AWSElasticLoadBalancingPolicyAttributeDescription : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable attributeValue;

@end

/**
 
 */
@interface AWSElasticLoadBalancingPolicyAttributeTypeDescription : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable attributeType;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable cardinality;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable defaultValue;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 
 */
@interface AWSElasticLoadBalancingPolicyDescription : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable policyAttributeDescriptions;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable policyTypeName;

@end

/**
 
 */
@interface AWSElasticLoadBalancingPolicyTypeDescription : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable policyAttributeTypeDescriptions;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable policyTypeName;

@end

/**
 
 */
@interface AWSElasticLoadBalancingRegisterEndPointsInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable instances;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 
 */
@interface AWSElasticLoadBalancingRegisterEndPointsOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable instances;

@end

/**
 
 */
@interface AWSElasticLoadBalancingRemoveAvailabilityZonesInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable availabilityZones;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 
 */
@interface AWSElasticLoadBalancingRemoveAvailabilityZonesOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable availabilityZones;

@end

/**
 
 */
@interface AWSElasticLoadBalancingRemoveTagsInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable loadBalancerNames;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable tags;

@end

/**
 
 */
@interface AWSElasticLoadBalancingRemoveTagsOutput : AWSModel


@end

/**
 
 */
@interface AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable loadBalancerPort;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable SSLCertificateId;

@end

/**
 
 */
@interface AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput : AWSModel


@end

/**
 
 */
@interface AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable instancePort;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable policyNames;

@end

/**
 
 */
@interface AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput : AWSModel


@end

/**
 
 */
@interface AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable loadBalancerPort;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable policyNames;

@end

/**
 
 */
@interface AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput : AWSModel


@end

/**
 
 */
@interface AWSElasticLoadBalancingSourceSecurityGroup : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable ownerAlias;

@end

/**
 
 */
@interface AWSElasticLoadBalancingTag : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSElasticLoadBalancingTagDescription : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 
 */
@property (nonatomic, strong) NSArray * _Nullable tags;

@end

/**
 
 */
@interface AWSElasticLoadBalancingTagKeyOnly : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

@end

NS_ASSUME_NONNULL_END
