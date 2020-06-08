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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSShieldErrorDomain;

typedef NS_ENUM(NSInteger, AWSShieldErrorType) {
    AWSShieldErrorUnknown,
    AWSShieldErrorAccessDenied,
    AWSShieldErrorAccessDeniedForDependency,
    AWSShieldErrorInternalError,
    AWSShieldErrorInvalidOperation,
    AWSShieldErrorInvalidPaginationToken,
    AWSShieldErrorInvalidParameter,
    AWSShieldErrorInvalidResource,
    AWSShieldErrorLimitsExceeded,
    AWSShieldErrorLockedSubscription,
    AWSShieldErrorNoAssociatedRole,
    AWSShieldErrorOptimisticLock,
    AWSShieldErrorResourceAlreadyExists,
    AWSShieldErrorResourceNotFound,
};

typedef NS_ENUM(NSInteger, AWSShieldAttackLayer) {
    AWSShieldAttackLayerUnknown,
    AWSShieldAttackLayerNetwork,
    AWSShieldAttackLayerApplication,
};

typedef NS_ENUM(NSInteger, AWSShieldAttackPropertyIdentifier) {
    AWSShieldAttackPropertyIdentifierUnknown,
    AWSShieldAttackPropertyIdentifierDestinationUrl,
    AWSShieldAttackPropertyIdentifierReferrer,
    AWSShieldAttackPropertyIdentifierSourceAsn,
    AWSShieldAttackPropertyIdentifierSourceCountry,
    AWSShieldAttackPropertyIdentifierSourceIpAddress,
    AWSShieldAttackPropertyIdentifierSourceUserAgent,
    AWSShieldAttackPropertyIdentifierWordpressPingbackReflector,
    AWSShieldAttackPropertyIdentifierWordpressPingbackSource,
};

typedef NS_ENUM(NSInteger, AWSShieldAutoRenew) {
    AWSShieldAutoRenewUnknown,
    AWSShieldAutoRenewEnabled,
    AWSShieldAutoRenewDisabled,
};

typedef NS_ENUM(NSInteger, AWSShieldProactiveEngagementStatus) {
    AWSShieldProactiveEngagementStatusUnknown,
    AWSShieldProactiveEngagementStatusEnabled,
    AWSShieldProactiveEngagementStatusDisabled,
    AWSShieldProactiveEngagementStatusPending,
};

typedef NS_ENUM(NSInteger, AWSShieldSubResourceType) {
    AWSShieldSubResourceTypeUnknown,
    AWSShieldSubResourceTypeIp,
    AWSShieldSubResourceTypeUrl,
};

typedef NS_ENUM(NSInteger, AWSShieldSubscriptionState) {
    AWSShieldSubscriptionStateUnknown,
    AWSShieldSubscriptionStateActive,
    AWSShieldSubscriptionStateInactive,
};

typedef NS_ENUM(NSInteger, AWSShieldUnit) {
    AWSShieldUnitUnknown,
    AWSShieldUnitBits,
    AWSShieldUnitBytes,
    AWSShieldUnitPackets,
    AWSShieldUnitRequests,
};

