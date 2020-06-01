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

FOUNDATION_EXPORT NSString *const AWSFsxErrorDomain;

typedef NS_ENUM(NSInteger, AWSFsxErrorType) {
    AWSFsxErrorUnknown,
    AWSFsxErrorActiveDirectory,
    AWSFsxErrorBackupInProgress,
    AWSFsxErrorBackupNotFound,
    AWSFsxErrorBackupRestoring,
    AWSFsxErrorBadRequest,
    AWSFsxErrorDataRepositoryTaskEnded,
    AWSFsxErrorDataRepositoryTaskExecuting,
    AWSFsxErrorDataRepositoryTaskNotFound,
    AWSFsxErrorFileSystemNotFound,
    AWSFsxErrorIncompatibleParameter,
    AWSFsxErrorInternalServer,
    AWSFsxErrorInvalidExportPath,
    AWSFsxErrorInvalidImportPath,
    AWSFsxErrorInvalidNetworkSettings,
    AWSFsxErrorInvalidPerUnitStorageThroughput,
    AWSFsxErrorMissingFileSystemConfiguration,
    AWSFsxErrorNotServiceResource,
    AWSFsxErrorResourceDoesNotSupportTagging,
    AWSFsxErrorResourceNotFound,
    AWSFsxErrorServiceLimitExceeded,
    AWSFsxErrorUnsupportedOperation,
};

typedef NS_ENUM(NSInteger, AWSFsxActiveDirectoryErrorType) {
    AWSFsxActiveDirectoryErrorTypeUnknown,
    AWSFsxActiveDirectoryErrorTypeDomainNotFound,
    AWSFsxActiveDirectoryErrorTypeIncompatibleDomainMode,
    AWSFsxActiveDirectoryErrorTypeWrongVpc,
    AWSFsxActiveDirectoryErrorTypeInvalidDomainStage,
};

typedef NS_ENUM(NSInteger, AWSFsxAdministrativeActionType) {
    AWSFsxAdministrativeActionTypeUnknown,
    AWSFsxAdministrativeActionTypeFileSystemUpdate,
    AWSFsxAdministrativeActionTypeStorageOptimization,
};

typedef NS_ENUM(NSInteger, AWSFsxBackupLifecycle) {
    AWSFsxBackupLifecycleUnknown,
    AWSFsxBackupLifecycleAvailable,
    AWSFsxBackupLifecycleCreating,
    AWSFsxBackupLifecycleDeleted,
    AWSFsxBackupLifecycleFailed,
};

typedef NS_ENUM(NSInteger, AWSFsxBackupType) {
    AWSFsxBackupTypeUnknown,
    AWSFsxBackupTypeAutomatic,
    AWSFsxBackupTypeUserInitiated,
};

typedef NS_ENUM(NSInteger, AWSFsxDataRepositoryTaskFilterName) {
    AWSFsxDataRepositoryTaskFilterNameUnknown,
    AWSFsxDataRepositoryTaskFilterNameFileSystemId,
    AWSFsxDataRepositoryTaskFilterNameTaskLifecycle,
};

typedef NS_ENUM(NSInteger, AWSFsxDataRepositoryTaskLifecycle) {
    AWSFsxDataRepositoryTaskLifecycleUnknown,
    AWSFsxDataRepositoryTaskLifecyclePending,
    AWSFsxDataRepositoryTaskLifecycleExecuting,
    AWSFsxDataRepositoryTaskLifecycleFailed,
    AWSFsxDataRepositoryTaskLifecycleSucceeded,
    AWSFsxDataRepositoryTaskLifecycleCanceled,
    AWSFsxDataRepositoryTaskLifecycleCanceling,
};

typedef NS_ENUM(NSInteger, AWSFsxDataRepositoryTaskType) {
    AWSFsxDataRepositoryTaskTypeUnknown,
    AWSFsxDataRepositoryTaskTypeExportToRepository,
};

typedef NS_ENUM(NSInteger, AWSFsxFileSystemLifecycle) {
    AWSFsxFileSystemLifecycleUnknown,
    AWSFsxFileSystemLifecycleAvailable,
    AWSFsxFileSystemLifecycleCreating,
    AWSFsxFileSystemLifecycleFailed,
    AWSFsxFileSystemLifecycleDeleting,
    AWSFsxFileSystemLifecycleMisconfigured,
    AWSFsxFileSystemLifecycleUpdating,
};

typedef NS_ENUM(NSInteger, AWSFsxFileSystemMaintenanceOperation) {
    AWSFsxFileSystemMaintenanceOperationUnknown,
    AWSFsxFileSystemMaintenanceOperationPatching,
    AWSFsxFileSystemMaintenanceOperationBackingUp,
};

typedef NS_ENUM(NSInteger, AWSFsxFileSystemType) {
    AWSFsxFileSystemTypeUnknown,
    AWSFsxFileSystemTypeWindows,
    AWSFsxFileSystemTypeLustre,
};

typedef NS_ENUM(NSInteger, AWSFsxFilterName) {
    AWSFsxFilterNameUnknown,
    AWSFsxFilterNameFileSystemId,
    AWSFsxFilterNameBackupType,
};

typedef NS_ENUM(NSInteger, AWSFsxLustreDeploymentType) {
    AWSFsxLustreDeploymentTypeUnknown,
    AWSFsxLustreDeploymentTypeScratch1,
    AWSFsxLustreDeploymentTypeScratch2,
    AWSFsxLustreDeploymentTypePersistent1,
};

typedef NS_ENUM(NSInteger, AWSFsxReportFormat) {
    AWSFsxReportFormatUnknown,
    AWSFsxReportFormatReportCsv20191124,
};

typedef NS_ENUM(NSInteger, AWSFsxReportScope) {
    AWSFsxReportScopeUnknown,
    AWSFsxReportScopeFailedFilesOnly,
};

typedef NS_ENUM(NSInteger, AWSFsxServiceLimit) {
    AWSFsxServiceLimitUnknown,
    AWSFsxServiceLimitFileSystemCount,
    AWSFsxServiceLimitTotalThroughputCapacity,
    AWSFsxServiceLimitTotalStorage,
    AWSFsxServiceLimitTotalUserInitiatedBackups,
};

typedef NS_ENUM(NSInteger, AWSFsxStatus) {
    AWSFsxStatusUnknown,
    AWSFsxStatusFailed,
    AWSFsxStatusInProgress,
    AWSFsxStatusPending,
    AWSFsxStatusCompleted,
    AWSFsxStatusUpdatedOptimizing,
};

typedef NS_ENUM(NSInteger, AWSFsxStorageType) {
    AWSFsxStorageTypeUnknown,
    AWSFsxStorageTypeSsd,
    AWSFsxStorageTypeHdd,
};

typedef NS_ENUM(NSInteger, AWSFsxWindowsDeploymentType) {
    AWSFsxWindowsDeploymentTypeUnknown,
    AWSFsxWindowsDeploymentTypeMultiAz1,
    AWSFsxWindowsDeploymentTypeSingleAz1,
    AWSFsxWindowsDeploymentTypeSingleAz2,
};

@class AWSFsxActiveDirectoryBackupAttributes;
@class AWSFsxAdministrativeAction;
@class AWSFsxAdministrativeActionFailureDetails;
@class AWSFsxBackup;
@class AWSFsxBackupFailureDetails;
@class AWSFsxCancelDataRepositoryTaskRequest;
@class AWSFsxCancelDataRepositoryTaskResponse;
@class AWSFsxCompletionReport;
@class AWSFsxCreateBackupRequest;
@class AWSFsxCreateBackupResponse;
@class AWSFsxCreateDataRepositoryTaskRequest;
@class AWSFsxCreateDataRepositoryTaskResponse;
@class AWSFsxCreateFileSystemFromBackupRequest;
@class AWSFsxCreateFileSystemFromBackupResponse;
@class AWSFsxCreateFileSystemLustreConfiguration;
@class AWSFsxCreateFileSystemRequest;
@class AWSFsxCreateFileSystemResponse;
@class AWSFsxCreateFileSystemWindowsConfiguration;
@class AWSFsxDataRepositoryConfiguration;
@class AWSFsxDataRepositoryTask;
@class AWSFsxDataRepositoryTaskFailureDetails;
@class AWSFsxDataRepositoryTaskFilter;
@class AWSFsxDataRepositoryTaskStatus;
@class AWSFsxDeleteBackupRequest;
@class AWSFsxDeleteBackupResponse;
@class AWSFsxDeleteFileSystemRequest;
@class AWSFsxDeleteFileSystemResponse;
@class AWSFsxDeleteFileSystemWindowsConfiguration;
@class AWSFsxDeleteFileSystemWindowsResponse;
@class AWSFsxDescribeBackupsRequest;
@class AWSFsxDescribeBackupsResponse;
@class AWSFsxDescribeDataRepositoryTasksRequest;
@class AWSFsxDescribeDataRepositoryTasksResponse;
@class AWSFsxDescribeFileSystemsRequest;
@class AWSFsxDescribeFileSystemsResponse;
@class AWSFsxFileSystem;
@class AWSFsxFileSystemFailureDetails;
@class AWSFsxFilter;
@class AWSFsxListTagsForResourceRequest;
@class AWSFsxListTagsForResourceResponse;
@class AWSFsxLustreFileSystemConfiguration;
@class AWSFsxSelfManagedActiveDirectoryAttributes;
@class AWSFsxSelfManagedActiveDirectoryConfiguration;
@class AWSFsxSelfManagedActiveDirectoryConfigurationUpdates;
@class AWSFsxTag;
@class AWSFsxTagResourceRequest;
@class AWSFsxTagResourceResponse;
@class AWSFsxUntagResourceRequest;
@class AWSFsxUntagResourceResponse;
@class AWSFsxUpdateFileSystemLustreConfiguration;
@class AWSFsxUpdateFileSystemRequest;
@class AWSFsxUpdateFileSystemResponse;
@class AWSFsxUpdateFileSystemWindowsConfiguration;
@class AWSFsxWindowsFileSystemConfiguration;

