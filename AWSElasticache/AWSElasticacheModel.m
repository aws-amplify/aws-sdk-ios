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

#import "AWSElasticacheModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSElasticacheErrorDomain = @"com.amazonaws.AWSElasticacheErrorDomain";

@implementation AWSElasticacheAddTagsToResourceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceName" : @"ResourceName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheTag class]];
}

@end

@implementation AWSElasticacheAllowedNodeTypeModificationsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scaleDownModifications" : @"ScaleDownModifications",
             @"scaleUpModifications" : @"ScaleUpModifications",
             };
}

@end

@implementation AWSElasticacheAuthorizeCacheSecurityGroupIngressMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheSecurityGroupName" : @"CacheSecurityGroupName",
             @"EC2SecurityGroupName" : @"EC2SecurityGroupName",
             @"EC2SecurityGroupOwnerId" : @"EC2SecurityGroupOwnerId",
             };
}

@end

@implementation AWSElasticacheAuthorizeCacheSecurityGroupIngressResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheSecurityGroup" : @"CacheSecurityGroup",
             };
}

+ (NSValueTransformer *)cacheSecurityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheCacheSecurityGroup class]];
}

@end

@implementation AWSElasticacheAvailabilityZone

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSElasticacheBatchApplyUpdateActionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheClusterIds" : @"CacheClusterIds",
             @"replicationGroupIds" : @"ReplicationGroupIds",
             @"serviceUpdateName" : @"ServiceUpdateName",
             };
}

@end

@implementation AWSElasticacheBatchStopUpdateActionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheClusterIds" : @"CacheClusterIds",
             @"replicationGroupIds" : @"ReplicationGroupIds",
             @"serviceUpdateName" : @"ServiceUpdateName",
             };
}

@end

@implementation AWSElasticacheCacheCluster

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"atRestEncryptionEnabled" : @"AtRestEncryptionEnabled",
             @"authTokenEnabled" : @"AuthTokenEnabled",
             @"authTokenLastModifiedDate" : @"AuthTokenLastModifiedDate",
             @"autoMinorVersionUpgrade" : @"AutoMinorVersionUpgrade",
             @"cacheClusterCreateTime" : @"CacheClusterCreateTime",
             @"cacheClusterId" : @"CacheClusterId",
             @"cacheClusterStatus" : @"CacheClusterStatus",
             @"cacheNodeType" : @"CacheNodeType",
             @"cacheNodes" : @"CacheNodes",
             @"cacheParameterGroup" : @"CacheParameterGroup",
             @"cacheSecurityGroups" : @"CacheSecurityGroups",
             @"cacheSubnetGroupName" : @"CacheSubnetGroupName",
             @"clientDownloadLandingPage" : @"ClientDownloadLandingPage",
             @"configurationEndpoint" : @"ConfigurationEndpoint",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"notificationConfiguration" : @"NotificationConfiguration",
             @"numCacheNodes" : @"NumCacheNodes",
             @"pendingModifiedValues" : @"PendingModifiedValues",
             @"preferredAvailabilityZone" : @"PreferredAvailabilityZone",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"replicationGroupId" : @"ReplicationGroupId",
             @"securityGroups" : @"SecurityGroups",
             @"snapshotRetentionLimit" : @"SnapshotRetentionLimit",
             @"snapshotWindow" : @"SnapshotWindow",
             @"transitEncryptionEnabled" : @"TransitEncryptionEnabled",
             };
}

+ (NSValueTransformer *)authTokenLastModifiedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)cacheClusterCreateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)cacheNodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheCacheNode class]];
}

+ (NSValueTransformer *)cacheParameterGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheCacheParameterGroupStatus class]];
}

+ (NSValueTransformer *)cacheSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheCacheSecurityGroupMembership class]];
}

+ (NSValueTransformer *)configurationEndpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheEndpoint class]];
}

+ (NSValueTransformer *)notificationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheNotificationConfiguration class]];
}

+ (NSValueTransformer *)pendingModifiedValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticachePendingModifiedValues class]];
}

+ (NSValueTransformer *)securityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheSecurityGroupMembership class]];
}

@end

@implementation AWSElasticacheCacheClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheClusters" : @"CacheClusters",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)cacheClustersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheCacheCluster class]];
}

@end

@implementation AWSElasticacheCacheEngineVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheEngineDescription" : @"CacheEngineDescription",
             @"cacheEngineVersionDescription" : @"CacheEngineVersionDescription",
             @"cacheParameterGroupFamily" : @"CacheParameterGroupFamily",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             };
}

@end

@implementation AWSElasticacheCacheEngineVersionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheEngineVersions" : @"CacheEngineVersions",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)cacheEngineVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheCacheEngineVersion class]];
}

@end

@implementation AWSElasticacheCacheNode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheNodeCreateTime" : @"CacheNodeCreateTime",
             @"cacheNodeId" : @"CacheNodeId",
             @"cacheNodeStatus" : @"CacheNodeStatus",
             @"customerAvailabilityZone" : @"CustomerAvailabilityZone",
             @"endpoint" : @"Endpoint",
             @"parameterGroupStatus" : @"ParameterGroupStatus",
             @"sourceCacheNodeId" : @"SourceCacheNodeId",
             };
}

+ (NSValueTransformer *)cacheNodeCreateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)endpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheEndpoint class]];
}

@end

@implementation AWSElasticacheCacheNodeTypeSpecificParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedValues" : @"AllowedValues",
             @"cacheNodeTypeSpecificValues" : @"CacheNodeTypeSpecificValues",
             @"changeType" : @"ChangeType",
             @"dataType" : @"DataType",
             @"detail" : @"Description",
             @"isModifiable" : @"IsModifiable",
             @"minimumEngineVersion" : @"MinimumEngineVersion",
             @"parameterName" : @"ParameterName",
             @"source" : @"Source",
             };
}

+ (NSValueTransformer *)cacheNodeTypeSpecificValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheCacheNodeTypeSpecificValue class]];
}

+ (NSValueTransformer *)changeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"immediate"] == NSOrderedSame) {
            return @(AWSElasticacheChangeTypeImmediate);
        }
        if ([value caseInsensitiveCompare:@"requires-reboot"] == NSOrderedSame) {
            return @(AWSElasticacheChangeTypeRequiresReboot);
        }
        return @(AWSElasticacheChangeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheChangeTypeImmediate:
                return @"immediate";
            case AWSElasticacheChangeTypeRequiresReboot:
                return @"requires-reboot";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticacheCacheNodeTypeSpecificValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheNodeType" : @"CacheNodeType",
             @"value" : @"Value",
             };
}

@end

@implementation AWSElasticacheCacheNodeUpdateStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheNodeId" : @"CacheNodeId",
             @"nodeDeletionDate" : @"NodeDeletionDate",
             @"nodeUpdateEndDate" : @"NodeUpdateEndDate",
             @"nodeUpdateInitiatedBy" : @"NodeUpdateInitiatedBy",
             @"nodeUpdateInitiatedDate" : @"NodeUpdateInitiatedDate",
             @"nodeUpdateStartDate" : @"NodeUpdateStartDate",
             @"nodeUpdateStatus" : @"NodeUpdateStatus",
             @"nodeUpdateStatusModifiedDate" : @"NodeUpdateStatusModifiedDate",
             };
}

+ (NSValueTransformer *)nodeDeletionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)nodeUpdateEndDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)nodeUpdateInitiatedByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"system"] == NSOrderedSame) {
            return @(AWSElasticacheNodeUpdateInitiatedBySystem);
        }
        if ([value caseInsensitiveCompare:@"customer"] == NSOrderedSame) {
            return @(AWSElasticacheNodeUpdateInitiatedByCustomer);
        }
        return @(AWSElasticacheNodeUpdateInitiatedByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheNodeUpdateInitiatedBySystem:
                return @"system";
            case AWSElasticacheNodeUpdateInitiatedByCustomer:
                return @"customer";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)nodeUpdateInitiatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)nodeUpdateStartDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)nodeUpdateStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"not-applied"] == NSOrderedSame) {
            return @(AWSElasticacheNodeUpdateStatusNotApplied);
        }
        if ([value caseInsensitiveCompare:@"waiting-to-start"] == NSOrderedSame) {
            return @(AWSElasticacheNodeUpdateStatusWaitingToStart);
        }
        if ([value caseInsensitiveCompare:@"in-progress"] == NSOrderedSame) {
            return @(AWSElasticacheNodeUpdateStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"stopping"] == NSOrderedSame) {
            return @(AWSElasticacheNodeUpdateStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"stopped"] == NSOrderedSame) {
            return @(AWSElasticacheNodeUpdateStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"complete"] == NSOrderedSame) {
            return @(AWSElasticacheNodeUpdateStatusComplete);
        }
        return @(AWSElasticacheNodeUpdateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheNodeUpdateStatusNotApplied:
                return @"not-applied";
            case AWSElasticacheNodeUpdateStatusWaitingToStart:
                return @"waiting-to-start";
            case AWSElasticacheNodeUpdateStatusInProgress:
                return @"in-progress";
            case AWSElasticacheNodeUpdateStatusStopping:
                return @"stopping";
            case AWSElasticacheNodeUpdateStatusStopped:
                return @"stopped";
            case AWSElasticacheNodeUpdateStatusComplete:
                return @"complete";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)nodeUpdateStatusModifiedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSElasticacheCacheParameterGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"cacheParameterGroupFamily" : @"CacheParameterGroupFamily",
             @"cacheParameterGroupName" : @"CacheParameterGroupName",
             @"detail" : @"Description",
             @"isGlobal" : @"IsGlobal",
             };
}