@class AWSShieldAssociateDRTLogBucketRequest;
@class AWSShieldAssociateDRTLogBucketResponse;
@class AWSShieldAssociateDRTRoleRequest;
@class AWSShieldAssociateDRTRoleResponse;
@class AWSShieldAssociateHealthCheckRequest;
@class AWSShieldAssociateHealthCheckResponse;
@class AWSShieldAssociateProactiveEngagementDetailsRequest;
@class AWSShieldAssociateProactiveEngagementDetailsResponse;
@class AWSShieldAttackDetail;
@class AWSShieldAttackProperty;
@class AWSShieldAttackSummary;
@class AWSShieldAttackVectorDescription;
@class AWSShieldContributor;
@class AWSShieldCreateProtectionRequest;
@class AWSShieldCreateProtectionResponse;
@class AWSShieldCreateSubscriptionRequest;
@class AWSShieldCreateSubscriptionResponse;
@class AWSShieldDeleteProtectionRequest;
@class AWSShieldDeleteProtectionResponse;
@class AWSShieldDeleteSubscriptionRequest;
@class AWSShieldDeleteSubscriptionResponse;
@class AWSShieldDescribeAttackRequest;
@class AWSShieldDescribeAttackResponse;
@class AWSShieldDescribeDRTAccessRequest;
@class AWSShieldDescribeDRTAccessResponse;
@class AWSShieldDescribeEmergencyContactSettingsRequest;
@class AWSShieldDescribeEmergencyContactSettingsResponse;
@class AWSShieldDescribeProtectionRequest;
@class AWSShieldDescribeProtectionResponse;
@class AWSShieldDescribeSubscriptionRequest;
@class AWSShieldDescribeSubscriptionResponse;
@class AWSShieldDisableProactiveEngagementRequest;
@class AWSShieldDisableProactiveEngagementResponse;
@class AWSShieldDisassociateDRTLogBucketRequest;
@class AWSShieldDisassociateDRTLogBucketResponse;
@class AWSShieldDisassociateDRTRoleRequest;
@class AWSShieldDisassociateDRTRoleResponse;
@class AWSShieldDisassociateHealthCheckRequest;
@class AWSShieldDisassociateHealthCheckResponse;
@class AWSShieldEmergencyContact;
@class AWSShieldEnableProactiveEngagementRequest;
@class AWSShieldEnableProactiveEngagementResponse;
@class AWSShieldGetSubscriptionStateRequest;
@class AWSShieldGetSubscriptionStateResponse;
@class AWSShieldLimit;
@class AWSShieldListAttacksRequest;
@class AWSShieldListAttacksResponse;
@class AWSShieldListProtectionsRequest;
@class AWSShieldListProtectionsResponse;
@class AWSShieldMitigation;
@class AWSShieldProtection;
@class AWSShieldSubResourceSummary;
@class AWSShieldSubscription;
@class AWSShieldSummarizedAttackVector;
@class AWSShieldSummarizedCounter;
@class AWSShieldTimeRange;
@class AWSShieldUpdateEmergencyContactSettingsRequest;
@class AWSShieldUpdateEmergencyContactSettingsResponse;
@class AWSShieldUpdateSubscriptionRequest;
@class AWSShieldUpdateSubscriptionResponse;

/**
 
 */
@interface AWSShieldAssociateDRTLogBucketRequest : AWSRequest


/**
 <p>The Amazon S3 bucket that contains your AWS WAF logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logBucket;

@end

/**
 
 */
@interface AWSShieldAssociateDRTLogBucketResponse : AWSModel


@end

/**
 
 */
@interface AWSShieldAssociateDRTRoleRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the role the DRT will use to access your AWS account.</p><p>Prior to making the <code>AssociateDRTRole</code> request, you must attach the <a href="https://console.aws.amazon.com/iam/home?#/policies/arn:aws:iam::aws:policy/service-role/AWSShieldDRTAccessPolicy">AWSShieldDRTAccessPolicy</a> managed policy to this role. For more information see <a href=" https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage-attach-detach.html">Attaching and Detaching IAM Policies</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSShieldAssociateDRTRoleResponse : AWSModel


@end

/**
 
 */
@interface AWSShieldAssociateHealthCheckRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the health check to associate with the protection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckArn;

/**
 <p>The unique identifier (ID) for the <a>Protection</a> object to add the health check association to. </p>
 */
@property (nonatomic, strong) NSString * _Nullable protectionId;

@end

/**
 
 */
@interface AWSShieldAssociateHealthCheckResponse : AWSModel


@end

/**
 
 */
@interface AWSShieldAssociateProactiveEngagementDetailsRequest : AWSRequest


/**
 <p>A list of email addresses and phone numbers that the DDoS Response Team (DRT) can use to contact you for escalations to the DRT and to initiate proactive customer support. </p><p>To enable proactive engagement, the contact list must include at least one phone number.</p><note><p>The contacts that you provide here replace any contacts that were already defined. If you already have contacts defined and want to use them, retrieve the list using <code>DescribeEmergencyContactSettings</code> and then provide it here. </p></note>
 */
@property (nonatomic, strong) NSArray<AWSShieldEmergencyContact *> * _Nullable emergencyContactList;

@end

/**
 
 */
