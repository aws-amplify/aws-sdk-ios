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

FOUNDATION_EXPORT NSString *const AWSsecurityhubErrorDomain;

typedef NS_ENUM(NSInteger, AWSsecurityhubErrorType) {
    AWSsecurityhubErrorUnknown,
    AWSsecurityhubErrorAccessDenied,
    AWSsecurityhubErrorInternal,
    AWSsecurityhubErrorInvalidAccess,
    AWSsecurityhubErrorInvalidInput,
    AWSsecurityhubErrorLimitExceeded,
    AWSsecurityhubErrorResourceConflict,
    AWSsecurityhubErrorResourceNotFound,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubAwsIamAccessKeyStatus) {
    AWSsecurityhubAwsIamAccessKeyStatusUnknown,
    AWSsecurityhubAwsIamAccessKeyStatusActive,
    AWSsecurityhubAwsIamAccessKeyStatusInactive,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubComplianceStatus) {
    AWSsecurityhubComplianceStatusUnknown,
    AWSsecurityhubComplianceStatusPassed,
    AWSsecurityhubComplianceStatusWarning,
    AWSsecurityhubComplianceStatusFailed,
    AWSsecurityhubComplianceStatusNotAvailable,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubControlStatus) {
    AWSsecurityhubControlStatusUnknown,
    AWSsecurityhubControlStatusEnabled,
    AWSsecurityhubControlStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubDateRangeUnit) {
    AWSsecurityhubDateRangeUnitUnknown,
    AWSsecurityhubDateRangeUnitDays,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubIntegrationType) {
    AWSsecurityhubIntegrationTypeUnknown,
    AWSsecurityhubIntegrationTypeSendFindingsToSecurityHub,
    AWSsecurityhubIntegrationTypeReceiveFindingsFromSecurityHub,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubMalwareState) {
    AWSsecurityhubMalwareStateUnknown,
    AWSsecurityhubMalwareStateObserved,
    AWSsecurityhubMalwareStateRemovalFailed,
    AWSsecurityhubMalwareStateRemoved,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubMalwareType) {
    AWSsecurityhubMalwareTypeUnknown,
    AWSsecurityhubMalwareTypeAdware,
    AWSsecurityhubMalwareTypeBlendedThreat,
    AWSsecurityhubMalwareTypeBotnetAgent,
    AWSsecurityhubMalwareTypeCoinMiner,
    AWSsecurityhubMalwareTypeExploitKit,
    AWSsecurityhubMalwareTypeKeylogger,
    AWSsecurityhubMalwareTypeMacro,
    AWSsecurityhubMalwareTypePotentiallyUnwanted,
    AWSsecurityhubMalwareTypeSpyware,
    AWSsecurityhubMalwareTypeRansomware,
    AWSsecurityhubMalwareTypeRemoteAccess,
    AWSsecurityhubMalwareTypeRootkit,
    AWSsecurityhubMalwareTypeTrojan,
    AWSsecurityhubMalwareTypeVirus,
    AWSsecurityhubMalwareTypeWorm,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubMapFilterComparison) {
    AWSsecurityhubMapFilterComparisonUnknown,
    AWSsecurityhubMapFilterComparisonEquals,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubNetworkDirection) {
    AWSsecurityhubNetworkDirectionUnknown,
    AWSsecurityhubNetworkDirectionIN,
    AWSsecurityhubNetworkDirectionOut,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubPartition) {
    AWSsecurityhubPartitionUnknown,
    AWSsecurityhubPartitionAws,
    AWSsecurityhubPartitionAwsCn,
    AWSsecurityhubPartitionAwsUsGov,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubRecordState) {
    AWSsecurityhubRecordStateUnknown,
    AWSsecurityhubRecordStateActive,
    AWSsecurityhubRecordStateArchived,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubSeverityLabel) {
    AWSsecurityhubSeverityLabelUnknown,
    AWSsecurityhubSeverityLabelInformational,
    AWSsecurityhubSeverityLabelLow,
    AWSsecurityhubSeverityLabelMedium,
    AWSsecurityhubSeverityLabelHigh,
    AWSsecurityhubSeverityLabelCritical,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubSeverityRating) {
    AWSsecurityhubSeverityRatingUnknown,
    AWSsecurityhubSeverityRatingLow,
    AWSsecurityhubSeverityRatingMedium,
    AWSsecurityhubSeverityRatingHigh,
    AWSsecurityhubSeverityRatingCritical,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubSortOrder) {
    AWSsecurityhubSortOrderUnknown,
    AWSsecurityhubSortOrderAsc,
    AWSsecurityhubSortOrderDesc,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubStandardsStatus) {
    AWSsecurityhubStandardsStatusUnknown,
    AWSsecurityhubStandardsStatusPending,
    AWSsecurityhubStandardsStatusReady,
    AWSsecurityhubStandardsStatusFailed,
    AWSsecurityhubStandardsStatusDeleting,
    AWSsecurityhubStandardsStatusIncomplete,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubStringFilterComparison) {
    AWSsecurityhubStringFilterComparisonUnknown,
    AWSsecurityhubStringFilterComparisonEquals,
    AWSsecurityhubStringFilterComparisonPrefix,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubThreatIntelIndicatorCategory) {
    AWSsecurityhubThreatIntelIndicatorCategoryUnknown,
    AWSsecurityhubThreatIntelIndicatorCategoryBackdoor,
    AWSsecurityhubThreatIntelIndicatorCategoryCardStealer,
    AWSsecurityhubThreatIntelIndicatorCategoryCommandAndControl,
    AWSsecurityhubThreatIntelIndicatorCategoryDropSite,
    AWSsecurityhubThreatIntelIndicatorCategoryExploitSite,
    AWSsecurityhubThreatIntelIndicatorCategoryKeylogger,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubThreatIntelIndicatorType) {
    AWSsecurityhubThreatIntelIndicatorTypeUnknown,
    AWSsecurityhubThreatIntelIndicatorTypeDomain,
    AWSsecurityhubThreatIntelIndicatorTypeEmailAddress,
    AWSsecurityhubThreatIntelIndicatorTypeHashMd5,
    AWSsecurityhubThreatIntelIndicatorTypeHashSha1,
    AWSsecurityhubThreatIntelIndicatorTypeHashSha256,
    AWSsecurityhubThreatIntelIndicatorTypeHashSha512,
    AWSsecurityhubThreatIntelIndicatorTypeIpv4Address,
    AWSsecurityhubThreatIntelIndicatorTypeIpv6Address,
    AWSsecurityhubThreatIntelIndicatorTypeMutex,
    AWSsecurityhubThreatIntelIndicatorTypeProcess,
    AWSsecurityhubThreatIntelIndicatorTypeUrl,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubVerificationState) {
    AWSsecurityhubVerificationStateUnknown,
    AWSsecurityhubVerificationStateTruePositive,
    AWSsecurityhubVerificationStateFalsePositive,
    AWSsecurityhubVerificationStateBenignPositive,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubWorkflowState) {
    AWSsecurityhubWorkflowStateUnknown,
    AWSsecurityhubWorkflowStateNew,
    AWSsecurityhubWorkflowStateAssigned,
    AWSsecurityhubWorkflowStateInProgress,
    AWSsecurityhubWorkflowStateDeferred,
    AWSsecurityhubWorkflowStateResolved,
};

typedef NS_ENUM(NSInteger, AWSsecurityhubWorkflowStatus) {
    AWSsecurityhubWorkflowStatusUnknown,
    AWSsecurityhubWorkflowStatusNew,
    AWSsecurityhubWorkflowStatusNotified,
    AWSsecurityhubWorkflowStatusResolved,
    AWSsecurityhubWorkflowStatusSuppressed,
};

@class AWSsecurityhubAcceptInvitationRequest;
@class AWSsecurityhubAcceptInvitationResponse;
@class AWSsecurityhubAccountDetails;
@class AWSsecurityhubActionTarget;
@class AWSsecurityhubAvailabilityZone;
@class AWSsecurityhubAwsCloudFrontDistributionDetails;
@class AWSsecurityhubAwsCloudFrontDistributionLogging;
@class AWSsecurityhubAwsCloudFrontDistributionOriginItem;
@class AWSsecurityhubAwsCloudFrontDistributionOrigins;
@class AWSsecurityhubAwsCodeBuildProjectDetails;
@class AWSsecurityhubAwsCodeBuildProjectEnvironment;
@class AWSsecurityhubAwsCodeBuildProjectEnvironmentRegistryCredential;
@class AWSsecurityhubAwsCodeBuildProjectSource;
@class AWSsecurityhubAwsCodeBuildProjectVpcConfig;
@class AWSsecurityhubAwsEc2InstanceDetails;
@class AWSsecurityhubAwsEc2NetworkInterfaceAttachment;
@class AWSsecurityhubAwsEc2NetworkInterfaceDetails;
@class AWSsecurityhubAwsEc2NetworkInterfaceSecurityGroup;
@class AWSsecurityhubAwsEc2SecurityGroupDetails;
@class AWSsecurityhubAwsEc2SecurityGroupIpPermission;
@class AWSsecurityhubAwsEc2SecurityGroupIpRange;
@class AWSsecurityhubAwsEc2SecurityGroupIpv6Range;
@class AWSsecurityhubAwsEc2SecurityGroupPrefixListId;
@class AWSsecurityhubAwsEc2SecurityGroupUserIdGroupPair;
@class AWSsecurityhubAwsElasticsearchDomainDetails;
@class AWSsecurityhubAwsElasticsearchDomainDomainEndpointOptions;
@class AWSsecurityhubAwsElasticsearchDomainEncryptionAtRestOptions;
@class AWSsecurityhubAwsElasticsearchDomainNodeToNodeEncryptionOptions;
@class AWSsecurityhubAwsElasticsearchDomainVPCOptions;
@class AWSsecurityhubAwsElbv2LoadBalancerDetails;
@class AWSsecurityhubAwsIamAccessKeyDetails;
@class AWSsecurityhubAwsIamRoleDetails;
@class AWSsecurityhubAwsKmsKeyDetails;
@class AWSsecurityhubAwsLambdaFunctionCode;
@class AWSsecurityhubAwsLambdaFunctionDeadLetterConfig;
@class AWSsecurityhubAwsLambdaFunctionDetails;
@class AWSsecurityhubAwsLambdaFunctionEnvironment;
@class AWSsecurityhubAwsLambdaFunctionEnvironmentError;
@class AWSsecurityhubAwsLambdaFunctionLayer;
@class AWSsecurityhubAwsLambdaFunctionTracingConfig;
@class AWSsecurityhubAwsLambdaFunctionVpcConfig;
@class AWSsecurityhubAwsLambdaLayerVersionDetails;
@class AWSsecurityhubAwsRdsDbInstanceAssociatedRole;
@class AWSsecurityhubAwsRdsDbInstanceDetails;
@class AWSsecurityhubAwsRdsDbInstanceEndpoint;
@class AWSsecurityhubAwsRdsDbInstanceVpcSecurityGroup;
@class AWSsecurityhubAwsS3BucketDetails;
@class AWSsecurityhubAwsS3BucketServerSideEncryptionByDefault;
@class AWSsecurityhubAwsS3BucketServerSideEncryptionConfiguration;
@class AWSsecurityhubAwsS3BucketServerSideEncryptionRule;
@class AWSsecurityhubAwsS3ObjectDetails;
@class AWSsecurityhubAwsSecurityFinding;
@class AWSsecurityhubAwsSecurityFindingFilters;
@class AWSsecurityhubAwsSecurityFindingIdentifier;
@class AWSsecurityhubAwsSnsTopicDetails;
@class AWSsecurityhubAwsSnsTopicSubscription;
@class AWSsecurityhubAwsSqsQueueDetails;
@class AWSsecurityhubAwsWafWebAclDetails;
@class AWSsecurityhubAwsWafWebAclRule;
@class AWSsecurityhubBatchDisableStandardsRequest;
@class AWSsecurityhubBatchDisableStandardsResponse;
@class AWSsecurityhubBatchEnableStandardsRequest;
@class AWSsecurityhubBatchEnableStandardsResponse;
@class AWSsecurityhubBatchImportFindingsRequest;
@class AWSsecurityhubBatchImportFindingsResponse;
@class AWSsecurityhubBatchUpdateFindingsRequest;
@class AWSsecurityhubBatchUpdateFindingsResponse;
@class AWSsecurityhubBatchUpdateFindingsUnprocessedFinding;
@class AWSsecurityhubCompliance;
@class AWSsecurityhubContainerDetails;
@class AWSsecurityhubCreateActionTargetRequest;
@class AWSsecurityhubCreateActionTargetResponse;
@class AWSsecurityhubCreateInsightRequest;
@class AWSsecurityhubCreateInsightResponse;
@class AWSsecurityhubCreateMembersRequest;
@class AWSsecurityhubCreateMembersResponse;
@class AWSsecurityhubDateFilter;
@class AWSsecurityhubDateRange;
@class AWSsecurityhubDeclineInvitationsRequest;
@class AWSsecurityhubDeclineInvitationsResponse;
@class AWSsecurityhubDeleteActionTargetRequest;
@class AWSsecurityhubDeleteActionTargetResponse;
@class AWSsecurityhubDeleteInsightRequest;
@class AWSsecurityhubDeleteInsightResponse;
@class AWSsecurityhubDeleteInvitationsRequest;
@class AWSsecurityhubDeleteInvitationsResponse;
@class AWSsecurityhubDeleteMembersRequest;
@class AWSsecurityhubDeleteMembersResponse;
@class AWSsecurityhubDescribeActionTargetsRequest;
@class AWSsecurityhubDescribeActionTargetsResponse;
@class AWSsecurityhubDescribeHubRequest;
@class AWSsecurityhubDescribeHubResponse;
@class AWSsecurityhubDescribeProductsRequest;
@class AWSsecurityhubDescribeProductsResponse;
@class AWSsecurityhubDescribeStandardsControlsRequest;
@class AWSsecurityhubDescribeStandardsControlsResponse;
@class AWSsecurityhubDescribeStandardsRequest;
@class AWSsecurityhubDescribeStandardsResponse;
@class AWSsecurityhubDisableImportFindingsForProductRequest;
@class AWSsecurityhubDisableImportFindingsForProductResponse;
@class AWSsecurityhubDisableSecurityHubRequest;
@class AWSsecurityhubDisableSecurityHubResponse;
@class AWSsecurityhubDisassociateFromMasterAccountRequest;
@class AWSsecurityhubDisassociateFromMasterAccountResponse;
@class AWSsecurityhubDisassociateMembersRequest;
@class AWSsecurityhubDisassociateMembersResponse;
@class AWSsecurityhubEnableImportFindingsForProductRequest;
@class AWSsecurityhubEnableImportFindingsForProductResponse;
@class AWSsecurityhubEnableSecurityHubRequest;
@class AWSsecurityhubEnableSecurityHubResponse;
@class AWSsecurityhubGetEnabledStandardsRequest;
@class AWSsecurityhubGetEnabledStandardsResponse;
@class AWSsecurityhubGetFindingsRequest;
@class AWSsecurityhubGetFindingsResponse;
@class AWSsecurityhubGetInsightResultsRequest;
@class AWSsecurityhubGetInsightResultsResponse;
@class AWSsecurityhubGetInsightsRequest;
@class AWSsecurityhubGetInsightsResponse;
@class AWSsecurityhubGetInvitationsCountRequest;
@class AWSsecurityhubGetInvitationsCountResponse;
@class AWSsecurityhubGetMasterAccountRequest;
@class AWSsecurityhubGetMasterAccountResponse;
@class AWSsecurityhubGetMembersRequest;
@class AWSsecurityhubGetMembersResponse;
@class AWSsecurityhubImportFindingsError;
@class AWSsecurityhubInsight;
@class AWSsecurityhubInsightResultValue;
@class AWSsecurityhubInsightResults;
@class AWSsecurityhubInvitation;
@class AWSsecurityhubInviteMembersRequest;
@class AWSsecurityhubInviteMembersResponse;
@class AWSsecurityhubIpFilter;
@class AWSsecurityhubKeywordFilter;
@class AWSsecurityhubListEnabledProductsForImportRequest;
@class AWSsecurityhubListEnabledProductsForImportResponse;
@class AWSsecurityhubListInvitationsRequest;
@class AWSsecurityhubListInvitationsResponse;
@class AWSsecurityhubListMembersRequest;
@class AWSsecurityhubListMembersResponse;
@class AWSsecurityhubListTagsForResourceRequest;
@class AWSsecurityhubListTagsForResourceResponse;
@class AWSsecurityhubLoadBalancerState;
@class AWSsecurityhubMalware;
@class AWSsecurityhubMapFilter;
@class AWSsecurityhubMember;
@class AWSsecurityhubNetwork;
@class AWSsecurityhubNote;
@class AWSsecurityhubNoteUpdate;
@class AWSsecurityhubNumberFilter;
@class AWSsecurityhubProcessDetails;
@class AWSsecurityhubProduct;
@class AWSsecurityhubRecommendation;
@class AWSsecurityhubRelatedFinding;
@class AWSsecurityhubRemediation;
@class AWSsecurityhubResource;
@class AWSsecurityhubResourceDetails;
@class AWSsecurityhubResult;
@class AWSsecurityhubSeverity;
@class AWSsecurityhubSeverityUpdate;
@class AWSsecurityhubSortCriterion;
@class AWSsecurityhubStandard;
@class AWSsecurityhubStandardsControl;
@class AWSsecurityhubStandardsSubscription;
@class AWSsecurityhubStandardsSubscriptionRequest;
@class AWSsecurityhubStringFilter;
@class AWSsecurityhubTagResourceRequest;
@class AWSsecurityhubTagResourceResponse;
@class AWSsecurityhubThreatIntelIndicator;
@class AWSsecurityhubUntagResourceRequest;
@class AWSsecurityhubUntagResourceResponse;
@class AWSsecurityhubUpdateActionTargetRequest;
@class AWSsecurityhubUpdateActionTargetResponse;
@class AWSsecurityhubUpdateFindingsRequest;
@class AWSsecurityhubUpdateFindingsResponse;
@class AWSsecurityhubUpdateInsightRequest;
@class AWSsecurityhubUpdateInsightResponse;
@class AWSsecurityhubUpdateStandardsControlRequest;
@class AWSsecurityhubUpdateStandardsControlResponse;
@class AWSsecurityhubWafAction;
@class AWSsecurityhubWafExcludedRule;
@class AWSsecurityhubWafOverrideAction;
@class AWSsecurityhubWorkflow;
@class AWSsecurityhubWorkflowUpdate;

