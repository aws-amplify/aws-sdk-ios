//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSElasticLoadBalancingErrorDomain;

typedef NS_ENUM(NSInteger, AWSElasticLoadBalancingErrorType) {
    AWSElasticLoadBalancingErrorUnknown,
    AWSElasticLoadBalancingErrorAccessPointNotFound,
    AWSElasticLoadBalancingErrorCertificateNotFound,
    AWSElasticLoadBalancingErrorDependencyThrottle,
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
    AWSElasticLoadBalancingErrorUnsupportedProtocol,
};

@class AWSElasticLoadBalancingAccessLog;
@class AWSElasticLoadBalancingAddAvailabilityZonesInput;
@class AWSElasticLoadBalancingAddAvailabilityZonesOutput;
@class AWSElasticLoadBalancingAddTagsInput;
@class AWSElasticLoadBalancingAddTagsOutput;
@class AWSElasticLoadBalancingAdditionalAttribute;
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
 <p>Information about the <code>AccessLog</code> attribute.</p>
 Required parameters: [Enabled]
 */
@interface AWSElasticLoadBalancingAccessLog : AWSModel


/**
 <p>The interval for publishing the access logs. You can specify an interval of either 5 minutes or 60 minutes.</p><p>Default: 60 minutes</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable emitInterval;

/**
 <p>Specifies whether access logs are enabled for the load balancer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The name of the Amazon S3 bucket where the access logs are stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3BucketName;

/**
 <p>The logical hierarchy you created for your Amazon S3 bucket, for example <code>my-bucket-prefix/prod</code>. If the prefix is not provided, the log is placed at the root level of the bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3BucketPrefix;

@end

/**
 <p>Contains the parameters for EnableAvailabilityZonesForLoadBalancer.</p>
 Required parameters: [LoadBalancerName, AvailabilityZones]
 */
@interface AWSElasticLoadBalancingAddAvailabilityZonesInput : AWSRequest


/**
 <p>The Availability Zones. These must be in the same region as the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 <p>Contains the output of EnableAvailabilityZonesForLoadBalancer.</p>
 */
@interface AWSElasticLoadBalancingAddAvailabilityZonesOutput : AWSModel


/**
 <p>The updated list of Availability Zones for the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

@end

/**
 <p>Contains the parameters for AddTags.</p>
 Required parameters: [LoadBalancerNames, Tags]
 */
@interface AWSElasticLoadBalancingAddTagsInput : AWSRequest


/**
 <p>The name of the load balancer. You can specify one load balancer only.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable loadBalancerNames;

/**
 <p>The tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTag *> * _Nullable tags;

@end

/**
 <p>Contains the output of AddTags.</p>
 */
@interface AWSElasticLoadBalancingAddTagsOutput : AWSModel


@end

/**
 <p>This data type is reserved.</p>
 */
@interface AWSElasticLoadBalancingAdditionalAttribute : AWSModel


/**
 <p>This parameter is reserved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>This parameter is reserved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Information about a policy for application-controlled session stickiness.</p>
 */
@interface AWSElasticLoadBalancingAppCookieStickinessPolicy : AWSModel


/**
 <p>The name of the application cookie used for stickiness.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cookieName;

/**
 <p>The mnemonic name for the policy being created. The name must be unique within a set of policies for this load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>Contains the parameters for ApplySecurityGroupsToLoadBalancer.</p>
 Required parameters: [LoadBalancerName, SecurityGroups]
 */
@interface AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput : AWSRequest


/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>The IDs of the security groups to associate with the load balancer. Note that you cannot specify the name of the security group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

@end

/**
 <p>Contains the output of ApplySecurityGroupsToLoadBalancer.</p>
 */
@interface AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput : AWSModel


/**
 <p>The IDs of the security groups associated with the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

@end

/**
 <p>Contains the parameters for AttachLoaBalancerToSubnets.</p>
 Required parameters: [LoadBalancerName, Subnets]
 */
@interface AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput : AWSRequest


/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>The IDs of the subnets to add. You can add only one subnet per Availability Zone.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnets;

@end