/**
 <p>The Microsoft AD attributes of the Amazon FSx for Windows File Server file system.</p>
 */
@interface AWSFsxActiveDirectoryBackupAttributes : AWSModel


/**
 <p>The ID of the AWS Managed Microsoft Active Directory instance to which the file system is joined.</p>
 */
@property (nonatomic, strong) NSString * _Nullable activeDirectoryId;

/**
 <p>The fully qualified domain name of the self-managed AD directory.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p>Describes a specific Amazon FSx Administrative Action for the current Windows file system.</p>
 */
@interface AWSFsxAdministrativeAction : AWSModel


/**
 <p>Describes the type of administrative action, as follows:</p><ul><li><p><code>FILE_SYSTEM_UPDATE</code> - A file system update administrative action initiated by the user from the Amazon FSx console, API (UpdateFileSystem), or CLI (update-file-system). A</p></li><li><p><code>STORAGE_OPTIMIZATION</code> - Once the <code>FILE_SYSTEM_UPDATE</code> task to increase a file system's storage capacity completes successfully, a <code>STORAGE_OPTIMIZATION</code> task starts. Storage optimization is the process of migrating the file system data to the new, larger disks. You can track the storage migration progress using the <code>ProgressPercent</code> property. When <code>STORAGE_OPTIMIZATION</code> completes successfully, the parent <code>FILE_SYSTEM_UPDATE</code> action status changes to <code>COMPLETED</code>. For more information, see <a href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-storage-capacity.html">Managing Storage Capacity</a>. </p></li></ul>
 */
@property (nonatomic, assign) AWSFsxAdministrativeActionType administrativeActionType;

/**
 <p>Provides information about a failed administrative action.</p>
 */
@property (nonatomic, strong) AWSFsxAdministrativeActionFailureDetails * _Nullable failureDetails;

/**
 <p>Provides the percent complete of a <code>STORAGE_OPTIMIZATION</code> administrative action.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable progressPercent;

/**
 <p>Time that the administrative action request was received.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable requestTime;

/**
 <p>Describes the status of the administrative action, as follows:</p><ul><li><p><code>FAILED</code> - Amazon FSx failed to process the administrative action successfully.</p></li><li><p><code>IN_PROGRESS</code> - Amazon FSx is processing the administrative action.</p></li><li><p><code>PENDING</code> - Amazon FSx is waiting to process the administrative action.</p></li><li><p><code>COMPLETED</code> - Amazon FSx has finished processing the administrative task.</p></li><li><p><code>UPDATED_OPTIMIZING</code> - For a storage capacity increase update, Amazon FSx has updated the file system with the new storage capacity, and is now performing the storage optimization process. For more information, see <a href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-storage-capacity.html">Managing Storage Capacity</a>.</p></li></ul>
 */
@property (nonatomic, assign) AWSFsxStatus status;

/**
 <p>Describes the target <code>StorageCapacity</code> or <code>ThroughputCapacity</code> value provided in the <code>UpdateFileSystem</code> operation. Returned for <code>FILE_SYSTEM_UPDATE</code> administrative actions. </p>
 */
@property (nonatomic, strong) AWSFsxFileSystem * _Nullable targetFileSystemValues;

@end

/**
 <p>Provides information about a failed administrative action.</p>
 */
@interface AWSFsxAdministrativeActionFailureDetails : AWSModel


/**
 <p>Error message providing details about the failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>A backup of an Amazon FSx for Windows File Server file system. You can create a new file system from a backup to protect against data loss.</p>
 Required parameters: [BackupId, Lifecycle, Type, CreationTime, FileSystem]
 */
@interface AWSFsxBackup : AWSModel


/**
 <p>The ID of the backup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupId;

/**
 <p>The time when a particular backup was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The configuration of the self-managed Microsoft Active Directory (AD) to which the Windows File Server instance is joined.</p>
 */
@property (nonatomic, strong) AWSFsxActiveDirectoryBackupAttributes * _Nullable directoryInformation;

/**
 <p>Details explaining any failures that occur when creating a backup.</p>
 */
@property (nonatomic, strong) AWSFsxBackupFailureDetails * _Nullable failureDetails;

/**
 <p>Metadata of the file system associated with the backup. This metadata is persisted even if the file system is deleted.</p>
 */
@property (nonatomic, strong) AWSFsxFileSystem * _Nullable fileSystem;

/**
 <p>The ID of the AWS Key Management Service (AWS KMS) key used to encrypt this backup of the Amazon FSx for Windows file system's data at rest. Amazon FSx for Lustre does not support KMS encryption.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The lifecycle status of the backup.</p>
 */
@property (nonatomic, assign) AWSFsxBackupLifecycle lifecycle;

/**
 <p>The current percent of progress of an asynchronous task.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable progressPercent;

/**
 <p>The Amazon Resource Name (ARN) for the backup resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p>Tags associated with a particular file system.</p>
 */
@property (nonatomic, strong) NSArray<AWSFsxTag *> * _Nullable tags;

/**
 <p>The type of the backup.</p>
 */
@property (nonatomic, assign) AWSFsxBackupType types;

@end

/**
 <p>If backup creation fails, this structure contains the details of that failure.</p>
 */
@interface AWSFsxBackupFailureDetails : AWSModel


/**
 <p>A message describing the backup creation failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Cancels a data repository task.</p>
 Required parameters: [TaskId]
 */
@interface AWSFsxCancelDataRepositoryTaskRequest : AWSRequest


/**
 <p>Specifies the data repository task to cancel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSFsxCancelDataRepositoryTaskResponse : AWSModel


/**
 <p>The lifecycle status of the data repository task, as follows:</p><ul><li><p><code>PENDING</code> - Amazon FSx has not started the task.</p></li><li><p><code>EXECUTING</code> - Amazon FSx is processing the task.</p></li><li><p><code>FAILED</code> - Amazon FSx was not able to complete the task. For example, there may be files the task failed to process. The <a>DataRepositoryTaskFailureDetails</a> property provides more information about task failures.</p></li><li><p><code>SUCCEEDED</code> - FSx completed the task successfully.</p></li><li><p><code>CANCELED</code> - Amazon FSx canceled the task and it did not complete.</p></li><li><p><code>CANCELING</code> - FSx is in process of canceling the task.</p></li></ul>
 */
@property (nonatomic, assign) AWSFsxDataRepositoryTaskLifecycle lifecycle;

/**
 <p>The ID of the task being canceled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 <p>Provides a report detailing the data repository task results of the files processed that match the criteria specified in the report <code>Scope</code> parameter. FSx delivers the report to the file system's linked data repository in Amazon S3, using the path specified in the report <code>Path</code> parameter. You can specify whether or not a report gets generated for a task using the <code>Enabled</code> parameter.</p>
 Required parameters: [Enabled]
 */
@interface AWSFsxCompletionReport : AWSModel


/**
 <p>Set <code>Enabled</code> to <code>True</code> to generate a <code>CompletionReport</code> when the task completes. If set to <code>true</code>, then you need to provide a report <code>Scope</code>, <code>Path</code>, and <code>Format</code>. Set <code>Enabled</code> to <code>False</code> if you do not want a <code>CompletionReport</code> generated when the task completes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>Required if <code>Enabled</code> is set to <code>true</code>. Specifies the format of the <code>CompletionReport</code>. <code>REPORT_CSV_20191124</code> is the only format currently supported. When <code>Format</code> is set to <code>REPORT_CSV_20191124</code>, the <code>CompletionReport</code> is provided in CSV format, and is delivered to <code>{path}/task-{id}/failures.csv</code>. </p>
 */
@property (nonatomic, assign) AWSFsxReportFormat format;

