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

FOUNDATION_EXPORT NSString *const AWSredshiftErrorDomain;

typedef NS_ENUM(NSInteger, AWSredshiftErrorType) {
    AWSredshiftErrorUnknown,
    AWSredshiftErrorAccessToSnapshotDenied,
    AWSredshiftErrorAuthorizationAlreadyExists,
    AWSredshiftErrorAuthorizationNotFound,
    AWSredshiftErrorAuthorizationQuotaExceeded,
    AWSredshiftErrorBatchDeleteRequestSizeExceeded,
    AWSredshiftErrorBatchModifyClusterSnapshotsLimitExceeded,
    AWSredshiftErrorBucketNotFound,
    AWSredshiftErrorClusterAlreadyExists,
    AWSredshiftErrorClusterNotFound,
    AWSredshiftErrorClusterOnLatestRevision,
    AWSredshiftErrorClusterParameterGroupAlreadyExists,
    AWSredshiftErrorClusterParameterGroupNotFound,
    AWSredshiftErrorClusterParameterGroupQuotaExceeded,
    AWSredshiftErrorClusterQuotaExceeded,
    AWSredshiftErrorClusterSecurityGroupAlreadyExists,
    AWSredshiftErrorClusterSecurityGroupNotFound,
    AWSredshiftErrorClusterSecurityGroupQuotaExceeded,
    AWSredshiftErrorClusterSnapshotAlreadyExists,
    AWSredshiftErrorClusterSnapshotNotFound,
    AWSredshiftErrorClusterSnapshotQuotaExceeded,
    AWSredshiftErrorClusterSubnetGroupAlreadyExists,
    AWSredshiftErrorClusterSubnetGroupNotFound,
    AWSredshiftErrorClusterSubnetGroupQuotaExceeded,
    AWSredshiftErrorClusterSubnetQuotaExceeded,
    AWSredshiftErrorCopyToRegionDisabled,
    AWSredshiftErrorDependentServiceRequestThrottling,
    AWSredshiftErrorDependentServiceUnavailable,
    AWSredshiftErrorEventSubscriptionQuotaExceeded,
    AWSredshiftErrorHsmClientCertificateAlreadyExists,
    AWSredshiftErrorHsmClientCertificateNotFound,
    AWSredshiftErrorHsmClientCertificateQuotaExceeded,
    AWSredshiftErrorHsmConfigurationAlreadyExists,
    AWSredshiftErrorHsmConfigurationNotFound,
    AWSredshiftErrorHsmConfigurationQuotaExceeded,
    AWSredshiftErrorInProgressTableRestoreQuotaExceeded,
    AWSredshiftErrorIncompatibleOrderableOptions,
    AWSredshiftErrorInsufficientClusterCapacity,
    AWSredshiftErrorInsufficientS3BucketPolicy,
    AWSredshiftErrorInvalidClusterParameterGroupState,
    AWSredshiftErrorInvalidClusterSecurityGroupState,
    AWSredshiftErrorInvalidClusterSnapshotScheduleState,
    AWSredshiftErrorInvalidClusterSnapshotState,
    AWSredshiftErrorInvalidClusterState,
    AWSredshiftErrorInvalidClusterSubnetGroupState,
    AWSredshiftErrorInvalidClusterSubnetState,
    AWSredshiftErrorInvalidClusterTrack,
    AWSredshiftErrorInvalidElasticIp,
    AWSredshiftErrorInvalidHsmClientCertificateState,
    AWSredshiftErrorInvalidHsmConfigurationState,
    AWSredshiftErrorInvalidReservedNodeState,
    AWSredshiftErrorInvalidRestore,
    AWSredshiftErrorInvalidRetentionPeriod,
    AWSredshiftErrorInvalidS3BucketName,
    AWSredshiftErrorInvalidS3KeyPrefix,
    AWSredshiftErrorInvalidSchedule,
    AWSredshiftErrorInvalidScheduledAction,
    AWSredshiftErrorInvalidSnapshotCopyGrantState,
    AWSredshiftErrorInvalidSubnet,
    AWSredshiftErrorInvalidSubscriptionState,
    AWSredshiftErrorInvalidTableRestoreArgument,
    AWSredshiftErrorInvalidTag,
    AWSredshiftErrorInvalidUsageLimit,
    AWSredshiftErrorInvalidVPCNetworkState,
    AWSredshiftErrorLimitExceeded,
    AWSredshiftErrorNumberOfNodesPerClusterLimitExceeded,
    AWSredshiftErrorNumberOfNodesQuotaExceeded,
    AWSredshiftErrorReservedNodeAlreadyExists,
    AWSredshiftErrorReservedNodeAlreadyMigrated,
    AWSredshiftErrorReservedNodeNotFound,
    AWSredshiftErrorReservedNodeOfferingNotFound,
    AWSredshiftErrorReservedNodeQuotaExceeded,
    AWSredshiftErrorResizeNotFound,
    AWSredshiftErrorResourceNotFound,
    AWSredshiftErrorSNSInvalidTopic,
    AWSredshiftErrorSNSNoAuthorization,
    AWSredshiftErrorSNSTopicArnNotFound,
    AWSredshiftErrorScheduleDefinitionTypeUnsupported,
    AWSredshiftErrorScheduledActionAlreadyExists,
    AWSredshiftErrorScheduledActionNotFound,
    AWSredshiftErrorScheduledActionQuotaExceeded,
    AWSredshiftErrorScheduledActionTypeUnsupported,
    AWSredshiftErrorSnapshotCopyAlreadyDisabled,
    AWSredshiftErrorSnapshotCopyAlreadyEnabled,
    AWSredshiftErrorSnapshotCopyDisabled,
    AWSredshiftErrorSnapshotCopyGrantAlreadyExists,
    AWSredshiftErrorSnapshotCopyGrantNotFound,
    AWSredshiftErrorSnapshotCopyGrantQuotaExceeded,
    AWSredshiftErrorSnapshotScheduleAlreadyExists,
    AWSredshiftErrorSnapshotScheduleNotFound,
    AWSredshiftErrorSnapshotScheduleQuotaExceeded,
    AWSredshiftErrorSnapshotScheduleUpdateInProgress,
    AWSredshiftErrorSourceNotFound,
    AWSredshiftErrorSubnetAlreadyInUse,
    AWSredshiftErrorSubscriptionAlreadyExist,
    AWSredshiftErrorSubscriptionCategoryNotFound,
    AWSredshiftErrorSubscriptionEventIdNotFound,
    AWSredshiftErrorSubscriptionNotFound,
    AWSredshiftErrorSubscriptionSeverityNotFound,
    AWSredshiftErrorTableLimitExceeded,
    AWSredshiftErrorTableRestoreNotFound,
    AWSredshiftErrorTagLimitExceeded,
    AWSredshiftErrorUnauthorizedOperation,
    AWSredshiftErrorUnknownSnapshotCopyRegion,
    AWSredshiftErrorUnsupportedOperation,
    AWSredshiftErrorUnsupportedOption,
    AWSredshiftErrorUsageLimitAlreadyExists,
    AWSredshiftErrorUsageLimitNotFound,
};

typedef NS_ENUM(NSInteger, AWSredshiftActionType) {
    AWSredshiftActionTypeUnknown,
    AWSredshiftActionTypeRestoreCluster,
    AWSredshiftActionTypeRecommendNodeConfig,
    AWSredshiftActionTypeResizeCluster,
};

typedef NS_ENUM(NSInteger, AWSredshiftMode) {
    AWSredshiftModeUnknown,
    AWSredshiftModeStandard,
    AWSredshiftModeHighPerformance,
};

typedef NS_ENUM(NSInteger, AWSredshiftNodeConfigurationOptionsFilterName) {
    AWSredshiftNodeConfigurationOptionsFilterNameUnknown,
    AWSredshiftNodeConfigurationOptionsFilterNameNodeType,
    AWSredshiftNodeConfigurationOptionsFilterNameNumberOfNodes,
    AWSredshiftNodeConfigurationOptionsFilterNameEstimatedDiskUtilizationPercent,
    AWSredshiftNodeConfigurationOptionsFilterNameMode,
};

typedef NS_ENUM(NSInteger, AWSredshiftOperatorType) {
    AWSredshiftOperatorTypeUnknown,
    AWSredshiftOperatorTypeEq,
    AWSredshiftOperatorTypeLt,
    AWSredshiftOperatorTypeGt,
    AWSredshiftOperatorTypeLe,
    AWSredshiftOperatorTypeGe,
    AWSredshiftOperatorTypeIn,
    AWSredshiftOperatorTypeBetween,
};

typedef NS_ENUM(NSInteger, AWSredshiftParameterApplyType) {
    AWSredshiftParameterApplyTypeUnknown,
    AWSredshiftParameterApplyTypeStatic,
    AWSredshiftParameterApplyTypeDynamic,
};

typedef NS_ENUM(NSInteger, AWSredshiftReservedNodeOfferingType) {
    AWSredshiftReservedNodeOfferingTypeUnknown,
    AWSredshiftReservedNodeOfferingTypeRegular,
    AWSredshiftReservedNodeOfferingTypeUpgradable,
};

typedef NS_ENUM(NSInteger, AWSredshiftScheduleState) {
    AWSredshiftScheduleStateUnknown,
    AWSredshiftScheduleStateModifying,
    AWSredshiftScheduleStateActive,
    AWSredshiftScheduleStateFailed,
};

typedef NS_ENUM(NSInteger, AWSredshiftScheduledActionFilterName) {
    AWSredshiftScheduledActionFilterNameUnknown,
    AWSredshiftScheduledActionFilterNameClusterIdentifier,
    AWSredshiftScheduledActionFilterNameIamRole,
};

typedef NS_ENUM(NSInteger, AWSredshiftScheduledActionState) {
    AWSredshiftScheduledActionStateUnknown,
    AWSredshiftScheduledActionStateActive,
    AWSredshiftScheduledActionStateDisabled,
};

typedef NS_ENUM(NSInteger, AWSredshiftScheduledActionTypeValues) {
    AWSredshiftScheduledActionTypeValuesUnknown,
    AWSredshiftScheduledActionTypeValuesResizeCluster,
    AWSredshiftScheduledActionTypeValuesPauseCluster,
    AWSredshiftScheduledActionTypeValuesResumeCluster,
};

typedef NS_ENUM(NSInteger, AWSredshiftSnapshotAttributeToSortBy) {
    AWSredshiftSnapshotAttributeToSortByUnknown,
    AWSredshiftSnapshotAttributeToSortBySourceType,
    AWSredshiftSnapshotAttributeToSortByTotalSize,
    AWSredshiftSnapshotAttributeToSortByCreateTime,
};

typedef NS_ENUM(NSInteger, AWSredshiftSortByOrder) {
    AWSredshiftSortByOrderUnknown,
    AWSredshiftSortByOrderAsc,
    AWSredshiftSortByOrderDesc,
};

typedef NS_ENUM(NSInteger, AWSredshiftSourceType) {
    AWSredshiftSourceTypeUnknown,
    AWSredshiftSourceTypeCluster,
    AWSredshiftSourceTypeClusterParameterGroup,
    AWSredshiftSourceTypeClusterSecurityGroup,
    AWSredshiftSourceTypeClusterSnapshot,
    AWSredshiftSourceTypeScheduledAction,
};

typedef NS_ENUM(NSInteger, AWSredshiftTableRestoreStatusType) {
    AWSredshiftTableRestoreStatusTypeUnknown,
    AWSredshiftTableRestoreStatusTypePending,
    AWSredshiftTableRestoreStatusTypeInProgress,
    AWSredshiftTableRestoreStatusTypeSucceeded,
    AWSredshiftTableRestoreStatusTypeFailed,
    AWSredshiftTableRestoreStatusTypeCanceled,
};

typedef NS_ENUM(NSInteger, AWSredshiftUsageLimitBreachAction) {
    AWSredshiftUsageLimitBreachActionUnknown,
    AWSredshiftUsageLimitBreachActionLog,
    AWSredshiftUsageLimitBreachActionEmitMetric,
    AWSredshiftUsageLimitBreachActionDisable,
};

typedef NS_ENUM(NSInteger, AWSredshiftUsageLimitFeatureType) {
    AWSredshiftUsageLimitFeatureTypeUnknown,
    AWSredshiftUsageLimitFeatureTypeSpectrum,
    AWSredshiftUsageLimitFeatureTypeConcurrencyScaling,
};

typedef NS_ENUM(NSInteger, AWSredshiftUsageLimitLimitType) {
    AWSredshiftUsageLimitLimitTypeUnknown,
    AWSredshiftUsageLimitLimitTypeTime,
    AWSredshiftUsageLimitLimitTypeDataScanned,
};

typedef NS_ENUM(NSInteger, AWSredshiftUsageLimitPeriod) {
    AWSredshiftUsageLimitPeriodUnknown,
    AWSredshiftUsageLimitPeriodDaily,
    AWSredshiftUsageLimitPeriodWeekly,
    AWSredshiftUsageLimitPeriodMonthly,
};

@class AWSredshiftAcceptReservedNodeExchangeInputMessage;
@class AWSredshiftAcceptReservedNodeExchangeOutputMessage;
@class AWSredshiftAccountAttribute;
@class AWSredshiftAccountAttributeList;
@class AWSredshiftAccountWithRestoreAccess;
@class AWSredshiftAttributeValueTarget;
@class AWSredshiftAuthorizeClusterSecurityGroupIngressMessage;
@class AWSredshiftAuthorizeClusterSecurityGroupIngressResult;
@class AWSredshiftAuthorizeSnapshotAccessMessage;
@class AWSredshiftAuthorizeSnapshotAccessResult;
@class AWSredshiftAvailabilityZone;
@class AWSredshiftBatchDeleteClusterSnapshotsRequest;
@class AWSredshiftBatchDeleteClusterSnapshotsResult;
@class AWSredshiftBatchModifyClusterSnapshotsMessage;
@class AWSredshiftBatchModifyClusterSnapshotsOutputMessage;
@class AWSredshiftCancelResizeMessage;
@class AWSredshiftCluster;
@class AWSredshiftClusterAssociatedToSchedule;
@class AWSredshiftClusterCredentials;
@class AWSredshiftClusterDbRevision;
@class AWSredshiftClusterDbRevisionsMessage;
@class AWSredshiftClusterIamRole;
@class AWSredshiftClusterNode;
@class AWSredshiftClusterParameterGroup;
@class AWSredshiftClusterParameterGroupDetails;
@class AWSredshiftClusterParameterGroupNameMessage;
@class AWSredshiftClusterParameterGroupStatus;
@class AWSredshiftClusterParameterGroupsMessage;
@class AWSredshiftClusterParameterStatus;
@class AWSredshiftClusterSecurityGroup;
@class AWSredshiftClusterSecurityGroupMembership;
@class AWSredshiftClusterSecurityGroupMessage;
@class AWSredshiftClusterSnapshotCopyStatus;
@class AWSredshiftClusterSubnetGroup;
@class AWSredshiftClusterSubnetGroupMessage;
@class AWSredshiftClusterVersion;
@class AWSredshiftClusterVersionsMessage;
@class AWSredshiftClustersMessage;
@class AWSredshiftReplicateClusterSnapshotMessage;
@class AWSredshiftReplicateClusterSnapshotResult;
@class AWSredshiftCreateClusterMessage;
@class AWSredshiftCreateClusterParameterGroupMessage;
@class AWSredshiftCreateClusterParameterGroupResult;
@class AWSredshiftCreateClusterResult;
@class AWSredshiftCreateClusterSecurityGroupMessage;
@class AWSredshiftCreateClusterSecurityGroupResult;
@class AWSredshiftCreateClusterSnapshotMessage;
@class AWSredshiftCreateClusterSnapshotResult;
@class AWSredshiftCreateClusterSubnetGroupMessage;
@class AWSredshiftCreateClusterSubnetGroupResult;
@class AWSredshiftCreateEventSubscriptionMessage;
@class AWSredshiftCreateEventSubscriptionResult;
@class AWSredshiftCreateHsmClientCertificateMessage;
@class AWSredshiftCreateHsmClientCertificateResult;
@class AWSredshiftCreateHsmConfigurationMessage;
@class AWSredshiftCreateHsmConfigurationResult;
@class AWSredshiftCreateScheduledActionMessage;
@class AWSredshiftCreateSnapshotCopyGrantMessage;
@class AWSredshiftCreateSnapshotCopyGrantResult;
@class AWSredshiftCreateSnapshotScheduleMessage;
@class AWSredshiftCreateTagsMessage;
@class AWSredshiftCreateUsageLimitMessage;
@class AWSredshiftCustomerStorageMessage;
@class AWSredshiftDataTransferProgress;
@class AWSredshiftDefaultClusterParameters;
@class AWSredshiftDeferredMaintenanceWindow;
@class AWSredshiftDeleteClusterMessage;
@class AWSredshiftDeleteClusterParameterGroupMessage;
@class AWSredshiftDeleteClusterResult;
@class AWSredshiftDeleteClusterSecurityGroupMessage;
@class AWSredshiftDeleteClusterSnapshotMessage;
@class AWSredshiftDeleteClusterSnapshotResult;
@class AWSredshiftDeleteClusterSubnetGroupMessage;
@class AWSredshiftDeleteEventSubscriptionMessage;
@class AWSredshiftDeleteHsmClientCertificateMessage;
@class AWSredshiftDeleteHsmConfigurationMessage;
@class AWSredshiftDeleteScheduledActionMessage;
@class AWSredshiftDeleteSnapshotCopyGrantMessage;
@class AWSredshiftDeleteSnapshotScheduleMessage;
@class AWSredshiftDeleteTagsMessage;
@class AWSredshiftDeleteUsageLimitMessage;
@class AWSredshiftDescribeAccountAttributesMessage;
@class AWSredshiftDescribeClusterDbRevisionsMessage;
@class AWSredshiftDescribeClusterParameterGroupsMessage;
@class AWSredshiftDescribeClusterParametersMessage;
@class AWSredshiftDescribeClusterSecurityGroupsMessage;
@class AWSredshiftDescribeClusterSnapshotsMessage;
@class AWSredshiftDescribeClusterSubnetGroupsMessage;
@class AWSredshiftDescribeClusterTracksMessage;
@class AWSredshiftDescribeClusterVersionsMessage;
@class AWSredshiftDescribeClustersMessage;
@class AWSredshiftDescribeDefaultClusterParametersMessage;
@class AWSredshiftDescribeDefaultClusterParametersResult;
@class AWSredshiftDescribeEventCategoriesMessage;
@class AWSredshiftDescribeEventSubscriptionsMessage;
@class AWSredshiftDescribeEventsMessage;
@class AWSredshiftDescribeHsmClientCertificatesMessage;
@class AWSredshiftDescribeHsmConfigurationsMessage;
@class AWSredshiftDescribeLoggingStatusMessage;
@class AWSredshiftDescribeNodeConfigurationOptionsMessage;
@class AWSredshiftDescribeOrderableClusterOptionsMessage;
@class AWSredshiftDescribeReservedNodeOfferingsMessage;
@class AWSredshiftDescribeReservedNodesMessage;
@class AWSredshiftDescribeResizeMessage;
@class AWSredshiftDescribeScheduledActionsMessage;
@class AWSredshiftDescribeSnapshotCopyGrantsMessage;
@class AWSredshiftDescribeSnapshotSchedulesMessage;
@class AWSredshiftDescribeSnapshotSchedulesOutputMessage;
@class AWSredshiftDescribeTableRestoreStatusMessage;
@class AWSredshiftDescribeTagsMessage;
@class AWSredshiftDescribeUsageLimitsMessage;
@class AWSredshiftDisableLoggingMessage;
@class AWSredshiftDisableSnapshotCopyMessage;
@class AWSredshiftDisableSnapshotCopyResult;
@class AWSredshiftEC2SecurityGroup;
@class AWSredshiftElasticIpStatus;
@class AWSredshiftEnableLoggingMessage;
@class AWSredshiftEnableSnapshotCopyMessage;
@class AWSredshiftEnableSnapshotCopyResult;
@class AWSredshiftEndpoint;
@class AWSredshiftEvent;
@class AWSredshiftEventCategoriesMap;
@class AWSredshiftEventCategoriesMessage;
@class AWSredshiftEventInfoMap;
@class AWSredshiftEventSubscription;
@class AWSredshiftEventSubscriptionsMessage;
@class AWSredshiftEventsMessage;
@class AWSredshiftGetClusterCredentialsMessage;
@class AWSredshiftGetReservedNodeExchangeOfferingsInputMessage;
@class AWSredshiftGetReservedNodeExchangeOfferingsOutputMessage;
@class AWSredshiftHsmClientCertificate;
@class AWSredshiftHsmClientCertificateMessage;
@class AWSredshiftHsmConfiguration;
@class AWSredshiftHsmConfigurationMessage;
@class AWSredshiftHsmStatus;
@class AWSredshiftIPRange;
@class AWSredshiftLoggingStatus;
@class AWSredshiftMaintenanceTrack;
@class AWSredshiftModifyClusterDbRevisionMessage;
@class AWSredshiftModifyClusterDbRevisionResult;
@class AWSredshiftModifyClusterIamRolesMessage;
@class AWSredshiftModifyClusterIamRolesResult;
@class AWSredshiftModifyClusterMaintenanceMessage;
@class AWSredshiftModifyClusterMaintenanceResult;
@class AWSredshiftModifyClusterMessage;
@class AWSredshiftModifyClusterParameterGroupMessage;
@class AWSredshiftModifyClusterResult;
@class AWSredshiftModifyClusterSnapshotMessage;
@class AWSredshiftModifyClusterSnapshotResult;
@class AWSredshiftModifyClusterSnapshotScheduleMessage;
@class AWSredshiftModifyClusterSubnetGroupMessage;
@class AWSredshiftModifyClusterSubnetGroupResult;
@class AWSredshiftModifyEventSubscriptionMessage;
@class AWSredshiftModifyEventSubscriptionResult;
@class AWSredshiftModifyScheduledActionMessage;
@class AWSredshiftModifySnapshotCopyRetentionPeriodMessage;
@class AWSredshiftModifySnapshotCopyRetentionPeriodResult;
@class AWSredshiftModifySnapshotScheduleMessage;
@class AWSredshiftModifyUsageLimitMessage;
@class AWSredshiftNodeConfigurationOption;
@class AWSredshiftNodeConfigurationOptionsFilter;
@class AWSredshiftNodeConfigurationOptionsMessage;
@class AWSredshiftOrderableClusterOption;
@class AWSredshiftOrderableClusterOptionsMessage;
@class AWSredshiftParameter;
@class AWSredshiftPauseClusterMessage;
@class AWSredshiftPauseClusterResult;
@class AWSredshiftPendingModifiedValues;
@class AWSredshiftPurchaseReservedNodeOfferingMessage;
@class AWSredshiftPurchaseReservedNodeOfferingResult;
@class AWSredshiftRebootClusterMessage;
@class AWSredshiftRebootClusterResult;
@class AWSredshiftRecurringCharge;
@class AWSredshiftReservedNode;
@class AWSredshiftReservedNodeOffering;
@class AWSredshiftReservedNodeOfferingsMessage;
@class AWSredshiftReservedNodesMessage;
@class AWSredshiftResetClusterParameterGroupMessage;
@class AWSredshiftResizeClusterMessage;
@class AWSredshiftResizeClusterResult;
@class AWSredshiftResizeInfo;
@class AWSredshiftResizeProgressMessage;
@class AWSredshiftRestoreFromClusterSnapshotMessage;
@class AWSredshiftRestoreFromClusterSnapshotResult;
@class AWSredshiftRestoreStatus;
@class AWSredshiftRestoreTableFromClusterSnapshotMessage;
@class AWSredshiftRestoreTableFromClusterSnapshotResult;
@class AWSredshiftResumeClusterMessage;
@class AWSredshiftResumeClusterResult;
@class AWSredshiftRevisionTarget;
@class AWSredshiftRevokeClusterSecurityGroupIngressMessage;
@class AWSredshiftRevokeClusterSecurityGroupIngressResult;
@class AWSredshiftRevokeSnapshotAccessMessage;
@class AWSredshiftRevokeSnapshotAccessResult;
@class AWSredshiftRotateEncryptionKeyMessage;
@class AWSredshiftRotateEncryptionKeyResult;
@class AWSredshiftScheduledAction;
@class AWSredshiftScheduledActionFilter;
@class AWSredshiftScheduledActionType;
@class AWSredshiftScheduledActionsMessage;
@class AWSredshiftSnapshot;
@class AWSredshiftSnapshotCopyGrant;
@class AWSredshiftSnapshotCopyGrantMessage;
@class AWSredshiftSnapshotErrorMessage;
@class AWSredshiftSnapshotMessage;
@class AWSredshiftSnapshotSchedule;
@class AWSredshiftSnapshotSortingEntity;
@class AWSredshiftSubnet;
@class AWSredshiftSupportedOperation;
@class AWSredshiftSupportedPlatform;
@class AWSredshiftTableRestoreStatus;
@class AWSredshiftTableRestoreStatusMessage;
@class AWSredshiftTag;
@class AWSredshiftTaggedResource;
@class AWSredshiftTaggedResourceListMessage;
@class AWSredshiftTrackListMessage;
@class AWSredshiftUpdateTarget;
@class AWSredshiftUsageLimit;
@class AWSredshiftUsageLimitList;
@class AWSredshiftVpcSecurityGroupMembership;