/**
 <p>Contains the output of AttachLoadBalancerToSubnets.</p>
 */
@interface AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput : AWSModel


/**
 <p>The IDs of the subnets attached to the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnets;

@end

/**
 <p>Information about the configuration of an EC2 instance.</p>
 */
@interface AWSElasticLoadBalancingBackendServerDescription : AWSModel


/**
 <p>The port on which the EC2 instance is listening.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instancePort;

/**
 <p>The names of the policies enabled for the EC2 instance.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyNames;

@end

/**
 <p>Contains the parameters for ConfigureHealthCheck.</p>
 Required parameters: [LoadBalancerName, HealthCheck]
 */
@interface AWSElasticLoadBalancingConfigureHealthCheckInput : AWSRequest


/**
 <p>The configuration information.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingHealthCheck * _Nullable healthCheck;

/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 <p>Contains the output of ConfigureHealthCheck.</p>
 */
@interface AWSElasticLoadBalancingConfigureHealthCheckOutput : AWSModel


/**
 <p>The updated health check.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingHealthCheck * _Nullable healthCheck;

@end

/**
 <p>Information about the <code>ConnectionDraining</code> attribute.</p>
 Required parameters: [Enabled]
 */
@interface AWSElasticLoadBalancingConnectionDraining : AWSModel


/**
 <p>Specifies whether connection draining is enabled for the load balancer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The maximum time, in seconds, to keep the existing connections open before deregistering the instances.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

@end

/**
 <p>Information about the <code>ConnectionSettings</code> attribute.</p>
 Required parameters: [IdleTimeout]
 */
@interface AWSElasticLoadBalancingConnectionSettings : AWSModel


/**
 <p>The time, in seconds, that the connection is allowed to be idle (no data has been sent over the connection) before it is closed by the load balancer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable idleTimeout;

@end

/**
 <p>Contains the parameters for CreateLoadBalancer.</p>
 Required parameters: [LoadBalancerName, Listeners]
 */
@interface AWSElasticLoadBalancingCreateAccessPointInput : AWSRequest


/**
 <p>One or more Availability Zones from the same region as the load balancer.</p><p>You must specify at least one Availability Zone.</p><p>You can add more Availability Zones after you create the load balancer using <a>EnableAvailabilityZonesForLoadBalancer</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 <p>The listeners.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-listener-config.html">Listeners for Your Classic Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingListener *> * _Nullable listeners;

/**
 <p>The name of the load balancer.</p><p>This name must be unique within your set of load balancers for the region, must have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and cannot begin or end with a hyphen.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>The type of a load balancer. Valid only for load balancers in a VPC.</p><p>By default, Elastic Load Balancing creates an Internet-facing load balancer with a DNS name that resolves to public IP addresses. For more information about Internet-facing and Internal load balancers, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/how-elastic-load-balancing-works.html#load-balancer-scheme">Load Balancer Scheme</a> in the <i>Elastic Load Balancing User Guide</i>.</p><p>Specify <code>internal</code> to create a load balancer with a DNS name that resolves to private IP addresses.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheme;

/**
 <p>The IDs of the security groups to assign to the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

/**
 <p>The IDs of the subnets in your VPC to attach to the load balancer. Specify one subnet per Availability Zone specified in <code>AvailabilityZones</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnets;

/**
 <p>A list of tags to assign to the load balancer.</p><p>For more information about tagging your load balancer, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/add-remove-tags.html">Tag Your Classic Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTag *> * _Nullable tags;

@end

/**
 <p>Contains the output for CreateLoadBalancer.</p>
 */
@interface AWSElasticLoadBalancingCreateAccessPointOutput : AWSModel


/**
 <p>The DNS name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DNSName;

@end

/**
 <p>Contains the parameters for CreateAppCookieStickinessPolicy.</p>
 Required parameters: [LoadBalancerName, PolicyName, CookieName]
 */
@interface AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput : AWSRequest


/**
 <p>The name of the application cookie used for stickiness.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cookieName;

/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>The name of the policy being created. Policy names must consist of alphanumeric characters and dashes (-). This name must be unique within the set of policies for this load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>Contains the output for CreateAppCookieStickinessPolicy.</p>
 */
