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

FOUNDATION_EXPORT NSString *const AWSBackupErrorDomain;

typedef NS_ENUM(NSInteger, AWSBackupErrorType) {
    AWSBackupErrorUnknown,
    AWSBackupErrorAlreadyExists,
    AWSBackupErrorDependencyFailure,
    AWSBackupErrorInvalidParameterValue,
    AWSBackupErrorInvalidRequest,
    AWSBackupErrorLimitExceeded,
    AWSBackupErrorMissingParameterValue,
    AWSBackupErrorResourceNotFound,
    AWSBackupErrorServiceUnavailable,
};

typedef NS_ENUM(NSInteger, AWSBackupBackupJobState) {
    AWSBackupBackupJobStateUnknown,
    AWSBackupBackupJobStateCreated,
    AWSBackupBackupJobStatePending,
    AWSBackupBackupJobStateRunning,
    AWSBackupBackupJobStateAborting,
    AWSBackupBackupJobStateAborted,
    AWSBackupBackupJobStateCompleted,
    AWSBackupBackupJobStateFailed,
    AWSBackupBackupJobStateExpired,
};

typedef NS_ENUM(NSInteger, AWSBackupBackupVaultEvent) {
    AWSBackupBackupVaultEventUnknown,
    AWSBackupBackupVaultEventBackupJobStarted,
    AWSBackupBackupVaultEventBackupJobCompleted,
    AWSBackupBackupVaultEventBackupJobSuccessful,
    AWSBackupBackupVaultEventBackupJobFailed,
    AWSBackupBackupVaultEventBackupJobExpired,
    AWSBackupBackupVaultEventRestoreJobStarted,
    AWSBackupBackupVaultEventRestoreJobCompleted,
    AWSBackupBackupVaultEventRestoreJobSuccessful,
    AWSBackupBackupVaultEventRestoreJobFailed,
    AWSBackupBackupVaultEventCopyJobStarted,
    AWSBackupBackupVaultEventCopyJobSuccessful,
    AWSBackupBackupVaultEventCopyJobFailed,
    AWSBackupBackupVaultEventRecoveryPointModified,
    AWSBackupBackupVaultEventBackupPlanCreated,
    AWSBackupBackupVaultEventBackupPlanModified,
};

typedef NS_ENUM(NSInteger, AWSBackupConditionType) {
    AWSBackupConditionTypeUnknown,
    AWSBackupConditionTypeStringequals,
};

typedef NS_ENUM(NSInteger, AWSBackupReplicateJobState) {
    AWSBackupReplicateJobStateUnknown,
    AWSBackupReplicateJobStateCreated,
    AWSBackupReplicateJobStateRunning,
    AWSBackupReplicateJobStateCompleted,
    AWSBackupReplicateJobStateFailed,
};

typedef NS_ENUM(NSInteger, AWSBackupRecoveryPointStatus) {
    AWSBackupRecoveryPointStatusUnknown,
    AWSBackupRecoveryPointStatusCompleted,
    AWSBackupRecoveryPointStatusPartial,
    AWSBackupRecoveryPointStatusDeleting,
    AWSBackupRecoveryPointStatusExpired,
};

typedef NS_ENUM(NSInteger, AWSBackupRestoreJobStatus) {
    AWSBackupRestoreJobStatusUnknown,
    AWSBackupRestoreJobStatusPending,
    AWSBackupRestoreJobStatusRunning,
    AWSBackupRestoreJobStatusCompleted,
    AWSBackupRestoreJobStatusAborted,
    AWSBackupRestoreJobStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSBackupStorageClass) {
    AWSBackupStorageClassUnknown,
    AWSBackupStorageClassWarm,
    AWSBackupStorageClassCold,
    AWSBackupStorageClassDeleted,
};

@class AWSBackupBackupJob;
@class AWSBackupBackupPlan;
@class AWSBackupBackupPlanInput;
@class AWSBackupBackupPlanTemplatesListMember;
@class AWSBackupBackupPlansListMember;
@class AWSBackupBackupRule;
@class AWSBackupBackupRuleInput;
@class AWSBackupBackupSelection;
@class AWSBackupBackupSelectionsListMember;
@class AWSBackupBackupVaultListMember;
@class AWSBackupCalculatedLifecycle;
@class AWSBackupCondition;
@class AWSBackupReplicateAction;
@class AWSBackupReplicateJob;
@class AWSBackupCreateBackupPlanInput;
@class AWSBackupCreateBackupPlanOutput;
@class AWSBackupCreateBackupSelectionInput;
@class AWSBackupCreateBackupSelectionOutput;
@class AWSBackupCreateBackupVaultInput;
@class AWSBackupCreateBackupVaultOutput;
@class AWSBackupDeleteBackupPlanInput;
@class AWSBackupDeleteBackupPlanOutput;
@class AWSBackupDeleteBackupSelectionInput;
@class AWSBackupDeleteBackupVaultAccessPolicyInput;
@class AWSBackupDeleteBackupVaultInput;
@class AWSBackupDeleteBackupVaultNotificationsInput;
@class AWSBackupDeleteRecoveryPointInput;
@class AWSBackupDescribeBackupJobInput;
@class AWSBackupDescribeBackupJobOutput;
@class AWSBackupDescribeBackupVaultInput;
@class AWSBackupDescribeBackupVaultOutput;
@class AWSBackupDescribeCopyJobInput;
@class AWSBackupDescribeCopyJobOutput;
@class AWSBackupDescribeProtectedResourceInput;
@class AWSBackupDescribeProtectedResourceOutput;
@class AWSBackupDescribeRecoveryPointInput;
@class AWSBackupDescribeRecoveryPointOutput;
@class AWSBackupDescribeRegionSettingsInput;
@class AWSBackupDescribeRegionSettingsOutput;
@class AWSBackupDescribeRestoreJobInput;
@class AWSBackupDescribeRestoreJobOutput;
@class AWSBackupExportBackupPlanTemplateInput;
@class AWSBackupExportBackupPlanTemplateOutput;
@class AWSBackupGetBackupPlanFromJSONInput;
@class AWSBackupGetBackupPlanFromJSONOutput;
@class AWSBackupGetBackupPlanFromTemplateInput;
@class AWSBackupGetBackupPlanFromTemplateOutput;
@class AWSBackupGetBackupPlanInput;
@class AWSBackupGetBackupPlanOutput;
@class AWSBackupGetBackupSelectionInput;
@class AWSBackupGetBackupSelectionOutput;
@class AWSBackupGetBackupVaultAccessPolicyInput;
@class AWSBackupGetBackupVaultAccessPolicyOutput;
@class AWSBackupGetBackupVaultNotificationsInput;
@class AWSBackupGetBackupVaultNotificationsOutput;
@class AWSBackupGetRecoveryPointRestoreMetadataInput;
@class AWSBackupGetRecoveryPointRestoreMetadataOutput;
@class AWSBackupGetSupportedResourceTypesOutput;
@class AWSBackupLifecycle;
@class AWSBackupListBackupJobsInput;
@class AWSBackupListBackupJobsOutput;
@class AWSBackupListBackupPlanTemplatesInput;
@class AWSBackupListBackupPlanTemplatesOutput;
@class AWSBackupListBackupPlanVersionsInput;
@class AWSBackupListBackupPlanVersionsOutput;
@class AWSBackupListBackupPlansInput;
@class AWSBackupListBackupPlansOutput;
@class AWSBackupListBackupSelectionsInput;
@class AWSBackupListBackupSelectionsOutput;
@class AWSBackupListBackupVaultsInput;
@class AWSBackupListBackupVaultsOutput;
@class AWSBackupListCopyJobsInput;
@class AWSBackupListCopyJobsOutput;
@class AWSBackupListProtectedResourcesInput;
@class AWSBackupListProtectedResourcesOutput;
@class AWSBackupListRecoveryPointsByBackupVaultInput;
@class AWSBackupListRecoveryPointsByBackupVaultOutput;
@class AWSBackupListRecoveryPointsByResourceInput;
@class AWSBackupListRecoveryPointsByResourceOutput;
@class AWSBackupListRestoreJobsInput;
@class AWSBackupListRestoreJobsOutput;
@class AWSBackupListTagsInput;
@class AWSBackupListTagsOutput;
@class AWSBackupProtectedResource;
@class AWSBackupPutBackupVaultAccessPolicyInput;
@class AWSBackupPutBackupVaultNotificationsInput;
@class AWSBackupRecoveryPointByBackupVault;
@class AWSBackupRecoveryPointByResource;
@class AWSBackupRecoveryPointCreator;
@class AWSBackupRestoreJobsListMember;
@class AWSBackupStartBackupJobInput;
@class AWSBackupStartBackupJobOutput;
@class AWSBackupStartCopyJobInput;
@class AWSBackupStartCopyJobOutput;
@class AWSBackupStartRestoreJobInput;
@class AWSBackupStartRestoreJobOutput;
@class AWSBackupStopBackupJobInput;
@class AWSBackupTagResourceInput;
@class AWSBackupUntagResourceInput;
@class AWSBackupUpdateBackupPlanInput;
@class AWSBackupUpdateBackupPlanOutput;
@class AWSBackupUpdateRecoveryPointLifecycleInput;
@class AWSBackupUpdateRecoveryPointLifecycleOutput;
@class AWSBackupUpdateRegionSettingsInput;

