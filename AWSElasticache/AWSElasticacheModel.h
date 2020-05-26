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

FOUNDATION_EXPORT NSString *const AWSElasticacheErrorDomain;

typedef NS_ENUM(NSInteger, AWSElasticacheErrorType) {
    AWSElasticacheErrorUnknown,
    AWSElasticacheErrorAPICallRateForCustomerExceeded,
    AWSElasticacheErrorAuthorizationAlreadyExists,
    AWSElasticacheErrorAuthorizationNotFound,
    AWSElasticacheErrorCacheClusterAlreadyExists,
    AWSElasticacheErrorCacheClusterNotFound,
    AWSElasticacheErrorCacheParameterGroupAlreadyExists,
    AWSElasticacheErrorCacheParameterGroupNotFound,
    AWSElasticacheErrorCacheParameterGroupQuotaExceeded,
    AWSElasticacheErrorCacheSecurityGroupAlreadyExists,
    AWSElasticacheErrorCacheSecurityGroupNotFound,
    AWSElasticacheErrorCacheSecurityGroupQuotaExceeded,
    AWSElasticacheErrorCacheSubnetGroupAlreadyExists,
    AWSElasticacheErrorCacheSubnetGroupInUse,
    AWSElasticacheErrorCacheSubnetGroupNotFound,
    AWSElasticacheErrorCacheSubnetGroupQuotaExceeded,
    AWSElasticacheErrorCacheSubnetQuotaExceeded,
    AWSElasticacheErrorClusterQuotaForCustomerExceeded,
    AWSElasticacheErrorGlobalReplicationGroupAlreadyExists,
    AWSElasticacheErrorGlobalReplicationGroupNotFound,
    AWSElasticacheErrorInsufficientCacheClusterCapacity,
    AWSElasticacheErrorInvalidARN,
    AWSElasticacheErrorInvalidCacheClusterState,
    AWSElasticacheErrorInvalidCacheParameterGroupState,
    AWSElasticacheErrorInvalidCacheSecurityGroupState,
    AWSElasticacheErrorInvalidGlobalReplicationGroupState,
    AWSElasticacheErrorInvalidKMSKey,
    AWSElasticacheErrorInvalidParameterCombination,
    AWSElasticacheErrorInvalidParameterValue,
    AWSElasticacheErrorInvalidReplicationGroupState,
    AWSElasticacheErrorInvalidSnapshotState,
    AWSElasticacheErrorInvalidSubnet,
    AWSElasticacheErrorInvalidVPCNetworkState,
    AWSElasticacheErrorNoOperation,
    AWSElasticacheErrorNodeGroupNotFound,
    AWSElasticacheErrorNodeGroupsPerReplicationGroupQuotaExceeded,
    AWSElasticacheErrorNodeQuotaForClusterExceeded,
    AWSElasticacheErrorNodeQuotaForCustomerExceeded,
    AWSElasticacheErrorReplicationGroupAlreadyExists,
    AWSElasticacheErrorReplicationGroupAlreadyUnderMigration,
    AWSElasticacheErrorReplicationGroupNotFound,
    AWSElasticacheErrorReplicationGroupNotUnderMigration,
    AWSElasticacheErrorReservedCacheNodeAlreadyExists,
    AWSElasticacheErrorReservedCacheNodeNotFound,
    AWSElasticacheErrorReservedCacheNodeQuotaExceeded,
    AWSElasticacheErrorReservedCacheNodesOfferingNotFound,
    AWSElasticacheErrorServiceLinkedRoleNotFound,
    AWSElasticacheErrorServiceUpdateNotFound,
    AWSElasticacheErrorSnapshotAlreadyExists,
    AWSElasticacheErrorSnapshotFeatureNotSupported,
    AWSElasticacheErrorSnapshotNotFound,
    AWSElasticacheErrorSnapshotQuotaExceeded,
    AWSElasticacheErrorSubnetInUse,
    AWSElasticacheErrorTagNotFound,
    AWSElasticacheErrorTagQuotaPerResourceExceeded,
    AWSElasticacheErrorTestFailoverNotAvailable,
};

typedef NS_ENUM(NSInteger, AWSElasticacheAZMode) {
    AWSElasticacheAZModeUnknown,
    AWSElasticacheAZModeSingleAz,
    AWSElasticacheAZModeCrossAz,
};

typedef NS_ENUM(NSInteger, AWSElasticacheAuthTokenUpdateStatus) {
    AWSElasticacheAuthTokenUpdateStatusUnknown,
    AWSElasticacheAuthTokenUpdateStatusSetting,
    AWSElasticacheAuthTokenUpdateStatusRotating,
};

typedef NS_ENUM(NSInteger, AWSElasticacheAuthTokenUpdateStrategyType) {
    AWSElasticacheAuthTokenUpdateStrategyTypeUnknown,
    AWSElasticacheAuthTokenUpdateStrategyTypeSet,
    AWSElasticacheAuthTokenUpdateStrategyTypeRotate,
};

typedef NS_ENUM(NSInteger, AWSElasticacheAutomaticFailoverStatus) {
    AWSElasticacheAutomaticFailoverStatusUnknown,
    AWSElasticacheAutomaticFailoverStatusEnabled,
    AWSElasticacheAutomaticFailoverStatusDisabled,
    AWSElasticacheAutomaticFailoverStatusEnabling,
    AWSElasticacheAutomaticFailoverStatusDisabling,
};

typedef NS_ENUM(NSInteger, AWSElasticacheChangeType) {
    AWSElasticacheChangeTypeUnknown,
    AWSElasticacheChangeTypeImmediate,
    AWSElasticacheChangeTypeRequiresReboot,
};

typedef NS_ENUM(NSInteger, AWSElasticacheNodeUpdateInitiatedBy) {
    AWSElasticacheNodeUpdateInitiatedByUnknown,
    AWSElasticacheNodeUpdateInitiatedBySystem,
    AWSElasticacheNodeUpdateInitiatedByCustomer,
};

typedef NS_ENUM(NSInteger, AWSElasticacheNodeUpdateStatus) {
    AWSElasticacheNodeUpdateStatusUnknown,
    AWSElasticacheNodeUpdateStatusNotApplied,
    AWSElasticacheNodeUpdateStatusWaitingToStart,
    AWSElasticacheNodeUpdateStatusInProgress,
    AWSElasticacheNodeUpdateStatusStopping,
    AWSElasticacheNodeUpdateStatusStopped,
    AWSElasticacheNodeUpdateStatusComplete,
};

typedef NS_ENUM(NSInteger, AWSElasticachePendingAutomaticFailoverStatus) {
    AWSElasticachePendingAutomaticFailoverStatusUnknown,
    AWSElasticachePendingAutomaticFailoverStatusEnabled,
    AWSElasticachePendingAutomaticFailoverStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSElasticacheServiceUpdateSeverity) {
    AWSElasticacheServiceUpdateSeverityUnknown,
    AWSElasticacheServiceUpdateSeverityCritical,
    AWSElasticacheServiceUpdateSeverityImportant,
    AWSElasticacheServiceUpdateSeverityMedium,
    AWSElasticacheServiceUpdateSeverityLow,
};

typedef NS_ENUM(NSInteger, AWSElasticacheServiceUpdateStatus) {
    AWSElasticacheServiceUpdateStatusUnknown,
    AWSElasticacheServiceUpdateStatusAvailable,
    AWSElasticacheServiceUpdateStatusCancelled,
    AWSElasticacheServiceUpdateStatusExpired,
};

typedef NS_ENUM(NSInteger, AWSElasticacheServiceUpdateType) {
    AWSElasticacheServiceUpdateTypeUnknown,
    AWSElasticacheServiceUpdateTypeSecurityUpdate,
};

typedef NS_ENUM(NSInteger, AWSElasticacheSlaMet) {
    AWSElasticacheSlaMetUnknown,
    AWSElasticacheSlaMetYes,
    AWSElasticacheSlaMetNo,
    AWSElasticacheSlaMetNA,
};

typedef NS_ENUM(NSInteger, AWSElasticacheSourceType) {
    AWSElasticacheSourceTypeUnknown,
    AWSElasticacheSourceTypeCacheCluster,
    AWSElasticacheSourceTypeCacheParameterGroup,
    AWSElasticacheSourceTypeCacheSecurityGroup,
    AWSElasticacheSourceTypeCacheSubnetGroup,
    AWSElasticacheSourceTypeReplicationGroup,
};

typedef NS_ENUM(NSInteger, AWSElasticacheUpdateActionStatus) {
    AWSElasticacheUpdateActionStatusUnknown,
    AWSElasticacheUpdateActionStatusNotApplied,
    AWSElasticacheUpdateActionStatusWaitingToStart,
    AWSElasticacheUpdateActionStatusInProgress,
    AWSElasticacheUpdateActionStatusStopping,
    AWSElasticacheUpdateActionStatusStopped,
    AWSElasticacheUpdateActionStatusComplete,
    AWSElasticacheUpdateActionStatusScheduling,
    AWSElasticacheUpdateActionStatusScheduled,
    AWSElasticacheUpdateActionStatusNotApplicable,
};

@class AWSElasticacheAddTagsToResourceMessage;
@class AWSElasticacheAllowedNodeTypeModificationsMessage;
@class AWSElasticacheAuthorizeCacheSecurityGroupIngressMessage;
@class AWSElasticacheAuthorizeCacheSecurityGroupIngressResult;
@class AWSElasticacheAvailabilityZone;
@class AWSElasticacheBatchApplyUpdateActionMessage;
@class AWSElasticacheBatchStopUpdateActionMessage;
@class AWSElasticacheCacheCluster;
@class AWSElasticacheCacheClusterMessage;
@class AWSElasticacheCacheEngineVersion;
@class AWSElasticacheCacheEngineVersionMessage;
@class AWSElasticacheCacheNode;
@class AWSElasticacheCacheNodeTypeSpecificParameter;
@class AWSElasticacheCacheNodeTypeSpecificValue;
@class AWSElasticacheCacheNodeUpdateStatus;
@class AWSElasticacheCacheParameterGroup;
@class AWSElasticacheCacheParameterGroupDetails;
@class AWSElasticacheCacheParameterGroupNameMessage;
@class AWSElasticacheCacheParameterGroupStatus;
@class AWSElasticacheCacheParameterGroupsMessage;
@class AWSElasticacheCacheSecurityGroup;
@class AWSElasticacheCacheSecurityGroupMembership;
@class AWSElasticacheCacheSecurityGroupMessage;
@class AWSElasticacheCacheSubnetGroup;
@class AWSElasticacheCacheSubnetGroupMessage;
@class AWSElasticacheCompleteMigrationMessage;
@class AWSElasticacheCompleteMigrationResponse;
@class AWSElasticacheConfigureShard;
@class AWSElasticacheReplicateSnapshotMessage;
@class AWSElasticacheReplicateSnapshotResult;
@class AWSElasticacheCreateCacheClusterMessage;
@class AWSElasticacheCreateCacheClusterResult;
@class AWSElasticacheCreateCacheParameterGroupMessage;
@class AWSElasticacheCreateCacheParameterGroupResult;
@class AWSElasticacheCreateCacheSecurityGroupMessage;
@class AWSElasticacheCreateCacheSecurityGroupResult;
@class AWSElasticacheCreateCacheSubnetGroupMessage;
@class AWSElasticacheCreateCacheSubnetGroupResult;
@class AWSElasticacheCreateGlobalReplicationGroupMessage;
@class AWSElasticacheCreateGlobalReplicationGroupResult;
@class AWSElasticacheCreateReplicationGroupMessage;
@class AWSElasticacheCreateReplicationGroupResult;
@class AWSElasticacheCreateSnapshotMessage;
@class AWSElasticacheCreateSnapshotResult;
@class AWSElasticacheCustomerNodeEndpoint;
@class AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupMessage;
@class AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupResult;
@class AWSElasticacheDecreaseReplicaCountMessage;
@class AWSElasticacheDecreaseReplicaCountResult;
@class AWSElasticacheDeleteCacheClusterMessage;
@class AWSElasticacheDeleteCacheClusterResult;
@class AWSElasticacheDeleteCacheParameterGroupMessage;
@class AWSElasticacheDeleteCacheSecurityGroupMessage;
@class AWSElasticacheDeleteCacheSubnetGroupMessage;
@class AWSElasticacheDeleteGlobalReplicationGroupMessage;
@class AWSElasticacheDeleteGlobalReplicationGroupResult;
@class AWSElasticacheDeleteReplicationGroupMessage;
@class AWSElasticacheDeleteReplicationGroupResult;
@class AWSElasticacheDeleteSnapshotMessage;
@class AWSElasticacheDeleteSnapshotResult;
@class AWSElasticacheDescribeCacheClustersMessage;
@class AWSElasticacheDescribeCacheEngineVersionsMessage;
@class AWSElasticacheDescribeCacheParameterGroupsMessage;
@class AWSElasticacheDescribeCacheParametersMessage;
@class AWSElasticacheDescribeCacheSecurityGroupsMessage;
@class AWSElasticacheDescribeCacheSubnetGroupsMessage;
@class AWSElasticacheDescribeEngineDefaultParametersMessage;
@class AWSElasticacheDescribeEngineDefaultParametersResult;
@class AWSElasticacheDescribeEventsMessage;
@class AWSElasticacheDescribeGlobalReplicationGroupsMessage;
@class AWSElasticacheDescribeGlobalReplicationGroupsResult;
@class AWSElasticacheDescribeReplicationGroupsMessage;
@class AWSElasticacheDescribeReservedCacheNodesMessage;
@class AWSElasticacheDescribeReservedCacheNodesOfferingsMessage;
@class AWSElasticacheDescribeServiceUpdatesMessage;
@class AWSElasticacheDescribeSnapshotsListMessage;
@class AWSElasticacheDescribeSnapshotsMessage;
@class AWSElasticacheDescribeUpdateActionsMessage;
@class AWSElasticacheDisassociateGlobalReplicationGroupMessage;
@class AWSElasticacheDisassociateGlobalReplicationGroupResult;
@class AWSElasticacheEC2SecurityGroup;
@class AWSElasticacheEndpoint;
@class AWSElasticacheEngineDefaults;
@class AWSElasticacheEvent;
@class AWSElasticacheEventsMessage;
@class AWSElasticacheFailoverGlobalReplicationGroupMessage;
@class AWSElasticacheFailoverGlobalReplicationGroupResult;
@class AWSElasticacheGlobalNodeGroup;
@class AWSElasticacheGlobalReplicationGroup;
@class AWSElasticacheGlobalReplicationGroupInfo;
@class AWSElasticacheGlobalReplicationGroupMember;
@class AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupMessage;
@class AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupResult;
@class AWSElasticacheIncreaseReplicaCountMessage;
@class AWSElasticacheIncreaseReplicaCountResult;
@class AWSElasticacheListAllowedNodeTypeModificationsMessage;
@class AWSElasticacheListTagsForResourceMessage;
@class AWSElasticacheModifyCacheClusterMessage;
@class AWSElasticacheModifyCacheClusterResult;
@class AWSElasticacheModifyCacheParameterGroupMessage;
@class AWSElasticacheModifyCacheSubnetGroupMessage;
@class AWSElasticacheModifyCacheSubnetGroupResult;
@class AWSElasticacheModifyGlobalReplicationGroupMessage;
@class AWSElasticacheModifyGlobalReplicationGroupResult;
@class AWSElasticacheModifyReplicationGroupMessage;
@class AWSElasticacheModifyReplicationGroupResult;
@class AWSElasticacheModifyReplicationGroupShardConfigurationMessage;
@class AWSElasticacheModifyReplicationGroupShardConfigurationResult;
@class AWSElasticacheNodeGroup;
@class AWSElasticacheNodeGroupConfiguration;
@class AWSElasticacheNodeGroupMember;
@class AWSElasticacheNodeGroupMemberUpdateStatus;
@class AWSElasticacheNodeGroupUpdateStatus;
@class AWSElasticacheNodeSnapshot;
@class AWSElasticacheNotificationConfiguration;
@class AWSElasticacheParameter;
@class AWSElasticacheParameterNameValue;
@class AWSElasticachePendingModifiedValues;
@class AWSElasticacheProcessedUpdateAction;
@class AWSElasticachePurchaseReservedCacheNodesOfferingMessage;
@class AWSElasticachePurchaseReservedCacheNodesOfferingResult;
@class AWSElasticacheRebalanceSlotsInGlobalReplicationGroupMessage;
@class AWSElasticacheRebalanceSlotsInGlobalReplicationGroupResult;
@class AWSElasticacheRebootCacheClusterMessage;
@class AWSElasticacheRebootCacheClusterResult;
@class AWSElasticacheRecurringCharge;
@class AWSElasticacheRegionalConfiguration;
@class AWSElasticacheRemoveTagsFromResourceMessage;
@class AWSElasticacheReplicationGroup;
@class AWSElasticacheReplicationGroupMessage;
@class AWSElasticacheReplicationGroupPendingModifiedValues;
@class AWSElasticacheReservedCacheNode;
@class AWSElasticacheReservedCacheNodeMessage;
@class AWSElasticacheReservedCacheNodesOffering;
@class AWSElasticacheReservedCacheNodesOfferingMessage;
@class AWSElasticacheResetCacheParameterGroupMessage;
@class AWSElasticacheReshardingConfiguration;
@class AWSElasticacheReshardingStatus;
@class AWSElasticacheRevokeCacheSecurityGroupIngressMessage;
@class AWSElasticacheRevokeCacheSecurityGroupIngressResult;
@class AWSElasticacheSecurityGroupMembership;
@class AWSElasticacheServiceUpdate;
@class AWSElasticacheServiceUpdatesMessage;
@class AWSElasticacheSlotMigration;
@class AWSElasticacheSnapshot;
@class AWSElasticacheStartMigrationMessage;
@class AWSElasticacheStartMigrationResponse;
@class AWSElasticacheSubnet;
@class AWSElasticacheTag;
@class AWSElasticacheTagListMessage;
@class AWSElasticacheTestFailoverMessage;
@class AWSElasticacheTestFailoverResult;
@class AWSElasticacheTimeRangeFilter;
@class AWSElasticacheUnprocessedUpdateAction;
@class AWSElasticacheUpdateAction;
@class AWSElasticacheUpdateActionResultsMessage;
@class AWSElasticacheUpdateActionsMessage;

/**
 <p>Represents the input of an AddTagsToResource operation.</p>
 Required parameters: [ResourceName, Tags]
 */
@interface AWSElasticacheAddTagsToResourceMessage : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource to which the tags are to be added, for example <code>arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster</code> or <code>arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot</code>. ElastiCache resources are <i>cluster</i> and <i>snapshot</i>.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

/**
 <p>A list of cost allocation tags to be added to this resource. A tag is a key-value pair. A tag key must be accompanied by a tag value.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheTag *> * _Nullable tags;

@end

/**
 <p>Represents the allowed node types you can use to modify your cluster or replication group.</p>
 */
@interface AWSElasticacheAllowedNodeTypeModificationsMessage : AWSModel


/**
 <p>A string list, each element of which specifies a cache node type which you can use to scale your cluster or replication group. When scaling down a Redis cluster or replication group using ModifyCacheCluster or ModifyReplicationGroup, use a value from this list for the CacheNodeType parameter. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable scaleDownModifications;

/**
 <p>A string list, each element of which specifies a cache node type which you can use to scale your cluster or replication group.</p><p>When scaling up a Redis cluster or replication group using <code>ModifyCacheCluster</code> or <code>ModifyReplicationGroup</code>, use a value from this list for the <code>CacheNodeType</code> parameter.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable scaleUpModifications;

@end

/**
 <p>Represents the input of an AuthorizeCacheSecurityGroupIngress operation.</p>
 Required parameters: [CacheSecurityGroupName, EC2SecurityGroupName, EC2SecurityGroupOwnerId]
 */
@interface AWSElasticacheAuthorizeCacheSecurityGroupIngressMessage : AWSRequest


/**
 <p>The cache security group that allows network ingress.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheSecurityGroupName;

/**
 <p>The Amazon EC2 security group to be authorized for ingress to the cache security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupName;

/**
 <p>The AWS account number of the Amazon EC2 security group owner. Note that this is not the same thing as an AWS access key ID - you must provide a valid AWS account number for this parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupOwnerId;

@end

/**
 
 */
@interface AWSElasticacheAuthorizeCacheSecurityGroupIngressResult : AWSModel


/**
 <p>Represents the output of one of the following operations:</p><ul><li><p><code>AuthorizeCacheSecurityGroupIngress</code></p></li><li><p><code>CreateCacheSecurityGroup</code></p></li><li><p><code>RevokeCacheSecurityGroupIngress</code></p></li></ul>
 */
@property (nonatomic, strong) AWSElasticacheCacheSecurityGroup * _Nullable cacheSecurityGroup;

@end

/**
 <p>Describes an Availability Zone in which the cluster is launched.</p>
 */
@interface AWSElasticacheAvailabilityZone : AWSModel


/**
 <p>The name of the Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSElasticacheBatchApplyUpdateActionMessage : AWSRequest


/**
 <p>The cache cluster IDs</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cacheClusterIds;

/**
 <p>The replication group IDs</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable replicationGroupIds;

/**
 <p>The unique ID of the service update</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceUpdateName;

@end

/**
 
 */
@interface AWSElasticacheBatchStopUpdateActionMessage : AWSRequest


