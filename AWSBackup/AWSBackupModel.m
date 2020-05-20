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

#import "AWSBackupModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSBackupErrorDomain = @"com.amazonaws.AWSBackupErrorDomain";

@implementation AWSBackupBackupJob

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupJobId" : @"BackupJobId",
             @"backupSizeInBytes" : @"BackupSizeInBytes",
             @"backupVaultArn" : @"BackupVaultArn",
             @"backupVaultName" : @"BackupVaultName",
             @"bytesTransferred" : @"BytesTransferred",
             @"completionDate" : @"CompletionDate",
             @"createdBy" : @"CreatedBy",
             @"creationDate" : @"CreationDate",
             @"expectedCompletionDate" : @"ExpectedCompletionDate",
             @"iamRoleArn" : @"IamRoleArn",
             @"percentDone" : @"PercentDone",
             @"recoveryPointArn" : @"RecoveryPointArn",
             @"resourceArn" : @"ResourceArn",
             @"resourceType" : @"ResourceType",
             @"startBy" : @"StartBy",
             @"state" : @"State",
             @"statusMessage" : @"StatusMessage",
             };
}

+ (NSValueTransformer *)completionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)createdByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupRecoveryPointCreator class]];
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)expectedCompletionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateCreated);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStatePending);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateRunning);
        }
        if ([value caseInsensitiveCompare:@"ABORTING"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateAborting);
        }
        if ([value caseInsensitiveCompare:@"ABORTED"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateAborted);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateFailed);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateExpired);
        }
        return @(AWSBackupBackupJobStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSBackupBackupJobStateCreated:
                return @"CREATED";
            case AWSBackupBackupJobStatePending:
                return @"PENDING";
            case AWSBackupBackupJobStateRunning:
                return @"RUNNING";
            case AWSBackupBackupJobStateAborting:
                return @"ABORTING";
            case AWSBackupBackupJobStateAborted:
                return @"ABORTED";
            case AWSBackupBackupJobStateCompleted:
                return @"COMPLETED";
            case AWSBackupBackupJobStateFailed:
                return @"FAILED";
            case AWSBackupBackupJobStateExpired:
                return @"EXPIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSBackupBackupPlan

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanName" : @"BackupPlanName",
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSBackupBackupRule class]];
}

@end

@implementation AWSBackupBackupPlanInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanName" : @"BackupPlanName",
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSBackupBackupRuleInput class]];
}

@end

@implementation AWSBackupBackupPlanTemplatesListMember

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanTemplateId" : @"BackupPlanTemplateId",
             @"backupPlanTemplateName" : @"BackupPlanTemplateName",
             };
}

@end

@implementation AWSBackupBackupPlansListMember

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanArn" : @"BackupPlanArn",
             @"backupPlanId" : @"BackupPlanId",
             @"backupPlanName" : @"BackupPlanName",
             @"creationDate" : @"CreationDate",
             @"creatorRequestId" : @"CreatorRequestId",
             @"deletionDate" : @"DeletionDate",
             @"lastExecutionDate" : @"LastExecutionDate",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)deletionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastExecutionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSBackupBackupRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completionWindowMinutes" : @"CompletionWindowMinutes",
             @"replicateActions" : @"CopyActions",
             @"lifecycle" : @"Lifecycle",
             @"recoveryPointTags" : @"RecoveryPointTags",
             @"ruleId" : @"RuleId",
             @"ruleName" : @"RuleName",
             @"scheduleExpression" : @"ScheduleExpression",
             @"startWindowMinutes" : @"StartWindowMinutes",
             @"targetBackupVaultName" : @"TargetBackupVaultName",
             };
}

+ (NSValueTransformer *)replicateActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSBackupReplicateAction class]];
}

+ (NSValueTransformer *)lifecycleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupLifecycle class]];
}

@end

@implementation AWSBackupBackupRuleInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completionWindowMinutes" : @"CompletionWindowMinutes",
             @"replicateActions" : @"CopyActions",
             @"lifecycle" : @"Lifecycle",
             @"recoveryPointTags" : @"RecoveryPointTags",
             @"ruleName" : @"RuleName",
             @"scheduleExpression" : @"ScheduleExpression",
             @"startWindowMinutes" : @"StartWindowMinutes",
             @"targetBackupVaultName" : @"TargetBackupVaultName",
             };
}