/**
 <p>Required if <code>Enabled</code> is set to <code>true</code>. Specifies the location of the report on the file system's linked S3 data repository. An absolute path that defines where the completion report will be stored in the destination location. The <code>Path</code> you provide must be located within the file system’s ExportPath. An example <code>Path</code> value is "s3://myBucket/myExportPath/optionalPrefix". The report provides the following information for each file in the report: FilePath, FileStatus, and ErrorCode. To learn more about a file system's <code>ExportPath</code>, see . </p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>Required if <code>Enabled</code> is set to <code>true</code>. Specifies the scope of the <code>CompletionReport</code>; <code>FAILED_FILES_ONLY</code> is the only scope currently supported. When <code>Scope</code> is set to <code>FAILED_FILES_ONLY</code>, the <code>CompletionReport</code> only contains information about files that the data repository task failed to process.</p>
 */
@property (nonatomic, assign) AWSFsxReportScope scope;

@end

/**
 <p>The request object for the <code>CreateBackup</code> operation.</p>
 Required parameters: [FileSystemId]
 */
@interface AWSFsxCreateBackupRequest : AWSRequest


/**
 <p>(Optional) A string of up to 64 ASCII characters that Amazon FSx uses to ensure idempotent creation. This string is automatically filled on your behalf when you use the AWS Command Line Interface (AWS CLI) or an AWS SDK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The ID of the file system to back up.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>The tags to apply to the backup at backup creation. The key value of the <code>Name</code> tag appears in the console as the backup name.</p>
 */
@property (nonatomic, strong) NSArray<AWSFsxTag *> * _Nullable tags;

@end

/**
 <p>The response object for the <code>CreateBackup</code> operation.</p>
 */
@interface AWSFsxCreateBackupResponse : AWSModel


/**
 <p>A description of the backup.</p>
 */
@property (nonatomic, strong) AWSFsxBackup * _Nullable backup;

@end

/**
 
 */
@interface AWSFsxCreateDataRepositoryTaskRequest : AWSRequest


/**
 <p>(Optional) An idempotency token for resource creation, in a string of up to 64 ASCII characters. This token is automatically filled on your behalf when you use the AWS Command Line Interface (AWS CLI) or an AWS SDK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The globally unique ID of the file system, assigned by Amazon FSx.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>(Optional) The path or paths on the Amazon FSx file system to use when the data repository task is processed. The default path is the file system root directory. The paths you provide need to be relative to the mount point of the file system. If the mount point is <code>/mnt/fsx</code> and <code>/mnt/fsx/path1</code> is a directory or file on the file system you want to export, then the path to provide is <code>path1</code>. If a path that you provide isn't valid, the task fails.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable paths;

/**
 <p>Defines whether or not Amazon FSx provides a CompletionReport once the task has completed. A CompletionReport provides a detailed report on the files that Amazon FSx processed that meet the criteria specified by the <code>Scope</code> parameter. For more information, see <a href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/task-completion-report.html">Working with Task Completion Reports</a>.</p>
 */
@property (nonatomic, strong) AWSFsxCompletionReport * _Nullable report;

/**
 <p>A list of <code>Tag</code> values, with a maximum of 50 elements.</p>
 */
@property (nonatomic, strong) NSArray<AWSFsxTag *> * _Nullable tags;

/**
 <p>Specifies the type of data repository task to create.</p>
 */
@property (nonatomic, assign) AWSFsxDataRepositoryTaskType types;

@end

/**
 
 */
@interface AWSFsxCreateDataRepositoryTaskResponse : AWSModel


/**
 <p>The description of the data repository task that you just created.</p>
 */
@property (nonatomic, strong) AWSFsxDataRepositoryTask * _Nullable dataRepositoryTask;

@end

/**
 <p>The request object for the <code>CreateFileSystemFromBackup</code> operation.</p>
 Required parameters: [BackupId, SubnetIds]
 */
@interface AWSFsxCreateFileSystemFromBackupRequest : AWSRequest


/**
 <p>The ID of the backup. Specifies the backup to use if you're creating a file system from an existing backup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupId;

/**
 <p>(Optional) A string of up to 64 ASCII characters that Amazon FSx uses to ensure idempotent creation. This string is automatically filled on your behalf when you use the AWS Command Line Interface (AWS CLI) or an AWS SDK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>A list of IDs for the security groups that apply to the specified network interfaces created for file system access. These security groups apply to all network interfaces. This value isn't returned in later DescribeFileSystem requests.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>Sets the storage type for the Windows file system you're creating from a backup. Valid values are <code>SSD</code> and <code>HDD</code>.</p><ul><li><p>Set to <code>SSD</code> to use solid state drive storage. Supported on all Windows deployment types.</p></li><li><p>Set to <code>HDD</code> to use hard disk drive storage. Supported on <code>SINGLE_AZ_2</code> and <code>MULTI_AZ_1</code> Windows file system deployment types. </p></li></ul><p> Default value is <code>SSD</code>. </p><note><p>HDD and SSD storage types have different minimum storage capacity requirements. A restored file system's storage capacity is tied to the file system that was backed up. You can create a file system that uses HDD storage from a backup of a file system that used SSD storage only if the original SSD file system had a storage capacity of at least 2000 GiB. </p></note>
 */
@property (nonatomic, assign) AWSFsxStorageType storageType;

/**
 <p>Specifies the IDs of the subnets that the file system will be accessible from. For Windows <code>MULTI_AZ_1</code> file system deployment types, provide exactly two subnet IDs, one for the preferred file server and one for the standby file server. You specify one of these subnets as the preferred subnet using the <code>WindowsConfiguration &gt; PreferredSubnetID</code> property.</p><p>For Windows <code>SINGLE_AZ_1</code> and <code>SINGLE_AZ_2</code> deployment types and Lustre file systems, provide exactly one subnet ID. The file server is launched in that subnet's Availability Zone.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>The tags to be applied to the file system at file system creation. The key value of the <code>Name</code> tag appears in the console as the file system name.</p>
 */
@property (nonatomic, strong) NSArray<AWSFsxTag *> * _Nullable tags;

/**
 <p>The configuration for this Microsoft Windows file system.</p>
 */
@property (nonatomic, strong) AWSFsxCreateFileSystemWindowsConfiguration * _Nullable windowsConfiguration;

@end

/**
 <p>The response object for the <code>CreateFileSystemFromBackup</code> operation.</p>
 */
@interface AWSFsxCreateFileSystemFromBackupResponse : AWSModel


/**
 <p>A description of the file system.</p>
 */
@property (nonatomic, strong) AWSFsxFileSystem * _Nullable fileSystem;

@end

/**
 <p>The Lustre configuration for the file system being created. </p>
 */
@interface AWSFsxCreateFileSystemLustreConfiguration : AWSModel


/**
 <p>(Optional) Choose <code>SCRATCH_1</code> and <code>SCRATCH_2</code> deployment types when you need temporary storage and shorter-term processing of data. The <code>SCRATCH_2</code> deployment type provides in-transit encryption of data and higher burst throughput capacity than <code>SCRATCH_1</code>.</p><p>Choose <code>PERSISTENT_1</code> deployment type for longer-term storage and workloads and encryption of data in transit. To learn more about deployment types, see <a href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/lustre-deployment-types.html"> FSx for Lustre Deployment Options</a>.</p><p>Encryption of data in-transit is automatically enabled when you access a <code>SCRATCH_2</code> or <code>PERSISTENT_1</code> file system from Amazon EC2 instances that <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/data- protection.html">support this feature</a>. (Default = <code>SCRATCH_1</code>) </p><p>Encryption of data in-transit for <code>SCRATCH_2</code> and <code>PERSISTENT_1</code> deployment types is supported when accessed from supported instance types in supported AWS Regions. To learn more, <a href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/encryption-in-transit-fsxl.html">Encrypting Data in Transit</a>.</p>
 */
@property (nonatomic, assign) AWSFsxLustreDeploymentType deploymentType;

/**
 <p>(Optional) The path in Amazon S3 where the root of your Amazon FSx file system is exported. The path must use the same Amazon S3 bucket as specified in ImportPath. You can provide an optional prefix to which new and changed data is to be exported from your Amazon FSx for Lustre file system. If an <code>ExportPath</code> value is not provided, Amazon FSx sets a default export path, <code>s3://import-bucket/FSxLustre[creation-timestamp]</code>. The timestamp is in UTC format, for example <code>s3://import-bucket/FSxLustre20181105T222312Z</code>.</p><p>The Amazon S3 export bucket must be the same as the import bucket specified by <code>ImportPath</code>. If you only specify a bucket name, such as <code>s3://import-bucket</code>, you get a 1:1 mapping of file system objects to S3 bucket objects. This mapping means that the input data in S3 is overwritten on export. If you provide a custom prefix in the export path, such as <code>s3://import-bucket/[custom-optional-prefix]</code>, Amazon FSx exports the contents of your file system to that export prefix in the Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exportPath;

/**
 <p>(Optional) The path to the Amazon S3 bucket (including the optional prefix) that you're using as the data repository for your Amazon FSx for Lustre file system. The root of your FSx for Lustre file system will be mapped to the root of the Amazon S3 bucket you select. An example is <code>s3://import-bucket/optional-prefix</code>. If you specify a prefix after the Amazon S3 bucket name, only object keys with that prefix are loaded into the file system.</p>
 */
