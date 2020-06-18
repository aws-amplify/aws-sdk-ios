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

#import "AWSRdsModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSRdsErrorDomain = @"com.amazonaws.AWSRdsErrorDomain";

@implementation AWSRdsAccountAttributesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountQuotas" : @"AccountQuotas",
             };
}

+ (NSValueTransformer *)accountQuotasJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsAccountQuota class]];
}

@end

@implementation AWSRdsAccountQuota

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountQuotaName" : @"AccountQuotaName",
             @"max" : @"Max",
             @"used" : @"Used",
             };
}

@end

@implementation AWSRdsAddRoleToDBClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"featureName" : @"FeatureName",
             @"roleArn" : @"RoleArn",
             };
}

@end

@implementation AWSRdsAddRoleToDBInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"featureName" : @"FeatureName",
             @"roleArn" : @"RoleArn",
             };
}

@end

@implementation AWSRdsAddSourceIdentifierToSubscriptionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceIdentifier" : @"SourceIdentifier",
             @"subscriptionName" : @"SubscriptionName",
             };
}

@end

@implementation AWSRdsAddSourceIdentifierToSubscriptionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscription" : @"EventSubscription",
             };
}

+ (NSValueTransformer *)eventSubscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsEventSubscription class]];
}

@end

@implementation AWSRdsAddTagsToResourceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceName" : @"ResourceName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsApplyPendingMaintenanceActionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyAction" : @"ApplyAction",
             @"optInType" : @"OptInType",
             @"resourceIdentifier" : @"ResourceIdentifier",
             };
}

@end

@implementation AWSRdsApplyPendingMaintenanceActionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourcePendingMaintenanceActions" : @"ResourcePendingMaintenanceActions",
             };
}

+ (NSValueTransformer *)resourcePendingMaintenanceActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsResourcePendingMaintenanceActions class]];
}

@end

@implementation AWSRdsAuthorizeDBSecurityGroupIngressMessage

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

@implementation AWSRdsAuthorizeDBSecurityGroupIngressResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSecurityGroup" : @"DBSecurityGroup",
             };
}

+ (NSValueTransformer *)DBSecurityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBSecurityGroup class]];
}

@end

@implementation AWSRdsAvailabilityZone

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSRdsAvailableProcessorFeature

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedValues" : @"AllowedValues",
             @"defaultValue" : @"DefaultValue",
             @"name" : @"Name",
             };
}

@end

@implementation AWSRdsBacktrackDBClusterMessage

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

@implementation AWSRdsCancelExportTaskMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportTaskIdentifier" : @"ExportTaskIdentifier",
             };
}

@end

@implementation AWSRdsCertificate

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

@implementation AWSRdsCertificateMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificates" : @"Certificates",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)certificatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsCertificate class]];
}

@end

@implementation AWSRdsCharacterSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"characterSetDescription" : @"CharacterSetDescription",
             @"characterSetName" : @"CharacterSetName",
             };
}

@end

@implementation AWSRdsCloudwatchLogsExportConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"disableLogTypes" : @"DisableLogTypes",
             @"enableLogTypes" : @"EnableLogTypes",
             };
}

@end

@implementation AWSRdsConnectionPoolConfiguration

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

@implementation AWSRdsConnectionPoolConfigurationInfo

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

@implementation AWSRdsReplicateDBClusterParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceDBClusterParameterGroupIdentifier" : @"SourceDBClusterParameterGroupIdentifier",
             @"tags" : @"Tags",
             @"targetDBClusterParameterGroupDescription" : @"TargetDBClusterParameterGroupDescription",
             @"targetDBClusterParameterGroupIdentifier" : @"TargetDBClusterParameterGroupIdentifier",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsReplicateDBClusterParameterGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroup" : @"DBClusterParameterGroup",
             };
}

+ (NSValueTransformer *)DBClusterParameterGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBClusterParameterGroup class]];
}

@end

@implementation AWSRdsReplicateDBClusterSnapshotMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsReplicateDBClusterSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterSnapshot" : @"DBClusterSnapshot",
             };
}

+ (NSValueTransformer *)DBClusterSnapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBClusterSnapshot class]];
}

@end

@implementation AWSRdsReplicateDBParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceDBParameterGroupIdentifier" : @"SourceDBParameterGroupIdentifier",
             @"tags" : @"Tags",
             @"targetDBParameterGroupDescription" : @"TargetDBParameterGroupDescription",
             @"targetDBParameterGroupIdentifier" : @"TargetDBParameterGroupIdentifier",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsReplicateDBParameterGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroup" : @"DBParameterGroup",
             };
}

+ (NSValueTransformer *)DBParameterGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBParameterGroup class]];
}

@end

@implementation AWSRdsReplicateDBSnapshotMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsReplicateDBSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshot" : @"DBSnapshot",
             };
}

+ (NSValueTransformer *)DBSnapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBSnapshot class]];
}

@end

@implementation AWSRdsReplicateOptionGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceOptionGroupIdentifier" : @"SourceOptionGroupIdentifier",
             @"tags" : @"Tags",
             @"targetOptionGroupDescription" : @"TargetOptionGroupDescription",
             @"targetOptionGroupIdentifier" : @"TargetOptionGroupIdentifier",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsReplicateOptionGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"optionGroup" : @"OptionGroup",
             };
}

+ (NSValueTransformer *)optionGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsOptionGroup class]];
}

@end

@implementation AWSRdsCreateCustomAvailabilityZoneMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customAvailabilityZoneName" : @"CustomAvailabilityZoneName",
             @"existingVpnId" : @"ExistingVpnId",
             @"latestVpnTunnelName" : @"NewVpnTunnelName",
             @"vpnTunnelOriginatorIP" : @"VpnTunnelOriginatorIP",
             };
}

@end

@implementation AWSRdsCreateCustomAvailabilityZoneResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customAvailabilityZone" : @"CustomAvailabilityZone",
             };
}

+ (NSValueTransformer *)customAvailabilityZoneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsCustomAvailabilityZone class]];
}

@end

@implementation AWSRdsCreateDBClusterEndpointMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsCreateDBClusterMessage

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
             @"enableGlobalWriteForwarding" : @"EnableGlobalWriteForwarding",
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsScalingConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsCreateDBClusterParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroupName" : @"DBClusterParameterGroupName",
             @"DBParameterGroupFamily" : @"DBParameterGroupFamily",
             @"detail" : @"Description",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsCreateDBClusterParameterGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroup" : @"DBClusterParameterGroup",
             };
}

+ (NSValueTransformer *)DBClusterParameterGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBClusterParameterGroup class]];
}

@end

@implementation AWSRdsCreateDBClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBCluster" : @"DBCluster",
             };
}

+ (NSValueTransformer *)DBClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBCluster class]];
}

@end

@implementation AWSRdsCreateDBClusterSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"DBClusterSnapshotIdentifier" : @"DBClusterSnapshotIdentifier",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsCreateDBClusterSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterSnapshot" : @"DBClusterSnapshot",
             };
}

+ (NSValueTransformer *)DBClusterSnapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBClusterSnapshot class]];
}

@end

@implementation AWSRdsCreateDBInstanceMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsProcessorFeature class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsCreateDBInstanceReadReplicaMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsProcessorFeature class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsCreateDBInstanceReadReplicaResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBInstance class]];
}

@end

@implementation AWSRdsCreateDBInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBInstance class]];
}

@end

@implementation AWSRdsCreateDBParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupFamily" : @"DBParameterGroupFamily",
             @"DBParameterGroupName" : @"DBParameterGroupName",
             @"detail" : @"Description",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsCreateDBParameterGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroup" : @"DBParameterGroup",
             };
}

+ (NSValueTransformer *)DBParameterGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBParameterGroup class]];
}

@end

@implementation AWSRdsCreateDBProxyRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsUserAuthConfig class]];
}

+ (NSValueTransformer *)engineFamilyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MYSQL"] == NSOrderedSame) {
            return @(AWSRdsEngineFamilyMysql);
        }
        if ([value caseInsensitiveCompare:@"POSTGRESQL"] == NSOrderedSame) {
            return @(AWSRdsEngineFamilyPostgresql);
        }
        return @(AWSRdsEngineFamilyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRdsEngineFamilyMysql:
                return @"MYSQL";
            case AWSRdsEngineFamilyPostgresql:
                return @"POSTGRESQL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsCreateDBProxyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBProxy" : @"DBProxy",
             };
}

