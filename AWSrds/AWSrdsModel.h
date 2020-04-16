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

FOUNDATION_EXPORT NSString *const AWSrdsErrorDomain;

typedef NS_ENUM(NSInteger, AWSrdsErrorType) {
    AWSrdsErrorUnknown,
    AWSrdsErrorAuthorizationAlreadyExists,
    AWSrdsErrorAuthorizationNotFound,
    AWSrdsErrorAuthorizationQuotaExceeded,
    AWSrdsErrorBackupPolicyNotFound,
    AWSrdsErrorCertificateNotFound,
    AWSrdsErrorCustomAvailabilityZoneAlreadyExists,
    AWSrdsErrorCustomAvailabilityZoneNotFound,
    AWSrdsErrorCustomAvailabilityZoneQuotaExceeded,
    AWSrdsErrorDBClusterAlreadyExists,
    AWSrdsErrorDBClusterBacktrackNotFound,
    AWSrdsErrorDBClusterEndpointAlreadyExists,
    AWSrdsErrorDBClusterEndpointNotFound,
    AWSrdsErrorDBClusterEndpointQuotaExceeded,
    AWSrdsErrorDBClusterNotFound,
    AWSrdsErrorDBClusterParameterGroupNotFound,
    AWSrdsErrorDBClusterQuotaExceeded,
    AWSrdsErrorDBClusterRoleAlreadyExists,
    AWSrdsErrorDBClusterRoleNotFound,
    AWSrdsErrorDBClusterRoleQuotaExceeded,
    AWSrdsErrorDBClusterSnapshotAlreadyExists,
    AWSrdsErrorDBClusterSnapshotNotFound,
    AWSrdsErrorDBInstanceAlreadyExists,
    AWSrdsErrorDBInstanceAutomatedBackupNotFound,
    AWSrdsErrorDBInstanceAutomatedBackupQuotaExceeded,
    AWSrdsErrorDBInstanceNotFound,
    AWSrdsErrorDBInstanceRoleAlreadyExists,
    AWSrdsErrorDBInstanceRoleNotFound,
    AWSrdsErrorDBInstanceRoleQuotaExceeded,
    AWSrdsErrorDBLogFileNotFound,
    AWSrdsErrorDBParameterGroupAlreadyExists,
    AWSrdsErrorDBParameterGroupNotFound,
    AWSrdsErrorDBParameterGroupQuotaExceeded,
    AWSrdsErrorDBProxyAlreadyExists,
    AWSrdsErrorDBProxyNotFound,
    AWSrdsErrorDBProxyQuotaExceeded,
    AWSrdsErrorDBProxyTargetAlreadyRegistered,
    AWSrdsErrorDBProxyTargetGroupNotFound,
    AWSrdsErrorDBProxyTargetNotFound,
    AWSrdsErrorDBSecurityGroupAlreadyExists,
    AWSrdsErrorDBSecurityGroupNotFound,
    AWSrdsErrorDBSecurityGroupNotSupported,
    AWSrdsErrorDBSecurityGroupQuotaExceeded,
    AWSrdsErrorDBSnapshotAlreadyExists,
    AWSrdsErrorDBSnapshotNotFound,
    AWSrdsErrorDBSubnetGroupAlreadyExists,
    AWSrdsErrorDBSubnetGroupDoesNotCoverEnoughAZs,
    AWSrdsErrorDBSubnetGroupNotAllowed,
    AWSrdsErrorDBSubnetGroupNotFound,
    AWSrdsErrorDBSubnetGroupQuotaExceeded,
    AWSrdsErrorDBSubnetQuotaExceeded,
    AWSrdsErrorDBUpgradeDependencyFailure,
    AWSrdsErrorDomainNotFound,
    AWSrdsErrorEventSubscriptionQuotaExceeded,
    AWSrdsErrorExportTaskAlreadyExists,
    AWSrdsErrorExportTaskNotFound,
    AWSrdsErrorGlobalClusterAlreadyExists,
    AWSrdsErrorGlobalClusterNotFound,
    AWSrdsErrorGlobalClusterQuotaExceeded,
    AWSrdsErrorIamRoleMissingPermissions,
    AWSrdsErrorIamRoleNotFound,
    AWSrdsErrorInstallationMediaAlreadyExists,
    AWSrdsErrorInstallationMediaNotFound,
    AWSrdsErrorInstanceQuotaExceeded,
    AWSrdsErrorInsufficientDBClusterCapacity,
    AWSrdsErrorInsufficientDBInstanceCapacity,
    AWSrdsErrorInsufficientStorageClusterCapacity,
    AWSrdsErrorInvalidDBClusterCapacity,
    AWSrdsErrorInvalidDBClusterEndpointState,
    AWSrdsErrorInvalidDBClusterSnapshotState,
    AWSrdsErrorInvalidDBClusterState,
    AWSrdsErrorInvalidDBInstanceAutomatedBackupState,
    AWSrdsErrorInvalidDBInstanceState,
    AWSrdsErrorInvalidDBParameterGroupState,
    AWSrdsErrorInvalidDBProxyState,
    AWSrdsErrorInvalidDBSecurityGroupState,
    AWSrdsErrorInvalidDBSnapshotState,
    AWSrdsErrorInvalidDBSubnetGroup,
    AWSrdsErrorInvalidDBSubnetGroupState,
    AWSrdsErrorInvalidDBSubnetState,
    AWSrdsErrorInvalidEventSubscriptionState,
    AWSrdsErrorInvalidExportOnly,
    AWSrdsErrorInvalidExportSourceState,
    AWSrdsErrorInvalidExportTaskState,
    AWSrdsErrorInvalidGlobalClusterState,
    AWSrdsErrorInvalidOptionGroupState,
    AWSrdsErrorInvalidRestore,
    AWSrdsErrorInvalidS3Bucket,
    AWSrdsErrorInvalidSubnet,
    AWSrdsErrorInvalidVPCNetworkState,
    AWSrdsErrorKMSKeyNotAccessible,
    AWSrdsErrorOptionGroupAlreadyExists,
    AWSrdsErrorOptionGroupNotFound,
    AWSrdsErrorOptionGroupQuotaExceeded,
    AWSrdsErrorPointInTimeRestoreNotEnabled,
    AWSrdsErrorProvisionedIopsNotAvailableInAZ,
    AWSrdsErrorReservedDBInstanceAlreadyExists,
    AWSrdsErrorReservedDBInstanceNotFound,
    AWSrdsErrorReservedDBInstanceQuotaExceeded,
    AWSrdsErrorReservedDBInstancesOfferingNotFound,
    AWSrdsErrorResourceNotFound,
    AWSrdsErrorSNSInvalidTopic,
    AWSrdsErrorSNSNoAuthorization,
    AWSrdsErrorSNSTopicArnNotFound,
    AWSrdsErrorSharedSnapshotQuotaExceeded,
    AWSrdsErrorSnapshotQuotaExceeded,
    AWSrdsErrorSourceNotFound,
    AWSrdsErrorStorageQuotaExceeded,
    AWSrdsErrorStorageTypeNotSupported,
    AWSrdsErrorSubnetAlreadyInUse,
    AWSrdsErrorSubscriptionAlreadyExist,
    AWSrdsErrorSubscriptionCategoryNotFound,
    AWSrdsErrorSubscriptionNotFound,
};

typedef NS_ENUM(NSInteger, AWSrdsActivityStreamMode) {
    AWSrdsActivityStreamModeUnknown,
    AWSrdsActivityStreamModeSync,
    AWSrdsActivityStreamModeAsync,
};

typedef NS_ENUM(NSInteger, AWSrdsActivityStreamStatus) {
    AWSrdsActivityStreamStatusUnknown,
    AWSrdsActivityStreamStatusStopped,
    AWSrdsActivityStreamStatusStarting,
    AWSrdsActivityStreamStatusStarted,
    AWSrdsActivityStreamStatusStopping,
};

typedef NS_ENUM(NSInteger, AWSrdsApplyMethod) {
    AWSrdsApplyMethodUnknown,
    AWSrdsApplyMethodImmediate,
    AWSrdsApplyMethodPendingReboot,
};

typedef NS_ENUM(NSInteger, AWSrdsAuthScheme) {
    AWSrdsAuthSchemeUnknown,
    AWSrdsAuthSchemeSecrets,
};

typedef NS_ENUM(NSInteger, AWSrdsDBProxyStatus) {
    AWSrdsDBProxyStatusUnknown,
    AWSrdsDBProxyStatusAvailable,
    AWSrdsDBProxyStatusModifying,
    AWSrdsDBProxyStatusIncompatibleNetwork,
    AWSrdsDBProxyStatusInsufficientResourceLimits,
    AWSrdsDBProxyStatusCreating,
    AWSrdsDBProxyStatusDeleting,
    AWSrdsDBProxyStatusSuspended,
    AWSrdsDBProxyStatusSuspending,
    AWSrdsDBProxyStatusReactivating,
};

typedef NS_ENUM(NSInteger, AWSrdsEngineFamily) {
    AWSrdsEngineFamilyUnknown,
    AWSrdsEngineFamilyMysql,
    AWSrdsEngineFamilyPostgresql,
};

typedef NS_ENUM(NSInteger, AWSrdsIAMAuthMode) {
    AWSrdsIAMAuthModeUnknown,
    AWSrdsIAMAuthModeDisabled,
    AWSrdsIAMAuthModeRequired,
};

typedef NS_ENUM(NSInteger, AWSrdsSourceType) {
    AWSrdsSourceTypeUnknown,
    AWSrdsSourceTypeDbInstance,
    AWSrdsSourceTypeDbParameterGroup,
    AWSrdsSourceTypeDbSecurityGroup,
    AWSrdsSourceTypeDbSnapshot,
    AWSrdsSourceTypeDbCluster,
    AWSrdsSourceTypeDbClusterSnapshot,
};

typedef NS_ENUM(NSInteger, AWSrdsTargetHealthReason) {
    AWSrdsTargetHealthReasonUnknown,
    AWSrdsTargetHealthReasonUnreachable,
    AWSrdsTargetHealthReasonConnectionFailed,
    AWSrdsTargetHealthReasonAuthFailure,
    AWSrdsTargetHealthReasonPendingProxyCapacity,
};

typedef NS_ENUM(NSInteger, AWSrdsTargetState) {
    AWSrdsTargetStateUnknown,
    AWSrdsTargetStateRegistering,
    AWSrdsTargetStateAvailable,
    AWSrdsTargetStateUnavailable,
};

typedef NS_ENUM(NSInteger, AWSrdsTargetType) {
    AWSrdsTargetTypeUnknown,
    AWSrdsTargetTypeRdsInstance,
    AWSrdsTargetTypeRdsServerlessEndpoint,
    AWSrdsTargetTypeTrackedCluster,
};

@class AWSrdsAccountAttributesMessage;
@class AWSrdsAccountQuota;
@class AWSrdsAddRoleToDBClusterMessage;
@class AWSrdsAddRoleToDBInstanceMessage;
@class AWSrdsAddSourceIdentifierToSubscriptionMessage;
@class AWSrdsAddSourceIdentifierToSubscriptionResult;
@class AWSrdsAddTagsToResourceMessage;
@class AWSrdsApplyPendingMaintenanceActionMessage;
@class AWSrdsApplyPendingMaintenanceActionResult;
@class AWSrdsAuthorizeDBSecurityGroupIngressMessage;
@class AWSrdsAuthorizeDBSecurityGroupIngressResult;
@class AWSrdsAvailabilityZone;
@class AWSrdsAvailableProcessorFeature;
@class AWSrdsBacktrackDBClusterMessage;
@class AWSrdsCancelExportTaskMessage;
@class AWSrdsCertificate;
@class AWSrdsCertificateMessage;
@class AWSrdsCharacterSet;
@class AWSrdsCloudwatchLogsExportConfiguration;
@class AWSrdsConnectionPoolConfiguration;
@class AWSrdsConnectionPoolConfigurationInfo;
@class AWSrdsReplicateDBClusterParameterGroupMessage;
@class AWSrdsReplicateDBClusterParameterGroupResult;
@class AWSrdsReplicateDBClusterSnapshotMessage;
@class AWSrdsReplicateDBClusterSnapshotResult;
@class AWSrdsReplicateDBParameterGroupMessage;
@class AWSrdsReplicateDBParameterGroupResult;
@class AWSrdsReplicateDBSnapshotMessage;
@class AWSrdsReplicateDBSnapshotResult;
@class AWSrdsReplicateOptionGroupMessage;
@class AWSrdsReplicateOptionGroupResult;
@class AWSrdsCreateCustomAvailabilityZoneMessage;
@class AWSrdsCreateCustomAvailabilityZoneResult;
@class AWSrdsCreateDBClusterEndpointMessage;
@class AWSrdsCreateDBClusterMessage;
@class AWSrdsCreateDBClusterParameterGroupMessage;
@class AWSrdsCreateDBClusterParameterGroupResult;
@class AWSrdsCreateDBClusterResult;
@class AWSrdsCreateDBClusterSnapshotMessage;
@class AWSrdsCreateDBClusterSnapshotResult;
@class AWSrdsCreateDBInstanceMessage;
@class AWSrdsCreateDBInstanceReadReplicaMessage;
@class AWSrdsCreateDBInstanceReadReplicaResult;
@class AWSrdsCreateDBInstanceResult;
@class AWSrdsCreateDBParameterGroupMessage;
@class AWSrdsCreateDBParameterGroupResult;
@class AWSrdsCreateDBProxyRequest;
@class AWSrdsCreateDBProxyResponse;
@class AWSrdsCreateDBSecurityGroupMessage;
@class AWSrdsCreateDBSecurityGroupResult;
@class AWSrdsCreateDBSnapshotMessage;
@class AWSrdsCreateDBSnapshotResult;
@class AWSrdsCreateDBSubnetGroupMessage;
@class AWSrdsCreateDBSubnetGroupResult;
@class AWSrdsCreateEventSubscriptionMessage;
@class AWSrdsCreateEventSubscriptionResult;
@class AWSrdsCreateGlobalClusterMessage;
@class AWSrdsCreateGlobalClusterResult;
@class AWSrdsCreateOptionGroupMessage;
@class AWSrdsCreateOptionGroupResult;
@class AWSrdsCustomAvailabilityZone;
@class AWSrdsCustomAvailabilityZoneMessage;
@class AWSrdsDBCluster;
@class AWSrdsDBClusterBacktrack;
@class AWSrdsDBClusterBacktrackMessage;
@class AWSrdsDBClusterCapacityInfo;
@class AWSrdsDBClusterEndpoint;
@class AWSrdsDBClusterEndpointMessage;
@class AWSrdsDBClusterMember;
@class AWSrdsDBClusterMessage;
@class AWSrdsDBClusterOptionGroupStatus;
@class AWSrdsDBClusterParameterGroup;
@class AWSrdsDBClusterParameterGroupDetails;
@class AWSrdsDBClusterParameterGroupNameMessage;
@class AWSrdsDBClusterParameterGroupsMessage;
@class AWSrdsDBClusterRole;
@class AWSrdsDBClusterSnapshot;
@class AWSrdsDBClusterSnapshotAttribute;
@class AWSrdsDBClusterSnapshotAttributesResult;
@class AWSrdsDBClusterSnapshotMessage;
@class AWSrdsDBEngineVersion;
@class AWSrdsDBEngineVersionMessage;
@class AWSrdsDBInstance;
@class AWSrdsDBInstanceAutomatedBackup;
@class AWSrdsDBInstanceAutomatedBackupMessage;
@class AWSrdsDBInstanceMessage;
@class AWSrdsDBInstanceRole;
@class AWSrdsDBInstanceStatusInfo;
@class AWSrdsDBParameterGroup;
@class AWSrdsDBParameterGroupDetails;
@class AWSrdsDBParameterGroupNameMessage;
@class AWSrdsDBParameterGroupStatus;
@class AWSrdsDBParameterGroupsMessage;
@class AWSrdsDBProxy;
@class AWSrdsDBProxyTarget;
@class AWSrdsDBProxyTargetGroup;
@class AWSrdsDBSecurityGroup;
@class AWSrdsDBSecurityGroupMembership;
@class AWSrdsDBSecurityGroupMessage;
@class AWSrdsDBSnapshot;
@class AWSrdsDBSnapshotAttribute;
@class AWSrdsDBSnapshotAttributesResult;
@class AWSrdsDBSnapshotMessage;
@class AWSrdsDBSubnetGroup;
@class AWSrdsDBSubnetGroupMessage;
@class AWSrdsDeleteCustomAvailabilityZoneMessage;
@class AWSrdsDeleteCustomAvailabilityZoneResult;
@class AWSrdsDeleteDBClusterEndpointMessage;
@class AWSrdsDeleteDBClusterMessage;
@class AWSrdsDeleteDBClusterParameterGroupMessage;
@class AWSrdsDeleteDBClusterResult;
@class AWSrdsDeleteDBClusterSnapshotMessage;
@class AWSrdsDeleteDBClusterSnapshotResult;
@class AWSrdsDeleteDBInstanceAutomatedBackupMessage;
@class AWSrdsDeleteDBInstanceAutomatedBackupResult;
@class AWSrdsDeleteDBInstanceMessage;
@class AWSrdsDeleteDBInstanceResult;
@class AWSrdsDeleteDBParameterGroupMessage;
@class AWSrdsDeleteDBProxyRequest;
@class AWSrdsDeleteDBProxyResponse;
@class AWSrdsDeleteDBSecurityGroupMessage;
@class AWSrdsDeleteDBSnapshotMessage;
@class AWSrdsDeleteDBSnapshotResult;
@class AWSrdsDeleteDBSubnetGroupMessage;
@class AWSrdsDeleteEventSubscriptionMessage;
@class AWSrdsDeleteEventSubscriptionResult;
@class AWSrdsDeleteGlobalClusterMessage;
@class AWSrdsDeleteGlobalClusterResult;
@class AWSrdsDeleteInstallationMediaMessage;
@class AWSrdsDeleteOptionGroupMessage;
@class AWSrdsDeregisterDBProxyTargetsRequest;
@class AWSrdsDeregisterDBProxyTargetsResponse;
@class AWSrdsDescribeAccountAttributesMessage;
@class AWSrdsDescribeCertificatesMessage;
@class AWSrdsDescribeCustomAvailabilityZonesMessage;
@class AWSrdsDescribeDBClusterBacktracksMessage;
@class AWSrdsDescribeDBClusterEndpointsMessage;
@class AWSrdsDescribeDBClusterParameterGroupsMessage;
@class AWSrdsDescribeDBClusterParametersMessage;
@class AWSrdsDescribeDBClusterSnapshotAttributesMessage;
@class AWSrdsDescribeDBClusterSnapshotAttributesResult;
@class AWSrdsDescribeDBClusterSnapshotsMessage;
@class AWSrdsDescribeDBClustersMessage;
@class AWSrdsDescribeDBEngineVersionsMessage;
@class AWSrdsDescribeDBInstanceAutomatedBackupsMessage;
@class AWSrdsDescribeDBInstancesMessage;
@class AWSrdsDescribeDBLogFilesDetails;
@class AWSrdsDescribeDBLogFilesMessage;
@class AWSrdsDescribeDBLogFilesResponse;
@class AWSrdsDescribeDBParameterGroupsMessage;
@class AWSrdsDescribeDBParametersMessage;
@class AWSrdsDescribeDBProxiesRequest;
@class AWSrdsDescribeDBProxiesResponse;
@class AWSrdsDescribeDBProxyTargetGroupsRequest;
@class AWSrdsDescribeDBProxyTargetGroupsResponse;
@class AWSrdsDescribeDBProxyTargetsRequest;
@class AWSrdsDescribeDBProxyTargetsResponse;
@class AWSrdsDescribeDBSecurityGroupsMessage;
@class AWSrdsDescribeDBSnapshotAttributesMessage;
@class AWSrdsDescribeDBSnapshotAttributesResult;
@class AWSrdsDescribeDBSnapshotsMessage;
@class AWSrdsDescribeDBSubnetGroupsMessage;
@class AWSrdsDescribeEngineDefaultClusterParametersMessage;
@class AWSrdsDescribeEngineDefaultClusterParametersResult;
@class AWSrdsDescribeEngineDefaultParametersMessage;
@class AWSrdsDescribeEngineDefaultParametersResult;
@class AWSrdsDescribeEventCategoriesMessage;
@class AWSrdsDescribeEventSubscriptionsMessage;
@class AWSrdsDescribeEventsMessage;
@class AWSrdsDescribeExportTasksMessage;
@class AWSrdsDescribeGlobalClustersMessage;
@class AWSrdsDescribeInstallationMediaMessage;
@class AWSrdsDescribeOptionGroupOptionsMessage;
@class AWSrdsDescribeOptionGroupsMessage;
@class AWSrdsDescribeOrderableDBInstanceOptionsMessage;
@class AWSrdsDescribePendingMaintenanceActionsMessage;
@class AWSrdsDescribeReservedDBInstancesMessage;
@class AWSrdsDescribeReservedDBInstancesOfferingsMessage;
@class AWSrdsDescribeSourceRegionsMessage;
@class AWSrdsDescribeValidDBInstanceModificationsMessage;
@class AWSrdsDescribeValidDBInstanceModificationsResult;
@class AWSrdsDomainMembership;
@class AWSrdsDoubleRange;
@class AWSrdsDownloadDBLogFilePortionDetails;
@class AWSrdsDownloadDBLogFilePortionMessage;
@class AWSrdsEC2SecurityGroup;
@class AWSrdsEndpoint;
@class AWSrdsEngineDefaults;
@class AWSrdsEvent;
@class AWSrdsEventCategoriesMap;
@class AWSrdsEventCategoriesMessage;
@class AWSrdsEventSubscription;
@class AWSrdsEventSubscriptionsMessage;
@class AWSrdsEventsMessage;
@class AWSrdsExportTask;
@class AWSrdsExportTasksMessage;
@class AWSrdsFailoverDBClusterMessage;
@class AWSrdsFailoverDBClusterResult;
@class AWSrdsFilter;
@class AWSrdsGlobalCluster;
@class AWSrdsGlobalClusterMember;
@class AWSrdsGlobalClustersMessage;
@class AWSrdsIPRange;
@class AWSrdsImportInstallationMediaMessage;
@class AWSrdsInstallationMedia;
@class AWSrdsInstallationMediaFailureCause;
@class AWSrdsInstallationMediaMessage;
@class AWSrdsListTagsForResourceMessage;
@class AWSrdsMinimumEngineVersionPerAllowedValue;
@class AWSrdsModifyCertificatesMessage;
@class AWSrdsModifyCertificatesResult;
@class AWSrdsModifyCurrentDBClusterCapacityMessage;
@class AWSrdsModifyDBClusterEndpointMessage;
@class AWSrdsModifyDBClusterMessage;
@class AWSrdsModifyDBClusterParameterGroupMessage;
@class AWSrdsModifyDBClusterResult;
@class AWSrdsModifyDBClusterSnapshotAttributeMessage;
@class AWSrdsModifyDBClusterSnapshotAttributeResult;
@class AWSrdsModifyDBInstanceMessage;
@class AWSrdsModifyDBInstanceResult;
@class AWSrdsModifyDBParameterGroupMessage;
@class AWSrdsModifyDBProxyRequest;
@class AWSrdsModifyDBProxyResponse;
@class AWSrdsModifyDBProxyTargetGroupRequest;
@class AWSrdsModifyDBProxyTargetGroupResponse;
@class AWSrdsModifyDBSnapshotAttributeMessage;
@class AWSrdsModifyDBSnapshotAttributeResult;
@class AWSrdsModifyDBSnapshotMessage;
@class AWSrdsModifyDBSnapshotResult;
@class AWSrdsModifyDBSubnetGroupMessage;
@class AWSrdsModifyDBSubnetGroupResult;
@class AWSrdsModifyEventSubscriptionMessage;
@class AWSrdsModifyEventSubscriptionResult;
@class AWSrdsModifyGlobalClusterMessage;
@class AWSrdsModifyGlobalClusterResult;
@class AWSrdsModifyOptionGroupMessage;
@class AWSrdsModifyOptionGroupResult;
@class AWSrdsOption;
@class AWSrdsOptionConfiguration;
@class AWSrdsOptionGroup;
@class AWSrdsOptionGroupMembership;
@class AWSrdsOptionGroupOption;
@class AWSrdsOptionGroupOptionSetting;
@class AWSrdsOptionGroupOptionsMessage;
@class AWSrdsOptionGroups;
@class AWSrdsOptionSetting;
@class AWSrdsOptionVersion;
@class AWSrdsOrderableDBInstanceOption;
@class AWSrdsOrderableDBInstanceOptionsMessage;
@class AWSrdsParameter;
@class AWSrdsPendingCloudwatchLogsExports;
@class AWSrdsPendingMaintenanceAction;
@class AWSrdsPendingMaintenanceActionsMessage;
@class AWSrdsPendingModifiedValues;
@class AWSrdsProcessorFeature;
@class AWSrdsPromoteReadReplicaDBClusterMessage;
@class AWSrdsPromoteReadReplicaDBClusterResult;
@class AWSrdsPromoteReadReplicaMessage;
@class AWSrdsPromoteReadReplicaResult;
@class AWSrdsPurchaseReservedDBInstancesOfferingMessage;
@class AWSrdsPurchaseReservedDBInstancesOfferingResult;
@class AWSrdsRange;
@class AWSrdsRebootDBInstanceMessage;
@class AWSrdsRebootDBInstanceResult;
@class AWSrdsRecurringCharge;
@class AWSrdsRegisterDBProxyTargetsRequest;
@class AWSrdsRegisterDBProxyTargetsResponse;
@class AWSrdsRemoveFromGlobalClusterMessage;
@class AWSrdsRemoveFromGlobalClusterResult;
@class AWSrdsRemoveRoleFromDBClusterMessage;
@class AWSrdsRemoveRoleFromDBInstanceMessage;
@class AWSrdsRemoveSourceIdentifierFromSubscriptionMessage;
@class AWSrdsRemoveSourceIdentifierFromSubscriptionResult;
@class AWSrdsRemoveTagsFromResourceMessage;
@class AWSrdsReservedDBInstance;
@class AWSrdsReservedDBInstanceMessage;
@class AWSrdsReservedDBInstancesOffering;
@class AWSrdsReservedDBInstancesOfferingMessage;
@class AWSrdsResetDBClusterParameterGroupMessage;
@class AWSrdsResetDBParameterGroupMessage;
@class AWSrdsResourcePendingMaintenanceActions;
@class AWSrdsRestoreDBClusterFromS3Message;
@class AWSrdsRestoreDBClusterFromS3Result;
@class AWSrdsRestoreDBClusterFromSnapshotMessage;
@class AWSrdsRestoreDBClusterFromSnapshotResult;
@class AWSrdsRestoreDBClusterToPointInTimeMessage;
@class AWSrdsRestoreDBClusterToPointInTimeResult;
@class AWSrdsRestoreDBInstanceFromDBSnapshotMessage;
@class AWSrdsRestoreDBInstanceFromDBSnapshotResult;
@class AWSrdsRestoreDBInstanceFromS3Message;
@class AWSrdsRestoreDBInstanceFromS3Result;
@class AWSrdsRestoreDBInstanceToPointInTimeMessage;
@class AWSrdsRestoreDBInstanceToPointInTimeResult;
@class AWSrdsRestoreWindow;
@class AWSrdsRevokeDBSecurityGroupIngressMessage;
@class AWSrdsRevokeDBSecurityGroupIngressResult;
@class AWSrdsScalingConfiguration;
@class AWSrdsScalingConfigurationInfo;
@class AWSrdsSourceRegion;
@class AWSrdsSourceRegionMessage;
@class AWSrdsStartActivityStreamRequest;
@class AWSrdsStartActivityStreamResponse;
@class AWSrdsStartDBClusterMessage;
@class AWSrdsStartDBClusterResult;
@class AWSrdsStartDBInstanceMessage;
@class AWSrdsStartDBInstanceResult;
@class AWSrdsStartExportTaskMessage;
@class AWSrdsStopActivityStreamRequest;
@class AWSrdsStopActivityStreamResponse;
@class AWSrdsStopDBClusterMessage;
@class AWSrdsStopDBClusterResult;
@class AWSrdsStopDBInstanceMessage;
@class AWSrdsStopDBInstanceResult;
@class AWSrdsSubnet;
@class AWSrdsTag;
@class AWSrdsTagListMessage;
@class AWSrdsTargetHealth;
@class AWSrdsTimezone;
@class AWSrdsUpgradeTarget;
@class AWSrdsUserAuthConfig;
@class AWSrdsUserAuthConfigInfo;
@class AWSrdsValidDBInstanceModificationsMessage;
@class AWSrdsValidStorageOptions;
@class AWSrdsVpcSecurityGroupMembership;
@class AWSrdsVpnDetails;

/**
 <p>Data returned by the <b>DescribeAccountAttributes</b> action.</p>
 */
@interface AWSrdsAccountAttributesMessage : AWSModel


/**
 <p>A list of <code>AccountQuota</code> objects. Within this list, each quota has a name, a count of usage toward the quota maximum, and a maximum value for the quota.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsAccountQuota *> * _Nullable accountQuotas;

@end

/**
 <p>Describes a quota for an AWS account.</p><p>The following are account quotas:</p><ul><li><p><code>AllocatedStorage</code> - The total allocated storage per account, in GiB. The used value is the total allocated storage in the account, in GiB.</p></li><li><p><code>AuthorizationsPerDBSecurityGroup</code> - The number of ingress rules per DB security group. The used value is the highest number of ingress rules in a DB security group in the account. Other DB security groups in the account might have a lower number of ingress rules.</p></li><li><p><code>CustomEndpointsPerDBCluster</code> - The number of custom endpoints per DB cluster. The used value is the highest number of custom endpoints in a DB clusters in the account. Other DB clusters in the account might have a lower number of custom endpoints.</p></li><li><p><code>DBClusterParameterGroups</code> - The number of DB cluster parameter groups per account, excluding default parameter groups. The used value is the count of nondefault DB cluster parameter groups in the account.</p></li><li><p><code>DBClusterRoles</code> - The number of associated AWS Identity and Access Management (IAM) roles per DB cluster. The used value is the highest number of associated IAM roles for a DB cluster in the account. Other DB clusters in the account might have a lower number of associated IAM roles.</p></li><li><p><code>DBClusters</code> - The number of DB clusters per account. The used value is the count of DB clusters in the account.</p></li><li><p><code>DBInstanceRoles</code> - The number of associated IAM roles per DB instance. The used value is the highest number of associated IAM roles for a DB instance in the account. Other DB instances in the account might have a lower number of associated IAM roles.</p></li><li><p><code>DBInstances</code> - The number of DB instances per account. The used value is the count of the DB instances in the account.</p><p>Amazon RDS DB instances, Amazon Aurora DB instances, Amazon Neptune instances, and Amazon DocumentDB instances apply to this quota.</p></li><li><p><code>DBParameterGroups</code> - The number of DB parameter groups per account, excluding default parameter groups. The used value is the count of nondefault DB parameter groups in the account.</p></li><li><p><code>DBSecurityGroups</code> - The number of DB security groups (not VPC security groups) per account, excluding the default security group. The used value is the count of nondefault DB security groups in the account.</p></li><li><p><code>DBSubnetGroups</code> - The number of DB subnet groups per account. The used value is the count of the DB subnet groups in the account.</p></li><li><p><code>EventSubscriptions</code> - The number of event subscriptions per account. The used value is the count of the event subscriptions in the account.</p></li><li><p><code>ManualSnapshots</code> - The number of manual DB snapshots per account. The used value is the count of the manual DB snapshots in the account.</p></li><li><p><code>OptionGroups</code> - The number of DB option groups per account, excluding default option groups. The used value is the count of nondefault DB option groups in the account.</p></li><li><p><code>ReadReplicasPerMaster</code> - The number of read replicas per DB instance. The used value is the highest number of read replicas for a DB instance in the account. Other DB instances in the account might have a lower number of read replicas.</p></li><li><p><code>ReservedDBInstances</code> - The number of reserved DB instances per account. The used value is the count of the active reserved DB instances in the account.</p></li><li><p><code>SubnetsPerDBSubnetGroup</code> - The number of subnets per DB subnet group. The used value is highest number of subnets for a DB subnet group in the account. Other DB subnet groups in the account might have a lower number of subnets.</p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Limits.html">Quotas for Amazon RDS</a> in the <i>Amazon RDS User Guide</i> and <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_Limits.html">Quotas for Amazon Aurora</a> in the <i>Amazon Aurora User Guide</i>.</p>
 */
@interface AWSrdsAccountQuota : AWSModel


/**
 <p>The name of the Amazon RDS quota for this AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountQuotaName;

/**
 <p>The maximum allowed value for the quota.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable max;

/**
 <p>The amount currently used toward the quota maximum.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable used;

@end

/**
 
 */
@interface AWSrdsAddRoleToDBClusterMessage : AWSRequest


/**
 <p>The name of the DB cluster to associate the IAM role with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>The name of the feature for the DB cluster that the IAM role is to be associated with. For the list of supported feature names, see <a>DBEngineVersion</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable featureName;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role to associate with the Aurora DB cluster, for example <code>arn:aws:iam::123456789012:role/AuroraAccessRole</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSrdsAddRoleToDBInstanceMessage : AWSRequest


/**
 <p>The name of the DB instance to associate the IAM role with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p>The name of the feature for the DB instance that the IAM role is to be associated with. For the list of supported feature names, see <a>DBEngineVersion</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable featureName;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role to associate with the DB instance, for example <code>arn:aws:iam::123456789012:role/AccessRole</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p/>
 Required parameters: [SubscriptionName, SourceIdentifier]
 */
@interface AWSrdsAddSourceIdentifierToSubscriptionMessage : AWSRequest


/**
 <p>The identifier of the event source to be added.</p><p>Constraints:</p><ul><li><p>If the source type is a DB instance, then a <code>DBInstanceIdentifier</code> must be supplied.</p></li><li><p>If the source type is a DB security group, a <code>DBSecurityGroupName</code> must be supplied.</p></li><li><p>If the source type is a DB parameter group, a <code>DBParameterGroupName</code> must be supplied.</p></li><li><p>If the source type is a DB snapshot, a <code>DBSnapshotIdentifier</code> must be supplied.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable sourceIdentifier;

/**
 <p>The name of the RDS event notification subscription you want to add a source identifier to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionName;

@end

/**
 
 */
@interface AWSrdsAddSourceIdentifierToSubscriptionResult : AWSModel


/**
 <p>Contains the results of a successful invocation of the <code>DescribeEventSubscriptions</code> action.</p>
 */
@property (nonatomic, strong) AWSrdsEventSubscription * _Nullable eventSubscription;

@end

/**
 <p/>
 Required parameters: [ResourceName, Tags]
 */
@interface AWSrdsAddTagsToResourceMessage : AWSRequest


/**
 <p>The Amazon RDS resource that the tags are added to. This value is an Amazon Resource Name (ARN). For information about creating an ARN, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing"> Constructing an RDS Amazon Resource Name (ARN)</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

/**
 <p>The tags to be assigned to the Amazon RDS resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

@end

/**
 <p/>
 Required parameters: [ResourceIdentifier, ApplyAction, OptInType]
 */
@interface AWSrdsApplyPendingMaintenanceActionMessage : AWSRequest


/**
 <p>The pending maintenance action to apply to this resource.</p><p>Valid values: <code>system-update</code>, <code>db-upgrade</code>, <code>hardware-maintenance</code>, <code>ca-certificate-rotation</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable applyAction;

/**
 <p>A value that specifies the type of opt-in request, or undoes an opt-in request. An opt-in request of type <code>immediate</code> can't be undone.</p><p>Valid values:</p><ul><li><p><code>immediate</code> - Apply the maintenance action immediately.</p></li><li><p><code>next-maintenance</code> - Apply the maintenance action during the next maintenance window for the resource.</p></li><li><p><code>undo-opt-in</code> - Cancel any existing <code>next-maintenance</code> opt-in requests.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable optInType;

/**
 <p>The RDS Amazon Resource Name (ARN) of the resource that the pending maintenance action applies to. For information about creating an ARN, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing"> Constructing an RDS Amazon Resource Name (ARN)</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceIdentifier;

@end

/**
 
 */
@interface AWSrdsApplyPendingMaintenanceActionResult : AWSModel


/**
 <p>Describes the pending maintenance actions for a resource.</p>
 */
@property (nonatomic, strong) AWSrdsResourcePendingMaintenanceActions * _Nullable resourcePendingMaintenanceActions;

@end

/**
 <p/>
 Required parameters: [DBSecurityGroupName]
 */
@interface AWSrdsAuthorizeDBSecurityGroupIngressMessage : AWSRequest


/**
 <p>The IP range to authorize.</p>
 */
@property (nonatomic, strong) NSString * _Nullable CIDRIP;

/**
 <p>The name of the DB security group to add authorization to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSecurityGroupName;

/**
 <p> Id of the EC2 security group to authorize. For VPC DB security groups, <code>EC2SecurityGroupId</code> must be provided. Otherwise, <code>EC2SecurityGroupOwnerId</code> and either <code>EC2SecurityGroupName</code> or <code>EC2SecurityGroupId</code> must be provided. </p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupId;

/**
 <p> Name of the EC2 security group to authorize. For VPC DB security groups, <code>EC2SecurityGroupId</code> must be provided. Otherwise, <code>EC2SecurityGroupOwnerId</code> and either <code>EC2SecurityGroupName</code> or <code>EC2SecurityGroupId</code> must be provided. </p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupName;

/**
 <p> AWS account number of the owner of the EC2 security group specified in the <code>EC2SecurityGroupName</code> parameter. The AWS access key ID isn't an acceptable value. For VPC DB security groups, <code>EC2SecurityGroupId</code> must be provided. Otherwise, <code>EC2SecurityGroupOwnerId</code> and either <code>EC2SecurityGroupName</code> or <code>EC2SecurityGroupId</code> must be provided. </p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupOwnerId;

@end

/**
 
 */
@interface AWSrdsAuthorizeDBSecurityGroupIngressResult : AWSModel


/**
 <p>Contains the details for an Amazon RDS DB security group. </p><p>This data type is used as a response element in the <code>DescribeDBSecurityGroups</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBSecurityGroup * _Nullable DBSecurityGroup;

@end

/**
 <p>Contains Availability Zone information.</p><p> This data type is used as an element in the <code>OrderableDBInstanceOption</code> data type.</p>
 */
@interface AWSrdsAvailabilityZone : AWSModel


/**
 <p>The name of the Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Contains the available processor feature information for the DB instance class of a DB instance.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html#USER_ConfigureProcessor">Configuring the Processor of the DB Instance Class</a> in the <i>Amazon RDS User Guide. </i></p>
 */
@interface AWSrdsAvailableProcessorFeature : AWSModel


/**
 <p>The allowed values for the processor feature of the DB instance class.</p>
 */
@property (nonatomic, strong) NSString * _Nullable allowedValues;

/**
 <p>The default value for the processor feature of the DB instance class.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultValue;

/**
 <p>The name of the processor feature. Valid names are <code>coreCount</code> and <code>threadsPerCore</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p/>
 Required parameters: [DBClusterIdentifier, BacktrackTo]
 */
@interface AWSrdsBacktrackDBClusterMessage : AWSRequest


/**
 <p>The timestamp of the time to backtrack the DB cluster to, specified in ISO 8601 format. For more information about ISO 8601, see the <a href="http://en.wikipedia.org/wiki/ISO_8601">ISO8601 Wikipedia page.</a></p><note><p>If the specified time isn't a consistent time for the DB cluster, Aurora automatically chooses the nearest possible consistent time for the DB cluster.</p></note><p>Constraints:</p><ul><li><p>Must contain a valid ISO 8601 timestamp.</p></li><li><p>Can't contain a timestamp set in the future.</p></li></ul><p>Example: <code>2017-07-08T18:00Z</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable backtrackTo;

/**
 <p>The DB cluster identifier of the DB cluster to be backtracked. This parameter is stored as a lowercase string.</p><p>Constraints:</p><ul><li><p>Must contain from 1 to 63 alphanumeric characters or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens.</p></li></ul><p>Example: <code>my-cluster1</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>A value that indicates whether to force the DB cluster to backtrack when binary logging is enabled. Otherwise, an error occurs when binary logging is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

/**
 <p>A value that indicates whether to backtrack the DB cluster to the earliest possible backtrack time when <i>BacktrackTo</i> is set to a timestamp earlier than the earliest backtrack time. When this parameter is disabled and <i>BacktrackTo</i> is set to a timestamp earlier than the earliest backtrack time, an error occurs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable useEarliestTimeOnPointInTimeUnavailable;

@end

/**
 
 */
@interface AWSrdsCancelExportTaskMessage : AWSRequest


/**
 <p>The identifier of the snapshot export task to cancel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exportTaskIdentifier;

@end

/**
 <p>A CA certificate for an AWS account.</p>
 */
@interface AWSrdsCertificate : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The unique key that identifies a certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateIdentifier;

/**
 <p>The type of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateType;

/**
 <p>Whether there is an override for the default certificate identifier.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable customerOverride;

/**
 <p>If there is an override for the default certificate identifier, when the override expires.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable customerOverrideValidTill;

/**
 <p>The thumbprint of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thumbprint;

/**
 <p>The starting date from which the certificate is valid.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable validFrom;

/**
 <p>The final date that the certificate continues to be valid.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable validTill;

@end

/**
 <p>Data returned by the <b>DescribeCertificates</b> action.</p>
 */
@interface AWSrdsCertificateMessage : AWSModel


/**
 <p>The list of <code>Certificate</code> objects for the AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsCertificate *> * _Nullable certificates;

/**
 <p> An optional pagination token provided by a previous <code>DescribeCertificates</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code> . </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p> This data type is used as a response element in the action <code>DescribeDBEngineVersions</code>. </p>
 */
@interface AWSrdsCharacterSet : AWSModel


/**
 <p>The description of the character set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable characterSetDescription;

/**
 <p>The name of the character set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable characterSetName;

@end

/**
 <p>The configuration setting for the log types to be enabled for export to CloudWatch Logs for a specific DB instance or DB cluster.</p><p>The <code>EnableLogTypes</code> and <code>DisableLogTypes</code> arrays determine which logs will be exported (or not exported) to CloudWatch Logs. The values within these arrays depend on the DB engine being used. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing Database Logs to Amazon CloudWatch Logs </a> in the <i>Amazon RDS User Guide</i>.</p>
 */
@interface AWSrdsCloudwatchLogsExportConfiguration : AWSModel


/**
 <p>The list of log types to disable.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable disableLogTypes;

/**
 <p>The list of log types to enable.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable enableLogTypes;

@end

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Specifies the settings that control the size and behavior of the connection pool associated with a <code>DBProxyTargetGroup</code>.</p>
 */
@interface AWSrdsConnectionPoolConfiguration : AWSModel


/**
 <p>The number of seconds for a proxy to wait for a connection to become available in the connection pool. Only applies when the proxy has opened its maximum number of connections and all connections are busy with client sessions.</p><p>Default: 120</p><p>Constraints: between 1 and 3600, or 0 representing unlimited</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable connectionBorrowTimeout;

/**
 <p> One or more SQL statements for the proxy to run when opening each new database connection. Typically used with <code>SET</code> statements to make sure that each connection has identical settings such as time zone and character set. For multiple statements, use semicolons as the separator. You can also include multiple variables in a single <code>SET</code> statement, such as <code>SET x=1, y=2</code>. </p><p><code>InitQuery</code> is not currently supported for PostgreSQL.</p><p>Default: no initialization query</p>
 */
@property (nonatomic, strong) NSString * _Nullable initQuery;

/**
 <p>The maximum size of the connection pool for each target in a target group. For Aurora MySQL, it is expressed as a percentage of the <code>max_connections</code> setting for the RDS DB instance or Aurora DB cluster used by the target group.</p><p>Default: 100</p><p>Constraints: between 1 and 100</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxConnectionsPercent;

/**
 <p> Controls how actively the proxy closes idle database connections in the connection pool. A high value enables the proxy to leave a high percentage of idle connections open. A low value causes the proxy to close idle client connections and return the underlying database connections to the connection pool. For Aurora MySQL, it is expressed as a percentage of the <code>max_connections</code> setting for the RDS DB instance or Aurora DB cluster used by the target group. </p><p>Default: 50</p><p>Constraints: between 0 and <code>MaxConnectionsPercent</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxIdleConnectionsPercent;

/**
 <p>Each item in the list represents a class of SQL operations that normally cause all later statements in a session using a proxy to be pinned to the same underlying database connection. Including an item in the list exempts that class of SQL operations from the pinning behavior.</p><p>Default: no session pinning filters</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sessionPinningFilters;

@end

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Displays the settings that control the size and behavior of the connection pool associated with a <code>DBProxyTarget</code>.</p>
 */
@interface AWSrdsConnectionPoolConfigurationInfo : AWSModel


/**
 <p>The number of seconds for a proxy to wait for a connection to become available in the connection pool. Only applies when the proxy has opened its maximum number of connections and all connections are busy with client sessions.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable connectionBorrowTimeout;

/**
 <p> One or more SQL statements for the proxy to run when opening each new database connection. Typically used with <code>SET</code> statements to make sure that each connection has identical settings such as time zone and character set. This setting is empty by default. For multiple statements, use semicolons as the separator. You can also include multiple variables in a single <code>SET</code> statement, such as <code>SET x=1, y=2</code>. </p><p><code>InitQuery</code> is not currently supported for PostgreSQL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable initQuery;

/**
 <p>The maximum size of the connection pool for each target in a target group. For Aurora MySQL, it is expressed as a percentage of the <code>max_connections</code> setting for the RDS DB instance or Aurora DB cluster used by the target group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxConnectionsPercent;

/**
 <p> Controls how actively the proxy closes idle database connections in the connection pool. A high value enables the proxy to leave a high percentage of idle connections open. A low value causes the proxy to close idle client connections and return the underlying database connections to the connection pool. For Aurora MySQL, it is expressed as a percentage of the <code>max_connections</code> setting for the RDS DB instance or Aurora DB cluster used by the target group. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxIdleConnectionsPercent;

/**
 <p>Each item in the list represents a class of SQL operations that normally cause all later statements in a session using a proxy to be pinned to the same underlying database connection. Including an item in the list exempts that class of SQL operations from the pinning behavior. Currently, the only allowed value is <code>EXCLUDE_VARIABLE_SETS</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sessionPinningFilters;

@end

/**
 
 */
@interface AWSrdsReplicateDBClusterParameterGroupMessage : AWSRequest


/**
 <p>The identifier or Amazon Resource Name (ARN) for the source DB cluster parameter group. For information about creating an ARN, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing"> Constructing an ARN for Amazon RDS</a> in the <i>Amazon Aurora User Guide</i>. </p><p>Constraints:</p><ul><li><p>Must specify a valid DB cluster parameter group.</p></li><li><p>If the source DB cluster parameter group is in the same AWS Region as the copy, specify a valid DB parameter group identifier, for example <code>my-db-cluster-param-group</code>, or a valid ARN.</p></li><li><p>If the source DB parameter group is in a different AWS Region than the copy, specify a valid DB cluster parameter group ARN, for example <code>arn:aws:rds:us-east-1:123456789012:cluster-pg:custom-cluster-group1</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable sourceDBClusterParameterGroupIdentifier;

/**
 <p>A list of tags. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

/**
 <p>A description for the copied DB cluster parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetDBClusterParameterGroupDescription;

/**
 <p>The identifier for the copied DB cluster parameter group.</p><p>Constraints:</p><ul><li><p>Can't be null, empty, or blank</p></li><li><p>Must contain from 1 to 255 letters, numbers, or hyphens</p></li><li><p>First character must be a letter</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens</p></li></ul><p>Example: <code>my-cluster-param-group1</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable targetDBClusterParameterGroupIdentifier;

@end

/**
 
 */
@interface AWSrdsReplicateDBClusterParameterGroupResult : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB cluster parameter group. </p><p>This data type is used as a response element in the <code>DescribeDBClusterParameterGroups</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBClusterParameterGroup * _Nullable DBClusterParameterGroup;

@end

/**
 <p/>
 Required parameters: [SourceDBClusterSnapshotIdentifier, TargetDBClusterSnapshotIdentifier]
 */
@interface AWSrdsReplicateDBClusterSnapshotMessage : AWSRequest


/**
 <p>A value that indicates whether to copy all tags from the source DB cluster snapshot to the target DB cluster snapshot. By default, tags are not copied.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicateTags;

/**
 <p>The AWS KMS key ID for an encrypted DB cluster snapshot. The KMS key ID is the Amazon Resource Name (ARN), KMS key identifier, or the KMS key alias for the KMS encryption key. </p><p>If you copy an encrypted DB cluster snapshot from your AWS account, you can specify a value for <code>KmsKeyId</code> to encrypt the copy with a new KMS encryption key. If you don't specify a value for <code>KmsKeyId</code>, then the copy of the DB cluster snapshot is encrypted with the same KMS key as the source DB cluster snapshot. </p><p>If you copy an encrypted DB cluster snapshot that is shared from another AWS account, then you must specify a value for <code>KmsKeyId</code>. </p><p>To copy an encrypted DB cluster snapshot to another AWS Region, you must set <code>KmsKeyId</code> to the KMS key ID you want to use to encrypt the copy of the DB cluster snapshot in the destination AWS Region. KMS encryption keys are specific to the AWS Region that they are created in, and you can't use encryption keys from one AWS Region in another AWS Region.</p><p>If you copy an unencrypted DB cluster snapshot and specify a value for the <code>KmsKeyId</code> parameter, an error is returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The URL that contains a Signature Version 4 signed request for the <code>CopyDBClusterSnapshot</code> API action in the AWS Region that contains the source DB cluster snapshot to copy. The <code>PreSignedUrl</code> parameter must be used when copying an encrypted DB cluster snapshot from another AWS Region. Don't specify <code>PreSignedUrl</code> when you are copying an encrypted DB cluster snapshot in the same AWS Region.</p><p>The pre-signed URL must be a valid request for the <code>CopyDBClusterSnapshot</code> API action that can be executed in the source AWS Region that contains the encrypted DB cluster snapshot to be copied. The pre-signed URL request must contain the following parameter values:</p><ul><li><p><code>KmsKeyId</code> - The AWS KMS key identifier for the key to use to encrypt the copy of the DB cluster snapshot in the destination AWS Region. This is the same identifier for both the <code>CopyDBClusterSnapshot</code> action that is called in the destination AWS Region, and the action contained in the pre-signed URL.</p></li><li><p><code>DestinationRegion</code> - The name of the AWS Region that the DB cluster snapshot is to be created in.</p></li><li><p><code>SourceDBClusterSnapshotIdentifier</code> - The DB cluster snapshot identifier for the encrypted DB cluster snapshot to be copied. This identifier must be in the Amazon Resource Name (ARN) format for the source AWS Region. For example, if you are copying an encrypted DB cluster snapshot from the us-west-2 AWS Region, then your <code>SourceDBClusterSnapshotIdentifier</code> looks like the following example: <code>arn:aws:rds:us-west-2:123456789012:cluster-snapshot:aurora-cluster1-snapshot-20161115</code>.</p></li></ul><p>To learn how to generate a Signature Version 4 signed request, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html"> Authenticating Requests: Using Query Parameters (AWS Signature Version 4)</a> and <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html"> Signature Version 4 Signing Process</a>.</p><note><p>If you are using an AWS SDK tool or the AWS CLI, you can specify <code>SourceRegion</code> (or <code>--source-region</code> for the AWS CLI) instead of specifying <code>PreSignedUrl</code> manually. Specifying <code>SourceRegion</code> autogenerates a pre-signed URL that is a valid request for the operation that can be executed in the source AWS Region.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable preSignedUrl;

/**
 <p>The identifier of the DB cluster snapshot to copy. This parameter isn't case-sensitive.</p><p>You can't copy an encrypted, shared DB cluster snapshot from one AWS Region to another.</p><p>Constraints:</p><ul><li><p>Must specify a valid system snapshot in the "available" state.</p></li><li><p>If the source snapshot is in the same AWS Region as the copy, specify a valid DB snapshot identifier.</p></li><li><p>If the source snapshot is in a different AWS Region than the copy, specify a valid DB cluster snapshot ARN. For more information, go to <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_CopySnapshot.html#USER_CopySnapshot.AcrossRegions"> Copying Snapshots Across AWS Regions</a> in the <i>Amazon Aurora User Guide.</i></p></li></ul><p>Example: <code>my-cluster-snapshot1</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceDBClusterSnapshotIdentifier;

/**
 <p>A list of tags. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

/**
 <p>The identifier of the new DB cluster snapshot to create from the source DB cluster snapshot. This parameter isn't case-sensitive.</p><p>Constraints:</p><ul><li><p>Must contain from 1 to 63 letters, numbers, or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens.</p></li></ul><p>Example: <code>my-cluster-snapshot2</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable targetDBClusterSnapshotIdentifier;

@end

/**
 
 */
@interface AWSrdsReplicateDBClusterSnapshotResult : AWSModel


/**
 <p>Contains the details for an Amazon RDS DB cluster snapshot </p><p>This data type is used as a response element in the <code>DescribeDBClusterSnapshots</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBClusterSnapshot * _Nullable DBClusterSnapshot;

@end

/**
 <p/>
 Required parameters: [SourceDBParameterGroupIdentifier, TargetDBParameterGroupIdentifier, TargetDBParameterGroupDescription]
 */
@interface AWSrdsReplicateDBParameterGroupMessage : AWSRequest


/**
 <p> The identifier or ARN for the source DB parameter group. For information about creating an ARN, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing"> Constructing an ARN for Amazon RDS</a> in the <i>Amazon RDS User Guide</i>. </p><p>Constraints:</p><ul><li><p>Must specify a valid DB parameter group.</p></li><li><p>Must specify a valid DB parameter group identifier, for example <code>my-db-param-group</code>, or a valid ARN.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable sourceDBParameterGroupIdentifier;

/**
 <p>A list of tags. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

/**
 <p>A description for the copied DB parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetDBParameterGroupDescription;

/**
 <p>The identifier for the copied DB parameter group.</p><p>Constraints:</p><ul><li><p>Can't be null, empty, or blank</p></li><li><p>Must contain from 1 to 255 letters, numbers, or hyphens</p></li><li><p>First character must be a letter</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens</p></li></ul><p>Example: <code>my-db-parameter-group</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable targetDBParameterGroupIdentifier;

@end

/**
 
 */
@interface AWSrdsReplicateDBParameterGroupResult : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB parameter group. </p><p>This data type is used as a response element in the <code>DescribeDBParameterGroups</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBParameterGroup * _Nullable DBParameterGroup;

@end

/**
 <p/>
 Required parameters: [SourceDBSnapshotIdentifier, TargetDBSnapshotIdentifier]
 */
@interface AWSrdsReplicateDBSnapshotMessage : AWSRequest


/**
 <p>A value that indicates whether to copy all tags from the source DB snapshot to the target DB snapshot. By default, tags are not copied.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicateTags;

/**
 <p>The AWS KMS key ID for an encrypted DB snapshot. The KMS key ID is the Amazon Resource Name (ARN), KMS key identifier, or the KMS key alias for the KMS encryption key. </p><p>If you copy an encrypted DB snapshot from your AWS account, you can specify a value for this parameter to encrypt the copy with a new KMS encryption key. If you don't specify a value for this parameter, then the copy of the DB snapshot is encrypted with the same KMS key as the source DB snapshot. </p><p>If you copy an encrypted DB snapshot that is shared from another AWS account, then you must specify a value for this parameter. </p><p>If you specify this parameter when you copy an unencrypted snapshot, the copy is encrypted. </p><p>If you copy an encrypted snapshot to a different AWS Region, then you must specify a KMS key for the destination AWS Region. KMS encryption keys are specific to the AWS Region that they are created in, and you can't use encryption keys from one AWS Region in another AWS Region. </p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The name of an option group to associate with the copy of the snapshot.</p><p>Specify this option if you are copying a snapshot from one AWS Region to another, and your DB instance uses a nondefault option group. If your source DB instance uses Transparent Data Encryption for Oracle or Microsoft SQL Server, you must specify this option when copying across AWS Regions. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_CopySnapshot.html#USER_CopySnapshot.Options">Option Group Considerations</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

/**
 <p>The URL that contains a Signature Version 4 signed request for the <code>CopyDBSnapshot</code> API action in the source AWS Region that contains the source DB snapshot to copy. </p><p>You must specify this parameter when you copy an encrypted DB snapshot from another AWS Region by using the Amazon RDS API. Don't specify <code>PreSignedUrl</code> when you are copying an encrypted DB snapshot in the same AWS Region.</p><p>The presigned URL must be a valid request for the <code>CopyDBSnapshot</code> API action that can be executed in the source AWS Region that contains the encrypted DB snapshot to be copied. The presigned URL request must contain the following parameter values: </p><ul><li><p><code>DestinationRegion</code> - The AWS Region that the encrypted DB snapshot is copied to. This AWS Region is the same one where the <code>CopyDBSnapshot</code> action is called that contains this presigned URL. </p><p>For example, if you copy an encrypted DB snapshot from the us-west-2 AWS Region to the us-east-1 AWS Region, then you call the <code>CopyDBSnapshot</code> action in the us-east-1 AWS Region and provide a presigned URL that contains a call to the <code>CopyDBSnapshot</code> action in the us-west-2 AWS Region. For this example, the <code>DestinationRegion</code> in the presigned URL must be set to the us-east-1 AWS Region. </p></li><li><p><code>KmsKeyId</code> - The AWS KMS key identifier for the key to use to encrypt the copy of the DB snapshot in the destination AWS Region. This is the same identifier for both the <code>CopyDBSnapshot</code> action that is called in the destination AWS Region, and the action contained in the presigned URL. </p></li><li><p><code>SourceDBSnapshotIdentifier</code> - The DB snapshot identifier for the encrypted snapshot to be copied. This identifier must be in the Amazon Resource Name (ARN) format for the source AWS Region. For example, if you are copying an encrypted DB snapshot from the us-west-2 AWS Region, then your <code>SourceDBSnapshotIdentifier</code> looks like the following example: <code>arn:aws:rds:us-west-2:123456789012:snapshot:mysql-instance1-snapshot-20161115</code>. </p></li></ul><p>To learn how to generate a Signature Version 4 signed request, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html">Authenticating Requests: Using Query Parameters (AWS Signature Version 4)</a> and <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 Signing Process</a>. </p><note><p>If you are using an AWS SDK tool or the AWS CLI, you can specify <code>SourceRegion</code> (or <code>--source-region</code> for the AWS CLI) instead of specifying <code>PreSignedUrl</code> manually. Specifying <code>SourceRegion</code> autogenerates a pre-signed URL that is a valid request for the operation that can be executed in the source AWS Region.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable preSignedUrl;

/**
 <p>The identifier for the source DB snapshot.</p><p>If the source snapshot is in the same AWS Region as the copy, specify a valid DB snapshot identifier. For example, you might specify <code>rds:mysql-instance1-snapshot-20130805</code>. </p><p>If the source snapshot is in a different AWS Region than the copy, specify a valid DB snapshot ARN. For example, you might specify <code>arn:aws:rds:us-west-2:123456789012:snapshot:mysql-instance1-snapshot-20130805</code>. </p><p>If you are copying from a shared manual DB snapshot, this parameter must be the Amazon Resource Name (ARN) of the shared DB snapshot. </p><p>If you are copying an encrypted snapshot this parameter must be in the ARN format for the source AWS Region, and must match the <code>SourceDBSnapshotIdentifier</code> in the <code>PreSignedUrl</code> parameter. </p><p>Constraints:</p><ul><li><p>Must specify a valid system snapshot in the "available" state.</p></li></ul><p>Example: <code>rds:mydb-2012-04-02-00-01</code></p><p>Example: <code>arn:aws:rds:us-west-2:123456789012:snapshot:mysql-instance1-snapshot-20130805</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceDBSnapshotIdentifier;

/**
 <p>A list of tags. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

/**
 <p>The identifier for the copy of the snapshot. </p><p>Constraints:</p><ul><li><p>Can't be null, empty, or blank</p></li><li><p>Must contain from 1 to 255 letters, numbers, or hyphens</p></li><li><p>First character must be a letter</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens</p></li></ul><p>Example: <code>my-db-snapshot</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable targetDBSnapshotIdentifier;

@end

/**
 
 */
@interface AWSrdsReplicateDBSnapshotResult : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB snapshot. </p><p>This data type is used as a response element in the <code>DescribeDBSnapshots</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBSnapshot * _Nullable DBSnapshot;

@end

/**
 <p/>
 Required parameters: [SourceOptionGroupIdentifier, TargetOptionGroupIdentifier, TargetOptionGroupDescription]
 */
@interface AWSrdsReplicateOptionGroupMessage : AWSRequest


/**
 <p>The identifier or ARN for the source option group. For information about creating an ARN, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing"> Constructing an ARN for Amazon RDS</a> in the <i>Amazon RDS User Guide</i>. </p><p>Constraints:</p><ul><li><p>Must specify a valid option group.</p></li><li><p>If the source option group is in the same AWS Region as the copy, specify a valid option group identifier, for example <code>my-option-group</code>, or a valid ARN.</p></li><li><p>If the source option group is in a different AWS Region than the copy, specify a valid option group ARN, for example <code>arn:aws:rds:us-west-2:123456789012:og:special-options</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable sourceOptionGroupIdentifier;

/**
 <p>A list of tags. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

/**
 <p>The description for the copied option group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetOptionGroupDescription;

/**
 <p>The identifier for the copied option group.</p><p>Constraints:</p><ul><li><p>Can't be null, empty, or blank</p></li><li><p>Must contain from 1 to 255 letters, numbers, or hyphens</p></li><li><p>First character must be a letter</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens</p></li></ul><p>Example: <code>my-option-group</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable targetOptionGroupIdentifier;

@end

/**
 
 */
@interface AWSrdsReplicateOptionGroupResult : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) AWSrdsOptionGroup * _Nullable optionGroup;

@end

/**
 <p/>
 Required parameters: [CustomAvailabilityZoneName]
 */
@interface AWSrdsCreateCustomAvailabilityZoneMessage : AWSRequest


/**
 <p>The name of the custom Availability Zone (AZ).</p>
 */
@property (nonatomic, strong) NSString * _Nullable customAvailabilityZoneName;

/**
 <p>The ID of an existing virtual private network (VPN) between the Amazon RDS website and the VMware vSphere cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable existingVpnId;

/**
 <p>The name of a new VPN tunnel between the Amazon RDS website and the VMware vSphere cluster.</p><p>Specify this parameter only if <code>ExistingVpnId</code> isn't specified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestVpnTunnelName;

/**
 <p>The IP address of network traffic from your on-premises data center. A custom AZ receives the network traffic.</p><p>Specify this parameter only if <code>ExistingVpnId</code> isn't specified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpnTunnelOriginatorIP;

@end

/**
 
 */
@interface AWSrdsCreateCustomAvailabilityZoneResult : AWSModel


/**
 <p>A custom Availability Zone (AZ) is an on-premises AZ that is integrated with a VMware vSphere cluster.</p><p>For more information about RDS on VMware, see the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html"><i>RDS on VMware User Guide.</i></a></p>
 */
@property (nonatomic, strong) AWSrdsCustomAvailabilityZone * _Nullable customAvailabilityZone;

@end

/**
 
 */
@interface AWSrdsCreateDBClusterEndpointMessage : AWSRequest


/**
 <p>The identifier to use for the new endpoint. This parameter is stored as a lowercase string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterEndpointIdentifier;

/**
 <p>The DB cluster identifier of the DB cluster associated with the endpoint. This parameter is stored as a lowercase string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>The type of the endpoint. One of: <code>READER</code>, <code>WRITER</code>, <code>ANY</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointType;

/**
 <p>List of DB instance identifiers that aren't part of the custom endpoint group. All other eligible instances are reachable through the custom endpoint. Only relevant if the list of static members is empty.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable excludedMembers;

/**
 <p>List of DB instance identifiers that are part of the custom endpoint group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable staticMembers;

/**
 <p>The tags to be assigned to the Amazon RDS resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

@end

/**
 <p/>
 Required parameters: [DBClusterIdentifier, Engine]
 */
@interface AWSrdsCreateDBClusterMessage : AWSRequest


/**
 <p>A list of Availability Zones (AZs) where instances in the DB cluster can be created. For information on AWS Regions and Availability Zones, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.RegionsAndAvailabilityZones.html">Choosing the Regions and Availability Zones</a> in the <i>Amazon Aurora User Guide</i>. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 <p>The target backtrack window, in seconds. To disable backtracking, set this value to 0. </p><p>Default: 0</p><p>Constraints:</p><ul><li><p>If specified, this value must be set to a number from 0 to 259,200 (72 hours).</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable backtrackWindow;

/**
 <p>The number of days for which automated backups are retained.</p><p>Default: 1</p><p>Constraints:</p><ul><li><p>Must be a value from 1 to 35</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupRetentionPeriod;

/**
 <p>A value that indicates that the DB cluster should be associated with the specified CharacterSet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable characterSetName;

/**
 <p>A value that indicates whether to copy all tags from the DB cluster to snapshots of the DB cluster. The default is not to copy them.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicateTagsToSnapshot;

/**
 <p>The DB cluster identifier. This parameter is stored as a lowercase string.</p><p>Constraints:</p><ul><li><p>Must contain from 1 to 63 letters, numbers, or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens.</p></li></ul><p>Example: <code>my-cluster1</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p> The name of the DB cluster parameter group to associate with this DB cluster. If you do not specify a value, then the default DB cluster parameter group for the specified DB engine and version is used. </p><p>Constraints:</p><ul><li><p>If supplied, must match the name of an existing DB cluster parameter group.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterParameterGroupName;

/**
 <p>A DB subnet group to associate with this DB cluster.</p><p>Constraints: Must match the name of an existing DBSubnetGroup. Must not be default.</p><p>Example: <code>mySubnetgroup</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroupName;

/**
 <p>The name for your database of up to 64 alphanumeric characters. If you do not provide a name, Amazon RDS doesn't create a database in the DB cluster you are creating.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p>The Active Directory directory ID to create the DB cluster in.</p><p> For Amazon Aurora DB clusters, Amazon RDS can use Kerberos Authentication to authenticate users that connect to the DB cluster. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/kerberos-authentication.html">Kerberos Authentication</a> in the <i>Amazon Aurora User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

/**
 <p>Specify the name of the IAM role to be used when making API calls to the Directory Service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainIAMRoleName;

/**
 <p>The list of log types that need to be enabled for exporting to CloudWatch Logs. The values in the list depend on the DB engine being used. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing Database Logs to Amazon CloudWatch Logs</a> in the <i>Amazon Aurora User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable enableCloudwatchLogsExports;

/**
 <p>A value that indicates whether to enable the HTTP endpoint for an Aurora Serverless DB cluster. By default, the HTTP endpoint is disabled.</p><p>When enabled, the HTTP endpoint provides a connectionless web service API for running SQL queries on the Aurora Serverless DB cluster. You can also query your database from inside the RDS console with the query editor.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/data-api.html">Using the Data API for Aurora Serverless</a> in the <i>Amazon Aurora User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableHttpEndpoint;

/**
 <p>A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.html"> IAM Database Authentication</a> in the <i>Amazon Aurora User Guide.</i></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableIAMDatabaseAuthentication;

/**
 <p>The name of the database engine to be used for this DB cluster.</p><p>Valid Values: <code>aurora</code> (for MySQL 5.6-compatible Aurora), <code>aurora-mysql</code> (for MySQL 5.7-compatible Aurora), and <code>aurora-postgresql</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The DB engine mode of the DB cluster, either <code>provisioned</code>, <code>serverless</code>, <code>parallelquery</code>, <code>global</code>, or <code>multimaster</code>.</p><note><p><code>global</code> engine mode only applies for global database clusters created with Aurora MySQL version 5.6.10a. For higher Aurora MySQL versions, the clusters in a global database use <code>provisioned</code> engine mode. </p></note><p>Limitations and requirements apply to some DB engine modes. For more information, see the following sections in the <i>Amazon Aurora User Guide</i>:</p><ul><li><p><a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html#aurora-serverless.limitations"> Limitations of Aurora Serverless</a></p></li><li><p><a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-mysql-parallel-query.html#aurora-mysql-parallel-query-limitations"> Limitations of Parallel Query</a></p></li><li><p><a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-global-database.html#aurora-global-database.limitations"> Requirements for Aurora Global Databases</a></p></li><li><p><a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-multi-master.html#aurora-multi-master-limitations"> Limitations of Multi-Master Clusters</a></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable engineMode;

/**
 <p>The version number of the database engine to use.</p><p>To list all of the available engine versions for <code>aurora</code> (for MySQL 5.6-compatible Aurora), use the following command:</p><p><code>aws rds describe-db-engine-versions --engine aurora --query "DBEngineVersions[].EngineVersion"</code></p><p>To list all of the available engine versions for <code>aurora-mysql</code> (for MySQL 5.7-compatible Aurora), use the following command:</p><p><code>aws rds describe-db-engine-versions --engine aurora-mysql --query "DBEngineVersions[].EngineVersion"</code></p><p>To list all of the available engine versions for <code>aurora-postgresql</code>, use the following command:</p><p><code>aws rds describe-db-engine-versions --engine aurora-postgresql --query "DBEngineVersions[].EngineVersion"</code></p><p><b>Aurora MySQL</b></p><p>Example: <code>5.6.10a</code>, <code>5.6.mysql_aurora.1.19.2</code>, <code>5.7.12</code>, <code>5.7.mysql_aurora.2.04.5</code></p><p><b>Aurora PostgreSQL</b></p><p>Example: <code>9.6.3</code>, <code>10.7</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p> The global cluster ID of an Aurora cluster that becomes the primary cluster in the new global database cluster. </p>
 */
@property (nonatomic, strong) NSString * _Nullable globalClusterIdentifier;

/**
 <p>The AWS KMS key identifier for an encrypted DB cluster.</p><p>The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If you are creating a DB cluster with the same AWS account that owns the KMS encryption key used to encrypt the new DB cluster, then you can use the KMS key alias instead of the ARN for the KMS encryption key.</p><p>If an encryption key isn't specified in <code>KmsKeyId</code>:</p><ul><li><p>If <code>ReplicationSourceIdentifier</code> identifies an encrypted source, then Amazon RDS will use the encryption key used to encrypt the source. Otherwise, Amazon RDS will use your default encryption key. </p></li><li><p>If the <code>StorageEncrypted</code> parameter is enabled and <code>ReplicationSourceIdentifier</code> isn't specified, then Amazon RDS will use your default encryption key.</p></li></ul><p>AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region.</p><p>If you create a read replica of an encrypted DB cluster in another AWS Region, you must set <code>KmsKeyId</code> to a KMS key ID that is valid in the destination AWS Region. This key is used to encrypt the read replica in that AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The password for the master database user. This password can contain any printable ASCII character except "/", """, or "@".</p><p>Constraints: Must contain from 8 to 41 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUserPassword;

/**
 <p>The name of the master user for the DB cluster.</p><p>Constraints:</p><ul><li><p>Must be 1 to 16 letters or numbers.</p></li><li><p>First character must be a letter.</p></li><li><p>Can't be a reserved word for the chosen database engine.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable masterUsername;

/**
 <p>A value that indicates that the DB cluster should be associated with the specified option group.</p><p>Permanent options can't be removed from an option group. The option group can't be removed from a DB cluster once it is associated with a DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

/**
 <p>The port number on which the instances in the DB cluster accept connections.</p><p> Default: <code>3306</code> if engine is set as aurora or <code>5432</code> if set to aurora-postgresql. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>A URL that contains a Signature Version 4 signed request for the <code>CreateDBCluster</code> action to be called in the source AWS Region where the DB cluster is replicated from. You only need to specify <code>PreSignedUrl</code> when you are performing cross-region replication from an encrypted DB cluster.</p><p>The pre-signed URL must be a valid request for the <code>CreateDBCluster</code> API action that can be executed in the source AWS Region that contains the encrypted DB cluster to be copied.</p><p>The pre-signed URL request must contain the following parameter values:</p><ul><li><p><code>KmsKeyId</code> - The AWS KMS key identifier for the key to use to encrypt the copy of the DB cluster in the destination AWS Region. This should refer to the same KMS key for both the <code>CreateDBCluster</code> action that is called in the destination AWS Region, and the action contained in the pre-signed URL.</p></li><li><p><code>DestinationRegion</code> - The name of the AWS Region that Aurora read replica will be created in.</p></li><li><p><code>ReplicationSourceIdentifier</code> - The DB cluster identifier for the encrypted DB cluster to be copied. This identifier must be in the Amazon Resource Name (ARN) format for the source AWS Region. For example, if you are copying an encrypted DB cluster from the us-west-2 AWS Region, then your <code>ReplicationSourceIdentifier</code> would look like Example: <code>arn:aws:rds:us-west-2:123456789012:cluster:aurora-cluster1</code>.</p></li></ul><p>To learn how to generate a Signature Version 4 signed request, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html"> Authenticating Requests: Using Query Parameters (AWS Signature Version 4)</a> and <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html"> Signature Version 4 Signing Process</a>.</p><note><p>If you are using an AWS SDK tool or the AWS CLI, you can specify <code>SourceRegion</code> (or <code>--source-region</code> for the AWS CLI) instead of specifying <code>PreSignedUrl</code> manually. Specifying <code>SourceRegion</code> autogenerates a pre-signed URL that is a valid request for the operation that can be executed in the source AWS Region.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable preSignedUrl;

/**
 <p>The daily time range during which automated backups are created if automated backups are enabled using the <code>BackupRetentionPeriod</code> parameter. </p><p>The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region. To see the time blocks available, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow.Aurora"> Adjusting the Preferred DB Cluster Maintenance Window</a> in the <i>Amazon Aurora User Guide.</i></p><p>Constraints:</p><ul><li><p>Must be in the format <code>hh24:mi-hh24:mi</code>.</p></li><li><p>Must be in Universal Coordinated Time (UTC).</p></li><li><p>Must not conflict with the preferred maintenance window.</p></li><li><p>Must be at least 30 minutes.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable preferredBackupWindow;

/**
 <p>The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC).</p><p>Format: <code>ddd:hh24:mi-ddd:hh24:mi</code></p><p>The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region, occurring on a random day of the week. To see the time blocks available, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow.Aurora"> Adjusting the Preferred DB Cluster Maintenance Window</a> in the <i>Amazon Aurora User Guide.</i></p><p>Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.</p><p>Constraints: Minimum 30-minute window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>The Amazon Resource Name (ARN) of the source DB instance or DB cluster if this DB cluster is created as a read replica.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationSourceIdentifier;

/**
 <p>For DB clusters in <code>serverless</code> DB engine mode, the scaling properties of the DB cluster.</p>
 */
@property (nonatomic, strong) AWSrdsScalingConfiguration * _Nullable scalingConfiguration;

/**
 <p>A value that indicates whether the DB cluster is encrypted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable storageEncrypted;

/**
 <p>Tags to assign to the DB cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

/**
 <p>A list of EC2 VPC security groups to associate with this DB cluster.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSecurityGroupIds;

@end

/**
 <p/>
 Required parameters: [DBClusterParameterGroupName, DBParameterGroupFamily, Description]
 */
@interface AWSrdsCreateDBClusterParameterGroupMessage : AWSRequest


/**
 <p>The name of the DB cluster parameter group.</p><p>Constraints:</p><ul><li><p>Must match the name of an existing DB cluster parameter group.</p></li></ul><note><p>This value is stored as a lowercase string.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterParameterGroupName;

/**
 <p>The DB cluster parameter group family name. A DB cluster parameter group can be associated with one and only one DB cluster parameter group family, and can be applied only to a DB cluster running a database engine and engine version compatible with that DB cluster parameter group family.</p><p><b>Aurora MySQL</b></p><p>Example: <code>aurora5.6</code>, <code>aurora-mysql5.7</code></p><p><b>Aurora PostgreSQL</b></p><p>Example: <code>aurora-postgresql9.6</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupFamily;

/**
 <p>The description for the DB cluster parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Tags to assign to the DB cluster parameter group.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSrdsCreateDBClusterParameterGroupResult : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB cluster parameter group. </p><p>This data type is used as a response element in the <code>DescribeDBClusterParameterGroups</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBClusterParameterGroup * _Nullable DBClusterParameterGroup;

@end

/**
 
 */
@interface AWSrdsCreateDBClusterResult : AWSModel


/**
 <p>Contains the details of an Amazon Aurora DB cluster. </p><p>This data type is used as a response element in the <code>DescribeDBClusters</code>, <code>StopDBCluster</code>, and <code>StartDBCluster</code> actions. </p>
 */
@property (nonatomic, strong) AWSrdsDBCluster * _Nullable DBCluster;

@end

/**
 <p/>
 Required parameters: [DBClusterSnapshotIdentifier, DBClusterIdentifier]
 */
@interface AWSrdsCreateDBClusterSnapshotMessage : AWSRequest


/**
 <p>The identifier of the DB cluster to create a snapshot for. This parameter isn't case-sensitive.</p><p>Constraints:</p><ul><li><p>Must match the identifier of an existing DBCluster.</p></li></ul><p>Example: <code>my-cluster1</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>The identifier of the DB cluster snapshot. This parameter is stored as a lowercase string.</p><p>Constraints:</p><ul><li><p>Must contain from 1 to 63 letters, numbers, or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens.</p></li></ul><p>Example: <code>my-cluster1-snapshot1</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterSnapshotIdentifier;

/**
 <p>The tags to be assigned to the DB cluster snapshot.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSrdsCreateDBClusterSnapshotResult : AWSModel


/**
 <p>Contains the details for an Amazon RDS DB cluster snapshot </p><p>This data type is used as a response element in the <code>DescribeDBClusterSnapshots</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBClusterSnapshot * _Nullable DBClusterSnapshot;

@end

/**
 <p/>
 Required parameters: [DBInstanceIdentifier, DBInstanceClass, Engine]
 */
@interface AWSrdsCreateDBInstanceMessage : AWSRequest


/**
 <p>The amount of storage (in gibibytes) to allocate for the DB instance.</p><p>Type: Integer</p><p><b>Amazon Aurora</b></p><p>Not applicable. Aurora cluster volumes automatically grow as the amount of data in your database increases, though you are only charged for the space that you use in an Aurora cluster volume.</p><p><b>MySQL</b></p><p>Constraints to the amount of storage for each storage type are the following: </p><ul><li><p>General Purpose (SSD) storage (gp2): Must be an integer from 20 to 65536.</p></li><li><p>Provisioned IOPS storage (io1): Must be an integer from 100 to 65536.</p></li><li><p>Magnetic storage (standard): Must be an integer from 5 to 3072.</p></li></ul><p><b>MariaDB</b></p><p>Constraints to the amount of storage for each storage type are the following: </p><ul><li><p>General Purpose (SSD) storage (gp2): Must be an integer from 20 to 65536.</p></li><li><p>Provisioned IOPS storage (io1): Must be an integer from 100 to 65536.</p></li><li><p>Magnetic storage (standard): Must be an integer from 5 to 3072.</p></li></ul><p><b>PostgreSQL</b></p><p>Constraints to the amount of storage for each storage type are the following: </p><ul><li><p>General Purpose (SSD) storage (gp2): Must be an integer from 20 to 65536.</p></li><li><p>Provisioned IOPS storage (io1): Must be an integer from 100 to 65536.</p></li><li><p>Magnetic storage (standard): Must be an integer from 5 to 3072.</p></li></ul><p><b>Oracle</b></p><p>Constraints to the amount of storage for each storage type are the following: </p><ul><li><p>General Purpose (SSD) storage (gp2): Must be an integer from 20 to 65536.</p></li><li><p>Provisioned IOPS storage (io1): Must be an integer from 100 to 65536.</p></li><li><p>Magnetic storage (standard): Must be an integer from 10 to 3072.</p></li></ul><p><b>SQL Server</b></p><p>Constraints to the amount of storage for each storage type are the following: </p><ul><li><p>General Purpose (SSD) storage (gp2):</p><ul><li><p>Enterprise and Standard editions: Must be an integer from 200 to 16384.</p></li><li><p>Web and Express editions: Must be an integer from 20 to 16384.</p></li></ul></li><li><p>Provisioned IOPS storage (io1):</p><ul><li><p>Enterprise and Standard editions: Must be an integer from 200 to 16384.</p></li><li><p>Web and Express editions: Must be an integer from 100 to 16384.</p></li></ul></li><li><p>Magnetic storage (standard):</p><ul><li><p>Enterprise and Standard editions: Must be an integer from 200 to 1024.</p></li><li><p>Web and Express editions: Must be an integer from 20 to 1024.</p></li></ul></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedStorage;

/**
 <p>A value that indicates whether minor engine upgrades are applied automatically to the DB instance during the maintenance window. By default, minor engine upgrades are applied automatically.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoMinorVersionUpgrade;

/**
 <p> The Availability Zone (AZ) where the database will be created. For information on AWS Regions and Availability Zones, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html">Regions and Availability Zones</a>. </p><p>Default: A random, system-chosen Availability Zone in the endpoint's AWS Region.</p><p> Example: <code>us-east-1d</code></p><p> Constraint: The <code>AvailabilityZone</code> parameter can't be specified if the DB instance is a Multi-AZ deployment. The specified Availability Zone must be in the same AWS Region as the current endpoint. </p><note><p>If you're creating a DB instance in an RDS on VMware environment, specify the identifier of the custom Availability Zone to create the DB instance in.</p><p>For more information about RDS on VMware, see the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html"><i>RDS on VMware User Guide.</i></a></p></note>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The number of days for which automated backups are retained. Setting this parameter to a positive number enables backups. Setting this parameter to 0 disables automated backups.</p><p><b>Amazon Aurora</b></p><p>Not applicable. The retention period for automated backups is managed by the DB cluster.</p><p>Default: 1</p><p>Constraints:</p><ul><li><p>Must be a value from 0 to 35</p></li><li><p>Can't be set to 0 if the DB instance is a source to read replicas</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupRetentionPeriod;

/**
 <p>For supported engines, indicates that the DB instance should be associated with the specified CharacterSet.</p><p><b>Amazon Aurora</b></p><p>Not applicable. The character set is managed by the DB cluster. For more information, see <code>CreateDBCluster</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable characterSetName;

/**
 <p>A value that indicates whether to copy tags from the DB instance to snapshots of the DB instance. By default, tags are not copied.</p><p><b>Amazon Aurora</b></p><p>Not applicable. Copying tags to snapshots is managed by the DB cluster. Setting this value for an Aurora DB instance has no effect on the DB cluster setting.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicateTagsToSnapshot;

/**
 <p>The identifier of the DB cluster that the instance will belong to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>The compute and memory capacity of the DB instance, for example, <code>db.m4.large</code>. Not all DB instance classes are available in all AWS Regions, or for all database engines. For the full list of DB instance classes, and availability for your engine, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html">DB Instance Class</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceClass;

/**
 <p>The DB instance identifier. This parameter is stored as a lowercase string.</p><p>Constraints:</p><ul><li><p>Must contain from 1 to 63 letters, numbers, or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens.</p></li></ul><p>Example: <code>mydbinstance</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p>The meaning of this parameter differs according to the database engine you use.</p><p><b>MySQL</b></p><p>The name of the database to create when the DB instance is created. If this parameter isn't specified, no database is created in the DB instance.</p><p>Constraints:</p><ul><li><p>Must contain 1 to 64 letters or numbers.</p></li><li><p>Can't be a word reserved by the specified database engine</p></li></ul><p><b>MariaDB</b></p><p>The name of the database to create when the DB instance is created. If this parameter isn't specified, no database is created in the DB instance.</p><p>Constraints:</p><ul><li><p>Must contain 1 to 64 letters or numbers.</p></li><li><p>Can't be a word reserved by the specified database engine</p></li></ul><p><b>PostgreSQL</b></p><p>The name of the database to create when the DB instance is created. If this parameter isn't specified, the default "postgres" database is created in the DB instance.</p><p>Constraints:</p><ul><li><p>Must contain 1 to 63 letters, numbers, or underscores.</p></li><li><p>Must begin with a letter or an underscore. Subsequent characters can be letters, underscores, or digits (0-9).</p></li><li><p>Can't be a word reserved by the specified database engine</p></li></ul><p><b>Oracle</b></p><p>The Oracle System ID (SID) of the created DB instance. If you specify <code>null</code>, the default value <code>ORCL</code> is used. You can't specify the string NULL, or any other reserved word, for <code>DBName</code>. </p><p>Default: <code>ORCL</code></p><p>Constraints:</p><ul><li><p>Can't be longer than 8 characters</p></li></ul><p><b>SQL Server</b></p><p>Not applicable. Must be null.</p><p><b>Amazon Aurora</b></p><p>The name of the database to create when the primary instance of the DB cluster is created. If this parameter isn't specified, no database is created in the DB instance.</p><p>Constraints:</p><ul><li><p>Must contain 1 to 64 letters or numbers.</p></li><li><p>Can't be a word reserved by the specified database engine</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBName;

/**
 <p>The name of the DB parameter group to associate with this DB instance. If you do not specify a value, then the default DB parameter group for the specified DB engine and version is used.</p><p>Constraints:</p><ul><li><p>Must be 1 to 255 letters, numbers, or hyphens.</p></li><li><p>First character must be a letter</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupName;

/**
 <p>A list of DB security groups to associate with this DB instance.</p><p>Default: The default DB security group for the database engine.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable DBSecurityGroups;

/**
 <p>A DB subnet group to associate with this DB instance.</p><p>If there is no DB subnet group, then it is a non-VPC DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroupName;

/**
 <p>A value that indicates whether the DB instance has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html"> Deleting a DB Instance</a>. </p><p><b>Amazon Aurora</b></p><p>Not applicable. You can enable or disable deletion protection for the DB cluster. For more information, see <code>CreateDBCluster</code>. DB instances in a DB cluster can be deleted even when deletion protection is enabled for the DB cluster. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p>The Active Directory directory ID to create the DB instance in. Currently, only Microsoft SQL Server and Oracle DB instances can be created in an Active Directory Domain.</p><p>For Microsoft SQL Server DB instances, Amazon RDS can use Windows Authentication to authenticate users that connect to the DB instance. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_SQLServerWinAuth.html"> Using Windows Authentication with an Amazon RDS DB Instance Running Microsoft SQL Server</a> in the <i>Amazon RDS User Guide</i>.</p><p>For Oracle DB instances, Amazon RDS can use Kerberos Authentication to authenticate users that connect to the DB instance. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/oracle-kerberos.html"> Using Kerberos Authentication with Amazon RDS for Oracle</a> in the <i>Amazon RDS User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

/**
 <p>Specify the name of the IAM role to be used when making API calls to the Directory Service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainIAMRoleName;

/**
 <p>The list of log types that need to be enabled for exporting to CloudWatch Logs. The values in the list depend on the DB engine being used. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing Database Logs to Amazon CloudWatch Logs </a> in the <i>Amazon Relational Database Service User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable enableCloudwatchLogsExports;

/**
 <p>A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled.</p><p>You can enable IAM database authentication for the following database engines:</p><p><b>Amazon Aurora</b></p><p>Not applicable. Mapping AWS IAM accounts to database accounts is managed by the DB cluster.</p><p><b>MySQL</b></p><ul><li><p>For MySQL 5.6, minor version 5.6.34 or higher</p></li><li><p>For MySQL 5.7, minor version 5.7.16 or higher</p></li><li><p>For MySQL 8.0, minor version 8.0.16 or higher</p></li></ul><p><b>PostgreSQL</b></p><ul><li><p>For PostgreSQL 9.5, minor version 9.5.15 or higher</p></li><li><p>For PostgreSQL 9.6, minor version 9.6.11 or higher</p></li><li><p>PostgreSQL 10.6, 10.7, and 10.9</p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html"> IAM Database Authentication for MySQL and PostgreSQL</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableIAMDatabaseAuthentication;

/**
 <p>A value that indicates whether to enable Performance Insights for the DB instance. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html">Using Amazon Performance Insights</a> in the <i>Amazon Relational Database Service User Guide</i>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enablePerformanceInsights;

/**
 <p>The name of the database engine to be used for this instance. </p><p>Not every database engine is available for every AWS Region. </p><p>Valid Values: </p><ul><li><p><code>aurora</code> (for MySQL 5.6-compatible Aurora)</p></li><li><p><code>aurora-mysql</code> (for MySQL 5.7-compatible Aurora)</p></li><li><p><code>aurora-postgresql</code></p></li><li><p><code>mariadb</code></p></li><li><p><code>mysql</code></p></li><li><p><code>oracle-ee</code></p></li><li><p><code>oracle-se2</code></p></li><li><p><code>oracle-se1</code></p></li><li><p><code>oracle-se</code></p></li><li><p><code>postgres</code></p></li><li><p><code>sqlserver-ee</code></p></li><li><p><code>sqlserver-se</code></p></li><li><p><code>sqlserver-ex</code></p></li><li><p><code>sqlserver-web</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The version number of the database engine to use.</p><p>For a list of valid engine versions, use the <code>DescribeDBEngineVersions</code> action.</p><p>The following are the database engines and links to information about the major and minor versions that are available with Amazon RDS. Not every database engine is available for every AWS Region.</p><p><b>Amazon Aurora</b></p><p>Not applicable. The version number of the database engine to be used by the DB instance is managed by the DB cluster.</p><p><b>MariaDB</b></p><p>See <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MariaDB.html#MariaDB.Concepts.VersionMgmt">MariaDB on Amazon RDS Versions</a> in the <i>Amazon RDS User Guide.</i></p><p><b>Microsoft SQL Server</b></p><p>See <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SQLServer.html#SQLServer.Concepts.General.FeatureSupport">Version and Feature Support on Amazon RDS</a> in the <i>Amazon RDS User Guide.</i></p><p><b>MySQL</b></p><p>See <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt">MySQL on Amazon RDS Versions</a> in the <i>Amazon RDS User Guide.</i></p><p><b>Oracle</b></p><p>See <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Appendix.Oracle.PatchComposition.html">Oracle Database Engine Release Notes</a> in the <i>Amazon RDS User Guide.</i></p><p><b>PostgreSQL</b></p><p>See <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts.General.DBVersions">Supported PostgreSQL Database Versions</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The amount of Provisioned IOPS (input/output operations per second) to be initially allocated for the DB instance. For information about valid Iops values, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Storage.html#USER_PIOPS">Amazon RDS Provisioned IOPS Storage to Improve Performance</a> in the <i>Amazon RDS User Guide</i>. </p><p>Constraints: For MariaDB, MySQL, Oracle, and PostgreSQL DB instances, must be a multiple between .5 and 50 of the storage amount for the DB instance. For SQL Server DB instances, must be a multiple between 1 and 50 of the storage amount for the DB instance. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iops;

/**
 <p>The AWS KMS key identifier for an encrypted DB instance.</p><p>The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If you are creating a DB instance with the same AWS account that owns the KMS encryption key used to encrypt the new DB instance, then you can use the KMS key alias instead of the ARN for the KM encryption key.</p><p><b>Amazon Aurora</b></p><p>Not applicable. The KMS key identifier is managed by the DB cluster. For more information, see <code>CreateDBCluster</code>.</p><p>If <code>StorageEncrypted</code> is enabled, and you do not specify a value for the <code>KmsKeyId</code> parameter, then Amazon RDS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>License model information for this DB instance.</p><p> Valid values: <code>license-included</code> | <code>bring-your-own-license</code> | <code>general-public-license</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable licenseModel;

/**
 <p>The password for the master user. The password can include any printable ASCII character except "/", """, or "@".</p><p><b>Amazon Aurora</b></p><p>Not applicable. The password for the master user is managed by the DB cluster.</p><p><b>MariaDB</b></p><p>Constraints: Must contain from 8 to 41 characters.</p><p><b>Microsoft SQL Server</b></p><p>Constraints: Must contain from 8 to 128 characters.</p><p><b>MySQL</b></p><p>Constraints: Must contain from 8 to 41 characters.</p><p><b>Oracle</b></p><p>Constraints: Must contain from 8 to 30 characters.</p><p><b>PostgreSQL</b></p><p>Constraints: Must contain from 8 to 128 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUserPassword;

/**
 <p>The name for the master user.</p><p><b>Amazon Aurora</b></p><p>Not applicable. The name for the master user is managed by the DB cluster. </p><p><b>MariaDB</b></p><p>Constraints:</p><ul><li><p>Required for MariaDB.</p></li><li><p>Must be 1 to 16 letters or numbers.</p></li><li><p>Can't be a reserved word for the chosen database engine.</p></li></ul><p><b>Microsoft SQL Server</b></p><p>Constraints:</p><ul><li><p>Required for SQL Server.</p></li><li><p>Must be 1 to 128 letters or numbers.</p></li><li><p>The first character must be a letter.</p></li><li><p>Can't be a reserved word for the chosen database engine.</p></li></ul><p><b>MySQL</b></p><p>Constraints:</p><ul><li><p>Required for MySQL.</p></li><li><p>Must be 1 to 16 letters or numbers.</p></li><li><p>First character must be a letter.</p></li><li><p>Can't be a reserved word for the chosen database engine.</p></li></ul><p><b>Oracle</b></p><p>Constraints:</p><ul><li><p>Required for Oracle.</p></li><li><p>Must be 1 to 30 letters or numbers.</p></li><li><p>First character must be a letter.</p></li><li><p>Can't be a reserved word for the chosen database engine.</p></li></ul><p><b>PostgreSQL</b></p><p>Constraints:</p><ul><li><p>Required for PostgreSQL.</p></li><li><p>Must be 1 to 63 letters or numbers.</p></li><li><p>First character must be a letter.</p></li><li><p>Can't be a reserved word for the chosen database engine.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable masterUsername;

/**
 <p>The upper limit to which Amazon RDS can automatically scale the storage of the DB instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxAllocatedStorage;

/**
 <p>The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0.</p><p>If <code>MonitoringRoleArn</code> is specified, then you must also set <code>MonitoringInterval</code> to a value other than 0.</p><p>Valid Values: <code>0, 1, 5, 10, 15, 30, 60</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable monitoringInterval;

/**
 <p>The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to Amazon CloudWatch Logs. For example, <code>arn:aws:iam:123456789012:role/emaccess</code>. For information on creating a monitoring role, go to <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html#USER_Monitoring.OS.Enabling">Setting Up and Enabling Enhanced Monitoring</a> in the <i>Amazon RDS User Guide</i>.</p><p>If <code>MonitoringInterval</code> is set to a value other than 0, then you must supply a <code>MonitoringRoleArn</code> value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringRoleArn;

/**
 <p>A value that indicates whether the DB instance is a Multi-AZ deployment. You can't set the <code>AvailabilityZone</code> parameter if the DB instance is a Multi-AZ deployment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiAZ;

/**
 <p>Indicates that the DB instance should be associated with the specified option group.</p><p>Permanent options, such as the TDE option for Oracle Advanced Security TDE, can't be removed from an option group. Also, that option group can't be removed from a DB instance once it is associated with a DB instance</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

/**
 <p>The AWS KMS key identifier for encryption of Performance Insights data. The KMS key ID is the Amazon Resource Name (ARN), KMS key identifier, or the KMS key alias for the KMS encryption key.</p><p>If you do not specify a value for <code>PerformanceInsightsKMSKeyId</code>, then Amazon RDS uses your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable performanceInsightsKMSKeyId;

/**
 <p>The amount of time, in days, to retain Performance Insights data. Valid values are 7 or 731 (2 years). </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable performanceInsightsRetentionPeriod;

/**
 <p>The port number on which the database accepts connections.</p><p><b>MySQL</b></p><p> Default: <code>3306</code></p><p> Valid values: <code>1150-65535</code></p><p>Type: Integer</p><p><b>MariaDB</b></p><p> Default: <code>3306</code></p><p> Valid values: <code>1150-65535</code></p><p>Type: Integer</p><p><b>PostgreSQL</b></p><p> Default: <code>5432</code></p><p> Valid values: <code>1150-65535</code></p><p>Type: Integer</p><p><b>Oracle</b></p><p> Default: <code>1521</code></p><p> Valid values: <code>1150-65535</code></p><p><b>SQL Server</b></p><p> Default: <code>1433</code></p><p> Valid values: <code>1150-65535</code> except <code>1234</code>, <code>1434</code>, <code>3260</code>, <code>3343</code>, <code>3389</code>, <code>47001</code>, and <code>49152-49156</code>.</p><p><b>Amazon Aurora</b></p><p> Default: <code>3306</code></p><p> Valid values: <code>1150-65535</code></p><p>Type: Integer</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p> The daily time range during which automated backups are created if automated backups are enabled, using the <code>BackupRetentionPeriod</code> parameter. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html#USER_WorkingWithAutomatedBackups.BackupWindow">The Backup Window</a> in the <i>Amazon RDS User Guide</i>. </p><p><b>Amazon Aurora</b></p><p>Not applicable. The daily time range for creating automated backups is managed by the DB cluster.</p><p> The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region. To see the time blocks available, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow"> Adjusting the Preferred DB Instance Maintenance Window</a> in the <i>Amazon RDS User Guide</i>. </p><p>Constraints:</p><ul><li><p>Must be in the format <code>hh24:mi-hh24:mi</code>.</p></li><li><p>Must be in Universal Coordinated Time (UTC).</p></li><li><p>Must not conflict with the preferred maintenance window.</p></li><li><p>Must be at least 30 minutes.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable preferredBackupWindow;

/**
 <p>The time range each week during which system maintenance can occur, in Universal Coordinated Time (UTC). For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Maintenance.html#Concepts.DBMaintenance">Amazon RDS Maintenance Window</a>. </p><p> Format: <code>ddd:hh24:mi-ddd:hh24:mi</code></p><p>The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region, occurring on a random day of the week. </p><p>Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.</p><p>Constraints: Minimum 30-minute window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>The number of CPU cores and the number of threads per core for the DB instance class of the DB instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsProcessorFeature *> * _Nullable processorFeatures;

/**
 <p>A value that specifies the order in which an Aurora Replica is promoted to the primary instance after a failure of the existing primary instance. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Managing.Backups.html#Aurora.Managing.FaultTolerance"> Fault Tolerance for an Aurora DB Cluster</a> in the <i>Amazon Aurora User Guide</i>. </p><p>Default: 1</p><p>Valid Values: 0 - 15</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable promotionTier;

/**
 <p>A value that indicates whether the DB instance is publicly accessible. When the DB instance is publicly accessible, it is an Internet-facing instance with a publicly resolvable DNS name, which resolves to a public IP address. When the DB instance isn't publicly accessible, it is an internal instance with a DNS name that resolves to a private IP address.</p><p>Default: The default behavior varies depending on whether <code>DBSubnetGroupName</code> is specified.</p><p>If <code>DBSubnetGroupName</code> isn't specified, and <code>PubliclyAccessible</code> isn't specified, the following applies:</p><ul><li><p>If the default VPC in the target region doesn’t have an Internet gateway attached to it, the DB instance is private.</p></li><li><p>If the default VPC in the target region has an Internet gateway attached to it, the DB instance is public.</p></li></ul><p>If <code>DBSubnetGroupName</code> is specified, and <code>PubliclyAccessible</code> isn't specified, the following applies:</p><ul><li><p>If the subnets are part of a VPC that doesn’t have an Internet gateway attached to it, the DB instance is private.</p></li><li><p>If the subnets are part of a VPC that has an Internet gateway attached to it, the DB instance is public.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable publiclyAccessible;

/**
 <p>A value that indicates whether the DB instance is encrypted. By default, it isn't encrypted.</p><p><b>Amazon Aurora</b></p><p>Not applicable. The encryption for DB instances is managed by the DB cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable storageEncrypted;

/**
 <p>Specifies the storage type to be associated with the DB instance.</p><p> Valid values: <code>standard | gp2 | io1</code></p><p> If you specify <code>io1</code>, you must also include a value for the <code>Iops</code> parameter. </p><p> Default: <code>io1</code> if the <code>Iops</code> parameter is specified, otherwise <code>gp2</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable storageType;

/**
 <p>Tags to assign to the DB instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

/**
 <p>The ARN from the key store with which to associate the instance for TDE encryption.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tdeCredentialArn;

/**
 <p>The password for the given ARN from the key store in order to access the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tdeCredentialPassword;

/**
 <p>The time zone of the DB instance. The time zone parameter is currently supported only by <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SQLServer.html#SQLServer.Concepts.General.TimeZone">Microsoft SQL Server</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable timezone;

/**
 <p>A list of Amazon EC2 VPC security groups to associate with this DB instance.</p><p><b>Amazon Aurora</b></p><p>Not applicable. The associated list of EC2 VPC security groups is managed by the DB cluster.</p><p>Default: The default EC2 VPC security group for the DB subnet group's VPC.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSecurityGroupIds;

@end

/**
 
 */
@interface AWSrdsCreateDBInstanceReadReplicaMessage : AWSRequest


/**
 <p>A value that indicates whether minor engine upgrades are applied automatically to the read replica during the maintenance window.</p><p>Default: Inherits from the source DB instance</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoMinorVersionUpgrade;

/**
 <p>The Availability Zone (AZ) where the read replica will be created.</p><p>Default: A random, system-chosen Availability Zone in the endpoint's AWS Region.</p><p> Example: <code>us-east-1d</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>A value that indicates whether to copy all tags from the read replica to snapshots of the read replica. By default, tags are not copied.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicateTagsToSnapshot;

/**
 <p>The compute and memory capacity of the read replica, for example, <code>db.m4.large</code>. Not all DB instance classes are available in all AWS Regions, or for all database engines. For the full list of DB instance classes, and availability for your engine, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html">DB Instance Class</a> in the <i>Amazon RDS User Guide.</i></p><p>Default: Inherits from the source DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceClass;

/**
 <p>The DB instance identifier of the read replica. This identifier is the unique key that identifies a DB instance. This parameter is stored as a lowercase string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p>The name of the DB parameter group to associate with this DB instance.</p><p>If you do not specify a value for <code>DBParameterGroupName</code>, then Amazon RDS uses the <code>DBParameterGroup</code> of source DB instance for a same region read replica, or the default <code>DBParameterGroup</code> for the specified DB engine for a cross region read replica.</p><note><p>Currently, specifying a parameter group for this operation is only supported for Oracle DB instances.</p></note><p>Constraints:</p><ul><li><p>Must be 1 to 255 letters, numbers, or hyphens.</p></li><li><p>First character must be a letter</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupName;

/**
 <p>Specifies a DB subnet group for the DB instance. The new DB instance is created in the VPC associated with the DB subnet group. If no DB subnet group is specified, then the new DB instance isn't created in a VPC.</p><p>Constraints:</p><ul><li><p>Can only be specified if the source DB instance identifier specifies a DB instance in another AWS Region.</p></li><li><p>If supplied, must match the name of an existing DBSubnetGroup.</p></li><li><p>The specified DB subnet group must be in the same AWS Region in which the operation is running.</p></li><li><p>All read replicas in one AWS Region that are created from the same source DB instance must either:&gt;</p><ul><li><p>Specify DB subnet groups from the same VPC. All these read replicas are created in the same VPC.</p></li><li><p>Not specify a DB subnet group. All these read replicas are created outside of any VPC.</p></li></ul></li></ul><p>Example: <code>mySubnetgroup</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroupName;

/**
 <p>A value that indicates whether the DB instance has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html"> Deleting a DB Instance</a>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p>The Active Directory directory ID to create the DB instance in.</p><p>For Oracle DB instances, Amazon RDS can use Kerberos Authentication to authenticate users that connect to the DB instance. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/oracle-kerberos.html"> Using Kerberos Authentication with Amazon RDS for Oracle</a> in the <i>Amazon RDS User Guide</i>.</p><p>For Microsoft SQL Server DB instances, Amazon RDS can use Windows Authentication to authenticate users that connect to the DB instance. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_SQLServerWinAuth.html"> Using Windows Authentication with an Amazon RDS DB Instance Running Microsoft SQL Server</a> in the <i>Amazon RDS User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

/**
 <p>Specify the name of the IAM role to be used when making API calls to the Directory Service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainIAMRoleName;

/**
 <p>The list of logs that the new DB instance is to export to CloudWatch Logs. The values in the list depend on the DB engine being used. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing Database Logs to Amazon CloudWatch Logs </a> in the <i>Amazon RDS User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable enableCloudwatchLogsExports;

/**
 <p>A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled. For information about the supported DB engines, see <a>CreateDBInstance</a>.</p><p>For more information about IAM database authentication, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html"> IAM Database Authentication for MySQL and PostgreSQL</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableIAMDatabaseAuthentication;

/**
 <p>A value that indicates whether to enable Performance Insights for the read replica. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html">Using Amazon Performance Insights</a> in the <i>Amazon RDS User Guide</i>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enablePerformanceInsights;

/**
 <p>The amount of Provisioned IOPS (input/output operations per second) to be initially allocated for the DB instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iops;

/**
 <p>The AWS KMS key ID for an encrypted read replica. The KMS key ID is the Amazon Resource Name (ARN), KMS key identifier, or the KMS key alias for the KMS encryption key.</p><p>If you create an encrypted read replica in the same AWS Region as the source DB instance, then you do not have to specify a value for this parameter. The read replica is encrypted with the same KMS key as the source DB instance.</p><p>If you create an encrypted read replica in a different AWS Region, then you must specify a KMS key for the destination AWS Region. KMS encryption keys are specific to the AWS Region that they are created in, and you can't use encryption keys from one AWS Region in another AWS Region.</p><p>You can't create an encrypted read replica from an unencrypted DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the read replica. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0.</p><p>If <code>MonitoringRoleArn</code> is specified, then you must also set <code>MonitoringInterval</code> to a value other than 0.</p><p>Valid Values: <code>0, 1, 5, 10, 15, 30, 60</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable monitoringInterval;

/**
 <p>The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to Amazon CloudWatch Logs. For example, <code>arn:aws:iam:123456789012:role/emaccess</code>. For information on creating a monitoring role, go to <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.html#USER_Monitoring.OS.IAMRole">To create an IAM role for Amazon RDS Enhanced Monitoring</a> in the <i>Amazon RDS User Guide</i>.</p><p>If <code>MonitoringInterval</code> is set to a value other than 0, then you must supply a <code>MonitoringRoleArn</code> value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringRoleArn;

/**
 <p>A value that indicates whether the read replica is in a Multi-AZ deployment. </p><p>You can create a read replica as a Multi-AZ DB instance. RDS creates a standby of your replica in another Availability Zone for failover support for the replica. Creating your read replica as a Multi-AZ DB instance is independent of whether the source database is a Multi-AZ DB instance. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiAZ;

/**
 <p>The option group the DB instance is associated with. If omitted, the option group associated with the source instance is used.</p><note><p>For SQL Server, you must use the option group associated with the source instance.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

/**
 <p>The AWS KMS key identifier for encryption of Performance Insights data. The KMS key ID is the Amazon Resource Name (ARN), KMS key identifier, or the KMS key alias for the KMS encryption key.</p><p>If you do not specify a value for <code>PerformanceInsightsKMSKeyId</code>, then Amazon RDS uses your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable performanceInsightsKMSKeyId;

/**
 <p>The amount of time, in days, to retain Performance Insights data. Valid values are 7 or 731 (2 years). </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable performanceInsightsRetentionPeriod;

/**
 <p>The port number that the DB instance uses for connections.</p><p>Default: Inherits from the source DB instance</p><p>Valid Values: <code>1150-65535</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The URL that contains a Signature Version 4 signed request for the <code>CreateDBInstanceReadReplica</code> API action in the source AWS Region that contains the source DB instance. </p><p>You must specify this parameter when you create an encrypted read replica from another AWS Region by using the Amazon RDS API. Don't specify <code>PreSignedUrl</code> when you are creating an encrypted read replica in the same AWS Region.</p><p>The presigned URL must be a valid request for the <code>CreateDBInstanceReadReplica</code> API action that can be executed in the source AWS Region that contains the encrypted source DB instance. The presigned URL request must contain the following parameter values: </p><ul><li><p><code>DestinationRegion</code> - The AWS Region that the encrypted read replica is created in. This AWS Region is the same one where the <code>CreateDBInstanceReadReplica</code> action is called that contains this presigned URL.</p><p>For example, if you create an encrypted DB instance in the us-west-1 AWS Region, from a source DB instance in the us-east-2 AWS Region, then you call the <code>CreateDBInstanceReadReplica</code> action in the us-east-1 AWS Region and provide a presigned URL that contains a call to the <code>CreateDBInstanceReadReplica</code> action in the us-west-2 AWS Region. For this example, the <code>DestinationRegion</code> in the presigned URL must be set to the us-east-1 AWS Region. </p></li><li><p><code>KmsKeyId</code> - The AWS KMS key identifier for the key to use to encrypt the read replica in the destination AWS Region. This is the same identifier for both the <code>CreateDBInstanceReadReplica</code> action that is called in the destination AWS Region, and the action contained in the presigned URL. </p></li><li><p><code>SourceDBInstanceIdentifier</code> - The DB instance identifier for the encrypted DB instance to be replicated. This identifier must be in the Amazon Resource Name (ARN) format for the source AWS Region. For example, if you are creating an encrypted read replica from a DB instance in the us-west-2 AWS Region, then your <code>SourceDBInstanceIdentifier</code> looks like the following example: <code>arn:aws:rds:us-west-2:123456789012:instance:mysql-instance1-20161115</code>. </p></li></ul><p>To learn how to generate a Signature Version 4 signed request, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html">Authenticating Requests: Using Query Parameters (AWS Signature Version 4)</a> and <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 Signing Process</a>. </p><note><p>If you are using an AWS SDK tool or the AWS CLI, you can specify <code>SourceRegion</code> (or <code>--source-region</code> for the AWS CLI) instead of specifying <code>PreSignedUrl</code> manually. Specifying <code>SourceRegion</code> autogenerates a presigned URL that is a valid request for the operation that can be executed in the source AWS Region.</p><p><code>SourceRegion</code> isn't supported for SQL Server, because SQL Server on Amazon RDS doesn't support cross-region read replicas.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable preSignedUrl;

/**
 <p>The number of CPU cores and the number of threads per core for the DB instance class of the DB instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsProcessorFeature *> * _Nullable processorFeatures;

/**
 <p>A value that indicates whether the DB instance is publicly accessible. When the DB instance is publicly accessible, it is an Internet-facing instance with a publicly resolvable DNS name, which resolves to a public IP address. When the DB instance isn't publicly accessible, it is an internal instance with a DNS name that resolves to a private IP address. For more information, see <a>CreateDBInstance</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publiclyAccessible;

/**
 <p>The identifier of the DB instance that will act as the source for the read replica. Each DB instance can have up to five read replicas.</p><p>Constraints:</p><ul><li><p>Must be the identifier of an existing MySQL, MariaDB, Oracle, PostgreSQL, or SQL Server DB instance.</p></li><li><p>Can specify a DB instance that is a MySQL read replica only if the source is running MySQL 5.6 or later.</p></li><li><p>For the limitations of Oracle read replicas, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/oracle-read-replicas.html">Read Replica Limitations with Oracle</a> in the <i>Amazon RDS User Guide</i>.</p></li><li><p>For the limitations of SQL Server read replicas, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/SQLServer.ReadReplicas.Limitations.html">Read Replica Limitations with Microsoft SQL Server</a> in the <i>Amazon RDS User Guide</i>.</p></li><li><p>Can specify a PostgreSQL DB instance only if the source is running PostgreSQL 9.3.5 or later (9.4.7 and higher for cross-region replication).</p></li><li><p>The specified DB instance must have automatic backups enabled, that is, its backup retention period must be greater than 0.</p></li><li><p>If the source DB instance is in the same AWS Region as the read replica, specify a valid DB instance identifier.</p></li><li><p>If the source DB instance is in a different AWS Region from the read replica, specify a valid DB instance ARN. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing">Constructing an ARN for Amazon RDS</a> in the <i>Amazon RDS User Guide</i>. This doesn't apply to SQL Server, which doesn't support cross-region replicas.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable sourceDBInstanceIdentifier;

/**
 <p>Specifies the storage type to be associated with the read replica.</p><p> Valid values: <code>standard | gp2 | io1</code></p><p> If you specify <code>io1</code>, you must also include a value for the <code>Iops</code> parameter. </p><p> Default: <code>io1</code> if the <code>Iops</code> parameter is specified, otherwise <code>gp2</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable storageType;

/**
 <p>A list of tags. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

/**
 <p>A value that indicates whether the DB instance class of the DB instance uses its default processor features.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable useDefaultProcessorFeatures;

/**
 <p> A list of EC2 VPC security groups to associate with the read replica. </p><p> Default: The default EC2 VPC security group for the DB subnet group's VPC. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSecurityGroupIds;

@end

/**
 
 */
@interface AWSrdsCreateDBInstanceReadReplicaResult : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB instance. </p><p>This data type is used as a response element in the <code>DescribeDBInstances</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBInstance * _Nullable DBInstance;

@end

/**
 
 */
@interface AWSrdsCreateDBInstanceResult : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB instance. </p><p>This data type is used as a response element in the <code>DescribeDBInstances</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBInstance * _Nullable DBInstance;

@end

/**
 <p/>
 Required parameters: [DBParameterGroupName, DBParameterGroupFamily, Description]
 */
@interface AWSrdsCreateDBParameterGroupMessage : AWSRequest


/**
 <p>The DB parameter group family name. A DB parameter group can be associated with one and only one DB parameter group family, and can be applied only to a DB instance running a database engine and engine version compatible with that DB parameter group family.</p><p>To list all of the available parameter group families, use the following command:</p><p><code>aws rds describe-db-engine-versions --query "DBEngineVersions[].DBParameterGroupFamily"</code></p><note><p>The output contains duplicates.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupFamily;

/**
 <p>The name of the DB parameter group.</p><p>Constraints:</p><ul><li><p>Must be 1 to 255 letters, numbers, or hyphens.</p></li><li><p>First character must be a letter</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens</p></li></ul><note><p>This value is stored as a lowercase string.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupName;

/**
 <p>The description for the DB parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Tags to assign to the DB parameter group.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSrdsCreateDBParameterGroupResult : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB parameter group. </p><p>This data type is used as a response element in the <code>DescribeDBParameterGroups</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBParameterGroup * _Nullable DBParameterGroup;

@end

/**
 
 */
@interface AWSrdsCreateDBProxyRequest : AWSRequest


/**
 <p>The authorization mechanism that the proxy uses.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsUserAuthConfig *> * _Nullable auth;

/**
 <p>The identifier for the proxy. This name must be unique for all proxies owned by your AWS account in the specified AWS Region. An identifier must begin with a letter and must contain only ASCII letters, digits, and hyphens; it can't end with a hyphen or contain two consecutive hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBProxyName;

/**
 <p>Whether the proxy includes detailed information about SQL statements in its logs. This information helps you to debug issues involving SQL behavior or the performance and scalability of the proxy connections. The debug information includes the text of SQL statements that you submit through the proxy. Thus, only enable this setting when needed for debugging, and only when you have security measures in place to safeguard any sensitive information that appears in the logs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable debugLogging;

/**
 <p>The kinds of databases that the proxy can connect to. This value determines which database network protocol the proxy recognizes when it interprets network traffic to and from the database. The engine family applies to MySQL and PostgreSQL for both RDS and Aurora.</p>
 */
@property (nonatomic, assign) AWSrdsEngineFamily engineFamily;

/**
 <p>The number of seconds that a connection to the proxy can be inactive before the proxy disconnects it. You can set this value higher or lower than the connection timeout limit for the associated database.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable idleClientTimeout;

/**
 <p>A Boolean parameter that specifies whether Transport Layer Security (TLS) encryption is required for connections to the proxy. By enabling this setting, you can enforce encrypted TLS connections to the proxy.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requireTLS;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role that the proxy uses to access secrets in AWS Secrets Manager.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>An optional set of key-value pairs to associate arbitrary data of your choosing with the proxy.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

/**
 <p>One or more VPC security group IDs to associate with the new proxy.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSecurityGroupIds;

/**
 <p>One or more VPC subnet IDs to associate with the new proxy.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSubnetIds;

@end

/**
 
 */
@interface AWSrdsCreateDBProxyResponse : AWSModel


/**
 <p>The <code>DBProxy</code> structure corresponding to the new proxy.</p>
 */
@property (nonatomic, strong) AWSrdsDBProxy * _Nullable DBProxy;

@end

/**
 <p/>
 Required parameters: [DBSecurityGroupName, DBSecurityGroupDescription]
 */
@interface AWSrdsCreateDBSecurityGroupMessage : AWSRequest


/**
 <p>The description for the DB security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSecurityGroupDescription;

/**
 <p>The name for the DB security group. This value is stored as a lowercase string.</p><p>Constraints:</p><ul><li><p>Must be 1 to 255 letters, numbers, or hyphens.</p></li><li><p>First character must be a letter</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens</p></li><li><p>Must not be "Default"</p></li></ul><p>Example: <code>mysecuritygroup</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSecurityGroupName;

/**
 <p>Tags to assign to the DB security group.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSrdsCreateDBSecurityGroupResult : AWSModel


/**
 <p>Contains the details for an Amazon RDS DB security group. </p><p>This data type is used as a response element in the <code>DescribeDBSecurityGroups</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBSecurityGroup * _Nullable DBSecurityGroup;

@end

/**
 <p/>
 Required parameters: [DBSnapshotIdentifier, DBInstanceIdentifier]
 */
@interface AWSrdsCreateDBSnapshotMessage : AWSRequest


/**
 <p>The identifier of the DB instance that you want to create the snapshot of.</p><p>Constraints:</p><ul><li><p>Must match the identifier of an existing DBInstance.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p>The identifier for the DB snapshot.</p><p>Constraints:</p><ul><li><p>Can't be null, empty, or blank</p></li><li><p>Must contain from 1 to 255 letters, numbers, or hyphens</p></li><li><p>First character must be a letter</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens</p></li></ul><p>Example: <code>my-snapshot-id</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSnapshotIdentifier;

/**
 <p>A list of tags. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSrdsCreateDBSnapshotResult : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB snapshot. </p><p>This data type is used as a response element in the <code>DescribeDBSnapshots</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBSnapshot * _Nullable DBSnapshot;

@end

/**
 <p/>
 Required parameters: [DBSubnetGroupName, DBSubnetGroupDescription, SubnetIds]
 */
@interface AWSrdsCreateDBSubnetGroupMessage : AWSRequest


/**
 <p>The description for the DB subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroupDescription;

/**
 <p>The name for the DB subnet group. This value is stored as a lowercase string.</p><p>Constraints: Must contain no more than 255 letters, numbers, periods, underscores, spaces, or hyphens. Must not be default.</p><p>Example: <code>mySubnetgroup</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroupName;

/**
 <p>The EC2 Subnet IDs for the DB subnet group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>Tags to assign to the DB subnet group.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSrdsCreateDBSubnetGroupResult : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB subnet group. </p><p>This data type is used as a response element in the <code>DescribeDBSubnetGroups</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBSubnetGroup * _Nullable DBSubnetGroup;

@end

/**
 <p/>
 Required parameters: [SubscriptionName, SnsTopicArn]
 */
@interface AWSrdsCreateEventSubscriptionMessage : AWSRequest


/**
 <p> A value that indicates whether to activate the subscription. If the event notification subscription isn't activated, the subscription is created but not active. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p> A list of event categories for a SourceType that you want to subscribe to. You can see a list of the categories for a given SourceType in the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html">Events</a> topic in the <i>Amazon RDS User Guide</i> or by using the <b>DescribeEventCategories</b> action. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventCategories;

/**
 <p>The Amazon Resource Name (ARN) of the SNS topic created for event notification. The ARN is created by Amazon SNS when you create a topic and subscribe to it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snsTopicArn;

/**
 <p>The list of identifiers of the event sources for which events are returned. If not specified, then all sources are included in the response. An identifier must begin with a letter and must contain only ASCII letters, digits, and hyphens. It can't end with a hyphen or contain two consecutive hyphens.</p><p>Constraints:</p><ul><li><p>If SourceIds are supplied, SourceType must also be provided.</p></li><li><p>If the source type is a DB instance, then a <code>DBInstanceIdentifier</code> must be supplied.</p></li><li><p>If the source type is a DB security group, a <code>DBSecurityGroupName</code> must be supplied.</p></li><li><p>If the source type is a DB parameter group, a <code>DBParameterGroupName</code> must be supplied.</p></li><li><p>If the source type is a DB snapshot, a <code>DBSnapshotIdentifier</code> must be supplied.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sourceIds;

/**
 <p>The type of source that is generating the events. For example, if you want to be notified of events generated by a DB instance, you would set this parameter to db-instance. if this value isn't specified, all events are returned.</p><p>Valid values: <code>db-instance</code> | <code>db-cluster</code> | <code>db-parameter-group</code> | <code>db-security-group</code> | <code>db-snapshot</code> | <code>db-cluster-snapshot</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

/**
 <p>The name of the subscription.</p><p>Constraints: The name must be less than 255 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionName;

/**
 <p>A list of tags. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSrdsCreateEventSubscriptionResult : AWSModel


/**
 <p>Contains the results of a successful invocation of the <code>DescribeEventSubscriptions</code> action.</p>
 */
@property (nonatomic, strong) AWSrdsEventSubscription * _Nullable eventSubscription;

@end

/**
 
 */
@interface AWSrdsCreateGlobalClusterMessage : AWSRequest


/**
 <p> The name for your database of up to 64 alpha-numeric characters. If you do not provide a name, Amazon Aurora will not create a database in the global database cluster you are creating. </p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p> The deletion protection setting for the new global database. The global database can't be deleted when deletion protection is enabled. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p>Provides the name of the database engine to be used for this DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The engine version of the Aurora global database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The cluster identifier of the new global database cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalClusterIdentifier;

/**
 <p> The Amazon Resource Name (ARN) to use as the primary cluster of the global database. This parameter is optional. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceDBClusterIdentifier;

/**
 <p> The storage encryption setting for the new global database cluster. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable storageEncrypted;

@end

/**
 
 */
@interface AWSrdsCreateGlobalClusterResult : AWSModel


/**
 <p>A data type representing an Aurora global database.</p>
 */
@property (nonatomic, strong) AWSrdsGlobalCluster * _Nullable globalCluster;

@end

/**
 <p/>
 Required parameters: [OptionGroupName, EngineName, MajorEngineVersion, OptionGroupDescription]
 */
@interface AWSrdsCreateOptionGroupMessage : AWSRequest


/**
 <p>Specifies the name of the engine that this option group should be associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineName;

/**
 <p>Specifies the major version of the engine that this option group should be associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable majorEngineVersion;

/**
 <p>The description of the option group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupDescription;

/**
 <p>Specifies the name of the option group to be created.</p><p>Constraints:</p><ul><li><p>Must be 1 to 255 letters, numbers, or hyphens</p></li><li><p>First character must be a letter</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens</p></li></ul><p>Example: <code>myoptiongroup</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

/**
 <p>Tags to assign to the option group.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSrdsCreateOptionGroupResult : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) AWSrdsOptionGroup * _Nullable optionGroup;

@end

/**
 <p>A custom Availability Zone (AZ) is an on-premises AZ that is integrated with a VMware vSphere cluster.</p><p>For more information about RDS on VMware, see the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html"><i>RDS on VMware User Guide.</i></a></p>
 */
@interface AWSrdsCustomAvailabilityZone : AWSModel


/**
 <p>The identifier of the custom AZ.</p><p>Amazon RDS generates a unique identifier when a custom AZ is created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customAvailabilityZoneId;

/**
 <p>The name of the custom AZ.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customAvailabilityZoneName;

/**
 <p>The status of the custom AZ.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customAvailabilityZoneStatus;

/**
 <p>Information about the virtual private network (VPN) between the VMware vSphere cluster and the AWS website.</p>
 */
@property (nonatomic, strong) AWSrdsVpnDetails * _Nullable vpnDetails;

@end

/**
 
 */
@interface AWSrdsCustomAvailabilityZoneMessage : AWSModel


/**
 <p>The list of <a>CustomAvailabilityZone</a> objects for the AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsCustomAvailabilityZone *> * _Nullable customAvailabilityZones;

/**
 <p>An optional pagination token provided by a previous <code>DescribeCustomAvailabilityZones</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>Contains the details of an Amazon Aurora DB cluster. </p><p>This data type is used as a response element in the <code>DescribeDBClusters</code>, <code>StopDBCluster</code>, and <code>StartDBCluster</code> actions. </p>
 */
@interface AWSrdsDBCluster : AWSModel


/**
 <p>The name of the Amazon Kinesis data stream used for the database activity stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable activityStreamKinesisStreamName;

/**
 <p>The AWS KMS key identifier used for encrypting messages in the database activity stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable activityStreamKmsKeyId;

/**
 <p>The mode of the database activity stream. Database events such as a change or access generate an activity stream event. The database session can handle these events either synchronously or asynchronously. </p>
 */
@property (nonatomic, assign) AWSrdsActivityStreamMode activityStreamMode;

/**
 <p>The status of the database activity stream.</p>
 */
@property (nonatomic, assign) AWSrdsActivityStreamStatus activityStreamStatus;

/**
 <p>For all database engines except Amazon Aurora, <code>AllocatedStorage</code> specifies the allocated storage size in gibibytes (GiB). For Aurora, <code>AllocatedStorage</code> always returns 1, because Aurora DB cluster storage size isn't fixed, but instead automatically adjusts as needed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedStorage;

/**
 <p>Provides a list of the AWS Identity and Access Management (IAM) roles that are associated with the DB cluster. IAM roles that are associated with a DB cluster grant permission for the DB cluster to access other AWS services on your behalf.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBClusterRole *> * _Nullable associatedRoles;

/**
 <p>Provides the list of Availability Zones (AZs) where instances in the DB cluster can be created.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 <p>The number of change records stored for Backtrack.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backtrackConsumedChangeRecords;

/**
 <p>The target backtrack window, in seconds. If this value is set to 0, backtracking is disabled for the DB cluster. Otherwise, backtracking is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backtrackWindow;

/**
 <p>Specifies the number of days for which automatic DB snapshots are retained.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupRetentionPeriod;

/**
 <p>The current capacity of an Aurora Serverless DB cluster. The capacity is 0 (zero) when the cluster is paused.</p><p>For more information about Aurora Serverless, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html">Using Amazon Aurora Serverless</a> in the <i>Amazon Aurora User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable capacity;

/**
 <p>If present, specifies the name of the character set that this cluster is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable characterSetName;

/**
 <p>Identifies the clone group to which the DB cluster is associated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloneGroupId;

/**
 <p>Specifies the time when the DB cluster was created, in Universal Coordinated Time (UTC).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable clusterCreateTime;

/**
 <p>Specifies whether tags are copied from the DB cluster to snapshots of the DB cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicateTagsToSnapshot;

/**
 <p>Specifies whether the DB cluster is a clone of a DB cluster owned by a different AWS account.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable crossAccountClone;

/**
 <p>Identifies all custom endpoints associated with the cluster.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable customEndpoints;

/**
 <p>The Amazon Resource Name (ARN) for the DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterArn;

/**
 <p>Contains a user-supplied DB cluster identifier. This identifier is the unique key that identifies a DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>Provides the list of instances that make up the DB cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBClusterMember *> * _Nullable DBClusterMembers;

/**
 <p>Provides the list of option group memberships for this DB cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBClusterOptionGroupStatus *> * _Nullable DBClusterOptionGroupMemberships;

/**
 <p>Specifies the name of the DB cluster parameter group for the DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterParameterGroup;

/**
 <p>Specifies information on the subnet group associated with the DB cluster, including the name, description, and subnets in the subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroup;

/**
 <p>Contains the name of the initial database of this DB cluster that was provided at create time, if one was specified when the DB cluster was created. This same name is returned for the life of the DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The AWS Region-unique, immutable identifier for the DB cluster. This identifier is found in AWS CloudTrail log entries whenever the AWS KMS key for the DB cluster is accessed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dbClusterResourceId;

/**
 <p>Indicates if the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p>The Active Directory Domain membership records associated with the DB cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDomainMembership *> * _Nullable domainMemberships;

/**
 <p>The earliest time to which a DB cluster can be backtracked.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable earliestBacktrackTime;

/**
 <p>The earliest time to which a database can be restored with point-in-time restore.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable earliestRestorableTime;

/**
 <p>A list of log types that this DB cluster is configured to export to CloudWatch Logs.</p><p>Log types vary by DB engine. For information about the log types for each DB engine, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_LogAccess.html">Amazon RDS Database Log Files</a> in the <i>Amazon Aurora User Guide.</i></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable enabledCloudwatchLogsExports;

/**
 <p>Specifies the connection endpoint for the primary instance of the DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpoint;

/**
 <p>Provides the name of the database engine to be used for this DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The DB engine mode of the DB cluster, either <code>provisioned</code>, <code>serverless</code>, <code>parallelquery</code>, <code>global</code>, or <code>multimaster</code>.</p><note><p><code>global</code> engine mode only applies for global database clusters created with Aurora MySQL version 5.6.10a. For higher Aurora MySQL versions, the clusters in a global database use <code>provisioned</code> engine mode. To check if a DB cluster is part of a global database, use <code>DescribeGlobalClusters</code> instead of checking the <code>EngineMode</code> return value from <code>DescribeDBClusters</code>. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable engineMode;

/**
 <p>Indicates the database engine version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>Specifies the ID that Amazon Route 53 assigns when you create a hosted zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostedZoneId;

/**
 <p>A value that indicates whether the HTTP endpoint for an Aurora Serverless DB cluster is enabled.</p><p>When enabled, the HTTP endpoint provides a connectionless web service API for running SQL queries on the Aurora Serverless DB cluster. You can also query your database from inside the RDS console with the query editor.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/data-api.html">Using the Data API for Aurora Serverless</a> in the <i>Amazon Aurora User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable httpEndpointEnabled;

/**
 <p>A value that indicates whether the mapping of AWS Identity and Access Management (IAM) accounts to database accounts is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable IAMDatabaseAuthenticationEnabled;

/**
 <p>If <code>StorageEncrypted</code> is enabled, the AWS KMS key identifier for the encrypted DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>Specifies the latest time to which a database can be restored with point-in-time restore.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable latestRestorableTime;

/**
 <p>Contains the master username for the DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUsername;

/**
 <p>Specifies whether the DB cluster has instances in multiple Availability Zones.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiAZ;

/**
 <p>Specifies the progress of the operation as a percentage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable percentProgress;

/**
 <p>Specifies the port that the database engine is listening on.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>Specifies the daily time range during which automated backups are created if automated backups are enabled, as determined by the <code>BackupRetentionPeriod</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredBackupWindow;

/**
 <p>Specifies the weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC).</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>Contains one or more identifiers of the read replicas associated with this DB cluster.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable readReplicaIdentifiers;

/**
 <p>The reader endpoint for the DB cluster. The reader endpoint for a DB cluster load-balances connections across the Aurora Replicas that are available in a DB cluster. As clients request new connections to the reader endpoint, Aurora distributes the connection requests among the Aurora Replicas in the DB cluster. This functionality can help balance your read workload across multiple Aurora Replicas in your DB cluster. </p><p>If a failover occurs, and the Aurora Replica that you are connected to is promoted to be the primary instance, your connection is dropped. To continue sending your read workload to other Aurora Replicas in the cluster, you can then reconnect to the reader endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable readerEndpoint;

/**
 <p>Contains the identifier of the source DB cluster if this DB cluster is a read replica.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationSourceIdentifier;

/**
 <p>Shows the scaling configuration for an Aurora DB cluster in <code>serverless</code> DB engine mode.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html">Using Amazon Aurora Serverless</a> in the <i>Amazon Aurora User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSrdsScalingConfigurationInfo * _Nullable scalingConfigurationInfo;

/**
 <p>Specifies the current state of this DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>Specifies whether the DB cluster is encrypted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable storageEncrypted;

/**
 <p>Provides a list of VPC security groups that the DB cluster belongs to.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsVpcSecurityGroupMembership *> * _Nullable vpcSecurityGroups;

@end

/**
 <p>This data type is used as a response element in the <code>DescribeDBClusterBacktracks</code> action.</p>
 */
@interface AWSrdsDBClusterBacktrack : AWSModel


/**
 <p>Contains the backtrack identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backtrackIdentifier;

/**
 <p>The timestamp of the time at which the backtrack was requested.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable backtrackRequestCreationTime;

/**
 <p>The timestamp of the time to which the DB cluster was backtracked.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable backtrackTo;

/**
 <p>The timestamp of the time from which the DB cluster was backtracked.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable backtrackedFrom;

/**
 <p>Contains a user-supplied DB cluster identifier. This identifier is the unique key that identifies a DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>The status of the backtrack. This property returns one of the following values:</p><ul><li><p><code>applying</code> - The backtrack is currently being applied to or rolled back from the DB cluster.</p></li><li><p><code>completed</code> - The backtrack has successfully been applied to or rolled back from the DB cluster.</p></li><li><p><code>failed</code> - An error occurred while the backtrack was applied to or rolled back from the DB cluster.</p></li><li><p><code>pending</code> - The backtrack is currently pending application to or rollback from the DB cluster.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Contains the result of a successful invocation of the <code>DescribeDBClusterBacktracks</code> action.</p>
 */
@interface AWSrdsDBClusterBacktrackMessage : AWSModel


/**
 <p>Contains a list of backtracks for the user.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBClusterBacktrack *> * _Nullable DBClusterBacktracks;

/**
 <p>A pagination token that can be used in a later <code>DescribeDBClusterBacktracks</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSrdsDBClusterCapacityInfo : AWSModel


/**
 <p>The current capacity of the DB cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable currentCapacity;

/**
 <p>A user-supplied DB cluster identifier. This identifier is the unique key that identifies a DB cluster. </p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>A value that specifies the capacity that the DB cluster scales to next.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pendingCapacity;

/**
 <p>The number of seconds before a call to <code>ModifyCurrentDBClusterCapacity</code> times out.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable secondsBeforeTimeout;

/**
 <p>The timeout action of a call to <code>ModifyCurrentDBClusterCapacity</code>, either <code>ForceApplyCapacityChange</code> or <code>RollbackCapacityChange</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timeoutAction;

@end

/**
 <p>This data type represents the information you need to connect to an Amazon Aurora DB cluster. This data type is used as a response element in the following actions:</p><ul><li><p><code>CreateDBClusterEndpoint</code></p></li><li><p><code>DescribeDBClusterEndpoints</code></p></li><li><p><code>ModifyDBClusterEndpoint</code></p></li><li><p><code>DeleteDBClusterEndpoint</code></p></li></ul><p>For the data structure that represents Amazon RDS DB instance endpoints, see <code>Endpoint</code>.</p>
 */
@interface AWSrdsDBClusterEndpoint : AWSModel


/**
 <p>The type associated with a custom endpoint. One of: <code>READER</code>, <code>WRITER</code>, <code>ANY</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customEndpointType;

/**
 <p>The Amazon Resource Name (ARN) for the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterEndpointArn;

/**
 <p>The identifier associated with the endpoint. This parameter is stored as a lowercase string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterEndpointIdentifier;

/**
 <p>A unique system-generated identifier for an endpoint. It remains the same for the whole life of the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterEndpointResourceIdentifier;

/**
 <p>The DB cluster identifier of the DB cluster associated with the endpoint. This parameter is stored as a lowercase string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>The DNS address of the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpoint;

/**
 <p>The type of the endpoint. One of: <code>READER</code>, <code>WRITER</code>, <code>CUSTOM</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointType;

/**
 <p>List of DB instance identifiers that aren't part of the custom endpoint group. All other eligible instances are reachable through the custom endpoint. Only relevant if the list of static members is empty.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable excludedMembers;

/**
 <p>List of DB instance identifiers that are part of the custom endpoint group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable staticMembers;

/**
 <p>The current status of the endpoint. One of: <code>creating</code>, <code>available</code>, <code>deleting</code>, <code>modifying</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 
 */
@interface AWSrdsDBClusterEndpointMessage : AWSModel


/**
 <p>Contains the details of the endpoints associated with the cluster and matching any filter conditions.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBClusterEndpoint *> * _Nullable DBClusterEndpoints;

/**
 <p> An optional pagination token provided by a previous <code>DescribeDBClusterEndpoints</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>Contains information about an instance that is part of a DB cluster.</p>
 */
@interface AWSrdsDBClusterMember : AWSModel


/**
 <p>Specifies the status of the DB cluster parameter group for this member of the DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterParameterGroupStatus;

/**
 <p>Specifies the instance identifier for this member of the DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p>Value that is <code>true</code> if the cluster member is the primary instance for the DB cluster and <code>false</code> otherwise.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isClusterWriter;

/**
 <p>A value that specifies the order in which an Aurora Replica is promoted to the primary instance after a failure of the existing primary instance. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Managing.Backups.html#Aurora.Managing.FaultTolerance"> Fault Tolerance for an Aurora DB Cluster</a> in the <i>Amazon Aurora User Guide</i>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable promotionTier;

@end

/**
 <p>Contains the result of a successful invocation of the <code>DescribeDBClusters</code> action.</p>
 */
@interface AWSrdsDBClusterMessage : AWSModel


/**
 <p>Contains a list of DB clusters for the user.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBCluster *> * _Nullable DBClusters;

/**
 <p>A pagination token that can be used in a later DescribeDBClusters request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>Contains status information for a DB cluster option group.</p>
 */
@interface AWSrdsDBClusterOptionGroupStatus : AWSModel


/**
 <p>Specifies the name of the DB cluster option group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterOptionGroupName;

/**
 <p>Specifies the status of the DB cluster option group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Contains the details of an Amazon RDS DB cluster parameter group. </p><p>This data type is used as a response element in the <code>DescribeDBClusterParameterGroups</code> action. </p>
 */
@interface AWSrdsDBClusterParameterGroup : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the DB cluster parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterParameterGroupArn;

/**
 <p>Provides the name of the DB cluster parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterParameterGroupName;

/**
 <p>Provides the name of the DB parameter group family that this DB cluster parameter group is compatible with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupFamily;

/**
 <p>Provides the customer-specified description for this DB cluster parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 <p>Provides details about a DB cluster parameter group including the parameters in the DB cluster parameter group.</p>
 */
@interface AWSrdsDBClusterParameterGroupDetails : AWSModel


/**
 <p> An optional pagination token provided by a previous DescribeDBClusterParameters request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code> . </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Provides a list of parameters for the DB cluster parameter group.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsParameter *> * _Nullable parameters;

@end

/**
 <p/>
 */
@interface AWSrdsDBClusterParameterGroupNameMessage : AWSModel


/**
 <p>The name of the DB cluster parameter group.</p><p>Constraints:</p><ul><li><p>Must be 1 to 255 letters or numbers.</p></li><li><p>First character must be a letter</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens</p></li></ul><note><p>This value is stored as a lowercase string.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterParameterGroupName;

@end

/**
 <p/>
 */
@interface AWSrdsDBClusterParameterGroupsMessage : AWSModel


/**
 <p>A list of DB cluster parameter groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBClusterParameterGroup *> * _Nullable DBClusterParameterGroups;

/**
 <p> An optional pagination token provided by a previous <code>DescribeDBClusterParameterGroups</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>Describes an AWS Identity and Access Management (IAM) role that is associated with a DB cluster.</p>
 */
@interface AWSrdsDBClusterRole : AWSModel


/**
 <p>The name of the feature associated with the AWS Identity and Access Management (IAM) role. For the list of supported feature names, see <a>DBEngineVersion</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable featureName;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role that is associated with the DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Describes the state of association between the IAM role and the DB cluster. The Status property returns one of the following values:</p><ul><li><p><code>ACTIVE</code> - the IAM role ARN is associated with the DB cluster and can be used to access other AWS services on your behalf.</p></li><li><p><code>PENDING</code> - the IAM role ARN is being associated with the DB cluster.</p></li><li><p><code>INVALID</code> - the IAM role ARN is associated with the DB cluster, but the DB cluster is unable to assume the IAM role in order to access other AWS services on your behalf.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Contains the details for an Amazon RDS DB cluster snapshot </p><p>This data type is used as a response element in the <code>DescribeDBClusterSnapshots</code> action. </p>
 */
@interface AWSrdsDBClusterSnapshot : AWSModel


/**
 <p>Specifies the allocated storage size in gibibytes (GiB).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedStorage;

/**
 <p>Provides the list of Availability Zones (AZs) where instances in the DB cluster snapshot can be restored.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 <p>Specifies the time when the DB cluster was created, in Universal Coordinated Time (UTC).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable clusterCreateTime;

/**
 <p>Specifies the DB cluster identifier of the DB cluster that this DB cluster snapshot was created from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>The Amazon Resource Name (ARN) for the DB cluster snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterSnapshotArn;

/**
 <p>Specifies the identifier for the DB cluster snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterSnapshotIdentifier;

/**
 <p>Specifies the name of the database engine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>Provides the version of the database engine for this DB cluster snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>True if mapping of AWS Identity and Access Management (IAM) accounts to database accounts is enabled, and otherwise false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable IAMDatabaseAuthenticationEnabled;

/**
 <p>If <code>StorageEncrypted</code> is true, the AWS KMS key identifier for the encrypted DB cluster snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>Provides the license model information for this DB cluster snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable licenseModel;

/**
 <p>Provides the master username for the DB cluster snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUsername;

/**
 <p>Specifies the percentage of the estimated data that has been transferred.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable percentProgress;

/**
 <p>Specifies the port that the DB cluster was listening on at the time of the snapshot.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>Provides the time when the snapshot was taken, in Universal Coordinated Time (UTC).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable snapshotCreateTime;

/**
 <p>Provides the type of the DB cluster snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotType;

/**
 <p>If the DB cluster snapshot was copied from a source DB cluster snapshot, the Amazon Resource Name (ARN) for the source DB cluster snapshot, otherwise, a null value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceDBClusterSnapshotArn;

/**
 <p>Specifies the status of this DB cluster snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>Specifies whether the DB cluster snapshot is encrypted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable storageEncrypted;

/**
 <p>Provides the VPC ID associated with the DB cluster snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the name and values of a manual DB cluster snapshot attribute.</p><p>Manual DB cluster snapshot attributes are used to authorize other AWS accounts to restore a manual DB cluster snapshot. For more information, see the <code>ModifyDBClusterSnapshotAttribute</code> API action.</p>
 */
@interface AWSrdsDBClusterSnapshotAttribute : AWSModel


/**
 <p>The name of the manual DB cluster snapshot attribute.</p><p>The attribute named <code>restore</code> refers to the list of AWS accounts that have permission to copy or restore the manual DB cluster snapshot. For more information, see the <code>ModifyDBClusterSnapshotAttribute</code> API action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The value(s) for the manual DB cluster snapshot attribute.</p><p>If the <code>AttributeName</code> field is set to <code>restore</code>, then this element returns a list of IDs of the AWS accounts that are authorized to copy or restore the manual DB cluster snapshot. If a value of <code>all</code> is in the list, then the manual DB cluster snapshot is public and available for any AWS account to copy or restore.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributeValues;

@end

/**
 <p>Contains the results of a successful call to the <code>DescribeDBClusterSnapshotAttributes</code> API action.</p><p>Manual DB cluster snapshot attributes are used to authorize other AWS accounts to copy or restore a manual DB cluster snapshot. For more information, see the <code>ModifyDBClusterSnapshotAttribute</code> API action.</p>
 */
@interface AWSrdsDBClusterSnapshotAttributesResult : AWSModel


/**
 <p>The list of attributes and values for the manual DB cluster snapshot.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBClusterSnapshotAttribute *> * _Nullable DBClusterSnapshotAttributes;

/**
 <p>The identifier of the manual DB cluster snapshot that the attributes apply to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterSnapshotIdentifier;

@end

/**
 <p> Provides a list of DB cluster snapshots for the user as the result of a call to the <code>DescribeDBClusterSnapshots</code> action. </p>
 */
@interface AWSrdsDBClusterSnapshotMessage : AWSModel


/**
 <p>Provides a list of DB cluster snapshots for the user.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBClusterSnapshot *> * _Nullable DBClusterSnapshots;

/**
 <p> An optional pagination token provided by a previous <code>DescribeDBClusterSnapshots</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p> This data type is used as a response element in the action <code>DescribeDBEngineVersions</code>. </p>
 */
@interface AWSrdsDBEngineVersion : AWSModel


/**
 <p>The description of the database engine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBEngineDescription;

/**
 <p>The description of the database engine version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBEngineVersionDescription;

/**
 <p>The name of the DB parameter group family for the database engine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupFamily;

/**
 <p> The default character set for new instances of this engine version, if the <code>CharacterSetName</code> parameter of the CreateDBInstance API isn't specified. </p>
 */
@property (nonatomic, strong) AWSrdsCharacterSet * _Nullable defaultCharacterSet;

/**
 <p>The name of the database engine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The version number of the database engine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The types of logs that the database engine has available for export to CloudWatch Logs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable exportableLogTypes;

/**
 <p>The status of the DB engine version, either <code>available</code> or <code>deprecated</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p> A list of the character sets supported by this engine for the <code>CharacterSetName</code> parameter of the <code>CreateDBInstance</code> action. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsCharacterSet *> * _Nullable supportedCharacterSets;

/**
 <p>A list of the supported DB engine modes.</p><note><p><code>global</code> engine mode only applies for global database clusters created with Aurora MySQL version 5.6.10a. For higher Aurora MySQL versions, the clusters in a global database use <code>provisioned</code> engine mode. </p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedEngineModes;

/**
 <p> A list of features supported by the DB engine. Supported feature names include the following. </p><ul><li><p>s3Import</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedFeatureNames;

/**
 <p>A list of the time zones supported by this engine for the <code>Timezone</code> parameter of the <code>CreateDBInstance</code> action. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTimezone *> * _Nullable supportedTimezones;

/**
 <p>A value that indicates whether the engine version supports exporting the log types specified by ExportableLogTypes to CloudWatch Logs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable supportsLogExportsToCloudwatchLogs;

/**
 <p>Indicates whether the database engine version supports read replicas.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable supportsReadReplica;

/**
 <p>A list of engine versions that this database engine version can be upgraded to.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsUpgradeTarget *> * _Nullable validUpgradeTarget;

@end

/**
 <p> Contains the result of a successful invocation of the <code>DescribeDBEngineVersions</code> action. </p>
 */
@interface AWSrdsDBEngineVersionMessage : AWSModel


/**
 <p> A list of <code>DBEngineVersion</code> elements. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBEngineVersion *> * _Nullable DBEngineVersions;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>Contains the details of an Amazon RDS DB instance. </p><p>This data type is used as a response element in the <code>DescribeDBInstances</code> action. </p>
 */
@interface AWSrdsDBInstance : AWSModel


/**
 <p>Specifies the allocated storage size specified in gibibytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedStorage;

/**
 <p> The AWS Identity and Access Management (IAM) roles associated with the DB instance. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBInstanceRole *> * _Nullable associatedRoles;

/**
 <p>Indicates that minor version patches are applied automatically.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoMinorVersionUpgrade;

/**
 <p>Specifies the name of the Availability Zone the DB instance is located in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>Specifies the number of days for which automatic DB snapshots are retained.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupRetentionPeriod;

/**
 <p>The identifier of the CA certificate for this DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable CACertificateIdentifier;

/**
 <p>If present, specifies the name of the character set that this instance is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable characterSetName;

/**
 <p>Specifies whether tags are copied from the DB instance to snapshots of the DB instance.</p><p><b>Amazon Aurora</b></p><p>Not applicable. Copying tags to snapshots is managed by the DB cluster. Setting this value for an Aurora DB instance has no effect on the DB cluster setting. For more information, see <code>DBCluster</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicateTagsToSnapshot;

/**
 <p>If the DB instance is a member of a DB cluster, contains the name of the DB cluster that the DB instance is a member of.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>The Amazon Resource Name (ARN) for the DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceArn;

/**
 <p>Contains the name of the compute and memory capacity class of the DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceClass;

/**
 <p>Contains a user-supplied database identifier. This identifier is the unique key that identifies a DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p>Specifies the current state of this database.</p><p>For information about DB instance statuses, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.DBInstance.Status.html">DB Instance Status</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceStatus;

/**
 <p>The meaning of this parameter differs according to the database engine you use.</p><p><b>MySQL, MariaDB, SQL Server, PostgreSQL</b></p><p>Contains the name of the initial database of this instance that was provided at create time, if one was specified when the DB instance was created. This same name is returned for the life of the DB instance.</p><p>Type: String</p><p><b>Oracle</b></p><p>Contains the Oracle System ID (SID) of the created DB instance. Not shown when the returned parameters do not apply to an Oracle DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBName;

/**
 <p>Provides the list of DB parameter groups applied to this DB instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBParameterGroupStatus *> * _Nullable DBParameterGroups;

/**
 <p> A list of DB security group elements containing <code>DBSecurityGroup.Name</code> and <code>DBSecurityGroup.Status</code> subelements. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBSecurityGroupMembership *> * _Nullable DBSecurityGroups;

/**
 <p>Specifies information on the subnet group associated with the DB instance, including the name, description, and subnets in the subnet group.</p>
 */
@property (nonatomic, strong) AWSrdsDBSubnetGroup * _Nullable DBSubnetGroup;

/**
 <p>Specifies the port that the DB instance listens on. If the DB instance is part of a DB cluster, this can be a different port than the DB cluster port.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dbInstancePort;

/**
 <p>The AWS Region-unique, immutable identifier for the DB instance. This identifier is found in AWS CloudTrail log entries whenever the AWS KMS key for the DB instance is accessed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dbiResourceId;

/**
 <p>Indicates if the DB instance has deletion protection enabled. The database can't be deleted when deletion protection is enabled. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html"> Deleting a DB Instance</a>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p>The Active Directory Domain membership records associated with the DB instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDomainMembership *> * _Nullable domainMemberships;

/**
 <p>A list of log types that this DB instance is configured to export to CloudWatch Logs.</p><p>Log types vary by DB engine. For information about the log types for each DB engine, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html">Amazon RDS Database Log Files</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable enabledCloudwatchLogsExports;

/**
 <p>Specifies the connection endpoint.</p>
 */
@property (nonatomic, strong) AWSrdsEndpoint * _Nullable endpoint;

/**
 <p>Provides the name of the database engine to be used for this DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>Indicates the database engine version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon CloudWatch Logs log stream that receives the Enhanced Monitoring metrics data for the DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable enhancedMonitoringResourceArn;

/**
 <p>True if mapping of AWS Identity and Access Management (IAM) accounts to database accounts is enabled, and otherwise false.</p><p>IAM database authentication can be enabled for the following database engines</p><ul><li><p>For MySQL 5.6, minor version 5.6.34 or higher</p></li><li><p>For MySQL 5.7, minor version 5.7.16 or higher</p></li><li><p>Aurora 5.6 or higher. To enable IAM database authentication for Aurora, see DBCluster Type.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable IAMDatabaseAuthenticationEnabled;

/**
 <p>Provides the date and time the DB instance was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable instanceCreateTime;

/**
 <p>Specifies the Provisioned IOPS (I/O operations per second) value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iops;

/**
 <p> If <code>StorageEncrypted</code> is true, the AWS KMS key identifier for the encrypted DB instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>Specifies the latest time to which a database can be restored with point-in-time restore.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable latestRestorableTime;

/**
 <p>License model information for this DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable licenseModel;

/**
 <p>Specifies the listener connection endpoint for SQL Server Always On.</p>
 */
@property (nonatomic, strong) AWSrdsEndpoint * _Nullable listenerEndpoint;

/**
 <p>Contains the master username for the DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUsername;

/**
 <p>The upper limit to which Amazon RDS can automatically scale the storage of the DB instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxAllocatedStorage;

/**
 <p>The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable monitoringInterval;

/**
 <p>The ARN for the IAM role that permits RDS to send Enhanced Monitoring metrics to Amazon CloudWatch Logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringRoleArn;

/**
 <p>Specifies if the DB instance is a Multi-AZ deployment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiAZ;

/**
 <p>Provides the list of option group memberships for this DB instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsOptionGroupMembership *> * _Nullable optionGroupMemberships;

/**
 <p>Specifies that changes to the DB instance are pending. This element is only included when changes are pending. Specific changes are identified by subelements.</p>
 */
@property (nonatomic, strong) AWSrdsPendingModifiedValues * _Nullable pendingModifiedValues;

/**
 <p>True if Performance Insights is enabled for the DB instance, and otherwise false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable performanceInsightsEnabled;

/**
 <p>The AWS KMS key identifier for encryption of Performance Insights data. The KMS key ID is the Amazon Resource Name (ARN), KMS key identifier, or the KMS key alias for the KMS encryption key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable performanceInsightsKMSKeyId;

/**
 <p>The amount of time, in days, to retain Performance Insights data. Valid values are 7 or 731 (2 years). </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable performanceInsightsRetentionPeriod;

/**
 <p> Specifies the daily time range during which automated backups are created if automated backups are enabled, as determined by the <code>BackupRetentionPeriod</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredBackupWindow;

/**
 <p>Specifies the weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC).</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>The number of CPU cores and the number of threads per core for the DB instance class of the DB instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsProcessorFeature *> * _Nullable processorFeatures;

/**
 <p>A value that specifies the order in which an Aurora Replica is promoted to the primary instance after a failure of the existing primary instance. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Managing.Backups.html#Aurora.Managing.FaultTolerance"> Fault Tolerance for an Aurora DB Cluster</a> in the <i>Amazon Aurora User Guide</i>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable promotionTier;

/**
 <p>Specifies the accessibility options for the DB instance. A value of true specifies an Internet-facing instance with a publicly resolvable DNS name, which resolves to a public IP address. A value of false specifies an internal instance with a DNS name that resolves to a private IP address.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publiclyAccessible;

/**
 <p>Contains one or more identifiers of Aurora DB clusters to which the RDS DB instance is replicated as a read replica. For example, when you create an Aurora read replica of an RDS MySQL DB instance, the Aurora MySQL DB cluster for the Aurora read replica is shown. This output does not contain information about cross region Aurora read replicas.</p><note><p>Currently, each RDS DB instance can have only one Aurora read replica.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable readReplicaDBClusterIdentifiers;

/**
 <p>Contains one or more identifiers of the read replicas associated with this DB instance.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable readReplicaDBInstanceIdentifiers;

/**
 <p>Contains the identifier of the source DB instance if this DB instance is a read replica.</p>
 */
@property (nonatomic, strong) NSString * _Nullable readReplicaSourceDBInstanceIdentifier;

/**
 <p>If present, specifies the name of the secondary Availability Zone for a DB instance with multi-AZ support.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secondaryAvailabilityZone;

/**
 <p>The status of a read replica. If the instance isn't a read replica, this is blank.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBInstanceStatusInfo *> * _Nullable statusInfos;

/**
 <p>Specifies whether the DB instance is encrypted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable storageEncrypted;

/**
 <p>Specifies the storage type associated with DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable storageType;

/**
 <p>The ARN from the key store with which the instance is associated for TDE encryption.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tdeCredentialArn;

/**
 <p>The time zone of the DB instance. In most cases, the <code>Timezone</code> element is empty. <code>Timezone</code> content appears only for Microsoft SQL Server DB instances that were created with a time zone specified. </p>
 */
@property (nonatomic, strong) NSString * _Nullable timezone;

/**
 <p>Provides a list of VPC security group elements that the DB instance belongs to.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsVpcSecurityGroupMembership *> * _Nullable vpcSecurityGroups;

@end

/**
 <p>An automated backup of a DB instance. It it consists of system backups, transaction logs, and the database instance properties that existed at the time you deleted the source instance. </p>
 */
@interface AWSrdsDBInstanceAutomatedBackup : AWSModel


/**
 <p>Specifies the allocated storage size in gibibytes (GiB).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedStorage;

/**
 <p>The Availability Zone that the automated backup was created in. For information on AWS Regions and Availability Zones, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html">Regions and Availability Zones</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The Amazon Resource Name (ARN) for the automated backup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceArn;

/**
 <p>The customer id of the instance that is/was associated with the automated backup. </p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p>The identifier for the source DB instance, which can't be changed and which is unique to an AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dbiResourceId;

/**
 <p>Specifies whether the automated backup is encrypted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encrypted;

/**
 <p>The name of the database engine for this automated backup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The version of the database engine for the automated backup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>True if mapping of AWS Identity and Access Management (IAM) accounts to database accounts is enabled, and otherwise false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable IAMDatabaseAuthenticationEnabled;

/**
 <p>Provides the date and time that the DB instance was created. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable instanceCreateTime;

/**
 <p>The IOPS (I/O operations per second) value for the automated backup. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iops;

/**
 <p>The AWS KMS key ID for an automated backup. The KMS key ID is the Amazon Resource Name (ARN), KMS key identifier, or the KMS key alias for the KMS encryption key. </p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>License model information for the automated backup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable licenseModel;

/**
 <p>The license model of an automated backup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUsername;

/**
 <p>The option group the automated backup is associated with. If omitted, the default option group for the engine specified is used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

/**
 <p>The port number that the automated backup used for connections.</p><p>Default: Inherits from the source DB instance</p><p>Valid Values: <code>1150-65535</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The AWS Region associated with the automated backup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>Earliest and latest time an instance can be restored to.</p>
 */
@property (nonatomic, strong) AWSrdsRestoreWindow * _Nullable restoreWindow;

/**
 <p>Provides a list of status information for an automated backup:</p><ul><li><p><code>active</code> - automated backups for current instances</p></li><li><p><code>retained</code> - automated backups for deleted instances</p></li><li><p><code>creating</code> - automated backups that are waiting for the first automated snapshot to be available.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>Specifies the storage type associated with the automated backup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable storageType;

/**
 <p>The ARN from the key store with which the automated backup is associated for TDE encryption.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tdeCredentialArn;

/**
 <p>The time zone of the automated backup. In most cases, the <code>Timezone</code> element is empty. <code>Timezone</code> content appears only for Microsoft SQL Server DB instances that were created with a time zone specified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timezone;

/**
 <p>Provides the VPC ID associated with the DB instance</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p> Contains the result of a successful invocation of the <code>DescribeDBInstanceAutomatedBackups</code> action. </p>
 */
@interface AWSrdsDBInstanceAutomatedBackupMessage : AWSModel


/**
 <p> A list of <code>DBInstanceAutomatedBackup</code> instances. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBInstanceAutomatedBackup *> * _Nullable DBInstanceAutomatedBackups;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code> . </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p> Contains the result of a successful invocation of the <code>DescribeDBInstances</code> action. </p>
 */
@interface AWSrdsDBInstanceMessage : AWSModel


/**
 <p> A list of <code>DBInstance</code> instances. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBInstance *> * _Nullable DBInstances;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code> . </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>Describes an AWS Identity and Access Management (IAM) role that is associated with a DB instance.</p>
 */
@interface AWSrdsDBInstanceRole : AWSModel


/**
 <p>The name of the feature associated with the AWS Identity and Access Management (IAM) role. For the list of supported feature names, see <code>DBEngineVersion</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable featureName;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role that is associated with the DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Describes the state of association between the IAM role and the DB instance. The Status property returns one of the following values:</p><ul><li><p><code>ACTIVE</code> - the IAM role ARN is associated with the DB instance and can be used to access other AWS services on your behalf.</p></li><li><p><code>PENDING</code> - the IAM role ARN is being associated with the DB instance.</p></li><li><p><code>INVALID</code> - the IAM role ARN is associated with the DB instance, but the DB instance is unable to assume the IAM role in order to access other AWS services on your behalf.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Provides a list of status information for a DB instance.</p>
 */
@interface AWSrdsDBInstanceStatusInfo : AWSModel


/**
 <p>Details of the error if there is an error for the instance. If the instance isn't in an error state, this value is blank.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>Boolean value that is true if the instance is operating normally, or false if the instance is in an error state.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable normal;

/**
 <p>Status of the DB instance. For a StatusType of read replica, the values can be replicating, replication stop point set, replication stop point reached, error, stopped, or terminated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>This value is currently "read replication."</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusType;

@end

/**
 <p>Contains the details of an Amazon RDS DB parameter group. </p><p>This data type is used as a response element in the <code>DescribeDBParameterGroups</code> action. </p>
 */
@interface AWSrdsDBParameterGroup : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the DB parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupArn;

/**
 <p>Provides the name of the DB parameter group family that this DB parameter group is compatible with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupFamily;

/**
 <p>Provides the name of the DB parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupName;

/**
 <p>Provides the customer-specified description for this DB parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 <p> Contains the result of a successful invocation of the <code>DescribeDBParameters</code> action. </p>
 */
@interface AWSrdsDBParameterGroupDetails : AWSModel


/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> A list of <code>Parameter</code> values. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsParameter *> * _Nullable parameters;

@end

/**
 <p> Contains the result of a successful invocation of the <code>ModifyDBParameterGroup</code> or <code>ResetDBParameterGroup</code> action. </p>
 */
@interface AWSrdsDBParameterGroupNameMessage : AWSModel


/**
 <p>Provides the name of the DB parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupName;

@end

/**
 <p>The status of the DB parameter group.</p><p>This data type is used as a response element in the following actions:</p><ul><li><p><code>CreateDBInstance</code></p></li><li><p><code>CreateDBInstanceReadReplica</code></p></li><li><p><code>DeleteDBInstance</code></p></li><li><p><code>ModifyDBInstance</code></p></li><li><p><code>RebootDBInstance</code></p></li><li><p><code>RestoreDBInstanceFromDBSnapshot</code></p></li></ul>
 */
@interface AWSrdsDBParameterGroupStatus : AWSModel


/**
 <p>The name of the DB parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupName;

/**
 <p>The status of parameter updates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterApplyStatus;

@end

/**
 <p> Contains the result of a successful invocation of the <code>DescribeDBParameterGroups</code> action. </p>
 */
@interface AWSrdsDBParameterGroupsMessage : AWSModel


/**
 <p> A list of <code>DBParameterGroup</code> instances. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBParameterGroup *> * _Nullable DBParameterGroups;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>The data structure representing a proxy managed by the RDS Proxy.</p><p>This data type is used as a response element in the <code>DescribeDBProxies</code> action.</p>
 */
@interface AWSrdsDBProxy : AWSModel


/**
 <p>One or more data structures specifying the authorization mechanism to connect to the associated RDS DB instance or Aurora DB cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsUserAuthConfigInfo *> * _Nullable auth;

/**
 <p>The date and time when the proxy was first created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The Amazon Resource Name (ARN) for the proxy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBProxyArn;

/**
 <p>The identifier for the proxy. This name must be unique for all proxies owned by your AWS account in the specified AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBProxyName;

/**
 <p>Whether the proxy includes detailed information about SQL statements in its logs. This information helps you to debug issues involving SQL behavior or the performance and scalability of the proxy connections. The debug information includes the text of SQL statements that you submit through the proxy. Thus, only enable this setting when needed for debugging, and only when you have security measures in place to safeguard any sensitive information that appears in the logs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable debugLogging;

/**
 <p>The endpoint that you can use to connect to the proxy. You include the endpoint value in the connection string for a database client application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpoint;

/**
 <p>The engine family applies to MySQL and PostgreSQL for both RDS and Aurora.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineFamily;

/**
 <p>The number of seconds a connection to the proxy can have no activity before the proxy drops the client connection. The proxy keeps the underlying database connection open and puts it back into the connection pool for reuse by later connection requests.</p><p>Default: 1800 (30 minutes)</p><p>Constraints: 1 to 28,800</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable idleClientTimeout;

/**
 <p>Indicates whether Transport Layer Security (TLS) encryption is required for connections to the proxy.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requireTLS;

/**
 <p>The Amazon Resource Name (ARN) for the IAM role that the proxy uses to access Amazon Secrets Manager.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The current status of this proxy. A status of <code>available</code> means the proxy is ready to handle requests. Other values indicate that you must wait for the proxy to be ready, or take some action to resolve an issue.</p>
 */
@property (nonatomic, assign) AWSrdsDBProxyStatus status;

/**
 <p>The date and time when the proxy was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedDate;

/**
 <p>Provides a list of VPC security groups that the proxy belongs to.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSecurityGroupIds;

/**
 <p>The EC2 subnet IDs for the proxy.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSubnetIds;

@end

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Contains the details for an RDS Proxy target. It represents an RDS DB instance or Aurora DB cluster that the proxy can connect to. One or more targets are associated with an RDS Proxy target group.</p><p>This data type is used as a response element in the <code>DescribeDBProxyTargets</code> action.</p>
 */
@interface AWSrdsDBProxyTarget : AWSModel


/**
 <p>The writer endpoint for the RDS DB instance or Aurora DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpoint;

/**
 <p>The port that the RDS Proxy uses to connect to the target RDS DB instance or Aurora DB cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The identifier representing the target. It can be the instance identifier for an RDS DB instance, or the cluster identifier for an Aurora DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rdsResourceId;

/**
 <p>The Amazon Resource Name (ARN) for the RDS DB instance or Aurora DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

/**
 <p>Information about the connection health of the RDS Proxy target.</p>
 */
@property (nonatomic, strong) AWSrdsTargetHealth * _Nullable targetHealth;

/**
 <p>The DB cluster identifier when the target represents an Aurora DB cluster. This field is blank when the target represents an RDS DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackedClusterId;

/**
 <p>Specifies the kind of database, such as an RDS DB instance or an Aurora DB cluster, that the target represents.</p>
 */
@property (nonatomic, assign) AWSrdsTargetType types;

@end

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Represents a set of RDS DB instances, Aurora DB clusters, or both that a proxy can connect to. Currently, each target group is associated with exactly one RDS DB instance or Aurora DB cluster.</p><p>This data type is used as a response element in the <code>DescribeDBProxyTargetGroups</code> action.</p>
 */
@interface AWSrdsDBProxyTargetGroup : AWSModel


/**
 <p>The settings that determine the size and behavior of the connection pool for the target group.</p>
 */
@property (nonatomic, strong) AWSrdsConnectionPoolConfigurationInfo * _Nullable connectionPoolConfig;

/**
 <p>The date and time when the target group was first created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The identifier for the RDS proxy associated with this target group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBProxyName;

/**
 <p>Whether this target group is the first one used for connection requests by the associated proxy. Because each proxy is currently associated with a single target group, currently this setting is always <code>true</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefault;

/**
 <p>The current status of this target group. A status of <code>available</code> means the target group is correctly associated with a database. Other values indicate that you must wait for the target group to be ready, or take some action to resolve an issue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The Amazon Resource Name (ARN) representing the target group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetGroupArn;

/**
 <p>The identifier for the target group. This name must be unique for all target groups owned by your AWS account in the specified AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetGroupName;

/**
 <p>The date and time when the target group was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedDate;

@end

/**
 <p>Contains the details for an Amazon RDS DB security group. </p><p>This data type is used as a response element in the <code>DescribeDBSecurityGroups</code> action. </p>
 */
@interface AWSrdsDBSecurityGroup : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the DB security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSecurityGroupArn;

/**
 <p>Provides the description of the DB security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSecurityGroupDescription;

/**
 <p>Specifies the name of the DB security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSecurityGroupName;

/**
 <p> Contains a list of <code>EC2SecurityGroup</code> elements. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsEC2SecurityGroup *> * _Nullable EC2SecurityGroups;

/**
 <p> Contains a list of <code>IPRange</code> elements. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsIPRange *> * _Nullable IPRanges;

/**
 <p>Provides the AWS ID of the owner of a specific DB security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerId;

/**
 <p>Provides the VpcId of the DB security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>This data type is used as a response element in the following actions:</p><ul><li><p><code>ModifyDBInstance</code></p></li><li><p><code>RebootDBInstance</code></p></li><li><p><code>RestoreDBInstanceFromDBSnapshot</code></p></li><li><p><code>RestoreDBInstanceToPointInTime</code></p></li></ul>
 */
@interface AWSrdsDBSecurityGroupMembership : AWSModel


/**
 <p>The name of the DB security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSecurityGroupName;

/**
 <p>The status of the DB security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p> Contains the result of a successful invocation of the <code>DescribeDBSecurityGroups</code> action. </p>
 */
@interface AWSrdsDBSecurityGroupMessage : AWSModel


/**
 <p> A list of <code>DBSecurityGroup</code> instances. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBSecurityGroup *> * _Nullable DBSecurityGroups;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>Contains the details of an Amazon RDS DB snapshot. </p><p>This data type is used as a response element in the <code>DescribeDBSnapshots</code> action. </p>
 */
@interface AWSrdsDBSnapshot : AWSModel


/**
 <p>Specifies the allocated storage size in gibibytes (GiB).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedStorage;

/**
 <p>Specifies the name of the Availability Zone the DB instance was located in at the time of the DB snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>Specifies the DB instance identifier of the DB instance this DB snapshot was created from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p>The Amazon Resource Name (ARN) for the DB snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSnapshotArn;

/**
 <p>Specifies the identifier for the DB snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSnapshotIdentifier;

/**
 <p>The identifier for the source DB instance, which can't be changed and which is unique to an AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dbiResourceId;

/**
 <p>Specifies whether the DB snapshot is encrypted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encrypted;

/**
 <p>Specifies the name of the database engine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>Specifies the version of the database engine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>True if mapping of AWS Identity and Access Management (IAM) accounts to database accounts is enabled, and otherwise false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable IAMDatabaseAuthenticationEnabled;

/**
 <p>Specifies the time when the snapshot was taken, in Universal Coordinated Time (UTC).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable instanceCreateTime;

/**
 <p>Specifies the Provisioned IOPS (I/O operations per second) value of the DB instance at the time of the snapshot.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iops;

/**
 <p> If <code>Encrypted</code> is true, the AWS KMS key identifier for the encrypted DB snapshot. </p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>License model information for the restored DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable licenseModel;

/**
 <p>Provides the master username for the DB snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUsername;

/**
 <p>Provides the option group name for the DB snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

/**
 <p>The percentage of the estimated data that has been transferred.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable percentProgress;

/**
 <p>Specifies the port that the database engine was listening on at the time of the snapshot.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The number of CPU cores and the number of threads per core for the DB instance class of the DB instance when the DB snapshot was created.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsProcessorFeature *> * _Nullable processorFeatures;

/**
 <p>Provides the time when the snapshot was taken, in Universal Coordinated Time (UTC).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable snapshotCreateTime;

/**
 <p>Provides the type of the DB snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotType;

/**
 <p>The DB snapshot Amazon Resource Name (ARN) that the DB snapshot was copied from. It only has value in case of cross-customer or cross-region copy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceDBSnapshotIdentifier;

/**
 <p>The AWS Region that the DB snapshot was created in or copied from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceRegion;

/**
 <p>Specifies the status of this DB snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>Specifies the storage type associated with DB snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable storageType;

/**
 <p>The ARN from the key store with which to associate the instance for TDE encryption.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tdeCredentialArn;

/**
 <p>The time zone of the DB snapshot. In most cases, the <code>Timezone</code> element is empty. <code>Timezone</code> content appears only for snapshots taken from Microsoft SQL Server DB instances that were created with a time zone specified. </p>
 */
@property (nonatomic, strong) NSString * _Nullable timezone;

/**
 <p>Provides the VPC ID associated with the DB snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the name and values of a manual DB snapshot attribute</p><p>Manual DB snapshot attributes are used to authorize other AWS accounts to restore a manual DB snapshot. For more information, see the <code>ModifyDBSnapshotAttribute</code> API.</p>
 */
@interface AWSrdsDBSnapshotAttribute : AWSModel


/**
 <p>The name of the manual DB snapshot attribute.</p><p>The attribute named <code>restore</code> refers to the list of AWS accounts that have permission to copy or restore the manual DB cluster snapshot. For more information, see the <code>ModifyDBSnapshotAttribute</code> API action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The value or values for the manual DB snapshot attribute.</p><p>If the <code>AttributeName</code> field is set to <code>restore</code>, then this element returns a list of IDs of the AWS accounts that are authorized to copy or restore the manual DB snapshot. If a value of <code>all</code> is in the list, then the manual DB snapshot is public and available for any AWS account to copy or restore.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributeValues;

@end

/**
 <p>Contains the results of a successful call to the <code>DescribeDBSnapshotAttributes</code> API action.</p><p>Manual DB snapshot attributes are used to authorize other AWS accounts to copy or restore a manual DB snapshot. For more information, see the <code>ModifyDBSnapshotAttribute</code> API action.</p>
 */
@interface AWSrdsDBSnapshotAttributesResult : AWSModel


/**
 <p>The list of attributes and values for the manual DB snapshot.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBSnapshotAttribute *> * _Nullable DBSnapshotAttributes;

/**
 <p>The identifier of the manual DB snapshot that the attributes apply to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSnapshotIdentifier;

@end

/**
 <p> Contains the result of a successful invocation of the <code>DescribeDBSnapshots</code> action. </p>
 */
@interface AWSrdsDBSnapshotMessage : AWSModel


/**
 <p> A list of <code>DBSnapshot</code> instances. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBSnapshot *> * _Nullable DBSnapshots;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>Contains the details of an Amazon RDS DB subnet group. </p><p>This data type is used as a response element in the <code>DescribeDBSubnetGroups</code> action. </p>
 */
@interface AWSrdsDBSubnetGroup : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the DB subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroupArn;

/**
 <p>Provides the description of the DB subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroupDescription;

/**
 <p>The name of the DB subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroupName;

/**
 <p>Provides the status of the DB subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetGroupStatus;

/**
 <p> Contains a list of <code>Subnet</code> elements. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsSubnet *> * _Nullable subnets;

/**
 <p>Provides the VpcId of the DB subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p> Contains the result of a successful invocation of the <code>DescribeDBSubnetGroups</code> action. </p>
 */
@interface AWSrdsDBSubnetGroupMessage : AWSModel


/**
 <p> A list of <code>DBSubnetGroup</code> instances. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBSubnetGroup *> * _Nullable DBSubnetGroups;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSrdsDeleteCustomAvailabilityZoneMessage : AWSRequest


/**
 <p>The custom AZ identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customAvailabilityZoneId;

@end

/**
 
 */
@interface AWSrdsDeleteCustomAvailabilityZoneResult : AWSModel


/**
 <p>A custom Availability Zone (AZ) is an on-premises AZ that is integrated with a VMware vSphere cluster.</p><p>For more information about RDS on VMware, see the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html"><i>RDS on VMware User Guide.</i></a></p>
 */
@property (nonatomic, strong) AWSrdsCustomAvailabilityZone * _Nullable customAvailabilityZone;

@end

/**
 
 */
@interface AWSrdsDeleteDBClusterEndpointMessage : AWSRequest


/**
 <p>The identifier associated with the custom endpoint. This parameter is stored as a lowercase string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterEndpointIdentifier;

@end

/**
 <p/>
 Required parameters: [DBClusterIdentifier]
 */
@interface AWSrdsDeleteDBClusterMessage : AWSRequest


/**
 <p>The DB cluster identifier for the DB cluster to be deleted. This parameter isn't case-sensitive.</p><p>Constraints:</p><ul><li><p>Must match an existing DBClusterIdentifier.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p> The DB cluster snapshot identifier of the new DB cluster snapshot created when <code>SkipFinalSnapshot</code> is disabled. </p><note><p> Specifying this parameter and also skipping the creation of a final DB cluster snapshot with the <code>SkipFinalShapshot</code> parameter results in an error.</p></note><p>Constraints:</p><ul><li><p>Must be 1 to 255 letters, numbers, or hyphens.</p></li><li><p>First character must be a letter</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable finalDBSnapshotIdentifier;

/**
 <p>A value that indicates whether to skip the creation of a final DB cluster snapshot before the DB cluster is deleted. If skip is specified, no DB cluster snapshot is created. If skip isn't specified, a DB cluster snapshot is created before the DB cluster is deleted. By default, skip isn't specified, and the DB cluster snapshot is created. By default, this parameter is disabled.</p><note><p>You must specify a <code>FinalDBSnapshotIdentifier</code> parameter if <code>SkipFinalSnapshot</code> is disabled.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable skipFinalSnapshot;

@end

/**
 <p/>
 Required parameters: [DBClusterParameterGroupName]
 */
@interface AWSrdsDeleteDBClusterParameterGroupMessage : AWSRequest


/**
 <p>The name of the DB cluster parameter group.</p><p>Constraints:</p><ul><li><p>Must be the name of an existing DB cluster parameter group.</p></li><li><p>You can't delete a default DB cluster parameter group.</p></li><li><p>Can't be associated with any DB clusters.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterParameterGroupName;

@end

/**
 
 */
@interface AWSrdsDeleteDBClusterResult : AWSModel


/**
 <p>Contains the details of an Amazon Aurora DB cluster. </p><p>This data type is used as a response element in the <code>DescribeDBClusters</code>, <code>StopDBCluster</code>, and <code>StartDBCluster</code> actions. </p>
 */
@property (nonatomic, strong) AWSrdsDBCluster * _Nullable DBCluster;

@end

/**
 <p/>
 Required parameters: [DBClusterSnapshotIdentifier]
 */
@interface AWSrdsDeleteDBClusterSnapshotMessage : AWSRequest


/**
 <p>The identifier of the DB cluster snapshot to delete.</p><p>Constraints: Must be the name of an existing DB cluster snapshot in the <code>available</code> state.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterSnapshotIdentifier;

@end

/**
 
 */
@interface AWSrdsDeleteDBClusterSnapshotResult : AWSModel


/**
 <p>Contains the details for an Amazon RDS DB cluster snapshot </p><p>This data type is used as a response element in the <code>DescribeDBClusterSnapshots</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBClusterSnapshot * _Nullable DBClusterSnapshot;

@end

/**
 <p>Parameter input for the <code>DeleteDBInstanceAutomatedBackup</code> operation. </p>
 Required parameters: [DbiResourceId]
 */
@interface AWSrdsDeleteDBInstanceAutomatedBackupMessage : AWSRequest


/**
 <p>The identifier for the source DB instance, which can't be changed and which is unique to an AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dbiResourceId;

@end

/**
 
 */
@interface AWSrdsDeleteDBInstanceAutomatedBackupResult : AWSModel


/**
 <p>An automated backup of a DB instance. It it consists of system backups, transaction logs, and the database instance properties that existed at the time you deleted the source instance. </p>
 */
@property (nonatomic, strong) AWSrdsDBInstanceAutomatedBackup * _Nullable DBInstanceAutomatedBackup;

@end

/**
 <p/>
 Required parameters: [DBInstanceIdentifier]
 */
@interface AWSrdsDeleteDBInstanceMessage : AWSRequest


/**
 <p>The DB instance identifier for the DB instance to be deleted. This parameter isn't case-sensitive.</p><p>Constraints:</p><ul><li><p>Must match the name of an existing DB instance.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p>A value that indicates whether to remove automated backups immediately after the DB instance is deleted. This parameter isn't case-sensitive. The default is to remove automated backups immediately after the DB instance is deleted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteAutomatedBackups;

/**
 <p> The <code>DBSnapshotIdentifier</code> of the new <code>DBSnapshot</code> created when the <code>SkipFinalSnapshot</code> parameter is disabled. </p><note><p>Specifying this parameter and also specifying to skip final DB snapshot creation in SkipFinalShapshot results in an error.</p></note><p>Constraints:</p><ul><li><p>Must be 1 to 255 letters or numbers.</p></li><li><p>First character must be a letter.</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens.</p></li><li><p>Can't be specified when deleting a read replica.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable finalDBSnapshotIdentifier;

/**
 <p>A value that indicates whether to skip the creation of a final DB snapshot before the DB instance is deleted. If skip is specified, no DB snapshot is created. If skip isn't specified, a DB snapshot is created before the DB instance is deleted. By default, skip isn't specified, and the DB snapshot is created.</p><p>When a DB instance is in a failure state and has a status of 'failed', 'incompatible-restore', or 'incompatible-network', it can only be deleted when skip is specified.</p><p>Specify skip when deleting a read replica.</p><note><p>The FinalDBSnapshotIdentifier parameter must be specified if skip isn't specified.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable skipFinalSnapshot;

@end

/**
 
 */
@interface AWSrdsDeleteDBInstanceResult : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB instance. </p><p>This data type is used as a response element in the <code>DescribeDBInstances</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBInstance * _Nullable DBInstance;

@end

/**
 <p/>
 Required parameters: [DBParameterGroupName]
 */
@interface AWSrdsDeleteDBParameterGroupMessage : AWSRequest


/**
 <p>The name of the DB parameter group.</p><p>Constraints:</p><ul><li><p>Must be the name of an existing DB parameter group</p></li><li><p>You can't delete a default DB parameter group</p></li><li><p>Can't be associated with any DB instances</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupName;

@end

/**
 
 */
@interface AWSrdsDeleteDBProxyRequest : AWSRequest


/**
 <p>The name of the DB proxy to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBProxyName;

@end

/**
 
 */
@interface AWSrdsDeleteDBProxyResponse : AWSModel


/**
 <p>The data structure representing the details of the DB proxy that you delete.</p>
 */
@property (nonatomic, strong) AWSrdsDBProxy * _Nullable DBProxy;

@end

/**
 <p/>
 Required parameters: [DBSecurityGroupName]
 */
@interface AWSrdsDeleteDBSecurityGroupMessage : AWSRequest


/**
 <p>The name of the DB security group to delete.</p><note><p>You can't delete the default DB security group.</p></note><p>Constraints:</p><ul><li><p>Must be 1 to 255 letters, numbers, or hyphens.</p></li><li><p>First character must be a letter</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens</p></li><li><p>Must not be "Default"</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBSecurityGroupName;

@end

/**
 <p/>
 Required parameters: [DBSnapshotIdentifier]
 */
@interface AWSrdsDeleteDBSnapshotMessage : AWSRequest


/**
 <p>The DB snapshot identifier.</p><p>Constraints: Must be the name of an existing DB snapshot in the <code>available</code> state.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSnapshotIdentifier;

@end

/**
 
 */
@interface AWSrdsDeleteDBSnapshotResult : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB snapshot. </p><p>This data type is used as a response element in the <code>DescribeDBSnapshots</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBSnapshot * _Nullable DBSnapshot;

@end

/**
 <p/>
 Required parameters: [DBSubnetGroupName]
 */
@interface AWSrdsDeleteDBSubnetGroupMessage : AWSRequest


/**
 <p>The name of the database subnet group to delete.</p><note><p>You can't delete the default subnet group.</p></note><p>Constraints:</p><p>Constraints: Must match the name of an existing DBSubnetGroup. Must not be default.</p><p>Example: <code>mySubnetgroup</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroupName;

@end

/**
 <p/>
 Required parameters: [SubscriptionName]
 */
@interface AWSrdsDeleteEventSubscriptionMessage : AWSRequest


/**
 <p>The name of the RDS event notification subscription you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionName;

@end

/**
 
 */
@interface AWSrdsDeleteEventSubscriptionResult : AWSModel


/**
 <p>Contains the results of a successful invocation of the <code>DescribeEventSubscriptions</code> action.</p>
 */
@property (nonatomic, strong) AWSrdsEventSubscription * _Nullable eventSubscription;

@end

/**
 
 */
@interface AWSrdsDeleteGlobalClusterMessage : AWSRequest


/**
 <p> The cluster identifier of the global database cluster being deleted. </p>
 */
@property (nonatomic, strong) NSString * _Nullable globalClusterIdentifier;

@end

/**
 
 */
@interface AWSrdsDeleteGlobalClusterResult : AWSModel


/**
 <p>A data type representing an Aurora global database.</p>
 */
@property (nonatomic, strong) AWSrdsGlobalCluster * _Nullable globalCluster;

@end

/**
 
 */
@interface AWSrdsDeleteInstallationMediaMessage : AWSRequest


/**
 <p>The installation medium ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable installationMediaId;

@end

/**
 <p/>
 Required parameters: [OptionGroupName]
 */
@interface AWSrdsDeleteOptionGroupMessage : AWSRequest


/**
 <p>The name of the option group to be deleted.</p><note><p>You can't delete default option groups.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

@end

/**
 
 */
@interface AWSrdsDeregisterDBProxyTargetsRequest : AWSRequest


/**
 <p>One or more DB cluster identifiers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable DBClusterIdentifiers;

/**
 <p>One or more DB instance identifiers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable DBInstanceIdentifiers;

/**
 <p>The identifier of the <code>DBProxy</code> that is associated with the <code>DBProxyTargetGroup</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBProxyName;

/**
 <p>The identifier of the <code>DBProxyTargetGroup</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetGroupName;

@end

/**
 
 */
@interface AWSrdsDeregisterDBProxyTargetsResponse : AWSModel


@end

/**
 <p/>
 */
@interface AWSrdsDescribeAccountAttributesMessage : AWSRequest


@end

/**
 <p/>
 */
@interface AWSrdsDescribeCertificatesMessage : AWSRequest


/**
 <p>The user-supplied certificate identifier. If this parameter is specified, information for only the identified certificate is returned. This parameter isn't case-sensitive.</p><p>Constraints:</p><ul><li><p>Must match an existing CertificateIdentifier.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable certificateIdentifier;

/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous <code>DescribeCertificates</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 
 */
@interface AWSrdsDescribeCustomAvailabilityZonesMessage : AWSRequest


/**
 <p>The custom AZ identifier. If this parameter is specified, information from only the specific custom AZ is returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customAvailabilityZoneId;

/**
 <p>A filter that specifies one or more custom AZs to describe.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p>An optional pagination token provided by a previous <code>DescribeCustomAvailabilityZones</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so you can retrieve the remaining results.</p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p/>
 Required parameters: [DBClusterIdentifier]
 */
@interface AWSrdsDescribeDBClusterBacktracksMessage : AWSRequest


/**
 <p>If specified, this value is the backtrack identifier of the backtrack to be described.</p><p>Constraints:</p><ul><li><p>Must contain a valid universally unique identifier (UUID). For more information about UUIDs, see <a href="http://www.ietf.org/rfc/rfc4122.txt">A Universally Unique Identifier (UUID) URN Namespace</a>.</p></li></ul><p>Example: <code>123e4567-e89b-12d3-a456-426655440000</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable backtrackIdentifier;

/**
 <p>The DB cluster identifier of the DB cluster to be described. This parameter is stored as a lowercase string.</p><p>Constraints:</p><ul><li><p>Must contain from 1 to 63 alphanumeric characters or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens.</p></li></ul><p>Example: <code>my-cluster1</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>A filter that specifies one or more DB clusters to describe. Supported filters include the following:</p><ul><li><p><code>db-cluster-backtrack-id</code> - Accepts backtrack identifiers. The results list includes information about only the backtracks identified by these identifiers.</p></li><li><p><code>db-cluster-backtrack-status</code> - Accepts any of the following backtrack status values:</p><ul><li><p><code>applying</code></p></li><li><p><code>completed</code></p></li><li><p><code>failed</code></p></li><li><p><code>pending</code></p></li></ul><p>The results list includes information about only the backtracks identified by these values.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous <code>DescribeDBClusterBacktracks</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 
 */
@interface AWSrdsDescribeDBClusterEndpointsMessage : AWSRequest


/**
 <p>The identifier of the endpoint to describe. This parameter is stored as a lowercase string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterEndpointIdentifier;

/**
 <p>The DB cluster identifier of the DB cluster associated with the endpoint. This parameter is stored as a lowercase string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>A set of name-value pairs that define which endpoints to include in the output. The filters are specified as name-value pairs, in the format <code>Name=<i>endpoint_type</i>,Values=<i>endpoint_type1</i>,<i>endpoint_type2</i>,...</code>. <code>Name</code> can be one of: <code>db-cluster-endpoint-type</code>, <code>db-cluster-endpoint-custom-type</code>, <code>db-cluster-endpoint-id</code>, <code>db-cluster-endpoint-status</code>. <code>Values</code> for the <code> db-cluster-endpoint-type</code> filter can be one or more of: <code>reader</code>, <code>writer</code>, <code>custom</code>. <code>Values</code> for the <code>db-cluster-endpoint-custom-type</code> filter can be one or more of: <code>reader</code>, <code>any</code>. <code>Values</code> for the <code>db-cluster-endpoint-status</code> filter can be one or more of: <code>available</code>, <code>creating</code>, <code>deleting</code>, <code>modifying</code>. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous <code>DescribeDBClusterEndpoints</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p/>
 */
@interface AWSrdsDescribeDBClusterParameterGroupsMessage : AWSRequest


/**
 <p>The name of a specific DB cluster parameter group to return details for.</p><p>Constraints:</p><ul><li><p>If supplied, must match the name of an existing DBClusterParameterGroup.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterParameterGroupName;

/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous <code>DescribeDBClusterParameterGroups</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p/>
 Required parameters: [DBClusterParameterGroupName]
 */
@interface AWSrdsDescribeDBClusterParametersMessage : AWSRequest


/**
 <p>The name of a specific DB cluster parameter group to return parameter details for.</p><p>Constraints:</p><ul><li><p>If supplied, must match the name of an existing DBClusterParameterGroup.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterParameterGroupName;

/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous <code>DescribeDBClusterParameters</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p> A value that indicates to return only parameters for a specific source. Parameter sources can be <code>engine</code>, <code>service</code>, or <code>customer</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable source;

@end

/**
 <p/>
 Required parameters: [DBClusterSnapshotIdentifier]
 */
@interface AWSrdsDescribeDBClusterSnapshotAttributesMessage : AWSRequest


/**
 <p>The identifier for the DB cluster snapshot to describe the attributes for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterSnapshotIdentifier;

@end

/**
 
 */
@interface AWSrdsDescribeDBClusterSnapshotAttributesResult : AWSModel


/**
 <p>Contains the results of a successful call to the <code>DescribeDBClusterSnapshotAttributes</code> API action.</p><p>Manual DB cluster snapshot attributes are used to authorize other AWS accounts to copy or restore a manual DB cluster snapshot. For more information, see the <code>ModifyDBClusterSnapshotAttribute</code> API action.</p>
 */
@property (nonatomic, strong) AWSrdsDBClusterSnapshotAttributesResult * _Nullable DBClusterSnapshotAttributesResult;

@end

/**
 <p/>
 */
@interface AWSrdsDescribeDBClusterSnapshotsMessage : AWSRequest


/**
 <p>The ID of the DB cluster to retrieve the list of DB cluster snapshots for. This parameter can't be used in conjunction with the <code>DBClusterSnapshotIdentifier</code> parameter. This parameter isn't case-sensitive. </p><p>Constraints:</p><ul><li><p>If supplied, must match the identifier of an existing DBCluster.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>A specific DB cluster snapshot identifier to describe. This parameter can't be used in conjunction with the <code>DBClusterIdentifier</code> parameter. This value is stored as a lowercase string. </p><p>Constraints:</p><ul><li><p>If supplied, must match the identifier of an existing DBClusterSnapshot.</p></li><li><p>If this identifier is for an automated snapshot, the <code>SnapshotType</code> parameter must also be specified.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterSnapshotIdentifier;

/**
 <p>A filter that specifies one or more DB cluster snapshots to describe.</p><p>Supported filters:</p><ul><li><p><code>db-cluster-id</code> - Accepts DB cluster identifiers and DB cluster Amazon Resource Names (ARNs).</p></li><li><p><code>db-cluster-snapshot-id</code> - Accepts DB cluster snapshot identifiers.</p></li><li><p><code>snapshot-type</code> - Accepts types of DB cluster snapshots.</p></li><li><p><code>engine</code> - Accepts names of database engines.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p>A value that indicates whether to include manual DB cluster snapshots that are public and can be copied or restored by any AWS account. By default, the public snapshots are not included.</p><p>You can share a manual DB cluster snapshot as public by using the <a>ModifyDBClusterSnapshotAttribute</a> API action.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includePublic;

/**
 <p>A value that indicates whether to include shared manual DB cluster snapshots from other AWS accounts that this AWS account has been given permission to copy or restore. By default, these snapshots are not included.</p><p>You can give an AWS account permission to restore a manual DB cluster snapshot from another AWS account by the <code>ModifyDBClusterSnapshotAttribute</code> API action.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeShared;

/**
 <p>An optional pagination token provided by a previous <code>DescribeDBClusterSnapshots</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The type of DB cluster snapshots to be returned. You can specify one of the following values:</p><ul><li><p><code>automated</code> - Return all DB cluster snapshots that have been automatically taken by Amazon RDS for my AWS account.</p></li><li><p><code>manual</code> - Return all DB cluster snapshots that have been taken by my AWS account.</p></li><li><p><code>shared</code> - Return all manual DB cluster snapshots that have been shared to my AWS account.</p></li><li><p><code>public</code> - Return all DB cluster snapshots that have been marked as public.</p></li></ul><p>If you don't specify a <code>SnapshotType</code> value, then both automated and manual DB cluster snapshots are returned. You can include shared DB cluster snapshots with these results by enabling the <code>IncludeShared</code> parameter. You can include public DB cluster snapshots with these results by enabling the <code>IncludePublic</code> parameter.</p><p>The <code>IncludeShared</code> and <code>IncludePublic</code> parameters don't apply for <code>SnapshotType</code> values of <code>manual</code> or <code>automated</code>. The <code>IncludePublic</code> parameter doesn't apply when <code>SnapshotType</code> is set to <code>shared</code>. The <code>IncludeShared</code> parameter doesn't apply when <code>SnapshotType</code> is set to <code>public</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotType;

@end

/**
 <p/>
 */
@interface AWSrdsDescribeDBClustersMessage : AWSRequest


/**
 <p>The user-supplied DB cluster identifier. If this parameter is specified, information from only the specific DB cluster is returned. This parameter isn't case-sensitive.</p><p>Constraints:</p><ul><li><p>If supplied, must match an existing DBClusterIdentifier.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>A filter that specifies one or more DB clusters to describe.</p><p>Supported filters:</p><ul><li><p><code>db-cluster-id</code> - Accepts DB cluster identifiers and DB cluster Amazon Resource Names (ARNs). The results list will only include information about the DB clusters identified by these ARNs.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p>Optional Boolean parameter that specifies whether the output includes information about clusters shared from other AWS accounts.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeShared;

/**
 <p>An optional pagination token provided by a previous <code>DescribeDBClusters</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 
 */
@interface AWSrdsDescribeDBEngineVersionsMessage : AWSRequest


/**
 <p>The name of a specific DB parameter group family to return details for.</p><p>Constraints:</p><ul><li><p>If supplied, must match an existing DBParameterGroupFamily.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupFamily;

/**
 <p>A value that indicates whether only the default version of the specified engine or engine and major version combination is returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultOnly;

/**
 <p>The database engine to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The database engine version to return.</p><p>Example: <code>5.1.49</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p>A value that indicates whether to include engine versions that aren't available in the list. The default is to list only available engine versions.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeAll;

/**
 <p>A value that indicates whether to list the supported character sets for each engine version.</p><p>If this parameter is enabled and the requested engine supports the <code>CharacterSetName</code> parameter for <code>CreateDBInstance</code>, the response includes a list of supported character sets for each engine version. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable listSupportedCharacterSets;

/**
 <p>A value that indicates whether to list the supported time zones for each engine version.</p><p>If this parameter is enabled and the requested engine supports the <code>TimeZone</code> parameter for <code>CreateDBInstance</code>, the response includes a list of supported time zones for each engine version. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable listSupportedTimezones;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more than the <code>MaxRecords</code> value is available, a pagination token called a marker is included in the response so you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p>Parameter input for DescribeDBInstanceAutomatedBackups. </p>
 */
@interface AWSrdsDescribeDBInstanceAutomatedBackupsMessage : AWSRequest


/**
 <p>(Optional) The user-supplied instance identifier. If this parameter is specified, it must match the identifier of an existing DB instance. It returns information from the specific DB instance' automated backup. This parameter isn't case-sensitive. </p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p>The resource ID of the DB instance that is the source of the automated backup. This parameter isn't case-sensitive. </p>
 */
@property (nonatomic, strong) NSString * _Nullable dbiResourceId;

/**
 <p>A filter that specifies which resources to return based on status.</p><p>Supported filters are the following:</p><ul><li><p><code>status</code></p><ul><li><p><code>active</code> - automated backups for current instances</p></li><li><p><code>retained</code> - automated backups for deleted instances</p></li><li><p><code>creating</code> - automated backups that are waiting for the first automated snapshot to be available</p></li></ul></li><li><p><code>db-instance-id</code> - Accepts DB instance identifiers and Amazon Resource Names (ARNs) for DB instances. The results list includes only information about the DB instance automated backupss identified by these ARNs.</p></li><li><p><code>dbi-resource-id</code> - Accepts DB instance resource identifiers and DB Amazon Resource Names (ARNs) for DB instances. The results list includes only information about the DB instance resources identified by these ARNs.</p></li></ul><p>Returns all resources by default. The status for each resource is specified in the response.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p>The pagination token provided in the previous request. If this parameter is specified the response includes only records beyond the marker, up to <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that you can retrieve the remaining results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p/>
 */
@interface AWSrdsDescribeDBInstancesMessage : AWSRequest


/**
 <p>The user-supplied instance identifier. If this parameter is specified, information from only the specific DB instance is returned. This parameter isn't case-sensitive.</p><p>Constraints:</p><ul><li><p>If supplied, must match the identifier of an existing DBInstance.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p>A filter that specifies one or more DB instances to describe.</p><p>Supported filters:</p><ul><li><p><code>db-cluster-id</code> - Accepts DB cluster identifiers and DB cluster Amazon Resource Names (ARNs). The results list will only include information about the DB instances associated with the DB clusters identified by these ARNs.</p></li><li><p><code>db-instance-id</code> - Accepts DB instance identifiers and DB instance Amazon Resource Names (ARNs). The results list will only include information about the DB instances identified by these ARNs.</p></li><li><p><code>dbi-resource-id</code> - Accepts DB instance resource identifiers. The results list will only include information about the DB instances identified by these DB instance resource identifiers.</p></li><li><p><code>domain</code> - Accepts Active Directory directory IDs. The results list will only include information about the DB instances associated with these domains.</p></li><li><p><code>engine</code> - Accepts engine names. The results list will only include information about the DB instances for these engines.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous <code>DescribeDBInstances</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p>This data type is used as a response element to <code>DescribeDBLogFiles</code>.</p>
 */
@interface AWSrdsDescribeDBLogFilesDetails : AWSModel


/**
 <p>A POSIX timestamp when the last log entry was written.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lastWritten;

/**
 <p>The name of the log file for the specified DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logFileName;

/**
 <p>The size, in bytes, of the log file for the specified DB instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable size;

@end

/**
 <p/>
 Required parameters: [DBInstanceIdentifier]
 */
@interface AWSrdsDescribeDBLogFilesMessage : AWSRequest


/**
 <p>The customer-assigned name of the DB instance that contains the log files you want to list.</p><p>Constraints:</p><ul><li><p>Must match the identifier of an existing DBInstance.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p>Filters the available log files for files written since the specified date, in POSIX timestamp format with milliseconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fileLastWritten;

/**
 <p>Filters the available log files for files larger than the specified size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fileSize;

/**
 <p>Filters the available log files for log file names that contain the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filenameContains;

/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p>The pagination token provided in the previous request. If this parameter is specified the response includes only records beyond the marker, up to MaxRecords.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a pagination token called a marker is included in the response so you can retrieve the remaining results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p> The response from a call to <code>DescribeDBLogFiles</code>. </p>
 */
@interface AWSrdsDescribeDBLogFilesResponse : AWSModel


/**
 <p>The DB log files returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDescribeDBLogFilesDetails *> * _Nullable describeDBLogFiles;

/**
 <p>A pagination token that can be used in a later DescribeDBLogFiles request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p/>
 */
@interface AWSrdsDescribeDBParameterGroupsMessage : AWSRequest


/**
 <p>The name of a specific DB parameter group to return details for.</p><p>Constraints:</p><ul><li><p>If supplied, must match the name of an existing DBClusterParameterGroup.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupName;

/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous <code>DescribeDBParameterGroups</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 
 */
@interface AWSrdsDescribeDBParametersMessage : AWSRequest


/**
 <p>The name of a specific DB parameter group to return details for.</p><p>Constraints:</p><ul><li><p>If supplied, must match the name of an existing DBParameterGroup.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupName;

/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous <code>DescribeDBParameters</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The parameter types to return.</p><p>Default: All parameter types returned</p><p>Valid Values: <code>user | system | engine-default</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable source;

@end

/**
 
 */
@interface AWSrdsDescribeDBProxiesRequest : AWSRequest


/**
 <p>The name of the DB proxy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBProxyName;

/**
 <p>This parameter is not currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that the remaining results can be retrieved. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 
 */
@interface AWSrdsDescribeDBProxiesResponse : AWSModel


/**
 <p>A return value representing an arbitrary number of <code>DBProxy</code> data structures.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBProxy *> * _Nullable DBProxies;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSrdsDescribeDBProxyTargetGroupsRequest : AWSRequest


/**
 <p>The identifier of the <code>DBProxy</code> associated with the target group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBProxyName;

/**
 <p>This parameter is not currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that the remaining results can be retrieved. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The identifier of the <code>DBProxyTargetGroup</code> to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetGroupName;

@end

/**
 
 */
@interface AWSrdsDescribeDBProxyTargetGroupsResponse : AWSModel


/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>An arbitrary number of <code>DBProxyTargetGroup</code> objects, containing details of the corresponding target groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBProxyTargetGroup *> * _Nullable targetGroups;

@end

/**
 
 */
@interface AWSrdsDescribeDBProxyTargetsRequest : AWSRequest


/**
 <p>The identifier of the <code>DBProxyTarget</code> to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBProxyName;

/**
 <p>This parameter is not currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that the remaining results can be retrieved. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The identifier of the <code>DBProxyTargetGroup</code> to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetGroupName;

@end

/**
 
 */
@interface AWSrdsDescribeDBProxyTargetsResponse : AWSModel


/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>An arbitrary number of <code>DBProxyTarget</code> objects, containing details of the corresponding targets.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBProxyTarget *> * _Nullable targets;

@end

/**
 <p/>
 */
@interface AWSrdsDescribeDBSecurityGroupsMessage : AWSRequest


/**
 <p>The name of the DB security group to return details for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSecurityGroupName;

/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous <code>DescribeDBSecurityGroups</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p/>
 Required parameters: [DBSnapshotIdentifier]
 */
@interface AWSrdsDescribeDBSnapshotAttributesMessage : AWSRequest


/**
 <p>The identifier for the DB snapshot to describe the attributes for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSnapshotIdentifier;

@end

/**
 
 */
@interface AWSrdsDescribeDBSnapshotAttributesResult : AWSModel


/**
 <p>Contains the results of a successful call to the <code>DescribeDBSnapshotAttributes</code> API action.</p><p>Manual DB snapshot attributes are used to authorize other AWS accounts to copy or restore a manual DB snapshot. For more information, see the <code>ModifyDBSnapshotAttribute</code> API action.</p>
 */
@property (nonatomic, strong) AWSrdsDBSnapshotAttributesResult * _Nullable DBSnapshotAttributesResult;

@end

/**
 <p/>
 */
@interface AWSrdsDescribeDBSnapshotsMessage : AWSRequest


/**
 <p>The ID of the DB instance to retrieve the list of DB snapshots for. This parameter can't be used in conjunction with <code>DBSnapshotIdentifier</code>. This parameter isn't case-sensitive. </p><p>Constraints:</p><ul><li><p>If supplied, must match the identifier of an existing DBInstance.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p> A specific DB snapshot identifier to describe. This parameter can't be used in conjunction with <code>DBInstanceIdentifier</code>. This value is stored as a lowercase string. </p><p>Constraints:</p><ul><li><p>If supplied, must match the identifier of an existing DBSnapshot.</p></li><li><p>If this identifier is for an automated snapshot, the <code>SnapshotType</code> parameter must also be specified.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBSnapshotIdentifier;

/**
 <p>A specific DB resource ID to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dbiResourceId;

/**
 <p>A filter that specifies one or more DB snapshots to describe.</p><p>Supported filters:</p><ul><li><p><code>db-instance-id</code> - Accepts DB instance identifiers and DB instance Amazon Resource Names (ARNs).</p></li><li><p><code>db-snapshot-id</code> - Accepts DB snapshot identifiers.</p></li><li><p><code>dbi-resource-id</code> - Accepts identifiers of source DB instances.</p></li><li><p><code>snapshot-type</code> - Accepts types of DB snapshots.</p></li><li><p><code>engine</code> - Accepts names of database engines.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p>A value that indicates whether to include manual DB cluster snapshots that are public and can be copied or restored by any AWS account. By default, the public snapshots are not included.</p><p>You can share a manual DB snapshot as public by using the <a>ModifyDBSnapshotAttribute</a> API.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includePublic;

/**
 <p>A value that indicates whether to include shared manual DB cluster snapshots from other AWS accounts that this AWS account has been given permission to copy or restore. By default, these snapshots are not included.</p><p>You can give an AWS account permission to restore a manual DB snapshot from another AWS account by using the <code>ModifyDBSnapshotAttribute</code> API action.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeShared;

/**
 <p> An optional pagination token provided by a previous <code>DescribeDBSnapshots</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The type of snapshots to be returned. You can specify one of the following values:</p><ul><li><p><code>automated</code> - Return all DB snapshots that have been automatically taken by Amazon RDS for my AWS account.</p></li><li><p><code>manual</code> - Return all DB snapshots that have been taken by my AWS account.</p></li><li><p><code>shared</code> - Return all manual DB snapshots that have been shared to my AWS account.</p></li><li><p><code>public</code> - Return all DB snapshots that have been marked as public.</p></li><li><p><code>awsbackup</code> - Return the DB snapshots managed by the AWS Backup service.</p><p>For information about AWS Backup, see the <a href="https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html"><i>AWS Backup Developer Guide.</i></a></p><p>The <code>awsbackup</code> type does not apply to Aurora.</p></li></ul><p>If you don't specify a <code>SnapshotType</code> value, then both automated and manual snapshots are returned. Shared and public DB snapshots are not included in the returned results by default. You can include shared snapshots with these results by enabling the <code>IncludeShared</code> parameter. You can include public snapshots with these results by enabling the <code>IncludePublic</code> parameter.</p><p>The <code>IncludeShared</code> and <code>IncludePublic</code> parameters don't apply for <code>SnapshotType</code> values of <code>manual</code> or <code>automated</code>. The <code>IncludePublic</code> parameter doesn't apply when <code>SnapshotType</code> is set to <code>shared</code>. The <code>IncludeShared</code> parameter doesn't apply when <code>SnapshotType</code> is set to <code>public</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotType;

@end

/**
 <p/>
 */
@interface AWSrdsDescribeDBSubnetGroupsMessage : AWSRequest


/**
 <p>The name of the DB subnet group to return details for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroupName;

/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous DescribeDBSubnetGroups request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p/>
 Required parameters: [DBParameterGroupFamily]
 */
@interface AWSrdsDescribeEngineDefaultClusterParametersMessage : AWSRequest


/**
 <p>The name of the DB cluster parameter group family to return engine parameter information for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupFamily;

/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous <code>DescribeEngineDefaultClusterParameters</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 
 */
@interface AWSrdsDescribeEngineDefaultClusterParametersResult : AWSModel


/**
 <p> Contains the result of a successful invocation of the <code>DescribeEngineDefaultParameters</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsEngineDefaults * _Nullable engineDefaults;

@end

/**
 <p/>
 Required parameters: [DBParameterGroupFamily]
 */
@interface AWSrdsDescribeEngineDefaultParametersMessage : AWSRequest


/**
 <p>The name of the DB parameter group family.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupFamily;

/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous <code>DescribeEngineDefaultParameters</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 
 */
@interface AWSrdsDescribeEngineDefaultParametersResult : AWSModel


/**
 <p> Contains the result of a successful invocation of the <code>DescribeEngineDefaultParameters</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsEngineDefaults * _Nullable engineDefaults;

@end

/**
 <p/>
 */
@interface AWSrdsDescribeEventCategoriesMessage : AWSRequest


/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p>The type of source that is generating the events.</p><p>Valid values: db-instance | db-parameter-group | db-security-group | db-snapshot</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

@end

/**
 <p/>
 */
@interface AWSrdsDescribeEventSubscriptionsMessage : AWSRequest


/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous DescribeOrderableDBInstanceOptions request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code> . </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The name of the RDS event notification subscription you want to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionName;

@end

/**
 <p/>
 */
@interface AWSrdsDescribeEventsMessage : AWSRequest


/**
 <p>The number of minutes to retrieve events for.</p><p>Default: 60</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p> The end of the time interval for which to retrieve events, specified in ISO 8601 format. For more information about ISO 8601, go to the <a href="http://en.wikipedia.org/wiki/ISO_8601">ISO8601 Wikipedia page.</a></p><p>Example: 2009-07-08T18:00Z</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>A list of event categories that trigger notifications for a event notification subscription.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventCategories;

/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous DescribeEvents request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The identifier of the event source for which events are returned. If not specified, then all sources are included in the response.</p><p>Constraints:</p><ul><li><p>If SourceIdentifier is supplied, SourceType must also be provided.</p></li><li><p>If the source type is <code>DBInstance</code>, then a <code>DBInstanceIdentifier</code> must be supplied.</p></li><li><p>If the source type is <code>DBSecurityGroup</code>, a <code>DBSecurityGroupName</code> must be supplied.</p></li><li><p>If the source type is <code>DBParameterGroup</code>, a <code>DBParameterGroupName</code> must be supplied.</p></li><li><p>If the source type is <code>DBSnapshot</code>, a <code>DBSnapshotIdentifier</code> must be supplied.</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable sourceIdentifier;

/**
 <p>The event source to retrieve events for. If no value is specified, all events are returned.</p>
 */
@property (nonatomic, assign) AWSrdsSourceType sourceType;

/**
 <p> The beginning of the time interval to retrieve events for, specified in ISO 8601 format. For more information about ISO 8601, go to the <a href="http://en.wikipedia.org/wiki/ISO_8601">ISO8601 Wikipedia page.</a></p><p>Example: 2009-07-08T18:00Z</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 
 */
@interface AWSrdsDescribeExportTasksMessage : AWSRequest


/**
 <p>The identifier of the snapshot export task to be described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exportTaskIdentifier;

/**
 <p>Filters specify one or more snapshot exports to describe. The filters are specified as name-value pairs that define what to include in the output.</p><p>Supported filters include the following: </p><ul><li><p><code>export-task-identifier</code> - An identifier for the snapshot export task.</p></li><li><p><code>s3-bucket</code> - The Amazon S3 bucket the snapshot is exported to.</p></li><li><p><code>source-arn</code> - The Amazon Resource Name (ARN) of the snapshot exported to Amazon S3</p></li><li><p><code>status</code> - The status of the export task.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous <code>DescribeExportTasks</code> request. If you specify this parameter, the response includes only records beyond the marker, up to the value specified by the <code>MaxRecords</code> parameter. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified value, a pagination token called a marker is included in the response. You can use the marker in a later <code>DescribeExportTasks</code> request to retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The Amazon Resource Name (ARN) of the snapshot exported to Amazon S3.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

@end

/**
 
 */
@interface AWSrdsDescribeGlobalClustersMessage : AWSRequest


/**
 <p>A filter that specifies one or more global DB clusters to describe.</p><p>Supported filters:</p><ul><li><p><code>db-cluster-id</code> - Accepts DB cluster identifiers and DB cluster Amazon Resource Names (ARNs). The results list will only include information about the DB clusters identified by these ARNs.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> The user-supplied DB cluster identifier. If this parameter is specified, information from only the specific DB cluster is returned. This parameter isn't case-sensitive. </p><p>Constraints:</p><ul><li><p>If supplied, must match an existing DBClusterIdentifier.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable globalClusterIdentifier;

/**
 <p> An optional pagination token provided by a previous <code>DescribeGlobalClusters</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 
 */
@interface AWSrdsDescribeInstallationMediaMessage : AWSRequest


/**
 <p>A filter that specifies one or more installation media to describe. Supported filters include the following:</p><ul><li><p><code>custom-availability-zone-id</code> - Accepts custom Availability Zone (AZ) identifiers. The results list includes information about only the custom AZs identified by these identifiers.</p></li><li><p><code>engine</code> - Accepts database engines. The results list includes information about only the database engines identified by these identifiers.</p><p>For more information about the valid engines for installation media, see <a>ImportInstallationMedia</a>.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p>The installation medium ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable installationMediaId;

/**
 <p>An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>An optional pagination token provided by a previous DescribeInstallationMedia request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p/>
 Required parameters: [EngineName]
 */
@interface AWSrdsDescribeOptionGroupOptionsMessage : AWSRequest


/**
 <p>A required parameter. Options available for the given engine name are described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineName;

/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p>If specified, filters the results to include only options for the specified major engine version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable majorEngineVersion;

/**
 <p>An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p/>
 */
@interface AWSrdsDescribeOptionGroupsMessage : AWSRequest


/**
 <p>Filters the list of option groups to only include groups associated with a specific database engine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineName;

/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p>Filters the list of option groups to only include groups associated with a specific database engine version. If specified, then EngineName must also be specified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable majorEngineVersion;

/**
 <p> An optional pagination token provided by a previous DescribeOptionGroups request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The name of the option group to describe. Can't be supplied together with EngineName or MajorEngineVersion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

@end

/**
 <p/>
 Required parameters: [Engine]
 */
@interface AWSrdsDescribeOrderableDBInstanceOptionsMessage : AWSRequest


/**
 <p>The DB instance class filter value. Specify this parameter to show only the available offerings matching the specified DB instance class.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceClass;

/**
 <p>The name of the engine to retrieve DB instance options for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The engine version filter value. Specify this parameter to show only the available offerings matching the specified engine version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p>The license model filter value. Specify this parameter to show only the available offerings matching the specified license model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable licenseModel;

/**
 <p> An optional pagination token provided by a previous DescribeOrderableDBInstanceOptions request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code> . </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>A value that indicates whether to show only VPC or non-VPC offerings.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable vpc;

@end

/**
 <p/>
 */
@interface AWSrdsDescribePendingMaintenanceActionsMessage : AWSRequest


/**
 <p>A filter that specifies one or more resources to return pending maintenance actions for.</p><p>Supported filters:</p><ul><li><p><code>db-cluster-id</code> - Accepts DB cluster identifiers and DB cluster Amazon Resource Names (ARNs). The results list will only include pending maintenance actions for the DB clusters identified by these ARNs.</p></li><li><p><code>db-instance-id</code> - Accepts DB instance identifiers and DB instance ARNs. The results list will only include pending maintenance actions for the DB instances identified by these ARNs.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous <code>DescribePendingMaintenanceActions</code> request. If this parameter is specified, the response includes only records beyond the marker, up to a number of records specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The ARN of a resource to return pending maintenance actions for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceIdentifier;

@end

/**
 <p/>
 */
@interface AWSrdsDescribeReservedDBInstancesMessage : AWSRequest


/**
 <p>The DB instance class filter value. Specify this parameter to show only those reservations matching the specified DB instances class.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceClass;

/**
 <p>The duration filter value, specified in years or seconds. Specify this parameter to show only reservations for this duration.</p><p>Valid Values: <code>1 | 3 | 31536000 | 94608000</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable duration;

/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p>The lease identifier filter value. Specify this parameter to show only the reservation that matches the specified lease ID.</p><note><p>AWS Support might request the lease ID for an issue related to a reserved DB instance.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable leaseId;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more than the <code>MaxRecords</code> value is available, a pagination token called a marker is included in the response so you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>A value that indicates whether to show only those reservations that support Multi-AZ.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiAZ;

/**
 <p>The offering type filter value. Specify this parameter to show only the available offerings matching the specified offering type.</p><p>Valid Values: <code>"Partial Upfront" | "All Upfront" | "No Upfront" </code></p>
 */
@property (nonatomic, strong) NSString * _Nullable offeringType;

/**
 <p>The product description filter value. Specify this parameter to show only those reservations matching the specified product description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productDescription;

/**
 <p>The reserved DB instance identifier filter value. Specify this parameter to show only the reservation that matches the specified reservation ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedDBInstanceId;

/**
 <p>The offering identifier filter value. Specify this parameter to show only purchased reservations matching the specified offering identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedDBInstancesOfferingId;

@end

/**
 <p/>
 */
@interface AWSrdsDescribeReservedDBInstancesOfferingsMessage : AWSRequest


/**
 <p>The DB instance class filter value. Specify this parameter to show only the available offerings matching the specified DB instance class.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceClass;

/**
 <p>Duration filter value, specified in years or seconds. Specify this parameter to show only reservations for this duration.</p><p>Valid Values: <code>1 | 3 | 31536000 | 94608000</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable duration;

/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more than the <code>MaxRecords</code> value is available, a pagination token called a marker is included in the response so you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>A value that indicates whether to show only those reservations that support Multi-AZ.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiAZ;

/**
 <p>The offering type filter value. Specify this parameter to show only the available offerings matching the specified offering type.</p><p>Valid Values: <code>"Partial Upfront" | "All Upfront" | "No Upfront" </code></p>
 */
@property (nonatomic, strong) NSString * _Nullable offeringType;

/**
 <p>Product description filter value. Specify this parameter to show only the available offerings that contain the specified product description.</p><note><p>The results show offerings that partially match the filter value.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable productDescription;

/**
 <p>The offering identifier filter value. Specify this parameter to show only the available offering that matches the specified reservation identifier.</p><p>Example: <code>438012d3-4052-4cc7-b2e3-8d3372e0e706</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedDBInstancesOfferingId;

@end

/**
 <p/>
 */
@interface AWSrdsDescribeSourceRegionsMessage : AWSRequest


/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p>An optional pagination token provided by a previous <code>DescribeSourceRegions</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so you can retrieve the remaining results. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The source AWS Region name. For example, <code>us-east-1</code>.</p><p>Constraints:</p><ul><li><p>Must specify a valid AWS Region name.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable regionName;

@end

/**
 <p/>
 Required parameters: [DBInstanceIdentifier]
 */
@interface AWSrdsDescribeValidDBInstanceModificationsMessage : AWSRequest


/**
 <p>The customer identifier or the ARN of your DB instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

@end

/**
 
 */
@interface AWSrdsDescribeValidDBInstanceModificationsResult : AWSModel


/**
 <p>Information about valid modifications that you can make to your DB instance. Contains the result of a successful call to the <code>DescribeValidDBInstanceModifications</code> action. You can use this information when you call <code>ModifyDBInstance</code>. </p>
 */
@property (nonatomic, strong) AWSrdsValidDBInstanceModificationsMessage * _Nullable validDBInstanceModificationsMessage;

@end

/**
 <p>An Active Directory Domain membership record associated with the DB instance or cluster.</p>
 */
@interface AWSrdsDomainMembership : AWSModel


/**
 <p>The identifier of the Active Directory Domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

/**
 <p>The fully qualified domain name of the Active Directory Domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable FQDN;

/**
 <p>The name of the IAM role to be used when making API calls to the Directory Service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable IAMRoleName;

/**
 <p>The status of the Active Directory Domain membership for the DB instance or cluster. Values include joined, pending-join, failed, and so on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>A range of double values.</p>
 */
@interface AWSrdsDoubleRange : AWSModel


/**
 <p>The minimum value in the range.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable from;

/**
 <p>The maximum value in the range.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable to;

@end

/**
 <p>This data type is used as a response element to <code>DownloadDBLogFilePortion</code>.</p>
 */
@interface AWSrdsDownloadDBLogFilePortionDetails : AWSModel


/**
 <p>Boolean value that if true, indicates there is more data to be downloaded.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable additionalDataPending;

/**
 <p>Entries from the specified log file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logFileData;

/**
 <p>A pagination token that can be used in a later DownloadDBLogFilePortion request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p/>
 Required parameters: [DBInstanceIdentifier, LogFileName]
 */
@interface AWSrdsDownloadDBLogFilePortionMessage : AWSRequest


/**
 <p>The customer-assigned name of the DB instance that contains the log files you want to list.</p><p>Constraints:</p><ul><li><p>Must match the identifier of an existing DBInstance.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p>The name of the log file to be downloaded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logFileName;

/**
 <p>The pagination token provided in the previous request or "0". If the Marker parameter is specified the response includes only records beyond the marker until the end of the file or up to NumberOfLines.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The number of lines to download. If the number of lines specified results in a file over 1 MB in size, the file is truncated at 1 MB in size.</p><p>If the NumberOfLines parameter is specified, then the block of lines returned can be from the beginning or the end of the log file, depending on the value of the Marker parameter.</p><ul><li><p>If neither Marker or NumberOfLines are specified, the entire log file is returned up to a maximum of 10000 lines, starting with the most recent log entries first.</p></li><li><p>If NumberOfLines is specified and Marker isn't specified, then the most recent lines from the end of the log file are returned.</p></li><li><p>If Marker is specified as "0", then the specified number of lines from the beginning of the log file are returned.</p></li><li><p>You can download the log file in blocks of lines by specifying the size of the block using the NumberOfLines parameter, and by specifying a value of "0" for the Marker parameter in your first request. Include the Marker value returned in the response as the Marker value for the next request, continuing until the AdditionalDataPending response element returns false.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfLines;

@end

/**
 <p>This data type is used as a response element in the following actions:</p><ul><li><p><code>AuthorizeDBSecurityGroupIngress</code></p></li><li><p><code>DescribeDBSecurityGroups</code></p></li><li><p><code>RevokeDBSecurityGroupIngress</code></p></li></ul>
 */
@interface AWSrdsEC2SecurityGroup : AWSModel


/**
 <p>Specifies the id of the EC2 security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupId;

/**
 <p>Specifies the name of the EC2 security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupName;

/**
 <p> Specifies the AWS ID of the owner of the EC2 security group specified in the <code>EC2SecurityGroupName</code> field. </p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupOwnerId;

/**
 <p>Provides the status of the EC2 security group. Status can be "authorizing", "authorized", "revoking", and "revoked".</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>This data type represents the information you need to connect to an Amazon RDS DB instance. This data type is used as a response element in the following actions:</p><ul><li><p><code>CreateDBInstance</code></p></li><li><p><code>DescribeDBInstances</code></p></li><li><p><code>DeleteDBInstance</code></p></li></ul><p>For the data structure that represents Amazon Aurora DB cluster endpoints, see <code>DBClusterEndpoint</code>.</p>
 */
@interface AWSrdsEndpoint : AWSModel


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
 <p> Contains the result of a successful invocation of the <code>DescribeEngineDefaultParameters</code> action. </p>
 */
@interface AWSrdsEngineDefaults : AWSModel


/**
 <p>Specifies the name of the DB parameter group family that the engine default parameters apply to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupFamily;

/**
 <p> An optional pagination token provided by a previous EngineDefaults request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code> . </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Contains a list of engine default parameters.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsParameter *> * _Nullable parameters;

@end

/**
 <p> This data type is used as a response element in the <code>DescribeEvents</code> action. </p>
 */
@interface AWSrdsEvent : AWSModel


/**
 <p>Specifies the date and time of the event.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable date;

/**
 <p>Specifies the category for the event.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventCategories;

/**
 <p>Provides the text of this event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The Amazon Resource Name (ARN) for the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 <p>Provides the identifier for the source of the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceIdentifier;

/**
 <p>Specifies the source type for this event.</p>
 */
@property (nonatomic, assign) AWSrdsSourceType sourceType;

@end

/**
 <p>Contains the results of a successful invocation of the <code>DescribeEventCategories</code> action.</p>
 */
@interface AWSrdsEventCategoriesMap : AWSModel


/**
 <p>The event categories for the specified source type</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventCategories;

/**
 <p>The source type that the returned categories belong to</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

@end

/**
 <p>Data returned from the <b>DescribeEventCategories</b> action.</p>
 */
@interface AWSrdsEventCategoriesMessage : AWSModel


/**
 <p>A list of EventCategoriesMap data types.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsEventCategoriesMap *> * _Nullable eventCategoriesMapList;

@end

/**
 <p>Contains the results of a successful invocation of the <code>DescribeEventSubscriptions</code> action.</p>
 */
@interface AWSrdsEventSubscription : AWSModel


/**
 <p>The RDS event notification subscription Id.</p>
 */
@property (nonatomic, strong) NSString * _Nullable custSubscriptionId;

/**
 <p>The AWS customer account associated with the RDS event notification subscription.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerAwsId;

/**
 <p>A Boolean value indicating if the subscription is enabled. True indicates the subscription is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>A list of event categories for the RDS event notification subscription.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventCategoriesList;

/**
 <p>The Amazon Resource Name (ARN) for the event subscription.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventSubscriptionArn;

/**
 <p>The topic ARN of the RDS event notification subscription.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snsTopicArn;

/**
 <p>A list of source IDs for the RDS event notification subscription.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sourceIdsList;

/**
 <p>The source type for the RDS event notification subscription.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

/**
 <p>The status of the RDS event notification subscription.</p><p>Constraints:</p><p>Can be one of the following: creating | modifying | deleting | active | no-permission | topic-not-exist</p><p>The status "no-permission" indicates that RDS no longer has permission to post to the SNS topic. The status "topic-not-exist" indicates that the topic was deleted after the subscription was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The time the RDS event notification subscription was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionCreationTime;

@end

/**
 <p>Data returned by the <b>DescribeEventSubscriptions</b> action.</p>
 */
@interface AWSrdsEventSubscriptionsMessage : AWSModel


/**
 <p>A list of EventSubscriptions data types.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsEventSubscription *> * _Nullable eventSubscriptionsList;

/**
 <p> An optional pagination token provided by a previous DescribeOrderableDBInstanceOptions request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p> Contains the result of a successful invocation of the <code>DescribeEvents</code> action. </p>
 */
@interface AWSrdsEventsMessage : AWSModel


/**
 <p> A list of <code>Event</code> instances. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsEvent *> * _Nullable events;

/**
 <p> An optional pagination token provided by a previous Events request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code> . </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>Contains the details of a snapshot export to Amazon S3. </p><p>This data type is used as a response element in the <code>DescribeExportTasks</code> action. </p>
 */
@interface AWSrdsExportTask : AWSModel


/**
 <p>The data exported from the snapshot. Valid values are the following:</p><ul><li><p><code>database</code> - Export all the data from a specified database.</p></li><li><p><code>database.table</code><i>table-name</i> - Export a table of the snapshot. This format is valid only for RDS for MySQL, RDS for MariaDB, and Aurora MySQL.</p></li><li><p><code>database.schema</code><i>schema-name</i> - Export a database schema of the snapshot. This format is valid only for RDS for PostgreSQL and Aurora PostgreSQL.</p></li><li><p><code>database.schema.table</code><i>table-name</i> - Export a table of the database schema. This format is valid only for RDS for PostgreSQL and Aurora PostgreSQL.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable exportOnly;

/**
 <p>A unique identifier for the snapshot export task. This ID isn't an identifier for the Amazon S3 bucket where the snapshot is exported to. </p>
 */
@property (nonatomic, strong) NSString * _Nullable exportTaskIdentifier;

/**
 <p>The reason the export failed, if it failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureCause;

/**
 <p>The name of the IAM role that is used to write to Amazon S3 when exporting a snapshot. </p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRoleArn;

/**
 <p>The ID of the AWS KMS key that is used to encrypt the snapshot when it's exported to Amazon S3. The KMS key ID is the Amazon Resource Name (ARN), the KMS key identifier, or the KMS key alias for the KMS encryption key. The IAM role used for the snapshot export must have encryption and decryption permissions to use this KMS key. </p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The progress of the snapshot export task as a percentage.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable percentProgress;

/**
 <p>The Amazon S3 bucket that the snapshot is exported to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

/**
 <p>The Amazon S3 bucket prefix that is the file name and path of the exported snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Prefix;

/**
 <p>The time that the snapshot was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable snapshotTime;

/**
 <p>The Amazon Resource Name (ARN) of the snapshot exported to Amazon S3.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 <p>The progress status of the export task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The time that the snapshot export task completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable taskEndTime;

/**
 <p>The time that the snapshot export task started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable taskStartTime;

/**
 <p>The total amount of data exported, in gigabytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalExtractedDataInGB;

/**
 <p>A warning about the snapshot export task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable warningMessage;

@end

/**
 
 */
@interface AWSrdsExportTasksMessage : AWSModel


/**
 <p>Information about an export of a snapshot to Amazon S3.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsExportTask *> * _Nullable exportTasks;

/**
 <p>A pagination token that can be used in a later <code>DescribeExportTasks</code> request. A marker is used for pagination to identify the location to begin output for the next response of <code>DescribeExportTasks</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p/>
 Required parameters: [DBClusterIdentifier]
 */
@interface AWSrdsFailoverDBClusterMessage : AWSRequest


/**
 <p>A DB cluster identifier to force a failover for. This parameter isn't case-sensitive.</p><p>Constraints:</p><ul><li><p>Must match the identifier of an existing DBCluster.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>The name of the instance to promote to the primary instance.</p><p>You must specify the instance identifier for an Aurora Replica in the DB cluster. For example, <code>mydbcluster-replica1</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetDBInstanceIdentifier;

@end

/**
 
 */
@interface AWSrdsFailoverDBClusterResult : AWSModel


/**
 <p>Contains the details of an Amazon Aurora DB cluster. </p><p>This data type is used as a response element in the <code>DescribeDBClusters</code>, <code>StopDBCluster</code>, and <code>StartDBCluster</code> actions. </p>
 */
@property (nonatomic, strong) AWSrdsDBCluster * _Nullable DBCluster;

@end

/**
 <p>A filter name and value pair that is used to return a more specific list of results from a describe operation. Filters can be used to match a set of resources by specific criteria, such as IDs. The filters supported by a describe operation are documented with the describe operation.</p><note><p>Currently, wildcards are not supported in filters.</p></note><p>The following actions can be filtered:</p><ul><li><p><code>DescribeDBClusterBacktracks</code></p></li><li><p><code>DescribeDBClusterEndpoints</code></p></li><li><p><code>DescribeDBClusters</code></p></li><li><p><code>DescribeDBInstances</code></p></li><li><p><code>DescribePendingMaintenanceActions</code></p></li></ul>
 Required parameters: [Name, Values]
 */
@interface AWSrdsFilter : AWSModel


/**
 <p>The name of the filter. Filter names are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>One or more filter values. Filter values are case-sensitive.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>A data type representing an Aurora global database.</p>
 */
@interface AWSrdsGlobalCluster : AWSModel


/**
 <p> The default database name within the new global database cluster. </p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p> The deletion protection setting for the new global database cluster. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p> The Aurora database engine used by the global database cluster. </p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>Indicates the database engine version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The Amazon Resource Name (ARN) for the global database cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalClusterArn;

/**
 <p> Contains a user-supplied global database cluster identifier. This identifier is the unique key that identifies a global database cluster. </p>
 */
@property (nonatomic, strong) NSString * _Nullable globalClusterIdentifier;

/**
 <p> The list of cluster IDs for secondary clusters within the global database cluster. Currently limited to 1 item. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsGlobalClusterMember *> * _Nullable globalClusterMembers;

/**
 <p> The AWS Region-unique, immutable identifier for the global database cluster. This identifier is found in AWS CloudTrail log entries whenever the AWS KMS key for the DB cluster is accessed. </p>
 */
@property (nonatomic, strong) NSString * _Nullable globalClusterResourceId;

/**
 <p>Specifies the current state of this global database cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p> The storage encryption setting for the global database cluster. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable storageEncrypted;

@end

/**
 <p> A data structure with information about any primary and secondary clusters associated with an Aurora global database. </p>
 */
@interface AWSrdsGlobalClusterMember : AWSModel


/**
 <p> The Amazon Resource Name (ARN) for each Aurora cluster. </p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterArn;

/**
 <p> Specifies whether the Aurora cluster is the primary cluster (that is, has read-write capability) for the Aurora global database with which it is associated. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isWriter;

/**
 <p> The Amazon Resource Name (ARN) for each read-only secondary cluster associated with the Aurora global database. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable readers;

@end

/**
 
 */
@interface AWSrdsGlobalClustersMessage : AWSModel


/**
 <p> The list of global clusters returned by this request. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsGlobalCluster *> * _Nullable globalClusters;

/**
 <p> An optional pagination token provided by a previous <code>DescribeGlobalClusters</code> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p> This data type is used as a response element in the <code>DescribeDBSecurityGroups</code> action. </p>
 */
@interface AWSrdsIPRange : AWSModel


/**
 <p>Specifies the IP range.</p>
 */
@property (nonatomic, strong) NSString * _Nullable CIDRIP;

/**
 <p>Specifies the status of the IP range. Status can be "authorizing", "authorized", "revoking", and "revoked".</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 
 */
@interface AWSrdsImportInstallationMediaMessage : AWSRequest


/**
 <p>The identifier of the custom Availability Zone (AZ) to import the installation media to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customAvailabilityZoneId;

/**
 <p>The name of the database engine to be used for this instance. </p><p>The list only includes supported DB engines that require an on-premises customer provided license. </p><p>Valid Values: </p><ul><li><p><code>sqlserver-ee</code></p></li><li><p><code>sqlserver-se</code></p></li><li><p><code>sqlserver-ex</code></p></li><li><p><code>sqlserver-web</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The path to the installation medium for the specified DB engine.</p><p>Example: <code>SQLServerISO/en_sql_server_2016_enterprise_x64_dvd_8701793.iso</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable engineInstallationMediaPath;

/**
 <p>The version number of the database engine to use.</p><p>For a list of valid engine versions, call <a>DescribeDBEngineVersions</a>.</p><p>The following are the database engines and links to information about the major and minor versions. The list only includes DB engines that require an on-premises customer provided license.</p><p><b>Microsoft SQL Server</b></p><p>See <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SQLServer.html#SQLServer.Concepts.General.FeatureSupport">Version and Feature Support on Amazon RDS</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The path to the installation medium for the operating system associated with the specified DB engine.</p><p>Example: <code>WindowsISO/en_windows_server_2016_x64_dvd_9327751.iso</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable OSInstallationMediaPath;

@end

/**
 <p>Contains the installation media for a DB engine that requires an on-premises customer provided license, such as Microsoft SQL Server.</p>
 */
@interface AWSrdsInstallationMedia : AWSModel


/**
 <p>The custom Availability Zone (AZ) that contains the installation media.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customAvailabilityZoneId;

/**
 <p>The DB engine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The path to the installation medium for the DB engine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineInstallationMediaPath;

/**
 <p>The engine version of the DB engine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>If an installation media failure occurred, the cause of the failure.</p>
 */
@property (nonatomic, strong) AWSrdsInstallationMediaFailureCause * _Nullable failureCause;

/**
 <p>The installation medium ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable installationMediaId;

/**
 <p>The path to the installation medium for the operating system associated with the DB engine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable OSInstallationMediaPath;

/**
 <p>The status of the installation medium.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Contains the cause of an installation media failure. Installation media is used for a DB engine that requires an on-premises customer provided license, such as Microsoft SQL Server.</p>
 */
@interface AWSrdsInstallationMediaFailureCause : AWSModel


/**
 <p>The reason that an installation media import failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 
 */
@interface AWSrdsInstallationMediaMessage : AWSModel


/**
 <p>The list of <a>InstallationMedia</a> objects for the AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsInstallationMedia *> * _Nullable installationMedia;

/**
 <p>An optional pagination token provided by a previous <a>DescribeInstallationMedia</a> request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p/>
 Required parameters: [ResourceName]
 */
@interface AWSrdsListTagsForResourceMessage : AWSRequest


/**
 <p>This parameter isn't currently supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsFilter *> * _Nullable filters;

/**
 <p>The Amazon RDS resource with tags to be listed. This value is an Amazon Resource Name (ARN). For information about creating an ARN, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing"> Constructing an ARN for Amazon RDS</a> in the <i>Amazon RDS User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

@end

/**
 <p>The minimum DB engine version required for each corresponding allowed value for an option setting.</p>
 */
@interface AWSrdsMinimumEngineVersionPerAllowedValue : AWSModel


/**
 <p>The allowed value for an option setting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable allowedValue;

/**
 <p>The minimum DB engine version required for the allowed value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable minimumEngineVersion;

@end

/**
 
 */
@interface AWSrdsModifyCertificatesMessage : AWSRequest


/**
 <p>The new default certificate identifier to override the current one with.</p><p>To determine the valid values, use the <code>describe-certificates</code> AWS CLI command or the <code>DescribeCertificates</code> API operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateIdentifier;

/**
 <p>A value that indicates whether to remove the override for the default certificate. If the override is removed, the default certificate is the system default.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable removeCustomerOverride;

@end

/**
 
 */
@interface AWSrdsModifyCertificatesResult : AWSModel


/**
 <p>A CA certificate for an AWS account.</p>
 */
@property (nonatomic, strong) AWSrdsCertificate * _Nullable certificate;

@end

/**
 
 */
@interface AWSrdsModifyCurrentDBClusterCapacityMessage : AWSRequest


/**
 <p>The DB cluster capacity.</p><p>When you change the capacity of a paused Aurora Serverless DB cluster, it automatically resumes.</p><p>Constraints:</p><ul><li><p>For Aurora MySQL, valid capacity values are <code>1</code>, <code>2</code>, <code>4</code>, <code>8</code>, <code>16</code>, <code>32</code>, <code>64</code>, <code>128</code>, and <code>256</code>.</p></li><li><p>For Aurora PostgreSQL, valid capacity values are <code>2</code>, <code>4</code>, <code>8</code>, <code>16</code>, <code>32</code>, <code>64</code>, <code>192</code>, and <code>384</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable capacity;

/**
 <p>The DB cluster identifier for the cluster being modified. This parameter isn't case-sensitive.</p><p>Constraints:</p><ul><li><p>Must match the identifier of an existing DB cluster.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>The amount of time, in seconds, that Aurora Serverless tries to find a scaling point to perform seamless scaling before enforcing the timeout action. The default is 300.</p><ul><li><p>Value must be from 10 through 600.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable secondsBeforeTimeout;

/**
 <p>The action to take when the timeout is reached, either <code>ForceApplyCapacityChange</code> or <code>RollbackCapacityChange</code>.</p><p><code>ForceApplyCapacityChange</code>, the default, sets the capacity to the specified value as soon as possible.</p><p><code>RollbackCapacityChange</code> ignores the capacity change if a scaling point isn't found in the timeout period.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timeoutAction;

@end

/**
 
 */
@interface AWSrdsModifyDBClusterEndpointMessage : AWSRequest


/**
 <p>The identifier of the endpoint to modify. This parameter is stored as a lowercase string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterEndpointIdentifier;

/**
 <p>The type of the endpoint. One of: <code>READER</code>, <code>WRITER</code>, <code>ANY</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointType;

/**
 <p>List of DB instance identifiers that aren't part of the custom endpoint group. All other eligible instances are reachable through the custom endpoint. Only relevant if the list of static members is empty.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable excludedMembers;

/**
 <p>List of DB instance identifiers that are part of the custom endpoint group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable staticMembers;

@end

/**
 <p/>
 Required parameters: [DBClusterIdentifier]
 */
@interface AWSrdsModifyDBClusterMessage : AWSRequest


/**
 <p>A value that indicates whether major version upgrades are allowed.</p><p>Constraints: You must allow major version upgrades when specifying a value for the <code>EngineVersion</code> parameter that is a different major version than the DB cluster's current version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowMajorVersionUpgrade;

/**
 <p>A value that indicates whether the modifications in this request and any pending modifications are asynchronously applied as soon as possible, regardless of the <code>PreferredMaintenanceWindow</code> setting for the DB cluster. If this parameter is disabled, changes to the DB cluster are applied during the next maintenance window.</p><p>The <code>ApplyImmediately</code> parameter only affects the <code>EnableIAMDatabaseAuthentication</code>, <code>MasterUserPassword</code>, and <code>NewDBClusterIdentifier</code> values. If the <code>ApplyImmediately</code> parameter is disabled, then changes to the <code>EnableIAMDatabaseAuthentication</code>, <code>MasterUserPassword</code>, and <code>NewDBClusterIdentifier</code> values are applied during the next maintenance window. All other changes are applied immediately, regardless of the value of the <code>ApplyImmediately</code> parameter.</p><p>By default, this parameter is disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyImmediately;

/**
 <p>The target backtrack window, in seconds. To disable backtracking, set this value to 0.</p><p>Default: 0</p><p>Constraints:</p><ul><li><p>If specified, this value must be set to a number from 0 to 259,200 (72 hours).</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable backtrackWindow;

/**
 <p>The number of days for which automated backups are retained. You must specify a minimum value of 1.</p><p>Default: 1</p><p>Constraints:</p><ul><li><p>Must be a value from 1 to 35</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupRetentionPeriod;

/**
 <p>The configuration setting for the log types to be enabled for export to CloudWatch Logs for a specific DB cluster.</p>
 */
@property (nonatomic, strong) AWSrdsCloudwatchLogsExportConfiguration * _Nullable cloudwatchLogsExportConfiguration;

/**
 <p>A value that indicates whether to copy all tags from the DB cluster to snapshots of the DB cluster. The default is not to copy them.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicateTagsToSnapshot;

/**
 <p>The DB cluster identifier for the cluster being modified. This parameter isn't case-sensitive.</p><p>Constraints: This identifier must match the identifier of an existing DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>The name of the DB cluster parameter group to use for the DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterParameterGroupName;

/**
 <p>The name of the DB parameter group to apply to all instances of the DB cluster. </p><note><p>When you apply a parameter group using the <code>DBInstanceParameterGroupName</code> parameter, the DB cluster isn't rebooted automatically. Also, parameter changes aren't applied during the next maintenance window but instead are applied immediately.</p></note><p>Default: The existing name setting</p><p>Constraints:</p><ul><li><p>The DB parameter group must be in the same DB parameter group family as this DB cluster.</p></li><li><p>The <code>DBInstanceParameterGroupName</code> parameter is only valid in combination with the <code>AllowMajorVersionUpgrade</code> parameter.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceParameterGroupName;

/**
 <p>A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p>The Active Directory directory ID to move the DB cluster to. Specify <code>none</code> to remove the cluster from its current domain. The domain must be created prior to this operation. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

/**
 <p>Specify the name of the IAM role to be used when making API calls to the Directory Service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainIAMRoleName;

/**
 <p>A value that indicates whether to enable the HTTP endpoint for an Aurora Serverless DB cluster. By default, the HTTP endpoint is disabled.</p><p>When enabled, the HTTP endpoint provides a connectionless web service API for running SQL queries on the Aurora Serverless DB cluster. You can also query your database from inside the RDS console with the query editor.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/data-api.html">Using the Data API for Aurora Serverless</a> in the <i>Amazon Aurora User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableHttpEndpoint;

/**
 <p>A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.html"> IAM Database Authentication</a> in the <i>Amazon Aurora User Guide.</i></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableIAMDatabaseAuthentication;

/**
 <p>The version number of the database engine to which you want to upgrade. Changing this parameter results in an outage. The change is applied during the next maintenance window unless <code>ApplyImmediately</code> is enabled.</p><p>To list all of the available engine versions for <code>aurora</code> (for MySQL 5.6-compatible Aurora), use the following command:</p><p><code>aws rds describe-db-engine-versions --engine aurora --query "DBEngineVersions[].EngineVersion"</code></p><p>To list all of the available engine versions for <code>aurora-mysql</code> (for MySQL 5.7-compatible Aurora), use the following command:</p><p><code>aws rds describe-db-engine-versions --engine aurora-mysql --query "DBEngineVersions[].EngineVersion"</code></p><p>To list all of the available engine versions for <code>aurora-postgresql</code>, use the following command:</p><p><code>aws rds describe-db-engine-versions --engine aurora-postgresql --query "DBEngineVersions[].EngineVersion"</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The new password for the master database user. This password can contain any printable ASCII character except "/", """, or "@".</p><p>Constraints: Must contain from 8 to 41 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUserPassword;

/**
 <p>The new DB cluster identifier for the DB cluster when renaming a DB cluster. This value is stored as a lowercase string.</p><p>Constraints:</p><ul><li><p>Must contain from 1 to 63 letters, numbers, or hyphens</p></li><li><p>The first character must be a letter</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens</p></li></ul><p>Example: <code>my-cluster2</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable latestDBClusterIdentifier;

/**
 <p>A value that indicates that the DB cluster should be associated with the specified option group. Changing this parameter doesn't result in an outage except in the following case, and the change is applied during the next maintenance window unless the <code>ApplyImmediately</code> is enabled for this request. If the parameter change results in an option group that enables OEM, this change can cause a brief (sub-second) period during which new connections are rejected but existing connections are not interrupted. </p><p>Permanent options can't be removed from an option group. The option group can't be removed from a DB cluster once it is associated with a DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

/**
 <p>The port number on which the DB cluster accepts connections.</p><p>Constraints: Value must be <code>1150-65535</code></p><p>Default: The same port as the original DB cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The daily time range during which automated backups are created if automated backups are enabled, using the <code>BackupRetentionPeriod</code> parameter. </p><p>The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region. To see the time blocks available, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow.Aurora"> Adjusting the Preferred DB Cluster Maintenance Window</a> in the <i>Amazon Aurora User Guide.</i></p><p>Constraints:</p><ul><li><p>Must be in the format <code>hh24:mi-hh24:mi</code>.</p></li><li><p>Must be in Universal Coordinated Time (UTC).</p></li><li><p>Must not conflict with the preferred maintenance window.</p></li><li><p>Must be at least 30 minutes.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable preferredBackupWindow;

/**
 <p>The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC).</p><p>Format: <code>ddd:hh24:mi-ddd:hh24:mi</code></p><p>The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region, occurring on a random day of the week. To see the time blocks available, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow.Aurora"> Adjusting the Preferred DB Cluster Maintenance Window</a> in the <i>Amazon Aurora User Guide.</i></p><p>Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.</p><p>Constraints: Minimum 30-minute window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>The scaling properties of the DB cluster. You can only modify scaling properties for DB clusters in <code>serverless</code> DB engine mode.</p>
 */
@property (nonatomic, strong) AWSrdsScalingConfiguration * _Nullable scalingConfiguration;

/**
 <p>A list of VPC security groups that the DB cluster will belong to.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSecurityGroupIds;

@end

/**
 <p/>
 Required parameters: [DBClusterParameterGroupName, Parameters]
 */
@interface AWSrdsModifyDBClusterParameterGroupMessage : AWSRequest


/**
 <p>The name of the DB cluster parameter group to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterParameterGroupName;

/**
 <p>A list of parameters in the DB cluster parameter group to modify.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsParameter *> * _Nullable parameters;

@end

/**
 
 */
@interface AWSrdsModifyDBClusterResult : AWSModel


/**
 <p>Contains the details of an Amazon Aurora DB cluster. </p><p>This data type is used as a response element in the <code>DescribeDBClusters</code>, <code>StopDBCluster</code>, and <code>StartDBCluster</code> actions. </p>
 */
@property (nonatomic, strong) AWSrdsDBCluster * _Nullable DBCluster;

@end

/**
 <p/>
 Required parameters: [DBClusterSnapshotIdentifier, AttributeName]
 */
@interface AWSrdsModifyDBClusterSnapshotAttributeMessage : AWSRequest


/**
 <p>The name of the DB cluster snapshot attribute to modify.</p><p>To manage authorization for other AWS accounts to copy or restore a manual DB cluster snapshot, set this value to <code>restore</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The identifier for the DB cluster snapshot to modify the attributes for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterSnapshotIdentifier;

/**
 <p>A list of DB cluster snapshot attributes to add to the attribute specified by <code>AttributeName</code>.</p><p>To authorize other AWS accounts to copy or restore a manual DB cluster snapshot, set this list to include one or more AWS account IDs, or <code>all</code> to make the manual DB cluster snapshot restorable by any AWS account. Do not add the <code>all</code> value for any manual DB cluster snapshots that contain private information that you don't want available to all AWS accounts.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable valuesToAdd;

/**
 <p>A list of DB cluster snapshot attributes to remove from the attribute specified by <code>AttributeName</code>.</p><p>To remove authorization for other AWS accounts to copy or restore a manual DB cluster snapshot, set this list to include one or more AWS account identifiers, or <code>all</code> to remove authorization for any AWS account to copy or restore the DB cluster snapshot. If you specify <code>all</code>, an AWS account whose account ID is explicitly added to the <code>restore</code> attribute can still copy or restore a manual DB cluster snapshot.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable valuesToRemove;

@end

/**
 
 */
@interface AWSrdsModifyDBClusterSnapshotAttributeResult : AWSModel


/**
 <p>Contains the results of a successful call to the <code>DescribeDBClusterSnapshotAttributes</code> API action.</p><p>Manual DB cluster snapshot attributes are used to authorize other AWS accounts to copy or restore a manual DB cluster snapshot. For more information, see the <code>ModifyDBClusterSnapshotAttribute</code> API action.</p>
 */
@property (nonatomic, strong) AWSrdsDBClusterSnapshotAttributesResult * _Nullable DBClusterSnapshotAttributesResult;

@end

/**
 <p/>
 Required parameters: [DBInstanceIdentifier]
 */
@interface AWSrdsModifyDBInstanceMessage : AWSRequest


/**
 <p>The new amount of storage (in gibibytes) to allocate for the DB instance. </p><p>For MariaDB, MySQL, Oracle, and PostgreSQL, the value supplied must be at least 10% greater than the current value. Values that are not at least 10% greater than the existing value are rounded up so that they are 10% greater than the current value. </p><p>For the valid values for allocated storage for each engine, see <code>CreateDBInstance</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedStorage;

/**
 <p>A value that indicates whether major version upgrades are allowed. Changing this parameter doesn't result in an outage and the change is asynchronously applied as soon as possible.</p><p>Constraints: Major version upgrades must be allowed when specifying a value for the EngineVersion parameter that is a different major version than the DB instance's current version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowMajorVersionUpgrade;

/**
 <p>A value that indicates whether the modifications in this request and any pending modifications are asynchronously applied as soon as possible, regardless of the <code>PreferredMaintenanceWindow</code> setting for the DB instance. By default, this parameter is disabled. </p><p> If this parameter is disabled, changes to the DB instance are applied during the next maintenance window. Some parameter changes can cause an outage and are applied on the next call to <a>RebootDBInstance</a>, or the next failure reboot. Review the table of parameters in <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.DBInstance.Modifying.html">Modifying a DB Instance</a> in the <i>Amazon RDS User Guide.</i> to see the impact of enabling or disabling <code>ApplyImmediately</code> for each modified parameter and to determine when the changes are applied. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyImmediately;

/**
 <p> A value that indicates whether minor version upgrades are applied automatically to the DB instance during the maintenance window. Changing this parameter doesn't result in an outage except in the following case and the change is asynchronously applied as soon as possible. An outage results if this parameter is enabled during the maintenance window, and a newer minor version is available, and RDS has enabled auto patching for that engine version. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoMinorVersionUpgrade;

/**
 <p>The number of days to retain automated backups. Setting this parameter to a positive number enables backups. Setting this parameter to 0 disables automated backups.</p><p>Changing this parameter can result in an outage if you change from 0 to a non-zero value or from a non-zero value to 0. These changes are applied during the next maintenance window unless the <code>ApplyImmediately</code> parameter is enabled for this request. If you change the parameter from one non-zero value to another non-zero value, the change is asynchronously applied as soon as possible.</p><p><b>Amazon Aurora</b></p><p>Not applicable. The retention period for automated backups is managed by the DB cluster. For more information, see <code>ModifyDBCluster</code>.</p><p>Default: Uses existing setting</p><p>Constraints:</p><ul><li><p>Must be a value from 0 to 35</p></li><li><p>Can be specified for a MySQL read replica only if the source is running MySQL 5.6 or later</p></li><li><p>Can be specified for a PostgreSQL read replica only if the source is running PostgreSQL 9.3.5</p></li><li><p>Can't be set to 0 if the DB instance is a source to read replicas</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupRetentionPeriod;

/**
 <p>Indicates the certificate that needs to be associated with the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable CACertificateIdentifier;

/**
 <p>A value that indicates whether the DB instance is restarted when you rotate your SSL/TLS certificate.</p><p>By default, the DB instance is restarted when you rotate your SSL/TLS certificate. The certificate is not updated until the DB instance is restarted.</p><important><p>Set this parameter only if you are <i>not</i> using SSL/TLS to connect to the DB instance.</p></important><p>If you are using SSL/TLS to connect to the DB instance, follow the appropriate instructions for your DB engine to rotate your SSL/TLS certificate:</p><ul><li><p>For more information about rotating your SSL/TLS certificate for RDS DB engines, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.SSL-certificate-rotation.html"> Rotating Your SSL/TLS Certificate.</a> in the <i>Amazon RDS User Guide.</i></p></li><li><p>For more information about rotating your SSL/TLS certificate for Aurora DB engines, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.SSL-certificate-rotation.html"> Rotating Your SSL/TLS Certificate</a> in the <i>Amazon Aurora User Guide.</i></p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable certificateRotationRestart;

/**
 <p>The configuration setting for the log types to be enabled for export to CloudWatch Logs for a specific DB instance.</p><p>A change to the <code>CloudwatchLogsExportConfiguration</code> parameter is always applied to the DB instance immediately. Therefore, the <code>ApplyImmediately</code> parameter has no effect.</p>
 */
@property (nonatomic, strong) AWSrdsCloudwatchLogsExportConfiguration * _Nullable cloudwatchLogsExportConfiguration;

/**
 <p>A value that indicates whether to copy all tags from the DB instance to snapshots of the DB instance. By default, tags are not copied.</p><p><b>Amazon Aurora</b></p><p>Not applicable. Copying tags to snapshots is managed by the DB cluster. Setting this value for an Aurora DB instance has no effect on the DB cluster setting. For more information, see <code>ModifyDBCluster</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicateTagsToSnapshot;

/**
 <p>The new compute and memory capacity of the DB instance, for example, <code>db.m4.large</code>. Not all DB instance classes are available in all AWS Regions, or for all database engines. For the full list of DB instance classes, and availability for your engine, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html">DB Instance Class</a> in the <i>Amazon RDS User Guide.</i></p><p>If you modify the DB instance class, an outage occurs during the change. The change is applied during the next maintenance window, unless <code>ApplyImmediately</code> is enabled for this request. </p><p>Default: Uses existing setting</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceClass;

/**
 <p>The DB instance identifier. This value is stored as a lowercase string.</p><p>Constraints:</p><ul><li><p>Must match the identifier of an existing DBInstance.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p>The name of the DB parameter group to apply to the DB instance. Changing this setting doesn't result in an outage. The parameter group name itself is changed immediately, but the actual parameter changes are not applied until you reboot the instance without failover. In this case, the DB instance isn't rebooted automatically and the parameter changes isn't applied during the next maintenance window.</p><p>Default: Uses existing setting</p><p>Constraints: The DB parameter group must be in the same DB parameter group family as this DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupName;

/**
 <p>The port number on which the database accepts connections.</p><p>The value of the <code>DBPortNumber</code> parameter must not match any of the port values specified for options in the option group for the DB instance.</p><p>Your database will restart when you change the <code>DBPortNumber</code> value regardless of the value of the <code>ApplyImmediately</code> parameter.</p><p><b>MySQL</b></p><p> Default: <code>3306</code></p><p> Valid values: <code>1150-65535</code></p><p><b>MariaDB</b></p><p> Default: <code>3306</code></p><p> Valid values: <code>1150-65535</code></p><p><b>PostgreSQL</b></p><p> Default: <code>5432</code></p><p> Valid values: <code>1150-65535</code></p><p>Type: Integer</p><p><b>Oracle</b></p><p> Default: <code>1521</code></p><p> Valid values: <code>1150-65535</code></p><p><b>SQL Server</b></p><p> Default: <code>1433</code></p><p> Valid values: <code>1150-65535</code> except <code>1234</code>, <code>1434</code>, <code>3260</code>, <code>3343</code>, <code>3389</code>, <code>47001</code>, and <code>49152-49156</code>.</p><p><b>Amazon Aurora</b></p><p> Default: <code>3306</code></p><p> Valid values: <code>1150-65535</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable DBPortNumber;

/**
 <p>A list of DB security groups to authorize on this DB instance. Changing this setting doesn't result in an outage and the change is asynchronously applied as soon as possible.</p><p>Constraints:</p><ul><li><p>If supplied, must match existing DBSecurityGroups.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable DBSecurityGroups;

/**
 <p>The new DB subnet group for the DB instance. You can use this parameter to move your DB instance to a different VPC. If your DB instance isn't in a VPC, you can also use this parameter to move your DB instance into a VPC. For more information, see <a href="http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_VPC.WorkingWithRDSInstanceinaVPC.html#USER_VPC.Non-VPC2VPC">Updating the VPC for a DB Instance</a> in the <i>Amazon RDS User Guide.</i></p><p>Changing the subnet group causes an outage during the change. The change is applied during the next maintenance window, unless you enable <code>ApplyImmediately</code>. </p><p>Constraints: If supplied, must match the name of an existing DBSubnetGroup.</p><p>Example: <code>mySubnetGroup</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroupName;

/**
 <p>A value that indicates whether the DB instance has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html"> Deleting a DB Instance</a>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p>The Active Directory directory ID to move the DB instance to. Specify <code>none</code> to remove the instance from its current domain. The domain must be created prior to this operation. Currently, only Microsoft SQL Server and Oracle DB instances can be created in an Active Directory Domain. </p><p>For Microsoft SQL Server DB instances, Amazon RDS can use Windows Authentication to authenticate users that connect to the DB instance. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_SQLServerWinAuth.html"> Using Windows Authentication with an Amazon RDS DB Instance Running Microsoft SQL Server</a> in the <i>Amazon RDS User Guide</i>.</p><p>For Oracle DB instances, Amazon RDS can use Kerberos Authentication to authenticate users that connect to the DB instance. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/oracle-kerberos.html"> Using Kerberos Authentication with Amazon RDS for Oracle</a> in the <i>Amazon RDS User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

/**
 <p>The name of the IAM role to use when making API calls to the Directory Service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainIAMRoleName;

/**
 <p>A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled. For information about the supported DB engines, see <a>CreateDBInstance</a>.</p><p>For more information about IAM database authentication, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html"> IAM Database Authentication for MySQL and PostgreSQL</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableIAMDatabaseAuthentication;

/**
 <p>A value that indicates whether to enable Performance Insights for the DB instance.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html">Using Amazon Performance Insights</a> in the <i>Amazon Relational Database Service User Guide</i>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enablePerformanceInsights;

/**
 <p> The version number of the database engine to upgrade to. Changing this parameter results in an outage and the change is applied during the next maintenance window unless the <code>ApplyImmediately</code> parameter is eanbled for this request. </p><p>For major version upgrades, if a nondefault DB parameter group is currently in use, a new DB parameter group in the DB parameter group family for the new engine version must be specified. The new DB parameter group can be the default for that DB parameter group family.</p><p>For information about valid engine versions, see <code>CreateDBInstance</code>, or call <code>DescribeDBEngineVersions</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The new Provisioned IOPS (I/O operations per second) value for the RDS instance. </p><p>Changing this setting doesn't result in an outage and the change is applied during the next maintenance window unless the <code>ApplyImmediately</code> parameter is enabled for this request. If you are migrating from Provisioned IOPS to standard storage, set this value to 0. The DB instance will require a reboot for the change in storage type to take effect. </p><p>If you choose to migrate your DB instance from using standard storage to using Provisioned IOPS, or from using Provisioned IOPS to using standard storage, the process can take time. The duration of the migration depends on several factors such as database load, storage size, storage type (standard or Provisioned IOPS), amount of IOPS provisioned (if any), and the number of prior scale storage operations. Typical migration times are under 24 hours, but the process can take up to several days in some cases. During the migration, the DB instance is available for use, but might experience performance degradation. While the migration takes place, nightly backups for the instance are suspended. No other Amazon RDS operations can take place for the instance, including modifying the instance, rebooting the instance, deleting the instance, creating a read replica for the instance, and creating a DB snapshot of the instance. </p><p>Constraints: For MariaDB, MySQL, Oracle, and PostgreSQL, the value supplied must be at least 10% greater than the current value. Values that are not at least 10% greater than the existing value are rounded up so that they are 10% greater than the current value. </p><p>Default: Uses existing setting</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iops;

/**
 <p>The license model for the DB instance.</p><p>Valid values: <code>license-included</code> | <code>bring-your-own-license</code> | <code>general-public-license</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable licenseModel;

/**
 <p>The new password for the master user. The password can include any printable ASCII character except "/", """, or "@".</p><p> Changing this parameter doesn't result in an outage and the change is asynchronously applied as soon as possible. Between the time of the request and the completion of the request, the <code>MasterUserPassword</code> element exists in the <code>PendingModifiedValues</code> element of the operation response. </p><p><b>Amazon Aurora</b></p><p>Not applicable. The password for the master user is managed by the DB cluster. For more information, see <code>ModifyDBCluster</code>. </p><p>Default: Uses existing setting</p><p><b>MariaDB</b></p><p>Constraints: Must contain from 8 to 41 characters.</p><p><b>Microsoft SQL Server</b></p><p>Constraints: Must contain from 8 to 128 characters.</p><p><b>MySQL</b></p><p>Constraints: Must contain from 8 to 41 characters.</p><p><b>Oracle</b></p><p>Constraints: Must contain from 8 to 30 characters.</p><p><b>PostgreSQL</b></p><p>Constraints: Must contain from 8 to 128 characters.</p><note><p>Amazon RDS API actions never return the password, so this action provides a way to regain access to a primary instance user if the password is lost. This includes restoring privileges that might have been accidentally revoked. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable masterUserPassword;

/**
 <p>The upper limit to which Amazon RDS can automatically scale the storage of the DB instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxAllocatedStorage;

/**
 <p>The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0.</p><p>If <code>MonitoringRoleArn</code> is specified, then you must also set <code>MonitoringInterval</code> to a value other than 0.</p><p>Valid Values: <code>0, 1, 5, 10, 15, 30, 60</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable monitoringInterval;

/**
 <p>The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to Amazon CloudWatch Logs. For example, <code>arn:aws:iam:123456789012:role/emaccess</code>. For information on creating a monitoring role, go to <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.html#USER_Monitoring.OS.IAMRole">To create an IAM role for Amazon RDS Enhanced Monitoring</a> in the <i>Amazon RDS User Guide.</i></p><p>If <code>MonitoringInterval</code> is set to a value other than 0, then you must supply a <code>MonitoringRoleArn</code> value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringRoleArn;

/**
 <p>A value that indicates whether the DB instance is a Multi-AZ deployment. Changing this parameter doesn't result in an outage and the change is applied during the next maintenance window unless the <code>ApplyImmediately</code> parameter is enabled for this request. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiAZ;

/**
 <p> The new DB instance identifier for the DB instance when renaming a DB instance. When you change the DB instance identifier, an instance reboot occurs immediately if you enable <code>ApplyImmediately</code>, or will occur during the next maintenance window if you disable Apply Immediately. This value is stored as a lowercase string. </p><p>Constraints:</p><ul><li><p>Must contain from 1 to 63 letters, numbers, or hyphens.</p></li><li><p>The first character must be a letter.</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens.</p></li></ul><p>Example: <code>mydbinstance</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable latestDBInstanceIdentifier;

/**
 <p> Indicates that the DB instance should be associated with the specified option group. Changing this parameter doesn't result in an outage except in the following case and the change is applied during the next maintenance window unless the <code>ApplyImmediately</code> parameter is enabled for this request. If the parameter change results in an option group that enables OEM, this change can cause a brief (sub-second) period during which new connections are rejected but existing connections are not interrupted. </p><p>Permanent options, such as the TDE option for Oracle Advanced Security TDE, can't be removed from an option group, and that option group can't be removed from a DB instance once it is associated with a DB instance</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

/**
 <p>The AWS KMS key identifier for encryption of Performance Insights data. The KMS key ID is the Amazon Resource Name (ARN), KMS key identifier, or the KMS key alias for the KMS encryption key.</p><p>If you do not specify a value for <code>PerformanceInsightsKMSKeyId</code>, then Amazon RDS uses your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable performanceInsightsKMSKeyId;

/**
 <p>The amount of time, in days, to retain Performance Insights data. Valid values are 7 or 731 (2 years). </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable performanceInsightsRetentionPeriod;

/**
 <p> The daily time range during which automated backups are created if automated backups are enabled, as determined by the <code>BackupRetentionPeriod</code> parameter. Changing this parameter doesn't result in an outage and the change is asynchronously applied as soon as possible. </p><p><b>Amazon Aurora</b></p><p>Not applicable. The daily time range for creating automated backups is managed by the DB cluster. For more information, see <code>ModifyDBCluster</code>.</p><p>Constraints:</p><ul><li><p>Must be in the format hh24:mi-hh24:mi</p></li><li><p>Must be in Universal Time Coordinated (UTC)</p></li><li><p>Must not conflict with the preferred maintenance window</p></li><li><p>Must be at least 30 minutes</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable preferredBackupWindow;

/**
 <p>The weekly time range (in UTC) during which system maintenance can occur, which might result in an outage. Changing this parameter doesn't result in an outage, except in the following situation, and the change is asynchronously applied as soon as possible. If there are pending actions that cause a reboot, and the maintenance window is changed to include the current time, then changing this parameter will cause a reboot of the DB instance. If moving this window to the current time, there must be at least 30 minutes between the current time and end of the window to ensure pending changes are applied.</p><p>Default: Uses existing setting</p><p>Format: ddd:hh24:mi-ddd:hh24:mi</p><p>Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun</p><p>Constraints: Must be at least 30 minutes</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>The number of CPU cores and the number of threads per core for the DB instance class of the DB instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsProcessorFeature *> * _Nullable processorFeatures;

/**
 <p>A value that specifies the order in which an Aurora Replica is promoted to the primary instance after a failure of the existing primary instance. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Managing.Backups.html#Aurora.Managing.FaultTolerance"> Fault Tolerance for an Aurora DB Cluster</a> in the <i>Amazon Aurora User Guide</i>. </p><p>Default: 1</p><p>Valid Values: 0 - 15</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable promotionTier;

/**
 <p>A value that indicates whether the DB instance is publicly accessible. When the DB instance is publicly accessible, it is an Internet-facing instance with a publicly resolvable DNS name, which resolves to a public IP address. When the DB instance isn't publicly accessible, it is an internal instance with a DNS name that resolves to a private IP address. </p><p><code>PubliclyAccessible</code> only applies to DB instances in a VPC. The DB instance must be part of a public subnet and <code>PubliclyAccessible</code> must be enabled for it to be publicly accessible. </p><p>Changes to the <code>PubliclyAccessible</code> parameter are applied immediately regardless of the value of the <code>ApplyImmediately</code> parameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publiclyAccessible;

/**
 <p>Specifies the storage type to be associated with the DB instance. </p><p>If you specify Provisioned IOPS (<code>io1</code>), you must also include a value for the <code>Iops</code> parameter. </p><p>If you choose to migrate your DB instance from using standard storage to using Provisioned IOPS, or from using Provisioned IOPS to using standard storage, the process can take time. The duration of the migration depends on several factors such as database load, storage size, storage type (standard or Provisioned IOPS), amount of IOPS provisioned (if any), and the number of prior scale storage operations. Typical migration times are under 24 hours, but the process can take up to several days in some cases. During the migration, the DB instance is available for use, but might experience performance degradation. While the migration takes place, nightly backups for the instance are suspended. No other Amazon RDS operations can take place for the instance, including modifying the instance, rebooting the instance, deleting the instance, creating a read replica for the instance, and creating a DB snapshot of the instance. </p><p> Valid values: <code>standard | gp2 | io1</code></p><p>Default: <code>io1</code> if the <code>Iops</code> parameter is specified, otherwise <code>gp2</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable storageType;

/**
 <p>The ARN from the key store with which to associate the instance for TDE encryption.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tdeCredentialArn;

/**
 <p>The password for the given ARN from the key store in order to access the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tdeCredentialPassword;

/**
 <p>A value that indicates whether the DB instance class of the DB instance uses its default processor features.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable useDefaultProcessorFeatures;

/**
 <p>A list of EC2 VPC security groups to authorize on this DB instance. This change is asynchronously applied as soon as possible.</p><p><b>Amazon Aurora</b></p><p>Not applicable. The associated list of EC2 VPC security groups is managed by the DB cluster. For more information, see <code>ModifyDBCluster</code>.</p><p>Constraints:</p><ul><li><p>If supplied, must match existing VpcSecurityGroupIds.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSecurityGroupIds;

@end

/**
 
 */
@interface AWSrdsModifyDBInstanceResult : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB instance. </p><p>This data type is used as a response element in the <code>DescribeDBInstances</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBInstance * _Nullable DBInstance;

@end

/**
 <p/>
 Required parameters: [DBParameterGroupName, Parameters]
 */
@interface AWSrdsModifyDBParameterGroupMessage : AWSRequest


/**
 <p>The name of the DB parameter group.</p><p>Constraints:</p><ul><li><p>If supplied, must match the name of an existing <code>DBParameterGroup</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupName;

/**
 <p>An array of parameter names, values, and the apply method for the parameter update. At least one parameter name, value, and apply method must be supplied; later arguments are optional. A maximum of 20 parameters can be modified in a single request.</p><p>Valid Values (for the application method): <code>immediate | pending-reboot</code></p><note><p>You can use the immediate value with dynamic parameters only. You can use the pending-reboot value for both dynamic and static parameters, and changes are applied when you reboot the DB instance without failover.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSrdsParameter *> * _Nullable parameters;

@end

/**
 
 */
@interface AWSrdsModifyDBProxyRequest : AWSRequest


/**
 <p>The new authentication settings for the <code>DBProxy</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsUserAuthConfig *> * _Nullable auth;

/**
 <p>The identifier for the <code>DBProxy</code> to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBProxyName;

/**
 <p>Whether the proxy includes detailed information about SQL statements in its logs. This information helps you to debug issues involving SQL behavior or the performance and scalability of the proxy connections. The debug information includes the text of SQL statements that you submit through the proxy. Thus, only enable this setting when needed for debugging, and only when you have security measures in place to safeguard any sensitive information that appears in the logs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable debugLogging;

/**
 <p>The number of seconds that a connection to the proxy can be inactive before the proxy disconnects it. You can set this value higher or lower than the connection timeout limit for the associated database.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable idleClientTimeout;

/**
 <p>The new identifier for the <code>DBProxy</code>. An identifier must begin with a letter and must contain only ASCII letters, digits, and hyphens; it can't end with a hyphen or contain two consecutive hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestDBProxyName;

/**
 <p>Whether Transport Layer Security (TLS) encryption is required for connections to the proxy. By enabling this setting, you can enforce encrypted TLS connections to the proxy, even if the associated database doesn't use TLS.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requireTLS;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role that the proxy uses to access secrets in AWS Secrets Manager.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The new list of security groups for the <code>DBProxy</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

@end

/**
 
 */
@interface AWSrdsModifyDBProxyResponse : AWSModel


/**
 <p>The <code>DBProxy</code> object representing the new settings for the proxy.</p>
 */
@property (nonatomic, strong) AWSrdsDBProxy * _Nullable DBProxy;

@end

/**
 
 */
@interface AWSrdsModifyDBProxyTargetGroupRequest : AWSRequest


/**
 <p>The settings that determine the size and behavior of the connection pool for the target group.</p>
 */
@property (nonatomic, strong) AWSrdsConnectionPoolConfiguration * _Nullable connectionPoolConfig;

/**
 <p>The name of the new proxy to which to assign the target group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBProxyName;

/**
 <p>The new name for the modified <code>DBProxyTarget</code>. An identifier must begin with a letter and must contain only ASCII letters, digits, and hyphens; it can't end with a hyphen or contain two consecutive hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestName;

/**
 <p>The name of the new target group to assign to the proxy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetGroupName;

@end

/**
 
 */
@interface AWSrdsModifyDBProxyTargetGroupResponse : AWSModel


/**
 <p>The settings of the modified <code>DBProxyTarget</code>.</p>
 */
@property (nonatomic, strong) AWSrdsDBProxyTargetGroup * _Nullable DBProxyTargetGroup;

@end

/**
 <p/>
 Required parameters: [DBSnapshotIdentifier, AttributeName]
 */
@interface AWSrdsModifyDBSnapshotAttributeMessage : AWSRequest


/**
 <p>The name of the DB snapshot attribute to modify.</p><p>To manage authorization for other AWS accounts to copy or restore a manual DB snapshot, set this value to <code>restore</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The identifier for the DB snapshot to modify the attributes for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSnapshotIdentifier;

/**
 <p>A list of DB snapshot attributes to add to the attribute specified by <code>AttributeName</code>.</p><p>To authorize other AWS accounts to copy or restore a manual snapshot, set this list to include one or more AWS account IDs, or <code>all</code> to make the manual DB snapshot restorable by any AWS account. Do not add the <code>all</code> value for any manual DB snapshots that contain private information that you don't want available to all AWS accounts.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable valuesToAdd;

/**
 <p>A list of DB snapshot attributes to remove from the attribute specified by <code>AttributeName</code>.</p><p>To remove authorization for other AWS accounts to copy or restore a manual snapshot, set this list to include one or more AWS account identifiers, or <code>all</code> to remove authorization for any AWS account to copy or restore the DB snapshot. If you specify <code>all</code>, an AWS account whose account ID is explicitly added to the <code>restore</code> attribute can still copy or restore the manual DB snapshot.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable valuesToRemove;

@end

/**
 
 */
@interface AWSrdsModifyDBSnapshotAttributeResult : AWSModel


/**
 <p>Contains the results of a successful call to the <code>DescribeDBSnapshotAttributes</code> API action.</p><p>Manual DB snapshot attributes are used to authorize other AWS accounts to copy or restore a manual DB snapshot. For more information, see the <code>ModifyDBSnapshotAttribute</code> API action.</p>
 */
@property (nonatomic, strong) AWSrdsDBSnapshotAttributesResult * _Nullable DBSnapshotAttributesResult;

@end

/**
 
 */
@interface AWSrdsModifyDBSnapshotMessage : AWSRequest


/**
 <p>The identifier of the DB snapshot to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSnapshotIdentifier;

/**
 <p>The engine version to upgrade the DB snapshot to. </p><p>The following are the database engines and engine versions that are available when you upgrade a DB snapshot. </p><p><b>MySQL</b></p><ul><li><p><code>5.5.46</code> (supported for 5.1 DB snapshots)</p></li></ul><p><b>Oracle</b></p><ul><li><p><code>12.1.0.2.v8</code> (supported for 12.1.0.1 DB snapshots)</p></li><li><p><code>11.2.0.4.v12</code> (supported for 11.2.0.2 DB snapshots)</p></li><li><p><code>11.2.0.4.v11</code> (supported for 11.2.0.3 DB snapshots)</p></li></ul><p><b>PostgreSQL</b></p><p>For the list of engine versions that are available for upgrading a DB snapshot, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.PostgreSQL.html#USER_UpgradeDBInstance.PostgreSQL.MajorVersion"> Upgrading the PostgreSQL DB Engine for Amazon RDS</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The option group to identify with the upgraded DB snapshot. </p><p>You can specify this parameter when you upgrade an Oracle DB snapshot. The same option group considerations apply when upgrading a DB snapshot as when upgrading a DB instance. For more information, see <a href="http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Oracle.html#USER_UpgradeDBInstance.Oracle.OGPG.OG">Option Group Considerations</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

@end

/**
 
 */
@interface AWSrdsModifyDBSnapshotResult : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB snapshot. </p><p>This data type is used as a response element in the <code>DescribeDBSnapshots</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBSnapshot * _Nullable DBSnapshot;

@end

/**
 <p/>
 Required parameters: [DBSubnetGroupName, SubnetIds]
 */
@interface AWSrdsModifyDBSubnetGroupMessage : AWSRequest


/**
 <p>The description for the DB subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroupDescription;

/**
 <p>The name for the DB subnet group. This value is stored as a lowercase string. You can't modify the default subnet group. </p><p>Constraints: Must match the name of an existing DBSubnetGroup. Must not be default.</p><p>Example: <code>mySubnetgroup</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroupName;

/**
 <p>The EC2 subnet IDs for the DB subnet group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

@end

/**
 
 */
@interface AWSrdsModifyDBSubnetGroupResult : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB subnet group. </p><p>This data type is used as a response element in the <code>DescribeDBSubnetGroups</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBSubnetGroup * _Nullable DBSubnetGroup;

@end

/**
 <p/>
 Required parameters: [SubscriptionName]
 */
@interface AWSrdsModifyEventSubscriptionMessage : AWSRequest


/**
 <p> A value that indicates whether to activate the subscription. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p> A list of event categories for a SourceType that you want to subscribe to. You can see a list of the categories for a given SourceType in the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html">Events</a> topic in the <i>Amazon RDS User Guide</i> or by using the <b>DescribeEventCategories</b> action. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventCategories;

/**
 <p>The Amazon Resource Name (ARN) of the SNS topic created for event notification. The ARN is created by Amazon SNS when you create a topic and subscribe to it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snsTopicArn;

/**
 <p>The type of source that is generating the events. For example, if you want to be notified of events generated by a DB instance, you would set this parameter to db-instance. If this value isn't specified, all events are returned.</p><p>Valid values: db-instance | db-parameter-group | db-security-group | db-snapshot</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

/**
 <p>The name of the RDS event notification subscription.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionName;

@end

/**
 
 */
@interface AWSrdsModifyEventSubscriptionResult : AWSModel


/**
 <p>Contains the results of a successful invocation of the <code>DescribeEventSubscriptions</code> action.</p>
 */
@property (nonatomic, strong) AWSrdsEventSubscription * _Nullable eventSubscription;

@end

/**
 
 */
@interface AWSrdsModifyGlobalClusterMessage : AWSRequest


/**
 <p> Indicates if the global database cluster has deletion protection enabled. The global database cluster can't be deleted when deletion protection is enabled. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p> The DB cluster identifier for the global cluster being modified. This parameter isn't case-sensitive. </p><p>Constraints:</p><ul><li><p>Must match the identifier of an existing global database cluster.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable globalClusterIdentifier;

/**
 <p> The new cluster identifier for the global database cluster when modifying a global database cluster. This value is stored as a lowercase string. </p><p>Constraints:</p><ul><li><p>Must contain from 1 to 63 letters, numbers, or hyphens</p></li><li><p>The first character must be a letter</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens</p></li></ul><p>Example: <code>my-cluster2</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable latestGlobalClusterIdentifier;

@end

/**
 
 */
@interface AWSrdsModifyGlobalClusterResult : AWSModel


/**
 <p>A data type representing an Aurora global database.</p>
 */
@property (nonatomic, strong) AWSrdsGlobalCluster * _Nullable globalCluster;

@end

/**
 <p/>
 Required parameters: [OptionGroupName]
 */
@interface AWSrdsModifyOptionGroupMessage : AWSRequest


/**
 <p>A value that indicates whether to apply the change immediately or during the next maintenance window for each instance associated with the option group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyImmediately;

/**
 <p>The name of the option group to be modified.</p><p>Permanent options, such as the TDE option for Oracle Advanced Security TDE, can't be removed from an option group, and that option group can't be removed from a DB instance once it is associated with a DB instance</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

/**
 <p>Options in this list are added to the option group or, if already present, the specified configuration is used to update the existing configuration.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsOptionConfiguration *> * _Nullable optionsToInclude;

/**
 <p>Options in this list are removed from the option group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable optionsToRemove;

@end

/**
 
 */
@interface AWSrdsModifyOptionGroupResult : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) AWSrdsOptionGroup * _Nullable optionGroup;

@end

/**
 <p>Option details.</p>
 */
@interface AWSrdsOption : AWSModel


/**
 <p>If the option requires access to a port, then this DB security group allows access to the port.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBSecurityGroupMembership *> * _Nullable DBSecurityGroupMemberships;

/**
 <p>The description of the option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionDescription;

/**
 <p>The name of the option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionName;

/**
 <p>The option settings for this option.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsOptionSetting *> * _Nullable optionSettings;

/**
 <p>The version of the option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionVersion;

/**
 <p>Indicate if this option is permanent.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable permanent;

/**
 <p>Indicate if this option is persistent.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable persistent;

/**
 <p>If required, the port configured for this option to use.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>If the option requires access to a port, then this VPC security group allows access to the port.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsVpcSecurityGroupMembership *> * _Nullable vpcSecurityGroupMemberships;

@end

/**
 <p>A list of all available options</p>
 Required parameters: [OptionName]
 */
@interface AWSrdsOptionConfiguration : AWSModel


/**
 <p>A list of DBSecurityGroupMembership name strings used for this option.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable DBSecurityGroupMemberships;

/**
 <p>The configuration of options to include in a group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionName;

/**
 <p>The option settings to include in an option group.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsOptionSetting *> * _Nullable optionSettings;

/**
 <p>The version for the option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionVersion;

/**
 <p>The optional port for the option.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>A list of VpcSecurityGroupMembership name strings used for this option.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSecurityGroupMemberships;

@end

/**
 <p/>
 */
@interface AWSrdsOptionGroup : AWSModel


/**
 <p>Indicates whether this option group can be applied to both VPC and non-VPC instances. The value <code>true</code> indicates the option group can be applied to both VPC and non-VPC instances. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowsVpcAndNonVpcInstanceMemberships;

/**
 <p>Indicates the name of the engine that this option group can be applied to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineName;

/**
 <p>Indicates the major engine version associated with this option group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable majorEngineVersion;

/**
 <p>The Amazon Resource Name (ARN) for the option group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupArn;

/**
 <p>Provides a description of the option group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupDescription;

/**
 <p>Specifies the name of the option group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

/**
 <p>Indicates what options are available in the option group.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsOption *> * _Nullable options;

/**
 <p>If <b>AllowsVpcAndNonVpcInstanceMemberships</b> is <code>false</code>, this field is blank. If <b>AllowsVpcAndNonVpcInstanceMemberships</b> is <code>true</code> and this field is blank, then this option group can be applied to both VPC and non-VPC instances. If this field contains a value, then this option group can only be applied to instances that are in the VPC indicated by this field. </p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Provides information on the option groups the DB instance is a member of.</p>
 */
@interface AWSrdsOptionGroupMembership : AWSModel


/**
 <p>The name of the option group that the instance belongs to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

/**
 <p>The status of the DB instance's option group membership. Valid values are: <code>in-sync</code>, <code>pending-apply</code>, <code>pending-removal</code>, <code>pending-maintenance-apply</code>, <code>pending-maintenance-removal</code>, <code>applying</code>, <code>removing</code>, and <code>failed</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Available option.</p>
 */
@interface AWSrdsOptionGroupOption : AWSModel


/**
 <p>If the option requires a port, specifies the default port for the option.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultPort;

/**
 <p>The description of the option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the engine that this option can be applied to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineName;

/**
 <p>Indicates the major engine version that the option is available for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable majorEngineVersion;

/**
 <p>The minimum required engine version for the option to be applied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable minimumRequiredMinorEngineVersion;

/**
 <p>The name of the option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The option settings that are available (and the default value) for each option in an option group.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsOptionGroupOptionSetting *> * _Nullable optionGroupOptionSettings;

/**
 <p>The versions that are available for the option.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsOptionVersion *> * _Nullable optionGroupOptionVersions;

/**
 <p>The options that conflict with this option.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable optionsConflictsWith;

/**
 <p>The options that are prerequisites for this option.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable optionsDependedOn;

/**
 <p>Permanent options can never be removed from an option group. An option group containing a permanent option can't be removed from a DB instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable permanent;

/**
 <p>Persistent options can't be removed from an option group while DB instances are associated with the option group. If you disassociate all DB instances from the option group, your can remove the persistent option from the option group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable persistent;

/**
 <p>Specifies whether the option requires a port.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable portRequired;

/**
 <p>If true, you must enable the Auto Minor Version Upgrade setting for your DB instance before you can use this option. You can enable Auto Minor Version Upgrade when you first create your DB instance, or by modifying your DB instance later. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requiresAutoMinorEngineVersionUpgrade;

/**
 <p>If true, you can change the option to an earlier version of the option. This only applies to options that have different versions available. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable supportsOptionVersionDowngrade;

/**
 <p>If true, you can only use this option with a DB instance that is in a VPC. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable vpcOnly;

@end

/**
 <p>Option group option settings are used to display settings available for each option with their default values and other information. These values are used with the DescribeOptionGroupOptions action.</p>
 */
@interface AWSrdsOptionGroupOptionSetting : AWSModel


/**
 <p>Indicates the acceptable values for the option group option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable allowedValues;

/**
 <p>The DB engine specific parameter type for the option group option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applyType;

/**
 <p>The default value for the option group option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultValue;

/**
 <p>Boolean value where true indicates that this option group option can be changed from the default value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isModifiable;

/**
 <p>Boolean value where true indicates that a value must be specified for this option setting of the option group option.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isRequired;

/**
 <p>The minimum DB engine version required for the corresponding allowed value for this option setting.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsMinimumEngineVersionPerAllowedValue *> * _Nullable minimumEngineVersionPerAllowedValue;

/**
 <p>The description of the option group option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable settingDescription;

/**
 <p>The name of the option group option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable settingName;

@end

/**
 <p/>
 */
@interface AWSrdsOptionGroupOptionsMessage : AWSModel


/**
 <p>An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>List of available option group options.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsOptionGroupOption *> * _Nullable optionGroupOptions;

@end

/**
 <p>List of option groups.</p>
 */
@interface AWSrdsOptionGroups : AWSModel


/**
 <p>An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>List of option groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsOptionGroup *> * _Nullable optionGroupsList;

@end

/**
 <p>Option settings are the actual settings being applied or configured for that option. It is used when you modify an option group or describe option groups. For example, the NATIVE_NETWORK_ENCRYPTION option has a setting called SQLNET.ENCRYPTION_SERVER that can have several different values.</p>
 */
@interface AWSrdsOptionSetting : AWSModel


/**
 <p>The allowed values of the option setting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable allowedValues;

/**
 <p>The DB engine specific parameter type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applyType;

/**
 <p>The data type of the option setting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataType;

/**
 <p>The default value of the option setting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultValue;

/**
 <p>The description of the option setting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Indicates if the option setting is part of a collection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isCollection;

/**
 <p>A Boolean value that, when true, indicates the option setting can be modified from the default.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isModifiable;

/**
 <p>The name of the option that has settings that you can set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The current value of the option setting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>The version for an option. Option group option versions are returned by the <code>DescribeOptionGroupOptions</code> action.</p>
 */
@interface AWSrdsOptionVersion : AWSModel


/**
 <p>True if the version is the default version of the option, and otherwise false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefault;

/**
 <p>The version of the option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Contains a list of available options for a DB instance.</p><p> This data type is used as a response element in the <code>DescribeOrderableDBInstanceOptions</code> action. </p>
 */
@interface AWSrdsOrderableDBInstanceOption : AWSModel


/**
 <p>A list of Availability Zones for a DB instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsAvailabilityZone *> * _Nullable availabilityZones;

/**
 <p>A list of the available processor features for the DB instance class of a DB instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsAvailableProcessorFeature *> * _Nullable availableProcessorFeatures;

/**
 <p>The DB instance class for a DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceClass;

/**
 <p>The engine type of a DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The engine version of a DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The license model for a DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable licenseModel;

/**
 <p>Maximum total provisioned IOPS for a DB instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxIopsPerDbInstance;

/**
 <p>Maximum provisioned IOPS per GiB for a DB instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxIopsPerGib;

/**
 <p>Maximum storage size for a DB instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxStorageSize;

/**
 <p>Minimum total provisioned IOPS for a DB instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minIopsPerDbInstance;

/**
 <p>Minimum provisioned IOPS per GiB for a DB instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minIopsPerGib;

/**
 <p>Minimum storage size for a DB instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minStorageSize;

/**
 <p>Indicates whether a DB instance is Multi-AZ capable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiAZCapable;

/**
 <p>Indicates whether a DB instance can have a read replica.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable readReplicaCapable;

/**
 <p>Indicates the storage type for a DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable storageType;

/**
 <p>A list of the supported DB engine modes.</p><note><p><code>global</code> engine mode only applies for global database clusters created with Aurora MySQL version 5.6.10a. For higher Aurora MySQL versions, the clusters in a global database use <code>provisioned</code> engine mode. </p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedEngineModes;

/**
 <p>Indicates whether a DB instance supports Enhanced Monitoring at intervals from 1 to 60 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable supportsEnhancedMonitoring;

/**
 <p>Indicates whether a DB instance supports IAM database authentication.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable supportsIAMDatabaseAuthentication;

/**
 <p>Indicates whether a DB instance supports provisioned IOPS.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable supportsIops;

/**
 <p>Whether a DB instance supports Kerberos Authentication.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable supportsKerberosAuthentication;

/**
 <p>True if a DB instance supports Performance Insights, otherwise false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable supportsPerformanceInsights;

/**
 <p>Whether or not Amazon RDS can automatically scale storage for DB instances that use the specified instance class.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable supportsStorageAutoscaling;

/**
 <p>Indicates whether a DB instance supports encrypted storage.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable supportsStorageEncryption;

/**
 <p>Indicates whether a DB instance is in a VPC.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable vpc;

@end

/**
 <p> Contains the result of a successful invocation of the <code>DescribeOrderableDBInstanceOptions</code> action. </p>
 */
@interface AWSrdsOrderableDBInstanceOptionsMessage : AWSModel


/**
 <p> An optional pagination token provided by a previous OrderableDBInstanceOptions request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code> . </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>An <code>OrderableDBInstanceOption</code> structure containing information about orderable options for the DB instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsOrderableDBInstanceOption *> * _Nullable orderableDBInstanceOptions;

@end

/**
 <p> This data type is used as a request parameter in the <code>ModifyDBParameterGroup</code> and <code>ResetDBParameterGroup</code> actions. </p><p>This data type is used as a response element in the <code>DescribeEngineDefaultParameters</code> and <code>DescribeDBParameters</code> actions.</p>
 */
@interface AWSrdsParameter : AWSModel


/**
 <p>Specifies the valid range of values for the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable allowedValues;

/**
 <p>Indicates when to apply parameter updates.</p>
 */
@property (nonatomic, assign) AWSrdsApplyMethod applyMethod;

/**
 <p>Specifies the engine specific parameters type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applyType;

/**
 <p>Specifies the valid data type for the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataType;

/**
 <p>Provides a description of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> Indicates whether (<code>true</code>) or not (<code>false</code>) the parameter can be modified. Some parameters have security or operational implications that prevent them from being changed. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isModifiable;

/**
 <p>The earliest engine version to which the parameter can apply.</p>
 */
@property (nonatomic, strong) NSString * _Nullable minimumEngineVersion;

/**
 <p>Specifies the name of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterName;

/**
 <p>Specifies the value of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterValue;

/**
 <p>Indicates the source of the parameter value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable source;

/**
 <p>The valid DB engine modes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedEngineModes;

@end

/**
 <p>A list of the log types whose configuration is still pending. In other words, these log types are in the process of being activated or deactivated.</p>
 */
@interface AWSrdsPendingCloudwatchLogsExports : AWSModel


/**
 <p>Log types that are in the process of being enabled. After they are enabled, these log types are exported to CloudWatch Logs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable logTypesToDisable;

/**
 <p>Log types that are in the process of being deactivated. After they are deactivated, these log types aren't exported to CloudWatch Logs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable logTypesToEnable;

@end

/**
 <p>Provides information about a pending maintenance action for a resource.</p>
 */
@interface AWSrdsPendingMaintenanceAction : AWSModel


/**
 <p>The type of pending maintenance action that is available for the resource. Valid actions are <code>system-update</code>, <code>db-upgrade</code>, <code>hardware-maintenance</code>, and <code>ca-certificate-rotation</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable action;

/**
 <p>The date of the maintenance window when the action is applied. The maintenance action is applied to the resource during its first maintenance window after this date.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable autoAppliedAfterDate;

/**
 <p>The effective date when the pending maintenance action is applied to the resource. This date takes into account opt-in requests received from the <code>ApplyPendingMaintenanceAction</code> API, the <code>AutoAppliedAfterDate</code>, and the <code>ForcedApplyDate</code>. This value is blank if an opt-in request has not been received and nothing has been specified as <code>AutoAppliedAfterDate</code> or <code>ForcedApplyDate</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable currentApplyDate;

/**
 <p>A description providing more detail about the maintenance action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The date when the maintenance action is automatically applied. The maintenance action is applied to the resource on this date regardless of the maintenance window for the resource.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable forcedApplyDate;

/**
 <p>Indicates the type of opt-in request that has been received for the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optInStatus;

@end

/**
 <p>Data returned from the <b>DescribePendingMaintenanceActions</b> action.</p>
 */
@interface AWSrdsPendingMaintenanceActionsMessage : AWSModel


/**
 <p> An optional pagination token provided by a previous <code>DescribePendingMaintenanceActions</code> request. If this parameter is specified, the response includes only records beyond the marker, up to a number of records specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of the pending maintenance actions for the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsResourcePendingMaintenanceActions *> * _Nullable pendingMaintenanceActions;

@end

/**
 <p> This data type is used as a response element in the <code>ModifyDBInstance</code> action. </p>
 */
@interface AWSrdsPendingModifiedValues : AWSModel


/**
 <p> Contains the new <code>AllocatedStorage</code> size for the DB instance that will be applied or is currently being applied. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedStorage;

/**
 <p>Specifies the pending number of days for which automated backups are retained.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupRetentionPeriod;

/**
 <p>Specifies the identifier of the CA certificate for the DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable CACertificateIdentifier;

/**
 <p> Contains the new <code>DBInstanceClass</code> for the DB instance that will be applied or is currently being applied. </p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceClass;

/**
 <p> Contains the new <code>DBInstanceIdentifier</code> for the DB instance that will be applied or is currently being applied. </p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p>The new DB subnet group for the DB instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroupName;

/**
 <p>Indicates the database engine version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>Specifies the new Provisioned IOPS value for the DB instance that will be applied or is currently being applied.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iops;

/**
 <p>The license model for the DB instance.</p><p>Valid values: <code>license-included</code> | <code>bring-your-own-license</code> | <code>general-public-license</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable licenseModel;

/**
 <p>Contains the pending or currently-in-progress change of the master credentials for the DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUserPassword;

/**
 <p>Indicates that the Single-AZ DB instance is to change to a Multi-AZ deployment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiAZ;

/**
 <p>A list of the log types whose configuration is still pending. In other words, these log types are in the process of being activated or deactivated.</p>
 */
@property (nonatomic, strong) AWSrdsPendingCloudwatchLogsExports * _Nullable pendingCloudwatchLogsExports;

/**
 <p>Specifies the pending port for the DB instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The number of CPU cores and the number of threads per core for the DB instance class of the DB instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsProcessorFeature *> * _Nullable processorFeatures;

/**
 <p>Specifies the storage type to be associated with the DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable storageType;

@end

/**
 <p>Contains the processor features of a DB instance class.</p><p>To specify the number of CPU cores, use the <code>coreCount</code> feature name for the <code>Name</code> parameter. To specify the number of threads per core, use the <code>threadsPerCore</code> feature name for the <code>Name</code> parameter.</p><p>You can set the processor features of the DB instance class for a DB instance when you call one of the following actions:</p><ul><li><p><code>CreateDBInstance</code></p></li><li><p><code>ModifyDBInstance</code></p></li><li><p><code>RestoreDBInstanceFromDBSnapshot</code></p></li><li><p><code>RestoreDBInstanceFromS3</code></p></li><li><p><code>RestoreDBInstanceToPointInTime</code></p></li></ul><p>You can view the valid processor values for a particular instance class by calling the <code>DescribeOrderableDBInstanceOptions</code> action and specifying the instance class for the <code>DBInstanceClass</code> parameter.</p><p>In addition, you can use the following actions for DB instance class processor information:</p><ul><li><p><code>DescribeDBInstances</code></p></li><li><p><code>DescribeDBSnapshots</code></p></li><li><p><code>DescribeValidDBInstanceModifications</code></p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html#USER_ConfigureProcessor">Configuring the Processor of the DB Instance Class</a> in the <i>Amazon RDS User Guide. </i></p>
 */
@interface AWSrdsProcessorFeature : AWSModel


/**
 <p>The name of the processor feature. Valid names are <code>coreCount</code> and <code>threadsPerCore</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The value of a processor feature name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p/>
 Required parameters: [DBClusterIdentifier]
 */
@interface AWSrdsPromoteReadReplicaDBClusterMessage : AWSRequest


/**
 <p>The identifier of the DB cluster read replica to promote. This parameter isn't case-sensitive. </p><p>Constraints:</p><ul><li><p>Must match the identifier of an existing DB cluster read replica.</p></li></ul><p>Example: <code>my-cluster-replica1</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

@end

/**
 
 */
@interface AWSrdsPromoteReadReplicaDBClusterResult : AWSModel


/**
 <p>Contains the details of an Amazon Aurora DB cluster. </p><p>This data type is used as a response element in the <code>DescribeDBClusters</code>, <code>StopDBCluster</code>, and <code>StartDBCluster</code> actions. </p>
 */
@property (nonatomic, strong) AWSrdsDBCluster * _Nullable DBCluster;

@end

/**
 <p/>
 Required parameters: [DBInstanceIdentifier]
 */
@interface AWSrdsPromoteReadReplicaMessage : AWSRequest


/**
 <p>The number of days for which automated backups are retained. Setting this parameter to a positive number enables backups. Setting this parameter to 0 disables automated backups.</p><p>Default: 1</p><p>Constraints:</p><ul><li><p>Must be a value from 0 to 35.</p></li><li><p>Can't be set to 0 if the DB instance is a source to read replicas.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupRetentionPeriod;

/**
 <p>The DB instance identifier. This value is stored as a lowercase string.</p><p>Constraints:</p><ul><li><p>Must match the identifier of an existing read replica DB instance.</p></li></ul><p>Example: <code>mydbinstance</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p> The daily time range during which automated backups are created if automated backups are enabled, using the <code>BackupRetentionPeriod</code> parameter. </p><p> The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region. To see the time blocks available, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/AdjustingTheMaintenanceWindow.html"> Adjusting the Preferred Maintenance Window</a> in the <i>Amazon RDS User Guide.</i></p><p>Constraints:</p><ul><li><p>Must be in the format <code>hh24:mi-hh24:mi</code>.</p></li><li><p>Must be in Universal Coordinated Time (UTC).</p></li><li><p>Must not conflict with the preferred maintenance window.</p></li><li><p>Must be at least 30 minutes.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable preferredBackupWindow;

@end

/**
 
 */
@interface AWSrdsPromoteReadReplicaResult : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB instance. </p><p>This data type is used as a response element in the <code>DescribeDBInstances</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBInstance * _Nullable DBInstance;

@end

/**
 <p/>
 Required parameters: [ReservedDBInstancesOfferingId]
 */
@interface AWSrdsPurchaseReservedDBInstancesOfferingMessage : AWSRequest


/**
 <p>The number of instances to reserve.</p><p>Default: <code>1</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable DBInstanceCount;

/**
 <p>Customer-specified identifier to track this reservation.</p><p>Example: myreservationID</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedDBInstanceId;

/**
 <p>The ID of the Reserved DB instance offering to purchase.</p><p>Example: 438012d3-4052-4cc7-b2e3-8d3372e0e706</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedDBInstancesOfferingId;

/**
 <p>A list of tags. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSrdsPurchaseReservedDBInstancesOfferingResult : AWSModel


/**
 <p> This data type is used as a response element in the <code>DescribeReservedDBInstances</code> and <code>PurchaseReservedDBInstancesOffering</code> actions. </p>
 */
@property (nonatomic, strong) AWSrdsReservedDBInstance * _Nullable reservedDBInstance;

@end

/**
 <p>A range of integer values.</p>
 */
@interface AWSrdsRange : AWSModel


/**
 <p>The minimum value in the range.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable from;

/**
 <p>The step value for the range. For example, if you have a range of 5,000 to 10,000, with a step value of 1,000, the valid values start at 5,000 and step up by 1,000. Even though 7,500 is within the range, it isn't a valid value for the range. The valid values are 5,000, 6,000, 7,000, 8,000... </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable step;

/**
 <p>The maximum value in the range.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable to;

@end

/**
 <p/>
 Required parameters: [DBInstanceIdentifier]
 */
@interface AWSrdsRebootDBInstanceMessage : AWSRequest


/**
 <p>The DB instance identifier. This parameter is stored as a lowercase string.</p><p>Constraints:</p><ul><li><p>Must match the identifier of an existing DBInstance.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p> A value that indicates whether the reboot is conducted through a Multi-AZ failover. </p><p>Constraint: You can't enable force failover if the instance isn't configured for Multi-AZ.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceFailover;

@end

/**
 
 */
@interface AWSrdsRebootDBInstanceResult : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB instance. </p><p>This data type is used as a response element in the <code>DescribeDBInstances</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBInstance * _Nullable DBInstance;

@end

/**
 <p> This data type is used as a response element in the <code>DescribeReservedDBInstances</code> and <code>DescribeReservedDBInstancesOfferings</code> actions. </p>
 */
@interface AWSrdsRecurringCharge : AWSModel


/**
 <p>The amount of the recurring charge.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recurringChargeAmount;

/**
 <p>The frequency of the recurring charge.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recurringChargeFrequency;

@end

/**
 
 */
@interface AWSrdsRegisterDBProxyTargetsRequest : AWSRequest


/**
 <p>One or more DB cluster identifiers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable DBClusterIdentifiers;

/**
 <p>One or more DB instance identifiers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable DBInstanceIdentifiers;

/**
 <p>The identifier of the <code>DBProxy</code> that is associated with the <code>DBProxyTargetGroup</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBProxyName;

/**
 <p>The identifier of the <code>DBProxyTargetGroup</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetGroupName;

@end

/**
 
 */
@interface AWSrdsRegisterDBProxyTargetsResponse : AWSModel


/**
 <p>One or more <code>DBProxyTarget</code> objects that are created when you register targets with a target group.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDBProxyTarget *> * _Nullable DBProxyTargets;

@end

/**
 
 */
@interface AWSrdsRemoveFromGlobalClusterMessage : AWSRequest


/**
 <p> The Amazon Resource Name (ARN) identifying the cluster that was detached from the Aurora global database cluster. </p>
 */
@property (nonatomic, strong) NSString * _Nullable dbClusterIdentifier;

/**
 <p> The cluster identifier to detach from the Aurora global database cluster. </p>
 */
@property (nonatomic, strong) NSString * _Nullable globalClusterIdentifier;

@end

/**
 
 */
@interface AWSrdsRemoveFromGlobalClusterResult : AWSModel


/**
 <p>A data type representing an Aurora global database.</p>
 */
@property (nonatomic, strong) AWSrdsGlobalCluster * _Nullable globalCluster;

@end

/**
 
 */
@interface AWSrdsRemoveRoleFromDBClusterMessage : AWSRequest


/**
 <p>The name of the DB cluster to disassociate the IAM role from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>The name of the feature for the DB cluster that the IAM role is to be disassociated from. For the list of supported feature names, see <a>DBEngineVersion</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable featureName;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role to disassociate from the Aurora DB cluster, for example <code>arn:aws:iam::123456789012:role/AuroraAccessRole</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSrdsRemoveRoleFromDBInstanceMessage : AWSRequest


/**
 <p>The name of the DB instance to disassociate the IAM role from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p>The name of the feature for the DB instance that the IAM role is to be disassociated from. For the list of supported feature names, see <code>DBEngineVersion</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable featureName;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role to disassociate from the DB instance, for example <code>arn:aws:iam::123456789012:role/AccessRole</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p/>
 Required parameters: [SubscriptionName, SourceIdentifier]
 */
@interface AWSrdsRemoveSourceIdentifierFromSubscriptionMessage : AWSRequest


/**
 <p> The source identifier to be removed from the subscription, such as the <b>DB instance identifier</b> for a DB instance or the name of a security group. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceIdentifier;

/**
 <p>The name of the RDS event notification subscription you want to remove a source identifier from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionName;

@end

/**
 
 */
@interface AWSrdsRemoveSourceIdentifierFromSubscriptionResult : AWSModel


/**
 <p>Contains the results of a successful invocation of the <code>DescribeEventSubscriptions</code> action.</p>
 */
@property (nonatomic, strong) AWSrdsEventSubscription * _Nullable eventSubscription;

@end

/**
 <p/>
 Required parameters: [ResourceName, TagKeys]
 */
@interface AWSrdsRemoveTagsFromResourceMessage : AWSRequest


/**
 <p>The Amazon RDS resource that the tags are removed from. This value is an Amazon Resource Name (ARN). For information about creating an ARN, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing"> Constructing an ARN for Amazon RDS</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

/**
 <p>The tag key (name) of the tag to be removed.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 <p> This data type is used as a response element in the <code>DescribeReservedDBInstances</code> and <code>PurchaseReservedDBInstancesOffering</code> actions. </p>
 */
@interface AWSrdsReservedDBInstance : AWSModel


/**
 <p>The currency code for the reserved DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currencyCode;

/**
 <p>The DB instance class for the reserved DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceClass;

/**
 <p>The number of reserved DB instances.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable DBInstanceCount;

/**
 <p>The duration of the reservation in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p>The fixed price charged for this reserved DB instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fixedPrice;

/**
 <p>The unique identifier for the lease associated with the reserved DB instance.</p><note><p>AWS Support might request the lease ID for an issue related to a reserved DB instance.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable leaseId;

/**
 <p>Indicates if the reservation applies to Multi-AZ deployments.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiAZ;

/**
 <p>The offering type of this reserved DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable offeringType;

/**
 <p>The description of the reserved DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productDescription;

/**
 <p>The recurring price charged to run this reserved DB instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsRecurringCharge *> * _Nullable recurringCharges;

/**
 <p>The Amazon Resource Name (ARN) for the reserved DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedDBInstanceArn;

/**
 <p>The unique identifier for the reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedDBInstanceId;

/**
 <p>The offering identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedDBInstancesOfferingId;

/**
 <p>The time the reservation started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The state of the reserved DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable state;

/**
 <p>The hourly price charged for this reserved DB instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable usagePrice;

@end

/**
 <p> Contains the result of a successful invocation of the <code>DescribeReservedDBInstances</code> action. </p>
 */
@interface AWSrdsReservedDBInstanceMessage : AWSModel


/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of reserved DB instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsReservedDBInstance *> * _Nullable reservedDBInstances;

@end

/**
 <p> This data type is used as a response element in the <code>DescribeReservedDBInstancesOfferings</code> action. </p>
 */
@interface AWSrdsReservedDBInstancesOffering : AWSModel


/**
 <p>The currency code for the reserved DB instance offering.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currencyCode;

/**
 <p>The DB instance class for the reserved DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceClass;

/**
 <p>The duration of the offering in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p>The fixed price charged for this offering.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fixedPrice;

/**
 <p>Indicates if the offering applies to Multi-AZ deployments.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiAZ;

/**
 <p>The offering type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable offeringType;

/**
 <p>The database engine used by the offering.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productDescription;

/**
 <p>The recurring price charged to run this reserved DB instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsRecurringCharge *> * _Nullable recurringCharges;

/**
 <p>The offering identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedDBInstancesOfferingId;

/**
 <p>The hourly price charged for this offering.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable usagePrice;

@end

/**
 <p> Contains the result of a successful invocation of the <code>DescribeReservedDBInstancesOfferings</code> action. </p>
 */
@interface AWSrdsReservedDBInstancesOfferingMessage : AWSModel


/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of reserved DB instance offerings.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsReservedDBInstancesOffering *> * _Nullable reservedDBInstancesOfferings;

@end

/**
 <p/>
 Required parameters: [DBClusterParameterGroupName]
 */
@interface AWSrdsResetDBClusterParameterGroupMessage : AWSRequest


/**
 <p>The name of the DB cluster parameter group to reset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterParameterGroupName;

/**
 <p>A list of parameter names in the DB cluster parameter group to reset to the default values. You can't use this parameter if the <code>ResetAllParameters</code> parameter is enabled.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsParameter *> * _Nullable parameters;

/**
 <p>A value that indicates whether to reset all parameters in the DB cluster parameter group to their default values. You can't use this parameter if there is a list of parameter names specified for the <code>Parameters</code> parameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable resetAllParameters;

@end

/**
 <p/>
 Required parameters: [DBParameterGroupName]
 */
@interface AWSrdsResetDBParameterGroupMessage : AWSRequest


/**
 <p>The name of the DB parameter group.</p><p>Constraints:</p><ul><li><p>Must match the name of an existing <code>DBParameterGroup</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupName;

/**
 <p>To reset the entire DB parameter group, specify the <code>DBParameterGroup</code> name and <code>ResetAllParameters</code> parameters. To reset specific parameters, provide a list of the following: <code>ParameterName</code> and <code>ApplyMethod</code>. A maximum of 20 parameters can be modified in a single request.</p><p><b>MySQL</b></p><p>Valid Values (for Apply method): <code>immediate</code> | <code>pending-reboot</code></p><p>You can use the immediate value with dynamic parameters only. You can use the <code>pending-reboot</code> value for both dynamic and static parameters, and changes are applied when DB instance reboots.</p><p><b>MariaDB</b></p><p>Valid Values (for Apply method): <code>immediate</code> | <code>pending-reboot</code></p><p>You can use the immediate value with dynamic parameters only. You can use the <code>pending-reboot</code> value for both dynamic and static parameters, and changes are applied when DB instance reboots.</p><p><b>Oracle</b></p><p>Valid Values (for Apply method): <code>pending-reboot</code></p>
 */
@property (nonatomic, strong) NSArray<AWSrdsParameter *> * _Nullable parameters;

/**
 <p> A value that indicates whether to reset all parameters in the DB parameter group to default values. By default, all parameters in the DB parameter group are reset to default values. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable resetAllParameters;

@end

/**
 <p>Describes the pending maintenance actions for a resource.</p>
 */
@interface AWSrdsResourcePendingMaintenanceActions : AWSModel


/**
 <p>A list that provides details about the pending maintenance actions for the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsPendingMaintenanceAction *> * _Nullable pendingMaintenanceActionDetails;

/**
 <p>The ARN of the resource that has pending maintenance actions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceIdentifier;

@end

/**
 
 */
@interface AWSrdsRestoreDBClusterFromS3Message : AWSRequest


/**
 <p>A list of Availability Zones (AZs) where instances in the restored DB cluster can be created.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 <p>The target backtrack window, in seconds. To disable backtracking, set this value to 0.</p><p>Default: 0</p><p>Constraints:</p><ul><li><p>If specified, this value must be set to a number from 0 to 259,200 (72 hours).</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable backtrackWindow;

/**
 <p>The number of days for which automated backups of the restored DB cluster are retained. You must specify a minimum value of 1.</p><p>Default: 1</p><p>Constraints:</p><ul><li><p>Must be a value from 1 to 35</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupRetentionPeriod;

/**
 <p>A value that indicates that the restored DB cluster should be associated with the specified CharacterSet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable characterSetName;

/**
 <p>A value that indicates whether to copy all tags from the restored DB cluster to snapshots of the restored DB cluster. The default is not to copy them.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicateTagsToSnapshot;

/**
 <p>The name of the DB cluster to create from the source data in the Amazon S3 bucket. This parameter is isn't case-sensitive.</p><p>Constraints:</p><ul><li><p>Must contain from 1 to 63 letters, numbers, or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens.</p></li></ul><p>Example: <code>my-cluster1</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>The name of the DB cluster parameter group to associate with the restored DB cluster. If this argument is omitted, <code>default.aurora5.6</code> is used. </p><p>Constraints:</p><ul><li><p>If supplied, must match the name of an existing DBClusterParameterGroup.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterParameterGroupName;

/**
 <p>A DB subnet group to associate with the restored DB cluster.</p><p>Constraints: If supplied, must match the name of an existing DBSubnetGroup. </p><p>Example: <code>mySubnetgroup</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroupName;

/**
 <p>The database name for the restored DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p>Specify the Active Directory directory ID to restore the DB cluster in. The domain must be created prior to this operation. </p><p> For Amazon Aurora DB clusters, Amazon RDS can use Kerberos Authentication to authenticate users that connect to the DB cluster. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/kerberos-authentication.html">Kerberos Authentication</a> in the <i>Amazon Aurora User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

/**
 <p>Specify the name of the IAM role to be used when making API calls to the Directory Service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainIAMRoleName;

/**
 <p>The list of logs that the restored DB cluster is to export to CloudWatch Logs. The values in the list depend on the DB engine being used. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing Database Logs to Amazon CloudWatch Logs</a> in the <i>Amazon Aurora User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable enableCloudwatchLogsExports;

/**
 <p>A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.html"> IAM Database Authentication</a> in the <i>Amazon Aurora User Guide.</i></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableIAMDatabaseAuthentication;

/**
 <p>The name of the database engine to be used for the restored DB cluster.</p><p>Valid Values: <code>aurora</code>, <code>aurora-postgresql</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The version number of the database engine to use.</p><p>To list all of the available engine versions for <code>aurora</code> (for MySQL 5.6-compatible Aurora), use the following command:</p><p><code>aws rds describe-db-engine-versions --engine aurora --query "DBEngineVersions[].EngineVersion"</code></p><p>To list all of the available engine versions for <code>aurora-mysql</code> (for MySQL 5.7-compatible Aurora), use the following command:</p><p><code>aws rds describe-db-engine-versions --engine aurora-mysql --query "DBEngineVersions[].EngineVersion"</code></p><p>To list all of the available engine versions for <code>aurora-postgresql</code>, use the following command:</p><p><code>aws rds describe-db-engine-versions --engine aurora-postgresql --query "DBEngineVersions[].EngineVersion"</code></p><p><b>Aurora MySQL</b></p><p>Example: <code>5.6.10a</code>, <code>5.6.mysql_aurora.1.19.2</code>, <code>5.7.12</code>, <code>5.7.mysql_aurora.2.04.5</code></p><p><b>Aurora PostgreSQL</b></p><p>Example: <code>9.6.3</code>, <code>10.7</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The AWS KMS key identifier for an encrypted DB cluster.</p><p>The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If you are creating a DB cluster with the same AWS account that owns the KMS encryption key used to encrypt the new DB cluster, then you can use the KMS key alias instead of the ARN for the KM encryption key.</p><p>If the StorageEncrypted parameter is enabled, and you do not specify a value for the <code>KmsKeyId</code> parameter, then Amazon RDS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The password for the master database user. This password can contain any printable ASCII character except "/", """, or "@".</p><p>Constraints: Must contain from 8 to 41 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUserPassword;

/**
 <p>The name of the master user for the restored DB cluster.</p><p>Constraints:</p><ul><li><p>Must be 1 to 16 letters or numbers.</p></li><li><p>First character must be a letter.</p></li><li><p>Can't be a reserved word for the chosen database engine.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable masterUsername;

/**
 <p>A value that indicates that the restored DB cluster should be associated with the specified option group.</p><p>Permanent options can't be removed from an option group. An option group can't be removed from a DB cluster once it is associated with a DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

/**
 <p>The port number on which the instances in the restored DB cluster accept connections.</p><p> Default: <code>3306</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The daily time range during which automated backups are created if automated backups are enabled using the <code>BackupRetentionPeriod</code> parameter. </p><p>The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region. To see the time blocks available, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow.Aurora"> Adjusting the Preferred Maintenance Window</a> in the <i>Amazon Aurora User Guide.</i></p><p>Constraints:</p><ul><li><p>Must be in the format <code>hh24:mi-hh24:mi</code>.</p></li><li><p>Must be in Universal Coordinated Time (UTC).</p></li><li><p>Must not conflict with the preferred maintenance window.</p></li><li><p>Must be at least 30 minutes.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable preferredBackupWindow;

/**
 <p>The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC).</p><p>Format: <code>ddd:hh24:mi-ddd:hh24:mi</code></p><p>The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region, occurring on a random day of the week. To see the time blocks available, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow.Aurora"> Adjusting the Preferred Maintenance Window</a> in the <i>Amazon Aurora User Guide.</i></p><p>Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.</p><p>Constraints: Minimum 30-minute window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>The name of the Amazon S3 bucket that contains the data used to create the Amazon Aurora DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3BucketName;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that authorizes Amazon RDS to access the Amazon S3 bucket on your behalf.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3IngestionRoleArn;

/**
 <p>The prefix for all of the file names that contain the data used to create the Amazon Aurora DB cluster. If you do not specify a <b>SourceS3Prefix</b> value, then the Amazon Aurora DB cluster is created by using all of the files in the Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Prefix;

/**
 <p>The identifier for the database engine that was backed up to create the files stored in the Amazon S3 bucket. </p><p>Valid values: <code>mysql</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceEngine;

/**
 <p>The version of the database that the backup files were created from.</p><p>MySQL version 5.5 and 5.6 are supported. </p><p>Example: <code>5.6.22</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceEngineVersion;

/**
 <p>A value that indicates whether the restored DB cluster is encrypted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable storageEncrypted;

/**
 <p>A list of tags. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

/**
 <p>A list of EC2 VPC security groups to associate with the restored DB cluster.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSecurityGroupIds;

@end

/**
 
 */
@interface AWSrdsRestoreDBClusterFromS3Result : AWSModel


/**
 <p>Contains the details of an Amazon Aurora DB cluster. </p><p>This data type is used as a response element in the <code>DescribeDBClusters</code>, <code>StopDBCluster</code>, and <code>StartDBCluster</code> actions. </p>
 */
@property (nonatomic, strong) AWSrdsDBCluster * _Nullable DBCluster;

@end

/**
 <p/>
 Required parameters: [DBClusterIdentifier, SnapshotIdentifier, Engine]
 */
@interface AWSrdsRestoreDBClusterFromSnapshotMessage : AWSRequest


/**
 <p>Provides the list of Availability Zones (AZs) where instances in the restored DB cluster can be created.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 <p>The target backtrack window, in seconds. To disable backtracking, set this value to 0.</p><p>Default: 0</p><p>Constraints:</p><ul><li><p>If specified, this value must be set to a number from 0 to 259,200 (72 hours).</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable backtrackWindow;

/**
 <p>A value that indicates whether to copy all tags from the restored DB cluster to snapshots of the restored DB cluster. The default is not to copy them.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicateTagsToSnapshot;

/**
 <p>The name of the DB cluster to create from the DB snapshot or DB cluster snapshot. This parameter isn't case-sensitive.</p><p>Constraints:</p><ul><li><p>Must contain from 1 to 63 letters, numbers, or hyphens</p></li><li><p>First character must be a letter</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens</p></li></ul><p>Example: <code>my-snapshot-id</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>The name of the DB cluster parameter group to associate with this DB cluster. If this argument is omitted, the default DB cluster parameter group for the specified engine is used.</p><p>Constraints:</p><ul><li><p>If supplied, must match the name of an existing default DB cluster parameter group.</p></li><li><p>Must be 1 to 255 letters, numbers, or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterParameterGroupName;

/**
 <p>The name of the DB subnet group to use for the new DB cluster.</p><p>Constraints: If supplied, must match the name of an existing DB subnet group.</p><p>Example: <code>mySubnetgroup</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroupName;

/**
 <p>The database name for the restored DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p>Specify the Active Directory directory ID to restore the DB cluster in. The domain must be created prior to this operation. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

/**
 <p>Specify the name of the IAM role to be used when making API calls to the Directory Service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainIAMRoleName;

/**
 <p>The list of logs that the restored DB cluster is to export to Amazon CloudWatch Logs. The values in the list depend on the DB engine being used. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing Database Logs to Amazon CloudWatch Logs </a> in the <i>Amazon Aurora User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable enableCloudwatchLogsExports;

/**
 <p>A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.html"> IAM Database Authentication</a> in the <i>Amazon Aurora User Guide.</i></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableIAMDatabaseAuthentication;

/**
 <p>The database engine to use for the new DB cluster.</p><p>Default: The same as source</p><p>Constraint: Must be compatible with the engine of the source</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The DB engine mode of the DB cluster, either <code>provisioned</code>, <code>serverless</code>, <code>parallelquery</code>, <code>global</code>, or <code>multimaster</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineMode;

/**
 <p>The version of the database engine to use for the new DB cluster.</p><p>To list all of the available engine versions for <code>aurora</code> (for MySQL 5.6-compatible Aurora), use the following command:</p><p><code>aws rds describe-db-engine-versions --engine aurora --query "DBEngineVersions[].EngineVersion"</code></p><p>To list all of the available engine versions for <code>aurora-mysql</code> (for MySQL 5.7-compatible Aurora), use the following command:</p><p><code>aws rds describe-db-engine-versions --engine aurora-mysql --query "DBEngineVersions[].EngineVersion"</code></p><p>To list all of the available engine versions for <code>aurora-postgresql</code>, use the following command:</p><p><code>aws rds describe-db-engine-versions --engine aurora-postgresql --query "DBEngineVersions[].EngineVersion"</code></p><note><p>If you aren't using the default engine version, then you must specify the engine version.</p></note><p><b>Aurora MySQL</b></p><p>Example: <code>5.6.10a</code>, <code>5.6.mysql_aurora.1.19.2</code>, <code>5.7.12</code>, <code>5.7.mysql_aurora.2.04.5</code></p><p><b>Aurora PostgreSQL</b></p><p>Example: <code>9.6.3</code>, <code>10.7</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The AWS KMS key identifier to use when restoring an encrypted DB cluster from a DB snapshot or DB cluster snapshot.</p><p>The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If you are restoring a DB cluster with the same AWS account that owns the KMS encryption key used to encrypt the new DB cluster, then you can use the KMS key alias instead of the ARN for the KMS encryption key.</p><p>If you don't specify a value for the <code>KmsKeyId</code> parameter, then the following occurs:</p><ul><li><p>If the DB snapshot or DB cluster snapshot in <code>SnapshotIdentifier</code> is encrypted, then the restored DB cluster is encrypted using the KMS key that was used to encrypt the DB snapshot or DB cluster snapshot.</p></li><li><p>If the DB snapshot or DB cluster snapshot in <code>SnapshotIdentifier</code> isn't encrypted, then the restored DB cluster isn't encrypted.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The name of the option group to use for the restored DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

/**
 <p>The port number on which the new DB cluster accepts connections.</p><p>Constraints: This value must be <code>1150-65535</code></p><p>Default: The same port as the original DB cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>For DB clusters in <code>serverless</code> DB engine mode, the scaling properties of the DB cluster.</p>
 */
@property (nonatomic, strong) AWSrdsScalingConfiguration * _Nullable scalingConfiguration;

/**
 <p>The identifier for the DB snapshot or DB cluster snapshot to restore from.</p><p>You can use either the name or the Amazon Resource Name (ARN) to specify a DB cluster snapshot. However, you can use only the ARN to specify a DB snapshot.</p><p>Constraints:</p><ul><li><p>Must match the identifier of an existing Snapshot.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotIdentifier;

/**
 <p>The tags to be assigned to the restored DB cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

/**
 <p>A list of VPC security groups that the new DB cluster will belong to.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSecurityGroupIds;

@end

/**
 
 */
@interface AWSrdsRestoreDBClusterFromSnapshotResult : AWSModel


/**
 <p>Contains the details of an Amazon Aurora DB cluster. </p><p>This data type is used as a response element in the <code>DescribeDBClusters</code>, <code>StopDBCluster</code>, and <code>StartDBCluster</code> actions. </p>
 */
@property (nonatomic, strong) AWSrdsDBCluster * _Nullable DBCluster;

@end

/**
 <p/>
 Required parameters: [DBClusterIdentifier, SourceDBClusterIdentifier]
 */
@interface AWSrdsRestoreDBClusterToPointInTimeMessage : AWSRequest


/**
 <p>The target backtrack window, in seconds. To disable backtracking, set this value to 0.</p><p>Default: 0</p><p>Constraints:</p><ul><li><p>If specified, this value must be set to a number from 0 to 259,200 (72 hours).</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable backtrackWindow;

/**
 <p>A value that indicates whether to copy all tags from the restored DB cluster to snapshots of the restored DB cluster. The default is not to copy them.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicateTagsToSnapshot;

/**
 <p>The name of the new DB cluster to be created.</p><p>Constraints:</p><ul><li><p>Must contain from 1 to 63 letters, numbers, or hyphens</p></li><li><p>First character must be a letter</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

/**
 <p>The name of the DB cluster parameter group to associate with this DB cluster. If this argument is omitted, the default DB cluster parameter group for the specified engine is used.</p><p>Constraints:</p><ul><li><p>If supplied, must match the name of an existing DB cluster parameter group.</p></li><li><p>Must be 1 to 255 letters, numbers, or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterParameterGroupName;

/**
 <p>The DB subnet group name to use for the new DB cluster.</p><p>Constraints: If supplied, must match the name of an existing DBSubnetGroup.</p><p>Example: <code>mySubnetgroup</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroupName;

/**
 <p>A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p>Specify the Active Directory directory ID to restore the DB cluster in. The domain must be created prior to this operation. </p><p> For Amazon Aurora DB clusters, Amazon RDS can use Kerberos Authentication to authenticate users that connect to the DB cluster. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/kerberos-authentication.html">Kerberos Authentication</a> in the <i>Amazon Aurora User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

/**
 <p>Specify the name of the IAM role to be used when making API calls to the Directory Service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainIAMRoleName;

/**
 <p>The list of logs that the restored DB cluster is to export to CloudWatch Logs. The values in the list depend on the DB engine being used. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing Database Logs to Amazon CloudWatch Logs</a> in the <i>Amazon Aurora User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable enableCloudwatchLogsExports;

/**
 <p>A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.html"> IAM Database Authentication</a> in the <i>Amazon Aurora User Guide.</i></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableIAMDatabaseAuthentication;

/**
 <p>The AWS KMS key identifier to use when restoring an encrypted DB cluster from an encrypted DB cluster.</p><p>The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If you are restoring a DB cluster with the same AWS account that owns the KMS encryption key used to encrypt the new DB cluster, then you can use the KMS key alias instead of the ARN for the KMS encryption key.</p><p>You can restore to a new DB cluster and encrypt the new DB cluster with a KMS key that is different than the KMS key used to encrypt the source DB cluster. The new DB cluster is encrypted with the KMS key identified by the <code>KmsKeyId</code> parameter.</p><p>If you don't specify a value for the <code>KmsKeyId</code> parameter, then the following occurs:</p><ul><li><p>If the DB cluster is encrypted, then the restored DB cluster is encrypted using the KMS key that was used to encrypt the source DB cluster.</p></li><li><p>If the DB cluster isn't encrypted, then the restored DB cluster isn't encrypted.</p></li></ul><p>If <code>DBClusterIdentifier</code> refers to a DB cluster that isn't encrypted, then the restore request is rejected.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The name of the option group for the new DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

/**
 <p>The port number on which the new DB cluster accepts connections.</p><p>Constraints: A value from <code>1150-65535</code>. </p><p>Default: The default port for the engine.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The date and time to restore the DB cluster to.</p><p>Valid Values: Value must be a time in Universal Coordinated Time (UTC) format</p><p>Constraints:</p><ul><li><p>Must be before the latest restorable time for the DB instance</p></li><li><p>Must be specified if <code>UseLatestRestorableTime</code> parameter isn't provided</p></li><li><p>Can't be specified if the <code>UseLatestRestorableTime</code> parameter is enabled</p></li><li><p>Can't be specified if the <code>RestoreType</code> parameter is <code>copy-on-write</code></p></li></ul><p>Example: <code>2015-03-07T23:45:00Z</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable restoreToTime;

/**
 <p>The type of restore to be performed. You can specify one of the following values:</p><ul><li><p><code>full-copy</code> - The new DB cluster is restored as a full copy of the source DB cluster.</p></li><li><p><code>copy-on-write</code> - The new DB cluster is restored as a clone of the source DB cluster.</p></li></ul><p>Constraints: You can't specify <code>copy-on-write</code> if the engine version of the source DB cluster is earlier than 1.11.</p><p>If you don't specify a <code>RestoreType</code> value, then the new DB cluster is restored as a full copy of the source DB cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable restoreType;

/**
 <p>The identifier of the source DB cluster from which to restore.</p><p>Constraints:</p><ul><li><p>Must match the identifier of an existing DBCluster.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable sourceDBClusterIdentifier;

/**
 <p>A list of tags. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

/**
 <p>A value that indicates whether to restore the DB cluster to the latest restorable backup time. By default, the DB cluster isn't restored to the latest restorable backup time. </p><p>Constraints: Can't be specified if <code>RestoreToTime</code> parameter is provided.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable useLatestRestorableTime;

/**
 <p>A list of VPC security groups that the new DB cluster belongs to.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSecurityGroupIds;

@end

/**
 
 */
@interface AWSrdsRestoreDBClusterToPointInTimeResult : AWSModel


/**
 <p>Contains the details of an Amazon Aurora DB cluster. </p><p>This data type is used as a response element in the <code>DescribeDBClusters</code>, <code>StopDBCluster</code>, and <code>StartDBCluster</code> actions. </p>
 */
@property (nonatomic, strong) AWSrdsDBCluster * _Nullable DBCluster;

@end

/**
 <p/>
 Required parameters: [DBInstanceIdentifier, DBSnapshotIdentifier]
 */
@interface AWSrdsRestoreDBInstanceFromDBSnapshotMessage : AWSRequest


/**
 <p>A value that indicates whether minor version upgrades are applied automatically to the DB instance during the maintenance window.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoMinorVersionUpgrade;

/**
 <p>The Availability Zone (AZ) where the DB instance will be created.</p><p>Default: A random, system-chosen Availability Zone.</p><p>Constraint: You can't specify the <code>AvailabilityZone</code> parameter if the DB instance is a Multi-AZ deployment.</p><p>Example: <code>us-east-1a</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>A value that indicates whether to copy all tags from the restored DB instance to snapshots of the DB instance. By default, tags are not copied.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicateTagsToSnapshot;

/**
 <p>The compute and memory capacity of the Amazon RDS DB instance, for example, <code>db.m4.large</code>. Not all DB instance classes are available in all AWS Regions, or for all database engines. For the full list of DB instance classes, and availability for your engine, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html">DB Instance Class</a> in the <i>Amazon RDS User Guide.</i></p><p>Default: The same DBInstanceClass as the original DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceClass;

/**
 <p>Name of the DB instance to create from the DB snapshot. This parameter isn't case-sensitive.</p><p>Constraints:</p><ul><li><p>Must contain from 1 to 63 numbers, letters, or hyphens</p></li><li><p>First character must be a letter</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens</p></li></ul><p>Example: <code>my-snapshot-id</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p>The database name for the restored DB instance.</p><note><p>This parameter doesn't apply to the MySQL, PostgreSQL, or MariaDB engines.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable DBName;

/**
 <p>The name of the DB parameter group to associate with this DB instance.</p><p>If you do not specify a value for <code>DBParameterGroupName</code>, then the default <code>DBParameterGroup</code> for the specified DB engine is used.</p><p>Constraints:</p><ul><li><p>If supplied, must match the name of an existing DBParameterGroup.</p></li><li><p>Must be 1 to 255 letters, numbers, or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupName;

/**
 <p>The identifier for the DB snapshot to restore from.</p><p>Constraints:</p><ul><li><p>Must match the identifier of an existing DBSnapshot.</p></li><li><p>If you are restoring from a shared manual DB snapshot, the <code>DBSnapshotIdentifier</code> must be the ARN of the shared DB snapshot.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBSnapshotIdentifier;

/**
 <p>The DB subnet group name to use for the new instance.</p><p>Constraints: If supplied, must match the name of an existing DBSubnetGroup.</p><p>Example: <code>mySubnetgroup</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroupName;

/**
 <p>A value that indicates whether the DB instance has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html"> Deleting a DB Instance</a>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p>Specify the Active Directory directory ID to restore the DB instance in. The domain must be created prior to this operation. Currently, only Microsoft SQL Server and Oracle DB instances can be created in an Active Directory Domain. </p><p>For Microsoft SQL Server DB instances, Amazon RDS can use Windows Authentication to authenticate users that connect to the DB instance. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_SQLServerWinAuth.html"> Using Windows Authentication with an Amazon RDS DB Instance Running Microsoft SQL Server</a> in the <i>Amazon RDS User Guide</i>.</p><p>For Oracle DB instances, Amazon RDS can use Kerberos Authentication to authenticate users that connect to the DB instance. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/oracle-kerberos.html"> Using Kerberos Authentication with Amazon RDS for Oracle</a> in the <i>Amazon RDS User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

/**
 <p>Specify the name of the IAM role to be used when making API calls to the Directory Service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainIAMRoleName;

/**
 <p>The list of logs that the restored DB instance is to export to CloudWatch Logs. The values in the list depend on the DB engine being used. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing Database Logs to Amazon CloudWatch Logs</a> in the <i>Amazon Aurora User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable enableCloudwatchLogsExports;

/**
 <p>A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled. For information about the supported DB engines, see <a>CreateDBInstance</a>.</p><p>For more information about IAM database authentication, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html"> IAM Database Authentication for MySQL and PostgreSQL</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableIAMDatabaseAuthentication;

/**
 <p>The database engine to use for the new instance.</p><p>Default: The same as source</p><p>Constraint: Must be compatible with the engine of the source. For example, you can restore a MariaDB 10.1 DB instance from a MySQL 5.6 snapshot.</p><p>Valid Values:</p><ul><li><p><code>mariadb</code></p></li><li><p><code>mysql</code></p></li><li><p><code>oracle-ee</code></p></li><li><p><code>oracle-se2</code></p></li><li><p><code>oracle-se1</code></p></li><li><p><code>oracle-se</code></p></li><li><p><code>postgres</code></p></li><li><p><code>sqlserver-ee</code></p></li><li><p><code>sqlserver-se</code></p></li><li><p><code>sqlserver-ex</code></p></li><li><p><code>sqlserver-web</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>Specifies the amount of provisioned IOPS for the DB instance, expressed in I/O operations per second. If this parameter isn't specified, the IOPS value is taken from the backup. If this parameter is set to 0, the new instance is converted to a non-PIOPS instance. The conversion takes additional time, though your DB instance is available for connections before the conversion starts. </p><p>The provisioned IOPS value must follow the requirements for your database engine. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Storage.html#USER_PIOPS">Amazon RDS Provisioned IOPS Storage to Improve Performance</a> in the <i>Amazon RDS User Guide.</i></p><p>Constraints: Must be an integer greater than 1000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iops;

/**
 <p>License model information for the restored DB instance.</p><p>Default: Same as source.</p><p> Valid values: <code>license-included</code> | <code>bring-your-own-license</code> | <code>general-public-license</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable licenseModel;

/**
 <p>A value that indicates whether the DB instance is a Multi-AZ deployment.</p><p>Constraint: You can't specify the <code>AvailabilityZone</code> parameter if the DB instance is a Multi-AZ deployment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiAZ;

/**
 <p>The name of the option group to be used for the restored DB instance.</p><p>Permanent options, such as the TDE option for Oracle Advanced Security TDE, can't be removed from an option group, and that option group can't be removed from a DB instance once it is associated with a DB instance</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

/**
 <p>The port number on which the database accepts connections.</p><p>Default: The same port as the original DB instance</p><p>Constraints: Value must be <code>1150-65535</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The number of CPU cores and the number of threads per core for the DB instance class of the DB instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsProcessorFeature *> * _Nullable processorFeatures;

/**
 <p>A value that indicates whether the DB instance is publicly accessible. When the DB instance is publicly accessible, it is an Internet-facing instance with a publicly resolvable DNS name, which resolves to a public IP address. When the DB instance isn't publicly accessible, it is an internal instance with a DNS name that resolves to a private IP address. For more information, see <a>CreateDBInstance</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publiclyAccessible;

/**
 <p>Specifies the storage type to be associated with the DB instance.</p><p> Valid values: <code>standard | gp2 | io1</code></p><p> If you specify <code>io1</code>, you must also include a value for the <code>Iops</code> parameter. </p><p> Default: <code>io1</code> if the <code>Iops</code> parameter is specified, otherwise <code>gp2</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable storageType;

/**
 <p>A list of tags. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

/**
 <p>The ARN from the key store with which to associate the instance for TDE encryption.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tdeCredentialArn;

/**
 <p>The password for the given ARN from the key store in order to access the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tdeCredentialPassword;

/**
 <p>A value that indicates whether the DB instance class of the DB instance uses its default processor features.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable useDefaultProcessorFeatures;

/**
 <p> A list of EC2 VPC security groups to associate with this DB instance. </p><p> Default: The default EC2 VPC security group for the DB subnet group's VPC. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSecurityGroupIds;

@end

/**
 
 */
@interface AWSrdsRestoreDBInstanceFromDBSnapshotResult : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB instance. </p><p>This data type is used as a response element in the <code>DescribeDBInstances</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBInstance * _Nullable DBInstance;

@end

/**
 
 */
@interface AWSrdsRestoreDBInstanceFromS3Message : AWSRequest


/**
 <p>The amount of storage (in gigabytes) to allocate initially for the DB instance. Follow the allocation rules specified in <code>CreateDBInstance</code>. </p><note><p>Be sure to allocate enough memory for your new DB instance so that the restore operation can succeed. You can also allocate additional memory for future growth. </p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedStorage;

/**
 <p>A value that indicates whether minor engine upgrades are applied automatically to the DB instance during the maintenance window. By default, minor engine upgrades are not applied automatically. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoMinorVersionUpgrade;

/**
 <p>The Availability Zone that the DB instance is created in. For information about AWS Regions and Availability Zones, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html">Regions and Availability Zones</a> in the <i>Amazon RDS User Guide.</i></p><p>Default: A random, system-chosen Availability Zone in the endpoint's AWS Region. </p><p> Example: <code>us-east-1d</code></p><p>Constraint: The <code>AvailabilityZone</code> parameter can't be specified if the DB instance is a Multi-AZ deployment. The specified Availability Zone must be in the same AWS Region as the current endpoint. </p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The number of days for which automated backups are retained. Setting this parameter to a positive number enables backups. For more information, see <code>CreateDBInstance</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupRetentionPeriod;

/**
 <p>A value that indicates whether to copy all tags from the DB instance to snapshots of the DB instance. By default, tags are not copied. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicateTagsToSnapshot;

/**
 <p>The compute and memory capacity of the DB instance, for example, <code>db.m4.large</code>. Not all DB instance classes are available in all AWS Regions, or for all database engines. For the full list of DB instance classes, and availability for your engine, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html">DB Instance Class</a> in the <i>Amazon RDS User Guide.</i></p><p>Importing from Amazon S3 isn't supported on the db.t2.micro DB instance class. </p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceClass;

/**
 <p>The DB instance identifier. This parameter is stored as a lowercase string. </p><p>Constraints:</p><ul><li><p>Must contain from 1 to 63 letters, numbers, or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens.</p></li></ul><p>Example: <code>mydbinstance</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p>The name of the database to create when the DB instance is created. Follow the naming rules specified in <code>CreateDBInstance</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable DBName;

/**
 <p>The name of the DB parameter group to associate with this DB instance.</p><p>If you do not specify a value for <code>DBParameterGroupName</code>, then the default <code>DBParameterGroup</code> for the specified DB engine is used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupName;

/**
 <p>A list of DB security groups to associate with this DB instance.</p><p>Default: The default DB security group for the database engine.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable DBSecurityGroups;

/**
 <p>A DB subnet group to associate with this DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroupName;

/**
 <p>A value that indicates whether the DB instance has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html"> Deleting a DB Instance</a>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p>The list of logs that the restored DB instance is to export to CloudWatch Logs. The values in the list depend on the DB engine being used. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing Database Logs to Amazon CloudWatch Logs</a> in the <i>Amazon RDS User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable enableCloudwatchLogsExports;

/**
 <p>A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled. For information about the supported DB engines, see <a>CreateDBInstance</a>.</p><p>For more information about IAM database authentication, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html"> IAM Database Authentication for MySQL and PostgreSQL</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableIAMDatabaseAuthentication;

/**
 <p>A value that indicates whether to enable Performance Insights for the DB instance. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html">Using Amazon Performance Insights</a> in the <i>Amazon Relational Database Service User Guide</i>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enablePerformanceInsights;

/**
 <p>The name of the database engine to be used for this instance. </p><p>Valid Values: <code>mysql</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The version number of the database engine to use. Choose the latest minor version of your database engine. For information about engine versions, see <code>CreateDBInstance</code>, or call <code>DescribeDBEngineVersions</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The amount of Provisioned IOPS (input/output operations per second) to allocate initially for the DB instance. For information about valid Iops values, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Storage.html#USER_PIOPS">Amazon RDS Provisioned IOPS Storage to Improve Performance</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iops;

/**
 <p>The AWS KMS key identifier for an encrypted DB instance. </p><p>The KMS key identifier is the Amazon Resource Name (ARN) for the KMS encryption key. If you are creating a DB instance with the same AWS account that owns the KMS encryption key used to encrypt the new DB instance, then you can use the KMS key alias instead of the ARN for the KM encryption key. </p><p>If the <code>StorageEncrypted</code> parameter is enabled, and you do not specify a value for the <code>KmsKeyId</code> parameter, then Amazon RDS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region. </p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The license model for this DB instance. Use <code>general-public-license</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable licenseModel;

/**
 <p>The password for the master user. The password can include any printable ASCII character except "/", """, or "@". </p><p>Constraints: Must contain from 8 to 41 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUserPassword;

/**
 <p>The name for the master user. </p><p>Constraints: </p><ul><li><p>Must be 1 to 16 letters or numbers.</p></li><li><p>First character must be a letter.</p></li><li><p>Can't be a reserved word for the chosen database engine.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable masterUsername;

/**
 <p>The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. </p><p>If <code>MonitoringRoleArn</code> is specified, then you must also set <code>MonitoringInterval</code> to a value other than 0. </p><p>Valid Values: 0, 1, 5, 10, 15, 30, 60 </p><p>Default: <code>0</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable monitoringInterval;

/**
 <p>The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to Amazon CloudWatch Logs. For example, <code>arn:aws:iam:123456789012:role/emaccess</code>. For information on creating a monitoring role, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html#USER_Monitoring.OS.Enabling">Setting Up and Enabling Enhanced Monitoring</a> in the <i>Amazon RDS User Guide.</i></p><p>If <code>MonitoringInterval</code> is set to a value other than 0, then you must supply a <code>MonitoringRoleArn</code> value. </p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringRoleArn;

/**
 <p>A value that indicates whether the DB instance is a Multi-AZ deployment. If the DB instance is a Multi-AZ deployment, you can't set the <code>AvailabilityZone</code> parameter. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiAZ;

/**
 <p>The name of the option group to associate with this DB instance. If this argument is omitted, the default option group for the specified engine is used. </p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

/**
 <p>The AWS KMS key identifier for encryption of Performance Insights data. The KMS key ID is the Amazon Resource Name (ARN), the KMS key identifier, or the KMS key alias for the KMS encryption key. </p><p>If you do not specify a value for <code>PerformanceInsightsKMSKeyId</code>, then Amazon RDS uses your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable performanceInsightsKMSKeyId;

/**
 <p>The amount of time, in days, to retain Performance Insights data. Valid values are 7 or 731 (2 years). </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable performanceInsightsRetentionPeriod;

/**
 <p>The port number on which the database accepts connections. </p><p>Type: Integer </p><p>Valid Values: <code>1150</code>-<code>65535</code></p><p>Default: <code>3306</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The time range each day during which automated backups are created if automated backups are enabled. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html#USER_WorkingWithAutomatedBackups.BackupWindow">The Backup Window</a> in the <i>Amazon RDS User Guide.</i></p><p>Constraints:</p><ul><li><p>Must be in the format <code>hh24:mi-hh24:mi</code>.</p></li><li><p>Must be in Universal Coordinated Time (UTC).</p></li><li><p>Must not conflict with the preferred maintenance window.</p></li><li><p>Must be at least 30 minutes.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable preferredBackupWindow;

/**
 <p>The time range each week during which system maintenance can occur, in Universal Coordinated Time (UTC). For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Maintenance.html#Concepts.DBMaintenance">Amazon RDS Maintenance Window</a> in the <i>Amazon RDS User Guide.</i></p><p>Constraints:</p><ul><li><p>Must be in the format <code>ddd:hh24:mi-ddd:hh24:mi</code>.</p></li><li><p>Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.</p></li><li><p>Must be in Universal Coordinated Time (UTC).</p></li><li><p>Must not conflict with the preferred backup window.</p></li><li><p>Must be at least 30 minutes.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>The number of CPU cores and the number of threads per core for the DB instance class of the DB instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsProcessorFeature *> * _Nullable processorFeatures;

/**
 <p>A value that indicates whether the DB instance is publicly accessible. When the DB instance is publicly accessible, it is an Internet-facing instance with a publicly resolvable DNS name, which resolves to a public IP address. When the DB instance isn't publicly accessible, it is an internal instance with a DNS name that resolves to a private IP address. For more information, see <a>CreateDBInstance</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publiclyAccessible;

/**
 <p>The name of your Amazon S3 bucket that contains your database backup file. </p>
 */
@property (nonatomic, strong) NSString * _Nullable s3BucketName;

/**
 <p>An AWS Identity and Access Management (IAM) role to allow Amazon RDS to access your Amazon S3 bucket. </p>
 */
@property (nonatomic, strong) NSString * _Nullable s3IngestionRoleArn;

/**
 <p>The prefix of your Amazon S3 bucket. </p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Prefix;

/**
 <p>The name of the engine of your source database. </p><p>Valid Values: <code>mysql</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceEngine;

/**
 <p>The engine version of your source database. </p><p>Valid Values: <code>5.6</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceEngineVersion;

/**
 <p>A value that indicates whether the new DB instance is encrypted or not. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable storageEncrypted;

/**
 <p>Specifies the storage type to be associated with the DB instance. </p><p>Valid values: <code>standard</code> | <code>gp2</code> | <code>io1</code></p><p>If you specify <code>io1</code>, you must also include a value for the <code>Iops</code> parameter. </p><p>Default: <code>io1</code> if the <code>Iops</code> parameter is specified; otherwise <code>gp2</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable storageType;

/**
 <p>A list of tags to associate with this DB instance. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

/**
 <p>A value that indicates whether the DB instance class of the DB instance uses its default processor features.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable useDefaultProcessorFeatures;

/**
 <p>A list of VPC security groups to associate with this DB instance. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSecurityGroupIds;

@end

/**
 
 */
@interface AWSrdsRestoreDBInstanceFromS3Result : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB instance. </p><p>This data type is used as a response element in the <code>DescribeDBInstances</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBInstance * _Nullable DBInstance;

@end

/**
 <p/>
 Required parameters: [TargetDBInstanceIdentifier]
 */
@interface AWSrdsRestoreDBInstanceToPointInTimeMessage : AWSRequest


/**
 <p>A value that indicates whether minor version upgrades are applied automatically to the DB instance during the maintenance window.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoMinorVersionUpgrade;

/**
 <p>The Availability Zone (AZ) where the DB instance will be created.</p><p>Default: A random, system-chosen Availability Zone.</p><p>Constraint: You can't specify the <code>AvailabilityZone</code> parameter if the DB instance is a Multi-AZ deployment.</p><p>Example: <code>us-east-1a</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>A value that indicates whether to copy all tags from the restored DB instance to snapshots of the DB instance. By default, tags are not copied.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicateTagsToSnapshot;

/**
 <p>The compute and memory capacity of the Amazon RDS DB instance, for example, <code>db.m4.large</code>. Not all DB instance classes are available in all AWS Regions, or for all database engines. For the full list of DB instance classes, and availability for your engine, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html">DB Instance Class</a> in the <i>Amazon RDS User Guide.</i></p><p>Default: The same DBInstanceClass as the original DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceClass;

/**
 <p>The database name for the restored DB instance.</p><note><p>This parameter isn't used for the MySQL or MariaDB engines.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable DBName;

/**
 <p>The name of the DB parameter group to associate with this DB instance.</p><p>If you do not specify a value for <code>DBParameterGroupName</code>, then the default <code>DBParameterGroup</code> for the specified DB engine is used.</p><p>Constraints:</p><ul><li><p>If supplied, must match the name of an existing DBParameterGroup.</p></li><li><p>Must be 1 to 255 letters, numbers, or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable DBParameterGroupName;

/**
 <p>The DB subnet group name to use for the new instance.</p><p>Constraints: If supplied, must match the name of an existing DBSubnetGroup.</p><p>Example: <code>mySubnetgroup</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSubnetGroupName;

/**
 <p>A value that indicates whether the DB instance has deletion protection enabled. The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html"> Deleting a DB Instance</a>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p>Specify the Active Directory directory ID to restore the DB instance in. The domain must be created prior to this operation. Currently, only Microsoft SQL Server and Oracle DB instances can be created in an Active Directory Domain. </p><p>For Microsoft SQL Server DB instances, Amazon RDS can use Windows Authentication to authenticate users that connect to the DB instance. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_SQLServerWinAuth.html"> Using Windows Authentication with an Amazon RDS DB Instance Running Microsoft SQL Server</a> in the <i>Amazon RDS User Guide</i>.</p><p>For Oracle DB instances, Amazon RDS can use Kerberos Authentication to authenticate users that connect to the DB instance. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/oracle-kerberos.html"> Using Kerberos Authentication with Amazon RDS for Oracle</a> in the <i>Amazon RDS User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

/**
 <p>Specify the name of the IAM role to be used when making API calls to the Directory Service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainIAMRoleName;

/**
 <p>The list of logs that the restored DB instance is to export to CloudWatch Logs. The values in the list depend on the DB engine being used. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch">Publishing Database Logs to Amazon CloudWatch Logs</a> in the <i>Amazon RDS User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable enableCloudwatchLogsExports;

/**
 <p>A value that indicates whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts. By default, mapping is disabled. For information about the supported DB engines, see <a>CreateDBInstance</a>.</p><p>For more information about IAM database authentication, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html"> IAM Database Authentication for MySQL and PostgreSQL</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableIAMDatabaseAuthentication;

/**
 <p>The database engine to use for the new instance.</p><p>Default: The same as source</p><p>Constraint: Must be compatible with the engine of the source</p><p>Valid Values:</p><ul><li><p><code>mariadb</code></p></li><li><p><code>mysql</code></p></li><li><p><code>oracle-ee</code></p></li><li><p><code>oracle-se2</code></p></li><li><p><code>oracle-se1</code></p></li><li><p><code>oracle-se</code></p></li><li><p><code>postgres</code></p></li><li><p><code>sqlserver-ee</code></p></li><li><p><code>sqlserver-se</code></p></li><li><p><code>sqlserver-ex</code></p></li><li><p><code>sqlserver-web</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The amount of Provisioned IOPS (input/output operations per second) to be initially allocated for the DB instance.</p><p>Constraints: Must be an integer greater than 1000.</p><p><b>SQL Server</b></p><p>Setting the IOPS value for the SQL Server database engine isn't supported.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iops;

/**
 <p>License model information for the restored DB instance.</p><p>Default: Same as source.</p><p> Valid values: <code>license-included</code> | <code>bring-your-own-license</code> | <code>general-public-license</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable licenseModel;

/**
 <p>A value that indicates whether the DB instance is a Multi-AZ deployment.</p><p>Constraint: You can't specify the <code>AvailabilityZone</code> parameter if the DB instance is a Multi-AZ deployment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiAZ;

/**
 <p>The name of the option group to be used for the restored DB instance.</p><p>Permanent options, such as the TDE option for Oracle Advanced Security TDE, can't be removed from an option group, and that option group can't be removed from a DB instance once it is associated with a DB instance</p>
 */
@property (nonatomic, strong) NSString * _Nullable optionGroupName;

/**
 <p>The port number on which the database accepts connections.</p><p>Constraints: Value must be <code>1150-65535</code></p><p>Default: The same port as the original DB instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The number of CPU cores and the number of threads per core for the DB instance class of the DB instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsProcessorFeature *> * _Nullable processorFeatures;

/**
 <p>A value that indicates whether the DB instance is publicly accessible. When the DB instance is publicly accessible, it is an Internet-facing instance with a publicly resolvable DNS name, which resolves to a public IP address. When the DB instance isn't publicly accessible, it is an internal instance with a DNS name that resolves to a private IP address. For more information, see <a>CreateDBInstance</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publiclyAccessible;

/**
 <p>The date and time to restore from.</p><p>Valid Values: Value must be a time in Universal Coordinated Time (UTC) format</p><p>Constraints:</p><ul><li><p>Must be before the latest restorable time for the DB instance</p></li><li><p>Can't be specified if the <code>UseLatestRestorableTime</code> parameter is enabled</p></li></ul><p>Example: <code>2009-09-07T23:45:00Z</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable restoreTime;

/**
 <p>The identifier of the source DB instance from which to restore.</p><p>Constraints:</p><ul><li><p>Must match the identifier of an existing DB instance.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable sourceDBInstanceIdentifier;

/**
 <p>The resource ID of the source DB instance from which to restore.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceDbiResourceId;

/**
 <p>Specifies the storage type to be associated with the DB instance.</p><p> Valid values: <code>standard | gp2 | io1</code></p><p> If you specify <code>io1</code>, you must also include a value for the <code>Iops</code> parameter. </p><p> Default: <code>io1</code> if the <code>Iops</code> parameter is specified, otherwise <code>gp2</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable storageType;

/**
 <p>A list of tags. For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html">Tagging Amazon RDS Resources</a> in the <i>Amazon RDS User Guide.</i></p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tags;

/**
 <p>The name of the new DB instance to be created.</p><p>Constraints:</p><ul><li><p>Must contain from 1 to 63 letters, numbers, or hyphens</p></li><li><p>First character must be a letter</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable targetDBInstanceIdentifier;

/**
 <p>The ARN from the key store with which to associate the instance for TDE encryption.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tdeCredentialArn;

/**
 <p>The password for the given ARN from the key store in order to access the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tdeCredentialPassword;

/**
 <p>A value that indicates whether the DB instance class of the DB instance uses its default processor features.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable useDefaultProcessorFeatures;

/**
 <p> A value that indicates whether the DB instance is restored from the latest backup time. By default, the DB instance isn't restored from the latest backup time. </p><p>Constraints: Can't be specified if the <code>RestoreTime</code> parameter is provided.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable useLatestRestorableTime;

/**
 <p> A list of EC2 VPC security groups to associate with this DB instance. </p><p> Default: The default EC2 VPC security group for the DB subnet group's VPC. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSecurityGroupIds;

@end

/**
 
 */
@interface AWSrdsRestoreDBInstanceToPointInTimeResult : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB instance. </p><p>This data type is used as a response element in the <code>DescribeDBInstances</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBInstance * _Nullable DBInstance;

@end

/**
 <p>Earliest and latest time an instance can be restored to:</p>
 */
@interface AWSrdsRestoreWindow : AWSModel


/**
 <p>The earliest time you can restore an instance to.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable earliestTime;

/**
 <p>The latest time you can restore an instance to.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable latestTime;

@end

/**
 <p/>
 Required parameters: [DBSecurityGroupName]
 */
@interface AWSrdsRevokeDBSecurityGroupIngressMessage : AWSRequest


/**
 <p> The IP range to revoke access from. Must be a valid CIDR range. If <code>CIDRIP</code> is specified, <code>EC2SecurityGroupName</code>, <code>EC2SecurityGroupId</code> and <code>EC2SecurityGroupOwnerId</code> can't be provided. </p>
 */
@property (nonatomic, strong) NSString * _Nullable CIDRIP;

/**
 <p>The name of the DB security group to revoke ingress from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSecurityGroupName;

/**
 <p> The id of the EC2 security group to revoke access from. For VPC DB security groups, <code>EC2SecurityGroupId</code> must be provided. Otherwise, EC2SecurityGroupOwnerId and either <code>EC2SecurityGroupName</code> or <code>EC2SecurityGroupId</code> must be provided. </p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupId;

/**
 <p> The name of the EC2 security group to revoke access from. For VPC DB security groups, <code>EC2SecurityGroupId</code> must be provided. Otherwise, EC2SecurityGroupOwnerId and either <code>EC2SecurityGroupName</code> or <code>EC2SecurityGroupId</code> must be provided. </p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupName;

/**
 <p> The AWS account number of the owner of the EC2 security group specified in the <code>EC2SecurityGroupName</code> parameter. The AWS access key ID isn't an acceptable value. For VPC DB security groups, <code>EC2SecurityGroupId</code> must be provided. Otherwise, EC2SecurityGroupOwnerId and either <code>EC2SecurityGroupName</code> or <code>EC2SecurityGroupId</code> must be provided. </p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupOwnerId;

@end

/**
 
 */
@interface AWSrdsRevokeDBSecurityGroupIngressResult : AWSModel


/**
 <p>Contains the details for an Amazon RDS DB security group. </p><p>This data type is used as a response element in the <code>DescribeDBSecurityGroups</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBSecurityGroup * _Nullable DBSecurityGroup;

@end

/**
 <p>Contains the scaling configuration of an Aurora Serverless DB cluster.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html">Using Amazon Aurora Serverless</a> in the <i>Amazon Aurora User Guide</i>.</p>
 */
@interface AWSrdsScalingConfiguration : AWSModel


/**
 <p>A value that indicates whether to allow or disallow automatic pause for an Aurora DB cluster in <code>serverless</code> DB engine mode. A DB cluster can be paused only when it's idle (it has no connections).</p><note><p>If a DB cluster is paused for more than seven days, the DB cluster might be backed up with a snapshot. In this case, the DB cluster is restored when there is a request to connect to it. </p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoPause;

/**
 <p>The maximum capacity for an Aurora DB cluster in <code>serverless</code> DB engine mode.</p><p>For Aurora MySQL, valid capacity values are <code>1</code>, <code>2</code>, <code>4</code>, <code>8</code>, <code>16</code>, <code>32</code>, <code>64</code>, <code>128</code>, and <code>256</code>.</p><p>For Aurora PostgreSQL, valid capacity values are <code>2</code>, <code>4</code>, <code>8</code>, <code>16</code>, <code>32</code>, <code>64</code>, <code>192</code>, and <code>384</code>.</p><p>The maximum capacity must be greater than or equal to the minimum capacity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCapacity;

/**
 <p>The minimum capacity for an Aurora DB cluster in <code>serverless</code> DB engine mode.</p><p>For Aurora MySQL, valid capacity values are <code>1</code>, <code>2</code>, <code>4</code>, <code>8</code>, <code>16</code>, <code>32</code>, <code>64</code>, <code>128</code>, and <code>256</code>.</p><p>For Aurora PostgreSQL, valid capacity values are <code>2</code>, <code>4</code>, <code>8</code>, <code>16</code>, <code>32</code>, <code>64</code>, <code>192</code>, and <code>384</code>.</p><p>The minimum capacity must be less than or equal to the maximum capacity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minCapacity;

/**
 <p>The time, in seconds, before an Aurora DB cluster in <code>serverless</code> mode is paused.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable secondsUntilAutoPause;

/**
 <p>The action to take when the timeout is reached, either <code>ForceApplyCapacityChange</code> or <code>RollbackCapacityChange</code>.</p><p><code>ForceApplyCapacityChange</code> sets the capacity to the specified value as soon as possible.</p><p><code>RollbackCapacityChange</code>, the default, ignores the capacity change if a scaling point isn't found in the timeout period.</p><important><p>If you specify <code>ForceApplyCapacityChange</code>, connections that prevent Aurora Serverless from finding a scaling point might be dropped.</p></important><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.how-it-works.html#aurora-serverless.how-it-works.auto-scaling"> Autoscaling for Aurora Serverless</a> in the <i>Amazon Aurora User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timeoutAction;

@end

/**
 <p>Shows the scaling configuration for an Aurora DB cluster in <code>serverless</code> DB engine mode.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html">Using Amazon Aurora Serverless</a> in the <i>Amazon Aurora User Guide</i>.</p>
 */
@interface AWSrdsScalingConfigurationInfo : AWSModel


/**
 <p>A value that indicates whether automatic pause is allowed for the Aurora DB cluster in <code>serverless</code> DB engine mode.</p><p>When the value is set to false for an Aurora Serverless DB cluster, the DB cluster automatically resumes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoPause;

/**
 <p>The maximum capacity for an Aurora DB cluster in <code>serverless</code> DB engine mode.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCapacity;

/**
 <p>The maximum capacity for the Aurora DB cluster in <code>serverless</code> DB engine mode.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minCapacity;

/**
 <p>The remaining amount of time, in seconds, before the Aurora DB cluster in <code>serverless</code> mode is paused. A DB cluster can be paused only when it's idle (it has no connections).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable secondsUntilAutoPause;

/**
 <p>The timeout action of a call to <code>ModifyCurrentDBClusterCapacity</code>, either <code>ForceApplyCapacityChange</code> or <code>RollbackCapacityChange</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timeoutAction;

@end

/**
 <p>Contains an AWS Region name as the result of a successful call to the <code>DescribeSourceRegions</code> action.</p>
 */
@interface AWSrdsSourceRegion : AWSModel


/**
 <p>The endpoint for the source AWS Region endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpoint;

/**
 <p>The name of the source AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regionName;

/**
 <p>The status of the source AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Contains the result of a successful invocation of the <code>DescribeSourceRegions</code> action.</p>
 */
@interface AWSrdsSourceRegionMessage : AWSModel


/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of SourceRegion instances that contains each source AWS Region that the current AWS Region can get a read replica or a DB snapshot from.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsSourceRegion *> * _Nullable sourceRegions;

@end

/**
 
 */
@interface AWSrdsStartActivityStreamRequest : AWSRequest


/**
 <p>Specifies whether or not the database activity stream is to start as soon as possible, regardless of the maintenance window for the database.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyImmediately;

/**
 <p>The AWS KMS key identifier for encrypting messages in the database activity stream. The key identifier can be either a key ID, a key ARN, or a key alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>Specifies the mode of the database activity stream. Database events such as a change or access generate an activity stream event. The database session can handle these events either synchronously or asynchronously. </p>
 */
@property (nonatomic, assign) AWSrdsActivityStreamMode mode;

/**
 <p>The Amazon Resource Name (ARN) of the DB cluster, for example <code>arn:aws:rds:us-east-1:12345667890:cluster:das-cluster</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSrdsStartActivityStreamResponse : AWSModel


/**
 <p>Indicates whether or not the database activity stream will start as soon as possible, regardless of the maintenance window for the database.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyImmediately;

/**
 <p>The name of the Amazon Kinesis data stream to be used for the database activity stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kinesisStreamName;

/**
 <p>The AWS KMS key identifier for encryption of messages in the database activity stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The mode of the database activity stream.</p>
 */
@property (nonatomic, assign) AWSrdsActivityStreamMode mode;

/**
 <p>The status of the database activity stream.</p>
 */
@property (nonatomic, assign) AWSrdsActivityStreamStatus status;

@end

/**
 
 */
@interface AWSrdsStartDBClusterMessage : AWSRequest


/**
 <p>The DB cluster identifier of the Amazon Aurora DB cluster to be started. This parameter is stored as a lowercase string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

@end

/**
 
 */
@interface AWSrdsStartDBClusterResult : AWSModel


/**
 <p>Contains the details of an Amazon Aurora DB cluster. </p><p>This data type is used as a response element in the <code>DescribeDBClusters</code>, <code>StopDBCluster</code>, and <code>StartDBCluster</code> actions. </p>
 */
@property (nonatomic, strong) AWSrdsDBCluster * _Nullable DBCluster;

@end

/**
 
 */
@interface AWSrdsStartDBInstanceMessage : AWSRequest


/**
 <p> The user-supplied instance identifier. </p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

@end

/**
 
 */
@interface AWSrdsStartDBInstanceResult : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB instance. </p><p>This data type is used as a response element in the <code>DescribeDBInstances</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBInstance * _Nullable DBInstance;

@end

/**
 
 */
@interface AWSrdsStartExportTaskMessage : AWSRequest


/**
 <p>The data to be exported from the snapshot. If this parameter is not provided, all the snapshot data is exported. Valid values are the following:</p><ul><li><p><code>database</code> - Export all the data from a specified database.</p></li><li><p><code>database.table</code><i>table-name</i> - Export a table of the snapshot. This format is valid only for RDS for MySQL, RDS for MariaDB, and Aurora MySQL.</p></li><li><p><code>database.schema</code><i>schema-name</i> - Export a database schema of the snapshot. This format is valid only for RDS for PostgreSQL and Aurora PostgreSQL.</p></li><li><p><code>database.schema.table</code><i>table-name</i> - Export a table of the database schema. This format is valid only for RDS for PostgreSQL and Aurora PostgreSQL.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable exportOnly;

/**
 <p>A unique identifier for the snapshot export task. This ID isn't an identifier for the Amazon S3 bucket where the snapshot is to be exported to. </p>
 */
@property (nonatomic, strong) NSString * _Nullable exportTaskIdentifier;

/**
 <p>The name of the IAM role to use for writing to the Amazon S3 bucket when exporting a snapshot. </p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRoleArn;

/**
 <p>The ID of the AWS KMS key to use to encrypt the snapshot exported to Amazon S3. The KMS key ID is the Amazon Resource Name (ARN), the KMS key identifier, or the KMS key alias for the KMS encryption key. The IAM role used for the snapshot export must have encryption and decryption permissions to use this KMS key. </p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The name of the Amazon S3 bucket to export the snapshot to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3BucketName;

/**
 <p>The Amazon S3 bucket prefix to use as the file name and path of the exported snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Prefix;

/**
 <p>The Amazon Resource Name (ARN) of the snapshot to export to Amazon S3.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

@end

/**
 
 */
@interface AWSrdsStopActivityStreamRequest : AWSRequest


/**
 <p>Specifies whether or not the database activity stream is to stop as soon as possible, regardless of the maintenance window for the database.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyImmediately;

/**
 <p>The Amazon Resource Name (ARN) of the DB cluster for the database activity stream. For example, <code>arn:aws:rds:us-east-1:12345667890:cluster:das-cluster</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSrdsStopActivityStreamResponse : AWSModel


/**
 <p>The name of the Amazon Kinesis data stream used for the database activity stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kinesisStreamName;

/**
 <p>The AWS KMS key identifier used for encrypting messages in the database activity stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The status of the database activity stream.</p>
 */
@property (nonatomic, assign) AWSrdsActivityStreamStatus status;

@end

/**
 
 */
@interface AWSrdsStopDBClusterMessage : AWSRequest


/**
 <p>The DB cluster identifier of the Amazon Aurora DB cluster to be stopped. This parameter is stored as a lowercase string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DBClusterIdentifier;

@end

/**
 
 */
@interface AWSrdsStopDBClusterResult : AWSModel


/**
 <p>Contains the details of an Amazon Aurora DB cluster. </p><p>This data type is used as a response element in the <code>DescribeDBClusters</code>, <code>StopDBCluster</code>, and <code>StartDBCluster</code> actions. </p>
 */
@property (nonatomic, strong) AWSrdsDBCluster * _Nullable DBCluster;

@end

/**
 
 */
@interface AWSrdsStopDBInstanceMessage : AWSRequest


/**
 <p> The user-supplied instance identifier. </p>
 */
@property (nonatomic, strong) NSString * _Nullable DBInstanceIdentifier;

/**
 <p> The user-supplied instance identifier of the DB Snapshot created immediately before the DB instance is stopped. </p>
 */
@property (nonatomic, strong) NSString * _Nullable DBSnapshotIdentifier;

@end

/**
 
 */
@interface AWSrdsStopDBInstanceResult : AWSModel


/**
 <p>Contains the details of an Amazon RDS DB instance. </p><p>This data type is used as a response element in the <code>DescribeDBInstances</code> action. </p>
 */
@property (nonatomic, strong) AWSrdsDBInstance * _Nullable DBInstance;

@end

/**
 <p> This data type is used as a response element in the <code>DescribeDBSubnetGroups</code> action. </p>
 */
@interface AWSrdsSubnet : AWSModel


/**
 <p>Contains Availability Zone information.</p><p> This data type is used as an element in the <code>OrderableDBInstanceOption</code> data type.</p>
 */
@property (nonatomic, strong) AWSrdsAvailabilityZone * _Nullable subnetAvailabilityZone;

/**
 <p>Specifies the identifier of the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetIdentifier;

/**
 <p>Specifies the status of the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetStatus;

@end

/**
 <p>Metadata assigned to an Amazon RDS resource consisting of a key-value pair.</p>
 */
@interface AWSrdsTag : AWSModel


/**
 <p>A key is the required name of the tag. The string value can be from 1 to 128 Unicode characters in length and can't be prefixed with "aws:" or "rds:". The string can only contain only the set of Unicode letters, digits, white-space, '_', '.', '/', '=', '+', '-' (Java regex: "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>A value is the optional value of the tag. The string value can be from 1 to 256 Unicode characters in length and can't be prefixed with "aws:" or "rds:". The string can only contain only the set of Unicode letters, digits, white-space, '_', '.', '/', '=', '+', '-' (Java regex: "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p/>
 */
@interface AWSrdsTagListMessage : AWSModel


/**
 <p>List of tags returned by the ListTagsForResource operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSrdsTag *> * _Nullable tagList;

@end

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Information about the connection health of an RDS Proxy target.</p>
 */
@interface AWSrdsTargetHealth : AWSModel


/**
 <p>A description of the health of the RDS Proxy target. If the <code>State</code> is <code>AVAILABLE</code>, a description is not included.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The reason for the current health <code>State</code> of the RDS Proxy target.</p>
 */
@property (nonatomic, assign) AWSrdsTargetHealthReason reason;

/**
 <p>The current state of the connection health lifecycle for the RDS Proxy target. The following is a typical lifecycle example for the states of an RDS Proxy target: </p><p><code>registering</code> &gt; <code>unavailable</code> &gt; <code>available</code> &gt; <code>unavailable</code> &gt; <code>available</code></p>
 */
@property (nonatomic, assign) AWSrdsTargetState state;

@end

/**
 <p>A time zone associated with a <code>DBInstance</code> or a <code>DBSnapshot</code>. This data type is an element in the response to the <code>DescribeDBInstances</code>, the <code>DescribeDBSnapshots</code>, and the <code>DescribeDBEngineVersions</code> actions. </p>
 */
@interface AWSrdsTimezone : AWSModel


/**
 <p>The name of the time zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timezoneName;

@end

/**
 <p>The version of the database engine that a DB instance can be upgraded to.</p>
 */
@interface AWSrdsUpgradeTarget : AWSModel


/**
 <p>A value that indicates whether the target version is applied to any source DB instances that have <code>AutoMinorVersionUpgrade</code> set to true.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoUpgrade;

/**
 <p>The version of the database engine that a DB instance can be upgraded to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the upgrade target database engine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The version number of the upgrade target database engine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>A value that indicates whether a database engine is upgraded to a major version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isMajorVersionUpgrade;

@end

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Specifies the details of authentication used by a proxy to log in as a specific database user.</p>
 */
@interface AWSrdsUserAuthConfig : AWSModel


/**
 <p>The type of authentication that the proxy uses for connections from the proxy to the underlying database.</p>
 */
@property (nonatomic, assign) AWSrdsAuthScheme authScheme;

/**
 <p>A user-specified description about the authentication used by a proxy to log in as a specific database user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Whether to require or disallow AWS Identity and Access Management (IAM) authentication for connections to the proxy.</p>
 */
@property (nonatomic, assign) AWSrdsIAMAuthMode IAMAuth;

/**
 <p>The Amazon Resource Name (ARN) representing the secret that the proxy uses to authenticate to the RDS DB instance or Aurora DB cluster. These secrets are stored within Amazon Secrets Manager.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretArn;

/**
 <p>The name of the database user to which the proxy connects.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <note><p>This is prerelease documentation for the RDS Database Proxy feature in preview release. It is subject to change.</p></note><p>Returns the details of authentication used by a proxy to log in as a specific database user.</p>
 */
@interface AWSrdsUserAuthConfigInfo : AWSModel


/**
 <p>The type of authentication that the proxy uses for connections from the proxy to the underlying database.</p>
 */
@property (nonatomic, assign) AWSrdsAuthScheme authScheme;

/**
 <p>A user-specified description about the authentication used by a proxy to log in as a specific database user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Whether to require or disallow AWS Identity and Access Management (IAM) authentication for connections to the proxy.</p>
 */
@property (nonatomic, assign) AWSrdsIAMAuthMode IAMAuth;

/**
 <p>The Amazon Resource Name (ARN) representing the secret that the proxy uses to authenticate to the RDS DB instance or Aurora DB cluster. These secrets are stored within Amazon Secrets Manager.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretArn;

/**
 <p>The name of the database user to which the proxy connects.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Information about valid modifications that you can make to your DB instance. Contains the result of a successful call to the <code>DescribeValidDBInstanceModifications</code> action. You can use this information when you call <code>ModifyDBInstance</code>. </p>
 */
@interface AWSrdsValidDBInstanceModificationsMessage : AWSModel


/**
 <p>Valid storage options for your DB instance. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsValidStorageOptions *> * _Nullable storage;

/**
 <p>Valid processor features for your DB instance. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsAvailableProcessorFeature *> * _Nullable validProcessorFeatures;

@end

/**
 <p>Information about valid modifications that you can make to your DB instance. Contains the result of a successful call to the <code>DescribeValidDBInstanceModifications</code> action. </p>
 */
@interface AWSrdsValidStorageOptions : AWSModel


/**
 <p>The valid range of Provisioned IOPS to gibibytes of storage multiplier. For example, 3-10, which means that provisioned IOPS can be between 3 and 10 times storage. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsDoubleRange *> * _Nullable iopsToStorageRatio;

/**
 <p>The valid range of provisioned IOPS. For example, 1000-20000. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsRange *> * _Nullable provisionedIops;

/**
 <p>The valid range of storage in gibibytes. For example, 100 to 16384. </p>
 */
@property (nonatomic, strong) NSArray<AWSrdsRange *> * _Nullable storageSize;

/**
 <p>The valid storage types for your DB instance. For example, gp2, io1. </p>
 */
@property (nonatomic, strong) NSString * _Nullable storageType;

/**
 <p>Whether or not Amazon RDS can automatically scale storage for DB instances that use the new instance class.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable supportsStorageAutoscaling;

@end

/**
 <p>This data type is used as a response element for queries on VPC security group membership.</p>
 */
@interface AWSrdsVpcSecurityGroupMembership : AWSModel


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
 <p>Information about the virtual private network (VPN) between the VMware vSphere cluster and the AWS website.</p><p>For more information about RDS on VMware, see the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/RDSonVMwareUserGuide/rds-on-vmware.html"><i>RDS on VMware User Guide.</i></a></p>
 */
@interface AWSrdsVpnDetails : AWSModel


/**
 <p>The IP address of network traffic from AWS to your on-premises data center.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpnGatewayIp;

/**
 <p>The ID of the VPN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpnId;

/**
 <p>The name of the VPN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpnName;

/**
 <p>The preshared key (PSK) for the VPN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpnPSK;

/**
 <p>The state of the VPN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpnState;

/**
 <p>The IP address of network traffic from your on-premises data center. A custom AZ receives the network traffic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpnTunnelOriginatorIP;

@end

NS_ASSUME_NONNULL_END