/**
 <p>The cache cluster IDs</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cacheClusterIds;

/**
 <p>The replication group IDs</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable replicationGroupIds;

/**
 <p>The unique ID of the service update</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceUpdateName;

@end

/**
 <p>Contains all of the attributes of a specific cluster.</p>
 */
@interface AWSElasticacheCacheCluster : AWSModel


/**
 <p>The ARN (Amazon Resource Name) of the cache cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>A flag that enables encryption at-rest when set to <code>true</code>.</p><p>You cannot modify the value of <code>AtRestEncryptionEnabled</code> after the cluster is created. To enable at-rest encryption on a cluster you must set <code>AtRestEncryptionEnabled</code> to <code>true</code> when you create a cluster.</p><p><b>Required:</b> Only available when creating a replication group in an Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or later.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable atRestEncryptionEnabled;

/**
 <p>A flag that enables using an <code>AuthToken</code> (password) when issuing Redis commands.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable authTokenEnabled;

/**
 <p>The date the auth token was last modified</p>
 */
@property (nonatomic, strong) NSDate * _Nullable authTokenLastModifiedDate;

/**
 <p>This parameter is currently disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoMinorVersionUpgrade;

/**
 <p>The date and time when the cluster was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable cacheClusterCreateTime;

/**
 <p>The user-supplied identifier of the cluster. This identifier is a unique key that identifies a cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheClusterId;

/**
 <p>The current state of this cluster, one of the following values: <code>available</code>, <code>creating</code>, <code>deleted</code>, <code>deleting</code>, <code>incompatible-network</code>, <code>modifying</code>, <code>rebooting cluster nodes</code>, <code>restore-failed</code>, or <code>snapshotting</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheClusterStatus;

/**
 <p>The name of the compute and memory capacity node type for the cluster.</p><p>The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.</p><ul><li><p>General purpose:</p><ul><li><p>Current generation: </p><p><b>M5 node types:</b><code>cache.m5.large</code>, <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>, <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>, <code>cache.m5.24xlarge</code></p><p><b>M4 node types:</b><code>cache.m4.large</code>, <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>, <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code></p><p><b>T3 node types:</b><code>cache.t3.micro</code>, <code>cache.t3.small</code>, <code>cache.t3.medium</code></p><p><b>T2 node types:</b><code>cache.t2.micro</code>, <code>cache.t2.small</code>, <code>cache.t2.medium</code></p></li><li><p>Previous generation: (not recommended)</p><p><b>T1 node types:</b><code>cache.t1.micro</code></p><p><b>M1 node types:</b><code>cache.m1.small</code>, <code>cache.m1.medium</code>, <code>cache.m1.large</code>, <code>cache.m1.xlarge</code></p><p><b>M3 node types:</b><code>cache.m3.medium</code>, <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>, <code>cache.m3.2xlarge</code></p></li></ul></li><li><p>Compute optimized:</p><ul><li><p>Previous generation: (not recommended)</p><p><b>C1 node types:</b><code>cache.c1.xlarge</code></p></li></ul></li><li><p>Memory optimized:</p><ul><li><p>Current generation: </p><p><b>R5 node types:</b><code>cache.r5.large</code>, <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>, <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>, <code>cache.r5.24xlarge</code></p><p><b>R4 node types:</b><code>cache.r4.large</code>, <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>, <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>, <code>cache.r4.16xlarge</code></p></li><li><p>Previous generation: (not recommended)</p><p><b>M2 node types:</b><code>cache.m2.xlarge</code>, <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code></p><p><b>R3 node types:</b><code>cache.r3.large</code>, <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>, <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code></p></li></ul></li></ul><p><b>Additional node type info</b></p><ul><li><p>All current generation instance types are created in Amazon VPC by default.</p></li><li><p>Redis append-only files (AOF) are not supported for T1 or T2 instances.</p></li><li><p>Redis Multi-AZ with automatic failover is not supported on T1 instances.</p></li><li><p>Redis configuration variables <code>appendonly</code> and <code>appendfsync</code> are not supported on Redis version 2.8.22 and later.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeType;

/**
 <p>A list of cache nodes that are members of the cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheCacheNode *> * _Nullable cacheNodes;

/**
 <p>Status of the cache parameter group.</p>
 */
@property (nonatomic, strong) AWSElasticacheCacheParameterGroupStatus * _Nullable cacheParameterGroup;

/**
 <p>A list of cache security group elements, composed of name and status sub-elements.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheCacheSecurityGroupMembership *> * _Nullable cacheSecurityGroups;

/**
 <p>The name of the cache subnet group associated with the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheSubnetGroupName;

/**
 <p>The URL of the web page where you can download the latest ElastiCache client library.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientDownloadLandingPage;

/**
 <p>Represents a Memcached cluster endpoint which, if Automatic Discovery is enabled on the cluster, can be used by an application to connect to any node in the cluster. The configuration endpoint will always have <code>.cfg</code> in it.</p><p>Example: <code>mem-3.9dvc4r<u>.cfg</u>.usw2.cache.amazonaws.com:11211</code></p>
 */
@property (nonatomic, strong) AWSElasticacheEndpoint * _Nullable configurationEndpoint;

/**
 <p>The name of the cache engine (<code>memcached</code> or <code>redis</code>) to be used for this cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The version of the cache engine that is used in this cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>Describes a notification topic and its status. Notification topics are used for publishing ElastiCache events to subscribers using Amazon Simple Notification Service (SNS). </p>
 */
@property (nonatomic, strong) AWSElasticacheNotificationConfiguration * _Nullable notificationConfiguration;

/**
 <p>The number of cache nodes in the cluster.</p><p>For clusters running Redis, this value must be 1. For clusters running Memcached, this value must be between 1 and 20.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numCacheNodes;

/**
 <p>A group of settings that are applied to the cluster in the future, or that are currently being applied.</p>
 */
@property (nonatomic, strong) AWSElasticachePendingModifiedValues * _Nullable pendingModifiedValues;

/**
 <p>The name of the Availability Zone in which the cluster is located or "Multiple" if the cache nodes are located in different Availability Zones.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredAvailabilityZone;

/**
 <p>Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period.</p><p>Valid values for <code>ddd</code> are:</p><ul><li><p><code>sun</code></p></li><li><p><code>mon</code></p></li><li><p><code>tue</code></p></li><li><p><code>wed</code></p></li><li><p><code>thu</code></p></li><li><p><code>fri</code></p></li><li><p><code>sat</code></p></li></ul><p>Example: <code>sun:23:00-mon:01:30</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>The replication group to which this cluster belongs. If this field is empty, the cluster is not associated with any replication group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

/**
 <p>A list of VPC Security Groups associated with the cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheSecurityGroupMembership *> * _Nullable securityGroups;

/**
 <p>The number of days for which ElastiCache retains automatic cluster snapshots before deleting them. For example, if you set <code>SnapshotRetentionLimit</code> to 5, a snapshot that was taken today is retained for 5 days before being deleted.</p><important><p> If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off.</p></important>
 */
@property (nonatomic, strong) NSNumber * _Nullable snapshotRetentionLimit;

/**
 <p>The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of your cluster.</p><p>Example: <code>05:00-09:00</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotWindow;

/**
 <p>A flag that enables in-transit encryption when set to <code>true</code>.</p><p>You cannot modify the value of <code>TransitEncryptionEnabled</code> after the cluster is created. To enable in-transit encryption on a cluster you must set <code>TransitEncryptionEnabled</code> to <code>true</code> when you create a cluster.</p><p><b>Required:</b> Only available when creating a replication group in an Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or later.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable transitEncryptionEnabled;

@end

/**
 <p>Represents the output of a <code>DescribeCacheClusters</code> operation.</p>
 */
@interface AWSElasticacheCacheClusterMessage : AWSModel


/**
 <p>A list of clusters. Each item in the list contains detailed information about one cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheCacheCluster *> * _Nullable cacheClusters;

/**
 <p>Provides an identifier to allow retrieval of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>Provides all of the details about a particular cache engine version.</p>
 */
@interface AWSElasticacheCacheEngineVersion : AWSModel


/**
 <p>The description of the cache engine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheEngineDescription;

/**
 <p>The description of the cache engine version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheEngineVersionDescription;

/**
 <p>The name of the cache parameter group family associated with this cache engine.</p><p>Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> | <code>redis2.6</code> | <code>redis2.8</code> | <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> | </p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheParameterGroupFamily;

/**
 <p>The name of the cache engine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The version number of the cache engine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

@end

/**
 <p>Represents the output of a <a>DescribeCacheEngineVersions</a> operation.</p>
 */
@interface AWSElasticacheCacheEngineVersionMessage : AWSModel


/**
 <p>A list of cache engine version details. Each element in the list contains detailed information about one cache engine version.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheCacheEngineVersion *> * _Nullable cacheEngineVersions;

/**
 <p>Provides an identifier to allow retrieval of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>Represents an individual cache node within a cluster. Each cache node runs its own instance of the cluster's protocol-compliant caching software - either Memcached or Redis.</p><p>The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.</p><ul><li><p>General purpose:</p><ul><li><p>Current generation: </p><p><b>M5 node types:</b><code>cache.m5.large</code>, <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>, <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>, <code>cache.m5.24xlarge</code></p><p><b>M4 node types:</b><code>cache.m4.large</code>, <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>, <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code></p><p><b>T3 node types:</b><code>cache.t3.micro</code>, <code>cache.t3.small</code>, <code>cache.t3.medium</code></p><p><b>T2 node types:</b><code>cache.t2.micro</code>, <code>cache.t2.small</code>, <code>cache.t2.medium</code></p></li><li><p>Previous generation: (not recommended)</p><p><b>T1 node types:</b><code>cache.t1.micro</code></p><p><b>M1 node types:</b><code>cache.m1.small</code>, <code>cache.m1.medium</code>, <code>cache.m1.large</code>, <code>cache.m1.xlarge</code></p><p><b>M3 node types:</b><code>cache.m3.medium</code>, <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>, <code>cache.m3.2xlarge</code></p></li></ul></li><li><p>Compute optimized:</p><ul><li><p>Previous generation: (not recommended)</p><p><b>C1 node types:</b><code>cache.c1.xlarge</code></p></li></ul></li><li><p>Memory optimized:</p><ul><li><p>Current generation: </p><p><b>R5 node types:</b><code>cache.r5.large</code>, <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>, <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>, <code>cache.r5.24xlarge</code></p><p><b>R4 node types:</b><code>cache.r4.large</code>, <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>, <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>, <code>cache.r4.16xlarge</code></p></li><li><p>Previous generation: (not recommended)</p><p><b>M2 node types:</b><code>cache.m2.xlarge</code>, <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code></p><p><b>R3 node types:</b><code>cache.r3.large</code>, <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>, <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code></p></li></ul></li></ul><p><b>Additional node type info</b></p><ul><li><p>All current generation instance types are created in Amazon VPC by default.</p></li><li><p>Redis append-only files (AOF) are not supported for T1 or T2 instances.</p></li><li><p>Redis Multi-AZ with automatic failover is not supported on T1 instances.</p></li><li><p>Redis configuration variables <code>appendonly</code> and <code>appendfsync</code> are not supported on Redis version 2.8.22 and later.</p></li></ul>
 */
@interface AWSElasticacheCacheNode : AWSModel


/**
 <p>The date and time when the cache node was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable cacheNodeCreateTime;

/**
 <p>The cache node identifier. A node ID is a numeric identifier (0001, 0002, etc.). The combination of cluster ID and node ID uniquely identifies every cache node used in a customer's AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeId;

/**
 <p>The current state of this cache node, one of the following values: <code>available</code>, <code>creating</code>, <code>rebooting</code>, or <code>deleting</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeStatus;

/**
 <p>The Availability Zone where this node was created and now resides.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerAvailabilityZone;

/**
 <p>The hostname for connecting to this cache node.</p>
 */
@property (nonatomic, strong) AWSElasticacheEndpoint * _Nullable endpoint;

/**
 <p>The status of the parameter group applied to this cache node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterGroupStatus;

/**
 <p>The ID of the primary node to which this read replica node is synchronized. If this field is empty, this node is not associated with a primary cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCacheNodeId;

@end

/**
 <p>A parameter that has a different value for each cache node type it is applied to. For example, in a Redis cluster, a <code>cache.m1.large</code> cache node type would have a larger <code>maxmemory</code> value than a <code>cache.m1.small</code> type.</p>
 */
@interface AWSElasticacheCacheNodeTypeSpecificParameter : AWSModel


/**
 <p>The valid range of values for the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable allowedValues;

/**
 <p>A list of cache node types and their corresponding values for this parameter.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheCacheNodeTypeSpecificValue *> * _Nullable cacheNodeTypeSpecificValues;

/**
 <p>Indicates whether a change to the parameter is applied immediately or requires a reboot for the change to be applied. You can force a reboot or wait until the next maintenance window's reboot. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.Rebooting.html">Rebooting a Cluster</a>.</p>
 */
@property (nonatomic, assign) AWSElasticacheChangeType changeType;

/**
 <p>The valid data type for the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataType;

/**
 <p>A description of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Indicates whether (<code>true</code>) or not (<code>false</code>) the parameter can be modified. Some parameters have security or operational implications that prevent them from being changed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isModifiable;

/**
 <p>The earliest cache engine version to which the parameter can apply.</p>
 */
@property (nonatomic, strong) NSString * _Nullable minimumEngineVersion;

/**
 <p>The name of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterName;

/**
 <p>The source of the parameter value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable source;

@end

/**
 <p>A value that applies only to a certain cache node type.</p>
 */
@interface AWSElasticacheCacheNodeTypeSpecificValue : AWSModel


/**
 <p>The cache node type for which this value applies.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeType;

/**
 <p>The value for the cache node type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>The status of the service update on the cache node</p>
 */
@interface AWSElasticacheCacheNodeUpdateStatus : AWSModel


/**
 <p>The node ID of the cache cluster</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeId;

/**
 <p>The deletion date of the node</p>
 */
@property (nonatomic, strong) NSDate * _Nullable nodeDeletionDate;

/**
 <p>The end date of the update for a node</p>
 */
@property (nonatomic, strong) NSDate * _Nullable nodeUpdateEndDate;

/**
 <p>Reflects whether the update was initiated by the customer or automatically applied</p>
 */
@property (nonatomic, assign) AWSElasticacheNodeUpdateInitiatedBy nodeUpdateInitiatedBy;

/**
 <p>The date when the update is triggered</p>
 */
@property (nonatomic, strong) NSDate * _Nullable nodeUpdateInitiatedDate;

/**
 <p>The start date of the update for a node</p>
 */
@property (nonatomic, strong) NSDate * _Nullable nodeUpdateStartDate;

/**
 <p>The update status of the node</p>
 */
@property (nonatomic, assign) AWSElasticacheNodeUpdateStatus nodeUpdateStatus;

/**
 <p>The date when the NodeUpdateStatus was last modified&gt;</p>
 */
@property (nonatomic, strong) NSDate * _Nullable nodeUpdateStatusModifiedDate;

@end

/**
 <p>Represents the output of a <code>CreateCacheParameterGroup</code> operation.</p>
 */
@interface AWSElasticacheCacheParameterGroup : AWSModel


/**
 <p>The ARN (Amazon Resource Name) of the cache parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The name of the cache parameter group family that this cache parameter group is compatible with.</p><p>Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> | <code>redis2.6</code> | <code>redis2.8</code> | <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> | </p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheParameterGroupFamily;

/**
 <p>The name of the cache parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheParameterGroupName;

/**
 <p>The description for this cache parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Indicates whether the parameter group is associated with a Global Datastore</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isGlobal;

@end

/**
 <p>Represents the output of a <code>DescribeCacheParameters</code> operation.</p>
 */
@interface AWSElasticacheCacheParameterGroupDetails : AWSModel


/**
 <p>A list of parameters specific to a particular cache node type. Each element in the list contains detailed information about one parameter.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheCacheNodeTypeSpecificParameter *> * _Nullable cacheNodeTypeSpecificParameters;

/**
 <p>Provides an identifier to allow retrieval of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of <a>Parameter</a> instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheParameter *> * _Nullable parameters;

@end

/**
 <p>Represents the output of one of the following operations:</p><ul><li><p><code>ModifyCacheParameterGroup</code></p></li><li><p><code>ResetCacheParameterGroup</code></p></li></ul>
 */
@interface AWSElasticacheCacheParameterGroupNameMessage : AWSModel


/**
 <p>The name of the cache parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheParameterGroupName;

@end

/**
 <p>Status of the cache parameter group.</p>
 */
@interface AWSElasticacheCacheParameterGroupStatus : AWSModel


/**
 <p>A list of the cache node IDs which need to be rebooted for parameter changes to be applied. A node ID is a numeric identifier (0001, 0002, etc.).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cacheNodeIdsToReboot;

/**
 <p>The name of the cache parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheParameterGroupName;

/**
 <p>The status of parameter updates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterApplyStatus;

@end

/**
 <p>Represents the output of a <code>DescribeCacheParameterGroups</code> operation.</p>
 */
@interface AWSElasticacheCacheParameterGroupsMessage : AWSModel


/**
 <p>A list of cache parameter groups. Each element in the list contains detailed information about one cache parameter group.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheCacheParameterGroup *> * _Nullable cacheParameterGroups;

/**
 <p>Provides an identifier to allow retrieval of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>Represents the output of one of the following operations:</p><ul><li><p><code>AuthorizeCacheSecurityGroupIngress</code></p></li><li><p><code>CreateCacheSecurityGroup</code></p></li><li><p><code>RevokeCacheSecurityGroupIngress</code></p></li></ul>
 */
@interface AWSElasticacheCacheSecurityGroup : AWSModel


/**
 <p>The ARN (Amazon Resource Name) of the cache security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The name of the cache security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheSecurityGroupName;

/**
 <p>The description of the cache security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A list of Amazon EC2 security groups that are associated with this cache security group.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheEC2SecurityGroup *> * _Nullable EC2SecurityGroups;

/**
 <p>The AWS account ID of the cache security group owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerId;

@end

/**
 <p>Represents a cluster's status within a particular cache security group.</p>
 */
@interface AWSElasticacheCacheSecurityGroupMembership : AWSModel


/**
 <p>The name of the cache security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheSecurityGroupName;

/**
 <p>The membership status in the cache security group. The status changes when a cache security group is modified, or when the cache security groups assigned to a cluster are modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Represents the output of a <code>DescribeCacheSecurityGroups</code> operation.</p>
 */
@interface AWSElasticacheCacheSecurityGroupMessage : AWSModel


/**
 <p>A list of cache security groups. Each element in the list contains detailed information about one group.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheCacheSecurityGroup *> * _Nullable cacheSecurityGroups;

/**
 <p>Provides an identifier to allow retrieval of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>Represents the output of one of the following operations:</p><ul><li><p><code>CreateCacheSubnetGroup</code></p></li><li><p><code>ModifyCacheSubnetGroup</code></p></li></ul>
 */
@interface AWSElasticacheCacheSubnetGroup : AWSModel


/**
 <p>The ARN (Amazon Resource Name) of the cache subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The description of the cache subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheSubnetGroupDescription;

/**
 <p>The name of the cache subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheSubnetGroupName;

/**
 <p>A list of subnets associated with the cache subnet group.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheSubnet *> * _Nullable subnets;

/**
 <p>The Amazon Virtual Private Cloud identifier (VPC ID) of the cache subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Represents the output of a <code>DescribeCacheSubnetGroups</code> operation.</p>
 */
@interface AWSElasticacheCacheSubnetGroupMessage : AWSModel


/**
 <p>A list of cache subnet groups. Each element in the list contains detailed information about one group.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheCacheSubnetGroup *> * _Nullable cacheSubnetGroups;

/**
 <p>Provides an identifier to allow retrieval of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSElasticacheCompleteMigrationMessage : AWSRequest


/**
 <p>Forces the migration to stop without ensuring that data is in sync. It is recommended to use this option only to abort the migration and not recommended when application wants to continue migration to ElastiCache.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

/**
 <p>The ID of the replication group to which data is being migrated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

@end

/**
 
 */
@interface AWSElasticacheCompleteMigrationResponse : AWSModel


/**
 <p>Contains all of the attributes of a specific Redis replication group.</p>
 */
@property (nonatomic, strong) AWSElasticacheReplicationGroup * _Nullable replicationGroup;

@end

/**
 <p>Node group (shard) configuration options when adding or removing replicas. Each node group (shard) configuration has the following members: NodeGroupId, NewReplicaCount, and PreferredAvailabilityZones. </p>
 Required parameters: [NodeGroupId, NewReplicaCount]
 */
@interface AWSElasticacheConfigureShard : AWSModel


/**
 <p>The number of replicas you want in this node group at the end of this operation. The maximum value for <code>NewReplicaCount</code> is 5. The minimum value depends upon the type of Redis replication group you are working with.</p><p>The minimum number of replicas in a shard or replication group is:</p><ul><li><p>Redis (cluster mode disabled)</p><ul><li><p>If Multi-AZ with Automatic Failover is enabled: 1</p></li><li><p>If Multi-AZ with Automatic Failover is not enable: 0</p></li></ul></li><li><p>Redis (cluster mode enabled): 0 (though you will not be able to failover to a replica if your primary node fails)</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable latestReplicaCount;

/**
 <p>The 4-digit id for the node group you are configuring. For Redis (cluster mode disabled) replication groups, the node group id is always 0001. To find a Redis (cluster mode enabled)'s node group's (shard's) id, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/shard-find-id.html">Finding a Shard's Id</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeGroupId;

/**
 <p>A list of <code>PreferredAvailabilityZone</code> strings that specify which availability zones the replication group's nodes are to be in. The nummber of <code>PreferredAvailabilityZone</code> values must equal the value of <code>NewReplicaCount</code> plus 1 to account for the primary node. If this member of <code>ReplicaConfiguration</code> is omitted, ElastiCache for Redis selects the availability zone for each of the replicas.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable preferredAvailabilityZones;

@end

/**
 <p>Represents the input of a <code>CopySnapshotMessage</code> operation.</p>
 Required parameters: [SourceSnapshotName, TargetSnapshotName]
 */