@property (nonatomic, strong) NSString * _Nullable importPath;

/**
 <p>(Optional) For files imported from a data repository, this value determines the stripe count and maximum amount of data per file (in MiB) stored on a single physical disk. The maximum number of disks that a single file can be striped across is limited by the total number of disks that make up the file system.</p><p>The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000 MiB (500 GiB). Amazon S3 objects have a maximum size of 5 TB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable importedFileChunkSize;

/**
 <p> Required for the <code>PERSISTENT_1</code> deployment type, describes the amount of read and write throughput for each 1 tebibyte of storage, in MB/s/TiB. File system throughput capacity is calculated by multiplying ﬁle system storage capacity (TiB) by the PerUnitStorageThroughput (MB/s/TiB). For a 2.4 TiB ﬁle system, provisioning 50 MB/s/TiB of PerUnitStorageThroughput yields 117 MB/s of ﬁle system throughput. You pay for the amount of throughput that you provision. </p><p>Valid values are 50, 100, 200.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable perUnitStorageThroughput;

/**
 <p>The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time zone, where d is the weekday number, from 1 through 7, beginning with Monday and ending with Sunday.</p>
 */
@property (nonatomic, strong) NSString * _Nullable weeklyMaintenanceStartTime;

@end

/**
 <p>The request object used to create a new Amazon FSx file system.</p>
 Required parameters: [FileSystemType, StorageCapacity, SubnetIds]
 */
@interface AWSFsxCreateFileSystemRequest : AWSRequest


/**
 <p>(Optional) A string of up to 64 ASCII characters that Amazon FSx uses to ensure idempotent creation. This string is automatically filled on your behalf when you use the AWS Command Line Interface (AWS CLI) or an AWS SDK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The type of Amazon FSx file system to create, either <code>WINDOWS</code> or <code>LUSTRE</code>.</p>
 */
@property (nonatomic, assign) AWSFsxFileSystemType fileSystemType;

/**
 <p>The ID of the AWS Key Management Service (AWS KMS) key used to encrypt the file system's data for Amazon FSx for Windows File Server file systems and Amazon FSx for Lustre <code>PERSISTENT_1</code> file systems at rest. In either case, if not specified, the Amazon FSx managed key is used. The Amazon FSx for Lustre <code>SCRATCH_1</code> and <code>SCRATCH_2</code> file systems are always encrypted at rest using Amazon FSx managed keys. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/APIReference/API_Encrypt.html">Encrypt</a> in the <i>AWS Key Management Service API Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The Lustre configuration for the file system being created. </p>
 */
@property (nonatomic, strong) AWSFsxCreateFileSystemLustreConfiguration * _Nullable lustreConfiguration;

/**
 <p>A list of IDs specifying the security groups to apply to all network interfaces created for file system access. This list isn't returned in later requests to describe the file system.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>Sets the storage capacity of the file system that you're creating.</p><p>For Lustre file systems:</p><ul><li><p>For <code>SCRATCH_2</code> and <code>PERSISTENT_1</code> deployment types, valid values are 1.2, 2.4, and increments of 2.4 TiB.</p></li><li><p>For <code>SCRATCH_1</code> deployment type, valid values are 1.2, 2.4, and increments of 3.6 TiB.</p></li></ul><p>For Windows file systems:</p><ul><li><p>If <code>StorageType=SSD</code>, valid values are 32 GiB - 65,536 GiB (64 TiB).</p></li><li><p>If <code>StorageType=HDD</code>, valid values are 2000 GiB - 65,536 GiB (64 TiB).</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable storageCapacity;

/**
 <p>Sets the storage type for the Amazon FSx for Windows file system you're creating. Valid values are <code>SSD</code> and <code>HDD</code>.</p><ul><li><p>Set to <code>SSD</code> to use solid state drive storage. SSD is supported on all Windows deployment types.</p></li><li><p>Set to <code>HDD</code> to use hard disk drive storage. HDD is supported on <code>SINGLE_AZ_2</code> and <code>MULTI_AZ_1</code> Windows file system deployment types. </p></li></ul><p> Default value is <code>SSD</code>. For more information, see <a href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/optimize-fsx-costs.html#storage-type-options"> Storage Type Options</a> in the <i>Amazon FSx for Windows User Guide</i>. </p>
 */
@property (nonatomic, assign) AWSFsxStorageType storageType;

/**
 <p>Specifies the IDs of the subnets that the file system will be accessible from. For Windows <code>MULTI_AZ_1</code> file system deployment types, provide exactly two subnet IDs, one for the preferred file server and one for the standby file server. You specify one of these subnets as the preferred subnet using the <code>WindowsConfiguration &gt; PreferredSubnetID</code> property.</p><p>For Windows <code>SINGLE_AZ_1</code> and <code>SINGLE_AZ_2</code> file system deployment types and Lustre file systems, provide exactly one subnet ID. The file server is launched in that subnet's Availability Zone.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>The tags to apply to the file system being created. The key value of the <code>Name</code> tag appears in the console as the file system name.</p>
 */
@property (nonatomic, strong) NSArray<AWSFsxTag *> * _Nullable tags;

/**
 <p>The Microsoft Windows configuration for the file system being created. </p>
 */
@property (nonatomic, strong) AWSFsxCreateFileSystemWindowsConfiguration * _Nullable windowsConfiguration;

@end

/**
 <p>The response object returned after the file system is created.</p>
 */
@interface AWSFsxCreateFileSystemResponse : AWSModel


/**
 <p>The configuration of the file system that was created.</p>
 */
@property (nonatomic, strong) AWSFsxFileSystem * _Nullable fileSystem;

@end

/**
 <p>The configuration object for the Microsoft Windows file system used in <code>CreateFileSystem</code> and <code>CreateFileSystemFromBackup</code> operations.</p>
 Required parameters: [ThroughputCapacity]
 */
@interface AWSFsxCreateFileSystemWindowsConfiguration : AWSModel


/**
 <p>The ID for an existing AWS Managed Microsoft Active Directory (AD) instance that the file system should join when it's created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable activeDirectoryId;

/**
 <p>The number of days to retain automatic backups. The default is to retain backups for 7 days. Setting this value to 0 disables the creation of automatic backups. The maximum retention period for backups is 35 days.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable automaticBackupRetentionDays;

/**
 <p>A boolean flag indicating whether tags for the file system should be copied to backups. This value defaults to false. If it's set to true, all tags for the file system are copied to all automatic and user-initiated backups where the user doesn't specify tags. If this value is true, and you specify one or more tags, only the specified tags are copied to backups. If you specify one or more tags when creating a user-initiated backup, no tags are copied from the file system, regardless of this value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicateTagsToBackups;

/**
 <p>The preferred time to take daily automatic backups, formatted HH:MM in the UTC time zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dailyAutomaticBackupStartTime;

/**
 <p>Specifies the file system deployment type, valid values are the following:</p><ul><li><p><code>MULTI_AZ_1</code> - Deploys a high availability file system that is configured for Multi-AZ redundancy to tolerate temporary Availability Zone (AZ) unavailability. You can only deploy a Multi-AZ file system in AWS Regions that have a minimum of three Availability Zones. Also supports HDD storage type</p></li><li><p><code>SINGLE_AZ_1</code> - (Default) Choose to deploy a file system that is configured for single AZ redundancy.</p></li><li><p><code>SINGLE_AZ_2</code> - The latest generation Single AZ file system. Specifies a file system that is configured for single AZ redundancy and supports HDD storage type.</p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/high-availability-multiAZ.html"> Availability and Durability: Single-AZ and Multi-AZ File Systems</a>.</p>
 */
@property (nonatomic, assign) AWSFsxWindowsDeploymentType deploymentType;

/**
 <p>Required when <code>DeploymentType</code> is set to <code>MULTI_AZ_1</code>. This specifies the subnet in which you want the preferred file server to be located. For in-AWS applications, we recommend that you launch your clients in the same Availability Zone (AZ) as your preferred file server to reduce cross-AZ data transfer costs and minimize latency. </p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredSubnetId;

/**
 <p>The configuration that Amazon FSx uses to join the Windows File Server instance to your self-managed (including on-premises) Microsoft Active Directory (AD) directory.</p>
 */
@property (nonatomic, strong) AWSFsxSelfManagedActiveDirectoryConfiguration * _Nullable selfManagedActiveDirectoryConfiguration;