/**
 
 */
@interface AWSredshiftAcceptReservedNodeExchangeInputMessage : AWSRequest


/**
 <p>A string representing the node identifier of the DC1 Reserved Node to be exchanged.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedNodeId;

/**
 <p>The unique identifier of the DC2 Reserved Node offering to be used for the exchange. You can obtain the value for the parameter by calling <a>GetReservedNodeExchangeOfferings</a></p>
 */
@property (nonatomic, strong) NSString * _Nullable targetReservedNodeOfferingId;

@end

/**
 
 */
@interface AWSredshiftAcceptReservedNodeExchangeOutputMessage : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) AWSredshiftReservedNode * _Nullable exchangedReservedNode;

@end

/**
 <p>A name value pair that describes an aspect of an account. </p>
 */
@interface AWSredshiftAccountAttribute : AWSModel


/**
 <p>The name of the attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>A list of attribute values.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftAttributeValueTarget *> * _Nullable attributeValues;

@end

/**
 
 */
@interface AWSredshiftAccountAttributeList : AWSModel


/**
 <p>A list of attributes assigned to an account.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftAccountAttribute *> * _Nullable accountAttributes;

@end

/**
 <p>Describes an AWS customer account authorized to restore a snapshot.</p>
 */
@interface AWSredshiftAccountWithRestoreAccess : AWSModel


/**
 <p>The identifier of an AWS support account authorized to restore a snapshot. For AWS support, the identifier is <code>amazon-redshift-support</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable accountAlias;

/**
 <p>The identifier of an AWS customer account authorized to restore a snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

@end

/**
 <p>Describes an attribute value.</p>
 */
@interface AWSredshiftAttributeValueTarget : AWSModel


/**
 <p>The value of the attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeValue;

@end

/**
 <p/>
 Required parameters: [ClusterSecurityGroupName]
 */
@interface AWSredshiftAuthorizeClusterSecurityGroupIngressMessage : AWSRequest


/**
 <p>The IP range to be added the Amazon Redshift security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable CIDRIP;

/**
 <p>The name of the security group to which the ingress rule is added.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterSecurityGroupName;

/**
 <p>The EC2 security group to be added the Amazon Redshift security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupName;

/**
 <p>The AWS account number of the owner of the security group specified by the <i>EC2SecurityGroupName</i> parameter. The AWS Access Key ID is not an acceptable value. </p><p>Example: <code>111122223333</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupOwnerId;

@end

/**
 
 */
@interface AWSredshiftAuthorizeClusterSecurityGroupIngressResult : AWSModel


/**
 <p>Describes a security group.</p>
 */
@property (nonatomic, strong) AWSredshiftClusterSecurityGroup * _Nullable clusterSecurityGroup;

@end

/**
 <p/>
 Required parameters: [SnapshotIdentifier, AccountWithRestoreAccess]
 */
@interface AWSredshiftAuthorizeSnapshotAccessMessage : AWSRequest


/**
 <p>The identifier of the AWS customer account authorized to restore the specified snapshot.</p><p>To share a snapshot with AWS support, specify amazon-redshift-support.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountWithRestoreAccess;

/**
 <p>The identifier of the cluster the snapshot was created from. This parameter is required if your IAM user has a policy containing a snapshot resource element that specifies anything other than * for the cluster name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotClusterIdentifier;

/**
 <p>The identifier of the snapshot the account is authorized to restore.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotIdentifier;

@end

/**
 
 */
@interface AWSredshiftAuthorizeSnapshotAccessResult : AWSModel


/**
 <p>Describes a snapshot.</p>
 */
@property (nonatomic, strong) AWSredshiftSnapshot * _Nullable snapshot;

@end

/**
 <p>Describes an availability zone.</p>
 */
@interface AWSredshiftAvailabilityZone : AWSModel


/**
 <p>The name of the availability zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p/>
 */
@property (nonatomic, strong) NSArray<AWSredshiftSupportedPlatform *> * _Nullable supportedPlatforms;

@end

/**
 
 */
@interface AWSredshiftBatchDeleteClusterSnapshotsRequest : AWSRequest


/**
 <p>A list of identifiers for the snapshots that you want to delete.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftDeleteClusterSnapshotMessage *> * _Nullable identifiers;

@end

/**
 
 */
@interface AWSredshiftBatchDeleteClusterSnapshotsResult : AWSModel


/**
 <p>A list of any errors returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftSnapshotErrorMessage *> * _Nullable errors;

/**
 <p>A list of the snapshot identifiers that were deleted. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resources;

@end

/**
 
 */
@interface AWSredshiftBatchModifyClusterSnapshotsMessage : AWSRequest


/**
 <p>A boolean value indicating whether to override an exception if the retention period has passed. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

/**
 <p>The number of days that a manual snapshot is retained. If you specify the value -1, the manual snapshot is retained indefinitely.</p><p>The number must be either -1 or an integer between 1 and 3,653.</p><p>If you decrease the manual snapshot retention period from its current value, existing manual snapshots that fall outside of the new retention period will return an error. If you want to suppress the errors and delete the snapshots, use the force option. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable manualSnapshotRetentionPeriod;

/**
 <p>A list of snapshot identifiers you want to modify.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable snapshotIdentifierList;

@end

/**
 
 */
@interface AWSredshiftBatchModifyClusterSnapshotsOutputMessage : AWSModel


/**
 <p>A list of any errors returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftSnapshotErrorMessage *> * _Nullable errors;

/**
 <p>A list of the snapshots that were modified.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resources;

@end

/**
 
 */
@interface AWSredshiftCancelResizeMessage : AWSRequest


/**
 <p>The unique identifier for the cluster that you want to cancel a resize operation for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

@end

/**
 <p>Describes a cluster.</p>
 */
@interface AWSredshiftCluster : AWSModel


/**
 <p>A boolean value that, if <code>true</code>, indicates that major version upgrades will be applied automatically to the cluster during the maintenance window. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowVersionUpgrade;

/**
 <p>The number of days that automatic cluster snapshots are retained.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable automatedSnapshotRetentionPeriod;

/**
 <p>The name of the Availability Zone in which the cluster is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The availability status of the cluster for queries. Possible values are the following:</p><ul><li><p>Available - The cluster is available for queries. </p></li><li><p>Unavailable - The cluster is not available for queries.</p></li><li><p>Maintenance - The cluster is intermittently available for queries due to maintenance activities.</p></li><li><p>Modifying - The cluster is intermittently available for queries due to changes that modify the cluster.</p></li><li><p>Failed - The cluster failed and is not available for queries.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable clusterAvailabilityStatus;

/**
 <p>The date and time that the cluster was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable clusterCreateTime;

/**
 <p>The unique identifier of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>The nodes in the cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftClusterNode *> * _Nullable clusterNodes;

/**
 <p>The list of cluster parameter groups that are associated with this cluster. Each parameter group in the list is returned with its status.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftClusterParameterGroupStatus *> * _Nullable clusterParameterGroups;

/**
 <p>The public key for the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterPublicKey;

/**
 <p>The specific revision number of the database in the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterRevisionNumber;

/**
 <p>A list of cluster security group that are associated with the cluster. Each security group is represented by an element that contains <code>ClusterSecurityGroup.Name</code> and <code>ClusterSecurityGroup.Status</code> subelements. </p><p>Cluster security groups are used when the cluster is not created in an Amazon Virtual Private Cloud (VPC). Clusters that are created in a VPC use VPC security groups, which are listed by the <b>VpcSecurityGroups</b> parameter. </p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftClusterSecurityGroupMembership *> * _Nullable clusterSecurityGroups;

/**
 <p>A value that returns the destination region and retention period that are configured for cross-region snapshot copy.</p>
 */
@property (nonatomic, strong) AWSredshiftClusterSnapshotCopyStatus * _Nullable clusterSnapshotCopyStatus;

/**
 <p> The current state of the cluster. Possible values are the following:</p><ul><li><p><code>available</code></p></li><li><p><code>available, prep-for-resize</code></p></li><li><p><code>available, resize-cleanup</code></p></li><li><p><code>cancelling-resize</code></p></li><li><p><code>creating</code></p></li><li><p><code>deleting</code></p></li><li><p><code>final-snapshot</code></p></li><li><p><code>hardware-failure</code></p></li><li><p><code>incompatible-hsm</code></p></li><li><p><code>incompatible-network</code></p></li><li><p><code>incompatible-parameters</code></p></li><li><p><code>incompatible-restore</code></p></li><li><p><code>modifying</code></p></li><li><p><code>paused</code></p></li><li><p><code>rebooting</code></p></li><li><p><code>renaming</code></p></li><li><p><code>resizing</code></p></li><li><p><code>rotating-keys</code></p></li><li><p><code>storage-full</code></p></li><li><p><code>updating-hsm</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable clusterStatus;

/**
 <p>The name of the subnet group that is associated with the cluster. This parameter is valid only when the cluster is in a VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterSubnetGroupName;

/**
 <p>The version ID of the Amazon Redshift engine that is running on the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterVersion;

/**
 <p>The name of the initial database that was created when the cluster was created. This same name is returned for the life of the cluster. If an initial database was not specified, a database named <code>dev</code>dev was created by default. </p>
 */
@property (nonatomic, strong) NSString * _Nullable DBName;

/**
 <p/>
 */
@property (nonatomic, strong) AWSredshiftDataTransferProgress * _Nullable dataTransferProgress;

/**
 <p>Describes a group of <code>DeferredMaintenanceWindow</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftDeferredMaintenanceWindow *> * _Nullable deferredMaintenanceWindows;

/**
 <p>The status of the elastic IP (EIP) address.</p>
 */
@property (nonatomic, strong) AWSredshiftElasticIpStatus * _Nullable elasticIpStatus;

/**
 <p>The number of nodes that you can resize the cluster to with the elastic resize method. </p>
 */
@property (nonatomic, strong) NSString * _Nullable elasticResizeNumberOfNodeOptions;

/**
 <p>A boolean value that, if <code>true</code>, indicates that data in the cluster is encrypted at rest.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encrypted;

/**
 <p>The connection endpoint.</p>
 */
@property (nonatomic, strong) AWSredshiftEndpoint * _Nullable endpoint;

/**
 <p>An option that specifies whether to create the cluster with enhanced VPC routing enabled. To create a cluster that uses enhanced VPC routing, the cluster must be in a VPC. For more information, see <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html">Enhanced VPC Routing</a> in the Amazon Redshift Cluster Management Guide.</p><p>If this option is <code>true</code>, enhanced VPC routing is enabled. </p><p>Default: false</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enhancedVpcRouting;

/**
 <p>The date and time when the next snapshot is expected to be taken for clusters with a valid snapshot schedule and backups enabled. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable expectedNextSnapshotScheduleTime;

/**
 <p> The status of next expected snapshot for clusters having a valid snapshot schedule and backups enabled. Possible values are the following:</p><ul><li><p>OnTrack - The next snapshot is expected to be taken on time. </p></li><li><p>Pending - The next snapshot is pending to be taken. </p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable expectedNextSnapshotScheduleTimeStatus;

/**
 <p>A value that reports whether the Amazon Redshift cluster has finished applying any hardware security module (HSM) settings changes specified in a modify cluster command.</p><p>Values: active, applying</p>
 */
@property (nonatomic, strong) AWSredshiftHsmStatus * _Nullable hsmStatus;

/**
 <p>A list of AWS Identity and Access Management (IAM) roles that can be used by the cluster to access other AWS services.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftClusterIamRole *> * _Nullable iamRoles;

/**
 <p>The AWS Key Management Service (AWS KMS) key ID of the encryption key used to encrypt data in the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The name of the maintenance track for the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maintenanceTrackName;

/**
 <p>The default number of days to retain a manual snapshot. If the value is -1, the snapshot is retained indefinitely. This setting doesn't change the retention period of existing snapshots.</p><p>The value must be either -1 or an integer between 1 and 3,653.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable manualSnapshotRetentionPeriod;

/**
 <p>The master user name for the cluster. This name is used to connect to the database that is specified in the <b>DBName</b> parameter. </p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUsername;

/**
 <p>The status of a modify operation, if any, initiated for the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modifyStatus;

/**
 <p>The date and time in UTC when system maintenance can begin.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable nextMaintenanceWindowStartTime;

/**
 <p>The node type for the nodes in the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeType;

/**
 <p>The number of compute nodes in the cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfNodes;

/**
 <p>Cluster operations that are waiting to be started.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable pendingActions;

/**
 <p>A value that, if present, indicates that changes to the cluster are pending. Specific pending changes are identified by subelements.</p>
 */
@property (nonatomic, strong) AWSredshiftPendingModifiedValues * _Nullable pendingModifiedValues;

/**
 <p>The weekly time range, in Universal Coordinated Time (UTC), during which system maintenance can occur.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>A boolean value that, if <code>true</code>, indicates that the cluster can be accessed from a public network.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publiclyAccessible;

/**
 <p>Returns the following:</p><ul><li><p>AllowCancelResize: a boolean value indicating if the resize operation can be cancelled.</p></li><li><p>ResizeType: Returns ClassicResize</p></li></ul>
 */
@property (nonatomic, strong) AWSredshiftResizeInfo * _Nullable resizeInfo;

/**
 <p>A value that describes the status of a cluster restore action. This parameter returns null if the cluster was not created by restoring a snapshot.</p>
 */
@property (nonatomic, strong) AWSredshiftRestoreStatus * _Nullable restoreStatus;

/**
 <p>A unique identifier for the cluster snapshot schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotScheduleIdentifier;

/**
 <p>The current state of the cluster snapshot schedule.</p>
 */
@property (nonatomic, assign) AWSredshiftScheduleState snapshotScheduleState;

/**
 <p>The list of tags for the cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

/**
 <p>The identifier of the VPC the cluster is in, if the cluster is in a VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

/**
 <p>A list of Amazon Virtual Private Cloud (Amazon VPC) security groups that are associated with the cluster. This parameter is returned only if the cluster is in a VPC.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftVpcSecurityGroupMembership *> * _Nullable vpcSecurityGroups;

@end

/**
 <p/>
 */
@interface AWSredshiftClusterAssociatedToSchedule : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p/>
 */
@property (nonatomic, assign) AWSredshiftScheduleState scheduleAssociationState;

@end

/**
 <p>Temporary credentials with authorization to log on to an Amazon Redshift database. </p>
 */
@interface AWSredshiftClusterCredentials : AWSModel


/**
 <p>A temporary password that authorizes the user name returned by <code>DbUser</code> to log on to the database <code>DbName</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable dbPassword;

/**
 <p>A database user name that is authorized to log on to the database <code>DbName</code> using the password <code>DbPassword</code>. If the specified DbUser exists in the database, the new user name has the same database privileges as the the user named in DbUser. By default, the user is added to PUBLIC. If the <code>DbGroups</code> parameter is specifed, <code>DbUser</code> is added to the listed groups for any sessions created using these credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dbUser;

/**
 <p>The date and time the password in <code>DbPassword</code> expires.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expiration;

@end

/**
 <p>Describes a <code>ClusterDbRevision</code>.</p>
 */
@interface AWSredshiftClusterDbRevision : AWSModel


/**
 <p>The unique identifier of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>A string representing the current cluster version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentDatabaseRevision;

/**
 <p>The date on which the database revision was released.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable databaseRevisionReleaseDate;

/**
 <p>A list of <code>RevisionTarget</code> objects, where each object describes the database revision that a cluster can be updated to.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftRevisionTarget *> * _Nullable revisionTargets;

@end

/**
 
 */
@interface AWSredshiftClusterDbRevisionsMessage : AWSModel


/**
 <p>A list of revisions.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftClusterDbRevision *> * _Nullable clusterDbRevisions;

/**
 <p>A string representing the starting point for the next set of revisions. If a value is returned in a response, you can retrieve the next set of revisions by providing the value in the <code>marker</code> parameter and retrying the command. If the <code>marker</code> field is empty, all revisions have already been returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>An AWS Identity and Access Management (IAM) role that can be used by the associated Amazon Redshift cluster to access other AWS services.</p>
 */
@interface AWSredshiftClusterIamRole : AWSModel


/**
 <p>A value that describes the status of the IAM role's association with an Amazon Redshift cluster.</p><p>The following are possible statuses and descriptions.</p><ul><li><p><code>in-sync</code>: The role is available for use by the cluster.</p></li><li><p><code>adding</code>: The role is in the process of being associated with the cluster.</p></li><li><p><code>removing</code>: The role is in the process of being disassociated with the cluster.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable applyStatus;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role, for example, <code>arn:aws:iam::123456789012:role/RedshiftCopyUnload</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRoleArn;

@end

/**
 <p>The identifier of a node in a cluster.</p>
 */
@interface AWSredshiftClusterNode : AWSModel


/**
 <p>Whether the node is a leader node or a compute node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeRole;

/**
 <p>The private IP address of a node within a cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIPAddress;

/**
 <p>The public IP address of a node within a cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicIPAddress;

@end

/**
 <p>Describes a parameter group.</p>
 */
@interface AWSredshiftClusterParameterGroup : AWSModel


/**
 <p>The description of the parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the cluster parameter group family that this cluster parameter group is compatible with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterGroupFamily;

/**
 <p>The name of the cluster parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterGroupName;

/**
 <p>The list of tags for the cluster parameter group.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

@end

/**
 <p>Contains the output from the <a>DescribeClusterParameters</a> action. </p>
 */
@interface AWSredshiftClusterParameterGroupDetails : AWSModel


/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>Marker</code> parameter and retrying the command. If the <code>Marker</code> field is empty, all response records have been retrieved for the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of <a>Parameter</a> instances. Each instance lists the parameters of one cluster parameter group. </p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftParameter *> * _Nullable parameters;

@end

/**
 <p/>
 */
@interface AWSredshiftClusterParameterGroupNameMessage : AWSModel


/**
 <p>The name of the cluster parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterGroupName;

/**
 <p>The status of the parameter group. For example, if you made a change to a parameter group name-value pair, then the change could be pending a reboot of an associated cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterGroupStatus;

@end

/**
 <p>Describes the status of a parameter group.</p>
 */
@interface AWSredshiftClusterParameterGroupStatus : AWSModel


/**
 <p>The list of parameter statuses.</p><p> For more information about parameters and parameter groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftClusterParameterStatus *> * _Nullable clusterParameterStatusList;

/**
 <p>The status of parameter updates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterApplyStatus;

/**
 <p>The name of the cluster parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterGroupName;

@end

/**
 <p>Contains the output from the <a>DescribeClusterParameterGroups</a> action. </p>
 */
@interface AWSredshiftClusterParameterGroupsMessage : AWSModel


/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>Marker</code> parameter and retrying the command. If the <code>Marker</code> field is empty, all response records have been retrieved for the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of <a>ClusterParameterGroup</a> instances. Each instance describes one cluster parameter group. </p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftClusterParameterGroup *> * _Nullable parameterGroups;

@end

/**
 <p>Describes the status of a parameter group.</p>
 */
@interface AWSredshiftClusterParameterStatus : AWSModel


/**
 <p>The error that prevented the parameter from being applied to the database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterApplyErrorDescription;

/**
 <p>The status of the parameter that indicates whether the parameter is in sync with the database, waiting for a cluster reboot, or encountered an error when being applied.</p><p>The following are possible statuses and descriptions.</p><ul><li><p><code>in-sync</code>: The parameter value is in sync with the database.</p></li><li><p><code>pending-reboot</code>: The parameter value will be applied after the cluster reboots.</p></li><li><p><code>applying</code>: The parameter value is being applied to the database.</p></li><li><p><code>invalid-parameter</code>: Cannot apply the parameter value because it has an invalid value or syntax.</p></li><li><p><code>apply-deferred</code>: The parameter contains static property changes. The changes are deferred until the cluster reboots.</p></li><li><p><code>apply-error</code>: Cannot connect to the cluster. The parameter change will be applied after the cluster reboots.</p></li><li><p><code>unknown-error</code>: Cannot apply the parameter change right now. The change will be applied after the cluster reboots.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable parameterApplyStatus;

/**
 <p>The name of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterName;

@end

/**
 <p>Describes a security group.</p>
 */
@interface AWSredshiftClusterSecurityGroup : AWSModel


/**
 <p>The name of the cluster security group to which the operation was applied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterSecurityGroupName;

/**
 <p>A description of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A list of EC2 security groups that are permitted to access clusters associated with this cluster security group.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftEC2SecurityGroup *> * _Nullable EC2SecurityGroups;

/**
 <p>A list of IP ranges (CIDR blocks) that are permitted to access clusters associated with this cluster security group.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftIPRange *> * _Nullable IPRanges;

/**
 <p>The list of tags for the cluster security group.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

@end

/**
 <p>Describes a cluster security group.</p>
 */
@interface AWSredshiftClusterSecurityGroupMembership : AWSModel


/**
 <p>The name of the cluster security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterSecurityGroupName;

/**
 <p>The status of the cluster security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p/>
 */
@interface AWSredshiftClusterSecurityGroupMessage : AWSModel


/**
 <p>A list of <a>ClusterSecurityGroup</a> instances. </p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftClusterSecurityGroup *> * _Nullable clusterSecurityGroups;

/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>Marker</code> parameter and retrying the command. If the <code>Marker</code> field is empty, all response records have been retrieved for the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>Returns the destination region and retention period that are configured for cross-region snapshot copy.</p>
 */
@interface AWSredshiftClusterSnapshotCopyStatus : AWSModel