@interface AWSElasticacheReplicateSnapshotMessage : AWSRequest


/**
 <p>The ID of the KMS key used to encrypt the target snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The name of an existing snapshot from which to make a copy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceSnapshotName;

/**
 <p>The Amazon S3 bucket to which the snapshot is exported. This parameter is used only when exporting a snapshot for external access.</p><p>When using this parameter to export a snapshot, be sure Amazon ElastiCache has the needed permissions to this S3 bucket. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access">Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket</a> in the <i>Amazon ElastiCache User Guide</i>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Snapshots.Exporting.html">Exporting a Snapshot</a> in the <i>Amazon ElastiCache User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetBucket;

/**
 <p>A name for the snapshot copy. ElastiCache does not permit overwriting a snapshot, therefore this name must be unique within its context - ElastiCache or an Amazon S3 bucket if exporting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetSnapshotName;

@end

/**
 
 */
@interface AWSElasticacheReplicateSnapshotResult : AWSModel


/**
 <p>Represents a copy of an entire Redis cluster as of the time when the snapshot was taken.</p>
 */
@property (nonatomic, strong) AWSElasticacheSnapshot * _Nullable snapshot;

@end

/**
 <p>Represents the input of a CreateCacheCluster operation.</p>
 Required parameters: [CacheClusterId]
 */
@interface AWSElasticacheCreateCacheClusterMessage : AWSRequest


/**
 <p>Specifies whether the nodes in this Memcached cluster are created in a single Availability Zone or created across multiple Availability Zones in the cluster's region.</p><p>This parameter is only supported for Memcached clusters.</p><p>If the <code>AZMode</code> and <code>PreferredAvailabilityZones</code> are not specified, ElastiCache assumes <code>single-az</code> mode.</p>
 */
@property (nonatomic, assign) AWSElasticacheAZMode AZMode;

/**
 <p><b>Reserved parameter.</b> The password used to access a password protected server.</p><p>Password constraints:</p><ul><li><p>Must be only printable ASCII characters.</p></li><li><p>Must be at least 16 characters and no more than 128 characters in length.</p></li><li><p>The only permitted printable special characters are !, &amp;, #, $, ^, &lt;, &gt;, and -. Other printable special characters cannot be used in the AUTH token.</p></li></ul><p>For more information, see <a href="http://redis.io/commands/AUTH">AUTH password</a> at http://redis.io/commands/AUTH.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authToken;

/**
 <p>This parameter is currently disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoMinorVersionUpgrade;

/**
 <p>The node group (shard) identifier. This parameter is stored as a lowercase string.</p><p><b>Constraints:</b></p><ul><li><p>A name must contain from 1 to 50 alphanumeric characters or hyphens.</p></li><li><p>The first character must be a letter.</p></li><li><p>A name cannot end with a hyphen or contain two consecutive hyphens.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable cacheClusterId;

/**
 <p>The compute and memory capacity of the nodes in the node group (shard).</p><p>The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.</p><ul><li><p>General purpose:</p><ul><li><p>Current generation: </p><p><b>M5 node types:</b><code>cache.m5.large</code>, <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>, <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>, <code>cache.m5.24xlarge</code></p><p><b>M4 node types:</b><code>cache.m4.large</code>, <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>, <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code></p><p><b>T3 node types:</b><code>cache.t3.micro</code>, <code>cache.t3.small</code>, <code>cache.t3.medium</code></p><p><b>T2 node types:</b><code>cache.t2.micro</code>, <code>cache.t2.small</code>, <code>cache.t2.medium</code></p></li><li><p>Previous generation: (not recommended)</p><p><b>T1 node types:</b><code>cache.t1.micro</code></p><p><b>M1 node types:</b><code>cache.m1.small</code>, <code>cache.m1.medium</code>, <code>cache.m1.large</code>, <code>cache.m1.xlarge</code></p><p><b>M3 node types:</b><code>cache.m3.medium</code>, <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>, <code>cache.m3.2xlarge</code></p></li></ul></li><li><p>Compute optimized:</p><ul><li><p>Previous generation: (not recommended)</p><p><b>C1 node types:</b><code>cache.c1.xlarge</code></p></li></ul></li><li><p>Memory optimized:</p><ul><li><p>Current generation: </p><p><b>R5 node types:</b><code>cache.r5.large</code>, <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>, <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>, <code>cache.r5.24xlarge</code></p><p><b>R4 node types:</b><code>cache.r4.large</code>, <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>, <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>, <code>cache.r4.16xlarge</code></p></li><li><p>Previous generation: (not recommended)</p><p><b>M2 node types:</b><code>cache.m2.xlarge</code>, <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code></p><p><b>R3 node types:</b><code>cache.r3.large</code>, <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>, <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code></p></li></ul></li></ul><p><b>Additional node type info</b></p><ul><li><p>All current generation instance types are created in Amazon VPC by default.</p></li><li><p>Redis append-only files (AOF) are not supported for T1 or T2 instances.</p></li><li><p>Redis Multi-AZ with automatic failover is not supported on T1 instances.</p></li><li><p>Redis configuration variables <code>appendonly</code> and <code>appendfsync</code> are not supported on Redis version 2.8.22 and later.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeType;

/**
 <p>The name of the parameter group to associate with this cluster. If this argument is omitted, the default parameter group for the specified engine is used. You cannot use any parameter group which has <code>cluster-enabled='yes'</code> when creating a cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheParameterGroupName;

/**
 <p>A list of security group names to associate with this cluster.</p><p>Use this parameter only when you are creating a cluster outside of an Amazon Virtual Private Cloud (Amazon VPC).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cacheSecurityGroupNames;

/**
 <p>The name of the subnet group to be used for the cluster.</p><p>Use this parameter only when you are creating a cluster in an Amazon Virtual Private Cloud (Amazon VPC).</p><important><p>If you're going to launch your cluster in an Amazon VPC, you need to create a subnet group before you start creating a cluster. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SubnetGroups.html">Subnets and Subnet Groups</a>.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable cacheSubnetGroupName;

/**
 <p>The name of the cache engine to be used for this cluster.</p><p>Valid values for this parameter are: <code>memcached</code> | <code>redis</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The version number of the cache engine to be used for this cluster. To view the supported cache engine versions, use the DescribeCacheEngineVersions operation.</p><p><b>Important:</b> You can upgrade to a newer engine version (see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SelectEngine.html#VersionManagement">Selecting a Cache Engine and Version</a>), but you cannot downgrade to an earlier engine version. If you want to use an earlier engine version, you must delete the existing cluster or replication group and create it anew with the earlier engine version. </p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) topic to which notifications are sent.</p><note><p>The Amazon SNS topic owner must be the same as the cluster owner.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable notificationTopicArn;

/**
 <p>The initial number of cache nodes that the cluster has.</p><p>For clusters running Redis, this value must be 1. For clusters running Memcached, this value must be between 1 and 20.</p><p>If you need more than 20 nodes for your Memcached cluster, please fill out the ElastiCache Limit Increase Request form at <a href="http://aws.amazon.com/contact-us/elasticache-node-limit-request/">http://aws.amazon.com/contact-us/elasticache-node-limit-request/</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numCacheNodes;

/**
 <p>The port number on which each of the cache nodes accepts connections.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The EC2 Availability Zone in which the cluster is created.</p><p>All nodes belonging to this Memcached cluster are placed in the preferred Availability Zone. If you want to create your nodes across multiple Availability Zones, use <code>PreferredAvailabilityZones</code>.</p><p>Default: System chosen Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredAvailabilityZone;

/**
 <p>A list of the Availability Zones in which cache nodes are created. The order of the zones in the list is not important.</p><p>This option is only supported on Memcached.</p><note><p>If you are creating your cluster in an Amazon VPC (recommended) you can only locate nodes in Availability Zones that are associated with the subnets in the selected subnet group.</p><p>The number of Availability Zones listed must equal the value of <code>NumCacheNodes</code>.</p></note><p>If you want all the nodes in the same Availability Zone, use <code>PreferredAvailabilityZone</code> instead, or repeat the Availability Zone multiple times in the list.</p><p>Default: System chosen Availability Zones.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable preferredAvailabilityZones;

/**
 <p>Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Valid values for <code>ddd</code> are:</p><p>Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period.</p><p>Valid values for <code>ddd</code> are:</p><ul><li><p><code>sun</code></p></li><li><p><code>mon</code></p></li><li><p><code>tue</code></p></li><li><p><code>wed</code></p></li><li><p><code>thu</code></p></li><li><p><code>fri</code></p></li><li><p><code>sat</code></p></li></ul><p>Example: <code>sun:23:00-mon:01:30</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>The ID of the replication group to which this cluster should belong. If this parameter is specified, the cluster is added to the specified replication group as a read replica; otherwise, the cluster is a standalone primary that is not part of any replication group.</p><p>If the specified replication group is Multi-AZ enabled and the Availability Zone is not specified, the cluster is created in Availability Zones that provide the best spread of read replicas across Availability Zones.</p><note><p>This parameter is only valid if the <code>Engine</code> parameter is <code>redis</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

/**
 <p>One or more VPC security groups associated with the cluster.</p><p>Use this parameter only when you are creating a cluster in an Amazon Virtual Private Cloud (Amazon VPC).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>A single-element string list containing an Amazon Resource Name (ARN) that uniquely identifies a Redis RDB snapshot file stored in Amazon S3. The snapshot file is used to populate the node group (shard). The Amazon S3 object name in the ARN cannot contain any commas.</p><note><p>This parameter is only valid if the <code>Engine</code> parameter is <code>redis</code>.</p></note><p>Example of an Amazon S3 ARN: <code>arn:aws:s3:::my_bucket/snapshot1.rdb</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable snapshotArns;

/**
 <p>The name of a Redis snapshot from which to restore data into the new node group (shard). The snapshot status changes to <code>restoring</code> while the new node group (shard) is being created.</p><note><p>This parameter is only valid if the <code>Engine</code> parameter is <code>redis</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotName;

/**
 <p>The number of days for which ElastiCache retains automatic snapshots before deleting them. For example, if you set <code>SnapshotRetentionLimit</code> to 5, a snapshot taken today is retained for 5 days before being deleted.</p><note><p>This parameter is only valid if the <code>Engine</code> parameter is <code>redis</code>.</p></note><p>Default: 0 (i.e., automatic backups are disabled for this cache cluster).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable snapshotRetentionLimit;

/**
 <p>The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of your node group (shard).</p><p>Example: <code>05:00-09:00</code></p><p>If you do not specify this parameter, ElastiCache automatically chooses an appropriate time range.</p><note><p>This parameter is only valid if the <code>Engine</code> parameter is <code>redis</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotWindow;

/**
 <p>A list of cost allocation tags to be added to this resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSElasticacheCreateCacheClusterResult : AWSModel


/**
 <p>Contains all of the attributes of a specific cluster.</p>
 */
@property (nonatomic, strong) AWSElasticacheCacheCluster * _Nullable cacheCluster;

@end

/**
 <p>Represents the input of a <code>CreateCacheParameterGroup</code> operation.</p>
 Required parameters: [CacheParameterGroupName, CacheParameterGroupFamily, Description]
 */
@interface AWSElasticacheCreateCacheParameterGroupMessage : AWSRequest


/**
 <p>The name of the cache parameter group family that the cache parameter group can be used with.</p><p>Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> | <code>redis2.6</code> | <code>redis2.8</code> | <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> | </p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheParameterGroupFamily;

/**
 <p>A user-specified name for the cache parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheParameterGroupName;

/**
 <p>A user-specified description for the cache parameter group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 
 */
@interface AWSElasticacheCreateCacheParameterGroupResult : AWSModel


/**
 <p>Represents the output of a <code>CreateCacheParameterGroup</code> operation.</p>
 */
@property (nonatomic, strong) AWSElasticacheCacheParameterGroup * _Nullable cacheParameterGroup;

@end

/**
 <p>Represents the input of a <code>CreateCacheSecurityGroup</code> operation.</p>
 Required parameters: [CacheSecurityGroupName, Description]
 */
@interface AWSElasticacheCreateCacheSecurityGroupMessage : AWSRequest


/**
 <p>A name for the cache security group. This value is stored as a lowercase string.</p><p>Constraints: Must contain no more than 255 alphanumeric characters. Cannot be the word "Default".</p><p>Example: <code>mysecuritygroup</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheSecurityGroupName;

/**
 <p>A description for the cache security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 
 */
@interface AWSElasticacheCreateCacheSecurityGroupResult : AWSModel


/**
 <p>Represents the output of one of the following operations:</p><ul><li><p><code>AuthorizeCacheSecurityGroupIngress</code></p></li><li><p><code>CreateCacheSecurityGroup</code></p></li><li><p><code>RevokeCacheSecurityGroupIngress</code></p></li></ul>
 */
@property (nonatomic, strong) AWSElasticacheCacheSecurityGroup * _Nullable cacheSecurityGroup;

@end

/**
 <p>Represents the input of a <code>CreateCacheSubnetGroup</code> operation.</p>
 Required parameters: [CacheSubnetGroupName, CacheSubnetGroupDescription, SubnetIds]
 */
@interface AWSElasticacheCreateCacheSubnetGroupMessage : AWSRequest


/**
 <p>A description for the cache subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheSubnetGroupDescription;

/**
 <p>A name for the cache subnet group. This value is stored as a lowercase string.</p><p>Constraints: Must contain no more than 255 alphanumeric characters or hyphens.</p><p>Example: <code>mysubnetgroup</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheSubnetGroupName;

/**
 <p>A list of VPC subnet IDs for the cache subnet group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

@end

/**
 
 */
@interface AWSElasticacheCreateCacheSubnetGroupResult : AWSModel


/**
 <p>Represents the output of one of the following operations:</p><ul><li><p><code>CreateCacheSubnetGroup</code></p></li><li><p><code>ModifyCacheSubnetGroup</code></p></li></ul>
 */
@property (nonatomic, strong) AWSElasticacheCacheSubnetGroup * _Nullable cacheSubnetGroup;

@end

/**
 
 */
@interface AWSElasticacheCreateGlobalReplicationGroupMessage : AWSRequest


/**
 <p>Provides details of the Global Datastore</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalReplicationGroupDescription;

/**
 <p>The suffix name of a Global Datastore. The suffix guarantees uniqueness of the Global Datastore name across multiple regions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalReplicationGroupIdSuffix;

/**
 <p>The name of the primary cluster that accepts writes and will replicate updates to the secondary cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable primaryReplicationGroupId;

@end

/**
 
 */
@interface AWSElasticacheCreateGlobalReplicationGroupResult : AWSModel


/**
 <p>Consists of a primary cluster that accepts writes and an associated secondary cluster that resides in a different AWS region. The secondary cluster accepts only reads. The primary cluster automatically replicates updates to the secondary cluster.</p><ul><li><p>The <b>GlobalReplicationGroupIdSuffix</b> represents the name of the Global Datastore, which is what you use to associate a secondary cluster.</p></li></ul>
 */
@property (nonatomic, strong) AWSElasticacheGlobalReplicationGroup * _Nullable globalReplicationGroup;

@end

/**
 <p>Represents the input of a <code>CreateReplicationGroup</code> operation.</p>
 Required parameters: [ReplicationGroupId, ReplicationGroupDescription]
 */
@interface AWSElasticacheCreateReplicationGroupMessage : AWSRequest


