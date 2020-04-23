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

#import "AWSrdsModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSrdsErrorDomain = @"com.amazonaws.AWSrdsErrorDomain";

@implementation AWSrdsAccountAttributesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountQuotas" : @"AccountQuotas",
             };
}

+ (NSValueTransformer *)accountQuotasJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsAccountQuota class]];
}

@end

@implementation AWSrdsAccountQuota

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountQuotaName" : @"AccountQuotaName",
             @"max" : @"Max",
             @"used" : @"Used",
             };
}

@end

@implementation AWSrdsAddRoleToDBClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"featureName" : @"FeatureName",
             @"roleArn" : @"RoleArn",
             };
}

@end

@implementation AWSrdsAddRoleToDBInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"featureName" : @"FeatureName",
             @"roleArn" : @"RoleArn",
             };
}

@end

@implementation AWSrdsAddSourceIdentifierToSubscriptionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceIdentifier" : @"SourceIdentifier",
             @"subscriptionName" : @"SubscriptionName",
             };
}

@end

@implementation AWSrdsAddSourceIdentifierToSubscriptionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscription" : @"EventSubscription",
             };
}

+ (NSValueTransformer *)eventSubscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsEventSubscription class]];
}

@end

@implementation AWSrdsAddTagsToResourceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceName" : @"ResourceName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsApplyPendingMaintenanceActionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyAction" : @"ApplyAction",
             @"optInType" : @"OptInType",
             @"resourceIdentifier" : @"ResourceIdentifier",
             };
}

@end

@implementation AWSrdsApplyPendingMaintenanceActionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourcePendingMaintenanceActions" : @"ResourcePendingMaintenanceActions",
             };
}

+ (NSValueTransformer *)resourcePendingMaintenanceActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsResourcePendingMaintenanceActions class]];
}

@end

@implementation AWSrdsAuthorizeDBSecurityGroupIngressMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"CIDRIP" : @"CIDRIP",
             @"DBSecurityGroupName" : @"DBSecurityGroupName",
             @"EC2SecurityGroupId" : @"EC2SecurityGroupId",
             @"EC2SecurityGroupName" : @"EC2SecurityGroupName",
             @"EC2SecurityGroupOwnerId" : @"EC2SecurityGroupOwnerId",
             };
}

@end

@implementation AWSrdsAuthorizeDBSecurityGroupIngressResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSecurityGroup" : @"DBSecurityGroup",
             };
}

+ (NSValueTransformer *)DBSecurityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBSecurityGroup class]];
}

@end

@implementation AWSrdsAvailabilityZone

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSrdsAvailableProcessorFeature

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedValues" : @"AllowedValues",
             @"defaultValue" : @"DefaultValue",
             @"name" : @"Name",
             };
}

@end

@implementation AWSrdsBacktrackDBClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backtrackTo" : @"BacktrackTo",
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"force" : @"Force",
             @"useEarliestTimeOnPointInTimeUnavailable" : @"UseEarliestTimeOnPointInTimeUnavailable",
             };
}

+ (NSValueTransformer *)backtrackToJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSrdsCancelExportTaskMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportTaskIdentifier" : @"ExportTaskIdentifier",
             };
}

@end

@implementation AWSrdsCertificate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"CertificateArn",
             @"certificateIdentifier" : @"CertificateIdentifier",
             @"certificateType" : @"CertificateType",
             @"customerOverride" : @"CustomerOverride",
             @"customerOverrideValidTill" : @"CustomerOverrideValidTill",
             @"thumbprint" : @"Thumbprint",
             @"validFrom" : @"ValidFrom",
             @"validTill" : @"ValidTill",
             };
}

+ (NSValueTransformer *)customerOverrideValidTillJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)validFromJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)validTillJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSrdsCertificateMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificates" : @"Certificates",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)certificatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsCertificate class]];
}

@end

@implementation AWSrdsCharacterSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"characterSetDescription" : @"CharacterSetDescription",
             @"characterSetName" : @"CharacterSetName",
             };
}

@end

@implementation AWSrdsCloudwatchLogsExportConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"disableLogTypes" : @"DisableLogTypes",
             @"enableLogTypes" : @"EnableLogTypes",
             };
}

@end

@implementation AWSrdsConnectionPoolConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionBorrowTimeout" : @"ConnectionBorrowTimeout",
             @"initQuery" : @"InitQuery",
             @"maxConnectionsPercent" : @"MaxConnectionsPercent",
             @"maxIdleConnectionsPercent" : @"MaxIdleConnectionsPercent",
             @"sessionPinningFilters" : @"SessionPinningFilters",
             };
}

@end

@implementation AWSrdsConnectionPoolConfigurationInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionBorrowTimeout" : @"ConnectionBorrowTimeout",
             @"initQuery" : @"InitQuery",
             @"maxConnectionsPercent" : @"MaxConnectionsPercent",
             @"maxIdleConnectionsPercent" : @"MaxIdleConnectionsPercent",
             @"sessionPinningFilters" : @"SessionPinningFilters",
             };
}

@end

@implementation AWSrdsReplicateDBClusterParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceDBClusterParameterGroupIdentifier" : @"SourceDBClusterParameterGroupIdentifier",
             @"tags" : @"Tags",
             @"targetDBClusterParameterGroupDescription" : @"TargetDBClusterParameterGroupDescription",
             @"targetDBClusterParameterGroupIdentifier" : @"TargetDBClusterParameterGroupIdentifier",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsReplicateDBClusterParameterGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroup" : @"DBClusterParameterGroup",
             };
}

+ (NSValueTransformer *)DBClusterParameterGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBClusterParameterGroup class]];
}

@end

@implementation AWSrdsReplicateDBClusterSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicateTags" : @"CopyTags",
             @"kmsKeyId" : @"KmsKeyId",
             @"preSignedUrl" : @"PreSignedUrl",
             @"sourceDBClusterSnapshotIdentifier" : @"SourceDBClusterSnapshotIdentifier",
             @"tags" : @"Tags",
             @"targetDBClusterSnapshotIdentifier" : @"TargetDBClusterSnapshotIdentifier",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsReplicateDBClusterSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterSnapshot" : @"DBClusterSnapshot",
             };
}

+ (NSValueTransformer *)DBClusterSnapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBClusterSnapshot class]];
}

@end

@implementation AWSrdsReplicateDBParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceDBParameterGroupIdentifier" : @"SourceDBParameterGroupIdentifier",
             @"tags" : @"Tags",
             @"targetDBParameterGroupDescription" : @"TargetDBParameterGroupDescription",
             @"targetDBParameterGroupIdentifier" : @"TargetDBParameterGroupIdentifier",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsReplicateDBParameterGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroup" : @"DBParameterGroup",
             };
}

+ (NSValueTransformer *)DBParameterGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBParameterGroup class]];
}

@end

@implementation AWSrdsReplicateDBSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicateTags" : @"CopyTags",
             @"kmsKeyId" : @"KmsKeyId",
             @"optionGroupName" : @"OptionGroupName",
             @"preSignedUrl" : @"PreSignedUrl",
             @"sourceDBSnapshotIdentifier" : @"SourceDBSnapshotIdentifier",
             @"tags" : @"Tags",
             @"targetDBSnapshotIdentifier" : @"TargetDBSnapshotIdentifier",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsReplicateDBSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshot" : @"DBSnapshot",
             };
}

+ (NSValueTransformer *)DBSnapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBSnapshot class]];
}

@end

@implementation AWSrdsReplicateOptionGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceOptionGroupIdentifier" : @"SourceOptionGroupIdentifier",
             @"tags" : @"Tags",
             @"targetOptionGroupDescription" : @"TargetOptionGroupDescription",
             @"targetOptionGroupIdentifier" : @"TargetOptionGroupIdentifier",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsReplicateOptionGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"optionGroup" : @"OptionGroup",
             };
}

+ (NSValueTransformer *)optionGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsOptionGroup class]];
}

@end

@implementation AWSrdsCreateCustomAvailabilityZoneMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customAvailabilityZoneName" : @"CustomAvailabilityZoneName",
             @"existingVpnId" : @"ExistingVpnId",
             @"latestVpnTunnelName" : @"NewVpnTunnelName",
             @"vpnTunnelOriginatorIP" : @"VpnTunnelOriginatorIP",
             };
}

@end

@implementation AWSrdsCreateCustomAvailabilityZoneResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customAvailabilityZone" : @"CustomAvailabilityZone",
             };
}

+ (NSValueTransformer *)customAvailabilityZoneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsCustomAvailabilityZone class]];
}

@end

@implementation AWSrdsCreateDBClusterEndpointMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterEndpointIdentifier" : @"DBClusterEndpointIdentifier",
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"endpointType" : @"EndpointType",
             @"excludedMembers" : @"ExcludedMembers",
             @"staticMembers" : @"StaticMembers",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsCreateDBClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"backtrackWindow" : @"BacktrackWindow",
             @"backupRetentionPeriod" : @"BackupRetentionPeriod",
             @"characterSetName" : @"CharacterSetName",
             @"replicateTagsToSnapshot" : @"CopyTagsToSnapshot",
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"DBClusterParameterGroupName" : @"DBClusterParameterGroupName",
             @"DBSubnetGroupName" : @"DBSubnetGroupName",
             @"databaseName" : @"DatabaseName",
             @"deletionProtection" : @"DeletionProtection",
             @"domain" : @"Domain",
             @"domainIAMRoleName" : @"DomainIAMRoleName",
             @"enableCloudwatchLogsExports" : @"EnableCloudwatchLogsExports",
             @"enableHttpEndpoint" : @"EnableHttpEndpoint",
             @"enableIAMDatabaseAuthentication" : @"EnableIAMDatabaseAuthentication",
             @"engine" : @"Engine",
             @"engineMode" : @"EngineMode",
             @"engineVersion" : @"EngineVersion",
             @"globalClusterIdentifier" : @"GlobalClusterIdentifier",
             @"kmsKeyId" : @"KmsKeyId",
             @"masterUserPassword" : @"MasterUserPassword",
             @"masterUsername" : @"MasterUsername",
             @"optionGroupName" : @"OptionGroupName",
             @"port" : @"Port",
             @"preSignedUrl" : @"PreSignedUrl",
             @"preferredBackupWindow" : @"PreferredBackupWindow",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"replicationSourceIdentifier" : @"ReplicationSourceIdentifier",
             @"scalingConfiguration" : @"ScalingConfiguration",
             @"storageEncrypted" : @"StorageEncrypted",
             @"tags" : @"Tags",
             @"vpcSecurityGroupIds" : @"VpcSecurityGroupIds",
             };
}

+ (NSValueTransformer *)scalingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsScalingConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsCreateDBClusterParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroupName" : @"DBClusterParameterGroupName",
             @"DBParameterGroupFamily" : @"DBParameterGroupFamily",
             @"detail" : @"Description",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsCreateDBClusterParameterGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroup" : @"DBClusterParameterGroup",
             };
}

+ (NSValueTransformer *)DBClusterParameterGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBClusterParameterGroup class]];
}

@end

@implementation AWSrdsCreateDBClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBCluster" : @"DBCluster",
             };
}

+ (NSValueTransformer *)DBClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBCluster class]];
}

@end

@implementation AWSrdsCreateDBClusterSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"DBClusterSnapshotIdentifier" : @"DBClusterSnapshotIdentifier",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsCreateDBClusterSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterSnapshot" : @"DBClusterSnapshot",
             };
}

+ (NSValueTransformer *)DBClusterSnapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBClusterSnapshot class]];
}

@end

@implementation AWSrdsCreateDBInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedStorage" : @"AllocatedStorage",
             @"autoMinorVersionUpgrade" : @"AutoMinorVersionUpgrade",
             @"availabilityZone" : @"AvailabilityZone",
             @"backupRetentionPeriod" : @"BackupRetentionPeriod",
             @"characterSetName" : @"CharacterSetName",
             @"replicateTagsToSnapshot" : @"CopyTagsToSnapshot",
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"DBInstanceClass" : @"DBInstanceClass",
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"DBName" : @"DBName",
             @"DBParameterGroupName" : @"DBParameterGroupName",
             @"DBSecurityGroups" : @"DBSecurityGroups",
             @"DBSubnetGroupName" : @"DBSubnetGroupName",
             @"deletionProtection" : @"DeletionProtection",
             @"domain" : @"Domain",
             @"domainIAMRoleName" : @"DomainIAMRoleName",
             @"enableCloudwatchLogsExports" : @"EnableCloudwatchLogsExports",
             @"enableIAMDatabaseAuthentication" : @"EnableIAMDatabaseAuthentication",
             @"enablePerformanceInsights" : @"EnablePerformanceInsights",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"iops" : @"Iops",
             @"kmsKeyId" : @"KmsKeyId",
             @"licenseModel" : @"LicenseModel",
             @"masterUserPassword" : @"MasterUserPassword",
             @"masterUsername" : @"MasterUsername",
             @"maxAllocatedStorage" : @"MaxAllocatedStorage",
             @"monitoringInterval" : @"MonitoringInterval",
             @"monitoringRoleArn" : @"MonitoringRoleArn",
             @"multiAZ" : @"MultiAZ",
             @"optionGroupName" : @"OptionGroupName",
             @"performanceInsightsKMSKeyId" : @"PerformanceInsightsKMSKeyId",
             @"performanceInsightsRetentionPeriod" : @"PerformanceInsightsRetentionPeriod",
             @"port" : @"Port",
             @"preferredBackupWindow" : @"PreferredBackupWindow",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"processorFeatures" : @"ProcessorFeatures",
             @"promotionTier" : @"PromotionTier",
             @"publiclyAccessible" : @"PubliclyAccessible",
             @"storageEncrypted" : @"StorageEncrypted",
             @"storageType" : @"StorageType",
             @"tags" : @"Tags",
             @"tdeCredentialArn" : @"TdeCredentialArn",
             @"tdeCredentialPassword" : @"TdeCredentialPassword",
             @"timezone" : @"Timezone",
             @"vpcSecurityGroupIds" : @"VpcSecurityGroupIds",
             };
}

