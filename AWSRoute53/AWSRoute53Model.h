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

FOUNDATION_EXPORT NSString *const AWSRoute53ErrorDomain;

typedef NS_ENUM(NSInteger, AWSRoute53ErrorType) {
    AWSRoute53ErrorUnknown,
    AWSRoute53ErrorConcurrentModification,
    AWSRoute53ErrorConflictingDomainExists,
    AWSRoute53ErrorConflictingTypes,
    AWSRoute53ErrorDelegationSetAlreadyCreated,
    AWSRoute53ErrorDelegationSetAlreadyReusable,
    AWSRoute53ErrorDelegationSetInUse,
    AWSRoute53ErrorDelegationSetNotAvailable,
    AWSRoute53ErrorDelegationSetNotReusable,
    AWSRoute53ErrorHealthCheckAlreadyExists,
    AWSRoute53ErrorHealthCheckInUse,
    AWSRoute53ErrorHealthCheckVersionMismatch,
    AWSRoute53ErrorHostedZoneAlreadyExists,
    AWSRoute53ErrorHostedZoneNotEmpty,
    AWSRoute53ErrorHostedZoneNotFound,
    AWSRoute53ErrorHostedZoneNotPrivate,
    AWSRoute53ErrorIncompatibleVersion,
    AWSRoute53ErrorInsufficientCloudWatchLogsResourcePolicy,
    AWSRoute53ErrorInvalidArgument,
    AWSRoute53ErrorInvalidChangeBatch,
    AWSRoute53ErrorInvalidDomainName,
    AWSRoute53ErrorInvalidInput,
    AWSRoute53ErrorInvalidPaginationToken,
    AWSRoute53ErrorInvalidTrafficPolicyDocument,
    AWSRoute53ErrorInvalidVPCId,
    AWSRoute53ErrorLastVPCAssociation,
    AWSRoute53ErrorLimitsExceeded,
    AWSRoute53ErrorNoSuchChange,
    AWSRoute53ErrorNoSuchCloudWatchLogsLogGroup,
    AWSRoute53ErrorNoSuchDelegationSet,
    AWSRoute53ErrorNoSuchGeoLocation,
    AWSRoute53ErrorNoSuchHealthCheck,
    AWSRoute53ErrorNoSuchHostedZone,
    AWSRoute53ErrorNoSuchQueryLoggingConfig,
    AWSRoute53ErrorNoSuchTrafficPolicy,
    AWSRoute53ErrorNoSuchTrafficPolicyInstance,
    AWSRoute53ErrorNotAuthorized,
    AWSRoute53ErrorPriorRequestNotComplete,
    AWSRoute53ErrorPublicZoneVPCAssociation,
    AWSRoute53ErrorQueryLoggingConfigAlreadyExists,
    AWSRoute53ErrorThrottling,
    AWSRoute53ErrorTooManyHealthChecks,
    AWSRoute53ErrorTooManyHostedZones,
    AWSRoute53ErrorTooManyTrafficPolicies,
    AWSRoute53ErrorTooManyTrafficPolicyInstances,
    AWSRoute53ErrorTooManyTrafficPolicyVersionsForCurrentPolicy,
    AWSRoute53ErrorTooManyVPCAssociationAuthorizations,
    AWSRoute53ErrorTrafficPolicyAlreadyExists,
    AWSRoute53ErrorTrafficPolicyInUse,
    AWSRoute53ErrorTrafficPolicyInstanceAlreadyExists,
    AWSRoute53ErrorVPCAssociationAuthorizationNotFound,
    AWSRoute53ErrorVPCAssociationNotFound,
};

typedef NS_ENUM(NSInteger, AWSRoute53AccountLimitType) {
    AWSRoute53AccountLimitTypeUnknown,
    AWSRoute53AccountLimitTypeMaxHealthChecksByOwner,
    AWSRoute53AccountLimitTypeMaxHostedZonesByOwner,
    AWSRoute53AccountLimitTypeMaxTrafficPolicyInstancesByOwner,
    AWSRoute53AccountLimitTypeMaxReusableDelegationSetsByOwner,
    AWSRoute53AccountLimitTypeMaxTrafficPoliciesByOwner,
};

typedef NS_ENUM(NSInteger, AWSRoute53ChangeAction) {
    AWSRoute53ChangeActionUnknown,
    AWSRoute53ChangeActionCreate,
    AWSRoute53ChangeActionDelete,
    AWSRoute53ChangeActionUpsert,
};

typedef NS_ENUM(NSInteger, AWSRoute53ChangeStatus) {
    AWSRoute53ChangeStatusUnknown,
    AWSRoute53ChangeStatusPending,
    AWSRoute53ChangeStatusInsync,
};

typedef NS_ENUM(NSInteger, AWSRoute53CloudWatchRegion) {
    AWSRoute53CloudWatchRegionUnknown,
    AWSRoute53CloudWatchRegionUsEast1,
    AWSRoute53CloudWatchRegionUsEast2,
    AWSRoute53CloudWatchRegionUsWest1,
    AWSRoute53CloudWatchRegionUsWest2,
    AWSRoute53CloudWatchRegionCaCentral1,
    AWSRoute53CloudWatchRegionEuCentral1,
    AWSRoute53CloudWatchRegionEuWest1,
    AWSRoute53CloudWatchRegionEuWest2,
    AWSRoute53CloudWatchRegionEuWest3,
    AWSRoute53CloudWatchRegionApEast1,
    AWSRoute53CloudWatchRegionMeSouth1,
    AWSRoute53CloudWatchRegionApSouth1,
    AWSRoute53CloudWatchRegionApSoutheast1,
    AWSRoute53CloudWatchRegionApSoutheast2,
    AWSRoute53CloudWatchRegionApNortheast1,
    AWSRoute53CloudWatchRegionApNortheast2,
    AWSRoute53CloudWatchRegionApNortheast3,
    AWSRoute53CloudWatchRegionEuNorth1,
    AWSRoute53CloudWatchRegionSaEast1,
    AWSRoute53CloudWatchRegionCnNorthwest1,
    AWSRoute53CloudWatchRegionCnNorth1,
    AWSRoute53CloudWatchRegionAfSouth1,
    AWSRoute53CloudWatchRegionEuSouth1,
    AWSRoute53CloudWatchRegionUsGovWest1,
    AWSRoute53CloudWatchRegionUsGovEast1,
    AWSRoute53CloudWatchRegionUsIsoEast1,
    AWSRoute53CloudWatchRegionUsIsobEast1,
};

typedef NS_ENUM(NSInteger, AWSRoute53ComparisonOperator) {
    AWSRoute53ComparisonOperatorUnknown,
    AWSRoute53ComparisonOperatorGreaterThanOrEqualToThreshold,
    AWSRoute53ComparisonOperatorGreaterThanThreshold,
    AWSRoute53ComparisonOperatorLessThanThreshold,
    AWSRoute53ComparisonOperatorLessThanOrEqualToThreshold,
};

typedef NS_ENUM(NSInteger, AWSRoute53HealthCheckRegion) {
    AWSRoute53HealthCheckRegionUnknown,
    AWSRoute53HealthCheckRegionUsEast1,
    AWSRoute53HealthCheckRegionUsWest1,
    AWSRoute53HealthCheckRegionUsWest2,
    AWSRoute53HealthCheckRegionEuWest1,
    AWSRoute53HealthCheckRegionApSoutheast1,
    AWSRoute53HealthCheckRegionApSoutheast2,
    AWSRoute53HealthCheckRegionApNortheast1,
    AWSRoute53HealthCheckRegionSaEast1,
};

typedef NS_ENUM(NSInteger, AWSRoute53HealthCheckType) {
    AWSRoute53HealthCheckTypeUnknown,
    AWSRoute53HealthCheckTypeHttp,
    AWSRoute53HealthCheckTypeHttps,
    AWSRoute53HealthCheckTypeHttpStrMatch,
    AWSRoute53HealthCheckTypeHttpsStrMatch,
    AWSRoute53HealthCheckTypeTcp,
    AWSRoute53HealthCheckTypeCalculated,
    AWSRoute53HealthCheckTypeCloudwatchMetric,
};

typedef NS_ENUM(NSInteger, AWSRoute53HostedZoneLimitType) {
    AWSRoute53HostedZoneLimitTypeUnknown,
    AWSRoute53HostedZoneLimitTypeMaxRrsetsByZone,
    AWSRoute53HostedZoneLimitTypeMaxVpcsAssociatedByZone,
};

typedef NS_ENUM(NSInteger, AWSRoute53InsufficientDataHealthStatus) {
    AWSRoute53InsufficientDataHealthStatusUnknown,
    AWSRoute53InsufficientDataHealthStatusHealthy,
    AWSRoute53InsufficientDataHealthStatusUnhealthy,
    AWSRoute53InsufficientDataHealthStatusLastKnownStatus,
};

typedef NS_ENUM(NSInteger, AWSRoute53RRType) {
    AWSRoute53RRTypeUnknown,
    AWSRoute53RRTypeSoa,
    AWSRoute53RRTypeA,
    AWSRoute53RRTypeTxt,
    AWSRoute53RRTypeNs,
    AWSRoute53RRTypeCname,
    AWSRoute53RRTypeMx,
    AWSRoute53RRTypeNaptr,
    AWSRoute53RRTypePtr,
    AWSRoute53RRTypeSrv,
    AWSRoute53RRTypeSpf,
    AWSRoute53RRTypeAaaa,
    AWSRoute53RRTypeCaa,
};

typedef NS_ENUM(NSInteger, AWSRoute53ResettableElementName) {
    AWSRoute53ResettableElementNameUnknown,
    AWSRoute53ResettableElementNameFullyQualifiedDomainName,
    AWSRoute53ResettableElementNameRegions,
    AWSRoute53ResettableElementNameResourcePath,
    AWSRoute53ResettableElementNameChildHealthChecks,
};

typedef NS_ENUM(NSInteger, AWSRoute53ResourceRecordSetFailover) {
    AWSRoute53ResourceRecordSetFailoverUnknown,
    AWSRoute53ResourceRecordSetFailoverPrimary,
    AWSRoute53ResourceRecordSetFailoverSecondary,
};

typedef NS_ENUM(NSInteger, AWSRoute53ResourceRecordSetRegion) {
    AWSRoute53ResourceRecordSetRegionUnknown,
    AWSRoute53ResourceRecordSetRegionUsEast1,
    AWSRoute53ResourceRecordSetRegionUsEast2,
    AWSRoute53ResourceRecordSetRegionUsWest1,
    AWSRoute53ResourceRecordSetRegionUsWest2,
    AWSRoute53ResourceRecordSetRegionCaCentral1,
    AWSRoute53ResourceRecordSetRegionEuWest1,
    AWSRoute53ResourceRecordSetRegionEuWest2,
    AWSRoute53ResourceRecordSetRegionEuWest3,
    AWSRoute53ResourceRecordSetRegionEuCentral1,
    AWSRoute53ResourceRecordSetRegionApSoutheast1,
    AWSRoute53ResourceRecordSetRegionApSoutheast2,
    AWSRoute53ResourceRecordSetRegionApNortheast1,
    AWSRoute53ResourceRecordSetRegionApNortheast2,
    AWSRoute53ResourceRecordSetRegionApNortheast3,
    AWSRoute53ResourceRecordSetRegionEuNorth1,
    AWSRoute53ResourceRecordSetRegionSaEast1,
    AWSRoute53ResourceRecordSetRegionCnNorth1,
    AWSRoute53ResourceRecordSetRegionCnNorthwest1,
    AWSRoute53ResourceRecordSetRegionApEast1,
    AWSRoute53ResourceRecordSetRegionMeSouth1,
    AWSRoute53ResourceRecordSetRegionApSouth1,
    AWSRoute53ResourceRecordSetRegionAfSouth1,
    AWSRoute53ResourceRecordSetRegionEuSouth1,
};

typedef NS_ENUM(NSInteger, AWSRoute53ReusableDelegationSetLimitType) {
    AWSRoute53ReusableDelegationSetLimitTypeUnknown,
    AWSRoute53ReusableDelegationSetLimitTypeMaxZonesByReusableDelegationSet,
};

typedef NS_ENUM(NSInteger, AWSRoute53Statistic) {
    AWSRoute53StatisticUnknown,
    AWSRoute53StatisticAverage,
    AWSRoute53StatisticSum,
    AWSRoute53StatisticSampleCount,
    AWSRoute53StatisticMaximum,
    AWSRoute53StatisticMinimum,
};

typedef NS_ENUM(NSInteger, AWSRoute53TagResourceType) {
    AWSRoute53TagResourceTypeUnknown,
    AWSRoute53TagResourceTypeHealthcheck,
    AWSRoute53TagResourceTypeHostedzone,
};

typedef NS_ENUM(NSInteger, AWSRoute53VPCRegion) {
    AWSRoute53VPCRegionUnknown,
    AWSRoute53VPCRegionUsEast1,
    AWSRoute53VPCRegionUsEast2,
    AWSRoute53VPCRegionUsWest1,
    AWSRoute53VPCRegionUsWest2,
    AWSRoute53VPCRegionEuWest1,
    AWSRoute53VPCRegionEuWest2,
    AWSRoute53VPCRegionEuWest3,
    AWSRoute53VPCRegionEuCentral1,
    AWSRoute53VPCRegionApEast1,
    AWSRoute53VPCRegionMeSouth1,
    AWSRoute53VPCRegionUsGovWest1,
    AWSRoute53VPCRegionUsGovEast1,
    AWSRoute53VPCRegionUsIsoEast1,
    AWSRoute53VPCRegionUsIsobEast1,
    AWSRoute53VPCRegionApSoutheast1,
    AWSRoute53VPCRegionApSoutheast2,
    AWSRoute53VPCRegionApSouth1,
    AWSRoute53VPCRegionApNortheast1,
    AWSRoute53VPCRegionApNortheast2,
    AWSRoute53VPCRegionApNortheast3,
    AWSRoute53VPCRegionEuNorth1,
    AWSRoute53VPCRegionSaEast1,
    AWSRoute53VPCRegionCaCentral1,
    AWSRoute53VPCRegionCnNorth1,
    AWSRoute53VPCRegionAfSouth1,
    AWSRoute53VPCRegionEuSouth1,
};

@class AWSRoute53AccountLimit;
@class AWSRoute53AlarmIdentifier;
@class AWSRoute53AliasTarget;
@class AWSRoute53AssociateVPCWithHostedZoneRequest;
@class AWSRoute53AssociateVPCWithHostedZoneResponse;
@class AWSRoute53Change;
@class AWSRoute53ChangeBatch;
@class AWSRoute53ChangeInfo;
@class AWSRoute53ChangeResourceRecordSetsRequest;
@class AWSRoute53ChangeResourceRecordSetsResponse;
@class AWSRoute53ChangeTagsForResourceRequest;
@class AWSRoute53ChangeTagsForResourceResponse;
@class AWSRoute53CloudWatchAlarmConfiguration;
@class AWSRoute53CreateHealthCheckRequest;
@class AWSRoute53CreateHealthCheckResponse;
@class AWSRoute53CreateHostedZoneRequest;
@class AWSRoute53CreateHostedZoneResponse;
@class AWSRoute53CreateQueryLoggingConfigRequest;
@class AWSRoute53CreateQueryLoggingConfigResponse;
@class AWSRoute53CreateReusableDelegationSetRequest;
@class AWSRoute53CreateReusableDelegationSetResponse;
@class AWSRoute53CreateTrafficPolicyInstanceRequest;
@class AWSRoute53CreateTrafficPolicyInstanceResponse;
@class AWSRoute53CreateTrafficPolicyRequest;
@class AWSRoute53CreateTrafficPolicyResponse;
@class AWSRoute53CreateTrafficPolicyVersionRequest;
@class AWSRoute53CreateTrafficPolicyVersionResponse;
@class AWSRoute53CreateVPCAssociationAuthorizationRequest;
@class AWSRoute53CreateVPCAssociationAuthorizationResponse;
@class AWSRoute53DelegationSet;
@class AWSRoute53DeleteHealthCheckRequest;
@class AWSRoute53DeleteHealthCheckResponse;
@class AWSRoute53DeleteHostedZoneRequest;
@class AWSRoute53DeleteHostedZoneResponse;
@class AWSRoute53DeleteQueryLoggingConfigRequest;
@class AWSRoute53DeleteQueryLoggingConfigResponse;
@class AWSRoute53DeleteReusableDelegationSetRequest;
@class AWSRoute53DeleteReusableDelegationSetResponse;
@class AWSRoute53DeleteTrafficPolicyInstanceRequest;
@class AWSRoute53DeleteTrafficPolicyInstanceResponse;
@class AWSRoute53DeleteTrafficPolicyRequest;
@class AWSRoute53DeleteTrafficPolicyResponse;
@class AWSRoute53DeleteVPCAssociationAuthorizationRequest;
@class AWSRoute53DeleteVPCAssociationAuthorizationResponse;
@class AWSRoute53Dimension;
@class AWSRoute53DisassociateVPCFromHostedZoneRequest;
@class AWSRoute53DisassociateVPCFromHostedZoneResponse;
@class AWSRoute53GeoLocation;
@class AWSRoute53GeoLocationDetails;
@class AWSRoute53GetAccountLimitRequest;
@class AWSRoute53GetAccountLimitResponse;
@class AWSRoute53GetChangeRequest;
@class AWSRoute53GetChangeResponse;
@class AWSRoute53GetCheckerIpRangesRequest;
@class AWSRoute53GetCheckerIpRangesResponse;
@class AWSRoute53GetGeoLocationRequest;
@class AWSRoute53GetGeoLocationResponse;
@class AWSRoute53GetHealthCheckCountRequest;
@class AWSRoute53GetHealthCheckCountResponse;
@class AWSRoute53GetHealthCheckLastFailureReasonRequest;
@class AWSRoute53GetHealthCheckLastFailureReasonResponse;
@class AWSRoute53GetHealthCheckRequest;
@class AWSRoute53GetHealthCheckResponse;
@class AWSRoute53GetHealthCheckStatusRequest;
@class AWSRoute53GetHealthCheckStatusResponse;
@class AWSRoute53GetHostedZoneCountRequest;
@class AWSRoute53GetHostedZoneCountResponse;
@class AWSRoute53GetHostedZoneLimitRequest;
@class AWSRoute53GetHostedZoneLimitResponse;
@class AWSRoute53GetHostedZoneRequest;
@class AWSRoute53GetHostedZoneResponse;
@class AWSRoute53GetQueryLoggingConfigRequest;
@class AWSRoute53GetQueryLoggingConfigResponse;
@class AWSRoute53GetReusableDelegationSetLimitRequest;
@class AWSRoute53GetReusableDelegationSetLimitResponse;
@class AWSRoute53GetReusableDelegationSetRequest;
@class AWSRoute53GetReusableDelegationSetResponse;
@class AWSRoute53GetTrafficPolicyInstanceCountRequest;
@class AWSRoute53GetTrafficPolicyInstanceCountResponse;
@class AWSRoute53GetTrafficPolicyInstanceRequest;
@class AWSRoute53GetTrafficPolicyInstanceResponse;
@class AWSRoute53GetTrafficPolicyRequest;
@class AWSRoute53GetTrafficPolicyResponse;
@class AWSRoute53HealthCheck;
@class AWSRoute53HealthCheckConfig;
@class AWSRoute53HealthCheckObservation;
@class AWSRoute53HostedZone;
@class AWSRoute53HostedZoneConfig;
@class AWSRoute53HostedZoneLimit;
@class AWSRoute53LinkedService;
@class AWSRoute53ListGeoLocationsRequest;
@class AWSRoute53ListGeoLocationsResponse;
@class AWSRoute53ListHealthChecksRequest;
@class AWSRoute53ListHealthChecksResponse;
@class AWSRoute53ListHostedZonesByNameRequest;
@class AWSRoute53ListHostedZonesByNameResponse;
@class AWSRoute53ListHostedZonesRequest;
@class AWSRoute53ListHostedZonesResponse;
@class AWSRoute53ListQueryLoggingConfigsRequest;
@class AWSRoute53ListQueryLoggingConfigsResponse;
@class AWSRoute53ListResourceRecordSetsRequest;
@class AWSRoute53ListResourceRecordSetsResponse;
@class AWSRoute53ListReusableDelegationSetsRequest;
@class AWSRoute53ListReusableDelegationSetsResponse;
@class AWSRoute53ListTagsForResourceRequest;
@class AWSRoute53ListTagsForResourceResponse;
@class AWSRoute53ListTagsForResourcesRequest;
@class AWSRoute53ListTagsForResourcesResponse;
@class AWSRoute53ListTrafficPoliciesRequest;
@class AWSRoute53ListTrafficPoliciesResponse;
@class AWSRoute53ListTrafficPolicyInstancesByHostedZoneRequest;
@class AWSRoute53ListTrafficPolicyInstancesByHostedZoneResponse;
@class AWSRoute53ListTrafficPolicyInstancesByPolicyRequest;
@class AWSRoute53ListTrafficPolicyInstancesByPolicyResponse;
@class AWSRoute53ListTrafficPolicyInstancesRequest;
@class AWSRoute53ListTrafficPolicyInstancesResponse;
@class AWSRoute53ListTrafficPolicyVersionsRequest;
@class AWSRoute53ListTrafficPolicyVersionsResponse;
@class AWSRoute53ListVPCAssociationAuthorizationsRequest;
@class AWSRoute53ListVPCAssociationAuthorizationsResponse;
@class AWSRoute53QueryLoggingConfig;
@class AWSRoute53ResourceRecord;
@class AWSRoute53ResourceRecordSet;
@class AWSRoute53ResourceTagSet;
@class AWSRoute53ReusableDelegationSetLimit;
@class AWSRoute53StatusReport;
@class AWSRoute53Tag;
@class AWSRoute53TestDNSAnswerRequest;
@class AWSRoute53TestDNSAnswerResponse;
@class AWSRoute53TrafficPolicy;
@class AWSRoute53TrafficPolicyInstance;
@class AWSRoute53TrafficPolicySummary;
@class AWSRoute53UpdateHealthCheckRequest;
@class AWSRoute53UpdateHealthCheckResponse;
@class AWSRoute53UpdateHostedZoneCommentRequest;
@class AWSRoute53UpdateHostedZoneCommentResponse;
@class AWSRoute53UpdateTrafficPolicyCommentRequest;
@class AWSRoute53UpdateTrafficPolicyCommentResponse;
@class AWSRoute53UpdateTrafficPolicyInstanceRequest;
@class AWSRoute53UpdateTrafficPolicyInstanceResponse;
@class AWSRoute53VPC;

/**
 <p>A complex type that contains the type of limit that you specified in the request and the current value for that limit.</p>
 Required parameters: [Type, Value]
 */
@interface AWSRoute53AccountLimit : AWSModel


/**
 <p>The limit that you requested. Valid values include the following:</p><ul><li><p><b>MAX_HEALTH_CHECKS_BY_OWNER</b>: The maximum number of health checks that you can create using the current account.</p></li><li><p><b>MAX_HOSTED_ZONES_BY_OWNER</b>: The maximum number of hosted zones that you can create using the current account.</p></li><li><p><b>MAX_REUSABLE_DELEGATION_SETS_BY_OWNER</b>: The maximum number of reusable delegation sets that you can create using the current account.</p></li><li><p><b>MAX_TRAFFIC_POLICIES_BY_OWNER</b>: The maximum number of traffic policies that you can create using the current account.</p></li><li><p><b>MAX_TRAFFIC_POLICY_INSTANCES_BY_OWNER</b>: The maximum number of traffic policy instances that you can create using the current account. (Traffic policy instances are referred to as traffic flow policy records in the Amazon Route 53 console.)</p></li></ul>
 */