@interface AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput : AWSModel


@end

/**
 <p>Contains the parameters for CreateLBCookieStickinessPolicy.</p>
 Required parameters: [LoadBalancerName, PolicyName]
 */
@interface AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput : AWSRequest


/**
 <p>The time period, in seconds, after which the cookie should be considered stale. If you do not specify this parameter, the default value is 0, which indicates that the sticky session should last for the duration of the browser session.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cookieExpirationPeriod;

/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>The name of the policy being created. Policy names must consist of alphanumeric characters and dashes (-). This name must be unique within the set of policies for this load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>Contains the output for CreateLBCookieStickinessPolicy.</p>
 */
@interface AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput : AWSModel


@end

/**
 <p>Contains the parameters for CreateLoadBalancerListeners.</p>
 Required parameters: [LoadBalancerName, Listeners]
 */
@interface AWSElasticLoadBalancingCreateLoadBalancerListenerInput : AWSRequest


/**
 <p>The listeners.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingListener *> * _Nullable listeners;

/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 <p>Contains the parameters for CreateLoadBalancerListener.</p>
 */
@interface AWSElasticLoadBalancingCreateLoadBalancerListenerOutput : AWSModel


@end

/**
 <p>Contains the parameters for CreateLoadBalancerPolicy.</p>
 Required parameters: [LoadBalancerName, PolicyName, PolicyTypeName]
 */
@interface AWSElasticLoadBalancingCreateLoadBalancerPolicyInput : AWSRequest


/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>The policy attributes.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingPolicyAttribute *> * _Nullable policyAttributes;

/**
 <p>The name of the load balancer policy to be created. This name must be unique within the set of policies for this load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The name of the base policy type. To get the list of policy types, use <a>DescribeLoadBalancerPolicyTypes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyTypeName;

@end

/**
 <p>Contains the output of CreateLoadBalancerPolicy.</p>
 */
@interface AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput : AWSModel


@end

/**
 <p>Information about the <code>CrossZoneLoadBalancing</code> attribute.</p>
 Required parameters: [Enabled]
 */
@interface AWSElasticLoadBalancingCrossZoneLoadBalancing : AWSModel


/**
 <p>Specifies whether cross-zone load balancing is enabled for the load balancer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 <p>Contains the parameters for DeleteLoadBalancer.</p>
 Required parameters: [LoadBalancerName]
 */
@interface AWSElasticLoadBalancingDeleteAccessPointInput : AWSRequest


/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 <p>Contains the output of DeleteLoadBalancer.</p>
 */
@interface AWSElasticLoadBalancingDeleteAccessPointOutput : AWSModel


@end

/**
 <p>Contains the parameters for DeleteLoadBalancerListeners.</p>
 Required parameters: [LoadBalancerName, LoadBalancerPorts]
 */
@interface AWSElasticLoadBalancingDeleteLoadBalancerListenerInput : AWSRequest


/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>The client port numbers of the listeners.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable loadBalancerPorts;

@end

/**
 <p>Contains the output of DeleteLoadBalancerListeners.</p>
 */
@interface AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput : AWSModel


@end

/**
 <p>Contains the parameters for DeleteLoadBalancerPolicy.</p>
 Required parameters: [LoadBalancerName, PolicyName]
 */
@interface AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput : AWSRequest


/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>The name of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>Contains the output of DeleteLoadBalancerPolicy.</p>
 */
@interface AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput : AWSModel


@end

/**
 <p>Contains the parameters for DeregisterInstancesFromLoadBalancer.</p>
 Required parameters: [LoadBalancerName, Instances]
 */
@interface AWSElasticLoadBalancingDeregisterEndPointsInput : AWSRequest


/**
 <p>The IDs of the instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingInstance *> * _Nullable instances;

/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 <p>Contains the output of DeregisterInstancesFromLoadBalancer.</p>
 */
@interface AWSElasticLoadBalancingDeregisterEndPointsOutput : AWSModel