/**
 <p>The throughput of an Amazon FSx file system, measured in megabytes per second, in 2 to the <i>n</i>th increments, between 2^3 (8) and 2^11 (2048).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable throughputCapacity;

/**
 <p>The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time zone, where d is the weekday number, from 1 through 7, beginning with Monday and ending with Sunday.</p>
 */
@property (nonatomic, strong) NSString * _Nullable weeklyMaintenanceStartTime;

@end

/**
 <p>The data repository configuration object for Lustre file systems returned in the response of the <code>CreateFileSystem</code> operation.</p>
 */
@interface AWSFsxDataRepositoryConfiguration : AWSModel


/**
 <p>The export path to the Amazon S3 bucket (and prefix) that you are using to store new and changed Lustre file system files in S3.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exportPath;

/**
 <p>The import path to the Amazon S3 bucket (and optional prefix) that you're using as the data repository for your FSx for Lustre file system, for example <code>s3://import-bucket/optional-prefix</code>. If a prefix is specified after the Amazon S3 bucket name, only object keys with that prefix are loaded into the file system.</p>
 */
@property (nonatomic, strong) NSString * _Nullable importPath;

/**
 <p>For files imported from a data repository, this value determines the stripe count and maximum amount of data per file (in MiB) stored on a single physical disk. The maximum number of disks that a single file can be striped across is limited by the total number of disks that make up the file system.</p><p>The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000 MiB (500 GiB). Amazon S3 objects have a maximum size of 5 TB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable importedFileChunkSize;

@end

/**
 <p>A description of the data repository task. You use data repository tasks to perform bulk transfer operations between your Amazon FSx file system and its linked data repository.</p>
 Required parameters: [TaskId, Lifecycle, Type, CreationTime, FileSystemId]
 */
@interface AWSFsxDataRepositoryTask : AWSModel


/**
 <p>The time that the resource was created, in seconds (since 1970-01-01T00:00:00Z), also known as Unix time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The time that Amazon FSx completed processing the task, populated after the task is complete.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>Failure message describing why the task failed, it is populated only when <code>Lifecycle</code> is set to <code>FAILED</code>.</p>
 */
@property (nonatomic, strong) AWSFsxDataRepositoryTaskFailureDetails * _Nullable failureDetails;

/**
 <p>The globally unique ID of the file system, assigned by Amazon FSx.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>The lifecycle status of the data repository task, as follows:</p><ul><li><p><code>PENDING</code> - Amazon FSx has not started the task.</p></li><li><p><code>EXECUTING</code> - Amazon FSx is processing the task.</p></li><li><p><code>FAILED</code> - Amazon FSx was not able to complete the task. For example, there may be files the task failed to process. The <a>DataRepositoryTaskFailureDetails</a> property provides more information about task failures.</p></li><li><p><code>SUCCEEDED</code> - FSx completed the task successfully.</p></li><li><p><code>CANCELED</code> - Amazon FSx canceled the task and it did not complete.</p></li><li><p><code>CANCELING</code> - FSx is in process of canceling the task.</p></li></ul><note><p>You cannot delete an FSx for Lustre file system if there are data repository tasks for the file system in the <code>PENDING</code> or <code>EXECUTING</code> states. Please retry when the data repository task is finished (with a status of <code>CANCELED</code>, <code>SUCCEEDED</code>, or <code>FAILED</code>). You can use the DescribeDataRepositoryTask action to monitor the task status. Contact the FSx team if you need to delete your file system immediately.</p></note>
 */
@property (nonatomic, assign) AWSFsxDataRepositoryTaskLifecycle lifecycle;

/**
 <p>An array of paths on the Amazon FSx for Lustre file system that specify the data for the data repository task to process. For example, in an EXPORT_TO_REPOSITORY task, the paths specify which data to export to the linked data repository.</p><p>(Default) If <code>Paths</code> is not specified, Amazon FSx uses the file system root directory.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable paths;

/**
 <p>Provides a report detailing the data repository task results of the files processed that match the criteria specified in the report <code>Scope</code> parameter. FSx delivers the report to the file system's linked data repository in Amazon S3, using the path specified in the report <code>Path</code> parameter. You can specify whether or not a report gets generated for a task using the <code>Enabled</code> parameter.</p>
 */
@property (nonatomic, strong) AWSFsxCompletionReport * _Nullable report;

/**
 <p>The Amazon Resource Name (ARN) for a given resource. ARNs uniquely identify AWS resources. We require an ARN when you need to specify a resource unambiguously across all of AWS. For more information, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p>The time that Amazon FSx began processing the task.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>Provides the status of the number of files that the task has processed successfully and failed to process.</p>
 */
@property (nonatomic, strong) AWSFsxDataRepositoryTaskStatus * _Nullable status;

/**
 <p>A list of <code>Tag</code> values, with a maximum of 50 elements.</p>
 */
@property (nonatomic, strong) NSArray<AWSFsxTag *> * _Nullable tags;

/**
 <p>The system-generated, unique 17-digit ID of the data repository task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

/**
 <p>The type of data repository task; EXPORT_TO_REPOSITORY is the only type currently supported.</p>
 */
@property (nonatomic, assign) AWSFsxDataRepositoryTaskType types;

@end

/**
 <p>Provides information about why a data repository task failed. Only populated when the task <code>Lifecycle</code> is set to <code>FAILED</code>.</p>
 */
@interface AWSFsxDataRepositoryTaskFailureDetails : AWSModel


/**
 <p>A detailed error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>(Optional) An array of filter objects you can use to filter the response of data repository tasks you will see in the the response. You can filter the tasks returned in the response by one or more file system IDs, task lifecycles, and by task type. A filter object consists of a filter <code>Name</code>, and one or more <code>Values</code> for the filter.</p>
 */
@interface AWSFsxDataRepositoryTaskFilter : AWSModel


/**
 <p>Name of the task property to use in filtering the tasks returned in the response.</p><ul><li><p>Use <code>file-system-id</code> to retrieve data repository tasks for specific file systems.</p></li><li><p>Use <code>task-lifecycle</code> to retrieve data repository tasks with one or more specific lifecycle states, as follows: CANCELED, EXECUTING, FAILED, PENDING, and SUCCEEDED.</p></li></ul>
 */
@property (nonatomic, assign) AWSFsxDataRepositoryTaskFilterName name;

/**
 <p>Use Values to include the specific file system IDs and task lifecycle states for the filters you are using.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Provides the task status showing a running total of the total number of files to be processed, the number successfully processed, and the number of files the task failed to process.</p>
 */
@interface AWSFsxDataRepositoryTaskStatus : AWSModel


/**
 <p>A running total of the number of files that the task failed to process.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failedCount;

/**
 <p>The time at which the task status was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>A running total of the number of files that the task has successfully processed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable succeededCount;

/**
 <p>The total number of files that the task will process. While a task is executing, the sum of <code>SucceededCount</code> plus <code>FailedCount</code> may not equal <code>TotalCount</code>. When the task is complete, <code>TotalCount</code> equals the sum of <code>SucceededCount</code> plus <code>FailedCount</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalCount;

@end

/**
 <p>The request object for <code>DeleteBackup</code> operation.</p>
 Required parameters: [BackupId]
 */
@interface AWSFsxDeleteBackupRequest : AWSRequest


/**
 <p>The ID of the backup you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupId;

/**
 <p>(Optional) A string of up to 64 ASCII characters that Amazon FSx uses to ensure idempotent deletion. This is automatically filled on your behalf when using the AWS CLI or SDK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

@end

/**
 <p>The response object for <code>DeleteBackup</code> operation.</p>
 */
@interface AWSFsxDeleteBackupResponse : AWSModel


/**
 <p>The ID of the backup deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupId;

/**
 <p>The lifecycle of the backup. Should be <code>DELETED</code>.</p>
 */
@property (nonatomic, assign) AWSFsxBackupLifecycle lifecycle;

@end

/**
 <p>The request object for <code>DeleteFileSystem</code> operation.</p>
 Required parameters: [FileSystemId]
 */
@interface AWSFsxDeleteFileSystemRequest : AWSRequest


/**
 <p>(Optional) A string of up to 64 ASCII characters that Amazon FSx uses to ensure idempotent deletion. This is automatically filled on your behalf when using the AWS CLI or SDK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The ID of the file system you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>The configuration object for the Microsoft Windows file system used in the <code>DeleteFileSystem</code> operation.</p>
 */
@property (nonatomic, strong) AWSFsxDeleteFileSystemWindowsConfiguration * _Nullable windowsConfiguration;

@end

/**
 <p>The response object for the <code>DeleteFileSystem</code> operation.</p>
 */
@interface AWSFsxDeleteFileSystemResponse : AWSModel