@property (nonatomic, assign) AWSRoute53AccountLimitType types;

/**
 <p>The current value for the limit that is specified by <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_AccountLimit.html#Route53-Type-AccountLimit-Type">Type</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 <p>A complex type that identifies the CloudWatch alarm that you want Amazon Route 53 health checkers to use to determine whether the specified health check is healthy.</p>
 Required parameters: [Region, Name]
 */
@interface AWSRoute53AlarmIdentifier : AWSModel


/**
 <p>The name of the CloudWatch alarm that you want Amazon Route 53 health checkers to use to determine whether this health check is healthy.</p><note><p>Route 53 supports CloudWatch alarms with the following features:</p><ul><li><p>Standard-resolution metrics. High-resolution metrics aren't supported. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/publishingMetrics.html#high-resolution-metrics">High-Resolution Metrics</a> in the <i>Amazon CloudWatch User Guide</i>.</p></li><li><p>Statistics: Average, Minimum, Maximum, Sum, and SampleCount. Extended statistics aren't supported.</p></li></ul></note>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>For the CloudWatch alarm that you want Route 53 health checkers to use to determine whether this health check is healthy, the region that the alarm was created in.</p><p>For the current list of CloudWatch regions, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html#cw_region">Amazon CloudWatch</a> in the <i>AWS Service Endpoints</i> chapter of the <i>Amazon Web Services General Reference</i>.</p>
 */
@property (nonatomic, assign) AWSRoute53CloudWatchRegion region;

@end

/**
 <p><i>Alias resource record sets only:</i> Information about the AWS resource, such as a CloudFront distribution or an Amazon S3 bucket, that you want to route traffic to.</p><p>When creating resource record sets for a private hosted zone, note the following:</p><ul><li><p>Creating geolocation alias resource record sets or latency alias resource record sets in a private hosted zone is unsupported.</p></li><li><p>For information about creating failover resource record sets in a private hosted zone, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-private-hosted-zones.html">Configuring Failover in a Private Hosted Zone</a>.</p></li></ul>
 Required parameters: [HostedZoneId, DNSName, EvaluateTargetHealth]
 */
@interface AWSRoute53AliasTarget : AWSModel


/**
 <p><i>Alias resource record sets only:</i> The value that you specify depends on where you want to route queries:</p><dl><dt>Amazon API Gateway custom regional APIs and edge-optimized APIs</dt><dd><p>Specify the applicable domain name for your API. You can get the applicable value using the AWS CLI command <a href="https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-domain-names.html">get-domain-names</a>:</p><ul><li><p>For regional APIs, specify the value of <code>regionalDomainName</code>.</p></li><li><p>For edge-optimized APIs, specify the value of <code>distributionDomainName</code>. This is the name of the associated CloudFront distribution, such as <code>da1b2c3d4e5.cloudfront.net</code>.</p></li></ul><note><p>The name of the record that you're creating must match a custom domain name for your API, such as <code>api.example.com</code>.</p></note></dd><dt>Amazon Virtual Private Cloud interface VPC endpoint</dt><dd><p>Enter the API endpoint for the interface endpoint, such as <code>vpce-123456789abcdef01-example-us-east-1a.elasticloadbalancing.us-east-1.vpce.amazonaws.com</code>. For edge-optimized APIs, this is the domain name for the corresponding CloudFront distribution. You can get the value of <code>DnsName</code> using the AWS CLI command <a href="https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-vpc-endpoints.html">describe-vpc-endpoints</a>.</p></dd><dt>CloudFront distribution</dt><dd><p>Specify the domain name that CloudFront assigned when you created your distribution.</p><p>Your CloudFront distribution must include an alternate domain name that matches the name of the resource record set. For example, if the name of the resource record set is <i>acme.example.com</i>, your CloudFront distribution must include <i>acme.example.com</i> as one of the alternate domain names. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/CNAMEs.html">Using Alternate Domain Names (CNAMEs)</a> in the <i>Amazon CloudFront Developer Guide</i>.</p><p>You can't create a resource record set in a private hosted zone to route traffic to a CloudFront distribution.</p><note><p>For failover alias records, you can't specify a CloudFront distribution for both the primary and secondary records. A distribution must include an alternate domain name that matches the name of the record. However, the primary and secondary records have the same name, and you can't include the same alternate domain name in more than one distribution. </p></note></dd><dt>Elastic Beanstalk environment</dt><dd><p>If the domain name for your Elastic Beanstalk environment includes the region that you deployed the environment in, you can create an alias record that routes traffic to the environment. For example, the domain name <code>my-environment.<i>us-west-2</i>.elasticbeanstalk.com</code> is a regionalized domain name. </p><important><p>For environments that were created before early 2016, the domain name doesn't include the region. To route traffic to these environments, you must create a CNAME record instead of an alias record. Note that you can't create a CNAME record for the root domain name. For example, if your domain name is example.com, you can create a record that routes traffic for acme.example.com to your Elastic Beanstalk environment, but you can't create a record that routes traffic for example.com to your Elastic Beanstalk environment.</p></important><p>For Elastic Beanstalk environments that have regionalized subdomains, specify the <code>CNAME</code> attribute for the environment. You can use the following methods to get the value of the CNAME attribute:</p><ul><li><p><i>AWS Management Console</i>: For information about how to get the value by using the console, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/customdomains.html">Using Custom Domains with AWS Elastic Beanstalk</a> in the <i>AWS Elastic Beanstalk Developer Guide</i>.</p></li><li><p><i>Elastic Beanstalk API</i>: Use the <code>DescribeEnvironments</code> action to get the value of the <code>CNAME</code> attribute. For more information, see <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/api/API_DescribeEnvironments.html">DescribeEnvironments</a> in the <i>AWS Elastic Beanstalk API Reference</i>.</p></li><li><p><i>AWS CLI</i>: Use the <code>describe-environments</code> command to get the value of the <code>CNAME</code> attribute. For more information, see <a href="https://docs.aws.amazon.com/cli/latest/reference/elasticbeanstalk/describe-environments.html">describe-environments</a> in the <i>AWS CLI Command Reference</i>.</p></li></ul></dd><dt>ELB load balancer</dt><dd><p>Specify the DNS name that is associated with the load balancer. Get the DNS name by using the AWS Management Console, the ELB API, or the AWS CLI. </p><ul><li><p><b>AWS Management Console</b>: Go to the EC2 page, choose <b>Load Balancers</b> in the navigation pane, choose the load balancer, choose the <b>Description</b> tab, and get the value of the <b>DNS name</b> field. </p><p>If you're routing traffic to a Classic Load Balancer, get the value that begins with <b>dualstack</b>. If you're routing traffic to another type of load balancer, get the value that applies to the record type, A or AAAA.</p></li><li><p><b>Elastic Load Balancing API</b>: Use <code>DescribeLoadBalancers</code> to get the value of <code>DNSName</code>. For more information, see the applicable guide:</p><ul><li><p>Classic Load Balancers: <a href="https://docs.aws.amazon.com/elasticloadbalancing/2012-06-01/APIReference/API_DescribeLoadBalancers.html">DescribeLoadBalancers</a></p></li><li><p>Application and Network Load Balancers: <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html">DescribeLoadBalancers</a></p></li></ul></li><li><p><b>AWS CLI</b>: Use <code>describe-load-balancers</code> to get the value of <code>DNSName</code>. For more information, see the applicable guide:</p><ul><li><p>Classic Load Balancers: <a href="http://docs.aws.amazon.com/cli/latest/reference/elb/describe-load-balancers.html">describe-load-balancers</a></p></li><li><p>Application and Network Load Balancers: <a href="http://docs.aws.amazon.com/cli/latest/reference/elbv2/describe-load-balancers.html">describe-load-balancers</a></p></li></ul></li></ul></dd><dt>AWS Global Accelerator accelerator</dt><dd><p>Specify the DNS name for your accelerator:</p><ul><li><p><b>Global Accelerator API:</b> To get the DNS name, use <a href="https://docs.aws.amazon.com/global-accelerator/latest/api/API_DescribeAccelerator.html">DescribeAccelerator</a>.</p></li><li><p><b>AWS CLI:</b> To get the DNS name, use <a href="https://docs.aws.amazon.com/cli/latest/reference/globalaccelerator/describe-accelerator.html">describe-accelerator</a>.</p></li></ul></dd><dt>Amazon S3 bucket that is configured as a static website</dt><dd><p>Specify the domain name of the Amazon S3 website endpoint that you created the bucket in, for example, <code>s3-website.us-east-2.amazonaws.com</code>. For more information about valid values, see the table <a href="https://docs.aws.amazon.com/general/latest/gr/s3.html#s3_website_region_endpoints">Amazon S3 Website Endpoints</a> in the <i>Amazon Web Services General Reference</i>. For more information about using S3 buckets for websites, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/getting-started.html">Getting Started with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide.</i></p></dd><dt>Another Route 53 resource record set</dt><dd><p>Specify the value of the <code>Name</code> element for a resource record set in the current hosted zone.</p><note><p>If you're creating an alias record that has the same name as the hosted zone (known as the zone apex), you can't specify the domain name for a record for which the value of <code>Type</code> is <code>CNAME</code>. This is because the alias record must have the same type as the record that you're routing traffic to, and creating a CNAME record for the zone apex isn't supported even for an alias record.</p></note></dd></dl>
 */
@property (nonatomic, strong) NSString * _Nullable DNSName;

/**
 <p><i>Applies only to alias, failover alias, geolocation alias, latency alias, and weighted alias resource record sets:</i> When <code>EvaluateTargetHealth</code> is <code>true</code>, an alias resource record set inherits the health of the referenced AWS resource, such as an ELB load balancer or another resource record set in the hosted zone.</p><p>Note the following:</p><dl><dt>CloudFront distributions</dt><dd><p>You can't set <code>EvaluateTargetHealth</code> to <code>true</code> when the alias target is a CloudFront distribution.</p></dd><dt>Elastic Beanstalk environments that have regionalized subdomains</dt><dd><p>If you specify an Elastic Beanstalk environment in <code>DNSName</code> and the environment contains an ELB load balancer, Elastic Load Balancing routes queries only to the healthy Amazon EC2 instances that are registered with the load balancer. (An environment automatically contains an ELB load balancer if it includes more than one Amazon EC2 instance.) If you set <code>EvaluateTargetHealth</code> to <code>true</code> and either no Amazon EC2 instances are healthy or the load balancer itself is unhealthy, Route 53 routes queries to other available resources that are healthy, if any. </p><p>If the environment contains a single Amazon EC2 instance, there are no special requirements.</p></dd><dt>ELB load balancers</dt><dd><p>Health checking behavior depends on the type of load balancer:</p><ul><li><p><b>Classic Load Balancers</b>: If you specify an ELB Classic Load Balancer in <code>DNSName</code>, Elastic Load Balancing routes queries only to the healthy Amazon EC2 instances that are registered with the load balancer. If you set <code>EvaluateTargetHealth</code> to <code>true</code> and either no EC2 instances are healthy or the load balancer itself is unhealthy, Route 53 routes queries to other resources.</p></li><li><p><b>Application and Network Load Balancers</b>: If you specify an ELB Application or Network Load Balancer and you set <code>EvaluateTargetHealth</code> to <code>true</code>, Route 53 routes queries to the load balancer based on the health of the target groups that are associated with the load balancer:</p><ul><li><p>For an Application or Network Load Balancer to be considered healthy, every target group that contains targets must contain at least one healthy target. If any target group contains only unhealthy targets, the load balancer is considered unhealthy, and Route 53 routes queries to other resources.</p></li><li><p>A target group that has no registered targets is considered unhealthy.</p></li></ul></li></ul><note><p>When you create a load balancer, you configure settings for Elastic Load Balancing health checks; they're not Route 53 health checks, but they perform a similar function. Do not create Route 53 health checks for the EC2 instances that you register with an ELB load balancer. </p></note></dd><dt>S3 buckets</dt><dd><p>There are no special requirements for setting <code>EvaluateTargetHealth</code> to <code>true</code> when the alias target is an S3 bucket.</p></dd><dt>Other records in the same hosted zone</dt><dd><p>If the AWS resource that you specify in <code>DNSName</code> is a record or a group of records (for example, a group of weighted records) but is not another alias record, we recommend that you associate a health check with all of the records in the alias target. For more information, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-complex-configs.html#dns-failover-complex-configs-hc-omitting">What Happens When You Omit Health Checks?</a> in the <i>Amazon Route 53 Developer Guide</i>.</p></dd></dl><p>For more information and examples, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover.html">Amazon Route 53 Health Checks and DNS Failover</a> in the <i>Amazon Route 53 Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluateTargetHealth;

/**
 <p><i>Alias resource records sets only</i>: The value used depends on where you want to route traffic:</p><dl><dt>Amazon API Gateway custom regional APIs and edge-optimized APIs</dt><dd><p>Specify the hosted zone ID for your API. You can get the applicable value using the AWS CLI command <a href="https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-domain-names.html">get-domain-names</a>:</p><ul><li><p>For regional APIs, specify the value of <code>regionalHostedZoneId</code>.</p></li><li><p>For edge-optimized APIs, specify the value of <code>distributionHostedZoneId</code>.</p></li></ul></dd><dt>Amazon Virtual Private Cloud interface VPC endpoint</dt><dd><p>Specify the hosted zone ID for your interface endpoint. You can get the value of <code>HostedZoneId</code> using the AWS CLI command <a href="https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-vpc-endpoints.html">describe-vpc-endpoints</a>.</p></dd><dt>CloudFront distribution</dt><dd><p>Specify <code>Z2FDTNDATAQYW2</code>.</p><note><p>Alias resource record sets for CloudFront can't be created in a private zone.</p></note></dd><dt>Elastic Beanstalk environment</dt><dd><p>Specify the hosted zone ID for the region that you created the environment in. The environment must have a regionalized subdomain. For a list of regions and the corresponding hosted zone IDs, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html#elasticbeanstalk_region">AWS Elastic Beanstalk</a> in the "AWS Service Endpoints" chapter of the <i>Amazon Web Services General Reference</i>.</p></dd><dt>ELB load balancer</dt><dd><p>Specify the value of the hosted zone ID for the load balancer. Use the following methods to get the hosted zone ID:</p><ul><li><p><a href="https://docs.aws.amazon.com/general/latest/gr/elb.html">Service Endpoints</a> table in the "Elastic Load Balancing Endpoints and Quotas" topic in the <i>Amazon Web Services General Reference</i>: Use the value that corresponds with the region that you created your load balancer in. Note that there are separate columns for Application and Classic Load Balancers and for Network Load Balancers.</p></li><li><p><b>AWS Management Console</b>: Go to the Amazon EC2 page, choose <b>Load Balancers</b> in the navigation pane, select the load balancer, and get the value of the <b>Hosted zone</b> field on the <b>Description</b> tab.</p></li><li><p><b>Elastic Load Balancing API</b>: Use <code>DescribeLoadBalancers</code> to get the applicable value. For more information, see the applicable guide:</p><ul><li><p>Classic Load Balancers: Use <a href="https://docs.aws.amazon.com/elasticloadbalancing/2012-06-01/APIReference/API_DescribeLoadBalancers.html">DescribeLoadBalancers</a> to get the value of <code>CanonicalHostedZoneNameId</code>.</p></li><li><p>Application and Network Load Balancers: Use <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html">DescribeLoadBalancers</a> to get the value of <code>CanonicalHostedZoneId</code>.</p></li></ul></li><li><p><b>AWS CLI</b>: Use <code>describe-load-balancers</code> to get the applicable value. For more information, see the applicable guide:</p><ul><li><p>Classic Load Balancers: Use <a href="http://docs.aws.amazon.com/cli/latest/reference/elb/describe-load-balancers.html">describe-load-balancers</a> to get the value of <code>CanonicalHostedZoneNameId</code>.</p></li><li><p>Application and Network Load Balancers: Use <a href="http://docs.aws.amazon.com/cli/latest/reference/elbv2/describe-load-balancers.html">describe-load-balancers</a> to get the value of <code>CanonicalHostedZoneId</code>.</p></li></ul></li></ul></dd><dt>AWS Global Accelerator accelerator</dt><dd><p>Specify <code>Z2BJ6XQ5FK7U4H</code>.</p></dd><dt>An Amazon S3 bucket configured as a static website</dt><dd><p>Specify the hosted zone ID for the region that you created the bucket in. For more information about valid values, see the table <a href="https://docs.aws.amazon.com/general/latest/gr/s3.html#s3_website_region_endpoints">Amazon S3 Website Endpoints</a> in the <i>Amazon Web Services General Reference</i>.</p></dd><dt>Another Route 53 resource record set in your hosted zone</dt><dd><p>Specify the hosted zone ID of your hosted zone. (An alias resource record set can't reference a resource record set in a different hosted zone.)</p></dd></dl>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

@end

/**
 <p>A complex type that contains information about the request to associate a VPC with a private hosted zone.</p>
 Required parameters: [HostedZoneId, VPC]
 */
@interface AWSRoute53AssociateVPCWithHostedZoneRequest : AWSRequest


/**
 <p><i>Optional:</i> A comment about the association request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The ID of the private hosted zone that you want to associate an Amazon VPC with.</p><p>Note that you can't associate a VPC with a hosted zone that doesn't have an existing VPC association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

/**
 <p>A complex type that contains information about the VPC that you want to associate with a private hosted zone.</p>
 */
@property (nonatomic, strong) AWSRoute53VPC * _Nullable VPC;

@end

/**
 <p>A complex type that contains the response information for the <code>AssociateVPCWithHostedZone</code> request.</p>
 Required parameters: [ChangeInfo]
 */
@interface AWSRoute53AssociateVPCWithHostedZoneResponse : AWSModel


/**
 <p>A complex type that describes the changes made to your hosted zone.</p>
 */
@property (nonatomic, strong) AWSRoute53ChangeInfo * _Nullable changeInfo;

@end

/**
 <p>The information for each resource record set that you want to change.</p>
 Required parameters: [Action, ResourceRecordSet]
 */
@interface AWSRoute53Change : AWSModel


/**
 <p>The action to perform:</p><ul><li><p><code>CREATE</code>: Creates a resource record set that has the specified values.</p></li><li><p><code>DELETE</code>: Deletes a existing resource record set.</p><important><p>To delete the resource record set that is associated with a traffic policy instance, use <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_DeleteTrafficPolicyInstance.html">DeleteTrafficPolicyInstance</a>. Amazon Route 53 will delete the resource record set automatically. If you delete the resource record set by using <code>ChangeResourceRecordSets</code>, Route 53 doesn't automatically delete the traffic policy instance, and you'll continue to be charged for it even though it's no longer in use. </p></important></li><li><p><code>UPSERT</code>: If a resource record set doesn't already exist, Route 53 creates it. If a resource record set does exist, Route 53 updates it with the values in the request.</p></li></ul>
 */
@property (nonatomic, assign) AWSRoute53ChangeAction action;

/**
 <p>Information about the resource record set to create, delete, or update.</p>
 */
@property (nonatomic, strong) AWSRoute53ResourceRecordSet * _Nullable resourceRecordSet;

@end

/**
 <p>The information for a change request.</p>
 Required parameters: [Changes]
 */
@interface AWSRoute53ChangeBatch : AWSModel


/**
 <p>Information about the changes to make to the record sets.</p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53Change *> * _Nullable changes;

/**
 <p><i>Optional:</i> Any comments you want to include about a change batch request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

@end

/**
 <p>A complex type that describes change information about changes made to your hosted zone.</p>
 Required parameters: [Id, Status, SubmittedAt]
 */
@interface AWSRoute53ChangeInfo : AWSModel


/**
 <p>A complex type that describes change information about changes made to your hosted zone.</p><p>This element contains an ID that you use when performing a <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetChange.html">GetChange</a> action to get detailed information about the change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The ID of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The current state of the request. <code>PENDING</code> indicates that this request has not yet been applied to all Amazon Route 53 DNS servers.</p>
 */
@property (nonatomic, assign) AWSRoute53ChangeStatus status;

/**
 <p>The date and time that the change request was submitted in <a href="https://en.wikipedia.org/wiki/ISO_8601">ISO 8601 format</a> and Coordinated Universal Time (UTC). For example, the value <code>2017-03-27T17:48:16.751Z</code> represents March 27, 2017 at 17:48:16.751 UTC.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submittedAt;

@end

/**
 <p>A complex type that contains change information for the resource record set.</p>
 Required parameters: [HostedZoneId, ChangeBatch]
 */
@interface AWSRoute53ChangeResourceRecordSetsRequest : AWSRequest


/**
 <p>A complex type that contains an optional comment and the <code>Changes</code> element.</p>
 */
@property (nonatomic, strong) AWSRoute53ChangeBatch * _Nullable changeBatch;

/**
 <p>The ID of the hosted zone that contains the resource record sets that you want to change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

@end

/**
 <p>A complex type containing the response for the request.</p>
 Required parameters: [ChangeInfo]
 */
@interface AWSRoute53ChangeResourceRecordSetsResponse : AWSModel


/**
 <p>A complex type that contains information about changes made to your hosted zone.</p><p>This element contains an ID that you use when performing a <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetChange.html">GetChange</a> action to get detailed information about the change.</p>
 */
@property (nonatomic, strong) AWSRoute53ChangeInfo * _Nullable changeInfo;

@end

/**
 <p>A complex type that contains information about the tags that you want to add, edit, or delete.</p>
 Required parameters: [ResourceType, ResourceId]
 */
@interface AWSRoute53ChangeTagsForResourceRequest : AWSRequest


/**
 <p>A complex type that contains a list of the tags that you want to add to the specified health check or hosted zone and/or the tags that you want to edit <code>Value</code> for.</p><p>You can add a maximum of 10 tags to a health check or a hosted zone.</p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53Tag *> * _Nullable addTags;

/**
 <p>A complex type that contains a list of the tags that you want to delete from the specified health check or hosted zone. You can specify up to 10 keys.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable removeTagKeys;

/**
 <p>The ID of the resource for which you want to add, change, or delete tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The type of the resource.</p><ul><li><p>The resource type for health checks is <code>healthcheck</code>.</p></li><li><p>The resource type for hosted zones is <code>hostedzone</code>.</p></li></ul>
 */
@property (nonatomic, assign) AWSRoute53TagResourceType resourceType;

@end

/**
 <p>Empty response for the request.</p>
 */
@interface AWSRoute53ChangeTagsForResourceResponse : AWSModel


@end

/**
 <p>A complex type that contains information about the CloudWatch alarm that Amazon Route 53 is monitoring for this health check.</p>
 Required parameters: [EvaluationPeriods, Threshold, ComparisonOperator, Period, MetricName, Namespace, Statistic]
 */
@interface AWSRoute53CloudWatchAlarmConfiguration : AWSModel


/**
 <p>For the metric that the CloudWatch alarm is associated with, the arithmetic operation that is used for the comparison.</p>
 */
@property (nonatomic, assign) AWSRoute53ComparisonOperator comparisonOperator;

/**
 <p>For the metric that the CloudWatch alarm is associated with, a complex type that contains information about the dimensions for the metric. For information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/CW_Support_For_AWS.html">Amazon CloudWatch Namespaces, Dimensions, and Metrics Reference</a> in the <i>Amazon CloudWatch User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53Dimension *> * _Nullable dimensions;

/**
 <p>For the metric that the CloudWatch alarm is associated with, the number of periods that the metric is compared to the threshold.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationPeriods;

/**
 <p>The name of the CloudWatch metric that the alarm is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The namespace of the metric that the alarm is associated with. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/CW_Support_For_AWS.html">Amazon CloudWatch Namespaces, Dimensions, and Metrics Reference</a> in the <i>Amazon CloudWatch User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>For the metric that the CloudWatch alarm is associated with, the duration of one evaluation period in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable period;

/**
 <p>For the metric that the CloudWatch alarm is associated with, the statistic that is applied to the metric.</p>
 */