+ (NSValueTransformer *)processorFeaturesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsProcessorFeature class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsCreateDBInstanceReadReplicaMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMinorVersionUpgrade" : @"AutoMinorVersionUpgrade",
             @"availabilityZone" : @"AvailabilityZone",
             @"replicateTagsToSnapshot" : @"CopyTagsToSnapshot",
             @"DBInstanceClass" : @"DBInstanceClass",
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"DBParameterGroupName" : @"DBParameterGroupName",
             @"DBSubnetGroupName" : @"DBSubnetGroupName",
             @"deletionProtection" : @"DeletionProtection",
             @"domain" : @"Domain",
             @"domainIAMRoleName" : @"DomainIAMRoleName",
             @"enableCloudwatchLogsExports" : @"EnableCloudwatchLogsExports",
             @"enableIAMDatabaseAuthentication" : @"EnableIAMDatabaseAuthentication",
             @"enablePerformanceInsights" : @"EnablePerformanceInsights",
             @"iops" : @"Iops",
             @"kmsKeyId" : @"KmsKeyId",
             @"monitoringInterval" : @"MonitoringInterval",
             @"monitoringRoleArn" : @"MonitoringRoleArn",
             @"multiAZ" : @"MultiAZ",
             @"optionGroupName" : @"OptionGroupName",
             @"performanceInsightsKMSKeyId" : @"PerformanceInsightsKMSKeyId",
             @"performanceInsightsRetentionPeriod" : @"PerformanceInsightsRetentionPeriod",
             @"port" : @"Port",
             @"preSignedUrl" : @"PreSignedUrl",
             @"processorFeatures" : @"ProcessorFeatures",
             @"publiclyAccessible" : @"PubliclyAccessible",
             @"sourceDBInstanceIdentifier" : @"SourceDBInstanceIdentifier",
             @"storageType" : @"StorageType",
             @"tags" : @"Tags",
             @"useDefaultProcessorFeatures" : @"UseDefaultProcessorFeatures",
             @"vpcSecurityGroupIds" : @"VpcSecurityGroupIds",
             };
}

+ (NSValueTransformer *)processorFeaturesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsProcessorFeature class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsCreateDBInstanceReadReplicaResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBInstance class]];
}

@end

@implementation AWSrdsCreateDBInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBInstance class]];
}

@end

@implementation AWSrdsCreateDBParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupFamily" : @"DBParameterGroupFamily",
             @"DBParameterGroupName" : @"DBParameterGroupName",
             @"detail" : @"Description",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsCreateDBParameterGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroup" : @"DBParameterGroup",
             };
}

+ (NSValueTransformer *)DBParameterGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBParameterGroup class]];
}

@end

@implementation AWSrdsCreateDBProxyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"auth" : @"Auth",
             @"DBProxyName" : @"DBProxyName",
             @"debugLogging" : @"DebugLogging",
             @"engineFamily" : @"EngineFamily",
             @"idleClientTimeout" : @"IdleClientTimeout",
             @"requireTLS" : @"RequireTLS",
             @"roleArn" : @"RoleArn",
             @"tags" : @"Tags",
             @"vpcSecurityGroupIds" : @"VpcSecurityGroupIds",
             @"vpcSubnetIds" : @"VpcSubnetIds",
             };
}

+ (NSValueTransformer *)authJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsUserAuthConfig class]];
}

+ (NSValueTransformer *)engineFamilyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MYSQL"] == NSOrderedSame) {
            return @(AWSrdsEngineFamilyMysql);
        }
        if ([value caseInsensitiveCompare:@"POSTGRESQL"] == NSOrderedSame) {
            return @(AWSrdsEngineFamilyPostgresql);
        }
        return @(AWSrdsEngineFamilyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSrdsEngineFamilyMysql:
                return @"MYSQL";
            case AWSrdsEngineFamilyPostgresql:
                return @"POSTGRESQL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsCreateDBProxyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBProxy" : @"DBProxy",
             };
}

+ (NSValueTransformer *)DBProxyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBProxy class]];
}

@end

@implementation AWSrdsCreateDBSecurityGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSecurityGroupDescription" : @"DBSecurityGroupDescription",
             @"DBSecurityGroupName" : @"DBSecurityGroupName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsCreateDBSecurityGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSecurityGroup" : @"DBSecurityGroup",
             };
}

+ (NSValueTransformer *)DBSecurityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBSecurityGroup class]];
}

@end

@implementation AWSrdsCreateDBSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"DBSnapshotIdentifier" : @"DBSnapshotIdentifier",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsCreateDBSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshot" : @"DBSnapshot",
             };
}

+ (NSValueTransformer *)DBSnapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBSnapshot class]];
}

@end

@implementation AWSrdsCreateDBSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSubnetGroupDescription" : @"DBSubnetGroupDescription",
             @"DBSubnetGroupName" : @"DBSubnetGroupName",
             @"subnetIds" : @"SubnetIds",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsCreateDBSubnetGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSubnetGroup" : @"DBSubnetGroup",
             };
}

+ (NSValueTransformer *)DBSubnetGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBSubnetGroup class]];
}

@end

@implementation AWSrdsCreateEventSubscriptionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"eventCategories" : @"EventCategories",
             @"snsTopicArn" : @"SnsTopicArn",
             @"sourceIds" : @"SourceIds",
             @"sourceType" : @"SourceType",
             @"subscriptionName" : @"SubscriptionName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsCreateEventSubscriptionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscription" : @"EventSubscription",
             };
}

+ (NSValueTransformer *)eventSubscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsEventSubscription class]];
}

@end

@implementation AWSrdsCreateGlobalClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"databaseName" : @"DatabaseName",
             @"deletionProtection" : @"DeletionProtection",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"globalClusterIdentifier" : @"GlobalClusterIdentifier",
             @"sourceDBClusterIdentifier" : @"SourceDBClusterIdentifier",
             @"storageEncrypted" : @"StorageEncrypted",
             };
}

@end

@implementation AWSrdsCreateGlobalClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalCluster" : @"GlobalCluster",
             };
}

+ (NSValueTransformer *)globalClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsGlobalCluster class]];
}

@end

@implementation AWSrdsCreateOptionGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"engineName" : @"EngineName",
             @"majorEngineVersion" : @"MajorEngineVersion",
             @"optionGroupDescription" : @"OptionGroupDescription",
             @"optionGroupName" : @"OptionGroupName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsCreateOptionGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"optionGroup" : @"OptionGroup",
             };
}

+ (NSValueTransformer *)optionGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsOptionGroup class]];
}

@end

@implementation AWSrdsCustomAvailabilityZone

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customAvailabilityZoneId" : @"CustomAvailabilityZoneId",
             @"customAvailabilityZoneName" : @"CustomAvailabilityZoneName",
             @"customAvailabilityZoneStatus" : @"CustomAvailabilityZoneStatus",
             @"vpnDetails" : @"VpnDetails",
             };
}

+ (NSValueTransformer *)vpnDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsVpnDetails class]];
}

@end

@implementation AWSrdsCustomAvailabilityZoneMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customAvailabilityZones" : @"CustomAvailabilityZones",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)customAvailabilityZonesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsCustomAvailabilityZone class]];
}

@end

@implementation AWSrdsDBCluster

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activityStreamKinesisStreamName" : @"ActivityStreamKinesisStreamName",
             @"activityStreamKmsKeyId" : @"ActivityStreamKmsKeyId",
             @"activityStreamMode" : @"ActivityStreamMode",
             @"activityStreamStatus" : @"ActivityStreamStatus",
             @"allocatedStorage" : @"AllocatedStorage",
             @"associatedRoles" : @"AssociatedRoles",
             @"availabilityZones" : @"AvailabilityZones",
             @"backtrackConsumedChangeRecords" : @"BacktrackConsumedChangeRecords",
             @"backtrackWindow" : @"BacktrackWindow",
             @"backupRetentionPeriod" : @"BackupRetentionPeriod",
             @"capacity" : @"Capacity",
             @"characterSetName" : @"CharacterSetName",
             @"cloneGroupId" : @"CloneGroupId",
             @"clusterCreateTime" : @"ClusterCreateTime",
             @"replicateTagsToSnapshot" : @"CopyTagsToSnapshot",
             @"crossAccountClone" : @"CrossAccountClone",
             @"customEndpoints" : @"CustomEndpoints",
             @"DBClusterArn" : @"DBClusterArn",
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"DBClusterMembers" : @"DBClusterMembers",
             @"DBClusterOptionGroupMemberships" : @"DBClusterOptionGroupMemberships",
             @"DBClusterParameterGroup" : @"DBClusterParameterGroup",
             @"DBSubnetGroup" : @"DBSubnetGroup",
             @"databaseName" : @"DatabaseName",
             @"dbClusterResourceId" : @"DbClusterResourceId",
             @"deletionProtection" : @"DeletionProtection",
             @"domainMemberships" : @"DomainMemberships",
             @"earliestBacktrackTime" : @"EarliestBacktrackTime",
             @"earliestRestorableTime" : @"EarliestRestorableTime",
             @"enabledCloudwatchLogsExports" : @"EnabledCloudwatchLogsExports",
             @"endpoint" : @"Endpoint",
             @"engine" : @"Engine",
             @"engineMode" : @"EngineMode",
             @"engineVersion" : @"EngineVersion",
             @"hostedZoneId" : @"HostedZoneId",
             @"httpEndpointEnabled" : @"HttpEndpointEnabled",
             @"IAMDatabaseAuthenticationEnabled" : @"IAMDatabaseAuthenticationEnabled",
             @"kmsKeyId" : @"KmsKeyId",
             @"latestRestorableTime" : @"LatestRestorableTime",
             @"masterUsername" : @"MasterUsername",
             @"multiAZ" : @"MultiAZ",
             @"percentProgress" : @"PercentProgress",
             @"port" : @"Port",
             @"preferredBackupWindow" : @"PreferredBackupWindow",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"readReplicaIdentifiers" : @"ReadReplicaIdentifiers",
             @"readerEndpoint" : @"ReaderEndpoint",
             @"replicationSourceIdentifier" : @"ReplicationSourceIdentifier",
             @"scalingConfigurationInfo" : @"ScalingConfigurationInfo",
             @"status" : @"Status",
             @"storageEncrypted" : @"StorageEncrypted",
             @"vpcSecurityGroups" : @"VpcSecurityGroups",
             };
}

+ (NSValueTransformer *)activityStreamModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"sync"] == NSOrderedSame) {
            return @(AWSrdsActivityStreamModeSync);
        }
        if ([value caseInsensitiveCompare:@"async"] == NSOrderedSame) {
            return @(AWSrdsActivityStreamModeAsync);
        }
        return @(AWSrdsActivityStreamModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSrdsActivityStreamModeSync:
                return @"sync";
            case AWSrdsActivityStreamModeAsync:
                return @"async";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)activityStreamStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"stopped"] == NSOrderedSame) {
            return @(AWSrdsActivityStreamStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"starting"] == NSOrderedSame) {
            return @(AWSrdsActivityStreamStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"started"] == NSOrderedSame) {
            return @(AWSrdsActivityStreamStatusStarted);
        }
        if ([value caseInsensitiveCompare:@"stopping"] == NSOrderedSame) {
            return @(AWSrdsActivityStreamStatusStopping);
        }
        return @(AWSrdsActivityStreamStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSrdsActivityStreamStatusStopped:
                return @"stopped";
            case AWSrdsActivityStreamStatusStarting:
                return @"starting";
            case AWSrdsActivityStreamStatusStarted:
                return @"started";
            case AWSrdsActivityStreamStatusStopping:
                return @"stopping";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)associatedRolesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBClusterRole class]];
}

+ (NSValueTransformer *)clusterCreateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)DBClusterMembersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBClusterMember class]];
}

+ (NSValueTransformer *)DBClusterOptionGroupMembershipsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBClusterOptionGroupStatus class]];
}

+ (NSValueTransformer *)domainMembershipsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDomainMembership class]];
}

+ (NSValueTransformer *)earliestBacktrackTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)earliestRestorableTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)latestRestorableTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)scalingConfigurationInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsScalingConfigurationInfo class]];
}

+ (NSValueTransformer *)vpcSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsVpcSecurityGroupMembership class]];
}

@end

@implementation AWSrdsDBClusterBacktrack

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backtrackIdentifier" : @"BacktrackIdentifier",
             @"backtrackRequestCreationTime" : @"BacktrackRequestCreationTime",
             @"backtrackTo" : @"BacktrackTo",
             @"backtrackedFrom" : @"BacktrackedFrom",
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)backtrackRequestCreationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)backtrackToJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)backtrackedFromJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSrdsDBClusterBacktrackMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterBacktracks" : @"DBClusterBacktracks",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBClusterBacktracksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBClusterBacktrack class]];
}

@end

@implementation AWSrdsDBClusterCapacityInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentCapacity" : @"CurrentCapacity",
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"pendingCapacity" : @"PendingCapacity",
             @"secondsBeforeTimeout" : @"SecondsBeforeTimeout",
             @"timeoutAction" : @"TimeoutAction",
             };
}

@end

@implementation AWSrdsDBClusterEndpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customEndpointType" : @"CustomEndpointType",
             @"DBClusterEndpointArn" : @"DBClusterEndpointArn",
             @"DBClusterEndpointIdentifier" : @"DBClusterEndpointIdentifier",
             @"DBClusterEndpointResourceIdentifier" : @"DBClusterEndpointResourceIdentifier",
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"endpoint" : @"Endpoint",
             @"endpointType" : @"EndpointType",
             @"excludedMembers" : @"ExcludedMembers",
             @"staticMembers" : @"StaticMembers",
             @"status" : @"Status",
             };
}

@end

@implementation AWSrdsDBClusterEndpointMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterEndpoints" : @"DBClusterEndpoints",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBClusterEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBClusterEndpoint class]];
}

@end

@implementation AWSrdsDBClusterMember

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroupStatus" : @"DBClusterParameterGroupStatus",
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"isClusterWriter" : @"IsClusterWriter",
             @"promotionTier" : @"PromotionTier",
             };
}

@end

@implementation AWSrdsDBClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusters" : @"DBClusters",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBClustersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBCluster class]];
}

@end

@implementation AWSrdsDBClusterOptionGroupStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterOptionGroupName" : @"DBClusterOptionGroupName",
             @"status" : @"Status",
             };
}

@end

@implementation AWSrdsDBClusterParameterGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroupArn" : @"DBClusterParameterGroupArn",
             @"DBClusterParameterGroupName" : @"DBClusterParameterGroupName",
             @"DBParameterGroupFamily" : @"DBParameterGroupFamily",
             @"detail" : @"Description",
             };
}

@end

@implementation AWSrdsDBClusterParameterGroupDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsParameter class]];
}

@end

@implementation AWSrdsDBClusterParameterGroupNameMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroupName" : @"DBClusterParameterGroupName",
             };
}

@end

@implementation AWSrdsDBClusterParameterGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroups" : @"DBClusterParameterGroups",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBClusterParameterGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBClusterParameterGroup class]];
}

@end

@implementation AWSrdsDBClusterRole

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"featureName" : @"FeatureName",
             @"roleArn" : @"RoleArn",
             @"status" : @"Status",
             };
}

@end

