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
#import "AZModel.h"

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
};

@class AWSElasticLoadBalancingAccessLog;
@class AWSElasticLoadBalancingAddAvailabilityZonesInput;
@class AWSElasticLoadBalancingAddAvailabilityZonesOutput;
@class AWSElasticLoadBalancingAppCookieStickinessPolicy;
@class AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput;
@class AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput;
@class AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput;
@class AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput;
@class AWSElasticLoadBalancingBackendServerDescription;
@class AWSElasticLoadBalancingConfigureHealthCheckInput;
@class AWSElasticLoadBalancingConfigureHealthCheckOutput;
@class AWSElasticLoadBalancingConnectionDraining;
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
@class AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput;
@class AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput;
@class AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput;
@class AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput;
@class AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput;
@class AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput;
@class AWSElasticLoadBalancingSourceSecurityGroup;

/**
 * <p>The <code>AccessLog</code> data type.</p>
 * Required parameters: [Enabled]
 */
@interface AWSElasticLoadBalancingAccessLog : AZModel


/**
 * <p>The interval for publishing the access logs. You can specify an interval of either 5 minutes or 60 minutes.</p><p>Default: 60 minutes</p>
 */
@property (nonatomic, strong) NSNumber *emitInterval;

/**
 * <p>Specifies whether access log is enabled for the load balancer.</p>
 */
@property (nonatomic, strong) NSNumber *enabled;

/**
 * <p>The name of the Amazon S3 bucket where the access logs are stored.</p>
 */
@property (nonatomic, strong) NSString *s3BucketName;

/**
 * <p>The logical hierarchy you created for your Amazon S3 bucket, for example <code>my-bucket-prefix/prod</code>. If the prefix is not provided, the log is placed at the root level of the bucket.</p>
 */
@property (nonatomic, strong) NSString *s3BucketPrefix;

@end

/**
 * <p> 		The input for the <a>EnableAvailabilityZonesForLoadBalancer</a> action. 		</p>
 * Required parameters: [LoadBalancerName, AvailabilityZones]
 */
@interface AWSElasticLoadBalancingAddAvailabilityZonesInput : AWSRequest


/**
 * <p> A list of new Availability Zones for the load balancer. Each Availability Zone must be in the same region as the load balancer. </p>
 */
@property (nonatomic, strong) NSArray *availabilityZones;

/**
 * <p> The name associated with the load balancer.</p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

@end

/**
 * <p> 		The output for the <a>EnableAvailabilityZonesForLoadBalancer</a> action. 		</p>
 */
@interface AWSElasticLoadBalancingAddAvailabilityZonesOutput : AZModel


/**
 * <p> An updated list of Availability Zones for the load balancer. </p>
 */
@property (nonatomic, strong) NSArray *availabilityZones;

@end

/**
 * <p>The AppCookieStickinessPolicy data type. </p>
 */
@interface AWSElasticLoadBalancingAppCookieStickinessPolicy : AZModel


/**
 * <p>The name of the application cookie used for stickiness. </p>
 */
@property (nonatomic, strong) NSString *cookieName;

/**
 * <p>The mnemonic name for the policy being created. The name must be unique within a set of policies for this load balancer. </p>
 */
@property (nonatomic, strong) NSString *policyName;

@end

/**
 * <p> The input for the <a>ApplySecurityGroupsToLoadBalancer</a> action. </p>
 * Required parameters: [LoadBalancerName, SecurityGroups]
 */
@interface AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput : AWSRequest


/**
 * <p> The name associated with the load balancer. The name must be unique within the set of load balancers associated with your AWS account.</p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

/**
 * <p> A list of security group IDs to associate with your load balancer in VPC. The security group IDs must be provided as the ID and not the security group name (For example, sg-1234). </p>
 */
@property (nonatomic, strong) NSArray *securityGroups;

@end

/**
 * <p> The out for the <a>ApplySecurityGroupsToLoadBalancer</a> action. </p>
 */
@interface AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput : AZModel


/**
 * <p> A list of security group IDs associated with your load balancer. </p>
 */
@property (nonatomic, strong) NSArray *securityGroups;

@end

/**
 * <p> The input for the <a>AttachLoadBalancerToSubnets</a> action. </p>
 * Required parameters: [LoadBalancerName, Subnets]
 */
@interface AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput : AWSRequest


/**
 * <p> The name associated with the load balancer. The name must be unique within the set of load balancers associated with your AWS account. </p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

/**
 * <p> A list of subnet IDs to add for the load balancer. You can add only one subnet per Availability Zone. </p>
 */
@property (nonatomic, strong) NSArray *subnets;

@end

/**
 * <p> The output for the <a>AttachLoadBalancerToSubnets</a> action. </p>
 */
@interface AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput : AZModel


/**
 * <p> A list of subnet IDs attached to the load balancer. </p>
 */
@property (nonatomic, strong) NSArray *subnets;

@end

/**
 * <p> This data type is used as a response element in the <a>DescribeLoadBalancers</a> action to describe the configuration of the back-end server. </p>
 */