/**
 <p>The destination region that snapshots are automatically copied to when cross-region snapshot copy is enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationRegion;

/**
 <p>The number of days that automated snapshots are retained in the destination region after they are copied from a source region. If the value is -1, the manual snapshot is retained indefinitely. </p><p>The value must be either -1 or an integer between 1 and 3,653.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable manualSnapshotRetentionPeriod;

/**
 <p>The number of days that automated snapshots are retained in the destination region after they are copied from a source region.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retentionPeriod;

/**
 <p>The name of the snapshot copy grant.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotCopyGrantName;

@end

/**
 <p>Describes a subnet group.</p>
 */
@interface AWSredshiftClusterSubnetGroup : AWSModel


/**
 <p>The name of the cluster subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterSubnetGroupName;

/**
 <p>The description of the cluster subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The status of the cluster subnet group. Possible values are <code>Complete</code>, <code>Incomplete</code> and <code>Invalid</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetGroupStatus;

/**
 <p>A list of the VPC <a>Subnet</a> elements. </p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftSubnet *> * _Nullable subnets;

/**
 <p>The list of tags for the cluster subnet group.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

/**
 <p>The VPC ID of the cluster subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the output from the <a>DescribeClusterSubnetGroups</a> action. </p>
 */
@interface AWSredshiftClusterSubnetGroupMessage : AWSModel


/**
 <p>A list of <a>ClusterSubnetGroup</a> instances. </p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftClusterSubnetGroup *> * _Nullable clusterSubnetGroups;

/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>Marker</code> parameter and retrying the command. If the <code>Marker</code> field is empty, all response records have been retrieved for the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>Describes a cluster version, including the parameter group family and description of the version.</p>
 */
@interface AWSredshiftClusterVersion : AWSModel


/**
 <p>The name of the cluster parameter group family for the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterParameterGroupFamily;

/**
 <p>The version number used by the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterVersion;

/**
 <p>The description of the cluster version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 <p>Contains the output from the <a>DescribeClusterVersions</a> action. </p>
 */
@interface AWSredshiftClusterVersionsMessage : AWSModel


/**
 <p>A list of <code>Version</code> elements. </p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftClusterVersion *> * _Nullable clusterVersions;

/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>Marker</code> parameter and retrying the command. If the <code>Marker</code> field is empty, all response records have been retrieved for the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>Contains the output from the <a>DescribeClusters</a> action. </p>
 */
@interface AWSredshiftClustersMessage : AWSModel


/**
 <p>A list of <code>Cluster</code> objects, where each object describes one cluster. </p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftCluster *> * _Nullable clusters;

/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>Marker</code> parameter and retrying the command. If the <code>Marker</code> field is empty, all response records have been retrieved for the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p/>
 Required parameters: [SourceSnapshotIdentifier, TargetSnapshotIdentifier]
 */
@interface AWSredshiftReplicateClusterSnapshotMessage : AWSRequest


/**
 <p>The number of days that a manual snapshot is retained. If the value is -1, the manual snapshot is retained indefinitely. </p><p>The value must be either -1 or an integer between 1 and 3,653.</p><p>The default value is -1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable manualSnapshotRetentionPeriod;

/**
 <p>The identifier of the cluster the source snapshot was created from. This parameter is required if your IAM user has a policy containing a snapshot resource element that specifies anything other than * for the cluster name.</p><p>Constraints:</p><ul><li><p>Must be the identifier for a valid cluster.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable sourceSnapshotClusterIdentifier;

/**
 <p>The identifier for the source snapshot.</p><p>Constraints:</p><ul><li><p>Must be the identifier for a valid automated snapshot whose state is <code>available</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable sourceSnapshotIdentifier;

/**
 <p>The identifier given to the new manual snapshot.</p><p>Constraints:</p><ul><li><p>Cannot be null, empty, or blank.</p></li><li><p>Must contain from 1 to 255 alphanumeric characters or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Cannot end with a hyphen or contain two consecutive hyphens.</p></li><li><p>Must be unique for the AWS account that is making the request.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable targetSnapshotIdentifier;

@end

/**
 
 */
@interface AWSredshiftReplicateClusterSnapshotResult : AWSModel


/**
 <p>Describes a snapshot.</p>
 */
@property (nonatomic, strong) AWSredshiftSnapshot * _Nullable snapshot;

@end

/**
 <p/>
 Required parameters: [ClusterIdentifier, NodeType, MasterUsername, MasterUserPassword]
 */
@interface AWSredshiftCreateClusterMessage : AWSRequest


/**
 <p>Reserved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable additionalInfo;

/**
 <p>If <code>true</code>, major version upgrades can be applied during the maintenance window to the Amazon Redshift engine that is running on the cluster.</p><p>When a new major version of the Amazon Redshift engine is released, you can request that the service automatically apply upgrades during the maintenance window to the Amazon Redshift engine that is running on your cluster.</p><p>Default: <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowVersionUpgrade;

/**
 <p>The number of days that automated snapshots are retained. If the value is 0, automated snapshots are disabled. Even if automated snapshots are disabled, you can still create manual snapshots when you want with <a>CreateClusterSnapshot</a>. </p><p>Default: <code>1</code></p><p>Constraints: Must be a value from 0 to 35.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable automatedSnapshotRetentionPeriod;

/**
 <p>The EC2 Availability Zone (AZ) in which you want Amazon Redshift to provision the cluster. For example, if you have several EC2 instances running in a specific Availability Zone, then you might want the cluster to be provisioned in the same zone in order to decrease network latency.</p><p>Default: A random, system-chosen Availability Zone in the region that is specified by the endpoint.</p><p>Example: <code>us-east-2d</code></p><p>Constraint: The specified Availability Zone must be in the same region as the current endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>A unique identifier for the cluster. You use this identifier to refer to the cluster for any subsequent cluster operations such as deleting or modifying. The identifier also appears in the Amazon Redshift console.</p><p>Constraints:</p><ul><li><p>Must contain from 1 to 63 alphanumeric characters or hyphens.</p></li><li><p>Alphabetic characters must be lowercase.</p></li><li><p>First character must be a letter.</p></li><li><p>Cannot end with a hyphen or contain two consecutive hyphens.</p></li><li><p>Must be unique for all clusters within an AWS account.</p></li></ul><p>Example: <code>myexamplecluster</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>The name of the parameter group to be associated with this cluster.</p><p>Default: The default Amazon Redshift cluster parameter group. For information about the default parameter group, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Working with Amazon Redshift Parameter Groups</a></p><p>Constraints:</p><ul><li><p>Must be 1 to 255 alphanumeric characters or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Cannot end with a hyphen or contain two consecutive hyphens.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable clusterParameterGroupName;

/**
 <p>A list of security groups to be associated with this cluster.</p><p>Default: The default cluster security group for Amazon Redshift.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable clusterSecurityGroups;

/**
 <p>The name of a cluster subnet group to be associated with this cluster.</p><p>If this parameter is not provided the resulting cluster will be deployed outside virtual private cloud (VPC).</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterSubnetGroupName;

/**
 <p>The type of the cluster. When cluster type is specified as</p><ul><li><p><code>single-node</code>, the <b>NumberOfNodes</b> parameter is not required.</p></li><li><p><code>multi-node</code>, the <b>NumberOfNodes</b> parameter is required.</p></li></ul><p>Valid Values: <code>multi-node</code> | <code>single-node</code></p><p>Default: <code>multi-node</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterType;

/**
 <p>The version of the Amazon Redshift engine software that you want to deploy on the cluster.</p><p>The version selected runs on all the nodes in the cluster.</p><p>Constraints: Only version 1.0 is currently available.</p><p>Example: <code>1.0</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterVersion;

/**
 <p>The name of the first database to be created when the cluster is created.</p><p>To create additional databases after the cluster is created, connect to the cluster with a SQL client and use SQL commands to create a database. For more information, go to <a href="https://docs.aws.amazon.com/redshift/latest/dg/t_creating_database.html">Create a Database</a> in the Amazon Redshift Database Developer Guide. </p><p>Default: <code>dev</code></p><p>Constraints:</p><ul><li><p>Must contain 1 to 64 alphanumeric characters.</p></li><li><p>Must contain only lowercase letters.</p></li><li><p>Cannot be a word that is reserved by the service. A list of reserved words can be found in <a href="https://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html">Reserved Words</a> in the Amazon Redshift Database Developer Guide. </p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBName;

/**
 <p>The Elastic IP (EIP) address for the cluster.</p><p>Constraints: The cluster must be provisioned in EC2-VPC and publicly-accessible through an Internet gateway. For more information about provisioning clusters in EC2-VPC, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#cluster-platforms">Supported Platforms to Launch Your Cluster</a> in the Amazon Redshift Cluster Management Guide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable elasticIp;

/**
 <p>If <code>true</code>, the data in the cluster is encrypted at rest. </p><p>Default: false</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encrypted;

/**
 <p>An option that specifies whether to create the cluster with enhanced VPC routing enabled. To create a cluster that uses enhanced VPC routing, the cluster must be in a VPC. For more information, see <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html">Enhanced VPC Routing</a> in the Amazon Redshift Cluster Management Guide.</p><p>If this option is <code>true</code>, enhanced VPC routing is enabled. </p><p>Default: false</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enhancedVpcRouting;

/**
 <p>Specifies the name of the HSM client certificate the Amazon Redshift cluster uses to retrieve the data encryption keys stored in an HSM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmClientCertificateIdentifier;

/**
 <p>Specifies the name of the HSM configuration that contains the information the Amazon Redshift cluster can use to retrieve and store keys in an HSM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmConfigurationIdentifier;

/**
 <p>A list of AWS Identity and Access Management (IAM) roles that can be used by the cluster to access other AWS services. You must supply the IAM roles in their Amazon Resource Name (ARN) format. You can supply up to 10 IAM roles in a single request.</p><p>A cluster can have up to 10 IAM roles associated with it at any time.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable iamRoles;

/**
 <p>The AWS Key Management Service (KMS) key ID of the encryption key that you want to use to encrypt data in the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>An optional parameter for the name of the maintenance track for the cluster. If you don't provide a maintenance track name, the cluster is assigned to the <code>current</code> track.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maintenanceTrackName;

/**
 <p>The default number of days to retain a manual snapshot. If the value is -1, the snapshot is retained indefinitely. This setting doesn't change the retention period of existing snapshots.</p><p>The value must be either -1 or an integer between 1 and 3,653.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable manualSnapshotRetentionPeriod;

/**
 <p>The password associated with the master user account for the cluster that is being created.</p><p>Constraints:</p><ul><li><p>Must be between 8 and 64 characters in length.</p></li><li><p>Must contain at least one uppercase letter.</p></li><li><p>Must contain at least one lowercase letter.</p></li><li><p>Must contain one number.</p></li><li><p>Can be any printable ASCII character (ASCII code 33 to 126) except ' (single quote), " (double quote), \, /, @, or space.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable masterUserPassword;

/**
 <p>The user name associated with the master user account for the cluster that is being created.</p><p>Constraints:</p><ul><li><p>Must be 1 - 128 alphanumeric characters. The user name can't be <code>PUBLIC</code>.</p></li><li><p>First character must be a letter.</p></li><li><p>Cannot be a reserved word. A list of reserved words can be found in <a href="https://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html">Reserved Words</a> in the Amazon Redshift Database Developer Guide. </p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable masterUsername;

/**
 <p>The node type to be provisioned for the cluster. For information about node types, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#how-many-nodes"> Working with Clusters</a> in the <i>Amazon Redshift Cluster Management Guide</i>. </p><p>Valid Values: <code>ds2.xlarge</code> | <code>ds2.8xlarge</code> | <code>dc1.large</code> | <code>dc1.8xlarge</code> | <code>dc2.large</code> | <code>dc2.8xlarge</code> | <code>ra3.4xlarge</code> | <code>ra3.16xlarge</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeType;

/**
 <p>The number of compute nodes in the cluster. This parameter is required when the <b>ClusterType</b> parameter is specified as <code>multi-node</code>. </p><p>For information about determining how many nodes you need, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#how-many-nodes"> Working with Clusters</a> in the <i>Amazon Redshift Cluster Management Guide</i>. </p><p>If you don't specify this parameter, you get a single-node cluster. When requesting a multi-node cluster, you must specify the number of nodes that you want in the cluster.</p><p>Default: <code>1</code></p><p>Constraints: Value must be at least 1 and no more than 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfNodes;

/**
 <p>The port number on which the cluster accepts incoming connections.</p><p>The cluster is accessible only via the JDBC and ODBC connection strings. Part of the connection string requires the port on which the cluster will listen for incoming connections.</p><p>Default: <code>5439</code></p><p>Valid Values: <code>1150-65535</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The weekly time range (in UTC) during which automated cluster maintenance can occur.</p><p> Format: <code>ddd:hh24:mi-ddd:hh24:mi</code></p><p> Default: A 30-minute window selected at random from an 8-hour block of time per region, occurring on a random day of the week. For more information about the time blocks for each region, see <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#rs-maintenance-windows">Maintenance Windows</a> in Amazon Redshift Cluster Management Guide.</p><p>Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun</p><p>Constraints: Minimum 30-minute window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>If <code>true</code>, the cluster can be accessed from a public network. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publiclyAccessible;

/**
 <p>A unique identifier for the snapshot schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotScheduleIdentifier;

/**
 <p>A list of tag instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

/**
 <p>A list of Virtual Private Cloud (VPC) security groups to be associated with the cluster.</p><p>Default: The default VPC security group is associated with the cluster.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSecurityGroupIds;

@end

/**
 <p/>
 Required parameters: [ParameterGroupName, ParameterGroupFamily, Description]
 */
@interface AWSredshiftCreateClusterParameterGroupMessage : AWSRequest


/**
 <p>A description of the parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The Amazon Redshift engine version to which the cluster parameter group applies. The cluster engine version determines the set of parameters.</p><p>To get a list of valid parameter group family names, you can call <a>DescribeClusterParameterGroups</a>. By default, Amazon Redshift returns a list of all the parameter groups that are owned by your AWS account, including the default parameter groups for each Amazon Redshift engine version. The parameter group family names associated with the default parameter groups provide you the valid values. For example, a valid family name is "redshift-1.0". </p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterGroupFamily;

/**
 <p>The name of the cluster parameter group.</p><p>Constraints:</p><ul><li><p>Must be 1 to 255 alphanumeric characters or hyphens</p></li><li><p>First character must be a letter.</p></li><li><p>Cannot end with a hyphen or contain two consecutive hyphens.</p></li><li><p>Must be unique withing your AWS account.</p></li></ul><note><p>This value is stored as a lower-case string.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable parameterGroupName;

/**
 <p>A list of tag instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSredshiftCreateClusterParameterGroupResult : AWSModel


/**
 <p>Describes a parameter group.</p>
 */
@property (nonatomic, strong) AWSredshiftClusterParameterGroup * _Nullable clusterParameterGroup;

@end

/**
 
 */
@interface AWSredshiftCreateClusterResult : AWSModel


/**
 <p>Describes a cluster.</p>
 */
@property (nonatomic, strong) AWSredshiftCluster * _Nullable cluster;

@end

/**
 <p/>
 Required parameters: [ClusterSecurityGroupName, Description]
 */
@interface AWSredshiftCreateClusterSecurityGroupMessage : AWSRequest


/**
 <p>The name for the security group. Amazon Redshift stores the value as a lowercase string.</p><p>Constraints:</p><ul><li><p>Must contain no more than 255 alphanumeric characters or hyphens.</p></li><li><p>Must not be "Default".</p></li><li><p>Must be unique for all security groups that are created by your AWS account.</p></li></ul><p>Example: <code>examplesecuritygroup</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterSecurityGroupName;

/**
 <p>A description for the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A list of tag instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSredshiftCreateClusterSecurityGroupResult : AWSModel


/**
 <p>Describes a security group.</p>
 */
@property (nonatomic, strong) AWSredshiftClusterSecurityGroup * _Nullable clusterSecurityGroup;

@end

/**
 <p/>
 Required parameters: [SnapshotIdentifier, ClusterIdentifier]
 */
@interface AWSredshiftCreateClusterSnapshotMessage : AWSRequest


/**
 <p>The cluster identifier for which you want a snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>The number of days that a manual snapshot is retained. If the value is -1, the manual snapshot is retained indefinitely. </p><p>The value must be either -1 or an integer between 1 and 3,653.</p><p>The default value is -1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable manualSnapshotRetentionPeriod;

/**
 <p>A unique identifier for the snapshot that you are requesting. This identifier must be unique for all snapshots within the AWS account.</p><p>Constraints:</p><ul><li><p>Cannot be null, empty, or blank</p></li><li><p>Must contain from 1 to 255 alphanumeric characters or hyphens</p></li><li><p>First character must be a letter</p></li><li><p>Cannot end with a hyphen or contain two consecutive hyphens</p></li></ul><p>Example: <code>my-snapshot-id</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotIdentifier;

/**
 <p>A list of tag instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSredshiftCreateClusterSnapshotResult : AWSModel


/**
 <p>Describes a snapshot.</p>
 */
@property (nonatomic, strong) AWSredshiftSnapshot * _Nullable snapshot;

@end

/**
 <p/>
 Required parameters: [ClusterSubnetGroupName, Description, SubnetIds]
 */
@interface AWSredshiftCreateClusterSubnetGroupMessage : AWSRequest


/**
 <p>The name for the subnet group. Amazon Redshift stores the value as a lowercase string.</p><p>Constraints:</p><ul><li><p>Must contain no more than 255 alphanumeric characters or hyphens.</p></li><li><p>Must not be "Default".</p></li><li><p>Must be unique for all subnet groups that are created by your AWS account.</p></li></ul><p>Example: <code>examplesubnetgroup</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterSubnetGroupName;

/**
 <p>A description for the subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>An array of VPC subnet IDs. A maximum of 20 subnets can be modified in a single request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>A list of tag instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSredshiftCreateClusterSubnetGroupResult : AWSModel


/**
 <p>Describes a subnet group.</p>
 */
@property (nonatomic, strong) AWSredshiftClusterSubnetGroup * _Nullable clusterSubnetGroup;

@end

/**
 <p/>
 Required parameters: [SubscriptionName, SnsTopicArn]
 */
@interface AWSredshiftCreateEventSubscriptionMessage : AWSRequest


/**
 <p>A boolean value; set to <code>true</code> to activate the subscription, and set to <code>false</code> to create the subscription but not activate it. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>Specifies the Amazon Redshift event categories to be published by the event notification subscription.</p><p>Values: configuration, management, monitoring, security</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventCategories;

/**
 <p>Specifies the Amazon Redshift event severity to be published by the event notification subscription.</p><p>Values: ERROR, INFO</p>
 */
@property (nonatomic, strong) NSString * _Nullable severity;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon SNS topic used to transmit the event notifications. The ARN is created by Amazon SNS when you create a topic and subscribe to it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snsTopicArn;

/**
 <p>A list of one or more identifiers of Amazon Redshift source objects. All of the objects must be of the same type as was specified in the source type parameter. The event subscription will return only events generated by the specified objects. If not specified, then events are returned for all objects within the source type specified.</p><p>Example: my-cluster-1, my-cluster-2</p><p>Example: my-snapshot-20131010</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sourceIds;

/**
 <p>The type of source that will be generating the events. For example, if you want to be notified of events generated by a cluster, you would set this parameter to cluster. If this value is not specified, events are returned for all Amazon Redshift objects in your AWS account. You must specify a source type in order to specify source IDs.</p><p>Valid values: cluster, cluster-parameter-group, cluster-security-group, cluster-snapshot, and scheduled-action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

/**
 <p>The name of the event subscription to be created.</p><p>Constraints:</p><ul><li><p>Cannot be null, empty, or blank.</p></li><li><p>Must contain from 1 to 255 alphanumeric characters or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Cannot end with a hyphen or contain two consecutive hyphens.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionName;

/**
 <p>A list of tag instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSredshiftCreateEventSubscriptionResult : AWSModel


/**
 <p>Describes event subscriptions.</p>
 */
@property (nonatomic, strong) AWSredshiftEventSubscription * _Nullable eventSubscription;

@end

/**
 <p/>
 Required parameters: [HsmClientCertificateIdentifier]
 */
@interface AWSredshiftCreateHsmClientCertificateMessage : AWSRequest


/**
 <p>The identifier to be assigned to the new HSM client certificate that the cluster will use to connect to the HSM to use the database encryption keys.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmClientCertificateIdentifier;

/**
 <p>A list of tag instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSredshiftCreateHsmClientCertificateResult : AWSModel


/**
 <p>Returns information about an HSM client certificate. The certificate is stored in a secure Hardware Storage Module (HSM), and used by the Amazon Redshift cluster to encrypt data files.</p>
 */
@property (nonatomic, strong) AWSredshiftHsmClientCertificate * _Nullable hsmClientCertificate;

@end

/**
 <p/>
 Required parameters: [HsmConfigurationIdentifier, Description, HsmIpAddress, HsmPartitionName, HsmPartitionPassword, HsmServerPublicCertificate]
 */
@interface AWSredshiftCreateHsmConfigurationMessage : AWSRequest


/**
 <p>A text description of the HSM configuration to be created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier to be assigned to the new Amazon Redshift HSM configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmConfigurationIdentifier;

/**
 <p>The IP address that the Amazon Redshift cluster must use to access the HSM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmIpAddress;

/**
 <p>The name of the partition in the HSM where the Amazon Redshift clusters will store their database encryption keys.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmPartitionName;

/**
 <p>The password required to access the HSM partition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmPartitionPassword;

/**
 <p>The HSMs public certificate file. When using Cloud HSM, the file name is server.pem.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmServerPublicCertificate;

/**
 <p>A list of tag instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSredshiftCreateHsmConfigurationResult : AWSModel


/**
 <p>Returns information about an HSM configuration, which is an object that describes to Amazon Redshift clusters the information they require to connect to an HSM where they can store database encryption keys.</p>
 */
@property (nonatomic, strong) AWSredshiftHsmConfiguration * _Nullable hsmConfiguration;

@end

/**
 
 */
@interface AWSredshiftCreateScheduledActionMessage : AWSRequest


/**
 <p>If true, the schedule is enabled. If false, the scheduled action does not trigger. For more information about <code>state</code> of the scheduled action, see <a>ScheduledAction</a>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enable;

/**
 <p>The end time in UTC of the scheduled action. After this time, the scheduled action does not trigger. For more information about this parameter, see <a>ScheduledAction</a>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The IAM role to assume to run the target action. For more information about this parameter, see <a>ScheduledAction</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRole;

/**
 <p>The schedule in <code>at( )</code> or <code>cron( )</code> format. For more information about this parameter, see <a>ScheduledAction</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

/**
 <p>The description of the scheduled action. </p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledActionDescription;

/**
 <p>The name of the scheduled action. The name must be unique within an account. For more information about this parameter, see <a>ScheduledAction</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledActionName;

/**
 <p>The start time in UTC of the scheduled action. Before this time, the scheduled action does not trigger. For more information about this parameter, see <a>ScheduledAction</a>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>A JSON format string of the Amazon Redshift API operation with input parameters. For more information about this parameter, see <a>ScheduledAction</a>. </p>
 */
@property (nonatomic, strong) AWSredshiftScheduledActionType * _Nullable targetAction;

@end

/**
 <p>The result of the <code>CreateSnapshotCopyGrant</code> action.</p>
 Required parameters: [SnapshotCopyGrantName]
 */
@interface AWSredshiftCreateSnapshotCopyGrantMessage : AWSRequest