/**
 <p>A flag that enables encryption at rest when set to <code>true</code>.</p><p>You cannot modify the value of <code>AtRestEncryptionEnabled</code> after the replication group is created. To enable encryption at rest on a replication group you must set <code>AtRestEncryptionEnabled</code> to <code>true</code> when you create the replication group. </p><p><b>Required:</b> Only available when creating a replication group in an Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or later.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable atRestEncryptionEnabled;

/**
 <p><b>Reserved parameter.</b> The password used to access a password protected server.</p><p><code>AuthToken</code> can be specified only on replication groups where <code>TransitEncryptionEnabled</code> is <code>true</code>.</p><important><p>For HIPAA compliance, you must specify <code>TransitEncryptionEnabled</code> as <code>true</code>, an <code>AuthToken</code>, and a <code>CacheSubnetGroup</code>.</p></important><p>Password constraints:</p><ul><li><p>Must be only printable ASCII characters.</p></li><li><p>Must be at least 16 characters and no more than 128 characters in length.</p></li><li><p>The only permitted printable special characters are !, &amp;, #, $, ^, &lt;, &gt;, and -. Other printable special characters cannot be used in the AUTH token.</p></li></ul><p>For more information, see <a href="http://redis.io/commands/AUTH">AUTH password</a> at http://redis.io/commands/AUTH.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authToken;

/**
 <p>This parameter is currently disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoMinorVersionUpgrade;

/**
 <p>Specifies whether a read-only replica is automatically promoted to read/write primary if the existing primary fails.</p><p>If <code>true</code>, Multi-AZ is enabled for this replication group. If <code>false</code>, Multi-AZ is disabled for this replication group.</p><p><code>AutomaticFailoverEnabled</code> must be enabled for Redis (cluster mode enabled) replication groups.</p><p>Default: false</p><p>Amazon ElastiCache for Redis does not support Multi-AZ with automatic failover on:</p><ul><li><p>Redis versions earlier than 2.8.6.</p></li><li><p>Redis (cluster mode disabled): T1 node types.</p></li><li><p>Redis (cluster mode enabled): T1 node types.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable automaticFailoverEnabled;

/**
 <p>The compute and memory capacity of the nodes in the node group (shard).</p><p>The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.</p><ul><li><p>General purpose:</p><ul><li><p>Current generation: </p><p><b>M5 node types:</b><code>cache.m5.large</code>, <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>, <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>, <code>cache.m5.24xlarge</code></p><p><b>M4 node types:</b><code>cache.m4.large</code>, <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>, <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code></p><p><b>T3 node types:</b><code>cache.t3.micro</code>, <code>cache.t3.small</code>, <code>cache.t3.medium</code></p><p><b>T2 node types:</b><code>cache.t2.micro</code>, <code>cache.t2.small</code>, <code>cache.t2.medium</code></p></li><li><p>Previous generation: (not recommended)</p><p><b>T1 node types:</b><code>cache.t1.micro</code></p><p><b>M1 node types:</b><code>cache.m1.small</code>, <code>cache.m1.medium</code>, <code>cache.m1.large</code>, <code>cache.m1.xlarge</code></p><p><b>M3 node types:</b><code>cache.m3.medium</code>, <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>, <code>cache.m3.2xlarge</code></p></li></ul></li><li><p>Compute optimized:</p><ul><li><p>Previous generation: (not recommended)</p><p><b>C1 node types:</b><code>cache.c1.xlarge</code></p></li></ul></li><li><p>Memory optimized:</p><ul><li><p>Current generation: </p><p><b>R5 node types:</b><code>cache.r5.large</code>, <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>, <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>, <code>cache.r5.24xlarge</code></p><p><b>R4 node types:</b><code>cache.r4.large</code>, <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>, <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>, <code>cache.r4.16xlarge</code></p></li><li><p>Previous generation: (not recommended)</p><p><b>M2 node types:</b><code>cache.m2.xlarge</code>, <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code></p><p><b>R3 node types:</b><code>cache.r3.large</code>, <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>, <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code></p></li></ul></li></ul><p><b>Additional node type info</b></p><ul><li><p>All current generation instance types are created in Amazon VPC by default.</p></li><li><p>Redis append-only files (AOF) are not supported for T1 or T2 instances.</p></li><li><p>Redis Multi-AZ with automatic failover is not supported on T1 instances.</p></li><li><p>Redis configuration variables <code>appendonly</code> and <code>appendfsync</code> are not supported on Redis version 2.8.22 and later.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeType;

/**
 <p>The name of the parameter group to associate with this replication group. If this argument is omitted, the default cache parameter group for the specified engine is used.</p><note><p>If you are restoring to an engine version that is different than the original, you must specify the default version of that version. For example, <code>CacheParameterGroupName=default.redis4.0</code>.</p></note><p>If you are running Redis version 3.2.4 or later, only one node group (shard), and want to use a default parameter group, we recommend that you specify the parameter group by name. </p><ul><li><p>To create a Redis (cluster mode disabled) replication group, use <code>CacheParameterGroupName=default.redis3.2</code>.</p></li><li><p>To create a Redis (cluster mode enabled) replication group, use <code>CacheParameterGroupName=default.redis3.2.cluster.on</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable cacheParameterGroupName;

/**
 <p>A list of cache security group names to associate with this replication group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cacheSecurityGroupNames;

/**
 <p>The name of the cache subnet group to be used for the replication group.</p><important><p>If you're going to launch your cluster in an Amazon VPC, you need to create a subnet group before you start creating a cluster. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SubnetGroups.html">Subnets and Subnet Groups</a>.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable cacheSubnetGroupName;

/**
 <p>The name of the cache engine to be used for the clusters in this replication group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The version number of the cache engine to be used for the clusters in this replication group. To view the supported cache engine versions, use the <code>DescribeCacheEngineVersions</code> operation.</p><p><b>Important:</b> You can upgrade to a newer engine version (see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SelectEngine.html#VersionManagement">Selecting a Cache Engine and Version</a>) in the <i>ElastiCache User Guide</i>, but you cannot downgrade to an earlier engine version. If you want to use an earlier engine version, you must delete the existing cluster or replication group and create it anew with the earlier engine version. </p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The name of the Global Datastore</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalReplicationGroupId;

/**
 <p>The ID of the KMS key used to encrypt the disk in the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>A list of node group (shard) configuration options. Each node group (shard) configuration has the following members: <code>PrimaryAvailabilityZone</code>, <code>ReplicaAvailabilityZones</code>, <code>ReplicaCount</code>, and <code>Slots</code>.</p><p>If you're creating a Redis (cluster mode disabled) or a Redis (cluster mode enabled) replication group, you can use this parameter to individually configure each node group (shard), or you can omit this parameter. However, it is required when seeding a Redis (cluster mode enabled) cluster from a S3 rdb file. You must configure each node group (shard) using this parameter because you must specify the slots for each node group.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheNodeGroupConfiguration *> * _Nullable nodeGroupConfiguration;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) topic to which notifications are sent.</p><note><p>The Amazon SNS topic owner must be the same as the cluster owner.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable notificationTopicArn;

/**
 <p>The number of nodes in the cluster.</p><p>This parameter is not used if there is more than one node group (shard). You should use <code>ReplicasPerNodeGroup</code> instead.</p><p>If <code>AutomaticFailoverEnabled</code> is <code>true</code>, the value of this parameter must be at least 2. If <code>AutomaticFailoverEnabled</code> is <code>false</code> you can omit this parameter (it will default to 1), or you can explicitly set it to a value between 2 and 6.</p><p>The maximum permitted value for <code>NumCacheClusters</code> is 6 (1 primary plus 5 replicas).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numCacheClusters;

/**
 <p>An optional parameter that specifies the number of node groups (shards) for this Redis (cluster mode enabled) replication group. For Redis (cluster mode disabled) either omit this parameter or set it to 1.</p><p>Default: 1</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numNodeGroups;

/**
 <p>The port number on which each member of the replication group accepts connections.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>A list of EC2 Availability Zones in which the replication group's clusters are created. The order of the Availability Zones in the list is the order in which clusters are allocated. The primary cluster is created in the first AZ in the list.</p><p>This parameter is not used if there is more than one node group (shard). You should use <code>NodeGroupConfiguration</code> instead.</p><note><p>If you are creating your replication group in an Amazon VPC (recommended), you can only locate clusters in Availability Zones associated with the subnets in the selected subnet group.</p><p>The number of Availability Zones listed must equal the value of <code>NumCacheClusters</code>.</p></note><p>Default: system chosen Availability Zones.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable preferredCacheClusterAZs;

/**
 <p>Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Valid values for <code>ddd</code> are:</p><p>Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period.</p><p>Valid values for <code>ddd</code> are:</p><ul><li><p><code>sun</code></p></li><li><p><code>mon</code></p></li><li><p><code>tue</code></p></li><li><p><code>wed</code></p></li><li><p><code>thu</code></p></li><li><p><code>fri</code></p></li><li><p><code>sat</code></p></li></ul><p>Example: <code>sun:23:00-mon:01:30</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>The identifier of the cluster that serves as the primary for this replication group. This cluster must already exist and have a status of <code>available</code>.</p><p>This parameter is not required if <code>NumCacheClusters</code>, <code>NumNodeGroups</code>, or <code>ReplicasPerNodeGroup</code> is specified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable primaryClusterId;

/**
 <p>An optional parameter that specifies the number of replica nodes in each node group (shard). Valid values are 0 to 5.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicasPerNodeGroup;

/**
 <p>A user-created description for the replication group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupDescription;

/**
 <p>The replication group identifier. This parameter is stored as a lowercase string.</p><p>Constraints:</p><ul><li><p>A name must contain from 1 to 40 alphanumeric characters or hyphens.</p></li><li><p>The first character must be a letter.</p></li><li><p>A name cannot end with a hyphen or contain two consecutive hyphens.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

/**
 <p>One or more Amazon VPC security groups associated with this replication group.</p><p>Use this parameter only when you are creating a replication group in an Amazon Virtual Private Cloud (Amazon VPC).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>A list of Amazon Resource Names (ARN) that uniquely identify the Redis RDB snapshot files stored in Amazon S3. The snapshot files are used to populate the new replication group. The Amazon S3 object name in the ARN cannot contain any commas. The new replication group will have the number of node groups (console: shards) specified by the parameter <i>NumNodeGroups</i> or the number of node groups configured by <i>NodeGroupConfiguration</i> regardless of the number of ARNs specified here.</p><p>Example of an Amazon S3 ARN: <code>arn:aws:s3:::my_bucket/snapshot1.rdb</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable snapshotArns;

/**
 <p>The name of a snapshot from which to restore data into the new replication group. The snapshot status changes to <code>restoring</code> while the new replication group is being created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotName;

/**
 <p>The number of days for which ElastiCache retains automatic snapshots before deleting them. For example, if you set <code>SnapshotRetentionLimit</code> to 5, a snapshot that was taken today is retained for 5 days before being deleted.</p><p>Default: 0 (i.e., automatic backups are disabled for this cluster).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable snapshotRetentionLimit;

/**
 <p>The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of your node group (shard).</p><p>Example: <code>05:00-09:00</code></p><p>If you do not specify this parameter, ElastiCache automatically chooses an appropriate time range.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotWindow;

/**
 <p>A list of cost allocation tags to be added to this resource. Tags are comma-separated key,value pairs (e.g. Key=<code>myKey</code>, Value=<code>myKeyValue</code>. You can include multiple tags as shown following: Key=<code>myKey</code>, Value=<code>myKeyValue</code> Key=<code>mySecondKey</code>, Value=<code>mySecondKeyValue</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheTag *> * _Nullable tags;

/**
 <p>A flag that enables in-transit encryption when set to <code>true</code>.</p><p>You cannot modify the value of <code>TransitEncryptionEnabled</code> after the cluster is created. To enable in-transit encryption on a cluster you must set <code>TransitEncryptionEnabled</code> to <code>true</code> when you create a cluster.</p><p>This parameter is valid only if the <code>Engine</code> parameter is <code>redis</code>, the <code>EngineVersion</code> parameter is <code>3.2.6</code>, <code>4.x</code> or later, and the cluster is being created in an Amazon VPC.</p><p>If you enable in-transit encryption, you must also specify a value for <code>CacheSubnetGroup</code>.</p><p><b>Required:</b> Only available when creating a replication group in an Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or later.</p><p>Default: <code>false</code></p><important><p>For HIPAA compliance, you must specify <code>TransitEncryptionEnabled</code> as <code>true</code>, an <code>AuthToken</code>, and a <code>CacheSubnetGroup</code>.</p></important>
 */
@property (nonatomic, strong) NSNumber * _Nullable transitEncryptionEnabled;

@end

/**
 
 */
@interface AWSElasticacheCreateReplicationGroupResult : AWSModel


/**
 <p>Contains all of the attributes of a specific Redis replication group.</p>
 */
@property (nonatomic, strong) AWSElasticacheReplicationGroup * _Nullable replicationGroup;

@end

/**
 <p>Represents the input of a <code>CreateSnapshot</code> operation.</p>
 Required parameters: [SnapshotName]
 */
@interface AWSElasticacheCreateSnapshotMessage : AWSRequest


/**
 <p>The identifier of an existing cluster. The snapshot is created from this cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheClusterId;

/**
 <p>The ID of the KMS key used to encrypt the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The identifier of an existing replication group. The snapshot is created from this replication group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

/**
 <p>A name for the snapshot being created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotName;

@end

/**
 
 */
@interface AWSElasticacheCreateSnapshotResult : AWSModel


/**
 <p>Represents a copy of an entire Redis cluster as of the time when the snapshot was taken.</p>
 */
@property (nonatomic, strong) AWSElasticacheSnapshot * _Nullable snapshot;

@end

/**
 <p>The endpoint from which data should be migrated.</p>
 */
@interface AWSElasticacheCustomerNodeEndpoint : AWSModel


/**
 <p>The address of the node endpoint</p>
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 <p>The port of the node endpoint</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

@end

/**
 
 */
@interface AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupMessage : AWSRequest


/**
 <p>Indicates that the shard reconfiguration process begins immediately. At present, the only permitted value for this parameter is true. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyImmediately;

/**
 <p>If the value of NodeGroupCount is less than the current number of node groups (shards), then either NodeGroupsToRemove or NodeGroupsToRetain is required. NodeGroupsToRemove is a list of NodeGroupIds to remove from the cluster. ElastiCache for Redis will attempt to remove all node groups listed by NodeGroupsToRemove from the cluster. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable globalNodeGroupsToRemove;

/**
 <p>If the value of NodeGroupCount is less than the current number of node groups (shards), then either NodeGroupsToRemove or NodeGroupsToRetain is required. NodeGroupsToRemove is a list of NodeGroupIds to remove from the cluster. ElastiCache for Redis will attempt to remove all node groups listed by NodeGroupsToRemove from the cluster. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable globalNodeGroupsToRetain;

/**
 <p>The name of the Global Datastore</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalReplicationGroupId;

/**
 <p>The number of node groups (shards) that results from the modification of the shard configuration</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable nodeGroupCount;

@end

/**
 
 */
@interface AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupResult : AWSModel


/**
 <p>Consists of a primary cluster that accepts writes and an associated secondary cluster that resides in a different AWS region. The secondary cluster accepts only reads. The primary cluster automatically replicates updates to the secondary cluster.</p><ul><li><p>The <b>GlobalReplicationGroupIdSuffix</b> represents the name of the Global Datastore, which is what you use to associate a secondary cluster.</p></li></ul>
 */
@property (nonatomic, strong) AWSElasticacheGlobalReplicationGroup * _Nullable globalReplicationGroup;

@end

/**
 
 */
@interface AWSElasticacheDecreaseReplicaCountMessage : AWSRequest


/**
 <p>If <code>True</code>, the number of replica nodes is decreased immediately. <code>ApplyImmediately=False</code> is not currently supported.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyImmediately;

/**
 <p>The number of read replica nodes you want at the completion of this operation. For Redis (cluster mode disabled) replication groups, this is the number of replica nodes in the replication group. For Redis (cluster mode enabled) replication groups, this is the number of replica nodes in each of the replication group's node groups.</p><p>The minimum number of replicas in a shard or replication group is:</p><ul><li><p>Redis (cluster mode disabled)</p><ul><li><p>If Multi-AZ with Automatic Failover is enabled: 1</p></li><li><p>If Multi-AZ with Automatic Failover is not enabled: 0</p></li></ul></li><li><p>Redis (cluster mode enabled): 0 (though you will not be able to failover to a replica if your primary node fails)</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable latestReplicaCount;

/**
 <p>A list of <code>ConfigureShard</code> objects that can be used to configure each shard in a Redis (cluster mode enabled) replication group. The <code>ConfigureShard</code> has three members: <code>NewReplicaCount</code>, <code>NodeGroupId</code>, and <code>PreferredAvailabilityZones</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheConfigureShard *> * _Nullable replicaConfiguration;

/**
 <p>A list of the node ids to remove from the replication group or node group (shard).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable replicasToRemove;

/**
 <p>The id of the replication group from which you want to remove replica nodes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

@end

/**
 
 */
@interface AWSElasticacheDecreaseReplicaCountResult : AWSModel


/**
 <p>Contains all of the attributes of a specific Redis replication group.</p>
 */
@property (nonatomic, strong) AWSElasticacheReplicationGroup * _Nullable replicationGroup;

@end

/**
 <p>Represents the input of a <code>DeleteCacheCluster</code> operation.</p>
 Required parameters: [CacheClusterId]
 */
@interface AWSElasticacheDeleteCacheClusterMessage : AWSRequest


/**
 <p>The cluster identifier for the cluster to be deleted. This parameter is not case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheClusterId;

/**
 <p>The user-supplied name of a final cluster snapshot. This is the unique name that identifies the snapshot. ElastiCache creates the snapshot, and then deletes the cluster immediately afterward.</p>
 */
@property (nonatomic, strong) NSString * _Nullable finalSnapshotIdentifier;

@end

/**
 
 */
@interface AWSElasticacheDeleteCacheClusterResult : AWSModel


/**
 <p>Contains all of the attributes of a specific cluster.</p>
 */
@property (nonatomic, strong) AWSElasticacheCacheCluster * _Nullable cacheCluster;

@end

/**
 <p>Represents the input of a <code>DeleteCacheParameterGroup</code> operation.</p>
 Required parameters: [CacheParameterGroupName]
 */
@interface AWSElasticacheDeleteCacheParameterGroupMessage : AWSRequest


/**
 <p>The name of the cache parameter group to delete.</p><note><p>The specified cache security group must not be associated with any clusters.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable cacheParameterGroupName;

@end

/**
 <p>Represents the input of a <code>DeleteCacheSecurityGroup</code> operation.</p>
 Required parameters: [CacheSecurityGroupName]
 */
@interface AWSElasticacheDeleteCacheSecurityGroupMessage : AWSRequest


/**
 <p>The name of the cache security group to delete.</p><note><p>You cannot delete the default security group.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable cacheSecurityGroupName;

@end

/**
 <p>Represents the input of a <code>DeleteCacheSubnetGroup</code> operation.</p>
 Required parameters: [CacheSubnetGroupName]
 */
@interface AWSElasticacheDeleteCacheSubnetGroupMessage : AWSRequest


/**
 <p>The name of the cache subnet group to delete.</p><p>Constraints: Must contain no more than 255 alphanumeric characters or hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheSubnetGroupName;

@end

/**
 
 */
@interface AWSElasticacheDeleteGlobalReplicationGroupMessage : AWSRequest


/**
 <p>The name of the Global Datastore</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalReplicationGroupId;

/**
 <p>The primary replication group is retained as a standalone replication group. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retainPrimaryReplicationGroup;

@end

/**
 
 */
@interface AWSElasticacheDeleteGlobalReplicationGroupResult : AWSModel


/**
 <p>Consists of a primary cluster that accepts writes and an associated secondary cluster that resides in a different AWS region. The secondary cluster accepts only reads. The primary cluster automatically replicates updates to the secondary cluster.</p><ul><li><p>The <b>GlobalReplicationGroupIdSuffix</b> represents the name of the Global Datastore, which is what you use to associate a secondary cluster.</p></li></ul>
 */
@property (nonatomic, strong) AWSElasticacheGlobalReplicationGroup * _Nullable globalReplicationGroup;

@end

/**
 <p>Represents the input of a <code>DeleteReplicationGroup</code> operation.</p>
 Required parameters: [ReplicationGroupId]
 */
@interface AWSElasticacheDeleteReplicationGroupMessage : AWSRequest


/**
 <p>The name of a final node group (shard) snapshot. ElastiCache creates the snapshot from the primary node in the cluster, rather than one of the replicas; this is to ensure that it captures the freshest data. After the final snapshot is taken, the replication group is immediately deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable finalSnapshotIdentifier;

/**
 <p>The identifier for the cluster to be deleted. This parameter is not case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

/**
 <p>If set to <code>true</code>, all of the read replicas are deleted, but the primary node is retained.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retainPrimaryCluster;

@end

/**
 
 */
@interface AWSElasticacheDeleteReplicationGroupResult : AWSModel


/**
 <p>Contains all of the attributes of a specific Redis replication group.</p>
 */
@property (nonatomic, strong) AWSElasticacheReplicationGroup * _Nullable replicationGroup;

@end

/**
 <p>Represents the input of a <code>DeleteSnapshot</code> operation.</p>
 Required parameters: [SnapshotName]
 */
@interface AWSElasticacheDeleteSnapshotMessage : AWSRequest


/**
 <p>The name of the snapshot to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotName;

@end

/**
 
 */
@interface AWSElasticacheDeleteSnapshotResult : AWSModel


/**
 <p>Represents a copy of an entire Redis cluster as of the time when the snapshot was taken.</p>
 */
@property (nonatomic, strong) AWSElasticacheSnapshot * _Nullable snapshot;

@end

/**
 <p>Represents the input of a <code>DescribeCacheClusters</code> operation.</p>
 */
@interface AWSElasticacheDescribeCacheClustersMessage : AWSRequest


/**
 <p>The user-supplied cluster identifier. If this parameter is specified, only information about that specific cluster is returned. This parameter isn't case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheClusterId;

/**
 <p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p><p>Default: 100</p><p>Constraints: minimum 20; maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>An optional flag that can be included in the <code>DescribeCacheCluster</code> request to show only nodes (API/CLI: clusters) that are not members of a replication group. In practice, this mean Memcached and single node Redis clusters.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable showCacheClustersNotInReplicationGroups;

/**
 <p>An optional flag that can be included in the <code>DescribeCacheCluster</code> request to retrieve information about the individual cache nodes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable showCacheNodeInfo;

@end

/**
 <p>Represents the input of a <code>DescribeCacheEngineVersions</code> operation.</p>
 */
@interface AWSElasticacheDescribeCacheEngineVersionsMessage : AWSRequest


/**
 <p>The name of a specific cache parameter group family to return details for.</p><p>Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> | <code>redis2.6</code> | <code>redis2.8</code> | <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> | </p><p>Constraints:</p><ul><li><p>Must be 1 to 255 alphanumeric characters</p></li><li><p>First character must be a letter</p></li><li><p>Cannot end with a hyphen or contain two consecutive hyphens</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable cacheParameterGroupFamily;

/**
 <p>If <code>true</code>, specifies that only the default version of the specified engine or engine and major version combination is to be returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultOnly;

/**
 <p>The cache engine to return. Valid values: <code>memcached</code> | <code>redis</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The cache engine version to return.</p><p>Example: <code>1.4.14</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p><p>Default: 100</p><p>Constraints: minimum 20; maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p>Represents the input of a <code>DescribeCacheParameterGroups</code> operation.</p>
 */
@interface AWSElasticacheDescribeCacheParameterGroupsMessage : AWSRequest


/**
 <p>The name of a specific cache parameter group to return details for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheParameterGroupName;

/**
 <p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p><p>Default: 100</p><p>Constraints: minimum 20; maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p>Represents the input of a <code>DescribeCacheParameters</code> operation.</p>
 Required parameters: [CacheParameterGroupName]
 */
@interface AWSElasticacheDescribeCacheParametersMessage : AWSRequest


/**
 <p>The name of a specific cache parameter group to return details for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheParameterGroupName;

/**
 <p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p><p>Default: 100</p><p>Constraints: minimum 20; maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The parameter types to return.</p><p>Valid values: <code>user</code> | <code>system</code> | <code>engine-default</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable source;

@end

/**
 <p>Represents the input of a <code>DescribeCacheSecurityGroups</code> operation.</p>
 */
@interface AWSElasticacheDescribeCacheSecurityGroupsMessage : AWSRequest


/**
 <p>The name of the cache security group to return details for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheSecurityGroupName;

/**
 <p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p><p>Default: 100</p><p>Constraints: minimum 20; maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p>Represents the input of a <code>DescribeCacheSubnetGroups</code> operation.</p>
 */
@interface AWSElasticacheDescribeCacheSubnetGroupsMessage : AWSRequest


/**
 <p>The name of the cache subnet group to return details for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheSubnetGroupName;

/**
 <p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p><p>Default: 100</p><p>Constraints: minimum 20; maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p>Represents the input of a <code>DescribeEngineDefaultParameters</code> operation.</p>
 Required parameters: [CacheParameterGroupFamily]
 */
@interface AWSElasticacheDescribeEngineDefaultParametersMessage : AWSRequest


/**
 <p>The name of the cache parameter group family.</p><p>Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> | <code>redis2.6</code> | <code>redis2.8</code> | <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> | </p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheParameterGroupFamily;

/**
 <p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p><p>Default: 100</p><p>Constraints: minimum 20; maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 
 */
@interface AWSElasticacheDescribeEngineDefaultParametersResult : AWSModel


/**
 <p>Represents the output of a <code>DescribeEngineDefaultParameters</code> operation.</p>
 */
@property (nonatomic, strong) AWSElasticacheEngineDefaults * _Nullable engineDefaults;

@end

/**
 <p>Represents the input of a <code>DescribeEvents</code> operation.</p>
 */
@interface AWSElasticacheDescribeEventsMessage : AWSRequest


/**
 <p>The number of minutes worth of events to retrieve.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p>The end of the time interval for which to retrieve events, specified in ISO 8601 format.</p><p><b>Example:</b> 2017-03-30T07:03:49.555Z</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p><p>Default: 100</p><p>Constraints: minimum 20; maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The identifier of the event source for which events are returned. If not specified, all sources are included in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceIdentifier;

/**
 <p>The event source to retrieve events for. If no value is specified, all events are returned.</p>
 */
@property (nonatomic, assign) AWSElasticacheSourceType sourceType;

/**
 <p>The beginning of the time interval to retrieve events for, specified in ISO 8601 format.</p><p><b>Example:</b> 2017-03-30T07:03:49.555Z</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 
 */
@interface AWSElasticacheDescribeGlobalReplicationGroupsMessage : AWSRequest


/**
 <p>The name of the Global Datastore</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalReplicationGroupId;

/**
 <p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified MaxRecords value, a marker is included in the response so that the remaining results can be retrieved. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>Returns the list of members that comprise the Global Datastore.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable showMemberInfo;

@end

/**
 
 */