+ (NSValueTransformer *)DBProxyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBProxy class]];
}

@end

@implementation AWSRdsCreateDBSecurityGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSecurityGroupDescription" : @"DBSecurityGroupDescription",
             @"DBSecurityGroupName" : @"DBSecurityGroupName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsCreateDBSecurityGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSecurityGroup" : @"DBSecurityGroup",
             };
}

+ (NSValueTransformer *)DBSecurityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBSecurityGroup class]];
}

@end

@implementation AWSRdsCreateDBSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"DBSnapshotIdentifier" : @"DBSnapshotIdentifier",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsCreateDBSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshot" : @"DBSnapshot",
             };
}

+ (NSValueTransformer *)DBSnapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBSnapshot class]];
}

@end

@implementation AWSRdsCreateDBSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSubnetGroupDescription" : @"DBSubnetGroupDescription",
             @"DBSubnetGroupName" : @"DBSubnetGroupName",
             @"subnetIds" : @"SubnetIds",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsCreateDBSubnetGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSubnetGroup" : @"DBSubnetGroup",
             };
}

+ (NSValueTransformer *)DBSubnetGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBSubnetGroup class]];
}

@end

@implementation AWSRdsCreateEventSubscriptionMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsCreateEventSubscriptionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscription" : @"EventSubscription",
             };
}

+ (NSValueTransformer *)eventSubscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsEventSubscription class]];
}

@end

@implementation AWSRdsCreateGlobalClusterMessage

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

@implementation AWSRdsCreateGlobalClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalCluster" : @"GlobalCluster",
             };
}

+ (NSValueTransformer *)globalClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsGlobalCluster class]];
}

@end

@implementation AWSRdsCreateOptionGroupMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsCreateOptionGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"optionGroup" : @"OptionGroup",
             };
}

+ (NSValueTransformer *)optionGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsOptionGroup class]];
}

@end

@implementation AWSRdsCustomAvailabilityZone

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customAvailabilityZoneId" : @"CustomAvailabilityZoneId",
             @"customAvailabilityZoneName" : @"CustomAvailabilityZoneName",
             @"customAvailabilityZoneStatus" : @"CustomAvailabilityZoneStatus",
             @"vpnDetails" : @"VpnDetails",
             };
}

+ (NSValueTransformer *)vpnDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsVpnDetails class]];
}

@end

@implementation AWSRdsCustomAvailabilityZoneMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customAvailabilityZones" : @"CustomAvailabilityZones",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)customAvailabilityZonesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsCustomAvailabilityZone class]];
}

@end

@implementation AWSRdsDBCluster

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
             @"globalWriteForwardingRequested" : @"GlobalWriteForwardingRequested",
             @"globalWriteForwardingStatus" : @"GlobalWriteForwardingStatus",
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
            return @(AWSRdsActivityStreamModeSync);
        }
        if ([value caseInsensitiveCompare:@"async"] == NSOrderedSame) {
            return @(AWSRdsActivityStreamModeAsync);
        }
        return @(AWSRdsActivityStreamModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRdsActivityStreamModeSync:
                return @"sync";
            case AWSRdsActivityStreamModeAsync:
                return @"async";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)activityStreamStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"stopped"] == NSOrderedSame) {
            return @(AWSRdsActivityStreamStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"starting"] == NSOrderedSame) {
            return @(AWSRdsActivityStreamStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"started"] == NSOrderedSame) {
            return @(AWSRdsActivityStreamStatusStarted);
        }
        if ([value caseInsensitiveCompare:@"stopping"] == NSOrderedSame) {
            return @(AWSRdsActivityStreamStatusStopping);
        }
        return @(AWSRdsActivityStreamStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRdsActivityStreamStatusStopped:
                return @"stopped";
            case AWSRdsActivityStreamStatusStarting:
                return @"starting";
            case AWSRdsActivityStreamStatusStarted:
                return @"started";
            case AWSRdsActivityStreamStatusStopping:
                return @"stopping";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)associatedRolesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBClusterRole class]];
}

+ (NSValueTransformer *)clusterCreateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)DBClusterMembersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBClusterMember class]];
}

+ (NSValueTransformer *)DBClusterOptionGroupMembershipsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBClusterOptionGroupStatus class]];
}

+ (NSValueTransformer *)domainMembershipsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDomainMembership class]];
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

+ (NSValueTransformer *)globalWriteForwardingStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"enabled"] == NSOrderedSame) {
            return @(AWSRdsWriteForwardingStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"disabled"] == NSOrderedSame) {
            return @(AWSRdsWriteForwardingStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"enabling"] == NSOrderedSame) {
            return @(AWSRdsWriteForwardingStatusEnabling);
        }
        if ([value caseInsensitiveCompare:@"disabling"] == NSOrderedSame) {
            return @(AWSRdsWriteForwardingStatusDisabling);
        }
        if ([value caseInsensitiveCompare:@"unknown"] == NSOrderedSame) {
            return @(AWSRdsWriteForwardingStatusUnknown);
        }
        return @(AWSRdsWriteForwardingStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRdsWriteForwardingStatusEnabled:
                return @"enabled";
            case AWSRdsWriteForwardingStatusDisabled:
                return @"disabled";
            case AWSRdsWriteForwardingStatusEnabling:
                return @"enabling";
            case AWSRdsWriteForwardingStatusDisabling:
                return @"disabling";
            case AWSRdsWriteForwardingStatusUnknown:
                return @"unknown";
            default:
                return nil;
        }
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsScalingConfigurationInfo class]];
}

+ (NSValueTransformer *)vpcSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsVpcSecurityGroupMembership class]];
}

@end

@implementation AWSRdsDBClusterBacktrack

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

@implementation AWSRdsDBClusterBacktrackMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterBacktracks" : @"DBClusterBacktracks",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBClusterBacktracksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBClusterBacktrack class]];
}

@end

@implementation AWSRdsDBClusterCapacityInfo

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

@implementation AWSRdsDBClusterEndpoint

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

@implementation AWSRdsDBClusterEndpointMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterEndpoints" : @"DBClusterEndpoints",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBClusterEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBClusterEndpoint class]];
}

@end

@implementation AWSRdsDBClusterMember

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroupStatus" : @"DBClusterParameterGroupStatus",
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"isClusterWriter" : @"IsClusterWriter",
             @"promotionTier" : @"PromotionTier",
             };
}

@end

@implementation AWSRdsDBClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusters" : @"DBClusters",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBClustersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBCluster class]];
}

@end

@implementation AWSRdsDBClusterOptionGroupStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterOptionGroupName" : @"DBClusterOptionGroupName",
             @"status" : @"Status",
             };
}

@end

@implementation AWSRdsDBClusterParameterGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroupArn" : @"DBClusterParameterGroupArn",
             @"DBClusterParameterGroupName" : @"DBClusterParameterGroupName",
             @"DBParameterGroupFamily" : @"DBParameterGroupFamily",
             @"detail" : @"Description",
             };
}

@end

@implementation AWSRdsDBClusterParameterGroupDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsParameter class]];
}

@end

@implementation AWSRdsDBClusterParameterGroupNameMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroupName" : @"DBClusterParameterGroupName",
             };
}

@end

@implementation AWSRdsDBClusterParameterGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroups" : @"DBClusterParameterGroups",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBClusterParameterGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBClusterParameterGroup class]];
}

@end

@implementation AWSRdsDBClusterRole

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"featureName" : @"FeatureName",
             @"roleArn" : @"RoleArn",
             @"status" : @"Status",
             };
}

@end

@implementation AWSRdsDBClusterSnapshot

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

@implementation AWSRdsDBClusterSnapshotAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"attributeValues" : @"AttributeValues",
             };
}

@end

@implementation AWSRdsDBClusterSnapshotAttributesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterSnapshotAttributes" : @"DBClusterSnapshotAttributes",
             @"DBClusterSnapshotIdentifier" : @"DBClusterSnapshotIdentifier",
             };
}