/**
 <p>The remaining instances registered with the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingInstance *> * _Nullable instances;

@end

/**
 <p>Contains the parameters for DescribeLoadBalancers.</p>
 */
@interface AWSElasticLoadBalancingDescribeAccessPointsInput : AWSRequest


/**
 <p>The names of the load balancers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable loadBalancerNames;

/**
 <p>The marker for the next set of results. (You received this marker from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of results to return with this call (a number from 1 to 400). The default is 400.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 <p>Contains the parameters for DescribeLoadBalancers.</p>
 */
@interface AWSElasticLoadBalancingDescribeAccessPointsOutput : AWSModel


/**
 <p>Information about the load balancers.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingLoadBalancerDescription *> * _Nullable loadBalancerDescriptions;

/**
 <p>The marker to use when requesting the next set of results. If there are no additional results, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 <p>Contains the parameters for DescribeInstanceHealth.</p>
 Required parameters: [LoadBalancerName]
 */
@interface AWSElasticLoadBalancingDescribeEndPointStateInput : AWSRequest


/**
 <p>The IDs of the instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingInstance *> * _Nullable instances;

/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 <p>Contains the output for DescribeInstanceHealth.</p>
 */
@interface AWSElasticLoadBalancingDescribeEndPointStateOutput : AWSModel


/**
 <p>Information about the health of the instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingInstanceState *> * _Nullable instanceStates;

@end

/**
 <p>Contains the parameters for DescribeLoadBalancerAttributes.</p>
 Required parameters: [LoadBalancerName]
 */
@interface AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput : AWSRequest


/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 <p>Contains the output of DescribeLoadBalancerAttributes.</p>
 */
@interface AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput : AWSModel


/**
 <p>Information about the load balancer attributes.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingLoadBalancerAttributes * _Nullable loadBalancerAttributes;

@end

/**
 <p>Contains the parameters for DescribeLoadBalancerPolicies.</p>
 */
@interface AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput : AWSRequest


/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>The names of the policies.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyNames;

@end

/**
 <p>Contains the output of DescribeLoadBalancerPolicies.</p>
 */
@interface AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput : AWSModel


/**
 <p>Information about the policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingPolicyDescription *> * _Nullable policyDescriptions;

@end

/**
 <p>Contains the parameters for DescribeLoadBalancerPolicyTypes.</p>
 */
@interface AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput : AWSRequest


/**
 <p>The names of the policy types. If no names are specified, describes all policy types defined by Elastic Load Balancing.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyTypeNames;

@end

/**
 <p>Contains the output of DescribeLoadBalancerPolicyTypes.</p>
 */
@interface AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput : AWSModel


/**
 <p>Information about the policy types.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingPolicyTypeDescription *> * _Nullable policyTypeDescriptions;

@end

/**
 <p>Contains the parameters for DescribeTags.</p>
 Required parameters: [LoadBalancerNames]
 */
@interface AWSElasticLoadBalancingDescribeTagsInput : AWSRequest


/**
 <p>The names of the load balancers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable loadBalancerNames;

@end

/**
 <p>Contains the output for DescribeTags.</p>
 */
@interface AWSElasticLoadBalancingDescribeTagsOutput : AWSModel


/**
 <p>Information about the tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTagDescription *> * _Nullable tagDescriptions;

@end

/**
 <p>Contains the parameters for DetachLoadBalancerFromSubnets.</p>
 Required parameters: [LoadBalancerName, Subnets]
 */
@interface AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput : AWSRequest


/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>The IDs of the subnets.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnets;

@end

/**
 <p>Contains the output of DetachLoadBalancerFromSubnets.</p>
 */
@interface AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput : AWSModel


/**
 <p>The IDs of the remaining subnets for the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnets;

@end

/**
 <p>Information about a health check.</p>
 Required parameters: [Target, Interval, Timeout, UnhealthyThreshold, HealthyThreshold]
 */
@interface AWSElasticLoadBalancingHealthCheck : AWSModel