@end

@implementation AWSElasticacheCacheParameterGroupDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheNodeTypeSpecificParameters" : @"CacheNodeTypeSpecificParameters",
             @"marker" : @"Marker",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)cacheNodeTypeSpecificParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheCacheNodeTypeSpecificParameter class]];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheParameter class]];
}

@end

@implementation AWSElasticacheCacheParameterGroupNameMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheParameterGroupName" : @"CacheParameterGroupName",
             };
}

@end

@implementation AWSElasticacheCacheParameterGroupStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheNodeIdsToReboot" : @"CacheNodeIdsToReboot",
             @"cacheParameterGroupName" : @"CacheParameterGroupName",
             @"parameterApplyStatus" : @"ParameterApplyStatus",
             };
}

@end

@implementation AWSElasticacheCacheParameterGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheParameterGroups" : @"CacheParameterGroups",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)cacheParameterGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheCacheParameterGroup class]];
}

@end

@implementation AWSElasticacheCacheSecurityGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"cacheSecurityGroupName" : @"CacheSecurityGroupName",
             @"detail" : @"Description",
             @"EC2SecurityGroups" : @"EC2SecurityGroups",
             @"ownerId" : @"OwnerId",
             };
}

+ (NSValueTransformer *)EC2SecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheEC2SecurityGroup class]];
}

@end

@implementation AWSElasticacheCacheSecurityGroupMembership

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheSecurityGroupName" : @"CacheSecurityGroupName",
             @"status" : @"Status",
             };
}

@end

@implementation AWSElasticacheCacheSecurityGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheSecurityGroups" : @"CacheSecurityGroups",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)cacheSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheCacheSecurityGroup class]];
}

@end

@implementation AWSElasticacheCacheSubnetGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"cacheSubnetGroupDescription" : @"CacheSubnetGroupDescription",
             @"cacheSubnetGroupName" : @"CacheSubnetGroupName",
             @"subnets" : @"Subnets",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)subnetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheSubnet class]];
}

@end

@implementation AWSElasticacheCacheSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheSubnetGroups" : @"CacheSubnetGroups",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)cacheSubnetGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheCacheSubnetGroup class]];
}

@end

@implementation AWSElasticacheCompleteMigrationMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"force" : @"Force",
             @"replicationGroupId" : @"ReplicationGroupId",
             };
}

@end

@implementation AWSElasticacheCompleteMigrationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationGroup" : @"ReplicationGroup",
             };
}

+ (NSValueTransformer *)replicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheReplicationGroup class]];
}

@end

@implementation AWSElasticacheConfigureShard

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"latestReplicaCount" : @"NewReplicaCount",
             @"nodeGroupId" : @"NodeGroupId",
             @"preferredAvailabilityZones" : @"PreferredAvailabilityZones",
             };
}

@end

@implementation AWSElasticacheReplicateSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"sourceSnapshotName" : @"SourceSnapshotName",
             @"targetBucket" : @"TargetBucket",
             @"targetSnapshotName" : @"TargetSnapshotName",
             };
}

@end

@implementation AWSElasticacheReplicateSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshot" : @"Snapshot",
             };
}

+ (NSValueTransformer *)snapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheSnapshot class]];
}

@end

@implementation AWSElasticacheCreateCacheClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"AZMode" : @"AZMode",
             @"authToken" : @"AuthToken",
             @"autoMinorVersionUpgrade" : @"AutoMinorVersionUpgrade",
             @"cacheClusterId" : @"CacheClusterId",
             @"cacheNodeType" : @"CacheNodeType",
             @"cacheParameterGroupName" : @"CacheParameterGroupName",
             @"cacheSecurityGroupNames" : @"CacheSecurityGroupNames",
             @"cacheSubnetGroupName" : @"CacheSubnetGroupName",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"notificationTopicArn" : @"NotificationTopicArn",
             @"numCacheNodes" : @"NumCacheNodes",
             @"port" : @"Port",
             @"preferredAvailabilityZone" : @"PreferredAvailabilityZone",
             @"preferredAvailabilityZones" : @"PreferredAvailabilityZones",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"replicationGroupId" : @"ReplicationGroupId",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"snapshotArns" : @"SnapshotArns",
             @"snapshotName" : @"SnapshotName",
             @"snapshotRetentionLimit" : @"SnapshotRetentionLimit",
             @"snapshotWindow" : @"SnapshotWindow",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)AZModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"single-az"] == NSOrderedSame) {
            return @(AWSElasticacheAZModeSingleAz);
        }
        if ([value caseInsensitiveCompare:@"cross-az"] == NSOrderedSame) {
            return @(AWSElasticacheAZModeCrossAz);
        }
        return @(AWSElasticacheAZModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheAZModeSingleAz:
                return @"single-az";
            case AWSElasticacheAZModeCrossAz:
                return @"cross-az";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheTag class]];
}

@end

@implementation AWSElasticacheCreateCacheClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheCluster" : @"CacheCluster",
             };
}

+ (NSValueTransformer *)cacheClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheCacheCluster class]];
}

@end

@implementation AWSElasticacheCreateCacheParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheParameterGroupFamily" : @"CacheParameterGroupFamily",
             @"cacheParameterGroupName" : @"CacheParameterGroupName",
             @"detail" : @"Description",
             };
}

@end

@implementation AWSElasticacheCreateCacheParameterGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheParameterGroup" : @"CacheParameterGroup",
             };
}

+ (NSValueTransformer *)cacheParameterGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheCacheParameterGroup class]];
}

@end

@implementation AWSElasticacheCreateCacheSecurityGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheSecurityGroupName" : @"CacheSecurityGroupName",
             @"detail" : @"Description",
             };
}

@end

@implementation AWSElasticacheCreateCacheSecurityGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheSecurityGroup" : @"CacheSecurityGroup",
             };
}

+ (NSValueTransformer *)cacheSecurityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheCacheSecurityGroup class]];
}

@end

@implementation AWSElasticacheCreateCacheSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheSubnetGroupDescription" : @"CacheSubnetGroupDescription",
             @"cacheSubnetGroupName" : @"CacheSubnetGroupName",
             @"subnetIds" : @"SubnetIds",
             };
}

@end

@implementation AWSElasticacheCreateCacheSubnetGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheSubnetGroup" : @"CacheSubnetGroup",
             };
}

+ (NSValueTransformer *)cacheSubnetGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheCacheSubnetGroup class]];
}

@end

@implementation AWSElasticacheCreateGlobalReplicationGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalReplicationGroupDescription" : @"GlobalReplicationGroupDescription",
             @"globalReplicationGroupIdSuffix" : @"GlobalReplicationGroupIdSuffix",
             @"primaryReplicationGroupId" : @"PrimaryReplicationGroupId",
             };
}

@end

@implementation AWSElasticacheCreateGlobalReplicationGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalReplicationGroup" : @"GlobalReplicationGroup",
             };
}

+ (NSValueTransformer *)globalReplicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheGlobalReplicationGroup class]];
}

@end

@implementation AWSElasticacheCreateReplicationGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"atRestEncryptionEnabled" : @"AtRestEncryptionEnabled",
             @"authToken" : @"AuthToken",
             @"autoMinorVersionUpgrade" : @"AutoMinorVersionUpgrade",
             @"automaticFailoverEnabled" : @"AutomaticFailoverEnabled",
             @"cacheNodeType" : @"CacheNodeType",
             @"cacheParameterGroupName" : @"CacheParameterGroupName",
             @"cacheSecurityGroupNames" : @"CacheSecurityGroupNames",
             @"cacheSubnetGroupName" : @"CacheSubnetGroupName",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"globalReplicationGroupId" : @"GlobalReplicationGroupId",
             @"kmsKeyId" : @"KmsKeyId",
             @"multiAZEnabled" : @"MultiAZEnabled",
             @"nodeGroupConfiguration" : @"NodeGroupConfiguration",
             @"notificationTopicArn" : @"NotificationTopicArn",
             @"numCacheClusters" : @"NumCacheClusters",
             @"numNodeGroups" : @"NumNodeGroups",
             @"port" : @"Port",
             @"preferredCacheClusterAZs" : @"PreferredCacheClusterAZs",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"primaryClusterId" : @"PrimaryClusterId",
             @"replicasPerNodeGroup" : @"ReplicasPerNodeGroup",
             @"replicationGroupDescription" : @"ReplicationGroupDescription",
             @"replicationGroupId" : @"ReplicationGroupId",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"snapshotArns" : @"SnapshotArns",
             @"snapshotName" : @"SnapshotName",
             @"snapshotRetentionLimit" : @"SnapshotRetentionLimit",
             @"snapshotWindow" : @"SnapshotWindow",
             @"tags" : @"Tags",
             @"transitEncryptionEnabled" : @"TransitEncryptionEnabled",
             };
}

+ (NSValueTransformer *)nodeGroupConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheNodeGroupConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheTag class]];
}

@end

@implementation AWSElasticacheCreateReplicationGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationGroup" : @"ReplicationGroup",
             };
}

+ (NSValueTransformer *)replicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheReplicationGroup class]];
}

@end

@implementation AWSElasticacheCreateSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheClusterId" : @"CacheClusterId",
             @"kmsKeyId" : @"KmsKeyId",
             @"replicationGroupId" : @"ReplicationGroupId",
             @"snapshotName" : @"SnapshotName",
             };
}