@implementation AWSrdsDBClusterSnapshot

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedStorage" : @"AllocatedStorage",
             @"availabilityZones" : @"AvailabilityZones",
             @"clusterCreateTime" : @"ClusterCreateTime",
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"DBClusterSnapshotArn" : @"DBClusterSnapshotArn",
             @"DBClusterSnapshotIdentifier" : @"DBClusterSnapshotIdentifier",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"IAMDatabaseAuthenticationEnabled" : @"IAMDatabaseAuthenticationEnabled",
             @"kmsKeyId" : @"KmsKeyId",
             @"licenseModel" : @"LicenseModel",
             @"masterUsername" : @"MasterUsername",
             @"percentProgress" : @"PercentProgress",
             @"port" : @"Port",
             @"snapshotCreateTime" : @"SnapshotCreateTime",
             @"snapshotType" : @"SnapshotType",
             @"sourceDBClusterSnapshotArn" : @"SourceDBClusterSnapshotArn",
             @"status" : @"Status",
             @"storageEncrypted" : @"StorageEncrypted",
             @"vpcId" : @"VpcId",
             };
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

@end

@implementation AWSrdsDBClusterSnapshotAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"attributeValues" : @"AttributeValues",
             };
}

@end

@implementation AWSrdsDBClusterSnapshotAttributesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterSnapshotAttributes" : @"DBClusterSnapshotAttributes",
             @"DBClusterSnapshotIdentifier" : @"DBClusterSnapshotIdentifier",
             };
}

+ (NSValueTransformer *)DBClusterSnapshotAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBClusterSnapshotAttribute class]];
}

@end

@implementation AWSrdsDBClusterSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterSnapshots" : @"DBClusterSnapshots",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBClusterSnapshotsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBClusterSnapshot class]];
}

@end

@implementation AWSrdsDBEngineVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBEngineDescription" : @"DBEngineDescription",
             @"DBEngineVersionDescription" : @"DBEngineVersionDescription",
             @"DBParameterGroupFamily" : @"DBParameterGroupFamily",
             @"defaultCharacterSet" : @"DefaultCharacterSet",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"exportableLogTypes" : @"ExportableLogTypes",
             @"status" : @"Status",
             @"supportedCharacterSets" : @"SupportedCharacterSets",
             @"supportedEngineModes" : @"SupportedEngineModes",
             @"supportedFeatureNames" : @"SupportedFeatureNames",
             @"supportedTimezones" : @"SupportedTimezones",
             @"supportsLogExportsToCloudwatchLogs" : @"SupportsLogExportsToCloudwatchLogs",
             @"supportsReadReplica" : @"SupportsReadReplica",
             @"validUpgradeTarget" : @"ValidUpgradeTarget",
             };
}

+ (NSValueTransformer *)defaultCharacterSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsCharacterSet class]];
}

+ (NSValueTransformer *)supportedCharacterSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsCharacterSet class]];
}

+ (NSValueTransformer *)supportedTimezonesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTimezone class]];
}

+ (NSValueTransformer *)validUpgradeTargetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsUpgradeTarget class]];
}

@end

@implementation AWSrdsDBEngineVersionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBEngineVersions" : @"DBEngineVersions",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBEngineVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBEngineVersion class]];
}

@end

@implementation AWSrdsDBInstance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedStorage" : @"AllocatedStorage",
             @"associatedRoles" : @"AssociatedRoles",
             @"autoMinorVersionUpgrade" : @"AutoMinorVersionUpgrade",
             @"availabilityZone" : @"AvailabilityZone",
             @"backupRetentionPeriod" : @"BackupRetentionPeriod",
             @"CACertificateIdentifier" : @"CACertificateIdentifier",
             @"characterSetName" : @"CharacterSetName",
             @"replicateTagsToSnapshot" : @"CopyTagsToSnapshot",
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"DBInstanceArn" : @"DBInstanceArn",
             @"DBInstanceClass" : @"DBInstanceClass",
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"DBInstanceStatus" : @"DBInstanceStatus",
             @"DBName" : @"DBName",
             @"DBParameterGroups" : @"DBParameterGroups",
             @"DBSecurityGroups" : @"DBSecurityGroups",
             @"DBSubnetGroup" : @"DBSubnetGroup",
             @"dbInstancePort" : @"DbInstancePort",
             @"dbiResourceId" : @"DbiResourceId",
             @"deletionProtection" : @"DeletionProtection",
             @"domainMemberships" : @"DomainMemberships",
             @"enabledCloudwatchLogsExports" : @"EnabledCloudwatchLogsExports",
             @"endpoint" : @"Endpoint",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"enhancedMonitoringResourceArn" : @"EnhancedMonitoringResourceArn",
             @"IAMDatabaseAuthenticationEnabled" : @"IAMDatabaseAuthenticationEnabled",
             @"instanceCreateTime" : @"InstanceCreateTime",
             @"iops" : @"Iops",
             @"kmsKeyId" : @"KmsKeyId",
             @"latestRestorableTime" : @"LatestRestorableTime",
             @"licenseModel" : @"LicenseModel",
             @"listenerEndpoint" : @"ListenerEndpoint",
             @"masterUsername" : @"MasterUsername",
             @"maxAllocatedStorage" : @"MaxAllocatedStorage",
             @"monitoringInterval" : @"MonitoringInterval",
             @"monitoringRoleArn" : @"MonitoringRoleArn",
             @"multiAZ" : @"MultiAZ",
             @"optionGroupMemberships" : @"OptionGroupMemberships",
             @"pendingModifiedValues" : @"PendingModifiedValues",
             @"performanceInsightsEnabled" : @"PerformanceInsightsEnabled",
             @"performanceInsightsKMSKeyId" : @"PerformanceInsightsKMSKeyId",
             @"performanceInsightsRetentionPeriod" : @"PerformanceInsightsRetentionPeriod",
             @"preferredBackupWindow" : @"PreferredBackupWindow",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"processorFeatures" : @"ProcessorFeatures",
             @"promotionTier" : @"PromotionTier",
             @"publiclyAccessible" : @"PubliclyAccessible",
             @"readReplicaDBClusterIdentifiers" : @"ReadReplicaDBClusterIdentifiers",
             @"readReplicaDBInstanceIdentifiers" : @"ReadReplicaDBInstanceIdentifiers",
             @"readReplicaSourceDBInstanceIdentifier" : @"ReadReplicaSourceDBInstanceIdentifier",
             @"secondaryAvailabilityZone" : @"SecondaryAvailabilityZone",
             @"statusInfos" : @"StatusInfos",
             @"storageEncrypted" : @"StorageEncrypted",
             @"storageType" : @"StorageType",
             @"tdeCredentialArn" : @"TdeCredentialArn",
             @"timezone" : @"Timezone",
             @"vpcSecurityGroups" : @"VpcSecurityGroups",
             };
}

+ (NSValueTransformer *)associatedRolesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBInstanceRole class]];
}

+ (NSValueTransformer *)DBParameterGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBParameterGroupStatus class]];
}

+ (NSValueTransformer *)DBSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBSecurityGroupMembership class]];
}

+ (NSValueTransformer *)DBSubnetGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBSubnetGroup class]];
}

+ (NSValueTransformer *)domainMembershipsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDomainMembership class]];
}

+ (NSValueTransformer *)endpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsEndpoint class]];
}

+ (NSValueTransformer *)instanceCreateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)latestRestorableTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)listenerEndpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsEndpoint class]];
}

+ (NSValueTransformer *)optionGroupMembershipsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsOptionGroupMembership class]];
}

+ (NSValueTransformer *)pendingModifiedValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsPendingModifiedValues class]];
}

+ (NSValueTransformer *)processorFeaturesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsProcessorFeature class]];
}

+ (NSValueTransformer *)statusInfosJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBInstanceStatusInfo class]];
}

+ (NSValueTransformer *)vpcSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsVpcSecurityGroupMembership class]];
}

@end

@implementation AWSrdsDBInstanceAutomatedBackup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedStorage" : @"AllocatedStorage",
             @"availabilityZone" : @"AvailabilityZone",
             @"DBInstanceArn" : @"DBInstanceArn",
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"dbiResourceId" : @"DbiResourceId",
             @"encrypted" : @"Encrypted",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"IAMDatabaseAuthenticationEnabled" : @"IAMDatabaseAuthenticationEnabled",
             @"instanceCreateTime" : @"InstanceCreateTime",
             @"iops" : @"Iops",
             @"kmsKeyId" : @"KmsKeyId",
             @"licenseModel" : @"LicenseModel",
             @"masterUsername" : @"MasterUsername",
             @"optionGroupName" : @"OptionGroupName",
             @"port" : @"Port",
             @"region" : @"Region",
             @"restoreWindow" : @"RestoreWindow",
             @"status" : @"Status",
             @"storageType" : @"StorageType",
             @"tdeCredentialArn" : @"TdeCredentialArn",
             @"timezone" : @"Timezone",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)instanceCreateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)restoreWindowJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsRestoreWindow class]];
}

@end

@implementation AWSrdsDBInstanceAutomatedBackupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceAutomatedBackups" : @"DBInstanceAutomatedBackups",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBInstanceAutomatedBackupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBInstanceAutomatedBackup class]];
}

@end

@implementation AWSrdsDBInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstances" : @"DBInstances",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBInstance class]];
}

@end

@implementation AWSrdsDBInstanceRole

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"featureName" : @"FeatureName",
             @"roleArn" : @"RoleArn",
             @"status" : @"Status",
             };
}

@end

@implementation AWSrdsDBInstanceStatusInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"normal" : @"Normal",
             @"status" : @"Status",
             @"statusType" : @"StatusType",
             };
}

@end

@implementation AWSrdsDBParameterGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupArn" : @"DBParameterGroupArn",
             @"DBParameterGroupFamily" : @"DBParameterGroupFamily",
             @"DBParameterGroupName" : @"DBParameterGroupName",
             @"detail" : @"Description",
             };
}

@end

@implementation AWSrdsDBParameterGroupDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsParameter class]];
}

@end

@implementation AWSrdsDBParameterGroupNameMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupName" : @"DBParameterGroupName",
             };
}

@end

@implementation AWSrdsDBParameterGroupStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupName" : @"DBParameterGroupName",
             @"parameterApplyStatus" : @"ParameterApplyStatus",
             };
}

@end

@implementation AWSrdsDBParameterGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroups" : @"DBParameterGroups",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBParameterGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBParameterGroup class]];
}

@end

@implementation AWSrdsDBProxy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"auth" : @"Auth",
             @"createdDate" : @"CreatedDate",
             @"DBProxyArn" : @"DBProxyArn",
             @"DBProxyName" : @"DBProxyName",
             @"debugLogging" : @"DebugLogging",
             @"endpoint" : @"Endpoint",
             @"engineFamily" : @"EngineFamily",
             @"idleClientTimeout" : @"IdleClientTimeout",
             @"requireTLS" : @"RequireTLS",
             @"roleArn" : @"RoleArn",
             @"status" : @"Status",
             @"updatedDate" : @"UpdatedDate",
             @"vpcSecurityGroupIds" : @"VpcSecurityGroupIds",
             @"vpcSubnetIds" : @"VpcSubnetIds",
             };
}

+ (NSValueTransformer *)authJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsUserAuthConfigInfo class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSrdsDBProxyStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"modifying"] == NSOrderedSame) {
            return @(AWSrdsDBProxyStatusModifying);
        }
        if ([value caseInsensitiveCompare:@"incompatible-network"] == NSOrderedSame) {
            return @(AWSrdsDBProxyStatusIncompatibleNetwork);
        }
        if ([value caseInsensitiveCompare:@"insufficient-resource-limits"] == NSOrderedSame) {
            return @(AWSrdsDBProxyStatusInsufficientResourceLimits);
        }
        if ([value caseInsensitiveCompare:@"creating"] == NSOrderedSame) {
            return @(AWSrdsDBProxyStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSrdsDBProxyStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"suspended"] == NSOrderedSame) {
            return @(AWSrdsDBProxyStatusSuspended);
        }
        if ([value caseInsensitiveCompare:@"suspending"] == NSOrderedSame) {
            return @(AWSrdsDBProxyStatusSuspending);
        }
        if ([value caseInsensitiveCompare:@"reactivating"] == NSOrderedSame) {
            return @(AWSrdsDBProxyStatusReactivating);
        }
        return @(AWSrdsDBProxyStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSrdsDBProxyStatusAvailable:
                return @"available";
            case AWSrdsDBProxyStatusModifying:
                return @"modifying";
            case AWSrdsDBProxyStatusIncompatibleNetwork:
                return @"incompatible-network";
            case AWSrdsDBProxyStatusInsufficientResourceLimits:
                return @"insufficient-resource-limits";
            case AWSrdsDBProxyStatusCreating:
                return @"creating";
            case AWSrdsDBProxyStatusDeleting:
                return @"deleting";
            case AWSrdsDBProxyStatusSuspended:
                return @"suspended";
            case AWSrdsDBProxyStatusSuspending:
                return @"suspending";
            case AWSrdsDBProxyStatusReactivating:
                return @"reactivating";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)updatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSrdsDBProxyTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoint" : @"Endpoint",
             @"port" : @"Port",
             @"rdsResourceId" : @"RdsResourceId",
             @"targetArn" : @"TargetArn",
             @"targetHealth" : @"TargetHealth",
             @"trackedClusterId" : @"TrackedClusterId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)targetHealthJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsTargetHealth class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RDS_INSTANCE"] == NSOrderedSame) {
            return @(AWSrdsTargetTypeRdsInstance);
        }
        if ([value caseInsensitiveCompare:@"RDS_SERVERLESS_ENDPOINT"] == NSOrderedSame) {
            return @(AWSrdsTargetTypeRdsServerlessEndpoint);
        }
        if ([value caseInsensitiveCompare:@"TRACKED_CLUSTER"] == NSOrderedSame) {
            return @(AWSrdsTargetTypeTrackedCluster);
        }
        return @(AWSrdsTargetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSrdsTargetTypeRdsInstance:
                return @"RDS_INSTANCE";
            case AWSrdsTargetTypeRdsServerlessEndpoint:
                return @"RDS_SERVERLESS_ENDPOINT";
            case AWSrdsTargetTypeTrackedCluster:
                return @"TRACKED_CLUSTER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSrdsDBProxyTargetGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionPoolConfig" : @"ConnectionPoolConfig",
             @"createdDate" : @"CreatedDate",
             @"DBProxyName" : @"DBProxyName",
             @"isDefault" : @"IsDefault",
             @"status" : @"Status",
             @"targetGroupArn" : @"TargetGroupArn",
             @"targetGroupName" : @"TargetGroupName",
             @"updatedDate" : @"UpdatedDate",
             };
}

+ (NSValueTransformer *)connectionPoolConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsConnectionPoolConfigurationInfo class]];
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)updatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSrdsDBSecurityGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSecurityGroupArn" : @"DBSecurityGroupArn",
             @"DBSecurityGroupDescription" : @"DBSecurityGroupDescription",
             @"DBSecurityGroupName" : @"DBSecurityGroupName",
             @"EC2SecurityGroups" : @"EC2SecurityGroups",
             @"IPRanges" : @"IPRanges",
             @"ownerId" : @"OwnerId",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)EC2SecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsEC2SecurityGroup class]];
}

+ (NSValueTransformer *)IPRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsIPRange class]];
}

@end

@implementation AWSrdsDBSecurityGroupMembership

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSecurityGroupName" : @"DBSecurityGroupName",
             @"status" : @"Status",
             };
}