/**
 <p>The number of consecutive health checks successes required before moving the instance to the <code>Healthy</code> state.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthyThreshold;

/**
 <p>The approximate interval, in seconds, between health checks of an individual instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable interval;

/**
 <p>The instance being checked. The protocol is either TCP, HTTP, HTTPS, or SSL. The range of valid ports is one (1) through 65535.</p><p>TCP is the default, specified as a TCP: port pair, for example "TCP:5000". In this case, a health check simply attempts to open a TCP connection to the instance on the specified port. Failure to connect within the configured timeout is considered unhealthy.</p><p>SSL is also specified as SSL: port pair, for example, SSL:5000.</p><p>For HTTP/HTTPS, you must include a ping path in the string. HTTP is specified as a HTTP:port;/;PathToPing; grouping, for example "HTTP:80/weather/us/wa/seattle". In this case, a HTTP GET request is issued to the instance on the given port and path. Any answer other than "200 OK" within the timeout period is considered unhealthy.</p><p>The total length of the HTTP ping target must be 1024 16-bit Unicode characters or less.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

/**
 <p>The amount of time, in seconds, during which no response means a failed health check.</p><p>This value must be less than the <code>Interval</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

/**
 <p>The number of consecutive health check failures required before moving the instance to the <code>Unhealthy</code> state.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable unhealthyThreshold;

@end

/**
 <p>The ID of an EC2 instance.</p>
 */
@interface AWSElasticLoadBalancingInstance : AWSModel


/**
 <p>The instance ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 <p>Information about the state of an EC2 instance.</p>
 */
@interface AWSElasticLoadBalancingInstanceState : AWSModel


/**
 <p>A description of the instance state. This string can contain one or more of the following messages.</p><ul><li><p><code>N/A</code></p></li><li><p><code>A transient error occurred. Please try again later.</code></p></li><li><p><code>Instance has failed at least the UnhealthyThreshold number of health checks consecutively.</code></p></li><li><p><code>Instance has not passed the configured HealthyThreshold number of health checks consecutively.</code></p></li><li><p><code>Instance registration is still in progress.</code></p></li><li><p><code>Instance is in the EC2 Availability Zone for which LoadBalancer is not configured to route traffic to.</code></p></li><li><p><code>Instance is not currently registered with the LoadBalancer.</code></p></li><li><p><code>Instance deregistration currently in progress.</code></p></li><li><p><code>Disable Availability Zone is currently in progress.</code></p></li><li><p><code>Instance is in pending state.</code></p></li><li><p><code>Instance is in stopped state.</code></p></li><li><p><code>Instance is in terminated state.</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Information about the cause of <code>OutOfService</code> instances. Specifically, whether the cause is Elastic Load Balancing or the instance.</p><p>Valid values: <code>ELB</code> | <code>Instance</code> | <code>N/A</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable reasonCode;

/**
 <p>The current state of the instance.</p><p>Valid values: <code>InService</code> | <code>OutOfService</code> | <code>Unknown</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable state;

@end

/**
 <p>Information about a policy for duration-based session stickiness.</p>
 */
@interface AWSElasticLoadBalancingLBCookieStickinessPolicy : AWSModel


/**
 <p>The time period, in seconds, after which the cookie should be considered stale. If this parameter is not specified, the stickiness session lasts for the duration of the browser session.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cookieExpirationPeriod;

/**
 <p>The name of the policy. This name must be unique within the set of policies for this load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>Information about a listener.</p><p>For information about the protocols and the ports supported by Elastic Load Balancing, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-listener-config.html">Listeners for Your Classic Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>
 Required parameters: [Protocol, LoadBalancerPort, InstancePort]
 */
@interface AWSElasticLoadBalancingListener : AWSModel


