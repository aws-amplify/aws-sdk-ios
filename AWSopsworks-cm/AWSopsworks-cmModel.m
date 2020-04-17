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

#import "AWSopsworks-cmModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSopsworks-cmErrorDomain = @"com.amazonaws.AWSopsworks-cmErrorDomain";

@implementation AWSopsworks-cmAccountAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maximum" : @"Maximum",
             @"name" : @"Name",
             @"used" : @"Used",
             };
}

@end

@implementation AWSopsworks-cmAssociateNodeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"engineAttributes" : @"EngineAttributes",
             @"nodeName" : @"NodeName",
             @"serverName" : @"ServerName",
             };
}

+ (NSValueTransformer *)engineAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSopsworks-cmEngineAttribute class]];
}

@end

@implementation AWSopsworks-cmAssociateNodeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nodeAssociationStatusToken" : @"NodeAssociationStatusToken",
             };
}

@end

@implementation AWSopsworks-cmBackup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupArn" : @"BackupArn",
             @"backupId" : @"BackupId",
             @"backupType" : @"BackupType",
             @"createdAt" : @"CreatedAt",
             @"detail" : @"Description",
             @"engine" : @"Engine",
             @"engineModel" : @"EngineModel",
             @"engineVersion" : @"EngineVersion",
             @"instanceProfileArn" : @"InstanceProfileArn",
             @"instanceType" : @"InstanceType",
             @"keyPair" : @"KeyPair",
             @"preferredBackupWindow" : @"PreferredBackupWindow",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"s3DataSize" : @"S3DataSize",
             @"s3DataUrl" : @"S3DataUrl",
             @"s3LogUrl" : @"S3LogUrl",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"serverName" : @"ServerName",
             @"serviceRoleArn" : @"ServiceRoleArn",
             @"status" : @"Status",
             @"statusDescription" : @"StatusDescription",
             @"subnetIds" : @"SubnetIds",
             @"toolsVersion" : @"ToolsVersion",
             @"userArn" : @"UserArn",
             };
}

+ (NSValueTransformer *)backupTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTOMATED"] == NSOrderedSame) {
            return @(AWSopsworks-cmBackupTypeAutomated);
        }
        if ([value caseInsensitiveCompare:@"MANUAL"] == NSOrderedSame) {
            return @(AWSopsworks-cmBackupTypeManual);
        }
        return @(AWSopsworks-cmBackupTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSopsworks-cmBackupTypeAutomated:
                return @"AUTOMATED";
            case AWSopsworks-cmBackupTypeManual:
                return @"MANUAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSopsworks-cmBackupStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"OK"] == NSOrderedSame) {
            return @(AWSopsworks-cmBackupStatusOK);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSopsworks-cmBackupStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSopsworks-cmBackupStatusDeleting);
        }
        return @(AWSopsworks-cmBackupStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSopsworks-cmBackupStatusInProgress:
                return @"IN_PROGRESS";
            case AWSopsworks-cmBackupStatusOK:
                return @"OK";
            case AWSopsworks-cmBackupStatusFailed:
                return @"FAILED";
            case AWSopsworks-cmBackupStatusDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSopsworks-cmCreateBackupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"serverName" : @"ServerName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSopsworks-cmTag class]];
}

@end

@implementation AWSopsworks-cmCreateBackupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backup" : @"Backup",
             };
}

+ (NSValueTransformer *)backupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSopsworks-cmBackup class]];
}

@end

@implementation AWSopsworks-cmCreateServerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associatePublicIpAddress" : @"AssociatePublicIpAddress",
             @"backupId" : @"BackupId",
             @"backupRetentionCount" : @"BackupRetentionCount",
             @"customCertificate" : @"CustomCertificate",
             @"customDomain" : @"CustomDomain",
             @"customPrivateKey" : @"CustomPrivateKey",
             @"disableAutomatedBackup" : @"DisableAutomatedBackup",
             @"engine" : @"Engine",
             @"engineAttributes" : @"EngineAttributes",
             @"engineModel" : @"EngineModel",
             @"engineVersion" : @"EngineVersion",
             @"instanceProfileArn" : @"InstanceProfileArn",
             @"instanceType" : @"InstanceType",
             @"keyPair" : @"KeyPair",
             @"preferredBackupWindow" : @"PreferredBackupWindow",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"serverName" : @"ServerName",
             @"serviceRoleArn" : @"ServiceRoleArn",
             @"subnetIds" : @"SubnetIds",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)engineAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSopsworks-cmEngineAttribute class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSopsworks-cmTag class]];
}

@end

@implementation AWSopsworks-cmCreateServerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"server" : @"Server",
             };
}

+ (NSValueTransformer *)serverJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSopsworks-cmServer class]];
}

@end

@implementation AWSopsworks-cmDeleteBackupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupId" : @"BackupId",
             };
}

@end

@implementation AWSopsworks-cmDeleteBackupResponse

@end