/**
 
 */
@interface AWSsecurityhubAcceptInvitationRequest : AWSRequest


/**
 <p>The ID of the invitation sent from the Security Hub master account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable invitationId;

/**
 <p>The account ID of the Security Hub master account that sent the invitation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterId;

@end

/**
 
 */
@interface AWSsecurityhubAcceptInvitationResponse : AWSModel


@end

/**
 <p>The details of an AWS account.</p>
 */
@interface AWSsecurityhubAccountDetails : AWSModel


/**
 <p>The ID of an AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The email of an AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

@end

/**
 <p>An <code>ActionTarget</code> object.</p>
 Required parameters: [ActionTargetArn, Name, Description]
 */
@interface AWSsecurityhubActionTarget : AWSModel


/**
 <p>The ARN for the target action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionTargetArn;

/**
 <p>The description of the target action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the action target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Information about an Availability Zone.</p>
 */
@interface AWSsecurityhubAvailabilityZone : AWSModel


/**
 <p>The ID of the subnet. You can specify one subnet per Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>The name of the Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable zoneName;

@end

/**
 <p>A distribution configuration.</p>
 */
@interface AWSsecurityhubAwsCloudFrontDistributionDetails : AWSModel


/**
 <p>The domain name corresponding to the distribution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The entity tag is a hash of the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>The date and time that the distribution was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedTime;

/**
 <p>A complex type that controls whether access logs are written for the distribution.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsCloudFrontDistributionLogging * _Nullable logging;

/**
 <p>A complex type that contains information about origins for this distribution.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsCloudFrontDistributionOrigins * _Nullable origins;

/**
 <p>Indicates the current status of the distribution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>A unique identifier that specifies the AWS WAF web ACL, if any, to associate with this distribution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable webAclId;

@end

/**
 <p>A complex type that controls whether access logs are written for the distribution.</p>
 */
@interface AWSsecurityhubAwsCloudFrontDistributionLogging : AWSModel


/**
 <p>The Amazon S3 bucket to store the access logs in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>With this field, you can enable or disable the selected distribution.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>Specifies whether you want CloudFront to include cookies in access logs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeCookies;

/**
 <p>An optional string that you want CloudFront to use as a prefix to the access log filenames for this distribution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 <p>A complex type that describes the Amazon S3 bucket, HTTP server (for example, a web server), Amazon MediaStore, or other server from which CloudFront gets your files.</p>
 */
@interface AWSsecurityhubAwsCloudFrontDistributionOriginItem : AWSModel


/**
 <p>Amazon S3 origins: The DNS name of the Amazon S3 bucket from which you want CloudFront to get objects for this origin.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>A unique identifier for the origin or origin group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>An optional element that causes CloudFront to request your content from a directory in your Amazon S3 bucket or your custom origin.</p>
 */
@property (nonatomic, strong) NSString * _Nullable originPath;

@end

/**
 <p>A complex type that contains information about origins and origin groups for this distribution.</p>
 */
@interface AWSsecurityhubAwsCloudFrontDistributionOrigins : AWSModel


/**
 <p>A complex type that contains origins or origin groups for this distribution.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubAwsCloudFrontDistributionOriginItem *> * _Nullable items;

@end

/**
 <p>Information about an AWS CodeBuild project.</p>
 */
@interface AWSsecurityhubAwsCodeBuildProjectDetails : AWSModel


/**
 <p>The AWS Key Management Service (AWS KMS) customer master key (CMK) used to encrypt the build output artifacts.</p><p>You can specify either the Amazon Resource Name (ARN) of the CMK or, if available, the CMK alias (using the format alias/alias-name). </p>
 */
@property (nonatomic, strong) NSString * _Nullable encryptionKey;

/**
 <p>Information about the build environment for this build project.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsCodeBuildProjectEnvironment * _Nullable environment;

/**
 <p>The name of the build project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ARN of the IAM role that enables AWS CodeBuild to interact with dependent AWS services on behalf of the AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRole;

/**
 <p>Information about the build input source code for this build project.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsCodeBuildProjectSource * _Nullable source;

/**
 <p>Information about the VPC configuration that AWS CodeBuild accesses.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsCodeBuildProjectVpcConfig * _Nullable vpcConfig;

@end

/**
 <p>Information about the build environment for this build project.</p>
 */
@interface AWSsecurityhubAwsCodeBuildProjectEnvironment : AWSModel


/**
 <p>The certificate to use with this build project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificate;

/**
 <p>The type of credentials AWS CodeBuild uses to pull images in your build.</p><p>Valid values:</p><ul><li><p><code>CODEBUILD</code> specifies that AWS CodeBuild uses its own credentials. This requires that you modify your ECR repository policy to trust the AWS CodeBuild service principal.</p></li><li><p><code>SERVICE_ROLE</code> specifies that AWS CodeBuild uses your build project's service role.</p></li></ul><p>When you use a cross-account or private registry image, you must use <code>SERVICE_ROLE</code> credentials. When you use an AWS CodeBuild curated image, you must use <code>CODEBUILD</code> credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imagePullCredentialsType;

/**
 <p>The credentials for access to a private registry.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsCodeBuildProjectEnvironmentRegistryCredential * _Nullable registryCredential;

/**
 <p>The type of build environment to use for related builds.</p><p>The environment type <code>ARM_CONTAINER</code> is available only in regions US East (N. Virginia), US East (Ohio), US West (Oregon), Europe (Ireland), Asia Pacific (Mumbai), Asia Pacific (Tokyo), Asia Pacific (Sydney), and Europe (Frankfurt).</p><p>The environment type <code>LINUX_CONTAINER</code> with compute type build.general1.2xlarge is available only in regions US East (N. Virginia), US East (N. Virginia), US West (Oregon), Canada (Central), Europe (Ireland), Europe (London), Europe (Frankfurt), Asia Pacific (Tokyo), Asia Pacific (Seoul), Asia Pacific (Singapore), Asia Pacific (Sydney), China (Beijing), and China (Ningxia).</p><p>The environment type <code>LINUX_GPU_CONTAINER</code> is available only in regions US East (N. Virginia), US East (N. Virginia), US West (Oregon), Canada (Central), Europe (Ireland), Europe (London), Europe (Frankfurt), Asia Pacific (Tokyo), Asia Pacific (Seoul), Asia Pacific (Singapore), Asia Pacific (Sydney) , China (Beijing), and China (Ningxia).</p><p>Valid values: <code>WINDOWS_CONTAINER</code> | <code>LINUX_CONTAINER</code> | <code>LINUX_GPU_CONTAINER</code> | <code>ARM_CONTAINER</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>The credentials for access to a private registry.</p>
 */
@interface AWSsecurityhubAwsCodeBuildProjectEnvironmentRegistryCredential : AWSModel


/**
 <p>The Amazon Resource Name (ARN) or name of credentials created using AWS Secrets Manager.</p><note><p>The credential can use the name of the credentials only if they exist in your current AWS Region. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable credential;

/**
 <p>The service that created the credentials to access a private Docker registry.</p><p>The valid value,<code> SECRETS_MANAGER</code>, is for AWS Secrets Manager.</p>
 */
@property (nonatomic, strong) NSString * _Nullable credentialProvider;

@end

/**
 <p>Information about the build input source code for this build project.</p>
 */
@interface AWSsecurityhubAwsCodeBuildProjectSource : AWSModel


/**
 <p>Information about the Git clone depth for the build project.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable gitCloneDepth;

/**
 <p>Whether to ignore SSL warnings while connecting to the project source code.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable insecureSsl;

/**
 <p>Information about the location of the source code to be built.</p><p>Valid values include:</p><ul><li><p>For source code settings that are specified in the source action of a pipeline in AWS CodePipeline, location should not be specified. If it is specified, AWS CodePipeline ignores it. This is because AWS CodePipeline uses the settings in a pipeline's source action instead of this value.</p></li><li><p>For source code in an AWS CodeCommit repository, the HTTPS clone URL to the repository that contains the source code and the buildspec file (for example, <code>https://git-codecommit.region-ID.amazonaws.com/v1/repos/repo-name</code> ).</p></li><li><p>For source code in an S3 input bucket, one of the following.</p><ul><li><p>The path to the ZIP file that contains the source code (for example, <code>bucket-name/path/to/object-name.zip</code>).</p></li><li><p> The path to the folder that contains the source code (for example, <code>bucket-name/path/to/source-code/folder/</code>).</p></li></ul></li><li><p>For source code in a GitHub repository, the HTTPS clone URL to the repository that contains the source and the buildspec file.</p></li><li><p>For source code in a Bitbucket repository, the HTTPS clone URL to the repository that contains the source and the buildspec file. </p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The type of repository that contains the source code to be built. Valid values are:</p><ul><li><p><code>BITBUCKET</code> - The source code is in a Bitbucket repository.</p></li><li><p><code>CODECOMMIT</code> - The source code is in an AWS CodeCommit repository.</p></li><li><p><code>CODEPIPELINE</code> - The source code settings are specified in the source action of a pipeline in AWS CodePipeline.</p></li><li><p><code>GITHUB</code> - The source code is in a GitHub repository.</p></li><li><p><code>GITHUB_ENTERPRISE</code> - The source code is in a GitHub Enterprise repository.</p></li><li><p><code>NO_SOURCE</code> - The project does not have input source code.</p></li><li><p><code>S3</code> - The source code is in an S3 input bucket. </p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>Information about the VPC configuration that AWS CodeBuild accesses.</p>
 */
@interface AWSsecurityhubAwsCodeBuildProjectVpcConfig : AWSModel


/**
 <p>A list of one or more security group IDs in your Amazon VPC.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>A list of one or more subnet IDs in your Amazon VPC.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnets;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>The details of an Amazon EC2 instance.</p>
 */
@interface AWSsecurityhubAwsEc2InstanceDetails : AWSModel


/**
 <p>The IAM profile ARN of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamInstanceProfileArn;

/**
 <p>The Amazon Machine Image (AMI) ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

/**
 <p>The IPv4 addresses associated with the instance.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ipV4Addresses;

/**
 <p>The IPv6 addresses associated with the instance.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ipV6Addresses;

/**
 <p>The key name associated with the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

/**
 <p>The date/time the instance was launched.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchedAt;

/**
 <p>The identifier of the subnet that the instance was launched in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>The instance type of the instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

/**
 <p>The identifier of the VPC that the instance was launched in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Information about the network interface attachment.</p>
 */
@interface AWSsecurityhubAwsEc2NetworkInterfaceAttachment : AWSModel


/**
 <p>The timestamp indicating when the attachment initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachTime;

/**
 <p>The identifier of the network interface attachment</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachmentId;

/**
 <p>Indicates whether the network interface is deleted when the instance is terminated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteOnTermination;

/**
 <p>The device index of the network interface attachment on the instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deviceIndex;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The AWS account ID of the owner of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceOwnerId;

/**
 <p>The attachment state.</p><p>Valid values: <code>attaching</code> | <code>attached</code> | <code>detaching</code> | <code>detached</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Details about the network interface</p>
 */
@interface AWSsecurityhubAwsEc2NetworkInterfaceDetails : AWSModel