@interface AWSElasticacheDescribeGlobalReplicationGroupsResult : AWSModel


/**
 <p>Indicates the slot configuration and global identifier for each slice group.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheGlobalReplicationGroup *> * _Nullable globalReplicationGroups;

/**
 <p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by MaxRecords. &gt;</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>Represents the input of a <code>DescribeReplicationGroups</code> operation.</p>
 */
@interface AWSElasticacheDescribeReplicationGroupsMessage : AWSRequest


/**
 <p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p><p>Default: 100</p><p>Constraints: minimum 20; maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The identifier for the replication group to be described. This parameter is not case sensitive.</p><p>If you do not specify this parameter, information about all replication groups is returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

@end

/**
 <p>Represents the input of a <code>DescribeReservedCacheNodes</code> operation.</p>
 */
@interface AWSElasticacheDescribeReservedCacheNodesMessage : AWSRequest


/**
 <p>The cache node type filter value. Use this parameter to show only those reservations matching the specified cache node type.</p><p>The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.</p><ul><li><p>General purpose:</p><ul><li><p>Current generation: </p><p><b>M5 node types:</b><code>cache.m5.large</code>, <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>, <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>, <code>cache.m5.24xlarge</code></p><p><b>M4 node types:</b><code>cache.m4.large</code>, <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>, <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code></p><p><b>T3 node types:</b><code>cache.t3.micro</code>, <code>cache.t3.small</code>, <code>cache.t3.medium</code></p><p><b>T2 node types:</b><code>cache.t2.micro</code>, <code>cache.t2.small</code>, <code>cache.t2.medium</code></p></li><li><p>Previous generation: (not recommended)</p><p><b>T1 node types:</b><code>cache.t1.micro</code></p><p><b>M1 node types:</b><code>cache.m1.small</code>, <code>cache.m1.medium</code>, <code>cache.m1.large</code>, <code>cache.m1.xlarge</code></p><p><b>M3 node types:</b><code>cache.m3.medium</code>, <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>, <code>cache.m3.2xlarge</code></p></li></ul></li><li><p>Compute optimized:</p><ul><li><p>Previous generation: (not recommended)</p><p><b>C1 node types:</b><code>cache.c1.xlarge</code></p></li></ul></li><li><p>Memory optimized:</p><ul><li><p>Current generation: </p><p><b>R5 node types:</b><code>cache.r5.large</code>, <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>, <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>, <code>cache.r5.24xlarge</code></p><p><b>R4 node types:</b><code>cache.r4.large</code>, <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>, <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>, <code>cache.r4.16xlarge</code></p></li><li><p>Previous generation: (not recommended)</p><p><b>M2 node types:</b><code>cache.m2.xlarge</code>, <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code></p><p><b>R3 node types:</b><code>cache.r3.large</code>, <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>, <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code></p></li></ul></li></ul><p><b>Additional node type info</b></p><ul><li><p>All current generation instance types are created in Amazon VPC by default.</p></li><li><p>Redis append-only files (AOF) are not supported for T1 or T2 instances.</p></li><li><p>Redis Multi-AZ with automatic failover is not supported on T1 instances.</p></li><li><p>Redis configuration variables <code>appendonly</code> and <code>appendfsync</code> are not supported on Redis version 2.8.22 and later.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeType;

/**
 <p>The duration filter value, specified in years or seconds. Use this parameter to show only reservations for this duration.</p><p>Valid Values: <code>1 | 3 | 31536000 | 94608000</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable duration;

/**
 <p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p><p>Default: 100</p><p>Constraints: minimum 20; maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The offering type filter value. Use this parameter to show only the available offerings matching the specified offering type.</p><p>Valid values: <code>"Light Utilization"|"Medium Utilization"|"Heavy Utilization"</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable offeringType;

/**
 <p>The product description filter value. Use this parameter to show only those reservations matching the specified product description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productDescription;

/**
 <p>The reserved cache node identifier filter value. Use this parameter to show only the reservation that matches the specified reservation ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedCacheNodeId;

/**
 <p>The offering identifier filter value. Use this parameter to show only purchased reservations matching the specified offering identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedCacheNodesOfferingId;

@end

/**
 <p>Represents the input of a <code>DescribeReservedCacheNodesOfferings</code> operation.</p>
 */
@interface AWSElasticacheDescribeReservedCacheNodesOfferingsMessage : AWSRequest


/**
 <p>The cache node type filter value. Use this parameter to show only the available offerings matching the specified cache node type.</p><p>The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.</p><ul><li><p>General purpose:</p><ul><li><p>Current generation: </p><p><b>M5 node types:</b><code>cache.m5.large</code>, <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>, <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>, <code>cache.m5.24xlarge</code></p><p><b>M4 node types:</b><code>cache.m4.large</code>, <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>, <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code></p><p><b>T3 node types:</b><code>cache.t3.micro</code>, <code>cache.t3.small</code>, <code>cache.t3.medium</code></p><p><b>T2 node types:</b><code>cache.t2.micro</code>, <code>cache.t2.small</code>, <code>cache.t2.medium</code></p></li><li><p>Previous generation: (not recommended)</p><p><b>T1 node types:</b><code>cache.t1.micro</code></p><p><b>M1 node types:</b><code>cache.m1.small</code>, <code>cache.m1.medium</code>, <code>cache.m1.large</code>, <code>cache.m1.xlarge</code></p><p><b>M3 node types:</b><code>cache.m3.medium</code>, <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>, <code>cache.m3.2xlarge</code></p></li></ul></li><li><p>Compute optimized:</p><ul><li><p>Previous generation: (not recommended)</p><p><b>C1 node types:</b><code>cache.c1.xlarge</code></p></li></ul></li><li><p>Memory optimized:</p><ul><li><p>Current generation: </p><p><b>R5 node types:</b><code>cache.r5.large</code>, <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>, <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>, <code>cache.r5.24xlarge</code></p><p><b>R4 node types:</b><code>cache.r4.large</code>, <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>, <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>, <code>cache.r4.16xlarge</code></p></li><li><p>Previous generation: (not recommended)</p><p><b>M2 node types:</b><code>cache.m2.xlarge</code>, <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code></p><p><b>R3 node types:</b><code>cache.r3.large</code>, <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>, <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code></p></li></ul></li></ul><p><b>Additional node type info</b></p><ul><li><p>All current generation instance types are created in Amazon VPC by default.</p></li><li><p>Redis append-only files (AOF) are not supported for T1 or T2 instances.</p></li><li><p>Redis Multi-AZ with automatic failover is not supported on T1 instances.</p></li><li><p>Redis configuration variables <code>appendonly</code> and <code>appendfsync</code> are not supported on Redis version 2.8.22 and later.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeType;

/**
 <p>Duration filter value, specified in years or seconds. Use this parameter to show only reservations for a given duration.</p><p>Valid Values: <code>1 | 3 | 31536000 | 94608000</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable duration;

/**
 <p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p><p>Default: 100</p><p>Constraints: minimum 20; maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The offering type filter value. Use this parameter to show only the available offerings matching the specified offering type.</p><p>Valid Values: <code>"Light Utilization"|"Medium Utilization"|"Heavy Utilization"</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable offeringType;

/**
 <p>The product description filter value. Use this parameter to show only the available offerings matching the specified product description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productDescription;

/**
 <p>The offering identifier filter value. Use this parameter to show only the available offering that matches the specified reservation identifier.</p><p>Example: <code>438012d3-4052-4cc7-b2e3-8d3372e0e706</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedCacheNodesOfferingId;

@end

/**
 
 */
@interface AWSElasticacheDescribeServiceUpdatesMessage : AWSRequest


/**
 <p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The unique ID of the service update</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceUpdateName;

/**
 <p>The status of the service update</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable serviceUpdateStatus;

@end

/**
 <p>Represents the output of a <code>DescribeSnapshots</code> operation.</p>
 */
@interface AWSElasticacheDescribeSnapshotsListMessage : AWSModel


/**
 <p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of snapshots. Each item in the list contains detailed information about one snapshot.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheSnapshot *> * _Nullable snapshots;

@end

/**
 <p>Represents the input of a <code>DescribeSnapshotsMessage</code> operation.</p>
 */
@interface AWSElasticacheDescribeSnapshotsMessage : AWSRequest


/**
 <p>A user-supplied cluster identifier. If this parameter is specified, only snapshots associated with that specific cluster are described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheClusterId;

/**
 <p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a marker is included in the response so that the remaining results can be retrieved.</p><p>Default: 50</p><p>Constraints: minimum 20; maximum 50.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>A user-supplied replication group identifier. If this parameter is specified, only snapshots associated with that specific replication group are described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

/**
 <p>A Boolean value which if true, the node group (shard) configuration is included in the snapshot description.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable showNodeGroupConfig;

/**
 <p>A user-supplied name of the snapshot. If this parameter is specified, only this snapshot are described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotName;

/**
 <p>If set to <code>system</code>, the output shows snapshots that were automatically created by ElastiCache. If set to <code>user</code> the output shows snapshots that were manually created. If omitted, the output shows both automatically and manually created snapshots.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotSource;

@end

/**
 
 */
@interface AWSElasticacheDescribeUpdateActionsMessage : AWSRequest


/**
 <p>The cache cluster IDs</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cacheClusterIds;

/**
 <p>The Elasticache engine to which the update applies. Either Redis or Memcached </p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of records to include in the response</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The replication group IDs</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable replicationGroupIds;

/**
 <p>The unique ID of the service update</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceUpdateName;

/**
 <p>The status of the service update</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable serviceUpdateStatus;

/**
 <p>The range of time specified to search for service updates that are in available status</p>
 */
@property (nonatomic, strong) AWSElasticacheTimeRangeFilter * _Nullable serviceUpdateTimeRange;

/**
 <p>Dictates whether to include node level update status in the response </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable showNodeLevelUpdateStatus;

/**
 <p>The status of the update action.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable updateActionStatus;

@end

/**
 
 */
@interface AWSElasticacheDisassociateGlobalReplicationGroupMessage : AWSRequest


/**
 <p>The name of the Global Datastore</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalReplicationGroupId;

/**
 <p>The name of the secondary cluster you wish to remove from the Global Datastore</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

/**
 <p>The AWS region of secondary cluster you wish to remove from the Global Datastore</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupRegion;

@end

/**
 
 */
@interface AWSElasticacheDisassociateGlobalReplicationGroupResult : AWSModel


/**
 <p>Consists of a primary cluster that accepts writes and an associated secondary cluster that resides in a different AWS region. The secondary cluster accepts only reads. The primary cluster automatically replicates updates to the secondary cluster.</p><ul><li><p>The <b>GlobalReplicationGroupIdSuffix</b> represents the name of the Global Datastore, which is what you use to associate a secondary cluster.</p></li></ul>
 */
@property (nonatomic, strong) AWSElasticacheGlobalReplicationGroup * _Nullable globalReplicationGroup;

@end

/**
 <p>Provides ownership and status information for an Amazon EC2 security group.</p>
 */
@interface AWSElasticacheEC2SecurityGroup : AWSModel


/**
 <p>The name of the Amazon EC2 security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupName;

/**
 <p>The AWS account ID of the Amazon EC2 security group owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupOwnerId;

/**
 <p>The status of the Amazon EC2 security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Represents the information required for client programs to connect to a cache node.</p>
 */
@interface AWSElasticacheEndpoint : AWSModel


/**
 <p>The DNS hostname of the cache node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 <p>The port number that the cache engine is listening on.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

@end

/**
 <p>Represents the output of a <code>DescribeEngineDefaultParameters</code> operation.</p>
 */
@interface AWSElasticacheEngineDefaults : AWSModel


/**
 <p>A list of parameters specific to a particular cache node type. Each element in the list contains detailed information about one parameter.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheCacheNodeTypeSpecificParameter *> * _Nullable cacheNodeTypeSpecificParameters;

/**
 <p>Specifies the name of the cache parameter group family to which the engine default parameters apply.</p><p>Valid values are: <code>memcached1.4</code> | <code>memcached1.5</code> | <code>redis2.6</code> | <code>redis2.8</code> | <code>redis3.2</code> | <code>redis4.0</code> | <code>redis5.0</code> | </p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheParameterGroupFamily;

/**
 <p>Provides an identifier to allow retrieval of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Contains a list of engine default parameters.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheParameter *> * _Nullable parameters;

@end

/**
 <p>Represents a single occurrence of something interesting within the system. Some examples of events are creating a cluster, adding or removing a cache node, or rebooting a node.</p>
 */
@interface AWSElasticacheEvent : AWSModel


/**
 <p>The date and time when the event occurred.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable date;

/**
 <p>The text of the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The identifier for the source of the event. For example, if the event occurred at the cluster level, the identifier would be the name of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceIdentifier;

/**
 <p>Specifies the origin of this event - a cluster, a parameter group, a security group, etc.</p>
 */
@property (nonatomic, assign) AWSElasticacheSourceType sourceType;

@end

/**
 <p>Represents the output of a <code>DescribeEvents</code> operation.</p>
 */
@interface AWSElasticacheEventsMessage : AWSModel


/**
 <p>A list of events. Each element in the list contains detailed information about one event.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheEvent *> * _Nullable events;

/**
 <p>Provides an identifier to allow retrieval of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSElasticacheFailoverGlobalReplicationGroupMessage : AWSRequest


/**
 <p>The name of the Global Datastore</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalReplicationGroupId;

/**
 <p>The AWS region of the primary cluster of the Global Datastore</p>
 */
@property (nonatomic, strong) NSString * _Nullable primaryRegion;

/**
 <p>The name of the primary replication group</p>
 */
@property (nonatomic, strong) NSString * _Nullable primaryReplicationGroupId;

@end

/**
 
 */
@interface AWSElasticacheFailoverGlobalReplicationGroupResult : AWSModel


/**
 <p>Consists of a primary cluster that accepts writes and an associated secondary cluster that resides in a different AWS region. The secondary cluster accepts only reads. The primary cluster automatically replicates updates to the secondary cluster.</p><ul><li><p>The <b>GlobalReplicationGroupIdSuffix</b> represents the name of the Global Datastore, which is what you use to associate a secondary cluster.</p></li></ul>
 */
@property (nonatomic, strong) AWSElasticacheGlobalReplicationGroup * _Nullable globalReplicationGroup;

@end

/**
 <p>Indicates the slot configuration and global identifier for a slice group.</p>
 */
@interface AWSElasticacheGlobalNodeGroup : AWSModel


/**
 <p>The name of the global node group</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalNodeGroupId;

/**
 <p>The keyspace for this node group</p>
 */
@property (nonatomic, strong) NSString * _Nullable slots;

@end

/**
 <p>Consists of a primary cluster that accepts writes and an associated secondary cluster that resides in a different AWS region. The secondary cluster accepts only reads. The primary cluster automatically replicates updates to the secondary cluster.</p><ul><li><p>The <b>GlobalReplicationGroupIdSuffix</b> represents the name of the Global Datastore, which is what you use to associate a secondary cluster.</p></li></ul>
 */
@interface AWSElasticacheGlobalReplicationGroup : AWSModel


/**
 <p>The ARN (Amazon Resource Name) of the global replication group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>A flag that enables encryption at rest when set to <code>true</code>.</p><p>You cannot modify the value of <code>AtRestEncryptionEnabled</code> after the replication group is created. To enable encryption at rest on a replication group you must set <code>AtRestEncryptionEnabled</code> to <code>true</code> when you create the replication group. </p><p><b>Required:</b> Only available when creating a replication group in an Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or later.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable atRestEncryptionEnabled;

/**
 <p>A flag that enables using an <code>AuthToken</code> (password) when issuing Redis commands.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable authTokenEnabled;

/**
 <p>The cache node type of the Global Datastore</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeType;

/**
 <p>A flag that indicates whether the Global Datastore is cluster enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable clusterEnabled;

/**
 <p>The Elasticache engine. For Redis only.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The Elasticache Redis engine version. For preview, it is Redis version 5.0.5 only.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>Indicates the slot configuration and global identifier for each slice group.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheGlobalNodeGroup *> * _Nullable globalNodeGroups;

/**
 <p>The optional description of the Global Datastore</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalReplicationGroupDescription;

/**
 <p>The name of the Global Datastore</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalReplicationGroupId;

/**
 <p>The replication groups that comprise the Global Datastore.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheGlobalReplicationGroupMember *> * _Nullable members;

/**
 <p>The status of the Global Datastore</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>A flag that enables in-transit encryption when set to true. You cannot modify the value of <code>TransitEncryptionEnabled</code> after the cluster is created. To enable in-transit encryption on a cluster you must set <code>TransitEncryptionEnabled</code> to true when you create a cluster. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable transitEncryptionEnabled;

@end

/**
 <p>The name of the Global Datastore and role of this replication group in the Global Datastore.</p>
 */
@interface AWSElasticacheGlobalReplicationGroupInfo : AWSModel


/**
 <p>The name of the Global Datastore</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalReplicationGroupId;

/**
 <p>The role of the replication group in a Global Datastore. Can be primary or secondary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalReplicationGroupMemberRole;

@end

/**
 <p>A member of a Global Datastore. It contains the Replication Group Id, the AWS region and the role of the replication group. </p>
 */
@interface AWSElasticacheGlobalReplicationGroupMember : AWSModel


/**
 <p>Indicates whether automatic failover is enabled for the replication group.</p>
 */
@property (nonatomic, assign) AWSElasticacheAutomaticFailoverStatus automaticFailover;

/**
 <p>The replication group id of the Global Datastore member.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

/**
 <p>The AWS region of the Global Datastore member.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupRegion;

/**
 <p>Indicates the role of the replication group, primary or secondary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>The status of the membership of the replication group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 
 */
@interface AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupMessage : AWSRequest


/**
 <p>Indicates that the process begins immediately. At present, the only permitted value for this parameter is true.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyImmediately;

/**
 <p>The name of the Global Datastore</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalReplicationGroupId;

/**
 <p>The number of node groups you wish to add</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable nodeGroupCount;

/**
 <p>Describes the replication group IDs, the AWS regions where they are stored and the shard configuration for each that comprise the Global Datastore</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheRegionalConfiguration *> * _Nullable regionalConfigurations;

@end

/**
 
 */
@interface AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupResult : AWSModel


/**
 <p>Consists of a primary cluster that accepts writes and an associated secondary cluster that resides in a different AWS region. The secondary cluster accepts only reads. The primary cluster automatically replicates updates to the secondary cluster.</p><ul><li><p>The <b>GlobalReplicationGroupIdSuffix</b> represents the name of the Global Datastore, which is what you use to associate a secondary cluster.</p></li></ul>
 */
@property (nonatomic, strong) AWSElasticacheGlobalReplicationGroup * _Nullable globalReplicationGroup;

@end

/**
 
 */
@interface AWSElasticacheIncreaseReplicaCountMessage : AWSRequest


/**
 <p>If <code>True</code>, the number of replica nodes is increased immediately. <code>ApplyImmediately=False</code> is not currently supported.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyImmediately;

/**
 <p>The number of read replica nodes you want at the completion of this operation. For Redis (cluster mode disabled) replication groups, this is the number of replica nodes in the replication group. For Redis (cluster mode enabled) replication groups, this is the number of replica nodes in each of the replication group's node groups.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable latestReplicaCount;

/**
 <p>A list of <code>ConfigureShard</code> objects that can be used to configure each shard in a Redis (cluster mode enabled) replication group. The <code>ConfigureShard</code> has three members: <code>NewReplicaCount</code>, <code>NodeGroupId</code>, and <code>PreferredAvailabilityZones</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheConfigureShard *> * _Nullable replicaConfiguration;

/**
 <p>The id of the replication group to which you want to add replica nodes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

@end

/**
 
 */
@interface AWSElasticacheIncreaseReplicaCountResult : AWSModel


/**
 <p>Contains all of the attributes of a specific Redis replication group.</p>
 */
@property (nonatomic, strong) AWSElasticacheReplicationGroup * _Nullable replicationGroup;

@end

/**
 <p>The input parameters for the <code>ListAllowedNodeTypeModifications</code> operation.</p>
 */
@interface AWSElasticacheListAllowedNodeTypeModificationsMessage : AWSRequest


/**
 <p>The name of the cluster you want to scale up to a larger node instanced type. ElastiCache uses the cluster id to identify the current node type of this cluster and from that to create a list of node types you can scale up to.</p><important><p>You must provide a value for either the <code>CacheClusterId</code> or the <code>ReplicationGroupId</code>.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable cacheClusterId;

/**
 <p>The name of the replication group want to scale up to a larger node type. ElastiCache uses the replication group id to identify the current node type being used by this replication group, and from that to create a list of node types you can scale up to.</p><important><p>You must provide a value for either the <code>CacheClusterId</code> or the <code>ReplicationGroupId</code>.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

@end

/**
 <p>The input parameters for the <code>ListTagsForResource</code> operation.</p>
 Required parameters: [ResourceName]
 */
@interface AWSElasticacheListTagsForResourceMessage : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource for which you want the list of tags, for example <code>arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster</code> or <code>arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot</code>.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

@end

/**
 <p>Represents the input of a <code>ModifyCacheCluster</code> operation.</p>
 Required parameters: [CacheClusterId]
 */
@interface AWSElasticacheModifyCacheClusterMessage : AWSRequest