/**
 <p>The port on which the instance is listening.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instancePort;

/**
 <p>The protocol to use for routing traffic to instances: HTTP, HTTPS, TCP, or SSL.</p><p>If the front-end protocol is HTTP, HTTPS, TCP, or SSL, <code>InstanceProtocol</code> must be at the same protocol.</p><p>If there is another listener with the same <code>InstancePort</code> whose <code>InstanceProtocol</code> is secure, (HTTPS or SSL), the listener's <code>InstanceProtocol</code> must also be secure.</p><p>If there is another listener with the same <code>InstancePort</code> whose <code>InstanceProtocol</code> is HTTP or TCP, the listener's <code>InstanceProtocol</code> must be HTTP or TCP.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceProtocol;

/**
 <p>The port on which the load balancer is listening. On EC2-VPC, you can specify any port from the range 1-65535. On EC2-Classic, you can specify any port from the following list: 25, 80, 443, 465, 587, 1024-65535.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable loadBalancerPort;

/**
 <p>The load balancer transport protocol to use for routing: HTTP, HTTPS, TCP, or SSL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable protocols;

/**
 <p>The Amazon Resource Name (ARN) of the server certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSLCertificateId;

@end

/**
 <p>The policies enabled for a listener.</p>
 */
@interface AWSElasticLoadBalancingListenerDescription : AWSModel


/**
 <p>Information about a listener.</p><p>For information about the protocols and the ports supported by Elastic Load Balancing, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-listener-config.html">Listeners for Your Classic Load Balancer</a> in the <i>Classic Load Balancers Guide</i>.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingListener * _Nullable listener;

/**
 <p>The policies. If there are no policies enabled, the list is empty.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyNames;

@end

/**
 <p>The attributes for a load balancer.</p>
 */
@interface AWSElasticLoadBalancingLoadBalancerAttributes : AWSModel


/**
 <p>If enabled, the load balancer captures detailed information of all requests and delivers the information to the Amazon S3 bucket that you specify.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-access-logs.html">Enable Access Logs</a> in the <i>Classic Load Balancers Guide</i>.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingAccessLog * _Nullable accessLog;

/**
 <p>This parameter is reserved.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingAdditionalAttribute *> * _Nullable additionalAttributes;

/**
 <p>If enabled, the load balancer allows existing requests to complete before the load balancer shifts traffic away from a deregistered or unhealthy instance.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-conn-drain.html">Configure Connection Draining</a> in the <i>Classic Load Balancers Guide</i>.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingConnectionDraining * _Nullable connectionDraining;

/**
 <p>If enabled, the load balancer allows the connections to remain idle (no data is sent over the connection) for the specified duration.</p><p>By default, Elastic Load Balancing maintains a 60-second idle connection timeout for both front-end and back-end connections of your load balancer. For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-idle-timeout.html">Configure Idle Connection Timeout</a> in the <i>Classic Load Balancers Guide</i>.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingConnectionSettings * _Nullable connectionSettings;

/**
 <p>If enabled, the load balancer routes the request traffic evenly across all instances regardless of the Availability Zones.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-crosszone-lb.html">Configure Cross-Zone Load Balancing</a> in the <i>Classic Load Balancers Guide</i>.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingCrossZoneLoadBalancing * _Nullable crossZoneLoadBalancing;

@end

/**
 <p>Information about a load balancer.</p>
 */
@interface AWSElasticLoadBalancingLoadBalancerDescription : AWSModel


/**
 <p>The Availability Zones for the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 <p>Information about your EC2 instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingBackendServerDescription *> * _Nullable backendServerDescriptions;

/**
 <p>The DNS name of the load balancer.</p><p>For more information, see <a href="http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/using-domain-names-with-elb.html">Configure a Custom Domain Name</a> in the <i>Classic Load Balancers Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable canonicalHostedZoneName;

/**
 <p>The ID of the Amazon Route 53 hosted zone for the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable canonicalHostedZoneNameID;

/**
 <p>The date and time the load balancer was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The DNS name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DNSName;

/**
 <p>Information about the health checks conducted on the load balancer.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingHealthCheck * _Nullable healthCheck;

/**
 <p>The IDs of the instances for the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingInstance *> * _Nullable instances;

/**
 <p>The listeners for the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingListenerDescription *> * _Nullable listenerDescriptions;

/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>The policies defined for the load balancer.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingPolicies * _Nullable policies;

/**
 <p>The type of load balancer. Valid only for load balancers in a VPC.</p><p>If <code>Scheme</code> is <code>internet-facing</code>, the load balancer has a public DNS name that resolves to a public IP address.</p><p>If <code>Scheme</code> is <code>internal</code>, the load balancer has a public DNS name that resolves to a private IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheme;

/**
 <p>The security groups for the load balancer. Valid only for load balancers in a VPC.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

/**
 <p>The security group for the load balancer, which you can use as part of your inbound rules for your registered instances. To only allow traffic from load balancers, add a security group rule that specifies this source security group as the inbound source.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingSourceSecurityGroup * _Nullable sourceSecurityGroup;

/**
 <p>The IDs of the subnets for the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnets;

/**
 <p>The ID of the VPC for the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable VPCId;

@end

/**
 <p>Contains the parameters for ModifyLoadBalancerAttributes.</p>
 Required parameters: [LoadBalancerName, LoadBalancerAttributes]
 */