/**
 <p>Contains detailed information about a backup job.</p>
 */
@interface AWSBackupBackupJob : AWSModel


/**
 <p>Uniquely identifies a request to AWS Backup to back up a resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupJobId;

/**
 <p>The size, in bytes, of a backup.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupSizeInBytes;

/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultArn;

/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

/**
 <p>The size in bytes transferred to a backup vault at the time that the job status was queried.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bytesTransferred;

/**
 <p>The date and time a job to create a backup job is completed, in Unix format and Coordinated Universal Time (UTC). The value of <code>CompletionDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completionDate;

/**
 <p>Contains identifying information about the creation of a backup job, including the <code>BackupPlanArn</code>, <code>BackupPlanId</code>, <code>BackupPlanVersion</code>, and <code>BackupRuleId</code> of the backup plan used to create it.</p>
 */
@property (nonatomic, strong) AWSBackupRecoveryPointCreator * _Nullable createdBy;

/**
 <p>The date and time a backup job is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The date and time a job to back up resources is expected to be completed, in Unix format and Coordinated Universal Time (UTC). The value of <code>ExpectedCompletionDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expectedCompletionDate;

/**
 <p>Specifies the IAM role ARN used to create the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRoleArn;

/**
 <p>Contains an estimated percentage complete of a job at the time the job status was queried.</p>
 */
@property (nonatomic, strong) NSString * _Nullable percentDone;

/**
 <p>An ARN that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recoveryPointArn;

/**
 <p>An ARN that uniquely identifies a resource. The format of the ARN depends on the resource type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The type of AWS resource to be backed up; for example, an Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>Specifies the time in Unix format and Coordinated Universal Time (UTC) when a backup job must be started before it is canceled. The value is calculated by adding the start window to the scheduled time. So if the scheduled time were 6:00 PM and the start window is 2 hours, the <code>StartBy</code> time would be 8:00 PM on the date specified. The value of <code>StartBy</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startBy;

/**
 <p>The current state of a resource recovery point.</p>
 */
@property (nonatomic, assign) AWSBackupBackupJobState state;

/**
 <p>A detailed message explaining the status of the job to back up a resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

@end

/**
 <p>Contains an optional backup plan display name and an array of <code>BackupRule</code> objects, each of which specifies a backup rule. Each rule in a backup plan is a separate scheduled task and can back up a different selection of AWS resources.</p>
 Required parameters: [BackupPlanName, Rules]
 */
@interface AWSBackupBackupPlan : AWSModel


/**
 <p>The display name of a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanName;

/**
 <p>An array of <code>BackupRule</code> objects, each of which specifies a scheduled task that is used to back up a selection of resources. </p>
 */
@property (nonatomic, strong) NSArray<AWSBackupBackupRule *> * _Nullable rules;

@end

/**
 <p>Contains an optional backup plan display name and an array of <code>BackupRule</code> objects, each of which specifies a backup rule. Each rule in a backup plan is a separate scheduled task and can back up a different selection of AWS resources. </p>
 Required parameters: [BackupPlanName, Rules]
 */
@interface AWSBackupBackupPlanInput : AWSModel


/**
 <p>The display name of a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanName;

/**
 <p>An array of <code>BackupRule</code> objects, each of which specifies a scheduled task that is used to back up a selection of resources.</p>
 */
@property (nonatomic, strong) NSArray<AWSBackupBackupRuleInput *> * _Nullable rules;

@end

/**
 <p>An object specifying metadata associated with a backup plan template.</p>
 */
@interface AWSBackupBackupPlanTemplatesListMember : AWSModel


/**
 <p>Uniquely identifies a stored backup plan template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanTemplateId;

/**
 <p>The optional display name of a backup plan template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanTemplateName;

@end

/**
 <p>Contains metadata about a backup plan.</p>
 */
@interface AWSBackupBackupPlansListMember : AWSModel


/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for example, <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanArn;

/**
 <p>Uniquely identifies a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanId;

/**
 <p>The display name of a saved backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanName;

/**
 <p>The date and time a resource backup plan is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>A unique string that identifies the request and allows failed requests to be retried without the risk of executing the operation twice.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creatorRequestId;

/**
 <p>The date and time a backup plan is deleted, in Unix format and Coordinated Universal Time (UTC). The value of <code>DeletionDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deletionDate;

/**
 <p>The last time a job to back up resources was executed with this rule. A date and time, in Unix format and Coordinated Universal Time (UTC). The value of <code>LastExecutionDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastExecutionDate;

/**
 <p>Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long. Version IDs cannot be edited.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>Specifies a scheduled task used to back up a selection of resources.</p>
 Required parameters: [RuleName, TargetBackupVaultName]
 */
@interface AWSBackupBackupRule : AWSModel


/**
 <p>A value in minutes after a backup job is successfully started before it must be completed or it will be canceled by AWS Backup. This value is optional.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable completionWindowMinutes;

/**
 <p>An array of <code>CopyAction</code> objects, which contains the details of the copy operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSBackupReplicateAction *> * _Nullable replicateActions;

/**
 <p>The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. AWS Backup transitions and expires backups automatically according to the lifecycle that you define. </p><p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, the “expire after days” setting must be 90 days greater than the “transition to cold after days” setting. The “transition to cold after days” setting cannot be changed after a backup has been transitioned to cold. </p>
 */
@property (nonatomic, strong) AWSBackupLifecycle * _Nullable lifecycle;

/**
 <p>An array of key-value pair strings that are assigned to resources that are associated with this rule when restored from backup.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable recoveryPointTags;

/**
 <p>Uniquely identifies a rule that is used to schedule the backup of a selection of resources.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

/**
 <p>An optional display name for a backup rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

/**
 <p>A CRON expression specifying when AWS Backup initiates a backup job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleExpression;

/**
 <p>A value in minutes after a backup is scheduled before a job will be canceled if it doesn't start successfully. This value is optional.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startWindowMinutes;

/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetBackupVaultName;

@end

/**
 <p>Specifies a scheduled task used to back up a selection of resources.</p>
 Required parameters: [RuleName, TargetBackupVaultName]
 */