@interface AWSElasticLoadBalancingBackendServerDescription : AZModel


/**
 * <p> Provides the port on which the back-end server is listening. </p>
 */
@property (nonatomic, strong) NSNumber *instancePort;

/**
 * <p> Provides a list of policy names enabled for the back-end server. </p>
 */
@property (nonatomic, strong) NSArray *policyNames;

@end

/**
 * <p> Input for the <a>ConfigureHealthCheck</a> action. </p>
 * Required parameters: [LoadBalancerName, HealthCheck]
 */
@interface AWSElasticLoadBalancingConfigureHealthCheckInput : AWSRequest


/**
 * <p> A structure containing the configuration information for the new healthcheck. </p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingHealthCheck *healthCheck;

/**
 * <p> The mnemonic name associated with the load balancer. The name must be unique within the set of load balancers associated with your AWS account. </p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

@end

/**
 * <p> The output for the <a>ConfigureHealthCheck</a> action. </p>
 */
@interface AWSElasticLoadBalancingConfigureHealthCheckOutput : AZModel


/**
 * <p> The updated healthcheck for the instances. </p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingHealthCheck *healthCheck;

@end

/**
 * <p>The <code>ConnectionDraining</code> data type.</p>
 * Required parameters: [Enabled]
 */
@interface AWSElasticLoadBalancingConnectionDraining : AZModel


/**
 * <p>Specifies whether connection draining is enabled for the load balancer.</p>
 */
@property (nonatomic, strong) NSNumber *enabled;

/**
 * <p>Specifies the maximum time (in seconds) to keep the existing connections open before deregistering the instances.</p>
 */
@property (nonatomic, strong) NSNumber *timeout;

@end

/**
 * <p> The input for the <a>CreateLoadBalancer</a> action. </p>
 * Required parameters: [LoadBalancerName, Listeners]
 */
@interface AWSElasticLoadBalancingCreateAccessPointInput : AWSRequest


/**
 * <p> A list of Availability Zones. </p><p> At least one Availability Zone must be specified. Specified Availability Zones must be in the same EC2 Region as the load balancer. Traffic will be equally distributed across all zones. </p><p> You can later add more Availability Zones after the creation of theload balancer by calling <a>EnableAvailabilityZonesForLoadBalancer</a> action. </p>
 */
@property (nonatomic, strong) NSArray *availabilityZones;

/**
 * <p> A list of the following tuples: LoadBalancerPort, InstancePort, and Protocol. </p>
 */
@property (nonatomic, strong) NSArray *listeners;

/**
 * <p> The name associated with the load balancer. The name must be unique within your set of load balancers. </p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

/**
 * <p>The type of a load balancer. </p><p>By default, Elastic Load Balancing creates an Internet-facing load balancer with a publicly resolvable DNS name, which resolves to public IP addresses. For more informationabout Internet-facing and Internal load balancers,see <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/vpc-loadbalancer-types.html">Internet-facing and Internal Load Balancers</a>.</p><p>Specify the value <code>internal</code> for this option to create an internal load balancer with a DNS name that resolves to private IP addresses.</p><note><p>This option is only available for load balancers created within EC2-VPC.</p></note>
 */
@property (nonatomic, strong) NSString *scheme;

/**
 * <p> The security groups to assign to your load balancer within your VPC. </p>
 */
@property (nonatomic, strong) NSArray *securityGroups;

/**
 * <p> A list of subnet IDs in your VPC to attach to your load balancer. Specify one subnet per Availability Zone. </p>
 */
@property (nonatomic, strong) NSArray *subnets;

@end

/**
 * <p> The output for the <a>CreateLoadBalancer</a> action. </p>
 */
@interface AWSElasticLoadBalancingCreateAccessPointOutput : AZModel


/**
 * <p> The DNS name for the load balancer. </p>
 */
@property (nonatomic, strong) NSString *DNSName;

@end

/**
 * <p> The input for the <a>CreateAppCookieStickinessPolicy</a> action. </p>
 * Required parameters: [LoadBalancerName, PolicyName, CookieName]
 */
@interface AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput : AWSRequest


/**
 * <p> Name of the application cookie used for stickiness.</p>
 */
@property (nonatomic, strong) NSString *cookieName;

/**
 * <p> The name of the load balancer. </p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

/**
 * <p> The name of the policy being created.The name must be unique within the set of policies for this load balancer. </p>
 */
@property (nonatomic, strong) NSString *policyName;

@end

/**
 * <p> The output for the <a>CreateAppCookieStickinessPolicy</a> action. </p>
 */
@interface AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput : AZModel


@end

/**
 * <p> The input for the <a>CreateLBCookieStickinessPolicy</a> action. </p>
 * Required parameters: [LoadBalancerName, PolicyName]
 */
@interface AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput : AWSRequest


/**
 * <p> The time period in seconds after which the cookie should be considered stale.Not specifying this parameter indicates that the sticky session will last for the durationof the browser session.</p>
 */