+ (NSValueTransformer *)replicateActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSBackupReplicateAction class]];
}

+ (NSValueTransformer *)lifecycleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupLifecycle class]];
}

@end

@implementation AWSBackupBackupSelection

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"iamRoleArn" : @"IamRoleArn",
             @"listOfTags" : @"ListOfTags",
             @"resources" : @"Resources",
             @"selectionName" : @"SelectionName",
             };
}

+ (NSValueTransformer *)listOfTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSBackupCondition class]];
}

@end

@implementation AWSBackupBackupSelectionsListMember

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanId" : @"BackupPlanId",
             @"creationDate" : @"CreationDate",
             @"creatorRequestId" : @"CreatorRequestId",
             @"iamRoleArn" : @"IamRoleArn",
             @"selectionId" : @"SelectionId",
             @"selectionName" : @"SelectionName",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSBackupBackupVaultListMember

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultArn" : @"BackupVaultArn",
             @"backupVaultName" : @"BackupVaultName",
             @"creationDate" : @"CreationDate",
             @"creatorRequestId" : @"CreatorRequestId",
             @"encryptionKeyArn" : @"EncryptionKeyArn",
             @"numberOfRecoveryPoints" : @"NumberOfRecoveryPoints",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSBackupCalculatedLifecycle

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteAt" : @"DeleteAt",
             @"moveToColdStorageAt" : @"MoveToColdStorageAt",
             };
}

+ (NSValueTransformer *)deleteAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)moveToColdStorageAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSBackupCondition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conditionKey" : @"ConditionKey",
             @"conditionType" : @"ConditionType",
             @"conditionValue" : @"ConditionValue",
             };
}

+ (NSValueTransformer *)conditionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STRINGEQUALS"] == NSOrderedSame) {
            return @(AWSBackupConditionTypeStringequals);
        }
        return @(AWSBackupConditionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSBackupConditionTypeStringequals:
                return @"STRINGEQUALS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSBackupReplicateAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationBackupVaultArn" : @"DestinationBackupVaultArn",
             @"lifecycle" : @"Lifecycle",
             };
}

+ (NSValueTransformer *)lifecycleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupLifecycle class]];
}

@end

@implementation AWSBackupReplicateJob

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupSizeInBytes" : @"BackupSizeInBytes",
             @"completionDate" : @"CompletionDate",
             @"replicateJobId" : @"CopyJobId",
             @"createdBy" : @"CreatedBy",
             @"creationDate" : @"CreationDate",
             @"destinationBackupVaultArn" : @"DestinationBackupVaultArn",
             @"destinationRecoveryPointArn" : @"DestinationRecoveryPointArn",
             @"iamRoleArn" : @"IamRoleArn",
             @"resourceArn" : @"ResourceArn",
             @"resourceType" : @"ResourceType",
             @"sourceBackupVaultArn" : @"SourceBackupVaultArn",
             @"sourceRecoveryPointArn" : @"SourceRecoveryPointArn",
             @"state" : @"State",
             @"statusMessage" : @"StatusMessage",
             };
}

+ (NSValueTransformer *)completionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)createdByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupRecoveryPointCreator class]];
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSBackupReplicateJobStateCreated);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSBackupReplicateJobStateRunning);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSBackupReplicateJobStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSBackupReplicateJobStateFailed);
        }
        return @(AWSBackupReplicateJobStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSBackupReplicateJobStateCreated:
                return @"CREATED";
            case AWSBackupReplicateJobStateRunning:
                return @"RUNNING";
            case AWSBackupReplicateJobStateCompleted:
                return @"COMPLETED";
            case AWSBackupReplicateJobStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSBackupCreateBackupPlanInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlan" : @"BackupPlan",
             @"backupPlanTags" : @"BackupPlanTags",
             @"creatorRequestId" : @"CreatorRequestId",
             };
}

+ (NSValueTransformer *)backupPlanJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupBackupPlanInput class]];
}

@end

@implementation AWSBackupCreateBackupPlanOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanArn" : @"BackupPlanArn",
             @"backupPlanId" : @"BackupPlanId",
             @"creationDate" : @"CreationDate",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSBackupCreateBackupSelectionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanId" : @"BackupPlanId",
             @"backupSelection" : @"BackupSelection",
             @"creatorRequestId" : @"CreatorRequestId",
             };
}

+ (NSValueTransformer *)backupSelectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupBackupSelection class]];
}