@end

@implementation AWSElasticacheCreateSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshot" : @"Snapshot",
             };
}

+ (NSValueTransformer *)snapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheSnapshot class]];
}

@end

@implementation AWSElasticacheCustomerNodeEndpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"port" : @"Port",
             };
}

@end

@implementation AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyImmediately" : @"ApplyImmediately",
             @"globalNodeGroupsToRemove" : @"GlobalNodeGroupsToRemove",
             @"globalNodeGroupsToRetain" : @"GlobalNodeGroupsToRetain",
             @"globalReplicationGroupId" : @"GlobalReplicationGroupId",
             @"nodeGroupCount" : @"NodeGroupCount",
             };
}

@end

@implementation AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalReplicationGroup" : @"GlobalReplicationGroup",
             };
}

+ (NSValueTransformer *)globalReplicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheGlobalReplicationGroup class]];
}

@end

@implementation AWSElasticacheDecreaseReplicaCountMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyImmediately" : @"ApplyImmediately",
             @"latestReplicaCount" : @"NewReplicaCount",
             @"replicaConfiguration" : @"ReplicaConfiguration",
             @"replicasToRemove" : @"ReplicasToRemove",
             @"replicationGroupId" : @"ReplicationGroupId",
             };
}

+ (NSValueTransformer *)replicaConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheConfigureShard class]];
}

@end

@implementation AWSElasticacheDecreaseReplicaCountResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationGroup" : @"ReplicationGroup",
             };
}

+ (NSValueTransformer *)replicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheReplicationGroup class]];
}

@end

@implementation AWSElasticacheDeleteCacheClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheClusterId" : @"CacheClusterId",
             @"finalSnapshotIdentifier" : @"FinalSnapshotIdentifier",
             };
}

@end

@implementation AWSElasticacheDeleteCacheClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheCluster" : @"CacheCluster",
             };
}

+ (NSValueTransformer *)cacheClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheCacheCluster class]];
}

@end

@implementation AWSElasticacheDeleteCacheParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheParameterGroupName" : @"CacheParameterGroupName",
             };
}

@end

@implementation AWSElasticacheDeleteCacheSecurityGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheSecurityGroupName" : @"CacheSecurityGroupName",
             };
}

@end

@implementation AWSElasticacheDeleteCacheSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheSubnetGroupName" : @"CacheSubnetGroupName",
             };
}

@end

@implementation AWSElasticacheDeleteGlobalReplicationGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalReplicationGroupId" : @"GlobalReplicationGroupId",
             @"retainPrimaryReplicationGroup" : @"RetainPrimaryReplicationGroup",
             };
}

@end

@implementation AWSElasticacheDeleteGlobalReplicationGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalReplicationGroup" : @"GlobalReplicationGroup",
             };
}

+ (NSValueTransformer *)globalReplicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheGlobalReplicationGroup class]];
}

@end

@implementation AWSElasticacheDeleteReplicationGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"finalSnapshotIdentifier" : @"FinalSnapshotIdentifier",
             @"replicationGroupId" : @"ReplicationGroupId",
             @"retainPrimaryCluster" : @"RetainPrimaryCluster",
             };
}

@end

@implementation AWSElasticacheDeleteReplicationGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationGroup" : @"ReplicationGroup",
             };
}

+ (NSValueTransformer *)replicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheReplicationGroup class]];
}

@end

@implementation AWSElasticacheDeleteSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshotName" : @"SnapshotName",
             };
}

@end

@implementation AWSElasticacheDeleteSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshot" : @"Snapshot",
             };
}

+ (NSValueTransformer *)snapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheSnapshot class]];
}

@end

@implementation AWSElasticacheDescribeCacheClustersMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheClusterId" : @"CacheClusterId",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"showCacheClustersNotInReplicationGroups" : @"ShowCacheClustersNotInReplicationGroups",
             @"showCacheNodeInfo" : @"ShowCacheNodeInfo",
             };
}

@end

@implementation AWSElasticacheDescribeCacheEngineVersionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheParameterGroupFamily" : @"CacheParameterGroupFamily",
             @"defaultOnly" : @"DefaultOnly",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

@end

@implementation AWSElasticacheDescribeCacheParameterGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheParameterGroupName" : @"CacheParameterGroupName",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

@end

@implementation AWSElasticacheDescribeCacheParametersMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheParameterGroupName" : @"CacheParameterGroupName",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"source" : @"Source",
             };
}

@end

@implementation AWSElasticacheDescribeCacheSecurityGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheSecurityGroupName" : @"CacheSecurityGroupName",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

@end

@implementation AWSElasticacheDescribeCacheSubnetGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheSubnetGroupName" : @"CacheSubnetGroupName",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

@end

@implementation AWSElasticacheDescribeEngineDefaultParametersMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheParameterGroupFamily" : @"CacheParameterGroupFamily",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

@end

@implementation AWSElasticacheDescribeEngineDefaultParametersResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"engineDefaults" : @"EngineDefaults",
             };
}

+ (NSValueTransformer *)engineDefaultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheEngineDefaults class]];
}

@end

@implementation AWSElasticacheDescribeEventsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"duration" : @"Duration",
             @"endTime" : @"EndTime",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"sourceIdentifier" : @"SourceIdentifier",
             @"sourceType" : @"SourceType",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)sourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"cache-cluster"] == NSOrderedSame) {
            return @(AWSElasticacheSourceTypeCacheCluster);
        }
        if ([value caseInsensitiveCompare:@"cache-parameter-group"] == NSOrderedSame) {
            return @(AWSElasticacheSourceTypeCacheParameterGroup);
        }
        if ([value caseInsensitiveCompare:@"cache-security-group"] == NSOrderedSame) {
            return @(AWSElasticacheSourceTypeCacheSecurityGroup);
        }
        if ([value caseInsensitiveCompare:@"cache-subnet-group"] == NSOrderedSame) {
            return @(AWSElasticacheSourceTypeCacheSubnetGroup);
        }
        if ([value caseInsensitiveCompare:@"replication-group"] == NSOrderedSame) {
            return @(AWSElasticacheSourceTypeReplicationGroup);
        }
        return @(AWSElasticacheSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheSourceTypeCacheCluster:
                return @"cache-cluster";
            case AWSElasticacheSourceTypeCacheParameterGroup:
                return @"cache-parameter-group";
            case AWSElasticacheSourceTypeCacheSecurityGroup:
                return @"cache-security-group";
            case AWSElasticacheSourceTypeCacheSubnetGroup:
                return @"cache-subnet-group";
            case AWSElasticacheSourceTypeReplicationGroup:
                return @"replication-group";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSElasticacheDescribeGlobalReplicationGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalReplicationGroupId" : @"GlobalReplicationGroupId",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"showMemberInfo" : @"ShowMemberInfo",
             };
}

@end

@implementation AWSElasticacheDescribeGlobalReplicationGroupsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalReplicationGroups" : @"GlobalReplicationGroups",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)globalReplicationGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheGlobalReplicationGroup class]];
}

@end

@implementation AWSElasticacheDescribeReplicationGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"replicationGroupId" : @"ReplicationGroupId",
             };
}

@end

@implementation AWSElasticacheDescribeReservedCacheNodesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheNodeType" : @"CacheNodeType",
             @"duration" : @"Duration",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"offeringType" : @"OfferingType",
             @"productDescription" : @"ProductDescription",
             @"reservedCacheNodeId" : @"ReservedCacheNodeId",
             @"reservedCacheNodesOfferingId" : @"ReservedCacheNodesOfferingId",
             };
}

@end

@implementation AWSElasticacheDescribeReservedCacheNodesOfferingsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheNodeType" : @"CacheNodeType",
             @"duration" : @"Duration",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"offeringType" : @"OfferingType",
             @"productDescription" : @"ProductDescription",
             @"reservedCacheNodesOfferingId" : @"ReservedCacheNodesOfferingId",
             };
}

@end

@implementation AWSElasticacheDescribeServiceUpdatesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"serviceUpdateName" : @"ServiceUpdateName",
             @"serviceUpdateStatus" : @"ServiceUpdateStatus",
             };
}

@end

@implementation AWSElasticacheDescribeSnapshotsListMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"snapshots" : @"Snapshots",
             };
}

+ (NSValueTransformer *)snapshotsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheSnapshot class]];
}

@end

@implementation AWSElasticacheDescribeSnapshotsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheClusterId" : @"CacheClusterId",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"replicationGroupId" : @"ReplicationGroupId",
             @"showNodeGroupConfig" : @"ShowNodeGroupConfig",
             @"snapshotName" : @"SnapshotName",
             @"snapshotSource" : @"SnapshotSource",
             };
}

@end

@implementation AWSElasticacheDescribeUpdateActionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheClusterIds" : @"CacheClusterIds",
             @"engine" : @"Engine",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"replicationGroupIds" : @"ReplicationGroupIds",
             @"serviceUpdateName" : @"ServiceUpdateName",
             @"serviceUpdateStatus" : @"ServiceUpdateStatus",
             @"serviceUpdateTimeRange" : @"ServiceUpdateTimeRange",
             @"showNodeLevelUpdateStatus" : @"ShowNodeLevelUpdateStatus",
             @"updateActionStatus" : @"UpdateActionStatus",
             };
}

+ (NSValueTransformer *)serviceUpdateTimeRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheTimeRangeFilter class]];
}

@end