/**
 <p>The unique identifier of the customer master key (CMK) to which to grant Amazon Redshift permission. If no key is specified, the default key is used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The name of the snapshot copy grant. This name must be unique in the region for the AWS account.</p><p>Constraints:</p><ul><li><p>Must contain from 1 to 63 alphanumeric characters or hyphens.</p></li><li><p>Alphabetic characters must be lowercase.</p></li><li><p>First character must be a letter.</p></li><li><p>Cannot end with a hyphen or contain two consecutive hyphens.</p></li><li><p>Must be unique for all clusters within an AWS account.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotCopyGrantName;

/**
 <p>A list of tag instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSredshiftCreateSnapshotCopyGrantResult : AWSModel


/**
 <p>The snapshot copy grant that grants Amazon Redshift permission to encrypt copied snapshots with the specified customer master key (CMK) from AWS KMS in the destination region.</p><p> For more information about managing snapshot copy grants, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-db-encryption.html">Amazon Redshift Database Encryption</a> in the <i>Amazon Redshift Cluster Management Guide</i>. </p>
 */
@property (nonatomic, strong) AWSredshiftSnapshotCopyGrant * _Nullable snapshotCopyGrant;

@end

/**
 
 */
@interface AWSredshiftCreateSnapshotScheduleMessage : AWSRequest


/**
 <p/>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p/>
 */
@property (nonatomic, strong) NSNumber * _Nullable nextInvocations;

/**
 <p>The definition of the snapshot schedule. The definition is made up of schedule expressions, for example "cron(30 12 *)" or "rate(12 hours)". </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable scheduleDefinitions;

/**
 <p>The description of the snapshot schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleDescription;

/**
 <p>A unique identifier for a snapshot schedule. Only alphanumeric characters are allowed for the identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleIdentifier;

/**
 <p>An optional set of tags you can use to search for the schedule.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

@end

/**
 <p>Contains the output from the <code>CreateTags</code> action. </p>
 Required parameters: [ResourceName, Tags]
 */
@interface AWSredshiftCreateTagsMessage : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) to which you want to add the tag or tags. For example, <code>arn:aws:redshift:us-east-2:123456789:cluster:t1</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

/**
 <p>One or more name/value pairs to add as tags to the specified resource. Each tag name is passed in with the parameter <code>Key</code> and the corresponding value is passed in with the parameter <code>Value</code>. The <code>Key</code> and <code>Value</code> parameters are separated by a comma (,). Separate multiple tags with a space. For example, <code>--tags "Key"="owner","Value"="admin" "Key"="environment","Value"="test" "Key"="version","Value"="1.0"</code>. </p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSredshiftCreateUsageLimitMessage : AWSRequest


/**
 <p>The limit amount. If time-based, this amount is in minutes. If data-based, this amount is in terabytes (TB). The value must be a positive number. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable amount;

/**
 <p>The action that Amazon Redshift takes when the limit is reached. The default is log. For more information about this parameter, see <a>UsageLimit</a>.</p>
 */
@property (nonatomic, assign) AWSredshiftUsageLimitBreachAction breachAction;

/**
 <p>The identifier of the cluster that you want to limit usage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>The Amazon Redshift feature that you want to limit.</p>
 */
@property (nonatomic, assign) AWSredshiftUsageLimitFeatureType featureType;

/**
 <p>The type of limit. Depending on the feature type, this can be based on a time duration or data size. If <code>FeatureType</code> is <code>spectrum</code>, then <code>LimitType</code> must be <code>data-scanned</code>. If <code>FeatureType</code> is <code>concurrency-scaling</code>, then <code>LimitType</code> must be <code>time</code>. </p>
 */
@property (nonatomic, assign) AWSredshiftUsageLimitLimitType limitType;

/**
 <p>The time period that the amount applies to. A <code>weekly</code> period begins on Sunday. The default is <code>monthly</code>. </p>
 */
@property (nonatomic, assign) AWSredshiftUsageLimitPeriod period;

/**
 <p>A list of tag instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSredshiftCustomerStorageMessage : AWSModel


/**
 <p>The total amount of storage currently used for snapshots.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalBackupSizeInMegaBytes;

/**
 <p>The total amount of storage currently provisioned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalProvisionedStorageInMegaBytes;

@end

/**
 <p>Describes the status of a cluster while it is in the process of resizing with an incremental resize.</p>
 */
@interface AWSredshiftDataTransferProgress : AWSModel


/**
 <p>Describes the data transfer rate in MB's per second.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable currentRateInMegaBytesPerSecond;

/**
 <p>Describes the total amount of data that has been transfered in MB's.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dataTransferredInMegaBytes;

/**
 <p>Describes the number of seconds that have elapsed during the data transfer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable elapsedTimeInSeconds;

/**
 <p>Describes the estimated number of seconds remaining to complete the transfer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable estimatedTimeToCompletionInSeconds;

/**
 <p>Describes the status of the cluster. While the transfer is in progress the status is <code>transferringdata</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>Describes the total amount of data to be transfered in megabytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalDataInMegaBytes;

@end

/**
 <p>Describes the default cluster parameters for a parameter group family.</p>
 */
@interface AWSredshiftDefaultClusterParameters : AWSModel


/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>Marker</code> parameter and retrying the command. If the <code>Marker</code> field is empty, all response records have been retrieved for the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The name of the cluster parameter group family to which the engine default parameters apply.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterGroupFamily;

/**
 <p>The list of cluster default parameters.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftParameter *> * _Nullable parameters;

@end

/**
 <p>Describes a deferred maintenance window</p>
 */
@interface AWSredshiftDeferredMaintenanceWindow : AWSModel


/**
 <p> A timestamp for the end of the time period when we defer maintenance.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deferMaintenanceEndTime;

/**
 <p>A unique identifier for the maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deferMaintenanceIdentifier;

/**
 <p> A timestamp for the beginning of the time period when we defer maintenance.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deferMaintenanceStartTime;

@end

/**
 <p/>
 Required parameters: [ClusterIdentifier]
 */
@interface AWSredshiftDeleteClusterMessage : AWSRequest


/**
 <p>The identifier of the cluster to be deleted.</p><p>Constraints:</p><ul><li><p>Must contain lowercase characters.</p></li><li><p>Must contain from 1 to 63 alphanumeric characters or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Cannot end with a hyphen or contain two consecutive hyphens.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>The identifier of the final snapshot that is to be created immediately before deleting the cluster. If this parameter is provided, <i>SkipFinalClusterSnapshot</i> must be <code>false</code>. </p><p>Constraints:</p><ul><li><p>Must be 1 to 255 alphanumeric characters.</p></li><li><p>First character must be a letter.</p></li><li><p>Cannot end with a hyphen or contain two consecutive hyphens.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable finalClusterSnapshotIdentifier;

/**
 <p>The number of days that a manual snapshot is retained. If the value is -1, the manual snapshot is retained indefinitely.</p><p>The value must be either -1 or an integer between 1 and 3,653.</p><p>The default value is -1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable finalClusterSnapshotRetentionPeriod;

/**
 <p>Determines whether a final snapshot of the cluster is created before Amazon Redshift deletes the cluster. If <code>true</code>, a final cluster snapshot is not created. If <code>false</code>, a final cluster snapshot is created before the cluster is deleted. </p><note><p>The <i>FinalClusterSnapshotIdentifier</i> parameter must be specified if <i>SkipFinalClusterSnapshot</i> is <code>false</code>.</p></note><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable skipFinalClusterSnapshot;

@end

/**
 <p/>
 Required parameters: [ParameterGroupName]
 */
@interface AWSredshiftDeleteClusterParameterGroupMessage : AWSRequest


/**
 <p>The name of the parameter group to be deleted.</p><p>Constraints:</p><ul><li><p>Must be the name of an existing cluster parameter group.</p></li><li><p>Cannot delete a default cluster parameter group.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable parameterGroupName;

@end

/**
 
 */
@interface AWSredshiftDeleteClusterResult : AWSModel


/**
 <p>Describes a cluster.</p>
 */
@property (nonatomic, strong) AWSredshiftCluster * _Nullable cluster;

@end

/**
 <p/>
 Required parameters: [ClusterSecurityGroupName]
 */
@interface AWSredshiftDeleteClusterSecurityGroupMessage : AWSRequest


/**
 <p>The name of the cluster security group to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterSecurityGroupName;

@end

/**
 <p/>
 Required parameters: [SnapshotIdentifier]
 */
@interface AWSredshiftDeleteClusterSnapshotMessage : AWSRequest


/**
 <p>The unique identifier of the cluster the snapshot was created from. This parameter is required if your IAM user has a policy containing a snapshot resource element that specifies anything other than * for the cluster name.</p><p>Constraints: Must be the name of valid cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotClusterIdentifier;

/**
 <p>The unique identifier of the manual snapshot to be deleted.</p><p>Constraints: Must be the name of an existing snapshot that is in the <code>available</code>, <code>failed</code>, or <code>cancelled</code> state.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotIdentifier;

@end

/**
 
 */
@interface AWSredshiftDeleteClusterSnapshotResult : AWSModel


/**
 <p>Describes a snapshot.</p>
 */
@property (nonatomic, strong) AWSredshiftSnapshot * _Nullable snapshot;

@end

/**
 <p/>
 Required parameters: [ClusterSubnetGroupName]
 */
@interface AWSredshiftDeleteClusterSubnetGroupMessage : AWSRequest


/**
 <p>The name of the cluster subnet group name to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterSubnetGroupName;

@end

/**
 <p/>
 Required parameters: [SubscriptionName]
 */
@interface AWSredshiftDeleteEventSubscriptionMessage : AWSRequest


/**
 <p>The name of the Amazon Redshift event notification subscription to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionName;

@end

/**
 <p/>
 Required parameters: [HsmClientCertificateIdentifier]
 */
@interface AWSredshiftDeleteHsmClientCertificateMessage : AWSRequest


/**
 <p>The identifier of the HSM client certificate to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmClientCertificateIdentifier;

@end

/**
 <p/>
 Required parameters: [HsmConfigurationIdentifier]
 */
@interface AWSredshiftDeleteHsmConfigurationMessage : AWSRequest


/**
 <p>The identifier of the Amazon Redshift HSM configuration to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmConfigurationIdentifier;

@end

/**
 
 */
@interface AWSredshiftDeleteScheduledActionMessage : AWSRequest


/**
 <p>The name of the scheduled action to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledActionName;

@end

/**
 <p>The result of the <code>DeleteSnapshotCopyGrant</code> action.</p>
 Required parameters: [SnapshotCopyGrantName]
 */
@interface AWSredshiftDeleteSnapshotCopyGrantMessage : AWSRequest


/**
 <p>The name of the snapshot copy grant to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotCopyGrantName;

@end

/**
 
 */
@interface AWSredshiftDeleteSnapshotScheduleMessage : AWSRequest


/**
 <p>A unique identifier of the snapshot schedule to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleIdentifier;

@end

/**
 <p>Contains the output from the <code>DeleteTags</code> action. </p>
 Required parameters: [ResourceName, TagKeys]
 */
@interface AWSredshiftDeleteTagsMessage : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) from which you want to remove the tag or tags. For example, <code>arn:aws:redshift:us-east-2:123456789:cluster:t1</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

/**
 <p>The tag key that you want to delete.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSredshiftDeleteUsageLimitMessage : AWSRequest


/**
 <p>The identifier of the usage limit to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable usageLimitId;

@end

/**
 
 */
@interface AWSredshiftDescribeAccountAttributesMessage : AWSRequest


/**
 <p>A list of attribute names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributeNames;

@end

/**
 
 */
@interface AWSredshiftDescribeClusterDbRevisionsMessage : AWSRequest


/**
 <p>A unique identifier for a cluster whose <code>ClusterDbRevisions</code> you are requesting. This parameter is case sensitive. All clusters defined for an account are returned by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>An optional parameter that specifies the starting point for returning a set of response records. When the results of a <code>DescribeClusterDbRevisions</code> request exceed the value specified in <code>MaxRecords</code>, Amazon Redshift returns a value in the <code>marker</code> field of the response. You can retrieve the next set of response records by providing the returned <code>marker</code> value in the <code>marker</code> parameter and retrying the request. </p><p>Constraints: You can specify either the <code>ClusterIdentifier</code> parameter, or the <code>marker</code> parameter, but not both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of response records to return in each call. If the number of remaining response records exceeds the specified MaxRecords value, a value is returned in the <code>marker</code> field of the response. You can retrieve the next set of response records by providing the returned <code>marker</code> value in the <code>marker</code> parameter and retrying the request. </p><p>Default: 100</p><p>Constraints: minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p/>
 */
@interface AWSredshiftDescribeClusterParameterGroupsMessage : AWSRequest


/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <a>DescribeClusterParameterGroups</a> request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned marker value. </p><p>Default: <code>100</code></p><p>Constraints: minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The name of a specific parameter group for which to return details. By default, details about all parameter groups and the default parameter group are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterGroupName;

/**
 <p>A tag key or keys for which you want to return all matching cluster parameter groups that are associated with the specified key or keys. For example, suppose that you have parameter groups that are tagged with keys called <code>owner</code> and <code>environment</code>. If you specify both of these tag keys in the request, Amazon Redshift returns a response with the parameter groups that have either or both of these tag keys associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

/**
 <p>A tag value or values for which you want to return all matching cluster parameter groups that are associated with the specified tag value or values. For example, suppose that you have parameter groups that are tagged with values called <code>admin</code> and <code>test</code>. If you specify both of these tag values in the request, Amazon Redshift returns a response with the parameter groups that have either or both of these tag values associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagValues;

@end

/**
 <p/>
 Required parameters: [ParameterGroupName]
 */
@interface AWSredshiftDescribeClusterParametersMessage : AWSRequest


/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <a>DescribeClusterParameters</a> request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned marker value. </p><p>Default: <code>100</code></p><p>Constraints: minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The name of a cluster parameter group for which to return details.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterGroupName;

/**
 <p>The parameter types to return. Specify <code>user</code> to show parameters that are different form the default. Similarly, specify <code>engine-default</code> to show parameters that are the same as the default parameter group. </p><p>Default: All parameter types returned.</p><p>Valid Values: <code>user</code> | <code>engine-default</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable source;

@end

/**
 <p/>
 */
@interface AWSredshiftDescribeClusterSecurityGroupsMessage : AWSRequest


/**
 <p>The name of a cluster security group for which you are requesting details. You can specify either the <b>Marker</b> parameter or a <b>ClusterSecurityGroupName</b> parameter, but not both. </p><p> Example: <code>securitygroup1</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterSecurityGroupName;

/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <a>DescribeClusterSecurityGroups</a> request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p><p>Constraints: You can specify either the <b>ClusterSecurityGroupName</b> parameter or the <b>Marker</b> parameter, but not both. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned marker value. </p><p>Default: <code>100</code></p><p>Constraints: minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>A tag key or keys for which you want to return all matching cluster security groups that are associated with the specified key or keys. For example, suppose that you have security groups that are tagged with keys called <code>owner</code> and <code>environment</code>. If you specify both of these tag keys in the request, Amazon Redshift returns a response with the security groups that have either or both of these tag keys associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

/**
 <p>A tag value or values for which you want to return all matching cluster security groups that are associated with the specified tag value or values. For example, suppose that you have security groups that are tagged with values called <code>admin</code> and <code>test</code>. If you specify both of these tag values in the request, Amazon Redshift returns a response with the security groups that have either or both of these tag values associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagValues;

@end

/**
 <p/>
 */
@interface AWSredshiftDescribeClusterSnapshotsMessage : AWSRequest


/**
 <p>A value that indicates whether to return snapshots only for an existing cluster. You can perform table-level restore only by using a snapshot of an existing cluster, that is, a cluster that has not been deleted. Values for this parameter work as follows: </p><ul><li><p>If <code>ClusterExists</code> is set to <code>true</code>, <code>ClusterIdentifier</code> is required.</p></li><li><p>If <code>ClusterExists</code> is set to <code>false</code> and <code>ClusterIdentifier</code> isn't specified, all snapshots associated with deleted clusters (orphaned snapshots) are returned. </p></li><li><p>If <code>ClusterExists</code> is set to <code>false</code> and <code>ClusterIdentifier</code> is specified for a deleted cluster, snapshots associated with that cluster are returned.</p></li><li><p>If <code>ClusterExists</code> is set to <code>false</code> and <code>ClusterIdentifier</code> is specified for an existing cluster, no snapshots are returned. </p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable clusterExists;

/**
 <p>The identifier of the cluster which generated the requested snapshots.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>A time value that requests only snapshots created at or before the specified time. The time value is specified in ISO 8601 format. For more information about ISO 8601, go to the <a href="http://en.wikipedia.org/wiki/ISO_8601">ISO8601 Wikipedia page.</a></p><p>Example: <code>2012-07-16T18:00:00Z</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <a>DescribeClusterSnapshots</a> request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned marker value. </p><p>Default: <code>100</code></p><p>Constraints: minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The AWS customer account used to create or copy the snapshot. Use this field to filter the results to snapshots owned by a particular account. To describe snapshots you own, either specify your AWS customer account, or do not specify the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerAccount;

/**
 <p>The snapshot identifier of the snapshot about which to return information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotIdentifier;

/**
 <p>The type of snapshots for which you are requesting information. By default, snapshots of all types are returned.</p><p>Valid Values: <code>automated</code> | <code>manual</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotType;

/**
 <p/>
 */
@property (nonatomic, strong) NSArray<AWSredshiftSnapshotSortingEntity *> * _Nullable sortingEntities;

/**
 <p>A value that requests only snapshots created at or after the specified time. The time value is specified in ISO 8601 format. For more information about ISO 8601, go to the <a href="http://en.wikipedia.org/wiki/ISO_8601">ISO8601 Wikipedia page.</a></p><p>Example: <code>2012-07-16T18:00:00Z</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>A tag key or keys for which you want to return all matching cluster snapshots that are associated with the specified key or keys. For example, suppose that you have snapshots that are tagged with keys called <code>owner</code> and <code>environment</code>. If you specify both of these tag keys in the request, Amazon Redshift returns a response with the snapshots that have either or both of these tag keys associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

/**
 <p>A tag value or values for which you want to return all matching cluster snapshots that are associated with the specified tag value or values. For example, suppose that you have snapshots that are tagged with values called <code>admin</code> and <code>test</code>. If you specify both of these tag values in the request, Amazon Redshift returns a response with the snapshots that have either or both of these tag values associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagValues;

@end

/**
 <p/>
 */
@interface AWSredshiftDescribeClusterSubnetGroupsMessage : AWSRequest


/**
 <p>The name of the cluster subnet group for which information is requested.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterSubnetGroupName;

/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <a>DescribeClusterSubnetGroups</a> request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned marker value. </p><p>Default: <code>100</code></p><p>Constraints: minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>A tag key or keys for which you want to return all matching cluster subnet groups that are associated with the specified key or keys. For example, suppose that you have subnet groups that are tagged with keys called <code>owner</code> and <code>environment</code>. If you specify both of these tag keys in the request, Amazon Redshift returns a response with the subnet groups that have either or both of these tag keys associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

/**
 <p>A tag value or values for which you want to return all matching cluster subnet groups that are associated with the specified tag value or values. For example, suppose that you have subnet groups that are tagged with values called <code>admin</code> and <code>test</code>. If you specify both of these tag values in the request, Amazon Redshift returns a response with the subnet groups that have either or both of these tag values associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagValues;

@end

/**
 
 */
@interface AWSredshiftDescribeClusterTracksMessage : AWSRequest


/**
 <p>The name of the maintenance track. </p>
 */
@property (nonatomic, strong) NSString * _Nullable maintenanceTrackName;

/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <code>DescribeClusterTracks</code> request exceed the value specified in <code>MaxRecords</code>, Amazon Redshift returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>An integer value for the maximum number of maintenance tracks to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p/>
 */
@interface AWSredshiftDescribeClusterVersionsMessage : AWSRequest


/**
 <p>The name of a specific cluster parameter group family to return details for.</p><p>Constraints:</p><ul><li><p>Must be 1 to 255 alphanumeric characters</p></li><li><p>First character must be a letter</p></li><li><p>Cannot end with a hyphen or contain two consecutive hyphens</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable clusterParameterGroupFamily;

/**
 <p>The specific cluster version to return.</p><p>Example: <code>1.0</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterVersion;

/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <a>DescribeClusterVersions</a> request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned marker value. </p><p>Default: <code>100</code></p><p>Constraints: minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p/>
 */
@interface AWSredshiftDescribeClustersMessage : AWSRequest


/**
 <p>The unique identifier of a cluster whose properties you are requesting. This parameter is case sensitive.</p><p>The default is that all clusters defined for an account are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <a>DescribeClusters</a> request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p><p>Constraints: You can specify either the <b>ClusterIdentifier</b> parameter or the <b>Marker</b> parameter, but not both. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned marker value. </p><p>Default: <code>100</code></p><p>Constraints: minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>A tag key or keys for which you want to return all matching clusters that are associated with the specified key or keys. For example, suppose that you have clusters that are tagged with keys called <code>owner</code> and <code>environment</code>. If you specify both of these tag keys in the request, Amazon Redshift returns a response with the clusters that have either or both of these tag keys associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

/**
 <p>A tag value or values for which you want to return all matching clusters that are associated with the specified tag value or values. For example, suppose that you have clusters that are tagged with values called <code>admin</code> and <code>test</code>. If you specify both of these tag values in the request, Amazon Redshift returns a response with the clusters that have either or both of these tag values associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagValues;

@end

/**
 <p/>
 Required parameters: [ParameterGroupFamily]
 */
@interface AWSredshiftDescribeDefaultClusterParametersMessage : AWSRequest


/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <a>DescribeDefaultClusterParameters</a> request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned marker value. </p><p>Default: <code>100</code></p><p>Constraints: minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The name of the cluster parameter group family.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterGroupFamily;

@end

/**
 
 */
@interface AWSredshiftDescribeDefaultClusterParametersResult : AWSModel


/**
 <p>Describes the default cluster parameters for a parameter group family.</p>
 */
@property (nonatomic, strong) AWSredshiftDefaultClusterParameters * _Nullable defaultClusterParameters;

@end

/**
 <p/>
 */
@interface AWSredshiftDescribeEventCategoriesMessage : AWSRequest


/**
 <p>The source type, such as cluster or parameter group, to which the described event categories apply.</p><p>Valid values: cluster, cluster-snapshot, cluster-parameter-group, cluster-security-group, and scheduled-action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

@end

/**
 <p/>
 */
@interface AWSredshiftDescribeEventSubscriptionsMessage : AWSRequest


/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a DescribeEventSubscriptions request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned marker value. </p><p>Default: <code>100</code></p><p>Constraints: minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The name of the Amazon Redshift event notification subscription to be described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionName;

/**
 <p>A tag key or keys for which you want to return all matching event notification subscriptions that are associated with the specified key or keys. For example, suppose that you have subscriptions that are tagged with keys called <code>owner</code> and <code>environment</code>. If you specify both of these tag keys in the request, Amazon Redshift returns a response with the subscriptions that have either or both of these tag keys associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

/**
 <p>A tag value or values for which you want to return all matching event notification subscriptions that are associated with the specified tag value or values. For example, suppose that you have subscriptions that are tagged with values called <code>admin</code> and <code>test</code>. If you specify both of these tag values in the request, Amazon Redshift returns a response with the subscriptions that have either or both of these tag values associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagValues;

@end

/**
 <p/>
 */
@interface AWSredshiftDescribeEventsMessage : AWSRequest