@end

@implementation AWSBackupCreateBackupSelectionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanId" : @"BackupPlanId",
             @"creationDate" : @"CreationDate",
             @"selectionId" : @"SelectionId",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSBackupCreateBackupVaultInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultName" : @"BackupVaultName",
             @"backupVaultTags" : @"BackupVaultTags",
             @"creatorRequestId" : @"CreatorRequestId",
             @"encryptionKeyArn" : @"EncryptionKeyArn",
             };
}

@end

@implementation AWSBackupCreateBackupVaultOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultArn" : @"BackupVaultArn",
             @"backupVaultName" : @"BackupVaultName",
             @"creationDate" : @"CreationDate",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSBackupDeleteBackupPlanInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanId" : @"BackupPlanId",
             };
}

@end

@implementation AWSBackupDeleteBackupPlanOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanArn" : @"BackupPlanArn",
             @"backupPlanId" : @"BackupPlanId",
             @"deletionDate" : @"DeletionDate",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)deletionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSBackupDeleteBackupSelectionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanId" : @"BackupPlanId",
             @"selectionId" : @"SelectionId",
             };
}

@end

@implementation AWSBackupDeleteBackupVaultAccessPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultName" : @"BackupVaultName",
             };
}

@end

@implementation AWSBackupDeleteBackupVaultInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultName" : @"BackupVaultName",
             };
}

@end

@implementation AWSBackupDeleteBackupVaultNotificationsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultName" : @"BackupVaultName",
             };
}

@end

@implementation AWSBackupDeleteRecoveryPointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultName" : @"BackupVaultName",
             @"recoveryPointArn" : @"RecoveryPointArn",
             };
}

@end

@implementation AWSBackupDescribeBackupJobInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupJobId" : @"BackupJobId",
             };
}

@end

@implementation AWSBackupDescribeBackupJobOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupJobId" : @"BackupJobId",
             @"backupSizeInBytes" : @"BackupSizeInBytes",
             @"backupVaultArn" : @"BackupVaultArn",
             @"backupVaultName" : @"BackupVaultName",
             @"bytesTransferred" : @"BytesTransferred",
             @"completionDate" : @"CompletionDate",
             @"createdBy" : @"CreatedBy",
             @"creationDate" : @"CreationDate",
             @"expectedCompletionDate" : @"ExpectedCompletionDate",
             @"iamRoleArn" : @"IamRoleArn",
             @"percentDone" : @"PercentDone",
             @"recoveryPointArn" : @"RecoveryPointArn",
             @"resourceArn" : @"ResourceArn",
             @"resourceType" : @"ResourceType",
             @"startBy" : @"StartBy",
             @"state" : @"State",
             @"statusMessage" : @"StatusMessage",
             };
}

+ (NSValueTransformer *)completionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)createdByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupRecoveryPointCreator class]];
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)expectedCompletionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateCreated);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStatePending);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateRunning);
        }
        if ([value caseInsensitiveCompare:@"ABORTING"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateAborting);
        }
        if ([value caseInsensitiveCompare:@"ABORTED"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateAborted);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateFailed);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateExpired);
        }
        return @(AWSBackupBackupJobStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSBackupBackupJobStateCreated:
                return @"CREATED";
            case AWSBackupBackupJobStatePending:
                return @"PENDING";
            case AWSBackupBackupJobStateRunning:
                return @"RUNNING";
            case AWSBackupBackupJobStateAborting:
                return @"ABORTING";
            case AWSBackupBackupJobStateAborted:
                return @"ABORTED";
            case AWSBackupBackupJobStateCompleted:
                return @"COMPLETED";
            case AWSBackupBackupJobStateFailed:
                return @"FAILED";
            case AWSBackupBackupJobStateExpired:
                return @"EXPIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSBackupDescribeBackupVaultInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultName" : @"BackupVaultName",
             };
}

@end

@implementation AWSBackupDescribeBackupVaultOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultArn" : @"BackupVaultArn",
             @"backupVaultName" : @"BackupVaultName",
             @"creationDate" : @"CreationDate",
             @"creatorRequestId" : @"CreatorRequestId",
             @"encryptionKeyArn" : @"EncryptionKeyArn",
             @"numberOfRecoveryPoints" : @"NumberOfRecoveryPoints",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSBackupDescribeCopyJobInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicateJobId" : @"CopyJobId",
             };
}