@implementation AWSElasticacheDisassociateGlobalReplicationGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalReplicationGroupId" : @"GlobalReplicationGroupId",
             @"replicationGroupId" : @"ReplicationGroupId",
             @"replicationGroupRegion" : @"ReplicationGroupRegion",
             };
}

@end

@implementation AWSElasticacheDisassociateGlobalReplicationGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalReplicationGroup" : @"GlobalReplicationGroup",
             };
}

+ (NSValueTransformer *)globalReplicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheGlobalReplicationGroup class]];
}

@end

@implementation AWSElasticacheEC2SecurityGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"EC2SecurityGroupName" : @"EC2SecurityGroupName",
             @"EC2SecurityGroupOwnerId" : @"EC2SecurityGroupOwnerId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSElasticacheEndpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"port" : @"Port",
             };
}

@end

@implementation AWSElasticacheEngineDefaults

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheNodeTypeSpecificParameters" : @"CacheNodeTypeSpecificParameters",
             @"cacheParameterGroupFamily" : @"CacheParameterGroupFamily",
             @"marker" : @"Marker",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)cacheNodeTypeSpecificParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheCacheNodeTypeSpecificParameter class]];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheParameter class]];
}

@end

@implementation AWSElasticacheEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"date" : @"Date",
             @"message" : @"Message",
             @"sourceIdentifier" : @"SourceIdentifier",
             @"sourceType" : @"SourceType",
             };
}

+ (NSValueTransformer *)dateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)sourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"cache-cluster"] == NSOrderedSame) {
            return @(AWSElasticacheSourceTypeCacheCluster);
        }
        if ([value caseInsensitiveCompare:@"cache-parameter-group"] == NSOrderedSame) {
            return @(AWSElasticacheSourceTypeCacheParameterGroup);
        }
        if ([value caseInsensitiveCompare:@"cache-security-group"] == NSOrderedSame) {
            return @(AWSElasticacheSourceTypeCacheSecurityGroup);
        }
        if ([value caseInsensitiveCompare:@"cache-subnet-group"] == NSOrderedSame) {
            return @(AWSElasticacheSourceTypeCacheSubnetGroup);
        }
        if ([value caseInsensitiveCompare:@"replication-group"] == NSOrderedSame) {
            return @(AWSElasticacheSourceTypeReplicationGroup);
        }
        return @(AWSElasticacheSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheSourceTypeCacheCluster:
                return @"cache-cluster";
            case AWSElasticacheSourceTypeCacheParameterGroup:
                return @"cache-parameter-group";
            case AWSElasticacheSourceTypeCacheSecurityGroup:
                return @"cache-security-group";
            case AWSElasticacheSourceTypeCacheSubnetGroup:
                return @"cache-subnet-group";
            case AWSElasticacheSourceTypeReplicationGroup:
                return @"replication-group";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticacheEventsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"Events",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)eventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheEvent class]];
}

@end

@implementation AWSElasticacheFailoverGlobalReplicationGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalReplicationGroupId" : @"GlobalReplicationGroupId",
             @"primaryRegion" : @"PrimaryRegion",
             @"primaryReplicationGroupId" : @"PrimaryReplicationGroupId",
             };
}

@end

@implementation AWSElasticacheFailoverGlobalReplicationGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalReplicationGroup" : @"GlobalReplicationGroup",
             };
}

+ (NSValueTransformer *)globalReplicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheGlobalReplicationGroup class]];
}

@end

@implementation AWSElasticacheGlobalNodeGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalNodeGroupId" : @"GlobalNodeGroupId",
             @"slots" : @"Slots",
             };
}

@end

@implementation AWSElasticacheGlobalReplicationGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"atRestEncryptionEnabled" : @"AtRestEncryptionEnabled",
             @"authTokenEnabled" : @"AuthTokenEnabled",
             @"cacheNodeType" : @"CacheNodeType",
             @"clusterEnabled" : @"ClusterEnabled",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"globalNodeGroups" : @"GlobalNodeGroups",
             @"globalReplicationGroupDescription" : @"GlobalReplicationGroupDescription",
             @"globalReplicationGroupId" : @"GlobalReplicationGroupId",
             @"members" : @"Members",
             @"status" : @"Status",
             @"transitEncryptionEnabled" : @"TransitEncryptionEnabled",
             };
}

+ (NSValueTransformer *)globalNodeGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheGlobalNodeGroup class]];
}

+ (NSValueTransformer *)membersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheGlobalReplicationGroupMember class]];
}

@end

@implementation AWSElasticacheGlobalReplicationGroupInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalReplicationGroupId" : @"GlobalReplicationGroupId",
             @"globalReplicationGroupMemberRole" : @"GlobalReplicationGroupMemberRole",
             };
}

@end

@implementation AWSElasticacheGlobalReplicationGroupMember

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automaticFailover" : @"AutomaticFailover",
             @"replicationGroupId" : @"ReplicationGroupId",
             @"replicationGroupRegion" : @"ReplicationGroupRegion",
             @"role" : @"Role",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)automaticFailoverJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"enabled"] == NSOrderedSame) {
            return @(AWSElasticacheAutomaticFailoverStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"disabled"] == NSOrderedSame) {
            return @(AWSElasticacheAutomaticFailoverStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"enabling"] == NSOrderedSame) {
            return @(AWSElasticacheAutomaticFailoverStatusEnabling);
        }
        if ([value caseInsensitiveCompare:@"disabling"] == NSOrderedSame) {
            return @(AWSElasticacheAutomaticFailoverStatusDisabling);
        }
        return @(AWSElasticacheAutomaticFailoverStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheAutomaticFailoverStatusEnabled:
                return @"enabled";
            case AWSElasticacheAutomaticFailoverStatusDisabled:
                return @"disabled";
            case AWSElasticacheAutomaticFailoverStatusEnabling:
                return @"enabling";
            case AWSElasticacheAutomaticFailoverStatusDisabling:
                return @"disabling";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyImmediately" : @"ApplyImmediately",
             @"globalReplicationGroupId" : @"GlobalReplicationGroupId",
             @"nodeGroupCount" : @"NodeGroupCount",
             @"regionalConfigurations" : @"RegionalConfigurations",
             };
}

+ (NSValueTransformer *)regionalConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheRegionalConfiguration class]];
}

@end

@implementation AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalReplicationGroup" : @"GlobalReplicationGroup",
             };
}

+ (NSValueTransformer *)globalReplicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheGlobalReplicationGroup class]];
}

@end

@implementation AWSElasticacheIncreaseReplicaCountMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyImmediately" : @"ApplyImmediately",
             @"latestReplicaCount" : @"NewReplicaCount",
             @"replicaConfiguration" : @"ReplicaConfiguration",
             @"replicationGroupId" : @"ReplicationGroupId",
             };
}

+ (NSValueTransformer *)replicaConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheConfigureShard class]];
}

@end

@implementation AWSElasticacheIncreaseReplicaCountResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationGroup" : @"ReplicationGroup",
             };
}

+ (NSValueTransformer *)replicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheReplicationGroup class]];
}

@end

@implementation AWSElasticacheListAllowedNodeTypeModificationsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheClusterId" : @"CacheClusterId",
             @"replicationGroupId" : @"ReplicationGroupId",
             };
}

@end

@implementation AWSElasticacheListTagsForResourceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceName" : @"ResourceName",
             };
}

@end

@implementation AWSElasticacheModifyCacheClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"AZMode" : @"AZMode",
             @"applyImmediately" : @"ApplyImmediately",
             @"authToken" : @"AuthToken",
             @"authTokenUpdateStrategy" : @"AuthTokenUpdateStrategy",
             @"autoMinorVersionUpgrade" : @"AutoMinorVersionUpgrade",
             @"cacheClusterId" : @"CacheClusterId",
             @"cacheNodeIdsToRemove" : @"CacheNodeIdsToRemove",
             @"cacheNodeType" : @"CacheNodeType",
             @"cacheParameterGroupName" : @"CacheParameterGroupName",
             @"cacheSecurityGroupNames" : @"CacheSecurityGroupNames",
             @"engineVersion" : @"EngineVersion",
             @"latestAvailabilityZones" : @"NewAvailabilityZones",
             @"notificationTopicArn" : @"NotificationTopicArn",
             @"notificationTopicStatus" : @"NotificationTopicStatus",
             @"numCacheNodes" : @"NumCacheNodes",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"snapshotRetentionLimit" : @"SnapshotRetentionLimit",
             @"snapshotWindow" : @"SnapshotWindow",
             };
}

+ (NSValueTransformer *)AZModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"single-az"] == NSOrderedSame) {
            return @(AWSElasticacheAZModeSingleAz);
        }
        if ([value caseInsensitiveCompare:@"cross-az"] == NSOrderedSame) {
            return @(AWSElasticacheAZModeCrossAz);
        }
        return @(AWSElasticacheAZModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheAZModeSingleAz:
                return @"single-az";
            case AWSElasticacheAZModeCrossAz:
                return @"cross-az";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)authTokenUpdateStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SET"] == NSOrderedSame) {
            return @(AWSElasticacheAuthTokenUpdateStrategyTypeSet);
        }
        if ([value caseInsensitiveCompare:@"ROTATE"] == NSOrderedSame) {
            return @(AWSElasticacheAuthTokenUpdateStrategyTypeRotate);
        }
        return @(AWSElasticacheAuthTokenUpdateStrategyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheAuthTokenUpdateStrategyTypeSet:
                return @"SET";
            case AWSElasticacheAuthTokenUpdateStrategyTypeRotate:
                return @"ROTATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticacheModifyCacheClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheCluster" : @"CacheCluster",
             };
}