/**
 <p>The network interface attachment.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsEc2NetworkInterfaceAttachment * _Nullable attachment;

/**
 <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>Security groups for the network interface.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubAwsEc2NetworkInterfaceSecurityGroup *> * _Nullable securityGroups;

/**
 <p>Indicates whether traffic to or from the instance is validated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sourceDestCheck;

@end

/**
 <p>A security group associated with the network interface.</p>
 */
@interface AWSsecurityhubAwsEc2NetworkInterfaceSecurityGroup : AWSModel


/**
 <p>The ID of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>The name of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

@end

/**
 <p>Details about an EC2 security group.</p>
 */
@interface AWSsecurityhubAwsEc2SecurityGroupDetails : AWSModel


/**
 <p>The ID of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>The name of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The inbound rules associated with the security group.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubAwsEc2SecurityGroupIpPermission *> * _Nullable ipPermissions;

/**
 <p>[VPC only] The outbound rules associated with the security group.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubAwsEc2SecurityGroupIpPermission *> * _Nullable ipPermissionsEgress;

/**
 <p>The AWS account ID of the owner of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerId;

/**
 <p>[VPC only] The ID of the VPC for the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>An IP permission for an EC2 security group.</p>
 */
@interface AWSsecurityhubAwsEc2SecurityGroupIpPermission : AWSModel


/**
 <p>The start of the port range for the TCP and UDP protocols, or an ICMP/ICMPv6 type number.</p><p>A value of -1 indicates all ICMP/ICMPv6 types. If you specify all ICMP/ICMPv6 types, you must specify all codes. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fromPort;

/**
 <p>The IP protocol name (<code>tcp</code>, <code>udp</code>, <code>icmp</code>, <code>icmpv6</code>) or number.</p><p>[VPC only] Use <code>-1</code> to specify all protocols.</p><p>When authorizing security group rules, specifying -1 or a protocol number other than <code>tcp</code>, <code>udp</code>, <code>icmp</code>, or <code>icmpv6</code> allows traffic on all ports, regardless of any port range you specify.</p><p>For <code>tcp</code>, <code>udp</code>, and <code>icmp</code>, you must specify a port range.</p><p>For <code>icmpv6</code>, the port range is optional. If you omit the port range, traffic for all types and codes is allowed. </p>
 */
@property (nonatomic, strong) NSString * _Nullable ipProtocol;

/**
 <p>The IPv4 ranges.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubAwsEc2SecurityGroupIpRange *> * _Nullable ipRanges;

/**
 <p>The IPv6 ranges.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubAwsEc2SecurityGroupIpv6Range *> * _Nullable ipv6Ranges;

/**
 <p>[VPC only] The prefix list IDs for an AWS service. With outbound rules, this is the AWS service to access through a VPC endpoint from instances associated with the security group.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubAwsEc2SecurityGroupPrefixListId *> * _Nullable prefixListIds;

/**
 <p>The end of the port range for the TCP and UDP protocols, or an ICMP/ICMPv6 code.</p><p>A value of -1 indicates all ICMP/ICMPv6 codes. If you specify all ICMP/ICMPv6 types, you must specify all codes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable toPort;

/**
 <p>The security group and AWS account ID pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubAwsEc2SecurityGroupUserIdGroupPair *> * _Nullable userIdGroupPairs;

@end

/**
 <p>A range of IPv4 addresses.</p>
 */
@interface AWSsecurityhubAwsEc2SecurityGroupIpRange : AWSModel


/**
 <p>The IPv4 CIDR range. You can either specify either a CIDR range or a source security group, but not both. To specify a single IPv4 address, use the /32 prefix length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cidrIp;

@end

/**
 <p>A range of IPv6 addresses.</p>
 */
@interface AWSsecurityhubAwsEc2SecurityGroupIpv6Range : AWSModel


/**
 <p>The IPv6 CIDR range. You can either specify either a CIDR range or a source security group, but not both. To specify a single IPv6 address, use the /128 prefix length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cidrIpv6;

@end

/**
 <p>A prefix list ID.</p>
 */
@interface AWSsecurityhubAwsEc2SecurityGroupPrefixListId : AWSModel


/**
 <p>The ID of the prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefixListId;

@end

/**
 <p>A relationship between a security group and a user.</p>
 */
@interface AWSsecurityhubAwsEc2SecurityGroupUserIdGroupPair : AWSModel


/**
 <p>The ID of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>The name of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The status of a VPC peering connection, if applicable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable peeringStatus;

/**
 <p>The ID of an AWS account.</p><p>For a referenced security group in another VPC, the account ID of the referenced security group is returned in the response. If the referenced security group is deleted, this value is not returned.</p><p>[EC2-Classic] Required when adding or removing rules that reference a security group in another AWS. </p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

/**
 <p>The ID of the VPC for the referenced security group, if applicable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

/**
 <p>The ID of the VPC peering connection, if applicable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcPeeringConnectionId;

@end

/**
 <p>Information about an Elasticsearch domain.</p>
 */
@interface AWSsecurityhubAwsElasticsearchDomainDetails : AWSModel


/**
 <p>IAM policy document specifying the access policies for the new Amazon ES domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPolicies;

/**
 <p>Additional options for the domain endpoint.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsElasticsearchDomainDomainEndpointOptions * _Nullable domainEndpointOptions;

/**
 <p>Unique identifier for an Amazon ES domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainId;

/**
 <p>Name of an Amazon ES domain.</p><p>Domain names are unique across all domains owned by the same account within an AWS Region.</p><p>Domain names must start with a lowercase letter and must be between 3 and 28 characters.</p><p>Valid characters are a-z (lowercase only), 0-9, and – (hyphen). </p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>Elasticsearch version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable elasticsearchVersion;

/**
 <p>Details about the configuration for encryption at rest.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsElasticsearchDomainEncryptionAtRestOptions * _Nullable encryptionAtRestOptions;

/**
 <p>Domain-specific endpoint used to submit index, search, and data upload requests to an Amazon ES domain.</p><p>The endpoint is a service URL. </p>
 */
@property (nonatomic, strong) NSString * _Nullable endpoint;

/**
 <p>The key-value pair that exists if the Amazon ES domain uses VPC endpoints.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable endpoints;

/**
 <p>Details about the configuration for node-to-node encryption.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsElasticsearchDomainNodeToNodeEncryptionOptions * _Nullable nodeToNodeEncryptionOptions;

/**
 <p>Information that Amazon ES derives based on <code>VPCOptions</code> for the domain.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsElasticsearchDomainVPCOptions * _Nullable VPCOptions;

@end

/**
 <p>Additional options for the domain endpoint, such as whether to require HTTPS for all traffic.</p>
 */
@interface AWSsecurityhubAwsElasticsearchDomainDomainEndpointOptions : AWSModel


/**
 <p>Whether to require that all traffic to the domain arrive over HTTPS.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enforceHTTPS;

/**
 <p>The TLS security policy to apply to the HTTPS endpoint of the Elasticsearch domain.</p><p>Valid values:</p><ul><li><p><code>Policy-Min-TLS-1-0-2019-07</code>, which supports TLSv1.0 and higher</p></li><li><p><code>Policy-Min-TLS-1-2-2019-07</code>, which only supports TLSv1.2</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable TLSSecurityPolicy;

@end

/**
 <p>Details about the configuration for encryption at rest.</p>
 */
@interface AWSsecurityhubAwsElasticsearchDomainEncryptionAtRestOptions : AWSModel


/**
 <p>Whether encryption at rest is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The KMS key ID. Takes the form 1a2a3a4-1a2a-3a4a-5a6a-1a2a3a4a5a6a.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

@end

/**
 <p>Details about the configuration for node-to-node encryption.</p>
 */
@interface AWSsecurityhubAwsElasticsearchDomainNodeToNodeEncryptionOptions : AWSModel


/**
 <p>Whether node-to-node encryption is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 <p>Information that Amazon ES derives based on <code>VPCOptions</code> for the domain.</p>
 */
@interface AWSsecurityhubAwsElasticsearchDomainVPCOptions : AWSModel


/**
 <p>The list of Availability Zones associated with the VPC subnets.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 <p>The list of security group IDs associated with the VPC endpoints for the domain.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>A list of subnet IDs associated with the VPC endpoints for the domain.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>ID for the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable VPCId;

@end

/**
 <p>Information about a load balancer.</p>
 */
@interface AWSsecurityhubAwsElbv2LoadBalancerDetails : AWSModel


/**
 <p>The Availability Zones for the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubAvailabilityZone *> * _Nullable availabilityZones;

/**
 <p>The ID of the Amazon Route 53 hosted zone associated with the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable canonicalHostedZoneId;

/**
 <p>The date and time the load balancer was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdTime;

/**
 <p>The public DNS name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DNSName;

/**
 <p>The type of IP addresses used by the subnets for your load balancer. The possible values are <code>ipv4</code> (for IPv4 addresses) and <code>dualstack</code> (for IPv4 and IPv6 addresses).</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipAddressType;

/**
 <p>The nodes of an Internet-facing load balancer have public IP addresses.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheme;

/**
 <p>The IDs of the security groups for the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

/**
 <p>The state of the load balancer.</p>
 */
@property (nonatomic, strong) AWSsecurityhubLoadBalancerState * _Nullable state;

/**
 <p>The type of load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

/**
 <p>The ID of the VPC for the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>IAM access key details related to a finding.</p>
 */
@interface AWSsecurityhubAwsIamAccessKeyDetails : AWSModel


/**
 <p>The creation date/time of the IAM access key related to a finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdAt;

/**
 <p>The ID of the principal associated with an access key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principalId;

/**
 <p>The name of the principal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principalName;

/**
 <p>The type of principal associated with an access key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principalType;

/**
 <p>The status of the IAM access key related to a finding.</p>
 */
@property (nonatomic, assign) AWSsecurityhubAwsIamAccessKeyStatus status;

/**
 <p>The user associated with the IAM access key related to a finding.</p><p>The <code>UserName</code> parameter has been replaced with the <code>PrincipalName</code> parameter because access keys can also be assigned to principals that are not IAM users.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains information about an IAM role, including all of the role's policies.</p>
 */
@interface AWSsecurityhubAwsIamRoleDetails : AWSModel


/**
 <p>The trust policy that grants permission to assume the role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assumeRolePolicyDocument;

/**
 <p>The date and time, in ISO 8601 date-time format, when the role was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createDate;

/**
 <p>The maximum session duration (in seconds) that you want to set for the specified role.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSessionDuration;

/**
 <p>The path to the role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The stable and unique string identifying the role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleId;

/**
 <p>The friendly name that identifies the role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 <p>Contains metadata about a customer master key (CMK).</p>
 */
@interface AWSsecurityhubAwsKmsKeyDetails : AWSModel


/**
 <p>The twelve-digit account ID of the AWS account that owns the CMK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable AWSAccountId;

/**
 <p>The date and time when the CMK was created.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable creationDate;

/**
 <p>The globally unique identifier for the CMK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The manager of the CMK. CMKs in your AWS account are either customer managed or AWS managed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyManager;

/**
 <p>The state of the CMK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyState;

/**
 <p>The source of the CMK's key material.</p><p>When this value is <code>AWS_KMS</code>, AWS KMS created the key material.</p><p>When this value is <code>EXTERNAL</code>, the key material was imported from your existing key management infrastructure or the CMK lacks key material.</p><p>When this value is <code>AWS_CLOUDHSM</code>, the key material was created in the AWS CloudHSM cluster associated with a custom key store.</p>
 */
@property (nonatomic, strong) NSString * _Nullable origin;

@end

/**
 <p>The code for the Lambda function. You can specify either an object in Amazon S3, or upload a deployment package directly.</p>
 */
@interface AWSsecurityhubAwsLambdaFunctionCode : AWSModel


/**
 <p>An Amazon S3 bucket in the same AWS Region as your function. The bucket can be in a different AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

/**
 <p>The Amazon S3 key of the deployment package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Key;

/**
 <p>For versioned objects, the version of the deployment package object to use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3ObjectVersion;

/**
 <p>The base64-encoded contents of the deployment package. AWS SDK and AWS CLI clients handle the encoding for you.</p>
 */
@property (nonatomic, strong) NSString * _Nullable zipFile;

@end

/**
 <p>The dead-letter queue for failed asynchronous invocations.</p>
 */
@interface AWSsecurityhubAwsLambdaFunctionDeadLetterConfig : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of an Amazon SQS queue or Amazon SNS topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

@end

/**
 <p>Details about a function's configuration.</p>
 */
@interface AWSsecurityhubAwsLambdaFunctionDetails : AWSModel


/**
 <p>An <code>AwsLambdaFunctionCode</code> object.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsLambdaFunctionCode * _Nullable code;

/**
 <p>The SHA256 hash of the function's deployment package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeSha256;

/**
 <p>The function's dead letter queue.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsLambdaFunctionDeadLetterConfig * _Nullable deadLetterConfig;

/**
 <p>The function's environment variables.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsLambdaFunctionEnvironment * _Nullable environment;

/**
 <p>The name of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The function that Lambda calls to begin executing your function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable handler;

/**
 <p>The KMS key that's used to encrypt the function's environment variables. This key is only returned if you've configured a customer managed CMK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyArn;

/**
 <p>The date and time that the function was last updated, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModified;

/**
 <p>The function's layers.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubAwsLambdaFunctionLayer *> * _Nullable layers;

/**
 <p>For Lambda@Edge functions, the ARN of the master function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterArn;

/**
 <p>The memory that's allocated to the function.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable memorySize;

/**
 <p>The latest updated revision of the function or alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>The function's execution role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>The runtime environment for the Lambda function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable runtime;

/**
 <p>The amount of time that Lambda allows a function to run before stopping it.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

/**
 <p>The function's AWS X-Ray tracing configuration.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsLambdaFunctionTracingConfig * _Nullable tracingConfig;

/**
 <p>The version of the Lambda function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

/**
 <p>The function's networking configuration.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsLambdaFunctionVpcConfig * _Nullable vpcConfig;

@end

/**
 <p>A function's environment variable settings.</p>
 */
@interface AWSsecurityhubAwsLambdaFunctionEnvironment : AWSModel


/**
 <p>An <code>AwsLambdaFunctionEnvironmentError</code> object.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsLambdaFunctionEnvironmentError * _Nullable error;

/**
 <p>Environment variable key-value pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable variables;

@end

/**
 <p>Error messages for environment variables that couldn't be applied.</p>
 */
@interface AWSsecurityhubAwsLambdaFunctionEnvironmentError : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>The error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>An AWS Lambda layer.</p>
 */
@interface AWSsecurityhubAwsLambdaFunctionLayer : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the function layer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The size of the layer archive in bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable codeSize;

@end

/**
 <p>The function's AWS X-Ray tracing configuration.</p>
 */
@interface AWSsecurityhubAwsLambdaFunctionTracingConfig : AWSModel


/**
 <p>The tracing mode.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mode;

@end

/**
 <p>The VPC security groups and subnets that are attached to a Lambda function. For more information, see VPC Settings.</p>
 */
@interface AWSsecurityhubAwsLambdaFunctionVpcConfig : AWSModel