@property (nonatomic, assign) AWSRoute53Statistic statistic;

/**
 <p>For the metric that the CloudWatch alarm is associated with, the value the metric is compared with.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable threshold;

@end

/**
 <p>A complex type that contains the health check request information.</p>
 Required parameters: [CallerReference, HealthCheckConfig]
 */
@interface AWSRoute53CreateHealthCheckRequest : AWSRequest


/**
 <p>A unique string that identifies the request and that allows you to retry a failed <code>CreateHealthCheck</code> request without the risk of creating two identical health checks:</p><ul><li><p>If you send a <code>CreateHealthCheck</code> request with the same <code>CallerReference</code> and settings as a previous request, and if the health check doesn't exist, Amazon Route 53 creates the health check. If the health check does exist, Route 53 returns the settings for the existing health check.</p></li><li><p>If you send a <code>CreateHealthCheck</code> request with the same <code>CallerReference</code> as a deleted health check, regardless of the settings, Route 53 returns a <code>HealthCheckAlreadyExists</code> error.</p></li><li><p>If you send a <code>CreateHealthCheck</code> request with the same <code>CallerReference</code> as an existing health check but with different settings, Route 53 returns a <code>HealthCheckAlreadyExists</code> error.</p></li><li><p>If you send a <code>CreateHealthCheck</code> request with a unique <code>CallerReference</code> but settings identical to an existing health check, Route 53 creates the health check.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable callerReference;

/**
 <p>A complex type that contains settings for a new health check.</p>
 */
@property (nonatomic, strong) AWSRoute53HealthCheckConfig * _Nullable healthCheckConfig;

@end

/**
 <p>A complex type containing the response information for the new health check.</p>
 Required parameters: [HealthCheck, Location]
 */
@interface AWSRoute53CreateHealthCheckResponse : AWSModel


/**
 <p>A complex type that contains identifying information about the health check.</p>
 */
@property (nonatomic, strong) AWSRoute53HealthCheck * _Nullable healthCheck;

/**
 <p>The unique URL representing the new health check.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

@end

/**
 <p>A complex type that contains information about the request to create a public or private hosted zone.</p>
 Required parameters: [Name, CallerReference]
 */
@interface AWSRoute53CreateHostedZoneRequest : AWSRequest


/**
 <p>A unique string that identifies the request and that allows failed <code>CreateHostedZone</code> requests to be retried without the risk of executing the operation twice. You must use a unique <code>CallerReference</code> string every time you submit a <code>CreateHostedZone</code> request. <code>CallerReference</code> can be any unique string, for example, a date/time stamp.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callerReference;

/**
 <p>If you want to associate a reusable delegation set with this hosted zone, the ID that Amazon Route 53 assigned to the reusable delegation set when you created it. For more information about reusable delegation sets, see <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateReusableDelegationSet.html">CreateReusableDelegationSet</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable delegationSetId;

/**
 <p>(Optional) A complex type that contains the following optional values:</p><ul><li><p>For public and private hosted zones, an optional comment</p></li><li><p>For private hosted zones, an optional <code>PrivateZone</code> element</p></li></ul><p>If you don't specify a comment or the <code>PrivateZone</code> element, omit <code>HostedZoneConfig</code> and the other elements.</p>
 */
@property (nonatomic, strong) AWSRoute53HostedZoneConfig * _Nullable hostedZoneConfig;

/**
 <p>The name of the domain. Specify a fully qualified domain name, for example, <i>www.example.com</i>. The trailing dot is optional; Amazon Route 53 assumes that the domain name is fully qualified. This means that Route 53 treats <i>www.example.com</i> (without a trailing dot) and <i>www.example.com.</i> (with a trailing dot) as identical.</p><p>If you're creating a public hosted zone, this is the name you have registered with your DNS registrar. If your domain name is registered with a registrar other than Route 53, change the name servers for your domain to the set of <code>NameServers</code> that <code>CreateHostedZone</code> returns in <code>DelegationSet</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>(Private hosted zones only) A complex type that contains information about the Amazon VPC that you're associating with this hosted zone.</p><p>You can specify only one Amazon VPC when you create a private hosted zone. To associate additional Amazon VPCs with the hosted zone, use <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_AssociateVPCWithHostedZone.html">AssociateVPCWithHostedZone</a> after you create a hosted zone.</p>
 */
@property (nonatomic, strong) AWSRoute53VPC * _Nullable VPC;

@end

/**
 <p>A complex type containing the response information for the hosted zone.</p>
 Required parameters: [HostedZone, ChangeInfo, DelegationSet, Location]
 */
@interface AWSRoute53CreateHostedZoneResponse : AWSModel


/**
 <p>A complex type that contains information about the <code>CreateHostedZone</code> request.</p>
 */
@property (nonatomic, strong) AWSRoute53ChangeInfo * _Nullable changeInfo;

/**
 <p>A complex type that describes the name servers for this hosted zone.</p>
 */
@property (nonatomic, strong) AWSRoute53DelegationSet * _Nullable delegationSet;

/**
 <p>A complex type that contains general information about the hosted zone.</p>
 */
@property (nonatomic, strong) AWSRoute53HostedZone * _Nullable hostedZone;

/**
 <p>The unique URL representing the new hosted zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>A complex type that contains information about an Amazon VPC that you associated with this hosted zone.</p>
 */
@property (nonatomic, strong) AWSRoute53VPC * _Nullable VPC;

@end

/**
 
 */
@interface AWSRoute53CreateQueryLoggingConfigRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) for the log group that you want to Amazon Route 53 to send query logs to. This is the format of the ARN:</p><p>arn:aws:logs:<i>region</i>:<i>account-id</i>:log-group:<i>log_group_name</i></p><p>To get the ARN for a log group, you can use the CloudWatch console, the <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeLogGroups.html">DescribeLogGroups</a> API action, the <a href="https://docs.aws.amazon.com/cli/latest/reference/logs/describe-log-groups.html">describe-log-groups</a> command, or the applicable command in one of the AWS SDKs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloudWatchLogsLogGroupArn;

/**
 <p>The ID of the hosted zone that you want to log queries for. You can log queries only for public hosted zones.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

@end

/**
 
 */
@interface AWSRoute53CreateQueryLoggingConfigResponse : AWSModel


/**
 <p>The unique URL representing the new query logging configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>A complex type that contains the ID for a query logging configuration, the ID of the hosted zone that you want to log queries for, and the ARN for the log group that you want Amazon Route 53 to send query logs to.</p>
 */
@property (nonatomic, strong) AWSRoute53QueryLoggingConfig * _Nullable queryLoggingConfig;

@end

/**
 
 */
@interface AWSRoute53CreateReusableDelegationSetRequest : AWSRequest


/**
 <p>A unique string that identifies the request, and that allows you to retry failed <code>CreateReusableDelegationSet</code> requests without the risk of executing the operation twice. You must use a unique <code>CallerReference</code> string every time you submit a <code>CreateReusableDelegationSet</code> request. <code>CallerReference</code> can be any unique string, for example a date/time stamp.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callerReference;

/**
 <p>If you want to mark the delegation set for an existing hosted zone as reusable, the ID for that hosted zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

@end

/**
 
 */
@interface AWSRoute53CreateReusableDelegationSetResponse : AWSModel


/**
 <p>A complex type that contains name server information.</p>
 */
@property (nonatomic, strong) AWSRoute53DelegationSet * _Nullable delegationSet;

/**
 <p>The unique URL representing the new reusable delegation set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

@end

/**
 <p>A complex type that contains information about the resource record sets that you want to create based on a specified traffic policy.</p>
 Required parameters: [HostedZoneId, Name, TTL, TrafficPolicyId, TrafficPolicyVersion]
 */
@interface AWSRoute53CreateTrafficPolicyInstanceRequest : AWSRequest


/**
 <p>The ID of the hosted zone that you want Amazon Route 53 to create resource record sets in by using the configuration in a traffic policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

/**
 <p>The domain name (such as example.com) or subdomain name (such as www.example.com) for which Amazon Route 53 responds to DNS queries by using the resource record sets that Route 53 creates for this traffic policy instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>(Optional) The TTL that you want Amazon Route 53 to assign to all of the resource record sets that it creates in the specified hosted zone.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable TTL;

/**
 <p>The ID of the traffic policy that you want to use to create resource record sets in the specified hosted zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trafficPolicyId;

/**
 <p>The version of the traffic policy that you want to use to create resource record sets in the specified hosted zone.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable trafficPolicyVersion;

@end

/**
 <p>A complex type that contains the response information for the <code>CreateTrafficPolicyInstance</code> request.</p>
 Required parameters: [TrafficPolicyInstance, Location]
 */
@interface AWSRoute53CreateTrafficPolicyInstanceResponse : AWSModel


/**
 <p>A unique URL that represents a new traffic policy instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>A complex type that contains settings for the new traffic policy instance.</p>
 */
@property (nonatomic, strong) AWSRoute53TrafficPolicyInstance * _Nullable trafficPolicyInstance;

@end

/**
 <p>A complex type that contains information about the traffic policy that you want to create.</p>
 Required parameters: [Name, Document]
 */
@interface AWSRoute53CreateTrafficPolicyRequest : AWSRequest


/**
 <p>(Optional) Any comments that you want to include about the traffic policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The definition of this traffic policy in JSON format. For more information, see <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/api-policies-traffic-policy-document-format.html">Traffic Policy Document Format</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable document;

/**
 <p>The name of the traffic policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>A complex type that contains the response information for the <code>CreateTrafficPolicy</code> request.</p>
 Required parameters: [TrafficPolicy, Location]
 */
@interface AWSRoute53CreateTrafficPolicyResponse : AWSModel


/**
 <p>A unique URL that represents a new traffic policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>A complex type that contains settings for the new traffic policy.</p>
 */
@property (nonatomic, strong) AWSRoute53TrafficPolicy * _Nullable trafficPolicy;

@end

/**
 <p>A complex type that contains information about the traffic policy that you want to create a new version for.</p>
 Required parameters: [Id, Document]
 */
@interface AWSRoute53CreateTrafficPolicyVersionRequest : AWSRequest


/**
 <p>The comment that you specified in the <code>CreateTrafficPolicyVersion</code> request, if any.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The definition of this version of the traffic policy, in JSON format. You specified the JSON in the <code>CreateTrafficPolicyVersion</code> request. For more information about the JSON format, see <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateTrafficPolicy.html">CreateTrafficPolicy</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable document;

/**
 <p>The ID of the traffic policy for which you want to create a new version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>A complex type that contains the response information for the <code>CreateTrafficPolicyVersion</code> request.</p>
 Required parameters: [TrafficPolicy, Location]
 */
@interface AWSRoute53CreateTrafficPolicyVersionResponse : AWSModel


/**
 <p>A unique URL that represents a new traffic policy version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>A complex type that contains settings for the new version of the traffic policy.</p>
 */
@property (nonatomic, strong) AWSRoute53TrafficPolicy * _Nullable trafficPolicy;

@end

/**
 <p>A complex type that contains information about the request to authorize associating a VPC with your private hosted zone. Authorization is only required when a private hosted zone and a VPC were created by using different accounts.</p>
 Required parameters: [HostedZoneId, VPC]
 */
@interface AWSRoute53CreateVPCAssociationAuthorizationRequest : AWSRequest


/**
 <p>The ID of the private hosted zone that you want to authorize associating a VPC with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

/**
 <p>A complex type that contains the VPC ID and region for the VPC that you want to authorize associating with your hosted zone.</p>
 */
@property (nonatomic, strong) AWSRoute53VPC * _Nullable VPC;

@end

/**
 <p>A complex type that contains the response information from a <code>CreateVPCAssociationAuthorization</code> request.</p>
 Required parameters: [HostedZoneId, VPC]
 */
@interface AWSRoute53CreateVPCAssociationAuthorizationResponse : AWSModel


/**
 <p>The ID of the hosted zone that you authorized associating a VPC with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

/**
 <p>The VPC that you authorized associating with a hosted zone.</p>
 */
@property (nonatomic, strong) AWSRoute53VPC * _Nullable VPC;

@end

/**
 <p>A complex type that lists the name servers in a delegation set, as well as the <code>CallerReference</code> and the <code>ID</code> for the delegation set.</p>
 Required parameters: [NameServers]
 */
@interface AWSRoute53DelegationSet : AWSModel


/**
 <p>The value that you specified for <code>CallerReference</code> when you created the reusable delegation set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callerReference;

/**
 <p>The ID that Amazon Route 53 assigns to a reusable delegation set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>A complex type that contains a list of the authoritative name servers for a hosted zone or for a reusable delegation set.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable nameServers;

@end

/**
 <p>This action deletes a health check.</p>
 Required parameters: [HealthCheckId]
 */
@interface AWSRoute53DeleteHealthCheckRequest : AWSRequest


/**
 <p>The ID of the health check that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckId;

@end

/**
 <p>An empty element.</p>
 */
@interface AWSRoute53DeleteHealthCheckResponse : AWSModel


@end

/**
 <p>A request to delete a hosted zone.</p>
 Required parameters: [Id]
 */
@interface AWSRoute53DeleteHostedZoneRequest : AWSRequest


/**
 <p>The ID of the hosted zone you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>A complex type that contains the response to a <code>DeleteHostedZone</code> request.</p>
 Required parameters: [ChangeInfo]
 */
@interface AWSRoute53DeleteHostedZoneResponse : AWSModel


/**
 <p>A complex type that contains the ID, the status, and the date and time of a request to delete a hosted zone.</p>
 */
@property (nonatomic, strong) AWSRoute53ChangeInfo * _Nullable changeInfo;

@end

/**
 
 */
@interface AWSRoute53DeleteQueryLoggingConfigRequest : AWSRequest


/**
 <p>The ID of the configuration that you want to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSRoute53DeleteQueryLoggingConfigResponse : AWSModel


@end

/**
 <p>A request to delete a reusable delegation set.</p>
 Required parameters: [Id]
 */
@interface AWSRoute53DeleteReusableDelegationSetRequest : AWSRequest


/**
 <p>The ID of the reusable delegation set that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>An empty element.</p>
 */
@interface AWSRoute53DeleteReusableDelegationSetResponse : AWSModel


@end

/**
 <p>A request to delete a specified traffic policy instance.</p>
 Required parameters: [Id]
 */
@interface AWSRoute53DeleteTrafficPolicyInstanceRequest : AWSRequest


/**
 <p>The ID of the traffic policy instance that you want to delete. </p><important><p>When you delete a traffic policy instance, Amazon Route 53 also deletes all of the resource record sets that were created when you created the traffic policy instance.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>An empty element.</p>
 */
@interface AWSRoute53DeleteTrafficPolicyInstanceResponse : AWSModel


@end

/**
 <p>A request to delete a specified traffic policy version.</p>
 Required parameters: [Id, Version]
 */
@interface AWSRoute53DeleteTrafficPolicyRequest : AWSRequest


/**
 <p>The ID of the traffic policy that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The version number of the traffic policy that you want to delete.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>An empty element.</p>
 */
@interface AWSRoute53DeleteTrafficPolicyResponse : AWSModel


@end

/**
 <p>A complex type that contains information about the request to remove authorization to associate a VPC that was created by one AWS account with a hosted zone that was created with a different AWS account. </p>
 Required parameters: [HostedZoneId, VPC]
 */
@interface AWSRoute53DeleteVPCAssociationAuthorizationRequest : AWSRequest


/**
 <p>When removing authorization to associate a VPC that was created by one AWS account with a hosted zone that was created with a different AWS account, the ID of the hosted zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

/**
 <p>When removing authorization to associate a VPC that was created by one AWS account with a hosted zone that was created with a different AWS account, a complex type that includes the ID and region of the VPC.</p>
 */
@property (nonatomic, strong) AWSRoute53VPC * _Nullable VPC;

@end

/**
 <p>Empty response for the request.</p>
 */
@interface AWSRoute53DeleteVPCAssociationAuthorizationResponse : AWSModel


@end

/**
 <p>For the metric that the CloudWatch alarm is associated with, a complex type that contains information about one dimension.</p>
 Required parameters: [Name, Value]
 */
@interface AWSRoute53Dimension : AWSModel


/**
 <p>For the metric that the CloudWatch alarm is associated with, the name of one dimension.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>For the metric that the CloudWatch alarm is associated with, the value of one dimension.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>A complex type that contains information about the VPC that you want to disassociate from a specified private hosted zone.</p>
 Required parameters: [HostedZoneId, VPC]
 */
@interface AWSRoute53DisassociateVPCFromHostedZoneRequest : AWSRequest


/**
 <p><i>Optional:</i> A comment about the disassociation request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The ID of the private hosted zone that you want to disassociate a VPC from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

/**
 <p>A complex type that contains information about the VPC that you're disassociating from the specified hosted zone.</p>
 */
@property (nonatomic, strong) AWSRoute53VPC * _Nullable VPC;

@end

/**
 <p>A complex type that contains the response information for the disassociate request.</p>
 Required parameters: [ChangeInfo]
 */
@interface AWSRoute53DisassociateVPCFromHostedZoneResponse : AWSModel


/**
 <p>A complex type that describes the changes made to the specified private hosted zone.</p>
 */
@property (nonatomic, strong) AWSRoute53ChangeInfo * _Nullable changeInfo;

@end

/**
 <p>A complex type that contains information about a geographic location.</p>
 */
@interface AWSRoute53GeoLocation : AWSModel


/**
 <p>The two-letter code for the continent.</p><p>Amazon Route 53 supports the following continent codes:</p><ul><li><p><b>AF</b>: Africa</p></li><li><p><b>AN</b>: Antarctica</p></li><li><p><b>AS</b>: Asia</p></li><li><p><b>EU</b>: Europe</p></li><li><p><b>OC</b>: Oceania</p></li><li><p><b>NA</b>: North America</p></li><li><p><b>SA</b>: South America</p></li></ul><p>Constraint: Specifying <code>ContinentCode</code> with either <code>CountryCode</code> or <code>SubdivisionCode</code> returns an <code>InvalidInput</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable continentCode;

/**
 <p>For geolocation resource record sets, the two-letter code for a country.</p><p>Amazon Route 53 uses the two-letter country codes that are specified in <a href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO standard 3166-1 alpha-2</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable countryCode;

/**
 <p>For geolocation resource record sets, the two-letter code for a state of the United States. Route 53 doesn't support any other values for <code>SubdivisionCode</code>. For a list of state abbreviations, see <a href="https://pe.usps.com/text/pub28/28apb.htm">Appendix B: Two–Letter State and Possession Abbreviations</a> on the United States Postal Service website. </p><p>If you specify <code>subdivisioncode</code>, you must also specify <code>US</code> for <code>CountryCode</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable subdivisionCode;

@end

/**
 <p>A complex type that contains the codes and full continent, country, and subdivision names for the specified <code>geolocation</code> code.</p>
 */
@interface AWSRoute53GeoLocationDetails : AWSModel


/**
 <p>The two-letter code for the continent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable continentCode;

/**
 <p>The full name of the continent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable continentName;

/**
 <p>The two-letter code for the country.</p>
 */
@property (nonatomic, strong) NSString * _Nullable countryCode;

/**
 <p>The name of the country.</p>
 */
@property (nonatomic, strong) NSString * _Nullable countryName;

/**
 <p>The code for the subdivision. Route 53 currently supports only states in the United States.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subdivisionCode;

/**
 <p>The full name of the subdivision. Route 53 currently supports only states in the United States.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subdivisionName;

@end

/**
 <p>A complex type that contains information about the request to create a hosted zone.</p>
 Required parameters: [Type]
 */
@interface AWSRoute53GetAccountLimitRequest : AWSRequest


/**
 <p>The limit that you want to get. Valid values include the following:</p><ul><li><p><b>MAX_HEALTH_CHECKS_BY_OWNER</b>: The maximum number of health checks that you can create using the current account.</p></li><li><p><b>MAX_HOSTED_ZONES_BY_OWNER</b>: The maximum number of hosted zones that you can create using the current account.</p></li><li><p><b>MAX_REUSABLE_DELEGATION_SETS_BY_OWNER</b>: The maximum number of reusable delegation sets that you can create using the current account.</p></li><li><p><b>MAX_TRAFFIC_POLICIES_BY_OWNER</b>: The maximum number of traffic policies that you can create using the current account.</p></li><li><p><b>MAX_TRAFFIC_POLICY_INSTANCES_BY_OWNER</b>: The maximum number of traffic policy instances that you can create using the current account. (Traffic policy instances are referred to as traffic flow policy records in the Amazon Route 53 console.)</p></li></ul>
 */
@property (nonatomic, assign) AWSRoute53AccountLimitType types;

@end

/**
 <p>A complex type that contains the requested limit. </p>
 Required parameters: [Limit, Count]
 */
@interface AWSRoute53GetAccountLimitResponse : AWSModel


/**
 <p>The current number of entities that you have created of the specified type. For example, if you specified <code>MAX_HEALTH_CHECKS_BY_OWNER</code> for the value of <code>Type</code> in the request, the value of <code>Count</code> is the current number of health checks that you have created using the current account.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>The current setting for the specified limit. For example, if you specified <code>MAX_HEALTH_CHECKS_BY_OWNER</code> for the value of <code>Type</code> in the request, the value of <code>Limit</code> is the maximum number of health checks that you can create using the current account.</p>
 */
@property (nonatomic, strong) AWSRoute53AccountLimit * _Nullable limit;

@end

/**
 <p>The input for a GetChange request.</p>
 Required parameters: [Id]
 */
@interface AWSRoute53GetChangeRequest : AWSRequest


/**
 <p>The ID of the change batch request. The value that you specify here is the value that <code>ChangeResourceRecordSets</code> returned in the <code>Id</code> element when you submitted the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>A complex type that contains the <code>ChangeInfo</code> element.</p>
 Required parameters: [ChangeInfo]
 */
@interface AWSRoute53GetChangeResponse : AWSModel


/**
 <p>A complex type that contains information about the specified change batch.</p>
 */
@property (nonatomic, strong) AWSRoute53ChangeInfo * _Nullable changeInfo;

@end

/**
 <p>Empty request.</p>
 */
@interface AWSRoute53GetCheckerIpRangesRequest : AWSRequest


@end

/**
 <p>A complex type that contains the <code>CheckerIpRanges</code> element.</p>
 Required parameters: [CheckerIpRanges]
 */
@interface AWSRoute53GetCheckerIpRangesResponse : AWSModel


/**
 <p>A complex type that contains sorted list of IP ranges in CIDR format for Amazon Route 53 health checkers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable checkerIpRanges;

@end

/**
 <p>A request for information about whether a specified geographic location is supported for Amazon Route 53 geolocation resource record sets.</p>
 */
@interface AWSRoute53GetGeoLocationRequest : AWSRequest


/**
 <p>For geolocation resource record sets, a two-letter abbreviation that identifies a continent. Amazon Route 53 supports the following continent codes:</p><ul><li><p><b>AF</b>: Africa</p></li><li><p><b>AN</b>: Antarctica</p></li><li><p><b>AS</b>: Asia</p></li><li><p><b>EU</b>: Europe</p></li><li><p><b>OC</b>: Oceania</p></li><li><p><b>NA</b>: North America</p></li><li><p><b>SA</b>: South America</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable continentCode;

/**
 <p>Amazon Route 53 uses the two-letter country codes that are specified in <a href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO standard 3166-1 alpha-2</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable countryCode;

/**
 <p>For <code>SubdivisionCode</code>, Amazon Route 53 supports only states of the United States. For a list of state abbreviations, see <a href="https://pe.usps.com/text/pub28/28apb.htm">Appendix B: Two–Letter State and Possession Abbreviations</a> on the United States Postal Service website. </p><p>If you specify <code>subdivisioncode</code>, you must also specify <code>US</code> for <code>CountryCode</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable subdivisionCode;

@end

/**
 <p>A complex type that contains the response information for the specified geolocation code.</p>
 Required parameters: [GeoLocationDetails]
 */