@property (nonatomic, strong) NSNumber *cookieExpirationPeriod;

/**
 * <p> The name associated with the load balancer. </p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

/**
 * <p> The name of the policy being created.The name must be unique within the set of policies for this load balancer. </p>
 */
@property (nonatomic, strong) NSString *policyName;

@end

/**
 * <p> The output for the <a>CreateLBCookieStickinessPolicy</a> action. </p>
 */
@interface AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput : AZModel


@end

/**
 * <p> The input for the <a>CreateLoadBalancerListeners</a> action. </p>
 * Required parameters: [LoadBalancerName, Listeners]
 */
@interface AWSElasticLoadBalancingCreateLoadBalancerListenerInput : AWSRequest


/**
 * <p> A list of <code>LoadBalancerPort</code>,<code>InstancePort</code>,<code>Protocol</code>, and<code>SSLCertificateId</code> items. 	 </p>
 */
@property (nonatomic, strong) NSArray *listeners;

/**
 * <p> The name of the load balancer. </p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

@end

/**
 * <p> The output for the <a>CreateLoadBalancerListeners</a> action. </p>
 */
@interface AWSElasticLoadBalancingCreateLoadBalancerListenerOutput : AZModel


@end

@interface AWSElasticLoadBalancingCreateLoadBalancerPolicyInput : AWSRequest


/**
 * <p>	The name associated with the LoadBalancer for which the policy is being created. 		</p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

/**
 * <p>	A list of attributes associated with the policy being created.	</p>
 */
@property (nonatomic, strong) NSArray *policyAttributes;

/**
 * <p>	The name of the load balancer policy being created.	The name must be unique within the set of policies for this load balancer.	</p>
 */
@property (nonatomic, strong) NSString *policyName;

/**
 * <p>	The name of the base policy type being used to create this policy.	To get the list of policy types, use the <a>DescribeLoadBalancerPolicyTypes</a> action.	</p>
 */
@property (nonatomic, strong) NSString *policyTypeName;

@end

/**
 * <p>The output for the <a>CreateLoadBalancerPolicy</a> action. </p>
 */
@interface AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput : AZModel


@end

/**
 * <p>The <code>CrossZoneLoadBalancing</code> data type.</p>
 * Required parameters: [Enabled]
 */
@interface AWSElasticLoadBalancingCrossZoneLoadBalancing : AZModel


/**
 * <p>Specifies whether cross-zone load balancing is enabled for the load balancer.</p>
 */
@property (nonatomic, strong) NSNumber *enabled;

@end

/**
 * <p> The input for the <a>DeleteLoadBalancer</a> action. </p>
 * Required parameters: [LoadBalancerName]
 */
@interface AWSElasticLoadBalancingDeleteAccessPointInput : AWSRequest


/**
 * <p> The name associated with the load balancer. </p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

@end

/**
 * <p> The output for the <a>DeleteLoadBalancer</a> action. </p>
 */
@interface AWSElasticLoadBalancingDeleteAccessPointOutput : AZModel


@end

/**
 * <p> The input for the <a>DeleteLoadBalancerListeners</a> action. </p>
 * Required parameters: [LoadBalancerName, LoadBalancerPorts]
 */
@interface AWSElasticLoadBalancingDeleteLoadBalancerListenerInput : AWSRequest


/**
 * <p> The mnemonic name associated with the load balancer.</p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

/**
 * <p> The client port number(s) of the load balancer listener(s) to be removed.</p>
 */
@property (nonatomic, strong) NSArray *loadBalancerPorts;

@end

/**
 * <p> The output for the <a>DeleteLoadBalancerListeners</a> action. </p>
 */
@interface AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput : AZModel


@end

/**
 * <p> The input for the <a>DeleteLoadBalancerPolicy</a> action. </p>
 * Required parameters: [LoadBalancerName, PolicyName]
 */
@interface AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput : AWSRequest


/**
 * <p> The mnemonic name associated with the load balancer.</p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

/**
 * <p> The mnemonic name for the policy being deleted.</p>
 */
@property (nonatomic, strong) NSString *policyName;

@end

/**
 * <p> The output for the <a>DeleteLoadBalancerPolicy</a> action. </p>
 */
@interface AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput : AZModel


@end

/**
 * <p> The input for the <a>DeregisterInstancesFromLoadBalancer</a> action. </p>
 * Required parameters: [LoadBalancerName, Instances]
 */
@interface AWSElasticLoadBalancingDeregisterEndPointsInput : AWSRequest


/**
 * <p> A list of EC2 instance IDs consisting of all instances to be deregistered. </p>
 */
@property (nonatomic, strong) NSArray *instances;

/**
 * <p> The name associated with the load balancer. </p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

@end

/**
 * <p> The output for the <a>DeregisterInstancesFromLoadBalancer</a> action. </p>
 */
@interface AWSElasticLoadBalancingDeregisterEndPointsOutput : AZModel


/**
 * <p> An updated list of remaining instances registered with the load balancer. </p>
 */
@property (nonatomic, strong) NSArray *instances;