/**
 <p>A list of VPC security groups IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>A list of VPC subnet IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Details about a Lambda layer version.</p>
 */
@interface AWSsecurityhubAwsLambdaLayerVersionDetails : AWSModel


/**
 <p>The layer's compatible runtimes. Maximum number of 5 items.</p><p>Valid values: <code>nodejs10.x</code> | <code>nodejs12.x</code> | <code>java8</code> | <code>java11</code> | <code>python2.7</code> | <code>python3.6</code> | <code>python3.7</code> | <code>python3.8</code> | <code>dotnetcore1.0</code> | <code>dotnetcore2.1</code> | <code>go1.x</code> | <code>ruby2.5</code> | <code>provided</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable compatibleRuntimes;

/**
 <p>The date that the version was created, in ISO 8601 format. For example, 2018-11-27T15:10:45.123+0000. </p>
 */
@property (nonatomic, strong) NSString * _Nullable createdDate;

/**
 <p>The version number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>An AWS Identity and Access Management (IAM) role associated with the DB instance.</p>
 */
@interface AWSsecurityhubAwsRdsDbInstanceAssociatedRole : AWSModel


/**
 <p>The name of the feature associated with the IAM)role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable featureName;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role that is associated with the DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Describes the state of the association between the IAM role and the DB instance. The <code>Status</code> property returns one of the following values:</p><ul><li><p><code>ACTIVE</code> - the IAM role ARN is associated with the DB instance and can be used to access other AWS services on your behalf.</p></li><li><p><code>PENDING</code> - the IAM role ARN is being associated with the DB instance.</p></li><li><p><code>INVALID</code> - the IAM role ARN is associated with the DB instance, but the DB instance is unable to assume the IAM role in order to access other AWS services on your behalf. </p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Contains the details of an Amazon RDS DB instance.</p>
 */
@interface AWSsecurityhubAwsRdsDbInstanceDetails : AWSModel


/**
 <p>The AWS Identity and Access Management (IAM) roles associated with the DB instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubAwsRdsDbInstanceAssociatedRole *> * _Nullable associatedRoles;

/**
 <p>The identifier of the CA certificate for this DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable CACertificateIdentifier;

/**
 <p>If the DB instance is a member of a DB cluster, contains the name of the DB cluster that the DB instance is a member of.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>Contains the name of the compute and memory capacity class of the DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceClass;

/**
 <p>Contains a user-supplied database identifier. This identifier is the unique key that identifies a DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p>The meaning of this parameter differs according to the database engine you use.</p><p><b>MySQL, MariaDB, SQL Server, PostgreSQL</b></p><p>Contains the name of the initial database of this instance that was provided at create time, if one was specified when the DB instance was created. This same name is returned for the life of the DB instance.</p><p><b>Oracle</b></p><p>Contains the Oracle System ID (SID) of the created DB instance. Not shown when the returned parameters do not apply to an Oracle DB instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable DBName;

/**
 <p>Specifies the port that the DB instance listens on. If the DB instance is part of a DB cluster, this can be a different port than the DB cluster port.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dbInstancePort;

/**
 <p>The AWS Region-unique, immutable identifier for the DB instance. This identifier is found in AWS CloudTrail log entries whenever the AWS KMS key for the DB instance is accessed. </p>
 */
@property (nonatomic, strong) NSString * _Nullable dbiResourceId;

/**
 <p>Indicates whether the DB instance has deletion protection enabled.</p><p>When deletion protection is enabled, the database cannot be deleted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p>Specifies the connection endpoint.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsRdsDbInstanceEndpoint * _Nullable endpoint;

/**
 <p>Provides the name of the database engine to use for this DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>Indicates the database engine version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>True if mapping of AWS Identity and Access Management (IAM) accounts to database accounts is enabled, and otherwise false.</p><p>IAM database authentication can be enabled for the following database engines.</p><ul><li><p>For MySQL 5.6, minor version 5.6.34 or higher</p></li><li><p>For MySQL 5.7, minor version 5.7.16 or higher</p></li><li><p>Aurora 5.6 or higher</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable IAMDatabaseAuthenticationEnabled;

/**
 <p>Provides the date and time the DB instance was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceCreateTime;

/**
 <p>If <code>StorageEncrypted</code> is true, the AWS KMS key identifier for the encrypted DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>Specifies the accessibility options for the DB instance.</p><p>A value of true specifies an Internet-facing instance with a publicly resolvable DNS name, which resolves to a public IP address.</p><p>A value of false specifies an internal instance with a DNS name that resolves to a private IP address. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publiclyAccessible;

/**
 <p>Specifies whether the DB instance is encrypted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable storageEncrypted;

/**
 <p>The ARN from the key store with which the instance is associated for TDE encryption.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tdeCredentialArn;

/**
 <p>A list of VPC security groups that the DB instance belongs to.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubAwsRdsDbInstanceVpcSecurityGroup *> * _Nullable vpcSecurityGroups;

@end

/**
 <p>Specifies the connection endpoint.</p>
 */
@interface AWSsecurityhubAwsRdsDbInstanceEndpoint : AWSModel


/**
 <p>Specifies the DNS address of the DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 <p>Specifies the ID that Amazon Route 53 assigns when you create a hosted zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

/**
 <p>Specifies the port that the database engine is listening on.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

@end

/**
 <p>A VPC security groups that the DB instance belongs to.</p>
 */
@interface AWSsecurityhubAwsRdsDbInstanceVpcSecurityGroup : AWSModel


/**
 <p>The status of the VPC security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The name of the VPC security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcSecurityGroupId;

@end

/**
 <p>The details of an Amazon S3 bucket.</p>
 */
@interface AWSsecurityhubAwsS3BucketDetails : AWSModel


/**
 <p>The date and time when the S3 bucket was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdAt;

/**
 <p>The canonical user ID of the owner of the S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerId;

/**
 <p>The display name of the owner of the S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerName;

/**
 <p>The encryption rules that are applied to the S3 bucket.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsS3BucketServerSideEncryptionConfiguration * _Nullable serverSideEncryptionConfiguration;

@end

/**
 <p>Specifies the default server-side encryption to apply to new objects in the bucket.</p>
 */
@interface AWSsecurityhubAwsS3BucketServerSideEncryptionByDefault : AWSModel


/**
 <p>AWS KMS customer master key (CMK) ID to use for the default encryption.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSMasterKeyID;

/**
 <p>Server-side encryption algorithm to use for the default encryption.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEAlgorithm;

@end

/**
 <p>The encryption configuration for the S3 bucket.</p>
 */
@interface AWSsecurityhubAwsS3BucketServerSideEncryptionConfiguration : AWSModel


/**
 <p>The encryption rules that are applied to the S3 bucket.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubAwsS3BucketServerSideEncryptionRule *> * _Nullable rules;

@end

/**
 <p>An encryption rule to apply to the S3 bucket.</p>
 */
@interface AWSsecurityhubAwsS3BucketServerSideEncryptionRule : AWSModel


/**
 <p>Specifies the default server-side encryption to apply to new objects in the bucket. If a <code>PUT</code> Object request doesn't specify any server-side encryption, this default encryption is applied.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsS3BucketServerSideEncryptionByDefault * _Nullable applyServerSideEncryptionByDefault;

@end

/**
 <p>Details about an AWS S3 object.</p>
 */
@interface AWSsecurityhubAwsS3ObjectDetails : AWSModel


/**
 <p>A standard MIME type describing the format of the object data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The opaque identifier assigned by a web server to a specific version of a resource found at a URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>The date and time when the object was last modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModified;

/**
 <p>The identifier of the AWS Key Management Service (AWS KMS) symmetric customer managed customer master key (CMK) that was used for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>If the object is stored using server-side encryption, the value of the server-side encryption algorithm used when storing this object in Amazon S3.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverSideEncryption;

/**
 <p>The version of the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>Provides consistent format for the contents of the Security Hub-aggregated findings. <code>AwsSecurityFinding</code> format enables you to share findings between AWS security services and third-party solutions, and security standards checks.</p><note><p>A finding is a potential security issue generated either by AWS services (Amazon GuardDuty, Amazon Inspector, and Amazon Macie) or by the integrated third-party solutions and standards checks.</p></note>
 Required parameters: [SchemaVersion, Id, ProductArn, GeneratorId, AwsAccountId, Types, CreatedAt, UpdatedAt, Severity, Title, Description, Resources]
 */
@interface AWSsecurityhubAwsSecurityFinding : AWSModel


/**
 <p>The AWS account ID that a finding is generated in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>This data type is exclusive to findings that are generated as the result of a check run against a specific rule in a supported security standard, such as CIS AWS Foundations. Contains security standard-related finding details.</p>
 */
@property (nonatomic, strong) AWSsecurityhubCompliance * _Nullable compliance;

/**
 <p>A finding's confidence. Confidence is defined as the likelihood that a finding accurately identifies the behavior or issue that it was intended to identify.</p><p>Confidence is scored on a 0-100 basis using a ratio scale, where 0 means zero percent confidence and 100 means 100 percent confidence.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>An ISO8601-formatted timestamp that indicates when the security-findings provider created the potential security issue that a finding captured.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdAt;

/**
 <p>The level of importance assigned to the resources associated with the finding.</p><p>A score of 0 means that the underlying resources have no criticality, and a score of 100 is reserved for the most critical resources.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable criticality;

/**
 <p>A finding's description.</p><note><p>In this release, <code>Description</code> is a required property.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>An ISO8601-formatted timestamp that indicates when the security-findings provider first observed the potential security issue that a finding captured.</p>
 */
@property (nonatomic, strong) NSString * _Nullable firstObservedAt;

/**
 <p>The identifier for the solution-specific component (a discrete unit of logic) that generated a finding. In various security-findings providers' solutions, this generator can be called a rule, a check, a detector, a plug-in, etc. </p>
 */
@property (nonatomic, strong) NSString * _Nullable generatorId;

/**
 <p>The security findings provider-specific identifier for a finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>An ISO8601-formatted timestamp that indicates when the security-findings provider most recently observed the potential security issue that a finding captured.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastObservedAt;

/**
 <p>A list of malware related to a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubMalware *> * _Nullable malware;

/**
 <p>The details of network-related information about a finding.</p>
 */
@property (nonatomic, strong) AWSsecurityhubNetwork * _Nullable network;

/**
 <p>A user-defined note added to a finding.</p>
 */
@property (nonatomic, strong) AWSsecurityhubNote * _Nullable note;

/**
 <p>The details of process-related information about a finding.</p>
 */
@property (nonatomic, strong) AWSsecurityhubProcessDetails * _Nullable process;

/**
 <p>The ARN generated by Security Hub that uniquely identifies a product that generates findings. This can be the ARN for a third-party product that is integrated with Security Hub, or the ARN for a custom integration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productArn;

/**
 <p>A data type where security-findings providers can include additional solution-specific details that aren't part of the defined <code>AwsSecurityFinding</code> format.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable productFields;

/**
 <p>The record state of a finding.</p>
 */
@property (nonatomic, assign) AWSsecurityhubRecordState recordState;

/**
 <p>A list of related findings.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubRelatedFinding *> * _Nullable relatedFindings;

/**
 <p>A data type that describes the remediation options for a finding.</p>
 */
@property (nonatomic, strong) AWSsecurityhubRemediation * _Nullable remediation;

/**
 <p>A set of resource data types that describe the resources that the finding refers to.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubResource *> * _Nullable resources;

/**
 <p>The schema version that a finding is formatted for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

/**
 <p>A finding's severity.</p>
 */
@property (nonatomic, strong) AWSsecurityhubSeverity * _Nullable severity;

/**
 <p>A URL that links to a page about the current finding in the security-findings provider's solution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceUrl;

/**
 <p>Threat intelligence details related to a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubThreatIntelIndicator *> * _Nullable threatIntelIndicators;

/**
 <p>A finding's title.</p><note><p>In this release, <code>Title</code> is a required property.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 <p>One or more finding types in the format of <code>namespace/category/classifier</code> that classify a finding.</p><p>Valid namespace values are: Software and Configuration Checks | TTPs | Effects | Unusual Behaviors | Sensitive Data Identifications</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable types;

/**
 <p>An ISO8601-formatted timestamp that indicates when the security-findings provider last updated the finding record. </p>
 */
@property (nonatomic, strong) NSString * _Nullable updatedAt;

/**
 <p>A list of name/value string pairs associated with the finding. These are custom, user-defined fields added to a finding. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable userDefinedFields;

/**
 <p>Indicates the veracity of a finding. </p>
 */
@property (nonatomic, assign) AWSsecurityhubVerificationState verificationState;

/**
 <p>Provides information about the status of the investigation into a finding.</p>
 */
@property (nonatomic, strong) AWSsecurityhubWorkflow * _Nullable workflow;

/**
 <p>The workflow state of a finding. </p>
 */
@property (nonatomic, assign) AWSsecurityhubWorkflowState workflowState;

@end

/**
 <p>A collection of attributes that are applied to all active Security Hub-aggregated findings and that result in a subset of findings that are included in this insight.</p>
 */
@interface AWSsecurityhubAwsSecurityFindingFilters : AWSModel