@end

@implementation AWSBackupDescribeCopyJobOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicateJob" : @"CopyJob",
             };
}

+ (NSValueTransformer *)replicateJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupReplicateJob class]];
}

@end

@implementation AWSBackupDescribeProtectedResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSBackupDescribeProtectedResourceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastBackupTime" : @"LastBackupTime",
             @"resourceArn" : @"ResourceArn",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)lastBackupTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSBackupDescribeRecoveryPointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultName" : @"BackupVaultName",
             @"recoveryPointArn" : @"RecoveryPointArn",
             };
}

@end

@implementation AWSBackupDescribeRecoveryPointOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupSizeInBytes" : @"BackupSizeInBytes",
             @"backupVaultArn" : @"BackupVaultArn",
             @"backupVaultName" : @"BackupVaultName",
             @"calculatedLifecycle" : @"CalculatedLifecycle",
             @"completionDate" : @"CompletionDate",
             @"createdBy" : @"CreatedBy",
             @"creationDate" : @"CreationDate",
             @"encryptionKeyArn" : @"EncryptionKeyArn",
             @"iamRoleArn" : @"IamRoleArn",
             @"isEncrypted" : @"IsEncrypted",
             @"lastRestoreTime" : @"LastRestoreTime",
             @"lifecycle" : @"Lifecycle",
             @"recoveryPointArn" : @"RecoveryPointArn",
             @"resourceArn" : @"ResourceArn",
             @"resourceType" : @"ResourceType",
             @"status" : @"Status",
             @"storageClass" : @"StorageClass",
             };
}

+ (NSValueTransformer *)calculatedLifecycleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupCalculatedLifecycle class]];
}

+ (NSValueTransformer *)completionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)createdByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupRecoveryPointCreator class]];
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastRestoreTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lifecycleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupLifecycle class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSBackupRecoveryPointStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL"] == NSOrderedSame) {
            return @(AWSBackupRecoveryPointStatusPartial);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSBackupRecoveryPointStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSBackupRecoveryPointStatusExpired);
        }
        return @(AWSBackupRecoveryPointStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSBackupRecoveryPointStatusCompleted:
                return @"COMPLETED";
            case AWSBackupRecoveryPointStatusPartial:
                return @"PARTIAL";
            case AWSBackupRecoveryPointStatusDeleting:
                return @"DELETING";
            case AWSBackupRecoveryPointStatusExpired:
                return @"EXPIRED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)storageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WARM"] == NSOrderedSame) {
            return @(AWSBackupStorageClassWarm);
        }
        if ([value caseInsensitiveCompare:@"COLD"] == NSOrderedSame) {
            return @(AWSBackupStorageClassCold);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSBackupStorageClassDeleted);
        }
        return @(AWSBackupStorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSBackupStorageClassWarm:
                return @"WARM";
            case AWSBackupStorageClassCold:
                return @"COLD";
            case AWSBackupStorageClassDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSBackupDescribeRegionSettingsInput

@end

@implementation AWSBackupDescribeRegionSettingsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceTypeOptInPreference" : @"ResourceTypeOptInPreference",
             };
}

@end

@implementation AWSBackupDescribeRestoreJobInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"restoreJobId" : @"RestoreJobId",
             };
}

@end

@implementation AWSBackupDescribeRestoreJobOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupSizeInBytes" : @"BackupSizeInBytes",
             @"completionDate" : @"CompletionDate",
             @"createdResourceArn" : @"CreatedResourceArn",
             @"creationDate" : @"CreationDate",
             @"expectedCompletionTimeMinutes" : @"ExpectedCompletionTimeMinutes",
             @"iamRoleArn" : @"IamRoleArn",
             @"percentDone" : @"PercentDone",
             @"recoveryPointArn" : @"RecoveryPointArn",
             @"restoreJobId" : @"RestoreJobId",
             @"status" : @"Status",
             @"statusMessage" : @"StatusMessage",
             };
}

+ (NSValueTransformer *)completionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSBackupRestoreJobStatusPending);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSBackupRestoreJobStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSBackupRestoreJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"ABORTED"] == NSOrderedSame) {
            return @(AWSBackupRestoreJobStatusAborted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSBackupRestoreJobStatusFailed);
        }
        return @(AWSBackupRestoreJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSBackupRestoreJobStatusPending:
                return @"PENDING";
            case AWSBackupRestoreJobStatusRunning:
                return @"RUNNING";
            case AWSBackupRestoreJobStatusCompleted:
                return @"COMPLETED";
            case AWSBackupRestoreJobStatusAborted:
                return @"ABORTED";
            case AWSBackupRestoreJobStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSBackupExportBackupPlanTemplateInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanId" : @"BackupPlanId",
             };
}