@end

@implementation AWSrdsDBSecurityGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSecurityGroups" : @"DBSecurityGroups",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBSecurityGroup class]];
}

@end

@implementation AWSrdsDBSnapshot

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedStorage" : @"AllocatedStorage",
             @"availabilityZone" : @"AvailabilityZone",
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"DBSnapshotArn" : @"DBSnapshotArn",
             @"DBSnapshotIdentifier" : @"DBSnapshotIdentifier",
             @"dbiResourceId" : @"DbiResourceId",
             @"encrypted" : @"Encrypted",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"IAMDatabaseAuthenticationEnabled" : @"IAMDatabaseAuthenticationEnabled",
             @"instanceCreateTime" : @"InstanceCreateTime",
             @"iops" : @"Iops",
             @"kmsKeyId" : @"KmsKeyId",
             @"licenseModel" : @"LicenseModel",
             @"masterUsername" : @"MasterUsername",
             @"optionGroupName" : @"OptionGroupName",
             @"percentProgress" : @"PercentProgress",
             @"port" : @"Port",
             @"processorFeatures" : @"ProcessorFeatures",
             @"snapshotCreateTime" : @"SnapshotCreateTime",
             @"snapshotType" : @"SnapshotType",
             @"sourceDBSnapshotIdentifier" : @"SourceDBSnapshotIdentifier",
             @"sourceRegion" : @"SourceRegion",
             @"status" : @"Status",
             @"storageType" : @"StorageType",
             @"tdeCredentialArn" : @"TdeCredentialArn",
             @"timezone" : @"Timezone",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)instanceCreateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)processorFeaturesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsProcessorFeature class]];
}

+ (NSValueTransformer *)snapshotCreateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSrdsDBSnapshotAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"attributeValues" : @"AttributeValues",
             };
}

@end

@implementation AWSrdsDBSnapshotAttributesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshotAttributes" : @"DBSnapshotAttributes",
             @"DBSnapshotIdentifier" : @"DBSnapshotIdentifier",
             };
}

+ (NSValueTransformer *)DBSnapshotAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBSnapshotAttribute class]];
}

@end

@implementation AWSrdsDBSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshots" : @"DBSnapshots",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBSnapshotsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBSnapshot class]];
}

@end

@implementation AWSrdsDBSubnetGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSubnetGroupArn" : @"DBSubnetGroupArn",
             @"DBSubnetGroupDescription" : @"DBSubnetGroupDescription",
             @"DBSubnetGroupName" : @"DBSubnetGroupName",
             @"subnetGroupStatus" : @"SubnetGroupStatus",
             @"subnets" : @"Subnets",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)subnetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsSubnet class]];
}

@end

@implementation AWSrdsDBSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSubnetGroups" : @"DBSubnetGroups",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBSubnetGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBSubnetGroup class]];
}

@end

@implementation AWSrdsDeleteCustomAvailabilityZoneMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customAvailabilityZoneId" : @"CustomAvailabilityZoneId",
             };
}

@end

@implementation AWSrdsDeleteCustomAvailabilityZoneResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customAvailabilityZone" : @"CustomAvailabilityZone",
             };
}

+ (NSValueTransformer *)customAvailabilityZoneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsCustomAvailabilityZone class]];
}

@end

@implementation AWSrdsDeleteDBClusterEndpointMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterEndpointIdentifier" : @"DBClusterEndpointIdentifier",
             };
}

@end

@implementation AWSrdsDeleteDBClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"finalDBSnapshotIdentifier" : @"FinalDBSnapshotIdentifier",
             @"skipFinalSnapshot" : @"SkipFinalSnapshot",
             };
}

@end

@implementation AWSrdsDeleteDBClusterParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroupName" : @"DBClusterParameterGroupName",
             };
}

@end

@implementation AWSrdsDeleteDBClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBCluster" : @"DBCluster",
             };
}

+ (NSValueTransformer *)DBClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBCluster class]];
}

@end

@implementation AWSrdsDeleteDBClusterSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterSnapshotIdentifier" : @"DBClusterSnapshotIdentifier",
             };
}

@end

@implementation AWSrdsDeleteDBClusterSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterSnapshot" : @"DBClusterSnapshot",
             };
}

+ (NSValueTransformer *)DBClusterSnapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBClusterSnapshot class]];
}

@end

@implementation AWSrdsDeleteDBInstanceAutomatedBackupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dbiResourceId" : @"DbiResourceId",
             };
}

@end

@implementation AWSrdsDeleteDBInstanceAutomatedBackupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceAutomatedBackup" : @"DBInstanceAutomatedBackup",
             };
}

+ (NSValueTransformer *)DBInstanceAutomatedBackupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBInstanceAutomatedBackup class]];
}

@end

@implementation AWSrdsDeleteDBInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"deleteAutomatedBackups" : @"DeleteAutomatedBackups",
             @"finalDBSnapshotIdentifier" : @"FinalDBSnapshotIdentifier",
             @"skipFinalSnapshot" : @"SkipFinalSnapshot",
             };
}

@end

@implementation AWSrdsDeleteDBInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBInstance class]];
}

@end

@implementation AWSrdsDeleteDBParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupName" : @"DBParameterGroupName",
             };
}

@end

@implementation AWSrdsDeleteDBProxyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBProxyName" : @"DBProxyName",
             };
}

@end

@implementation AWSrdsDeleteDBProxyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBProxy" : @"DBProxy",
             };
}

+ (NSValueTransformer *)DBProxyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBProxy class]];
}

@end

@implementation AWSrdsDeleteDBSecurityGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSecurityGroupName" : @"DBSecurityGroupName",
             };
}

@end

@implementation AWSrdsDeleteDBSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshotIdentifier" : @"DBSnapshotIdentifier",
             };
}

@end

@implementation AWSrdsDeleteDBSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshot" : @"DBSnapshot",
             };
}

+ (NSValueTransformer *)DBSnapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBSnapshot class]];
}

@end

@implementation AWSrdsDeleteDBSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSubnetGroupName" : @"DBSubnetGroupName",
             };
}

@end

@implementation AWSrdsDeleteEventSubscriptionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subscriptionName" : @"SubscriptionName",
             };
}

@end

@implementation AWSrdsDeleteEventSubscriptionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscription" : @"EventSubscription",
             };
}

+ (NSValueTransformer *)eventSubscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsEventSubscription class]];
}

@end

@implementation AWSrdsDeleteGlobalClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalClusterIdentifier" : @"GlobalClusterIdentifier",
             };
}

@end

@implementation AWSrdsDeleteGlobalClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalCluster" : @"GlobalCluster",
             };
}

+ (NSValueTransformer *)globalClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsGlobalCluster class]];
}

@end

@implementation AWSrdsDeleteInstallationMediaMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"installationMediaId" : @"InstallationMediaId",
             };
}

@end

@implementation AWSrdsDeleteOptionGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"optionGroupName" : @"OptionGroupName",
             };
}

@end

@implementation AWSrdsDeregisterDBProxyTargetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifiers" : @"DBClusterIdentifiers",
             @"DBInstanceIdentifiers" : @"DBInstanceIdentifiers",
             @"DBProxyName" : @"DBProxyName",
             @"targetGroupName" : @"TargetGroupName",
             };
}

@end

@implementation AWSrdsDeregisterDBProxyTargetsResponse

@end

@implementation AWSrdsDescribeAccountAttributesMessage

@end

@implementation AWSrdsDescribeCertificatesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateIdentifier" : @"CertificateIdentifier",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeCustomAvailabilityZonesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customAvailabilityZoneId" : @"CustomAvailabilityZoneId",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeDBClusterBacktracksMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backtrackIdentifier" : @"BacktrackIdentifier",
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeDBClusterEndpointsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterEndpointIdentifier" : @"DBClusterEndpointIdentifier",
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeDBClusterParameterGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroupName" : @"DBClusterParameterGroupName",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeDBClusterParametersMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroupName" : @"DBClusterParameterGroupName",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"source" : @"Source",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeDBClusterSnapshotAttributesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterSnapshotIdentifier" : @"DBClusterSnapshotIdentifier",
             };
}

@end

@implementation AWSrdsDescribeDBClusterSnapshotAttributesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterSnapshotAttributesResult" : @"DBClusterSnapshotAttributesResult",
             };
}

+ (NSValueTransformer *)DBClusterSnapshotAttributesResultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBClusterSnapshotAttributesResult class]];
}

@end

@implementation AWSrdsDescribeDBClusterSnapshotsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"DBClusterSnapshotIdentifier" : @"DBClusterSnapshotIdentifier",
             @"filters" : @"Filters",
             @"includePublic" : @"IncludePublic",
             @"includeShared" : @"IncludeShared",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"snapshotType" : @"SnapshotType",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeDBClustersMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"filters" : @"Filters",
             @"includeShared" : @"IncludeShared",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeDBEngineVersionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupFamily" : @"DBParameterGroupFamily",
             @"defaultOnly" : @"DefaultOnly",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"filters" : @"Filters",
             @"includeAll" : @"IncludeAll",
             @"listSupportedCharacterSets" : @"ListSupportedCharacterSets",
             @"listSupportedTimezones" : @"ListSupportedTimezones",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeDBInstanceAutomatedBackupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"dbiResourceId" : @"DbiResourceId",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeDBInstancesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeDBLogFilesDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastWritten" : @"LastWritten",
             @"logFileName" : @"LogFileName",
             @"size" : @"Size",
             };
}

@end

@implementation AWSrdsDescribeDBLogFilesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"fileLastWritten" : @"FileLastWritten",
             @"fileSize" : @"FileSize",
             @"filenameContains" : @"FilenameContains",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeDBLogFilesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"describeDBLogFiles" : @"DescribeDBLogFiles",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)describeDBLogFilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDescribeDBLogFilesDetails class]];
}

@end

@implementation AWSrdsDescribeDBParameterGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupName" : @"DBParameterGroupName",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeDBParametersMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupName" : @"DBParameterGroupName",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"source" : @"Source",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeDBProxiesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBProxyName" : @"DBProxyName",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeDBProxiesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBProxies" : @"DBProxies",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBProxiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBProxy class]];
}

@end

@implementation AWSrdsDescribeDBProxyTargetGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBProxyName" : @"DBProxyName",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"targetGroupName" : @"TargetGroupName",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeDBProxyTargetGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"targetGroups" : @"TargetGroups",
             };
}

+ (NSValueTransformer *)targetGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBProxyTargetGroup class]];
}

@end

@implementation AWSrdsDescribeDBProxyTargetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBProxyName" : @"DBProxyName",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"targetGroupName" : @"TargetGroupName",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeDBProxyTargetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBProxyTarget class]];
}

@end

@implementation AWSrdsDescribeDBSecurityGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSecurityGroupName" : @"DBSecurityGroupName",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeDBSnapshotAttributesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshotIdentifier" : @"DBSnapshotIdentifier",
             };
}

@end

@implementation AWSrdsDescribeDBSnapshotAttributesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshotAttributesResult" : @"DBSnapshotAttributesResult",
             };
}

+ (NSValueTransformer *)DBSnapshotAttributesResultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBSnapshotAttributesResult class]];
}

@end

@implementation AWSrdsDescribeDBSnapshotsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"DBSnapshotIdentifier" : @"DBSnapshotIdentifier",
             @"dbiResourceId" : @"DbiResourceId",
             @"filters" : @"Filters",
             @"includePublic" : @"IncludePublic",
             @"includeShared" : @"IncludeShared",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"snapshotType" : @"SnapshotType",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeDBSubnetGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSubnetGroupName" : @"DBSubnetGroupName",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeEngineDefaultClusterParametersMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupFamily" : @"DBParameterGroupFamily",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeEngineDefaultClusterParametersResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"engineDefaults" : @"EngineDefaults",
             };
}

+ (NSValueTransformer *)engineDefaultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsEngineDefaults class]];
}

@end

@implementation AWSrdsDescribeEngineDefaultParametersMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupFamily" : @"DBParameterGroupFamily",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeEngineDefaultParametersResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"engineDefaults" : @"EngineDefaults",
             };
}

+ (NSValueTransformer *)engineDefaultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsEngineDefaults class]];
}

@end

@implementation AWSrdsDescribeEventCategoriesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"sourceType" : @"SourceType",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeEventSubscriptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"subscriptionName" : @"SubscriptionName",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeEventsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"duration" : @"Duration",
             @"endTime" : @"EndTime",
             @"eventCategories" : @"EventCategories",
             @"filters" : @"Filters",
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

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

+ (NSValueTransformer *)sourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"db-instance"] == NSOrderedSame) {
            return @(AWSrdsSourceTypeDbInstance);
        }
        if ([value caseInsensitiveCompare:@"db-parameter-group"] == NSOrderedSame) {
            return @(AWSrdsSourceTypeDbParameterGroup);
        }
        if ([value caseInsensitiveCompare:@"db-security-group"] == NSOrderedSame) {
            return @(AWSrdsSourceTypeDbSecurityGroup);
        }
        if ([value caseInsensitiveCompare:@"db-snapshot"] == NSOrderedSame) {
            return @(AWSrdsSourceTypeDbSnapshot);
        }
        if ([value caseInsensitiveCompare:@"db-cluster"] == NSOrderedSame) {
            return @(AWSrdsSourceTypeDbCluster);
        }
        if ([value caseInsensitiveCompare:@"db-cluster-snapshot"] == NSOrderedSame) {
            return @(AWSrdsSourceTypeDbClusterSnapshot);
        }
        return @(AWSrdsSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSrdsSourceTypeDbInstance:
                return @"db-instance";
            case AWSrdsSourceTypeDbParameterGroup:
                return @"db-parameter-group";
            case AWSrdsSourceTypeDbSecurityGroup:
                return @"db-security-group";
            case AWSrdsSourceTypeDbSnapshot:
                return @"db-snapshot";
            case AWSrdsSourceTypeDbCluster:
                return @"db-cluster";
            case AWSrdsSourceTypeDbClusterSnapshot:
                return @"db-cluster-snapshot";
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

@implementation AWSrdsDescribeExportTasksMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportTaskIdentifier" : @"ExportTaskIdentifier",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"sourceArn" : @"SourceArn",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeGlobalClustersMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"globalClusterIdentifier" : @"GlobalClusterIdentifier",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeInstallationMediaMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"installationMediaId" : @"InstallationMediaId",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeOptionGroupOptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"engineName" : @"EngineName",
             @"filters" : @"Filters",
             @"majorEngineVersion" : @"MajorEngineVersion",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeOptionGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"engineName" : @"EngineName",
             @"filters" : @"Filters",
             @"majorEngineVersion" : @"MajorEngineVersion",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"optionGroupName" : @"OptionGroupName",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeOrderableDBInstanceOptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZoneGroup" : @"AvailabilityZoneGroup",
             @"DBInstanceClass" : @"DBInstanceClass",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"filters" : @"Filters",
             @"licenseModel" : @"LicenseModel",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"vpc" : @"Vpc",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribePendingMaintenanceActionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"resourceIdentifier" : @"ResourceIdentifier",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeReservedDBInstancesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceClass" : @"DBInstanceClass",
             @"duration" : @"Duration",
             @"filters" : @"Filters",
             @"leaseId" : @"LeaseId",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"multiAZ" : @"MultiAZ",
             @"offeringType" : @"OfferingType",
             @"productDescription" : @"ProductDescription",
             @"reservedDBInstanceId" : @"ReservedDBInstanceId",
             @"reservedDBInstancesOfferingId" : @"ReservedDBInstancesOfferingId",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeReservedDBInstancesOfferingsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceClass" : @"DBInstanceClass",
             @"duration" : @"Duration",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"multiAZ" : @"MultiAZ",
             @"offeringType" : @"OfferingType",
             @"productDescription" : @"ProductDescription",
             @"reservedDBInstancesOfferingId" : @"ReservedDBInstancesOfferingId",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeSourceRegionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"regionName" : @"RegionName",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsDescribeValidDBInstanceModificationsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             };
}