@interface AWSRoute53GetGeoLocationResponse : AWSModel


/**
 <p>A complex type that contains the codes and full continent, country, and subdivision names for the specified geolocation code.</p>
 */
@property (nonatomic, strong) AWSRoute53GeoLocationDetails * _Nullable geoLocationDetails;

@end

/**
 <p>A request for the number of health checks that are associated with the current AWS account.</p>
 */
@interface AWSRoute53GetHealthCheckCountRequest : AWSRequest


@end

/**
 <p>A complex type that contains the response to a <code>GetHealthCheckCount</code> request.</p>
 Required parameters: [HealthCheckCount]
 */
@interface AWSRoute53GetHealthCheckCountResponse : AWSModel


/**
 <p>The number of health checks associated with the current AWS account.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthCheckCount;

@end

/**
 <p>A request for the reason that a health check failed most recently.</p>
 Required parameters: [HealthCheckId]
 */
@interface AWSRoute53GetHealthCheckLastFailureReasonRequest : AWSRequest


/**
 <p>The ID for the health check for which you want the last failure reason. When you created the health check, <code>CreateHealthCheck</code> returned the ID in the response, in the <code>HealthCheckId</code> element.</p><note><p>If you want to get the last failure reason for a calculated health check, you must use the Amazon Route 53 console or the CloudWatch console. You can't use <code>GetHealthCheckLastFailureReason</code> for a calculated health check.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckId;

@end

/**
 <p>A complex type that contains the response to a <code>GetHealthCheckLastFailureReason</code> request.</p>
 Required parameters: [HealthCheckObservations]
 */
@interface AWSRoute53GetHealthCheckLastFailureReasonResponse : AWSModel


/**
 <p>A list that contains one <code>Observation</code> element for each Amazon Route 53 health checker that is reporting a last failure reason. </p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53HealthCheckObservation *> * _Nullable healthCheckObservations;

@end

/**
 <p>A request to get information about a specified health check. </p>
 Required parameters: [HealthCheckId]
 */
@interface AWSRoute53GetHealthCheckRequest : AWSRequest


/**
 <p>The identifier that Amazon Route 53 assigned to the health check when you created it. When you add or update a resource record set, you use this value to specify which health check to use. The value can be up to 64 characters long.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckId;

@end

/**
 <p>A complex type that contains the response to a <code>GetHealthCheck</code> request.</p>
 Required parameters: [HealthCheck]
 */
@interface AWSRoute53GetHealthCheckResponse : AWSModel


/**
 <p>A complex type that contains information about one health check that is associated with the current AWS account.</p>
 */
@property (nonatomic, strong) AWSRoute53HealthCheck * _Nullable healthCheck;

@end

/**
 <p>A request to get the status for a health check.</p>
 Required parameters: [HealthCheckId]
 */
@interface AWSRoute53GetHealthCheckStatusRequest : AWSRequest


/**
 <p>The ID for the health check that you want the current status for. When you created the health check, <code>CreateHealthCheck</code> returned the ID in the response, in the <code>HealthCheckId</code> element.</p><note><p>If you want to check the status of a calculated health check, you must use the Amazon Route 53 console or the CloudWatch console. You can't use <code>GetHealthCheckStatus</code> to get the status of a calculated health check.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckId;

@end

/**
 <p>A complex type that contains the response to a <code>GetHealthCheck</code> request.</p>
 Required parameters: [HealthCheckObservations]
 */
@interface AWSRoute53GetHealthCheckStatusResponse : AWSModel


/**
 <p>A list that contains one <code>HealthCheckObservation</code> element for each Amazon Route 53 health checker that is reporting a status about the health check endpoint.</p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53HealthCheckObservation *> * _Nullable healthCheckObservations;

@end

/**
 <p>A request to retrieve a count of all the hosted zones that are associated with the current AWS account.</p>
 */
@interface AWSRoute53GetHostedZoneCountRequest : AWSRequest


@end

/**
 <p>A complex type that contains the response to a <code>GetHostedZoneCount</code> request.</p>
 Required parameters: [HostedZoneCount]
 */
@interface AWSRoute53GetHostedZoneCountResponse : AWSModel


/**
 <p>The total number of public and private hosted zones that are associated with the current AWS account.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hostedZoneCount;

@end

/**
 <p>A complex type that contains information about the request to create a hosted zone.</p>
 Required parameters: [Type, HostedZoneId]
 */
@interface AWSRoute53GetHostedZoneLimitRequest : AWSRequest


/**
 <p>The ID of the hosted zone that you want to get a limit for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

/**
 <p>The limit that you want to get. Valid values include the following:</p><ul><li><p><b>MAX_RRSETS_BY_ZONE</b>: The maximum number of records that you can create in the specified hosted zone.</p></li><li><p><b>MAX_VPCS_ASSOCIATED_BY_ZONE</b>: The maximum number of Amazon VPCs that you can associate with the specified private hosted zone.</p></li></ul>
 */
@property (nonatomic, assign) AWSRoute53HostedZoneLimitType types;

@end

/**
 <p>A complex type that contains the requested limit. </p>
 Required parameters: [Limit, Count]
 */
@interface AWSRoute53GetHostedZoneLimitResponse : AWSModel


/**
 <p>The current number of entities that you have created of the specified type. For example, if you specified <code>MAX_RRSETS_BY_ZONE</code> for the value of <code>Type</code> in the request, the value of <code>Count</code> is the current number of records that you have created in the specified hosted zone.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>The current setting for the specified limit. For example, if you specified <code>MAX_RRSETS_BY_ZONE</code> for the value of <code>Type</code> in the request, the value of <code>Limit</code> is the maximum number of records that you can create in the specified hosted zone.</p>
 */
@property (nonatomic, strong) AWSRoute53HostedZoneLimit * _Nullable limit;

@end

/**
 <p>A request to get information about a specified hosted zone. </p>
 Required parameters: [Id]
 */
@interface AWSRoute53GetHostedZoneRequest : AWSRequest


/**
 <p>The ID of the hosted zone that you want to get information about.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>A complex type that contain the response to a <code>GetHostedZone</code> request.</p>
 Required parameters: [HostedZone]
 */
@interface AWSRoute53GetHostedZoneResponse : AWSModel


/**
 <p>A complex type that lists the Amazon Route 53 name servers for the specified hosted zone.</p>
 */
@property (nonatomic, strong) AWSRoute53DelegationSet * _Nullable delegationSet;

/**
 <p>A complex type that contains general information about the specified hosted zone.</p>
 */
@property (nonatomic, strong) AWSRoute53HostedZone * _Nullable hostedZone;

/**
 <p>A complex type that contains information about the VPCs that are associated with the specified hosted zone.</p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53VPC *> * _Nullable VPCs;

@end

/**
 
 */
@interface AWSRoute53GetQueryLoggingConfigRequest : AWSRequest


/**
 <p>The ID of the configuration for DNS query logging that you want to get information about.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSRoute53GetQueryLoggingConfigResponse : AWSModel


/**
 <p>A complex type that contains information about the query logging configuration that you specified in a <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetQueryLoggingConfig.html">GetQueryLoggingConfig</a> request.</p>
 */
@property (nonatomic, strong) AWSRoute53QueryLoggingConfig * _Nullable queryLoggingConfig;

@end

/**
 <p>A complex type that contains information about the request to create a hosted zone.</p>
 Required parameters: [Type, DelegationSetId]
 */
@interface AWSRoute53GetReusableDelegationSetLimitRequest : AWSRequest


/**
 <p>The ID of the delegation set that you want to get the limit for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable delegationSetId;

/**
 <p>Specify <code>MAX_ZONES_BY_REUSABLE_DELEGATION_SET</code> to get the maximum number of hosted zones that you can associate with the specified reusable delegation set.</p>
 */
@property (nonatomic, assign) AWSRoute53ReusableDelegationSetLimitType types;

@end

/**
 <p>A complex type that contains the requested limit. </p>
 Required parameters: [Limit, Count]
 */
@interface AWSRoute53GetReusableDelegationSetLimitResponse : AWSModel


/**
 <p>The current number of hosted zones that you can associate with the specified reusable delegation set.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>The current setting for the limit on hosted zones that you can associate with the specified reusable delegation set.</p>
 */
@property (nonatomic, strong) AWSRoute53ReusableDelegationSetLimit * _Nullable limit;

@end

/**
 <p>A request to get information about a specified reusable delegation set.</p>
 Required parameters: [Id]
 */
@interface AWSRoute53GetReusableDelegationSetRequest : AWSRequest


/**
 <p>The ID of the reusable delegation set that you want to get a list of name servers for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>A complex type that contains the response to the <code>GetReusableDelegationSet</code> request.</p>
 Required parameters: [DelegationSet]
 */
@interface AWSRoute53GetReusableDelegationSetResponse : AWSModel


/**
 <p>A complex type that contains information about the reusable delegation set.</p>
 */
@property (nonatomic, strong) AWSRoute53DelegationSet * _Nullable delegationSet;

@end

/**
 <p>Request to get the number of traffic policy instances that are associated with the current AWS account.</p>
 */
@interface AWSRoute53GetTrafficPolicyInstanceCountRequest : AWSRequest


@end

/**
 <p>A complex type that contains information about the resource record sets that Amazon Route 53 created based on a specified traffic policy.</p>
 Required parameters: [TrafficPolicyInstanceCount]
 */
@interface AWSRoute53GetTrafficPolicyInstanceCountResponse : AWSModel


/**
 <p>The number of traffic policy instances that are associated with the current AWS account.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable trafficPolicyInstanceCount;

@end

/**
 <p>Gets information about a specified traffic policy instance.</p>
 Required parameters: [Id]
 */
@interface AWSRoute53GetTrafficPolicyInstanceRequest : AWSRequest


/**
 <p>The ID of the traffic policy instance that you want to get information about.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>A complex type that contains information about the resource record sets that Amazon Route 53 created based on a specified traffic policy.</p>
 Required parameters: [TrafficPolicyInstance]
 */
@interface AWSRoute53GetTrafficPolicyInstanceResponse : AWSModel


/**
 <p>A complex type that contains settings for the traffic policy instance.</p>
 */
@property (nonatomic, strong) AWSRoute53TrafficPolicyInstance * _Nullable trafficPolicyInstance;

@end

/**
 <p>Gets information about a specific traffic policy version.</p>
 Required parameters: [Id, Version]
 */
@interface AWSRoute53GetTrafficPolicyRequest : AWSRequest


/**
 <p>The ID of the traffic policy that you want to get information about.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The version number of the traffic policy that you want to get information about.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>A complex type that contains the response information for the request.</p>
 Required parameters: [TrafficPolicy]
 */
@interface AWSRoute53GetTrafficPolicyResponse : AWSModel


/**
 <p>A complex type that contains settings for the specified traffic policy.</p>
 */
@property (nonatomic, strong) AWSRoute53TrafficPolicy * _Nullable trafficPolicy;

@end

/**
 <p>A complex type that contains information about one health check that is associated with the current AWS account.</p>
 Required parameters: [Id, CallerReference, HealthCheckConfig, HealthCheckVersion]
 */
@interface AWSRoute53HealthCheck : AWSModel


/**
 <p>A unique string that you specified when you created the health check.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callerReference;

/**
 <p>A complex type that contains information about the CloudWatch alarm that Amazon Route 53 is monitoring for this health check.</p>
 */
@property (nonatomic, strong) AWSRoute53CloudWatchAlarmConfiguration * _Nullable cloudWatchAlarmConfiguration;

/**
 <p>A complex type that contains detailed information about one health check.</p>
 */
@property (nonatomic, strong) AWSRoute53HealthCheckConfig * _Nullable healthCheckConfig;

/**
 <p>The version of the health check. You can optionally pass this value in a call to <code>UpdateHealthCheck</code> to prevent overwriting another change to the health check.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthCheckVersion;

/**
 <p>The identifier that Amazon Route 53assigned to the health check when you created it. When you add or update a resource record set, you use this value to specify which health check to use. The value can be up to 64 characters long. </p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>If the health check was created by another service, the service that created the health check. When a health check is created by another service, you can't edit or delete it using Amazon Route 53. </p>
 */
@property (nonatomic, strong) AWSRoute53LinkedService * _Nullable linkedService;

@end

/**
 <p>A complex type that contains information about the health check.</p>
 Required parameters: [Type]
 */
@interface AWSRoute53HealthCheckConfig : AWSModel


/**
 <p>A complex type that identifies the CloudWatch alarm that you want Amazon Route 53 health checkers to use to determine whether the specified health check is healthy.</p>
 */
@property (nonatomic, strong) AWSRoute53AlarmIdentifier * _Nullable alarmIdentifier;

/**
 <p>(CALCULATED Health Checks Only) A complex type that contains one <code>ChildHealthCheck</code> element for each health check that you want to associate with a <code>CALCULATED</code> health check.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable childHealthChecks;

/**
 <p>Stops Route 53 from performing health checks. When you disable a health check, here's what happens:</p><ul><li><p><b>Health checks that check the health of endpoints:</b> Route 53 stops submitting requests to your application, server, or other resource.</p></li><li><p><b>Calculated health checks:</b> Route 53 stops aggregating the status of the referenced health checks.</p></li><li><p><b>Health checks that monitor CloudWatch alarms:</b> Route 53 stops monitoring the corresponding CloudWatch metrics.</p></li></ul><p>After you disable a health check, Route 53 considers the status of the health check to always be healthy. If you configured DNS failover, Route 53 continues to route traffic to the corresponding resources. If you want to stop routing traffic to a resource, change the value of <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-Inverted">Inverted</a>. </p><p>Charges for a health check still apply when the health check is disabled. For more information, see <a href="http://aws.amazon.com/route53/pricing/">Amazon Route 53 Pricing</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disabled;

/**
 <p>Specify whether you want Amazon Route 53 to send the value of <code>FullyQualifiedDomainName</code> to the endpoint in the <code>client_hello</code> message during TLS negotiation. This allows the endpoint to respond to <code>HTTPS</code> health check requests with the applicable SSL/TLS certificate.</p><p>Some endpoints require that <code>HTTPS</code> requests include the host name in the <code>client_hello</code> message. If you don't enable SNI, the status of the health check will be <code>SSL alert handshake_failure</code>. A health check can also have that status for other reasons. If SNI is enabled and you're still getting the error, check the SSL/TLS configuration on your endpoint and confirm that your certificate is valid.</p><p>The SSL/TLS certificate on your endpoint includes a domain name in the <code>Common Name</code> field and possibly several more in the <code>Subject Alternative Names</code> field. One of the domain names in the certificate should match the value that you specify for <code>FullyQualifiedDomainName</code>. If the endpoint responds to the <code>client_hello</code> message with a certificate that does not include the domain name that you specified in <code>FullyQualifiedDomainName</code>, a health checker will retry the handshake. In the second attempt, the health checker will omit <code>FullyQualifiedDomainName</code> from the <code>client_hello</code> message.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableSNI;

/**
 <p>The number of consecutive health checks that an endpoint must pass or fail for Amazon Route 53 to change the current status of the endpoint from unhealthy to healthy or vice versa. For more information, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html">How Amazon Route 53 Determines Whether an Endpoint Is Healthy</a> in the <i>Amazon Route 53 Developer Guide</i>.</p><p>If you don't specify a value for <code>FailureThreshold</code>, the default value is three health checks.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failureThreshold;

/**
 <p>Amazon Route 53 behavior depends on whether you specify a value for <code>IPAddress</code>.</p><p><b>If you specify a value for</b><code>IPAddress</code>:</p><p>Amazon Route 53 sends health check requests to the specified IPv4 or IPv6 address and passes the value of <code>FullyQualifiedDomainName</code> in the <code>Host</code> header for all health checks except TCP health checks. This is typically the fully qualified DNS name of the endpoint on which you want Route 53 to perform health checks.</p><p>When Route 53 checks the health of an endpoint, here is how it constructs the <code>Host</code> header:</p><ul><li><p>If you specify a value of <code>80</code> for <code>Port</code> and <code>HTTP</code> or <code>HTTP_STR_MATCH</code> for <code>Type</code>, Route 53 passes the value of <code>FullyQualifiedDomainName</code> to the endpoint in the Host header. </p></li><li><p>If you specify a value of <code>443</code> for <code>Port</code> and <code>HTTPS</code> or <code>HTTPS_STR_MATCH</code> for <code>Type</code>, Route 53 passes the value of <code>FullyQualifiedDomainName</code> to the endpoint in the <code>Host</code> header.</p></li><li><p>If you specify another value for <code>Port</code> and any value except <code>TCP</code> for <code>Type</code>, Route 53 passes <code>FullyQualifiedDomainName:Port</code> to the endpoint in the <code>Host</code> header.</p></li></ul><p>If you don't specify a value for <code>FullyQualifiedDomainName</code>, Route 53 substitutes the value of <code>IPAddress</code> in the <code>Host</code> header in each of the preceding cases.</p><p><b>If you don't specify a value for <code>IPAddress</code></b>:</p><p>Route 53 sends a DNS request to the domain that you specify for <code>FullyQualifiedDomainName</code> at the interval that you specify for <code>RequestInterval</code>. Using an IPv4 address that DNS returns, Route 53 then checks the health of the endpoint.</p><note><p>If you don't specify a value for <code>IPAddress</code>, Route 53 uses only IPv4 to send health checks to the endpoint. If there's no resource record set with a type of A for the name that you specify for <code>FullyQualifiedDomainName</code>, the health check fails with a "DNS resolution failed" error.</p></note><p>If you want to check the health of weighted, latency, or failover resource record sets and you choose to specify the endpoint only by <code>FullyQualifiedDomainName</code>, we recommend that you create a separate health check for each endpoint. For example, create a health check for each HTTP server that is serving content for www.example.com. For the value of <code>FullyQualifiedDomainName</code>, specify the domain name of the server (such as us-east-2-www.example.com), not the name of the resource record sets (www.example.com).</p><important><p>In this configuration, if you create a health check for which the value of <code>FullyQualifiedDomainName</code> matches the name of the resource record sets and you then associate the health check with those resource record sets, health check results will be unpredictable.</p></important><p>In addition, if the value that you specify for <code>Type</code> is <code>HTTP</code>, <code>HTTPS</code>, <code>HTTP_STR_MATCH</code>, or <code>HTTPS_STR_MATCH</code>, Route 53 passes the value of <code>FullyQualifiedDomainName</code> in the <code>Host</code> header, as it does when you specify a value for <code>IPAddress</code>. If the value of <code>Type</code> is <code>TCP</code>, Route 53 doesn't pass a <code>Host</code> header.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fullyQualifiedDomainName;

/**
 <p>The number of child health checks that are associated with a <code>CALCULATED</code> health check that Amazon Route 53 must consider healthy for the <code>CALCULATED</code> health check to be considered healthy. To specify the child health checks that you want to associate with a <code>CALCULATED</code> health check, use the <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-ChildHealthChecks">ChildHealthChecks</a> element.</p><p>Note the following:</p><ul><li><p>If you specify a number greater than the number of child health checks, Route 53 always considers this health check to be unhealthy.</p></li><li><p>If you specify <code>0</code>, Route 53 always considers this health check to be healthy.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthThreshold;

/**
 <p>The IPv4 or IPv6 IP address of the endpoint that you want Amazon Route 53 to perform health checks on. If you don't specify a value for <code>IPAddress</code>, Route 53 sends a DNS request to resolve the domain name that you specify in <code>FullyQualifiedDomainName</code> at the interval that you specify in <code>RequestInterval</code>. Using an IP address returned by DNS, Route 53 then checks the health of the endpoint.</p><p>Use one of the following formats for the value of <code>IPAddress</code>: </p><ul><li><p><b>IPv4 address</b>: four values between 0 and 255, separated by periods (.), for example, <code>192.0.2.44</code>.</p></li><li><p><b>IPv6 address</b>: eight groups of four hexadecimal values, separated by colons (:), for example, <code>2001:0db8:85a3:0000:0000:abcd:0001:2345</code>. You can also shorten IPv6 addresses as described in RFC 5952, for example, <code>2001:db8:85a3::abcd:1:2345</code>.</p></li></ul><p>If the endpoint is an EC2 instance, we recommend that you create an Elastic IP address, associate it with your EC2 instance, and specify the Elastic IP address for <code>IPAddress</code>. This ensures that the IP address of your instance will never change.</p><p>For more information, see <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-FullyQualifiedDomainName">FullyQualifiedDomainName</a>. </p><p>Constraints: Route 53 can't check the health of endpoints for which the IP address is in local, private, non-routable, or multicast ranges. For more information about IP addresses for which you can't create health checks, see the following documents:</p><ul><li><p><a href="https://tools.ietf.org/html/rfc5735">RFC 5735, Special Use IPv4 Addresses</a></p></li><li><p><a href="https://tools.ietf.org/html/rfc6598">RFC 6598, IANA-Reserved IPv4 Prefix for Shared Address Space</a></p></li><li><p><a href="https://tools.ietf.org/html/rfc5156">RFC 5156, Special-Use IPv6 Addresses</a></p></li></ul><p>When the value of <code>Type</code> is <code>CALCULATED</code> or <code>CLOUDWATCH_METRIC</code>, omit <code>IPAddress</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable IPAddress;

/**
 <p>When CloudWatch has insufficient data about the metric to determine the alarm state, the status that you want Amazon Route 53 to assign to the health check:</p><ul><li><p><code>Healthy</code>: Route 53 considers the health check to be healthy.</p></li><li><p><code>Unhealthy</code>: Route 53 considers the health check to be unhealthy.</p></li><li><p><code>LastKnownStatus</code>: Route 53 uses the status of the health check from the last time that CloudWatch had sufficient data to determine the alarm state. For new health checks that have no last known status, the default status for the health check is healthy.</p></li></ul>
 */
@property (nonatomic, assign) AWSRoute53InsufficientDataHealthStatus insufficientDataHealthStatus;

/**
 <p>Specify whether you want Amazon Route 53 to invert the status of a health check, for example, to consider a health check unhealthy when it otherwise would be considered healthy.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inverted;

/**
 <p>Specify whether you want Amazon Route 53 to measure the latency between health checkers in multiple AWS regions and your endpoint, and to display CloudWatch latency graphs on the <b>Health Checks</b> page in the Route 53 console.</p><important><p>You can't change the value of <code>MeasureLatency</code> after you create a health check.</p></important>
 */
@property (nonatomic, strong) NSNumber * _Nullable measureLatency;

/**
 <p>The port on the endpoint that you want Amazon Route 53 to perform health checks on.</p><note><p>Don't specify a value for <code>Port</code> when you specify a value for <code>Type</code> of <code>CLOUDWATCH_METRIC</code> or <code>CALCULATED</code>.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>A complex type that contains one <code>Region</code> element for each region from which you want Amazon Route 53 health checkers to check the specified endpoint.</p><p>If you don't specify any regions, Route 53 health checkers automatically performs checks from all of the regions that are listed under <b>Valid Values</b>.</p><p>If you update a health check to remove a region that has been performing health checks, Route 53 will briefly continue to perform checks from that region to ensure that some health checkers are always checking the endpoint (for example, if you replace three regions with four different regions). </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable regions;

/**
 <p>The number of seconds between the time that Amazon Route 53 gets a response from your endpoint and the time that it sends the next health check request. Each Route 53 health checker makes requests at this interval.</p><important><p>You can't change the value of <code>RequestInterval</code> after you create a health check.</p></important><p>If you don't specify a value for <code>RequestInterval</code>, the default value is <code>30</code> seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requestInterval;

/**
 <p>The path, if any, that you want Amazon Route 53 to request when performing health checks. The path can be any value for which your endpoint will return an HTTP status code of 2xx or 3xx when the endpoint is healthy, for example, the file /docs/route53-health-check.html. You can also include query string parameters, for example, <code>/welcome.html?language=jp&amp;login=y</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourcePath;

/**
 <p>If the value of Type is <code>HTTP_STR_MATCH</code> or <code>HTTPS_STR_MATCH</code>, the string that you want Amazon Route 53 to search for in the response body from the specified resource. If the string appears in the response body, Route 53 considers the resource healthy.</p><p>Route 53 considers case when searching for <code>SearchString</code> in the response body. </p>
 */