+ (NSValueTransformer *)cacheClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheCacheCluster class]];
}

@end

@implementation AWSElasticacheModifyCacheParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheParameterGroupName" : @"CacheParameterGroupName",
             @"parameterNameValues" : @"ParameterNameValues",
             };
}

+ (NSValueTransformer *)parameterNameValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheParameterNameValue class]];
}

@end

@implementation AWSElasticacheModifyCacheSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheSubnetGroupDescription" : @"CacheSubnetGroupDescription",
             @"cacheSubnetGroupName" : @"CacheSubnetGroupName",
             @"subnetIds" : @"SubnetIds",
             };
}

@end

@implementation AWSElasticacheModifyCacheSubnetGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheSubnetGroup" : @"CacheSubnetGroup",
             };
}

+ (NSValueTransformer *)cacheSubnetGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheCacheSubnetGroup class]];
}

@end

@implementation AWSElasticacheModifyGlobalReplicationGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyImmediately" : @"ApplyImmediately",
             @"automaticFailoverEnabled" : @"AutomaticFailoverEnabled",
             @"cacheNodeType" : @"CacheNodeType",
             @"engineVersion" : @"EngineVersion",
             @"globalReplicationGroupDescription" : @"GlobalReplicationGroupDescription",
             @"globalReplicationGroupId" : @"GlobalReplicationGroupId",
             };
}

@end

@implementation AWSElasticacheModifyGlobalReplicationGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalReplicationGroup" : @"GlobalReplicationGroup",
             };
}

+ (NSValueTransformer *)globalReplicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheGlobalReplicationGroup class]];
}

@end

@implementation AWSElasticacheModifyReplicationGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyImmediately" : @"ApplyImmediately",
             @"authToken" : @"AuthToken",
             @"authTokenUpdateStrategy" : @"AuthTokenUpdateStrategy",
             @"autoMinorVersionUpgrade" : @"AutoMinorVersionUpgrade",
             @"automaticFailoverEnabled" : @"AutomaticFailoverEnabled",
             @"cacheNodeType" : @"CacheNodeType",
             @"cacheParameterGroupName" : @"CacheParameterGroupName",
             @"cacheSecurityGroupNames" : @"CacheSecurityGroupNames",
             @"engineVersion" : @"EngineVersion",
             @"multiAZEnabled" : @"MultiAZEnabled",
             @"nodeGroupId" : @"NodeGroupId",
             @"notificationTopicArn" : @"NotificationTopicArn",
             @"notificationTopicStatus" : @"NotificationTopicStatus",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"primaryClusterId" : @"PrimaryClusterId",
             @"replicationGroupDescription" : @"ReplicationGroupDescription",
             @"replicationGroupId" : @"ReplicationGroupId",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"snapshotRetentionLimit" : @"SnapshotRetentionLimit",
             @"snapshotWindow" : @"SnapshotWindow",
             @"snapshottingClusterId" : @"SnapshottingClusterId",
             };
}

+ (NSValueTransformer *)authTokenUpdateStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SET"] == NSOrderedSame) {
            return @(AWSElasticacheAuthTokenUpdateStrategyTypeSet);
        }
        if ([value caseInsensitiveCompare:@"ROTATE"] == NSOrderedSame) {
            return @(AWSElasticacheAuthTokenUpdateStrategyTypeRotate);
        }
        return @(AWSElasticacheAuthTokenUpdateStrategyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheAuthTokenUpdateStrategyTypeSet:
                return @"SET";
            case AWSElasticacheAuthTokenUpdateStrategyTypeRotate:
                return @"ROTATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticacheModifyReplicationGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationGroup" : @"ReplicationGroup",
             };
}

+ (NSValueTransformer *)replicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheReplicationGroup class]];
}

@end

@implementation AWSElasticacheModifyReplicationGroupShardConfigurationMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyImmediately" : @"ApplyImmediately",
             @"nodeGroupCount" : @"NodeGroupCount",
             @"nodeGroupsToRemove" : @"NodeGroupsToRemove",
             @"nodeGroupsToRetain" : @"NodeGroupsToRetain",
             @"replicationGroupId" : @"ReplicationGroupId",
             @"reshardingConfiguration" : @"ReshardingConfiguration",
             };
}

+ (NSValueTransformer *)reshardingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheReshardingConfiguration class]];
}

@end

@implementation AWSElasticacheModifyReplicationGroupShardConfigurationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationGroup" : @"ReplicationGroup",
             };
}

+ (NSValueTransformer *)replicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheReplicationGroup class]];
}

@end

@implementation AWSElasticacheNodeGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nodeGroupId" : @"NodeGroupId",
             @"nodeGroupMembers" : @"NodeGroupMembers",
             @"primaryEndpoint" : @"PrimaryEndpoint",
             @"readerEndpoint" : @"ReaderEndpoint",
             @"slots" : @"Slots",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)nodeGroupMembersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheNodeGroupMember class]];
}

+ (NSValueTransformer *)primaryEndpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheEndpoint class]];
}

+ (NSValueTransformer *)readerEndpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheEndpoint class]];
}

@end

@implementation AWSElasticacheNodeGroupConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nodeGroupId" : @"NodeGroupId",
             @"primaryAvailabilityZone" : @"PrimaryAvailabilityZone",
             @"replicaAvailabilityZones" : @"ReplicaAvailabilityZones",
             @"replicaCount" : @"ReplicaCount",
             @"slots" : @"Slots",
             };
}

@end

@implementation AWSElasticacheNodeGroupMember

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheClusterId" : @"CacheClusterId",
             @"cacheNodeId" : @"CacheNodeId",
             @"currentRole" : @"CurrentRole",
             @"preferredAvailabilityZone" : @"PreferredAvailabilityZone",
             @"readEndpoint" : @"ReadEndpoint",
             };
}

+ (NSValueTransformer *)readEndpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheEndpoint class]];
}

@end

@implementation AWSElasticacheNodeGroupMemberUpdateStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheClusterId" : @"CacheClusterId",
             @"cacheNodeId" : @"CacheNodeId",
             @"nodeDeletionDate" : @"NodeDeletionDate",
             @"nodeUpdateEndDate" : @"NodeUpdateEndDate",
             @"nodeUpdateInitiatedBy" : @"NodeUpdateInitiatedBy",
             @"nodeUpdateInitiatedDate" : @"NodeUpdateInitiatedDate",
             @"nodeUpdateStartDate" : @"NodeUpdateStartDate",
             @"nodeUpdateStatus" : @"NodeUpdateStatus",
             @"nodeUpdateStatusModifiedDate" : @"NodeUpdateStatusModifiedDate",
             };
}

+ (NSValueTransformer *)nodeDeletionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)nodeUpdateEndDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)nodeUpdateInitiatedByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"system"] == NSOrderedSame) {
            return @(AWSElasticacheNodeUpdateInitiatedBySystem);
        }
        if ([value caseInsensitiveCompare:@"customer"] == NSOrderedSame) {
            return @(AWSElasticacheNodeUpdateInitiatedByCustomer);
        }
        return @(AWSElasticacheNodeUpdateInitiatedByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheNodeUpdateInitiatedBySystem:
                return @"system";
            case AWSElasticacheNodeUpdateInitiatedByCustomer:
                return @"customer";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)nodeUpdateInitiatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)nodeUpdateStartDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)nodeUpdateStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"not-applied"] == NSOrderedSame) {
            return @(AWSElasticacheNodeUpdateStatusNotApplied);
        }
        if ([value caseInsensitiveCompare:@"waiting-to-start"] == NSOrderedSame) {
            return @(AWSElasticacheNodeUpdateStatusWaitingToStart);
        }
        if ([value caseInsensitiveCompare:@"in-progress"] == NSOrderedSame) {
            return @(AWSElasticacheNodeUpdateStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"stopping"] == NSOrderedSame) {
            return @(AWSElasticacheNodeUpdateStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"stopped"] == NSOrderedSame) {
            return @(AWSElasticacheNodeUpdateStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"complete"] == NSOrderedSame) {
            return @(AWSElasticacheNodeUpdateStatusComplete);
        }
        return @(AWSElasticacheNodeUpdateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheNodeUpdateStatusNotApplied:
                return @"not-applied";
            case AWSElasticacheNodeUpdateStatusWaitingToStart:
                return @"waiting-to-start";
            case AWSElasticacheNodeUpdateStatusInProgress:
                return @"in-progress";
            case AWSElasticacheNodeUpdateStatusStopping:
                return @"stopping";
            case AWSElasticacheNodeUpdateStatusStopped:
                return @"stopped";
            case AWSElasticacheNodeUpdateStatusComplete:
                return @"complete";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)nodeUpdateStatusModifiedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSElasticacheNodeGroupUpdateStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nodeGroupId" : @"NodeGroupId",
             @"nodeGroupMemberUpdateStatus" : @"NodeGroupMemberUpdateStatus",
             };
}

+ (NSValueTransformer *)nodeGroupMemberUpdateStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheNodeGroupMemberUpdateStatus class]];
}

@end

@implementation AWSElasticacheNodeSnapshot

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheClusterId" : @"CacheClusterId",
             @"cacheNodeCreateTime" : @"CacheNodeCreateTime",
             @"cacheNodeId" : @"CacheNodeId",
             @"cacheSize" : @"CacheSize",
             @"nodeGroupConfiguration" : @"NodeGroupConfiguration",
             @"nodeGroupId" : @"NodeGroupId",
             @"snapshotCreateTime" : @"SnapshotCreateTime",
             };
}