@interface AWSBackupBackupRuleInput : AWSModel


/**
 <p>A value in minutes after a backup job is successfully started before it must be completed or it will be canceled by AWS Backup. This value is optional.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable completionWindowMinutes;

/**
 <p>An array of <code>CopyAction</code> objects, which contains the details of the copy operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSBackupReplicateAction *> * _Nullable replicateActions;

/**
 <p>The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. AWS Backup will transition and expire backups automatically according to the lifecycle that you define. </p><p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, the “expire after days” setting must be 90 days greater than the “transition to cold after days” setting. The “transition to cold after days” setting cannot be changed after a backup has been transitioned to cold. </p>
 */
@property (nonatomic, strong) AWSBackupLifecycle * _Nullable lifecycle;

/**
 <p>To help organize your resources, you can assign your own metadata to the resources that you create. Each tag is a key-value pair.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable recoveryPointTags;

/**
 <p>An optional display name for a backup rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

/**
 <p>A CRON expression specifying when AWS Backup initiates a backup job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleExpression;

/**
 <p>A value in minutes after a backup is scheduled before a job will be canceled if it doesn't start successfully. This value is optional.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startWindowMinutes;

/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetBackupVaultName;

@end

/**
 <p>Used to specify a set of resources to a backup plan.</p>
 Required parameters: [SelectionName, IamRoleArn]
 */
@interface AWSBackupBackupSelection : AWSModel


/**
 <p>The ARN of the IAM role that AWS Backup uses to authenticate when restoring the target resource; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRoleArn;

/**
 <p>An array of conditions used to specify a set of resources to assign to a backup plan; for example, <code>"STRINGEQUALS": {"ec2:ResourceTag/Department": "accounting"</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSBackupCondition *> * _Nullable listOfTags;

/**
 <p>An array of strings that contain Amazon Resource Names (ARNs) of resources to assign to a backup plan.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resources;

/**
 <p>The display name of a resource selection document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable selectionName;

@end

/**
 <p>Contains metadata about a <code>BackupSelection</code> object.</p>
 */
@interface AWSBackupBackupSelectionsListMember : AWSModel


/**
 <p>Uniquely identifies a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanId;

/**
 <p>The date and time a backup plan is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>A unique string that identifies the request and allows failed requests to be retried without the risk of executing the operation twice.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creatorRequestId;

/**
 <p>Specifies the IAM role Amazon Resource Name (ARN) to create the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRoleArn;

/**
 <p>Uniquely identifies a request to assign a set of resources to a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable selectionId;

/**
 <p>The display name of a resource selection document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable selectionName;

@end

/**
 <p>Contains metadata about a backup vault.</p>
 */
@interface AWSBackupBackupVaultListMember : AWSModel


/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultArn;

/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

/**
 <p>The date and time a resource backup is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>A unique string that identifies the request and allows failed requests to be retried without the risk of executing the operation twice.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creatorRequestId;

/**
 <p>The server-side encryption key that is used to protect your backups; for example, <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable encryptionKeyArn;

/**
 <p>The number of recovery points that are stored in a backup vault.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfRecoveryPoints;

@end

/**
 <p>Contains <code>DeleteAt</code> and <code>MoveToColdStorageAt</code> timestamps, which are used to specify a lifecycle for a recovery point.</p><p>The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. AWS Backup transitions and expires backups automatically according to the lifecycle that you define.</p><p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, the “expire after days” setting must be 90 days greater than the “transition to cold after days” setting. The “transition to cold after days” setting cannot be changed after a backup has been transitioned to cold.</p>
 */
@interface AWSBackupCalculatedLifecycle : AWSModel


/**
 <p>A timestamp that specifies when to delete a recovery point.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deleteAt;

/**
 <p>A timestamp that specifies when to transition a recovery point to cold storage.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable moveToColdStorageAt;

@end

/**
 <p>Contains an array of triplets made up of a condition type (such as <code>STRINGEQUALS</code>), a key, and a value. Conditions are used to filter resources in a selection that is assigned to a backup plan.</p>
 Required parameters: [ConditionType, ConditionKey, ConditionValue]
 */
@interface AWSBackupCondition : AWSModel


/**
 <p>The key in a key-value pair. For example, in <code>"ec2:ResourceTag/Department": "accounting"</code>, <code>"ec2:ResourceTag/Department"</code> is the key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable conditionKey;

/**
 <p>An operation, such as <code>STRINGEQUALS</code>, that is applied to a key-value pair used to filter resources in a selection.</p>
 */
@property (nonatomic, assign) AWSBackupConditionType conditionType;

/**
 <p>The value in a key-value pair. For example, in <code>"ec2:ResourceTag/Department": "accounting"</code>, <code>"accounting"</code> is the value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable conditionValue;

@end

/**
 <p>The details of the copy operation.</p>
 Required parameters: [DestinationBackupVaultArn]
 */
@interface AWSBackupReplicateAction : AWSModel


/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies the destination backup vault for the copied backup. For example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationBackupVaultArn;

/**
 <p>Contains an array of <code>Transition</code> objects specifying how long in days before a recovery point transitions to cold storage or is deleted.</p><p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, on the console, the “expire after days” setting must be 90 days greater than the “transition to cold after days” setting. The “transition to cold after days” setting cannot be changed after a backup has been transitioned to cold.</p>
 */
@property (nonatomic, strong) AWSBackupLifecycle * _Nullable lifecycle;

@end

/**
 <p>Contains detailed information about a copy job.</p>
 */
@interface AWSBackupReplicateJob : AWSModel


/**
 <p>The size, in bytes, of a copy job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupSizeInBytes;

/**
 <p>The date and time a copy job is completed, in Unix format and Coordinated Universal Time (UTC). The value of CompletionDate is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable completionDate;

/**
 <p>Uniquely identifies a copy job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateJobId;

/**
 <p>Contains information about the backup plan and rule that AWS Backup used to initiate the recovery point backup.</p>
 */
@property (nonatomic, strong) AWSBackupRecoveryPointCreator * _Nullable createdBy;

/**
 <p>The date and time a copy job is created, in Unix format and Coordinated Universal Time (UTC). The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a destination copy vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationBackupVaultArn;

/**
 <p>An ARN that uniquely identifies a destination recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationRecoveryPointArn;

/**
 <p>Specifies the IAM role ARN used to copy the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRoleArn;

/**
 <p>The AWS resource to be copied; for example, an Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The type of AWS resource to be copied; for example, an Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a source copy vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceBackupVaultArn;

/**
 <p>An ARN that uniquely identifies a source recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceRecoveryPointArn;

/**
 <p>The current state of a copy job.</p>
 */
@property (nonatomic, assign) AWSBackupReplicateJobState state;

/**
 <p>A detailed message explaining the status of the job to copy a resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

@end

/**
 
 */
@interface AWSBackupCreateBackupPlanInput : AWSRequest


/**
 <p>Specifies the body of a backup plan. Includes a <code>BackupPlanName</code> and one or more sets of <code>Rules</code>.</p>
 */
@property (nonatomic, strong) AWSBackupBackupPlanInput * _Nullable backupPlan;

/**
 <p>To help organize your resources, you can assign your own metadata to the resources that you create. Each tag is a key-value pair. The specified tags are assigned to all backups created with this plan.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable backupPlanTags;

/**
 <p>Identifies the request and allows failed requests to be retried without the risk of executing the operation twice. If the request includes a <code>CreatorRequestId</code> that matches an existing backup plan, that plan is returned. This parameter is optional.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creatorRequestId;

@end

/**
 
 */
