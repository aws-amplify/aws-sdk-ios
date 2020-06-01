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

#import "AWSFsxModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSFsxErrorDomain = @"com.amazonaws.AWSFsxErrorDomain";

@implementation AWSFsxActiveDirectoryBackupAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeDirectoryId" : @"ActiveDirectoryId",
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSFsxAdministrativeAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"administrativeActionType" : @"AdministrativeActionType",
             @"failureDetails" : @"FailureDetails",
             @"progressPercent" : @"ProgressPercent",
             @"requestTime" : @"RequestTime",
             @"status" : @"Status",
             @"targetFileSystemValues" : @"TargetFileSystemValues",
             };
}

+ (NSValueTransformer *)administrativeActionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILE_SYSTEM_UPDATE"] == NSOrderedSame) {
            return @(AWSFsxAdministrativeActionTypeFileSystemUpdate);
        }
        if ([value caseInsensitiveCompare:@"STORAGE_OPTIMIZATION"] == NSOrderedSame) {
            return @(AWSFsxAdministrativeActionTypeStorageOptimization);
        }
        return @(AWSFsxAdministrativeActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxAdministrativeActionTypeFileSystemUpdate:
                return @"FILE_SYSTEM_UPDATE";
            case AWSFsxAdministrativeActionTypeStorageOptimization:
                return @"STORAGE_OPTIMIZATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)failureDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxAdministrativeActionFailureDetails class]];
}

+ (NSValueTransformer *)requestTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSFsxStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSFsxStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSFsxStatusPending);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSFsxStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"UPDATED_OPTIMIZING"] == NSOrderedSame) {
            return @(AWSFsxStatusUpdatedOptimizing);
        }
        return @(AWSFsxStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxStatusFailed:
                return @"FAILED";
            case AWSFsxStatusInProgress:
                return @"IN_PROGRESS";
            case AWSFsxStatusPending:
                return @"PENDING";
            case AWSFsxStatusCompleted:
                return @"COMPLETED";
            case AWSFsxStatusUpdatedOptimizing:
                return @"UPDATED_OPTIMIZING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetFileSystemValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxFileSystem class]];
}

@end

@implementation AWSFsxAdministrativeActionFailureDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSFsxBackup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupId" : @"BackupId",
             @"creationTime" : @"CreationTime",
             @"directoryInformation" : @"DirectoryInformation",
             @"failureDetails" : @"FailureDetails",
             @"fileSystem" : @"FileSystem",
             @"kmsKeyId" : @"KmsKeyId",
             @"lifecycle" : @"Lifecycle",
             @"progressPercent" : @"ProgressPercent",
             @"resourceARN" : @"ResourceARN",
             @"tags" : @"Tags",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)directoryInformationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxActiveDirectoryBackupAttributes class]];
}

+ (NSValueTransformer *)failureDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxBackupFailureDetails class]];
}

+ (NSValueTransformer *)fileSystemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxFileSystem class]];
}

+ (NSValueTransformer *)lifecycleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSFsxBackupLifecycleAvailable);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSFsxBackupLifecycleCreating);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSFsxBackupLifecycleDeleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSFsxBackupLifecycleFailed);
        }
        return @(AWSFsxBackupLifecycleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxBackupLifecycleAvailable:
                return @"AVAILABLE";
            case AWSFsxBackupLifecycleCreating:
                return @"CREATING";
            case AWSFsxBackupLifecycleDeleted:
                return @"DELETED";
            case AWSFsxBackupLifecycleFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFsxTag class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTOMATIC"] == NSOrderedSame) {
            return @(AWSFsxBackupTypeAutomatic);
        }
        if ([value caseInsensitiveCompare:@"USER_INITIATED"] == NSOrderedSame) {
            return @(AWSFsxBackupTypeUserInitiated);
        }
        return @(AWSFsxBackupTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxBackupTypeAutomatic:
                return @"AUTOMATIC";
            case AWSFsxBackupTypeUserInitiated:
                return @"USER_INITIATED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFsxBackupFailureDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSFsxCancelDataRepositoryTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"TaskId",
             };
}

@end

@implementation AWSFsxCancelDataRepositoryTaskResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lifecycle" : @"Lifecycle",
             @"taskId" : @"TaskId",
             };
}