/**
 <p>The AWS account ID that a finding is generated in.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable awsAccountId;

/**
 <p>The name of the findings provider (company) that owns the solution (product) that generates findings.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable companyName;

/**
 <p>Exclusive to findings that are generated as the result of a check run against a specific rule in a supported standard, such as CIS AWS Foundations. Contains security standard-related finding details.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable complianceStatus;

/**
 <p>A finding's confidence. Confidence is defined as the likelihood that a finding accurately identifies the behavior or issue that it was intended to identify.</p><p>Confidence is scored on a 0-100 basis using a ratio scale, where 0 means zero percent confidence and 100 means 100 percent confidence.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubNumberFilter *> * _Nullable confidence;

/**
 <p>An ISO8601-formatted timestamp that indicates when the security-findings provider captured the potential security issue that a finding captured.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubDateFilter *> * _Nullable createdAt;

/**
 <p>The level of importance assigned to the resources associated with the finding.</p><p>A score of 0 means that the underlying resources have no criticality, and a score of 100 is reserved for the most critical resources.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubNumberFilter *> * _Nullable criticality;

/**
 <p>A finding's description.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable detail;

/**
 <p>An ISO8601-formatted timestamp that indicates when the security-findings provider first observed the potential security issue that a finding captured.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubDateFilter *> * _Nullable firstObservedAt;

/**
 <p>The identifier for the solution-specific component (a discrete unit of logic) that generated a finding. In various security-findings providers' solutions, this generator can be called a rule, a check, a detector, a plug-in, etc.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable generatorId;

/**
 <p>The security findings provider-specific identifier for a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable identifier;

/**
 <p>A keyword for a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubKeywordFilter *> * _Nullable keyword;

/**
 <p>An ISO8601-formatted timestamp that indicates when the security-findings provider most recently observed the potential security issue that a finding captured.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubDateFilter *> * _Nullable lastObservedAt;

/**
 <p>The name of the malware that was observed.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable malwareName;

/**
 <p>The filesystem path of the malware that was observed.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable malwarePath;

/**
 <p>The state of the malware that was observed.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable malwareState;

/**
 <p>The type of the malware that was observed.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable malwareType;

/**
 <p>The destination domain of network-related information about a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable networkDestinationDomain;

/**
 <p>The destination IPv4 address of network-related information about a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubIpFilter *> * _Nullable networkDestinationIpV4;

/**
 <p>The destination IPv6 address of network-related information about a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubIpFilter *> * _Nullable networkDestinationIpV6;

/**
 <p>The destination port of network-related information about a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubNumberFilter *> * _Nullable networkDestinationPort;

/**
 <p>Indicates the direction of network traffic associated with a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable networkDirection;

/**
 <p>The protocol of network-related information about a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable networkProtocol;

/**
 <p>The source domain of network-related information about a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable networkSourceDomain;

/**
 <p>The source IPv4 address of network-related information about a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubIpFilter *> * _Nullable networkSourceIpV4;

/**
 <p>The source IPv6 address of network-related information about a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubIpFilter *> * _Nullable networkSourceIpV6;

/**
 <p>The source media access control (MAC) address of network-related information about a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable networkSourceMac;

/**
 <p>The source port of network-related information about a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubNumberFilter *> * _Nullable networkSourcePort;

/**
 <p>The text of a note.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable noteText;

/**
 <p>The timestamp of when the note was updated.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubDateFilter *> * _Nullable noteUpdatedAt;

/**
 <p>The principal that created a note.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable noteUpdatedBy;

/**
 <p>The date/time that the process was launched.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubDateFilter *> * _Nullable processLaunchedAt;

/**
 <p>The name of the process.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable processName;

/**
 <p>The parent process ID.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubNumberFilter *> * _Nullable processParentPid;

/**
 <p>The path to the process executable.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable processPath;

/**
 <p>The process ID.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubNumberFilter *> * _Nullable processPid;

/**
 <p>The date/time that the process was terminated.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubDateFilter *> * _Nullable processTerminatedAt;

/**
 <p>The ARN generated by Security Hub that uniquely identifies a third-party company (security findings provider) after this provider's product (solution that generates findings) is registered with Security Hub.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable productArn;

/**
 <p>A data type where security-findings providers can include additional solution-specific details that aren't part of the defined <code>AwsSecurityFinding</code> format.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubMapFilter *> * _Nullable productFields;

/**
 <p>The name of the solution (product) that generates findings.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable productName;

/**
 <p>The recommendation of what to do about the issue described in a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable recommendationText;

/**
 <p>The updated record state for the finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable recordState;

/**
 <p>The solution-generated identifier for a related finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable relatedFindingsId;

/**
 <p>The ARN of the solution that generated a related finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable relatedFindingsProductArn;

/**
 <p>The IAM profile ARN of the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable resourceAwsEc2InstanceIamInstanceProfileArn;

/**
 <p>The Amazon Machine Image (AMI) ID of the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable resourceAwsEc2InstanceImageId;

/**
 <p>The IPv4 addresses associated with the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubIpFilter *> * _Nullable resourceAwsEc2InstanceIpV4Addresses;

/**
 <p>The IPv6 addresses associated with the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubIpFilter *> * _Nullable resourceAwsEc2InstanceIpV6Addresses;

/**
 <p>The key name associated with the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable resourceAwsEc2InstanceKeyName;

/**
 <p>The date and time the instance was launched.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubDateFilter *> * _Nullable resourceAwsEc2InstanceLaunchedAt;

/**
 <p>The identifier of the subnet that the instance was launched in.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable resourceAwsEc2InstanceSubnetId;

/**
 <p>The instance type of the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable resourceAwsEc2InstanceType;

/**
 <p>The identifier of the VPC that the instance was launched in.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable resourceAwsEc2InstanceVpcId;

/**
 <p>The creation date/time of the IAM access key related to a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubDateFilter *> * _Nullable resourceAwsIamAccessKeyCreatedAt;

/**
 <p>The status of the IAM access key related to a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable resourceAwsIamAccessKeyStatus;

/**
 <p>The user associated with the IAM access key related to a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable resourceAwsIamAccessKeyUserName;

/**
 <p>The canonical user ID of the owner of the S3 bucket.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable resourceAwsS3BucketOwnerId;

/**
 <p>The display name of the owner of the S3 bucket.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable resourceAwsS3BucketOwnerName;

/**
 <p>The identifier of the image related to a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable resourceContainerImageId;

/**
 <p>The name of the image related to a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable resourceContainerImageName;

/**
 <p>The date/time that the container was started.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubDateFilter *> * _Nullable resourceContainerLaunchedAt;

/**
 <p>The name of the container related to a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable resourceContainerName;

/**
 <p>The details of a resource that doesn't have a specific subfield for the resource type defined.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubMapFilter *> * _Nullable resourceDetailsOther;

/**
 <p>The canonical identifier for the given resource type.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable resourceId;

/**
 <p>The canonical AWS partition name that the Region is assigned to.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable resourcePartition;

/**
 <p>The canonical AWS external Region name where this resource is located.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable resourceRegion;

/**
 <p>A list of AWS tags associated with a resource at the time the finding was processed.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubMapFilter *> * _Nullable resourceTags;

/**
 <p>Specifies the type of the resource that details are provided for.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable resourceType;

/**
 <p>The label of a finding's severity.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable severityLabel;

/**
 <p>The normalized severity of a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubNumberFilter *> * _Nullable severityNormalized;

/**
 <p>The native severity as defined by the security-findings provider's solution that generated the finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubNumberFilter *> * _Nullable severityProduct;

/**
 <p>A URL that links to a page about the current finding in the security-findings provider's solution.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable sourceUrl;

/**
 <p>The category of a threat intelligence indicator.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable threatIntelIndicatorCategory;

/**
 <p>The date/time of the last observation of a threat intelligence indicator.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubDateFilter *> * _Nullable threatIntelIndicatorLastObservedAt;

/**
 <p>The source of the threat intelligence.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable threatIntelIndicatorSource;

/**
 <p>The URL for more details from the source of the threat intelligence.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable threatIntelIndicatorSourceUrl;

/**
 <p>The type of a threat intelligence indicator.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable threatIntelIndicatorType;

/**
 <p>The value of a threat intelligence indicator.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable threatIntelIndicatorValue;

/**
 <p>A finding's title.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable title;

/**
 <p>A finding type in the format of <code>namespace/category/classifier</code> that classifies a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable types;

/**
 <p>An ISO8601-formatted timestamp that indicates when the security-findings provider last updated the finding record. </p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubDateFilter *> * _Nullable updatedAt;

/**
 <p>A list of name/value string pairs associated with the finding. These are custom, user-defined fields added to a finding. </p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubMapFilter *> * _Nullable userDefinedFields;

/**
 <p>The veracity of a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable verificationState;

/**
 <p>The workflow state of a finding.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable workflowState;

/**
 <p>The status of the investigation into a finding. Allowed values are the following.</p><ul><li><p><code>NEW</code> - The initial state of a finding, before it is reviewed.</p></li><li><p><code>NOTIFIED</code> - Indicates that the resource owner has been notified about the security issue. Used when the initial reviewer is not the resource owner, and needs intervention from the resource owner.</p></li><li><p><code>SUPPRESSED</code> - The finding will not be reviewed again and will not be acted upon.</p></li><li><p><code>RESOLVED</code> - The finding was reviewed and remediated and is now considered resolved. </p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStringFilter *> * _Nullable workflowStatus;

@end

/**
 <p>Identifies a finding to update using <code>BatchUpdateFindings</code>.</p>
 Required parameters: [Id, ProductArn]
 */
@interface AWSsecurityhubAwsSecurityFindingIdentifier : AWSModel


/**
 <p>The identifier of the finding that was specified by the finding provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The ARN generated by Security Hub that uniquely identifies a product that generates findings. This can be the ARN for a third-party product that is integrated with Security Hub, or the ARN for a custom integration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productArn;

@end

/**
 <p>A wrapper type for the topic's Amazon Resource Name (ARN).</p>
 */
@interface AWSsecurityhubAwsSnsTopicDetails : AWSModel


/**
 <p>The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsMasterKeyId;

/**
 <p>The subscription's owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>Subscription is an embedded property that describes the subscription endpoints of an Amazon SNS topic.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubAwsSnsTopicSubscription *> * _Nullable subscription;

/**
 <p>The name of the topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicName;

@end

/**
 <p>A wrapper type for the attributes of an Amazon SNS subscription.</p>
 */
@interface AWSsecurityhubAwsSnsTopicSubscription : AWSModel


/**
 <p>The subscription's endpoint (format depends on the protocol).</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpoint;

/**
 <p>The subscription's protocol.</p>
 */
@property (nonatomic, strong) NSString * _Nullable protocols;

@end

/**
 <p>Data about a queue.</p>
 */
@interface AWSsecurityhubAwsSqsQueueDetails : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the dead-letter queue to which Amazon SQS moves messages after the value of <code>maxReceiveCount</code> is exceeded. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deadLetterTargetArn;

/**
 <p>The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable kmsDataKeyReusePeriodSeconds;

/**
 <p>The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsMasterKeyId;

/**
 <p>The name of the new queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueName;

@end

/**
 <p>Details about a WAF WebACL.</p>
 */
@interface AWSsecurityhubAwsWafWebAclDetails : AWSModel


/**
 <p>The action to perform if none of the Rules contained in the WebACL match.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultAction;

/**
 <p>A friendly name or description of the WebACL. You can't change the name of a WebACL after you create it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>An array that contains the action for each rule in a WebACL, the priority of the rule, and the ID of the rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubAwsWafWebAclRule *> * _Nullable rules;

/**
 <p>A unique identifier for a WebACL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable webAclId;

@end

/**
 <p>Details for a rule in a WAF WebACL.</p>
 */
@interface AWSsecurityhubAwsWafWebAclRule : AWSModel


/**
 <p>Specifies the action that CloudFront or AWS WAF takes when a web request matches the conditions in the Rule. </p>
 */
@property (nonatomic, strong) AWSsecurityhubWafAction * _Nullable action;

/**
 <p>Rules to exclude from a rule group.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubWafExcludedRule *> * _Nullable excludedRules;

/**
 <p>Use the <code>OverrideAction</code> to test your RuleGroup.</p><p>Any rule in a RuleGroup can potentially block a request. If you set the <code>OverrideAction</code> to <code>None</code>, the RuleGroup blocks a request if any individual rule in the RuleGroup matches the request and is configured to block that request.</p><p>However, if you first want to test the RuleGroup, set the <code>OverrideAction</code> to <code>Count</code>. The RuleGroup then overrides any block action specified by individual rules contained within the group. Instead of blocking matching requests, those requests are counted.</p><p><code>ActivatedRule</code>|<code>OverrideAction</code> applies only when updating or adding a RuleGroup to a WebACL. In this case you do not use <code>ActivatedRule</code>|<code>Action</code>. For all other update requests, <code>ActivatedRule</code>|<code>Action</code> is used instead of <code>ActivatedRule</code>|<code>OverrideAction</code>. </p>
 */
@property (nonatomic, strong) AWSsecurityhubWafOverrideAction * _Nullable overrideAction;

/**
 <p>Specifies the order in which the Rules in a WebACL are evaluated. Rules with a lower value for Priority are evaluated before Rules with a higher value. The value must be a unique integer. If you add multiple Rules to a WebACL, the values do not need to be consecutive.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>The identifier for a Rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

/**
 <p>The rule type.</p><p>Valid values: <code>REGULAR</code> | <code>RATE_BASED</code> | <code>GROUP</code></p><p>The default is <code>REGULAR</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 
 */
@interface AWSsecurityhubBatchDisableStandardsRequest : AWSRequest


/**
 <p>The ARNs of the standards subscriptions to disable.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable standardsSubscriptionArns;

@end

/**
 
 */
@interface AWSsecurityhubBatchDisableStandardsResponse : AWSModel


/**
 <p>The details of the standards subscriptions that were disabled.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStandardsSubscription *> * _Nullable standardsSubscriptions;

@end

/**
 
 */
@interface AWSsecurityhubBatchEnableStandardsRequest : AWSRequest


/**
 <p>The list of standards checks to enable.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStandardsSubscriptionRequest *> * _Nullable standardsSubscriptionRequests;

@end

/**
 
 */
@interface AWSsecurityhubBatchEnableStandardsResponse : AWSModel


/**
 <p>The details of the standards subscriptions that were enabled.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStandardsSubscription *> * _Nullable standardsSubscriptions;

@end

/**
 
 */
@interface AWSsecurityhubBatchImportFindingsRequest : AWSRequest


/**
 <p>A list of findings to import. To successfully import a finding, it must follow the <a href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-findings-format.html">AWS Security Finding Format</a>. Maximum of 100 findings per request.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubAwsSecurityFinding *> * _Nullable findings;

@end

/**
 
 */
@interface AWSsecurityhubBatchImportFindingsResponse : AWSModel


/**
 <p>The number of findings that failed to import.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failedCount;

/**
 <p>The list of findings that failed to import.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubImportFindingsError *> * _Nullable failedFindings;

/**
 <p>The number of findings that were successfully imported.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable successCount;

@end

/**
 
 */
@interface AWSsecurityhubBatchUpdateFindingsRequest : AWSRequest


/**
 <p>The updated value for the finding confidence. Confidence is defined as the likelihood that a finding accurately identifies the behavior or issue that it was intended to identify.</p><p>Confidence is scored on a 0-100 basis using a ratio scale, where 0 means zero percent confidence and 100 means 100 percent confidence.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>The updated value for the level of importance assigned to the resources associated with the findings.</p><p>A score of 0 means that the underlying resources have no criticality, and a score of 100 is reserved for the most critical resources. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable criticality;

/**
 <p>The list of findings to update. <code>BatchUpdateFindings</code> can be used to update up to 100 findings at a time.</p><p>For each finding, the list provides the finding identifier and the ARN of the finding provider.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubAwsSecurityFindingIdentifier *> * _Nullable findingIdentifiers;

/**
 <p>The updated note.</p>
 */
@property (nonatomic, strong) AWSsecurityhubNoteUpdate * _Nullable note;

/**
 <p>A list of findings that are related to the updated findings.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubRelatedFinding *> * _Nullable relatedFindings;

/**
 <p>Used to update the finding severity.</p>
 */
@property (nonatomic, strong) AWSsecurityhubSeverityUpdate * _Nullable severity;