@interface AWSBackupCreateBackupPlanOutput : AWSModel


/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for example, <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanArn;

/**
 <p>Uniquely identifies a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanId;

/**
 <p>The date and time that a backup plan is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long. They cannot be edited.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSBackupCreateBackupSelectionInput : AWSRequest


/**
 <p>Uniquely identifies the backup plan to be associated with the selection of resources.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanId;

/**
 <p>Specifies the body of a request to assign a set of resources to a backup plan.</p>
 */
@property (nonatomic, strong) AWSBackupBackupSelection * _Nullable backupSelection;

/**
 <p>A unique string that identifies the request and allows failed requests to be retried without the risk of executing the operation twice.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creatorRequestId;

@end

/**
 
 */
@interface AWSBackupCreateBackupSelectionOutput : AWSModel


/**
 <p>Uniquely identifies a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanId;

/**
 <p>The date and time a backup selection is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>Uniquely identifies the body of a request to assign a set of resources to a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable selectionId;

@end

/**
 
 */
@interface AWSBackupCreateBackupVaultInput : AWSRequest


/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

/**
 <p>Metadata that you can assign to help organize the resources that you create. Each tag is a key-value pair.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable backupVaultTags;

/**
 <p>A unique string that identifies the request and allows failed requests to be retried without the risk of executing the operation twice.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creatorRequestId;

/**
 <p>The server-side encryption key that is used to protect your backups; for example, <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable encryptionKeyArn;

@end

/**
 
 */
@interface AWSBackupCreateBackupVaultOutput : AWSModel


/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultArn;

/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

/**
 <p>The date and time a backup vault is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

@end

/**
 
 */
@interface AWSBackupDeleteBackupPlanInput : AWSRequest


/**
 <p>Uniquely identifies a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanId;

@end

/**
 
 */
@interface AWSBackupDeleteBackupPlanOutput : AWSModel


/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for example, <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanArn;

/**
 <p>Uniquely identifies a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanId;

/**
 <p>The date and time a backup plan is deleted, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deletionDate;

/**
 <p>Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long. Version Ids cannot be edited.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSBackupDeleteBackupSelectionInput : AWSRequest


/**
 <p>Uniquely identifies a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanId;

/**
 <p>Uniquely identifies the body of a request to assign a set of resources to a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable selectionId;

@end

/**
 
 */
@interface AWSBackupDeleteBackupVaultAccessPolicyInput : AWSRequest


/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

@end

/**
 
 */
@interface AWSBackupDeleteBackupVaultInput : AWSRequest


/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

@end

/**
 
 */
@interface AWSBackupDeleteBackupVaultNotificationsInput : AWSRequest


/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

@end

/**
 
 */
@interface AWSBackupDeleteRecoveryPointInput : AWSRequest


/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recoveryPointArn;

@end

/**
 
 */
@interface AWSBackupDescribeBackupJobInput : AWSRequest


/**
 <p>Uniquely identifies a request to AWS Backup to back up a resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupJobId;

@end

/**
 
 */
@interface AWSBackupDescribeBackupJobOutput : AWSModel


/**
 <p>Uniquely identifies a request to AWS Backup to back up a resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupJobId;

/**
 <p>The size, in bytes, of a backup.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupSizeInBytes;

/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultArn;

/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

/**
 <p>The size in bytes transferred to a backup vault at the time that the job status was queried.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bytesTransferred;

/**
 <p>The date and time that a job to create a backup job is completed, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completionDate;

/**
 <p>Contains identifying information about the creation of a backup job, including the <code>BackupPlanArn</code>, <code>BackupPlanId</code>, <code>BackupPlanVersion</code>, and <code>BackupRuleId</code> of the backup plan that is used to create it.</p>
 */
@property (nonatomic, strong) AWSBackupRecoveryPointCreator * _Nullable createdBy;

/**
 <p>The date and time that a backup job is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The date and time that a job to back up resources is expected to be completed, in Unix format and Coordinated Universal Time (UTC). The value of <code>ExpectedCompletionDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expectedCompletionDate;

/**
 <p>Specifies the IAM role ARN used to create the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRoleArn;

/**
 <p>Contains an estimated percentage that is complete of a job at the time the job status was queried.</p>
 */
@property (nonatomic, strong) NSString * _Nullable percentDone;

/**
 <p>An ARN that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recoveryPointArn;

/**
 <p>An ARN that uniquely identifies a saved resource. The format of the ARN depends on the resource type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The type of AWS resource to be backed up; for example, an Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>Specifies the time in Unix format and Coordinated Universal Time (UTC) when a backup job must be started before it is canceled. The value is calculated by adding the start window to the scheduled time. So if the scheduled time were 6:00 PM and the start window is 2 hours, the <code>StartBy</code> time would be 8:00 PM on the date specified. The value of <code>StartBy</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startBy;

/**
 <p>The current state of a resource recovery point.</p>
 */
@property (nonatomic, assign) AWSBackupBackupJobState state;

/**
 <p>A detailed message explaining the status of the job to back up a resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

@end

/**
 
 */
@interface AWSBackupDescribeBackupVaultInput : AWSRequest


/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

@end

/**
 
 */
@interface AWSBackupDescribeBackupVaultOutput : AWSModel


/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultArn;

/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

/**
 <p>The date and time that a backup vault is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>A unique string that identifies the request and allows failed requests to be retried without the risk of executing the operation twice.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creatorRequestId;

/**
 <p>The server-side encryption key that is used to protect your backups; for example, <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable encryptionKeyArn;

/**
 <p>The number of recovery points that are stored in a backup vault.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfRecoveryPoints;

@end

/**
 
 */
@interface AWSBackupDescribeCopyJobInput : AWSRequest


/**
 <p>Uniquely identifies a copy job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateJobId;

@end

/**
 
 */
@interface AWSBackupDescribeCopyJobOutput : AWSModel


/**
 <p>Contains detailed information about a copy job.</p>
 */
@property (nonatomic, strong) AWSBackupReplicateJob * _Nullable replicateJob;

@end

/**
 
 */
@interface AWSBackupDescribeProtectedResourceInput : AWSRequest


/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on the resource type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSBackupDescribeProtectedResourceOutput : AWSModel


/**
 <p>The date and time that a resource was last backed up, in Unix format and Coordinated Universal Time (UTC). The value of <code>LastBackupTime</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastBackupTime;

/**
 <p>An ARN that uniquely identifies a resource. The format of the ARN depends on the resource type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The type of AWS resource saved as a recovery point; for example, an EBS volume or an Amazon RDS database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

@end

/**
 
 */
@interface AWSBackupDescribeRecoveryPointInput : AWSRequest


/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recoveryPointArn;

@end

/**
 
 */
@interface AWSBackupDescribeRecoveryPointOutput : AWSModel


/**
 <p>The size, in bytes, of a backup.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupSizeInBytes;

/**
 <p>An ARN that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultArn;

/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

/**
 <p>A <code>CalculatedLifecycle</code> object containing <code>DeleteAt</code> and <code>MoveToColdStorageAt</code> timestamps.</p>
 */
@property (nonatomic, strong) AWSBackupCalculatedLifecycle * _Nullable calculatedLifecycle;

/**
 <p>The date and time that a job to create a recovery point is completed, in Unix format and Coordinated Universal Time (UTC). The value of <code>CompletionDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completionDate;

/**
 <p>Contains identifying information about the creation of a recovery point, including the <code>BackupPlanArn</code>, <code>BackupPlanId</code>, <code>BackupPlanVersion</code>, and <code>BackupRuleId</code> of the backup plan used to create it.</p>
 */
@property (nonatomic, strong) AWSBackupRecoveryPointCreator * _Nullable createdBy;