+ (NSValueTransformer *)DBClusterSnapshotAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBClusterSnapshotAttribute class]];
}

@end

@implementation AWSRdsDBClusterSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterSnapshots" : @"DBClusterSnapshots",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBClusterSnapshotsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBClusterSnapshot class]];
}

@end

@implementation AWSRdsDBEngineVersion

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsCharacterSet class]];
}

+ (NSValueTransformer *)supportedCharacterSetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsCharacterSet class]];
}

+ (NSValueTransformer *)supportedTimezonesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTimezone class]];
}

+ (NSValueTransformer *)validUpgradeTargetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsUpgradeTarget class]];
}

@end

@implementation AWSRdsDBEngineVersionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBEngineVersions" : @"DBEngineVersions",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBEngineVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBEngineVersion class]];
}

@end

@implementation AWSRdsDBInstance

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBInstanceRole class]];
}

+ (NSValueTransformer *)DBParameterGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBParameterGroupStatus class]];
}

+ (NSValueTransformer *)DBSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBSecurityGroupMembership class]];
}

+ (NSValueTransformer *)DBSubnetGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBSubnetGroup class]];
}

+ (NSValueTransformer *)domainMembershipsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDomainMembership class]];
}

+ (NSValueTransformer *)endpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsEndpoint class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsEndpoint class]];
}

+ (NSValueTransformer *)optionGroupMembershipsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsOptionGroupMembership class]];
}

+ (NSValueTransformer *)pendingModifiedValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsPendingModifiedValues class]];
}

+ (NSValueTransformer *)processorFeaturesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsProcessorFeature class]];
}

+ (NSValueTransformer *)statusInfosJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBInstanceStatusInfo class]];
}

+ (NSValueTransformer *)vpcSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsVpcSecurityGroupMembership class]];
}

@end

@implementation AWSRdsDBInstanceAutomatedBackup

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsRestoreWindow class]];
}

@end

@implementation AWSRdsDBInstanceAutomatedBackupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceAutomatedBackups" : @"DBInstanceAutomatedBackups",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBInstanceAutomatedBackupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBInstanceAutomatedBackup class]];
}

@end

@implementation AWSRdsDBInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstances" : @"DBInstances",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBInstance class]];
}

@end

@implementation AWSRdsDBInstanceRole

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"featureName" : @"FeatureName",
             @"roleArn" : @"RoleArn",
             @"status" : @"Status",
             };
}

@end

@implementation AWSRdsDBInstanceStatusInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"normal" : @"Normal",
             @"status" : @"Status",
             @"statusType" : @"StatusType",
             };
}

@end

@implementation AWSRdsDBParameterGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupArn" : @"DBParameterGroupArn",
             @"DBParameterGroupFamily" : @"DBParameterGroupFamily",
             @"DBParameterGroupName" : @"DBParameterGroupName",
             @"detail" : @"Description",
             };
}

@end

@implementation AWSRdsDBParameterGroupDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsParameter class]];
}

@end

@implementation AWSRdsDBParameterGroupNameMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupName" : @"DBParameterGroupName",
             };
}

@end

@implementation AWSRdsDBParameterGroupStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupName" : @"DBParameterGroupName",
             @"parameterApplyStatus" : @"ParameterApplyStatus",
             };
}

@end

@implementation AWSRdsDBParameterGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroups" : @"DBParameterGroups",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBParameterGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBParameterGroup class]];
}

@end

@implementation AWSRdsDBProxy

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsUserAuthConfigInfo class]];
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
            return @(AWSRdsDBProxyStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"modifying"] == NSOrderedSame) {
            return @(AWSRdsDBProxyStatusModifying);
        }
        if ([value caseInsensitiveCompare:@"incompatible-network"] == NSOrderedSame) {
            return @(AWSRdsDBProxyStatusIncompatibleNetwork);
        }
        if ([value caseInsensitiveCompare:@"insufficient-resource-limits"] == NSOrderedSame) {
            return @(AWSRdsDBProxyStatusInsufficientResourceLimits);
        }
        if ([value caseInsensitiveCompare:@"creating"] == NSOrderedSame) {
            return @(AWSRdsDBProxyStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSRdsDBProxyStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"suspended"] == NSOrderedSame) {
            return @(AWSRdsDBProxyStatusSuspended);
        }
        if ([value caseInsensitiveCompare:@"suspending"] == NSOrderedSame) {
            return @(AWSRdsDBProxyStatusSuspending);
        }
        if ([value caseInsensitiveCompare:@"reactivating"] == NSOrderedSame) {
            return @(AWSRdsDBProxyStatusReactivating);
        }
        return @(AWSRdsDBProxyStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRdsDBProxyStatusAvailable:
                return @"available";
            case AWSRdsDBProxyStatusModifying:
                return @"modifying";
            case AWSRdsDBProxyStatusIncompatibleNetwork:
                return @"incompatible-network";
            case AWSRdsDBProxyStatusInsufficientResourceLimits:
                return @"insufficient-resource-limits";
            case AWSRdsDBProxyStatusCreating:
                return @"creating";
            case AWSRdsDBProxyStatusDeleting:
                return @"deleting";
            case AWSRdsDBProxyStatusSuspended:
                return @"suspended";
            case AWSRdsDBProxyStatusSuspending:
                return @"suspending";
            case AWSRdsDBProxyStatusReactivating:
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

@implementation AWSRdsDBProxyTarget

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsTargetHealth class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RDS_INSTANCE"] == NSOrderedSame) {
            return @(AWSRdsTargetTypeRdsInstance);
        }
        if ([value caseInsensitiveCompare:@"RDS_SERVERLESS_ENDPOINT"] == NSOrderedSame) {
            return @(AWSRdsTargetTypeRdsServerlessEndpoint);
        }
        if ([value caseInsensitiveCompare:@"TRACKED_CLUSTER"] == NSOrderedSame) {
            return @(AWSRdsTargetTypeTrackedCluster);
        }
        return @(AWSRdsTargetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRdsTargetTypeRdsInstance:
                return @"RDS_INSTANCE";
            case AWSRdsTargetTypeRdsServerlessEndpoint:
                return @"RDS_SERVERLESS_ENDPOINT";
            case AWSRdsTargetTypeTrackedCluster:
                return @"TRACKED_CLUSTER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRdsDBProxyTargetGroup

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsConnectionPoolConfigurationInfo class]];
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

@implementation AWSRdsDBSecurityGroup

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsEC2SecurityGroup class]];
}

+ (NSValueTransformer *)IPRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsIPRange class]];
}

@end

@implementation AWSRdsDBSecurityGroupMembership

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSecurityGroupName" : @"DBSecurityGroupName",
             @"status" : @"Status",
             };
}

@end

@implementation AWSRdsDBSecurityGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSecurityGroups" : @"DBSecurityGroups",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBSecurityGroup class]];
}

@end

@implementation AWSRdsDBSnapshot

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsProcessorFeature class]];
}

+ (NSValueTransformer *)snapshotCreateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSRdsDBSnapshotAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"attributeValues" : @"AttributeValues",
             };
}

@end

@implementation AWSRdsDBSnapshotAttributesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshotAttributes" : @"DBSnapshotAttributes",
             @"DBSnapshotIdentifier" : @"DBSnapshotIdentifier",
             };
}

+ (NSValueTransformer *)DBSnapshotAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBSnapshotAttribute class]];
}

@end

@implementation AWSRdsDBSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshots" : @"DBSnapshots",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBSnapshotsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBSnapshot class]];
}

@end

@implementation AWSRdsDBSubnetGroup

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsSubnet class]];
}

@end

@implementation AWSRdsDBSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSubnetGroups" : @"DBSubnetGroups",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBSubnetGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBSubnetGroup class]];
}

@end

@implementation AWSRdsDeleteCustomAvailabilityZoneMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customAvailabilityZoneId" : @"CustomAvailabilityZoneId",
             };
}

@end

@implementation AWSRdsDeleteCustomAvailabilityZoneResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customAvailabilityZone" : @"CustomAvailabilityZone",
             };
}

+ (NSValueTransformer *)customAvailabilityZoneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsCustomAvailabilityZone class]];
}