@interface AWSShieldAssociateProactiveEngagementDetailsResponse : AWSModel


@end

/**
 <p>The details of a DDoS attack.</p>
 */
@interface AWSShieldAttackDetail : AWSModel


/**
 <p>List of counters that describe the attack for the specified time period.</p>
 */
@property (nonatomic, strong) NSArray<AWSShieldSummarizedCounter *> * _Nullable attackCounters;

/**
 <p>The unique identifier (ID) of the attack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attackId;

/**
 <p>The array of <a>AttackProperty</a> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSShieldAttackProperty *> * _Nullable attackProperties;

/**
 <p>The time the attack ended, in Unix time in seconds. For more information see <a href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp</a>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>List of mitigation actions taken for the attack.</p>
 */
@property (nonatomic, strong) NSArray<AWSShieldMitigation *> * _Nullable mitigations;

/**
 <p>The ARN (Amazon Resource Name) of the resource that was attacked.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The time the attack started, in Unix time in seconds. For more information see <a href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp</a>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>If applicable, additional detail about the resource being attacked, for example, IP address or URL.</p>
 */
@property (nonatomic, strong) NSArray<AWSShieldSubResourceSummary *> * _Nullable subResources;

@end

/**
 <p>Details of the described attack.</p>
 */
@interface AWSShieldAttackProperty : AWSModel


/**
 <p>The type of distributed denial of service (DDoS) event that was observed. <code>NETWORK</code> indicates layer 3 and layer 4 events and <code>APPLICATION</code> indicates layer 7 events.</p>
 */
@property (nonatomic, assign) AWSShieldAttackLayer attackLayer;

/**
 <p>Defines the DDoS attack property information that is provided. The <code>WORDPRESS_PINGBACK_REFLECTOR</code> and <code>WORDPRESS_PINGBACK_SOURCE</code> values are valid only for WordPress reflective pingback DDoS attacks.</p>
 */
@property (nonatomic, assign) AWSShieldAttackPropertyIdentifier attackPropertyIdentifier;

/**
 <p>The array of <a>Contributor</a> objects that includes the top five contributors to an attack. </p>
 */
@property (nonatomic, strong) NSArray<AWSShieldContributor *> * _Nullable topContributors;

/**
 <p>The total contributions made to this attack by all contributors, not just the five listed in the <code>TopContributors</code> list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable total;

/**
 <p>The unit of the <code>Value</code> of the contributions.</p>
 */
@property (nonatomic, assign) AWSShieldUnit unit;

@end

/**
 <p>Summarizes all DDoS attacks for a specified time period.</p>
 */
@interface AWSShieldAttackSummary : AWSModel


/**
 <p>The unique identifier (ID) of the attack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attackId;

/**
 <p>The list of attacks for a specified time period.</p>
 */
@property (nonatomic, strong) NSArray<AWSShieldAttackVectorDescription *> * _Nullable attackVectors;

/**
 <p>The end time of the attack, in Unix time in seconds. For more information see <a href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp</a>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The ARN (Amazon Resource Name) of the resource that was attacked.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The start time of the attack, in Unix time in seconds. For more information see <a href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp</a>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 <p>Describes the attack.</p>
 Required parameters: [VectorType]
 */
@interface AWSShieldAttackVectorDescription : AWSModel


/**
 <p>The attack type. Valid values:</p><ul><li><p>UDP_TRAFFIC</p></li><li><p>UDP_FRAGMENT</p></li><li><p>GENERIC_UDP_REFLECTION</p></li><li><p>DNS_REFLECTION</p></li><li><p>NTP_REFLECTION</p></li><li><p>CHARGEN_REFLECTION</p></li><li><p>SSDP_REFLECTION</p></li><li><p>PORT_MAPPER</p></li><li><p>RIP_REFLECTION</p></li><li><p>SNMP_REFLECTION</p></li><li><p>MSSQL_REFLECTION</p></li><li><p>NET_BIOS_REFLECTION</p></li><li><p>SYN_FLOOD</p></li><li><p>ACK_FLOOD</p></li><li><p>REQUEST_FLOOD</p></li><li><p>HTTP_REFLECTION</p></li><li><p>UDS_REFLECTION</p></li><li><p>MEMCACHED_REFLECTION</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable vectorType;

@end

/**
 <p>A contributor to the attack and their contribution.</p>
 */