@end

@implementation AWSBackupExportBackupPlanTemplateOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanTemplateJson" : @"BackupPlanTemplateJson",
             };
}

@end

@implementation AWSBackupGetBackupPlanFromJSONInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanTemplateJson" : @"BackupPlanTemplateJson",
             };
}

@end

@implementation AWSBackupGetBackupPlanFromJSONOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlan" : @"BackupPlan",
             };
}

+ (NSValueTransformer *)backupPlanJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupBackupPlan class]];
}

@end

@implementation AWSBackupGetBackupPlanFromTemplateInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanTemplateId" : @"BackupPlanTemplateId",
             };
}

@end

@implementation AWSBackupGetBackupPlanFromTemplateOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanDocument" : @"BackupPlanDocument",
             };
}

+ (NSValueTransformer *)backupPlanDocumentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupBackupPlan class]];
}

@end

@implementation AWSBackupGetBackupPlanInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanId" : @"BackupPlanId",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSBackupGetBackupPlanOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlan" : @"BackupPlan",
             @"backupPlanArn" : @"BackupPlanArn",
             @"backupPlanId" : @"BackupPlanId",
             @"creationDate" : @"CreationDate",
             @"creatorRequestId" : @"CreatorRequestId",
             @"deletionDate" : @"DeletionDate",
             @"lastExecutionDate" : @"LastExecutionDate",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)backupPlanJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupBackupPlan class]];
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)deletionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastExecutionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSBackupGetBackupSelectionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanId" : @"BackupPlanId",
             @"selectionId" : @"SelectionId",
             };
}

@end

@implementation AWSBackupGetBackupSelectionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanId" : @"BackupPlanId",
             @"backupSelection" : @"BackupSelection",
             @"creationDate" : @"CreationDate",
             @"creatorRequestId" : @"CreatorRequestId",
             @"selectionId" : @"SelectionId",
             };
}

+ (NSValueTransformer *)backupSelectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupBackupSelection class]];
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSBackupGetBackupVaultAccessPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultName" : @"BackupVaultName",
             };
}

@end

@implementation AWSBackupGetBackupVaultAccessPolicyOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultArn" : @"BackupVaultArn",
             @"backupVaultName" : @"BackupVaultName",
             @"policy" : @"Policy",
             };
}

@end

@implementation AWSBackupGetBackupVaultNotificationsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultName" : @"BackupVaultName",
             };
}

@end

@implementation AWSBackupGetBackupVaultNotificationsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultArn" : @"BackupVaultArn",
             @"backupVaultEvents" : @"BackupVaultEvents",
             @"backupVaultName" : @"BackupVaultName",
             @"SNSTopicArn" : @"SNSTopicArn",
             };
}

@end

@implementation AWSBackupGetRecoveryPointRestoreMetadataInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultName" : @"BackupVaultName",
             @"recoveryPointArn" : @"RecoveryPointArn",
             };
}

@end

@implementation AWSBackupGetRecoveryPointRestoreMetadataOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultArn" : @"BackupVaultArn",
             @"recoveryPointArn" : @"RecoveryPointArn",
             @"restoreMetadata" : @"RestoreMetadata",
             };
}

@end

@implementation AWSBackupGetSupportedResourceTypesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceTypes" : @"ResourceTypes",
             };
}

@end

@implementation AWSBackupLifecycle

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteAfterDays" : @"DeleteAfterDays",
             @"moveToColdStorageAfterDays" : @"MoveToColdStorageAfterDays",
             };
}

@end

@implementation AWSBackupListBackupJobsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"byBackupVaultName" : @"ByBackupVaultName",
             @"byCreatedAfter" : @"ByCreatedAfter",
             @"byCreatedBefore" : @"ByCreatedBefore",
             @"byResourceArn" : @"ByResourceArn",
             @"byResourceType" : @"ByResourceType",
             @"byState" : @"ByState",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)byCreatedAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)byCreatedBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)byStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateCreated);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStatePending);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateRunning);
        }
        if ([value caseInsensitiveCompare:@"ABORTING"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateAborting);
        }
        if ([value caseInsensitiveCompare:@"ABORTED"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateAborted);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateFailed);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSBackupBackupJobStateExpired);
        }
        return @(AWSBackupBackupJobStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSBackupBackupJobStateCreated:
                return @"CREATED";
            case AWSBackupBackupJobStatePending:
                return @"PENDING";
            case AWSBackupBackupJobStateRunning:
                return @"RUNNING";
            case AWSBackupBackupJobStateAborting:
                return @"ABORTING";
            case AWSBackupBackupJobStateAborted:
                return @"ABORTED";
            case AWSBackupBackupJobStateCompleted:
                return @"COMPLETED";
            case AWSBackupBackupJobStateFailed:
                return @"FAILED";
            case AWSBackupBackupJobStateExpired:
                return @"EXPIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSBackupListBackupJobsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupJobs" : @"BackupJobs",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)backupJobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSBackupBackupJob class]];
}

@end

@implementation AWSBackupListBackupPlanTemplatesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSBackupListBackupPlanTemplatesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanTemplatesList" : @"BackupPlanTemplatesList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)backupPlanTemplatesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSBackupBackupPlanTemplatesListMember class]];
}

@end

@implementation AWSBackupListBackupPlanVersionsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanId" : @"BackupPlanId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSBackupListBackupPlanVersionsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanVersionsList" : @"BackupPlanVersionsList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)backupPlanVersionsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSBackupBackupPlansListMember class]];
}

@end

@implementation AWSBackupListBackupPlansInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"includeDeleted" : @"IncludeDeleted",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSBackupListBackupPlansOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlansList" : @"BackupPlansList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)backupPlansListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSBackupBackupPlansListMember class]];
}

@end

@implementation AWSBackupListBackupSelectionsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanId" : @"BackupPlanId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSBackupListBackupSelectionsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupSelectionsList" : @"BackupSelectionsList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)backupSelectionsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSBackupBackupSelectionsListMember class]];
}

@end

@implementation AWSBackupListBackupVaultsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSBackupListBackupVaultsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultList" : @"BackupVaultList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)backupVaultListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSBackupBackupVaultListMember class]];
}

@end

@implementation AWSBackupListCopyJobsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"byCreatedAfter" : @"ByCreatedAfter",
             @"byCreatedBefore" : @"ByCreatedBefore",
             @"byDestinationVaultArn" : @"ByDestinationVaultArn",
             @"byResourceArn" : @"ByResourceArn",
             @"byResourceType" : @"ByResourceType",
             @"byState" : @"ByState",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)byCreatedAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)byCreatedBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)byStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSBackupReplicateJobStateCreated);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSBackupReplicateJobStateRunning);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSBackupReplicateJobStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSBackupReplicateJobStateFailed);
        }
        return @(AWSBackupReplicateJobStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSBackupReplicateJobStateCreated:
                return @"CREATED";
            case AWSBackupReplicateJobStateRunning:
                return @"RUNNING";
            case AWSBackupReplicateJobStateCompleted:
                return @"COMPLETED";
            case AWSBackupReplicateJobStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSBackupListCopyJobsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicateJobs" : @"CopyJobs",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)replicateJobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSBackupReplicateJob class]];
}

@end

@implementation AWSBackupListProtectedResourcesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSBackupListProtectedResourcesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"results" : @"Results",
             };
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSBackupProtectedResource class]];
}

@end

@implementation AWSBackupListRecoveryPointsByBackupVaultInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultName" : @"BackupVaultName",
             @"byBackupPlanId" : @"ByBackupPlanId",
             @"byCreatedAfter" : @"ByCreatedAfter",
             @"byCreatedBefore" : @"ByCreatedBefore",
             @"byResourceArn" : @"ByResourceArn",
             @"byResourceType" : @"ByResourceType",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)byCreatedAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)byCreatedBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSBackupListRecoveryPointsByBackupVaultOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"recoveryPoints" : @"RecoveryPoints",
             };
}

+ (NSValueTransformer *)recoveryPointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSBackupRecoveryPointByBackupVault class]];
}

@end

@implementation AWSBackupListRecoveryPointsByResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSBackupListRecoveryPointsByResourceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"recoveryPoints" : @"RecoveryPoints",
             };
}

+ (NSValueTransformer *)recoveryPointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSBackupRecoveryPointByResource class]];
}