+ (NSValueTransformer *)cacheNodeCreateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)nodeGroupConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheNodeGroupConfiguration class]];
}

+ (NSValueTransformer *)snapshotCreateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSElasticacheNotificationConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"topicArn" : @"TopicArn",
             @"topicStatus" : @"TopicStatus",
             };
}

@end

@implementation AWSElasticacheParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedValues" : @"AllowedValues",
             @"changeType" : @"ChangeType",
             @"dataType" : @"DataType",
             @"detail" : @"Description",
             @"isModifiable" : @"IsModifiable",
             @"minimumEngineVersion" : @"MinimumEngineVersion",
             @"parameterName" : @"ParameterName",
             @"parameterValue" : @"ParameterValue",
             @"source" : @"Source",
             };
}

+ (NSValueTransformer *)changeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"immediate"] == NSOrderedSame) {
            return @(AWSElasticacheChangeTypeImmediate);
        }
        if ([value caseInsensitiveCompare:@"requires-reboot"] == NSOrderedSame) {
            return @(AWSElasticacheChangeTypeRequiresReboot);
        }
        return @(AWSElasticacheChangeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheChangeTypeImmediate:
                return @"immediate";
            case AWSElasticacheChangeTypeRequiresReboot:
                return @"requires-reboot";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticacheParameterNameValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameterName" : @"ParameterName",
             @"parameterValue" : @"ParameterValue",
             };
}

@end

@implementation AWSElasticachePendingModifiedValues

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authTokenStatus" : @"AuthTokenStatus",
             @"cacheNodeIdsToRemove" : @"CacheNodeIdsToRemove",
             @"cacheNodeType" : @"CacheNodeType",
             @"engineVersion" : @"EngineVersion",
             @"numCacheNodes" : @"NumCacheNodes",
             };
}

+ (NSValueTransformer *)authTokenStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SETTING"] == NSOrderedSame) {
            return @(AWSElasticacheAuthTokenUpdateStatusSetting);
        }
        if ([value caseInsensitiveCompare:@"ROTATING"] == NSOrderedSame) {
            return @(AWSElasticacheAuthTokenUpdateStatusRotating);
        }
        return @(AWSElasticacheAuthTokenUpdateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheAuthTokenUpdateStatusSetting:
                return @"SETTING";
            case AWSElasticacheAuthTokenUpdateStatusRotating:
                return @"ROTATING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticacheProcessedUpdateAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheClusterId" : @"CacheClusterId",
             @"replicationGroupId" : @"ReplicationGroupId",
             @"serviceUpdateName" : @"ServiceUpdateName",
             @"updateActionStatus" : @"UpdateActionStatus",
             };
}

+ (NSValueTransformer *)updateActionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"not-applied"] == NSOrderedSame) {
            return @(AWSElasticacheUpdateActionStatusNotApplied);
        }
        if ([value caseInsensitiveCompare:@"waiting-to-start"] == NSOrderedSame) {
            return @(AWSElasticacheUpdateActionStatusWaitingToStart);
        }
        if ([value caseInsensitiveCompare:@"in-progress"] == NSOrderedSame) {
            return @(AWSElasticacheUpdateActionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"stopping"] == NSOrderedSame) {
            return @(AWSElasticacheUpdateActionStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"stopped"] == NSOrderedSame) {
            return @(AWSElasticacheUpdateActionStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"complete"] == NSOrderedSame) {
            return @(AWSElasticacheUpdateActionStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"scheduling"] == NSOrderedSame) {
            return @(AWSElasticacheUpdateActionStatusScheduling);
        }
        if ([value caseInsensitiveCompare:@"scheduled"] == NSOrderedSame) {
            return @(AWSElasticacheUpdateActionStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"not-applicable"] == NSOrderedSame) {
            return @(AWSElasticacheUpdateActionStatusNotApplicable);
        }
        return @(AWSElasticacheUpdateActionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheUpdateActionStatusNotApplied:
                return @"not-applied";
            case AWSElasticacheUpdateActionStatusWaitingToStart:
                return @"waiting-to-start";
            case AWSElasticacheUpdateActionStatusInProgress:
                return @"in-progress";
            case AWSElasticacheUpdateActionStatusStopping:
                return @"stopping";
            case AWSElasticacheUpdateActionStatusStopped:
                return @"stopped";
            case AWSElasticacheUpdateActionStatusComplete:
                return @"complete";
            case AWSElasticacheUpdateActionStatusScheduling:
                return @"scheduling";
            case AWSElasticacheUpdateActionStatusScheduled:
                return @"scheduled";
            case AWSElasticacheUpdateActionStatusNotApplicable:
                return @"not-applicable";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticachePurchaseReservedCacheNodesOfferingMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheNodeCount" : @"CacheNodeCount",
             @"reservedCacheNodeId" : @"ReservedCacheNodeId",
             @"reservedCacheNodesOfferingId" : @"ReservedCacheNodesOfferingId",
             };
}

@end

@implementation AWSElasticachePurchaseReservedCacheNodesOfferingResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedCacheNode" : @"ReservedCacheNode",
             };
}

+ (NSValueTransformer *)reservedCacheNodeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheReservedCacheNode class]];
}

@end

@implementation AWSElasticacheRebalanceSlotsInGlobalReplicationGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyImmediately" : @"ApplyImmediately",
             @"globalReplicationGroupId" : @"GlobalReplicationGroupId",
             };
}

@end

@implementation AWSElasticacheRebalanceSlotsInGlobalReplicationGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalReplicationGroup" : @"GlobalReplicationGroup",
             };
}

+ (NSValueTransformer *)globalReplicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheGlobalReplicationGroup class]];
}

@end

@implementation AWSElasticacheRebootCacheClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheClusterId" : @"CacheClusterId",
             @"cacheNodeIdsToReboot" : @"CacheNodeIdsToReboot",
             };
}

@end

@implementation AWSElasticacheRebootCacheClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheCluster" : @"CacheCluster",
             };
}

+ (NSValueTransformer *)cacheClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheCacheCluster class]];
}

@end

@implementation AWSElasticacheRecurringCharge

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recurringChargeAmount" : @"RecurringChargeAmount",
             @"recurringChargeFrequency" : @"RecurringChargeFrequency",
             };
}

@end

@implementation AWSElasticacheRegionalConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationGroupId" : @"ReplicationGroupId",
             @"replicationGroupRegion" : @"ReplicationGroupRegion",
             @"reshardingConfiguration" : @"ReshardingConfiguration",
             };
}

+ (NSValueTransformer *)reshardingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheReshardingConfiguration class]];
}

@end

@implementation AWSElasticacheRemoveTagsFromResourceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceName" : @"ResourceName",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSElasticacheReplicationGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"atRestEncryptionEnabled" : @"AtRestEncryptionEnabled",
             @"authTokenEnabled" : @"AuthTokenEnabled",
             @"authTokenLastModifiedDate" : @"AuthTokenLastModifiedDate",
             @"automaticFailover" : @"AutomaticFailover",
             @"cacheNodeType" : @"CacheNodeType",
             @"clusterEnabled" : @"ClusterEnabled",
             @"configurationEndpoint" : @"ConfigurationEndpoint",
             @"detail" : @"Description",
             @"globalReplicationGroupInfo" : @"GlobalReplicationGroupInfo",
             @"kmsKeyId" : @"KmsKeyId",
             @"memberClusters" : @"MemberClusters",
             @"multiAZ" : @"MultiAZ",
             @"nodeGroups" : @"NodeGroups",
             @"pendingModifiedValues" : @"PendingModifiedValues",
             @"replicationGroupId" : @"ReplicationGroupId",
             @"snapshotRetentionLimit" : @"SnapshotRetentionLimit",
             @"snapshotWindow" : @"SnapshotWindow",
             @"snapshottingClusterId" : @"SnapshottingClusterId",
             @"status" : @"Status",
             @"transitEncryptionEnabled" : @"TransitEncryptionEnabled",
             };
}

+ (NSValueTransformer *)authTokenLastModifiedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)automaticFailoverJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"enabled"] == NSOrderedSame) {
            return @(AWSElasticacheAutomaticFailoverStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"disabled"] == NSOrderedSame) {
            return @(AWSElasticacheAutomaticFailoverStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"enabling"] == NSOrderedSame) {
            return @(AWSElasticacheAutomaticFailoverStatusEnabling);
        }
        if ([value caseInsensitiveCompare:@"disabling"] == NSOrderedSame) {
            return @(AWSElasticacheAutomaticFailoverStatusDisabling);
        }
        return @(AWSElasticacheAutomaticFailoverStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheAutomaticFailoverStatusEnabled:
                return @"enabled";
            case AWSElasticacheAutomaticFailoverStatusDisabled:
                return @"disabled";
            case AWSElasticacheAutomaticFailoverStatusEnabling:
                return @"enabling";
            case AWSElasticacheAutomaticFailoverStatusDisabling:
                return @"disabling";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)configurationEndpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheEndpoint class]];
}

+ (NSValueTransformer *)globalReplicationGroupInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheGlobalReplicationGroupInfo class]];
}

+ (NSValueTransformer *)multiAZJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"enabled"] == NSOrderedSame) {
            return @(AWSElasticacheMultiAZStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"disabled"] == NSOrderedSame) {
            return @(AWSElasticacheMultiAZStatusDisabled);
        }
        return @(AWSElasticacheMultiAZStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheMultiAZStatusEnabled:
                return @"enabled";
            case AWSElasticacheMultiAZStatusDisabled:
                return @"disabled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)nodeGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheNodeGroup class]];
}