/**
 <p>Specifies whether the new nodes in this Memcached cluster are all created in a single Availability Zone or created across multiple Availability Zones.</p><p>Valid values: <code>single-az</code> | <code>cross-az</code>.</p><p>This option is only supported for Memcached clusters.</p><note><p>You cannot specify <code>single-az</code> if the Memcached cluster already has cache nodes in different Availability Zones. If <code>cross-az</code> is specified, existing Memcached nodes remain in their current Availability Zone.</p><p>Only newly created nodes are located in different Availability Zones. </p></note>
 */
@property (nonatomic, assign) AWSElasticacheAZMode AZMode;

/**
 <p>If <code>true</code>, this parameter causes the modifications in this request and any pending modifications to be applied, asynchronously and as soon as possible, regardless of the <code>PreferredMaintenanceWindow</code> setting for the cluster.</p><p>If <code>false</code>, changes to the cluster are applied on the next maintenance reboot, or the next failure reboot, whichever occurs first.</p><important><p>If you perform a <code>ModifyCacheCluster</code> before a pending modification is applied, the pending modification is replaced by the newer modification.</p></important><p>Valid values: <code>true</code> | <code>false</code></p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyImmediately;

/**
 <p>Reserved parameter. The password used to access a password protected server. This parameter must be specified with the <code>auth-token-update</code> parameter. Password constraints:</p><ul><li><p>Must be only printable ASCII characters</p></li><li><p>Must be at least 16 characters and no more than 128 characters in length</p></li><li><p>Cannot contain any of the following characters: '/', '"', or '@', '%'</p></li></ul><p> For more information, see AUTH password at <a href="http://redis.io/commands/AUTH">AUTH</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authToken;

/**
 <p>Specifies the strategy to use to update the AUTH token. This parameter must be specified with the <code>auth-token</code> parameter. Possible values:</p><ul><li><p>Rotate</p></li><li><p>Set</p></li></ul><p> For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/auth.html">Authenticating Users with Redis AUTH</a></p>
 */
@property (nonatomic, assign) AWSElasticacheAuthTokenUpdateStrategyType authTokenUpdateStrategy;

/**
 <p>This parameter is currently disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoMinorVersionUpgrade;

/**
 <p>The cluster identifier. This value is stored as a lowercase string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheClusterId;

/**
 <p>A list of cache node IDs to be removed. A node ID is a numeric identifier (0001, 0002, etc.). This parameter is only valid when <code>NumCacheNodes</code> is less than the existing number of cache nodes. The number of cache node IDs supplied in this parameter must match the difference between the existing number of cache nodes in the cluster or pending cache nodes, whichever is greater, and the value of <code>NumCacheNodes</code> in the request.</p><p>For example: If you have 3 active cache nodes, 7 pending cache nodes, and the number of cache nodes in this <code>ModifyCacheCluster</code> call is 5, you must list 2 (7 - 5) cache node IDs to remove.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cacheNodeIdsToRemove;

/**
 <p>A valid cache node type that you want to scale this cluster up to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeType;

/**
 <p>The name of the cache parameter group to apply to this cluster. This change is asynchronously applied as soon as possible for parameters when the <code>ApplyImmediately</code> parameter is specified as <code>true</code> for this request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheParameterGroupName;

/**
 <p>A list of cache security group names to authorize on this cluster. This change is asynchronously applied as soon as possible.</p><p>You can use this parameter only with clusters that are created outside of an Amazon Virtual Private Cloud (Amazon VPC).</p><p>Constraints: Must contain no more than 255 alphanumeric characters. Must not be "Default".</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cacheSecurityGroupNames;

/**
 <p>The upgraded version of the cache engine to be run on the cache nodes.</p><p><b>Important:</b> You can upgrade to a newer engine version (see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SelectEngine.html#VersionManagement">Selecting a Cache Engine and Version</a>), but you cannot downgrade to an earlier engine version. If you want to use an earlier engine version, you must delete the existing cluster and create it anew with the earlier engine version. </p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The list of Availability Zones where the new Memcached cache nodes are created.</p><p>This parameter is only valid when <code>NumCacheNodes</code> in the request is greater than the sum of the number of active cache nodes and the number of cache nodes pending creation (which may be zero). The number of Availability Zones supplied in this list must match the cache nodes being added in this request.</p><p>This option is only supported on Memcached clusters.</p><p>Scenarios:</p><ul><li><p><b>Scenario 1:</b> You have 3 active nodes and wish to add 2 nodes. Specify <code>NumCacheNodes=5</code> (3 + 2) and optionally specify two Availability Zones for the two new nodes.</p></li><li><p><b>Scenario 2:</b> You have 3 active nodes and 2 nodes pending creation (from the scenario 1 call) and want to add 1 more node. Specify <code>NumCacheNodes=6</code> ((3 + 2) + 1) and optionally specify an Availability Zone for the new node.</p></li><li><p><b>Scenario 3:</b> You want to cancel all pending operations. Specify <code>NumCacheNodes=3</code> to cancel all pending operations.</p></li></ul><p>The Availability Zone placement of nodes pending creation cannot be modified. If you wish to cancel any nodes pending creation, add 0 nodes by setting <code>NumCacheNodes</code> to the number of current nodes.</p><p>If <code>cross-az</code> is specified, existing Memcached nodes remain in their current Availability Zone. Only newly created nodes can be located in different Availability Zones. For guidance on how to move existing Memcached nodes to different Availability Zones, see the <b>Availability Zone Considerations</b> section of <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/CacheNodes.SupportedTypes.html">Cache Node Considerations for Memcached</a>.</p><p><b>Impact of new add/remove requests upon pending requests</b></p><ul><li><p>Scenario-1</p><ul><li><p>Pending Action: Delete</p></li><li><p>New Request: Delete</p></li><li><p>Result: The new delete, pending or immediate, replaces the pending delete.</p></li></ul></li><li><p>Scenario-2</p><ul><li><p>Pending Action: Delete</p></li><li><p>New Request: Create</p></li><li><p>Result: The new create, pending or immediate, replaces the pending delete.</p></li></ul></li><li><p>Scenario-3</p><ul><li><p>Pending Action: Create</p></li><li><p>New Request: Delete</p></li><li><p>Result: The new delete, pending or immediate, replaces the pending create.</p></li></ul></li><li><p>Scenario-4</p><ul><li><p>Pending Action: Create</p></li><li><p>New Request: Create</p></li><li><p>Result: The new create is added to the pending create.</p><important><p><b>Important:</b> If the new create request is <b>Apply Immediately - Yes</b>, all creates are performed immediately. If the new create request is <b>Apply Immediately - No</b>, all creates are pending.</p></important></li></ul></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable latestAvailabilityZones;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon SNS topic to which notifications are sent.</p><note><p>The Amazon SNS topic owner must be same as the cluster owner.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable notificationTopicArn;

/**
 <p>The status of the Amazon SNS notification topic. Notifications are sent only if the status is <code>active</code>.</p><p>Valid values: <code>active</code> | <code>inactive</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable notificationTopicStatus;

/**
 <p>The number of cache nodes that the cluster should have. If the value for <code>NumCacheNodes</code> is greater than the sum of the number of current cache nodes and the number of cache nodes pending creation (which may be zero), more nodes are added. If the value is less than the number of existing cache nodes, nodes are removed. If the value is equal to the number of current cache nodes, any pending add or remove requests are canceled.</p><p>If you are removing cache nodes, you must use the <code>CacheNodeIdsToRemove</code> parameter to provide the IDs of the specific cache nodes to remove.</p><p>For clusters running Redis, this value must be 1. For clusters running Memcached, this value must be between 1 and 20.</p><note><p>Adding or removing Memcached cache nodes can be applied immediately or as a pending operation (see <code>ApplyImmediately</code>).</p><p>A pending operation to modify the number of cache nodes in a cluster during its maintenance window, whether by adding or removing nodes in accordance with the scale out architecture, is not queued. The customer's latest request to add or remove nodes to the cluster overrides any previous pending operations to modify the number of cache nodes in the cluster. For example, a request to remove 2 nodes would override a previous pending operation to remove 3 nodes. Similarly, a request to add 2 nodes would override a previous pending operation to remove 3 nodes and vice versa. As Memcached cache nodes may now be provisioned in different Availability Zones with flexible cache node placement, a request to add nodes does not automatically override a previous pending operation to add nodes. The customer can modify the previous pending operation to add more nodes or explicitly cancel the pending request and retry the new request. To cancel pending operations to modify the number of cache nodes in a cluster, use the <code>ModifyCacheCluster</code> request and set <code>NumCacheNodes</code> equal to the number of cache nodes currently in the cluster.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable numCacheNodes;

/**
 <p>Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period.</p><p>Valid values for <code>ddd</code> are:</p><ul><li><p><code>sun</code></p></li><li><p><code>mon</code></p></li><li><p><code>tue</code></p></li><li><p><code>wed</code></p></li><li><p><code>thu</code></p></li><li><p><code>fri</code></p></li><li><p><code>sat</code></p></li></ul><p>Example: <code>sun:23:00-mon:01:30</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>Specifies the VPC Security Groups associated with the cluster.</p><p>This parameter can be used only with clusters that are created in an Amazon Virtual Private Cloud (Amazon VPC).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>The number of days for which ElastiCache retains automatic cluster snapshots before deleting them. For example, if you set <code>SnapshotRetentionLimit</code> to 5, a snapshot that was taken today is retained for 5 days before being deleted.</p><note><p>If the value of <code>SnapshotRetentionLimit</code> is set to zero (0), backups are turned off.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable snapshotRetentionLimit;

/**
 <p>The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of your cluster. </p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotWindow;

@end

/**
 
 */
@interface AWSElasticacheModifyCacheClusterResult : AWSModel


/**
 <p>Contains all of the attributes of a specific cluster.</p>
 */
@property (nonatomic, strong) AWSElasticacheCacheCluster * _Nullable cacheCluster;

@end

/**
 <p>Represents the input of a <code>ModifyCacheParameterGroup</code> operation.</p>
 Required parameters: [CacheParameterGroupName, ParameterNameValues]
 */
@interface AWSElasticacheModifyCacheParameterGroupMessage : AWSRequest


/**
 <p>The name of the cache parameter group to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheParameterGroupName;

/**
 <p>An array of parameter names and values for the parameter update. You must supply at least one parameter name and value; subsequent arguments are optional. A maximum of 20 parameters may be modified per request.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheParameterNameValue *> * _Nullable parameterNameValues;

@end

/**
 <p>Represents the input of a <code>ModifyCacheSubnetGroup</code> operation.</p>
 Required parameters: [CacheSubnetGroupName]
 */
@interface AWSElasticacheModifyCacheSubnetGroupMessage : AWSRequest


/**
 <p>A description of the cache subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheSubnetGroupDescription;

/**
 <p>The name for the cache subnet group. This value is stored as a lowercase string.</p><p>Constraints: Must contain no more than 255 alphanumeric characters or hyphens.</p><p>Example: <code>mysubnetgroup</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheSubnetGroupName;

/**
 <p>The EC2 subnet IDs for the cache subnet group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

@end

/**
 
 */
@interface AWSElasticacheModifyCacheSubnetGroupResult : AWSModel


/**
 <p>Represents the output of one of the following operations:</p><ul><li><p><code>CreateCacheSubnetGroup</code></p></li><li><p><code>ModifyCacheSubnetGroup</code></p></li></ul>
 */
@property (nonatomic, strong) AWSElasticacheCacheSubnetGroup * _Nullable cacheSubnetGroup;

@end

/**
 
 */
@interface AWSElasticacheModifyGlobalReplicationGroupMessage : AWSRequest


/**
 <p>This parameter causes the modifications in this request and any pending modifications to be applied, asynchronously and as soon as possible. Modifications to Global Replication Groups cannot be requested to be applied in PreferredMaintenceWindow. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyImmediately;

/**
 <p>Determines whether a read replica is automatically promoted to read/write primary if the existing primary encounters a failure. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable automaticFailoverEnabled;

/**
 <p>A valid cache node type that you want to scale this Global Datastore to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeType;

/**
 <p>The upgraded version of the cache engine to be run on the clusters in the Global Datastore. </p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>A description of the Global Datastore</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalReplicationGroupDescription;

/**
 <p>The name of the Global Datastore</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalReplicationGroupId;

@end

/**
 
 */
@interface AWSElasticacheModifyGlobalReplicationGroupResult : AWSModel


/**
 <p>Consists of a primary cluster that accepts writes and an associated secondary cluster that resides in a different AWS region. The secondary cluster accepts only reads. The primary cluster automatically replicates updates to the secondary cluster.</p><ul><li><p>The <b>GlobalReplicationGroupIdSuffix</b> represents the name of the Global Datastore, which is what you use to associate a secondary cluster.</p></li></ul>
 */
@property (nonatomic, strong) AWSElasticacheGlobalReplicationGroup * _Nullable globalReplicationGroup;

@end

/**
 <p>Represents the input of a <code>ModifyReplicationGroups</code> operation.</p>
 Required parameters: [ReplicationGroupId]
 */
@interface AWSElasticacheModifyReplicationGroupMessage : AWSRequest


/**
 <p>If <code>true</code>, this parameter causes the modifications in this request and any pending modifications to be applied, asynchronously and as soon as possible, regardless of the <code>PreferredMaintenanceWindow</code> setting for the replication group.</p><p>If <code>false</code>, changes to the nodes in the replication group are applied on the next maintenance reboot, or the next failure reboot, whichever occurs first.</p><p>Valid values: <code>true</code> | <code>false</code></p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyImmediately;

/**
 <p>Reserved parameter. The password used to access a password protected server. This parameter must be specified with the <code>auth-token-update-strategy </code> parameter. Password constraints:</p><ul><li><p>Must be only printable ASCII characters</p></li><li><p>Must be at least 16 characters and no more than 128 characters in length</p></li><li><p>Cannot contain any of the following characters: '/', '"', or '@', '%'</p></li></ul><p> For more information, see AUTH password at <a href="http://redis.io/commands/AUTH">AUTH</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authToken;

/**
 <p>Specifies the strategy to use to update the AUTH token. This parameter must be specified with the <code>auth-token</code> parameter. Possible values:</p><ul><li><p>Rotate</p></li><li><p>Set</p></li></ul><p> For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/auth.html">Authenticating Users with Redis AUTH</a></p>
 */
@property (nonatomic, assign) AWSElasticacheAuthTokenUpdateStrategyType authTokenUpdateStrategy;

/**
 <p>This parameter is currently disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoMinorVersionUpgrade;

/**
 <p>Determines whether a read replica is automatically promoted to read/write primary if the existing primary encounters a failure.</p><p>Valid values: <code>true</code> | <code>false</code></p><p>Amazon ElastiCache for Redis does not support Multi-AZ with automatic failover on:</p><ul><li><p>Redis versions earlier than 2.8.6.</p></li><li><p>Redis (cluster mode disabled): T1 node types.</p></li><li><p>Redis (cluster mode enabled): T1 node types.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable automaticFailoverEnabled;

/**
 <p>A valid cache node type that you want to scale this replication group to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeType;

/**
 <p>The name of the cache parameter group to apply to all of the clusters in this replication group. This change is asynchronously applied as soon as possible for parameters when the <code>ApplyImmediately</code> parameter is specified as <code>true</code> for this request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheParameterGroupName;

/**
 <p>A list of cache security group names to authorize for the clusters in this replication group. This change is asynchronously applied as soon as possible.</p><p>This parameter can be used only with replication group containing clusters running outside of an Amazon Virtual Private Cloud (Amazon VPC).</p><p>Constraints: Must contain no more than 255 alphanumeric characters. Must not be <code>Default</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cacheSecurityGroupNames;

/**
 <p>The upgraded version of the cache engine to be run on the clusters in the replication group.</p><p><b>Important:</b> You can upgrade to a newer engine version (see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SelectEngine.html#VersionManagement">Selecting a Cache Engine and Version</a>), but you cannot downgrade to an earlier engine version. If you want to use an earlier engine version, you must delete the existing replication group and create it anew with the earlier engine version. </p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>Deprecated. This parameter is not used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeGroupId;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon SNS topic to which notifications are sent.</p><note><p>The Amazon SNS topic owner must be same as the replication group owner. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable notificationTopicArn;

/**
 <p>The status of the Amazon SNS notification topic for the replication group. Notifications are sent only if the status is <code>active</code>.</p><p>Valid values: <code>active</code> | <code>inactive</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable notificationTopicStatus;

/**
 <p>Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period.</p><p>Valid values for <code>ddd</code> are:</p><ul><li><p><code>sun</code></p></li><li><p><code>mon</code></p></li><li><p><code>tue</code></p></li><li><p><code>wed</code></p></li><li><p><code>thu</code></p></li><li><p><code>fri</code></p></li><li><p><code>sat</code></p></li></ul><p>Example: <code>sun:23:00-mon:01:30</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>For replication groups with a single primary, if this parameter is specified, ElastiCache promotes the specified cluster in the specified replication group to the primary role. The nodes of all other clusters in the replication group are read replicas.</p>
 */
@property (nonatomic, strong) NSString * _Nullable primaryClusterId;

/**
 <p>A description for the replication group. Maximum length is 255 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupDescription;

/**
 <p>The identifier of the replication group to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

/**
 <p>Specifies the VPC Security Groups associated with the clusters in the replication group.</p><p>This parameter can be used only with replication group containing clusters running in an Amazon Virtual Private Cloud (Amazon VPC).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>The number of days for which ElastiCache retains automatic node group (shard) snapshots before deleting them. For example, if you set <code>SnapshotRetentionLimit</code> to 5, a snapshot that was taken today is retained for 5 days before being deleted.</p><p><b>Important</b> If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable snapshotRetentionLimit;

/**
 <p>The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of the node group (shard) specified by <code>SnapshottingClusterId</code>.</p><p>Example: <code>05:00-09:00</code></p><p>If you do not specify this parameter, ElastiCache automatically chooses an appropriate time range.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotWindow;

/**
 <p>The cluster ID that is used as the daily snapshot source for the replication group. This parameter cannot be set for Redis (cluster mode enabled) replication groups.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshottingClusterId;

@end

/**
 
 */
@interface AWSElasticacheModifyReplicationGroupResult : AWSModel


/**
 <p>Contains all of the attributes of a specific Redis replication group.</p>
 */
@property (nonatomic, strong) AWSElasticacheReplicationGroup * _Nullable replicationGroup;

@end

/**
 <p>Represents the input for a <code>ModifyReplicationGroupShardConfiguration</code> operation.</p>
 Required parameters: [ReplicationGroupId, NodeGroupCount, ApplyImmediately]
 */
@interface AWSElasticacheModifyReplicationGroupShardConfigurationMessage : AWSRequest


/**
 <p>Indicates that the shard reconfiguration process begins immediately. At present, the only permitted value for this parameter is <code>true</code>.</p><p>Value: true</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyImmediately;

/**
 <p>The number of node groups (shards) that results from the modification of the shard configuration.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable nodeGroupCount;

/**
 <p>If the value of <code>NodeGroupCount</code> is less than the current number of node groups (shards), then either <code>NodeGroupsToRemove</code> or <code>NodeGroupsToRetain</code> is required. <code>NodeGroupsToRemove</code> is a list of <code>NodeGroupId</code>s to remove from the cluster.</p><p>ElastiCache for Redis will attempt to remove all node groups listed by <code>NodeGroupsToRemove</code> from the cluster.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable nodeGroupsToRemove;

/**
 <p>If the value of <code>NodeGroupCount</code> is less than the current number of node groups (shards), then either <code>NodeGroupsToRemove</code> or <code>NodeGroupsToRetain</code> is required. <code>NodeGroupsToRetain</code> is a list of <code>NodeGroupId</code>s to retain in the cluster.</p><p>ElastiCache for Redis will attempt to remove all node groups except those listed by <code>NodeGroupsToRetain</code> from the cluster.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable nodeGroupsToRetain;

/**
 <p>The name of the Redis (cluster mode enabled) cluster (replication group) on which the shards are to be configured.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

/**
 <p>Specifies the preferred availability zones for each node group in the cluster. If the value of <code>NodeGroupCount</code> is greater than the current number of node groups (shards), you can use this parameter to specify the preferred availability zones of the cluster's shards. If you omit this parameter ElastiCache selects availability zones for you.</p><p>You can specify this parameter only if the value of <code>NodeGroupCount</code> is greater than the current number of node groups (shards).</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheReshardingConfiguration *> * _Nullable reshardingConfiguration;

@end

/**
 
 */
@interface AWSElasticacheModifyReplicationGroupShardConfigurationResult : AWSModel


/**
 <p>Contains all of the attributes of a specific Redis replication group.</p>
 */
@property (nonatomic, strong) AWSElasticacheReplicationGroup * _Nullable replicationGroup;

@end

/**
 <p>Represents a collection of cache nodes in a replication group. One node in the node group is the read/write primary node. All the other nodes are read-only Replica nodes.</p>
 */
@interface AWSElasticacheNodeGroup : AWSModel


/**
 <p>The identifier for the node group (shard). A Redis (cluster mode disabled) replication group contains only 1 node group; therefore, the node group ID is 0001. A Redis (cluster mode enabled) replication group contains 1 to 90 node groups numbered 0001 to 0090. Optionally, the user can provide the id for a node group. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeGroupId;

/**
 <p>A list containing information about individual nodes within the node group (shard).</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheNodeGroupMember *> * _Nullable nodeGroupMembers;

/**
 <p>The endpoint of the primary node in this node group (shard).</p>
 */
@property (nonatomic, strong) AWSElasticacheEndpoint * _Nullable primaryEndpoint;

/**
 <p>The endpoint of the replica nodes in this node group (shard).</p>
 */