@end

@implementation AWSBackupListRestoreJobsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSBackupListRestoreJobsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"restoreJobs" : @"RestoreJobs",
             };
}

+ (NSValueTransformer *)restoreJobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSBackupRestoreJobsListMember class]];
}

@end

@implementation AWSBackupListTagsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSBackupListTagsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSBackupProtectedResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastBackupTime" : @"LastBackupTime",
             @"resourceArn" : @"ResourceArn",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)lastBackupTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSBackupPutBackupVaultAccessPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultName" : @"BackupVaultName",
             @"policy" : @"Policy",
             };
}

@end

@implementation AWSBackupPutBackupVaultNotificationsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultEvents" : @"BackupVaultEvents",
             @"backupVaultName" : @"BackupVaultName",
             @"SNSTopicArn" : @"SNSTopicArn",
             };
}

@end

@implementation AWSBackupRecoveryPointByBackupVault

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupSizeInBytes" : @"BackupSizeInBytes",
             @"backupVaultArn" : @"BackupVaultArn",
             @"backupVaultName" : @"BackupVaultName",
             @"calculatedLifecycle" : @"CalculatedLifecycle",
             @"completionDate" : @"CompletionDate",
             @"createdBy" : @"CreatedBy",
             @"creationDate" : @"CreationDate",
             @"encryptionKeyArn" : @"EncryptionKeyArn",
             @"iamRoleArn" : @"IamRoleArn",
             @"isEncrypted" : @"IsEncrypted",
             @"lastRestoreTime" : @"LastRestoreTime",
             @"lifecycle" : @"Lifecycle",
             @"recoveryPointArn" : @"RecoveryPointArn",
             @"resourceArn" : @"ResourceArn",
             @"resourceType" : @"ResourceType",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)calculatedLifecycleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupCalculatedLifecycle class]];
}

+ (NSValueTransformer *)completionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)createdByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupRecoveryPointCreator class]];
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastRestoreTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lifecycleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupLifecycle class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSBackupRecoveryPointStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL"] == NSOrderedSame) {
            return @(AWSBackupRecoveryPointStatusPartial);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSBackupRecoveryPointStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSBackupRecoveryPointStatusExpired);
        }
        return @(AWSBackupRecoveryPointStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSBackupRecoveryPointStatusCompleted:
                return @"COMPLETED";
            case AWSBackupRecoveryPointStatusPartial:
                return @"PARTIAL";
            case AWSBackupRecoveryPointStatusDeleting:
                return @"DELETING";
            case AWSBackupRecoveryPointStatusExpired:
                return @"EXPIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSBackupRecoveryPointByResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupSizeBytes" : @"BackupSizeBytes",
             @"backupVaultName" : @"BackupVaultName",
             @"creationDate" : @"CreationDate",
             @"encryptionKeyArn" : @"EncryptionKeyArn",
             @"recoveryPointArn" : @"RecoveryPointArn",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSBackupRecoveryPointStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL"] == NSOrderedSame) {
            return @(AWSBackupRecoveryPointStatusPartial);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSBackupRecoveryPointStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSBackupRecoveryPointStatusExpired);
        }
        return @(AWSBackupRecoveryPointStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSBackupRecoveryPointStatusCompleted:
                return @"COMPLETED";
            case AWSBackupRecoveryPointStatusPartial:
                return @"PARTIAL";
            case AWSBackupRecoveryPointStatusDeleting:
                return @"DELETING";
            case AWSBackupRecoveryPointStatusExpired:
                return @"EXPIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSBackupRecoveryPointCreator

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanArn" : @"BackupPlanArn",
             @"backupPlanId" : @"BackupPlanId",
             @"backupPlanVersion" : @"BackupPlanVersion",
             @"backupRuleId" : @"BackupRuleId",
             };
}

@end

@implementation AWSBackupRestoreJobsListMember

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupSizeInBytes" : @"BackupSizeInBytes",
             @"completionDate" : @"CompletionDate",
             @"createdResourceArn" : @"CreatedResourceArn",
             @"creationDate" : @"CreationDate",
             @"expectedCompletionTimeMinutes" : @"ExpectedCompletionTimeMinutes",
             @"iamRoleArn" : @"IamRoleArn",
             @"percentDone" : @"PercentDone",
             @"recoveryPointArn" : @"RecoveryPointArn",
             @"restoreJobId" : @"RestoreJobId",
             @"status" : @"Status",
             @"statusMessage" : @"StatusMessage",
             };
}