@property (nonatomic, strong) NSString * _Nullable searchString;

/**
 <p>The type of health check that you want to create, which indicates how Amazon Route 53 determines whether an endpoint is healthy.</p><important><p>You can't change the value of <code>Type</code> after you create a health check.</p></important><p>You can create the following types of health checks:</p><ul><li><p><b>HTTP</b>: Route 53 tries to establish a TCP connection. If successful, Route 53 submits an HTTP request and waits for an HTTP status code of 200 or greater and less than 400.</p></li><li><p><b>HTTPS</b>: Route 53 tries to establish a TCP connection. If successful, Route 53 submits an HTTPS request and waits for an HTTP status code of 200 or greater and less than 400.</p><important><p>If you specify <code>HTTPS</code> for the value of <code>Type</code>, the endpoint must support TLS v1.0 or later.</p></important></li><li><p><b>HTTP_STR_MATCH</b>: Route 53 tries to establish a TCP connection. If successful, Route 53 submits an HTTP request and searches the first 5,120 bytes of the response body for the string that you specify in <code>SearchString</code>.</p></li><li><p><b>HTTPS_STR_MATCH</b>: Route 53 tries to establish a TCP connection. If successful, Route 53 submits an <code>HTTPS</code> request and searches the first 5,120 bytes of the response body for the string that you specify in <code>SearchString</code>.</p></li><li><p><b>TCP</b>: Route 53 tries to establish a TCP connection.</p></li><li><p><b>CLOUDWATCH_METRIC</b>: The health check is associated with a CloudWatch alarm. If the state of the alarm is <code>OK</code>, the health check is considered healthy. If the state is <code>ALARM</code>, the health check is considered unhealthy. If CloudWatch doesn't have sufficient data to determine whether the state is <code>OK</code> or <code>ALARM</code>, the health check status depends on the setting for <code>InsufficientDataHealthStatus</code>: <code>Healthy</code>, <code>Unhealthy</code>, or <code>LastKnownStatus</code>. </p></li><li><p><b>CALCULATED</b>: For health checks that monitor the status of other health checks, Route 53 adds up the number of health checks that Route 53 health checkers consider to be healthy and compares that number with the value of <code>HealthThreshold</code>. </p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html">How Route 53 Determines Whether an Endpoint Is Healthy</a> in the <i>Amazon Route 53 Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSRoute53HealthCheckType types;

@end

/**
 <p>A complex type that contains the last failure reason as reported by one Amazon Route 53 health checker.</p>
 */
@interface AWSRoute53HealthCheckObservation : AWSModel


/**
 <p>The IP address of the Amazon Route 53 health checker that provided the failure reason in <code>StatusReport</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable IPAddress;

/**
 <p>The region of the Amazon Route 53 health checker that provided the status in <code>StatusReport</code>.</p>
 */
@property (nonatomic, assign) AWSRoute53HealthCheckRegion region;

/**
 <p>A complex type that contains the last failure reason as reported by one Amazon Route 53 health checker and the time of the failed health check.</p>
 */
@property (nonatomic, strong) AWSRoute53StatusReport * _Nullable statusReport;

@end

/**
 <p>A complex type that contains general information about the hosted zone.</p>
 Required parameters: [Id, Name, CallerReference]
 */
@interface AWSRoute53HostedZone : AWSModel


/**
 <p>The value that you specified for <code>CallerReference</code> when you created the hosted zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callerReference;

/**
 <p>A complex type that includes the <code>Comment</code> and <code>PrivateZone</code> elements. If you omitted the <code>HostedZoneConfig</code> and <code>Comment</code> elements from the request, the <code>Config</code> and <code>Comment</code> elements don't appear in the response.</p>
 */
@property (nonatomic, strong) AWSRoute53HostedZoneConfig * _Nullable config;

/**
 <p>The ID that Amazon Route 53 assigned to the hosted zone when you created it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>If the hosted zone was created by another service, the service that created the hosted zone. When a hosted zone is created by another service, you can't edit or delete it using Route 53. </p>
 */
@property (nonatomic, strong) AWSRoute53LinkedService * _Nullable linkedService;

/**
 <p>The name of the domain. For public hosted zones, this is the name that you have registered with your DNS registrar.</p><p>For information about how to specify characters other than <code>a-z</code>, <code>0-9</code>, and <code>-</code> (hyphen) and how to specify internationalized domain names, see <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateHostedZone.html">CreateHostedZone</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The number of resource record sets in the hosted zone.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable resourceRecordSetCount;

@end

/**
 <p>A complex type that contains an optional comment about your hosted zone. If you don't want to specify a comment, omit both the <code>HostedZoneConfig</code> and <code>Comment</code> elements.</p>
 */
@interface AWSRoute53HostedZoneConfig : AWSModel


/**
 <p>Any comments that you want to include about the hosted zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>A value that indicates whether this is a private hosted zone.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable privateZone;

@end

/**
 <p>A complex type that contains the type of limit that you specified in the request and the current value for that limit.</p>
 Required parameters: [Type, Value]
 */
@interface AWSRoute53HostedZoneLimit : AWSModel


/**
 <p>The limit that you requested. Valid values include the following:</p><ul><li><p><b>MAX_RRSETS_BY_ZONE</b>: The maximum number of records that you can create in the specified hosted zone.</p></li><li><p><b>MAX_VPCS_ASSOCIATED_BY_ZONE</b>: The maximum number of Amazon VPCs that you can associate with the specified private hosted zone.</p></li></ul>
 */
@property (nonatomic, assign) AWSRoute53HostedZoneLimitType types;

/**
 <p>The current value for the limit that is specified by <code>Type</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 <p>If a health check or hosted zone was created by another service, <code>LinkedService</code> is a complex type that describes the service that created the resource. When a resource is created by another service, you can't edit or delete it using Amazon Route 53. </p>
 */
@interface AWSRoute53LinkedService : AWSModel


/**
 <p>If the health check or hosted zone was created by another service, an optional description that can be provided by the other service. When a resource is created by another service, you can't edit or delete it using Amazon Route 53. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>If the health check or hosted zone was created by another service, the service that created the resource. When a resource is created by another service, you can't edit or delete it using Amazon Route 53. </p>
 */
@property (nonatomic, strong) NSString * _Nullable servicePrincipal;

@end

/**
 <p>A request to get a list of geographic locations that Amazon Route 53 supports for geolocation resource record sets. </p>
 */
@interface AWSRoute53ListGeoLocationsRequest : AWSRequest


/**
 <p>(Optional) The maximum number of geolocations to be included in the response body for this request. If more than <code>maxitems</code> geolocations remain to be listed, then the value of the <code>IsTruncated</code> element in the response is <code>true</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

/**
 <p>The code for the continent with which you want to start listing locations that Amazon Route 53 supports for geolocation. If Route 53 has already returned a page or more of results, if <code>IsTruncated</code> is true, and if <code>NextContinentCode</code> from the previous response has a value, enter that value in <code>startcontinentcode</code> to return the next page of results.</p><p>Include <code>startcontinentcode</code> only if you want to list continents. Don't include <code>startcontinentcode</code> when you're listing countries or countries with their subdivisions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startContinentCode;

/**
 <p>The code for the country with which you want to start listing locations that Amazon Route 53 supports for geolocation. If Route 53 has already returned a page or more of results, if <code>IsTruncated</code> is <code>true</code>, and if <code>NextCountryCode</code> from the previous response has a value, enter that value in <code>startcountrycode</code> to return the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startCountryCode;

/**
 <p>The code for the state of the United States with which you want to start listing locations that Amazon Route 53 supports for geolocation. If Route 53 has already returned a page or more of results, if <code>IsTruncated</code> is <code>true</code>, and if <code>NextSubdivisionCode</code> from the previous response has a value, enter that value in <code>startsubdivisioncode</code> to return the next page of results.</p><p>To list subdivisions (U.S. states), you must include both <code>startcountrycode</code> and <code>startsubdivisioncode</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startSubdivisionCode;

@end

/**
 <p>A complex type containing the response information for the request.</p>
 Required parameters: [GeoLocationDetailsList, IsTruncated, MaxItems]
 */
@interface AWSRoute53ListGeoLocationsResponse : AWSModel


/**
 <p>A complex type that contains one <code>GeoLocationDetails</code> element for each location that Amazon Route 53 supports for geolocation.</p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53GeoLocationDetails *> * _Nullable geoLocationDetailsList;

/**
 <p>A value that indicates whether more locations remain to be listed after the last location in this response. If so, the value of <code>IsTruncated</code> is <code>true</code>. To get more values, submit another request and include the values of <code>NextContinentCode</code>, <code>NextCountryCode</code>, and <code>NextSubdivisionCode</code> in the <code>startcontinentcode</code>, <code>startcountrycode</code>, and <code>startsubdivisioncode</code>, as applicable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>The value that you specified for <code>MaxItems</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

/**
 <p>If <code>IsTruncated</code> is <code>true</code>, you can make a follow-up request to display more locations. Enter the value of <code>NextContinentCode</code> in the <code>startcontinentcode</code> parameter in another <code>ListGeoLocations</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextContinentCode;

/**
 <p>If <code>IsTruncated</code> is <code>true</code>, you can make a follow-up request to display more locations. Enter the value of <code>NextCountryCode</code> in the <code>startcountrycode</code> parameter in another <code>ListGeoLocations</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextCountryCode;

/**
 <p>If <code>IsTruncated</code> is <code>true</code>, you can make a follow-up request to display more locations. Enter the value of <code>NextSubdivisionCode</code> in the <code>startsubdivisioncode</code> parameter in another <code>ListGeoLocations</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextSubdivisionCode;

@end

/**
 <p>A request to retrieve a list of the health checks that are associated with the current AWS account.</p>
 */
@interface AWSRoute53ListHealthChecksRequest : AWSRequest


/**
 <p>If the value of <code>IsTruncated</code> in the previous response was <code>true</code>, you have more health checks. To get another group, submit another <code>ListHealthChecks</code> request. </p><p>For the value of <code>marker</code>, specify the value of <code>NextMarker</code> from the previous response, which is the ID of the first health check that Amazon Route 53 will return if you submit another request.</p><p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more health checks to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of health checks that you want <code>ListHealthChecks</code> to return in response to the current request. Amazon Route 53 returns a maximum of 100 items. If you set <code>MaxItems</code> to a value greater than 100, Route 53 returns only the first 100 health checks. </p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

@end

/**
 <p>A complex type that contains the response to a <code>ListHealthChecks</code> request.</p>
 Required parameters: [HealthChecks, Marker, IsTruncated, MaxItems]
 */
@interface AWSRoute53ListHealthChecksResponse : AWSModel


/**
 <p>A complex type that contains one <code>HealthCheck</code> element for each health check that is associated with the current AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53HealthCheck *> * _Nullable healthChecks;

/**
 <p>A flag that indicates whether there are more health checks to be listed. If the response was truncated, you can get the next group of health checks by submitting another <code>ListHealthChecks</code> request and specifying the value of <code>NextMarker</code> in the <code>marker</code> parameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>For the second and subsequent calls to <code>ListHealthChecks</code>, <code>Marker</code> is the value that you specified for the <code>marker</code> parameter in the previous request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The value that you specified for the <code>maxitems</code> parameter in the call to <code>ListHealthChecks</code> that produced the current response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

/**
 <p>If <code>IsTruncated</code> is <code>true</code>, the value of <code>NextMarker</code> identifies the first health check that Amazon Route 53 returns if you submit another <code>ListHealthChecks</code> request and specify the value of <code>NextMarker</code> in the <code>marker</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 <p>Retrieves a list of the public and private hosted zones that are associated with the current AWS account in ASCII order by domain name. </p>
 */
@interface AWSRoute53ListHostedZonesByNameRequest : AWSRequest


/**
 <p>(Optional) For your first request to <code>ListHostedZonesByName</code>, include the <code>dnsname</code> parameter only if you want to specify the name of the first hosted zone in the response. If you don't include the <code>dnsname</code> parameter, Amazon Route 53 returns all of the hosted zones that were created by the current AWS account, in ASCII order. For subsequent requests, include both <code>dnsname</code> and <code>hostedzoneid</code> parameters. For <code>dnsname</code>, specify the value of <code>NextDNSName</code> from the previous response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DNSName;

/**
 <p>(Optional) For your first request to <code>ListHostedZonesByName</code>, do not include the <code>hostedzoneid</code> parameter.</p><p>If you have more hosted zones than the value of <code>maxitems</code>, <code>ListHostedZonesByName</code> returns only the first <code>maxitems</code> hosted zones. To get the next group of <code>maxitems</code> hosted zones, submit another request to <code>ListHostedZonesByName</code> and include both <code>dnsname</code> and <code>hostedzoneid</code> parameters. For the value of <code>hostedzoneid</code>, specify the value of the <code>NextHostedZoneId</code> element from the previous response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

/**
 <p>The maximum number of hosted zones to be included in the response body for this request. If you have more than <code>maxitems</code> hosted zones, then the value of the <code>IsTruncated</code> element in the response is true, and the values of <code>NextDNSName</code> and <code>NextHostedZoneId</code> specify the first hosted zone in the next group of <code>maxitems</code> hosted zones. </p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

@end

/**
 <p>A complex type that contains the response information for the request.</p>
 Required parameters: [HostedZones, IsTruncated, MaxItems]
 */
@interface AWSRoute53ListHostedZonesByNameResponse : AWSModel


/**
 <p>For the second and subsequent calls to <code>ListHostedZonesByName</code>, <code>DNSName</code> is the value that you specified for the <code>dnsname</code> parameter in the request that produced the current response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DNSName;

/**
 <p>The ID that Amazon Route 53 assigned to the hosted zone when you created it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

/**
 <p>A complex type that contains general information about the hosted zone.</p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53HostedZone *> * _Nullable hostedZones;

/**
 <p>A flag that indicates whether there are more hosted zones to be listed. If the response was truncated, you can get the next group of <code>maxitems</code> hosted zones by calling <code>ListHostedZonesByName</code> again and specifying the values of <code>NextDNSName</code> and <code>NextHostedZoneId</code> elements in the <code>dnsname</code> and <code>hostedzoneid</code> parameters.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>The value that you specified for the <code>maxitems</code> parameter in the call to <code>ListHostedZonesByName</code> that produced the current response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

/**
 <p>If <code>IsTruncated</code> is true, the value of <code>NextDNSName</code> is the name of the first hosted zone in the next group of <code>maxitems</code> hosted zones. Call <code>ListHostedZonesByName</code> again and specify the value of <code>NextDNSName</code> and <code>NextHostedZoneId</code> in the <code>dnsname</code> and <code>hostedzoneid</code> parameters, respectively.</p><p>This element is present only if <code>IsTruncated</code> is <code>true</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextDNSName;

/**
 <p>If <code>IsTruncated</code> is <code>true</code>, the value of <code>NextHostedZoneId</code> identifies the first hosted zone in the next group of <code>maxitems</code> hosted zones. Call <code>ListHostedZonesByName</code> again and specify the value of <code>NextDNSName</code> and <code>NextHostedZoneId</code> in the <code>dnsname</code> and <code>hostedzoneid</code> parameters, respectively.</p><p>This element is present only if <code>IsTruncated</code> is <code>true</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextHostedZoneId;

@end

/**
 <p>A request to retrieve a list of the public and private hosted zones that are associated with the current AWS account.</p>
 */
@interface AWSRoute53ListHostedZonesRequest : AWSRequest


/**
 <p>If you're using reusable delegation sets and you want to list all of the hosted zones that are associated with a reusable delegation set, specify the ID of that reusable delegation set. </p>
 */
@property (nonatomic, strong) NSString * _Nullable delegationSetId;

/**
 <p>If the value of <code>IsTruncated</code> in the previous response was <code>true</code>, you have more hosted zones. To get more hosted zones, submit another <code>ListHostedZones</code> request. </p><p>For the value of <code>marker</code>, specify the value of <code>NextMarker</code> from the previous response, which is the ID of the first hosted zone that Amazon Route 53 will return if you submit another request.</p><p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more hosted zones to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>(Optional) The maximum number of hosted zones that you want Amazon Route 53 to return. If you have more than <code>maxitems</code> hosted zones, the value of <code>IsTruncated</code> in the response is <code>true</code>, and the value of <code>NextMarker</code> is the hosted zone ID of the first hosted zone that Route 53 will return if you submit another request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

@end

/**
 
 */
@interface AWSRoute53ListHostedZonesResponse : AWSModel


/**
 <p>A complex type that contains general information about the hosted zone.</p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53HostedZone *> * _Nullable hostedZones;

/**
 <p>A flag indicating whether there are more hosted zones to be listed. If the response was truncated, you can get more hosted zones by submitting another <code>ListHostedZones</code> request and specifying the value of <code>NextMarker</code> in the <code>marker</code> parameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>For the second and subsequent calls to <code>ListHostedZones</code>, <code>Marker</code> is the value that you specified for the <code>marker</code> parameter in the request that produced the current response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The value that you specified for the <code>maxitems</code> parameter in the call to <code>ListHostedZones</code> that produced the current response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

/**
 <p>If <code>IsTruncated</code> is <code>true</code>, the value of <code>NextMarker</code> identifies the first hosted zone in the next group of hosted zones. Submit another <code>ListHostedZones</code> request, and specify the value of <code>NextMarker</code> from the response in the <code>marker</code> parameter.</p><p>This element is present only if <code>IsTruncated</code> is <code>true</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSRoute53ListQueryLoggingConfigsRequest : AWSRequest


/**
 <p>(Optional) If you want to list the query logging configuration that is associated with a hosted zone, specify the ID in <code>HostedZoneId</code>. </p><p>If you don't specify a hosted zone ID, <code>ListQueryLoggingConfigs</code> returns all of the configurations that are associated with the current AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

/**
 <p>(Optional) The maximum number of query logging configurations that you want Amazon Route 53 to return in response to the current request. If the current AWS account has more than <code>MaxResults</code> configurations, use the value of <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_ListQueryLoggingConfigs.html#API_ListQueryLoggingConfigs_RequestSyntax">NextToken</a> in the response to get the next page of results.</p><p>If you don't specify a value for <code>MaxResults</code>, Route 53 returns up to 100 configurations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxResults;

/**
 <p>(Optional) If the current AWS account has more than <code>MaxResults</code> query logging configurations, use <code>NextToken</code> to get the second and subsequent pages of results.</p><p>For the first <code>ListQueryLoggingConfigs</code> request, omit this value.</p><p>For the second and subsequent requests, get the value of <code>NextToken</code> from the previous response and specify that value for <code>NextToken</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSRoute53ListQueryLoggingConfigsResponse : AWSModel


/**
 <p>If a response includes the last of the query logging configurations that are associated with the current AWS account, <code>NextToken</code> doesn't appear in the response.</p><p>If a response doesn't include the last of the configurations, you can get more configurations by submitting another <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_ListQueryLoggingConfigs.html">ListQueryLoggingConfigs</a> request. Get the value of <code>NextToken</code> that Amazon Route 53 returned in the previous response and include it in <code>NextToken</code> in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array that contains one <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_QueryLoggingConfig.html">QueryLoggingConfig</a> element for each configuration for DNS query logging that is associated with the current AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53QueryLoggingConfig *> * _Nullable queryLoggingConfigs;

@end

/**
 <p>A request for the resource record sets that are associated with a specified hosted zone.</p>
 Required parameters: [HostedZoneId]
 */
@interface AWSRoute53ListResourceRecordSetsRequest : AWSRequest


/**
 <p>The ID of the hosted zone that contains the resource record sets that you want to list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

/**
 <p>(Optional) The maximum number of resource records sets to include in the response body for this request. If the response includes more than <code>maxitems</code> resource record sets, the value of the <code>IsTruncated</code> element in the response is <code>true</code>, and the values of the <code>NextRecordName</code> and <code>NextRecordType</code> elements in the response identify the first resource record set in the next group of <code>maxitems</code> resource record sets.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

/**
 <p><i>Resource record sets that have a routing policy other than simple:</i> If results were truncated for a given DNS name and type, specify the value of <code>NextRecordIdentifier</code> from the previous response to get the next resource record set that has the current DNS name and type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startRecordIdentifier;

/**
 <p>The first name in the lexicographic ordering of resource record sets that you want to list. If the specified record name doesn't exist, the results begin with the first resource record set that has a name greater than the value of <code>name</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startRecordName;

/**
 <p>The type of resource record set to begin the record listing from.</p><p>Valid values for basic resource record sets: <code>A</code> | <code>AAAA</code> | <code>CAA</code> | <code>CNAME</code> | <code>MX</code> | <code>NAPTR</code> | <code>NS</code> | <code>PTR</code> | <code>SOA</code> | <code>SPF</code> | <code>SRV</code> | <code>TXT</code></p><p>Values for weighted, latency, geolocation, and failover resource record sets: <code>A</code> | <code>AAAA</code> | <code>CAA</code> | <code>CNAME</code> | <code>MX</code> | <code>NAPTR</code> | <code>PTR</code> | <code>SPF</code> | <code>SRV</code> | <code>TXT</code></p><p>Values for alias resource record sets: </p><ul><li><p><b>API Gateway custom regional API or edge-optimized API</b>: A</p></li><li><p><b>CloudFront distribution</b>: A or AAAA</p></li><li><p><b>Elastic Beanstalk environment that has a regionalized subdomain</b>: A</p></li><li><p><b>Elastic Load Balancing load balancer</b>: A | AAAA</p></li><li><p><b>S3 bucket</b>: A</p></li><li><p><b>VPC interface VPC endpoint</b>: A</p></li><li><p><b>Another resource record set in this hosted zone:</b> The type of the resource record set that the alias references.</p></li></ul><p>Constraint: Specifying <code>type</code> without specifying <code>name</code> returns an <code>InvalidInput</code> error.</p>
 */
@property (nonatomic, assign) AWSRoute53RRType startRecordType;

@end

/**
 <p>A complex type that contains list information for the resource record set.</p>
 Required parameters: [ResourceRecordSets, IsTruncated, MaxItems]
 */
@interface AWSRoute53ListResourceRecordSetsResponse : AWSModel


/**
 <p>A flag that indicates whether more resource record sets remain to be listed. If your results were truncated, you can make a follow-up pagination request by using the <code>NextRecordName</code> element.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>The maximum number of records you requested.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

/**
 <p><i>Resource record sets that have a routing policy other than simple:</i> If results were truncated for a given DNS name and type, the value of <code>SetIdentifier</code> for the next resource record set that has the current DNS name and type.</p><p>For information about routing policies, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html">Choosing a Routing Policy</a> in the <i>Amazon Route 53 Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextRecordIdentifier;

/**
 <p>If the results were truncated, the name of the next record in the list.</p><p>This element is present only if <code>IsTruncated</code> is true. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextRecordName;

/**
 <p>If the results were truncated, the type of the next record in the list.</p><p>This element is present only if <code>IsTruncated</code> is true. </p>
 */