@implementation AWSopsworks-cmDeleteServerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverName" : @"ServerName",
             };
}

@end

@implementation AWSopsworks-cmDeleteServerResponse

@end

@implementation AWSopsworks-cmDescribeAccountAttributesRequest

@end

@implementation AWSopsworks-cmDescribeAccountAttributesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSopsworks-cmAccountAttribute class]];
}

@end

@implementation AWSopsworks-cmDescribeBackupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupId" : @"BackupId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"serverName" : @"ServerName",
             };
}

@end

@implementation AWSopsworks-cmDescribeBackupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backups" : @"Backups",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)backupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSopsworks-cmBackup class]];
}

@end

@implementation AWSopsworks-cmDescribeEventsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"serverName" : @"ServerName",
             };
}

@end

@implementation AWSopsworks-cmDescribeEventsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"serverEvents" : @"ServerEvents",
             };
}

+ (NSValueTransformer *)serverEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSopsworks-cmServerEvent class]];
}

@end

@implementation AWSopsworks-cmDescribeNodeAssociationStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nodeAssociationStatusToken" : @"NodeAssociationStatusToken",
             @"serverName" : @"ServerName",
             };
}

@end

@implementation AWSopsworks-cmDescribeNodeAssociationStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"engineAttributes" : @"EngineAttributes",
             @"nodeAssociationStatus" : @"NodeAssociationStatus",
             };
}

+ (NSValueTransformer *)engineAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSopsworks-cmEngineAttribute class]];
}

+ (NSValueTransformer *)nodeAssociationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSopsworks-cmNodeAssociationStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSopsworks-cmNodeAssociationStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSopsworks-cmNodeAssociationStatusInProgress);
        }
        return @(AWSopsworks-cmNodeAssociationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSopsworks-cmNodeAssociationStatusSuccess:
                return @"SUCCESS";
            case AWSopsworks-cmNodeAssociationStatusFailed:
                return @"FAILED";
            case AWSopsworks-cmNodeAssociationStatusInProgress:
                return @"IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSopsworks-cmDescribeServersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"serverName" : @"ServerName",
             };
}

@end

@implementation AWSopsworks-cmDescribeServersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"servers" : @"Servers",
             };
}

+ (NSValueTransformer *)serversJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSopsworks-cmServer class]];
}

@end

@implementation AWSopsworks-cmDisassociateNodeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"engineAttributes" : @"EngineAttributes",
             @"nodeName" : @"NodeName",
             @"serverName" : @"ServerName",
             };
}

+ (NSValueTransformer *)engineAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSopsworks-cmEngineAttribute class]];
}

@end

@implementation AWSopsworks-cmDisassociateNodeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nodeAssociationStatusToken" : @"NodeAssociationStatusToken",
             };
}

@end

@implementation AWSopsworks-cmEngineAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSopsworks-cmExportServerEngineAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportAttributeName" : @"ExportAttributeName",
             @"inputAttributes" : @"InputAttributes",
             @"serverName" : @"ServerName",
             };
}

+ (NSValueTransformer *)inputAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSopsworks-cmEngineAttribute class]];
}

@end

@implementation AWSopsworks-cmExportServerEngineAttributeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"engineAttribute" : @"EngineAttribute",
             @"serverName" : @"ServerName",
             };
}

+ (NSValueTransformer *)engineAttributeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSopsworks-cmEngineAttribute class]];
}

@end

@implementation AWSopsworks-cmListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSopsworks-cmListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSopsworks-cmTag class]];
}

@end

@implementation AWSopsworks-cmRestoreServerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupId" : @"BackupId",
             @"instanceType" : @"InstanceType",
             @"keyPair" : @"KeyPair",
             @"serverName" : @"ServerName",
             };
}

@end

@implementation AWSopsworks-cmRestoreServerResponse

@end

@implementation AWSopsworks-cmServer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associatePublicIpAddress" : @"AssociatePublicIpAddress",
             @"backupRetentionCount" : @"BackupRetentionCount",
             @"cloudFormationStackArn" : @"CloudFormationStackArn",
             @"createdAt" : @"CreatedAt",
             @"customDomain" : @"CustomDomain",
             @"disableAutomatedBackup" : @"DisableAutomatedBackup",
             @"endpoint" : @"Endpoint",
             @"engine" : @"Engine",
             @"engineAttributes" : @"EngineAttributes",
             @"engineModel" : @"EngineModel",
             @"engineVersion" : @"EngineVersion",
             @"instanceProfileArn" : @"InstanceProfileArn",
             @"instanceType" : @"InstanceType",
             @"keyPair" : @"KeyPair",
             @"maintenanceStatus" : @"MaintenanceStatus",
             @"preferredBackupWindow" : @"PreferredBackupWindow",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"serverArn" : @"ServerArn",
             @"serverName" : @"ServerName",
             @"serviceRoleArn" : @"ServiceRoleArn",
             @"status" : @"Status",
             @"statusReason" : @"StatusReason",
             @"subnetIds" : @"SubnetIds",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)engineAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSopsworks-cmEngineAttribute class]];
}