+ (NSValueTransformer *)lifecycleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSFsxDataRepositoryTaskLifecyclePending);
        }
        if ([value caseInsensitiveCompare:@"EXECUTING"] == NSOrderedSame) {
            return @(AWSFsxDataRepositoryTaskLifecycleExecuting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSFsxDataRepositoryTaskLifecycleFailed);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSFsxDataRepositoryTaskLifecycleSucceeded);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSFsxDataRepositoryTaskLifecycleCanceled);
        }
        if ([value caseInsensitiveCompare:@"CANCELING"] == NSOrderedSame) {
            return @(AWSFsxDataRepositoryTaskLifecycleCanceling);
        }
        return @(AWSFsxDataRepositoryTaskLifecycleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxDataRepositoryTaskLifecyclePending:
                return @"PENDING";
            case AWSFsxDataRepositoryTaskLifecycleExecuting:
                return @"EXECUTING";
            case AWSFsxDataRepositoryTaskLifecycleFailed:
                return @"FAILED";
            case AWSFsxDataRepositoryTaskLifecycleSucceeded:
                return @"SUCCEEDED";
            case AWSFsxDataRepositoryTaskLifecycleCanceled:
                return @"CANCELED";
            case AWSFsxDataRepositoryTaskLifecycleCanceling:
                return @"CANCELING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFsxCompletionReport

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"format" : @"Format",
             @"path" : @"Path",
             @"scope" : @"Scope",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REPORT_CSV_20191124"] == NSOrderedSame) {
            return @(AWSFsxReportFormatReportCsv20191124);
        }
        return @(AWSFsxReportFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxReportFormatReportCsv20191124:
                return @"REPORT_CSV_20191124";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scopeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FAILED_FILES_ONLY"] == NSOrderedSame) {
            return @(AWSFsxReportScopeFailedFilesOnly);
        }
        return @(AWSFsxReportScopeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxReportScopeFailedFilesOnly:
                return @"FAILED_FILES_ONLY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFsxCreateBackupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"fileSystemId" : @"FileSystemId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFsxTag class]];
}

@end

@implementation AWSFsxCreateBackupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backup" : @"Backup",
             };
}

+ (NSValueTransformer *)backupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxBackup class]];
}

@end

@implementation AWSFsxCreateDataRepositoryTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"fileSystemId" : @"FileSystemId",
             @"paths" : @"Paths",
             @"report" : @"Report",
             @"tags" : @"Tags",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)reportJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxCompletionReport class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFsxTag class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXPORT_TO_REPOSITORY"] == NSOrderedSame) {
            return @(AWSFsxDataRepositoryTaskTypeExportToRepository);
        }
        return @(AWSFsxDataRepositoryTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxDataRepositoryTaskTypeExportToRepository:
                return @"EXPORT_TO_REPOSITORY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFsxCreateDataRepositoryTaskResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataRepositoryTask" : @"DataRepositoryTask",
             };
}

+ (NSValueTransformer *)dataRepositoryTaskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxDataRepositoryTask class]];
}

@end

@implementation AWSFsxCreateFileSystemFromBackupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupId" : @"BackupId",
             @"clientRequestToken" : @"ClientRequestToken",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"storageType" : @"StorageType",
             @"subnetIds" : @"SubnetIds",
             @"tags" : @"Tags",
             @"windowsConfiguration" : @"WindowsConfiguration",
             };
}

+ (NSValueTransformer *)storageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SSD"] == NSOrderedSame) {
            return @(AWSFsxStorageTypeSsd);
        }
        if ([value caseInsensitiveCompare:@"HDD"] == NSOrderedSame) {
            return @(AWSFsxStorageTypeHdd);
        }
        return @(AWSFsxStorageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxStorageTypeSsd:
                return @"SSD";
            case AWSFsxStorageTypeHdd:
                return @"HDD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFsxTag class]];
}

+ (NSValueTransformer *)windowsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxCreateFileSystemWindowsConfiguration class]];
}

@end

@implementation AWSFsxCreateFileSystemFromBackupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystem" : @"FileSystem",
             };
}

+ (NSValueTransformer *)fileSystemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxFileSystem class]];
}

@end

@implementation AWSFsxCreateFileSystemLustreConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentType" : @"DeploymentType",
             @"exportPath" : @"ExportPath",
             @"importPath" : @"ImportPath",
             @"importedFileChunkSize" : @"ImportedFileChunkSize",
             @"perUnitStorageThroughput" : @"PerUnitStorageThroughput",
             @"weeklyMaintenanceStartTime" : @"WeeklyMaintenanceStartTime",
             };
}