/**
 <p>The number of minutes prior to the time of the request for which to retrieve events. For example, if the request is sent at 18:00 and you specify a duration of 60, then only events which have occurred after 17:00 will be returned.</p><p>Default: <code>60</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p>The end of the time interval for which to retrieve events, specified in ISO 8601 format. For more information about ISO 8601, go to the <a href="http://en.wikipedia.org/wiki/ISO_8601">ISO8601 Wikipedia page.</a></p><p>Example: <code>2009-07-08T18:00Z</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <a>DescribeEvents</a> request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned marker value. </p><p>Default: <code>100</code></p><p>Constraints: minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The identifier of the event source for which events will be returned. If this parameter is not specified, then all sources are included in the response.</p><p>Constraints:</p><p>If <i>SourceIdentifier</i> is supplied, <i>SourceType</i> must also be provided.</p><ul><li><p>Specify a cluster identifier when <i>SourceType</i> is <code>cluster</code>.</p></li><li><p>Specify a cluster security group name when <i>SourceType</i> is <code>cluster-security-group</code>.</p></li><li><p>Specify a cluster parameter group name when <i>SourceType</i> is <code>cluster-parameter-group</code>.</p></li><li><p>Specify a cluster snapshot identifier when <i>SourceType</i> is <code>cluster-snapshot</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable sourceIdentifier;

/**
 <p>The event source to retrieve events for. If no value is specified, all events are returned.</p><p>Constraints:</p><p>If <i>SourceType</i> is supplied, <i>SourceIdentifier</i> must also be provided.</p><ul><li><p>Specify <code>cluster</code> when <i>SourceIdentifier</i> is a cluster identifier.</p></li><li><p>Specify <code>cluster-security-group</code> when <i>SourceIdentifier</i> is a cluster security group name.</p></li><li><p>Specify <code>cluster-parameter-group</code> when <i>SourceIdentifier</i> is a cluster parameter group name.</p></li><li><p>Specify <code>cluster-snapshot</code> when <i>SourceIdentifier</i> is a cluster snapshot identifier.</p></li></ul>
 */
@property (nonatomic, assign) AWSredshiftSourceType sourceType;

/**
 <p>The beginning of the time interval to retrieve events for, specified in ISO 8601 format. For more information about ISO 8601, go to the <a href="http://en.wikipedia.org/wiki/ISO_8601">ISO8601 Wikipedia page.</a></p><p>Example: <code>2009-07-08T18:00Z</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 <p/>
 */
@interface AWSredshiftDescribeHsmClientCertificatesMessage : AWSRequest


/**
 <p>The identifier of a specific HSM client certificate for which you want information. If no identifier is specified, information is returned for all HSM client certificates owned by your AWS customer account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmClientCertificateIdentifier;

/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <a>DescribeHsmClientCertificates</a> request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned marker value. </p><p>Default: <code>100</code></p><p>Constraints: minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>A tag key or keys for which you want to return all matching HSM client certificates that are associated with the specified key or keys. For example, suppose that you have HSM client certificates that are tagged with keys called <code>owner</code> and <code>environment</code>. If you specify both of these tag keys in the request, Amazon Redshift returns a response with the HSM client certificates that have either or both of these tag keys associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

/**
 <p>A tag value or values for which you want to return all matching HSM client certificates that are associated with the specified tag value or values. For example, suppose that you have HSM client certificates that are tagged with values called <code>admin</code> and <code>test</code>. If you specify both of these tag values in the request, Amazon Redshift returns a response with the HSM client certificates that have either or both of these tag values associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagValues;

@end

/**
 <p/>
 */
@interface AWSredshiftDescribeHsmConfigurationsMessage : AWSRequest


/**
 <p>The identifier of a specific Amazon Redshift HSM configuration to be described. If no identifier is specified, information is returned for all HSM configurations owned by your AWS customer account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmConfigurationIdentifier;

/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <a>DescribeHsmConfigurations</a> request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned marker value. </p><p>Default: <code>100</code></p><p>Constraints: minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>A tag key or keys for which you want to return all matching HSM configurations that are associated with the specified key or keys. For example, suppose that you have HSM configurations that are tagged with keys called <code>owner</code> and <code>environment</code>. If you specify both of these tag keys in the request, Amazon Redshift returns a response with the HSM configurations that have either or both of these tag keys associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

/**
 <p>A tag value or values for which you want to return all matching HSM configurations that are associated with the specified tag value or values. For example, suppose that you have HSM configurations that are tagged with values called <code>admin</code> and <code>test</code>. If you specify both of these tag values in the request, Amazon Redshift returns a response with the HSM configurations that have either or both of these tag values associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagValues;

@end

/**
 <p/>
 Required parameters: [ClusterIdentifier]
 */
@interface AWSredshiftDescribeLoggingStatusMessage : AWSRequest


/**
 <p>The identifier of the cluster from which to get the logging status.</p><p>Example: <code>examplecluster</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

@end

/**
 
 */
@interface AWSredshiftDescribeNodeConfigurationOptionsMessage : AWSRequest


/**
 <p>The action type to evaluate for possible node configurations. Specify "restore-cluster" to get configuration combinations based on an existing snapshot. Specify "recommend-node-config" to get configuration recommendations based on an existing cluster or snapshot. Specify "resize-cluster" to get configuration combinations for elastic resize based on an existing cluster. </p>
 */
@property (nonatomic, assign) AWSredshiftActionType actionType;

/**
 <p>The identifier of the cluster to evaluate for possible node configurations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>A set of name, operator, and value items to filter the results.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftNodeConfigurationOptionsFilter *> * _Nullable filters;

/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <a>DescribeNodeConfigurationOptions</a> request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned marker value. </p><p>Default: <code>500</code></p><p>Constraints: minimum 100, maximum 500.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The AWS customer account used to create or copy the snapshot. Required if you are restoring a snapshot you do not own, optional if you own the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerAccount;

/**
 <p>The identifier of the snapshot to evaluate for possible node configurations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotIdentifier;

@end

/**
 <p/>
 */
@interface AWSredshiftDescribeOrderableClusterOptionsMessage : AWSRequest


/**
 <p>The version filter value. Specify this parameter to show only the available offerings matching the specified version.</p><p>Default: All versions.</p><p>Constraints: Must be one of the version returned from <a>DescribeClusterVersions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterVersion;

/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <a>DescribeOrderableClusterOptions</a> request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned marker value. </p><p>Default: <code>100</code></p><p>Constraints: minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The node type filter value. Specify this parameter to show only the available offerings matching the specified node type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeType;

@end

/**
 <p/>
 */
@interface AWSredshiftDescribeReservedNodeOfferingsMessage : AWSRequest


/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <a>DescribeReservedNodeOfferings</a> request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned marker value. </p><p>Default: <code>100</code></p><p>Constraints: minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The unique identifier for the offering.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedNodeOfferingId;

@end

/**
 <p/>
 */
@interface AWSredshiftDescribeReservedNodesMessage : AWSRequest


/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <a>DescribeReservedNodes</a> request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned marker value. </p><p>Default: <code>100</code></p><p>Constraints: minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>Identifier for the node reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedNodeId;

@end

/**
 <p/>
 Required parameters: [ClusterIdentifier]
 */
@interface AWSredshiftDescribeResizeMessage : AWSRequest


/**
 <p>The unique identifier of a cluster whose resize progress you are requesting. This parameter is case-sensitive.</p><p>By default, resize operations for all clusters defined for an AWS account are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

@end

/**
 
 */
@interface AWSredshiftDescribeScheduledActionsMessage : AWSRequest


/**
 <p>If true, retrieve only active scheduled actions. If false, retrieve only disabled scheduled actions. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable active;

/**
 <p>The end time in UTC of the scheduled action to retrieve. Only active scheduled actions that have invocations before this time are retrieved.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>List of scheduled action filters. </p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftScheduledActionFilter *> * _Nullable filters;

/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <a>DescribeScheduledActions</a> request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned marker value. </p><p>Default: <code>100</code></p><p>Constraints: minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The name of the scheduled action to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledActionName;

/**
 <p>The start time in UTC of the scheduled actions to retrieve. Only active scheduled actions that have invocations after this time are retrieved.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The type of the scheduled actions to retrieve. </p>
 */
@property (nonatomic, assign) AWSredshiftScheduledActionTypeValues targetActionType;

@end

/**
 <p>The result of the <code>DescribeSnapshotCopyGrants</code> action.</p>
 */
@interface AWSredshiftDescribeSnapshotCopyGrantsMessage : AWSRequest


/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <code>DescribeSnapshotCopyGrant</code> request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p><p>Constraints: You can specify either the <b>SnapshotCopyGrantName</b> parameter or the <b>Marker</b> parameter, but not both. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned marker value. </p><p>Default: <code>100</code></p><p>Constraints: minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The name of the snapshot copy grant.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotCopyGrantName;

/**
 <p>A tag key or keys for which you want to return all matching resources that are associated with the specified key or keys. For example, suppose that you have resources tagged with keys called <code>owner</code> and <code>environment</code>. If you specify both of these tag keys in the request, Amazon Redshift returns a response with all resources that have either or both of these tag keys associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

/**
 <p>A tag value or values for which you want to return all matching resources that are associated with the specified value or values. For example, suppose that you have resources tagged with values called <code>admin</code> and <code>test</code>. If you specify both of these tag values in the request, Amazon Redshift returns a response with all resources that have either or both of these tag values associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagValues;

@end

/**
 
 */
@interface AWSredshiftDescribeSnapshotSchedulesMessage : AWSRequest


/**
 <p>The unique identifier for the cluster whose snapshot schedules you want to view.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>marker</code> parameter and retrying the command. If the <code>marker</code> field is empty, all response records have been retrieved for the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number or response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned <code>marker</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>A unique identifier for a snapshot schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleIdentifier;

/**
 <p>The key value for a snapshot schedule tag.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

/**
 <p>The value corresponding to the key of the snapshot schedule tag.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagValues;

@end

/**
 
 */
@interface AWSredshiftDescribeSnapshotSchedulesOutputMessage : AWSModel


/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>marker</code> parameter and retrying the command. If the <code>marker</code> field is empty, all response records have been retrieved for the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of SnapshotSchedules.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftSnapshotSchedule *> * _Nullable snapshotSchedules;

@end

/**
 <p/>
 */
@interface AWSredshiftDescribeTableRestoreStatusMessage : AWSRequest


/**
 <p>The Amazon Redshift cluster that the table is being restored to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>An optional pagination token provided by a previous <code>DescribeTableRestoreStatus</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by the <code>MaxRecords</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that the remaining results can be retrieved.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The identifier of the table restore request to return status for. If you don't specify a <code>TableRestoreRequestId</code> value, then <code>DescribeTableRestoreStatus</code> returns the status of all in-progress table restore requests.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableRestoreRequestId;

@end

/**
 <p/>
 */
@interface AWSredshiftDescribeTagsMessage : AWSRequest


/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>marker</code> parameter and retrying the command. If the <code>marker</code> field is empty, all response records have been retrieved for the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number or response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned <code>marker</code> value. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The Amazon Resource Name (ARN) for which you want to describe the tag or tags. For example, <code>arn:aws:redshift:us-east-2:123456789:cluster:t1</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

/**
 <p>The type of resource with which you want to view tags. Valid resource types are: </p><ul><li><p>Cluster</p></li><li><p>CIDR/IP</p></li><li><p>EC2 security group</p></li><li><p>Snapshot</p></li><li><p>Cluster security group</p></li><li><p>Subnet group</p></li><li><p>HSM connection</p></li><li><p>HSM certificate</p></li><li><p>Parameter group</p></li><li><p>Snapshot copy grant</p></li></ul><p>For more information about Amazon Redshift resource types and constructing ARNs, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-overview.html#redshift-iam-access-control-specify-actions">Specifying Policy Elements: Actions, Effects, Resources, and Principals</a> in the Amazon Redshift Cluster Management Guide. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>A tag key or keys for which you want to return all matching resources that are associated with the specified key or keys. For example, suppose that you have resources tagged with keys called <code>owner</code> and <code>environment</code>. If you specify both of these tag keys in the request, Amazon Redshift returns a response with all resources that have either or both of these tag keys associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

/**
 <p>A tag value or values for which you want to return all matching resources that are associated with the specified value or values. For example, suppose that you have resources tagged with values called <code>admin</code> and <code>test</code>. If you specify both of these tag values in the request, Amazon Redshift returns a response with all resources that have either or both of these tag values associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagValues;

@end

/**
 
 */
@interface AWSredshiftDescribeUsageLimitsMessage : AWSRequest


/**
 <p>The identifier of the cluster for which you want to describe usage limits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>The feature type for which you want to describe usage limits.</p>
 */
@property (nonatomic, assign) AWSredshiftUsageLimitFeatureType featureType;

/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <a>DescribeUsageLimits</a> request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of response records to return in each call. If the number of remaining response records exceeds the specified <code>MaxRecords</code> value, a value is returned in a <code>marker</code> field of the response. You can retrieve the next set of records by retrying the command with the returned marker value. </p><p>Default: <code>100</code></p><p>Constraints: minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>A tag key or keys for which you want to return all matching usage limit objects that are associated with the specified key or keys. For example, suppose that you have parameter groups that are tagged with keys called <code>owner</code> and <code>environment</code>. If you specify both of these tag keys in the request, Amazon Redshift returns a response with the usage limit objects have either or both of these tag keys associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

/**
 <p>A tag value or values for which you want to return all matching usage limit objects that are associated with the specified tag value or values. For example, suppose that you have parameter groups that are tagged with values called <code>admin</code> and <code>test</code>. If you specify both of these tag values in the request, Amazon Redshift returns a response with the usage limit objects that have either or both of these tag values associated with them.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagValues;

/**
 <p>The identifier of the usage limit to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable usageLimitId;

@end

/**
 <p/>
 Required parameters: [ClusterIdentifier]
 */
@interface AWSredshiftDisableLoggingMessage : AWSRequest


/**
 <p>The identifier of the cluster on which logging is to be stopped.</p><p>Example: <code>examplecluster</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

@end

/**
 <p/>
 Required parameters: [ClusterIdentifier]
 */
@interface AWSredshiftDisableSnapshotCopyMessage : AWSRequest


/**
 <p>The unique identifier of the source cluster that you want to disable copying of snapshots to a destination region.</p><p>Constraints: Must be the valid name of an existing cluster that has cross-region snapshot copy enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

@end

/**
 
 */
@interface AWSredshiftDisableSnapshotCopyResult : AWSModel


/**
 <p>Describes a cluster.</p>
 */
@property (nonatomic, strong) AWSredshiftCluster * _Nullable cluster;

@end

/**
 <p>Describes an Amazon EC2 security group.</p>
 */
@interface AWSredshiftEC2SecurityGroup : AWSModel


/**
 <p>The name of the EC2 Security Group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupName;

/**
 <p>The AWS ID of the owner of the EC2 security group specified in the <code>EC2SecurityGroupName</code> field. </p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupOwnerId;

/**
 <p>The status of the EC2 security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The list of tags for the EC2 security group.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

@end

/**
 <p>Describes the status of the elastic IP (EIP) address.</p>
 */
@interface AWSredshiftElasticIpStatus : AWSModel


/**
 <p>The elastic IP (EIP) address for the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable elasticIp;

/**
 <p>The status of the elastic IP (EIP) address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p/>
 Required parameters: [ClusterIdentifier, BucketName]
 */
@interface AWSredshiftEnableLoggingMessage : AWSRequest


/**
 <p>The name of an existing S3 bucket where the log files are to be stored.</p><p>Constraints:</p><ul><li><p>Must be in the same region as the cluster</p></li><li><p>The cluster must have read bucket and put object permissions</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable bucketName;

/**
 <p>The identifier of the cluster on which logging is to be started.</p><p>Example: <code>examplecluster</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>The prefix applied to the log file names.</p><p>Constraints:</p><ul><li><p>Cannot exceed 512 characters</p></li><li><p>Cannot contain spaces( ), double quotes ("), single quotes ('), a backslash (\), or control characters. The hexadecimal codes for invalid characters are: </p><ul><li><p>x00 to x20</p></li><li><p>x22</p></li><li><p>x27</p></li><li><p>x5c</p></li><li><p>x7f or larger</p></li></ul></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable s3KeyPrefix;

@end

/**
 <p/>
 Required parameters: [ClusterIdentifier, DestinationRegion]
 */
@interface AWSredshiftEnableSnapshotCopyMessage : AWSRequest


/**
 <p>The unique identifier of the source cluster to copy snapshots from.</p><p>Constraints: Must be the valid name of an existing cluster that does not already have cross-region snapshot copy enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>The destination AWS Region that you want to copy snapshots to.</p><p>Constraints: Must be the name of a valid AWS Region. For more information, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html#redshift_region">Regions and Endpoints</a> in the Amazon Web Services General Reference. </p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationRegion;

/**
 <p>The number of days to retain newly copied snapshots in the destination AWS Region after they are copied from the source AWS Region. If the value is -1, the manual snapshot is retained indefinitely. </p><p>The value must be either -1 or an integer between 1 and 3,653.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable manualSnapshotRetentionPeriod;

/**
 <p>The number of days to retain automated snapshots in the destination region after they are copied from the source region.</p><p>Default: 7.</p><p>Constraints: Must be at least 1 and no more than 35.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retentionPeriod;

/**
 <p>The name of the snapshot copy grant to use when snapshots of an AWS KMS-encrypted cluster are copied to the destination region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotCopyGrantName;

@end

/**
 
 */
@interface AWSredshiftEnableSnapshotCopyResult : AWSModel


/**
 <p>Describes a cluster.</p>
 */
@property (nonatomic, strong) AWSredshiftCluster * _Nullable cluster;

@end

/**
 <p>Describes a connection endpoint.</p>
 */
@interface AWSredshiftEndpoint : AWSModel


/**
 <p>The DNS address of the Cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 <p>The port that the database engine is listening on.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

@end

/**
 <p>Describes an event.</p>
 */
@interface AWSredshiftEvent : AWSModel


/**
 <p>The date and time of the event.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable date;

/**
 <p>A list of the event categories.</p><p>Values: Configuration, Management, Monitoring, Security</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventCategories;

/**
 <p>The identifier of the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventId;

/**
 <p>The text of this event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The severity of the event.</p><p>Values: ERROR, INFO</p>
 */
@property (nonatomic, strong) NSString * _Nullable severity;

/**
 <p>The identifier for the source of the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceIdentifier;

/**
 <p>The source type for this event.</p>
 */
@property (nonatomic, assign) AWSredshiftSourceType sourceType;

@end

/**
 <p>Describes event categories.</p>
 */
@interface AWSredshiftEventCategoriesMap : AWSModel


/**
 <p>The events in the event category.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftEventInfoMap *> * _Nullable events;

/**
 <p>The source type, such as cluster or cluster-snapshot, that the returned categories belong to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

@end

/**
 <p/>
 */
@interface AWSredshiftEventCategoriesMessage : AWSModel


/**
 <p>A list of event categories descriptions.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftEventCategoriesMap *> * _Nullable eventCategoriesMapList;

@end

/**
 <p>Describes event information.</p>
 */
@interface AWSredshiftEventInfoMap : AWSModel


/**
 <p>The category of an Amazon Redshift event.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventCategories;

/**
 <p>The description of an Amazon Redshift event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventDescription;

/**
 <p>The identifier of an Amazon Redshift event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventId;

/**
 <p>The severity of the event.</p><p>Values: ERROR, INFO</p>
 */
@property (nonatomic, strong) NSString * _Nullable severity;

@end

/**
 <p>Describes event subscriptions.</p>
 */
@interface AWSredshiftEventSubscription : AWSModel


/**
 <p>The name of the Amazon Redshift event notification subscription.</p>
 */
@property (nonatomic, strong) NSString * _Nullable custSubscriptionId;

/**
 <p>The AWS customer account associated with the Amazon Redshift event notification subscription.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerAwsId;

/**
 <p>A boolean value indicating whether the subscription is enabled; <code>true</code> indicates that the subscription is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The list of Amazon Redshift event categories specified in the event notification subscription.</p><p>Values: Configuration, Management, Monitoring, Security</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventCategoriesList;

/**
 <p>The event severity specified in the Amazon Redshift event notification subscription.</p><p>Values: ERROR, INFO</p>
 */
@property (nonatomic, strong) NSString * _Nullable severity;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon SNS topic used by the event notification subscription.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snsTopicArn;

/**
 <p>A list of the sources that publish events to the Amazon Redshift event notification subscription.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sourceIdsList;

/**
 <p>The source type of the events returned by the Amazon Redshift event notification, such as cluster, cluster-snapshot, cluster-parameter-group, cluster-security-group, or scheduled-action. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

/**
 <p>The status of the Amazon Redshift event notification subscription.</p><p>Constraints:</p><ul><li><p>Can be one of the following: active | no-permission | topic-not-exist</p></li><li><p>The status "no-permission" indicates that Amazon Redshift no longer has permission to post to the Amazon SNS topic. The status "topic-not-exist" indicates that the topic was deleted after the subscription was created.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The date and time the Amazon Redshift event notification subscription was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable subscriptionCreationTime;

/**
 <p>The list of tags for the event subscription.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

@end

/**
 <p/>
 */
@interface AWSredshiftEventSubscriptionsMessage : AWSModel


/**
 <p>A list of event subscriptions.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftEventSubscription *> * _Nullable eventSubscriptionsList;

/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>Marker</code> parameter and retrying the command. If the <code>Marker</code> field is empty, all response records have been retrieved for the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p/>
 */
@interface AWSredshiftEventsMessage : AWSModel


/**
 <p>A list of <code>Event</code> instances. </p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftEvent *> * _Nullable events;

/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>Marker</code> parameter and retrying the command. If the <code>Marker</code> field is empty, all response records have been retrieved for the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>The request parameters to get cluster credentials.</p>
 Required parameters: [DbUser, ClusterIdentifier]
 */
@interface AWSredshiftGetClusterCredentialsMessage : AWSRequest


/**
 <p>Create a database user with the name specified for the user named in <code>DbUser</code> if one does not exist.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoCreate;

/**
 <p>The unique identifier of the cluster that contains the database for which your are requesting credentials. This parameter is case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>A list of the names of existing database groups that the user named in <code>DbUser</code> will join for the current session, in addition to any group memberships for an existing user. If not specified, a new user is added only to PUBLIC.</p><p>Database group name constraints</p><ul><li><p>Must be 1 to 64 alphanumeric characters or hyphens</p></li><li><p>Must contain only lowercase letters, numbers, underscore, plus sign, period (dot), at symbol (@), or hyphen.</p></li><li><p>First character must be a letter.</p></li><li><p>Must not contain a colon ( : ) or slash ( / ). </p></li><li><p>Cannot be a reserved word. A list of reserved words can be found in <a href="http://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html">Reserved Words</a> in the Amazon Redshift Database Developer Guide.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable dbGroups;

/**
 <p>The name of a database that <code>DbUser</code> is authorized to log on to. If <code>DbName</code> is not specified, <code>DbUser</code> can log on to any existing database.</p><p>Constraints:</p><ul><li><p>Must be 1 to 64 alphanumeric characters or hyphens</p></li><li><p>Must contain only lowercase letters, numbers, underscore, plus sign, period (dot), at symbol (@), or hyphen.</p></li><li><p>First character must be a letter.</p></li><li><p>Must not contain a colon ( : ) or slash ( / ). </p></li><li><p>Cannot be a reserved word. A list of reserved words can be found in <a href="http://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html">Reserved Words</a> in the Amazon Redshift Database Developer Guide.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable dbName;

/**
 <p>The name of a database user. If a user name matching <code>DbUser</code> exists in the database, the temporary user credentials have the same permissions as the existing user. If <code>DbUser</code> doesn't exist in the database and <code>Autocreate</code> is <code>True</code>, a new user is created using the value for <code>DbUser</code> with PUBLIC permissions. If a database user matching the value for <code>DbUser</code> doesn't exist and <code>Autocreate</code> is <code>False</code>, then the command succeeds but the connection attempt will fail because the user doesn't exist in the database.</p><p>For more information, see <a href="https://docs.aws.amazon.com/redshift/latest/dg/r_CREATE_USER.html">CREATE USER</a> in the Amazon Redshift Database Developer Guide. </p><p>Constraints:</p><ul><li><p>Must be 1 to 64 alphanumeric characters or hyphens. The user name can't be <code>PUBLIC</code>.</p></li><li><p>Must contain only lowercase letters, numbers, underscore, plus sign, period (dot), at symbol (@), or hyphen.</p></li><li><p>First character must be a letter.</p></li><li><p>Must not contain a colon ( : ) or slash ( / ). </p></li><li><p>Cannot be a reserved word. A list of reserved words can be found in <a href="http://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html">Reserved Words</a> in the Amazon Redshift Database Developer Guide.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable dbUser;

/**
 <p>The number of seconds until the returned temporary password expires.</p><p>Constraint: minimum 900, maximum 3600.</p><p>Default: 900</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

@end

/**
 <p/>
 Required parameters: [ReservedNodeId]
 */