@property (nonatomic, strong) AWSElasticacheEndpoint * _Nullable readerEndpoint;

/**
 <p>The keyspace for this node group (shard).</p>
 */
@property (nonatomic, strong) NSString * _Nullable slots;

/**
 <p>The current state of this replication group - <code>creating</code>, <code>available</code>, etc.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Node group (shard) configuration options. Each node group (shard) configuration has the following: <code>Slots</code>, <code>PrimaryAvailabilityZone</code>, <code>ReplicaAvailabilityZones</code>, <code>ReplicaCount</code>.</p>
 */
@interface AWSElasticacheNodeGroupConfiguration : AWSModel


/**
 <p>Either the ElastiCache for Redis supplied 4-digit id or a user supplied id for the node group these configuration values apply to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeGroupId;

/**
 <p>The Availability Zone where the primary node of this node group (shard) is launched.</p>
 */
@property (nonatomic, strong) NSString * _Nullable primaryAvailabilityZone;

/**
 <p>A list of Availability Zones to be used for the read replicas. The number of Availability Zones in this list must match the value of <code>ReplicaCount</code> or <code>ReplicasPerNodeGroup</code> if not specified.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable replicaAvailabilityZones;

/**
 <p>The number of read replica nodes in this node group (shard).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicaCount;

/**
 <p>A string that specifies the keyspace for a particular node group. Keyspaces range from 0 to 16,383. The string is in the format <code>startkey-endkey</code>.</p><p>Example: <code>"0-3999"</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable slots;

@end

/**
 <p>Represents a single node within a node group (shard).</p>
 */
@interface AWSElasticacheNodeGroupMember : AWSModel


/**
 <p>The ID of the cluster to which the node belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheClusterId;

/**
 <p>The ID of the node within its cluster. A node ID is a numeric identifier (0001, 0002, etc.).</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeId;

/**
 <p>The role that is currently assigned to the node - <code>primary</code> or <code>replica</code>. This member is only applicable for Redis (cluster mode disabled) replication groups.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentRole;

/**
 <p>The name of the Availability Zone in which the node is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredAvailabilityZone;

/**
 <p>The information required for client programs to connect to a node for read operations. The read endpoint is only applicable on Redis (cluster mode disabled) clusters.</p>
 */
@property (nonatomic, strong) AWSElasticacheEndpoint * _Nullable readEndpoint;

@end

/**
 <p>The status of the service update on the node group member </p>
 */
@interface AWSElasticacheNodeGroupMemberUpdateStatus : AWSModel


/**
 <p>The cache cluster ID</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheClusterId;

/**
 <p>The node ID of the cache cluster</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeId;

/**
 <p>The deletion date of the node</p>
 */
@property (nonatomic, strong) NSDate * _Nullable nodeDeletionDate;

/**
 <p>The end date of the update for a node</p>
 */
@property (nonatomic, strong) NSDate * _Nullable nodeUpdateEndDate;

/**
 <p>Reflects whether the update was initiated by the customer or automatically applied</p>
 */
@property (nonatomic, assign) AWSElasticacheNodeUpdateInitiatedBy nodeUpdateInitiatedBy;

/**
 <p>The date when the update is triggered</p>
 */
@property (nonatomic, strong) NSDate * _Nullable nodeUpdateInitiatedDate;

/**
 <p>The start date of the update for a node</p>
 */
@property (nonatomic, strong) NSDate * _Nullable nodeUpdateStartDate;

/**
 <p>The update status of the node</p>
 */
@property (nonatomic, assign) AWSElasticacheNodeUpdateStatus nodeUpdateStatus;

/**
 <p>The date when the NodeUpdateStatus was last modified</p>
 */
@property (nonatomic, strong) NSDate * _Nullable nodeUpdateStatusModifiedDate;

@end

/**
 <p>The status of the service update on the node group </p>
 */
@interface AWSElasticacheNodeGroupUpdateStatus : AWSModel


/**
 <p>The ID of the node group</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeGroupId;

/**
 <p>The status of the service update on the node group member</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheNodeGroupMemberUpdateStatus *> * _Nullable nodeGroupMemberUpdateStatus;

@end

/**
 <p>Represents an individual cache node in a snapshot of a cluster.</p>
 */
@interface AWSElasticacheNodeSnapshot : AWSModel


/**
 <p>A unique identifier for the source cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheClusterId;

/**
 <p>The date and time when the cache node was created in the source cluster.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable cacheNodeCreateTime;

/**
 <p>The cache node identifier for the node in the source cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeId;

/**
 <p>The size of the cache on the source cache node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheSize;

/**
 <p>The configuration for the source node group (shard).</p>
 */
@property (nonatomic, strong) AWSElasticacheNodeGroupConfiguration * _Nullable nodeGroupConfiguration;

/**
 <p>A unique identifier for the source node group (shard).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeGroupId;

/**
 <p>The date and time when the source node's metadata and cache data set was obtained for the snapshot.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable snapshotCreateTime;

@end

/**
 <p>Describes a notification topic and its status. Notification topics are used for publishing ElastiCache events to subscribers using Amazon Simple Notification Service (SNS).</p>
 */
@interface AWSElasticacheNotificationConfiguration : AWSModel


/**
 <p>The Amazon Resource Name (ARN) that identifies the topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicArn;

/**
 <p>The current state of the topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicStatus;

@end

/**
 <p>Describes an individual setting that controls some aspect of ElastiCache behavior.</p>
 */
@interface AWSElasticacheParameter : AWSModel


/**
 <p>The valid range of values for the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable allowedValues;

/**
 <p>Indicates whether a change to the parameter is applied immediately or requires a reboot for the change to be applied. You can force a reboot or wait until the next maintenance window's reboot. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.Rebooting.html">Rebooting a Cluster</a>.</p>
 */
@property (nonatomic, assign) AWSElasticacheChangeType changeType;

/**
 <p>The valid data type for the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataType;

/**
 <p>A description of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Indicates whether (<code>true</code>) or not (<code>false</code>) the parameter can be modified. Some parameters have security or operational implications that prevent them from being changed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isModifiable;

/**
 <p>The earliest cache engine version to which the parameter can apply.</p>
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
 <p>The source of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable source;

@end

/**
 <p>Describes a name-value pair that is used to update the value of a parameter.</p>
 */
@interface AWSElasticacheParameterNameValue : AWSModel


/**
 <p>The name of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterName;

/**
 <p>The value of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterValue;

@end

/**
 <p>A group of settings that are applied to the cluster in the future, or that are currently being applied.</p>
 */
@interface AWSElasticachePendingModifiedValues : AWSModel


/**
 <p>The auth token status</p>
 */
@property (nonatomic, assign) AWSElasticacheAuthTokenUpdateStatus authTokenStatus;

/**
 <p>A list of cache node IDs that are being removed (or will be removed) from the cluster. A node ID is a 4-digit numeric identifier (0001, 0002, etc.).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cacheNodeIdsToRemove;

/**
 <p>The cache node type that this cluster or replication group is scaled to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeType;

/**
 <p>The new cache engine version that the cluster runs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The new number of cache nodes for the cluster.</p><p>For clusters running Redis, this value must be 1. For clusters running Memcached, this value must be between 1 and 20.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numCacheNodes;

@end

/**
 <p>Update action that has been processed for the corresponding apply/stop request</p>
 */
@interface AWSElasticacheProcessedUpdateAction : AWSModel


/**
 <p>The ID of the cache cluster</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheClusterId;

/**
 <p>The ID of the replication group</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

/**
 <p>The unique ID of the service update</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceUpdateName;

/**
 <p>The status of the update action on the Redis cluster</p>
 */
@property (nonatomic, assign) AWSElasticacheUpdateActionStatus updateActionStatus;

@end

/**
 <p>Represents the input of a <code>PurchaseReservedCacheNodesOffering</code> operation.</p>
 Required parameters: [ReservedCacheNodesOfferingId]
 */
@interface AWSElasticachePurchaseReservedCacheNodesOfferingMessage : AWSRequest


/**
 <p>The number of cache node instances to reserve.</p><p>Default: <code>1</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cacheNodeCount;

/**
 <p>A customer-specified identifier to track this reservation.</p><note><p>The Reserved Cache Node ID is an unique customer-specified identifier to track this reservation. If this parameter is not specified, ElastiCache automatically generates an identifier for the reservation.</p></note><p>Example: myreservationID</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedCacheNodeId;

/**
 <p>The ID of the reserved cache node offering to purchase.</p><p>Example: <code>438012d3-4052-4cc7-b2e3-8d3372e0e706</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedCacheNodesOfferingId;

@end

/**
 
 */
@interface AWSElasticachePurchaseReservedCacheNodesOfferingResult : AWSModel


/**
 <p>Represents the output of a <code>PurchaseReservedCacheNodesOffering</code> operation.</p>
 */
@property (nonatomic, strong) AWSElasticacheReservedCacheNode * _Nullable reservedCacheNode;

@end

/**
 
 */
@interface AWSElasticacheRebalanceSlotsInGlobalReplicationGroupMessage : AWSRequest


/**
 <p>If <code>True</code>, redistribution is applied immediately.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyImmediately;

/**
 <p>The name of the Global Datastore</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalReplicationGroupId;

@end

/**
 
 */
@interface AWSElasticacheRebalanceSlotsInGlobalReplicationGroupResult : AWSModel


/**
 <p>Consists of a primary cluster that accepts writes and an associated secondary cluster that resides in a different AWS region. The secondary cluster accepts only reads. The primary cluster automatically replicates updates to the secondary cluster.</p><ul><li><p>The <b>GlobalReplicationGroupIdSuffix</b> represents the name of the Global Datastore, which is what you use to associate a secondary cluster.</p></li></ul>
 */
@property (nonatomic, strong) AWSElasticacheGlobalReplicationGroup * _Nullable globalReplicationGroup;

@end

/**
 <p>Represents the input of a <code>RebootCacheCluster</code> operation.</p>
 Required parameters: [CacheClusterId, CacheNodeIdsToReboot]
 */
@interface AWSElasticacheRebootCacheClusterMessage : AWSRequest


/**
 <p>The cluster identifier. This parameter is stored as a lowercase string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheClusterId;

/**
 <p>A list of cache node IDs to reboot. A node ID is a numeric identifier (0001, 0002, etc.). To reboot an entire cluster, specify all of the cache node IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cacheNodeIdsToReboot;

@end

/**
 
 */
@interface AWSElasticacheRebootCacheClusterResult : AWSModel


/**
 <p>Contains all of the attributes of a specific cluster.</p>
 */
@property (nonatomic, strong) AWSElasticacheCacheCluster * _Nullable cacheCluster;

@end

/**
 <p>Contains the specific price and frequency of a recurring charges for a reserved cache node, or for a reserved cache node offering.</p>
 */
@interface AWSElasticacheRecurringCharge : AWSModel


/**
 <p>The monetary amount of the recurring charge.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recurringChargeAmount;

/**
 <p>The frequency of the recurring charge.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recurringChargeFrequency;

@end

/**
 <p>A list of the replication groups </p>
 Required parameters: [ReplicationGroupId, ReplicationGroupRegion, ReshardingConfiguration]
 */
@interface AWSElasticacheRegionalConfiguration : AWSModel


/**
 <p>The name of the secondary cluster</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

/**
 <p>The AWS region where the cluster is stored</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupRegion;

/**
 <p>A list of <code>PreferredAvailabilityZones</code> objects that specifies the configuration of a node group in the resharded cluster. </p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheReshardingConfiguration *> * _Nullable reshardingConfiguration;

@end

/**
 <p>Represents the input of a <code>RemoveTagsFromResource</code> operation.</p>
 Required parameters: [ResourceName, TagKeys]
 */
@interface AWSElasticacheRemoveTagsFromResourceMessage : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource from which you want the tags removed, for example <code>arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster</code> or <code>arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot</code>.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

/**
 <p>A list of <code>TagKeys</code> identifying the tags you want removed from the named resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 <p>Contains all of the attributes of a specific Redis replication group.</p>
 */
@interface AWSElasticacheReplicationGroup : AWSModel


/**
 <p>The ARN (Amazon Resource Name) of the replication group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>A flag that enables encryption at-rest when set to <code>true</code>.</p><p>You cannot modify the value of <code>AtRestEncryptionEnabled</code> after the cluster is created. To enable encryption at-rest on a cluster you must set <code>AtRestEncryptionEnabled</code> to <code>true</code> when you create a cluster.</p><p><b>Required:</b> Only available when creating a replication group in an Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or later.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable atRestEncryptionEnabled;

/**
 <p>A flag that enables using an <code>AuthToken</code> (password) when issuing Redis commands.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable authTokenEnabled;

/**
 <p>The date the auth token was last modified</p>
 */
@property (nonatomic, strong) NSDate * _Nullable authTokenLastModifiedDate;

/**
 <p>Indicates the status of Multi-AZ with automatic failover for this Redis replication group.</p><p>Amazon ElastiCache for Redis does not support Multi-AZ with automatic failover on:</p><ul><li><p>Redis versions earlier than 2.8.6.</p></li><li><p>Redis (cluster mode disabled): T1 node types.</p></li><li><p>Redis (cluster mode enabled): T1 node types.</p></li></ul>
 */
@property (nonatomic, assign) AWSElasticacheAutomaticFailoverStatus automaticFailover;

/**
 <p>The name of the compute and memory capacity node type for each node in the replication group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeType;

/**
 <p>A flag indicating whether or not this replication group is cluster enabled; i.e., whether its data can be partitioned across multiple shards (API/CLI: node groups).</p><p>Valid values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable clusterEnabled;

/**
 <p>The configuration endpoint for this replication group. Use the configuration endpoint to connect to this replication group.</p>
 */
@property (nonatomic, strong) AWSElasticacheEndpoint * _Nullable configurationEndpoint;

/**
 <p>The user supplied description of the replication group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the Global Datastore and role of this replication group in the Global Datastore.</p>
 */
@property (nonatomic, strong) AWSElasticacheGlobalReplicationGroupInfo * _Nullable globalReplicationGroupInfo;

/**
 <p>The ID of the KMS key used to encrypt the disk in the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The names of all the cache clusters that are part of this replication group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable memberClusters;

/**
 <p>A list of node groups in this replication group. For Redis (cluster mode disabled) replication groups, this is a single-element list. For Redis (cluster mode enabled) replication groups, the list contains an entry for each node group (shard).</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheNodeGroup *> * _Nullable nodeGroups;

/**
 <p>A group of settings to be applied to the replication group, either immediately or during the next maintenance window.</p>
 */
@property (nonatomic, strong) AWSElasticacheReplicationGroupPendingModifiedValues * _Nullable pendingModifiedValues;

/**
 <p>The identifier for the replication group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

/**
 <p>The number of days for which ElastiCache retains automatic cluster snapshots before deleting them. For example, if you set <code>SnapshotRetentionLimit</code> to 5, a snapshot that was taken today is retained for 5 days before being deleted.</p><important><p> If the value of <code>SnapshotRetentionLimit</code> is set to zero (0), backups are turned off.</p></important>
 */
@property (nonatomic, strong) NSNumber * _Nullable snapshotRetentionLimit;

/**
 <p>The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of your node group (shard).</p><p>Example: <code>05:00-09:00</code></p><p>If you do not specify this parameter, ElastiCache automatically chooses an appropriate time range.</p><note><p>This parameter is only valid if the <code>Engine</code> parameter is <code>redis</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotWindow;

/**
 <p>The cluster ID that is used as the daily snapshot source for the replication group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshottingClusterId;

/**
 <p>The current state of this replication group - <code>creating</code>, <code>available</code>, <code>modifying</code>, <code>deleting</code>, <code>create-failed</code>, <code>snapshotting</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>A flag that enables in-transit encryption when set to <code>true</code>.</p><p>You cannot modify the value of <code>TransitEncryptionEnabled</code> after the cluster is created. To enable in-transit encryption on a cluster you must set <code>TransitEncryptionEnabled</code> to <code>true</code> when you create a cluster.</p><p><b>Required:</b> Only available when creating a replication group in an Amazon VPC using redis version <code>3.2.6</code>, <code>4.x</code> or later.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable transitEncryptionEnabled;

@end

/**
 <p>Represents the output of a <code>DescribeReplicationGroups</code> operation.</p>
 */
@interface AWSElasticacheReplicationGroupMessage : AWSModel


/**
 <p>Provides an identifier to allow retrieval of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of replication groups. Each item in the list contains detailed information about one replication group.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheReplicationGroup *> * _Nullable replicationGroups;

@end

/**
 <p>The settings to be applied to the Redis replication group, either immediately or during the next maintenance window.</p>
 */
@interface AWSElasticacheReplicationGroupPendingModifiedValues : AWSModel


/**
 <p>The auth token status</p>
 */
@property (nonatomic, assign) AWSElasticacheAuthTokenUpdateStatus authTokenStatus;

/**
 <p>Indicates the status of Multi-AZ with automatic failover for this Redis replication group.</p><p>Amazon ElastiCache for Redis does not support Multi-AZ with automatic failover on:</p><ul><li><p>Redis versions earlier than 2.8.6.</p></li><li><p>Redis (cluster mode disabled): T1 node types.</p></li><li><p>Redis (cluster mode enabled): T1 node types.</p></li></ul>
 */
@property (nonatomic, assign) AWSElasticachePendingAutomaticFailoverStatus automaticFailoverStatus;

/**
 <p>The primary cluster ID that is applied immediately (if <code>--apply-immediately</code> was specified), or during the next maintenance window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable primaryClusterId;

/**
 <p>The status of an online resharding operation.</p>
 */
@property (nonatomic, strong) AWSElasticacheReshardingStatus * _Nullable resharding;

@end

/**
 <p>Represents the output of a <code>PurchaseReservedCacheNodesOffering</code> operation.</p>
 */
@interface AWSElasticacheReservedCacheNode : AWSModel


/**
 <p>The number of cache nodes that have been reserved.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cacheNodeCount;

/**
 <p>The cache node type for the reserved cache nodes.</p><p>The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.</p><ul><li><p>General purpose:</p><ul><li><p>Current generation: </p><p><b>M5 node types:</b><code>cache.m5.large</code>, <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>, <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>, <code>cache.m5.24xlarge</code></p><p><b>M4 node types:</b><code>cache.m4.large</code>, <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>, <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code></p><p><b>T3 node types:</b><code>cache.t3.micro</code>, <code>cache.t3.small</code>, <code>cache.t3.medium</code></p><p><b>T2 node types:</b><code>cache.t2.micro</code>, <code>cache.t2.small</code>, <code>cache.t2.medium</code></p></li><li><p>Previous generation: (not recommended)</p><p><b>T1 node types:</b><code>cache.t1.micro</code></p><p><b>M1 node types:</b><code>cache.m1.small</code>, <code>cache.m1.medium</code>, <code>cache.m1.large</code>, <code>cache.m1.xlarge</code></p><p><b>M3 node types:</b><code>cache.m3.medium</code>, <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>, <code>cache.m3.2xlarge</code></p></li></ul></li><li><p>Compute optimized:</p><ul><li><p>Previous generation: (not recommended)</p><p><b>C1 node types:</b><code>cache.c1.xlarge</code></p></li></ul></li><li><p>Memory optimized:</p><ul><li><p>Current generation: </p><p><b>R5 node types:</b><code>cache.r5.large</code>, <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>, <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>, <code>cache.r5.24xlarge</code></p><p><b>R4 node types:</b><code>cache.r4.large</code>, <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>, <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>, <code>cache.r4.16xlarge</code></p></li><li><p>Previous generation: (not recommended)</p><p><b>M2 node types:</b><code>cache.m2.xlarge</code>, <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code></p><p><b>R3 node types:</b><code>cache.r3.large</code>, <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>, <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code></p></li></ul></li></ul><p><b>Additional node type info</b></p><ul><li><p>All current generation instance types are created in Amazon VPC by default.</p></li><li><p>Redis append-only files (AOF) are not supported for T1 or T2 instances.</p></li><li><p>Redis Multi-AZ with automatic failover is not supported on T1 instances.</p></li><li><p>Redis configuration variables <code>appendonly</code> and <code>appendfsync</code> are not supported on Redis version 2.8.22 and later.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeType;

/**
 <p>The duration of the reservation in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p>The fixed price charged for this reserved cache node.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fixedPrice;

/**
 <p>The offering type of this reserved cache node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable offeringType;

/**
 <p>The description of the reserved cache node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productDescription;

/**
 <p>The recurring price charged to run this reserved cache node.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheRecurringCharge *> * _Nullable recurringCharges;

/**
 <p>The Amazon Resource Name (ARN) of the reserved cache node.</p><p>Example: <code>arn:aws:elasticache:us-east-1:123456789012:reserved-instance:ri-2017-03-27-08-33-25-582</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable reservationARN;

/**
 <p>The unique identifier for the reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedCacheNodeId;

/**
 <p>The offering identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedCacheNodesOfferingId;

/**
 <p>The time the reservation started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The state of the reserved cache node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable state;

/**
 <p>The hourly price charged for this reserved cache node.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable usagePrice;

@end

/**
 <p>Represents the output of a <code>DescribeReservedCacheNodes</code> operation.</p>
 */
@interface AWSElasticacheReservedCacheNodeMessage : AWSModel


/**
 <p>Provides an identifier to allow retrieval of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of reserved cache nodes. Each element in the list contains detailed information about one node.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheReservedCacheNode *> * _Nullable reservedCacheNodes;

@end

/**
 <p>Describes all of the attributes of a reserved cache node offering.</p>
 */