/**
 <p>The date and time that a recovery point is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The server-side encryption key used to protect your backups; for example, <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable encryptionKeyArn;

/**
 <p>Specifies the IAM role ARN used to create the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRoleArn;

/**
 <p>A Boolean value that is returned as <code>TRUE</code> if the specified recovery point is encrypted, or <code>FALSE</code> if the recovery point is not encrypted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isEncrypted;

/**
 <p>The date and time that a recovery point was last restored, in Unix format and Coordinated Universal Time (UTC). The value of <code>LastRestoreTime</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastRestoreTime;

/**
 <p>The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. AWS Backup transitions and expires backups automatically according to the lifecycle that you define. </p><p>Backups that are transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, the “expire after days” setting must be 90 days greater than the “transition to cold after days” setting. The “transition to cold after days” setting cannot be changed after a backup has been transitioned to cold. </p>
 */
@property (nonatomic, strong) AWSBackupLifecycle * _Nullable lifecycle;

/**
 <p>An ARN that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recoveryPointArn;

/**
 <p>An ARN that uniquely identifies a saved resource. The format of the ARN depends on the resource type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The type of AWS resource to save as a recovery point; for example, an Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>A status code specifying the state of the recovery point.</p><note><p>A partial status indicates that the recovery point was not successfully re-created and must be retried.</p></note>
 */
@property (nonatomic, assign) AWSBackupRecoveryPointStatus status;

/**
 <p>Specifies the storage class of the recovery point. Valid values are <code>WARM</code> or <code>COLD</code>.</p>
 */
@property (nonatomic, assign) AWSBackupStorageClass storageClass;

@end

/**
 
 */
@interface AWSBackupDescribeRegionSettingsInput : AWSRequest


@end

/**
 
 */
@interface AWSBackupDescribeRegionSettingsOutput : AWSModel


/**
 <p>Returns a list of all services along with the opt-in preferences in the region.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable resourceTypeOptInPreference;

@end

/**
 
 */
@interface AWSBackupDescribeRestoreJobInput : AWSRequest


/**
 <p>Uniquely identifies the job that restores a recovery point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable restoreJobId;

@end

/**
 
 */
@interface AWSBackupDescribeRestoreJobOutput : AWSModel


/**
 <p>The size, in bytes, of the restored resource.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupSizeInBytes;

/**
 <p>The date and time that a job to restore a recovery point is completed, in Unix format and Coordinated Universal Time (UTC). The value of <code>CompletionDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completionDate;

/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a resource whose recovery point is being restored. The format of the ARN depends on the resource type of the backed-up resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdResourceArn;

/**
 <p>The date and time that a restore job is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The amount of time in minutes that a job restoring a recovery point is expected to take.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedCompletionTimeMinutes;

/**
 <p>Specifies the IAM role ARN used to create the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRoleArn;

/**
 <p>Contains an estimated percentage that is complete of a job at the time the job status was queried.</p>
 */
@property (nonatomic, strong) NSString * _Nullable percentDone;

/**
 <p>An ARN that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recoveryPointArn;

/**
 <p>Uniquely identifies the job that restores a recovery point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable restoreJobId;

/**
 <p>Status code specifying the state of the job that is initiated by AWS Backup to restore a recovery point.</p>
 */
@property (nonatomic, assign) AWSBackupRestoreJobStatus status;

/**
 <p>A detailed message explaining the status of a job to restore a recovery point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

@end

/**
 
 */
@interface AWSBackupExportBackupPlanTemplateInput : AWSRequest


/**
 <p>Uniquely identifies a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanId;

@end

/**
 
 */
@interface AWSBackupExportBackupPlanTemplateOutput : AWSModel


/**
 <p>The body of a backup plan template in JSON format.</p><note><p>This is a signed JSON document that cannot be modified before being passed to <code>GetBackupPlanFromJSON.</code></p></note>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanTemplateJson;

@end

/**
 
 */
@interface AWSBackupGetBackupPlanFromJSONInput : AWSRequest


/**
 <p>A customer-supplied backup plan document in JSON format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanTemplateJson;

@end

/**
 
 */
@interface AWSBackupGetBackupPlanFromJSONOutput : AWSModel


/**
 <p>Specifies the body of a backup plan. Includes a <code>BackupPlanName</code> and one or more sets of <code>Rules</code>.</p>
 */
@property (nonatomic, strong) AWSBackupBackupPlan * _Nullable backupPlan;

@end

/**
 
 */
@interface AWSBackupGetBackupPlanFromTemplateInput : AWSRequest


/**
 <p>Uniquely identifies a stored backup plan template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanTemplateId;

@end

/**
 
 */
@interface AWSBackupGetBackupPlanFromTemplateOutput : AWSModel


/**
 <p>Returns the body of a backup plan based on the target template, including the name, rules, and backup vault of the plan.</p>
 */
@property (nonatomic, strong) AWSBackupBackupPlan * _Nullable backupPlanDocument;

@end

/**
 
 */
@interface AWSBackupGetBackupPlanInput : AWSRequest


/**
 <p>Uniquely identifies a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanId;

/**
 <p>Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long. Version IDs cannot be edited.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSBackupGetBackupPlanOutput : AWSModel


/**
 <p>Specifies the body of a backup plan. Includes a <code>BackupPlanName</code> and one or more sets of <code>Rules</code>.</p>
 */
@property (nonatomic, strong) AWSBackupBackupPlan * _Nullable backupPlan;

/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for example, <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanArn;

/**
 <p>Uniquely identifies a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanId;

/**
 <p>The date and time that a backup plan is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>A unique string that identifies the request and allows failed requests to be retried without the risk of executing the operation twice.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creatorRequestId;

/**
 <p>The date and time that a backup plan is deleted, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deletionDate;

/**
 <p>The last time a job to back up resources was executed with this backup plan. A date and time, in Unix format and Coordinated Universal Time (UTC). The value of <code>LastExecutionDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastExecutionDate;

/**
 <p>Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long. Version IDs cannot be edited.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSBackupGetBackupSelectionInput : AWSRequest


/**
 <p>Uniquely identifies a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanId;

/**
 <p>Uniquely identifies the body of a request to assign a set of resources to a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable selectionId;

@end

/**
 
 */
@interface AWSBackupGetBackupSelectionOutput : AWSModel


/**
 <p>Uniquely identifies a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanId;

/**
 <p>Specifies the body of a request to assign a set of resources to a backup plan.</p>
 */
@property (nonatomic, strong) AWSBackupBackupSelection * _Nullable backupSelection;

/**
 <p>The date and time a backup selection is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>A unique string that identifies the request and allows failed requests to be retried without the risk of executing the operation twice.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creatorRequestId;

/**
 <p>Uniquely identifies the body of a request to assign a set of resources to a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable selectionId;

@end

/**
 
 */
@interface AWSBackupGetBackupVaultAccessPolicyInput : AWSRequest


/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

@end

/**
 
 */
@interface AWSBackupGetBackupVaultAccessPolicyOutput : AWSModel


/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultArn;

/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

/**
 <p>The backup vault access policy document in JSON format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

@end

/**
 
 */
@interface AWSBackupGetBackupVaultNotificationsInput : AWSRequest


/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

@end

/**
 
 */
@interface AWSBackupGetBackupVaultNotificationsOutput : AWSModel


/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultArn;

/**
 <p>An array of events that indicate the status of jobs to back up resources to the backup vault.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable backupVaultEvents;

/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

/**
 <p>An ARN that uniquely identifies an Amazon Simple Notification Service (Amazon SNS) topic; for example, <code>arn:aws:sns:us-west-2:111122223333:MyTopic</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SNSTopicArn;

@end

/**
 
 */