+ (NSValueTransformer *)deploymentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SCRATCH_1"] == NSOrderedSame) {
            return @(AWSFsxLustreDeploymentTypeScratch1);
        }
        if ([value caseInsensitiveCompare:@"SCRATCH_2"] == NSOrderedSame) {
            return @(AWSFsxLustreDeploymentTypeScratch2);
        }
        if ([value caseInsensitiveCompare:@"PERSISTENT_1"] == NSOrderedSame) {
            return @(AWSFsxLustreDeploymentTypePersistent1);
        }
        return @(AWSFsxLustreDeploymentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxLustreDeploymentTypeScratch1:
                return @"SCRATCH_1";
            case AWSFsxLustreDeploymentTypeScratch2:
                return @"SCRATCH_2";
            case AWSFsxLustreDeploymentTypePersistent1:
                return @"PERSISTENT_1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFsxCreateFileSystemRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"fileSystemType" : @"FileSystemType",
             @"kmsKeyId" : @"KmsKeyId",
             @"lustreConfiguration" : @"LustreConfiguration",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"storageCapacity" : @"StorageCapacity",
             @"storageType" : @"StorageType",
             @"subnetIds" : @"SubnetIds",
             @"tags" : @"Tags",
             @"windowsConfiguration" : @"WindowsConfiguration",
             };
}

+ (NSValueTransformer *)fileSystemTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS"] == NSOrderedSame) {
            return @(AWSFsxFileSystemTypeWindows);
        }
        if ([value caseInsensitiveCompare:@"LUSTRE"] == NSOrderedSame) {
            return @(AWSFsxFileSystemTypeLustre);
        }
        return @(AWSFsxFileSystemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxFileSystemTypeWindows:
                return @"WINDOWS";
            case AWSFsxFileSystemTypeLustre:
                return @"LUSTRE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lustreConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxCreateFileSystemLustreConfiguration class]];
}

+ (NSValueTransformer *)storageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SSD"] == NSOrderedSame) {
            return @(AWSFsxStorageTypeSsd);
        }
        if ([value caseInsensitiveCompare:@"HDD"] == NSOrderedSame) {
            return @(AWSFsxStorageTypeHdd);
        }
        return @(AWSFsxStorageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxStorageTypeSsd:
                return @"SSD";
            case AWSFsxStorageTypeHdd:
                return @"HDD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFsxTag class]];
}

+ (NSValueTransformer *)windowsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxCreateFileSystemWindowsConfiguration class]];
}

@end

@implementation AWSFsxCreateFileSystemResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystem" : @"FileSystem",
             };
}

+ (NSValueTransformer *)fileSystemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxFileSystem class]];
}

@end

@implementation AWSFsxCreateFileSystemWindowsConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeDirectoryId" : @"ActiveDirectoryId",
             @"automaticBackupRetentionDays" : @"AutomaticBackupRetentionDays",
             @"replicateTagsToBackups" : @"CopyTagsToBackups",
             @"dailyAutomaticBackupStartTime" : @"DailyAutomaticBackupStartTime",
             @"deploymentType" : @"DeploymentType",
             @"preferredSubnetId" : @"PreferredSubnetId",
             @"selfManagedActiveDirectoryConfiguration" : @"SelfManagedActiveDirectoryConfiguration",
             @"throughputCapacity" : @"ThroughputCapacity",
             @"weeklyMaintenanceStartTime" : @"WeeklyMaintenanceStartTime",
             };
}

+ (NSValueTransformer *)deploymentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MULTI_AZ_1"] == NSOrderedSame) {
            return @(AWSFsxWindowsDeploymentTypeMultiAz1);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_AZ_1"] == NSOrderedSame) {
            return @(AWSFsxWindowsDeploymentTypeSingleAz1);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_AZ_2"] == NSOrderedSame) {
            return @(AWSFsxWindowsDeploymentTypeSingleAz2);
        }
        return @(AWSFsxWindowsDeploymentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxWindowsDeploymentTypeMultiAz1:
                return @"MULTI_AZ_1";
            case AWSFsxWindowsDeploymentTypeSingleAz1:
                return @"SINGLE_AZ_1";
            case AWSFsxWindowsDeploymentTypeSingleAz2:
                return @"SINGLE_AZ_2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)selfManagedActiveDirectoryConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxSelfManagedActiveDirectoryConfiguration class]];
}