@end

@implementation AWSRdsDeleteDBClusterEndpointMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterEndpointIdentifier" : @"DBClusterEndpointIdentifier",
             };
}

@end

@implementation AWSRdsDeleteDBClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"finalDBSnapshotIdentifier" : @"FinalDBSnapshotIdentifier",
             @"skipFinalSnapshot" : @"SkipFinalSnapshot",
             };
}

@end

@implementation AWSRdsDeleteDBClusterParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroupName" : @"DBClusterParameterGroupName",
             };
}

@end

@implementation AWSRdsDeleteDBClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBCluster" : @"DBCluster",
             };
}

+ (NSValueTransformer *)DBClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBCluster class]];
}

@end

@implementation AWSRdsDeleteDBClusterSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterSnapshotIdentifier" : @"DBClusterSnapshotIdentifier",
             };
}

@end

@implementation AWSRdsDeleteDBClusterSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterSnapshot" : @"DBClusterSnapshot",
             };
}

+ (NSValueTransformer *)DBClusterSnapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBClusterSnapshot class]];
}

@end

@implementation AWSRdsDeleteDBInstanceAutomatedBackupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dbiResourceId" : @"DbiResourceId",
             };
}

@end

@implementation AWSRdsDeleteDBInstanceAutomatedBackupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceAutomatedBackup" : @"DBInstanceAutomatedBackup",
             };
}

+ (NSValueTransformer *)DBInstanceAutomatedBackupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBInstanceAutomatedBackup class]];
}

@end

@implementation AWSRdsDeleteDBInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"deleteAutomatedBackups" : @"DeleteAutomatedBackups",
             @"finalDBSnapshotIdentifier" : @"FinalDBSnapshotIdentifier",
             @"skipFinalSnapshot" : @"SkipFinalSnapshot",
             };
}

@end

@implementation AWSRdsDeleteDBInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBInstance class]];
}

@end

@implementation AWSRdsDeleteDBParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupName" : @"DBParameterGroupName",
             };
}

@end

@implementation AWSRdsDeleteDBProxyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBProxyName" : @"DBProxyName",
             };
}

@end

@implementation AWSRdsDeleteDBProxyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBProxy" : @"DBProxy",
             };
}

+ (NSValueTransformer *)DBProxyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBProxy class]];
}

@end

@implementation AWSRdsDeleteDBSecurityGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSecurityGroupName" : @"DBSecurityGroupName",
             };
}

@end

@implementation AWSRdsDeleteDBSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshotIdentifier" : @"DBSnapshotIdentifier",
             };
}

@end

@implementation AWSRdsDeleteDBSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshot" : @"DBSnapshot",
             };
}

+ (NSValueTransformer *)DBSnapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBSnapshot class]];
}

@end

@implementation AWSRdsDeleteDBSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSubnetGroupName" : @"DBSubnetGroupName",
             };
}

@end

@implementation AWSRdsDeleteEventSubscriptionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subscriptionName" : @"SubscriptionName",
             };
}

@end

@implementation AWSRdsDeleteEventSubscriptionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscription" : @"EventSubscription",
             };
}

+ (NSValueTransformer *)eventSubscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsEventSubscription class]];
}

@end

@implementation AWSRdsDeleteGlobalClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalClusterIdentifier" : @"GlobalClusterIdentifier",
             };
}

@end

@implementation AWSRdsDeleteGlobalClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalCluster" : @"GlobalCluster",
             };
}

+ (NSValueTransformer *)globalClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsGlobalCluster class]];
}

@end

@implementation AWSRdsDeleteInstallationMediaMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"installationMediaId" : @"InstallationMediaId",
             };
}

@end

@implementation AWSRdsDeleteOptionGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"optionGroupName" : @"OptionGroupName",
             };
}

@end

@implementation AWSRdsDeregisterDBProxyTargetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifiers" : @"DBClusterIdentifiers",
             @"DBInstanceIdentifiers" : @"DBInstanceIdentifiers",
             @"DBProxyName" : @"DBProxyName",
             @"targetGroupName" : @"TargetGroupName",
             };
}

@end

@implementation AWSRdsDeregisterDBProxyTargetsResponse

@end

@implementation AWSRdsDescribeAccountAttributesMessage

@end

@implementation AWSRdsDescribeCertificatesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateIdentifier" : @"CertificateIdentifier",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeCustomAvailabilityZonesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customAvailabilityZoneId" : @"CustomAvailabilityZoneId",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeDBClusterBacktracksMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeDBClusterEndpointsMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeDBClusterParameterGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroupName" : @"DBClusterParameterGroupName",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeDBClusterParametersMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeDBClusterSnapshotAttributesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterSnapshotIdentifier" : @"DBClusterSnapshotIdentifier",
             };
}

@end

@implementation AWSRdsDescribeDBClusterSnapshotAttributesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterSnapshotAttributesResult" : @"DBClusterSnapshotAttributesResult",
             };
}

+ (NSValueTransformer *)DBClusterSnapshotAttributesResultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBClusterSnapshotAttributesResult class]];
}

@end

@implementation AWSRdsDescribeDBClusterSnapshotsMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeDBClustersMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeDBEngineVersionsMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeDBInstanceAutomatedBackupsMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeDBInstancesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeDBLogFilesDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastWritten" : @"LastWritten",
             @"logFileName" : @"LogFileName",
             @"size" : @"Size",
             };
}

@end

@implementation AWSRdsDescribeDBLogFilesMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeDBLogFilesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"describeDBLogFiles" : @"DescribeDBLogFiles",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)describeDBLogFilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDescribeDBLogFilesDetails class]];
}

@end

@implementation AWSRdsDescribeDBParameterGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupName" : @"DBParameterGroupName",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeDBParametersMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeDBProxiesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBProxyName" : @"DBProxyName",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeDBProxiesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBProxies" : @"DBProxies",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)DBProxiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBProxy class]];
}

@end

@implementation AWSRdsDescribeDBProxyTargetGroupsRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeDBProxyTargetGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"targetGroups" : @"TargetGroups",
             };
}

+ (NSValueTransformer *)targetGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBProxyTargetGroup class]];
}

@end

@implementation AWSRdsDescribeDBProxyTargetsRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeDBProxyTargetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBProxyTarget class]];
}

@end

@implementation AWSRdsDescribeDBSecurityGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSecurityGroupName" : @"DBSecurityGroupName",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeDBSnapshotAttributesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshotIdentifier" : @"DBSnapshotIdentifier",
             };
}

@end

@implementation AWSRdsDescribeDBSnapshotAttributesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshotAttributesResult" : @"DBSnapshotAttributesResult",
             };
}

+ (NSValueTransformer *)DBSnapshotAttributesResultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBSnapshotAttributesResult class]];
}

@end

@implementation AWSRdsDescribeDBSnapshotsMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeDBSubnetGroupsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSubnetGroupName" : @"DBSubnetGroupName",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeEngineDefaultClusterParametersMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupFamily" : @"DBParameterGroupFamily",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeEngineDefaultClusterParametersResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"engineDefaults" : @"EngineDefaults",
             };
}

+ (NSValueTransformer *)engineDefaultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsEngineDefaults class]];
}

@end

@implementation AWSRdsDescribeEngineDefaultParametersMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupFamily" : @"DBParameterGroupFamily",
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeEngineDefaultParametersResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"engineDefaults" : @"EngineDefaults",
             };
}

+ (NSValueTransformer *)engineDefaultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsEngineDefaults class]];
}

@end

@implementation AWSRdsDescribeEventCategoriesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"sourceType" : @"SourceType",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeEventSubscriptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"subscriptionName" : @"SubscriptionName",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeEventsMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