+ (NSValueTransformer *)maintenanceStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSopsworks-cmMaintenanceStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSopsworks-cmMaintenanceStatusFailed);
        }
        return @(AWSopsworks-cmMaintenanceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSopsworks-cmMaintenanceStatusSuccess:
                return @"SUCCESS";
            case AWSopsworks-cmMaintenanceStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BACKING_UP"] == NSOrderedSame) {
            return @(AWSopsworks-cmServerStatusBackingUp);
        }
        if ([value caseInsensitiveCompare:@"CONNECTION_LOST"] == NSOrderedSame) {
            return @(AWSopsworks-cmServerStatusConnectionLost);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSopsworks-cmServerStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSopsworks-cmServerStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"MODIFYING"] == NSOrderedSame) {
            return @(AWSopsworks-cmServerStatusModifying);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSopsworks-cmServerStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"HEALTHY"] == NSOrderedSame) {
            return @(AWSopsworks-cmServerStatusHealthy);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSopsworks-cmServerStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"RESTORING"] == NSOrderedSame) {
            return @(AWSopsworks-cmServerStatusRestoring);
        }
        if ([value caseInsensitiveCompare:@"SETUP"] == NSOrderedSame) {
            return @(AWSopsworks-cmServerStatusSetup);
        }
        if ([value caseInsensitiveCompare:@"UNDER_MAINTENANCE"] == NSOrderedSame) {
            return @(AWSopsworks-cmServerStatusUnderMaintenance);
        }
        if ([value caseInsensitiveCompare:@"UNHEALTHY"] == NSOrderedSame) {
            return @(AWSopsworks-cmServerStatusUnhealthy);
        }
        if ([value caseInsensitiveCompare:@"TERMINATED"] == NSOrderedSame) {
            return @(AWSopsworks-cmServerStatusTerminated);
        }
        return @(AWSopsworks-cmServerStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSopsworks-cmServerStatusBackingUp:
                return @"BACKING_UP";
            case AWSopsworks-cmServerStatusConnectionLost:
                return @"CONNECTION_LOST";
            case AWSopsworks-cmServerStatusCreating:
                return @"CREATING";
            case AWSopsworks-cmServerStatusDeleting:
                return @"DELETING";
            case AWSopsworks-cmServerStatusModifying:
                return @"MODIFYING";
            case AWSopsworks-cmServerStatusFailed:
                return @"FAILED";
            case AWSopsworks-cmServerStatusHealthy:
                return @"HEALTHY";
            case AWSopsworks-cmServerStatusRunning:
                return @"RUNNING";
            case AWSopsworks-cmServerStatusRestoring:
                return @"RESTORING";
            case AWSopsworks-cmServerStatusSetup:
                return @"SETUP";
            case AWSopsworks-cmServerStatusUnderMaintenance:
                return @"UNDER_MAINTENANCE";
            case AWSopsworks-cmServerStatusUnhealthy:
                return @"UNHEALTHY";
            case AWSopsworks-cmServerStatusTerminated:
                return @"TERMINATED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSopsworks-cmServerEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"CreatedAt",
             @"logUrl" : @"LogUrl",
             @"message" : @"Message",
             @"serverName" : @"ServerName",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSopsworks-cmStartMaintenanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"engineAttributes" : @"EngineAttributes",
             @"serverName" : @"ServerName",
             };
}

+ (NSValueTransformer *)engineAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSopsworks-cmEngineAttribute class]];
}

@end

@implementation AWSopsworks-cmStartMaintenanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"server" : @"Server",
             };
}

+ (NSValueTransformer *)serverJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSopsworks-cmServer class]];
}

@end

@implementation AWSopsworks-cmTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSopsworks-cmTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSopsworks-cmTag class]];
}

@end

@implementation AWSopsworks-cmTagResourceResponse

@end

@implementation AWSopsworks-cmUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSopsworks-cmUntagResourceResponse

@end

@implementation AWSopsworks-cmUpdateServerEngineAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"attributeValue" : @"AttributeValue",
             @"serverName" : @"ServerName",
             };
}

@end

@implementation AWSopsworks-cmUpdateServerEngineAttributesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"server" : @"Server",
             };
}

+ (NSValueTransformer *)serverJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSopsworks-cmServer class]];
}

@end

@implementation AWSopsworks-cmUpdateServerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupRetentionCount" : @"BackupRetentionCount",
             @"disableAutomatedBackup" : @"DisableAutomatedBackup",
             @"preferredBackupWindow" : @"PreferredBackupWindow",
             @"preferredMaintenanceWindow" : @"PreferredMaintenanceWindow",
             @"serverName" : @"ServerName",
             };
}

@end

@implementation AWSopsworks-cmUpdateServerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"server" : @"Server",
             };
}

+ (NSValueTransformer *)serverJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSopsworks-cmServer class]];
}

@end