@end

@implementation AWSFsxDataRepositoryConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportPath" : @"ExportPath",
             @"importPath" : @"ImportPath",
             @"importedFileChunkSize" : @"ImportedFileChunkSize",
             };
}

@end

@implementation AWSFsxDataRepositoryTask

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"endTime" : @"EndTime",
             @"failureDetails" : @"FailureDetails",
             @"fileSystemId" : @"FileSystemId",
             @"lifecycle" : @"Lifecycle",
             @"paths" : @"Paths",
             @"report" : @"Report",
             @"resourceARN" : @"ResourceARN",
             @"startTime" : @"StartTime",
             @"status" : @"Status",
             @"tags" : @"Tags",
             @"taskId" : @"TaskId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)failureDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxDataRepositoryTaskFailureDetails class]];
}

+ (NSValueTransformer *)lifecycleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSFsxDataRepositoryTaskLifecyclePending);
        }
        if ([value caseInsensitiveCompare:@"EXECUTING"] == NSOrderedSame) {
            return @(AWSFsxDataRepositoryTaskLifecycleExecuting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSFsxDataRepositoryTaskLifecycleFailed);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSFsxDataRepositoryTaskLifecycleSucceeded);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSFsxDataRepositoryTaskLifecycleCanceled);
        }
        if ([value caseInsensitiveCompare:@"CANCELING"] == NSOrderedSame) {
            return @(AWSFsxDataRepositoryTaskLifecycleCanceling);
        }
        return @(AWSFsxDataRepositoryTaskLifecycleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxDataRepositoryTaskLifecyclePending:
                return @"PENDING";
            case AWSFsxDataRepositoryTaskLifecycleExecuting:
                return @"EXECUTING";
            case AWSFsxDataRepositoryTaskLifecycleFailed:
                return @"FAILED";
            case AWSFsxDataRepositoryTaskLifecycleSucceeded:
                return @"SUCCEEDED";
            case AWSFsxDataRepositoryTaskLifecycleCanceled:
                return @"CANCELED";
            case AWSFsxDataRepositoryTaskLifecycleCanceling:
                return @"CANCELING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)reportJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxCompletionReport class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxDataRepositoryTaskStatus class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFsxTag class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXPORT_TO_REPOSITORY"] == NSOrderedSame) {
            return @(AWSFsxDataRepositoryTaskTypeExportToRepository);
        }
        return @(AWSFsxDataRepositoryTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxDataRepositoryTaskTypeExportToRepository:
                return @"EXPORT_TO_REPOSITORY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFsxDataRepositoryTaskFailureDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSFsxDataRepositoryTaskFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"file-system-id"] == NSOrderedSame) {
            return @(AWSFsxDataRepositoryTaskFilterNameFileSystemId);
        }
        if ([value caseInsensitiveCompare:@"task-lifecycle"] == NSOrderedSame) {
            return @(AWSFsxDataRepositoryTaskFilterNameTaskLifecycle);
        }
        return @(AWSFsxDataRepositoryTaskFilterNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxDataRepositoryTaskFilterNameFileSystemId:
                return @"file-system-id";
            case AWSFsxDataRepositoryTaskFilterNameTaskLifecycle:
                return @"task-lifecycle";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFsxDataRepositoryTaskStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failedCount" : @"FailedCount",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             @"succeededCount" : @"SucceededCount",
             @"totalCount" : @"TotalCount",
             };
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSFsxDeleteBackupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupId" : @"BackupId",
             @"clientRequestToken" : @"ClientRequestToken",
             };
}

@end

@implementation AWSFsxDeleteBackupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupId" : @"BackupId",
             @"lifecycle" : @"Lifecycle",
             };
}

+ (NSValueTransformer *)lifecycleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSFsxBackupLifecycleAvailable);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSFsxBackupLifecycleCreating);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSFsxBackupLifecycleDeleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSFsxBackupLifecycleFailed);
        }
        return @(AWSFsxBackupLifecycleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxBackupLifecycleAvailable:
                return @"AVAILABLE";
            case AWSFsxBackupLifecycleCreating:
                return @"CREATING";
            case AWSFsxBackupLifecycleDeleted:
                return @"DELETED";
            case AWSFsxBackupLifecycleFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFsxDeleteFileSystemRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"fileSystemId" : @"FileSystemId",
             @"windowsConfiguration" : @"WindowsConfiguration",
             };
}

