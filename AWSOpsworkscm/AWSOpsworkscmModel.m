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

#import "AWSOpsworkscmModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSOpsworkscmErrorDomain = @"com.amazonaws.AWSOpsworkscmErrorDomain";

@implementation AWSOpsworkscmAccountAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maximum" : @"Maximum",
             @"name" : @"Name",
             @"used" : @"Used",
             };
}

@end

@implementation AWSOpsworkscmAssociateNodeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"engineAttributes" : @"EngineAttributes",
             @"nodeName" : @"NodeName",
             @"serverName" : @"ServerName",
             };
}

+ (NSValueTransformer *)engineAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOpsworkscmEngineAttribute class]];
}

@end

@implementation AWSOpsworkscmAssociateNodeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nodeAssociationStatusToken" : @"NodeAssociationStatusToken",
             };
}

@end

@implementation AWSOpsworkscmBackup

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
            return @(AWSOpsworkscmBackupTypeAutomated);
        }
        if ([value caseInsensitiveCompare:@"MANUAL"] == NSOrderedSame) {
            return @(AWSOpsworkscmBackupTypeManual);
        }
        return @(AWSOpsworkscmBackupTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOpsworkscmBackupTypeAutomated:
                return @"AUTOMATED";
            case AWSOpsworkscmBackupTypeManual:
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
            return @(AWSOpsworkscmBackupStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"OK"] == NSOrderedSame) {
            return @(AWSOpsworkscmBackupStatusOK);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSOpsworkscmBackupStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSOpsworkscmBackupStatusDeleting);
        }
        return @(AWSOpsworkscmBackupStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOpsworkscmBackupStatusInProgress:
                return @"IN_PROGRESS";
            case AWSOpsworkscmBackupStatusOK:
                return @"OK";
            case AWSOpsworkscmBackupStatusFailed:
                return @"FAILED";
            case AWSOpsworkscmBackupStatusDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOpsworkscmCreateBackupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"serverName" : @"ServerName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOpsworkscmTag class]];
}

@end

@implementation AWSOpsworkscmCreateBackupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backup" : @"Backup",
             };
}

+ (NSValueTransformer *)backupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOpsworkscmBackup class]];
}

@end

@implementation AWSOpsworkscmCreateServerRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOpsworkscmEngineAttribute class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOpsworkscmTag class]];
}

@end

@implementation AWSOpsworkscmCreateServerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"server" : @"Server",
             };
}

+ (NSValueTransformer *)serverJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOpsworkscmServer class]];
}

@end

@implementation AWSOpsworkscmDeleteBackupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupId" : @"BackupId",
             };
}

@end

@implementation AWSOpsworkscmDeleteBackupResponse

@end

@implementation AWSOpsworkscmDeleteServerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serverName" : @"ServerName",
             };
}

@end

@implementation AWSOpsworkscmDeleteServerResponse

@end

@implementation AWSOpsworkscmDescribeAccountAttributesRequest

@end

@implementation AWSOpsworkscmDescribeAccountAttributesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOpsworkscmAccountAttribute class]];
}

@end

@implementation AWSOpsworkscmDescribeBackupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupId" : @"BackupId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"serverName" : @"ServerName",
             };
}

@end

@implementation AWSOpsworkscmDescribeBackupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backups" : @"Backups",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)backupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOpsworkscmBackup class]];
}

@end

@implementation AWSOpsworkscmDescribeEventsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"serverName" : @"ServerName",
             };
}

@end

@implementation AWSOpsworkscmDescribeEventsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"serverEvents" : @"ServerEvents",
             };
}

+ (NSValueTransformer *)serverEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOpsworkscmServerEvent class]];
}

@end

@implementation AWSOpsworkscmDescribeNodeAssociationStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nodeAssociationStatusToken" : @"NodeAssociationStatusToken",
             @"serverName" : @"ServerName",
             };
}

@end

@implementation AWSOpsworkscmDescribeNodeAssociationStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"engineAttributes" : @"EngineAttributes",
             @"nodeAssociationStatus" : @"NodeAssociationStatus",
             };
}

+ (NSValueTransformer *)engineAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOpsworkscmEngineAttribute class]];
}

+ (NSValueTransformer *)nodeAssociationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSOpsworkscmNodeAssociationStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSOpsworkscmNodeAssociationStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSOpsworkscmNodeAssociationStatusInProgress);
        }
        return @(AWSOpsworkscmNodeAssociationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOpsworkscmNodeAssociationStatusSuccess:
                return @"SUCCESS";
            case AWSOpsworkscmNodeAssociationStatusFailed:
                return @"FAILED";
            case AWSOpsworkscmNodeAssociationStatusInProgress:
                return @"IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOpsworkscmDescribeServersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"serverName" : @"ServerName",
             };
}

@end

@implementation AWSOpsworkscmDescribeServersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"servers" : @"Servers",
             };
}

+ (NSValueTransformer *)serversJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOpsworkscmServer class]];
}

@end

@implementation AWSOpsworkscmDisassociateNodeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"engineAttributes" : @"EngineAttributes",
             @"nodeName" : @"NodeName",
             @"serverName" : @"ServerName",
             };
}

+ (NSValueTransformer *)engineAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOpsworkscmEngineAttribute class]];
}

@end

@implementation AWSOpsworkscmDisassociateNodeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nodeAssociationStatusToken" : @"NodeAssociationStatusToken",
             };
}

@end

@implementation AWSOpsworkscmEngineAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSOpsworkscmExportServerEngineAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportAttributeName" : @"ExportAttributeName",
             @"inputAttributes" : @"InputAttributes",
             @"serverName" : @"ServerName",
             };
}

+ (NSValueTransformer *)inputAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOpsworkscmEngineAttribute class]];
}

@end

@implementation AWSOpsworkscmExportServerEngineAttributeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"engineAttribute" : @"EngineAttribute",
             @"serverName" : @"ServerName",
             };
}

+ (NSValueTransformer *)engineAttributeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOpsworkscmEngineAttribute class]];
}

@end

@implementation AWSOpsworkscmListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSOpsworkscmListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOpsworkscmTag class]];
}

@end

@implementation AWSOpsworkscmRestoreServerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupId" : @"BackupId",
             @"instanceType" : @"InstanceType",
             @"keyPair" : @"KeyPair",
             @"serverName" : @"ServerName",
             };
}

@end

@implementation AWSOpsworkscmRestoreServerResponse

@end

@implementation AWSOpsworkscmServer

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOpsworkscmEngineAttribute class]];
}

+ (NSValueTransformer *)maintenanceStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSOpsworkscmMaintenanceStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSOpsworkscmMaintenanceStatusFailed);
        }
        return @(AWSOpsworkscmMaintenanceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOpsworkscmMaintenanceStatusSuccess:
                return @"SUCCESS";
            case AWSOpsworkscmMaintenanceStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BACKING_UP"] == NSOrderedSame) {
            return @(AWSOpsworkscmServerStatusBackingUp);
        }
        if ([value caseInsensitiveCompare:@"CONNECTION_LOST"] == NSOrderedSame) {
            return @(AWSOpsworkscmServerStatusConnectionLost);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSOpsworkscmServerStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSOpsworkscmServerStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"MODIFYING"] == NSOrderedSame) {
            return @(AWSOpsworkscmServerStatusModifying);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSOpsworkscmServerStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"HEALTHY"] == NSOrderedSame) {
            return @(AWSOpsworkscmServerStatusHealthy);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSOpsworkscmServerStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"RESTORING"] == NSOrderedSame) {
            return @(AWSOpsworkscmServerStatusRestoring);
        }
        if ([value caseInsensitiveCompare:@"SETUP"] == NSOrderedSame) {
            return @(AWSOpsworkscmServerStatusSetup);
        }
        if ([value caseInsensitiveCompare:@"UNDER_MAINTENANCE"] == NSOrderedSame) {
            return @(AWSOpsworkscmServerStatusUnderMaintenance);
        }
        if ([value caseInsensitiveCompare:@"UNHEALTHY"] == NSOrderedSame) {
            return @(AWSOpsworkscmServerStatusUnhealthy);
        }
        if ([value caseInsensitiveCompare:@"TERMINATED"] == NSOrderedSame) {
            return @(AWSOpsworkscmServerStatusTerminated);
        }
        return @(AWSOpsworkscmServerStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOpsworkscmServerStatusBackingUp:
                return @"BACKING_UP";
            case AWSOpsworkscmServerStatusConnectionLost:
                return @"CONNECTION_LOST";
            case AWSOpsworkscmServerStatusCreating:
                return @"CREATING";
            case AWSOpsworkscmServerStatusDeleting:
                return @"DELETING";
            case AWSOpsworkscmServerStatusModifying:
                return @"MODIFYING";
            case AWSOpsworkscmServerStatusFailed:
                return @"FAILED";
            case AWSOpsworkscmServerStatusHealthy:
                return @"HEALTHY";
            case AWSOpsworkscmServerStatusRunning:
                return @"RUNNING";
            case AWSOpsworkscmServerStatusRestoring:
                return @"RESTORING";
            case AWSOpsworkscmServerStatusSetup:
                return @"SETUP";
            case AWSOpsworkscmServerStatusUnderMaintenance:
                return @"UNDER_MAINTENANCE";
            case AWSOpsworkscmServerStatusUnhealthy:
                return @"UNHEALTHY";
            case AWSOpsworkscmServerStatusTerminated:
                return @"TERMINATED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOpsworkscmServerEvent

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

@implementation AWSOpsworkscmStartMaintenanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"engineAttributes" : @"EngineAttributes",
             @"serverName" : @"ServerName",
             };
}

+ (NSValueTransformer *)engineAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOpsworkscmEngineAttribute class]];
}

@end

@implementation AWSOpsworkscmStartMaintenanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"server" : @"Server",
             };
}

+ (NSValueTransformer *)serverJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOpsworkscmServer class]];
}

@end

@implementation AWSOpsworkscmTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSOpsworkscmTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOpsworkscmTag class]];
}

@end

@implementation AWSOpsworkscmTagResourceResponse

@end

@implementation AWSOpsworkscmUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSOpsworkscmUntagResourceResponse

@end

@implementation AWSOpsworkscmUpdateServerEngineAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"attributeValue" : @"AttributeValue",
             @"serverName" : @"ServerName",
             };
}

@end

@implementation AWSOpsworkscmUpdateServerEngineAttributesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"server" : @"Server",
             };
}

+ (NSValueTransformer *)serverJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOpsworkscmServer class]];
}

@end

@implementation AWSOpsworkscmUpdateServerRequest

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

@implementation AWSOpsworkscmUpdateServerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"server" : @"Server",
             };
}

+ (NSValueTransformer *)serverJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOpsworkscmServer class]];
}

@end