@interface AWSShieldContributor : AWSModel


/**
 <p>The name of the contributor. This is dependent on the <code>AttackPropertyIdentifier</code>. For example, if the <code>AttackPropertyIdentifier</code> is <code>SOURCE_COUNTRY</code>, the <code>Name</code> could be <code>United States</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The contribution of this contributor expressed in <a>Protection</a> units. For example <code>10,000</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 
 */
@interface AWSShieldCreateProtectionRequest : AWSRequest


/**
 <p>Friendly name for the <code>Protection</code> you are creating.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ARN (Amazon Resource Name) of the resource to be protected.</p><p>The ARN should be in one of the following formats:</p><ul><li><p>For an Application Load Balancer: <code>arn:aws:elasticloadbalancing:<i>region</i>:<i>account-id</i>:loadbalancer/app/<i>load-balancer-name</i>/<i>load-balancer-id</i></code></p></li><li><p>For an Elastic Load Balancer (Classic Load Balancer): <code>arn:aws:elasticloadbalancing:<i>region</i>:<i>account-id</i>:loadbalancer/<i>load-balancer-name</i></code></p></li><li><p>For an AWS CloudFront distribution: <code>arn:aws:cloudfront::<i>account-id</i>:distribution/<i>distribution-id</i></code></p></li><li><p>For an AWS Global Accelerator accelerator: <code>arn:aws:globalaccelerator::<i>account-id</i>:accelerator/<i>accelerator-id</i></code></p></li><li><p>For Amazon Route 53: <code>arn:aws:route53:::hostedzone/<i>hosted-zone-id</i></code></p></li><li><p>For an Elastic IP address: <code>arn:aws:ec2:<i>region</i>:<i>account-id</i>:eip-allocation/<i>allocation-id</i></code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSShieldCreateProtectionResponse : AWSModel


/**
 <p>The unique identifier (ID) for the <a>Protection</a> object that is created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable protectionId;

@end

/**
 
 */
@interface AWSShieldCreateSubscriptionRequest : AWSRequest


@end

/**
 
 */
@interface AWSShieldCreateSubscriptionResponse : AWSModel


@end

/**
 
 */
@interface AWSShieldDeleteProtectionRequest : AWSRequest


/**
 <p>The unique identifier (ID) for the <a>Protection</a> object to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable protectionId;

@end

/**
 
 */
@interface AWSShieldDeleteProtectionResponse : AWSModel


@end

/**
 
 */
@interface AWSShieldDeleteSubscriptionRequest : AWSRequest


@end

/**
 
 */
@interface AWSShieldDeleteSubscriptionResponse : AWSModel


@end

/**
 
 */
@interface AWSShieldDescribeAttackRequest : AWSRequest


/**
 <p>The unique identifier (ID) for the attack that to be described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attackId;

@end

/**
 
 */
@interface AWSShieldDescribeAttackResponse : AWSModel


/**
 <p>The attack that is described.</p>
 */
@property (nonatomic, strong) AWSShieldAttackDetail * _Nullable attack;

@end

/**
 
 */
@interface AWSShieldDescribeDRTAccessRequest : AWSRequest


@end

/**
 
 */
@interface AWSShieldDescribeDRTAccessResponse : AWSModel


/**
 <p>The list of Amazon S3 buckets accessed by the DRT.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable logBucketList;

/**
 <p>The Amazon Resource Name (ARN) of the role the DRT used to access your AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSShieldDescribeEmergencyContactSettingsRequest : AWSRequest


@end

/**
 
 */
@interface AWSShieldDescribeEmergencyContactSettingsResponse : AWSModel


/**
 <p>A list of email addresses and phone numbers that the DDoS Response Team (DRT) can use to contact you if you have proactive engagement enabled, for escalations to the DRT and to initiate proactive customer support.</p>
 */
@property (nonatomic, strong) NSArray<AWSShieldEmergencyContact *> * _Nullable emergencyContactList;

@end

/**
 
 */
@interface AWSShieldDescribeProtectionRequest : AWSRequest