@interface AWSredshiftGetReservedNodeExchangeOfferingsInputMessage : AWSRequest


/**
 <p>A value that indicates the starting point for the next set of ReservedNodeOfferings.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>An integer setting the maximum number of ReservedNodeOfferings to retrieve.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>A string representing the node identifier for the DC1 Reserved Node to be exchanged.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedNodeId;

@end

/**
 
 */
@interface AWSredshiftGetReservedNodeExchangeOfferingsOutputMessage : AWSModel


/**
 <p>An optional parameter that specifies the starting point for returning a set of response records. When the results of a <code>GetReservedNodeExchangeOfferings</code> request exceed the value specified in MaxRecords, Amazon Redshift returns a value in the marker field of the response. You can retrieve the next set of response records by providing the returned marker value in the marker parameter and retrying the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Returns an array of <a>ReservedNodeOffering</a> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftReservedNodeOffering *> * _Nullable reservedNodeOfferings;

@end

/**
 <p>Returns information about an HSM client certificate. The certificate is stored in a secure Hardware Storage Module (HSM), and used by the Amazon Redshift cluster to encrypt data files.</p>
 */
@interface AWSredshiftHsmClientCertificate : AWSModel


/**
 <p>The identifier of the HSM client certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmClientCertificateIdentifier;

/**
 <p>The public key that the Amazon Redshift cluster will use to connect to the HSM. You must register the public key in the HSM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmClientCertificatePublicKey;

/**
 <p>The list of tags for the HSM client certificate.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

@end

/**
 <p/>
 */
@interface AWSredshiftHsmClientCertificateMessage : AWSModel


/**
 <p>A list of the identifiers for one or more HSM client certificates used by Amazon Redshift clusters to store and retrieve database encryption keys in an HSM.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftHsmClientCertificate *> * _Nullable hsmClientCertificates;

/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>Marker</code> parameter and retrying the command. If the <code>Marker</code> field is empty, all response records have been retrieved for the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>Returns information about an HSM configuration, which is an object that describes to Amazon Redshift clusters the information they require to connect to an HSM where they can store database encryption keys.</p>
 */
@interface AWSredshiftHsmConfiguration : AWSModel


/**
 <p>A text description of the HSM configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the Amazon Redshift HSM configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmConfigurationIdentifier;

/**
 <p>The IP address that the Amazon Redshift cluster must use to access the HSM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmIpAddress;

/**
 <p>The name of the partition in the HSM where the Amazon Redshift clusters will store their database encryption keys.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmPartitionName;

/**
 <p>The list of tags for the HSM configuration.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

@end

/**
 <p/>
 */
@interface AWSredshiftHsmConfigurationMessage : AWSModel


/**
 <p>A list of <code>HsmConfiguration</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftHsmConfiguration *> * _Nullable hsmConfigurations;

/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>Marker</code> parameter and retrying the command. If the <code>Marker</code> field is empty, all response records have been retrieved for the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>Describes the status of changes to HSM settings.</p>
 */
@interface AWSredshiftHsmStatus : AWSModel


/**
 <p>Specifies the name of the HSM client certificate the Amazon Redshift cluster uses to retrieve the data encryption keys stored in an HSM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmClientCertificateIdentifier;

/**
 <p>Specifies the name of the HSM configuration that contains the information the Amazon Redshift cluster can use to retrieve and store keys in an HSM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmConfigurationIdentifier;

/**
 <p>Reports whether the Amazon Redshift cluster has finished applying any HSM settings changes specified in a modify cluster command.</p><p>Values: active, applying</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Describes an IP range used in a security group.</p>
 */
@interface AWSredshiftIPRange : AWSModel


/**
 <p>The IP range in Classless Inter-Domain Routing (CIDR) notation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable CIDRIP;

/**
 <p>The status of the IP range, for example, "authorized".</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The list of tags for the IP range.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

@end

/**
 <p>Describes the status of logging for a cluster.</p>
 */
@interface AWSredshiftLoggingStatus : AWSModel


/**
 <p>The name of the S3 bucket where the log files are stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketName;

/**
 <p>The message indicating that logs failed to be delivered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastFailureMessage;

/**
 <p>The last time when logs failed to be delivered.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastFailureTime;

/**
 <p>The last time that logs were delivered.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastSuccessfulDeliveryTime;

/**
 <p><code>true</code> if logging is on, <code>false</code> if logging is off.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable loggingEnabled;

/**
 <p>The prefix applied to the log file names.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3KeyPrefix;

@end

/**
 <p>Defines a maintenance track that determines which Amazon Redshift version to apply during a maintenance window. If the value for <code>MaintenanceTrack</code> is <code>current</code>, the cluster is updated to the most recently certified maintenance release. If the value is <code>trailing</code>, the cluster is updated to the previously certified maintenance release. </p>
 */
@interface AWSredshiftMaintenanceTrack : AWSModel


/**
 <p>The version number for the cluster release.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseVersion;

/**
 <p>The name of the maintenance track. Possible values are <code>current</code> and <code>trailing</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maintenanceTrackName;

/**
 <p>An array of <a>UpdateTarget</a> objects to update with the maintenance track. </p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftUpdateTarget *> * _Nullable updateTargets;

@end

/**
 
 */
@interface AWSredshiftModifyClusterDbRevisionMessage : AWSRequest


/**
 <p>The unique identifier of a cluster whose database revision you want to modify. </p><p>Example: <code>examplecluster</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>The identifier of the database revision. You can retrieve this value from the response to the <a>DescribeClusterDbRevisions</a> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionTarget;

@end

/**
 
 */
@interface AWSredshiftModifyClusterDbRevisionResult : AWSModel


/**
 <p>Describes a cluster.</p>
 */
@property (nonatomic, strong) AWSredshiftCluster * _Nullable cluster;

@end

/**
 <p/>
 Required parameters: [ClusterIdentifier]
 */
@interface AWSredshiftModifyClusterIamRolesMessage : AWSRequest


/**
 <p>Zero or more IAM roles to associate with the cluster. The roles must be in their Amazon Resource Name (ARN) format. You can associate up to 10 IAM roles with a single cluster in a single request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable addIamRoles;

/**
 <p>The unique identifier of the cluster for which you want to associate or disassociate IAM roles.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>Zero or more IAM roles in ARN format to disassociate from the cluster. You can disassociate up to 10 IAM roles from a single cluster in a single request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable removeIamRoles;

@end

/**
 
 */
@interface AWSredshiftModifyClusterIamRolesResult : AWSModel


/**
 <p>Describes a cluster.</p>
 */
@property (nonatomic, strong) AWSredshiftCluster * _Nullable cluster;

@end

/**
 
 */
@interface AWSredshiftModifyClusterMaintenanceMessage : AWSRequest


/**
 <p>A unique identifier for the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>A boolean indicating whether to enable the deferred maintenance window. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deferMaintenance;

/**
 <p>An integer indicating the duration of the maintenance window in days. If you specify a duration, you can't specify an end time. The duration must be 45 days or less.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deferMaintenanceDuration;

/**
 <p>A timestamp indicating end time for the deferred maintenance window. If you specify an end time, you can't specify a duration.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deferMaintenanceEndTime;

/**
 <p>A unique identifier for the deferred maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deferMaintenanceIdentifier;

/**
 <p>A timestamp indicating the start time for the deferred maintenance window.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deferMaintenanceStartTime;

@end

/**
 
 */
@interface AWSredshiftModifyClusterMaintenanceResult : AWSModel


/**
 <p>Describes a cluster.</p>
 */
@property (nonatomic, strong) AWSredshiftCluster * _Nullable cluster;

@end

/**
 <p/>
 Required parameters: [ClusterIdentifier]
 */
@interface AWSredshiftModifyClusterMessage : AWSRequest


/**
 <p>If <code>true</code>, major version upgrades will be applied automatically to the cluster during the maintenance window. </p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowVersionUpgrade;

/**
 <p>The number of days that automated snapshots are retained. If the value is 0, automated snapshots are disabled. Even if automated snapshots are disabled, you can still create manual snapshots when you want with <a>CreateClusterSnapshot</a>. </p><p>If you decrease the automated snapshot retention period from its current value, existing automated snapshots that fall outside of the new retention period will be immediately deleted.</p><p>Default: Uses existing setting.</p><p>Constraints: Must be a value from 0 to 35.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable automatedSnapshotRetentionPeriod;

/**
 <p>The unique identifier of the cluster to be modified.</p><p>Example: <code>examplecluster</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>The name of the cluster parameter group to apply to this cluster. This change is applied only after the cluster is rebooted. To reboot a cluster use <a>RebootCluster</a>. </p><p>Default: Uses existing setting.</p><p>Constraints: The cluster parameter group must be in the same parameter group family that matches the cluster version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterParameterGroupName;

/**
 <p>A list of cluster security groups to be authorized on this cluster. This change is asynchronously applied as soon as possible.</p><p>Security groups currently associated with the cluster, and not in the list of groups to apply, will be revoked from the cluster.</p><p>Constraints:</p><ul><li><p>Must be 1 to 255 alphanumeric characters or hyphens</p></li><li><p>First character must be a letter</p></li><li><p>Cannot end with a hyphen or contain two consecutive hyphens</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable clusterSecurityGroups;

/**
 <p>The new cluster type.</p><p>When you submit your cluster resize request, your existing cluster goes into a read-only mode. After Amazon Redshift provisions a new cluster based on your resize requirements, there will be outage for a period while the old cluster is deleted and your connection is switched to the new cluster. You can use <a>DescribeResize</a> to track the progress of the resize request. </p><p>Valid Values: <code> multi-node | single-node </code></p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterType;

/**
 <p>The new version number of the Amazon Redshift engine to upgrade to.</p><p>For major version upgrades, if a non-default cluster parameter group is currently in use, a new cluster parameter group in the cluster parameter group family for the new version must be specified. The new cluster parameter group can be the default for that cluster parameter group family. For more information about parameters and parameter groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p><p>Example: <code>1.0</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterVersion;

/**
 <p>The Elastic IP (EIP) address for the cluster.</p><p>Constraints: The cluster must be provisioned in EC2-VPC and publicly-accessible through an Internet gateway. For more information about provisioning clusters in EC2-VPC, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#cluster-platforms">Supported Platforms to Launch Your Cluster</a> in the Amazon Redshift Cluster Management Guide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable elasticIp;

/**
 <p>Indicates whether the cluster is encrypted. If the value is encrypted (true) and you provide a value for the <code>KmsKeyId</code> parameter, we encrypt the cluster with the provided <code>KmsKeyId</code>. If you don't provide a <code>KmsKeyId</code>, we encrypt with the default key. In the China region we use legacy encryption if you specify that the cluster is encrypted.</p><p>If the value is not encrypted (false), then the cluster is decrypted. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encrypted;

/**
 <p>An option that specifies whether to create the cluster with enhanced VPC routing enabled. To create a cluster that uses enhanced VPC routing, the cluster must be in a VPC. For more information, see <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html">Enhanced VPC Routing</a> in the Amazon Redshift Cluster Management Guide.</p><p>If this option is <code>true</code>, enhanced VPC routing is enabled. </p><p>Default: false</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enhancedVpcRouting;

/**
 <p>Specifies the name of the HSM client certificate the Amazon Redshift cluster uses to retrieve the data encryption keys stored in an HSM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmClientCertificateIdentifier;

/**
 <p>Specifies the name of the HSM configuration that contains the information the Amazon Redshift cluster can use to retrieve and store keys in an HSM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmConfigurationIdentifier;

/**
 <p>The AWS Key Management Service (KMS) key ID of the encryption key that you want to use to encrypt data in the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The name for the maintenance track that you want to assign for the cluster. This name change is asynchronous. The new track name stays in the <code>PendingModifiedValues</code> for the cluster until the next maintenance window. When the maintenance track changes, the cluster is switched to the latest cluster release available for the maintenance track. At this point, the maintenance track name is applied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maintenanceTrackName;

/**
 <p>The default for number of days that a newly created manual snapshot is retained. If the value is -1, the manual snapshot is retained indefinitely. This value doesn't retroactively change the retention periods of existing manual snapshots.</p><p>The value must be either -1 or an integer between 1 and 3,653.</p><p>The default value is -1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable manualSnapshotRetentionPeriod;

/**
 <p>The new password for the cluster master user. This change is asynchronously applied as soon as possible. Between the time of the request and the completion of the request, the <code>MasterUserPassword</code> element exists in the <code>PendingModifiedValues</code> element of the operation response. </p><note><p>Operations never return the password, so this operation provides a way to regain access to the master user account for a cluster if the password is lost.</p></note><p>Default: Uses existing setting.</p><p>Constraints:</p><ul><li><p>Must be between 8 and 64 characters in length.</p></li><li><p>Must contain at least one uppercase letter.</p></li><li><p>Must contain at least one lowercase letter.</p></li><li><p>Must contain one number.</p></li><li><p>Can be any printable ASCII character (ASCII code 33 to 126) except ' (single quote), " (double quote), \, /, @, or space.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable masterUserPassword;

/**
 <p>The new identifier for the cluster.</p><p>Constraints:</p><ul><li><p>Must contain from 1 to 63 alphanumeric characters or hyphens.</p></li><li><p>Alphabetic characters must be lowercase.</p></li><li><p>First character must be a letter.</p></li><li><p>Cannot end with a hyphen or contain two consecutive hyphens.</p></li><li><p>Must be unique for all clusters within an AWS account.</p></li></ul><p>Example: <code>examplecluster</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable latestClusterIdentifier;

/**
 <p>The new node type of the cluster. If you specify a new node type, you must also specify the number of nodes parameter.</p><p> For more information about resizing clusters, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/rs-resize-tutorial.html">Resizing Clusters in Amazon Redshift</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p><p>Valid Values: <code>ds2.xlarge</code> | <code>ds2.8xlarge</code> | <code>dc1.large</code> | <code>dc1.8xlarge</code> | <code>dc2.large</code> | <code>dc2.8xlarge</code> | <code>ra3.4xlarge</code> | <code>ra3.16xlarge</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeType;

/**
 <p>The new number of nodes of the cluster. If you specify a new number of nodes, you must also specify the node type parameter.</p><p> For more information about resizing clusters, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/rs-resize-tutorial.html">Resizing Clusters in Amazon Redshift</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p><p>Valid Values: Integer greater than <code>0</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfNodes;

/**
 <p>The weekly time range (in UTC) during which system maintenance can occur, if necessary. If system maintenance is necessary during the window, it may result in an outage.</p><p>This maintenance window change is made immediately. If the new maintenance window indicates the current time, there must be at least 120 minutes between the current time and end of the window in order to ensure that pending changes are applied.</p><p>Default: Uses existing setting.</p><p>Format: ddd:hh24:mi-ddd:hh24:mi, for example <code>wed:07:30-wed:08:00</code>.</p><p>Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun</p><p>Constraints: Must be at least 30 minutes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>If <code>true</code>, the cluster can be accessed from a public network. Only clusters in VPCs can be set to be publicly available.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publiclyAccessible;

/**
 <p>A list of virtual private cloud (VPC) security groups to be associated with the cluster. This change is asynchronously applied as soon as possible.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSecurityGroupIds;

@end

/**
 <p/>
 Required parameters: [ParameterGroupName, Parameters]
 */
@interface AWSredshiftModifyClusterParameterGroupMessage : AWSRequest


/**
 <p>The name of the parameter group to be modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterGroupName;

/**
 <p>An array of parameters to be modified. A maximum of 20 parameters can be modified in a single request.</p><p>For each parameter to be modified, you must supply at least the parameter name and parameter value; other name-value pairs of the parameter are optional.</p><p>For the workload management (WLM) configuration, you must supply all the name-value pairs in the wlm_json_configuration parameter.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftParameter *> * _Nullable parameters;

@end

/**
 
 */
@interface AWSredshiftModifyClusterResult : AWSModel


/**
 <p>Describes a cluster.</p>
 */
@property (nonatomic, strong) AWSredshiftCluster * _Nullable cluster;

@end

/**
 
 */
@interface AWSredshiftModifyClusterSnapshotMessage : AWSRequest


/**
 <p>A Boolean option to override an exception if the retention period has already passed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

/**
 <p>The number of days that a manual snapshot is retained. If the value is -1, the manual snapshot is retained indefinitely.</p><p>If the manual snapshot falls outside of the new retention period, you can specify the force option to immediately delete the snapshot.</p><p>The value must be either -1 or an integer between 1 and 3,653.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable manualSnapshotRetentionPeriod;

/**
 <p>The identifier of the snapshot whose setting you want to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotIdentifier;

@end

/**
 
 */
@interface AWSredshiftModifyClusterSnapshotResult : AWSModel


/**
 <p>Describes a snapshot.</p>
 */
@property (nonatomic, strong) AWSredshiftSnapshot * _Nullable snapshot;

@end

/**
 
 */
@interface AWSredshiftModifyClusterSnapshotScheduleMessage : AWSRequest


/**
 <p>A unique identifier for the cluster whose snapshot schedule you want to modify. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>A boolean to indicate whether to remove the assoiciation between the cluster and the schedule.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disassociateSchedule;

/**
 <p>A unique alphanumeric identifier for the schedule that you want to associate with the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleIdentifier;

@end

/**
 <p/>
 Required parameters: [ClusterSubnetGroupName, SubnetIds]
 */
@interface AWSredshiftModifyClusterSubnetGroupMessage : AWSRequest


/**
 <p>The name of the subnet group to be modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterSubnetGroupName;

/**
 <p>A text description of the subnet group to be modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>An array of VPC subnet IDs. A maximum of 20 subnets can be modified in a single request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

@end

/**
 
 */
@interface AWSredshiftModifyClusterSubnetGroupResult : AWSModel


/**
 <p>Describes a subnet group.</p>
 */
@property (nonatomic, strong) AWSredshiftClusterSubnetGroup * _Nullable clusterSubnetGroup;

@end

/**
 <p/>
 Required parameters: [SubscriptionName]
 */
@interface AWSredshiftModifyEventSubscriptionMessage : AWSRequest


/**
 <p>A Boolean value indicating if the subscription is enabled. <code>true</code> indicates the subscription is enabled </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>Specifies the Amazon Redshift event categories to be published by the event notification subscription.</p><p>Values: configuration, management, monitoring, security</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventCategories;

/**
 <p>Specifies the Amazon Redshift event severity to be published by the event notification subscription.</p><p>Values: ERROR, INFO</p>
 */
@property (nonatomic, strong) NSString * _Nullable severity;

/**
 <p>The Amazon Resource Name (ARN) of the SNS topic to be used by the event notification subscription.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snsTopicArn;

/**
 <p>A list of one or more identifiers of Amazon Redshift source objects. All of the objects must be of the same type as was specified in the source type parameter. The event subscription will return only events generated by the specified objects. If not specified, then events are returned for all objects within the source type specified.</p><p>Example: my-cluster-1, my-cluster-2</p><p>Example: my-snapshot-20131010</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sourceIds;

/**
 <p>The type of source that will be generating the events. For example, if you want to be notified of events generated by a cluster, you would set this parameter to cluster. If this value is not specified, events are returned for all Amazon Redshift objects in your AWS account. You must specify a source type in order to specify source IDs.</p><p>Valid values: cluster, cluster-parameter-group, cluster-security-group, cluster-snapshot, and scheduled-action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

/**
 <p>The name of the modified Amazon Redshift event notification subscription.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionName;

@end

/**
 
 */
@interface AWSredshiftModifyEventSubscriptionResult : AWSModel


/**
 <p>Describes event subscriptions.</p>
 */
@property (nonatomic, strong) AWSredshiftEventSubscription * _Nullable eventSubscription;

@end

/**
 
 */
@interface AWSredshiftModifyScheduledActionMessage : AWSRequest


/**
 <p>A modified enable flag of the scheduled action. If true, the scheduled action is active. If false, the scheduled action is disabled. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enable;

/**
 <p>A modified end time of the scheduled action. For more information about this parameter, see <a>ScheduledAction</a>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>A different IAM role to assume to run the target action. For more information about this parameter, see <a>ScheduledAction</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRole;

/**
 <p>A modified schedule in either <code>at( )</code> or <code>cron( )</code> format. For more information about this parameter, see <a>ScheduledAction</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

/**
 <p>A modified description of the scheduled action. </p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledActionDescription;

/**
 <p>The name of the scheduled action to modify. </p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledActionName;

/**
 <p>A modified start time of the scheduled action. For more information about this parameter, see <a>ScheduledAction</a>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>A modified JSON format of the scheduled action. For more information about this parameter, see <a>ScheduledAction</a>. </p>
 */
@property (nonatomic, strong) AWSredshiftScheduledActionType * _Nullable targetAction;

@end

/**
 <p/>
 Required parameters: [ClusterIdentifier, RetentionPeriod]
 */
@interface AWSredshiftModifySnapshotCopyRetentionPeriodMessage : AWSRequest


/**
 <p>The unique identifier of the cluster for which you want to change the retention period for either automated or manual snapshots that are copied to a destination AWS Region.</p><p>Constraints: Must be the valid name of an existing cluster that has cross-region snapshot copy enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>Indicates whether to apply the snapshot retention period to newly copied manual snapshots instead of automated snapshots.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable manual;

/**
 <p>The number of days to retain automated snapshots in the destination AWS Region after they are copied from the source AWS Region.</p><p>By default, this only changes the retention period of copied automated snapshots. </p><p>If you decrease the retention period for automated snapshots that are copied to a destination AWS Region, Amazon Redshift deletes any existing automated snapshots that were copied to the destination AWS Region and that fall outside of the new retention period.</p><p>Constraints: Must be at least 1 and no more than 35 for automated snapshots. </p><p>If you specify the <code>manual</code> option, only newly copied manual snapshots will have the new retention period. </p><p>If you specify the value of -1 newly copied manual snapshots are retained indefinitely.</p><p>Constraints: The number of days must be either -1 or an integer between 1 and 3,653 for manual snapshots.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retentionPeriod;

@end

/**
 
 */
@interface AWSredshiftModifySnapshotCopyRetentionPeriodResult : AWSModel


/**
 <p>Describes a cluster.</p>
 */
@property (nonatomic, strong) AWSredshiftCluster * _Nullable cluster;

@end

/**
 
 */
@interface AWSredshiftModifySnapshotScheduleMessage : AWSRequest


