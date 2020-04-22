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

#import "AWSredshiftModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSredshiftErrorDomain = @"com.amazonaws.AWSredshiftErrorDomain";

@implementation AWSredshiftAcceptReservedNodeExchangeInputMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedNodeId" : @"ReservedNodeId",
             @"targetReservedNodeOfferingId" : @"TargetReservedNodeOfferingId",
             };
}

@end

@implementation AWSredshiftAcceptReservedNodeExchangeOutputMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exchangedReservedNode" : @"ExchangedReservedNode",
             };
}

+ (NSValueTransformer *)exchangedReservedNodeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftReservedNode class]];
}

@end

@implementation AWSredshiftAccountAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"attributeValues" : @"AttributeValues",
             };
}

+ (NSValueTransformer *)attributeValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftAttributeValueTarget class]];
}

@end

@implementation AWSredshiftAccountAttributeList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountAttributes" : @"AccountAttributes",
             };
}

+ (NSValueTransformer *)accountAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftAccountAttribute class]];
}

@end

@implementation AWSredshiftAccountWithRestoreAccess

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountAlias" : @"AccountAlias",
             @"accountId" : @"AccountId",
             };
}

@end

@implementation AWSredshiftAttributeValueTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeValue" : @"AttributeValue",
             };
}

@end

@implementation AWSredshiftAuthorizeClusterSecurityGroupIngressMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"CIDRIP" : @"CIDRIP",
             @"clusterSecurityGroupName" : @"ClusterSecurityGroupName",
             @"EC2SecurityGroupName" : @"EC2SecurityGroupName",
             @"EC2SecurityGroupOwnerId" : @"EC2SecurityGroupOwnerId",
             };
}

@end

@implementation AWSredshiftAuthorizeClusterSecurityGroupIngressResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterSecurityGroup" : @"ClusterSecurityGroup",
             };
}

+ (NSValueTransformer *)clusterSecurityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftClusterSecurityGroup class]];
}

@end

@implementation AWSredshiftAuthorizeSnapshotAccessMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountWithRestoreAccess" : @"AccountWithRestoreAccess",
             @"snapshotClusterIdentifier" : @"SnapshotClusterIdentifier",
             @"snapshotIdentifier" : @"SnapshotIdentifier",
             };
}

@end

@implementation AWSredshiftAuthorizeSnapshotAccessResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshot" : @"Snapshot",
             };
}

+ (NSValueTransformer *)snapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftSnapshot class]];
}

@end

@implementation AWSredshiftAvailabilityZone

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"supportedPlatforms" : @"SupportedPlatforms",
             };
}

+ (NSValueTransformer *)supportedPlatformsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftSupportedPlatform class]];
}

@end

@implementation AWSredshiftBatchDeleteClusterSnapshotsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifiers" : @"Identifiers",
             };
}

+ (NSValueTransformer *)identifiersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftDeleteClusterSnapshotMessage class]];
}

@end

@implementation AWSredshiftBatchDeleteClusterSnapshotsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             @"resources" : @"Resources",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftSnapshotErrorMessage class]];
}

@end

@implementation AWSredshiftBatchModifyClusterSnapshotsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"force" : @"Force",
             @"manualSnapshotRetentionPeriod" : @"ManualSnapshotRetentionPeriod",
             @"snapshotIdentifierList" : @"SnapshotIdentifierList",
             };
}

@end

@implementation AWSredshiftBatchModifyClusterSnapshotsOutputMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             @"resources" : @"Resources",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftSnapshotErrorMessage class]];
}

@end

@implementation AWSredshiftCancelResizeMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             };
}

@end

@implementation AWSredshiftCluster

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowVersionUpgrade" : @"AllowVersionUpgrade",
             @"automatedSnapshotRetentionPeriod" : @"AutomatedSnapshotRetentionPeriod",
             @"availabilityZone" : @"AvailabilityZone",
             @"clusterAvailabilityStatus" : @"ClusterAvailabilityStatus",
             @"clusterCreateTime" : @"ClusterCreateTime",
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"clusterNodes" : @"ClusterNodes",
             @"clusterParameterGroups" : @"ClusterParameterGroups",
             @"clusterPublicKey" : @"ClusterPublicKey",
             @"clusterRevisionNumber" : @"ClusterRevisionNumber",
             @"clusterSecurityGroups" : @"ClusterSecurityGroups",
             @"clusterSnapshotCopyStatus" : @"ClusterSnapshotCopyStatus",
             @"clusterStatus" : @"ClusterStatus",
             @"clusterSubnetGroupName" : @"ClusterSubnetGroupName",
             @"clusterVersion" : @"ClusterVersion",
             @"DBName" : @"DBName",
             @"dataTransferProgress" : @"DataTransferProgress",
             @"deferredMaintenanceWindows" : @"DeferredMaintenanceWindows",
             @"elasticIpStatus" : @"ElasticIpStatus",
             @"elasticResizeNumberOfNodeOptions" : @"ElasticResizeNumberOfNodeOptions",
             @"encrypted" : @"Encrypted",
             @"endpoint" : @"Endpoint",
             @"enhancedVpcRouting" : @"EnhancedVpcRouting",
             @"expectedNextSnapshotScheduleTime" : @"ExpectedNextSnapshotScheduleTime",
             @"expectedNextSnapshotScheduleTimeStatus" : @"ExpectedNextSnapshotScheduleTimeStatus",
             @"hsmStatus" : @"HsmStatus",
             @"iamRoles" : @"IamRoles",
             @"kmsKeyId" : @"KmsKeyId",
             @"maintenanceTrackName" : @"MaintenanceTrackName",
             @"manualSnapshotRetentionPeriod" : @"ManualSnapshotRetentionPeriod",
             @"masterUsername" : @"MasterUsername",
             @"modifyStatus" : @"ModifyStatus",
             @"nextMaintenanceWindowStartTime" : @"NextMaintenanceWindowStartTime",
             @"nodeType" : @"NodeType",
             @"numberOfNodes" : @"NumberOfNodes",
             @"pendingActions" : @"PendingActions",
             @"pendingModifiedValues" : @"PendingModifiedValues",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"publiclyAccessible" : @"PubliclyAccessible",
             @"resizeInfo" : @"ResizeInfo",
             @"restoreStatus" : @"RestoreStatus",
             @"snapshotScheduleIdentifier" : @"SnapshotScheduleIdentifier",
             @"snapshotScheduleState" : @"SnapshotScheduleState",
             @"tags" : @"Tags",
             @"vpcId" : @"VpcId",
             @"vpcSecurityGroups" : @"VpcSecurityGroups",
             };
}

+ (NSValueTransformer *)clusterCreateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)clusterNodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftClusterNode class]];
}

+ (NSValueTransformer *)clusterParameterGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftClusterParameterGroupStatus class]];
}

+ (NSValueTransformer *)clusterSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftClusterSecurityGroupMembership class]];
}

+ (NSValueTransformer *)clusterSnapshotCopyStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftClusterSnapshotCopyStatus class]];
}

+ (NSValueTransformer *)dataTransferProgressJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftDataTransferProgress class]];
}

+ (NSValueTransformer *)deferredMaintenanceWindowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftDeferredMaintenanceWindow class]];
}

+ (NSValueTransformer *)elasticIpStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftElasticIpStatus class]];
}

+ (NSValueTransformer *)endpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftEndpoint class]];
}

+ (NSValueTransformer *)expectedNextSnapshotScheduleTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)hsmStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftHsmStatus class]];
}

+ (NSValueTransformer *)iamRolesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftClusterIamRole class]];
}

+ (NSValueTransformer *)nextMaintenanceWindowStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)pendingModifiedValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftPendingModifiedValues class]];
}

+ (NSValueTransformer *)resizeInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftResizeInfo class]];
}

+ (NSValueTransformer *)restoreStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftRestoreStatus class]];
}

+ (NSValueTransformer *)snapshotScheduleStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MODIFYING"] == NSOrderedSame) {
            return @(AWSredshiftScheduleStateModifying);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSredshiftScheduleStateActive);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSredshiftScheduleStateFailed);
        }
        return @(AWSredshiftScheduleStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftScheduleStateModifying:
                return @"MODIFYING";
            case AWSredshiftScheduleStateActive:
                return @"ACTIVE";
            case AWSredshiftScheduleStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

+ (NSValueTransformer *)vpcSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftVpcSecurityGroupMembership class]];
}

@end

@implementation AWSredshiftClusterAssociatedToSchedule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"scheduleAssociationState" : @"ScheduleAssociationState",
             };
}

+ (NSValueTransformer *)scheduleAssociationStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MODIFYING"] == NSOrderedSame) {
            return @(AWSredshiftScheduleStateModifying);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSredshiftScheduleStateActive);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSredshiftScheduleStateFailed);
        }
        return @(AWSredshiftScheduleStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftScheduleStateModifying:
                return @"MODIFYING";
            case AWSredshiftScheduleStateActive:
                return @"ACTIVE";
            case AWSredshiftScheduleStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSredshiftClusterCredentials

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dbPassword" : @"DbPassword",
             @"dbUser" : @"DbUser",
             @"expiration" : @"Expiration",
             };
}

+ (NSValueTransformer *)expirationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSredshiftClusterDbRevision

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"currentDatabaseRevision" : @"CurrentDatabaseRevision",
             @"databaseRevisionReleaseDate" : @"DatabaseRevisionReleaseDate",
             @"revisionTargets" : @"RevisionTargets",
             };
}

+ (NSValueTransformer *)databaseRevisionReleaseDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)revisionTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftRevisionTarget class]];
}

@end

@implementation AWSredshiftClusterDbRevisionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterDbRevisions" : @"ClusterDbRevisions",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)clusterDbRevisionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftClusterDbRevision class]];
}

@end