+ (NSValueTransformer *)windowsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxDeleteFileSystemWindowsConfiguration class]];
}

@end

@implementation AWSFsxDeleteFileSystemResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystemId" : @"FileSystemId",
             @"lifecycle" : @"Lifecycle",
             @"windowsResponse" : @"WindowsResponse",
             };
}

+ (NSValueTransformer *)lifecycleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSFsxFileSystemLifecycleAvailable);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSFsxFileSystemLifecycleCreating);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSFsxFileSystemLifecycleFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSFsxFileSystemLifecycleDeleting);
        }
        if ([value caseInsensitiveCompare:@"MISCONFIGURED"] == NSOrderedSame) {
            return @(AWSFsxFileSystemLifecycleMisconfigured);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSFsxFileSystemLifecycleUpdating);
        }
        return @(AWSFsxFileSystemLifecycleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxFileSystemLifecycleAvailable:
                return @"AVAILABLE";
            case AWSFsxFileSystemLifecycleCreating:
                return @"CREATING";
            case AWSFsxFileSystemLifecycleFailed:
                return @"FAILED";
            case AWSFsxFileSystemLifecycleDeleting:
                return @"DELETING";
            case AWSFsxFileSystemLifecycleMisconfigured:
                return @"MISCONFIGURED";
            case AWSFsxFileSystemLifecycleUpdating:
                return @"UPDATING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)windowsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxDeleteFileSystemWindowsResponse class]];
}

@end

@implementation AWSFsxDeleteFileSystemWindowsConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"finalBackupTags" : @"FinalBackupTags",
             @"skipFinalBackup" : @"SkipFinalBackup",
             };
}

+ (NSValueTransformer *)finalBackupTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFsxTag class]];
}

@end

@implementation AWSFsxDeleteFileSystemWindowsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"finalBackupId" : @"FinalBackupId",
             @"finalBackupTags" : @"FinalBackupTags",
             };
}

+ (NSValueTransformer *)finalBackupTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFsxTag class]];
}

@end

@implementation AWSFsxDescribeBackupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupIds" : @"BackupIds",
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFsxFilter class]];
}

@end

@implementation AWSFsxDescribeBackupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backups" : @"Backups",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)backupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFsxBackup class]];
}

@end

@implementation AWSFsxDescribeDataRepositoryTasksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"taskIds" : @"TaskIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFsxDataRepositoryTaskFilter class]];
}

@end

@implementation AWSFsxDescribeDataRepositoryTasksResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataRepositoryTasks" : @"DataRepositoryTasks",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)dataRepositoryTasksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFsxDataRepositoryTask class]];
}

@end

@implementation AWSFsxDescribeFileSystemsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystemIds" : @"FileSystemIds",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSFsxDescribeFileSystemsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystems" : @"FileSystems",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)fileSystemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFsxFileSystem class]];
}

@end

@implementation AWSFsxFileSystem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"administrativeActions" : @"AdministrativeActions",
             @"creationTime" : @"CreationTime",
             @"DNSName" : @"DNSName",
             @"failureDetails" : @"FailureDetails",
             @"fileSystemId" : @"FileSystemId",
             @"fileSystemType" : @"FileSystemType",
             @"kmsKeyId" : @"KmsKeyId",
             @"lifecycle" : @"Lifecycle",
             @"lustreConfiguration" : @"LustreConfiguration",
             @"networkInterfaceIds" : @"NetworkInterfaceIds",
             @"ownerId" : @"OwnerId",
             @"resourceARN" : @"ResourceARN",
             @"storageCapacity" : @"StorageCapacity",
             @"storageType" : @"StorageType",
             @"subnetIds" : @"SubnetIds",
             @"tags" : @"Tags",
             @"vpcId" : @"VpcId",
             @"windowsConfiguration" : @"WindowsConfiguration",
             };
}

+ (NSValueTransformer *)administrativeActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFsxAdministrativeAction class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)failureDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxFileSystemFailureDetails class]];
}