/**
 <p>The unique identifier (ID) for the <a>Protection</a> object that is described. When submitting the <code>DescribeProtection</code> request you must provide either the <code>ResourceArn</code> or the <code>ProtectionID</code>, but not both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable protectionId;

/**
 <p>The ARN (Amazon Resource Name) of the AWS resource for the <a>Protection</a> object that is described. When submitting the <code>DescribeProtection</code> request you must provide either the <code>ResourceArn</code> or the <code>ProtectionID</code>, but not both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSShieldDescribeProtectionResponse : AWSModel


/**
 <p>The <a>Protection</a> object that is described.</p>
 */
@property (nonatomic, strong) AWSShieldProtection * _Nullable protection;

@end

/**
 
 */
@interface AWSShieldDescribeSubscriptionRequest : AWSRequest


@end

/**
 
 */
@interface AWSShieldDescribeSubscriptionResponse : AWSModel


/**
 <p>The AWS Shield Advanced subscription details for an account.</p>
 */
@property (nonatomic, strong) AWSShieldSubscription * _Nullable subscription;

@end

/**
 
 */
@interface AWSShieldDisableProactiveEngagementRequest : AWSRequest


@end

/**
 
 */
@interface AWSShieldDisableProactiveEngagementResponse : AWSModel


@end

/**
 
 */
@interface AWSShieldDisassociateDRTLogBucketRequest : AWSRequest


/**
 <p>The Amazon S3 bucket that contains your AWS WAF logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logBucket;

@end

/**
 
 */
@interface AWSShieldDisassociateDRTLogBucketResponse : AWSModel


@end

/**
 
 */
@interface AWSShieldDisassociateDRTRoleRequest : AWSRequest


@end

/**
 
 */
@interface AWSShieldDisassociateDRTRoleResponse : AWSModel


@end

/**
 
 */
@interface AWSShieldDisassociateHealthCheckRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the health check that is associated with the protection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckArn;

/**
 <p>The unique identifier (ID) for the <a>Protection</a> object to remove the health check association from. </p>
 */
@property (nonatomic, strong) NSString * _Nullable protectionId;

@end

/**
 
 */
@interface AWSShieldDisassociateHealthCheckResponse : AWSModel


@end

/**
 <p>Contact information that the DRT can use to contact you if you have proactive engagement enabled, for escalations to the DRT and to initiate proactive customer support.</p>
 Required parameters: [EmailAddress]
 */
@interface AWSShieldEmergencyContact : AWSModel


/**
 <p>Additional notes regarding the contact. </p>
 */
@property (nonatomic, strong) NSString * _Nullable contactNotes;

/**
 <p>The email address for the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailAddress;

/**
 <p>The phone number for the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumber;

@end

/**
 
 */
@interface AWSShieldEnableProactiveEngagementRequest : AWSRequest


@end

/**
 
 */
@interface AWSShieldEnableProactiveEngagementResponse : AWSModel


@end

/**
 
 */
@interface AWSShieldGetSubscriptionStateRequest : AWSRequest


@end

/**
 
 */
@interface AWSShieldGetSubscriptionStateResponse : AWSModel


/**
 <p>The status of the subscription.</p>
 */
@property (nonatomic, assign) AWSShieldSubscriptionState subscriptionState;

@end

/**
 <p>Specifies how many protections of a given type you can create.</p>
 */
@interface AWSShieldLimit : AWSModel


/**
 <p>The maximum number of protections that can be created for the specified <code>Type</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable max;

/**
 <p>The type of protection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 
 */
@interface AWSShieldListAttacksRequest : AWSRequest


/**
 <p>The end of the time period for the attacks. This is a <code>timestamp</code> type. The sample request above indicates a <code>number</code> type because the default used by WAF is Unix time in seconds. However any valid <a href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp format</a> is allowed. </p>
 */
@property (nonatomic, strong) AWSShieldTimeRange * _Nullable endTime;