/**
 <p>One or more finding types in the format of namespace/category/classifier that classify a finding.</p><p>Valid namespace values are as follows.</p><ul><li><p>Software and Configuration Checks</p></li><li><p>TTPs</p></li><li><p>Effects</p></li><li><p>Unusual Behaviors</p></li><li><p>Sensitive Data Identifications </p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable types;

/**
 <p>A list of name/value string pairs associated with the finding. These are custom, user-defined fields added to a finding.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable userDefinedFields;

/**
 <p>Indicates the veracity of a finding.</p><p>The available values for <code>VerificationState</code> are as follows.</p><ul><li><p><code>UNKNOWN</code> – The default disposition of a security finding</p></li><li><p><code>TRUE_POSITIVE</code> – The security finding is confirmed</p></li><li><p><code>FALSE_POSITIVE</code> – The security finding was determined to be a false alarm</p></li><li><p><code>BENIGN_POSITIVE</code> – A special case of <code>TRUE_POSITIVE</code> where the finding doesn't pose any threat, is expected, or both</p></li></ul>
 */
@property (nonatomic, assign) AWSsecurityhubVerificationState verificationState;

/**
 <p>Used to update the workflow status of a finding.</p><p>The workflow status indicates the progress of the investigation into the finding. </p>
 */
@property (nonatomic, strong) AWSsecurityhubWorkflowUpdate * _Nullable workflow;

@end

/**
 
 */
@interface AWSsecurityhubBatchUpdateFindingsResponse : AWSModel


/**
 <p>The list of findings that were updated successfully.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubAwsSecurityFindingIdentifier *> * _Nullable processedFindings;

/**
 <p>The list of findings that were not updated.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubBatchUpdateFindingsUnprocessedFinding *> * _Nullable unprocessedFindings;

@end

/**
 <p>A finding from a <code>BatchUpdateFindings</code> request that Security Hub was unable to update.</p>
 Required parameters: [FindingIdentifier, ErrorCode, ErrorMessage]
 */
@interface AWSsecurityhubBatchUpdateFindingsUnprocessedFinding : AWSModel


/**
 <p>The code associated with the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>The message associated with the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The identifier of the finding that was not updated.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsSecurityFindingIdentifier * _Nullable findingIdentifier;

@end

/**
 <p>Exclusive to findings that are generated as the result of a check run against a specific rule in a supported security standard, such as CIS AWS Foundations. Contains security standard-related finding details.</p><p>Values include the following:</p><ul><li><p>Allowed values are the following:</p><ul><li><p><code>PASSED</code> - Standards check passed for all evaluated resources.</p></li><li><p><code>WARNING</code> - Some information is missing or this check is not supported given your configuration.</p></li><li><p><code>FAILED</code> - Standards check failed for at least one evaluated resource.</p></li><li><p><code>NOT_AVAILABLE</code> - Check could not be performed due to a service outage, API error, or because the result of the AWS Config evaluation was <code>NOT_APPLICABLE</code>. If the AWS Config evaluation result was <code> NOT_APPLICABLE</code>, then after 3 days, Security Hub automatically archives the finding.</p></li></ul></li></ul>
 */
@interface AWSsecurityhubCompliance : AWSModel


/**
 <p>List of requirements that are related to a standards control.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable relatedRequirements;

/**
 <p>The result of a standards check.</p>
 */
@property (nonatomic, assign) AWSsecurityhubComplianceStatus status;

@end

/**
 <p>Container details related to a finding.</p>
 */
@interface AWSsecurityhubContainerDetails : AWSModel


/**
 <p>The identifier of the image related to a finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

/**
 <p>The name of the image related to a finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageName;

/**
 <p>The date and time when the container started.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchedAt;

/**
 <p>The name of the container related to a finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSsecurityhubCreateActionTargetRequest : AWSRequest


/**
 <p>The description for the custom action target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID for the custom action target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the custom action target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSsecurityhubCreateActionTargetResponse : AWSModel


/**
 <p>The ARN for the custom action target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionTargetArn;

@end

/**
 
 */
@interface AWSsecurityhubCreateInsightRequest : AWSRequest


/**
 <p>One or more attributes used to filter the findings included in the insight. The insight only includes findings that match the criteria defined in the filters.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsSecurityFindingFilters * _Nullable filters;

/**
 <p>The attribute used to group the findings for the insight. The grouping attribute identifies the type of item that the insight applies to. For example, if an insight is grouped by resource identifier, then the insight produces a list of resource identifiers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupByAttribute;

/**
 <p>The name of the custom insight to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSsecurityhubCreateInsightResponse : AWSModel


/**
 <p>The ARN of the insight created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable insightArn;

@end

/**
 
 */
@interface AWSsecurityhubCreateMembersRequest : AWSRequest


/**
 <p>The list of accounts to associate with the Security Hub master account. For each account, the list includes the account ID and the email address.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubAccountDetails *> * _Nullable accountDetails;

@end

/**
 
 */
@interface AWSsecurityhubCreateMembersResponse : AWSModel


/**
 <p>The list of AWS accounts that were not processed. For each account, the list includes the account ID and the email address.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubResult *> * _Nullable unprocessedAccounts;

@end

/**
 <p>A date filter for querying findings.</p>
 */
@interface AWSsecurityhubDateFilter : AWSModel


/**
 <p>A date range for the date filter.</p>
 */
@property (nonatomic, strong) AWSsecurityhubDateRange * _Nullable dateRange;

/**
 <p>An end date for the date filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable end;

/**
 <p>A start date for the date filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable start;

@end

/**
 <p>A date range for the date filter.</p>
 */
@interface AWSsecurityhubDateRange : AWSModel


/**
 <p>A date range unit for the date filter.</p>
 */
@property (nonatomic, assign) AWSsecurityhubDateRangeUnit unit;

/**
 <p>A date range value for the date filter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 
 */
@interface AWSsecurityhubDeclineInvitationsRequest : AWSRequest


/**
 <p>The list of account IDs for the accounts from which to decline the invitations to Security Hub.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

@end

/**
 
 */
@interface AWSsecurityhubDeclineInvitationsResponse : AWSModel


/**
 <p>The list of AWS accounts that were not processed. For each account, the list includes the account ID and the email address.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubResult *> * _Nullable unprocessedAccounts;

@end

/**
 
 */
@interface AWSsecurityhubDeleteActionTargetRequest : AWSRequest


/**
 <p>The ARN of the custom action target to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionTargetArn;

@end

/**
 
 */
@interface AWSsecurityhubDeleteActionTargetResponse : AWSModel


/**
 <p>The ARN of the custom action target that was deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionTargetArn;

@end

/**
 
 */
@interface AWSsecurityhubDeleteInsightRequest : AWSRequest


/**
 <p>The ARN of the insight to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable insightArn;

@end

/**
 
 */
@interface AWSsecurityhubDeleteInsightResponse : AWSModel


/**
 <p>The ARN of the insight that was deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable insightArn;

@end

/**
 
 */
@interface AWSsecurityhubDeleteInvitationsRequest : AWSRequest


/**
 <p>The list of the account IDs that sent the invitations to delete.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

@end

/**
 
 */
@interface AWSsecurityhubDeleteInvitationsResponse : AWSModel


/**
 <p>The list of AWS accounts for which the invitations were not deleted. For each account, the list includes the account ID and the email address.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubResult *> * _Nullable unprocessedAccounts;

@end

/**
 
 */
@interface AWSsecurityhubDeleteMembersRequest : AWSRequest


/**
 <p>The list of account IDs for the member accounts to delete.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

@end

/**
 
 */
@interface AWSsecurityhubDeleteMembersResponse : AWSModel


/**
 <p>The list of AWS accounts that were not deleted. For each account, the list includes the account ID and the email address.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubResult *> * _Nullable unprocessedAccounts;

@end

/**
 
 */
@interface AWSsecurityhubDescribeActionTargetsRequest : AWSRequest


/**
 <p>A list of custom action target ARNs for the custom action targets to retrieve.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable actionTargetArns;

/**
 <p>The maximum number of results to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token that is required for pagination. On your first call to the <code>DescribeActionTargets</code> operation, set the value of this parameter to <code>NULL</code>.</p><p>For subsequent calls to the operation, to continue listing data, set the value of this parameter to the value returned from the previous response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSsecurityhubDescribeActionTargetsResponse : AWSModel


/**
 <p>A list of <code>ActionTarget</code> objects. Each object includes the <code>ActionTargetArn</code>, <code>Description</code>, and <code>Name</code> of a custom action target available in Security Hub.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubActionTarget *> * _Nullable actionTargets;

/**
 <p>The pagination token to use to request the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSsecurityhubDescribeHubRequest : AWSRequest


/**
 <p>The ARN of the Hub resource to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hubArn;

@end

/**
 
 */
@interface AWSsecurityhubDescribeHubResponse : AWSModel


/**
 <p>The ARN of the Hub resource that was retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hubArn;

/**
 <p>The date and time when Security Hub was enabled in the account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscribedAt;

@end

/**
 
 */
@interface AWSsecurityhubDescribeProductsRequest : AWSRequest


/**
 <p>The maximum number of results to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token that is required for pagination. On your first call to the <code>DescribeProducts</code> operation, set the value of this parameter to <code>NULL</code>.</p><p>For subsequent calls to the operation, to continue listing data, set the value of this parameter to the value returned from the previous response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSsecurityhubDescribeProductsResponse : AWSModel


/**
 <p>The pagination token to use to request the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of products, including details for each product.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubProduct *> * _Nullable products;

@end

/**
 
 */
@interface AWSsecurityhubDescribeStandardsControlsRequest : AWSRequest


/**
 <p>The maximum number of security standard controls to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token that is required for pagination. On your first call to the <code>DescribeStandardsControls</code> operation, set the value of this parameter to <code>NULL</code>.</p><p>For subsequent calls to the operation, to continue listing data, set the value of this parameter to the value returned from the previous response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ARN of a resource that represents your subscription to a supported standard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable standardsSubscriptionArn;

@end

/**
 
 */
@interface AWSsecurityhubDescribeStandardsControlsResponse : AWSModel


/**
 <p>A list of security standards controls.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStandardsControl *> * _Nullable controls;

/**
 <p>The pagination token to use to request the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSsecurityhubDescribeStandardsRequest : AWSRequest


/**
 <p>The maximum number of standards to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token that is required for pagination. On your first call to the <code>DescribeStandards</code> operation, set the value of this parameter to <code>NULL</code>.</p><p>For subsequent calls to the operation, to continue listing data, set the value of this parameter to the value returned from the previous response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSsecurityhubDescribeStandardsResponse : AWSModel


/**
 <p>The pagination token to use to request the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of available standards.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStandard *> * _Nullable standards;

@end

/**
 
 */
@interface AWSsecurityhubDisableImportFindingsForProductRequest : AWSRequest


/**
 <p>The ARN of the integrated product to disable the integration for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productSubscriptionArn;

@end

/**
 
 */
@interface AWSsecurityhubDisableImportFindingsForProductResponse : AWSModel


@end

/**
 
 */
@interface AWSsecurityhubDisableSecurityHubRequest : AWSRequest


@end

/**
 
 */
@interface AWSsecurityhubDisableSecurityHubResponse : AWSModel


@end

/**
 
 */
@interface AWSsecurityhubDisassociateFromMasterAccountRequest : AWSRequest


@end

/**
 
 */
@interface AWSsecurityhubDisassociateFromMasterAccountResponse : AWSModel


@end

/**
 
 */
@interface AWSsecurityhubDisassociateMembersRequest : AWSRequest


/**
 <p>The account IDs of the member accounts to disassociate from the master account.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

@end

/**
 
 */
@interface AWSsecurityhubDisassociateMembersResponse : AWSModel


@end

/**
 
 */
@interface AWSsecurityhubEnableImportFindingsForProductRequest : AWSRequest


/**
 <p>The ARN of the product to enable the integration for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productArn;

@end

/**
 
 */
@interface AWSsecurityhubEnableImportFindingsForProductResponse : AWSModel


/**
 <p>The ARN of your subscription to the product to enable integrations for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productSubscriptionArn;

@end

/**
 
 */
@interface AWSsecurityhubEnableSecurityHubRequest : AWSRequest


/**
 <p>Whether to enable the security standards that Security Hub has designated as automatically enabled. If you do not provide a value for <code>EnableDefaultStandards</code>, it is set to <code>true</code>. To not enable the automatically enabled standards, set <code>EnableDefaultStandards</code> to <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableDefaultStandards;

/**
 <p>The tags to add to the Hub resource when you enable Security Hub.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSsecurityhubEnableSecurityHubResponse : AWSModel


@end

/**
 
 */
@interface AWSsecurityhubGetEnabledStandardsRequest : AWSRequest


/**
 <p>The maximum number of results to return in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token that is required for pagination. On your first call to the <code>GetEnabledStandards</code> operation, set the value of this parameter to <code>NULL</code>.</p><p>For subsequent calls to the operation, to continue listing data, set the value of this parameter to the value returned from the previous response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of the standards subscription ARNs for the standards to retrieve.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable standardsSubscriptionArns;

@end

/**
 
 */
@interface AWSsecurityhubGetEnabledStandardsResponse : AWSModel


/**
 <p>The pagination token to use to request the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of <code>StandardsSubscriptions</code> objects that include information about the enabled standards.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubStandardsSubscription *> * _Nullable standardsSubscriptions;

@end

/**
 
 */
@interface AWSsecurityhubGetFindingsRequest : AWSRequest


/**
 <p>The finding attributes used to define a condition to filter the returned findings.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsSecurityFindingFilters * _Nullable filters;

/**
 <p>The maximum number of findings to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token that is required for pagination. On your first call to the <code>GetFindings</code> operation, set the value of this parameter to <code>NULL</code>.</p><p>For subsequent calls to the operation, to continue listing data, set the value of this parameter to the value returned from the previous response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The finding attributes used to sort the list of returned findings.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubSortCriterion *> * _Nullable sortCriteria;

@end

/**
 
 */
@interface AWSsecurityhubGetFindingsResponse : AWSModel


/**
 <p>The findings that matched the filters specified in the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubAwsSecurityFinding *> * _Nullable findings;

/**
 <p>The pagination token to use to request the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSsecurityhubGetInsightResultsRequest : AWSRequest


/**
 <p>The ARN of the insight for which to return results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable insightArn;

@end

/**
 
 */
@interface AWSsecurityhubGetInsightResultsResponse : AWSModel


/**
 <p>The insight results returned by the operation.</p>
 */
@property (nonatomic, strong) AWSsecurityhubInsightResults * _Nullable insightResults;

@end

/**
 
 */
@interface AWSsecurityhubGetInsightsRequest : AWSRequest


/**
 <p>The ARNs of the insights to describe. If you do not provide any insight ARNs, then <code>GetInsights</code> returns all of your custom insights. It does not return any managed insights.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable insightArns;

/**
 <p>The maximum number of items to return in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token that is required for pagination. On your first call to the <code>GetInsights</code> operation, set the value of this parameter to <code>NULL</code>.</p><p>For subsequent calls to the operation, to continue listing data, set the value of this parameter to the value returned from the previous response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSsecurityhubGetInsightsResponse : AWSModel


/**
 <p>The insights returned by the operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubInsight *> * _Nullable insights;

/**
 <p>The pagination token to use to request the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSsecurityhubGetInvitationsCountRequest : AWSRequest


@end

/**
 
 */