+ (NSValueTransformer *)fileSystemTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS"] == NSOrderedSame) {
            return @(AWSFsxFileSystemTypeWindows);
        }
        if ([value caseInsensitiveCompare:@"LUSTRE"] == NSOrderedSame) {
            return @(AWSFsxFileSystemTypeLustre);
        }
        return @(AWSFsxFileSystemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxFileSystemTypeWindows:
                return @"WINDOWS";
            case AWSFsxFileSystemTypeLustre:
                return @"LUSTRE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lifecycleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSFsxFileSystemLifecycleAvailable);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSFsxFileSystemLifecycleCreating);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSFsxFileSystemLifecycleFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSFsxFileSystemLifecycleDeleting);
        }
        if ([value caseInsensitiveCompare:@"MISCONFIGURED"] == NSOrderedSame) {
            return @(AWSFsxFileSystemLifecycleMisconfigured);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSFsxFileSystemLifecycleUpdating);
        }
        return @(AWSFsxFileSystemLifecycleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxFileSystemLifecycleAvailable:
                return @"AVAILABLE";
            case AWSFsxFileSystemLifecycleCreating:
                return @"CREATING";
            case AWSFsxFileSystemLifecycleFailed:
                return @"FAILED";
            case AWSFsxFileSystemLifecycleDeleting:
                return @"DELETING";
            case AWSFsxFileSystemLifecycleMisconfigured:
                return @"MISCONFIGURED";
            case AWSFsxFileSystemLifecycleUpdating:
                return @"UPDATING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lustreConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxLustreFileSystemConfiguration class]];
}

+ (NSValueTransformer *)storageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SSD"] == NSOrderedSame) {
            return @(AWSFsxStorageTypeSsd);
        }
        if ([value caseInsensitiveCompare:@"HDD"] == NSOrderedSame) {
            return @(AWSFsxStorageTypeHdd);
        }
        return @(AWSFsxStorageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxStorageTypeSsd:
                return @"SSD";
            case AWSFsxStorageTypeHdd:
                return @"HDD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFsxTag class]];
}

+ (NSValueTransformer *)windowsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxWindowsFileSystemConfiguration class]];
}

@end

@implementation AWSFsxFileSystemFailureDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSFsxFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"file-system-id"] == NSOrderedSame) {
            return @(AWSFsxFilterNameFileSystemId);
        }
        if ([value caseInsensitiveCompare:@"backup-type"] == NSOrderedSame) {
            return @(AWSFsxFilterNameBackupType);
        }
        return @(AWSFsxFilterNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxFilterNameFileSystemId:
                return @"file-system-id";
            case AWSFsxFilterNameBackupType:
                return @"backup-type";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFsxListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resourceARN" : @"ResourceARN",
             };
}

@end

@implementation AWSFsxListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFsxTag class]];
}

@end

@implementation AWSFsxLustreFileSystemConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataRepositoryConfiguration" : @"DataRepositoryConfiguration",
             @"deploymentType" : @"DeploymentType",
             @"mountName" : @"MountName",
             @"perUnitStorageThroughput" : @"PerUnitStorageThroughput",
             @"weeklyMaintenanceStartTime" : @"WeeklyMaintenanceStartTime",
             };
}

+ (NSValueTransformer *)dataRepositoryConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxDataRepositoryConfiguration class]];
}

+ (NSValueTransformer *)deploymentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SCRATCH_1"] == NSOrderedSame) {
            return @(AWSFsxLustreDeploymentTypeScratch1);
        }
        if ([value caseInsensitiveCompare:@"SCRATCH_2"] == NSOrderedSame) {
            return @(AWSFsxLustreDeploymentTypeScratch2);
        }
        if ([value caseInsensitiveCompare:@"PERSISTENT_1"] == NSOrderedSame) {
            return @(AWSFsxLustreDeploymentTypePersistent1);
        }
        return @(AWSFsxLustreDeploymentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxLustreDeploymentTypeScratch1:
                return @"SCRATCH_1";
            case AWSFsxLustreDeploymentTypeScratch2:
                return @"SCRATCH_2";
            case AWSFsxLustreDeploymentTypePersistent1:
                return @"PERSISTENT_1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSFsxSelfManagedActiveDirectoryAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dnsIps" : @"DnsIps",
             @"domainName" : @"DomainName",
             @"fileSystemAdministratorsGroup" : @"FileSystemAdministratorsGroup",
             @"organizationalUnitDistinguishedName" : @"OrganizationalUnitDistinguishedName",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSFsxSelfManagedActiveDirectoryConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dnsIps" : @"DnsIps",
             @"domainName" : @"DomainName",
             @"fileSystemAdministratorsGroup" : @"FileSystemAdministratorsGroup",
             @"organizationalUnitDistinguishedName" : @"OrganizationalUnitDistinguishedName",
             @"password" : @"Password",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSFsxSelfManagedActiveDirectoryConfigurationUpdates

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dnsIps" : @"DnsIps",
             @"password" : @"Password",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSFsxTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSFsxTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSFsxTag class]];
}