/**
 <p>The ID of the file system being deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>The file system lifecycle for the deletion request. Should be <code>DELETING</code>.</p>
 */
@property (nonatomic, assign) AWSFsxFileSystemLifecycle lifecycle;

/**
 <p>The response object for the Microsoft Windows file system used in the <code>DeleteFileSystem</code> operation.</p>
 */
@property (nonatomic, strong) AWSFsxDeleteFileSystemWindowsResponse * _Nullable windowsResponse;

@end

/**
 <p>The configuration object for the Microsoft Windows file system used in the <code>DeleteFileSystem</code> operation.</p>
 */
@interface AWSFsxDeleteFileSystemWindowsConfiguration : AWSModel


/**
 <p>A set of tags for your final backup.</p>
 */
@property (nonatomic, strong) NSArray<AWSFsxTag *> * _Nullable finalBackupTags;

/**
 <p>By default, Amazon FSx for Windows takes a final backup on your behalf when the <code>DeleteFileSystem</code> operation is invoked. Doing this helps protect you from data loss, and we highly recommend taking the final backup. If you want to skip this backup, use this flag to do so.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable skipFinalBackup;

@end

/**
 <p>The response object for the Microsoft Windows file system used in the <code>DeleteFileSystem</code> operation.</p>
 */
@interface AWSFsxDeleteFileSystemWindowsResponse : AWSModel


/**
 <p>The ID of the final backup for this file system.</p>
 */
@property (nonatomic, strong) NSString * _Nullable finalBackupId;

/**
 <p>The set of tags applied to the final backup.</p>
 */
@property (nonatomic, strong) NSArray<AWSFsxTag *> * _Nullable finalBackupTags;

@end

/**
 <p>The request object for <code>DescribeBackups</code> operation.</p>
 */
@interface AWSFsxDescribeBackupsRequest : AWSRequest


/**
 <p>(Optional) IDs of the backups you want to retrieve (String). This overrides any filters. If any IDs are not found, BackupNotFound will be thrown.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable backupIds;

/**
 <p>(Optional) Filters structure. Supported names are file-system-id and backup-type.</p>
 */
@property (nonatomic, strong) NSArray<AWSFsxFilter *> * _Nullable filters;

/**
 <p>(Optional) Maximum number of backups to return in the response (integer). This parameter value must be greater than 0. The number of items that Amazon FSx returns is the minimum of the <code>MaxResults</code> parameter specified in the request and the service's internal maximum number of items per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>(Optional) Opaque pagination token returned from a previous <code>DescribeBackups</code> operation (String). If a token present, the action continues the list from where the returning call left off.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Response object for <code>DescribeBackups</code> operation.</p>
 */
@interface AWSFsxDescribeBackupsResponse : AWSModel


/**
 <p>Any array of backups.</p>
 */
@property (nonatomic, strong) NSArray<AWSFsxBackup *> * _Nullable backups;

/**
 <p>This is present if there are more backups than returned in the response (String). You can use the <code>NextToken</code> value in the later request to fetch the backups. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSFsxDescribeDataRepositoryTasksRequest : AWSRequest


/**
 <p>(Optional) You can use filters to narrow the <code>DescribeDataRepositoryTasks</code> response to include just tasks for specific file systems, or tasks in a specific lifecycle state.</p>
 */
@property (nonatomic, strong) NSArray<AWSFsxDataRepositoryTaskFilter *> * _Nullable filters;

/**
 <p>The maximum number of resources to return in the response. This value must be an integer greater than zero.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>(Optional) Opaque pagination token returned from a previous operation (String). If present, this token indicates from what point you can continue processing the request, where the previous <code>NextToken</code> value left off.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>(Optional) IDs of the tasks whose descriptions you want to retrieve (String).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable taskIds;

@end

/**
 
 */
@interface AWSFsxDescribeDataRepositoryTasksResponse : AWSModel


/**
 <p>The collection of data repository task descriptions returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSFsxDataRepositoryTask *> * _Nullable dataRepositoryTasks;

/**
 <p>(Optional) Opaque pagination token returned from a previous operation (String). If present, this token indicates from what point you can continue processing the request, where the previous <code>NextToken</code> value left off.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>The request object for <code>DescribeFileSystems</code> operation.</p>
 */
@interface AWSFsxDescribeFileSystemsRequest : AWSRequest


/**
 <p>(Optional) IDs of the file systems whose descriptions you want to retrieve (String).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable fileSystemIds;

/**
 <p>(Optional) Maximum number of file systems to return in the response (integer). This parameter value must be greater than 0. The number of items that Amazon FSx returns is the minimum of the <code>MaxResults</code> parameter specified in the request and the service's internal maximum number of items per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>(Optional) Opaque pagination token returned from a previous <code>DescribeFileSystems</code> operation (String). If a token present, the action continues the list from where the returning call left off.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>The response object for <code>DescribeFileSystems</code> operation.</p>
 */
@interface AWSFsxDescribeFileSystemsResponse : AWSModel


/**
 <p>An array of file system descriptions.</p>
 */
@property (nonatomic, strong) NSArray<AWSFsxFileSystem *> * _Nullable fileSystems;

/**
 <p>Present if there are more file systems than returned in the response (String). You can use the <code>NextToken</code> value in the later request to fetch the descriptions. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>A description of a specific Amazon FSx file system.</p>
 */
@interface AWSFsxFileSystem : AWSModel


/**
 <p>A list of administrative actions for the file system that are in process or waiting to be processed. Administrative actions describe changes to the Windows file system that you have initiated using the <code>UpdateFileSystem</code> action. </p>
 */
@property (nonatomic, strong) NSArray<AWSFsxAdministrativeAction *> * _Nullable administrativeActions;

/**
 <p>The time that the file system was created, in seconds (since 1970-01-01T00:00:00Z), also known as Unix time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The DNS name for the file system.</p>
 */
@property (nonatomic, strong) NSString * _Nullable DNSName;

/**
 <p>A structure providing details of any failures that occur when creating the file system has failed.</p>
 */
@property (nonatomic, strong) AWSFsxFileSystemFailureDetails * _Nullable failureDetails;

/**
 <p>The system-generated, unique 17-digit ID of the file system.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>The type of Amazon FSx file system, either <code>LUSTRE</code> or <code>WINDOWS</code>.</p>
 */
@property (nonatomic, assign) AWSFsxFileSystemType fileSystemType;

/**
 <p>The ID of the AWS Key Management Service (AWS KMS) key used to encrypt the file system's data for Amazon FSx for Windows File Server file systems and persistent Amazon FSx for Lustre file systems at rest. In either case, if not specified, the Amazon FSx managed key is used. The scratch Amazon FSx for Lustre file systems are always encrypted at rest using Amazon FSx managed keys. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/APIReference/API_Encrypt.html">Encrypt</a> in the <i>AWS Key Management Service API Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The lifecycle status of the file system, following are the possible values and what they mean:</p><ul><li><p><code>AVAILABLE</code> - The file system is in a healthy state, and is reachable and available for use.</p></li><li><p><code>CREATING</code> - Amazon FSx is creating the new file system.</p></li><li><p><code>DELETING</code> - Amazon FSx is deleting an existing file system.</p></li><li><p><code>FAILED</code> - An existing file system has experienced an unrecoverable failure. When creating a new file system, Amazon FSx was unable to create the file system.</p></li><li><p><code>MISCONFIGURED</code> indicates that the file system is in a failed but recoverable state.</p></li><li><p><code>UPDATING</code> indicates that the file system is undergoing a customer initiated update.</p></li></ul>
 */
@property (nonatomic, assign) AWSFsxFileSystemLifecycle lifecycle;

/**
 <p>The configuration for the Amazon FSx for Lustre file system.</p>
 */
@property (nonatomic, strong) AWSFsxLustreFileSystemConfiguration * _Nullable lustreConfiguration;

/**
 <p>The IDs of the elastic network interface from which a specific file system is accessible. The elastic network interface is automatically created in the same VPC that the Amazon FSx file system was created in. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html">Elastic Network Interfaces</a> in the <i>Amazon EC2 User Guide.</i></p><p>For an Amazon FSx for Windows File Server file system, you can have one network interface ID. For an Amazon FSx for Lustre file system, you can have more than one.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable networkInterfaceIds;

/**
 <p>The AWS account that created the file system. If the file system was created by an AWS Identity and Access Management (IAM) user, the AWS account to which the IAM user belongs is the owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerId;

/**
 <p>The Amazon Resource Name (ARN) for the file system resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p>The storage capacity of the file system in gigabytes (GB).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable storageCapacity;

/**
 <p>The storage type of the file system. Valid values are <code>SSD</code> and <code>HDD</code>. If set to <code>SSD</code>, the file system uses solid state drive storage. If set to <code>HDD</code>, the file system uses hard disk drive storage. </p>
 */
@property (nonatomic, assign) AWSFsxStorageType storageType;