/**
 <p>The maximum number of <a>AttackSummary</a> objects to be returned. If this is left blank, the first 20 results will be returned.</p><p>This is a maximum value; it is possible that AWS WAF will return the results in smaller batches. That is, the number of <a>AttackSummary</a> objects returned could be less than <code>MaxResults</code>, even if there are still more <a>AttackSummary</a> objects yet to return. If there are more <a>AttackSummary</a> objects to return, AWS WAF will always also return a <code>NextToken</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The <code>ListAttacksRequest.NextMarker</code> value from a previous call to <code>ListAttacksRequest</code>. Pass null if this is the first call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ARN (Amazon Resource Name) of the resource that was attacked. If this is left blank, all applicable resources for this account will be included.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceArns;

/**
 <p>The start of the time period for the attacks. This is a <code>timestamp</code> type. The sample request above indicates a <code>number</code> type because the default used by WAF is Unix time in seconds. However any valid <a href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp format</a> is allowed. </p>
 */
@property (nonatomic, strong) AWSShieldTimeRange * _Nullable startTime;

@end

/**
 
 */
@interface AWSShieldListAttacksResponse : AWSModel


/**
 <p>The attack information for the specified time range.</p>
 */
@property (nonatomic, strong) NSArray<AWSShieldAttackSummary *> * _Nullable attackSummaries;

/**
 <p>The token returned by a previous call to indicate that there is more data available. If not null, more results are available. Pass this value for the <code>NextMarker</code> parameter in a subsequent call to <code>ListAttacks</code> to retrieve the next set of items.</p><p>AWS WAF might return the list of <a>AttackSummary</a> objects in batches smaller than the number specified by MaxResults. If there are more <a>AttackSummary</a> objects to return, AWS WAF will always also return a <code>NextToken</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSShieldListProtectionsRequest : AWSRequest


/**
 <p>The maximum number of <a>Protection</a> objects to be returned. If this is left blank the first 20 results will be returned.</p><p>This is a maximum value; it is possible that AWS WAF will return the results in smaller batches. That is, the number of <a>Protection</a> objects returned could be less than <code>MaxResults</code>, even if there are still more <a>Protection</a> objects yet to return. If there are more <a>Protection</a> objects to return, AWS WAF will always also return a <code>NextToken</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The <code>ListProtectionsRequest.NextToken</code> value from a previous call to <code>ListProtections</code>. Pass null if this is the first call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSShieldListProtectionsResponse : AWSModel


/**
 <p>If you specify a value for <code>MaxResults</code> and you have more Protections than the value of MaxResults, AWS Shield Advanced returns a NextToken value in the response that allows you to list another group of Protections. For the second and subsequent ListProtections requests, specify the value of NextToken from the previous response to get information about another batch of Protections.</p><p>AWS WAF might return the list of <a>Protection</a> objects in batches smaller than the number specified by MaxResults. If there are more <a>Protection</a> objects to return, AWS WAF will always also return a <code>NextToken</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The array of enabled <a>Protection</a> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSShieldProtection *> * _Nullable protections;

@end

/**
 <p>The mitigation applied to a DDoS attack.</p>
 */
@interface AWSShieldMitigation : AWSModel


/**
 <p>The name of the mitigation taken for this attack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mitigationName;

@end

/**
 <p>An object that represents a resource that is under DDoS protection.</p>
 */
@interface AWSShieldProtection : AWSModel


/**
 <p>The unique identifier (ID) for the Route 53 health check that's associated with the protection. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable healthCheckIds;

/**
 <p>The unique identifier (ID) of the protection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The friendly name of the protection. For example, <code>My CloudFront distributions</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ARN (Amazon Resource Name) of the AWS resource that is protected.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 <p>The attack information for the specified SubResource.</p>
 */
@interface AWSShieldSubResourceSummary : AWSModel


/**
 <p>The list of attack types and associated counters.</p>
 */
@property (nonatomic, strong) NSArray<AWSShieldSummarizedAttackVector *> * _Nullable attackVectors;

/**
 <p>The counters that describe the details of the attack.</p>
 */
@property (nonatomic, strong) NSArray<AWSShieldSummarizedCounter *> * _Nullable counters;

/**
 <p>The unique identifier (ID) of the <code>SubResource</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The <code>SubResource</code> type.</p>
 */
@property (nonatomic, assign) AWSShieldSubResourceType types;

@end

/**
 <p>Information about the AWS Shield Advanced subscription for an account.</p>
 */