@end

/**
 * <p> 		The input for the <a>DescribeLoadBalancers</a> action. 		</p>
 */
@interface AWSElasticLoadBalancingDescribeAccessPointsInput : AWSRequest


/**
 * <p> A list of load balancer names associated with the account. </p>
 */
@property (nonatomic, strong) NSArray *loadBalancerNames;

/**
 * <p> An optional parameter reserved for future use. </p>
 */
@property (nonatomic, strong) NSString *marker;

@end

/**
 * <p> 		The output for the <a>DescribeLoadBalancers</a> action. 		</p>
 */
@interface AWSElasticLoadBalancingDescribeAccessPointsOutput : AZModel


/**
 * <p> A list of load balancer description structures. </p>
 */
@property (nonatomic, strong) NSArray *loadBalancerDescriptions;

/**
 * <p> An optional parameter reserved for future use. </p>
 */
@property (nonatomic, strong) NSString *nextMarker;

@end

/**
 * <p> The input for the <a>DescribeEndPointState</a> action. </p>
 * Required parameters: [LoadBalancerName]
 */
@interface AWSElasticLoadBalancingDescribeEndPointStateInput : AWSRequest


/**
 * <p> A list of instance IDs whose states are being queried. </p>
 */
@property (nonatomic, strong) NSArray *instances;

/**
 * <p> The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

@end

/**
 * <p> 		The output for the <a>DescribeInstanceHealth</a> action. 		</p>
 */
@interface AWSElasticLoadBalancingDescribeEndPointStateOutput : AZModel


/**
 * <p> A list containing health information for the specified instances. </p>
 */
@property (nonatomic, strong) NSArray *instanceStates;

@end

/**
 * <p>The input for the <a>DescribeLoadBalancerAttributes</a> action.</p>
 * Required parameters: [LoadBalancerName]
 */
@interface AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput : AWSRequest


/**
 * <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

@end

/**
 * <p>The following element is returned in a structure named <code>DescribeLoadBalancerAttributesResult</code>.</p>
 */
@interface AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput : AZModel


/**
 * <p>The load balancer attributes structure.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingLoadBalancerAttributes *loadBalancerAttributes;

@end

@interface AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput : AWSRequest


/**
 * <p>	The mnemonic name associated with the load balancer.	If no name is specified, the operation returns the attributes of either all the sample policies pre-defined by Elastic Load Balancing or the specified sample polices.	</p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

/**
 * <p>	The names of load balancer policies you've created or Elastic Load Balancing sample policy names.	</p>
 */
@property (nonatomic, strong) NSArray *policyNames;

@end

/**
 * <p>The output for the <a>DescribeLoadBalancerPolicies</a> action.</p>
 */
@interface AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput : AZModel


/**
 * <p>	A list of policy description structures.	</p>
 */
@property (nonatomic, strong) NSArray *policyDescriptions;

@end

@interface AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput : AWSRequest


/**
 * <p>	Specifies the name of the policy types.If no names are specified,	returns the description of all	the policy types defined by Elastic Load Balancing service.	</p>
 */
@property (nonatomic, strong) NSArray *policyTypeNames;

@end

/**
 * <p>	The output for the <a>DescribeLoadBalancerPolicyTypes</a> action.	</p>
 */
@interface AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput : AZModel


/**
 * <p>	List of policy type description structures of the specified policy type.	If no policy type names are specified,	returns the description of all the policy types defined by Elastic Load Balancing service.	</p>
 */
@property (nonatomic, strong) NSArray *policyTypeDescriptions;

@end

/**
 * <p> The input for the <a>DetachLoadBalancerFromSubnets</a> action.</p>
 * Required parameters: [LoadBalancerName, Subnets]
 */
@interface AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput : AWSRequest


/**
 * <p> The name associated with the load balancer to be detached. </p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

/**
 * <p> A list of subnet IDs to remove from the set of configured subnets for the load balancer. </p>
 */
@property (nonatomic, strong) NSArray *subnets;

@end

/**
 * <p> The output for the <a>DetachLoadBalancerFromSubnets</a> action. </p>
 */
@interface AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput : AZModel


/**
 * <p> A list of subnet IDs the load balancer is now attached to. </p>
 */
@property (nonatomic, strong) NSArray *subnets;

@end

/**
 * <p> The HealthCheck data type. </p>
 * Required parameters: [Target, Interval, Timeout, UnhealthyThreshold, HealthyThreshold]
 */
@interface AWSElasticLoadBalancingHealthCheck : AZModel


/**
 * <p> Specifies the number of consecutive health probe successes required before moving the instance to the <i>Healthy</i> state. </p>
 */
@property (nonatomic, strong) NSNumber *healthyThreshold;

/**
 * <p> Specifies the approximate interval, in seconds, between health checks of an individual instance. </p>
 */
@property (nonatomic, strong) NSNumber *interval;