@interface AWSElasticLoadBalancingModifyLoadBalancerAttributesInput : AWSRequest


/**
 <p>The attributes of the load balancer.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingLoadBalancerAttributes * _Nullable loadBalancerAttributes;

/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 <p>Contains the output of ModifyLoadBalancerAttributes.</p>
 */
@interface AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput : AWSModel


/**
 <p>The attributes for a load balancer.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingLoadBalancerAttributes * _Nullable loadBalancerAttributes;

/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 <p>The policies for a load balancer.</p>
 */
@interface AWSElasticLoadBalancingPolicies : AWSModel


/**
 <p>The stickiness policies created using <a>CreateAppCookieStickinessPolicy</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingAppCookieStickinessPolicy *> * _Nullable appCookieStickinessPolicies;

/**
 <p>The stickiness policies created using <a>CreateLBCookieStickinessPolicy</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingLBCookieStickinessPolicy *> * _Nullable LBCookieStickinessPolicies;

/**
 <p>The policies other than the stickiness policies.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable otherPolicies;

@end

/**
 <p>Information about a policy attribute.</p>
 */
@interface AWSElasticLoadBalancingPolicyAttribute : AWSModel


/**
 <p>The name of the attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The value of the attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeValue;

@end

/**
 <p>Information about a policy attribute.</p>
 */
@interface AWSElasticLoadBalancingPolicyAttributeDescription : AWSModel


/**
 <p>The name of the attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The value of the attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeValue;

@end

/**
 <p>Information about a policy attribute type.</p>
 */
@interface AWSElasticLoadBalancingPolicyAttributeTypeDescription : AWSModel


/**
 <p>The name of the attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The type of the attribute. For example, <code>Boolean</code> or <code>Integer</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeType;

/**
 <p>The cardinality of the attribute.</p><p>Valid values:</p><ul><li><p>ONE(1) : Single value required</p></li><li><p>ZERO_OR_ONE(0..1) : Up to one value is allowed</p></li><li><p>ZERO_OR_MORE(0..*) : Optional. Multiple values are allowed</p></li><li><p>ONE_OR_MORE(1..*0) : Required. Multiple values are allowed</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable cardinality;

/**
 <p>The default value of the attribute, if applicable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultValue;

/**
 <p>A description of the attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 <p>Information about a policy.</p>
 */
@interface AWSElasticLoadBalancingPolicyDescription : AWSModel


/**
 <p>The policy attributes.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingPolicyAttributeDescription *> * _Nullable policyAttributeDescriptions;

/**
 <p>The name of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The name of the policy type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyTypeName;

@end

/**
 <p>Information about a policy type.</p>
 */
@interface AWSElasticLoadBalancingPolicyTypeDescription : AWSModel


/**
 <p>A description of the policy type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The description of the policy attributes associated with the policies defined by Elastic Load Balancing.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingPolicyAttributeTypeDescription *> * _Nullable policyAttributeTypeDescriptions;

/**
 <p>The name of the policy type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyTypeName;

@end

/**
 <p>Contains the parameters for RegisterInstancesWithLoadBalancer.</p>
 Required parameters: [LoadBalancerName, Instances]
 */