@end

@implementation AWSrdsDescribeValidDBInstanceModificationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"validDBInstanceModificationsMessage" : @"ValidDBInstanceModificationsMessage",
             };
}

+ (NSValueTransformer *)validDBInstanceModificationsMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsValidDBInstanceModificationsMessage class]];
}

@end

@implementation AWSrdsDomainMembership

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domain" : @"Domain",
             @"FQDN" : @"FQDN",
             @"IAMRoleName" : @"IAMRoleName",
             @"status" : @"Status",
             };
}

@end

@implementation AWSrdsDoubleRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"from" : @"From",
             @"to" : @"To",
             };
}

@end

@implementation AWSrdsDownloadDBLogFilePortionDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalDataPending" : @"AdditionalDataPending",
             @"logFileData" : @"LogFileData",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSrdsDownloadDBLogFilePortionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"logFileName" : @"LogFileName",
             @"marker" : @"Marker",
             @"numberOfLines" : @"NumberOfLines",
             };
}

@end

@implementation AWSrdsEC2SecurityGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"EC2SecurityGroupId" : @"EC2SecurityGroupId",
             @"EC2SecurityGroupName" : @"EC2SecurityGroupName",
             @"EC2SecurityGroupOwnerId" : @"EC2SecurityGroupOwnerId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSrdsEndpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"hostedZoneId" : @"HostedZoneId",
             @"port" : @"Port",
             };
}

@end

@implementation AWSrdsEngineDefaults

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupFamily" : @"DBParameterGroupFamily",
             @"marker" : @"Marker",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsParameter class]];
}

@end

@implementation AWSrdsEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"date" : @"Date",
             @"eventCategories" : @"EventCategories",
             @"message" : @"Message",
             @"sourceArn" : @"SourceArn",
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
        if ([value caseInsensitiveCompare:@"db-instance"] == NSOrderedSame) {
            return @(AWSrdsSourceTypeDbInstance);
        }
        if ([value caseInsensitiveCompare:@"db-parameter-group"] == NSOrderedSame) {
            return @(AWSrdsSourceTypeDbParameterGroup);
        }
        if ([value caseInsensitiveCompare:@"db-security-group"] == NSOrderedSame) {
            return @(AWSrdsSourceTypeDbSecurityGroup);
        }
        if ([value caseInsensitiveCompare:@"db-snapshot"] == NSOrderedSame) {
            return @(AWSrdsSourceTypeDbSnapshot);
        }
        if ([value caseInsensitiveCompare:@"db-cluster"] == NSOrderedSame) {
            return @(AWSrdsSourceTypeDbCluster);
        }
        if ([value caseInsensitiveCompare:@"db-cluster-snapshot"] == NSOrderedSame) {
            return @(AWSrdsSourceTypeDbClusterSnapshot);
        }
        return @(AWSrdsSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSrdsSourceTypeDbInstance:
                return @"db-instance";
            case AWSrdsSourceTypeDbParameterGroup:
                return @"db-parameter-group";
            case AWSrdsSourceTypeDbSecurityGroup:
                return @"db-security-group";
            case AWSrdsSourceTypeDbSnapshot:
                return @"db-snapshot";
            case AWSrdsSourceTypeDbCluster:
                return @"db-cluster";
            case AWSrdsSourceTypeDbClusterSnapshot:
                return @"db-cluster-snapshot";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSrdsEventCategoriesMap

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventCategories" : @"EventCategories",
             @"sourceType" : @"SourceType",
             };
}

@end

@implementation AWSrdsEventCategoriesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventCategoriesMapList" : @"EventCategoriesMapList",
             };
}

+ (NSValueTransformer *)eventCategoriesMapListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsEventCategoriesMap class]];
}

@end

@implementation AWSrdsEventSubscription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"custSubscriptionId" : @"CustSubscriptionId",
             @"customerAwsId" : @"CustomerAwsId",
             @"enabled" : @"Enabled",
             @"eventCategoriesList" : @"EventCategoriesList",
             @"eventSubscriptionArn" : @"EventSubscriptionArn",
             @"snsTopicArn" : @"SnsTopicArn",
             @"sourceIdsList" : @"SourceIdsList",
             @"sourceType" : @"SourceType",
             @"status" : @"Status",
             @"subscriptionCreationTime" : @"SubscriptionCreationTime",
             };
}

@end

@implementation AWSrdsEventSubscriptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscriptionsList" : @"EventSubscriptionsList",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)eventSubscriptionsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsEventSubscription class]];
}

@end

@implementation AWSrdsEventsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"Events",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)eventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsEvent class]];
}

@end

@implementation AWSrdsExportTask

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportOnly" : @"ExportOnly",
             @"exportTaskIdentifier" : @"ExportTaskIdentifier",
             @"failureCause" : @"FailureCause",
             @"iamRoleArn" : @"IamRoleArn",
             @"kmsKeyId" : @"KmsKeyId",
             @"percentProgress" : @"PercentProgress",
             @"s3Bucket" : @"S3Bucket",
             @"s3Prefix" : @"S3Prefix",
             @"snapshotTime" : @"SnapshotTime",
             @"sourceArn" : @"SourceArn",
             @"status" : @"Status",
             @"taskEndTime" : @"TaskEndTime",
             @"taskStartTime" : @"TaskStartTime",
             @"totalExtractedDataInGB" : @"TotalExtractedDataInGB",
             @"warningMessage" : @"WarningMessage",
             };
}

+ (NSValueTransformer *)snapshotTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)taskEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)taskStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSrdsExportTasksMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportTasks" : @"ExportTasks",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)exportTasksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsExportTask class]];
}

@end

@implementation AWSrdsFailoverDBClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"targetDBInstanceIdentifier" : @"TargetDBInstanceIdentifier",
             };
}

@end

@implementation AWSrdsFailoverDBClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBCluster" : @"DBCluster",
             };
}

+ (NSValueTransformer *)DBClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBCluster class]];
}

@end

@implementation AWSrdsFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

@end

@implementation AWSrdsGlobalCluster

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"databaseName" : @"DatabaseName",
             @"deletionProtection" : @"DeletionProtection",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"globalClusterArn" : @"GlobalClusterArn",
             @"globalClusterIdentifier" : @"GlobalClusterIdentifier",
             @"globalClusterMembers" : @"GlobalClusterMembers",
             @"globalClusterResourceId" : @"GlobalClusterResourceId",
             @"status" : @"Status",
             @"storageEncrypted" : @"StorageEncrypted",
             };
}

+ (NSValueTransformer *)globalClusterMembersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsGlobalClusterMember class]];
}

@end

@implementation AWSrdsGlobalClusterMember

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterArn" : @"DBClusterArn",
             @"isWriter" : @"IsWriter",
             @"readers" : @"Readers",
             };
}

@end

@implementation AWSrdsGlobalClustersMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalClusters" : @"GlobalClusters",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)globalClustersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsGlobalCluster class]];
}

@end

@implementation AWSrdsIPRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"CIDRIP" : @"CIDRIP",
             @"status" : @"Status",
             };
}

@end

@implementation AWSrdsImportInstallationMediaMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customAvailabilityZoneId" : @"CustomAvailabilityZoneId",
             @"engine" : @"Engine",
             @"engineInstallationMediaPath" : @"EngineInstallationMediaPath",
             @"engineVersion" : @"EngineVersion",
             @"OSInstallationMediaPath" : @"OSInstallationMediaPath",
             };
}

@end

@implementation AWSrdsInstallationMedia

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customAvailabilityZoneId" : @"CustomAvailabilityZoneId",
             @"engine" : @"Engine",
             @"engineInstallationMediaPath" : @"EngineInstallationMediaPath",
             @"engineVersion" : @"EngineVersion",
             @"failureCause" : @"FailureCause",
             @"installationMediaId" : @"InstallationMediaId",
             @"OSInstallationMediaPath" : @"OSInstallationMediaPath",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)failureCauseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsInstallationMediaFailureCause class]];
}

@end

@implementation AWSrdsInstallationMediaFailureCause

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSrdsInstallationMediaMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"installationMedia" : @"InstallationMedia",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)installationMediaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsInstallationMedia class]];
}

@end

@implementation AWSrdsListTagsForResourceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"resourceName" : @"ResourceName",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsFilter class]];
}

@end

@implementation AWSrdsMinimumEngineVersionPerAllowedValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedValue" : @"AllowedValue",
             @"minimumEngineVersion" : @"MinimumEngineVersion",
             };
}

@end

@implementation AWSrdsModifyCertificatesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateIdentifier" : @"CertificateIdentifier",
             @"removeCustomerOverride" : @"RemoveCustomerOverride",
             };
}

@end

@implementation AWSrdsModifyCertificatesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificate" : @"Certificate",
             };
}

+ (NSValueTransformer *)certificateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsCertificate class]];
}

@end

@implementation AWSrdsModifyCurrentDBClusterCapacityMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capacity" : @"Capacity",
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"secondsBeforeTimeout" : @"SecondsBeforeTimeout",
             @"timeoutAction" : @"TimeoutAction",
             };
}

@end

@implementation AWSrdsModifyDBClusterEndpointMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterEndpointIdentifier" : @"DBClusterEndpointIdentifier",
             @"endpointType" : @"EndpointType",
             @"excludedMembers" : @"ExcludedMembers",
             @"staticMembers" : @"StaticMembers",
             };
}

@end

@implementation AWSrdsModifyDBClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowMajorVersionUpgrade" : @"AllowMajorVersionUpgrade",
             @"applyImmediately" : @"ApplyImmediately",
             @"backtrackWindow" : @"BacktrackWindow",
             @"backupRetentionPeriod" : @"BackupRetentionPeriod",
             @"cloudwatchLogsExportConfiguration" : @"CloudwatchLogsExportConfiguration",
             @"replicateTagsToSnapshot" : @"CopyTagsToSnapshot",
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"DBClusterParameterGroupName" : @"DBClusterParameterGroupName",
             @"DBInstanceParameterGroupName" : @"DBInstanceParameterGroupName",
             @"deletionProtection" : @"DeletionProtection",
             @"domain" : @"Domain",
             @"domainIAMRoleName" : @"DomainIAMRoleName",
             @"enableHttpEndpoint" : @"EnableHttpEndpoint",
             @"enableIAMDatabaseAuthentication" : @"EnableIAMDatabaseAuthentication",
             @"engineVersion" : @"EngineVersion",
             @"masterUserPassword" : @"MasterUserPassword",
             @"latestDBClusterIdentifier" : @"NewDBClusterIdentifier",
             @"optionGroupName" : @"OptionGroupName",
             @"port" : @"Port",
             @"preferredBackupWindow" : @"PreferredBackupWindow",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"scalingConfiguration" : @"ScalingConfiguration",
             @"vpcSecurityGroupIds" : @"VpcSecurityGroupIds",
             };
}

+ (NSValueTransformer *)cloudwatchLogsExportConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsCloudwatchLogsExportConfiguration class]];
}

+ (NSValueTransformer *)scalingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsScalingConfiguration class]];
}

@end

@implementation AWSrdsModifyDBClusterParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroupName" : @"DBClusterParameterGroupName",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsParameter class]];
}

@end

@implementation AWSrdsModifyDBClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBCluster" : @"DBCluster",
             };
}

+ (NSValueTransformer *)DBClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBCluster class]];
}

@end

@implementation AWSrdsModifyDBClusterSnapshotAttributeMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"DBClusterSnapshotIdentifier" : @"DBClusterSnapshotIdentifier",
             @"valuesToAdd" : @"ValuesToAdd",
             @"valuesToRemove" : @"ValuesToRemove",
             };
}

@end

@implementation AWSrdsModifyDBClusterSnapshotAttributeResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterSnapshotAttributesResult" : @"DBClusterSnapshotAttributesResult",
             };
}

+ (NSValueTransformer *)DBClusterSnapshotAttributesResultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBClusterSnapshotAttributesResult class]];
}

@end

@implementation AWSrdsModifyDBInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedStorage" : @"AllocatedStorage",
             @"allowMajorVersionUpgrade" : @"AllowMajorVersionUpgrade",
             @"applyImmediately" : @"ApplyImmediately",
             @"autoMinorVersionUpgrade" : @"AutoMinorVersionUpgrade",
             @"backupRetentionPeriod" : @"BackupRetentionPeriod",
             @"CACertificateIdentifier" : @"CACertificateIdentifier",
             @"certificateRotationRestart" : @"CertificateRotationRestart",
             @"cloudwatchLogsExportConfiguration" : @"CloudwatchLogsExportConfiguration",
             @"replicateTagsToSnapshot" : @"CopyTagsToSnapshot",
             @"DBInstanceClass" : @"DBInstanceClass",
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"DBParameterGroupName" : @"DBParameterGroupName",
             @"DBPortNumber" : @"DBPortNumber",
             @"DBSecurityGroups" : @"DBSecurityGroups",
             @"DBSubnetGroupName" : @"DBSubnetGroupName",
             @"deletionProtection" : @"DeletionProtection",
             @"domain" : @"Domain",
             @"domainIAMRoleName" : @"DomainIAMRoleName",
             @"enableIAMDatabaseAuthentication" : @"EnableIAMDatabaseAuthentication",
             @"enablePerformanceInsights" : @"EnablePerformanceInsights",
             @"engineVersion" : @"EngineVersion",
             @"iops" : @"Iops",
             @"licenseModel" : @"LicenseModel",
             @"masterUserPassword" : @"MasterUserPassword",
             @"maxAllocatedStorage" : @"MaxAllocatedStorage",
             @"monitoringInterval" : @"MonitoringInterval",
             @"monitoringRoleArn" : @"MonitoringRoleArn",
             @"multiAZ" : @"MultiAZ",
             @"latestDBInstanceIdentifier" : @"NewDBInstanceIdentifier",
             @"optionGroupName" : @"OptionGroupName",
             @"performanceInsightsKMSKeyId" : @"PerformanceInsightsKMSKeyId",
             @"performanceInsightsRetentionPeriod" : @"PerformanceInsightsRetentionPeriod",
             @"preferredBackupWindow" : @"PreferredBackupWindow",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"processorFeatures" : @"ProcessorFeatures",
             @"promotionTier" : @"PromotionTier",
             @"publiclyAccessible" : @"PubliclyAccessible",
             @"storageType" : @"StorageType",
             @"tdeCredentialArn" : @"TdeCredentialArn",
             @"tdeCredentialPassword" : @"TdeCredentialPassword",
             @"useDefaultProcessorFeatures" : @"UseDefaultProcessorFeatures",
             @"vpcSecurityGroupIds" : @"VpcSecurityGroupIds",
             };
}