+ (NSValueTransformer *)sourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"db-instance"] == NSOrderedSame) {
            return @(AWSRdsSourceTypeDbInstance);
        }
        if ([value caseInsensitiveCompare:@"db-parameter-group"] == NSOrderedSame) {
            return @(AWSRdsSourceTypeDbParameterGroup);
        }
        if ([value caseInsensitiveCompare:@"db-security-group"] == NSOrderedSame) {
            return @(AWSRdsSourceTypeDbSecurityGroup);
        }
        if ([value caseInsensitiveCompare:@"db-snapshot"] == NSOrderedSame) {
            return @(AWSRdsSourceTypeDbSnapshot);
        }
        if ([value caseInsensitiveCompare:@"db-cluster"] == NSOrderedSame) {
            return @(AWSRdsSourceTypeDbCluster);
        }
        if ([value caseInsensitiveCompare:@"db-cluster-snapshot"] == NSOrderedSame) {
            return @(AWSRdsSourceTypeDbClusterSnapshot);
        }
        return @(AWSRdsSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRdsSourceTypeDbInstance:
                return @"db-instance";
            case AWSRdsSourceTypeDbParameterGroup:
                return @"db-parameter-group";
            case AWSRdsSourceTypeDbSecurityGroup:
                return @"db-security-group";
            case AWSRdsSourceTypeDbSnapshot:
                return @"db-snapshot";
            case AWSRdsSourceTypeDbCluster:
                return @"db-cluster";
            case AWSRdsSourceTypeDbClusterSnapshot:
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

@implementation AWSRdsDescribeExportTasksMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeGlobalClustersMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"globalClusterIdentifier" : @"GlobalClusterIdentifier",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeInstallationMediaMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"installationMediaId" : @"InstallationMediaId",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeOptionGroupOptionsMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeOptionGroupsMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeOrderableDBInstanceOptionsMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribePendingMaintenanceActionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"resourceIdentifier" : @"ResourceIdentifier",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeReservedDBInstancesMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeReservedDBInstancesOfferingsMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeSourceRegionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"marker" : @"Marker",
             @"maxRecords" : @"MaxRecords",
             @"regionName" : @"RegionName",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsDescribeValidDBInstanceModificationsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             };
}

@end

@implementation AWSRdsDescribeValidDBInstanceModificationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"validDBInstanceModificationsMessage" : @"ValidDBInstanceModificationsMessage",
             };
}

+ (NSValueTransformer *)validDBInstanceModificationsMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsValidDBInstanceModificationsMessage class]];
}

@end

@implementation AWSRdsDomainMembership

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domain" : @"Domain",
             @"FQDN" : @"FQDN",
             @"IAMRoleName" : @"IAMRoleName",
             @"status" : @"Status",
             };
}

@end

@implementation AWSRdsDoubleRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"from" : @"From",
             @"to" : @"To",
             };
}

@end

@implementation AWSRdsDownloadDBLogFilePortionDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalDataPending" : @"AdditionalDataPending",
             @"logFileData" : @"LogFileData",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSRdsDownloadDBLogFilePortionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"logFileName" : @"LogFileName",
             @"marker" : @"Marker",
             @"numberOfLines" : @"NumberOfLines",
             };
}

@end

@implementation AWSRdsEC2SecurityGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"EC2SecurityGroupId" : @"EC2SecurityGroupId",
             @"EC2SecurityGroupName" : @"EC2SecurityGroupName",
             @"EC2SecurityGroupOwnerId" : @"EC2SecurityGroupOwnerId",
             @"status" : @"Status",
             };
}

@end

@implementation AWSRdsEndpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"hostedZoneId" : @"HostedZoneId",
             @"port" : @"Port",
             };
}

@end

@implementation AWSRdsEngineDefaults

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupFamily" : @"DBParameterGroupFamily",
             @"marker" : @"Marker",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsParameter class]];
}

@end

@implementation AWSRdsEvent

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
            return @(AWSRdsSourceTypeDbInstance);
        }
        if ([value caseInsensitiveCompare:@"db-parameter-group"] == NSOrderedSame) {
            return @(AWSRdsSourceTypeDbParameterGroup);
        }
        if ([value caseInsensitiveCompare:@"db-security-group"] == NSOrderedSame) {
            return @(AWSRdsSourceTypeDbSecurityGroup);
        }
        if ([value caseInsensitiveCompare:@"db-snapshot"] == NSOrderedSame) {
            return @(AWSRdsSourceTypeDbSnapshot);
        }
        if ([value caseInsensitiveCompare:@"db-cluster"] == NSOrderedSame) {
            return @(AWSRdsSourceTypeDbCluster);
        }
        if ([value caseInsensitiveCompare:@"db-cluster-snapshot"] == NSOrderedSame) {
            return @(AWSRdsSourceTypeDbClusterSnapshot);
        }
        return @(AWSRdsSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRdsSourceTypeDbInstance:
                return @"db-instance";
            case AWSRdsSourceTypeDbParameterGroup:
                return @"db-parameter-group";
            case AWSRdsSourceTypeDbSecurityGroup:
                return @"db-security-group";
            case AWSRdsSourceTypeDbSnapshot:
                return @"db-snapshot";
            case AWSRdsSourceTypeDbCluster:
                return @"db-cluster";
            case AWSRdsSourceTypeDbClusterSnapshot:
                return @"db-cluster-snapshot";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRdsEventCategoriesMap

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventCategories" : @"EventCategories",
             @"sourceType" : @"SourceType",
             };
}

@end

@implementation AWSRdsEventCategoriesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventCategoriesMapList" : @"EventCategoriesMapList",
             };
}

+ (NSValueTransformer *)eventCategoriesMapListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsEventCategoriesMap class]];
}

@end

@implementation AWSRdsEventSubscription

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

@implementation AWSRdsEventSubscriptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscriptionsList" : @"EventSubscriptionsList",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)eventSubscriptionsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsEventSubscription class]];
}

@end

@implementation AWSRdsEventsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"Events",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)eventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsEvent class]];
}

@end

@implementation AWSRdsExportTask

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

@implementation AWSRdsExportTasksMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportTasks" : @"ExportTasks",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)exportTasksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsExportTask class]];
}

@end

@implementation AWSRdsFailoverDBClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"targetDBInstanceIdentifier" : @"TargetDBInstanceIdentifier",
             };
}

@end

@implementation AWSRdsFailoverDBClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBCluster" : @"DBCluster",
             };
}

+ (NSValueTransformer *)DBClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBCluster class]];
}

@end

@implementation AWSRdsFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

@end

@implementation AWSRdsGlobalCluster

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsGlobalClusterMember class]];
}

@end

@implementation AWSRdsGlobalClusterMember

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterArn" : @"DBClusterArn",
             @"globalWriteForwardingStatus" : @"GlobalWriteForwardingStatus",
             @"isWriter" : @"IsWriter",
             @"readers" : @"Readers",
             };
}

+ (NSValueTransformer *)globalWriteForwardingStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"enabled"] == NSOrderedSame) {
            return @(AWSRdsWriteForwardingStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"disabled"] == NSOrderedSame) {
            return @(AWSRdsWriteForwardingStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"enabling"] == NSOrderedSame) {
            return @(AWSRdsWriteForwardingStatusEnabling);
        }
        if ([value caseInsensitiveCompare:@"disabling"] == NSOrderedSame) {
            return @(AWSRdsWriteForwardingStatusDisabling);
        }
        if ([value caseInsensitiveCompare:@"unknown"] == NSOrderedSame) {
            return @(AWSRdsWriteForwardingStatusUnknown);
        }
        return @(AWSRdsWriteForwardingStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRdsWriteForwardingStatusEnabled:
                return @"enabled";
            case AWSRdsWriteForwardingStatusDisabled:
                return @"disabled";
            case AWSRdsWriteForwardingStatusEnabling:
                return @"enabling";
            case AWSRdsWriteForwardingStatusDisabling:
                return @"disabling";
            case AWSRdsWriteForwardingStatusUnknown:
                return @"unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRdsGlobalClustersMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalClusters" : @"GlobalClusters",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)globalClustersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsGlobalCluster class]];
}

@end

@implementation AWSRdsIPRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"CIDRIP" : @"CIDRIP",
             @"status" : @"Status",
             };
}

@end

@implementation AWSRdsImportInstallationMediaMessage

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

@implementation AWSRdsInstallationMedia

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsInstallationMediaFailureCause class]];
}

@end

@implementation AWSRdsInstallationMediaFailureCause

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSRdsInstallationMediaMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"installationMedia" : @"InstallationMedia",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)installationMediaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsInstallationMedia class]];
}

@end

@implementation AWSRdsListTagsForResourceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"resourceName" : @"ResourceName",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsFilter class]];
}

@end

@implementation AWSRdsMinimumEngineVersionPerAllowedValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedValue" : @"AllowedValue",
             @"minimumEngineVersion" : @"MinimumEngineVersion",
             };
}

@end

@implementation AWSRdsModifyCertificatesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateIdentifier" : @"CertificateIdentifier",
             @"removeCustomerOverride" : @"RemoveCustomerOverride",
             };
}

@end

@implementation AWSRdsModifyCertificatesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificate" : @"Certificate",
             };
}

+ (NSValueTransformer *)certificateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsCertificate class]];
}

@end

@implementation AWSRdsModifyCurrentDBClusterCapacityMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capacity" : @"Capacity",
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"secondsBeforeTimeout" : @"SecondsBeforeTimeout",
             @"timeoutAction" : @"TimeoutAction",
             };
}

@end

@implementation AWSRdsModifyDBClusterEndpointMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterEndpointIdentifier" : @"DBClusterEndpointIdentifier",
             @"endpointType" : @"EndpointType",
             @"excludedMembers" : @"ExcludedMembers",
             @"staticMembers" : @"StaticMembers",
             };
}

@end

@implementation AWSRdsModifyDBClusterMessage

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
             @"enableGlobalWriteForwarding" : @"EnableGlobalWriteForwarding",
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsCloudwatchLogsExportConfiguration class]];
}

+ (NSValueTransformer *)scalingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsScalingConfiguration class]];
}

@end

@implementation AWSRdsModifyDBClusterParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroupName" : @"DBClusterParameterGroupName",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsParameter class]];
}

@end

@implementation AWSRdsModifyDBClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBCluster" : @"DBCluster",
             };
}

+ (NSValueTransformer *)DBClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBCluster class]];
}

@end

@implementation AWSRdsModifyDBClusterSnapshotAttributeMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"DBClusterSnapshotIdentifier" : @"DBClusterSnapshotIdentifier",
             @"valuesToAdd" : @"ValuesToAdd",
             @"valuesToRemove" : @"ValuesToRemove",
             };
}

@end

@implementation AWSRdsModifyDBClusterSnapshotAttributeResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterSnapshotAttributesResult" : @"DBClusterSnapshotAttributesResult",
             };
}

+ (NSValueTransformer *)DBClusterSnapshotAttributesResultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBClusterSnapshotAttributesResult class]];
}

@end

@implementation AWSRdsModifyDBInstanceMessage

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsCloudwatchLogsExportConfiguration class]];
}

+ (NSValueTransformer *)processorFeaturesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsProcessorFeature class]];
}

@end

@implementation AWSRdsModifyDBInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBInstance class]];
}

@end

@implementation AWSRdsModifyDBParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupName" : @"DBParameterGroupName",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsParameter class]];
}

@end

@implementation AWSRdsModifyDBProxyRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsUserAuthConfig class]];
}

@end

@implementation AWSRdsModifyDBProxyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBProxy" : @"DBProxy",
             };
}

+ (NSValueTransformer *)DBProxyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBProxy class]];
}

@end

@implementation AWSRdsModifyDBProxyTargetGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionPoolConfig" : @"ConnectionPoolConfig",
             @"DBProxyName" : @"DBProxyName",
             @"latestName" : @"NewName",
             @"targetGroupName" : @"TargetGroupName",
             };
}

+ (NSValueTransformer *)connectionPoolConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsConnectionPoolConfiguration class]];
}

@end

@implementation AWSRdsModifyDBProxyTargetGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBProxyTargetGroup" : @"DBProxyTargetGroup",
             };
}

+ (NSValueTransformer *)DBProxyTargetGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBProxyTargetGroup class]];
}

@end

@implementation AWSRdsModifyDBSnapshotAttributeMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"DBSnapshotIdentifier" : @"DBSnapshotIdentifier",
             @"valuesToAdd" : @"ValuesToAdd",
             @"valuesToRemove" : @"ValuesToRemove",
             };
}

@end

@implementation AWSRdsModifyDBSnapshotAttributeResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshotAttributesResult" : @"DBSnapshotAttributesResult",
             };
}

+ (NSValueTransformer *)DBSnapshotAttributesResultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBSnapshotAttributesResult class]];
}

@end

@implementation AWSRdsModifyDBSnapshotMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshotIdentifier" : @"DBSnapshotIdentifier",
             @"engineVersion" : @"EngineVersion",
             @"optionGroupName" : @"OptionGroupName",
             };
}

@end

@implementation AWSRdsModifyDBSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSnapshot" : @"DBSnapshot",
             };
}

+ (NSValueTransformer *)DBSnapshotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBSnapshot class]];
}

@end

@implementation AWSRdsModifyDBSubnetGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSubnetGroupDescription" : @"DBSubnetGroupDescription",
             @"DBSubnetGroupName" : @"DBSubnetGroupName",
             @"subnetIds" : @"SubnetIds",
             };
}

@end

@implementation AWSRdsModifyDBSubnetGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSubnetGroup" : @"DBSubnetGroup",
             };
}

+ (NSValueTransformer *)DBSubnetGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBSubnetGroup class]];
}

@end

@implementation AWSRdsModifyEventSubscriptionMessage

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

@implementation AWSRdsModifyEventSubscriptionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscription" : @"EventSubscription",
             };
}

+ (NSValueTransformer *)eventSubscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsEventSubscription class]];
}

@end

@implementation AWSRdsModifyGlobalClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletionProtection" : @"DeletionProtection",
             @"globalClusterIdentifier" : @"GlobalClusterIdentifier",
             @"latestGlobalClusterIdentifier" : @"NewGlobalClusterIdentifier",
             };
}

@end

@implementation AWSRdsModifyGlobalClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalCluster" : @"GlobalCluster",
             };
}

+ (NSValueTransformer *)globalClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsGlobalCluster class]];
}

@end

@implementation AWSRdsModifyOptionGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyImmediately" : @"ApplyImmediately",
             @"optionGroupName" : @"OptionGroupName",
             @"optionsToInclude" : @"OptionsToInclude",
             @"optionsToRemove" : @"OptionsToRemove",
             };
}

+ (NSValueTransformer *)optionsToIncludeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsOptionConfiguration class]];
}

@end

@implementation AWSRdsModifyOptionGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"optionGroup" : @"OptionGroup",
             };
}

+ (NSValueTransformer *)optionGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsOptionGroup class]];
}

@end

@implementation AWSRdsOption

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBSecurityGroupMembership class]];
}

+ (NSValueTransformer *)optionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsOptionSetting class]];
}

+ (NSValueTransformer *)vpcSecurityGroupMembershipsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsVpcSecurityGroupMembership class]];
}

@end

@implementation AWSRdsOptionConfiguration

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsOptionSetting class]];
}

@end

@implementation AWSRdsOptionGroup

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsOption class]];
}

@end

@implementation AWSRdsOptionGroupMembership

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"optionGroupName" : @"OptionGroupName",
             @"status" : @"Status",
             };
}

@end

@implementation AWSRdsOptionGroupOption

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsOptionGroupOptionSetting class]];
}

+ (NSValueTransformer *)optionGroupOptionVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsOptionVersion class]];
}

@end

@implementation AWSRdsOptionGroupOptionSetting

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsMinimumEngineVersionPerAllowedValue class]];
}

@end

@implementation AWSRdsOptionGroupOptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"optionGroupOptions" : @"OptionGroupOptions",
             };
}

+ (NSValueTransformer *)optionGroupOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsOptionGroupOption class]];
}

@end

@implementation AWSRdsOptionGroups

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"optionGroupsList" : @"OptionGroupsList",
             };
}

+ (NSValueTransformer *)optionGroupsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsOptionGroup class]];
}

@end

@implementation AWSRdsOptionSetting

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

@implementation AWSRdsOptionVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isDefault" : @"IsDefault",
             @"version" : @"Version",
             };
}

@end

@implementation AWSRdsOrderableDBInstanceOption

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsAvailabilityZone class]];
}

+ (NSValueTransformer *)availableProcessorFeaturesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsAvailableProcessorFeature class]];
}