@implementation AWSredshiftClusterIamRole

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyStatus" : @"ApplyStatus",
             @"iamRoleArn" : @"IamRoleArn",
             };
}

@end

@implementation AWSredshiftClusterNode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nodeRole" : @"NodeRole",
             @"privateIPAddress" : @"PrivateIPAddress",
             @"publicIPAddress" : @"PublicIPAddress",
             };
}

@end

@implementation AWSredshiftClusterParameterGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"parameterGroupFamily" : @"ParameterGroupFamily",
             @"parameterGroupName" : @"ParameterGroupName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftClusterParameterGroupDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftParameter class]];
}

@end

@implementation AWSredshiftClusterParameterGroupNameMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameterGroupName" : @"ParameterGroupName",
             @"parameterGroupStatus" : @"ParameterGroupStatus",
             };
}

@end

@implementation AWSredshiftClusterParameterGroupStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterParameterStatusList" : @"ClusterParameterStatusList",
             @"parameterApplyStatus" : @"ParameterApplyStatus",
             @"parameterGroupName" : @"ParameterGroupName",
             };
}

+ (NSValueTransformer *)clusterParameterStatusListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftClusterParameterStatus class]];
}

@end

@implementation AWSredshiftClusterParameterGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"parameterGroups" : @"ParameterGroups",
             };
}

+ (NSValueTransformer *)parameterGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftClusterParameterGroup class]];
}

@end

@implementation AWSredshiftClusterParameterStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameterApplyErrorDescription" : @"ParameterApplyErrorDescription",
             @"parameterApplyStatus" : @"ParameterApplyStatus",
             @"parameterName" : @"ParameterName",
             };
}

@end

@implementation AWSredshiftClusterSecurityGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterSecurityGroupName" : @"ClusterSecurityGroupName",
             @"detail" : @"Description",
             @"EC2SecurityGroups" : @"EC2SecurityGroups",
             @"IPRanges" : @"IPRanges",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)EC2SecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftEC2SecurityGroup class]];
}

+ (NSValueTransformer *)IPRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftIPRange class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftClusterSecurityGroupMembership

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterSecurityGroupName" : @"ClusterSecurityGroupName",
             @"status" : @"Status",
             };
}

@end

@implementation AWSredshiftClusterSecurityGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterSecurityGroups" : @"ClusterSecurityGroups",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)clusterSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftClusterSecurityGroup class]];
}

@end

@implementation AWSredshiftClusterSnapshotCopyStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationRegion" : @"DestinationRegion",
             @"manualSnapshotRetentionPeriod" : @"ManualSnapshotRetentionPeriod",
             @"retentionPeriod" : @"RetentionPeriod",
             @"snapshotCopyGrantName" : @"SnapshotCopyGrantName",
             };
}

@end

@implementation AWSredshiftClusterSubnetGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterSubnetGroupName" : @"ClusterSubnetGroupName",
             @"detail" : @"Description",
             @"subnetGroupStatus" : @"SubnetGroupStatus",
             @"subnets" : @"Subnets",
             @"tags" : @"Tags",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)subnetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftSubnet class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftClusterSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterSubnetGroups" : @"ClusterSubnetGroups",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)clusterSubnetGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftClusterSubnetGroup class]];
}

@end

@implementation AWSredshiftClusterVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterParameterGroupFamily" : @"ClusterParameterGroupFamily",
             @"clusterVersion" : @"ClusterVersion",
             @"detail" : @"Description",
             };
}

@end

@implementation AWSredshiftClusterVersionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterVersions" : @"ClusterVersions",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)clusterVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftClusterVersion class]];
}

@end

@implementation AWSredshiftClustersMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusters" : @"Clusters",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)clustersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftCluster class]];
}

@end

@implementation AWSredshiftReplicateClusterSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manualSnapshotRetentionPeriod" : @"ManualSnapshotRetentionPeriod",
             @"sourceSnapshotClusterIdentifier" : @"SourceSnapshotClusterIdentifier",
             @"sourceSnapshotIdentifier" : @"SourceSnapshotIdentifier",
             @"targetSnapshotIdentifier" : @"TargetSnapshotIdentifier",
             };
}

@end

@implementation AWSredshiftReplicateClusterSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshot" : @"Snapshot",
             };
}

+ (NSValueTransformer *)snapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftSnapshot class]];
}

@end

@implementation AWSredshiftCreateClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalInfo" : @"AdditionalInfo",
             @"allowVersionUpgrade" : @"AllowVersionUpgrade",
             @"automatedSnapshotRetentionPeriod" : @"AutomatedSnapshotRetentionPeriod",
             @"availabilityZone" : @"AvailabilityZone",
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"clusterParameterGroupName" : @"ClusterParameterGroupName",
             @"clusterSecurityGroups" : @"ClusterSecurityGroups",
             @"clusterSubnetGroupName" : @"ClusterSubnetGroupName",
             @"clusterType" : @"ClusterType",
             @"clusterVersion" : @"ClusterVersion",
             @"DBName" : @"DBName",
             @"elasticIp" : @"ElasticIp",
             @"encrypted" : @"Encrypted",
             @"enhancedVpcRouting" : @"EnhancedVpcRouting",
             @"hsmClientCertificateIdentifier" : @"HsmClientCertificateIdentifier",
             @"hsmConfigurationIdentifier" : @"HsmConfigurationIdentifier",
             @"iamRoles" : @"IamRoles",
             @"kmsKeyId" : @"KmsKeyId",
             @"maintenanceTrackName" : @"MaintenanceTrackName",
             @"manualSnapshotRetentionPeriod" : @"ManualSnapshotRetentionPeriod",
             @"masterUserPassword" : @"MasterUserPassword",
             @"masterUsername" : @"MasterUsername",
             @"nodeType" : @"NodeType",
             @"numberOfNodes" : @"NumberOfNodes",
             @"port" : @"Port",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"publiclyAccessible" : @"PubliclyAccessible",
             @"snapshotScheduleIdentifier" : @"SnapshotScheduleIdentifier",
             @"tags" : @"Tags",
             @"vpcSecurityGroupIds" : @"VpcSecurityGroupIds",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftCreateClusterParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"parameterGroupFamily" : @"ParameterGroupFamily",
             @"parameterGroupName" : @"ParameterGroupName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftCreateClusterParameterGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterParameterGroup" : @"ClusterParameterGroup",
             };
}

+ (NSValueTransformer *)clusterParameterGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftClusterParameterGroup class]];
}

@end

@implementation AWSredshiftCreateClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cluster" : @"Cluster",
             };
}

+ (NSValueTransformer *)clusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftCluster class]];
}

@end

@implementation AWSredshiftCreateClusterSecurityGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterSecurityGroupName" : @"ClusterSecurityGroupName",
             @"detail" : @"Description",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftCreateClusterSecurityGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterSecurityGroup" : @"ClusterSecurityGroup",
             };
}

+ (NSValueTransformer *)clusterSecurityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftClusterSecurityGroup class]];
}

@end

@implementation AWSredshiftCreateClusterSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"manualSnapshotRetentionPeriod" : @"ManualSnapshotRetentionPeriod",
             @"snapshotIdentifier" : @"SnapshotIdentifier",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftCreateClusterSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshot" : @"Snapshot",
             };
}

+ (NSValueTransformer *)snapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftSnapshot class]];
}

@end

@implementation AWSredshiftCreateClusterSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterSubnetGroupName" : @"ClusterSubnetGroupName",
             @"detail" : @"Description",
             @"subnetIds" : @"SubnetIds",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftCreateClusterSubnetGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterSubnetGroup" : @"ClusterSubnetGroup",
             };
}

+ (NSValueTransformer *)clusterSubnetGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftClusterSubnetGroup class]];
}

@end

@implementation AWSredshiftCreateEventSubscriptionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"eventCategories" : @"EventCategories",
             @"severity" : @"Severity",
             @"snsTopicArn" : @"SnsTopicArn",
             @"sourceIds" : @"SourceIds",
             @"sourceType" : @"SourceType",
             @"subscriptionName" : @"SubscriptionName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftCreateEventSubscriptionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscription" : @"EventSubscription",
             };
}

+ (NSValueTransformer *)eventSubscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftEventSubscription class]];
}

@end

@implementation AWSredshiftCreateHsmClientCertificateMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hsmClientCertificateIdentifier" : @"HsmClientCertificateIdentifier",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftCreateHsmClientCertificateResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hsmClientCertificate" : @"HsmClientCertificate",
             };
}

+ (NSValueTransformer *)hsmClientCertificateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftHsmClientCertificate class]];
}

@end

@implementation AWSredshiftCreateHsmConfigurationMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"hsmConfigurationIdentifier" : @"HsmConfigurationIdentifier",
             @"hsmIpAddress" : @"HsmIpAddress",
             @"hsmPartitionName" : @"HsmPartitionName",
             @"hsmPartitionPassword" : @"HsmPartitionPassword",
             @"hsmServerPublicCertificate" : @"HsmServerPublicCertificate",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftCreateHsmConfigurationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hsmConfiguration" : @"HsmConfiguration",
             };
}

+ (NSValueTransformer *)hsmConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftHsmConfiguration class]];
}

@end

@implementation AWSredshiftCreateScheduledActionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enable" : @"Enable",
             @"endTime" : @"EndTime",
             @"iamRole" : @"IamRole",
             @"schedule" : @"Schedule",
             @"scheduledActionDescription" : @"ScheduledActionDescription",
             @"scheduledActionName" : @"ScheduledActionName",
             @"startTime" : @"StartTime",
             @"targetAction" : @"TargetAction",
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

+ (NSValueTransformer *)targetActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftScheduledActionType class]];
}

@end

@implementation AWSredshiftCreateSnapshotCopyGrantMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"snapshotCopyGrantName" : @"SnapshotCopyGrantName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftCreateSnapshotCopyGrantResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshotCopyGrant" : @"SnapshotCopyGrant",
             };
}