@interface AWSsecurityhubGetInvitationsCountResponse : AWSModel


/**
 <p>The number of all membership invitations sent to this Security Hub member account, not including the currently accepted invitation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable invitationsCount;

@end

/**
 
 */
@interface AWSsecurityhubGetMasterAccountRequest : AWSRequest


@end

/**
 
 */
@interface AWSsecurityhubGetMasterAccountResponse : AWSModel


/**
 <p>A list of details about the Security Hub master account for the current member account. </p>
 */
@property (nonatomic, strong) AWSsecurityhubInvitation * _Nullable master;

@end

/**
 
 */
@interface AWSsecurityhubGetMembersRequest : AWSRequest


/**
 <p>The list of account IDs for the Security Hub member accounts to return the details for. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

@end

/**
 
 */
@interface AWSsecurityhubGetMembersResponse : AWSModel


/**
 <p>The list of details about the Security Hub member accounts.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubMember *> * _Nullable members;

/**
 <p>The list of AWS accounts that could not be processed. For each account, the list includes the account ID and the email address.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubResult *> * _Nullable unprocessedAccounts;

@end

/**
 <p>The list of the findings that cannot be imported. For each finding, the list provides the error.</p>
 Required parameters: [Id, ErrorCode, ErrorMessage]
 */
@interface AWSsecurityhubImportFindingsError : AWSModel


/**
 <p>The code of the error returned by the <code>BatchImportFindings</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>The message of the error returned by the <code>BatchImportFindings</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The identifier of the finding that could not be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Contains information about a Security Hub insight.</p>
 Required parameters: [InsightArn, Name, Filters, GroupByAttribute]
 */
@interface AWSsecurityhubInsight : AWSModel


/**
 <p>One or more attributes used to filter the findings included in the insight. The insight only includes findings that match the criteria defined in the filters.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsSecurityFindingFilters * _Nullable filters;

/**
 <p>The grouping attribute for the insight's findings. Indicates how to group the matching findings, and identifies the type of item that the insight applies to. For example, if an insight is grouped by resource identifier, then the insight produces a list of resource identifiers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupByAttribute;

/**
 <p>The ARN of a Security Hub insight.</p>
 */
@property (nonatomic, strong) NSString * _Nullable insightArn;

/**
 <p>The name of a Security Hub insight.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The insight result values returned by the <code>GetInsightResults</code> operation.</p>
 Required parameters: [GroupByAttributeValue, Count]
 */
@interface AWSsecurityhubInsightResultValue : AWSModel


/**
 <p>The number of findings returned for each <code>GroupByAttributeValue</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>The value of the attribute that the findings are grouped by for the insight whose results are returned by the <code>GetInsightResults</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupByAttributeValue;

@end

/**
 <p>The insight results returned by the <code>GetInsightResults</code> operation.</p>
 Required parameters: [InsightArn, GroupByAttribute, ResultValues]
 */
@interface AWSsecurityhubInsightResults : AWSModel


/**
 <p>The attribute that the findings are grouped by for the insight whose results are returned by the <code>GetInsightResults</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupByAttribute;

/**
 <p>The ARN of the insight whose results are returned by the <code>GetInsightResults</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable insightArn;

/**
 <p>The list of insight result values returned by the <code>GetInsightResults</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubInsightResultValue *> * _Nullable resultValues;

@end

/**
 <p>Details about an invitation.</p>
 */
@interface AWSsecurityhubInvitation : AWSModel


/**
 <p>The account ID of the Security Hub master account that the invitation was sent from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The ID of the invitation sent to the member account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable invitationId;

/**
 <p>The timestamp of when the invitation was sent.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable invitedAt;

/**
 <p>The current status of the association between the member and master accounts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberStatus;

@end

/**
 
 */
@interface AWSsecurityhubInviteMembersRequest : AWSRequest


/**
 <p>The list of account IDs of the AWS accounts to invite to Security Hub as members. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

@end

/**
 
 */
@interface AWSsecurityhubInviteMembersResponse : AWSModel


/**
 <p>The list of AWS accounts that could not be processed. For each account, the list includes the account ID and the email address.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubResult *> * _Nullable unprocessedAccounts;

@end

/**
 <p>The IP filter for querying findings.</p>
 */
@interface AWSsecurityhubIpFilter : AWSModel


/**
 <p>A finding's CIDR value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cidr;

@end

/**
 <p>A keyword filter for querying findings.</p>
 */
@interface AWSsecurityhubKeywordFilter : AWSModel


/**
 <p>A value for the keyword.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSsecurityhubListEnabledProductsForImportRequest : AWSRequest


/**
 <p>The maximum number of items to return in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token that is required for pagination. On your first call to the <code>ListEnabledProductsForImport</code> operation, set the value of this parameter to <code>NULL</code>.</p><p>For subsequent calls to the operation, to continue listing data, set the value of this parameter to the value returned from the previous response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSsecurityhubListEnabledProductsForImportResponse : AWSModel


/**
 <p>The pagination token to use to request the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of ARNs for the resources that represent your subscriptions to products. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable productSubscriptions;

@end

/**
 
 */
@interface AWSsecurityhubListInvitationsRequest : AWSRequest


/**
 <p>The maximum number of items to return in the response. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token that is required for pagination. On your first call to the <code>ListInvitations</code> operation, set the value of this parameter to <code>NULL</code>.</p><p>For subsequent calls to the operation, to continue listing data, set the value of this parameter to the value returned from the previous response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSsecurityhubListInvitationsResponse : AWSModel


/**
 <p>The details of the invitations returned by the operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubInvitation *> * _Nullable invitations;

/**
 <p>The pagination token to use to request the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSsecurityhubListMembersRequest : AWSRequest


/**
 <p>The maximum number of items to return in the response. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token that is required for pagination. On your first call to the <code>ListMembers</code> operation, set the value of this parameter to <code>NULL</code>.</p><p>For subsequent calls to the operation, to continue listing data, set the value of this parameter to the value returned from the previous response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Specifies which member accounts to include in the response based on their relationship status with the master account. The default value is <code>TRUE</code>.</p><p>If <code>OnlyAssociated</code> is set to <code>TRUE</code>, the response includes member accounts whose relationship status with the master is set to <code>ENABLED</code> or <code>DISABLED</code>.</p><p>If <code>OnlyAssociated</code> is set to <code>FALSE</code>, the response includes all existing member accounts. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable onlyAssociated;

@end

/**
 
 */
@interface AWSsecurityhubListMembersResponse : AWSModel


/**
 <p>Member details returned by the operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSsecurityhubMember *> * _Nullable members;

/**
 <p>The pagination token to use to request the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSsecurityhubListTagsForResourceRequest : AWSRequest


/**
 <p>The ARN of the resource to retrieve tags for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSsecurityhubListTagsForResourceResponse : AWSModel


/**
 <p>The tags associated with a resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Information about the state of the load balancer.</p>
 */
@interface AWSsecurityhubLoadBalancerState : AWSModel


/**
 <p>The state code. The initial state of the load balancer is provisioning.</p><p>After the load balancer is fully set up and ready to route traffic, its state is active.</p><p>If the load balancer could not be set up, its state is failed. </p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>A description of the state.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reason;

@end

/**
 <p>A list of malware related to a finding.</p>
 Required parameters: [Name]
 */
@interface AWSsecurityhubMalware : AWSModel


/**
 <p>The name of the malware that was observed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The file system path of the malware that was observed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The state of the malware that was observed.</p>
 */
@property (nonatomic, assign) AWSsecurityhubMalwareState state;

/**
 <p>The type of the malware that was observed.</p>
 */
@property (nonatomic, assign) AWSsecurityhubMalwareType types;

@end

/**
 <p>The map filter for querying findings.</p>
 */
@interface AWSsecurityhubMapFilter : AWSModel


/**
 <p>The condition to apply to a key value when querying for findings with a map filter.</p>
 */
@property (nonatomic, assign) AWSsecurityhubMapFilterComparison comparison;

/**
 <p>The key of the map filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value for the key in the map filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>The details about a member account.</p>
 */
@interface AWSsecurityhubMember : AWSModel


/**
 <p>The AWS account ID of the member account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The email address of the member account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>A timestamp for the date and time when the invitation was sent to the member account.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable invitedAt;

/**
 <p>The AWS account ID of the Security Hub master account associated with this member account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterId;

/**
 <p>The status of the relationship between the member account and its master account. </p>
 */
@property (nonatomic, strong) NSString * _Nullable memberStatus;

/**
 <p>The timestamp for the date and time when the member account was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 <p>The details of network-related information about a finding.</p>
 */
@interface AWSsecurityhubNetwork : AWSModel


/**
 <p>The destination domain of network-related information about a finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationDomain;

/**
 <p>The destination IPv4 address of network-related information about a finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationIpV4;

/**
 <p>The destination IPv6 address of network-related information about a finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationIpV6;

/**
 <p>The destination port of network-related information about a finding.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable destinationPort;

/**
 <p>The direction of network traffic associated with a finding.</p>
 */
@property (nonatomic, assign) AWSsecurityhubNetworkDirection direction;

/**
 <p>The protocol of network-related information about a finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable protocols;

/**
 <p>The source domain of network-related information about a finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceDomain;

/**
 <p>The source IPv4 address of network-related information about a finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceIpV4;

/**
 <p>The source IPv6 address of network-related information about a finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceIpV6;

/**
 <p>The source media access control (MAC) address of network-related information about a finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceMac;

/**
 <p>The source port of network-related information about a finding.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sourcePort;

@end

/**
 <p>A user-defined note added to a finding.</p>
 Required parameters: [Text, UpdatedBy, UpdatedAt]
 */
@interface AWSsecurityhubNote : AWSModel


/**
 <p>The text of a note.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

/**
 <p>The timestamp of when the note was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable updatedAt;

/**
 <p>The principal that created a note.</p>
 */
@property (nonatomic, strong) NSString * _Nullable updatedBy;

@end

/**
 <p>The updated note.</p>
 Required parameters: [Text, UpdatedBy]
 */
@interface AWSsecurityhubNoteUpdate : AWSModel


/**
 <p>The updated note text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

/**
 <p>The principal that updated the note.</p>
 */
@property (nonatomic, strong) NSString * _Nullable updatedBy;

@end

/**
 <p>A number filter for querying findings.</p>
 */
@interface AWSsecurityhubNumberFilter : AWSModel


/**
 <p>The equal-to condition to be applied to a single field when querying for findings.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable eq;

/**
 <p>The greater-than-equal condition to be applied to a single field when querying for findings. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable gte;

/**
 <p>The less-than-equal condition to be applied to a single field when querying for findings. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lte;

@end

/**
 <p>The details of process-related information about a finding.</p>
 */
@interface AWSsecurityhubProcessDetails : AWSModel


/**
 <p>The date/time that the process was launched.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchedAt;

/**
 <p>The name of the process.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The parent process ID.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable parentPid;

/**
 <p>The path to the process executable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The process ID.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pid;

/**
 <p>The date and time when the process was terminated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable terminatedAt;

@end

/**
 <p>Contains details about a product.</p>
 Required parameters: [ProductArn]
 */
@interface AWSsecurityhubProduct : AWSModel


/**
 <p>The URL used to activate the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable activationUrl;

/**
 <p>The categories assigned to the product.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable categories;

/**
 <p>The name of the company that provides the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable companyName;

/**
 <p>A description of the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The types of integration that the product supports. Available values are the following.</p><ul><li><p><code>SEND_FINDINGS_TO_SECURITY_HUB</code> - Indicates that the integration sends findings to Security Hub.</p></li><li><p><code>RECEIVE_FINDINGS_FROM_SECURITY_HUB</code> - Indicates that the integration receives findings from Security Hub.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable integrationTypes;

/**
 <p>The URL for the page that contains more information about the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marketplaceUrl;

/**
 <p>The ARN assigned to the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productArn;

/**
 <p>The name of the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productName;

/**
 <p>The resource policy associated with the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productSubscriptionResourcePolicy;

@end

/**
 <p>A recommendation on how to remediate the issue identified in a finding.</p>
 */
@interface AWSsecurityhubRecommendation : AWSModel


/**
 <p>Describes the recommended steps to take to remediate an issue identified in a finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

/**
 <p>A URL to a page or site that contains information about how to remediate a finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 <p>Details about a related finding.</p>
 Required parameters: [ProductArn, Id]
 */
@interface AWSsecurityhubRelatedFinding : AWSModel


/**
 <p>The product-generated identifier for a related finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The ARN of the product that generated a related finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productArn;

@end

/**
 <p>Details about the remediation steps for a finding.</p>
 */
@interface AWSsecurityhubRemediation : AWSModel


/**
 <p>A recommendation on the steps to take to remediate the issue identified by a finding.</p>
 */
@property (nonatomic, strong) AWSsecurityhubRecommendation * _Nullable recommendation;

@end

/**
 <p>A resource related to a finding.</p>
 Required parameters: [Type, Id]
 */
@interface AWSsecurityhubResource : AWSModel


/**
 <p>Additional details about the resource related to a finding.</p>
 */
@property (nonatomic, strong) AWSsecurityhubResourceDetails * _Nullable details;

/**
 <p>The canonical identifier for the given resource type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The canonical AWS partition name that the Region is assigned to.</p>
 */
@property (nonatomic, assign) AWSsecurityhubPartition partition;

/**
 <p>The canonical AWS external Region name where this resource is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>A list of AWS tags associated with a resource at the time the finding was processed.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of the resource that details are provided for. If possible, set <code>Type</code> to one of the supported resource types. For example, if the resource is an EC2 instance, then set <code>Type</code> to <code>AwsEc2Instance</code>.</p><p>If the resource does not match any of the provided types, then set <code>Type</code> to <code>Other</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>Additional details about a resource related to a finding.</p><p>To provide the details, use the object that corresponds to the resource type. For example, if the resource type is <code>AwsEc2Instance</code>, then you use the <code>AwsEc2Instance</code> object to provide the details.</p><p>If the type-specific object does not contain all of the fields you want to populate, then you use the <code>Other</code> object to populate those additional fields.</p><p>You also use the <code>Other</code> object to populate the details when the selected type does not have a corresponding object.</p>
 */
@interface AWSsecurityhubResourceDetails : AWSModel