@end

@implementation AWSRdsOrderableDBInstanceOptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"orderableDBInstanceOptions" : @"OrderableDBInstanceOptions",
             };
}

+ (NSValueTransformer *)orderableDBInstanceOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsOrderableDBInstanceOption class]];
}

@end

@implementation AWSRdsParameter

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
            return @(AWSRdsApplyMethodImmediate);
        }
        if ([value caseInsensitiveCompare:@"pending-reboot"] == NSOrderedSame) {
            return @(AWSRdsApplyMethodPendingReboot);
        }
        return @(AWSRdsApplyMethodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRdsApplyMethodImmediate:
                return @"immediate";
            case AWSRdsApplyMethodPendingReboot:
                return @"pending-reboot";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRdsPendingCloudwatchLogsExports

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logTypesToDisable" : @"LogTypesToDisable",
             @"logTypesToEnable" : @"LogTypesToEnable",
             };
}

@end

@implementation AWSRdsPendingMaintenanceAction

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

@implementation AWSRdsPendingMaintenanceActionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"pendingMaintenanceActions" : @"PendingMaintenanceActions",
             };
}

+ (NSValueTransformer *)pendingMaintenanceActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsResourcePendingMaintenanceActions class]];
}

@end

@implementation AWSRdsPendingModifiedValues

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsPendingCloudwatchLogsExports class]];
}

+ (NSValueTransformer *)processorFeaturesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsProcessorFeature class]];
}

@end

@implementation AWSRdsProcessorFeature

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSRdsPromoteReadReplicaDBClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             };
}

@end

@implementation AWSRdsPromoteReadReplicaDBClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBCluster" : @"DBCluster",
             };
}

+ (NSValueTransformer *)DBClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBCluster class]];
}

@end

@implementation AWSRdsPromoteReadReplicaMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupRetentionPeriod" : @"BackupRetentionPeriod",
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"preferredBackupWindow" : @"PreferredBackupWindow",
             };
}

@end

@implementation AWSRdsPromoteReadReplicaResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBInstance class]];
}

@end

@implementation AWSRdsPurchaseReservedDBInstancesOfferingMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceCount" : @"DBInstanceCount",
             @"reservedDBInstanceId" : @"ReservedDBInstanceId",
             @"reservedDBInstancesOfferingId" : @"ReservedDBInstancesOfferingId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsPurchaseReservedDBInstancesOfferingResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedDBInstance" : @"ReservedDBInstance",
             };
}

+ (NSValueTransformer *)reservedDBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsReservedDBInstance class]];
}

@end

@implementation AWSRdsRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"from" : @"From",
             @"step" : @"Step",
             @"to" : @"To",
             };
}

@end

@implementation AWSRdsRebootDBInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"forceFailover" : @"ForceFailover",
             };
}

@end

@implementation AWSRdsRebootDBInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBInstance class]];
}

@end

@implementation AWSRdsRecurringCharge

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recurringChargeAmount" : @"RecurringChargeAmount",
             @"recurringChargeFrequency" : @"RecurringChargeFrequency",
             };
}

@end

@implementation AWSRdsRegisterDBProxyTargetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifiers" : @"DBClusterIdentifiers",
             @"DBInstanceIdentifiers" : @"DBInstanceIdentifiers",
             @"DBProxyName" : @"DBProxyName",
             @"targetGroupName" : @"TargetGroupName",
             };
}

@end

@implementation AWSRdsRegisterDBProxyTargetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBProxyTargets" : @"DBProxyTargets",
             };
}

+ (NSValueTransformer *)DBProxyTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDBProxyTarget class]];
}

@end

@implementation AWSRdsRemoveFromGlobalClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dbClusterIdentifier" : @"DbClusterIdentifier",
             @"globalClusterIdentifier" : @"GlobalClusterIdentifier",
             };
}

@end

@implementation AWSRdsRemoveFromGlobalClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalCluster" : @"GlobalCluster",
             };
}

+ (NSValueTransformer *)globalClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsGlobalCluster class]];
}

@end

@implementation AWSRdsRemoveRoleFromDBClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             @"featureName" : @"FeatureName",
             @"roleArn" : @"RoleArn",
             };
}

@end

@implementation AWSRdsRemoveRoleFromDBInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"featureName" : @"FeatureName",
             @"roleArn" : @"RoleArn",
             };
}

@end

@implementation AWSRdsRemoveSourceIdentifierFromSubscriptionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceIdentifier" : @"SourceIdentifier",
             @"subscriptionName" : @"SubscriptionName",
             };
}

@end

@implementation AWSRdsRemoveSourceIdentifierFromSubscriptionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventSubscription" : @"EventSubscription",
             };
}

+ (NSValueTransformer *)eventSubscriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsEventSubscription class]];
}

@end

@implementation AWSRdsRemoveTagsFromResourceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceName" : @"ResourceName",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSRdsReservedDBInstance

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsRecurringCharge class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSRdsReservedDBInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"reservedDBInstances" : @"ReservedDBInstances",
             };
}

+ (NSValueTransformer *)reservedDBInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsReservedDBInstance class]];
}

@end

@implementation AWSRdsReservedDBInstancesOffering

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsRecurringCharge class]];
}

@end

@implementation AWSRdsReservedDBInstancesOfferingMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"reservedDBInstancesOfferings" : @"ReservedDBInstancesOfferings",
             };
}

+ (NSValueTransformer *)reservedDBInstancesOfferingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsReservedDBInstancesOffering class]];
}

@end

@implementation AWSRdsResetDBClusterParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterParameterGroupName" : @"DBClusterParameterGroupName",
             @"parameters" : @"Parameters",
             @"resetAllParameters" : @"ResetAllParameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsParameter class]];
}

@end

@implementation AWSRdsResetDBParameterGroupMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBParameterGroupName" : @"DBParameterGroupName",
             @"parameters" : @"Parameters",
             @"resetAllParameters" : @"ResetAllParameters",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsParameter class]];
}

@end

@implementation AWSRdsResourcePendingMaintenanceActions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pendingMaintenanceActionDetails" : @"PendingMaintenanceActionDetails",
             @"resourceIdentifier" : @"ResourceIdentifier",
             };
}

+ (NSValueTransformer *)pendingMaintenanceActionDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsPendingMaintenanceAction class]];
}

@end

@implementation AWSRdsRestoreDBClusterFromS3Message

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsRestoreDBClusterFromS3Result

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBCluster" : @"DBCluster",
             };
}

+ (NSValueTransformer *)DBClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBCluster class]];
}

@end

@implementation AWSRdsRestoreDBClusterFromSnapshotMessage

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsScalingConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsRestoreDBClusterFromSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBCluster" : @"DBCluster",
             };
}

+ (NSValueTransformer *)DBClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBCluster class]];
}

@end

@implementation AWSRdsRestoreDBClusterToPointInTimeMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsRestoreDBClusterToPointInTimeResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBCluster" : @"DBCluster",
             };
}

+ (NSValueTransformer *)DBClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBCluster class]];
}

@end

@implementation AWSRdsRestoreDBInstanceFromDBSnapshotMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsProcessorFeature class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsRestoreDBInstanceFromDBSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBInstance class]];
}

@end

@implementation AWSRdsRestoreDBInstanceFromS3Message

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsProcessorFeature class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsRestoreDBInstanceFromS3Result

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBInstance class]];
}

@end

@implementation AWSRdsRestoreDBInstanceToPointInTimeMessage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsProcessorFeature class]];
}

+ (NSValueTransformer *)restoreTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsRestoreDBInstanceToPointInTimeResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBInstance class]];
}

@end

@implementation AWSRdsRestoreWindow

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

@implementation AWSRdsRevokeDBSecurityGroupIngressMessage

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

@implementation AWSRdsRevokeDBSecurityGroupIngressResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBSecurityGroup" : @"DBSecurityGroup",
             };
}

+ (NSValueTransformer *)DBSecurityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBSecurityGroup class]];
}

@end

@implementation AWSRdsScalingConfiguration

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

@implementation AWSRdsScalingConfigurationInfo

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