+ (NSValueTransformer *)snapshotCopyGrantJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftSnapshotCopyGrant class]];
}

@end

@implementation AWSredshiftCreateSnapshotScheduleMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"nextInvocations" : @"NextInvocations",
             @"scheduleDefinitions" : @"ScheduleDefinitions",
             @"scheduleDescription" : @"ScheduleDescription",
             @"scheduleIdentifier" : @"ScheduleIdentifier",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftCreateTagsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceName" : @"ResourceName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftCreateUsageLimitMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amount" : @"Amount",
             @"breachAction" : @"BreachAction",
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"featureType" : @"FeatureType",
             @"limitType" : @"LimitType",
             @"period" : @"Period",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)breachActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"log"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitBreachActionLog);
        }
        if ([value caseInsensitiveCompare:@"emit-metric"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitBreachActionEmitMetric);
        }
        if ([value caseInsensitiveCompare:@"disable"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitBreachActionDisable);
        }
        return @(AWSredshiftUsageLimitBreachActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftUsageLimitBreachActionLog:
                return @"log";
            case AWSredshiftUsageLimitBreachActionEmitMetric:
                return @"emit-metric";
            case AWSredshiftUsageLimitBreachActionDisable:
                return @"disable";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)featureTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"spectrum"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitFeatureTypeSpectrum);
        }
        if ([value caseInsensitiveCompare:@"concurrency-scaling"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitFeatureTypeConcurrencyScaling);
        }
        return @(AWSredshiftUsageLimitFeatureTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftUsageLimitFeatureTypeSpectrum:
                return @"spectrum";
            case AWSredshiftUsageLimitFeatureTypeConcurrencyScaling:
                return @"concurrency-scaling";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)limitTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"time"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitLimitTypeTime);
        }
        if ([value caseInsensitiveCompare:@"data-scanned"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitLimitTypeDataScanned);
        }
        return @(AWSredshiftUsageLimitLimitTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftUsageLimitLimitTypeTime:
                return @"time";
            case AWSredshiftUsageLimitLimitTypeDataScanned:
                return @"data-scanned";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)periodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"daily"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitPeriodDaily);
        }
        if ([value caseInsensitiveCompare:@"weekly"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitPeriodWeekly);
        }
        if ([value caseInsensitiveCompare:@"monthly"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitPeriodMonthly);
        }
        return @(AWSredshiftUsageLimitPeriodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftUsageLimitPeriodDaily:
                return @"daily";
            case AWSredshiftUsageLimitPeriodWeekly:
                return @"weekly";
            case AWSredshiftUsageLimitPeriodMonthly:
                return @"monthly";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftCustomerStorageMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"totalBackupSizeInMegaBytes" : @"TotalBackupSizeInMegaBytes",
             @"totalProvisionedStorageInMegaBytes" : @"TotalProvisionedStorageInMegaBytes",
             };
}

@end

@implementation AWSredshiftDataTransferProgress

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentRateInMegaBytesPerSecond" : @"CurrentRateInMegaBytesPerSecond",
             @"dataTransferredInMegaBytes" : @"DataTransferredInMegaBytes",
             @"elapsedTimeInSeconds" : @"ElapsedTimeInSeconds",
             @"estimatedTimeToCompletionInSeconds" : @"EstimatedTimeToCompletionInSeconds",
             @"status" : @"Status",
             @"totalDataInMegaBytes" : @"TotalDataInMegaBytes",
             };
}

@end

@implementation AWSredshiftDefaultClusterParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"parameterGroupFamily" : @"ParameterGroupFamily",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftParameter class]];
}

@end

@implementation AWSredshiftDeferredMaintenanceWindow

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deferMaintenanceEndTime" : @"DeferMaintenanceEndTime",
             @"deferMaintenanceIdentifier" : @"DeferMaintenanceIdentifier",
             @"deferMaintenanceStartTime" : @"DeferMaintenanceStartTime",
             };
}

+ (NSValueTransformer *)deferMaintenanceEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)deferMaintenanceStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSredshiftDeleteClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"finalClusterSnapshotIdentifier" : @"FinalClusterSnapshotIdentifier",
             @"finalClusterSnapshotRetentionPeriod" : @"FinalClusterSnapshotRetentionPeriod",
             @"skipFinalClusterSnapshot" : @"SkipFinalClusterSnapshot",
             };
}

@end

@implementation AWSredshiftDeleteClusterParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameterGroupName" : @"ParameterGroupName",
             };
}

@end

@implementation AWSredshiftDeleteClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cluster" : @"Cluster",
             };
}

+ (NSValueTransformer *)clusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftCluster class]];
}

@end

@implementation AWSredshiftDeleteClusterSecurityGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterSecurityGroupName" : @"ClusterSecurityGroupName",
             };
}

@end

@implementation AWSredshiftDeleteClusterSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshotClusterIdentifier" : @"SnapshotClusterIdentifier",
             @"snapshotIdentifier" : @"SnapshotIdentifier",
             };
}

@end

@implementation AWSredshiftDeleteClusterSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshot" : @"Snapshot",
             };
}

+ (NSValueTransformer *)snapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftSnapshot class]];
}

@end

@implementation AWSredshiftDeleteClusterSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterSubnetGroupName" : @"ClusterSubnetGroupName",
             };
}

@end

@implementation AWSredshiftDeleteEventSubscriptionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subscriptionName" : @"SubscriptionName",
             };
}

@end

@implementation AWSredshiftDeleteHsmClientCertificateMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hsmClientCertificateIdentifier" : @"HsmClientCertificateIdentifier",
             };
}

@end

@implementation AWSredshiftDeleteHsmConfigurationMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hsmConfigurationIdentifier" : @"HsmConfigurationIdentifier",
             };
}

@end

@implementation AWSredshiftDeleteScheduledActionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduledActionName" : @"ScheduledActionName",
             };
}

@end

@implementation AWSredshiftDeleteSnapshotCopyGrantMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshotCopyGrantName" : @"SnapshotCopyGrantName",
             };
}

@end

@implementation AWSredshiftDeleteSnapshotScheduleMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduleIdentifier" : @"ScheduleIdentifier",
             };
}

@end

@implementation AWSredshiftDeleteTagsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceName" : @"ResourceName",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSredshiftDeleteUsageLimitMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"usageLimitId" : @"UsageLimitId",
             };
}

@end

@implementation AWSredshiftDescribeAccountAttributesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeNames" : @"AttributeNames",
             };
}

@end

@implementation AWSredshiftDescribeClusterDbRevisionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

@end

@implementation AWSredshiftDescribeClusterParameterGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"parameterGroupName" : @"ParameterGroupName",
             @"tagKeys" : @"TagKeys",
             @"tagValues" : @"TagValues",
             };
}

@end

@implementation AWSredshiftDescribeClusterParametersMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"parameterGroupName" : @"ParameterGroupName",
             @"source" : @"Source",
             };
}

@end

@implementation AWSredshiftDescribeClusterSecurityGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterSecurityGroupName" : @"ClusterSecurityGroupName",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"tagKeys" : @"TagKeys",
             @"tagValues" : @"TagValues",
             };
}

@end

@implementation AWSredshiftDescribeClusterSnapshotsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterExists" : @"ClusterExists",
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"endTime" : @"EndTime",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"ownerAccount" : @"OwnerAccount",
             @"snapshotIdentifier" : @"SnapshotIdentifier",
             @"snapshotType" : @"SnapshotType",
             @"sortingEntities" : @"SortingEntities",
             @"startTime" : @"StartTime",
             @"tagKeys" : @"TagKeys",
             @"tagValues" : @"TagValues",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)sortingEntitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftSnapshotSortingEntity class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSredshiftDescribeClusterSubnetGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterSubnetGroupName" : @"ClusterSubnetGroupName",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"tagKeys" : @"TagKeys",
             @"tagValues" : @"TagValues",
             };
}

@end

@implementation AWSredshiftDescribeClusterTracksMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maintenanceTrackName" : @"MaintenanceTrackName",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

@end

@implementation AWSredshiftDescribeClusterVersionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterParameterGroupFamily" : @"ClusterParameterGroupFamily",
             @"clusterVersion" : @"ClusterVersion",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

@end

@implementation AWSredshiftDescribeClustersMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"tagKeys" : @"TagKeys",
             @"tagValues" : @"TagValues",
             };
}

@end

@implementation AWSredshiftDescribeDefaultClusterParametersMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"parameterGroupFamily" : @"ParameterGroupFamily",
             };
}

@end

@implementation AWSredshiftDescribeDefaultClusterParametersResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultClusterParameters" : @"DefaultClusterParameters",
             };
}

+ (NSValueTransformer *)defaultClusterParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftDefaultClusterParameters class]];
}

@end

@implementation AWSredshiftDescribeEventCategoriesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceType" : @"SourceType",
             };
}

@end

@implementation AWSredshiftDescribeEventSubscriptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"subscriptionName" : @"SubscriptionName",
             @"tagKeys" : @"TagKeys",
             @"tagValues" : @"TagValues",
             };
}

@end