+ (NSValueTransformer *)cloudwatchLogsExportConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsCloudwatchLogsExportConfiguration class]];
}

+ (NSValueTransformer *)processorFeaturesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsProcessorFeature class]];
}

@end

@implementation AWSrdsModifyDBInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBInstance class]];
}

@end

@implementation AWSrdsModifyDBParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupName" : @"DBParameterGroupName",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsParameter class]];
}

@end

@implementation AWSrdsModifyDBProxyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"auth" : @"Auth",
             @"DBProxyName" : @"DBProxyName",
             @"debugLogging" : @"DebugLogging",
             @"idleClientTimeout" : @"IdleClientTimeout",
             @"latestDBProxyName" : @"NewDBProxyName",
             @"requireTLS" : @"RequireTLS",
             @"roleArn" : @"RoleArn",
             @"securityGroups" : @"SecurityGroups",
             };
}

+ (NSValueTransformer *)authJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsUserAuthConfig class]];
}

@end

@implementation AWSrdsModifyDBProxyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBProxy" : @"DBProxy",
             };
}

+ (NSValueTransformer *)DBProxyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBProxy class]];
}

@end

@implementation AWSrdsModifyDBProxyTargetGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionPoolConfig" : @"ConnectionPoolConfig",
             @"DBProxyName" : @"DBProxyName",
             @"latestName" : @"NewName",
             @"targetGroupName" : @"TargetGroupName",
             };
}

+ (NSValueTransformer *)connectionPoolConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsConnectionPoolConfiguration class]];
}

@end

@implementation AWSrdsModifyDBProxyTargetGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBProxyTargetGroup" : @"DBProxyTargetGroup",
             };
}

+ (NSValueTransformer *)DBProxyTargetGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBProxyTargetGroup class]];
}

@end

@implementation AWSrdsModifyDBSnapshotAttributeMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"DBSnapshotIdentifier" : @"DBSnapshotIdentifier",
             @"valuesToAdd" : @"ValuesToAdd",
             @"valuesToRemove" : @"ValuesToRemove",
             };
}

@end

@implementation AWSrdsModifyDBSnapshotAttributeResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshotAttributesResult" : @"DBSnapshotAttributesResult",
             };
}

+ (NSValueTransformer *)DBSnapshotAttributesResultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBSnapshotAttributesResult class]];
}

@end

@implementation AWSrdsModifyDBSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshotIdentifier" : @"DBSnapshotIdentifier",
             @"engineVersion" : @"EngineVersion",
             @"optionGroupName" : @"OptionGroupName",
             };
}

@end

@implementation AWSrdsModifyDBSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshot" : @"DBSnapshot",
             };
}

+ (NSValueTransformer *)DBSnapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBSnapshot class]];
}

@end

@implementation AWSrdsModifyDBSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSubnetGroupDescription" : @"DBSubnetGroupDescription",
             @"DBSubnetGroupName" : @"DBSubnetGroupName",
             @"subnetIds" : @"SubnetIds",
             };
}

@end

@implementation AWSrdsModifyDBSubnetGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSubnetGroup" : @"DBSubnetGroup",
             };
}

+ (NSValueTransformer *)DBSubnetGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBSubnetGroup class]];
}

@end

@implementation AWSrdsModifyEventSubscriptionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"eventCategories" : @"EventCategories",
             @"snsTopicArn" : @"SnsTopicArn",
             @"sourceType" : @"SourceType",
             @"subscriptionName" : @"SubscriptionName",
             };
}

@end

@implementation AWSrdsModifyEventSubscriptionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscription" : @"EventSubscription",
             };
}

+ (NSValueTransformer *)eventSubscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsEventSubscription class]];
}

@end

@implementation AWSrdsModifyGlobalClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletionProtection" : @"DeletionProtection",
             @"globalClusterIdentifier" : @"GlobalClusterIdentifier",
             @"latestGlobalClusterIdentifier" : @"NewGlobalClusterIdentifier",
             };
}

@end

@implementation AWSrdsModifyGlobalClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalCluster" : @"GlobalCluster",
             };
}

+ (NSValueTransformer *)globalClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsGlobalCluster class]];
}

@end

@implementation AWSrdsModifyOptionGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyImmediately" : @"ApplyImmediately",
             @"optionGroupName" : @"OptionGroupName",
             @"optionsToInclude" : @"OptionsToInclude",
             @"optionsToRemove" : @"OptionsToRemove",
             };
}

+ (NSValueTransformer *)optionsToIncludeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsOptionConfiguration class]];
}

@end

@implementation AWSrdsModifyOptionGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"optionGroup" : @"OptionGroup",
             };
}

+ (NSValueTransformer *)optionGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsOptionGroup class]];
}

@end

@implementation AWSrdsOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSecurityGroupMemberships" : @"DBSecurityGroupMemberships",
             @"optionDescription" : @"OptionDescription",
             @"optionName" : @"OptionName",
             @"optionSettings" : @"OptionSettings",
             @"optionVersion" : @"OptionVersion",
             @"permanent" : @"Permanent",
             @"persistent" : @"Persistent",
             @"port" : @"Port",
             @"vpcSecurityGroupMemberships" : @"VpcSecurityGroupMemberships",
             };
}

+ (NSValueTransformer *)DBSecurityGroupMembershipsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBSecurityGroupMembership class]];
}

+ (NSValueTransformer *)optionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsOptionSetting class]];
}

+ (NSValueTransformer *)vpcSecurityGroupMembershipsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsVpcSecurityGroupMembership class]];
}

@end

@implementation AWSrdsOptionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSecurityGroupMemberships" : @"DBSecurityGroupMemberships",
             @"optionName" : @"OptionName",
             @"optionSettings" : @"OptionSettings",
             @"optionVersion" : @"OptionVersion",
             @"port" : @"Port",
             @"vpcSecurityGroupMemberships" : @"VpcSecurityGroupMemberships",
             };
}

+ (NSValueTransformer *)optionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsOptionSetting class]];
}

@end

@implementation AWSrdsOptionGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowsVpcAndNonVpcInstanceMemberships" : @"AllowsVpcAndNonVpcInstanceMemberships",
             @"engineName" : @"EngineName",
             @"majorEngineVersion" : @"MajorEngineVersion",
             @"optionGroupArn" : @"OptionGroupArn",
             @"optionGroupDescription" : @"OptionGroupDescription",
             @"optionGroupName" : @"OptionGroupName",
             @"options" : @"Options",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsOption class]];
}

@end

@implementation AWSrdsOptionGroupMembership

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"optionGroupName" : @"OptionGroupName",
             @"status" : @"Status",
             };
}

@end

@implementation AWSrdsOptionGroupOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultPort" : @"DefaultPort",
             @"detail" : @"Description",
             @"engineName" : @"EngineName",
             @"majorEngineVersion" : @"MajorEngineVersion",
             @"minimumRequiredMinorEngineVersion" : @"MinimumRequiredMinorEngineVersion",
             @"name" : @"Name",
             @"optionGroupOptionSettings" : @"OptionGroupOptionSettings",
             @"optionGroupOptionVersions" : @"OptionGroupOptionVersions",
             @"optionsConflictsWith" : @"OptionsConflictsWith",
             @"optionsDependedOn" : @"OptionsDependedOn",
             @"permanent" : @"Permanent",
             @"persistent" : @"Persistent",
             @"portRequired" : @"PortRequired",
             @"requiresAutoMinorEngineVersionUpgrade" : @"RequiresAutoMinorEngineVersionUpgrade",
             @"supportsOptionVersionDowngrade" : @"SupportsOptionVersionDowngrade",
             @"vpcOnly" : @"VpcOnly",
             };
}

+ (NSValueTransformer *)optionGroupOptionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsOptionGroupOptionSetting class]];
}

+ (NSValueTransformer *)optionGroupOptionVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsOptionVersion class]];
}

@end

@implementation AWSrdsOptionGroupOptionSetting

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedValues" : @"AllowedValues",
             @"applyType" : @"ApplyType",
             @"defaultValue" : @"DefaultValue",
             @"isModifiable" : @"IsModifiable",
             @"isRequired" : @"IsRequired",
             @"minimumEngineVersionPerAllowedValue" : @"MinimumEngineVersionPerAllowedValue",
             @"settingDescription" : @"SettingDescription",
             @"settingName" : @"SettingName",
             };
}

+ (NSValueTransformer *)minimumEngineVersionPerAllowedValueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsMinimumEngineVersionPerAllowedValue class]];
}

@end

@implementation AWSrdsOptionGroupOptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"optionGroupOptions" : @"OptionGroupOptions",
             };
}

+ (NSValueTransformer *)optionGroupOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsOptionGroupOption class]];
}

@end

@implementation AWSrdsOptionGroups

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"optionGroupsList" : @"OptionGroupsList",
             };
}

+ (NSValueTransformer *)optionGroupsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsOptionGroup class]];
}

@end

@implementation AWSrdsOptionSetting

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedValues" : @"AllowedValues",
             @"applyType" : @"ApplyType",
             @"dataType" : @"DataType",
             @"defaultValue" : @"DefaultValue",
             @"detail" : @"Description",
             @"isCollection" : @"IsCollection",
             @"isModifiable" : @"IsModifiable",
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSrdsOptionVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isDefault" : @"IsDefault",
             @"version" : @"Version",
             };
}

@end

@implementation AWSrdsOrderableDBInstanceOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZoneGroup" : @"AvailabilityZoneGroup",
             @"availabilityZones" : @"AvailabilityZones",
             @"availableProcessorFeatures" : @"AvailableProcessorFeatures",
             @"DBInstanceClass" : @"DBInstanceClass",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"licenseModel" : @"LicenseModel",
             @"maxIopsPerDbInstance" : @"MaxIopsPerDbInstance",
             @"maxIopsPerGib" : @"MaxIopsPerGib",
             @"maxStorageSize" : @"MaxStorageSize",
             @"minIopsPerDbInstance" : @"MinIopsPerDbInstance",
             @"minIopsPerGib" : @"MinIopsPerGib",
             @"minStorageSize" : @"MinStorageSize",
             @"multiAZCapable" : @"MultiAZCapable",
             @"readReplicaCapable" : @"ReadReplicaCapable",
             @"storageType" : @"StorageType",
             @"supportedEngineModes" : @"SupportedEngineModes",
             @"supportsEnhancedMonitoring" : @"SupportsEnhancedMonitoring",
             @"supportsIAMDatabaseAuthentication" : @"SupportsIAMDatabaseAuthentication",
             @"supportsIops" : @"SupportsIops",
             @"supportsKerberosAuthentication" : @"SupportsKerberosAuthentication",
             @"supportsPerformanceInsights" : @"SupportsPerformanceInsights",
             @"supportsStorageAutoscaling" : @"SupportsStorageAutoscaling",
             @"supportsStorageEncryption" : @"SupportsStorageEncryption",
             @"vpc" : @"Vpc",
             };
}

+ (NSValueTransformer *)availabilityZonesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsAvailabilityZone class]];
}

+ (NSValueTransformer *)availableProcessorFeaturesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsAvailableProcessorFeature class]];
}

@end

@implementation AWSrdsOrderableDBInstanceOptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"orderableDBInstanceOptions" : @"OrderableDBInstanceOptions",
             };
}

+ (NSValueTransformer *)orderableDBInstanceOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsOrderableDBInstanceOption class]];
}

@end

@implementation AWSrdsParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedValues" : @"AllowedValues",
             @"applyMethod" : @"ApplyMethod",
             @"applyType" : @"ApplyType",
             @"dataType" : @"DataType",
             @"detail" : @"Description",
             @"isModifiable" : @"IsModifiable",
             @"minimumEngineVersion" : @"MinimumEngineVersion",
             @"parameterName" : @"ParameterName",
             @"parameterValue" : @"ParameterValue",
             @"source" : @"Source",
             @"supportedEngineModes" : @"SupportedEngineModes",
             };
}

+ (NSValueTransformer *)applyMethodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"immediate"] == NSOrderedSame) {
            return @(AWSrdsApplyMethodImmediate);
        }
        if ([value caseInsensitiveCompare:@"pending-reboot"] == NSOrderedSame) {
            return @(AWSrdsApplyMethodPendingReboot);
        }
        return @(AWSrdsApplyMethodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSrdsApplyMethodImmediate:
                return @"immediate";
            case AWSrdsApplyMethodPendingReboot:
                return @"pending-reboot";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSrdsPendingCloudwatchLogsExports

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logTypesToDisable" : @"LogTypesToDisable",
             @"logTypesToEnable" : @"LogTypesToEnable",
             };
}

@end

@implementation AWSrdsPendingMaintenanceAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"autoAppliedAfterDate" : @"AutoAppliedAfterDate",
             @"currentApplyDate" : @"CurrentApplyDate",
             @"detail" : @"Description",
             @"forcedApplyDate" : @"ForcedApplyDate",
             @"optInStatus" : @"OptInStatus",
             };
}

+ (NSValueTransformer *)autoAppliedAfterDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)currentApplyDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)forcedApplyDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSrdsPendingMaintenanceActionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"pendingMaintenanceActions" : @"PendingMaintenanceActions",
             };
}

+ (NSValueTransformer *)pendingMaintenanceActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsResourcePendingMaintenanceActions class]];
}

@end

@implementation AWSrdsPendingModifiedValues

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedStorage" : @"AllocatedStorage",
             @"backupRetentionPeriod" : @"BackupRetentionPeriod",
             @"CACertificateIdentifier" : @"CACertificateIdentifier",
             @"DBInstanceClass" : @"DBInstanceClass",
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"DBSubnetGroupName" : @"DBSubnetGroupName",
             @"engineVersion" : @"EngineVersion",
             @"iops" : @"Iops",
             @"licenseModel" : @"LicenseModel",
             @"masterUserPassword" : @"MasterUserPassword",
             @"multiAZ" : @"MultiAZ",
             @"pendingCloudwatchLogsExports" : @"PendingCloudwatchLogsExports",
             @"port" : @"Port",
             @"processorFeatures" : @"ProcessorFeatures",
             @"storageType" : @"StorageType",
             };
}

+ (NSValueTransformer *)pendingCloudwatchLogsExportsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsPendingCloudwatchLogsExports class]];
}