+ (NSValueTransformer *)pendingModifiedValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheReplicationGroupPendingModifiedValues class]];
}

@end

@implementation AWSElasticacheReplicationGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"replicationGroups" : @"ReplicationGroups",
             };
}

+ (NSValueTransformer *)replicationGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheReplicationGroup class]];
}

@end

@implementation AWSElasticacheReplicationGroupPendingModifiedValues

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authTokenStatus" : @"AuthTokenStatus",
             @"automaticFailoverStatus" : @"AutomaticFailoverStatus",
             @"primaryClusterId" : @"PrimaryClusterId",
             @"resharding" : @"Resharding",
             };
}

+ (NSValueTransformer *)authTokenStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SETTING"] == NSOrderedSame) {
            return @(AWSElasticacheAuthTokenUpdateStatusSetting);
        }
        if ([value caseInsensitiveCompare:@"ROTATING"] == NSOrderedSame) {
            return @(AWSElasticacheAuthTokenUpdateStatusRotating);
        }
        return @(AWSElasticacheAuthTokenUpdateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheAuthTokenUpdateStatusSetting:
                return @"SETTING";
            case AWSElasticacheAuthTokenUpdateStatusRotating:
                return @"ROTATING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)automaticFailoverStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"enabled"] == NSOrderedSame) {
            return @(AWSElasticachePendingAutomaticFailoverStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"disabled"] == NSOrderedSame) {
            return @(AWSElasticachePendingAutomaticFailoverStatusDisabled);
        }
        return @(AWSElasticachePendingAutomaticFailoverStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticachePendingAutomaticFailoverStatusEnabled:
                return @"enabled";
            case AWSElasticachePendingAutomaticFailoverStatusDisabled:
                return @"disabled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)reshardingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheReshardingStatus class]];
}

@end

@implementation AWSElasticacheReservedCacheNode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheNodeCount" : @"CacheNodeCount",
             @"cacheNodeType" : @"CacheNodeType",
             @"duration" : @"Duration",
             @"fixedPrice" : @"FixedPrice",
             @"offeringType" : @"OfferingType",
             @"productDescription" : @"ProductDescription",
             @"recurringCharges" : @"RecurringCharges",
             @"reservationARN" : @"ReservationARN",
             @"reservedCacheNodeId" : @"ReservedCacheNodeId",
             @"reservedCacheNodesOfferingId" : @"ReservedCacheNodesOfferingId",
             @"startTime" : @"StartTime",
             @"state" : @"State",
             @"usagePrice" : @"UsagePrice",
             };
}

+ (NSValueTransformer *)recurringChargesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheRecurringCharge class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSElasticacheReservedCacheNodeMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"reservedCacheNodes" : @"ReservedCacheNodes",
             };
}

+ (NSValueTransformer *)reservedCacheNodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheReservedCacheNode class]];
}

@end

@implementation AWSElasticacheReservedCacheNodesOffering

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheNodeType" : @"CacheNodeType",
             @"duration" : @"Duration",
             @"fixedPrice" : @"FixedPrice",
             @"offeringType" : @"OfferingType",
             @"productDescription" : @"ProductDescription",
             @"recurringCharges" : @"RecurringCharges",
             @"reservedCacheNodesOfferingId" : @"ReservedCacheNodesOfferingId",
             @"usagePrice" : @"UsagePrice",
             };
}

+ (NSValueTransformer *)recurringChargesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheRecurringCharge class]];
}

@end

@implementation AWSElasticacheReservedCacheNodesOfferingMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"reservedCacheNodesOfferings" : @"ReservedCacheNodesOfferings",
             };
}

+ (NSValueTransformer *)reservedCacheNodesOfferingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheReservedCacheNodesOffering class]];
}

@end

@implementation AWSElasticacheResetCacheParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheParameterGroupName" : @"CacheParameterGroupName",
             @"parameterNameValues" : @"ParameterNameValues",
             @"resetAllParameters" : @"ResetAllParameters",
             };
}

+ (NSValueTransformer *)parameterNameValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheParameterNameValue class]];
}

@end

@implementation AWSElasticacheReshardingConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nodeGroupId" : @"NodeGroupId",
             @"preferredAvailabilityZones" : @"PreferredAvailabilityZones",
             };
}

@end

@implementation AWSElasticacheReshardingStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"slotMigration" : @"SlotMigration",
             };
}

+ (NSValueTransformer *)slotMigrationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheSlotMigration class]];
}

@end

@implementation AWSElasticacheRevokeCacheSecurityGroupIngressMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheSecurityGroupName" : @"CacheSecurityGroupName",
             @"EC2SecurityGroupName" : @"EC2SecurityGroupName",
             @"EC2SecurityGroupOwnerId" : @"EC2SecurityGroupOwnerId",
             };
}

@end

@implementation AWSElasticacheRevokeCacheSecurityGroupIngressResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheSecurityGroup" : @"CacheSecurityGroup",
             };
}

+ (NSValueTransformer *)cacheSecurityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheCacheSecurityGroup class]];
}

@end

@implementation AWSElasticacheSecurityGroupMembership

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupId" : @"SecurityGroupId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSElasticacheServiceUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoUpdateAfterRecommendedApplyByDate" : @"AutoUpdateAfterRecommendedApplyByDate",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"estimatedUpdateTime" : @"EstimatedUpdateTime",
             @"serviceUpdateDescription" : @"ServiceUpdateDescription",
             @"serviceUpdateEndDate" : @"ServiceUpdateEndDate",
             @"serviceUpdateName" : @"ServiceUpdateName",
             @"serviceUpdateRecommendedApplyByDate" : @"ServiceUpdateRecommendedApplyByDate",
             @"serviceUpdateReleaseDate" : @"ServiceUpdateReleaseDate",
             @"serviceUpdateSeverity" : @"ServiceUpdateSeverity",
             @"serviceUpdateStatus" : @"ServiceUpdateStatus",
             @"serviceUpdateType" : @"ServiceUpdateType",
             };
}

+ (NSValueTransformer *)serviceUpdateEndDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)serviceUpdateRecommendedApplyByDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)serviceUpdateReleaseDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)serviceUpdateSeverityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"critical"] == NSOrderedSame) {
            return @(AWSElasticacheServiceUpdateSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"important"] == NSOrderedSame) {
            return @(AWSElasticacheServiceUpdateSeverityImportant);
        }
        if ([value caseInsensitiveCompare:@"medium"] == NSOrderedSame) {
            return @(AWSElasticacheServiceUpdateSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"low"] == NSOrderedSame) {
            return @(AWSElasticacheServiceUpdateSeverityLow);
        }
        return @(AWSElasticacheServiceUpdateSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheServiceUpdateSeverityCritical:
                return @"critical";
            case AWSElasticacheServiceUpdateSeverityImportant:
                return @"important";
            case AWSElasticacheServiceUpdateSeverityMedium:
                return @"medium";
            case AWSElasticacheServiceUpdateSeverityLow:
                return @"low";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceUpdateStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSElasticacheServiceUpdateStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"cancelled"] == NSOrderedSame) {
            return @(AWSElasticacheServiceUpdateStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"expired"] == NSOrderedSame) {
            return @(AWSElasticacheServiceUpdateStatusExpired);
        }
        return @(AWSElasticacheServiceUpdateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheServiceUpdateStatusAvailable:
                return @"available";
            case AWSElasticacheServiceUpdateStatusCancelled:
                return @"cancelled";
            case AWSElasticacheServiceUpdateStatusExpired:
                return @"expired";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceUpdateTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"security-update"] == NSOrderedSame) {
            return @(AWSElasticacheServiceUpdateTypeSecurityUpdate);
        }
        return @(AWSElasticacheServiceUpdateTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheServiceUpdateTypeSecurityUpdate:
                return @"security-update";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticacheServiceUpdatesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"serviceUpdates" : @"ServiceUpdates",
             };
}

+ (NSValueTransformer *)serviceUpdatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheServiceUpdate class]];
}

@end

@implementation AWSElasticacheSlotMigration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"progressPercentage" : @"ProgressPercentage",
             };
}

@end