@implementation AWSredshiftDescribeEventsMessage

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
        if ([value caseInsensitiveCompare:@"cluster"] == NSOrderedSame) {
            return @(AWSredshiftSourceTypeCluster);
        }
        if ([value caseInsensitiveCompare:@"cluster-parameter-group"] == NSOrderedSame) {
            return @(AWSredshiftSourceTypeClusterParameterGroup);
        }
        if ([value caseInsensitiveCompare:@"cluster-security-group"] == NSOrderedSame) {
            return @(AWSredshiftSourceTypeClusterSecurityGroup);
        }
        if ([value caseInsensitiveCompare:@"cluster-snapshot"] == NSOrderedSame) {
            return @(AWSredshiftSourceTypeClusterSnapshot);
        }
        if ([value caseInsensitiveCompare:@"scheduled-action"] == NSOrderedSame) {
            return @(AWSredshiftSourceTypeScheduledAction);
        }
        return @(AWSredshiftSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftSourceTypeCluster:
                return @"cluster";
            case AWSredshiftSourceTypeClusterParameterGroup:
                return @"cluster-parameter-group";
            case AWSredshiftSourceTypeClusterSecurityGroup:
                return @"cluster-security-group";
            case AWSredshiftSourceTypeClusterSnapshot:
                return @"cluster-snapshot";
            case AWSredshiftSourceTypeScheduledAction:
                return @"scheduled-action";
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

@implementation AWSredshiftDescribeHsmClientCertificatesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hsmClientCertificateIdentifier" : @"HsmClientCertificateIdentifier",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"tagKeys" : @"TagKeys",
             @"tagValues" : @"TagValues",
             };
}

@end

@implementation AWSredshiftDescribeHsmConfigurationsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hsmConfigurationIdentifier" : @"HsmConfigurationIdentifier",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"tagKeys" : @"TagKeys",
             @"tagValues" : @"TagValues",
             };
}

@end

@implementation AWSredshiftDescribeLoggingStatusMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             };
}

@end

@implementation AWSredshiftDescribeNodeConfigurationOptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionType" : @"ActionType",
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"ownerAccount" : @"OwnerAccount",
             @"snapshotIdentifier" : @"SnapshotIdentifier",
             };
}

+ (NSValueTransformer *)actionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"restore-cluster"] == NSOrderedSame) {
            return @(AWSredshiftActionTypeRestoreCluster);
        }
        if ([value caseInsensitiveCompare:@"recommend-node-config"] == NSOrderedSame) {
            return @(AWSredshiftActionTypeRecommendNodeConfig);
        }
        if ([value caseInsensitiveCompare:@"resize-cluster"] == NSOrderedSame) {
            return @(AWSredshiftActionTypeResizeCluster);
        }
        return @(AWSredshiftActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftActionTypeRestoreCluster:
                return @"restore-cluster";
            case AWSredshiftActionTypeRecommendNodeConfig:
                return @"recommend-node-config";
            case AWSredshiftActionTypeResizeCluster:
                return @"resize-cluster";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftNodeConfigurationOptionsFilter class]];
}

@end

@implementation AWSredshiftDescribeOrderableClusterOptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterVersion" : @"ClusterVersion",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"nodeType" : @"NodeType",
             };
}

@end

@implementation AWSredshiftDescribeReservedNodeOfferingsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"reservedNodeOfferingId" : @"ReservedNodeOfferingId",
             };
}

@end

@implementation AWSredshiftDescribeReservedNodesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"reservedNodeId" : @"ReservedNodeId",
             };
}

@end

@implementation AWSredshiftDescribeResizeMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             };
}

@end

@implementation AWSredshiftDescribeScheduledActionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"active" : @"Active",
             @"endTime" : @"EndTime",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"scheduledActionName" : @"ScheduledActionName",
             @"startTime" : @"StartTime",
             @"targetActionType" : @"TargetActionType",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftScheduledActionFilter class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)targetActionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ResizeCluster"] == NSOrderedSame) {
            return @(AWSredshiftScheduledActionTypeValuesResizeCluster);
        }
        if ([value caseInsensitiveCompare:@"PauseCluster"] == NSOrderedSame) {
            return @(AWSredshiftScheduledActionTypeValuesPauseCluster);
        }
        if ([value caseInsensitiveCompare:@"ResumeCluster"] == NSOrderedSame) {
            return @(AWSredshiftScheduledActionTypeValuesResumeCluster);
        }
        return @(AWSredshiftScheduledActionTypeValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftScheduledActionTypeValuesResizeCluster:
                return @"ResizeCluster";
            case AWSredshiftScheduledActionTypeValuesPauseCluster:
                return @"PauseCluster";
            case AWSredshiftScheduledActionTypeValuesResumeCluster:
                return @"ResumeCluster";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSredshiftDescribeSnapshotCopyGrantsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"snapshotCopyGrantName" : @"SnapshotCopyGrantName",
             @"tagKeys" : @"TagKeys",
             @"tagValues" : @"TagValues",
             };
}

@end

@implementation AWSredshiftDescribeSnapshotSchedulesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"scheduleIdentifier" : @"ScheduleIdentifier",
             @"tagKeys" : @"TagKeys",
             @"tagValues" : @"TagValues",
             };
}

@end

@implementation AWSredshiftDescribeSnapshotSchedulesOutputMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"snapshotSchedules" : @"SnapshotSchedules",
             };
}

+ (NSValueTransformer *)snapshotSchedulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftSnapshotSchedule class]];
}

@end

@implementation AWSredshiftDescribeTableRestoreStatusMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"tableRestoreRequestId" : @"TableRestoreRequestId",
             };
}

@end

@implementation AWSredshiftDescribeTagsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"resourceName" : @"ResourceName",
             @"resourceType" : @"ResourceType",
             @"tagKeys" : @"TagKeys",
             @"tagValues" : @"TagValues",
             };
}

@end

@implementation AWSredshiftDescribeUsageLimitsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"featureType" : @"FeatureType",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"tagKeys" : @"TagKeys",
             @"tagValues" : @"TagValues",
             @"usageLimitId" : @"UsageLimitId",
             };
}

+ (NSValueTransformer *)featureTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"spectrum"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitFeatureTypeSpectrum);
        }
        if ([value caseInsensitiveCompare:@"concurrency-scaling"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitFeatureTypeConcurrencyScaling);
        }
        return @(AWSredshiftUsageLimitFeatureTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftUsageLimitFeatureTypeSpectrum:
                return @"spectrum";
            case AWSredshiftUsageLimitFeatureTypeConcurrencyScaling:
                return @"concurrency-scaling";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSredshiftDisableLoggingMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             };
}

@end

@implementation AWSredshiftDisableSnapshotCopyMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             };
}

@end

@implementation AWSredshiftDisableSnapshotCopyResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cluster" : @"Cluster",
             };
}

+ (NSValueTransformer *)clusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftCluster class]];
}

@end

@implementation AWSredshiftEC2SecurityGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"EC2SecurityGroupName" : @"EC2SecurityGroupName",
             @"EC2SecurityGroupOwnerId" : @"EC2SecurityGroupOwnerId",
             @"status" : @"Status",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftElasticIpStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"elasticIp" : @"ElasticIp",
             @"status" : @"Status",
             };
}

@end

@implementation AWSredshiftEnableLoggingMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketName" : @"BucketName",
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"s3KeyPrefix" : @"S3KeyPrefix",
             };
}

@end

@implementation AWSredshiftEnableSnapshotCopyMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"destinationRegion" : @"DestinationRegion",
             @"manualSnapshotRetentionPeriod" : @"ManualSnapshotRetentionPeriod",
             @"retentionPeriod" : @"RetentionPeriod",
             @"snapshotCopyGrantName" : @"SnapshotCopyGrantName",
             };
}

@end

@implementation AWSredshiftEnableSnapshotCopyResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cluster" : @"Cluster",
             };
}

+ (NSValueTransformer *)clusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftCluster class]];
}

@end

@implementation AWSredshiftEndpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"port" : @"Port",
             };
}

@end

@implementation AWSredshiftEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"date" : @"Date",
             @"eventCategories" : @"EventCategories",
             @"eventId" : @"EventId",
             @"message" : @"Message",
             @"severity" : @"Severity",
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
        if ([value caseInsensitiveCompare:@"cluster"] == NSOrderedSame) {
            return @(AWSredshiftSourceTypeCluster);
        }
        if ([value caseInsensitiveCompare:@"cluster-parameter-group"] == NSOrderedSame) {
            return @(AWSredshiftSourceTypeClusterParameterGroup);
        }
        if ([value caseInsensitiveCompare:@"cluster-security-group"] == NSOrderedSame) {
            return @(AWSredshiftSourceTypeClusterSecurityGroup);
        }
        if ([value caseInsensitiveCompare:@"cluster-snapshot"] == NSOrderedSame) {
            return @(AWSredshiftSourceTypeClusterSnapshot);
        }
        if ([value caseInsensitiveCompare:@"scheduled-action"] == NSOrderedSame) {
            return @(AWSredshiftSourceTypeScheduledAction);
        }
        return @(AWSredshiftSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftSourceTypeCluster:
                return @"cluster";
            case AWSredshiftSourceTypeClusterParameterGroup:
                return @"cluster-parameter-group";
            case AWSredshiftSourceTypeClusterSecurityGroup:
                return @"cluster-security-group";
            case AWSredshiftSourceTypeClusterSnapshot:
                return @"cluster-snapshot";
            case AWSredshiftSourceTypeScheduledAction:
                return @"scheduled-action";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSredshiftEventCategoriesMap

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"Events",
             @"sourceType" : @"SourceType",
             };
}

+ (NSValueTransformer *)eventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftEventInfoMap class]];
}

@end

@implementation AWSredshiftEventCategoriesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventCategoriesMapList" : @"EventCategoriesMapList",
             };
}

+ (NSValueTransformer *)eventCategoriesMapListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftEventCategoriesMap class]];
}

@end

@implementation AWSredshiftEventInfoMap

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventCategories" : @"EventCategories",
             @"eventDescription" : @"EventDescription",
             @"eventId" : @"EventId",
             @"severity" : @"Severity",
             };
}

@end

@implementation AWSredshiftEventSubscription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"custSubscriptionId" : @"CustSubscriptionId",
             @"customerAwsId" : @"CustomerAwsId",
             @"enabled" : @"Enabled",
             @"eventCategoriesList" : @"EventCategoriesList",
             @"severity" : @"Severity",
             @"snsTopicArn" : @"SnsTopicArn",
             @"sourceIdsList" : @"SourceIdsList",
             @"sourceType" : @"SourceType",
             @"status" : @"Status",
             @"subscriptionCreationTime" : @"SubscriptionCreationTime",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)subscriptionCreationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftEventSubscriptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscriptionsList" : @"EventSubscriptionsList",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)eventSubscriptionsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftEventSubscription class]];
}