/**
 * <p> Specifies the instance being checked. The protocol is either TCP, HTTP, HTTPS, or SSL. The range of valid ports is one (1) through 65535. </p><note><p> TCP is the default, specified as a TCP: port pair, for example "TCP:5000". In this case a healthcheck simply attempts to open a TCP connection to the instance on the specified port. Failure to connect within the configured timeout is considered unhealthy. </p><p>SSL is also specified as SSL: port pair, for example, SSL:5000.</p><p> For HTTP or HTTPS protocol, the situation is different. You have to include a ping path in the string. HTTP is specified as a HTTP:port;/;PathToPing; grouping, for example "HTTP:80/weather/us/wa/seattle". In this case, a HTTP GET request is issued to the instance on the given port and path. Any answer other than "200 OK" within the timeout period is considered unhealthy. </p><p> The total length of the HTTP ping target needs to be 1024 16-bit Unicode characters or less. </p></note>
 */
@property (nonatomic, strong) NSString *target;

/**
 * <p> Specifies the amount of time, in seconds, during which no response means a failed health probe. </p><note> This value must be less than the <i>Interval</i> value. </note>
 */
@property (nonatomic, strong) NSNumber *timeout;

/**
 * <p> Specifies the number of consecutive health probe failures required before moving the instance to the <i>Unhealthy</i> state. </p>
 */
@property (nonatomic, strong) NSNumber *unhealthyThreshold;

@end

/**
 * <p> The Instance data type. </p>
 */
@interface AWSElasticLoadBalancingInstance : AZModel


/**
 * <p> Provides an EC2 instance ID. </p>
 */
@property (nonatomic, strong) NSString *instanceId;

@end

/**
 * <p> The InstanceState data type. </p>
 */
@interface AWSElasticLoadBalancingInstanceState : AZModel


/**
 * <p> Provides a description of the instance state. </p>
 */
@property (nonatomic, strong) NSString *description;

/**
 * <p> Provides an EC2 instance ID. </p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p> Provides information about the cause of <i>OutOfService</i> instances. Specifically, it indicates whether the cause is Elastic Load Balancing or the instance behind the load balancer. </p><p>Valid value: <code>ELB</code>|<code>Instance</code>|<code>N/A</code></p>
 */
@property (nonatomic, strong) NSString *reasonCode;

/**
 * <p>Specifies the current state of the instance.</p><p>Valid value: <code>InService</code>|<code>OutOfService</code></p>
 */
@property (nonatomic, strong) NSString *state;

@end

/**
 * <p>The LBCookieStickinessPolicy data type. </p>
 */
@interface AWSElasticLoadBalancingLBCookieStickinessPolicy : AZModel


/**
 * <p>The time period in seconds after which the cookie should be considered stale. Not specifying this parameter indicates that the stickiness session will last for the duration of the browser session. </p>
 */
@property (nonatomic, strong) NSNumber *cookieExpirationPeriod;

/**
 * <p>The name for the policy being created. The name must be unique within the set of policies for this load balancer. </p>
 */
@property (nonatomic, strong) NSString *policyName;

@end

/**
 * <p> The Listener data type. </p>
 * Required parameters: [Protocol, LoadBalancerPort, InstancePort]
 */
@interface AWSElasticLoadBalancingListener : AZModel


/**
 * <p> Specifies the TCP port on which the instance server is listening. This property cannot be modified for the life of the load balancer. </p>
 */
@property (nonatomic, strong) NSNumber *instancePort;

/**
 * <p>	Specifies the protocol to use for routing traffic to back-end instances - HTTP, HTTPS, TCP, or SSL.	This property cannot be modified for the life of the load balancer.	</p>	<note>	If the front-end protocol is HTTP or HTTPS, <code>InstanceProtocol</code> has to be at the same protocol layer,	i.e., HTTP or HTTPS. Likewise, if the front-end protocol is TCP or SSL, InstanceProtocol has to be TCP or SSL.	</note>	<note>	If there is another listener with the same <code>InstancePort</code> whose <code>InstanceProtocol</code> is secure,	i.e., HTTPS or SSL, the listener's <code>InstanceProtocol</code> has to be secure, i.e., HTTPS or SSL.If there is another listener with the same <code>InstancePort</code> whose <code>InstanceProtocol</code> is HTTP or TCP, the listener's <code>InstanceProtocol</code> must be either HTTP or TCP. 	</note>
 */
@property (nonatomic, strong) NSString *instanceProtocol;

/**
 * <p> Specifies the external load balancer port number. This property cannot be modified for the life of the load balancer. </p>
 */
@property (nonatomic, strong) NSNumber *loadBalancerPort;

/**
 * <p> Specifies the load balancer transport protocol to use for routing - HTTP, HTTPS, TCP or SSL. This property cannot be modified for the life of the load balancer. </p>
 */
@property (nonatomic, strong) NSString *protocol;

/**
 * <p> The ARN string of the server certificate.To get the ARN of the server certificate, call the AWS Identity and Access Management <a href="http://docs.aws.amazon.com/IAM/latest/APIReference/index.html?API_UploadServerCertificate.html">UploadServerCertificate 	 </a> API. </p>
 */