@interface AWSShieldSubscription : AWSModel


/**
 <p>If <code>ENABLED</code>, the subscription will be automatically renewed at the end of the existing subscription period.</p><p>When you initally create a subscription, <code>AutoRenew</code> is set to <code>ENABLED</code>. You can change this by submitting an <code>UpdateSubscription</code> request. If the <code>UpdateSubscription</code> request does not included a value for <code>AutoRenew</code>, the existing value for <code>AutoRenew</code> remains unchanged.</p>
 */
@property (nonatomic, assign) AWSShieldAutoRenew autoRenew;

/**
 <p>The date and time your subscription will end.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>Specifies how many protections of a given type you can create.</p>
 */
@property (nonatomic, strong) NSArray<AWSShieldLimit *> * _Nullable limits;

/**
 <p>If <code>ENABLED</code>, the DDoS Response Team (DRT) will use email and phone to notify contacts about escalations to the DRT and to initiate proactive customer support.</p><p>If <code>PENDING</code>, you have requested proactive engagement and the request is pending. The status changes to <code>ENABLED</code> when your request is fully processed.</p><p>If <code>DISABLED</code>, the DRT will not proactively notify contacts about escalations or to initiate proactive customer support. </p>
 */
@property (nonatomic, assign) AWSShieldProactiveEngagementStatus proactiveEngagementStatus;

/**
 <p>The start time of the subscription, in Unix time in seconds. For more information see <a href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp</a>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The length, in seconds, of the AWS Shield Advanced subscription for the account.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeCommitmentInSeconds;

@end

/**
 <p>A summary of information about the attack.</p>
 Required parameters: [VectorType]
 */
@interface AWSShieldSummarizedAttackVector : AWSModel


/**
 <p>The list of counters that describe the details of the attack.</p>
 */
@property (nonatomic, strong) NSArray<AWSShieldSummarizedCounter *> * _Nullable vectorCounters;

/**
 <p>The attack type, for example, SNMP reflection or SYN flood.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vectorType;

@end

/**
 <p>The counter that describes a DDoS attack.</p>
 */
@interface AWSShieldSummarizedCounter : AWSModel


/**
 <p>The average value of the counter for a specified time period.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable average;

/**
 <p>The maximum value of the counter for a specified time period.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable max;

/**
 <p>The number of counters for a specified time period.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable N;

/**
 <p>The counter name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The total of counter values for a specified time period.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sum;

/**
 <p>The unit of the counters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable unit;

@end

/**
 <p>The time range.</p>
 */
@interface AWSShieldTimeRange : AWSModel


/**
 <p>The start time, in Unix time in seconds. For more information see <a href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp</a>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable fromInclusive;

/**
 <p>The end time, in Unix time in seconds. For more information see <a href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types">timestamp</a>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable toExclusive;

@end

/**
 
 */
@interface AWSShieldUpdateEmergencyContactSettingsRequest : AWSRequest


/**
 <p>A list of email addresses and phone numbers that the DDoS Response Team (DRT) can use to contact you if you have proactive engagement enabled, for escalations to the DRT and to initiate proactive customer support.</p><p>If you have proactive engagement enabled, the contact list must include at least one phone number.</p>
 */
@property (nonatomic, strong) NSArray<AWSShieldEmergencyContact *> * _Nullable emergencyContactList;

@end

/**
 
 */
@interface AWSShieldUpdateEmergencyContactSettingsResponse : AWSModel


@end

/**
 
 */
@interface AWSShieldUpdateSubscriptionRequest : AWSRequest


/**
 <p>When you initally create a subscription, <code>AutoRenew</code> is set to <code>ENABLED</code>. If <code>ENABLED</code>, the subscription will be automatically renewed at the end of the existing subscription period. You can change this by submitting an <code>UpdateSubscription</code> request. If the <code>UpdateSubscription</code> request does not included a value for <code>AutoRenew</code>, the existing value for <code>AutoRenew</code> remains unchanged.</p>
 */
@property (nonatomic, assign) AWSShieldAutoRenew autoRenew;

@end

/**
 
 */
@interface AWSShieldUpdateSubscriptionResponse : AWSModel


@end

NS_ASSUME_NONNULL_END