+ (NSValueTransformer *)processorFeaturesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsProcessorFeature class]];
}

@end

@implementation AWSrdsProcessorFeature

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSrdsPromoteReadReplicaDBClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             };
}

@end

@implementation AWSrdsPromoteReadReplicaDBClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBCluster" : @"DBCluster",
             };
}

+ (NSValueTransformer *)DBClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBCluster class]];
}

@end

@implementation AWSrdsPromoteReadReplicaMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupRetentionPeriod" : @"BackupRetentionPeriod",
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"preferredBackupWindow" : @"PreferredBackupWindow",
             };
}

@end

@implementation AWSrdsPromoteReadReplicaResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBInstance class]];
}

@end

@implementation AWSrdsPurchaseReservedDBInstancesOfferingMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceCount" : @"DBInstanceCount",
             @"reservedDBInstanceId" : @"ReservedDBInstanceId",
             @"reservedDBInstancesOfferingId" : @"ReservedDBInstancesOfferingId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsPurchaseReservedDBInstancesOfferingResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedDBInstance" : @"ReservedDBInstance",
             };
}

+ (NSValueTransformer *)reservedDBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsReservedDBInstance class]];
}

@end

@implementation AWSrdsRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"from" : @"From",
             @"step" : @"Step",
             @"to" : @"To",
             };
}

@end

@implementation AWSrdsRebootDBInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"forceFailover" : @"ForceFailover",
             };
}

@end

@implementation AWSrdsRebootDBInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBInstance class]];
}

@end

@implementation AWSrdsRecurringCharge

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recurringChargeAmount" : @"RecurringChargeAmount",
             @"recurringChargeFrequency" : @"RecurringChargeFrequency",
             };
}

@end

@implementation AWSrdsRegisterDBProxyTargetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifiers" : @"DBClusterIdentifiers",
             @"DBInstanceIdentifiers" : @"DBInstanceIdentifiers",
             @"DBProxyName" : @"DBProxyName",
             @"targetGroupName" : @"TargetGroupName",
             };
}

@end

@implementation AWSrdsRegisterDBProxyTargetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBProxyTargets" : @"DBProxyTargets",
             };
}

+ (NSValueTransformer *)DBProxyTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDBProxyTarget class]];
}

@end

@implementation AWSrdsRemoveFromGlobalClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dbClusterIdentifier" : @"DbClusterIdentifier",
             @"globalClusterIdentifier" : @"GlobalClusterIdentifier",
             };
}

@end

@implementation AWSrdsRemoveFromGlobalClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalCluster" : @"GlobalCluster",
             };
}

+ (NSValueTransformer *)globalClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsGlobalCluster class]];
}

@end

@implementation AWSrdsRemoveRoleFromDBClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"featureName" : @"FeatureName",
             @"roleArn" : @"RoleArn",
             };
}

@end

@implementation AWSrdsRemoveRoleFromDBInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"featureName" : @"FeatureName",
             @"roleArn" : @"RoleArn",
             };
}

@end

@implementation AWSrdsRemoveSourceIdentifierFromSubscriptionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceIdentifier" : @"SourceIdentifier",
             @"subscriptionName" : @"SubscriptionName",
             };
}

@end

@implementation AWSrdsRemoveSourceIdentifierFromSubscriptionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscription" : @"EventSubscription",
             };
}

+ (NSValueTransformer *)eventSubscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsEventSubscription class]];
}

@end

@implementation AWSrdsRemoveTagsFromResourceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceName" : @"ResourceName",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSrdsReservedDBInstance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currencyCode" : @"CurrencyCode",
             @"DBInstanceClass" : @"DBInstanceClass",
             @"DBInstanceCount" : @"DBInstanceCount",
             @"duration" : @"Duration",
             @"fixedPrice" : @"FixedPrice",
             @"leaseId" : @"LeaseId",
             @"multiAZ" : @"MultiAZ",
             @"offeringType" : @"OfferingType",
             @"productDescription" : @"ProductDescription",
             @"recurringCharges" : @"RecurringCharges",
             @"reservedDBInstanceArn" : @"ReservedDBInstanceArn",
             @"reservedDBInstanceId" : @"ReservedDBInstanceId",
             @"reservedDBInstancesOfferingId" : @"ReservedDBInstancesOfferingId",
             @"startTime" : @"StartTime",
             @"state" : @"State",
             @"usagePrice" : @"UsagePrice",
             };
}

+ (NSValueTransformer *)recurringChargesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsRecurringCharge class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSrdsReservedDBInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"reservedDBInstances" : @"ReservedDBInstances",
             };
}

+ (NSValueTransformer *)reservedDBInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsReservedDBInstance class]];
}

@end

@implementation AWSrdsReservedDBInstancesOffering

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currencyCode" : @"CurrencyCode",
             @"DBInstanceClass" : @"DBInstanceClass",
             @"duration" : @"Duration",
             @"fixedPrice" : @"FixedPrice",
             @"multiAZ" : @"MultiAZ",
             @"offeringType" : @"OfferingType",
             @"productDescription" : @"ProductDescription",
             @"recurringCharges" : @"RecurringCharges",
             @"reservedDBInstancesOfferingId" : @"ReservedDBInstancesOfferingId",
             @"usagePrice" : @"UsagePrice",
             };
}

+ (NSValueTransformer *)recurringChargesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsRecurringCharge class]];
}

@end

@implementation AWSrdsReservedDBInstancesOfferingMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"reservedDBInstancesOfferings" : @"ReservedDBInstancesOfferings",
             };
}

+ (NSValueTransformer *)reservedDBInstancesOfferingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsReservedDBInstancesOffering class]];
}

@end

@implementation AWSrdsResetDBClusterParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroupName" : @"DBClusterParameterGroupName",
             @"parameters" : @"Parameters",
             @"resetAllParameters" : @"ResetAllParameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsParameter class]];
}

@end

@implementation AWSrdsResetDBParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupName" : @"DBParameterGroupName",
             @"parameters" : @"Parameters",
             @"resetAllParameters" : @"ResetAllParameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsParameter class]];
}

@end

@implementation AWSrdsResourcePendingMaintenanceActions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pendingMaintenanceActionDetails" : @"PendingMaintenanceActionDetails",
             @"resourceIdentifier" : @"ResourceIdentifier",
             };
}

+ (NSValueTransformer *)pendingMaintenanceActionDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsPendingMaintenanceAction class]];
}

@end

@implementation AWSrdsRestoreDBClusterFromS3Message

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"backtrackWindow" : @"BacktrackWindow",
             @"backupRetentionPeriod" : @"BackupRetentionPeriod",
             @"characterSetName" : @"CharacterSetName",
             @"replicateTagsToSnapshot" : @"CopyTagsToSnapshot",
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"DBClusterParameterGroupName" : @"DBClusterParameterGroupName",
             @"DBSubnetGroupName" : @"DBSubnetGroupName",
             @"databaseName" : @"DatabaseName",
             @"deletionProtection" : @"DeletionProtection",
             @"domain" : @"Domain",
             @"domainIAMRoleName" : @"DomainIAMRoleName",
             @"enableCloudwatchLogsExports" : @"EnableCloudwatchLogsExports",
             @"enableIAMDatabaseAuthentication" : @"EnableIAMDatabaseAuthentication",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"kmsKeyId" : @"KmsKeyId",
             @"masterUserPassword" : @"MasterUserPassword",
             @"masterUsername" : @"MasterUsername",
             @"optionGroupName" : @"OptionGroupName",
             @"port" : @"Port",
             @"preferredBackupWindow" : @"PreferredBackupWindow",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"s3BucketName" : @"S3BucketName",
             @"s3IngestionRoleArn" : @"S3IngestionRoleArn",
             @"s3Prefix" : @"S3Prefix",
             @"sourceEngine" : @"SourceEngine",
             @"sourceEngineVersion" : @"SourceEngineVersion",
             @"storageEncrypted" : @"StorageEncrypted",
             @"tags" : @"Tags",
             @"vpcSecurityGroupIds" : @"VpcSecurityGroupIds",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsRestoreDBClusterFromS3Result

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBCluster" : @"DBCluster",
             };
}

+ (NSValueTransformer *)DBClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBCluster class]];
}

@end

@implementation AWSrdsRestoreDBClusterFromSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"backtrackWindow" : @"BacktrackWindow",
             @"replicateTagsToSnapshot" : @"CopyTagsToSnapshot",
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"DBClusterParameterGroupName" : @"DBClusterParameterGroupName",
             @"DBSubnetGroupName" : @"DBSubnetGroupName",
             @"databaseName" : @"DatabaseName",
             @"deletionProtection" : @"DeletionProtection",
             @"domain" : @"Domain",
             @"domainIAMRoleName" : @"DomainIAMRoleName",
             @"enableCloudwatchLogsExports" : @"EnableCloudwatchLogsExports",
             @"enableIAMDatabaseAuthentication" : @"EnableIAMDatabaseAuthentication",
             @"engine" : @"Engine",
             @"engineMode" : @"EngineMode",
             @"engineVersion" : @"EngineVersion",
             @"kmsKeyId" : @"KmsKeyId",
             @"optionGroupName" : @"OptionGroupName",
             @"port" : @"Port",
             @"scalingConfiguration" : @"ScalingConfiguration",
             @"snapshotIdentifier" : @"SnapshotIdentifier",
             @"tags" : @"Tags",
             @"vpcSecurityGroupIds" : @"VpcSecurityGroupIds",
             };
}

+ (NSValueTransformer *)scalingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsScalingConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsRestoreDBClusterFromSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBCluster" : @"DBCluster",
             };
}

+ (NSValueTransformer *)DBClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBCluster class]];
}

@end

@implementation AWSrdsRestoreDBClusterToPointInTimeMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backtrackWindow" : @"BacktrackWindow",
             @"replicateTagsToSnapshot" : @"CopyTagsToSnapshot",
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"DBClusterParameterGroupName" : @"DBClusterParameterGroupName",
             @"DBSubnetGroupName" : @"DBSubnetGroupName",
             @"deletionProtection" : @"DeletionProtection",
             @"domain" : @"Domain",
             @"domainIAMRoleName" : @"DomainIAMRoleName",
             @"enableCloudwatchLogsExports" : @"EnableCloudwatchLogsExports",
             @"enableIAMDatabaseAuthentication" : @"EnableIAMDatabaseAuthentication",
             @"kmsKeyId" : @"KmsKeyId",
             @"optionGroupName" : @"OptionGroupName",
             @"port" : @"Port",
             @"restoreToTime" : @"RestoreToTime",
             @"restoreType" : @"RestoreType",
             @"sourceDBClusterIdentifier" : @"SourceDBClusterIdentifier",
             @"tags" : @"Tags",
             @"useLatestRestorableTime" : @"UseLatestRestorableTime",
             @"vpcSecurityGroupIds" : @"VpcSecurityGroupIds",
             };
}

+ (NSValueTransformer *)restoreToTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsRestoreDBClusterToPointInTimeResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBCluster" : @"DBCluster",
             };
}

+ (NSValueTransformer *)DBClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBCluster class]];
}

@end

@implementation AWSrdsRestoreDBInstanceFromDBSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMinorVersionUpgrade" : @"AutoMinorVersionUpgrade",
             @"availabilityZone" : @"AvailabilityZone",
             @"replicateTagsToSnapshot" : @"CopyTagsToSnapshot",
             @"DBInstanceClass" : @"DBInstanceClass",
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"DBName" : @"DBName",
             @"DBParameterGroupName" : @"DBParameterGroupName",
             @"DBSnapshotIdentifier" : @"DBSnapshotIdentifier",
             @"DBSubnetGroupName" : @"DBSubnetGroupName",
             @"deletionProtection" : @"DeletionProtection",
             @"domain" : @"Domain",
             @"domainIAMRoleName" : @"DomainIAMRoleName",
             @"enableCloudwatchLogsExports" : @"EnableCloudwatchLogsExports",
             @"enableIAMDatabaseAuthentication" : @"EnableIAMDatabaseAuthentication",
             @"engine" : @"Engine",
             @"iops" : @"Iops",
             @"licenseModel" : @"LicenseModel",
             @"multiAZ" : @"MultiAZ",
             @"optionGroupName" : @"OptionGroupName",
             @"port" : @"Port",
             @"processorFeatures" : @"ProcessorFeatures",
             @"publiclyAccessible" : @"PubliclyAccessible",
             @"storageType" : @"StorageType",
             @"tags" : @"Tags",
             @"tdeCredentialArn" : @"TdeCredentialArn",
             @"tdeCredentialPassword" : @"TdeCredentialPassword",
             @"useDefaultProcessorFeatures" : @"UseDefaultProcessorFeatures",
             @"vpcSecurityGroupIds" : @"VpcSecurityGroupIds",
             };
}

+ (NSValueTransformer *)processorFeaturesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsProcessorFeature class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsRestoreDBInstanceFromDBSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBInstance class]];
}

@end

@implementation AWSrdsRestoreDBInstanceFromS3Message

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedStorage" : @"AllocatedStorage",
             @"autoMinorVersionUpgrade" : @"AutoMinorVersionUpgrade",
             @"availabilityZone" : @"AvailabilityZone",
             @"backupRetentionPeriod" : @"BackupRetentionPeriod",
             @"replicateTagsToSnapshot" : @"CopyTagsToSnapshot",
             @"DBInstanceClass" : @"DBInstanceClass",
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"DBName" : @"DBName",
             @"DBParameterGroupName" : @"DBParameterGroupName",
             @"DBSecurityGroups" : @"DBSecurityGroups",
             @"DBSubnetGroupName" : @"DBSubnetGroupName",
             @"deletionProtection" : @"DeletionProtection",
             @"enableCloudwatchLogsExports" : @"EnableCloudwatchLogsExports",
             @"enableIAMDatabaseAuthentication" : @"EnableIAMDatabaseAuthentication",
             @"enablePerformanceInsights" : @"EnablePerformanceInsights",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"iops" : @"Iops",
             @"kmsKeyId" : @"KmsKeyId",
             @"licenseModel" : @"LicenseModel",
             @"masterUserPassword" : @"MasterUserPassword",
             @"masterUsername" : @"MasterUsername",
             @"monitoringInterval" : @"MonitoringInterval",
             @"monitoringRoleArn" : @"MonitoringRoleArn",
             @"multiAZ" : @"MultiAZ",
             @"optionGroupName" : @"OptionGroupName",
             @"performanceInsightsKMSKeyId" : @"PerformanceInsightsKMSKeyId",
             @"performanceInsightsRetentionPeriod" : @"PerformanceInsightsRetentionPeriod",
             @"port" : @"Port",
             @"preferredBackupWindow" : @"PreferredBackupWindow",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"processorFeatures" : @"ProcessorFeatures",
             @"publiclyAccessible" : @"PubliclyAccessible",
             @"s3BucketName" : @"S3BucketName",
             @"s3IngestionRoleArn" : @"S3IngestionRoleArn",
             @"s3Prefix" : @"S3Prefix",
             @"sourceEngine" : @"SourceEngine",
             @"sourceEngineVersion" : @"SourceEngineVersion",
             @"storageEncrypted" : @"StorageEncrypted",
             @"storageType" : @"StorageType",
             @"tags" : @"Tags",
             @"useDefaultProcessorFeatures" : @"UseDefaultProcessorFeatures",
             @"vpcSecurityGroupIds" : @"VpcSecurityGroupIds",
             };
}