@end

@implementation AWSredshiftEventsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"Events",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)eventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftEvent class]];
}

@end

@implementation AWSredshiftGetClusterCredentialsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoCreate" : @"AutoCreate",
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"dbGroups" : @"DbGroups",
             @"dbName" : @"DbName",
             @"dbUser" : @"DbUser",
             @"durationSeconds" : @"DurationSeconds",
             };
}

@end

@implementation AWSredshiftGetReservedNodeExchangeOfferingsInputMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"reservedNodeId" : @"ReservedNodeId",
             };
}

@end

@implementation AWSredshiftGetReservedNodeExchangeOfferingsOutputMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"reservedNodeOfferings" : @"ReservedNodeOfferings",
             };
}

+ (NSValueTransformer *)reservedNodeOfferingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftReservedNodeOffering class]];
}

@end

@implementation AWSredshiftHsmClientCertificate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hsmClientCertificateIdentifier" : @"HsmClientCertificateIdentifier",
             @"hsmClientCertificatePublicKey" : @"HsmClientCertificatePublicKey",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftHsmClientCertificateMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hsmClientCertificates" : @"HsmClientCertificates",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)hsmClientCertificatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftHsmClientCertificate class]];
}

@end

@implementation AWSredshiftHsmConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"hsmConfigurationIdentifier" : @"HsmConfigurationIdentifier",
             @"hsmIpAddress" : @"HsmIpAddress",
             @"hsmPartitionName" : @"HsmPartitionName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftHsmConfigurationMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hsmConfigurations" : @"HsmConfigurations",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)hsmConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftHsmConfiguration class]];
}

@end

@implementation AWSredshiftHsmStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hsmClientCertificateIdentifier" : @"HsmClientCertificateIdentifier",
             @"hsmConfigurationIdentifier" : @"HsmConfigurationIdentifier",
             @"status" : @"Status",
             };
}

@end

@implementation AWSredshiftIPRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"CIDRIP" : @"CIDRIP",
             @"status" : @"Status",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftLoggingStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketName" : @"BucketName",
             @"lastFailureMessage" : @"LastFailureMessage",
             @"lastFailureTime" : @"LastFailureTime",
             @"lastSuccessfulDeliveryTime" : @"LastSuccessfulDeliveryTime",
             @"loggingEnabled" : @"LoggingEnabled",
             @"s3KeyPrefix" : @"S3KeyPrefix",
             };
}

+ (NSValueTransformer *)lastFailureTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)lastSuccessfulDeliveryTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSredshiftMaintenanceTrack

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"databaseVersion" : @"DatabaseVersion",
             @"maintenanceTrackName" : @"MaintenanceTrackName",
             @"updateTargets" : @"UpdateTargets",
             };
}

+ (NSValueTransformer *)updateTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftUpdateTarget class]];
}

@end

@implementation AWSredshiftModifyClusterDbRevisionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"revisionTarget" : @"RevisionTarget",
             };
}

@end

@implementation AWSredshiftModifyClusterDbRevisionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cluster" : @"Cluster",
             };
}

+ (NSValueTransformer *)clusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftCluster class]];
}

@end

@implementation AWSredshiftModifyClusterIamRolesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addIamRoles" : @"AddIamRoles",
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"removeIamRoles" : @"RemoveIamRoles",
             };
}

@end

@implementation AWSredshiftModifyClusterIamRolesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cluster" : @"Cluster",
             };
}

+ (NSValueTransformer *)clusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftCluster class]];
}

@end

@implementation AWSredshiftModifyClusterMaintenanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"deferMaintenance" : @"DeferMaintenance",
             @"deferMaintenanceDuration" : @"DeferMaintenanceDuration",
             @"deferMaintenanceEndTime" : @"DeferMaintenanceEndTime",
             @"deferMaintenanceIdentifier" : @"DeferMaintenanceIdentifier",
             @"deferMaintenanceStartTime" : @"DeferMaintenanceStartTime",
             };
}

+ (NSValueTransformer *)deferMaintenanceEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)deferMaintenanceStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSredshiftModifyClusterMaintenanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cluster" : @"Cluster",
             };
}

+ (NSValueTransformer *)clusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftCluster class]];
}

@end

@implementation AWSredshiftModifyClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowVersionUpgrade" : @"AllowVersionUpgrade",
             @"automatedSnapshotRetentionPeriod" : @"AutomatedSnapshotRetentionPeriod",
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"clusterParameterGroupName" : @"ClusterParameterGroupName",
             @"clusterSecurityGroups" : @"ClusterSecurityGroups",
             @"clusterType" : @"ClusterType",
             @"clusterVersion" : @"ClusterVersion",
             @"elasticIp" : @"ElasticIp",
             @"encrypted" : @"Encrypted",
             @"enhancedVpcRouting" : @"EnhancedVpcRouting",
             @"hsmClientCertificateIdentifier" : @"HsmClientCertificateIdentifier",
             @"hsmConfigurationIdentifier" : @"HsmConfigurationIdentifier",
             @"kmsKeyId" : @"KmsKeyId",
             @"maintenanceTrackName" : @"MaintenanceTrackName",
             @"manualSnapshotRetentionPeriod" : @"ManualSnapshotRetentionPeriod",
             @"masterUserPassword" : @"MasterUserPassword",
             @"latestClusterIdentifier" : @"NewClusterIdentifier",
             @"nodeType" : @"NodeType",
             @"numberOfNodes" : @"NumberOfNodes",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"publiclyAccessible" : @"PubliclyAccessible",
             @"vpcSecurityGroupIds" : @"VpcSecurityGroupIds",
             };
}

@end

@implementation AWSredshiftModifyClusterParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameterGroupName" : @"ParameterGroupName",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftParameter class]];
}

@end

@implementation AWSredshiftModifyClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cluster" : @"Cluster",
             };
}

+ (NSValueTransformer *)clusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftCluster class]];
}

@end

@implementation AWSredshiftModifyClusterSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"force" : @"Force",
             @"manualSnapshotRetentionPeriod" : @"ManualSnapshotRetentionPeriod",
             @"snapshotIdentifier" : @"SnapshotIdentifier",
             };
}

@end

@implementation AWSredshiftModifyClusterSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshot" : @"Snapshot",
             };
}

+ (NSValueTransformer *)snapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftSnapshot class]];
}

@end

@implementation AWSredshiftModifyClusterSnapshotScheduleMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"disassociateSchedule" : @"DisassociateSchedule",
             @"scheduleIdentifier" : @"ScheduleIdentifier",
             };
}

@end

@implementation AWSredshiftModifyClusterSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterSubnetGroupName" : @"ClusterSubnetGroupName",
             @"detail" : @"Description",
             @"subnetIds" : @"SubnetIds",
             };
}

@end

@implementation AWSredshiftModifyClusterSubnetGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterSubnetGroup" : @"ClusterSubnetGroup",
             };
}

+ (NSValueTransformer *)clusterSubnetGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftClusterSubnetGroup class]];
}

@end

@implementation AWSredshiftModifyEventSubscriptionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"eventCategories" : @"EventCategories",
             @"severity" : @"Severity",
             @"snsTopicArn" : @"SnsTopicArn",
             @"sourceIds" : @"SourceIds",
             @"sourceType" : @"SourceType",
             @"subscriptionName" : @"SubscriptionName",
             };
}

@end

@implementation AWSredshiftModifyEventSubscriptionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscription" : @"EventSubscription",
             };
}

+ (NSValueTransformer *)eventSubscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftEventSubscription class]];
}

@end

@implementation AWSredshiftModifyScheduledActionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enable" : @"Enable",
             @"endTime" : @"EndTime",
             @"iamRole" : @"IamRole",
             @"schedule" : @"Schedule",
             @"scheduledActionDescription" : @"ScheduledActionDescription",
             @"scheduledActionName" : @"ScheduledActionName",
             @"startTime" : @"StartTime",
             @"targetAction" : @"TargetAction",
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

+ (NSValueTransformer *)targetActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftScheduledActionType class]];
}

@end

@implementation AWSredshiftModifySnapshotCopyRetentionPeriodMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"manual" : @"Manual",
             @"retentionPeriod" : @"RetentionPeriod",
             };
}

@end

@implementation AWSredshiftModifySnapshotCopyRetentionPeriodResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cluster" : @"Cluster",
             };
}

+ (NSValueTransformer *)clusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftCluster class]];
}

@end

@implementation AWSredshiftModifySnapshotScheduleMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduleDefinitions" : @"ScheduleDefinitions",
             @"scheduleIdentifier" : @"ScheduleIdentifier",
             };
}

@end

@implementation AWSredshiftModifyUsageLimitMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amount" : @"Amount",
             @"breachAction" : @"BreachAction",
             @"usageLimitId" : @"UsageLimitId",
             };
}