@interface AWSElasticacheReservedCacheNodesOffering : AWSModel


/**
 <p>The cache node type for the reserved cache node.</p><p>The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.</p><ul><li><p>General purpose:</p><ul><li><p>Current generation: </p><p><b>M5 node types:</b><code>cache.m5.large</code>, <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>, <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>, <code>cache.m5.24xlarge</code></p><p><b>M4 node types:</b><code>cache.m4.large</code>, <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>, <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code></p><p><b>T3 node types:</b><code>cache.t3.micro</code>, <code>cache.t3.small</code>, <code>cache.t3.medium</code></p><p><b>T2 node types:</b><code>cache.t2.micro</code>, <code>cache.t2.small</code>, <code>cache.t2.medium</code></p></li><li><p>Previous generation: (not recommended)</p><p><b>T1 node types:</b><code>cache.t1.micro</code></p><p><b>M1 node types:</b><code>cache.m1.small</code>, <code>cache.m1.medium</code>, <code>cache.m1.large</code>, <code>cache.m1.xlarge</code></p><p><b>M3 node types:</b><code>cache.m3.medium</code>, <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>, <code>cache.m3.2xlarge</code></p></li></ul></li><li><p>Compute optimized:</p><ul><li><p>Previous generation: (not recommended)</p><p><b>C1 node types:</b><code>cache.c1.xlarge</code></p></li></ul></li><li><p>Memory optimized:</p><ul><li><p>Current generation: </p><p><b>R5 node types:</b><code>cache.r5.large</code>, <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>, <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>, <code>cache.r5.24xlarge</code></p><p><b>R4 node types:</b><code>cache.r4.large</code>, <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>, <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>, <code>cache.r4.16xlarge</code></p></li><li><p>Previous generation: (not recommended)</p><p><b>M2 node types:</b><code>cache.m2.xlarge</code>, <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code></p><p><b>R3 node types:</b><code>cache.r3.large</code>, <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>, <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code></p></li></ul></li></ul><p><b>Additional node type info</b></p><ul><li><p>All current generation instance types are created in Amazon VPC by default.</p></li><li><p>Redis append-only files (AOF) are not supported for T1 or T2 instances.</p></li><li><p>Redis Multi-AZ with automatic failover is not supported on T1 instances.</p></li><li><p>Redis configuration variables <code>appendonly</code> and <code>appendfsync</code> are not supported on Redis version 2.8.22 and later.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeType;

/**
 <p>The duration of the offering. in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p>The fixed price charged for this offering.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fixedPrice;

/**
 <p>The offering type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable offeringType;

/**
 <p>The cache engine used by the offering.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productDescription;

/**
 <p>The recurring price charged to run this reserved cache node.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheRecurringCharge *> * _Nullable recurringCharges;

/**
 <p>A unique identifier for the reserved cache node offering.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedCacheNodesOfferingId;

/**
 <p>The hourly price charged for this offering.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable usagePrice;

@end

/**
 <p>Represents the output of a <code>DescribeReservedCacheNodesOfferings</code> operation.</p>
 */
@interface AWSElasticacheReservedCacheNodesOfferingMessage : AWSModel


/**
 <p>Provides an identifier to allow retrieval of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of reserved cache node offerings. Each element in the list contains detailed information about one offering.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheReservedCacheNodesOffering *> * _Nullable reservedCacheNodesOfferings;

@end

/**
 <p>Represents the input of a <code>ResetCacheParameterGroup</code> operation.</p>
 Required parameters: [CacheParameterGroupName]
 */
@interface AWSElasticacheResetCacheParameterGroupMessage : AWSRequest


/**
 <p>The name of the cache parameter group to reset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheParameterGroupName;

/**
 <p>An array of parameter names to reset to their default values. If <code>ResetAllParameters</code> is <code>true</code>, do not use <code>ParameterNameValues</code>. If <code>ResetAllParameters</code> is <code>false</code>, you must specify the name of at least one parameter to reset.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheParameterNameValue *> * _Nullable parameterNameValues;

/**
 <p>If <code>true</code>, all parameters in the cache parameter group are reset to their default values. If <code>false</code>, only the parameters listed by <code>ParameterNameValues</code> are reset to their default values.</p><p>Valid values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable resetAllParameters;

@end

/**
 <p>A list of <code>PreferredAvailabilityZones</code> objects that specifies the configuration of a node group in the resharded cluster.</p>
 */
@interface AWSElasticacheReshardingConfiguration : AWSModel


/**
 <p>Either the ElastiCache for Redis supplied 4-digit id or a user supplied id for the node group these configuration values apply to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeGroupId;

/**
 <p>A list of preferred availability zones for the nodes in this cluster.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable preferredAvailabilityZones;

@end

/**
 <p>The status of an online resharding operation.</p>
 */
@interface AWSElasticacheReshardingStatus : AWSModel


/**
 <p>Represents the progress of an online resharding operation.</p>
 */
@property (nonatomic, strong) AWSElasticacheSlotMigration * _Nullable slotMigration;

@end

/**
 <p>Represents the input of a <code>RevokeCacheSecurityGroupIngress</code> operation.</p>
 Required parameters: [CacheSecurityGroupName, EC2SecurityGroupName, EC2SecurityGroupOwnerId]
 */
@interface AWSElasticacheRevokeCacheSecurityGroupIngressMessage : AWSRequest


/**
 <p>The name of the cache security group to revoke ingress from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheSecurityGroupName;

/**
 <p>The name of the Amazon EC2 security group to revoke access from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupName;

/**
 <p>The AWS account number of the Amazon EC2 security group owner. Note that this is not the same thing as an AWS access key ID - you must provide a valid AWS account number for this parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable EC2SecurityGroupOwnerId;

@end

/**
 
 */
@interface AWSElasticacheRevokeCacheSecurityGroupIngressResult : AWSModel


/**
 <p>Represents the output of one of the following operations:</p><ul><li><p><code>AuthorizeCacheSecurityGroupIngress</code></p></li><li><p><code>CreateCacheSecurityGroup</code></p></li><li><p><code>RevokeCacheSecurityGroupIngress</code></p></li></ul>
 */
@property (nonatomic, strong) AWSElasticacheCacheSecurityGroup * _Nullable cacheSecurityGroup;

@end

/**
 <p>Represents a single cache security group and its status.</p>
 */
@interface AWSElasticacheSecurityGroupMembership : AWSModel


/**
 <p>The identifier of the cache security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityGroupId;

/**
 <p>The status of the cache security group membership. The status changes whenever a cache security group is modified, or when the cache security groups assigned to a cluster are modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>An update that you can apply to your Redis clusters.</p>
 */
@interface AWSElasticacheServiceUpdate : AWSModel


/**
 <p>Indicates whether the service update will be automatically applied once the recommended apply-by date has expired. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoUpdateAfterRecommendedApplyByDate;

/**
 <p>The Elasticache engine to which the update applies. Either Redis or Memcached</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The Elasticache engine version to which the update applies. Either Redis or Memcached engine version</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The estimated length of time the service update will take</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedUpdateTime;

/**
 <p>Provides details of the service update</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceUpdateDescription;

/**
 <p>The date after which the service update is no longer available</p>
 */
@property (nonatomic, strong) NSDate * _Nullable serviceUpdateEndDate;

/**
 <p>The unique ID of the service update</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceUpdateName;

/**
 <p>The recommendend date to apply the service update in order to ensure compliance. For information on compliance, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/elasticache-compliance.html#elasticache-compliance-self-service">Self-Service Security Updates for Compliance</a>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable serviceUpdateRecommendedApplyByDate;

/**
 <p>The date when the service update is initially available</p>
 */
@property (nonatomic, strong) NSDate * _Nullable serviceUpdateReleaseDate;

/**
 <p>The severity of the service update</p>
 */
@property (nonatomic, assign) AWSElasticacheServiceUpdateSeverity serviceUpdateSeverity;

/**
 <p>The status of the service update</p>
 */
@property (nonatomic, assign) AWSElasticacheServiceUpdateStatus serviceUpdateStatus;

/**
 <p>Reflects the nature of the service update</p>
 */
@property (nonatomic, assign) AWSElasticacheServiceUpdateType serviceUpdateType;

@end

/**
 
 */
@interface AWSElasticacheServiceUpdatesMessage : AWSModel


/**
 <p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of service updates</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheServiceUpdate *> * _Nullable serviceUpdates;

@end

/**
 <p>Represents the progress of an online resharding operation.</p>
 */
@interface AWSElasticacheSlotMigration : AWSModel


/**
 <p>The percentage of the slot migration that is complete.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable progressPercentage;

@end

/**
 <p>Represents a copy of an entire Redis cluster as of the time when the snapshot was taken.</p>
 */
@interface AWSElasticacheSnapshot : AWSModel


/**
 <p>The ARN (Amazon Resource Name) of the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>This parameter is currently disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoMinorVersionUpgrade;

/**
 <p>Indicates the status of Multi-AZ with automatic failover for the source Redis replication group.</p><p>Amazon ElastiCache for Redis does not support Multi-AZ with automatic failover on:</p><ul><li><p>Redis versions earlier than 2.8.6.</p></li><li><p>Redis (cluster mode disabled): T1 node types.</p></li><li><p>Redis (cluster mode enabled): T1 node types.</p></li></ul>
 */
@property (nonatomic, assign) AWSElasticacheAutomaticFailoverStatus automaticFailover;

/**
 <p>The date and time when the source cluster was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable cacheClusterCreateTime;

/**
 <p>The user-supplied identifier of the source cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheClusterId;

/**
 <p>The name of the compute and memory capacity node type for the source cluster.</p><p>The following node types are supported by ElastiCache. Generally speaking, the current generation types provide more memory and computational power at lower cost when compared to their equivalent previous generation counterparts.</p><ul><li><p>General purpose:</p><ul><li><p>Current generation: </p><p><b>M5 node types:</b><code>cache.m5.large</code>, <code>cache.m5.xlarge</code>, <code>cache.m5.2xlarge</code>, <code>cache.m5.4xlarge</code>, <code>cache.m5.12xlarge</code>, <code>cache.m5.24xlarge</code></p><p><b>M4 node types:</b><code>cache.m4.large</code>, <code>cache.m4.xlarge</code>, <code>cache.m4.2xlarge</code>, <code>cache.m4.4xlarge</code>, <code>cache.m4.10xlarge</code></p><p><b>T3 node types:</b><code>cache.t3.micro</code>, <code>cache.t3.small</code>, <code>cache.t3.medium</code></p><p><b>T2 node types:</b><code>cache.t2.micro</code>, <code>cache.t2.small</code>, <code>cache.t2.medium</code></p></li><li><p>Previous generation: (not recommended)</p><p><b>T1 node types:</b><code>cache.t1.micro</code></p><p><b>M1 node types:</b><code>cache.m1.small</code>, <code>cache.m1.medium</code>, <code>cache.m1.large</code>, <code>cache.m1.xlarge</code></p><p><b>M3 node types:</b><code>cache.m3.medium</code>, <code>cache.m3.large</code>, <code>cache.m3.xlarge</code>, <code>cache.m3.2xlarge</code></p></li></ul></li><li><p>Compute optimized:</p><ul><li><p>Previous generation: (not recommended)</p><p><b>C1 node types:</b><code>cache.c1.xlarge</code></p></li></ul></li><li><p>Memory optimized:</p><ul><li><p>Current generation: </p><p><b>R5 node types:</b><code>cache.r5.large</code>, <code>cache.r5.xlarge</code>, <code>cache.r5.2xlarge</code>, <code>cache.r5.4xlarge</code>, <code>cache.r5.12xlarge</code>, <code>cache.r5.24xlarge</code></p><p><b>R4 node types:</b><code>cache.r4.large</code>, <code>cache.r4.xlarge</code>, <code>cache.r4.2xlarge</code>, <code>cache.r4.4xlarge</code>, <code>cache.r4.8xlarge</code>, <code>cache.r4.16xlarge</code></p></li><li><p>Previous generation: (not recommended)</p><p><b>M2 node types:</b><code>cache.m2.xlarge</code>, <code>cache.m2.2xlarge</code>, <code>cache.m2.4xlarge</code></p><p><b>R3 node types:</b><code>cache.r3.large</code>, <code>cache.r3.xlarge</code>, <code>cache.r3.2xlarge</code>, <code>cache.r3.4xlarge</code>, <code>cache.r3.8xlarge</code></p></li></ul></li></ul><p><b>Additional node type info</b></p><ul><li><p>All current generation instance types are created in Amazon VPC by default.</p></li><li><p>Redis append-only files (AOF) are not supported for T1 or T2 instances.</p></li><li><p>Redis Multi-AZ with automatic failover is not supported on T1 instances.</p></li><li><p>Redis configuration variables <code>appendonly</code> and <code>appendfsync</code> are not supported on Redis version 2.8.22 and later.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable cacheNodeType;

/**
 <p>The cache parameter group that is associated with the source cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheParameterGroupName;

/**
 <p>The name of the cache subnet group associated with the source cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheSubnetGroupName;

/**
 <p>The name of the cache engine (<code>memcached</code> or <code>redis</code>) used by the source cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The version of the cache engine version that is used by the source cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The ID of the KMS key used to encrypt the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>A list of the cache nodes in the source cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheNodeSnapshot *> * _Nullable nodeSnapshots;

/**
 <p>The number of cache nodes in the source cluster.</p><p>For clusters running Redis, this value must be 1. For clusters running Memcached, this value must be between 1 and 20.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numCacheNodes;

/**
 <p>The number of node groups (shards) in this snapshot. When restoring from a snapshot, the number of node groups (shards) in the snapshot and in the restored replication group must be the same.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numNodeGroups;

/**
 <p>The port number used by each cache nodes in the source cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The name of the Availability Zone in which the source cluster is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredAvailabilityZone;

/**
 <p>Specifies the weekly time range during which maintenance on the cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period.</p><p>Valid values for <code>ddd</code> are:</p><ul><li><p><code>sun</code></p></li><li><p><code>mon</code></p></li><li><p><code>tue</code></p></li><li><p><code>wed</code></p></li><li><p><code>thu</code></p></li><li><p><code>fri</code></p></li><li><p><code>sat</code></p></li></ul><p>Example: <code>sun:23:00-mon:01:30</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>A description of the source replication group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupDescription;

/**
 <p>The unique identifier of the source replication group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

/**
 <p>The name of a snapshot. For an automatic snapshot, the name is system-generated. For a manual snapshot, this is the user-provided name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotName;

/**
 <p>For an automatic snapshot, the number of days for which ElastiCache retains the snapshot before deleting it.</p><p>For manual snapshots, this field reflects the <code>SnapshotRetentionLimit</code> for the source cluster when the snapshot was created. This field is otherwise ignored: Manual snapshots do not expire, and can only be deleted using the <code>DeleteSnapshot</code> operation. </p><p><b>Important</b> If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable snapshotRetentionLimit;

/**
 <p>Indicates whether the snapshot is from an automatic backup (<code>automated</code>) or was created manually (<code>manual</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotSource;

/**
 <p>The status of the snapshot. Valid values: <code>creating</code> | <code>available</code> | <code>restoring</code> | <code>copying</code> | <code>deleting</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotStatus;

/**
 <p>The daily time range during which ElastiCache takes daily snapshots of the source cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotWindow;

/**
 <p>The Amazon Resource Name (ARN) for the topic used by the source cluster for publishing notifications.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicArn;

/**
 <p>The Amazon Virtual Private Cloud identifier (VPC ID) of the cache subnet group for the source cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 
 */
@interface AWSElasticacheStartMigrationMessage : AWSRequest


/**
 <p>List of endpoints from which data should be migrated. For Redis (cluster mode disabled), list should have only one element.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheCustomerNodeEndpoint *> * _Nullable customerNodeEndpointList;

/**
 <p>The ID of the replication group to which data should be migrated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

@end

/**
 
 */
@interface AWSElasticacheStartMigrationResponse : AWSModel


/**
 <p>Contains all of the attributes of a specific Redis replication group.</p>
 */
@property (nonatomic, strong) AWSElasticacheReplicationGroup * _Nullable replicationGroup;

@end

/**
 <p>Represents the subnet associated with a cluster. This parameter refers to subnets defined in Amazon Virtual Private Cloud (Amazon VPC) and used with ElastiCache.</p>
 */
@interface AWSElasticacheSubnet : AWSModel


/**
 <p>The Availability Zone associated with the subnet.</p>
 */
@property (nonatomic, strong) AWSElasticacheAvailabilityZone * _Nullable subnetAvailabilityZone;

/**
 <p>The unique identifier for the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetIdentifier;

@end

/**
 <p>A cost allocation Tag that can be added to an ElastiCache cluster or replication group. Tags are composed of a Key/Value pair. A tag with a null Value is permitted.</p>
 */
@interface AWSElasticacheTag : AWSModel


/**
 <p>The key for the tag. May not be null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The tag's value. May be null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Represents the output from the <code>AddTagsToResource</code>, <code>ListTagsForResource</code>, and <code>RemoveTagsFromResource</code> operations.</p>
 */
@interface AWSElasticacheTagListMessage : AWSModel


/**
 <p>A list of cost allocation tags as key-value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheTag *> * _Nullable tagList;

@end

/**
 
 */
@interface AWSElasticacheTestFailoverMessage : AWSRequest


/**
 <p>The name of the node group (called shard in the console) in this replication group on which automatic failover is to be tested. You may test automatic failover on up to 5 node groups in any rolling 24-hour period.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeGroupId;

/**
 <p>The name of the replication group (console: cluster) whose automatic failover is being tested by this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

@end

/**
 
 */
@interface AWSElasticacheTestFailoverResult : AWSModel


/**
 <p>Contains all of the attributes of a specific Redis replication group.</p>
 */
@property (nonatomic, strong) AWSElasticacheReplicationGroup * _Nullable replicationGroup;

@end

/**
 <p>Filters update actions from the service updates that are in available status during the time range.</p>
 */
@interface AWSElasticacheTimeRangeFilter : AWSModel


/**
 <p>The end time of the time range filter</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The start time of the time range filter</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 <p>Update action that has failed to be processed for the corresponding apply/stop request</p>
 */
@interface AWSElasticacheUnprocessedUpdateAction : AWSModel


/**
 <p>The ID of the cache cluster</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheClusterId;

/**
 <p>The error message that describes the reason the request was not processed</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The error type for requests that are not processed</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorType;

/**
 <p>The replication group ID</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

/**
 <p>The unique ID of the service update</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceUpdateName;

@end

/**
 <p>The status of the service update for a specific replication group</p>
 */
@interface AWSElasticacheUpdateAction : AWSModel


/**
 <p>The ID of the cache cluster</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheClusterId;

/**
 <p>The status of the service update on the cache node</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheCacheNodeUpdateStatus *> * _Nullable cacheNodeUpdateStatus;

/**
 <p>The Elasticache engine to which the update applies. Either Redis or Memcached</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The estimated length of time for the update to complete</p>
 */
@property (nonatomic, strong) NSString * _Nullable estimatedUpdateTime;

/**
 <p>The status of the service update on the node group</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheNodeGroupUpdateStatus *> * _Nullable nodeGroupUpdateStatus;

/**
 <p>The progress of the service update on the replication group</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodesUpdated;

/**
 <p>The ID of the replication group</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationGroupId;

/**
 <p>The unique ID of the service update</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceUpdateName;

/**
 <p>The recommended date to apply the service update to ensure compliance. For information on compliance, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/elasticache-compliance.html#elasticache-compliance-self-service">Self-Service Security Updates for Compliance</a>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable serviceUpdateRecommendedApplyByDate;

/**
 <p>The date the update is first available</p>
 */
@property (nonatomic, strong) NSDate * _Nullable serviceUpdateReleaseDate;

/**
 <p>The severity of the service update</p>
 */
@property (nonatomic, assign) AWSElasticacheServiceUpdateSeverity serviceUpdateSeverity;

/**
 <p>The status of the service update</p>
 */
@property (nonatomic, assign) AWSElasticacheServiceUpdateStatus serviceUpdateStatus;

/**
 <p>Reflects the nature of the service update </p>
 */
@property (nonatomic, assign) AWSElasticacheServiceUpdateType serviceUpdateType;

/**
 <p>If yes, all nodes in the replication group have been updated by the recommended apply-by date. If no, at least one node in the replication group have not been updated by the recommended apply-by date. If N/A, the replication group was created after the recommended apply-by date.</p>
 */
@property (nonatomic, assign) AWSElasticacheSlaMet slaMet;

/**
 <p>The date that the service update is available to a replication group</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateActionAvailableDate;

/**
 <p>The status of the update action</p>
 */
@property (nonatomic, assign) AWSElasticacheUpdateActionStatus updateActionStatus;

/**
 <p>The date when the UpdateActionStatus was last modified</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateActionStatusModifiedDate;

@end

/**
 
 */
@interface AWSElasticacheUpdateActionResultsMessage : AWSModel


/**
 <p>Update actions that have been processed successfully</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheProcessedUpdateAction *> * _Nullable processedUpdateActions;

/**
 <p>Update actions that haven't been processed successfully</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheUnprocessedUpdateAction *> * _Nullable unprocessedUpdateActions;

@end

/**
 
 */
@interface AWSElasticacheUpdateActionsMessage : AWSModel


/**
 <p>An optional marker returned from a prior request. Use this marker for pagination of results from this operation. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Returns a list of update actions</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticacheUpdateAction *> * _Nullable updateActions;

@end

NS_ASSUME_NONNULL_END