+ (NSValueTransformer *)processorFeaturesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsProcessorFeature class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsRestoreDBInstanceFromS3Result

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBInstance class]];
}

@end

@implementation AWSrdsRestoreDBInstanceToPointInTimeMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMinorVersionUpgrade" : @"AutoMinorVersionUpgrade",
             @"availabilityZone" : @"AvailabilityZone",
             @"replicateTagsToSnapshot" : @"CopyTagsToSnapshot",
             @"DBInstanceClass" : @"DBInstanceClass",
             @"DBName" : @"DBName",
             @"DBParameterGroupName" : @"DBParameterGroupName",
             @"DBSubnetGroupName" : @"DBSubnetGroupName",
             @"deletionProtection" : @"DeletionProtection",
             @"domain" : @"Domain",
             @"domainIAMRoleName" : @"DomainIAMRoleName",
             @"enableCloudwatchLogsExports" : @"EnableCloudwatchLogsExports",
             @"enableIAMDatabaseAuthentication" : @"EnableIAMDatabaseAuthentication",
             @"engine" : @"Engine",
             @"iops" : @"Iops",
             @"licenseModel" : @"LicenseModel",
             @"multiAZ" : @"MultiAZ",
             @"optionGroupName" : @"OptionGroupName",
             @"port" : @"Port",
             @"processorFeatures" : @"ProcessorFeatures",
             @"publiclyAccessible" : @"PubliclyAccessible",
             @"restoreTime" : @"RestoreTime",
             @"sourceDBInstanceIdentifier" : @"SourceDBInstanceIdentifier",
             @"sourceDbiResourceId" : @"SourceDbiResourceId",
             @"storageType" : @"StorageType",
             @"tags" : @"Tags",
             @"targetDBInstanceIdentifier" : @"TargetDBInstanceIdentifier",
             @"tdeCredentialArn" : @"TdeCredentialArn",
             @"tdeCredentialPassword" : @"TdeCredentialPassword",
             @"useDefaultProcessorFeatures" : @"UseDefaultProcessorFeatures",
             @"useLatestRestorableTime" : @"UseLatestRestorableTime",
             @"vpcSecurityGroupIds" : @"VpcSecurityGroupIds",
             };
}

+ (NSValueTransformer *)processorFeaturesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsProcessorFeature class]];
}

+ (NSValueTransformer *)restoreTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsRestoreDBInstanceToPointInTimeResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBInstance class]];
}

@end

@implementation AWSrdsRestoreWindow

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"earliestTime" : @"EarliestTime",
             @"latestTime" : @"LatestTime",
             };
}

+ (NSValueTransformer *)earliestTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)latestTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSrdsRevokeDBSecurityGroupIngressMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"CIDRIP" : @"CIDRIP",
             @"DBSecurityGroupName" : @"DBSecurityGroupName",
             @"EC2SecurityGroupId" : @"EC2SecurityGroupId",
             @"EC2SecurityGroupName" : @"EC2SecurityGroupName",
             @"EC2SecurityGroupOwnerId" : @"EC2SecurityGroupOwnerId",
             };
}

@end

@implementation AWSrdsRevokeDBSecurityGroupIngressResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSecurityGroup" : @"DBSecurityGroup",
             };
}

+ (NSValueTransformer *)DBSecurityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBSecurityGroup class]];
}

@end

@implementation AWSrdsScalingConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoPause" : @"AutoPause",
             @"maxCapacity" : @"MaxCapacity",
             @"minCapacity" : @"MinCapacity",
             @"secondsUntilAutoPause" : @"SecondsUntilAutoPause",
             @"timeoutAction" : @"TimeoutAction",
             };
}

@end

@implementation AWSrdsScalingConfigurationInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoPause" : @"AutoPause",
             @"maxCapacity" : @"MaxCapacity",
             @"minCapacity" : @"MinCapacity",
             @"secondsUntilAutoPause" : @"SecondsUntilAutoPause",
             @"timeoutAction" : @"TimeoutAction",
             };
}

@end

@implementation AWSrdsSourceRegion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoint" : @"Endpoint",
             @"regionName" : @"RegionName",
             @"status" : @"Status",
             };
}

@end

@implementation AWSrdsSourceRegionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"sourceRegions" : @"SourceRegions",
             };
}

+ (NSValueTransformer *)sourceRegionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsSourceRegion class]];
}

@end

@implementation AWSrdsStartActivityStreamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyImmediately" : @"ApplyImmediately",
             @"kmsKeyId" : @"KmsKeyId",
             @"mode" : @"Mode",
             @"resourceArn" : @"ResourceArn",
             };
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"sync"] == NSOrderedSame) {
            return @(AWSrdsActivityStreamModeSync);
        }
        if ([value caseInsensitiveCompare:@"async"] == NSOrderedSame) {
            return @(AWSrdsActivityStreamModeAsync);
        }
        return @(AWSrdsActivityStreamModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSrdsActivityStreamModeSync:
                return @"sync";
            case AWSrdsActivityStreamModeAsync:
                return @"async";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSrdsStartActivityStreamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyImmediately" : @"ApplyImmediately",
             @"kinesisStreamName" : @"KinesisStreamName",
             @"kmsKeyId" : @"KmsKeyId",
             @"mode" : @"Mode",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"sync"] == NSOrderedSame) {
            return @(AWSrdsActivityStreamModeSync);
        }
        if ([value caseInsensitiveCompare:@"async"] == NSOrderedSame) {
            return @(AWSrdsActivityStreamModeAsync);
        }
        return @(AWSrdsActivityStreamModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSrdsActivityStreamModeSync:
                return @"sync";
            case AWSrdsActivityStreamModeAsync:
                return @"async";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"stopped"] == NSOrderedSame) {
            return @(AWSrdsActivityStreamStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"starting"] == NSOrderedSame) {
            return @(AWSrdsActivityStreamStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"started"] == NSOrderedSame) {
            return @(AWSrdsActivityStreamStatusStarted);
        }
        if ([value caseInsensitiveCompare:@"stopping"] == NSOrderedSame) {
            return @(AWSrdsActivityStreamStatusStopping);
        }
        return @(AWSrdsActivityStreamStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSrdsActivityStreamStatusStopped:
                return @"stopped";
            case AWSrdsActivityStreamStatusStarting:
                return @"starting";
            case AWSrdsActivityStreamStatusStarted:
                return @"started";
            case AWSrdsActivityStreamStatusStopping:
                return @"stopping";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSrdsStartDBClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             };
}

@end

@implementation AWSrdsStartDBClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBCluster" : @"DBCluster",
             };
}

+ (NSValueTransformer *)DBClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBCluster class]];
}

@end

@implementation AWSrdsStartDBInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             };
}

@end

@implementation AWSrdsStartDBInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBInstance class]];
}

@end

@implementation AWSrdsStartExportTaskMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportOnly" : @"ExportOnly",
             @"exportTaskIdentifier" : @"ExportTaskIdentifier",
             @"iamRoleArn" : @"IamRoleArn",
             @"kmsKeyId" : @"KmsKeyId",
             @"s3BucketName" : @"S3BucketName",
             @"s3Prefix" : @"S3Prefix",
             @"sourceArn" : @"SourceArn",
             };
}

@end

@implementation AWSrdsStopActivityStreamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyImmediately" : @"ApplyImmediately",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSrdsStopActivityStreamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kinesisStreamName" : @"KinesisStreamName",
             @"kmsKeyId" : @"KmsKeyId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"stopped"] == NSOrderedSame) {
            return @(AWSrdsActivityStreamStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"starting"] == NSOrderedSame) {
            return @(AWSrdsActivityStreamStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"started"] == NSOrderedSame) {
            return @(AWSrdsActivityStreamStatusStarted);
        }
        if ([value caseInsensitiveCompare:@"stopping"] == NSOrderedSame) {
            return @(AWSrdsActivityStreamStatusStopping);
        }
        return @(AWSrdsActivityStreamStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSrdsActivityStreamStatusStopped:
                return @"stopped";
            case AWSrdsActivityStreamStatusStarting:
                return @"starting";
            case AWSrdsActivityStreamStatusStarted:
                return @"started";
            case AWSrdsActivityStreamStatusStopping:
                return @"stopping";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSrdsStopDBClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             };
}

@end

@implementation AWSrdsStopDBClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBCluster" : @"DBCluster",
             };
}

+ (NSValueTransformer *)DBClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBCluster class]];
}

@end

@implementation AWSrdsStopDBInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"DBSnapshotIdentifier" : @"DBSnapshotIdentifier",
             };
}

@end

@implementation AWSrdsStopDBInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsDBInstance class]];
}

@end

@implementation AWSrdsSubnet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subnetAvailabilityZone" : @"SubnetAvailabilityZone",
             @"subnetIdentifier" : @"SubnetIdentifier",
             @"subnetStatus" : @"SubnetStatus",
             };
}

+ (NSValueTransformer *)subnetAvailabilityZoneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSrdsAvailabilityZone class]];
}

@end

@implementation AWSrdsTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSrdsTagListMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagList" : @"TagList",
             };
}

+ (NSValueTransformer *)tagListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsTag class]];
}

@end

@implementation AWSrdsTargetHealth

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"reason" : @"Reason",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)reasonJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNREACHABLE"] == NSOrderedSame) {
            return @(AWSrdsTargetHealthReasonUnreachable);
        }
        if ([value caseInsensitiveCompare:@"CONNECTION_FAILED"] == NSOrderedSame) {
            return @(AWSrdsTargetHealthReasonConnectionFailed);
        }
        if ([value caseInsensitiveCompare:@"AUTH_FAILURE"] == NSOrderedSame) {
            return @(AWSrdsTargetHealthReasonAuthFailure);
        }
        if ([value caseInsensitiveCompare:@"PENDING_PROXY_CAPACITY"] == NSOrderedSame) {
            return @(AWSrdsTargetHealthReasonPendingProxyCapacity);
        }
        return @(AWSrdsTargetHealthReasonUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSrdsTargetHealthReasonUnreachable:
                return @"UNREACHABLE";
            case AWSrdsTargetHealthReasonConnectionFailed:
                return @"CONNECTION_FAILED";
            case AWSrdsTargetHealthReasonAuthFailure:
                return @"AUTH_FAILURE";
            case AWSrdsTargetHealthReasonPendingProxyCapacity:
                return @"PENDING_PROXY_CAPACITY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REGISTERING"] == NSOrderedSame) {
            return @(AWSrdsTargetStateRegistering);
        }
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSrdsTargetStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"UNAVAILABLE"] == NSOrderedSame) {
            return @(AWSrdsTargetStateUnavailable);
        }
        return @(AWSrdsTargetStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSrdsTargetStateRegistering:
                return @"REGISTERING";
            case AWSrdsTargetStateAvailable:
                return @"AVAILABLE";
            case AWSrdsTargetStateUnavailable:
                return @"UNAVAILABLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSrdsTimezone

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"timezoneName" : @"TimezoneName",
             };
}

@end

@implementation AWSrdsUpgradeTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoUpgrade" : @"AutoUpgrade",
             @"detail" : @"Description",
             @"engine" : @"Engine",
             @"engineVersion" : @"EngineVersion",
             @"isMajorVersionUpgrade" : @"IsMajorVersionUpgrade",
             };
}

@end

@implementation AWSrdsUserAuthConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authScheme" : @"AuthScheme",
             @"detail" : @"Description",
             @"IAMAuth" : @"IAMAuth",
             @"secretArn" : @"SecretArn",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)authSchemeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECRETS"] == NSOrderedSame) {
            return @(AWSrdsAuthSchemeSecrets);
        }
        return @(AWSrdsAuthSchemeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSrdsAuthSchemeSecrets:
                return @"SECRETS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)IAMAuthJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSrdsIAMAuthModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"REQUIRED"] == NSOrderedSame) {
            return @(AWSrdsIAMAuthModeRequired);
        }
        return @(AWSrdsIAMAuthModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSrdsIAMAuthModeDisabled:
                return @"DISABLED";
            case AWSrdsIAMAuthModeRequired:
                return @"REQUIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSrdsUserAuthConfigInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authScheme" : @"AuthScheme",
             @"detail" : @"Description",
             @"IAMAuth" : @"IAMAuth",
             @"secretArn" : @"SecretArn",
             @"userName" : @"UserName",
             };
}

+ (NSValueTransformer *)authSchemeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECRETS"] == NSOrderedSame) {
            return @(AWSrdsAuthSchemeSecrets);
        }
        return @(AWSrdsAuthSchemeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSrdsAuthSchemeSecrets:
                return @"SECRETS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)IAMAuthJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSrdsIAMAuthModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"REQUIRED"] == NSOrderedSame) {
            return @(AWSrdsIAMAuthModeRequired);
        }
        return @(AWSrdsIAMAuthModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSrdsIAMAuthModeDisabled:
                return @"DISABLED";
            case AWSrdsIAMAuthModeRequired:
                return @"REQUIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSrdsValidDBInstanceModificationsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"storage" : @"Storage",
             @"validProcessorFeatures" : @"ValidProcessorFeatures",
             };
}

+ (NSValueTransformer *)storageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsValidStorageOptions class]];
}

+ (NSValueTransformer *)validProcessorFeaturesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsAvailableProcessorFeature class]];
}

@end

@implementation AWSrdsValidStorageOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"iopsToStorageRatio" : @"IopsToStorageRatio",
             @"provisionedIops" : @"ProvisionedIops",
             @"storageSize" : @"StorageSize",
             @"storageType" : @"StorageType",
             @"supportsStorageAutoscaling" : @"SupportsStorageAutoscaling",
             };
}

+ (NSValueTransformer *)iopsToStorageRatioJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsDoubleRange class]];
}

+ (NSValueTransformer *)provisionedIopsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsRange class]];
}

+ (NSValueTransformer *)storageSizeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSrdsRange class]];
}

@end

@implementation AWSrdsVpcSecurityGroupMembership

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             @"vpcSecurityGroupId" : @"VpcSecurityGroupId",
             };
}

@end

@implementation AWSrdsVpnDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpnGatewayIp" : @"VpnGatewayIp",
             @"vpnId" : @"VpnId",
             @"vpnName" : @"VpnName",
             @"vpnPSK" : @"VpnPSK",
             @"vpnState" : @"VpnState",
             @"vpnTunnelOriginatorIP" : @"VpnTunnelOriginatorIP",
             };
}

@end