+ (NSValueTransformer *)breachActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"log"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitBreachActionLog);
        }
        if ([value caseInsensitiveCompare:@"emit-metric"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitBreachActionEmitMetric);
        }
        if ([value caseInsensitiveCompare:@"disable"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitBreachActionDisable);
        }
        return @(AWSredshiftUsageLimitBreachActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftUsageLimitBreachActionLog:
                return @"log";
            case AWSredshiftUsageLimitBreachActionEmitMetric:
                return @"emit-metric";
            case AWSredshiftUsageLimitBreachActionDisable:
                return @"disable";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSredshiftNodeConfigurationOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"estimatedDiskUtilizationPercent" : @"EstimatedDiskUtilizationPercent",
             @"mode" : @"Mode",
             @"nodeType" : @"NodeType",
             @"numberOfNodes" : @"NumberOfNodes",
             };
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"standard"] == NSOrderedSame) {
            return @(AWSredshiftModeStandard);
        }
        if ([value caseInsensitiveCompare:@"high-performance"] == NSOrderedSame) {
            return @(AWSredshiftModeHighPerformance);
        }
        return @(AWSredshiftModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftModeStandard:
                return @"standard";
            case AWSredshiftModeHighPerformance:
                return @"high-performance";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSredshiftNodeConfigurationOptionsFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"operator" : @"Operator",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NodeType"] == NSOrderedSame) {
            return @(AWSredshiftNodeConfigurationOptionsFilterNameNodeType);
        }
        if ([value caseInsensitiveCompare:@"NumberOfNodes"] == NSOrderedSame) {
            return @(AWSredshiftNodeConfigurationOptionsFilterNameNumberOfNodes);
        }
        if ([value caseInsensitiveCompare:@"EstimatedDiskUtilizationPercent"] == NSOrderedSame) {
            return @(AWSredshiftNodeConfigurationOptionsFilterNameEstimatedDiskUtilizationPercent);
        }
        if ([value caseInsensitiveCompare:@"Mode"] == NSOrderedSame) {
            return @(AWSredshiftNodeConfigurationOptionsFilterNameMode);
        }
        return @(AWSredshiftNodeConfigurationOptionsFilterNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftNodeConfigurationOptionsFilterNameNodeType:
                return @"NodeType";
            case AWSredshiftNodeConfigurationOptionsFilterNameNumberOfNodes:
                return @"NumberOfNodes";
            case AWSredshiftNodeConfigurationOptionsFilterNameEstimatedDiskUtilizationPercent:
                return @"EstimatedDiskUtilizationPercent";
            case AWSredshiftNodeConfigurationOptionsFilterNameMode:
                return @"Mode";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)operatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"eq"] == NSOrderedSame) {
            return @(AWSredshiftOperatorTypeEq);
        }
        if ([value caseInsensitiveCompare:@"lt"] == NSOrderedSame) {
            return @(AWSredshiftOperatorTypeLt);
        }
        if ([value caseInsensitiveCompare:@"gt"] == NSOrderedSame) {
            return @(AWSredshiftOperatorTypeGt);
        }
        if ([value caseInsensitiveCompare:@"le"] == NSOrderedSame) {
            return @(AWSredshiftOperatorTypeLe);
        }
        if ([value caseInsensitiveCompare:@"ge"] == NSOrderedSame) {
            return @(AWSredshiftOperatorTypeGe);
        }
        if ([value caseInsensitiveCompare:@"in"] == NSOrderedSame) {
            return @(AWSredshiftOperatorTypeIn);
        }
        if ([value caseInsensitiveCompare:@"between"] == NSOrderedSame) {
            return @(AWSredshiftOperatorTypeBetween);
        }
        return @(AWSredshiftOperatorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftOperatorTypeEq:
                return @"eq";
            case AWSredshiftOperatorTypeLt:
                return @"lt";
            case AWSredshiftOperatorTypeGt:
                return @"gt";
            case AWSredshiftOperatorTypeLe:
                return @"le";
            case AWSredshiftOperatorTypeGe:
                return @"ge";
            case AWSredshiftOperatorTypeIn:
                return @"in";
            case AWSredshiftOperatorTypeBetween:
                return @"between";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSredshiftNodeConfigurationOptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"nodeConfigurationOptionList" : @"NodeConfigurationOptionList",
             };
}

+ (NSValueTransformer *)nodeConfigurationOptionListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftNodeConfigurationOption class]];
}

@end

@implementation AWSredshiftOrderableClusterOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"clusterType" : @"ClusterType",
             @"clusterVersion" : @"ClusterVersion",
             @"nodeType" : @"NodeType",
             };
}

+ (NSValueTransformer *)availabilityZonesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftAvailabilityZone class]];
}

@end

@implementation AWSredshiftOrderableClusterOptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"orderableClusterOptions" : @"OrderableClusterOptions",
             };
}

+ (NSValueTransformer *)orderableClusterOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftOrderableClusterOption class]];
}

@end

@implementation AWSredshiftParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedValues" : @"AllowedValues",
             @"applyType" : @"ApplyType",
             @"dataType" : @"DataType",
             @"detail" : @"Description",
             @"isModifiable" : @"IsModifiable",
             @"minimumEngineVersion" : @"MinimumEngineVersion",
             @"parameterName" : @"ParameterName",
             @"parameterValue" : @"ParameterValue",
             @"source" : @"Source",
             };
}

+ (NSValueTransformer *)applyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"static"] == NSOrderedSame) {
            return @(AWSredshiftParameterApplyTypeStatic);
        }
        if ([value caseInsensitiveCompare:@"dynamic"] == NSOrderedSame) {
            return @(AWSredshiftParameterApplyTypeDynamic);
        }
        return @(AWSredshiftParameterApplyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftParameterApplyTypeStatic:
                return @"static";
            case AWSredshiftParameterApplyTypeDynamic:
                return @"dynamic";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSredshiftPauseClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             };
}

@end

@implementation AWSredshiftPauseClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cluster" : @"Cluster",
             };
}

+ (NSValueTransformer *)clusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftCluster class]];
}

@end

@implementation AWSredshiftPendingModifiedValues

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automatedSnapshotRetentionPeriod" : @"AutomatedSnapshotRetentionPeriod",
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"clusterType" : @"ClusterType",
             @"clusterVersion" : @"ClusterVersion",
             @"encryptionType" : @"EncryptionType",
             @"enhancedVpcRouting" : @"EnhancedVpcRouting",
             @"maintenanceTrackName" : @"MaintenanceTrackName",
             @"masterUserPassword" : @"MasterUserPassword",
             @"nodeType" : @"NodeType",
             @"numberOfNodes" : @"NumberOfNodes",
             @"publiclyAccessible" : @"PubliclyAccessible",
             };
}

@end

@implementation AWSredshiftPurchaseReservedNodeOfferingMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nodeCount" : @"NodeCount",
             @"reservedNodeOfferingId" : @"ReservedNodeOfferingId",
             };
}

@end

@implementation AWSredshiftPurchaseReservedNodeOfferingResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedNode" : @"ReservedNode",
             };
}

+ (NSValueTransformer *)reservedNodeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftReservedNode class]];
}

@end

@implementation AWSredshiftRebootClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             };
}

@end

@implementation AWSredshiftRebootClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cluster" : @"Cluster",
             };
}

+ (NSValueTransformer *)clusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftCluster class]];
}

@end

@implementation AWSredshiftRecurringCharge

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recurringChargeAmount" : @"RecurringChargeAmount",
             @"recurringChargeFrequency" : @"RecurringChargeFrequency",
             };
}

@end

@implementation AWSredshiftReservedNode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currencyCode" : @"CurrencyCode",
             @"duration" : @"Duration",
             @"fixedPrice" : @"FixedPrice",
             @"nodeCount" : @"NodeCount",
             @"nodeType" : @"NodeType",
             @"offeringType" : @"OfferingType",
             @"recurringCharges" : @"RecurringCharges",
             @"reservedNodeId" : @"ReservedNodeId",
             @"reservedNodeOfferingId" : @"ReservedNodeOfferingId",
             @"reservedNodeOfferingType" : @"ReservedNodeOfferingType",
             @"startTime" : @"StartTime",
             @"state" : @"State",
             @"usagePrice" : @"UsagePrice",
             };
}

+ (NSValueTransformer *)recurringChargesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftRecurringCharge class]];
}

+ (NSValueTransformer *)reservedNodeOfferingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Regular"] == NSOrderedSame) {
            return @(AWSredshiftReservedNodeOfferingTypeRegular);
        }
        if ([value caseInsensitiveCompare:@"Upgradable"] == NSOrderedSame) {
            return @(AWSredshiftReservedNodeOfferingTypeUpgradable);
        }
        return @(AWSredshiftReservedNodeOfferingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftReservedNodeOfferingTypeRegular:
                return @"Regular";
            case AWSredshiftReservedNodeOfferingTypeUpgradable:
                return @"Upgradable";
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

@implementation AWSredshiftReservedNodeOffering

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currencyCode" : @"CurrencyCode",
             @"duration" : @"Duration",
             @"fixedPrice" : @"FixedPrice",
             @"nodeType" : @"NodeType",
             @"offeringType" : @"OfferingType",
             @"recurringCharges" : @"RecurringCharges",
             @"reservedNodeOfferingId" : @"ReservedNodeOfferingId",
             @"reservedNodeOfferingType" : @"ReservedNodeOfferingType",
             @"usagePrice" : @"UsagePrice",
             };
}

+ (NSValueTransformer *)recurringChargesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftRecurringCharge class]];
}

+ (NSValueTransformer *)reservedNodeOfferingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Regular"] == NSOrderedSame) {
            return @(AWSredshiftReservedNodeOfferingTypeRegular);
        }
        if ([value caseInsensitiveCompare:@"Upgradable"] == NSOrderedSame) {
            return @(AWSredshiftReservedNodeOfferingTypeUpgradable);
        }
        return @(AWSredshiftReservedNodeOfferingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftReservedNodeOfferingTypeRegular:
                return @"Regular";
            case AWSredshiftReservedNodeOfferingTypeUpgradable:
                return @"Upgradable";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSredshiftReservedNodeOfferingsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"reservedNodeOfferings" : @"ReservedNodeOfferings",
             };
}

+ (NSValueTransformer *)reservedNodeOfferingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftReservedNodeOffering class]];
}

@end

@implementation AWSredshiftReservedNodesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"reservedNodes" : @"ReservedNodes",
             };
}

+ (NSValueTransformer *)reservedNodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftReservedNode class]];
}

@end

@implementation AWSredshiftResetClusterParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameterGroupName" : @"ParameterGroupName",
             @"parameters" : @"Parameters",
             @"resetAllParameters" : @"ResetAllParameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftParameter class]];
}