/**
 <p>An updated list of schedule definitions. A schedule definition is made up of schedule expressions, for example, "cron(30 12 *)" or "rate(12 hours)".</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable scheduleDefinitions;

/**
 <p>A unique alphanumeric identifier of the schedule to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleIdentifier;

@end

/**
 
 */
@interface AWSredshiftModifyUsageLimitMessage : AWSRequest


/**
 <p>The new limit amount. For more information about this parameter, see <a>UsageLimit</a>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable amount;

/**
 <p>The new action that Amazon Redshift takes when the limit is reached. For more information about this parameter, see <a>UsageLimit</a>. </p>
 */
@property (nonatomic, assign) AWSredshiftUsageLimitBreachAction breachAction;

/**
 <p>The identifier of the usage limit to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable usageLimitId;

@end

/**
 <p>A list of node configurations.</p>
 */
@interface AWSredshiftNodeConfigurationOption : AWSModel


/**
 <p>The estimated disk utilizaton percentage.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable estimatedDiskUtilizationPercent;

/**
 <p>The category of the node configuration recommendation.</p>
 */
@property (nonatomic, assign) AWSredshiftMode mode;

/**
 <p>The node type, such as, "ds2.8xlarge".</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeType;

/**
 <p>The number of nodes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfNodes;

@end

/**
 <p>A set of elements to filter the returned node configurations.</p>
 */
@interface AWSredshiftNodeConfigurationOptionsFilter : AWSModel


/**
 <p>The name of the element to filter.</p>
 */
@property (nonatomic, assign) AWSredshiftNodeConfigurationOptionsFilterName name;

/**
 <p>The filter operator. If filter Name is NodeType only the 'in' operator is supported. Provide one value to evaluate for 'eq', 'lt', 'le', 'gt', and 'ge'. Provide two values to evaluate for 'between'. Provide a list of values for 'in'.</p>
 */
@property (nonatomic, assign) AWSredshiftOperatorType operator;

/**
 <p>List of values. Compare Name using Operator to Values. If filter Name is NumberOfNodes, then values can range from 0 to 200. If filter Name is EstimatedDiskUtilizationPercent, then values can range from 0 to 100. For example, filter NumberOfNodes (name) GT (operator) 3 (values).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 
 */
@interface AWSredshiftNodeConfigurationOptionsMessage : AWSModel


/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>Marker</code> parameter and retrying the command. If the <code>Marker</code> field is empty, all response records have been retrieved for the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of valid node configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftNodeConfigurationOption *> * _Nullable nodeConfigurationOptionList;

@end

/**
 <p>Describes an orderable cluster option.</p>
 */
@interface AWSredshiftOrderableClusterOption : AWSModel


/**
 <p>A list of availability zones for the orderable cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftAvailabilityZone *> * _Nullable availabilityZones;

/**
 <p>The cluster type, for example <code>multi-node</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterType;

/**
 <p>The version of the orderable cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterVersion;

/**
 <p>The node type for the orderable cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeType;

@end

/**
 <p>Contains the output from the <a>DescribeOrderableClusterOptions</a> action. </p>
 */
@interface AWSredshiftOrderableClusterOptionsMessage : AWSModel


/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>Marker</code> parameter and retrying the command. If the <code>Marker</code> field is empty, all response records have been retrieved for the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>An <code>OrderableClusterOption</code> structure containing information about orderable options for the cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftOrderableClusterOption *> * _Nullable orderableClusterOptions;

@end

/**
 <p>Describes a parameter in a cluster parameter group.</p>
 */
@interface AWSredshiftParameter : AWSModel


/**
 <p>The valid range of values for the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable allowedValues;

/**
 <p>Specifies how to apply the WLM configuration parameter. Some properties can be applied dynamically, while other properties require that any associated clusters be rebooted for the configuration changes to be applied. For more information about parameters and parameter groups, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Amazon Redshift Parameter Groups</a> in the <i>Amazon Redshift Cluster Management Guide</i>.</p>
 */
@property (nonatomic, assign) AWSredshiftParameterApplyType applyType;

/**
 <p>The data type of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataType;

/**
 <p>A description of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>If <code>true</code>, the parameter can be modified. Some parameters have security or operational implications that prevent them from being changed. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isModifiable;

/**
 <p>The earliest engine version to which the parameter can apply.</p>
 */
@property (nonatomic, strong) NSString * _Nullable minimumEngineVersion;

/**
 <p>The name of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterName;

/**
 <p>The value of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterValue;

/**
 <p>The source of the parameter value, such as "engine-default" or "user".</p>
 */
@property (nonatomic, strong) NSString * _Nullable source;

@end

/**
 
 */
@interface AWSredshiftPauseClusterMessage : AWSRequest


/**
 <p>The identifier of the cluster to be paused.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

@end

/**
 
 */
@interface AWSredshiftPauseClusterResult : AWSModel


/**
 <p>Describes a cluster.</p>
 */
@property (nonatomic, strong) AWSredshiftCluster * _Nullable cluster;

@end

/**
 <p>Describes cluster attributes that are in a pending state. A change to one or more the attributes was requested and is in progress or will be applied.</p>
 */
@interface AWSredshiftPendingModifiedValues : AWSModel


/**
 <p>The pending or in-progress change of the automated snapshot retention period.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable automatedSnapshotRetentionPeriod;

/**
 <p>The pending or in-progress change of the new identifier for the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>The pending or in-progress change of the cluster type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterType;

/**
 <p>The pending or in-progress change of the service version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterVersion;

/**
 <p>The encryption type for a cluster. Possible values are: KMS and None. For the China region the possible values are None, and Legacy. </p>
 */
@property (nonatomic, strong) NSString * _Nullable encryptionType;

/**
 <p>An option that specifies whether to create the cluster with enhanced VPC routing enabled. To create a cluster that uses enhanced VPC routing, the cluster must be in a VPC. For more information, see <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html">Enhanced VPC Routing</a> in the Amazon Redshift Cluster Management Guide.</p><p>If this option is <code>true</code>, enhanced VPC routing is enabled. </p><p>Default: false</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enhancedVpcRouting;

/**
 <p>The name of the maintenance track that the cluster will change to during the next maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maintenanceTrackName;

/**
 <p>The pending or in-progress change of the master user password for the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUserPassword;

/**
 <p>The pending or in-progress change of the cluster's node type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeType;

/**
 <p>The pending or in-progress change of the number of nodes in the cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfNodes;

/**
 <p>The pending or in-progress change of the ability to connect to the cluster from the public network.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publiclyAccessible;

@end

/**
 <p/>
 Required parameters: [ReservedNodeOfferingId]
 */
@interface AWSredshiftPurchaseReservedNodeOfferingMessage : AWSRequest


/**
 <p>The number of reserved nodes that you want to purchase.</p><p>Default: <code>1</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable nodeCount;

/**
 <p>The unique identifier of the reserved node offering you want to purchase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedNodeOfferingId;

@end

/**
 
 */
@interface AWSredshiftPurchaseReservedNodeOfferingResult : AWSModel


/**
 <p>Describes a reserved node. You can call the <a>DescribeReservedNodeOfferings</a> API to obtain the available reserved node offerings. </p>
 */
@property (nonatomic, strong) AWSredshiftReservedNode * _Nullable reservedNode;

@end

/**
 <p/>
 Required parameters: [ClusterIdentifier]
 */
@interface AWSredshiftRebootClusterMessage : AWSRequest


/**
 <p>The cluster identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

@end

/**
 
 */
@interface AWSredshiftRebootClusterResult : AWSModel


/**
 <p>Describes a cluster.</p>
 */
@property (nonatomic, strong) AWSredshiftCluster * _Nullable cluster;

@end

/**
 <p>Describes a recurring charge.</p>
 */
@interface AWSredshiftRecurringCharge : AWSModel


/**
 <p>The amount charged per the period of time specified by the recurring charge frequency.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recurringChargeAmount;

/**
 <p>The frequency at which the recurring charge amount is applied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recurringChargeFrequency;

@end

/**
 <p>Describes a reserved node. You can call the <a>DescribeReservedNodeOfferings</a> API to obtain the available reserved node offerings. </p>
 */
@interface AWSredshiftReservedNode : AWSModel


/**
 <p>The currency code for the reserved cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currencyCode;

/**
 <p>The duration of the node reservation in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p>The fixed cost Amazon Redshift charges you for this reserved node.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fixedPrice;

/**
 <p>The number of reserved compute nodes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable nodeCount;

/**
 <p>The node type of the reserved node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeType;

/**
 <p>The anticipated utilization of the reserved node, as defined in the reserved node offering.</p>
 */
@property (nonatomic, strong) NSString * _Nullable offeringType;

/**
 <p>The recurring charges for the reserved node.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftRecurringCharge *> * _Nullable recurringCharges;

/**
 <p>The unique identifier for the reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedNodeId;

/**
 <p>The identifier for the reserved node offering.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedNodeOfferingId;

/**
 <p/>
 */
@property (nonatomic, assign) AWSredshiftReservedNodeOfferingType reservedNodeOfferingType;

/**
 <p>The time the reservation started. You purchase a reserved node offering for a duration. This is the start time of that duration.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The state of the reserved compute node.</p><p>Possible Values:</p><ul><li><p>pending-payment-This reserved node has recently been purchased, and the sale has been approved, but payment has not yet been confirmed.</p></li><li><p>active-This reserved node is owned by the caller and is available for use.</p></li><li><p>payment-failed-Payment failed for the purchase attempt.</p></li><li><p>retired-The reserved node is no longer available. </p></li><li><p>exchanging-The owner is exchanging the reserved node for another reserved node.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable state;

/**
 <p>The hourly rate Amazon Redshift charges you for this reserved node.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable usagePrice;

@end

/**
 <p>Describes a reserved node offering.</p>
 */
@interface AWSredshiftReservedNodeOffering : AWSModel


/**
 <p>The currency code for the compute nodes offering.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currencyCode;

/**
 <p>The duration, in seconds, for which the offering will reserve the node.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p>The upfront fixed charge you will pay to purchase the specific reserved node offering.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fixedPrice;

/**
 <p>The node type offered by the reserved node offering.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeType;

/**
 <p>The anticipated utilization of the reserved node, as defined in the reserved node offering.</p>
 */
@property (nonatomic, strong) NSString * _Nullable offeringType;

/**
 <p>The charge to your account regardless of whether you are creating any clusters using the node offering. Recurring charges are only in effect for heavy-utilization reserved nodes.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftRecurringCharge *> * _Nullable recurringCharges;

/**
 <p>The offering identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedNodeOfferingId;

/**
 <p/>
 */
@property (nonatomic, assign) AWSredshiftReservedNodeOfferingType reservedNodeOfferingType;

/**
 <p>The rate you are charged for each hour the cluster that is using the offering is running.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable usagePrice;

@end

/**
 <p/>
 */
@interface AWSredshiftReservedNodeOfferingsMessage : AWSModel


/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>Marker</code> parameter and retrying the command. If the <code>Marker</code> field is empty, all response records have been retrieved for the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of <code>ReservedNodeOffering</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftReservedNodeOffering *> * _Nullable reservedNodeOfferings;

@end

/**
 <p/>
 */
@interface AWSredshiftReservedNodesMessage : AWSModel


/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>Marker</code> parameter and retrying the command. If the <code>Marker</code> field is empty, all response records have been retrieved for the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The list of <code>ReservedNode</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftReservedNode *> * _Nullable reservedNodes;

@end

/**
 <p/>
 Required parameters: [ParameterGroupName]
 */
@interface AWSredshiftResetClusterParameterGroupMessage : AWSRequest


/**
 <p>The name of the cluster parameter group to be reset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterGroupName;

/**
 <p>An array of names of parameters to be reset. If <i>ResetAllParameters</i> option is not used, then at least one parameter name must be supplied. </p><p>Constraints: A maximum of 20 parameters can be reset in a single request.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftParameter *> * _Nullable parameters;

/**
 <p>If <code>true</code>, all parameters in the specified parameter group will be reset to their default values. </p><p>Default: <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable resetAllParameters;

@end

/**
 
 */
@interface AWSredshiftResizeClusterMessage : AWSRequest


/**
 <p>A boolean value indicating whether the resize operation is using the classic resize process. If you don't provide this parameter or set the value to <code>false</code>, the resize type is elastic. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable classic;

/**
 <p>The unique identifier for the cluster to resize.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>The new cluster type for the specified cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterType;

/**
 <p>The new node type for the nodes you are adding. If not specified, the cluster's current node type is used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeType;

/**
 <p>The new number of nodes for the cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfNodes;

@end

/**
 
 */
@interface AWSredshiftResizeClusterResult : AWSModel


/**
 <p>Describes a cluster.</p>
 */
@property (nonatomic, strong) AWSredshiftCluster * _Nullable cluster;

@end

/**
 <p>Describes a resize operation.</p>
 */
@interface AWSredshiftResizeInfo : AWSModel


/**
 <p>A boolean value indicating if the resize operation can be cancelled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowCancelResize;

/**
 <p>Returns the value <code>ClassicResize</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resizeType;

@end

/**
 <p>Describes the result of a cluster resize operation.</p>
 */
@interface AWSredshiftResizeProgressMessage : AWSModel


/**
 <p>The average rate of the resize operation over the last few minutes, measured in megabytes per second. After the resize operation completes, this value shows the average rate of the entire resize operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable avgResizeRateInMegaBytesPerSecond;

/**
 <p>The percent of data transferred from source cluster to target cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dataTransferProgressPercent;

/**
 <p>The amount of seconds that have elapsed since the resize operation began. After the resize operation completes, this value shows the total actual time, in seconds, for the resize operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable elapsedTimeInSeconds;

/**
 <p>The estimated time remaining, in seconds, until the resize operation is complete. This value is calculated based on the average resize rate and the estimated amount of data remaining to be processed. Once the resize operation is complete, this value will be 0.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable estimatedTimeToCompletionInSeconds;

/**
 <p>The names of tables that have been completely imported .</p><p>Valid Values: List of table names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable importTablesCompleted;

/**
 <p>The names of tables that are being currently imported.</p><p>Valid Values: List of table names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable importTablesInProgress;

/**
 <p>The names of tables that have not been yet imported.</p><p>Valid Values: List of table names</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable importTablesNotStarted;

/**
 <p>An optional string to provide additional details about the resize action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>While the resize operation is in progress, this value shows the current amount of data, in megabytes, that has been processed so far. When the resize operation is complete, this value shows the total amount of data, in megabytes, on the cluster, which may be more or less than TotalResizeDataInMegaBytes (the estimated total amount of data before resize).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable progressInMegaBytes;

/**
 <p>An enum with possible values of <code>ClassicResize</code> and <code>ElasticResize</code>. These values describe the type of resize operation being performed. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resizeType;

/**
 <p>The status of the resize operation.</p><p>Valid Values: <code>NONE</code> | <code>IN_PROGRESS</code> | <code>FAILED</code> | <code>SUCCEEDED</code> | <code>CANCELLING</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The cluster type after the resize operation is complete.</p><p>Valid Values: <code>multi-node</code> | <code>single-node</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable targetClusterType;

/**
 <p>The type of encryption for the cluster after the resize is complete.</p><p>Possible values are <code>KMS</code> and <code>None</code>. In the China region possible values are: <code>Legacy</code> and <code>None</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetEncryptionType;

/**
 <p>The node type that the cluster will have after the resize operation is complete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetNodeType;

/**
 <p>The number of nodes that the cluster will have after the resize operation is complete.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetNumberOfNodes;

/**
 <p>The estimated total amount of data, in megabytes, on the cluster before the resize operation began.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalResizeDataInMegaBytes;

@end

/**
 <p/>
 Required parameters: [ClusterIdentifier, SnapshotIdentifier]
 */
@interface AWSredshiftRestoreFromClusterSnapshotMessage : AWSRequest


/**
 <p>Reserved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable additionalInfo;

/**
 <p>If <code>true</code>, major version upgrades can be applied during the maintenance window to the Amazon Redshift engine that is running on the cluster. </p><p>Default: <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowVersionUpgrade;

/**
 <p>The number of days that automated snapshots are retained. If the value is 0, automated snapshots are disabled. Even if automated snapshots are disabled, you can still create manual snapshots when you want with <a>CreateClusterSnapshot</a>. </p><p>Default: The value selected for the cluster from which the snapshot was taken.</p><p>Constraints: Must be a value from 0 to 35.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable automatedSnapshotRetentionPeriod;

/**
 <p>The Amazon EC2 Availability Zone in which to restore the cluster.</p><p>Default: A random, system-chosen Availability Zone.</p><p>Example: <code>us-east-2a</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The identifier of the cluster that will be created from restoring the snapshot.</p><p>Constraints:</p><ul><li><p>Must contain from 1 to 63 alphanumeric characters or hyphens.</p></li><li><p>Alphabetic characters must be lowercase.</p></li><li><p>First character must be a letter.</p></li><li><p>Cannot end with a hyphen or contain two consecutive hyphens.</p></li><li><p>Must be unique for all clusters within an AWS account.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>The name of the parameter group to be associated with this cluster.</p><p>Default: The default Amazon Redshift cluster parameter group. For information about the default parameter group, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html">Working with Amazon Redshift Parameter Groups</a>.</p><p>Constraints:</p><ul><li><p>Must be 1 to 255 alphanumeric characters or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Cannot end with a hyphen or contain two consecutive hyphens.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable clusterParameterGroupName;

/**
 <p>A list of security groups to be associated with this cluster.</p><p>Default: The default cluster security group for Amazon Redshift.</p><p>Cluster security groups only apply to clusters outside of VPCs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable clusterSecurityGroups;

/**
 <p>The name of the subnet group where you want to cluster restored.</p><p>A snapshot of cluster in VPC can be restored only in VPC. Therefore, you must provide subnet group name where you want the cluster restored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterSubnetGroupName;

/**
 <p>The elastic IP (EIP) address for the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable elasticIp;

/**
 <p>An option that specifies whether to create the cluster with enhanced VPC routing enabled. To create a cluster that uses enhanced VPC routing, the cluster must be in a VPC. For more information, see <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html">Enhanced VPC Routing</a> in the Amazon Redshift Cluster Management Guide.</p><p>If this option is <code>true</code>, enhanced VPC routing is enabled. </p><p>Default: false</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enhancedVpcRouting;

/**
 <p>Specifies the name of the HSM client certificate the Amazon Redshift cluster uses to retrieve the data encryption keys stored in an HSM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmClientCertificateIdentifier;

/**
 <p>Specifies the name of the HSM configuration that contains the information the Amazon Redshift cluster can use to retrieve and store keys in an HSM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hsmConfigurationIdentifier;

/**
 <p>A list of AWS Identity and Access Management (IAM) roles that can be used by the cluster to access other AWS services. You must supply the IAM roles in their Amazon Resource Name (ARN) format. You can supply up to 10 IAM roles in a single request.</p><p>A cluster can have up to 10 IAM roles associated at any time.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable iamRoles;

/**
 <p>The AWS Key Management Service (KMS) key ID of the encryption key that you want to use to encrypt data in the cluster that you restore from a shared snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The name of the maintenance track for the restored cluster. When you take a snapshot, the snapshot inherits the <code>MaintenanceTrack</code> value from the cluster. The snapshot might be on a different track than the cluster that was the source for the snapshot. For example, suppose that you take a snapshot of a cluster that is on the current track and then change the cluster to be on the trailing track. In this case, the snapshot and the source cluster are on different tracks.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maintenanceTrackName;

/**
 <p>The default number of days to retain a manual snapshot. If the value is -1, the snapshot is retained indefinitely. This setting doesn't change the retention period of existing snapshots.</p><p>The value must be either -1 or an integer between 1 and 3,653.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable manualSnapshotRetentionPeriod;

/**
 <p>The node type that the restored cluster will be provisioned with.</p><p>Default: The node type of the cluster from which the snapshot was taken. You can modify this if you are using any DS node type. In that case, you can choose to restore into another DS node type of the same size. For example, you can restore ds1.8xlarge into ds2.8xlarge, or ds1.xlarge into ds2.xlarge. If you have a DC instance type, you must restore into that same instance type and size. In other words, you can only restore a dc1.large instance type into another dc1.large instance type or dc2.large instance type. You can't restore dc1.8xlarge to dc2.8xlarge. First restore to a dc1.8xlarge cluster, then resize to a dc2.8large cluster. For more information about node types, see <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#rs-about-clusters-and-nodes"> About Clusters and Nodes</a> in the <i>Amazon Redshift Cluster Management Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeType;

/**
 <p>The number of nodes specified when provisioning the restored cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfNodes;

/**
 <p>The AWS customer account used to create or copy the snapshot. Required if you are restoring a snapshot you do not own, optional if you own the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerAccount;

/**
 <p>The port number on which the cluster accepts connections.</p><p>Default: The same port as the original cluster.</p><p>Constraints: Must be between <code>1115</code> and <code>65535</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The weekly time range (in UTC) during which automated cluster maintenance can occur.</p><p> Format: <code>ddd:hh24:mi-ddd:hh24:mi</code></p><p> Default: The value selected for the cluster from which the snapshot was taken. For more information about the time blocks for each region, see <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#rs-maintenance-windows">Maintenance Windows</a> in Amazon Redshift Cluster Management Guide. </p><p>Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun</p><p>Constraints: Minimum 30-minute window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>If <code>true</code>, the cluster can be accessed from a public network. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publiclyAccessible;

/**
 <p>The name of the cluster the source snapshot was created from. This parameter is required if your IAM user has a policy containing a snapshot resource element that specifies anything other than * for the cluster name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotClusterIdentifier;

/**
 <p>The name of the snapshot from which to create the new cluster. This parameter isn't case sensitive.</p><p>Example: <code>my-snapshot-id</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotIdentifier;

/**
 <p>A unique identifier for the snapshot schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotScheduleIdentifier;

/**
 <p>A list of Virtual Private Cloud (VPC) security groups to be associated with the cluster.</p><p>Default: The default VPC security group is associated with the cluster.</p><p>VPC security groups only apply to clusters in VPCs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSecurityGroupIds;

@end

/**
 
 */
@interface AWSredshiftRestoreFromClusterSnapshotResult : AWSModel


/**
 <p>Describes a cluster.</p>
 */
@property (nonatomic, strong) AWSredshiftCluster * _Nullable cluster;

@end

/**
 <p>Describes the status of a cluster restore action. Returns null if the cluster was not created by restoring a snapshot.</p>
 */
@interface AWSredshiftRestoreStatus : AWSModel


/**
 <p>The number of megabytes per second being transferred from the backup storage. Returns the average rate for a completed backup. This field is only updated when you restore to DC2 and DS2 node types. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable currentRestoreRateInMegaBytesPerSecond;

/**
 <p>The amount of time an in-progress restore has been running, or the amount of time it took a completed restore to finish. This field is only updated when you restore to DC2 and DS2 node types. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable elapsedTimeInSeconds;

/**
 <p>The estimate of the time remaining before the restore will complete. Returns 0 for a completed restore. This field is only updated when you restore to DC2 and DS2 node types. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable estimatedTimeToCompletionInSeconds;

/**
 <p>The number of megabytes that have been transferred from snapshot storage. This field is only updated when you restore to DC2 and DS2 node types. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable progressInMegaBytes;

/**
 <p>The size of the set of snapshot data used to restore the cluster. This field is only updated when you restore to DC2 and DS2 node types. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable snapshotSizeInMegaBytes;

/**
 <p>The status of the restore action. Returns starting, restoring, completed, or failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p/>
 Required parameters: [ClusterIdentifier, SnapshotIdentifier, SourceDatabaseName, SourceTableName, NewTableName]
 */