/**
 <p>Specifies the IDs of the subnets that the file system is accessible from. For Windows <code>MULTI_AZ_1</code> file system deployment type, there are two subnet IDs, one for the preferred file server and one for the standby file server. The preferred file server subnet identified in the <code>PreferredSubnetID</code> property. All other file systems have only one subnet ID.</p><p>For Lustre file systems, and Single-AZ Windows file systems, this is the ID of the subnet that contains the endpoint for the file system. For <code>MULTI_AZ_1</code> Windows file systems, the endpoint for the file system is available in the <code>PreferredSubnetID</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>The tags to associate with the file system. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">Tagging Your Amazon EC2 Resources</a> in the <i>Amazon EC2 User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSFsxTag *> * _Nullable tags;

/**
 <p>The ID of the primary VPC for the file system.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

/**
 <p>The configuration for this Microsoft Windows file system.</p>
 */
@property (nonatomic, strong) AWSFsxWindowsFileSystemConfiguration * _Nullable windowsConfiguration;

@end

/**
 <p>A structure providing details of any failures that occur when creating the file system has failed.</p>
 */
@interface AWSFsxFileSystemFailureDetails : AWSModel


/**
 <p>A message describing any failures that occurred during file system creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>A filter used to restrict the results of describe calls. You can use multiple filters to return results that meet all applied filter requirements.</p>
 */
@interface AWSFsxFilter : AWSModel


/**
 <p>The name for this filter.</p>
 */
@property (nonatomic, assign) AWSFsxFilterName name;

/**
 <p>The values of the filter. These are all the values for any of the applied filters.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>The request object for <code>ListTagsForResource</code> operation.</p>
 Required parameters: [ResourceARN]
 */
@interface AWSFsxListTagsForResourceRequest : AWSRequest


/**
 <p>(Optional) Maximum number of tags to return in the response (integer). This parameter value must be greater than 0. The number of items that Amazon FSx returns is the minimum of the <code>MaxResults</code> parameter specified in the request and the service's internal maximum number of items per page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>(Optional) Opaque pagination token returned from a previous <code>ListTagsForResource</code> operation (String). If a token present, the action continues the list from where the returning call left off.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ARN of the Amazon FSx resource that will have its tags listed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

@end

/**
 <p>The response object for <code>ListTagsForResource</code> operation.</p>
 */
@interface AWSFsxListTagsForResourceResponse : AWSModel


/**
 <p>This is present if there are more tags than returned in the response (String). You can use the <code>NextToken</code> value in the later request to fetch the tags. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of tags on the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSFsxTag *> * _Nullable tags;

@end

/**
 <p>The configuration for the Amazon FSx for Lustre file system.</p>
 */
@interface AWSFsxLustreFileSystemConfiguration : AWSModel


/**
 <p>The data repository configuration object for Lustre file systems returned in the response of the <code>CreateFileSystem</code> operation.</p>
 */
@property (nonatomic, strong) AWSFsxDataRepositoryConfiguration * _Nullable dataRepositoryConfiguration;

/**
 <p>The deployment type of the FSX for Lustre file system.</p>
 */
@property (nonatomic, assign) AWSFsxLustreDeploymentType deploymentType;

/**
 <p>You use the <code>MountName</code> value when mounting the file system.</p><p>For the <code>SCRATCH_1</code> deployment type, this value is always "<code>fsx</code>". For <code>SCRATCH_2</code> and <code>PERSISTENT_1</code> deployment types, this value is a string that is unique within an AWS Region. </p>
 */
@property (nonatomic, strong) NSString * _Nullable mountName;

/**
 <p> Per unit storage throughput represents the megabytes per second of read or write throughput per 1 tebibyte of storage provisioned. File system throughput capacity is equal to Storage capacity (TiB) * PerUnitStorageThroughput (MB/s/TiB). This option is only valid for <code>PERSISTENT_1</code> deployment types. Valid values are 50, 100, 200. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable perUnitStorageThroughput;

/**
 <p>The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time zone. d is the weekday number, from 1 through 7, beginning with Monday and ending with Sunday.</p>
 */
@property (nonatomic, strong) NSString * _Nullable weeklyMaintenanceStartTime;

@end

/**
 <p>The configuration of the self-managed Microsoft Active Directory (AD) directory to which the Windows File Server instance is joined.</p>
 */
@interface AWSFsxSelfManagedActiveDirectoryAttributes : AWSModel


/**
 <p>A list of up to two IP addresses of DNS servers or domain controllers in the self-managed AD directory.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable dnsIps;

/**
 <p>The fully qualified domain name of the self-managed AD directory.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The name of the domain group whose members have administrative privileges for the FSx file system.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemAdministratorsGroup;

/**
 <p>The fully qualified distinguished name of the organizational unit within the self-managed AD directory to which the Windows File Server instance is joined.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationalUnitDistinguishedName;

/**
 <p>The user name for the service account on your self-managed AD domain that FSx uses to join to your AD domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>The configuration that Amazon FSx uses to join the Windows File Server instance to your self-managed (including on-premises) Microsoft Active Directory (AD) directory.</p>
 Required parameters: [DomainName, UserName, Password, DnsIps]
 */
@interface AWSFsxSelfManagedActiveDirectoryConfiguration : AWSModel


/**
 <p>A list of up to two IP addresses of DNS servers or domain controllers in the self-managed AD directory. The IP addresses need to be either in the same VPC CIDR range as the one in which your Amazon FSx file system is being created, or in the private IP version 4 (IPv4) address ranges, as specified in <a href="http://www.faqs.org/rfcs/rfc1918.html">RFC 1918</a>:</p><ul><li><p>10.0.0.0 - 10.255.255.255 (10/8 prefix)</p></li><li><p>172.16.0.0 - 172.31.255.255 (172.16/12 prefix)</p></li><li><p>192.168.0.0 - 192.168.255.255 (192.168/16 prefix)</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable dnsIps;

/**
 <p>The fully qualified domain name of the self-managed AD directory, such as <code>corp.example.com</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>(Optional) The name of the domain group whose members are granted administrative privileges for the file system. Administrative privileges include taking ownership of files and folders, setting audit controls (audit ACLs) on files and folders, and administering the file system remotely by using the FSx Remote PowerShell. The group that you specify must already exist in your domain. If you don't provide one, your AD domain's Domain Admins group is used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemAdministratorsGroup;

/**
 <p>(Optional) The fully qualified distinguished name of the organizational unit within your self-managed AD directory that the Windows File Server instance will join. Amazon FSx only accepts OU as the direct parent of the file system. An example is <code>OU=FSx,DC=yourdomain,DC=corp,DC=com</code>. To learn more, see <a href="https://tools.ietf.org/html/rfc2253">RFC 2253</a>. If none is provided, the FSx file system is created in the default location of your self-managed AD directory. </p><important><p>Only Organizational Unit (OU) objects can be the direct parent of the file system that you're creating.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable organizationalUnitDistinguishedName;

/**
 <p>The password for the service account on your self-managed AD domain that Amazon FSx will use to join to your AD domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>The user name for the service account on your self-managed AD domain that Amazon FSx will use to join to your AD domain. This account must have the permission to join computers to the domain in the organizational unit provided in <code>OrganizationalUnitDistinguishedName</code>, or in the default location of your AD domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>The configuration that Amazon FSx uses to join the Windows File Server instance to a self-managed Microsoft Active Directory (AD) directory.</p>
 */
@interface AWSFsxSelfManagedActiveDirectoryConfigurationUpdates : AWSModel


/**
 <p>A list of up to two IP addresses of DNS servers or domain controllers in the self-managed AD directory.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable dnsIps;

/**
 <p>The password for the service account on your self-managed AD domain that Amazon FSx will use to join to your AD domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>The user name for the service account on your self-managed AD domain that Amazon FSx will use to join to your AD domain. This account must have the permission to join computers to the domain in the organizational unit provided in <code>OrganizationalUnitDistinguishedName</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Specifies a key-value pair for a resource tag.</p>
 */
@interface AWSFsxTag : AWSModel


/**
 <p>A value that specifies the <code>TagKey</code>, the name of the tag. Tag keys must be unique for the resource to which they are attached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>A value that specifies the <code>TagValue</code>, the value assigned to the corresponding tag key. Tag values can be null and don't have to be unique in a tag set. For example, you can have a key-value pair in a tag set of <code>finances : April</code> and also of <code>payroll : April</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>The request object for the <code>TagResource</code> operation.</p>
 Required parameters: [ResourceARN, Tags]
 */
@interface AWSFsxTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the Amazon FSx resource that you want to tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p>A list of tags for the resource. If a tag with a given key already exists, the value is replaced by the one specified in this parameter.</p>
 */
@property (nonatomic, strong) NSArray<AWSFsxTag *> * _Nullable tags;

@end