/**
 <p>Details about a CloudFront distribution.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsCloudFrontDistributionDetails * _Nullable awsCloudFrontDistribution;

/**
 <p>Details for an AWS CodeBuild project.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsCodeBuildProjectDetails * _Nullable awsCodeBuildProject;

/**
 <p>Details about an Amazon EC2 instance related to a finding.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsEc2InstanceDetails * _Nullable awsEc2Instance;

/**
 <p>Details for an AWS EC2 network interface.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsEc2NetworkInterfaceDetails * _Nullable awsEc2NetworkInterface;

/**
 <p>Details for an EC2 security group.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsEc2SecurityGroupDetails * _Nullable awsEc2SecurityGroup;

/**
 <p>Details for an Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsElasticsearchDomainDetails * _Nullable awsElasticsearchDomain;

/**
 <p>Details about a load balancer.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsElbv2LoadBalancerDetails * _Nullable awsElbv2LoadBalancer;

/**
 <p>Details about an IAM access key related to a finding.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsIamAccessKeyDetails * _Nullable awsIamAccessKey;

/**
 <p>Details about an IAM role.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsIamRoleDetails * _Nullable awsIamRole;

/**
 <p>Details about a KMS key.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsKmsKeyDetails * _Nullable awsKmsKey;

/**
 <p>Details about a Lambda function.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsLambdaFunctionDetails * _Nullable awsLambdaFunction;

/**
 <p>Details for a Lambda layer version.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsLambdaLayerVersionDetails * _Nullable awsLambdaLayerVersion;

/**
 <p>Details for an RDS database instance.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsRdsDbInstanceDetails * _Nullable awsRdsDbInstance;

/**
 <p>Details about an Amazon S3 Bucket related to a finding.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsS3BucketDetails * _Nullable awsS3Bucket;

/**
 <p>Details about an Amazon S3 object related to a finding.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsS3ObjectDetails * _Nullable awsS3Object;

/**
 <p>Details about an SNS topic.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsSnsTopicDetails * _Nullable awsSnsTopic;

/**
 <p>Details about an SQS queue.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsSqsQueueDetails * _Nullable awsSqsQueue;

/**
 <p>Details for a WAF WebACL.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsWafWebAclDetails * _Nullable awsWafWebAcl;

/**
 <p>Details about a container resource related to a finding.</p>
 */
@property (nonatomic, strong) AWSsecurityhubContainerDetails * _Nullable container;

/**
 <p>Details about a resource that are not available in a type-specific details object. Use the <code>Other</code> object in the following cases.</p><ul><li><p>The type-specific object does not contain all of the fields that you want to populate. In this case, first use the type-specific object to populate those fields. Use the <code>Other</code> object to populate the fields that are missing from the type-specific object.</p></li><li><p>The resource type does not have a corresponding object. This includes resources for which the type is <code>Other</code>. </p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable other;

@end

/**
 <p>Details about the account that was not processed.</p>
 */
@interface AWSsecurityhubResult : AWSModel


/**
 <p>An AWS account ID of the account that was not processed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The reason that the account was not processed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable processingResult;

@end

/**
 <p>The severity of the finding.</p>
 */
@interface AWSsecurityhubSeverity : AWSModel


/**
 <p>The severity value of the finding. The allowed values are the following.</p><ul><li><p><code>INFORMATIONAL</code> - No issue was found.</p></li><li><p><code>LOW</code> - The issue does not require action on its own.</p></li><li><p><code>MEDIUM</code> - The issue must be addressed but not urgently.</p></li><li><p><code>HIGH</code> - The issue must be addressed as a priority.</p></li><li><p><code>CRITICAL</code> - The issue must be remediated immediately to avoid it escalating.</p></li></ul>
 */
@property (nonatomic, assign) AWSsecurityhubSeverityLabel label;

/**
 <p>Deprecated. This attribute is being deprecated. Instead of providing <code>Normalized</code>, provide <code>Label</code>.</p><p>If you provide <code>Normalized</code> and do not provide <code>Label</code>, <code>Label</code> is set automatically as follows. </p><ul><li><p>0 - <code>INFORMATIONAL</code></p></li><li><p>1–39 - <code>LOW</code></p></li><li><p>40–69 - <code>MEDIUM</code></p></li><li><p>70–89 - <code>HIGH</code></p></li><li><p>90–100 - <code>CRITICAL</code></p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable normalized;

/**
 <p>The native severity as defined by the AWS service or integrated partner product that generated the finding.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable product;

@end

/**
 <p>Updates to the severity information for a finding.</p>
 */
@interface AWSsecurityhubSeverityUpdate : AWSModel


/**
 <p>The severity value of the finding. The allowed values are the following.</p><ul><li><p><code>INFORMATIONAL</code> - No issue was found.</p></li><li><p><code>LOW</code> - The issue does not require action on its own.</p></li><li><p><code>MEDIUM</code> - The issue must be addressed but not urgently.</p></li><li><p><code>HIGH</code> - The issue must be addressed as a priority.</p></li><li><p><code>CRITICAL</code> - The issue must be remediated immediately to avoid it escalating.</p></li></ul>
 */
@property (nonatomic, assign) AWSsecurityhubSeverityLabel label;

/**
 <p>The normalized severity for the finding. This attribute is to be deprecated in favor of <code>Label</code>.</p><p>If you provide <code>Normalized</code> and do not provide <code>Label</code>, <code>Label</code> is set automatically as follows.</p><ul><li><p>0 - <code>INFORMATIONAL</code></p></li><li><p>1–39 - <code>LOW</code></p></li><li><p>40–69 - <code>MEDIUM</code></p></li><li><p>70–89 - <code>HIGH</code></p></li><li><p>90–100 - <code>CRITICAL</code></p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable normalized;

/**
 <p>The native severity as defined by the AWS service or integrated partner product that generated the finding.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable product;

@end

/**
 <p>A collection of finding attributes used to sort findings.</p>
 */
@interface AWSsecurityhubSortCriterion : AWSModel


/**
 <p>The finding attribute used to sort findings.</p>
 */
@property (nonatomic, strong) NSString * _Nullable field;

/**
 <p>The order used to sort findings.</p>
 */
@property (nonatomic, assign) AWSsecurityhubSortOrder sortOrder;

@end

/**
 <p>Provides information about a specific standard.</p>
 */
@interface AWSsecurityhubStandard : AWSModel


/**
 <p>A description of the standard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Whether the standard is enabled by default. When Security Hub is enabled from the console, if a standard is enabled by default, the check box for that standard is selected by default.</p><p>When Security Hub is enabled using the <code>EnableSecurityHub</code> API operation, the standard is enabled by default unless <code>EnableDefaultStandards</code> is set to <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabledByDefault;

/**
 <p>The name of the standard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ARN of a standard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable standardsArn;

@end

/**
 <p>Details for an individual security standard control.</p>
 */
@interface AWSsecurityhubStandardsControl : AWSModel


/**
 <p>The identifier of the security standard control.</p>
 */
@property (nonatomic, strong) NSString * _Nullable controlId;

/**
 <p>The current status of the security standard control. Indicates whether the control is enabled or disabled. Security Hub does not check against disabled controls.</p>
 */
@property (nonatomic, assign) AWSsecurityhubControlStatus controlStatus;

/**
 <p>The date and time that the status of the security standard control was most recently updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable controlStatusUpdatedAt;

/**
 <p>The longer description of the security standard control. Provides information about what the control is checking for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The reason provided for the most recent change in status for the control.</p>
 */
@property (nonatomic, strong) NSString * _Nullable disabledReason;

/**
 <p>The list of requirements that are related to this control.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable relatedRequirements;

/**
 <p>A link to remediation information for the control in the Security Hub user documentation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable remediationUrl;

/**
 <p>The severity of findings generated from this security standard control.</p><p>The finding severity is based on an assessment of how easy it would be to compromise AWS resources if the issue is detected.</p>
 */
@property (nonatomic, assign) AWSsecurityhubSeverityRating severityRating;

/**
 <p>The ARN of the security standard control.</p>
 */
@property (nonatomic, strong) NSString * _Nullable standardsControlArn;

/**
 <p>The title of the security standard control.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

@end

/**
 <p>A resource that represents your subscription to a supported standard.</p>
 Required parameters: [StandardsSubscriptionArn, StandardsArn, StandardsInput, StandardsStatus]
 */
@interface AWSsecurityhubStandardsSubscription : AWSModel


/**
 <p>The ARN of a standard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable standardsArn;

/**
 <p>A key-value pair of input for the standard.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable standardsInput;

/**
 <p>The status of the standards subscription.</p>
 */
@property (nonatomic, assign) AWSsecurityhubStandardsStatus standardsStatus;

/**
 <p>The ARN of a resource that represents your subscription to a supported standard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable standardsSubscriptionArn;

@end

/**
 <p>The standard that you want to enable.</p>
 Required parameters: [StandardsArn]
 */
@interface AWSsecurityhubStandardsSubscriptionRequest : AWSModel


/**
 <p>The ARN of the standard that you want to enable. To view the list of available standards and their ARNs, use the <code><a>DescribeStandards</a></code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable standardsArn;

/**
 <p>A key-value pair of input for the standard.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable standardsInput;

@end

/**
 <p>A string filter for querying findings.</p>
 */
@interface AWSsecurityhubStringFilter : AWSModel


/**
 <p>The condition to be applied to a string value when querying for findings. </p>
 */
@property (nonatomic, assign) AWSsecurityhubStringFilterComparison comparison;

/**
 <p>The string filter value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSsecurityhubTagResourceRequest : AWSRequest


/**
 <p>The ARN of the resource to apply the tags to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tags to add to the resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSsecurityhubTagResourceResponse : AWSModel


@end

/**
 <p>Details about the threat intelligence related to a finding.</p>
 */
@interface AWSsecurityhubThreatIntelIndicator : AWSModel


/**
 <p>The category of a threat intelligence indicator.</p>
 */
@property (nonatomic, assign) AWSsecurityhubThreatIntelIndicatorCategory category;

/**
 <p>The date and time when the most recent instance of a threat intelligence indicator was observed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastObservedAt;

/**
 <p>The source of the threat intelligence indicator.</p>
 */
@property (nonatomic, strong) NSString * _Nullable source;

/**
 <p>The URL to the page or site where you can get more information about the threat intelligence indicator.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceUrl;

/**
 <p>The type of threat intelligence indicator.</p>
 */
@property (nonatomic, assign) AWSsecurityhubThreatIntelIndicatorType types;

/**
 <p>The value of a threat intelligence indicator.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSsecurityhubUntagResourceRequest : AWSRequest


/**
 <p>The ARN of the resource to remove the tags from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tag keys associated with the tags to remove from the resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSsecurityhubUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSsecurityhubUpdateActionTargetRequest : AWSRequest


/**
 <p>The ARN of the custom action target to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionTargetArn;

/**
 <p>The updated description for the custom action target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The updated name of the custom action target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSsecurityhubUpdateActionTargetResponse : AWSModel


@end

/**
 
 */
@interface AWSsecurityhubUpdateFindingsRequest : AWSRequest


/**
 <p>A collection of attributes that specify which findings you want to update.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsSecurityFindingFilters * _Nullable filters;

/**
 <p>The updated note for the finding.</p>
 */
@property (nonatomic, strong) AWSsecurityhubNoteUpdate * _Nullable note;

/**
 <p>The updated record state for the finding.</p>
 */
@property (nonatomic, assign) AWSsecurityhubRecordState recordState;

@end

/**
 
 */
@interface AWSsecurityhubUpdateFindingsResponse : AWSModel


@end

/**
 
 */
@interface AWSsecurityhubUpdateInsightRequest : AWSRequest


/**
 <p>The updated filters that define this insight.</p>
 */
@property (nonatomic, strong) AWSsecurityhubAwsSecurityFindingFilters * _Nullable filters;

/**
 <p>The updated <code>GroupBy</code> attribute that defines this insight.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupByAttribute;

/**
 <p>The ARN of the insight that you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable insightArn;

/**
 <p>The updated name for the insight.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSsecurityhubUpdateInsightResponse : AWSModel


@end

/**
 
 */
@interface AWSsecurityhubUpdateStandardsControlRequest : AWSRequest


/**
 <p>The updated status of the security standard control.</p>
 */
@property (nonatomic, assign) AWSsecurityhubControlStatus controlStatus;

/**
 <p>A description of the reason why you are disabling a security standard control.</p>
 */
@property (nonatomic, strong) NSString * _Nullable disabledReason;

/**
 <p>The ARN of the security standard control to enable or disable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable standardsControlArn;

@end

/**
 
 */
@interface AWSsecurityhubUpdateStandardsControlResponse : AWSModel


@end

/**
 <p>Details about the action that CloudFront or AWS WAF takes when a web request matches the conditions in the Rule. </p>
 */
@interface AWSsecurityhubWafAction : AWSModel


/**
 <p>Specifies how you want AWS WAF to respond to requests that match the settings in a Rule.</p><p>Valid settings include the following:</p><ul><li><p><code>ALLOW</code> - AWS WAF allows requests</p></li><li><p><code>BLOCK</code> - AWS WAF blocks requests</p></li><li><p><code>COUNT</code> - AWS WAF increments a counter of the requests that match all of the conditions in the rule. AWS WAF then continues to inspect the web request based on the remaining rules in the web ACL. You can't specify <code>COUNT</code> for the default action for a WebACL.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>Details about a rule to exclude from a rule group.</p>
 */
@interface AWSsecurityhubWafExcludedRule : AWSModel


/**
 <p>The unique identifier for the rule to exclude from the rule group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

@end

/**
 <p>Details about an override action for a rule.</p>
 */
@interface AWSsecurityhubWafOverrideAction : AWSModel


/**
 <p><code>COUNT</code> overrides the action specified by the individual rule within a RuleGroup .</p><p>If set to <code>NONE</code>, the rule's action takes place.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>Provides information about the status of the investigation into a finding.</p>
 */
@interface AWSsecurityhubWorkflow : AWSModel


/**
 <p>The status of the investigation into the finding. The allowed values are the following.</p><ul><li><p><code>NEW</code> - The initial state of a finding, before it is reviewed.</p></li><li><p><code>NOTIFIED</code> - Indicates that you notified the resource owner about the security issue. Used when the initial reviewer is not the resource owner, and needs intervention from the resource owner.</p></li><li><p><code>SUPPRESSED</code> - The finding will not be reviewed again and will not be acted upon.</p></li><li><p><code>RESOLVED</code> - The finding was reviewed and remediated and is now considered resolved. </p></li></ul>
 */
@property (nonatomic, assign) AWSsecurityhubWorkflowStatus status;

@end

/**
 <p>Used to update information about the investigation into the finding.</p>
 */
@interface AWSsecurityhubWorkflowUpdate : AWSModel


/**
 <p>The status of the investigation into the finding. The allowed values are the following.</p><ul><li><p><code>NEW</code> - The initial state of a finding, before it is reviewed.</p></li><li><p><code>NOTIFIED</code> - Indicates that you notified the resource owner about the security issue. Used when the initial reviewer is not the resource owner, and needs intervention from the resource owner.</p></li><li><p><code>RESOLVED</code> - The finding was reviewed and remediated and is now considered resolved.</p></li><li><p><code>SUPPRESSED</code> - The finding will not be reviewed again and will not be acted upon.</p></li></ul>
 */
@property (nonatomic, assign) AWSsecurityhubWorkflowStatus status;

@end

NS_ASSUME_NONNULL_END