@property (nonatomic, strong) NSString *SSLCertificateId;

@end

/**
 * <p> The ListenerDescription data type.</p>
 */
@interface AWSElasticLoadBalancingListenerDescription : AZModel


/**
 * <p> The Listener data type. </p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingListener *listener;

/**
 * <p> A list of policies enabled for this listener.An empty list indicates that no policies are enabled. </p>
 */
@property (nonatomic, strong) NSArray *policyNames;

@end

/**
 * <p>The <code>LoadBalancerAttributes</code> data type.</p>
 */
@interface AWSElasticLoadBalancingLoadBalancerAttributes : AZModel


/**
 * <p>The name of the load balancer attribute. If enabled, the load balancer captures detailed information of all the requests and delivers the information to the Amazon S3 bucket you specify.</p><p>For more information, see <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/enable-access-logs.html">Enable Access Logs</a>.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingAccessLog *accessLog;

/**
 * <p>The name of the load balancer attribute. If enabled, the load balancer allows existing requests to complete before the load balancer shifts traffic away from a deregistered or unhealthy back-end instance. </p><p>For more information, see <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/config-conn-drain.html">Enable Connection Draining</a>.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingConnectionDraining *connectionDraining;

/**
 * <p>The name of the load balancer attribute. If enabled, the load balancer routes the request traffic evenly across all back-end instances regardless of the Availability Zones.</p><p>For more information, see <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/enable-disable-crosszone-lb.html">Enable Cross-Zone Load Balancing</a>.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingCrossZoneLoadBalancing *crossZoneLoadBalancing;

@end

/**
 * <p>Contains the result of a successful invocation of <a>DescribeLoadBalancers</a>. </p>
 */
@interface AWSElasticLoadBalancingLoadBalancerDescription : AZModel


/**
 * <p> Specifies a list of Availability Zones. </p>
 */
@property (nonatomic, strong) NSArray *availabilityZones;

/**
 * <p> Contains a list of back-end server descriptions. </p>
 */
@property (nonatomic, strong) NSArray *backendServerDescriptions;

/**
 * <p> Provides the name of the Amazon Route 53 hosted zone that is associated with the load balancer. For information on how to associate your load balancer with a hosted zone, go to <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/using-domain-names-with-elb.html">Using Domain Names With Elastic Load Balancing</a> in the <i>Elastic Load Balancing Developer Guide</i>. </p>
 */
@property (nonatomic, strong) NSString *canonicalHostedZoneName;

/**
 * <p> Provides the ID of the Amazon Route 53 hosted zone name that is associated with the load balancer. For information on how to associate or disassociate your load balancer with a hosted zone, go to <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/using-domain-names-with-elb.html">Using Domain Names With Elastic Load Balancing</a> in the <i>Elastic Load Balancing Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString *canonicalHostedZoneNameID;

/**
 * <p> Provides the date and time the load balancer was created. </p>
 */
@property (nonatomic, strong) NSDate *createdTime;

/**
 * <p> Specifies the external DNS name associated with the load balancer. </p>
 */
@property (nonatomic, strong) NSString *DNSName;

/**
 * <p> Specifies information regarding the various health probes conducted on the load balancer. </p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingHealthCheck *healthCheck;

/**
 * <p> Provides a list of EC2 instance IDs for the load balancer. </p>
 */
@property (nonatomic, strong) NSArray *instances;

/**
 * <p> LoadBalancerPort, InstancePort, Protocol, InstanceProtocol, and PolicyNames are returned in a list of tuples in the ListenerDescriptions element. </p>
 */
@property (nonatomic, strong) NSArray *listenerDescriptions;

/**
 * <p> Specifies the name associated with the load balancer. </p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

/**
 * <p>		Provides a list of policies defined for the load balancer.		</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingPolicies *policies;

/**
 * <p>Specifies the type of load balancer.</p><p>If the <code>Scheme</code>is <code>internet-facing</code>, the load balancer has a publicly resolvable DNS name that resolves to public IP addresses.</p><p>If the <code>Scheme</code>is <code>internal</code>, the load balancer has a publicly resolvableDNS name that resolves to private IP addresses.</p><p> This option is only available for load balancers attached to an Amazon VPC. </p>
 */
@property (nonatomic, strong) NSString *scheme;

/**
 * <p> The security groups the load balancer is a member of (VPC only).</p>
 */
@property (nonatomic, strong) NSArray *securityGroups;

/**
 * <p> The security group that you can use as part of your inbound rules foryour load balancer's back-end Amazon EC2 application instances. To only allow traffic from load balancers, add a security group rule to your back end instance that specifies this source security group as the inbound source.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingSourceSecurityGroup *sourceSecurityGroup;

/**
 * <p> Provides a list of VPC subnet IDs for the load balancer. </p>
 */
@property (nonatomic, strong) NSArray *subnets;

/**
 * <p> Provides the ID of the VPC attached to the load balancer. </p>
 */
@property (nonatomic, strong) NSString *VPCId;