@interface AWSBackupGetRecoveryPointRestoreMetadataInput : AWSRequest


/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recoveryPointArn;

@end

/**
 
 */
@interface AWSBackupGetRecoveryPointRestoreMetadataOutput : AWSModel


/**
 <p>An ARN that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultArn;

/**
 <p>An ARN that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recoveryPointArn;

/**
 <p>The set of metadata key-value pairs that describes the original configuration of the backed-up resource. These values vary depending on the service that is being restored.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable restoreMetadata;

@end

/**
 
 */
@interface AWSBackupGetSupportedResourceTypesOutput : AWSModel


/**
 <p>Contains a string with the supported AWS resource types:</p><ul><li><p><code>EBS</code> for Amazon Elastic Block Store</p></li><li><p><code>Storage Gateway</code> for AWS Storage Gateway</p></li><li><p><code>RDS</code> for Amazon Relational Database Service</p></li><li><p><code>DDB</code> for Amazon DynamoDB</p></li><li><p><code>EFS</code> for Amazon Elastic File System</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceTypes;

@end

/**
 <p>Contains an array of <code>Transition</code> objects specifying how long in days before a recovery point transitions to cold storage or is deleted.</p><p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, on the console, the “expire after days” setting must be 90 days greater than the “transition to cold after days” setting. The “transition to cold after days” setting cannot be changed after a backup has been transitioned to cold.</p>
 */
@interface AWSBackupLifecycle : AWSModel


/**
 <p>Specifies the number of days after creation that a recovery point is deleted. Must be greater than 90 days plus <code>MoveToColdStorageAfterDays</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteAfterDays;

/**
 <p>Specifies the number of days after creation that a recovery point is moved to cold storage.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable moveToColdStorageAfterDays;

@end

/**
 
 */
@interface AWSBackupListBackupJobsInput : AWSRequest


/**
 <p>Returns only backup jobs that will be stored in the specified backup vault. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable byBackupVaultName;

/**
 <p>Returns only backup jobs that were created after the specified date.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable byCreatedAfter;

/**
 <p>Returns only backup jobs that were created before the specified date.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable byCreatedBefore;

/**
 <p>Returns only backup jobs that match the specified resource Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable byResourceArn;

/**
 <p>Returns only backup jobs for the specified resources:</p><ul><li><p><code>DynamoDB</code> for Amazon DynamoDB</p></li><li><p><code>EBS</code> for Amazon Elastic Block Store</p></li><li><p><code>EFS</code> for Amazon Elastic File System</p></li><li><p><code>RDS</code> for Amazon Relational Database Service</p></li><li><p><code>Storage Gateway</code> for AWS Storage Gateway</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable byResourceType;

/**
 <p>Returns only backup jobs that are in the specified state.</p>
 */
@property (nonatomic, assign) AWSBackupBackupJobState byState;

/**
 <p>The maximum number of items to be returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSBackupListBackupJobsOutput : AWSModel


/**
 <p>An array of structures containing metadata about your backup jobs returned in JSON format.</p>
 */
@property (nonatomic, strong) NSArray<AWSBackupBackupJob *> * _Nullable backupJobs;

/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSBackupListBackupPlanTemplatesInput : AWSRequest


/**
 <p>The maximum number of items to be returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSBackupListBackupPlanTemplatesOutput : AWSModel


/**
 <p>An array of template list items containing metadata about your saved templates.</p>
 */
@property (nonatomic, strong) NSArray<AWSBackupBackupPlanTemplatesListMember *> * _Nullable backupPlanTemplatesList;

/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSBackupListBackupPlanVersionsInput : AWSRequest


/**
 <p>Uniquely identifies a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanId;

/**
 <p>The maximum number of items to be returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSBackupListBackupPlanVersionsOutput : AWSModel


/**
 <p>An array of version list items containing metadata about your backup plans.</p>
 */
@property (nonatomic, strong) NSArray<AWSBackupBackupPlansListMember *> * _Nullable backupPlanVersionsList;

/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSBackupListBackupPlansInput : AWSRequest


/**
 <p>A Boolean value with a default value of <code>FALSE</code> that returns deleted backup plans when set to <code>TRUE</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeDeleted;

/**
 <p>The maximum number of items to be returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSBackupListBackupPlansOutput : AWSModel


/**
 <p>An array of backup plan list items containing metadata about your saved backup plans.</p>
 */
@property (nonatomic, strong) NSArray<AWSBackupBackupPlansListMember *> * _Nullable backupPlansList;

/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSBackupListBackupSelectionsInput : AWSRequest


/**
 <p>Uniquely identifies a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanId;

/**
 <p>The maximum number of items to be returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSBackupListBackupSelectionsOutput : AWSModel


/**
 <p>An array of backup selection list items containing metadata about each resource in the list.</p>
 */
@property (nonatomic, strong) NSArray<AWSBackupBackupSelectionsListMember *> * _Nullable backupSelectionsList;

/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSBackupListBackupVaultsInput : AWSRequest


/**
 <p>The maximum number of items to be returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSBackupListBackupVaultsOutput : AWSModel


/**
 <p>An array of backup vault list members containing vault metadata, including Amazon Resource Name (ARN), display name, creation date, number of saved recovery points, and encryption information if the resources saved in the backup vault are encrypted.</p>
 */
@property (nonatomic, strong) NSArray<AWSBackupBackupVaultListMember *> * _Nullable backupVaultList;

/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSBackupListCopyJobsInput : AWSRequest


/**
 <p>Returns only copy jobs that were created after the specified date.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable byCreatedAfter;

/**
 <p>Returns only copy jobs that were created before the specified date.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable byCreatedBefore;

/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a source backup vault to copy from; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable byDestinationVaultArn;

/**
 <p>Returns only copy jobs that match the specified resource Amazon Resource Name (ARN). </p>
 */
@property (nonatomic, strong) NSString * _Nullable byResourceArn;

/**
 <p>Returns only backup jobs for the specified resources:</p><ul><li><p><code>EBS</code> for Amazon Elastic Block Store</p></li><li><p><code>EFS</code> for Amazon Elastic File System</p></li><li><p><code>RDS</code> for Amazon Relational Database Service</p></li><li><p><code>Storage Gateway</code> for AWS Storage Gateway</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable byResourceType;

/**
 <p>Returns only copy jobs that are in the specified state.</p>
 */
@property (nonatomic, assign) AWSBackupReplicateJobState byState;

/**
 <p>The maximum number of items to be returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return maxResults number of items, NextToken allows you to return more items in your list starting at the location pointed to by the next token. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSBackupListCopyJobsOutput : AWSModel


/**
 <p>An array of structures containing metadata about your copy jobs returned in JSON format. </p>
 */
@property (nonatomic, strong) NSArray<AWSBackupReplicateJob *> * _Nullable replicateJobs;

/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return maxResults number of items, NextToken allows you to return more items in your list starting at the location pointed to by the next token. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSBackupListProtectedResourcesInput : AWSRequest


/**
 <p>The maximum number of items to be returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSBackupListProtectedResourcesOutput : AWSModel


/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of resources successfully backed up by AWS Backup including the time the resource was saved, an Amazon Resource Name (ARN) of the resource, and a resource type.</p>
 */
@property (nonatomic, strong) NSArray<AWSBackupProtectedResource *> * _Nullable results;

@end

/**
 
 */
@interface AWSBackupListRecoveryPointsByBackupVaultInput : AWSRequest


/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