@interface AWSredshiftRestoreTableFromClusterSnapshotMessage : AWSRequest


/**
 <p>The identifier of the Amazon Redshift cluster to restore the table to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>The name of the table to create as a result of the current request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestTableName;

/**
 <p>The identifier of the snapshot to restore the table from. This snapshot must have been created from the Amazon Redshift cluster specified by the <code>ClusterIdentifier</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotIdentifier;

/**
 <p>The name of the source database that contains the table to restore from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceDatabaseName;

/**
 <p>The name of the source schema that contains the table to restore from. If you do not specify a <code>SourceSchemaName</code> value, the default is <code>public</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceSchemaName;

/**
 <p>The name of the source table to restore from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceTableName;

/**
 <p>The name of the database to restore the table to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetDatabaseName;

/**
 <p>The name of the schema to restore the table to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetSchemaName;

@end

/**
 
 */
@interface AWSredshiftRestoreTableFromClusterSnapshotResult : AWSModel


/**
 <p>Describes the status of a <a>RestoreTableFromClusterSnapshot</a> operation.</p>
 */
@property (nonatomic, strong) AWSredshiftTableRestoreStatus * _Nullable tableRestoreStatus;

@end

/**
 
 */
@interface AWSredshiftResumeClusterMessage : AWSRequest


/**
 <p>The identifier of the cluster to be resumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

@end

/**
 
 */
@interface AWSredshiftResumeClusterResult : AWSModel


/**
 <p>Describes a cluster.</p>
 */
@property (nonatomic, strong) AWSredshiftCluster * _Nullable cluster;

@end

/**
 <p>Describes a <code>RevisionTarget</code>.</p>
 */
@interface AWSredshiftRevisionTarget : AWSModel


/**
 <p>A unique string that identifies the version to update the cluster to. You can use this value in <a>ModifyClusterDbRevision</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseRevision;

/**
 <p>The date on which the database revision was released.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable databaseRevisionReleaseDate;

/**
 <p>A string that describes the changes and features that will be applied to the cluster when it is updated to the corresponding <a>ClusterDbRevision</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 <p/>
 Required parameters: [ClusterSecurityGroupName]
 */
@interface AWSredshiftRevokeClusterSecurityGroupIngressMessage : AWSRequest


/**
 <p>The IP range for which to revoke access. This range must be a valid Classless Inter-Domain Routing (CIDR) block of IP addresses. If <code>CIDRIP</code> is specified, <code>EC2SecurityGroupName</code> and <code>EC2SecurityGroupOwnerId</code> cannot be provided. </p>
 */
@property (nonatomic, strong) NSString * _Nullable CIDRIP;

/**
 <p>The name of the security Group from which to revoke the ingress rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterSecurityGroupName;

/**
 <p>The name of the EC2 Security Group whose access is to be revoked. If <code>EC2SecurityGroupName</code> is specified, <code>EC2SecurityGroupOwnerId</code> must also be provided and <code>CIDRIP</code> cannot be provided. </p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupName;

/**
 <p>The AWS account number of the owner of the security group specified in the <code>EC2SecurityGroupName</code> parameter. The AWS access key ID is not an acceptable value. If <code>EC2SecurityGroupOwnerId</code> is specified, <code>EC2SecurityGroupName</code> must also be provided. and <code>CIDRIP</code> cannot be provided. </p><p>Example: <code>111122223333</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupOwnerId;

@end

/**
 
 */
@interface AWSredshiftRevokeClusterSecurityGroupIngressResult : AWSModel


/**
 <p>Describes a security group.</p>
 */
@property (nonatomic, strong) AWSredshiftClusterSecurityGroup * _Nullable clusterSecurityGroup;

@end

/**
 <p/>
 Required parameters: [SnapshotIdentifier, AccountWithRestoreAccess]
 */
@interface AWSredshiftRevokeSnapshotAccessMessage : AWSRequest


/**
 <p>The identifier of the AWS customer account that can no longer restore the specified snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountWithRestoreAccess;

/**
 <p>The identifier of the cluster the snapshot was created from. This parameter is required if your IAM user has a policy containing a snapshot resource element that specifies anything other than * for the cluster name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotClusterIdentifier;

/**
 <p>The identifier of the snapshot that the account can no longer access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotIdentifier;

@end

/**
 
 */
@interface AWSredshiftRevokeSnapshotAccessResult : AWSModel


/**
 <p>Describes a snapshot.</p>
 */
@property (nonatomic, strong) AWSredshiftSnapshot * _Nullable snapshot;

@end

/**
 <p/>
 Required parameters: [ClusterIdentifier]
 */
@interface AWSredshiftRotateEncryptionKeyMessage : AWSRequest


/**
 <p>The unique identifier of the cluster that you want to rotate the encryption keys for.</p><p>Constraints: Must be the name of valid cluster that has encryption enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

@end

/**
 
 */
@interface AWSredshiftRotateEncryptionKeyResult : AWSModel


/**
 <p>Describes a cluster.</p>
 */
@property (nonatomic, strong) AWSredshiftCluster * _Nullable cluster;

@end

/**
 <p>Describes a scheduled action. You can use a scheduled action to trigger some Amazon Redshift API operations on a schedule. For information about which API operations can be scheduled, see <a>ScheduledActionType</a>. </p>
 */
@interface AWSredshiftScheduledAction : AWSModel


/**
 <p>The end time in UTC when the schedule is no longer active. After this time, the scheduled action does not trigger. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The IAM role to assume to run the scheduled action. This IAM role must have permission to run the Amazon Redshift API operation in the scheduled action. This IAM role must allow the Amazon Redshift scheduler (Principal scheduler.redshift.amazonaws.com) to assume permissions on your behalf. For more information about the IAM role to use with the Amazon Redshift scheduler, see <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-identity-based.html">Using Identity-Based Policies for Amazon Redshift</a> in the <i>Amazon Redshift Cluster Management Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRole;

/**
 <p>List of times when the scheduled action will run. </p>
 */
@property (nonatomic, strong) NSArray<NSDate *> * _Nullable nextInvocations;

/**
 <p>The schedule for a one-time (at format) or recurring (cron format) scheduled action. Schedule invocations must be separated by at least one hour.</p><p>Format of at expressions is "<code>at(yyyy-mm-ddThh:mm:ss)</code>". For example, "<code>at(2016-03-04T17:27:00)</code>".</p><p>Format of cron expressions is "<code>cron(Minutes Hours Day-of-month Month Day-of-week Year)</code>". For example, "<code>cron(0 10 ? * MON *)</code>". For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions">Cron Expressions</a> in the <i>Amazon CloudWatch Events User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

/**
 <p>The description of the scheduled action. </p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledActionDescription;

/**
 <p>The name of the scheduled action. </p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledActionName;

/**
 <p>The start time in UTC when the schedule is active. Before this time, the scheduled action does not trigger. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The state of the scheduled action. For example, <code>DISABLED</code>. </p>
 */
@property (nonatomic, assign) AWSredshiftScheduledActionState state;

/**
 <p>A JSON format string of the Amazon Redshift API operation with input parameters. </p><p>"<code>{\"ResizeCluster\":{\"NodeType\":\"ds2.8xlarge\",\"ClusterIdentifier\":\"my-test-cluster\",\"NumberOfNodes\":3}}</code>". </p>
 */
@property (nonatomic, strong) AWSredshiftScheduledActionType * _Nullable targetAction;

@end

/**
 <p>A set of elements to filter the returned scheduled actions. </p>
 Required parameters: [Name, Values]
 */
@interface AWSredshiftScheduledActionFilter : AWSModel


/**
 <p>The type of element to filter. </p>
 */
@property (nonatomic, assign) AWSredshiftScheduledActionFilterName name;

/**
 <p>List of values. Compare if the value (of type defined by <code>Name</code>) equals an item in the list of scheduled actions. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>The action type that specifies an Amazon Redshift API operation that is supported by the Amazon Redshift scheduler. </p>
 */
@interface AWSredshiftScheduledActionType : AWSModel


/**
 <p>An action that runs a <code>PauseCluster</code> API operation. </p>
 */
@property (nonatomic, strong) AWSredshiftPauseClusterMessage * _Nullable pauseCluster;

/**
 <p>An action that runs a <code>ResizeCluster</code> API operation. </p>
 */
@property (nonatomic, strong) AWSredshiftResizeClusterMessage * _Nullable resizeCluster;

/**
 <p>An action that runs a <code>ResumeCluster</code> API operation. </p>
 */
@property (nonatomic, strong) AWSredshiftResumeClusterMessage * _Nullable resumeCluster;

@end

/**
 
 */
@interface AWSredshiftScheduledActionsMessage : AWSModel


/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <a>DescribeScheduledActions</a> request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>List of retrieved scheduled actions. </p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftScheduledAction *> * _Nullable scheduledActions;

@end

/**
 <p>Describes a snapshot.</p>
 */
@interface AWSredshiftSnapshot : AWSModel


/**
 <p>A list of the AWS customer accounts authorized to restore the snapshot. Returns <code>null</code> if no accounts are authorized. Visible only to the snapshot owner. </p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftAccountWithRestoreAccess *> * _Nullable accountsWithRestoreAccess;

/**
 <p>The size of the incremental backup.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable actualIncrementalBackupSizeInMegaBytes;

/**
 <p>The Availability Zone in which the cluster was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The number of megabytes that have been transferred to the snapshot backup.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupProgressInMegaBytes;

/**
 <p>The time (UTC) when the cluster was originally created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable clusterCreateTime;

/**
 <p>The identifier of the cluster for which the snapshot was taken.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>The version ID of the Amazon Redshift engine that is running on the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterVersion;

/**
 <p>The number of megabytes per second being transferred to the snapshot backup. Returns <code>0</code> for a completed backup. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable currentBackupRateInMegaBytesPerSecond;

/**
 <p>The name of the database that was created when the cluster was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBName;

/**
 <p>The amount of time an in-progress snapshot backup has been running, or the amount of time it took a completed backup to finish.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable elapsedTimeInSeconds;

/**
 <p>If <code>true</code>, the data in the snapshot is encrypted at rest.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encrypted;

/**
 <p>A boolean that indicates whether the snapshot data is encrypted using the HSM keys of the source cluster. <code>true</code> indicates that the data is encrypted using HSM keys.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encryptedWithHSM;

/**
 <p>An option that specifies whether to create the cluster with enhanced VPC routing enabled. To create a cluster that uses enhanced VPC routing, the cluster must be in a VPC. For more information, see <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html">Enhanced VPC Routing</a> in the Amazon Redshift Cluster Management Guide.</p><p>If this option is <code>true</code>, enhanced VPC routing is enabled. </p><p>Default: false</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enhancedVpcRouting;

/**
 <p>The estimate of the time remaining before the snapshot backup will complete. Returns <code>0</code> for a completed backup. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable estimatedSecondsToCompletion;

/**
 <p>The AWS Key Management Service (KMS) key ID of the encryption key that was used to encrypt data in the cluster from which the snapshot was taken.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The name of the maintenance track for the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maintenanceTrackName;

/**
 <p>The number of days until a manual snapshot will pass its retention period.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable manualSnapshotRemainingDays;

/**
 <p>The number of days that a manual snapshot is retained. If the value is -1, the manual snapshot is retained indefinitely. </p><p>The value must be either -1 or an integer between 1 and 3,653.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable manualSnapshotRetentionPeriod;

/**
 <p>The master user name for the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUsername;

/**
 <p>The node type of the nodes in the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeType;

/**
 <p>The number of nodes in the cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfNodes;

/**
 <p>For manual snapshots, the AWS customer account used to create or copy the snapshot. For automatic snapshots, the owner of the cluster. The owner can perform all snapshot actions, such as sharing a manual snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerAccount;

/**
 <p>The port that the cluster is listening on.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The list of node types that this cluster snapshot is able to restore into.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable restorableNodeTypes;

/**
 <p>The time (in UTC format) when Amazon Redshift began the snapshot. A snapshot contains a copy of the cluster data as of this exact time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable snapshotCreateTime;

/**
 <p>The snapshot identifier that is provided in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotIdentifier;

/**
 <p>A timestamp representing the start of the retention period for the snapshot.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable snapshotRetentionStartTime;

/**
 <p>The snapshot type. Snapshots created using <a>CreateClusterSnapshot</a> and <a>CopyClusterSnapshot</a> are of type "manual". </p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotType;

/**
 <p>The source region from which the snapshot was copied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceRegion;

/**
 <p>The snapshot status. The value of the status depends on the API operation used: </p><ul><li><p><a>CreateClusterSnapshot</a> and <a>CopyClusterSnapshot</a> returns status as "creating". </p></li><li><p><a>DescribeClusterSnapshots</a> returns status as "creating", "available", "final snapshot", or "failed".</p></li><li><p><a>DeleteClusterSnapshot</a> returns status as "deleted".</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The list of tags for the cluster snapshot.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

/**
 <p>The size of the complete set of backup data that would be used to restore the cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalBackupSizeInMegaBytes;

/**
 <p>The VPC identifier of the cluster if the snapshot is from a cluster in a VPC. Otherwise, this field is not in the output.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>The snapshot copy grant that grants Amazon Redshift permission to encrypt copied snapshots with the specified customer master key (CMK) from AWS KMS in the destination region.</p><p> For more information about managing snapshot copy grants, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-db-encryption.html">Amazon Redshift Database Encryption</a> in the <i>Amazon Redshift Cluster Management Guide</i>. </p>
 */
@interface AWSredshiftSnapshotCopyGrant : AWSModel


/**
 <p>The unique identifier of the customer master key (CMK) in AWS KMS to which Amazon Redshift is granted permission.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The name of the snapshot copy grant.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotCopyGrantName;

/**
 <p>A list of tag instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

@end

/**
 <p/>
 */
@interface AWSredshiftSnapshotCopyGrantMessage : AWSModel


/**
 <p>An optional parameter that specifies the starting point to return a set of response records. When the results of a <code>DescribeSnapshotCopyGrant</code> request exceed the value specified in <code>MaxRecords</code>, AWS returns a value in the <code>Marker</code> field of the response. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request. </p><p>Constraints: You can specify either the <b>SnapshotCopyGrantName</b> parameter or the <b>Marker</b> parameter, but not both. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The list of <code>SnapshotCopyGrant</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftSnapshotCopyGrant *> * _Nullable snapshotCopyGrants;

@end

/**
 <p>Describes the errors returned by a snapshot.</p>
 */
@interface AWSredshiftSnapshotErrorMessage : AWSModel


/**
 <p>The failure code for the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureCode;

/**
 <p>The text message describing the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>A unique identifier for the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotClusterIdentifier;

/**
 <p>A unique identifier for the snapshot returning the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotIdentifier;

@end

/**
 <p>Contains the output from the <a>DescribeClusterSnapshots</a> action. </p>
 */
@interface AWSredshiftSnapshotMessage : AWSModel


/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>Marker</code> parameter and retrying the command. If the <code>Marker</code> field is empty, all response records have been retrieved for the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of <a>Snapshot</a> instances. </p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftSnapshot *> * _Nullable snapshots;

@end

/**
 <p>Describes a snapshot schedule. You can set a regular interval for creating snapshots of a cluster. You can also schedule snapshots for specific dates. </p>
 */
@interface AWSredshiftSnapshotSchedule : AWSModel


/**
 <p>The number of clusters associated with the schedule.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable associatedClusterCount;

/**
 <p>A list of clusters associated with the schedule. A maximum of 100 clusters is returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftClusterAssociatedToSchedule *> * _Nullable associatedClusters;

/**
 <p/>
 */
@property (nonatomic, strong) NSArray<NSDate *> * _Nullable nextInvocations;

/**
 <p>A list of ScheduleDefinitions.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable scheduleDefinitions;

/**
 <p>The description of the schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleDescription;

/**
 <p>A unique identifier for the schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleIdentifier;

/**
 <p>An optional set of tags describing the schedule.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

@end

/**
 <p>Describes a sorting entity</p>
 Required parameters: [Attribute]
 */
@interface AWSredshiftSnapshotSortingEntity : AWSModel


/**
 <p>The category for sorting the snapshots.</p>
 */
@property (nonatomic, assign) AWSredshiftSnapshotAttributeToSortBy attribute;

/**
 <p>The order for listing the attributes.</p>
 */
@property (nonatomic, assign) AWSredshiftSortByOrder sortOrder;

@end

/**
 <p>Describes a subnet.</p>
 */
@interface AWSredshiftSubnet : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) AWSredshiftAvailabilityZone * _Nullable subnetAvailabilityZone;

/**
 <p>The identifier of the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetIdentifier;

/**
 <p>The status of the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetStatus;

@end

/**
 <p>Describes the operations that are allowed on a maintenance track.</p>
 */
@interface AWSredshiftSupportedOperation : AWSModel


/**
 <p>A list of the supported operations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationName;

@end

/**
 <p>A list of supported platforms for orderable clusters.</p>
 */
@interface AWSredshiftSupportedPlatform : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Describes the status of a <a>RestoreTableFromClusterSnapshot</a> operation.</p>
 */
@interface AWSredshiftTableRestoreStatus : AWSModel


/**
 <p>The identifier of the Amazon Redshift cluster that the table is being restored to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>A description of the status of the table restore request. Status values include <code>SUCCEEDED</code>, <code>FAILED</code>, <code>CANCELED</code>, <code>PENDING</code>, <code>IN_PROGRESS</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The name of the table to create as a result of the table restore request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestTableName;

/**
 <p>The amount of data restored to the new table so far, in megabytes (MB).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable progressInMegaBytes;

/**
 <p>The time that the table restore request was made, in Universal Coordinated Time (UTC).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable requestTime;

/**
 <p>The identifier of the snapshot that the table is being restored from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotIdentifier;

/**
 <p>The name of the source database that contains the table being restored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceDatabaseName;

/**
 <p>The name of the source schema that contains the table being restored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceSchemaName;

/**
 <p>The name of the source table being restored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceTableName;

/**
 <p>A value that describes the current state of the table restore request.</p><p>Valid Values: <code>SUCCEEDED</code>, <code>FAILED</code>, <code>CANCELED</code>, <code>PENDING</code>, <code>IN_PROGRESS</code></p>
 */
@property (nonatomic, assign) AWSredshiftTableRestoreStatusType status;

/**
 <p>The unique identifier for the table restore request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableRestoreRequestId;

/**
 <p>The name of the database to restore the table to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetDatabaseName;

/**
 <p>The name of the schema to restore the table to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetSchemaName;

/**
 <p>The total amount of data to restore to the new table, in megabytes (MB).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalDataInMegaBytes;

@end

/**
 <p/>
 */
@interface AWSredshiftTableRestoreStatusMessage : AWSModel


/**
 <p>A pagination token that can be used in a subsequent <a>DescribeTableRestoreStatus</a> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of status details for one or more table restore requests.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTableRestoreStatus *> * _Nullable tableRestoreStatusDetails;

@end

/**
 <p>A tag consisting of a name/value pair for a resource.</p>
 */
@interface AWSredshiftTag : AWSModel


/**
 <p>The key, or name, for the resource tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value for the resource tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>A tag and its associated resource.</p>
 */
@interface AWSredshiftTaggedResource : AWSModel


/**
 <p>The Amazon Resource Name (ARN) with which the tag is associated, for example: <code>arn:aws:redshift:us-east-2:123456789:cluster:t1</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

/**
 <p>The type of resource with which the tag is associated. Valid resource types are: </p><ul><li><p>Cluster</p></li><li><p>CIDR/IP</p></li><li><p>EC2 security group</p></li><li><p>Snapshot</p></li><li><p>Cluster security group</p></li><li><p>Subnet group</p></li><li><p>HSM connection</p></li><li><p>HSM certificate</p></li><li><p>Parameter group</p></li></ul><p>For more information about Amazon Redshift resource types and constructing ARNs, go to <a href="https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-overview.html#redshift-iam-access-control-specify-actions">Constructing an Amazon Redshift Amazon Resource Name (ARN)</a> in the Amazon Redshift Cluster Management Guide. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>The tag for the resource.</p>
 */
@property (nonatomic, strong) AWSredshiftTag * _Nullable tag;

@end

/**
 <p/>
 */
@interface AWSredshiftTaggedResourceListMessage : AWSModel


/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>Marker</code> parameter and retrying the command. If the <code>Marker</code> field is empty, all response records have been retrieved for the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of tags with their associated resources.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTaggedResource *> * _Nullable taggedResources;

@end

/**
 
 */
@interface AWSredshiftTrackListMessage : AWSModel


/**
 <p>A list of maintenance tracks output by the <code>DescribeClusterTracks</code> operation. </p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftMaintenanceTrack *> * _Nullable maintenanceTracks;

/**
 <p>The starting point to return a set of response tracklist records. You can retrieve the next set of response records by providing the returned marker value in the <code>Marker</code> parameter and retrying the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>A maintenance track that you can switch the current track to.</p>
 */
@interface AWSredshiftUpdateTarget : AWSModel


/**
 <p>The cluster version for the new maintenance track.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseVersion;

/**
 <p>The name of the new maintenance track.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maintenanceTrackName;

/**
 <p>A list of operations supported by the maintenance track.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftSupportedOperation *> * _Nullable supportedOperations;

@end

/**
 <p>Describes a usage limit object for a cluster. </p>
 */
@interface AWSredshiftUsageLimit : AWSModel


/**
 <p>The limit amount. If time-based, this amount is in minutes. If data-based, this amount is in terabytes (TB).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable amount;

/**
 <p>The action that Amazon Redshift takes when the limit is reached. Possible values are: </p><ul><li><p><b>log</b> - To log an event in a system table. The default is log.</p></li><li><p><b>emit-metric</b> - To emit CloudWatch metrics.</p></li><li><p><b>disable</b> - To disable the feature until the next usage period begins.</p></li></ul>
 */
@property (nonatomic, assign) AWSredshiftUsageLimitBreachAction breachAction;

/**
 <p>The identifier of the cluster with a usage limit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>The Amazon Redshift feature to which the limit applies.</p>
 */
@property (nonatomic, assign) AWSredshiftUsageLimitFeatureType featureType;

/**
 <p>The type of limit. Depending on the feature type, this can be based on a time duration or data size.</p>
 */
@property (nonatomic, assign) AWSredshiftUsageLimitLimitType limitType;

/**
 <p>The time period that the amount applies to. A <code>weekly</code> period begins on Sunday. The default is <code>monthly</code>. </p>
 */
@property (nonatomic, assign) AWSredshiftUsageLimitPeriod period;

/**
 <p>A list of tag instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftTag *> * _Nullable tags;

/**
 <p>The identifier of the usage limit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable usageLimitId;

@end

/**
 
 */
@interface AWSredshiftUsageLimitList : AWSModel


/**
 <p>A value that indicates the starting point for the next set of response records in a subsequent request. If a value is returned in a response, you can retrieve the next set of records by providing this returned marker value in the <code>Marker</code> parameter and retrying the command. If the <code>Marker</code> field is empty, all response records have been retrieved for the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Contains the output from the <a>DescribeUsageLimits</a> action. </p>
 */
@property (nonatomic, strong) NSArray<AWSredshiftUsageLimit *> * _Nullable usageLimits;

@end

/**
 <p>Describes the members of a VPC security group.</p>
 */
@interface AWSredshiftVpcSecurityGroupMembership : AWSModel


/**
 <p>The status of the VPC security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The identifier of the VPC security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcSecurityGroupId;

@end

NS_ASSUME_NONNULL_END