@implementation AWSRdsSourceRegion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoint" : @"Endpoint",
             @"regionName" : @"RegionName",
             @"status" : @"Status",
             };
}

@end

@implementation AWSRdsSourceRegionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"sourceRegions" : @"SourceRegions",
             };
}

+ (NSValueTransformer *)sourceRegionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsSourceRegion class]];
}

@end

@implementation AWSRdsStartActivityStreamRequest

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
            return @(AWSRdsActivityStreamModeSync);
        }
        if ([value caseInsensitiveCompare:@"async"] == NSOrderedSame) {
            return @(AWSRdsActivityStreamModeAsync);
        }
        return @(AWSRdsActivityStreamModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRdsActivityStreamModeSync:
                return @"sync";
            case AWSRdsActivityStreamModeAsync:
                return @"async";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRdsStartActivityStreamResponse

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
            return @(AWSRdsActivityStreamModeSync);
        }
        if ([value caseInsensitiveCompare:@"async"] == NSOrderedSame) {
            return @(AWSRdsActivityStreamModeAsync);
        }
        return @(AWSRdsActivityStreamModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRdsActivityStreamModeSync:
                return @"sync";
            case AWSRdsActivityStreamModeAsync:
                return @"async";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"stopped"] == NSOrderedSame) {
            return @(AWSRdsActivityStreamStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"starting"] == NSOrderedSame) {
            return @(AWSRdsActivityStreamStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"started"] == NSOrderedSame) {
            return @(AWSRdsActivityStreamStatusStarted);
        }
        if ([value caseInsensitiveCompare:@"stopping"] == NSOrderedSame) {
            return @(AWSRdsActivityStreamStatusStopping);
        }
        return @(AWSRdsActivityStreamStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRdsActivityStreamStatusStopped:
                return @"stopped";
            case AWSRdsActivityStreamStatusStarting:
                return @"starting";
            case AWSRdsActivityStreamStatusStarted:
                return @"started";
            case AWSRdsActivityStreamStatusStopping:
                return @"stopping";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRdsStartDBClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             };
}

@end

@implementation AWSRdsStartDBClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBCluster" : @"DBCluster",
             };
}

+ (NSValueTransformer *)DBClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBCluster class]];
}

@end

@implementation AWSRdsStartDBInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             };
}

@end

@implementation AWSRdsStartDBInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBInstance class]];
}

@end

@implementation AWSRdsStartExportTaskMessage

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

@implementation AWSRdsStopActivityStreamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applyImmediately" : @"ApplyImmediately",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSRdsStopActivityStreamResponse

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
            return @(AWSRdsActivityStreamStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"starting"] == NSOrderedSame) {
            return @(AWSRdsActivityStreamStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"started"] == NSOrderedSame) {
            return @(AWSRdsActivityStreamStatusStarted);
        }
        if ([value caseInsensitiveCompare:@"stopping"] == NSOrderedSame) {
            return @(AWSRdsActivityStreamStatusStopping);
        }
        return @(AWSRdsActivityStreamStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRdsActivityStreamStatusStopped:
                return @"stopped";
            case AWSRdsActivityStreamStatusStarting:
                return @"starting";
            case AWSRdsActivityStreamStatusStarted:
                return @"started";
            case AWSRdsActivityStreamStatusStopping:
                return @"stopping";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRdsStopDBClusterMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBClusterIdentifier" : @"DBClusterIdentifier",
             };
}

@end

@implementation AWSRdsStopDBClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBCluster" : @"DBCluster",
             };
}

+ (NSValueTransformer *)DBClusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBCluster class]];
}

@end

@implementation AWSRdsStopDBInstanceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstanceIdentifier" : @"DBInstanceIdentifier",
             @"DBSnapshotIdentifier" : @"DBSnapshotIdentifier",
             };
}

@end

@implementation AWSRdsStopDBInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DBInstance" : @"DBInstance",
             };
}

+ (NSValueTransformer *)DBInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsDBInstance class]];
}

@end

@implementation AWSRdsSubnet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subnetAvailabilityZone" : @"SubnetAvailabilityZone",
             @"subnetIdentifier" : @"SubnetIdentifier",
             @"subnetStatus" : @"SubnetStatus",
             };
}

+ (NSValueTransformer *)subnetAvailabilityZoneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRdsAvailabilityZone class]];
}

@end

@implementation AWSRdsTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSRdsTagListMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagList" : @"TagList",
             };
}

+ (NSValueTransformer *)tagListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsTag class]];
}

@end

@implementation AWSRdsTargetHealth

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
            return @(AWSRdsTargetHealthReasonUnreachable);
        }
        if ([value caseInsensitiveCompare:@"CONNECTION_FAILED"] == NSOrderedSame) {
            return @(AWSRdsTargetHealthReasonConnectionFailed);
        }
        if ([value caseInsensitiveCompare:@"AUTH_FAILURE"] == NSOrderedSame) {
            return @(AWSRdsTargetHealthReasonAuthFailure);
        }
        if ([value caseInsensitiveCompare:@"PENDING_PROXY_CAPACITY"] == NSOrderedSame) {
            return @(AWSRdsTargetHealthReasonPendingProxyCapacity);
        }
        return @(AWSRdsTargetHealthReasonUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRdsTargetHealthReasonUnreachable:
                return @"UNREACHABLE";
            case AWSRdsTargetHealthReasonConnectionFailed:
                return @"CONNECTION_FAILED";
            case AWSRdsTargetHealthReasonAuthFailure:
                return @"AUTH_FAILURE";
            case AWSRdsTargetHealthReasonPendingProxyCapacity:
                return @"PENDING_PROXY_CAPACITY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REGISTERING"] == NSOrderedSame) {
            return @(AWSRdsTargetStateRegistering);
        }
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSRdsTargetStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"UNAVAILABLE"] == NSOrderedSame) {
            return @(AWSRdsTargetStateUnavailable);
        }
        return @(AWSRdsTargetStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRdsTargetStateRegistering:
                return @"REGISTERING";
            case AWSRdsTargetStateAvailable:
                return @"AVAILABLE";
            case AWSRdsTargetStateUnavailable:
                return @"UNAVAILABLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRdsTimezone

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"timezoneName" : @"TimezoneName",
             };
}

@end

@implementation AWSRdsUpgradeTarget

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

@implementation AWSRdsUserAuthConfig

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
            return @(AWSRdsAuthSchemeSecrets);
        }
        return @(AWSRdsAuthSchemeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRdsAuthSchemeSecrets:
                return @"SECRETS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)IAMAuthJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSRdsIAMAuthModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"REQUIRED"] == NSOrderedSame) {
            return @(AWSRdsIAMAuthModeRequired);
        }
        return @(AWSRdsIAMAuthModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRdsIAMAuthModeDisabled:
                return @"DISABLED";
            case AWSRdsIAMAuthModeRequired:
                return @"REQUIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRdsUserAuthConfigInfo

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
            return @(AWSRdsAuthSchemeSecrets);
        }
        return @(AWSRdsAuthSchemeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRdsAuthSchemeSecrets:
                return @"SECRETS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)IAMAuthJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSRdsIAMAuthModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"REQUIRED"] == NSOrderedSame) {
            return @(AWSRdsIAMAuthModeRequired);
        }
        return @(AWSRdsIAMAuthModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRdsIAMAuthModeDisabled:
                return @"DISABLED";
            case AWSRdsIAMAuthModeRequired:
                return @"REQUIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRdsValidDBInstanceModificationsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"storage" : @"Storage",
             @"validProcessorFeatures" : @"ValidProcessorFeatures",
             };
}

+ (NSValueTransformer *)storageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsValidStorageOptions class]];
}

+ (NSValueTransformer *)validProcessorFeaturesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsAvailableProcessorFeature class]];
}

@end

@implementation AWSRdsValidStorageOptions

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsDoubleRange class]];
}

+ (NSValueTransformer *)provisionedIopsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsRange class]];
}

+ (NSValueTransformer *)storageSizeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRdsRange class]];
}

@end

@implementation AWSRdsVpcSecurityGroupMembership

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             @"vpcSecurityGroupId" : @"VpcSecurityGroupId",
             };
}

@end

@implementation AWSRdsVpnDetails

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