@end

/**
 * <p>The input for the <a>ModifyLoadBalancerAttributes</a> action.</p>
 * Required parameters: [LoadBalancerName, LoadBalancerAttributes]
 */
@interface AWSElasticLoadBalancingModifyLoadBalancerAttributesInput : AWSRequest


/**
 * <p>Attributes of the load balancer.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingLoadBalancerAttributes *loadBalancerAttributes;

/**
 * <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

@end

/**
 * <p>The output for the <a>ModifyLoadBalancerAttributes</a> action.</p>
 */
@interface AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput : AZModel


/**
 * <p>The <code>LoadBalancerAttributes</code> data type.</p>
 */
@property (nonatomic, strong) AWSElasticLoadBalancingLoadBalancerAttributes *loadBalancerAttributes;

/**
 * <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

@end

/**
 * <p> The policies data type. </p>
 */
@interface AWSElasticLoadBalancingPolicies : AZModel


/**
 * <p> A list of the <a>AppCookieStickinessPolicy</a> objects created with <a>CreateAppCookieStickinessPolicy</a>. </p>
 */
@property (nonatomic, strong) NSArray *appCookieStickinessPolicies;

/**
 * <p> A list of <a>LBCookieStickinessPolicy</a> objects created with <a>CreateAppCookieStickinessPolicy</a>. </p>
 */
@property (nonatomic, strong) NSArray *LBCookieStickinessPolicies;

/**
 * <p> A list of policy names other than the stickiness policies. </p>
 */
@property (nonatomic, strong) NSArray *otherPolicies;

@end

/**
 * <p> The <a>PolicyAttribute</a> data type.This data type contains a key/value pair that defines properties of a specific policy. </p>
 */
@interface AWSElasticLoadBalancingPolicyAttribute : AZModel


/**
 * <p> The name of the attribute associated with the policy. </p>
 */
@property (nonatomic, strong) NSString *attributeName;

/**
 * <p> The value of the attribute associated with the policy. </p>
 */
@property (nonatomic, strong) NSString *attributeValue;

@end

/**
 * <p> The <code>PolicyAttributeDescription</code> data type. This data type is used to describe the attributes and values associated with a policy. </p>
 */
@interface AWSElasticLoadBalancingPolicyAttributeDescription : AZModel


/**
 * <p> The name of the attribute associated with the policy. </p>
 */
@property (nonatomic, strong) NSString *attributeName;

/**
 * <p> The value of the attribute associated with the policy. </p>
 */
@property (nonatomic, strong) NSString *attributeValue;

@end

/**
 * <p> The <code>PolicyAttributeTypeDescription</code> data type. This data type is used to describe values that are acceptable for the policy attribute. </p>
 */
@interface AWSElasticLoadBalancingPolicyAttributeTypeDescription : AZModel


/**
 * <p> The name of the attribute associated with the policy type. </p>
 */
@property (nonatomic, strong) NSString *attributeName;

/**
 * <p> The type of attribute.For example, Boolean, Integer, etc. </p>
 */
@property (nonatomic, strong) NSString *attributeType;

/**
 * <p> The cardinality of the attribute.Valid Values: <ul><li>ONE(1) : Single value required</li><li>ZERO_OR_ONE(0..1) : Up to one value can be supplied</li><li>ZERO_OR_MORE(0..*) : Optional. Multiple values are allowed</li><li>ONE_OR_MORE(1..*0) : Required.Multiple values are allowed</li></ul></p>
 */
@property (nonatomic, strong) NSString *cardinality;

/**
 * <p> The default value of the attribute, if applicable. </p>
 */
@property (nonatomic, strong) NSString *defaultValue;

/**
 * <p> A human-readable description of the attribute. </p>
 */
@property (nonatomic, strong) NSString *description;

@end

/**
 * <p> The <code>PolicyDescription</code> data type. </p>
 */
@interface AWSElasticLoadBalancingPolicyDescription : AZModel


/**
 * <p> A list of policy attribute description structures. </p>
 */
@property (nonatomic, strong) NSArray *policyAttributeDescriptions;

/**
 * <p> The name of the policy associated with the load balancer. </p>
 */
@property (nonatomic, strong) NSString *policyName;

/**
 * <p> The name of the policy type associated with the load balancer. </p>
 */
@property (nonatomic, strong) NSString *policyTypeName;

@end

/**
 * <p> The <a>PolicyTypeDescription</a> data type. </p>
 */
@interface AWSElasticLoadBalancingPolicyTypeDescription : AZModel


/**
 * <p> A human-readable description of the policy type. </p>
 */
@property (nonatomic, strong) NSString *description;

/**
 * <p> The description of the policy attributes associated with the load balancer policies defined by the Elastic Load Balancing service. </p>
 */
@property (nonatomic, strong) NSArray *policyAttributeTypeDescriptions;

/**
 * <p> The name of the policy type. </p>
 */
@property (nonatomic, strong) NSString *policyTypeName;

@end