@implementation AWSElasticacheSnapshot

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"autoMinorVersionUpgrade" : @"AutoMinorVersionUpgrade",
             @"automaticFailover" : @"AutomaticFailover",
             @"cacheClusterCreateTime" : @"CacheClusterCreateTime",
             @"cacheClusterId" : @"CacheClusterId",
             @"cacheNodeType" : @"CacheNodeType",
             @"cacheParameterGroupName" : @"CacheParameterGroupName",
             @"cacheSubnetGroupName" : @"CacheSubnetGroupName",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"kmsKeyId" : @"KmsKeyId",
             @"nodeSnapshots" : @"NodeSnapshots",
             @"numCacheNodes" : @"NumCacheNodes",
             @"numNodeGroups" : @"NumNodeGroups",
             @"port" : @"Port",
             @"preferredAvailabilityZone" : @"PreferredAvailabilityZone",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"replicationGroupDescription" : @"ReplicationGroupDescription",
             @"replicationGroupId" : @"ReplicationGroupId",
             @"snapshotName" : @"SnapshotName",
             @"snapshotRetentionLimit" : @"SnapshotRetentionLimit",
             @"snapshotSource" : @"SnapshotSource",
             @"snapshotStatus" : @"SnapshotStatus",
             @"snapshotWindow" : @"SnapshotWindow",
             @"topicArn" : @"TopicArn",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)automaticFailoverJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"enabled"] == NSOrderedSame) {
            return @(AWSElasticacheAutomaticFailoverStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"disabled"] == NSOrderedSame) {
            return @(AWSElasticacheAutomaticFailoverStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"enabling"] == NSOrderedSame) {
            return @(AWSElasticacheAutomaticFailoverStatusEnabling);
        }
        if ([value caseInsensitiveCompare:@"disabling"] == NSOrderedSame) {
            return @(AWSElasticacheAutomaticFailoverStatusDisabling);
        }
        return @(AWSElasticacheAutomaticFailoverStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheAutomaticFailoverStatusEnabled:
                return @"enabled";
            case AWSElasticacheAutomaticFailoverStatusDisabled:
                return @"disabled";
            case AWSElasticacheAutomaticFailoverStatusEnabling:
                return @"enabling";
            case AWSElasticacheAutomaticFailoverStatusDisabling:
                return @"disabling";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)cacheClusterCreateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)nodeSnapshotsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheNodeSnapshot class]];
}

@end

@implementation AWSElasticacheStartMigrationMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customerNodeEndpointList" : @"CustomerNodeEndpointList",
             @"replicationGroupId" : @"ReplicationGroupId",
             };
}

+ (NSValueTransformer *)customerNodeEndpointListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheCustomerNodeEndpoint class]];
}

@end

@implementation AWSElasticacheStartMigrationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationGroup" : @"ReplicationGroup",
             };
}

+ (NSValueTransformer *)replicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheReplicationGroup class]];
}

@end

@implementation AWSElasticacheSubnet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subnetAvailabilityZone" : @"SubnetAvailabilityZone",
             @"subnetIdentifier" : @"SubnetIdentifier",
             };
}

+ (NSValueTransformer *)subnetAvailabilityZoneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheAvailabilityZone class]];
}

@end

@implementation AWSElasticacheTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSElasticacheTagListMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagList" : @"TagList",
             };
}

+ (NSValueTransformer *)tagListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheTag class]];
}

@end

@implementation AWSElasticacheTestFailoverMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nodeGroupId" : @"NodeGroupId",
             @"replicationGroupId" : @"ReplicationGroupId",
             };
}

@end

@implementation AWSElasticacheTestFailoverResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicationGroup" : @"ReplicationGroup",
             };
}

+ (NSValueTransformer *)replicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticacheReplicationGroup class]];
}

@end

@implementation AWSElasticacheTimeRangeFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSElasticacheUnprocessedUpdateAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheClusterId" : @"CacheClusterId",
             @"errorMessage" : @"ErrorMessage",
             @"errorType" : @"ErrorType",
             @"replicationGroupId" : @"ReplicationGroupId",
             @"serviceUpdateName" : @"ServiceUpdateName",
             };
}

@end

@implementation AWSElasticacheUpdateAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheClusterId" : @"CacheClusterId",
             @"cacheNodeUpdateStatus" : @"CacheNodeUpdateStatus",
             @"engine" : @"Engine",
             @"estimatedUpdateTime" : @"EstimatedUpdateTime",
             @"nodeGroupUpdateStatus" : @"NodeGroupUpdateStatus",
             @"nodesUpdated" : @"NodesUpdated",
             @"replicationGroupId" : @"ReplicationGroupId",
             @"serviceUpdateName" : @"ServiceUpdateName",
             @"serviceUpdateRecommendedApplyByDate" : @"ServiceUpdateRecommendedApplyByDate",
             @"serviceUpdateReleaseDate" : @"ServiceUpdateReleaseDate",
             @"serviceUpdateSeverity" : @"ServiceUpdateSeverity",
             @"serviceUpdateStatus" : @"ServiceUpdateStatus",
             @"serviceUpdateType" : @"ServiceUpdateType",
             @"slaMet" : @"SlaMet",
             @"updateActionAvailableDate" : @"UpdateActionAvailableDate",
             @"updateActionStatus" : @"UpdateActionStatus",
             @"updateActionStatusModifiedDate" : @"UpdateActionStatusModifiedDate",
             };
}

+ (NSValueTransformer *)cacheNodeUpdateStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheCacheNodeUpdateStatus class]];
}

+ (NSValueTransformer *)nodeGroupUpdateStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheNodeGroupUpdateStatus class]];
}

+ (NSValueTransformer *)serviceUpdateRecommendedApplyByDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)serviceUpdateReleaseDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)serviceUpdateSeverityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"critical"] == NSOrderedSame) {
            return @(AWSElasticacheServiceUpdateSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"important"] == NSOrderedSame) {
            return @(AWSElasticacheServiceUpdateSeverityImportant);
        }
        if ([value caseInsensitiveCompare:@"medium"] == NSOrderedSame) {
            return @(AWSElasticacheServiceUpdateSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"low"] == NSOrderedSame) {
            return @(AWSElasticacheServiceUpdateSeverityLow);
        }
        return @(AWSElasticacheServiceUpdateSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheServiceUpdateSeverityCritical:
                return @"critical";
            case AWSElasticacheServiceUpdateSeverityImportant:
                return @"important";
            case AWSElasticacheServiceUpdateSeverityMedium:
                return @"medium";
            case AWSElasticacheServiceUpdateSeverityLow:
                return @"low";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceUpdateStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSElasticacheServiceUpdateStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"cancelled"] == NSOrderedSame) {
            return @(AWSElasticacheServiceUpdateStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"expired"] == NSOrderedSame) {
            return @(AWSElasticacheServiceUpdateStatusExpired);
        }
        return @(AWSElasticacheServiceUpdateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheServiceUpdateStatusAvailable:
                return @"available";
            case AWSElasticacheServiceUpdateStatusCancelled:
                return @"cancelled";
            case AWSElasticacheServiceUpdateStatusExpired:
                return @"expired";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceUpdateTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"security-update"] == NSOrderedSame) {
            return @(AWSElasticacheServiceUpdateTypeSecurityUpdate);
        }
        return @(AWSElasticacheServiceUpdateTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheServiceUpdateTypeSecurityUpdate:
                return @"security-update";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)slaMetJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"yes"] == NSOrderedSame) {
            return @(AWSElasticacheSlaMetYes);
        }
        if ([value caseInsensitiveCompare:@"no"] == NSOrderedSame) {
            return @(AWSElasticacheSlaMetNo);
        }
        if ([value caseInsensitiveCompare:@"n/a"] == NSOrderedSame) {
            return @(AWSElasticacheSlaMetNA);
        }
        return @(AWSElasticacheSlaMetUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheSlaMetYes:
                return @"yes";
            case AWSElasticacheSlaMetNo:
                return @"no";
            case AWSElasticacheSlaMetNA:
                return @"n/a";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)updateActionAvailableDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)updateActionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"not-applied"] == NSOrderedSame) {
            return @(AWSElasticacheUpdateActionStatusNotApplied);
        }
        if ([value caseInsensitiveCompare:@"waiting-to-start"] == NSOrderedSame) {
            return @(AWSElasticacheUpdateActionStatusWaitingToStart);
        }
        if ([value caseInsensitiveCompare:@"in-progress"] == NSOrderedSame) {
            return @(AWSElasticacheUpdateActionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"stopping"] == NSOrderedSame) {
            return @(AWSElasticacheUpdateActionStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"stopped"] == NSOrderedSame) {
            return @(AWSElasticacheUpdateActionStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"complete"] == NSOrderedSame) {
            return @(AWSElasticacheUpdateActionStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"scheduling"] == NSOrderedSame) {
            return @(AWSElasticacheUpdateActionStatusScheduling);
        }
        if ([value caseInsensitiveCompare:@"scheduled"] == NSOrderedSame) {
            return @(AWSElasticacheUpdateActionStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"not-applicable"] == NSOrderedSame) {
            return @(AWSElasticacheUpdateActionStatusNotApplicable);
        }
        return @(AWSElasticacheUpdateActionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticacheUpdateActionStatusNotApplied:
                return @"not-applied";
            case AWSElasticacheUpdateActionStatusWaitingToStart:
                return @"waiting-to-start";
            case AWSElasticacheUpdateActionStatusInProgress:
                return @"in-progress";
            case AWSElasticacheUpdateActionStatusStopping:
                return @"stopping";
            case AWSElasticacheUpdateActionStatusStopped:
                return @"stopped";
            case AWSElasticacheUpdateActionStatusComplete:
                return @"complete";
            case AWSElasticacheUpdateActionStatusScheduling:
                return @"scheduling";
            case AWSElasticacheUpdateActionStatusScheduled:
                return @"scheduled";
            case AWSElasticacheUpdateActionStatusNotApplicable:
                return @"not-applicable";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)updateActionStatusModifiedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSElasticacheUpdateActionResultsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"processedUpdateActions" : @"ProcessedUpdateActions",
             @"unprocessedUpdateActions" : @"UnprocessedUpdateActions",
             };
}

+ (NSValueTransformer *)processedUpdateActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheProcessedUpdateAction class]];
}

+ (NSValueTransformer *)unprocessedUpdateActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheUnprocessedUpdateAction class]];
}

@end

@implementation AWSElasticacheUpdateActionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"updateActions" : @"UpdateActions",
             };
}

+ (NSValueTransformer *)updateActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticacheUpdateAction class]];
}

@end