@property (nonatomic, assign) AWSRoute53RRType nextRecordType;

/**
 <p>Information about multiple resource record sets.</p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53ResourceRecordSet *> * _Nullable resourceRecordSets;

@end

/**
 <p>A request to get a list of the reusable delegation sets that are associated with the current AWS account.</p>
 */
@interface AWSRoute53ListReusableDelegationSetsRequest : AWSRequest


/**
 <p>If the value of <code>IsTruncated</code> in the previous response was <code>true</code>, you have more reusable delegation sets. To get another group, submit another <code>ListReusableDelegationSets</code> request. </p><p>For the value of <code>marker</code>, specify the value of <code>NextMarker</code> from the previous response, which is the ID of the first reusable delegation set that Amazon Route 53 will return if you submit another request.</p><p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more reusable delegation sets to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The number of reusable delegation sets that you want Amazon Route 53 to return in the response to this request. If you specify a value greater than 100, Route 53 returns only the first 100 reusable delegation sets.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

@end

/**
 <p>A complex type that contains information about the reusable delegation sets that are associated with the current AWS account.</p>
 Required parameters: [DelegationSets, Marker, IsTruncated, MaxItems]
 */
@interface AWSRoute53ListReusableDelegationSetsResponse : AWSModel


/**
 <p>A complex type that contains one <code>DelegationSet</code> element for each reusable delegation set that was created by the current AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53DelegationSet *> * _Nullable delegationSets;

/**
 <p>A flag that indicates whether there are more reusable delegation sets to be listed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>For the second and subsequent calls to <code>ListReusableDelegationSets</code>, <code>Marker</code> is the value that you specified for the <code>marker</code> parameter in the request that produced the current response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The value that you specified for the <code>maxitems</code> parameter in the call to <code>ListReusableDelegationSets</code> that produced the current response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

/**
 <p>If <code>IsTruncated</code> is <code>true</code>, the value of <code>NextMarker</code> identifies the next reusable delegation set that Amazon Route 53 will return if you submit another <code>ListReusableDelegationSets</code> request and specify the value of <code>NextMarker</code> in the <code>marker</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 <p>A complex type containing information about a request for a list of the tags that are associated with an individual resource.</p>
 Required parameters: [ResourceType, ResourceId]
 */
@interface AWSRoute53ListTagsForResourceRequest : AWSRequest


/**
 <p>The ID of the resource for which you want to retrieve tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The type of the resource.</p><ul><li><p>The resource type for health checks is <code>healthcheck</code>.</p></li><li><p>The resource type for hosted zones is <code>hostedzone</code>.</p></li></ul>
 */
@property (nonatomic, assign) AWSRoute53TagResourceType resourceType;

@end

/**
 <p>A complex type that contains information about the health checks or hosted zones for which you want to list tags.</p>
 Required parameters: [ResourceTagSet]
 */
@interface AWSRoute53ListTagsForResourceResponse : AWSModel


/**
 <p>A <code>ResourceTagSet</code> containing tags associated with the specified resource.</p>
 */
@property (nonatomic, strong) AWSRoute53ResourceTagSet * _Nullable resourceTagSet;

@end

/**
 <p>A complex type that contains information about the health checks or hosted zones for which you want to list tags.</p>
 Required parameters: [ResourceType, ResourceIds]
 */
@interface AWSRoute53ListTagsForResourcesRequest : AWSRequest


/**
 <p>A complex type that contains the ResourceId element for each resource for which you want to get a list of tags.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceIds;

/**
 <p>The type of the resources.</p><ul><li><p>The resource type for health checks is <code>healthcheck</code>.</p></li><li><p>The resource type for hosted zones is <code>hostedzone</code>.</p></li></ul>
 */
@property (nonatomic, assign) AWSRoute53TagResourceType resourceType;

@end

/**
 <p>A complex type containing tags for the specified resources.</p>
 Required parameters: [ResourceTagSets]
 */
@interface AWSRoute53ListTagsForResourcesResponse : AWSModel


/**
 <p>A list of <code>ResourceTagSet</code>s containing tags associated with the specified resources.</p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53ResourceTagSet *> * _Nullable resourceTagSets;

@end

/**
 <p>A complex type that contains the information about the request to list the traffic policies that are associated with the current AWS account.</p>
 */
@interface AWSRoute53ListTrafficPoliciesRequest : AWSRequest


/**
 <p>(Optional) The maximum number of traffic policies that you want Amazon Route 53 to return in response to this request. If you have more than <code>MaxItems</code> traffic policies, the value of <code>IsTruncated</code> in the response is <code>true</code>, and the value of <code>TrafficPolicyIdMarker</code> is the ID of the first traffic policy that Route 53 will return if you submit another request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

/**
 <p>(Conditional) For your first request to <code>ListTrafficPolicies</code>, don't include the <code>TrafficPolicyIdMarker</code> parameter.</p><p>If you have more traffic policies than the value of <code>MaxItems</code>, <code>ListTrafficPolicies</code> returns only the first <code>MaxItems</code> traffic policies. To get the next group of policies, submit another request to <code>ListTrafficPolicies</code>. For the value of <code>TrafficPolicyIdMarker</code>, specify the value of <code>TrafficPolicyIdMarker</code> that was returned in the previous response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trafficPolicyIdMarker;

@end

/**
 <p>A complex type that contains the response information for the request.</p>
 Required parameters: [TrafficPolicySummaries, IsTruncated, TrafficPolicyIdMarker, MaxItems]
 */
@interface AWSRoute53ListTrafficPoliciesResponse : AWSModel


/**
 <p>A flag that indicates whether there are more traffic policies to be listed. If the response was truncated, you can get the next group of traffic policies by submitting another <code>ListTrafficPolicies</code> request and specifying the value of <code>TrafficPolicyIdMarker</code> in the <code>TrafficPolicyIdMarker</code> request parameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>The value that you specified for the <code>MaxItems</code> parameter in the <code>ListTrafficPolicies</code> request that produced the current response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

/**
 <p>If the value of <code>IsTruncated</code> is <code>true</code>, <code>TrafficPolicyIdMarker</code> is the ID of the first traffic policy in the next group of <code>MaxItems</code> traffic policies.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trafficPolicyIdMarker;

/**
 <p>A list that contains one <code>TrafficPolicySummary</code> element for each traffic policy that was created by the current AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53TrafficPolicySummary *> * _Nullable trafficPolicySummaries;

@end

/**
 <p>A request for the traffic policy instances that you created in a specified hosted zone.</p>
 Required parameters: [HostedZoneId]
 */
@interface AWSRoute53ListTrafficPolicyInstancesByHostedZoneRequest : AWSRequest


/**
 <p>The ID of the hosted zone that you want to list traffic policy instances for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

/**
 <p>The maximum number of traffic policy instances to be included in the response body for this request. If you have more than <code>MaxItems</code> traffic policy instances, the value of the <code>IsTruncated</code> element in the response is <code>true</code>, and the values of <code>HostedZoneIdMarker</code>, <code>TrafficPolicyInstanceNameMarker</code>, and <code>TrafficPolicyInstanceTypeMarker</code> represent the first traffic policy instance that Amazon Route 53 will return if you submit another request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

/**
 <p>If the value of <code>IsTruncated</code> in the previous response is true, you have more traffic policy instances. To get more traffic policy instances, submit another <code>ListTrafficPolicyInstances</code> request. For the value of <code>trafficpolicyinstancename</code>, specify the value of <code>TrafficPolicyInstanceNameMarker</code> from the previous response, which is the name of the first traffic policy instance in the next group of traffic policy instances.</p><p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more traffic policy instances to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trafficPolicyInstanceNameMarker;

/**
 <p>If the value of <code>IsTruncated</code> in the previous response is true, you have more traffic policy instances. To get more traffic policy instances, submit another <code>ListTrafficPolicyInstances</code> request. For the value of <code>trafficpolicyinstancetype</code>, specify the value of <code>TrafficPolicyInstanceTypeMarker</code> from the previous response, which is the type of the first traffic policy instance in the next group of traffic policy instances.</p><p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more traffic policy instances to get.</p>
 */
@property (nonatomic, assign) AWSRoute53RRType trafficPolicyInstanceTypeMarker;

@end

/**
 <p>A complex type that contains the response information for the request.</p>
 Required parameters: [TrafficPolicyInstances, IsTruncated, MaxItems]
 */
@interface AWSRoute53ListTrafficPolicyInstancesByHostedZoneResponse : AWSModel


/**
 <p>A flag that indicates whether there are more traffic policy instances to be listed. If the response was truncated, you can get the next group of traffic policy instances by submitting another <code>ListTrafficPolicyInstancesByHostedZone</code> request and specifying the values of <code>HostedZoneIdMarker</code>, <code>TrafficPolicyInstanceNameMarker</code>, and <code>TrafficPolicyInstanceTypeMarker</code> in the corresponding request parameters.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>The value that you specified for the <code>MaxItems</code> parameter in the <code>ListTrafficPolicyInstancesByHostedZone</code> request that produced the current response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

/**
 <p>If <code>IsTruncated</code> is <code>true</code>, <code>TrafficPolicyInstanceNameMarker</code> is the name of the first traffic policy instance in the next group of traffic policy instances.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trafficPolicyInstanceNameMarker;

/**
 <p>If <code>IsTruncated</code> is true, <code>TrafficPolicyInstanceTypeMarker</code> is the DNS type of the resource record sets that are associated with the first traffic policy instance in the next group of traffic policy instances.</p>
 */
@property (nonatomic, assign) AWSRoute53RRType trafficPolicyInstanceTypeMarker;

/**
 <p>A list that contains one <code>TrafficPolicyInstance</code> element for each traffic policy instance that matches the elements in the request. </p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53TrafficPolicyInstance *> * _Nullable trafficPolicyInstances;

@end

/**
 <p>A complex type that contains the information about the request to list your traffic policy instances.</p>
 Required parameters: [TrafficPolicyId, TrafficPolicyVersion]
 */
@interface AWSRoute53ListTrafficPolicyInstancesByPolicyRequest : AWSRequest


/**
 <p>If the value of <code>IsTruncated</code> in the previous response was <code>true</code>, you have more traffic policy instances. To get more traffic policy instances, submit another <code>ListTrafficPolicyInstancesByPolicy</code> request. </p><p>For the value of <code>hostedzoneid</code>, specify the value of <code>HostedZoneIdMarker</code> from the previous response, which is the hosted zone ID of the first traffic policy instance that Amazon Route 53 will return if you submit another request.</p><p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more traffic policy instances to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneIdMarker;

/**
 <p>The maximum number of traffic policy instances to be included in the response body for this request. If you have more than <code>MaxItems</code> traffic policy instances, the value of the <code>IsTruncated</code> element in the response is <code>true</code>, and the values of <code>HostedZoneIdMarker</code>, <code>TrafficPolicyInstanceNameMarker</code>, and <code>TrafficPolicyInstanceTypeMarker</code> represent the first traffic policy instance that Amazon Route 53 will return if you submit another request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

/**
 <p>The ID of the traffic policy for which you want to list traffic policy instances.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trafficPolicyId;

/**
 <p>If the value of <code>IsTruncated</code> in the previous response was <code>true</code>, you have more traffic policy instances. To get more traffic policy instances, submit another <code>ListTrafficPolicyInstancesByPolicy</code> request.</p><p>For the value of <code>trafficpolicyinstancename</code>, specify the value of <code>TrafficPolicyInstanceNameMarker</code> from the previous response, which is the name of the first traffic policy instance that Amazon Route 53 will return if you submit another request.</p><p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more traffic policy instances to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trafficPolicyInstanceNameMarker;

/**
 <p>If the value of <code>IsTruncated</code> in the previous response was <code>true</code>, you have more traffic policy instances. To get more traffic policy instances, submit another <code>ListTrafficPolicyInstancesByPolicy</code> request.</p><p>For the value of <code>trafficpolicyinstancetype</code>, specify the value of <code>TrafficPolicyInstanceTypeMarker</code> from the previous response, which is the name of the first traffic policy instance that Amazon Route 53 will return if you submit another request.</p><p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more traffic policy instances to get.</p>
 */
@property (nonatomic, assign) AWSRoute53RRType trafficPolicyInstanceTypeMarker;

/**
 <p>The version of the traffic policy for which you want to list traffic policy instances. The version must be associated with the traffic policy that is specified by <code>TrafficPolicyId</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable trafficPolicyVersion;

@end

/**
 <p>A complex type that contains the response information for the request.</p>
 Required parameters: [TrafficPolicyInstances, IsTruncated, MaxItems]
 */
@interface AWSRoute53ListTrafficPolicyInstancesByPolicyResponse : AWSModel


/**
 <p>If <code>IsTruncated</code> is <code>true</code>, <code>HostedZoneIdMarker</code> is the ID of the hosted zone of the first traffic policy instance in the next group of traffic policy instances.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneIdMarker;

/**
 <p>A flag that indicates whether there are more traffic policy instances to be listed. If the response was truncated, you can get the next group of traffic policy instances by calling <code>ListTrafficPolicyInstancesByPolicy</code> again and specifying the values of the <code>HostedZoneIdMarker</code>, <code>TrafficPolicyInstanceNameMarker</code>, and <code>TrafficPolicyInstanceTypeMarker</code> elements in the corresponding request parameters.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>The value that you specified for the <code>MaxItems</code> parameter in the call to <code>ListTrafficPolicyInstancesByPolicy</code> that produced the current response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

/**
 <p>If <code>IsTruncated</code> is <code>true</code>, <code>TrafficPolicyInstanceNameMarker</code> is the name of the first traffic policy instance in the next group of <code>MaxItems</code> traffic policy instances.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trafficPolicyInstanceNameMarker;

/**
 <p>If <code>IsTruncated</code> is <code>true</code>, <code>TrafficPolicyInstanceTypeMarker</code> is the DNS type of the resource record sets that are associated with the first traffic policy instance in the next group of <code>MaxItems</code> traffic policy instances.</p>
 */
@property (nonatomic, assign) AWSRoute53RRType trafficPolicyInstanceTypeMarker;

/**
 <p>A list that contains one <code>TrafficPolicyInstance</code> element for each traffic policy instance that matches the elements in the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53TrafficPolicyInstance *> * _Nullable trafficPolicyInstances;

@end

/**
 <p>A request to get information about the traffic policy instances that you created by using the current AWS account.</p>
 */
@interface AWSRoute53ListTrafficPolicyInstancesRequest : AWSRequest


/**
 <p>If the value of <code>IsTruncated</code> in the previous response was <code>true</code>, you have more traffic policy instances. To get more traffic policy instances, submit another <code>ListTrafficPolicyInstances</code> request. For the value of <code>HostedZoneId</code>, specify the value of <code>HostedZoneIdMarker</code> from the previous response, which is the hosted zone ID of the first traffic policy instance in the next group of traffic policy instances.</p><p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more traffic policy instances to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneIdMarker;

/**
 <p>The maximum number of traffic policy instances that you want Amazon Route 53 to return in response to a <code>ListTrafficPolicyInstances</code> request. If you have more than <code>MaxItems</code> traffic policy instances, the value of the <code>IsTruncated</code> element in the response is <code>true</code>, and the values of <code>HostedZoneIdMarker</code>, <code>TrafficPolicyInstanceNameMarker</code>, and <code>TrafficPolicyInstanceTypeMarker</code> represent the first traffic policy instance in the next group of <code>MaxItems</code> traffic policy instances.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

/**
 <p>If the value of <code>IsTruncated</code> in the previous response was <code>true</code>, you have more traffic policy instances. To get more traffic policy instances, submit another <code>ListTrafficPolicyInstances</code> request. For the value of <code>trafficpolicyinstancename</code>, specify the value of <code>TrafficPolicyInstanceNameMarker</code> from the previous response, which is the name of the first traffic policy instance in the next group of traffic policy instances.</p><p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more traffic policy instances to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trafficPolicyInstanceNameMarker;

/**
 <p>If the value of <code>IsTruncated</code> in the previous response was <code>true</code>, you have more traffic policy instances. To get more traffic policy instances, submit another <code>ListTrafficPolicyInstances</code> request. For the value of <code>trafficpolicyinstancetype</code>, specify the value of <code>TrafficPolicyInstanceTypeMarker</code> from the previous response, which is the type of the first traffic policy instance in the next group of traffic policy instances.</p><p>If the value of <code>IsTruncated</code> in the previous response was <code>false</code>, there are no more traffic policy instances to get.</p>
 */
@property (nonatomic, assign) AWSRoute53RRType trafficPolicyInstanceTypeMarker;

@end

/**
 <p>A complex type that contains the response information for the request.</p>
 Required parameters: [TrafficPolicyInstances, IsTruncated, MaxItems]
 */
@interface AWSRoute53ListTrafficPolicyInstancesResponse : AWSModel


/**
 <p>If <code>IsTruncated</code> is <code>true</code>, <code>HostedZoneIdMarker</code> is the ID of the hosted zone of the first traffic policy instance that Route 53 will return if you submit another <code>ListTrafficPolicyInstances</code> request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneIdMarker;

/**
 <p>A flag that indicates whether there are more traffic policy instances to be listed. If the response was truncated, you can get more traffic policy instances by calling <code>ListTrafficPolicyInstances</code> again and specifying the values of the <code>HostedZoneIdMarker</code>, <code>TrafficPolicyInstanceNameMarker</code>, and <code>TrafficPolicyInstanceTypeMarker</code> in the corresponding request parameters.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>The value that you specified for the <code>MaxItems</code> parameter in the call to <code>ListTrafficPolicyInstances</code> that produced the current response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

/**
 <p>If <code>IsTruncated</code> is <code>true</code>, <code>TrafficPolicyInstanceNameMarker</code> is the name of the first traffic policy instance that Route 53 will return if you submit another <code>ListTrafficPolicyInstances</code> request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable trafficPolicyInstanceNameMarker;

/**
 <p>If <code>IsTruncated</code> is <code>true</code>, <code>TrafficPolicyInstanceTypeMarker</code> is the DNS type of the resource record sets that are associated with the first traffic policy instance that Amazon Route 53 will return if you submit another <code>ListTrafficPolicyInstances</code> request. </p>
 */
@property (nonatomic, assign) AWSRoute53RRType trafficPolicyInstanceTypeMarker;

/**
 <p>A list that contains one <code>TrafficPolicyInstance</code> element for each traffic policy instance that matches the elements in the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53TrafficPolicyInstance *> * _Nullable trafficPolicyInstances;

@end

/**
 <p>A complex type that contains the information about the request to list your traffic policies.</p>
 Required parameters: [Id]
 */
@interface AWSRoute53ListTrafficPolicyVersionsRequest : AWSRequest


/**
 <p>Specify the value of <code>Id</code> of the traffic policy for which you want to list all versions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The maximum number of traffic policy versions that you want Amazon Route 53 to include in the response body for this request. If the specified traffic policy has more than <code>MaxItems</code> versions, the value of <code>IsTruncated</code> in the response is <code>true</code>, and the value of the <code>TrafficPolicyVersionMarker</code> element is the ID of the first version that Route 53 will return if you submit another request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

/**
 <p>For your first request to <code>ListTrafficPolicyVersions</code>, don't include the <code>TrafficPolicyVersionMarker</code> parameter.</p><p>If you have more traffic policy versions than the value of <code>MaxItems</code>, <code>ListTrafficPolicyVersions</code> returns only the first group of <code>MaxItems</code> versions. To get more traffic policy versions, submit another <code>ListTrafficPolicyVersions</code> request. For the value of <code>TrafficPolicyVersionMarker</code>, specify the value of <code>TrafficPolicyVersionMarker</code> in the previous response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trafficPolicyVersionMarker;

@end

/**
 <p>A complex type that contains the response information for the request.</p>
 Required parameters: [TrafficPolicies, IsTruncated, TrafficPolicyVersionMarker, MaxItems]
 */
@interface AWSRoute53ListTrafficPolicyVersionsResponse : AWSModel


/**
 <p>A flag that indicates whether there are more traffic policies to be listed. If the response was truncated, you can get the next group of traffic policies by submitting another <code>ListTrafficPolicyVersions</code> request and specifying the value of <code>NextMarker</code> in the <code>marker</code> parameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>The value that you specified for the <code>maxitems</code> parameter in the <code>ListTrafficPolicyVersions</code> request that produced the current response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

/**
 <p>A list that contains one <code>TrafficPolicy</code> element for each traffic policy version that is associated with the specified traffic policy.</p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53TrafficPolicy *> * _Nullable trafficPolicies;

/**
 <p>If <code>IsTruncated</code> is <code>true</code>, the value of <code>TrafficPolicyVersionMarker</code> identifies the first traffic policy that Amazon Route 53 will return if you submit another request. Call <code>ListTrafficPolicyVersions</code> again and specify the value of <code>TrafficPolicyVersionMarker</code> in the <code>TrafficPolicyVersionMarker</code> request parameter.</p><p>This element is present only if <code>IsTruncated</code> is <code>true</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trafficPolicyVersionMarker;

@end

/**
 <p>A complex type that contains information about that can be associated with your hosted zone.</p>
 Required parameters: [HostedZoneId]
 */
@interface AWSRoute53ListVPCAssociationAuthorizationsRequest : AWSRequest


/**
 <p>The ID of the hosted zone for which you want a list of VPCs that can be associated with the hosted zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

/**
 <p><i>Optional</i>: An integer that specifies the maximum number of VPCs that you want Amazon Route 53 to return. If you don't specify a value for <code>MaxResults</code>, Route 53 returns up to 50 VPCs per page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxResults;

/**
 <p><i>Optional</i>: If a response includes a <code>NextToken</code> element, there are more VPCs that can be associated with the specified hosted zone. To get the next page of results, submit another request, and include the value of <code>NextToken</code> from the response in the <code>nexttoken</code> parameter in another <code>ListVPCAssociationAuthorizations</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>A complex type that contains the response information for the request.</p>
 Required parameters: [HostedZoneId, VPCs]
 */
@interface AWSRoute53ListVPCAssociationAuthorizationsResponse : AWSModel


/**
 <p>The ID of the hosted zone that you can associate the listed VPCs with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

/**
 <p>When the response includes a <code>NextToken</code> element, there are more VPCs that can be associated with the specified hosted zone. To get the next page of VPCs, submit another <code>ListVPCAssociationAuthorizations</code> request, and include the value of the <code>NextToken</code> element from the response in the <code>nexttoken</code> request parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of VPCs that are authorized to be associated with the specified hosted zone.</p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53VPC *> * _Nullable VPCs;

@end

/**
 <p>A complex type that contains information about a configuration for DNS query logging.</p>
 Required parameters: [Id, HostedZoneId, CloudWatchLogsLogGroupArn]
 */
@interface AWSRoute53QueryLoggingConfig : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the CloudWatch Logs log group that Amazon Route 53 is publishing logs to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloudWatchLogsLogGroupArn;

/**
 <p>The ID of the hosted zone that CloudWatch Logs is logging queries for. </p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

/**
 <p>The ID for a configuration for DNS query logging.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Information specific to the resource record.</p><note><p>If you're creating an alias resource record set, omit <code>ResourceRecord</code>.</p></note>
 Required parameters: [Value]
 */
@interface AWSRoute53ResourceRecord : AWSModel


/**
 <p>The current or new DNS record value, not to exceed 4,000 characters. In the case of a <code>DELETE</code> action, if the current value does not match the actual value, an error is returned. For descriptions about how to format <code>Value</code> for different record types, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/ResourceRecordTypes.html">Supported DNS Resource Record Types</a> in the <i>Amazon Route 53 Developer Guide</i>.</p><p>You can specify more than one value for all record types except <code>CNAME</code> and <code>SOA</code>. </p><note><p>If you're creating an alias resource record set, omit <code>Value</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Information about the resource record set to create or delete.</p>
 Required parameters: [Name, Type]
 */