@end

@implementation AWSredshiftResizeClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classic" : @"Classic",
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"clusterType" : @"ClusterType",
             @"nodeType" : @"NodeType",
             @"numberOfNodes" : @"NumberOfNodes",
             };
}

@end

@implementation AWSredshiftResizeClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cluster" : @"Cluster",
             };
}

+ (NSValueTransformer *)clusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftCluster class]];
}

@end

@implementation AWSredshiftResizeInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowCancelResize" : @"AllowCancelResize",
             @"resizeType" : @"ResizeType",
             };
}

@end

@implementation AWSredshiftResizeProgressMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"avgResizeRateInMegaBytesPerSecond" : @"AvgResizeRateInMegaBytesPerSecond",
             @"dataTransferProgressPercent" : @"DataTransferProgressPercent",
             @"elapsedTimeInSeconds" : @"ElapsedTimeInSeconds",
             @"estimatedTimeToCompletionInSeconds" : @"EstimatedTimeToCompletionInSeconds",
             @"importTablesCompleted" : @"ImportTablesCompleted",
             @"importTablesInProgress" : @"ImportTablesInProgress",
             @"importTablesNotStarted" : @"ImportTablesNotStarted",
             @"message" : @"Message",
             @"progressInMegaBytes" : @"ProgressInMegaBytes",
             @"resizeType" : @"ResizeType",
             @"status" : @"Status",
             @"targetClusterType" : @"TargetClusterType",
             @"targetEncryptionType" : @"TargetEncryptionType",
             @"targetNodeType" : @"TargetNodeType",
             @"targetNumberOfNodes" : @"TargetNumberOfNodes",
             @"totalResizeDataInMegaBytes" : @"TotalResizeDataInMegaBytes",
             };
}

@end

@implementation AWSredshiftRestoreFromClusterSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalInfo" : @"AdditionalInfo",
             @"allowVersionUpgrade" : @"AllowVersionUpgrade",
             @"automatedSnapshotRetentionPeriod" : @"AutomatedSnapshotRetentionPeriod",
             @"availabilityZone" : @"AvailabilityZone",
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"clusterParameterGroupName" : @"ClusterParameterGroupName",
             @"clusterSecurityGroups" : @"ClusterSecurityGroups",
             @"clusterSubnetGroupName" : @"ClusterSubnetGroupName",
             @"elasticIp" : @"ElasticIp",
             @"enhancedVpcRouting" : @"EnhancedVpcRouting",
             @"hsmClientCertificateIdentifier" : @"HsmClientCertificateIdentifier",
             @"hsmConfigurationIdentifier" : @"HsmConfigurationIdentifier",
             @"iamRoles" : @"IamRoles",
             @"kmsKeyId" : @"KmsKeyId",
             @"maintenanceTrackName" : @"MaintenanceTrackName",
             @"manualSnapshotRetentionPeriod" : @"ManualSnapshotRetentionPeriod",
             @"nodeType" : @"NodeType",
             @"numberOfNodes" : @"NumberOfNodes",
             @"ownerAccount" : @"OwnerAccount",
             @"port" : @"Port",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"publiclyAccessible" : @"PubliclyAccessible",
             @"snapshotClusterIdentifier" : @"SnapshotClusterIdentifier",
             @"snapshotIdentifier" : @"SnapshotIdentifier",
             @"snapshotScheduleIdentifier" : @"SnapshotScheduleIdentifier",
             @"vpcSecurityGroupIds" : @"VpcSecurityGroupIds",
             };
}

@end

@implementation AWSredshiftRestoreFromClusterSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cluster" : @"Cluster",
             };
}

+ (NSValueTransformer *)clusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftCluster class]];
}

@end

@implementation AWSredshiftRestoreStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentRestoreRateInMegaBytesPerSecond" : @"CurrentRestoreRateInMegaBytesPerSecond",
             @"elapsedTimeInSeconds" : @"ElapsedTimeInSeconds",
             @"estimatedTimeToCompletionInSeconds" : @"EstimatedTimeToCompletionInSeconds",
             @"progressInMegaBytes" : @"ProgressInMegaBytes",
             @"snapshotSizeInMegaBytes" : @"SnapshotSizeInMegaBytes",
             @"status" : @"Status",
             };
}

@end

@implementation AWSredshiftRestoreTableFromClusterSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"latestTableName" : @"NewTableName",
             @"snapshotIdentifier" : @"SnapshotIdentifier",
             @"sourceDatabaseName" : @"SourceDatabaseName",
             @"sourceSchemaName" : @"SourceSchemaName",
             @"sourceTableName" : @"SourceTableName",
             @"targetDatabaseName" : @"TargetDatabaseName",
             @"targetSchemaName" : @"TargetSchemaName",
             };
}

@end

@implementation AWSredshiftRestoreTableFromClusterSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableRestoreStatus" : @"TableRestoreStatus",
             };
}

+ (NSValueTransformer *)tableRestoreStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftTableRestoreStatus class]];
}

@end

@implementation AWSredshiftResumeClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             };
}

@end

@implementation AWSredshiftResumeClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cluster" : @"Cluster",
             };
}

+ (NSValueTransformer *)clusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftCluster class]];
}

@end

@implementation AWSredshiftRevisionTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"databaseRevision" : @"DatabaseRevision",
             @"databaseRevisionReleaseDate" : @"DatabaseRevisionReleaseDate",
             @"detail" : @"Description",
             };
}

+ (NSValueTransformer *)databaseRevisionReleaseDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSredshiftRevokeClusterSecurityGroupIngressMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"CIDRIP" : @"CIDRIP",
             @"clusterSecurityGroupName" : @"ClusterSecurityGroupName",
             @"EC2SecurityGroupName" : @"EC2SecurityGroupName",
             @"EC2SecurityGroupOwnerId" : @"EC2SecurityGroupOwnerId",
             };
}

@end

@implementation AWSredshiftRevokeClusterSecurityGroupIngressResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterSecurityGroup" : @"ClusterSecurityGroup",
             };
}

+ (NSValueTransformer *)clusterSecurityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftClusterSecurityGroup class]];
}

@end

@implementation AWSredshiftRevokeSnapshotAccessMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountWithRestoreAccess" : @"AccountWithRestoreAccess",
             @"snapshotClusterIdentifier" : @"SnapshotClusterIdentifier",
             @"snapshotIdentifier" : @"SnapshotIdentifier",
             };
}

@end

@implementation AWSredshiftRevokeSnapshotAccessResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshot" : @"Snapshot",
             };
}

+ (NSValueTransformer *)snapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftSnapshot class]];
}

@end

@implementation AWSredshiftRotateEncryptionKeyMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             };
}

@end

@implementation AWSredshiftRotateEncryptionKeyResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cluster" : @"Cluster",
             };
}

+ (NSValueTransformer *)clusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftCluster class]];
}

@end

@implementation AWSredshiftScheduledAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"iamRole" : @"IamRole",
             @"nextInvocations" : @"NextInvocations",
             @"schedule" : @"Schedule",
             @"scheduledActionDescription" : @"ScheduledActionDescription",
             @"scheduledActionName" : @"ScheduledActionName",
             @"startTime" : @"StartTime",
             @"state" : @"State",
             @"targetAction" : @"TargetAction",
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

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSredshiftScheduledActionStateActive);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSredshiftScheduledActionStateDisabled);
        }
        return @(AWSredshiftScheduledActionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftScheduledActionStateActive:
                return @"ACTIVE";
            case AWSredshiftScheduledActionStateDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftScheduledActionType class]];
}

@end

@implementation AWSredshiftScheduledActionFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"cluster-identifier"] == NSOrderedSame) {
            return @(AWSredshiftScheduledActionFilterNameClusterIdentifier);
        }
        if ([value caseInsensitiveCompare:@"iam-role"] == NSOrderedSame) {
            return @(AWSredshiftScheduledActionFilterNameIamRole);
        }
        return @(AWSredshiftScheduledActionFilterNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftScheduledActionFilterNameClusterIdentifier:
                return @"cluster-identifier";
            case AWSredshiftScheduledActionFilterNameIamRole:
                return @"iam-role";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSredshiftScheduledActionType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pauseCluster" : @"PauseCluster",
             @"resizeCluster" : @"ResizeCluster",
             @"resumeCluster" : @"ResumeCluster",
             };
}

+ (NSValueTransformer *)pauseClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftPauseClusterMessage class]];
}

+ (NSValueTransformer *)resizeClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftResizeClusterMessage class]];
}

+ (NSValueTransformer *)resumeClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftResumeClusterMessage class]];
}

@end

@implementation AWSredshiftScheduledActionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"scheduledActions" : @"ScheduledActions",
             };
}

+ (NSValueTransformer *)scheduledActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftScheduledAction class]];
}

@end