/**
 <p>Returns only recovery points that match the specified backup plan ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable byBackupPlanId;

/**
 <p>Returns only recovery points that were created after the specified timestamp.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable byCreatedAfter;

/**
 <p>Returns only recovery points that were created before the specified timestamp.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable byCreatedBefore;

/**
 <p>Returns only recovery points that match the specified resource Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable byResourceArn;

/**
 <p>Returns only recovery points that match the specified resource type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable byResourceType;

/**
 <p>The maximum number of items to be returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSBackupListRecoveryPointsByBackupVaultOutput : AWSModel


/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of objects that contain detailed information about recovery points saved in a backup vault.</p>
 */
@property (nonatomic, strong) NSArray<AWSBackupRecoveryPointByBackupVault *> * _Nullable recoveryPoints;

@end

/**
 
 */
@interface AWSBackupListRecoveryPointsByResourceInput : AWSRequest


/**
 <p>The maximum number of items to be returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An ARN that uniquely identifies a resource. The format of the ARN depends on the resource type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSBackupListRecoveryPointsByResourceOutput : AWSModel


/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of objects that contain detailed information about recovery points of the specified resource type.</p>
 */
@property (nonatomic, strong) NSArray<AWSBackupRecoveryPointByResource *> * _Nullable recoveryPoints;

@end

/**
 
 */
@interface AWSBackupListRestoreJobsInput : AWSRequest


/**
 <p>The maximum number of items to be returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSBackupListRestoreJobsOutput : AWSModel


/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of objects that contain detailed information about jobs to restore saved resources.</p>
 */
@property (nonatomic, strong) NSArray<AWSBackupRestoreJobsListMember *> * _Nullable restoreJobs;

@end

/**
 
 */
@interface AWSBackupListTagsInput : AWSRequest


/**
 <p>The maximum number of items to be returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on the type of resource. Valid targets for <code>ListTags</code> are recovery points, backup plans, and backup vaults.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSBackupListTagsOutput : AWSModel


/**
 <p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>To help organize your resources, you can assign your own metadata to the resources you create. Each tag is a key-value pair.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>A structure that contains information about a backed-up resource.</p>
 */
@interface AWSBackupProtectedResource : AWSModel


/**
 <p>The date and time a resource was last backed up, in Unix format and Coordinated Universal Time (UTC). The value of <code>LastBackupTime</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastBackupTime;

/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on the resource type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The type of AWS resource; for example, an Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

@end

/**
 
 */
@interface AWSBackupPutBackupVaultAccessPolicyInput : AWSRequest


/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

/**
 <p>The backup vault access policy document in JSON format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

@end

/**
 
 */
@interface AWSBackupPutBackupVaultNotificationsInput : AWSRequest


/**
 <p>An array of events that indicate the status of jobs to back up resources to the backup vault.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable backupVaultEvents;

/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

/**
 <p>The Amazon Resource Name (ARN) that specifies the topic for a backup vault’s events; for example, <code>arn:aws:sns:us-west-2:111122223333:MyVaultTopic</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SNSTopicArn;

@end

/**
 <p>Contains detailed information about the recovery points stored in a backup vault.</p>
 */
@interface AWSBackupRecoveryPointByBackupVault : AWSModel


/**
 <p>The size, in bytes, of a backup.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupSizeInBytes;

/**
 <p>An ARN that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultArn;

/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

/**
 <p>A <code>CalculatedLifecycle</code> object containing <code>DeleteAt</code> and <code>MoveToColdStorageAt</code> timestamps.</p>
 */
@property (nonatomic, strong) AWSBackupCalculatedLifecycle * _Nullable calculatedLifecycle;

/**
 <p>The date and time a job to restore a recovery point is completed, in Unix format and Coordinated Universal Time (UTC). The value of <code>CompletionDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completionDate;

/**
 <p>Contains identifying information about the creation of a recovery point, including the <code>BackupPlanArn</code>, <code>BackupPlanId</code>, <code>BackupPlanVersion</code>, and <code>BackupRuleId</code> of the backup plan that is used to create it.</p>
 */
@property (nonatomic, strong) AWSBackupRecoveryPointCreator * _Nullable createdBy;

/**
 <p>The date and time a recovery point is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The server-side encryption key that is used to protect your backups; for example, <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable encryptionKeyArn;

/**
 <p>Specifies the IAM role ARN used to create the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRoleArn;

/**
 <p>A Boolean value that is returned as <code>TRUE</code> if the specified recovery point is encrypted, or <code>FALSE</code> if the recovery point is not encrypted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isEncrypted;

/**
 <p>The date and time a recovery point was last restored, in Unix format and Coordinated Universal Time (UTC). The value of <code>LastRestoreTime</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastRestoreTime;

/**
 <p>The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. AWS Backup transitions and expires backups automatically according to the lifecycle that you define. </p><p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, the “expire after days” setting must be 90 days greater than the “transition to cold after days” setting. The “transition to cold after days” setting cannot be changed after a backup has been transitioned to cold. </p>
 */
@property (nonatomic, strong) AWSBackupLifecycle * _Nullable lifecycle;

/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recoveryPointArn;

/**
 <p>An ARN that uniquely identifies a resource. The format of the ARN depends on the resource type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The type of AWS resource saved as a recovery point; for example, an Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>A status code specifying the state of the recovery point.</p>
 */
@property (nonatomic, assign) AWSBackupRecoveryPointStatus status;

@end

/**
 <p>Contains detailed information about a saved recovery point.</p>
 */
@interface AWSBackupRecoveryPointByResource : AWSModel


/**
 <p>The size, in bytes, of a backup.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupSizeBytes;

/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

/**
 <p>The date and time a recovery point is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The server-side encryption key that is used to protect your backups; for example, <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable encryptionKeyArn;

/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recoveryPointArn;

/**
 <p>A status code specifying the state of the recovery point.</p>
 */
@property (nonatomic, assign) AWSBackupRecoveryPointStatus status;

@end

/**
 <p>Contains information about the backup plan and rule that AWS Backup used to initiate the recovery point backup.</p>
 */
@interface AWSBackupRecoveryPointCreator : AWSModel


/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for example, <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanArn;

/**
 <p>Uniquely identifies a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanId;

/**
 <p>Version IDs are unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long. They cannot be edited.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanVersion;

/**
 <p>Uniquely identifies a rule used to schedule the backup of a selection of resources.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupRuleId;

@end

/**
 <p>Contains metadata about a restore job.</p>
 */
@interface AWSBackupRestoreJobsListMember : AWSModel


/**
 <p>The size, in bytes, of the restored resource.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupSizeInBytes;

/**
 <p>The date and time a job to restore a recovery point is completed, in Unix format and Coordinated Universal Time (UTC). The value of <code>CompletionDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completionDate;

/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on the resource type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdResourceArn;

/**
 <p>The date and time a restore job is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The amount of time in minutes that a job restoring a recovery point is expected to take.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedCompletionTimeMinutes;

/**
 <p>Specifies the IAM role ARN used to create the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRoleArn;

/**
 <p>Contains an estimated percentage complete of a job at the time the job status was queried.</p>
 */
@property (nonatomic, strong) NSString * _Nullable percentDone;

/**
 <p>An ARN that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recoveryPointArn;

/**
 <p>Uniquely identifies the job that restores a recovery point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable restoreJobId;

/**
 <p>A status code specifying the state of the job initiated by AWS Backup to restore a recovery point.</p>
 */
@property (nonatomic, assign) AWSBackupRestoreJobStatus status;

/**
 <p>A detailed message explaining the status of the job to restore a recovery point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

@end

/**
 
 */
@interface AWSBackupStartBackupJobInput : AWSRequest


/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