/**
 <p>The response object for the <code>TagResource</code> operation.</p>
 */
@interface AWSFsxTagResourceResponse : AWSModel


@end

/**
 <p>The request object for <code>UntagResource</code> action.</p>
 Required parameters: [ResourceARN, TagKeys]
 */
@interface AWSFsxUntagResourceRequest : AWSRequest


/**
 <p>The ARN of the Amazon FSx resource to untag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p>A list of keys of tags on the resource to untag. In case the tag key doesn't exist, the call will still succeed to be idempotent.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 <p>The response object for <code>UntagResource</code> action.</p>
 */
@interface AWSFsxUntagResourceResponse : AWSModel


@end

/**
 <p>The configuration object for Amazon FSx for Lustre file systems used in the <code>UpdateFileSystem</code> operation.</p>
 */
@interface AWSFsxUpdateFileSystemLustreConfiguration : AWSModel


/**
 <p>The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time zone. d is the weekday number, from 1 through 7, beginning with Monday and ending with Sunday.</p>
 */
@property (nonatomic, strong) NSString * _Nullable weeklyMaintenanceStartTime;

@end

/**
 <p>The request object for the <code>UpdateFileSystem</code> operation.</p>
 Required parameters: [FileSystemId]
 */
@interface AWSFsxUpdateFileSystemRequest : AWSRequest


/**
 <p>A string of up to 64 ASCII characters that Amazon FSx uses to ensure idempotent updates. This string is automatically filled on your behalf when you use the AWS Command Line Interface (AWS CLI) or an AWS SDK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>Identifies the file system that you are updating.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>The configuration object for Amazon FSx for Lustre file systems used in the <code>UpdateFileSystem</code> operation.</p>
 */
@property (nonatomic, strong) AWSFsxUpdateFileSystemLustreConfiguration * _Nullable lustreConfiguration;

/**
 <p>Use this parameter to increase the storage capacity of an Amazon FSx for Windows File Server file system. Specifies the storage capacity target value, GiB, for the file system you're updating. The storage capacity target value must be at least 10 percent (%) greater than the current storage capacity value. In order to increase storage capacity, the file system needs to have at least 16 MB/s of throughput capacity. You cannot make a storage capacity increase request if there is an existing storage capacity increase request in progress. For more information, see <a href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-storage-capacity.html">Managing Storage Capacity</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable storageCapacity;

/**
 <p>The configuration updates for an Amazon FSx for Windows File Server file system.</p>
 */
@property (nonatomic, strong) AWSFsxUpdateFileSystemWindowsConfiguration * _Nullable windowsConfiguration;

@end

/**
 <p>The response object for the <code>UpdateFileSystem</code> operation.</p>
 */
@interface AWSFsxUpdateFileSystemResponse : AWSModel


/**
 <p>A description of the file system that was updated.</p>
 */
@property (nonatomic, strong) AWSFsxFileSystem * _Nullable fileSystem;

@end

/**
 <p>Updates the configuration for an existing Amazon FSx for Windows File Server file system. Amazon FSx only overwrites existing properties with non-null values provided in the request.</p>
 */
@interface AWSFsxUpdateFileSystemWindowsConfiguration : AWSModel


/**
 <p>The number of days to retain automatic daily backups. Setting this to zero (0) disables automatic daily backups. You can retain automatic daily backups for a maximum of 35 days. For more information, see <a href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/using-backups.html#automatic-backups">Working with Automatic Daily Backups</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable automaticBackupRetentionDays;

/**
 <p>The preferred time to start the daily automatic backup, in the UTC time zone, for example, <code>02:00</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable dailyAutomaticBackupStartTime;

/**
 <p>The configuration Amazon FSx uses to join the Windows File Server instance to the self-managed Microsoft AD directory. You cannot make a self-managed Microsoft AD update request if there is an existing self-managed Microsoft AD update request in progress.</p>
 */
@property (nonatomic, strong) AWSFsxSelfManagedActiveDirectoryConfigurationUpdates * _Nullable selfManagedActiveDirectoryConfiguration;

/**
 <p>Sets the target value for a file system's throughput capacity, in MB/s, that you are updating the file system to. Valid values are 8, 16, 32, 64, 128, 256, 512, 1024, 2048. You cannot make a throughput capacity update request if there is an existing throughput capacity update request in progress. For more information, see <a href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-throughput-capacity.html">Managing Throughput Capacity</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable throughputCapacity;

/**
 <p>The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time zone. Where d is the weekday number, from 1 through 7, with 1 = Monday and 7 = Sunday.</p>
 */
@property (nonatomic, strong) NSString * _Nullable weeklyMaintenanceStartTime;

@end

/**
 <p>The configuration for this Microsoft Windows file system.</p>
 */
@interface AWSFsxWindowsFileSystemConfiguration : AWSModel


/**
 <p>The ID for an existing Microsoft Active Directory instance that the file system should join when it's created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable activeDirectoryId;

/**
 <p>The number of days to retain automatic backups. Setting this to 0 disables automatic backups. You can retain automatic backups for a maximum of 35 days.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable automaticBackupRetentionDays;

/**
 <p>A boolean flag indicating whether tags on the file system should be copied to backups. This value defaults to false. If it's set to true, all tags on the file system are copied to all automatic backups and any user-initiated backups where the user doesn't specify any tags. If this value is true, and you specify one or more tags, only the specified tags are copied to backups. If you specify one or more tags when creating a user-initiated backup, no tags are copied from the file system, regardless of this value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicateTagsToBackups;

/**
 <p>The preferred time to take daily automatic backups, in the UTC time zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dailyAutomaticBackupStartTime;

/**
 <p>Specifies the file system deployment type, valid values are the following:</p><ul><li><p><code>MULTI_AZ_1</code> - Specifies a high availability file system that is configured for Multi-AZ redundancy to tolerate temporary Availability Zone (AZ) unavailability, and supports SSD and HDD storage.</p></li><li><p><code>SINGLE_AZ_1</code> - (Default) Specifies a file system that is configured for single AZ redundancy, only supports SSD storage.</p></li><li><p><code>SINGLE_AZ_2</code> - Latest generation Single AZ file system. Specifies a file system that is configured for single AZ redundancy and supports SSD and HDD storage.</p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/high-availability-multiAZ.html">Single-AZ and Multi-AZ File Systems</a>.</p>
 */
@property (nonatomic, assign) AWSFsxWindowsDeploymentType deploymentType;

/**
 <p>The list of maintenance operations in progress for this file system.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable maintenanceOperationsInProgress;

/**
 <p>For <code>MULTI_AZ_1</code> deployment types, the IP address of the primary, or preferred, file server.</p><p>Use this IP address when mounting the file system on Linux SMB clients or Windows SMB clients that are not joined to a Microsoft Active Directory. Applicable for all Windows file system deployment types. This IP address is temporarily unavailable when the file system is undergoing maintenance. For Linux and Windows SMB clients that are joined to an Active Directory, use the file system's DNSName instead. For more information on mapping and mounting file shares, see <a href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/accessing-file-shares.html">Accessing File Shares</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredFileServerIp;

/**
 <p>For <code>MULTI_AZ_1</code> deployment types, it specifies the ID of the subnet where the preferred file server is located. Must be one of the two subnet IDs specified in <code>SubnetIds</code> property. Amazon FSx serves traffic from this subnet except in the event of a failover to the secondary file server.</p><p>For <code>SINGLE_AZ_1</code> and <code>SINGLE_AZ_2</code> deployment types, this value is the same as that for <code>SubnetIDs</code>. For more information, see <a href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/high-availability-multiAZ.html#single-multi-az-resources">Availability and Durability: Single-AZ and Multi-AZ File Systems</a></p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredSubnetId;

/**
 <p>For <code>MULTI_AZ_1</code> deployment types, use this endpoint when performing administrative tasks on the file system using Amazon FSx Remote PowerShell.</p><p>For <code>SINGLE_AZ_1</code> and <code>SINGLE_AZ_2</code> deployment types, this is the DNS name of the file system.</p><p>This endpoint is temporarily unavailable when the file system is undergoing maintenance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable remoteAdministrationEndpoint;

/**
 <p>The configuration of the self-managed Microsoft Active Directory (AD) directory to which the Windows File Server instance is joined.</p>
 */
@property (nonatomic, strong) AWSFsxSelfManagedActiveDirectoryAttributes * _Nullable selfManagedActiveDirectoryConfiguration;

/**
 <p>The throughput of an Amazon FSx file system, measured in megabytes per second.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable throughputCapacity;

/**
 <p>The preferred start time to perform weekly maintenance, formatted d:HH:MM in the UTC time zone. d is the weekday number, from 1 through 7, beginning with Monday and ending with Sunday.</p>
 */
@property (nonatomic, strong) NSString * _Nullable weeklyMaintenanceStartTime;

@end

NS_ASSUME_NONNULL_END