@implementation AWSredshiftSnapshot

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountsWithRestoreAccess" : @"AccountsWithRestoreAccess",
             @"actualIncrementalBackupSizeInMegaBytes" : @"ActualIncrementalBackupSizeInMegaBytes",
             @"availabilityZone" : @"AvailabilityZone",
             @"backupProgressInMegaBytes" : @"BackupProgressInMegaBytes",
             @"clusterCreateTime" : @"ClusterCreateTime",
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"clusterVersion" : @"ClusterVersion",
             @"currentBackupRateInMegaBytesPerSecond" : @"CurrentBackupRateInMegaBytesPerSecond",
             @"DBName" : @"DBName",
             @"elapsedTimeInSeconds" : @"ElapsedTimeInSeconds",
             @"encrypted" : @"Encrypted",
             @"encryptedWithHSM" : @"EncryptedWithHSM",
             @"enhancedVpcRouting" : @"EnhancedVpcRouting",
             @"estimatedSecondsToCompletion" : @"EstimatedSecondsToCompletion",
             @"kmsKeyId" : @"KmsKeyId",
             @"maintenanceTrackName" : @"MaintenanceTrackName",
             @"manualSnapshotRemainingDays" : @"ManualSnapshotRemainingDays",
             @"manualSnapshotRetentionPeriod" : @"ManualSnapshotRetentionPeriod",
             @"masterUsername" : @"MasterUsername",
             @"nodeType" : @"NodeType",
             @"numberOfNodes" : @"NumberOfNodes",
             @"ownerAccount" : @"OwnerAccount",
             @"port" : @"Port",
             @"restorableNodeTypes" : @"RestorableNodeTypes",
             @"snapshotCreateTime" : @"SnapshotCreateTime",
             @"snapshotIdentifier" : @"SnapshotIdentifier",
             @"snapshotRetentionStartTime" : @"SnapshotRetentionStartTime",
             @"snapshotType" : @"SnapshotType",
             @"sourceRegion" : @"SourceRegion",
             @"status" : @"Status",
             @"tags" : @"Tags",
             @"totalBackupSizeInMegaBytes" : @"TotalBackupSizeInMegaBytes",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)accountsWithRestoreAccessJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftAccountWithRestoreAccess class]];
}

+ (NSValueTransformer *)clusterCreateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)snapshotCreateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)snapshotRetentionStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftSnapshotCopyGrant

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"snapshotCopyGrantName" : @"SnapshotCopyGrantName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftSnapshotCopyGrantMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"snapshotCopyGrants" : @"SnapshotCopyGrants",
             };
}

+ (NSValueTransformer *)snapshotCopyGrantsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftSnapshotCopyGrant class]];
}

@end

@implementation AWSredshiftSnapshotErrorMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failureCode" : @"FailureCode",
             @"failureReason" : @"FailureReason",
             @"snapshotClusterIdentifier" : @"SnapshotClusterIdentifier",
             @"snapshotIdentifier" : @"SnapshotIdentifier",
             };
}

@end

@implementation AWSredshiftSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"snapshots" : @"Snapshots",
             };
}

+ (NSValueTransformer *)snapshotsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftSnapshot class]];
}

@end

@implementation AWSredshiftSnapshotSchedule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associatedClusterCount" : @"AssociatedClusterCount",
             @"associatedClusters" : @"AssociatedClusters",
             @"nextInvocations" : @"NextInvocations",
             @"scheduleDefinitions" : @"ScheduleDefinitions",
             @"scheduleDescription" : @"ScheduleDescription",
             @"scheduleIdentifier" : @"ScheduleIdentifier",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)associatedClustersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftClusterAssociatedToSchedule class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftSnapshotSortingEntity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attribute" : @"Attribute",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)attributeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SOURCE_TYPE"] == NSOrderedSame) {
            return @(AWSredshiftSnapshotAttributeToSortBySourceType);
        }
        if ([value caseInsensitiveCompare:@"TOTAL_SIZE"] == NSOrderedSame) {
            return @(AWSredshiftSnapshotAttributeToSortByTotalSize);
        }
        if ([value caseInsensitiveCompare:@"CREATE_TIME"] == NSOrderedSame) {
            return @(AWSredshiftSnapshotAttributeToSortByCreateTime);
        }
        return @(AWSredshiftSnapshotAttributeToSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftSnapshotAttributeToSortBySourceType:
                return @"SOURCE_TYPE";
            case AWSredshiftSnapshotAttributeToSortByTotalSize:
                return @"TOTAL_SIZE";
            case AWSredshiftSnapshotAttributeToSortByCreateTime:
                return @"CREATE_TIME";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASC"] == NSOrderedSame) {
            return @(AWSredshiftSortByOrderAsc);
        }
        if ([value caseInsensitiveCompare:@"DESC"] == NSOrderedSame) {
            return @(AWSredshiftSortByOrderDesc);
        }
        return @(AWSredshiftSortByOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftSortByOrderAsc:
                return @"ASC";
            case AWSredshiftSortByOrderDesc:
                return @"DESC";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSredshiftSubnet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subnetAvailabilityZone" : @"SubnetAvailabilityZone",
             @"subnetIdentifier" : @"SubnetIdentifier",
             @"subnetStatus" : @"SubnetStatus",
             };
}

+ (NSValueTransformer *)subnetAvailabilityZoneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftAvailabilityZone class]];
}

@end

@implementation AWSredshiftSupportedOperation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationName" : @"OperationName",
             };
}

@end

@implementation AWSredshiftSupportedPlatform

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSredshiftTableRestoreStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"message" : @"Message",
             @"latestTableName" : @"NewTableName",
             @"progressInMegaBytes" : @"ProgressInMegaBytes",
             @"requestTime" : @"RequestTime",
             @"snapshotIdentifier" : @"SnapshotIdentifier",
             @"sourceDatabaseName" : @"SourceDatabaseName",
             @"sourceSchemaName" : @"SourceSchemaName",
             @"sourceTableName" : @"SourceTableName",
             @"status" : @"Status",
             @"tableRestoreRequestId" : @"TableRestoreRequestId",
             @"targetDatabaseName" : @"TargetDatabaseName",
             @"targetSchemaName" : @"TargetSchemaName",
             @"totalDataInMegaBytes" : @"TotalDataInMegaBytes",
             };
}

+ (NSValueTransformer *)requestTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSredshiftTableRestoreStatusTypePending);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSredshiftTableRestoreStatusTypeInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSredshiftTableRestoreStatusTypeSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSredshiftTableRestoreStatusTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSredshiftTableRestoreStatusTypeCanceled);
        }
        return @(AWSredshiftTableRestoreStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftTableRestoreStatusTypePending:
                return @"PENDING";
            case AWSredshiftTableRestoreStatusTypeInProgress:
                return @"IN_PROGRESS";
            case AWSredshiftTableRestoreStatusTypeSucceeded:
                return @"SUCCEEDED";
            case AWSredshiftTableRestoreStatusTypeFailed:
                return @"FAILED";
            case AWSredshiftTableRestoreStatusTypeCanceled:
                return @"CANCELED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSredshiftTableRestoreStatusMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"tableRestoreStatusDetails" : @"TableRestoreStatusDetails",
             };
}

+ (NSValueTransformer *)tableRestoreStatusDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTableRestoreStatus class]];
}

@end

@implementation AWSredshiftTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSredshiftTaggedResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceName" : @"ResourceName",
             @"resourceType" : @"ResourceType",
             @"tag" : @"Tag",
             };
}

+ (NSValueTransformer *)tagJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftTaggedResourceListMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"taggedResources" : @"TaggedResources",
             };
}

+ (NSValueTransformer *)taggedResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTaggedResource class]];
}

@end

@implementation AWSredshiftTrackListMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maintenanceTracks" : @"MaintenanceTracks",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)maintenanceTracksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftMaintenanceTrack class]];
}

@end

@implementation AWSredshiftUpdateTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"databaseVersion" : @"DatabaseVersion",
             @"maintenanceTrackName" : @"MaintenanceTrackName",
             @"supportedOperations" : @"SupportedOperations",
             };
}

+ (NSValueTransformer *)supportedOperationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftSupportedOperation class]];
}

@end

@implementation AWSredshiftUsageLimit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amount" : @"Amount",
             @"breachAction" : @"BreachAction",
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"featureType" : @"FeatureType",
             @"limitType" : @"LimitType",
             @"period" : @"Period",
             @"tags" : @"Tags",
             @"usageLimitId" : @"UsageLimitId",
             };
}

+ (NSValueTransformer *)breachActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"log"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitBreachActionLog);
        }
        if ([value caseInsensitiveCompare:@"emit-metric"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitBreachActionEmitMetric);
        }
        if ([value caseInsensitiveCompare:@"disable"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitBreachActionDisable);
        }
        return @(AWSredshiftUsageLimitBreachActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftUsageLimitBreachActionLog:
                return @"log";
            case AWSredshiftUsageLimitBreachActionEmitMetric:
                return @"emit-metric";
            case AWSredshiftUsageLimitBreachActionDisable:
                return @"disable";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)featureTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"spectrum"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitFeatureTypeSpectrum);
        }
        if ([value caseInsensitiveCompare:@"concurrency-scaling"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitFeatureTypeConcurrencyScaling);
        }
        return @(AWSredshiftUsageLimitFeatureTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftUsageLimitFeatureTypeSpectrum:
                return @"spectrum";
            case AWSredshiftUsageLimitFeatureTypeConcurrencyScaling:
                return @"concurrency-scaling";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)limitTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"time"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitLimitTypeTime);
        }
        if ([value caseInsensitiveCompare:@"data-scanned"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitLimitTypeDataScanned);
        }
        return @(AWSredshiftUsageLimitLimitTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftUsageLimitLimitTypeTime:
                return @"time";
            case AWSredshiftUsageLimitLimitTypeDataScanned:
                return @"data-scanned";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)periodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"daily"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitPeriodDaily);
        }
        if ([value caseInsensitiveCompare:@"weekly"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitPeriodWeekly);
        }
        if ([value caseInsensitiveCompare:@"monthly"] == NSOrderedSame) {
            return @(AWSredshiftUsageLimitPeriodMonthly);
        }
        return @(AWSredshiftUsageLimitPeriodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSredshiftUsageLimitPeriodDaily:
                return @"daily";
            case AWSredshiftUsageLimitPeriodWeekly:
                return @"weekly";
            case AWSredshiftUsageLimitPeriodMonthly:
                return @"monthly";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftTag class]];
}

@end

@implementation AWSredshiftUsageLimitList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"usageLimits" : @"UsageLimits",
             };
}

+ (NSValueTransformer *)usageLimitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSredshiftUsageLimit class]];
}

@end

@implementation AWSredshiftVpcSecurityGroupMembership

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             @"vpcSecurityGroupId" : @"VpcSecurityGroupId",
             };
}

@end