/**
 * <p> 		The input for the <a>RegisterInstancesWithLoadBalancer</a> action. 		</p>
 * Required parameters: [LoadBalancerName, Instances]
 */
@interface AWSElasticLoadBalancingRegisterEndPointsInput : AWSRequest


/**
 * <p> A list of instance IDs that should be registered with the load balancer.</p>
 */
@property (nonatomic, strong) NSArray *instances;

/**
 * <p> The name associated with the load balancer. The name must be unique within your set of load balancers. </p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

@end

/**
 * <p> 		The output for the <a>RegisterInstancesWithLoadBalancer</a> action. 		</p>
 */
@interface AWSElasticLoadBalancingRegisterEndPointsOutput : AZModel


/**
 * <p> An updated list of instances for the load balancer. </p>
 */
@property (nonatomic, strong) NSArray *instances;

@end

/**
 * <p> 		The input for the <a>DisableAvailabilityZonesForLoadBalancer</a> action. 		</p>
 * Required parameters: [LoadBalancerName, AvailabilityZones]
 */
@interface AWSElasticLoadBalancingRemoveAvailabilityZonesInput : AWSRequest


/**
 * <p> A list of Availability Zones to be removed from the load balancer. </p><note> There must be at least one Availability Zone registered with a load balancer at all times.Specified Availability Zones must be in the same region. </note>
 */
@property (nonatomic, strong) NSArray *availabilityZones;

/**
 * <p> The name associated with the load balancer. </p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

@end

/**
 * <p> 		The output for the <a>DisableAvailabilityZonesForLoadBalancer</a> action. 		</p>
 */
@interface AWSElasticLoadBalancingRemoveAvailabilityZonesOutput : AZModel


/**
 * <p> A list of updated Availability Zones for the load balancer. </p>
 */
@property (nonatomic, strong) NSArray *availabilityZones;

@end

/**
 * <p> The input for the <a>SetLoadBalancerListenerSSLCertificate</a> action. </p>
 * Required parameters: [LoadBalancerName, LoadBalancerPort, SSLCertificateId]
 */
@interface AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput : AWSRequest


/**
 * <p> The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

/**
 * <p> The port that uses the specified SSL certificate.</p>
 */
@property (nonatomic, strong) NSNumber *loadBalancerPort;

/**
 * <p> The Amazon Resource Number (ARN) of the SSL certificate chain to use.For more information on SSL certificates, see<a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/ManagingServerCerts.html"> Managing Server Certificates</a> in the <i>AWS Identity and Access Management User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString *SSLCertificateId;

@end

/**
 * <p> The output for the <a>SetLoadBalancerListenerSSLCertificate</a> action. </p>
 */
@interface AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput : AZModel


@end

@interface AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput : AWSRequest


/**
 * <p> The port number associated with the back-end server. </p>
 */
@property (nonatomic, strong) NSNumber *instancePort;

/**
 * <p> The mnemonic name associated with the load balancer. This name must be unique within the set of your load balancers. </p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

/**
 * <p> List of policy names to be set.If the list is empty, then all current polices are removed from the back-end server. </p>
 */
@property (nonatomic, strong) NSArray *policyNames;

@end

/**
 * <p> The output for the <a>SetLoadBalancerPoliciesForBackendServer</a> action. </p>
 */
@interface AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput : AZModel


@end

/**
 * <p> The input for the <a>SetLoadBalancerPoliciesOfListener</a> action. </p>
 * Required parameters: [LoadBalancerName, LoadBalancerPort, PolicyNames]
 */
@interface AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput : AWSRequest


/**
 * <p> The name of the load balancer. </p>
 */
@property (nonatomic, strong) NSString *loadBalancerName;

/**
 * <p> The external port of the load balancer to associate the policy. </p>
 */
@property (nonatomic, strong) NSNumber *loadBalancerPort;

/**
 * <p> List of policies to be associated with the listener. If the list is empty, the current policy is removed from the listener. </p>
 */
@property (nonatomic, strong) NSArray *policyNames;

@end

/**
 * <p> The output for the <a>SetLoadBalancerPoliciesOfListener</a> action. </p>
 */
@interface AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput : AZModel


@end

/**
 * <p> This data type is used as a response element in the <a>DescribeLoadBalancers</a> action. For information about Elastic Load Balancing security groups, go to <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/elb-security-features.html#using-elb-security-groups">Using Security Groups With Elastic Load Balancing</a> in the <i>Elastic Load Balancing Developer Guide</i>.</p>
 */
@interface AWSElasticLoadBalancingSourceSecurityGroup : AZModel


/**
 * <p> Name of the source security group. Use this value for the<code>--source-group</code> parameter of the <code>ec2-authorize</code> command in the Amazon EC2 command line tool. </p>
 */
@property (nonatomic, strong) NSString *groupName;

/**
 * <p> Owner of the source security group. Use this value for the<code>--source-group-user</code> parameter of the <code>ec2-authorize</code> command in the Amazon EC2 command line tool. </p>
 */
@property (nonatomic, strong) NSString *ownerAlias;

@end