@end

@implementation AWSFsxTagResourceResponse

@end

@implementation AWSFsxUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSFsxUntagResourceResponse

@end

@implementation AWSFsxUpdateFileSystemLustreConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"weeklyMaintenanceStartTime" : @"WeeklyMaintenanceStartTime",
             };
}

@end

@implementation AWSFsxUpdateFileSystemRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"fileSystemId" : @"FileSystemId",
             @"lustreConfiguration" : @"LustreConfiguration",
             @"storageCapacity" : @"StorageCapacity",
             @"windowsConfiguration" : @"WindowsConfiguration",
             };
}

+ (NSValueTransformer *)lustreConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxUpdateFileSystemLustreConfiguration class]];
}

+ (NSValueTransformer *)windowsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxUpdateFileSystemWindowsConfiguration class]];
}

@end

@implementation AWSFsxUpdateFileSystemResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystem" : @"FileSystem",
             };
}

+ (NSValueTransformer *)fileSystemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxFileSystem class]];
}

@end

@implementation AWSFsxUpdateFileSystemWindowsConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automaticBackupRetentionDays" : @"AutomaticBackupRetentionDays",
             @"dailyAutomaticBackupStartTime" : @"DailyAutomaticBackupStartTime",
             @"selfManagedActiveDirectoryConfiguration" : @"SelfManagedActiveDirectoryConfiguration",
             @"throughputCapacity" : @"ThroughputCapacity",
             @"weeklyMaintenanceStartTime" : @"WeeklyMaintenanceStartTime",
             };
}

+ (NSValueTransformer *)selfManagedActiveDirectoryConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxSelfManagedActiveDirectoryConfigurationUpdates class]];
}

@end

@implementation AWSFsxWindowsFileSystemConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeDirectoryId" : @"ActiveDirectoryId",
             @"automaticBackupRetentionDays" : @"AutomaticBackupRetentionDays",
             @"replicateTagsToBackups" : @"CopyTagsToBackups",
             @"dailyAutomaticBackupStartTime" : @"DailyAutomaticBackupStartTime",
             @"deploymentType" : @"DeploymentType",
             @"maintenanceOperationsInProgress" : @"MaintenanceOperationsInProgress",
             @"preferredFileServerIp" : @"PreferredFileServerIp",
             @"preferredSubnetId" : @"PreferredSubnetId",
             @"remoteAdministrationEndpoint" : @"RemoteAdministrationEndpoint",
             @"selfManagedActiveDirectoryConfiguration" : @"SelfManagedActiveDirectoryConfiguration",
             @"throughputCapacity" : @"ThroughputCapacity",
             @"weeklyMaintenanceStartTime" : @"WeeklyMaintenanceStartTime",
             };
}

+ (NSValueTransformer *)deploymentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MULTI_AZ_1"] == NSOrderedSame) {
            return @(AWSFsxWindowsDeploymentTypeMultiAz1);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_AZ_1"] == NSOrderedSame) {
            return @(AWSFsxWindowsDeploymentTypeSingleAz1);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_AZ_2"] == NSOrderedSame) {
            return @(AWSFsxWindowsDeploymentTypeSingleAz2);
        }
        return @(AWSFsxWindowsDeploymentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSFsxWindowsDeploymentTypeMultiAz1:
                return @"MULTI_AZ_1";
            case AWSFsxWindowsDeploymentTypeSingleAz1:
                return @"SINGLE_AZ_1";
            case AWSFsxWindowsDeploymentTypeSingleAz2:
                return @"SINGLE_AZ_2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)selfManagedActiveDirectoryConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSFsxSelfManagedActiveDirectoryAttributes class]];
}

@end