/**
 <p>A value in minutes after a backup job is successfully started before it must be completed or it will be canceled by AWS Backup. This value is optional.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable completeWindowMinutes;

/**
 <p>Specifies the IAM role ARN used to create the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRoleArn;

/**
 <p>A customer chosen string that can be used to distinguish between calls to <code>StartBackupJob</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable idempotencyToken;

/**
 <p>The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. AWS Backup will transition and expire backups automatically according to the lifecycle that you define. </p><p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, the “expire after days” setting must be 90 days greater than the “transition to cold after days” setting. The “transition to cold after days” setting cannot be changed after a backup has been transitioned to cold. </p>
 */
@property (nonatomic, strong) AWSBackupLifecycle * _Nullable lifecycle;

/**
 <p>To help organize your resources, you can assign your own metadata to the resources that you create. Each tag is a key-value pair.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable recoveryPointTags;

/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on the resource type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>A value in minutes after a backup is scheduled before a job will be canceled if it doesn't start successfully. This value is optional.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startWindowMinutes;

@end

/**
 
 */
@interface AWSBackupStartBackupJobOutput : AWSModel


/**
 <p>Uniquely identifies a request to AWS Backup to back up a resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupJobId;

/**
 <p>The date and time that a backup job is started, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>An ARN that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recoveryPointArn;

@end

/**
 
 */
@interface AWSBackupStartCopyJobInput : AWSRequest


/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a destination backup vault to copy to; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationBackupVaultArn;

/**
 <p>Specifies the IAM role ARN used to copy the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRoleArn;

/**
 <p>A customer chosen string that can be used to distinguish between calls to <code>StartCopyJob</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable idempotencyToken;

/**
 <p>Contains an array of <code>Transition</code> objects specifying how long in days before a recovery point transitions to cold storage or is deleted.</p><p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, on the console, the “expire after days” setting must be 90 days greater than the “transition to cold after days” setting. The “transition to cold after days” setting cannot be changed after a backup has been transitioned to cold.</p>
 */
@property (nonatomic, strong) AWSBackupLifecycle * _Nullable lifecycle;

/**
 <p>An ARN that uniquely identifies a recovery point to use for the copy job; for example, arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45. </p>
 */
@property (nonatomic, strong) NSString * _Nullable recoveryPointArn;

/**
 <p>The name of a logical source container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceBackupVaultName;

@end

/**
 
 */
@interface AWSBackupStartCopyJobOutput : AWSModel


/**
 <p>Uniquely identifies a copy job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateJobId;

/**
 <p>The date and time that a copy job is started, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

@end

/**
 
 */
@interface AWSBackupStartRestoreJobInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the IAM role that AWS Backup uses to create the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRoleArn;

/**
 <p>A customer chosen string that can be used to distinguish between calls to <code>StartRestoreJob</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable idempotencyToken;

/**
 <p>A set of metadata key-value pairs. Contains information, such as a resource name, required to restore a recovery point.</p><p> You can get configuration metadata about a resource at the time it was backed up by calling <code>GetRecoveryPointRestoreMetadata</code>. However, values in addition to those provided by <code>GetRecoveryPointRestoreMetadata</code> might be required to restore a resource. For example, you might need to provide a new resource name if the original already exists.</p><p>You need to specify specific metadata to restore an Amazon Elastic File System (Amazon EFS) instance:</p><ul><li><p><code>file-system-id</code>: ID of the Amazon EFS file system that is backed up by AWS Backup. Returned in <code>GetRecoveryPointRestoreMetadata</code>.</p></li><li><p><code>Encrypted</code>: A Boolean value that, if true, specifies that the file system is encrypted. If <code>KmsKeyId</code> is specified, <code>Encrypted</code> must be set to <code>true</code>.</p></li><li><p><code>KmsKeyId</code>: Specifies the AWS KMS key that is used to encrypt the restored file system.</p></li><li><p><code>PerformanceMode</code>: Specifies the throughput mode of the file system.</p></li><li><p><code>CreationToken</code>: A user-supplied value that ensures the uniqueness (idempotency) of the request.</p></li><li><p><code>newFileSystem</code>: A Boolean value that, if true, specifies that the recovery point is restored to a new Amazon EFS file system.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable metadata;

/**
 <p>An ARN that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recoveryPointArn;

/**
 <p>Starts a job to restore a recovery point for one of the following resources:</p><ul><li><p><code>EBS</code> for Amazon Elastic Block Store</p></li><li><p><code>Storage Gateway</code> for AWS Storage Gateway</p></li><li><p><code>RDS</code> for Amazon Relational Database Service</p></li><li><p><code>DDB</code> for Amazon DynamoDB</p></li><li><p><code>EFS</code> for Amazon Elastic File System</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

@end

/**
 
 */
@interface AWSBackupStartRestoreJobOutput : AWSModel


/**
 <p>Uniquely identifies the job that restores a recovery point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable restoreJobId;

@end

/**
 
 */
@interface AWSBackupStopBackupJobInput : AWSRequest


/**
 <p>Uniquely identifies a request to AWS Backup to back up a resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupJobId;

@end

/**
 
 */
@interface AWSBackupTagResourceInput : AWSRequest


/**
 <p>An ARN that uniquely identifies a resource. The format of the ARN depends on the type of the tagged resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>Key-value pairs that are used to help organize your resources. You can assign your own metadata to the resources you create. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSBackupUntagResourceInput : AWSRequest


/**
 <p>An ARN that uniquely identifies a resource. The format of the ARN depends on the type of the tagged resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>A list of keys to identify which key-value tags to remove from a resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeyList;

@end

/**
 
 */
@interface AWSBackupUpdateBackupPlanInput : AWSRequest


/**
 <p>Specifies the body of a backup plan. Includes a <code>BackupPlanName</code> and one or more sets of <code>Rules</code>.</p>
 */
@property (nonatomic, strong) AWSBackupBackupPlanInput * _Nullable backupPlan;

/**
 <p>Uniquely identifies a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanId;

@end

/**
 
 */
@interface AWSBackupUpdateBackupPlanOutput : AWSModel


/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for example, <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanArn;

/**
 <p>Uniquely identifies a backup plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupPlanId;

/**
 <p>The date and time a backup plan is updated, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long. Version Ids cannot be edited.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSBackupUpdateRecoveryPointLifecycleInput : AWSRequest


/**
 <p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultName;

/**
 <p>The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. AWS Backup transitions and expires backups automatically according to the lifecycle that you define. </p><p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, the “expire after days” setting must be 90 days greater than the “transition to cold after days” setting. The “transition to cold after days” setting cannot be changed after a backup has been transitioned to cold. </p>
 */
@property (nonatomic, strong) AWSBackupLifecycle * _Nullable lifecycle;

/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recoveryPointArn;

@end

/**
 
 */
@interface AWSBackupUpdateRecoveryPointLifecycleOutput : AWSModel


/**
 <p>An ARN that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupVaultArn;

/**
 <p>A <code>CalculatedLifecycle</code> object containing <code>DeleteAt</code> and <code>MoveToColdStorageAt</code> timestamps.</p>
 */
@property (nonatomic, strong) AWSBackupCalculatedLifecycle * _Nullable calculatedLifecycle;

/**
 <p>The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. AWS Backup transitions and expires backups automatically according to the lifecycle that you define. </p><p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, the “expire after days” setting must be 90 days greater than the “transition to cold after days” setting. The “transition to cold after days” setting cannot be changed after a backup has been transitioned to cold. </p>
 */
@property (nonatomic, strong) AWSBackupLifecycle * _Nullable lifecycle;

/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recoveryPointArn;

@end

/**
 
 */
@interface AWSBackupUpdateRegionSettingsInput : AWSRequest


/**
 <p>Updates the list of services along with the opt-in preferences for the region.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable resourceTypeOptInPreference;

@end

NS_ASSUME_NONNULL_END