@interface AWSElasticLoadBalancingRegisterEndPointsInput : AWSRequest


/**
 <p>The IDs of the instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingInstance *> * _Nullable instances;

/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 <p>Contains the output of RegisterInstancesWithLoadBalancer.</p>
 */
@interface AWSElasticLoadBalancingRegisterEndPointsOutput : AWSModel


/**
 <p>The updated list of instances for the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingInstance *> * _Nullable instances;

@end

/**
 <p>Contains the parameters for DisableAvailabilityZonesForLoadBalancer.</p>
 Required parameters: [LoadBalancerName, AvailabilityZones]
 */
@interface AWSElasticLoadBalancingRemoveAvailabilityZonesInput : AWSRequest


/**
 <p>The Availability Zones.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 <p>Contains the output for DisableAvailabilityZonesForLoadBalancer.</p>
 */
@interface AWSElasticLoadBalancingRemoveAvailabilityZonesOutput : AWSModel


/**
 <p>The remaining Availability Zones for the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

@end

/**
 <p>Contains the parameters for RemoveTags.</p>
 Required parameters: [LoadBalancerNames, Tags]
 */
@interface AWSElasticLoadBalancingRemoveTagsInput : AWSRequest


/**
 <p>The name of the load balancer. You can specify a maximum of one load balancer name.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable loadBalancerNames;

/**
 <p>The list of tag keys to remove.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTagKeyOnly *> * _Nullable tags;

@end

/**
 <p>Contains the output of RemoveTags.</p>
 */
@interface AWSElasticLoadBalancingRemoveTagsOutput : AWSModel


@end

/**
 <p>Contains the parameters for SetLoadBalancerListenerSSLCertificate.</p>
 Required parameters: [LoadBalancerName, LoadBalancerPort, SSLCertificateId]
 */
@interface AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput : AWSRequest


/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>The port that uses the specified SSL certificate.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable loadBalancerPort;

/**
 <p>The Amazon Resource Name (ARN) of the SSL certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSLCertificateId;

@end

/**
 <p>Contains the output of SetLoadBalancerListenerSSLCertificate.</p>
 */
@interface AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput : AWSModel


@end

/**
 <p>Contains the parameters for SetLoadBalancerPoliciesForBackendServer.</p>
 Required parameters: [LoadBalancerName, InstancePort, PolicyNames]
 */
@interface AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput : AWSRequest


/**
 <p>The port number associated with the EC2 instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instancePort;

/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>The names of the policies. If the list is empty, then all current polices are removed from the EC2 instance.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyNames;

@end

/**
 <p>Contains the output of SetLoadBalancerPoliciesForBackendServer.</p>
 */
@interface AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput : AWSModel


@end

/**
 <p>Contains the parameters for SetLoadBalancePoliciesOfListener.</p>
 Required parameters: [LoadBalancerName, LoadBalancerPort, PolicyNames]
 */
@interface AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput : AWSRequest


/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>The external port of the load balancer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable loadBalancerPort;

/**
 <p>The names of the policies. This list must include all policies to be enabled. If you omit a policy that is currently enabled, it is disabled. If the list is empty, all current policies are disabled.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyNames;

@end

/**
 <p>Contains the output of SetLoadBalancePoliciesOfListener.</p>
 */
@interface AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput : AWSModel


@end

/**
 <p>Information about a source security group.</p>
 */
@interface AWSElasticLoadBalancingSourceSecurityGroup : AWSModel


/**
 <p>The name of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The owner of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerAlias;

@end

/**
 <p>Information about a tag.</p>
 Required parameters: [Key]
 */
@interface AWSElasticLoadBalancingTag : AWSModel


/**
 <p>The key of the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value of the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>The tags associated with a load balancer.</p>
 */
@interface AWSElasticLoadBalancingTagDescription : AWSModel


/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>The tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticLoadBalancingTag *> * _Nullable tags;

@end

/**
 <p>The key of a tag.</p>
 */
@interface AWSElasticLoadBalancingTagKeyOnly : AWSModel


/**
 <p>The name of the key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

@end

NS_ASSUME_NONNULL_END