@interface AWSRoute53ResourceRecordSet : AWSModel


/**
 <p><i>Alias resource record sets only:</i> Information about the AWS resource, such as a CloudFront distribution or an Amazon S3 bucket, that you want to route traffic to. </p><p>If you're creating resource records sets for a private hosted zone, note the following:</p><ul><li><p>You can't create an alias resource record set in a private hosted zone to route traffic to a CloudFront distribution.</p></li><li><p>Creating geolocation alias resource record sets or latency alias resource record sets in a private hosted zone is unsupported.</p></li><li><p>For information about creating failover resource record sets in a private hosted zone, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-private-hosted-zones.html">Configuring Failover in a Private Hosted Zone</a> in the <i>Amazon Route 53 Developer Guide</i>.</p></li></ul>
 */
@property (nonatomic, strong) AWSRoute53AliasTarget * _Nullable aliasTarget;

/**
 <p><i>Failover resource record sets only:</i> To configure failover, you add the <code>Failover</code> element to two resource record sets. For one resource record set, you specify <code>PRIMARY</code> as the value for <code>Failover</code>; for the other resource record set, you specify <code>SECONDARY</code>. In addition, you include the <code>HealthCheckId</code> element and specify the health check that you want Amazon Route 53 to perform for each resource record set.</p><p>Except where noted, the following failover behaviors assume that you have included the <code>HealthCheckId</code> element in both resource record sets:</p><ul><li><p>When the primary resource record set is healthy, Route 53 responds to DNS queries with the applicable value from the primary resource record set regardless of the health of the secondary resource record set.</p></li><li><p>When the primary resource record set is unhealthy and the secondary resource record set is healthy, Route 53 responds to DNS queries with the applicable value from the secondary resource record set.</p></li><li><p>When the secondary resource record set is unhealthy, Route 53 responds to DNS queries with the applicable value from the primary resource record set regardless of the health of the primary resource record set.</p></li><li><p>If you omit the <code>HealthCheckId</code> element for the secondary resource record set, and if the primary resource record set is unhealthy, Route 53 always responds to DNS queries with the applicable value from the secondary resource record set. This is true regardless of the health of the associated endpoint.</p></li></ul><p>You can't create non-failover resource record sets that have the same values for the <code>Name</code> and <code>Type</code> elements as failover resource record sets.</p><p>For failover alias resource record sets, you must also include the <code>EvaluateTargetHealth</code> element and set the value to true.</p><p>For more information about configuring failover for Route 53, see the following topics in the <i>Amazon Route 53 Developer Guide</i>: </p><ul><li><p><a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover.html">Route 53 Health Checks and DNS Failover</a></p></li><li><p><a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-private-hosted-zones.html">Configuring Failover in a Private Hosted Zone</a></p></li></ul>
 */
@property (nonatomic, assign) AWSRoute53ResourceRecordSetFailover failover;

/**
 <p><i>Geolocation resource record sets only:</i> A complex type that lets you control how Amazon Route 53 responds to DNS queries based on the geographic origin of the query. For example, if you want all queries from Africa to be routed to a web server with an IP address of <code>192.0.2.111</code>, create a resource record set with a <code>Type</code> of <code>A</code> and a <code>ContinentCode</code> of <code>AF</code>.</p><note><p>Although creating geolocation and geolocation alias resource record sets in a private hosted zone is allowed, it's not supported.</p></note><p>If you create separate resource record sets for overlapping geographic regions (for example, one resource record set for a continent and one for a country on the same continent), priority goes to the smallest geographic region. This allows you to route most queries for a continent to one resource and to route queries for a country on that continent to a different resource.</p><p>You can't create two geolocation resource record sets that specify the same geographic location.</p><p>The value <code>*</code> in the <code>CountryCode</code> element matches all geographic locations that aren't specified in other geolocation resource record sets that have the same values for the <code>Name</code> and <code>Type</code> elements.</p><important><p>Geolocation works by mapping IP addresses to locations. However, some IP addresses aren't mapped to geographic locations, so even if you create geolocation resource record sets that cover all seven continents, Route 53 will receive some DNS queries from locations that it can't identify. We recommend that you create a resource record set for which the value of <code>CountryCode</code> is <code>*</code>. Two groups of queries are routed to the resource that you specify in this record: queries that come from locations for which you haven't created geolocation resource record sets and queries from IP addresses that aren't mapped to a location. If you don't create a <code>*</code> resource record set, Route 53 returns a "no answer" response for queries from those locations.</p></important><p>You can't create non-geolocation resource record sets that have the same values for the <code>Name</code> and <code>Type</code> elements as geolocation resource record sets.</p>
 */
@property (nonatomic, strong) AWSRoute53GeoLocation * _Nullable geoLocation;

/**
 <p>If you want Amazon Route 53 to return this resource record set in response to a DNS query only when the status of a health check is healthy, include the <code>HealthCheckId</code> element and specify the ID of the applicable health check.</p><p>Route 53 determines whether a resource record set is healthy based on one of the following:</p><ul><li><p>By periodically sending a request to the endpoint that is specified in the health check</p></li><li><p>By aggregating the status of a specified group of health checks (calculated health checks)</p></li><li><p>By determining the current state of a CloudWatch alarm (CloudWatch metric health checks)</p></li></ul><important><p>Route 53 doesn't check the health of the endpoint that is specified in the resource record set, for example, the endpoint specified by the IP address in the <code>Value</code> element. When you add a <code>HealthCheckId</code> element to a resource record set, Route 53 checks the health of the endpoint that you specified in the health check. </p></important><p>For more information, see the following topics in the <i>Amazon Route 53 Developer Guide</i>:</p><ul><li><p><a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html">How Amazon Route 53 Determines Whether an Endpoint Is Healthy</a></p></li><li><p><a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover.html">Route 53 Health Checks and DNS Failover</a></p></li><li><p><a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-private-hosted-zones.html">Configuring Failover in a Private Hosted Zone</a></p></li></ul><p><b>When to Specify HealthCheckId</b></p><p>Specifying a value for <code>HealthCheckId</code> is useful only when Route 53 is choosing between two or more resource record sets to respond to a DNS query, and you want Route 53 to base the choice in part on the status of a health check. Configuring health checks makes sense only in the following configurations:</p><ul><li><p><b>Non-alias resource record sets</b>: You're checking the health of a group of non-alias resource record sets that have the same routing policy, name, and type (such as multiple weighted records named www.example.com with a type of A) and you specify health check IDs for all the resource record sets. </p><p>If the health check status for a resource record set is healthy, Route 53 includes the record among the records that it responds to DNS queries with.</p><p>If the health check status for a resource record set is unhealthy, Route 53 stops responding to DNS queries using the value for that resource record set.</p><p>If the health check status for all resource record sets in the group is unhealthy, Route 53 considers all resource record sets in the group healthy and responds to DNS queries accordingly. </p></li><li><p><b>Alias resource record sets</b>: You specify the following settings:</p><ul><li><p>You set <code>EvaluateTargetHealth</code> to true for an alias resource record set in a group of resource record sets that have the same routing policy, name, and type (such as multiple weighted records named www.example.com with a type of A). </p></li><li><p>You configure the alias resource record set to route traffic to a non-alias resource record set in the same hosted zone.</p></li><li><p>You specify a health check ID for the non-alias resource record set. </p></li></ul><p>If the health check status is healthy, Route 53 considers the alias resource record set to be healthy and includes the alias record among the records that it responds to DNS queries with.</p><p>If the health check status is unhealthy, Route 53 stops responding to DNS queries using the alias resource record set.</p><note><p>The alias resource record set can also route traffic to a <i>group</i> of non-alias resource record sets that have the same routing policy, name, and type. In that configuration, associate health checks with all of the resource record sets in the group of non-alias resource record sets.</p></note></li></ul><p><b>Geolocation Routing</b></p><p>For geolocation resource record sets, if an endpoint is unhealthy, Route 53 looks for a resource record set for the larger, associated geographic region. For example, suppose you have resource record sets for a state in the United States, for the entire United States, for North America, and a resource record set that has <code>*</code> for <code>CountryCode</code> is <code>*</code>, which applies to all locations. If the endpoint for the state resource record set is unhealthy, Route 53 checks for healthy resource record sets in the following order until it finds a resource record set for which the endpoint is healthy:</p><ul><li><p>The United States</p></li><li><p>North America</p></li><li><p>The default resource record set</p></li></ul><p><b>Specifying the Health Check Endpoint by Domain Name</b></p><p>If your health checks specify the endpoint only by domain name, we recommend that you create a separate health check for each endpoint. For example, create a health check for each <code>HTTP</code> server that is serving content for <code>www.example.com</code>. For the value of <code>FullyQualifiedDomainName</code>, specify the domain name of the server (such as <code>us-east-2-www.example.com</code>), not the name of the resource record sets (<code>www.example.com</code>).</p><important><p>Health check results will be unpredictable if you do the following:</p><ul><li><p>Create a health check that has the same value for <code>FullyQualifiedDomainName</code> as the name of a resource record set.</p></li><li><p>Associate that health check with the resource record set.</p></li></ul></important>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckId;

/**
 <p><i>Multivalue answer resource record sets only</i>: To route traffic approximately randomly to multiple resources, such as web servers, create one multivalue answer record for each resource and specify <code>true</code> for <code>MultiValueAnswer</code>. Note the following:</p><ul><li><p>If you associate a health check with a multivalue answer resource record set, Amazon Route 53 responds to DNS queries with the corresponding IP address only when the health check is healthy.</p></li><li><p>If you don't associate a health check with a multivalue answer record, Route 53 always considers the record to be healthy.</p></li><li><p>Route 53 responds to DNS queries with up to eight healthy records; if you have eight or fewer healthy records, Route 53 responds to all DNS queries with all the healthy records.</p></li><li><p>If you have more than eight healthy records, Route 53 responds to different DNS resolvers with different combinations of healthy records.</p></li><li><p>When all records are unhealthy, Route 53 responds to DNS queries with up to eight unhealthy records.</p></li><li><p>If a resource becomes unavailable after a resolver caches a response, client software typically tries another of the IP addresses in the response.</p></li></ul><p>You can't create multivalue answer alias records.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiValueAnswer;

/**
 <p>For <code>ChangeResourceRecordSets</code> requests, the name of the record that you want to create, update, or delete. For <code>ListResourceRecordSets</code> responses, the name of a record in the specified hosted zone.</p><p><b>ChangeResourceRecordSets Only</b></p><p>Enter a fully qualified domain name, for example, <code>www.example.com</code>. You can optionally include a trailing dot. If you omit the trailing dot, Amazon Route 53 assumes that the domain name that you specify is fully qualified. This means that Route 53 treats <code>www.example.com</code> (without a trailing dot) and <code>www.example.com.</code> (with a trailing dot) as identical.</p><p>For information about how to specify characters other than <code>a-z</code>, <code>0-9</code>, and <code>-</code> (hyphen) and how to specify internationalized domain names, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DomainNameFormat.html">DNS Domain Name Format</a> in the <i>Amazon Route 53 Developer Guide</i>.</p><p>You can use the asterisk (*) wildcard to replace the leftmost label in a domain name, for example, <code>*.example.com</code>. Note the following:</p><ul><li><p>The * must replace the entire label. For example, you can't specify <code>*prod.example.com</code> or <code>prod*.example.com</code>.</p></li><li><p>The * can't replace any of the middle labels, for example, marketing.*.example.com.</p></li><li><p>If you include * in any position other than the leftmost label in a domain name, DNS treats it as an * character (ASCII 42), not as a wildcard.</p><important><p>You can't use the * wildcard for resource records sets that have a type of NS.</p></important></li></ul><p>You can use the * wildcard as the leftmost label in a domain name, for example, <code>*.example.com</code>. You can't use an * for one of the middle labels, for example, <code>marketing.*.example.com</code>. In addition, the * must replace the entire label; for example, you can't specify <code>prod*.example.com</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p><i>Latency-based resource record sets only:</i> The Amazon EC2 Region where you created the resource that this resource record set refers to. The resource typically is an AWS resource, such as an EC2 instance or an ELB load balancer, and is referred to by an IP address or a DNS domain name, depending on the record type.</p><note><p>Although creating latency and latency alias resource record sets in a private hosted zone is allowed, it's not supported.</p></note><p>When Amazon Route 53 receives a DNS query for a domain name and type for which you have created latency resource record sets, Route 53 selects the latency resource record set that has the lowest latency between the end user and the associated Amazon EC2 Region. Route 53 then returns the value that is associated with the selected resource record set.</p><p>Note the following:</p><ul><li><p>You can only specify one <code>ResourceRecord</code> per latency resource record set.</p></li><li><p>You can only create one latency resource record set for each Amazon EC2 Region.</p></li><li><p>You aren't required to create latency resource record sets for all Amazon EC2 Regions. Route 53 will choose the region with the best latency from among the regions that you create latency resource record sets for.</p></li><li><p>You can't create non-latency resource record sets that have the same values for the <code>Name</code> and <code>Type</code> elements as latency resource record sets.</p></li></ul>
 */
@property (nonatomic, assign) AWSRoute53ResourceRecordSetRegion region;

/**
 <p>Information about the resource records to act upon.</p><note><p>If you're creating an alias resource record set, omit <code>ResourceRecords</code>.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSRoute53ResourceRecord *> * _Nullable resourceRecords;

/**
 <p><i>Resource record sets that have a routing policy other than simple:</i> An identifier that differentiates among multiple resource record sets that have the same combination of name and type, such as multiple weighted resource record sets named acme.example.com that have a type of A. In a group of resource record sets that have the same name and type, the value of <code>SetIdentifier</code> must be unique for each resource record set. </p><p>For information about routing policies, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html">Choosing a Routing Policy</a> in the <i>Amazon Route 53 Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable setIdentifier;

/**
 <p>The resource record cache time to live (TTL), in seconds. Note the following:</p><ul><li><p>If you're creating or updating an alias resource record set, omit <code>TTL</code>. Amazon Route 53 uses the value of <code>TTL</code> for the alias target. </p></li><li><p>If you're associating this resource record set with a health check (if you're adding a <code>HealthCheckId</code> element), we recommend that you specify a <code>TTL</code> of 60 seconds or less so clients respond quickly to changes in health status.</p></li><li><p>All of the resource record sets in a group of weighted resource record sets must have the same value for <code>TTL</code>.</p></li><li><p>If a group of weighted resource record sets includes one or more weighted alias resource record sets for which the alias target is an ELB load balancer, we recommend that you specify a <code>TTL</code> of 60 seconds for all of the non-alias weighted resource record sets that have the same name and type. Values other than 60 seconds (the TTL for load balancers) will change the effect of the values that you specify for <code>Weight</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable TTL;

/**
 <p>When you create a traffic policy instance, Amazon Route 53 automatically creates a resource record set. <code>TrafficPolicyInstanceId</code> is the ID of the traffic policy instance that Route 53 created this resource record set for.</p><important><p>To delete the resource record set that is associated with a traffic policy instance, use <code>DeleteTrafficPolicyInstance</code>. Route 53 will delete the resource record set automatically. If you delete the resource record set by using <code>ChangeResourceRecordSets</code>, Route 53 doesn't automatically delete the traffic policy instance, and you'll continue to be charged for it even though it's no longer in use. </p></important>
 */
@property (nonatomic, strong) NSString * _Nullable trafficPolicyInstanceId;

/**
 <p>The DNS record type. For information about different record types and how data is encoded for them, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/ResourceRecordTypes.html">Supported DNS Resource Record Types</a> in the <i>Amazon Route 53 Developer Guide</i>.</p><p>Valid values for basic resource record sets: <code>A</code> | <code>AAAA</code> | <code>CAA</code> | <code>CNAME</code> | <code>MX</code> | <code>NAPTR</code> | <code>NS</code> | <code>PTR</code> | <code>SOA</code> | <code>SPF</code> | <code>SRV</code> | <code>TXT</code></p><p>Values for weighted, latency, geolocation, and failover resource record sets: <code>A</code> | <code>AAAA</code> | <code>CAA</code> | <code>CNAME</code> | <code>MX</code> | <code>NAPTR</code> | <code>PTR</code> | <code>SPF</code> | <code>SRV</code> | <code>TXT</code>. When creating a group of weighted, latency, geolocation, or failover resource record sets, specify the same value for all of the resource record sets in the group.</p><p>Valid values for multivalue answer resource record sets: <code>A</code> | <code>AAAA</code> | <code>MX</code> | <code>NAPTR</code> | <code>PTR</code> | <code>SPF</code> | <code>SRV</code> | <code>TXT</code></p><note><p>SPF records were formerly used to verify the identity of the sender of email messages. However, we no longer recommend that you create resource record sets for which the value of <code>Type</code> is <code>SPF</code>. RFC 7208, <i>Sender Policy Framework (SPF) for Authorizing Use of Domains in Email, Version 1</i>, has been updated to say, "...[I]ts existence and mechanism defined in [RFC4408] have led to some interoperability issues. Accordingly, its use is no longer appropriate for SPF version 1; implementations are not to use it." In RFC 7208, see section 14.1, <a href="http://tools.ietf.org/html/rfc7208#section-14.1">The SPF DNS Record Type</a>.</p></note><p>Values for alias resource record sets:</p><ul><li><p><b>Amazon API Gateway custom regional APIs and edge-optimized APIs:</b><code>A</code></p></li><li><p><b>CloudFront distributions:</b><code>A</code></p><p>If IPv6 is enabled for the distribution, create two resource record sets to route traffic to your distribution, one with a value of <code>A</code> and one with a value of <code>AAAA</code>. </p></li><li><p><b>Amazon API Gateway environment that has a regionalized subdomain</b>: <code>A</code></p></li><li><p><b>ELB load balancers:</b><code>A</code> | <code>AAAA</code></p></li><li><p><b>Amazon S3 buckets:</b><code>A</code></p></li><li><p><b>Amazon Virtual Private Cloud interface VPC endpoints</b><code>A</code></p></li><li><p><b>Another resource record set in this hosted zone:</b> Specify the type of the resource record set that you're creating the alias for. All values are supported except <code>NS</code> and <code>SOA</code>.</p><note><p>If you're creating an alias record that has the same name as the hosted zone (known as the zone apex), you can't route traffic to a record for which the value of <code>Type</code> is <code>CNAME</code>. This is because the alias record must have the same type as the record you're routing traffic to, and creating a CNAME record for the zone apex isn't supported even for an alias record.</p></note></li></ul>
 */
@property (nonatomic, assign) AWSRoute53RRType types;

/**
 <p><i>Weighted resource record sets only:</i> Among resource record sets that have the same combination of DNS name and type, a value that determines the proportion of DNS queries that Amazon Route 53 responds to using the current resource record set. Route 53 calculates the sum of the weights for the resource record sets that have the same combination of DNS name and type. Route 53 then responds to queries based on the ratio of a resource's weight to the total. Note the following:</p><ul><li><p>You must specify a value for the <code>Weight</code> element for every weighted resource record set.</p></li><li><p>You can only specify one <code>ResourceRecord</code> per weighted resource record set.</p></li><li><p>You can't create latency, failover, or geolocation resource record sets that have the same values for the <code>Name</code> and <code>Type</code> elements as weighted resource record sets.</p></li><li><p>You can create a maximum of 100 weighted resource record sets that have the same values for the <code>Name</code> and <code>Type</code> elements.</p></li><li><p>For weighted (but not weighted alias) resource record sets, if you set <code>Weight</code> to <code>0</code> for a resource record set, Route 53 never responds to queries with the applicable value for that resource record set. However, if you set <code>Weight</code> to <code>0</code> for all resource record sets that have the same combination of DNS name and type, traffic is routed to all resources with equal probability.</p><p>The effect of setting <code>Weight</code> to <code>0</code> is different when you associate health checks with weighted resource record sets. For more information, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-configuring-options.html">Options for Configuring Route 53 Active-Active and Active-Passive Failover</a> in the <i>Amazon Route 53 Developer Guide</i>.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable weight;

@end

/**
 <p>A complex type containing a resource and its associated tags.</p>
 */
@interface AWSRoute53ResourceTagSet : AWSModel


/**
 <p>The ID for the specified resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The type of the resource.</p><ul><li><p>The resource type for health checks is <code>healthcheck</code>.</p></li><li><p>The resource type for hosted zones is <code>hostedzone</code>.</p></li></ul>
 */
@property (nonatomic, assign) AWSRoute53TagResourceType resourceType;

/**
 <p>The tags associated with the specified resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSRoute53Tag *> * _Nullable tags;

@end

/**
 <p>A complex type that contains the type of limit that you specified in the request and the current value for that limit.</p>
 Required parameters: [Type, Value]
 */
@interface AWSRoute53ReusableDelegationSetLimit : AWSModel


/**
 <p>The limit that you requested: <code>MAX_ZONES_BY_REUSABLE_DELEGATION_SET</code>, the maximum number of hosted zones that you can associate with the specified reusable delegation set.</p>
 */
@property (nonatomic, assign) AWSRoute53ReusableDelegationSetLimitType types;

/**
 <p>The current value for the <code>MAX_ZONES_BY_REUSABLE_DELEGATION_SET</code> limit.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 <p>A complex type that contains the status that one Amazon Route 53 health checker reports and the time of the health check.</p>
 */
@interface AWSRoute53StatusReport : AWSModel


/**
 <p>The date and time that the health checker performed the health check in <a href="https://en.wikipedia.org/wiki/ISO_8601">ISO 8601 format</a> and Coordinated Universal Time (UTC). For example, the value <code>2017-03-27T17:48:16.751Z</code> represents March 27, 2017 at 17:48:16.751 UTC.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable checkedTime;

/**
 <p>A description of the status of the health check endpoint as reported by one of the Amazon Route 53 health checkers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>A complex type that contains information about a tag that you want to add or edit for the specified health check or hosted zone.</p>
 */
@interface AWSRoute53Tag : AWSModel


/**
 <p>The value of <code>Key</code> depends on the operation that you want to perform:</p><ul><li><p><b>Add a tag to a health check or hosted zone</b>: <code>Key</code> is the name that you want to give the new tag.</p></li><li><p><b>Edit a tag</b>: <code>Key</code> is the name of the tag that you want to change the <code>Value</code> for.</p></li><li><p><b> Delete a key</b>: <code>Key</code> is the name of the tag you want to remove.</p></li><li><p><b>Give a name to a health check</b>: Edit the default <code>Name</code> tag. In the Amazon Route 53 console, the list of your health checks includes a <b>Name</b> column that lets you see the name that you've given to each health check.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value of <code>Value</code> depends on the operation that you want to perform:</p><ul><li><p><b>Add a tag to a health check or hosted zone</b>: <code>Value</code> is the value that you want to give the new tag.</p></li><li><p><b>Edit a tag</b>: <code>Value</code> is the new value that you want to assign the tag.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Gets the value that Amazon Route 53 returns in response to a DNS request for a specified record name and type. You can optionally specify the IP address of a DNS resolver, an EDNS0 client subnet IP address, and a subnet mask. </p>
 Required parameters: [HostedZoneId, RecordName, RecordType]
 */
@interface AWSRoute53TestDNSAnswerRequest : AWSRequest