+ (NSValueTransformer *)completionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSBackupRestoreJobStatusPending);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSBackupRestoreJobStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSBackupRestoreJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"ABORTED"] == NSOrderedSame) {
            return @(AWSBackupRestoreJobStatusAborted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSBackupRestoreJobStatusFailed);
        }
        return @(AWSBackupRestoreJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSBackupRestoreJobStatusPending:
                return @"PENDING";
            case AWSBackupRestoreJobStatusRunning:
                return @"RUNNING";
            case AWSBackupRestoreJobStatusCompleted:
                return @"COMPLETED";
            case AWSBackupRestoreJobStatusAborted:
                return @"ABORTED";
            case AWSBackupRestoreJobStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSBackupStartBackupJobInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultName" : @"BackupVaultName",
             @"completeWindowMinutes" : @"CompleteWindowMinutes",
             @"iamRoleArn" : @"IamRoleArn",
             @"idempotencyToken" : @"IdempotencyToken",
             @"lifecycle" : @"Lifecycle",
             @"recoveryPointTags" : @"RecoveryPointTags",
             @"resourceArn" : @"ResourceArn",
             @"startWindowMinutes" : @"StartWindowMinutes",
             };
}

+ (NSValueTransformer *)lifecycleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupLifecycle class]];
}

@end

@implementation AWSBackupStartBackupJobOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupJobId" : @"BackupJobId",
             @"creationDate" : @"CreationDate",
             @"recoveryPointArn" : @"RecoveryPointArn",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSBackupStartCopyJobInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationBackupVaultArn" : @"DestinationBackupVaultArn",
             @"iamRoleArn" : @"IamRoleArn",
             @"idempotencyToken" : @"IdempotencyToken",
             @"lifecycle" : @"Lifecycle",
             @"recoveryPointArn" : @"RecoveryPointArn",
             @"sourceBackupVaultName" : @"SourceBackupVaultName",
             };
}

+ (NSValueTransformer *)lifecycleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupLifecycle class]];
}

@end

@implementation AWSBackupStartCopyJobOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicateJobId" : @"CopyJobId",
             @"creationDate" : @"CreationDate",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSBackupStartRestoreJobInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"iamRoleArn" : @"IamRoleArn",
             @"idempotencyToken" : @"IdempotencyToken",
             @"metadata" : @"Metadata",
             @"recoveryPointArn" : @"RecoveryPointArn",
             @"resourceType" : @"ResourceType",
             };
}

@end

@implementation AWSBackupStartRestoreJobOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"restoreJobId" : @"RestoreJobId",
             };
}

@end

@implementation AWSBackupStopBackupJobInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupJobId" : @"BackupJobId",
             };
}

@end

@implementation AWSBackupTagResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSBackupUntagResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeyList" : @"TagKeyList",
             };
}

@end

@implementation AWSBackupUpdateBackupPlanInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlan" : @"BackupPlan",
             @"backupPlanId" : @"BackupPlanId",
             };
}

+ (NSValueTransformer *)backupPlanJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupBackupPlanInput class]];
}

@end

@implementation AWSBackupUpdateBackupPlanOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupPlanArn" : @"BackupPlanArn",
             @"backupPlanId" : @"BackupPlanId",
             @"creationDate" : @"CreationDate",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSBackupUpdateRecoveryPointLifecycleInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultName" : @"BackupVaultName",
             @"lifecycle" : @"Lifecycle",
             @"recoveryPointArn" : @"RecoveryPointArn",
             };
}

+ (NSValueTransformer *)lifecycleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupLifecycle class]];
}

@end

@implementation AWSBackupUpdateRecoveryPointLifecycleOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupVaultArn" : @"BackupVaultArn",
             @"calculatedLifecycle" : @"CalculatedLifecycle",
             @"lifecycle" : @"Lifecycle",
             @"recoveryPointArn" : @"RecoveryPointArn",
             };
}

+ (NSValueTransformer *)calculatedLifecycleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupCalculatedLifecycle class]];
}

+ (NSValueTransformer *)lifecycleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSBackupLifecycle class]];
}

@end

@implementation AWSBackupUpdateRegionSettingsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceTypeOptInPreference" : @"ResourceTypeOptInPreference",
             };
}

@end