/**
 <p>If the resolver that you specified for resolverip supports EDNS0, specify the IPv4 or IPv6 address of a client in the applicable location, for example, <code>192.0.2.44</code> or <code>2001:db8:85a3::8a2e:370:7334</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable EDNS0ClientSubnetIP;

/**
 <p>If you specify an IP address for <code>edns0clientsubnetip</code>, you can optionally specify the number of bits of the IP address that you want the checking tool to include in the DNS query. For example, if you specify <code>192.0.2.44</code> for <code>edns0clientsubnetip</code> and <code>24</code> for <code>edns0clientsubnetmask</code>, the checking tool will simulate a request from 192.0.2.0/24. The default value is 24 bits for IPv4 addresses and 64 bits for IPv6 addresses.</p><p>The range of valid values depends on whether <code>edns0clientsubnetip</code> is an IPv4 or an IPv6 address:</p><ul><li><p><b>IPv4</b>: Specify a value between 0 and 32</p></li><li><p><b>IPv6</b>: Specify a value between 0 and 128</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable EDNS0ClientSubnetMask;

/**
 <p>The ID of the hosted zone that you want Amazon Route 53 to simulate a query for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

/**
 <p>The name of the resource record set that you want Amazon Route 53 to simulate a query for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recordName;

/**
 <p>The type of the resource record set.</p>
 */
@property (nonatomic, assign) AWSRoute53RRType recordType;

/**
 <p>If you want to simulate a request from a specific DNS resolver, specify the IP address for that resolver. If you omit this value, <code>TestDnsAnswer</code> uses the IP address of a DNS resolver in the AWS US East (N. Virginia) Region (<code>us-east-1</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable resolverIP;

@end

/**
 <p>A complex type that contains the response to a <code>TestDNSAnswer</code> request. </p>
 Required parameters: [Nameserver, RecordName, RecordType, RecordData, ResponseCode, Protocol]
 */
@interface AWSRoute53TestDNSAnswerResponse : AWSModel


/**
 <p>The Amazon Route 53 name server used to respond to the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameserver;

/**
 <p>The protocol that Amazon Route 53 used to respond to the request, either <code>UDP</code> or <code>TCP</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable protocols;

/**
 <p>A list that contains values that Amazon Route 53 returned for this resource record set.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable recordData;

/**
 <p>The name of the resource record set that you submitted a request for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recordName;

/**
 <p>The type of the resource record set that you submitted a request for.</p>
 */
@property (nonatomic, assign) AWSRoute53RRType recordType;

/**
 <p>A code that indicates whether the request is valid or not. The most common response code is <code>NOERROR</code>, meaning that the request is valid. If the response is not valid, Amazon Route 53 returns a response code that describes the error. For a list of possible response codes, see <a href="http://www.iana.org/assignments/dns-parameters/dns-parameters.xhtml#dns-parameters-6">DNS RCODES</a> on the IANA website. </p>
 */
@property (nonatomic, strong) NSString * _Nullable responseCode;

@end

/**
 <p>A complex type that contains settings for a traffic policy.</p>
 Required parameters: [Id, Version, Name, Type, Document]
 */
@interface AWSRoute53TrafficPolicy : AWSModel


/**
 <p>The comment that you specify in the <code>CreateTrafficPolicy</code> request, if any.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The definition of a traffic policy in JSON format. You specify the JSON document to use for a new traffic policy in the <code>CreateTrafficPolicy</code> request. For more information about the JSON format, see <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/api-policies-traffic-policy-document-format.html">Traffic Policy Document Format</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable document;

/**
 <p>The ID that Amazon Route 53 assigned to a traffic policy when you created it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name that you specified when you created the traffic policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The DNS type of the resource record sets that Amazon Route 53 creates when you use a traffic policy to create a traffic policy instance.</p>
 */
@property (nonatomic, assign) AWSRoute53RRType types;

/**
 <p>The version number that Amazon Route 53 assigns to a traffic policy. For a new traffic policy, the value of <code>Version</code> is always 1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>A complex type that contains settings for the new traffic policy instance.</p>
 Required parameters: [Id, HostedZoneId, Name, TTL, State, Message, TrafficPolicyId, TrafficPolicyVersion, TrafficPolicyType]
 */
@interface AWSRoute53TrafficPolicyInstance : AWSModel


/**
 <p>The ID of the hosted zone that Amazon Route 53 created resource record sets in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

/**
 <p>The ID that Amazon Route 53 assigned to the new traffic policy instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>If <code>State</code> is <code>Failed</code>, an explanation of the reason for the failure. If <code>State</code> is another value, <code>Message</code> is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The DNS name, such as www.example.com, for which Amazon Route 53 responds to queries by using the resource record sets that are associated with this traffic policy instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The value of <code>State</code> is one of the following values:</p><dl><dt>Applied</dt><dd><p>Amazon Route 53 has finished creating resource record sets, and changes have propagated to all Route 53 edge locations.</p></dd><dt>Creating</dt><dd><p>Route 53 is creating the resource record sets. Use <code>GetTrafficPolicyInstance</code> to confirm that the <code>CreateTrafficPolicyInstance</code> request completed successfully.</p></dd><dt>Failed</dt><dd><p>Route 53 wasn't able to create or update the resource record sets. When the value of <code>State</code> is <code>Failed</code>, see <code>Message</code> for an explanation of what caused the request to fail.</p></dd></dl>
 */
@property (nonatomic, strong) NSString * _Nullable state;

/**
 <p>The TTL that Amazon Route 53 assigned to all of the resource record sets that it created in the specified hosted zone.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable TTL;

/**
 <p>The ID of the traffic policy that Amazon Route 53 used to create resource record sets in the specified hosted zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trafficPolicyId;

/**
 <p>The DNS type that Amazon Route 53 assigned to all of the resource record sets that it created for this traffic policy instance. </p>
 */
@property (nonatomic, assign) AWSRoute53RRType trafficPolicyType;

/**
 <p>The version of the traffic policy that Amazon Route 53 used to create resource record sets in the specified hosted zone.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable trafficPolicyVersion;

@end

/**
 <p>A complex type that contains information about the latest version of one traffic policy that is associated with the current AWS account.</p>
 Required parameters: [Id, Name, Type, LatestVersion, TrafficPolicyCount]
 */
@interface AWSRoute53TrafficPolicySummary : AWSModel


/**
 <p>The ID that Amazon Route 53 assigned to the traffic policy when you created it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The version number of the latest version of the traffic policy.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable latestVersion;

/**
 <p>The name that you specified for the traffic policy when you created it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The number of traffic policies that are associated with the current AWS account.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable trafficPolicyCount;

/**
 <p>The DNS type of the resource record sets that Amazon Route 53 creates when you use a traffic policy to create a traffic policy instance.</p>
 */
@property (nonatomic, assign) AWSRoute53RRType types;

@end

/**
 <p>A complex type that contains information about a request to update a health check.</p>
 Required parameters: [HealthCheckId]
 */
@interface AWSRoute53UpdateHealthCheckRequest : AWSRequest


/**
 <p>A complex type that identifies the CloudWatch alarm that you want Amazon Route 53 health checkers to use to determine whether the specified health check is healthy.</p>
 */
@property (nonatomic, strong) AWSRoute53AlarmIdentifier * _Nullable alarmIdentifier;

/**
 <p>A complex type that contains one <code>ChildHealthCheck</code> element for each health check that you want to associate with a <code>CALCULATED</code> health check.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable childHealthChecks;

/**
 <p>Stops Route 53 from performing health checks. When you disable a health check, here's what happens:</p><ul><li><p><b>Health checks that check the health of endpoints:</b> Route 53 stops submitting requests to your application, server, or other resource.</p></li><li><p><b>Calculated health checks:</b> Route 53 stops aggregating the status of the referenced health checks.</p></li><li><p><b>Health checks that monitor CloudWatch alarms:</b> Route 53 stops monitoring the corresponding CloudWatch metrics.</p></li></ul><p>After you disable a health check, Route 53 considers the status of the health check to always be healthy. If you configured DNS failover, Route 53 continues to route traffic to the corresponding resources. If you want to stop routing traffic to a resource, change the value of <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-Inverted">Inverted</a>. </p><p>Charges for a health check still apply when the health check is disabled. For more information, see <a href="http://aws.amazon.com/route53/pricing/">Amazon Route 53 Pricing</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disabled;

/**
 <p>Specify whether you want Amazon Route 53 to send the value of <code>FullyQualifiedDomainName</code> to the endpoint in the <code>client_hello</code> message during <code>TLS</code> negotiation. This allows the endpoint to respond to <code>HTTPS</code> health check requests with the applicable SSL/TLS certificate.</p><p>Some endpoints require that HTTPS requests include the host name in the <code>client_hello</code> message. If you don't enable SNI, the status of the health check will be SSL alert <code>handshake_failure</code>. A health check can also have that status for other reasons. If SNI is enabled and you're still getting the error, check the SSL/TLS configuration on your endpoint and confirm that your certificate is valid.</p><p>The SSL/TLS certificate on your endpoint includes a domain name in the <code>Common Name</code> field and possibly several more in the <code>Subject Alternative Names</code> field. One of the domain names in the certificate should match the value that you specify for <code>FullyQualifiedDomainName</code>. If the endpoint responds to the <code>client_hello</code> message with a certificate that does not include the domain name that you specified in <code>FullyQualifiedDomainName</code>, a health checker will retry the handshake. In the second attempt, the health checker will omit <code>FullyQualifiedDomainName</code> from the <code>client_hello</code> message.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableSNI;

/**
 <p>The number of consecutive health checks that an endpoint must pass or fail for Amazon Route 53 to change the current status of the endpoint from unhealthy to healthy or vice versa. For more information, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html">How Amazon Route 53 Determines Whether an Endpoint Is Healthy</a> in the <i>Amazon Route 53 Developer Guide</i>.</p><p>If you don't specify a value for <code>FailureThreshold</code>, the default value is three health checks.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failureThreshold;

/**
 <p>Amazon Route 53 behavior depends on whether you specify a value for <code>IPAddress</code>.</p><note><p>If a health check already has a value for <code>IPAddress</code>, you can change the value. However, you can't update an existing health check to add or remove the value of <code>IPAddress</code>. </p></note><p><b>If you specify a value for</b><code>IPAddress</code>:</p><p>Route 53 sends health check requests to the specified IPv4 or IPv6 address and passes the value of <code>FullyQualifiedDomainName</code> in the <code>Host</code> header for all health checks except TCP health checks. This is typically the fully qualified DNS name of the endpoint on which you want Route 53 to perform health checks.</p><p>When Route 53 checks the health of an endpoint, here is how it constructs the <code>Host</code> header:</p><ul><li><p>If you specify a value of <code>80</code> for <code>Port</code> and <code>HTTP</code> or <code>HTTP_STR_MATCH</code> for <code>Type</code>, Route 53 passes the value of <code>FullyQualifiedDomainName</code> to the endpoint in the <code>Host</code> header.</p></li><li><p>If you specify a value of <code>443</code> for <code>Port</code> and <code>HTTPS</code> or <code>HTTPS_STR_MATCH</code> for <code>Type</code>, Route 53 passes the value of <code>FullyQualifiedDomainName</code> to the endpoint in the <code>Host</code> header.</p></li><li><p>If you specify another value for <code>Port</code> and any value except <code>TCP</code> for <code>Type</code>, Route 53 passes <i><code>FullyQualifiedDomainName</code>:<code>Port</code></i> to the endpoint in the <code>Host</code> header.</p></li></ul><p>If you don't specify a value for <code>FullyQualifiedDomainName</code>, Route 53 substitutes the value of <code>IPAddress</code> in the <code>Host</code> header in each of the above cases.</p><p><b>If you don't specify a value for</b><code>IPAddress</code>:</p><p>If you don't specify a value for <code>IPAddress</code>, Route 53 sends a DNS request to the domain that you specify in <code>FullyQualifiedDomainName</code> at the interval you specify in <code>RequestInterval</code>. Using an IPv4 address that is returned by DNS, Route 53 then checks the health of the endpoint.</p><note><p>If you don't specify a value for <code>IPAddress</code>, Route 53 uses only IPv4 to send health checks to the endpoint. If there's no resource record set with a type of A for the name that you specify for <code>FullyQualifiedDomainName</code>, the health check fails with a "DNS resolution failed" error.</p></note><p>If you want to check the health of weighted, latency, or failover resource record sets and you choose to specify the endpoint only by <code>FullyQualifiedDomainName</code>, we recommend that you create a separate health check for each endpoint. For example, create a health check for each HTTP server that is serving content for www.example.com. For the value of <code>FullyQualifiedDomainName</code>, specify the domain name of the server (such as <code>us-east-2-www.example.com</code>), not the name of the resource record sets (www.example.com).</p><important><p>In this configuration, if the value of <code>FullyQualifiedDomainName</code> matches the name of the resource record sets and you then associate the health check with those resource record sets, health check results will be unpredictable.</p></important><p>In addition, if the value of <code>Type</code> is <code>HTTP</code>, <code>HTTPS</code>, <code>HTTP_STR_MATCH</code>, or <code>HTTPS_STR_MATCH</code>, Route 53 passes the value of <code>FullyQualifiedDomainName</code> in the <code>Host</code> header, as it does when you specify a value for <code>IPAddress</code>. If the value of <code>Type</code> is <code>TCP</code>, Route 53 doesn't pass a <code>Host</code> header.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fullyQualifiedDomainName;

/**
 <p>The ID for the health check for which you want detailed information. When you created the health check, <code>CreateHealthCheck</code> returned the ID in the response, in the <code>HealthCheckId</code> element.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckId;

/**
 <p>A sequential counter that Amazon Route 53 sets to <code>1</code> when you create a health check and increments by 1 each time you update settings for the health check.</p><p>We recommend that you use <code>GetHealthCheck</code> or <code>ListHealthChecks</code> to get the current value of <code>HealthCheckVersion</code> for the health check that you want to update, and that you include that value in your <code>UpdateHealthCheck</code> request. This prevents Route 53 from overwriting an intervening update:</p><ul><li><p>If the value in the <code>UpdateHealthCheck</code> request matches the value of <code>HealthCheckVersion</code> in the health check, Route 53 updates the health check with the new settings.</p></li><li><p>If the value of <code>HealthCheckVersion</code> in the health check is greater, the health check was changed after you got the version number. Route 53 does not update the health check, and it returns a <code>HealthCheckVersionMismatch</code> error.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthCheckVersion;

/**
 <p>The number of child health checks that are associated with a <code>CALCULATED</code> health that Amazon Route 53 must consider healthy for the <code>CALCULATED</code> health check to be considered healthy. To specify the child health checks that you want to associate with a <code>CALCULATED</code> health check, use the <code>ChildHealthChecks</code> and <code>ChildHealthCheck</code> elements.</p><p>Note the following:</p><ul><li><p>If you specify a number greater than the number of child health checks, Route 53 always considers this health check to be unhealthy.</p></li><li><p>If you specify <code>0</code>, Route 53 always considers this health check to be healthy.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthThreshold;

/**
 <p>The IPv4 or IPv6 IP address for the endpoint that you want Amazon Route 53 to perform health checks on. If you don't specify a value for <code>IPAddress</code>, Route 53 sends a DNS request to resolve the domain name that you specify in <code>FullyQualifiedDomainName</code> at the interval that you specify in <code>RequestInterval</code>. Using an IP address that is returned by DNS, Route 53 then checks the health of the endpoint.</p><p>Use one of the following formats for the value of <code>IPAddress</code>: </p><ul><li><p><b>IPv4 address</b>: four values between 0 and 255, separated by periods (.), for example, <code>192.0.2.44</code>.</p></li><li><p><b>IPv6 address</b>: eight groups of four hexadecimal values, separated by colons (:), for example, <code>2001:0db8:85a3:0000:0000:abcd:0001:2345</code>. You can also shorten IPv6 addresses as described in RFC 5952, for example, <code>2001:db8:85a3::abcd:1:2345</code>.</p></li></ul><p>If the endpoint is an EC2 instance, we recommend that you create an Elastic IP address, associate it with your EC2 instance, and specify the Elastic IP address for <code>IPAddress</code>. This ensures that the IP address of your instance never changes. For more information, see the applicable documentation:</p><ul><li><p>Linux: <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses (EIP)</a> in the <i>Amazon EC2 User Guide for Linux Instances</i></p></li><li><p>Windows: <a href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/elastic-ip-addresses-eip.html">Elastic IP Addresses (EIP)</a> in the <i>Amazon EC2 User Guide for Windows Instances</i></p></li></ul><note><p>If a health check already has a value for <code>IPAddress</code>, you can change the value. However, you can't update an existing health check to add or remove the value of <code>IPAddress</code>. </p></note><p>For more information, see <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-FullyQualifiedDomainName">FullyQualifiedDomainName</a>. </p><p>Constraints: Route 53 can't check the health of endpoints for which the IP address is in local, private, non-routable, or multicast ranges. For more information about IP addresses for which you can't create health checks, see the following documents:</p><ul><li><p><a href="https://tools.ietf.org/html/rfc5735">RFC 5735, Special Use IPv4 Addresses</a></p></li><li><p><a href="https://tools.ietf.org/html/rfc6598">RFC 6598, IANA-Reserved IPv4 Prefix for Shared Address Space</a></p></li><li><p><a href="https://tools.ietf.org/html/rfc5156">RFC 5156, Special-Use IPv6 Addresses</a></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable IPAddress;

/**
 <p>When CloudWatch has insufficient data about the metric to determine the alarm state, the status that you want Amazon Route 53 to assign to the health check:</p><ul><li><p><code>Healthy</code>: Route 53 considers the health check to be healthy.</p></li><li><p><code>Unhealthy</code>: Route 53 considers the health check to be unhealthy.</p></li><li><p><code>LastKnownStatus</code>: Route 53 uses the status of the health check from the last time CloudWatch had sufficient data to determine the alarm state. For new health checks that have no last known status, the default status for the health check is healthy.</p></li></ul>
 */
@property (nonatomic, assign) AWSRoute53InsufficientDataHealthStatus insufficientDataHealthStatus;

/**
 <p>Specify whether you want Amazon Route 53 to invert the status of a health check, for example, to consider a health check unhealthy when it otherwise would be considered healthy.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inverted;

/**
 <p>The port on the endpoint that you want Amazon Route 53 to perform health checks on.</p><note><p>Don't specify a value for <code>Port</code> when you specify a value for <code>Type</code> of <code>CLOUDWATCH_METRIC</code> or <code>CALCULATED</code>.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>A complex type that contains one <code>Region</code> element for each region that you want Amazon Route 53 health checkers to check the specified endpoint from.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable regions;

/**
 <p>A complex type that contains one <code>ResettableElementName</code> element for each element that you want to reset to the default value. Valid values for <code>ResettableElementName</code> include the following:</p><ul><li><p><code>ChildHealthChecks</code>: Amazon Route 53 resets <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_HealthCheckConfig.html#Route53-Type-HealthCheckConfig-ChildHealthChecks">ChildHealthChecks</a> to null.</p></li><li><p><code>FullyQualifiedDomainName</code>: Route 53 resets <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_UpdateHealthCheck.html#Route53-UpdateHealthCheck-request-FullyQualifiedDomainName">FullyQualifiedDomainName</a>. to null.</p></li><li><p><code>Regions</code>: Route 53 resets the <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_HealthCheckConfig.html#Route53-Type-HealthCheckConfig-Regions">Regions</a> list to the default set of regions. </p></li><li><p><code>ResourcePath</code>: Route 53 resets <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_HealthCheckConfig.html#Route53-Type-HealthCheckConfig-ResourcePath">ResourcePath</a> to null.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resetElements;

/**
 <p>The path that you want Amazon Route 53 to request when performing health checks. The path can be any value for which your endpoint will return an HTTP status code of 2xx or 3xx when the endpoint is healthy, for example the file /docs/route53-health-check.html. You can also include query string parameters, for example, <code>/welcome.html?language=jp&amp;login=y</code>. </p><p>Specify this value only if you want to change it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourcePath;

/**
 <p>If the value of <code>Type</code> is <code>HTTP_STR_MATCH</code> or <code>HTTPS_STR_MATCH</code>, the string that you want Amazon Route 53 to search for in the response body from the specified resource. If the string appears in the response body, Route 53 considers the resource healthy. (You can't change the value of <code>Type</code> when you update a health check.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable searchString;

@end

/**
 <p>A complex type that contains the response to the <code>UpdateHealthCheck</code> request.</p>
 Required parameters: [HealthCheck]
 */
@interface AWSRoute53UpdateHealthCheckResponse : AWSModel


/**
 <p>A complex type that contains the response to an <code>UpdateHealthCheck</code> request.</p>
 */
@property (nonatomic, strong) AWSRoute53HealthCheck * _Nullable healthCheck;

@end

/**
 <p>A request to update the comment for a hosted zone.</p>
 Required parameters: [Id]
 */
@interface AWSRoute53UpdateHostedZoneCommentRequest : AWSRequest


/**
 <p>The new comment for the hosted zone. If you don't specify a value for <code>Comment</code>, Amazon Route 53 deletes the existing value of the <code>Comment</code> element, if any.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The ID for the hosted zone that you want to update the comment for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>A complex type that contains the response to the <code>UpdateHostedZoneComment</code> request.</p>
 Required parameters: [HostedZone]
 */
@interface AWSRoute53UpdateHostedZoneCommentResponse : AWSModel


/**
 <p>A complex type that contains the response to the <code>UpdateHostedZoneComment</code> request.</p>
 */
@property (nonatomic, strong) AWSRoute53HostedZone * _Nullable hostedZone;

@end

/**
 <p>A complex type that contains information about the traffic policy that you want to update the comment for.</p>
 Required parameters: [Id, Version, Comment]
 */
@interface AWSRoute53UpdateTrafficPolicyCommentRequest : AWSRequest


/**
 <p>The new comment for the specified traffic policy and version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The value of <code>Id</code> for the traffic policy that you want to update the comment for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The value of <code>Version</code> for the traffic policy that you want to update the comment for.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>A complex type that contains the response information for the traffic policy.</p>
 Required parameters: [TrafficPolicy]
 */
@interface AWSRoute53UpdateTrafficPolicyCommentResponse : AWSModel


/**
 <p>A complex type that contains settings for the specified traffic policy.</p>
 */
@property (nonatomic, strong) AWSRoute53TrafficPolicy * _Nullable trafficPolicy;

@end

/**
 <p>A complex type that contains information about the resource record sets that you want to update based on a specified traffic policy instance.</p>
 Required parameters: [Id, TTL, TrafficPolicyId, TrafficPolicyVersion]
 */
@interface AWSRoute53UpdateTrafficPolicyInstanceRequest : AWSRequest


/**
 <p>The ID of the traffic policy instance that you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The TTL that you want Amazon Route 53 to assign to all of the updated resource record sets.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable TTL;

/**
 <p>The ID of the traffic policy that you want Amazon Route 53 to use to update resource record sets for the specified traffic policy instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trafficPolicyId;

/**
 <p>The version of the traffic policy that you want Amazon Route 53 to use to update resource record sets for the specified traffic policy instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable trafficPolicyVersion;

@end

/**
 <p>A complex type that contains information about the resource record sets that Amazon Route 53 created based on a specified traffic policy.</p>
 Required parameters: [TrafficPolicyInstance]
 */
@interface AWSRoute53UpdateTrafficPolicyInstanceResponse : AWSModel


/**
 <p>A complex type that contains settings for the updated traffic policy instance.</p>
 */
@property (nonatomic, strong) AWSRoute53TrafficPolicyInstance * _Nullable trafficPolicyInstance;

@end

/**
 <p>(Private hosted zones only) A complex type that contains information about an Amazon VPC.</p>
 */
@interface AWSRoute53VPC : AWSModel


/**
 <p>(Private hosted zones only) The ID of an Amazon VPC. </p>
 */
@property (nonatomic, strong) NSString * _Nullable VPCId;

/**
 <p>(Private hosted zones only) The region that an Amazon VPC was created in.</p>
 */
@property (nonatomic, assign) AWSRoute53VPCRegion VPCRegion;

@end

NS_ASSUME_NONNULL_END
