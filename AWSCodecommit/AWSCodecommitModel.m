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

#import "AWSCodecommitModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSCodecommitErrorDomain = @"com.amazonaws.AWSCodecommitErrorDomain";

@implementation AWSCodecommitApproval

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalState" : @"approvalState",
             @"userArn" : @"userArn",
             };
}

+ (NSValueTransformer *)approvalStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"APPROVE"] == NSOrderedSame) {
            return @(AWSCodecommitApprovalStateApprove);
        }
        if ([value caseInsensitiveCompare:@"REVOKE"] == NSOrderedSame) {
            return @(AWSCodecommitApprovalStateRevoke);
        }
        return @(AWSCodecommitApprovalStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitApprovalStateApprove:
                return @"APPROVE";
            case AWSCodecommitApprovalStateRevoke:
                return @"REVOKE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitApprovalRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleContent" : @"approvalRuleContent",
             @"approvalRuleId" : @"approvalRuleId",
             @"approvalRuleName" : @"approvalRuleName",
             @"creationDate" : @"creationDate",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"lastModifiedUser" : @"lastModifiedUser",
             @"originApprovalRuleTemplate" : @"originApprovalRuleTemplate",
             @"ruleContentSha256" : @"ruleContentSha256",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)originApprovalRuleTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitOriginApprovalRuleTemplate class]];
}

@end

@implementation AWSCodecommitApprovalRuleEventMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleContent" : @"approvalRuleContent",
             @"approvalRuleId" : @"approvalRuleId",
             @"approvalRuleName" : @"approvalRuleName",
             };
}

@end

@implementation AWSCodecommitApprovalRuleOverriddenEventMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"overrideStatus" : @"overrideStatus",
             @"revisionId" : @"revisionId",
             };
}

+ (NSValueTransformer *)overrideStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OVERRIDE"] == NSOrderedSame) {
            return @(AWSCodecommitOverrideStatusOverride);
        }
        if ([value caseInsensitiveCompare:@"REVOKE"] == NSOrderedSame) {
            return @(AWSCodecommitOverrideStatusRevoke);
        }
        return @(AWSCodecommitOverrideStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitOverrideStatusOverride:
                return @"OVERRIDE";
            case AWSCodecommitOverrideStatusRevoke:
                return @"REVOKE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitApprovalRuleTemplate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleTemplateContent" : @"approvalRuleTemplateContent",
             @"approvalRuleTemplateDescription" : @"approvalRuleTemplateDescription",
             @"approvalRuleTemplateId" : @"approvalRuleTemplateId",
             @"approvalRuleTemplateName" : @"approvalRuleTemplateName",
             @"creationDate" : @"creationDate",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"lastModifiedUser" : @"lastModifiedUser",
             @"ruleContentSha256" : @"ruleContentSha256",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSCodecommitApprovalStateChangedEventMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalStatus" : @"approvalStatus",
             @"revisionId" : @"revisionId",
             };
}

+ (NSValueTransformer *)approvalStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"APPROVE"] == NSOrderedSame) {
            return @(AWSCodecommitApprovalStateApprove);
        }
        if ([value caseInsensitiveCompare:@"REVOKE"] == NSOrderedSame) {
            return @(AWSCodecommitApprovalStateRevoke);
        }
        return @(AWSCodecommitApprovalStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitApprovalStateApprove:
                return @"APPROVE";
            case AWSCodecommitApprovalStateRevoke:
                return @"REVOKE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitAssociateApprovalRuleTemplateWithRepositoryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleTemplateName" : @"approvalRuleTemplateName",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"errorCode",
             @"errorMessage" : @"errorMessage",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleTemplateName" : @"approvalRuleTemplateName",
             @"repositoryNames" : @"repositoryNames",
             };
}

@end

@implementation AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associatedRepositoryNames" : @"associatedRepositoryNames",
             @"errors" : @"errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesError class]];
}

@end

@implementation AWSCodecommitBatchDescribeMergeConflictsError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exceptionName" : @"exceptionName",
             @"filePath" : @"filePath",
             @"message" : @"message",
             };
}

@end

@implementation AWSCodecommitBatchDescribeMergeConflictsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conflictDetailLevel" : @"conflictDetailLevel",
             @"conflictResolutionStrategy" : @"conflictResolutionStrategy",
             @"destinationCommitSpecifier" : @"destinationCommitSpecifier",
             @"filePaths" : @"filePaths",
             @"maxConflictFiles" : @"maxConflictFiles",
             @"maxMergeHunks" : @"maxMergeHunks",
             @"mergeOption" : @"mergeOption",
             @"nextToken" : @"nextToken",
             @"repositoryName" : @"repositoryName",
             @"sourceCommitSpecifier" : @"sourceCommitSpecifier",
             };
}

+ (NSValueTransformer *)conflictDetailLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILE_LEVEL"] == NSOrderedSame) {
            return @(AWSCodecommitConflictDetailLevelTypeEnumFileLevel);
        }
        if ([value caseInsensitiveCompare:@"LINE_LEVEL"] == NSOrderedSame) {
            return @(AWSCodecommitConflictDetailLevelTypeEnumLineLevel);
        }
        return @(AWSCodecommitConflictDetailLevelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitConflictDetailLevelTypeEnumFileLevel:
                return @"FILE_LEVEL";
            case AWSCodecommitConflictDetailLevelTypeEnumLineLevel:
                return @"LINE_LEVEL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)conflictResolutionStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumNone);
        }
        if ([value caseInsensitiveCompare:@"ACCEPT_SOURCE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource);
        }
        if ([value caseInsensitiveCompare:@"ACCEPT_DESTINATION"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination);
        }
        if ([value caseInsensitiveCompare:@"AUTOMERGE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge);
        }
        return @(AWSCodecommitConflictResolutionStrategyTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitConflictResolutionStrategyTypeEnumNone:
                return @"NONE";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource:
                return @"ACCEPT_SOURCE";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination:
                return @"ACCEPT_DESTINATION";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge:
                return @"AUTOMERGE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mergeOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FAST_FORWARD_MERGE"] == NSOrderedSame) {
            return @(AWSCodecommitMergeOptionTypeEnumFastForwardMerge);
        }
        if ([value caseInsensitiveCompare:@"SQUASH_MERGE"] == NSOrderedSame) {
            return @(AWSCodecommitMergeOptionTypeEnumSquashMerge);
        }
        if ([value caseInsensitiveCompare:@"THREE_WAY_MERGE"] == NSOrderedSame) {
            return @(AWSCodecommitMergeOptionTypeEnumThreeWayMerge);
        }
        return @(AWSCodecommitMergeOptionTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitMergeOptionTypeEnumFastForwardMerge:
                return @"FAST_FORWARD_MERGE";
            case AWSCodecommitMergeOptionTypeEnumSquashMerge:
                return @"SQUASH_MERGE";
            case AWSCodecommitMergeOptionTypeEnumThreeWayMerge:
                return @"THREE_WAY_MERGE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitBatchDescribeMergeConflictsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baseCommitId" : @"baseCommitId",
             @"conflicts" : @"conflicts",
             @"destinationCommitId" : @"destinationCommitId",
             @"errors" : @"errors",
             @"nextToken" : @"nextToken",
             @"sourceCommitId" : @"sourceCommitId",
             };
}

+ (NSValueTransformer *)conflictsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitConflict class]];
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitBatchDescribeMergeConflictsError class]];
}

@end

@implementation AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"errorCode",
             @"errorMessage" : @"errorMessage",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleTemplateName" : @"approvalRuleTemplateName",
             @"repositoryNames" : @"repositoryNames",
             };
}

@end

@implementation AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"disassociatedRepositoryNames" : @"disassociatedRepositoryNames",
             @"errors" : @"errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesError class]];
}

@end

@implementation AWSCodecommitBatchGetCommitsError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commitId" : @"commitId",
             @"errorCode" : @"errorCode",
             @"errorMessage" : @"errorMessage",
             };
}

@end

@implementation AWSCodecommitBatchGetCommitsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commitIds" : @"commitIds",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitBatchGetCommitsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commits" : @"commits",
             @"errors" : @"errors",
             };
}

+ (NSValueTransformer *)commitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitCommit class]];
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitBatchGetCommitsError class]];
}

@end

@implementation AWSCodecommitBatchGetRepositoriesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repositoryNames" : @"repositoryNames",
             };
}

@end

@implementation AWSCodecommitBatchGetRepositoriesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repositories" : @"repositories",
             @"repositoriesNotFound" : @"repositoriesNotFound",
             };
}

+ (NSValueTransformer *)repositoriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitRepositoryMetadata class]];
}

@end

@implementation AWSCodecommitBlobMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blobId" : @"blobId",
             @"mode" : @"mode",
             @"path" : @"path",
             };
}

@end

@implementation AWSCodecommitBranchInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branchName" : @"branchName",
             @"commitId" : @"commitId",
             };
}

@end

@implementation AWSCodecommitComment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorArn" : @"authorArn",
             @"callerReactions" : @"callerReactions",
             @"clientRequestToken" : @"clientRequestToken",
             @"commentId" : @"commentId",
             @"content" : @"content",
             @"creationDate" : @"creationDate",
             @"deleted" : @"deleted",
             @"inReplyTo" : @"inReplyTo",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"reactionCounts" : @"reactionCounts",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSCodecommitCommentsForComparedCommit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"afterBlobId" : @"afterBlobId",
             @"afterCommitId" : @"afterCommitId",
             @"beforeBlobId" : @"beforeBlobId",
             @"beforeCommitId" : @"beforeCommitId",
             @"comments" : @"comments",
             @"location" : @"location",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)commentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitComment class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitLocation class]];
}

@end

@implementation AWSCodecommitCommentsForPullRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"afterBlobId" : @"afterBlobId",
             @"afterCommitId" : @"afterCommitId",
             @"beforeBlobId" : @"beforeBlobId",
             @"beforeCommitId" : @"beforeCommitId",
             @"comments" : @"comments",
             @"location" : @"location",
             @"pullRequestId" : @"pullRequestId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)commentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitComment class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitLocation class]];
}

@end

@implementation AWSCodecommitCommit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalData" : @"additionalData",
             @"author" : @"author",
             @"commitId" : @"commitId",
             @"committer" : @"committer",
             @"message" : @"message",
             @"parents" : @"parents",
             @"treeId" : @"treeId",
             };
}

+ (NSValueTransformer *)authorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitUserInfo class]];
}

+ (NSValueTransformer *)committerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitUserInfo class]];
}

@end

@implementation AWSCodecommitConflict

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conflictMetadata" : @"conflictMetadata",
             @"mergeHunks" : @"mergeHunks",
             };
}

+ (NSValueTransformer *)conflictMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitConflictMetadata class]];
}

+ (NSValueTransformer *)mergeHunksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitMergeHunk class]];
}

@end

@implementation AWSCodecommitConflictMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentConflict" : @"contentConflict",
             @"fileModeConflict" : @"fileModeConflict",
             @"fileModes" : @"fileModes",
             @"filePath" : @"filePath",
             @"fileSizes" : @"fileSizes",
             @"isBinaryFile" : @"isBinaryFile",
             @"mergeOperations" : @"mergeOperations",
             @"numberOfConflicts" : @"numberOfConflicts",
             @"objectTypeConflict" : @"objectTypeConflict",
             @"objectTypes" : @"objectTypes",
             };
}

+ (NSValueTransformer *)fileModesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitFileModes class]];
}

+ (NSValueTransformer *)fileSizesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitFileSizes class]];
}

+ (NSValueTransformer *)isBinaryFileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitIsBinaryFile class]];
}

+ (NSValueTransformer *)mergeOperationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitMergeOperations class]];
}

+ (NSValueTransformer *)objectTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitObjectTypes class]];
}

@end

@implementation AWSCodecommitConflictResolution

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteFiles" : @"deleteFiles",
             @"replaceContents" : @"replaceContents",
             @"setFileModes" : @"setFileModes",
             };
}

+ (NSValueTransformer *)deleteFilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitDeleteFileEntry class]];
}

+ (NSValueTransformer *)replaceContentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitReplaceContentEntry class]];
}

+ (NSValueTransformer *)setFileModesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitSetFileModeEntry class]];
}

@end

@implementation AWSCodecommitCreateApprovalRuleTemplateInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleTemplateContent" : @"approvalRuleTemplateContent",
             @"approvalRuleTemplateDescription" : @"approvalRuleTemplateDescription",
             @"approvalRuleTemplateName" : @"approvalRuleTemplateName",
             };
}

@end

@implementation AWSCodecommitCreateApprovalRuleTemplateOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleTemplate" : @"approvalRuleTemplate",
             };
}

+ (NSValueTransformer *)approvalRuleTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitApprovalRuleTemplate class]];
}

@end

@implementation AWSCodecommitCreateBranchInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branchName" : @"branchName",
             @"commitId" : @"commitId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitCreateCommitInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorName" : @"authorName",
             @"branchName" : @"branchName",
             @"commitMessage" : @"commitMessage",
             @"deleteFiles" : @"deleteFiles",
             @"email" : @"email",
             @"keepEmptyFolders" : @"keepEmptyFolders",
             @"parentCommitId" : @"parentCommitId",
             @"putFiles" : @"putFiles",
             @"repositoryName" : @"repositoryName",
             @"setFileModes" : @"setFileModes",
             };
}

+ (NSValueTransformer *)deleteFilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitDeleteFileEntry class]];
}

+ (NSValueTransformer *)putFilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitPutFileEntry class]];
}

+ (NSValueTransformer *)setFileModesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitSetFileModeEntry class]];
}

@end

@implementation AWSCodecommitCreateCommitOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commitId" : @"commitId",
             @"filesAdded" : @"filesAdded",
             @"filesDeleted" : @"filesDeleted",
             @"filesUpdated" : @"filesUpdated",
             @"treeId" : @"treeId",
             };
}

+ (NSValueTransformer *)filesAddedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitFileMetadata class]];
}

+ (NSValueTransformer *)filesDeletedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitFileMetadata class]];
}

+ (NSValueTransformer *)filesUpdatedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitFileMetadata class]];
}

@end

@implementation AWSCodecommitCreatePullRequestApprovalRuleInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleContent" : @"approvalRuleContent",
             @"approvalRuleName" : @"approvalRuleName",
             @"pullRequestId" : @"pullRequestId",
             };
}

@end

@implementation AWSCodecommitCreatePullRequestApprovalRuleOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRule" : @"approvalRule",
             };
}

+ (NSValueTransformer *)approvalRuleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitApprovalRule class]];
}

@end

@implementation AWSCodecommitCreatePullRequestInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"clientRequestToken",
             @"detail" : @"description",
             @"targets" : @"targets",
             @"title" : @"title",
             };
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitTarget class]];
}

@end

@implementation AWSCodecommitCreatePullRequestOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pullRequest" : @"pullRequest",
             };
}

+ (NSValueTransformer *)pullRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitPullRequest class]];
}

@end

@implementation AWSCodecommitCreateRepositoryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repositoryDescription" : @"repositoryDescription",
             @"repositoryName" : @"repositoryName",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSCodecommitCreateRepositoryOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repositoryMetadata" : @"repositoryMetadata",
             };
}

+ (NSValueTransformer *)repositoryMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitRepositoryMetadata class]];
}

@end

@implementation AWSCodecommitCreateUnreferencedMergeCommitInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorName" : @"authorName",
             @"commitMessage" : @"commitMessage",
             @"conflictDetailLevel" : @"conflictDetailLevel",
             @"conflictResolution" : @"conflictResolution",
             @"conflictResolutionStrategy" : @"conflictResolutionStrategy",
             @"destinationCommitSpecifier" : @"destinationCommitSpecifier",
             @"email" : @"email",
             @"keepEmptyFolders" : @"keepEmptyFolders",
             @"mergeOption" : @"mergeOption",
             @"repositoryName" : @"repositoryName",
             @"sourceCommitSpecifier" : @"sourceCommitSpecifier",
             };
}

+ (NSValueTransformer *)conflictDetailLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILE_LEVEL"] == NSOrderedSame) {
            return @(AWSCodecommitConflictDetailLevelTypeEnumFileLevel);
        }
        if ([value caseInsensitiveCompare:@"LINE_LEVEL"] == NSOrderedSame) {
            return @(AWSCodecommitConflictDetailLevelTypeEnumLineLevel);
        }
        return @(AWSCodecommitConflictDetailLevelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitConflictDetailLevelTypeEnumFileLevel:
                return @"FILE_LEVEL";
            case AWSCodecommitConflictDetailLevelTypeEnumLineLevel:
                return @"LINE_LEVEL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)conflictResolutionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitConflictResolution class]];
}

+ (NSValueTransformer *)conflictResolutionStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumNone);
        }
        if ([value caseInsensitiveCompare:@"ACCEPT_SOURCE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource);
        }
        if ([value caseInsensitiveCompare:@"ACCEPT_DESTINATION"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination);
        }
        if ([value caseInsensitiveCompare:@"AUTOMERGE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge);
        }
        return @(AWSCodecommitConflictResolutionStrategyTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitConflictResolutionStrategyTypeEnumNone:
                return @"NONE";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource:
                return @"ACCEPT_SOURCE";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination:
                return @"ACCEPT_DESTINATION";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge:
                return @"AUTOMERGE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mergeOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FAST_FORWARD_MERGE"] == NSOrderedSame) {
            return @(AWSCodecommitMergeOptionTypeEnumFastForwardMerge);
        }
        if ([value caseInsensitiveCompare:@"SQUASH_MERGE"] == NSOrderedSame) {
            return @(AWSCodecommitMergeOptionTypeEnumSquashMerge);
        }
        if ([value caseInsensitiveCompare:@"THREE_WAY_MERGE"] == NSOrderedSame) {
            return @(AWSCodecommitMergeOptionTypeEnumThreeWayMerge);
        }
        return @(AWSCodecommitMergeOptionTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitMergeOptionTypeEnumFastForwardMerge:
                return @"FAST_FORWARD_MERGE";
            case AWSCodecommitMergeOptionTypeEnumSquashMerge:
                return @"SQUASH_MERGE";
            case AWSCodecommitMergeOptionTypeEnumThreeWayMerge:
                return @"THREE_WAY_MERGE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitCreateUnreferencedMergeCommitOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commitId" : @"commitId",
             @"treeId" : @"treeId",
             };
}

@end

@implementation AWSCodecommitDeleteApprovalRuleTemplateInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleTemplateName" : @"approvalRuleTemplateName",
             };
}

@end

@implementation AWSCodecommitDeleteApprovalRuleTemplateOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleTemplateId" : @"approvalRuleTemplateId",
             };
}

@end

@implementation AWSCodecommitDeleteBranchInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branchName" : @"branchName",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitDeleteBranchOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletedBranch" : @"deletedBranch",
             };
}

+ (NSValueTransformer *)deletedBranchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitBranchInfo class]];
}

@end

@implementation AWSCodecommitDeleteCommentContentInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commentId" : @"commentId",
             };
}

@end

@implementation AWSCodecommitDeleteCommentContentOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"comment",
             };
}

+ (NSValueTransformer *)commentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitComment class]];
}

@end

@implementation AWSCodecommitDeleteFileEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filePath" : @"filePath",
             };
}

@end

@implementation AWSCodecommitDeleteFileInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branchName" : @"branchName",
             @"commitMessage" : @"commitMessage",
             @"email" : @"email",
             @"filePath" : @"filePath",
             @"keepEmptyFolders" : @"keepEmptyFolders",
             @"name" : @"name",
             @"parentCommitId" : @"parentCommitId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitDeleteFileOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blobId" : @"blobId",
             @"commitId" : @"commitId",
             @"filePath" : @"filePath",
             @"treeId" : @"treeId",
             };
}

@end

@implementation AWSCodecommitDeletePullRequestApprovalRuleInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleName" : @"approvalRuleName",
             @"pullRequestId" : @"pullRequestId",
             };
}

@end

@implementation AWSCodecommitDeletePullRequestApprovalRuleOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleId" : @"approvalRuleId",
             };
}

@end

@implementation AWSCodecommitDeleteRepositoryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitDeleteRepositoryOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repositoryId" : @"repositoryId",
             };
}

@end

@implementation AWSCodecommitDescribeMergeConflictsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conflictDetailLevel" : @"conflictDetailLevel",
             @"conflictResolutionStrategy" : @"conflictResolutionStrategy",
             @"destinationCommitSpecifier" : @"destinationCommitSpecifier",
             @"filePath" : @"filePath",
             @"maxMergeHunks" : @"maxMergeHunks",
             @"mergeOption" : @"mergeOption",
             @"nextToken" : @"nextToken",
             @"repositoryName" : @"repositoryName",
             @"sourceCommitSpecifier" : @"sourceCommitSpecifier",
             };
}

+ (NSValueTransformer *)conflictDetailLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILE_LEVEL"] == NSOrderedSame) {
            return @(AWSCodecommitConflictDetailLevelTypeEnumFileLevel);
        }
        if ([value caseInsensitiveCompare:@"LINE_LEVEL"] == NSOrderedSame) {
            return @(AWSCodecommitConflictDetailLevelTypeEnumLineLevel);
        }
        return @(AWSCodecommitConflictDetailLevelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitConflictDetailLevelTypeEnumFileLevel:
                return @"FILE_LEVEL";
            case AWSCodecommitConflictDetailLevelTypeEnumLineLevel:
                return @"LINE_LEVEL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)conflictResolutionStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumNone);
        }
        if ([value caseInsensitiveCompare:@"ACCEPT_SOURCE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource);
        }
        if ([value caseInsensitiveCompare:@"ACCEPT_DESTINATION"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination);
        }
        if ([value caseInsensitiveCompare:@"AUTOMERGE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge);
        }
        return @(AWSCodecommitConflictResolutionStrategyTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitConflictResolutionStrategyTypeEnumNone:
                return @"NONE";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource:
                return @"ACCEPT_SOURCE";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination:
                return @"ACCEPT_DESTINATION";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge:
                return @"AUTOMERGE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mergeOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FAST_FORWARD_MERGE"] == NSOrderedSame) {
            return @(AWSCodecommitMergeOptionTypeEnumFastForwardMerge);
        }
        if ([value caseInsensitiveCompare:@"SQUASH_MERGE"] == NSOrderedSame) {
            return @(AWSCodecommitMergeOptionTypeEnumSquashMerge);
        }
        if ([value caseInsensitiveCompare:@"THREE_WAY_MERGE"] == NSOrderedSame) {
            return @(AWSCodecommitMergeOptionTypeEnumThreeWayMerge);
        }
        return @(AWSCodecommitMergeOptionTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitMergeOptionTypeEnumFastForwardMerge:
                return @"FAST_FORWARD_MERGE";
            case AWSCodecommitMergeOptionTypeEnumSquashMerge:
                return @"SQUASH_MERGE";
            case AWSCodecommitMergeOptionTypeEnumThreeWayMerge:
                return @"THREE_WAY_MERGE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitDescribeMergeConflictsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baseCommitId" : @"baseCommitId",
             @"conflictMetadata" : @"conflictMetadata",
             @"destinationCommitId" : @"destinationCommitId",
             @"mergeHunks" : @"mergeHunks",
             @"nextToken" : @"nextToken",
             @"sourceCommitId" : @"sourceCommitId",
             };
}

+ (NSValueTransformer *)conflictMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitConflictMetadata class]];
}

+ (NSValueTransformer *)mergeHunksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitMergeHunk class]];
}

@end

@implementation AWSCodecommitDescribePullRequestEventsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actorArn" : @"actorArn",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"pullRequestEventType" : @"pullRequestEventType",
             @"pullRequestId" : @"pullRequestId",
             };
}

+ (NSValueTransformer *)pullRequestEventTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PULL_REQUEST_CREATED"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestEventTypePullRequestCreated);
        }
        if ([value caseInsensitiveCompare:@"PULL_REQUEST_STATUS_CHANGED"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestEventTypePullRequestStatusChanged);
        }
        if ([value caseInsensitiveCompare:@"PULL_REQUEST_SOURCE_REFERENCE_UPDATED"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestEventTypePullRequestSourceReferenceUpdated);
        }
        if ([value caseInsensitiveCompare:@"PULL_REQUEST_MERGE_STATE_CHANGED"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestEventTypePullRequestMergeStateChanged);
        }
        if ([value caseInsensitiveCompare:@"PULL_REQUEST_APPROVAL_RULE_CREATED"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestEventTypePullRequestApprovalRuleCreated);
        }
        if ([value caseInsensitiveCompare:@"PULL_REQUEST_APPROVAL_RULE_UPDATED"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestEventTypePullRequestApprovalRuleUpdated);
        }
        if ([value caseInsensitiveCompare:@"PULL_REQUEST_APPROVAL_RULE_DELETED"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestEventTypePullRequestApprovalRuleDeleted);
        }
        if ([value caseInsensitiveCompare:@"PULL_REQUEST_APPROVAL_RULE_OVERRIDDEN"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestEventTypePullRequestApprovalRuleOverridden);
        }
        if ([value caseInsensitiveCompare:@"PULL_REQUEST_APPROVAL_STATE_CHANGED"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestEventTypePullRequestApprovalStateChanged);
        }
        return @(AWSCodecommitPullRequestEventTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitPullRequestEventTypePullRequestCreated:
                return @"PULL_REQUEST_CREATED";
            case AWSCodecommitPullRequestEventTypePullRequestStatusChanged:
                return @"PULL_REQUEST_STATUS_CHANGED";
            case AWSCodecommitPullRequestEventTypePullRequestSourceReferenceUpdated:
                return @"PULL_REQUEST_SOURCE_REFERENCE_UPDATED";
            case AWSCodecommitPullRequestEventTypePullRequestMergeStateChanged:
                return @"PULL_REQUEST_MERGE_STATE_CHANGED";
            case AWSCodecommitPullRequestEventTypePullRequestApprovalRuleCreated:
                return @"PULL_REQUEST_APPROVAL_RULE_CREATED";
            case AWSCodecommitPullRequestEventTypePullRequestApprovalRuleUpdated:
                return @"PULL_REQUEST_APPROVAL_RULE_UPDATED";
            case AWSCodecommitPullRequestEventTypePullRequestApprovalRuleDeleted:
                return @"PULL_REQUEST_APPROVAL_RULE_DELETED";
            case AWSCodecommitPullRequestEventTypePullRequestApprovalRuleOverridden:
                return @"PULL_REQUEST_APPROVAL_RULE_OVERRIDDEN";
            case AWSCodecommitPullRequestEventTypePullRequestApprovalStateChanged:
                return @"PULL_REQUEST_APPROVAL_STATE_CHANGED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitDescribePullRequestEventsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"pullRequestEvents" : @"pullRequestEvents",
             };
}

+ (NSValueTransformer *)pullRequestEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitPullRequestEvent class]];
}

@end

@implementation AWSCodecommitDifference

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"afterBlob" : @"afterBlob",
             @"beforeBlob" : @"beforeBlob",
             @"changeType" : @"changeType",
             };
}

+ (NSValueTransformer *)afterBlobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitBlobMetadata class]];
}

+ (NSValueTransformer *)beforeBlobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitBlobMetadata class]];
}

+ (NSValueTransformer *)changeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSCodecommitChangeTypeEnumA);
        }
        if ([value caseInsensitiveCompare:@"M"] == NSOrderedSame) {
            return @(AWSCodecommitChangeTypeEnumM);
        }
        if ([value caseInsensitiveCompare:@"D"] == NSOrderedSame) {
            return @(AWSCodecommitChangeTypeEnumD);
        }
        return @(AWSCodecommitChangeTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitChangeTypeEnumA:
                return @"A";
            case AWSCodecommitChangeTypeEnumM:
                return @"M";
            case AWSCodecommitChangeTypeEnumD:
                return @"D";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitDisassociateApprovalRuleTemplateFromRepositoryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleTemplateName" : @"approvalRuleTemplateName",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitEvaluatePullRequestApprovalRulesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pullRequestId" : @"pullRequestId",
             @"revisionId" : @"revisionId",
             };
}

@end

@implementation AWSCodecommitEvaluatePullRequestApprovalRulesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"evaluation" : @"evaluation",
             };
}

+ (NSValueTransformer *)evaluationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitEvaluation class]];
}

@end

@implementation AWSCodecommitEvaluation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRulesNotSatisfied" : @"approvalRulesNotSatisfied",
             @"approvalRulesSatisfied" : @"approvalRulesSatisfied",
             @"approved" : @"approved",
             @"overridden" : @"overridden",
             };
}

@end

@implementation AWSCodecommitFile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"absolutePath" : @"absolutePath",
             @"blobId" : @"blobId",
             @"fileMode" : @"fileMode",
             @"relativePath" : @"relativePath",
             };
}

+ (NSValueTransformer *)fileModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXECUTABLE"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumExecutable);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumNormal);
        }
        if ([value caseInsensitiveCompare:@"SYMLINK"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumSymlink);
        }
        return @(AWSCodecommitFileModeTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitFileModeTypeEnumExecutable:
                return @"EXECUTABLE";
            case AWSCodecommitFileModeTypeEnumNormal:
                return @"NORMAL";
            case AWSCodecommitFileModeTypeEnumSymlink:
                return @"SYMLINK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitFileMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"absolutePath" : @"absolutePath",
             @"blobId" : @"blobId",
             @"fileMode" : @"fileMode",
             };
}

+ (NSValueTransformer *)fileModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXECUTABLE"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumExecutable);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumNormal);
        }
        if ([value caseInsensitiveCompare:@"SYMLINK"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumSymlink);
        }
        return @(AWSCodecommitFileModeTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitFileModeTypeEnumExecutable:
                return @"EXECUTABLE";
            case AWSCodecommitFileModeTypeEnumNormal:
                return @"NORMAL";
            case AWSCodecommitFileModeTypeEnumSymlink:
                return @"SYMLINK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitFileModes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"base" : @"base",
             @"destination" : @"destination",
             @"source" : @"source",
             };
}

+ (NSValueTransformer *)baseJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXECUTABLE"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumExecutable);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumNormal);
        }
        if ([value caseInsensitiveCompare:@"SYMLINK"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumSymlink);
        }
        return @(AWSCodecommitFileModeTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitFileModeTypeEnumExecutable:
                return @"EXECUTABLE";
            case AWSCodecommitFileModeTypeEnumNormal:
                return @"NORMAL";
            case AWSCodecommitFileModeTypeEnumSymlink:
                return @"SYMLINK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXECUTABLE"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumExecutable);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumNormal);
        }
        if ([value caseInsensitiveCompare:@"SYMLINK"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumSymlink);
        }
        return @(AWSCodecommitFileModeTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitFileModeTypeEnumExecutable:
                return @"EXECUTABLE";
            case AWSCodecommitFileModeTypeEnumNormal:
                return @"NORMAL";
            case AWSCodecommitFileModeTypeEnumSymlink:
                return @"SYMLINK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXECUTABLE"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumExecutable);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumNormal);
        }
        if ([value caseInsensitiveCompare:@"SYMLINK"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumSymlink);
        }
        return @(AWSCodecommitFileModeTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitFileModeTypeEnumExecutable:
                return @"EXECUTABLE";
            case AWSCodecommitFileModeTypeEnumNormal:
                return @"NORMAL";
            case AWSCodecommitFileModeTypeEnumSymlink:
                return @"SYMLINK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitFileSizes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"base" : @"base",
             @"destination" : @"destination",
             @"source" : @"source",
             };
}

@end

@implementation AWSCodecommitFolder

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"absolutePath" : @"absolutePath",
             @"relativePath" : @"relativePath",
             @"treeId" : @"treeId",
             };
}

@end

@implementation AWSCodecommitGetApprovalRuleTemplateInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleTemplateName" : @"approvalRuleTemplateName",
             };
}

@end

@implementation AWSCodecommitGetApprovalRuleTemplateOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleTemplate" : @"approvalRuleTemplate",
             };
}

+ (NSValueTransformer *)approvalRuleTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitApprovalRuleTemplate class]];
}

@end

@implementation AWSCodecommitGetBlobInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blobId" : @"blobId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitGetBlobOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"content",
             };
}

@end

@implementation AWSCodecommitGetBranchInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branchName" : @"branchName",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitGetBranchOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branch" : @"branch",
             };
}

+ (NSValueTransformer *)branchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitBranchInfo class]];
}

@end

@implementation AWSCodecommitGetCommentInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commentId" : @"commentId",
             };
}

@end

@implementation AWSCodecommitGetCommentOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"comment",
             };
}

+ (NSValueTransformer *)commentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitComment class]];
}

@end

@implementation AWSCodecommitGetCommentReactionsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commentId" : @"commentId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"reactionUserArn" : @"reactionUserArn",
             };
}

@end

@implementation AWSCodecommitGetCommentReactionsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"reactionsForComment" : @"reactionsForComment",
             };
}

+ (NSValueTransformer *)reactionsForCommentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitReactionForComment class]];
}

@end

@implementation AWSCodecommitGetCommentsForComparedCommitInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"afterCommitId" : @"afterCommitId",
             @"beforeCommitId" : @"beforeCommitId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitGetCommentsForComparedCommitOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commentsForComparedCommitData" : @"commentsForComparedCommitData",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)commentsForComparedCommitDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitCommentsForComparedCommit class]];
}

@end

@implementation AWSCodecommitGetCommentsForPullRequestInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"afterCommitId" : @"afterCommitId",
             @"beforeCommitId" : @"beforeCommitId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"pullRequestId" : @"pullRequestId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitGetCommentsForPullRequestOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commentsForPullRequestData" : @"commentsForPullRequestData",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)commentsForPullRequestDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitCommentsForPullRequest class]];
}

@end

@implementation AWSCodecommitGetCommitInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commitId" : @"commitId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitGetCommitOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commit" : @"commit",
             };
}

+ (NSValueTransformer *)commitJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitCommit class]];
}

@end

@implementation AWSCodecommitGetDifferencesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"afterCommitSpecifier" : @"afterCommitSpecifier",
             @"afterPath" : @"afterPath",
             @"beforeCommitSpecifier" : @"beforeCommitSpecifier",
             @"beforePath" : @"beforePath",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitGetDifferencesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"differences" : @"differences",
             };
}

+ (NSValueTransformer *)differencesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitDifference class]];
}

@end

@implementation AWSCodecommitGetFileInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commitSpecifier" : @"commitSpecifier",
             @"filePath" : @"filePath",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitGetFileOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blobId" : @"blobId",
             @"commitId" : @"commitId",
             @"fileContent" : @"fileContent",
             @"fileMode" : @"fileMode",
             @"filePath" : @"filePath",
             @"fileSize" : @"fileSize",
             };
}

+ (NSValueTransformer *)fileModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXECUTABLE"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumExecutable);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumNormal);
        }
        if ([value caseInsensitiveCompare:@"SYMLINK"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumSymlink);
        }
        return @(AWSCodecommitFileModeTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitFileModeTypeEnumExecutable:
                return @"EXECUTABLE";
            case AWSCodecommitFileModeTypeEnumNormal:
                return @"NORMAL";
            case AWSCodecommitFileModeTypeEnumSymlink:
                return @"SYMLINK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitGetFolderInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commitSpecifier" : @"commitSpecifier",
             @"folderPath" : @"folderPath",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitGetFolderOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commitId" : @"commitId",
             @"files" : @"files",
             @"folderPath" : @"folderPath",
             @"subFolders" : @"subFolders",
             @"subModules" : @"subModules",
             @"symbolicLinks" : @"symbolicLinks",
             @"treeId" : @"treeId",
             };
}

+ (NSValueTransformer *)filesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitFile class]];
}

+ (NSValueTransformer *)subFoldersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitFolder class]];
}

+ (NSValueTransformer *)subModulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitSubModule class]];
}

+ (NSValueTransformer *)symbolicLinksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitSymbolicLink class]];
}

@end

@implementation AWSCodecommitGetMergeCommitInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conflictDetailLevel" : @"conflictDetailLevel",
             @"conflictResolutionStrategy" : @"conflictResolutionStrategy",
             @"destinationCommitSpecifier" : @"destinationCommitSpecifier",
             @"repositoryName" : @"repositoryName",
             @"sourceCommitSpecifier" : @"sourceCommitSpecifier",
             };
}

+ (NSValueTransformer *)conflictDetailLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILE_LEVEL"] == NSOrderedSame) {
            return @(AWSCodecommitConflictDetailLevelTypeEnumFileLevel);
        }
        if ([value caseInsensitiveCompare:@"LINE_LEVEL"] == NSOrderedSame) {
            return @(AWSCodecommitConflictDetailLevelTypeEnumLineLevel);
        }
        return @(AWSCodecommitConflictDetailLevelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitConflictDetailLevelTypeEnumFileLevel:
                return @"FILE_LEVEL";
            case AWSCodecommitConflictDetailLevelTypeEnumLineLevel:
                return @"LINE_LEVEL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)conflictResolutionStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumNone);
        }
        if ([value caseInsensitiveCompare:@"ACCEPT_SOURCE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource);
        }
        if ([value caseInsensitiveCompare:@"ACCEPT_DESTINATION"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination);
        }
        if ([value caseInsensitiveCompare:@"AUTOMERGE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge);
        }
        return @(AWSCodecommitConflictResolutionStrategyTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitConflictResolutionStrategyTypeEnumNone:
                return @"NONE";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource:
                return @"ACCEPT_SOURCE";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination:
                return @"ACCEPT_DESTINATION";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge:
                return @"AUTOMERGE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitGetMergeCommitOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baseCommitId" : @"baseCommitId",
             @"destinationCommitId" : @"destinationCommitId",
             @"mergedCommitId" : @"mergedCommitId",
             @"sourceCommitId" : @"sourceCommitId",
             };
}

@end

@implementation AWSCodecommitGetMergeConflictsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conflictDetailLevel" : @"conflictDetailLevel",
             @"conflictResolutionStrategy" : @"conflictResolutionStrategy",
             @"destinationCommitSpecifier" : @"destinationCommitSpecifier",
             @"maxConflictFiles" : @"maxConflictFiles",
             @"mergeOption" : @"mergeOption",
             @"nextToken" : @"nextToken",
             @"repositoryName" : @"repositoryName",
             @"sourceCommitSpecifier" : @"sourceCommitSpecifier",
             };
}

+ (NSValueTransformer *)conflictDetailLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILE_LEVEL"] == NSOrderedSame) {
            return @(AWSCodecommitConflictDetailLevelTypeEnumFileLevel);
        }
        if ([value caseInsensitiveCompare:@"LINE_LEVEL"] == NSOrderedSame) {
            return @(AWSCodecommitConflictDetailLevelTypeEnumLineLevel);
        }
        return @(AWSCodecommitConflictDetailLevelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitConflictDetailLevelTypeEnumFileLevel:
                return @"FILE_LEVEL";
            case AWSCodecommitConflictDetailLevelTypeEnumLineLevel:
                return @"LINE_LEVEL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)conflictResolutionStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumNone);
        }
        if ([value caseInsensitiveCompare:@"ACCEPT_SOURCE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource);
        }
        if ([value caseInsensitiveCompare:@"ACCEPT_DESTINATION"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination);
        }
        if ([value caseInsensitiveCompare:@"AUTOMERGE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge);
        }
        return @(AWSCodecommitConflictResolutionStrategyTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitConflictResolutionStrategyTypeEnumNone:
                return @"NONE";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource:
                return @"ACCEPT_SOURCE";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination:
                return @"ACCEPT_DESTINATION";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge:
                return @"AUTOMERGE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mergeOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FAST_FORWARD_MERGE"] == NSOrderedSame) {
            return @(AWSCodecommitMergeOptionTypeEnumFastForwardMerge);
        }
        if ([value caseInsensitiveCompare:@"SQUASH_MERGE"] == NSOrderedSame) {
            return @(AWSCodecommitMergeOptionTypeEnumSquashMerge);
        }
        if ([value caseInsensitiveCompare:@"THREE_WAY_MERGE"] == NSOrderedSame) {
            return @(AWSCodecommitMergeOptionTypeEnumThreeWayMerge);
        }
        return @(AWSCodecommitMergeOptionTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitMergeOptionTypeEnumFastForwardMerge:
                return @"FAST_FORWARD_MERGE";
            case AWSCodecommitMergeOptionTypeEnumSquashMerge:
                return @"SQUASH_MERGE";
            case AWSCodecommitMergeOptionTypeEnumThreeWayMerge:
                return @"THREE_WAY_MERGE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitGetMergeConflictsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baseCommitId" : @"baseCommitId",
             @"conflictMetadataList" : @"conflictMetadataList",
             @"destinationCommitId" : @"destinationCommitId",
             @"mergeable" : @"mergeable",
             @"nextToken" : @"nextToken",
             @"sourceCommitId" : @"sourceCommitId",
             };
}

+ (NSValueTransformer *)conflictMetadataListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitConflictMetadata class]];
}

@end

@implementation AWSCodecommitGetMergeOptionsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conflictDetailLevel" : @"conflictDetailLevel",
             @"conflictResolutionStrategy" : @"conflictResolutionStrategy",
             @"destinationCommitSpecifier" : @"destinationCommitSpecifier",
             @"repositoryName" : @"repositoryName",
             @"sourceCommitSpecifier" : @"sourceCommitSpecifier",
             };
}

+ (NSValueTransformer *)conflictDetailLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILE_LEVEL"] == NSOrderedSame) {
            return @(AWSCodecommitConflictDetailLevelTypeEnumFileLevel);
        }
        if ([value caseInsensitiveCompare:@"LINE_LEVEL"] == NSOrderedSame) {
            return @(AWSCodecommitConflictDetailLevelTypeEnumLineLevel);
        }
        return @(AWSCodecommitConflictDetailLevelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitConflictDetailLevelTypeEnumFileLevel:
                return @"FILE_LEVEL";
            case AWSCodecommitConflictDetailLevelTypeEnumLineLevel:
                return @"LINE_LEVEL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)conflictResolutionStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumNone);
        }
        if ([value caseInsensitiveCompare:@"ACCEPT_SOURCE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource);
        }
        if ([value caseInsensitiveCompare:@"ACCEPT_DESTINATION"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination);
        }
        if ([value caseInsensitiveCompare:@"AUTOMERGE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge);
        }
        return @(AWSCodecommitConflictResolutionStrategyTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitConflictResolutionStrategyTypeEnumNone:
                return @"NONE";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource:
                return @"ACCEPT_SOURCE";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination:
                return @"ACCEPT_DESTINATION";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge:
                return @"AUTOMERGE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitGetMergeOptionsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baseCommitId" : @"baseCommitId",
             @"destinationCommitId" : @"destinationCommitId",
             @"mergeOptions" : @"mergeOptions",
             @"sourceCommitId" : @"sourceCommitId",
             };
}

@end

@implementation AWSCodecommitGetPullRequestApprovalStatesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pullRequestId" : @"pullRequestId",
             @"revisionId" : @"revisionId",
             };
}

@end

@implementation AWSCodecommitGetPullRequestApprovalStatesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvals" : @"approvals",
             };
}

+ (NSValueTransformer *)approvalsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitApproval class]];
}

@end

@implementation AWSCodecommitGetPullRequestInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pullRequestId" : @"pullRequestId",
             };
}

@end

@implementation AWSCodecommitGetPullRequestOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pullRequest" : @"pullRequest",
             };
}

+ (NSValueTransformer *)pullRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitPullRequest class]];
}

@end

@implementation AWSCodecommitGetPullRequestOverrideStateInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pullRequestId" : @"pullRequestId",
             @"revisionId" : @"revisionId",
             };
}

@end

@implementation AWSCodecommitGetPullRequestOverrideStateOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"overridden" : @"overridden",
             @"overrider" : @"overrider",
             };
}

@end

@implementation AWSCodecommitGetRepositoryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitGetRepositoryOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repositoryMetadata" : @"repositoryMetadata",
             };
}

+ (NSValueTransformer *)repositoryMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitRepositoryMetadata class]];
}

@end

@implementation AWSCodecommitGetRepositoryTriggersInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitGetRepositoryTriggersOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationId" : @"configurationId",
             @"triggers" : @"triggers",
             };
}

+ (NSValueTransformer *)triggersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitRepositoryTrigger class]];
}

@end

@implementation AWSCodecommitIsBinaryFile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"base" : @"base",
             @"destination" : @"destination",
             @"source" : @"source",
             };
}

@end

@implementation AWSCodecommitListApprovalRuleTemplatesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSCodecommitListApprovalRuleTemplatesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleTemplateNames" : @"approvalRuleTemplateNames",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleTemplateNames" : @"approvalRuleTemplateNames",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSCodecommitListBranchesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitListBranchesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branches" : @"branches",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSCodecommitListPullRequestsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorArn" : @"authorArn",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"pullRequestStatus" : @"pullRequestStatus",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)pullRequestStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestStatusEnumOpen);
        }
        if ([value caseInsensitiveCompare:@"CLOSED"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestStatusEnumClosed);
        }
        return @(AWSCodecommitPullRequestStatusEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitPullRequestStatusEnumOpen:
                return @"OPEN";
            case AWSCodecommitPullRequestStatusEnumClosed:
                return @"CLOSED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitListPullRequestsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"pullRequestIds" : @"pullRequestIds",
             };
}

@end

@implementation AWSCodecommitListRepositoriesForApprovalRuleTemplateInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleTemplateName" : @"approvalRuleTemplateName",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSCodecommitListRepositoriesForApprovalRuleTemplateOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"repositoryNames" : @"repositoryNames",
             };
}

@end

@implementation AWSCodecommitListRepositoriesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"order" : @"order",
             @"sortBy" : @"sortBy",
             };
}

+ (NSValueTransformer *)orderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ascending"] == NSOrderedSame) {
            return @(AWSCodecommitOrderEnumAscending);
        }
        if ([value caseInsensitiveCompare:@"descending"] == NSOrderedSame) {
            return @(AWSCodecommitOrderEnumDescending);
        }
        return @(AWSCodecommitOrderEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitOrderEnumAscending:
                return @"ascending";
            case AWSCodecommitOrderEnumDescending:
                return @"descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"repositoryName"] == NSOrderedSame) {
            return @(AWSCodecommitSortByEnumRepositoryName);
        }
        if ([value caseInsensitiveCompare:@"lastModifiedDate"] == NSOrderedSame) {
            return @(AWSCodecommitSortByEnumLastModifiedDate);
        }
        return @(AWSCodecommitSortByEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitSortByEnumRepositoryName:
                return @"repositoryName";
            case AWSCodecommitSortByEnumLastModifiedDate:
                return @"lastModifiedDate";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitListRepositoriesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"repositories" : @"repositories",
             };
}

+ (NSValueTransformer *)repositoriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitRepositoryNameIdPair class]];
}

@end

@implementation AWSCodecommitListTagsForResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSCodecommitListTagsForResourceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSCodecommitLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filePath" : @"filePath",
             @"filePosition" : @"filePosition",
             @"relativeFileVersion" : @"relativeFileVersion",
             };
}

+ (NSValueTransformer *)relativeFileVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BEFORE"] == NSOrderedSame) {
            return @(AWSCodecommitRelativeFileVersionEnumBefore);
        }
        if ([value caseInsensitiveCompare:@"AFTER"] == NSOrderedSame) {
            return @(AWSCodecommitRelativeFileVersionEnumAfter);
        }
        return @(AWSCodecommitRelativeFileVersionEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitRelativeFileVersionEnumBefore:
                return @"BEFORE";
            case AWSCodecommitRelativeFileVersionEnumAfter:
                return @"AFTER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitMergeBranchesByFastForwardInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationCommitSpecifier" : @"destinationCommitSpecifier",
             @"repositoryName" : @"repositoryName",
             @"sourceCommitSpecifier" : @"sourceCommitSpecifier",
             @"targetBranch" : @"targetBranch",
             };
}

@end

@implementation AWSCodecommitMergeBranchesByFastForwardOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commitId" : @"commitId",
             @"treeId" : @"treeId",
             };
}

@end

@implementation AWSCodecommitMergeBranchesBySquashInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorName" : @"authorName",
             @"commitMessage" : @"commitMessage",
             @"conflictDetailLevel" : @"conflictDetailLevel",
             @"conflictResolution" : @"conflictResolution",
             @"conflictResolutionStrategy" : @"conflictResolutionStrategy",
             @"destinationCommitSpecifier" : @"destinationCommitSpecifier",
             @"email" : @"email",
             @"keepEmptyFolders" : @"keepEmptyFolders",
             @"repositoryName" : @"repositoryName",
             @"sourceCommitSpecifier" : @"sourceCommitSpecifier",
             @"targetBranch" : @"targetBranch",
             };
}

+ (NSValueTransformer *)conflictDetailLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILE_LEVEL"] == NSOrderedSame) {
            return @(AWSCodecommitConflictDetailLevelTypeEnumFileLevel);
        }
        if ([value caseInsensitiveCompare:@"LINE_LEVEL"] == NSOrderedSame) {
            return @(AWSCodecommitConflictDetailLevelTypeEnumLineLevel);
        }
        return @(AWSCodecommitConflictDetailLevelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitConflictDetailLevelTypeEnumFileLevel:
                return @"FILE_LEVEL";
            case AWSCodecommitConflictDetailLevelTypeEnumLineLevel:
                return @"LINE_LEVEL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)conflictResolutionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitConflictResolution class]];
}

+ (NSValueTransformer *)conflictResolutionStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumNone);
        }
        if ([value caseInsensitiveCompare:@"ACCEPT_SOURCE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource);
        }
        if ([value caseInsensitiveCompare:@"ACCEPT_DESTINATION"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination);
        }
        if ([value caseInsensitiveCompare:@"AUTOMERGE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge);
        }
        return @(AWSCodecommitConflictResolutionStrategyTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitConflictResolutionStrategyTypeEnumNone:
                return @"NONE";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource:
                return @"ACCEPT_SOURCE";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination:
                return @"ACCEPT_DESTINATION";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge:
                return @"AUTOMERGE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitMergeBranchesBySquashOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commitId" : @"commitId",
             @"treeId" : @"treeId",
             };
}

@end

@implementation AWSCodecommitMergeBranchesByThreeWayInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorName" : @"authorName",
             @"commitMessage" : @"commitMessage",
             @"conflictDetailLevel" : @"conflictDetailLevel",
             @"conflictResolution" : @"conflictResolution",
             @"conflictResolutionStrategy" : @"conflictResolutionStrategy",
             @"destinationCommitSpecifier" : @"destinationCommitSpecifier",
             @"email" : @"email",
             @"keepEmptyFolders" : @"keepEmptyFolders",
             @"repositoryName" : @"repositoryName",
             @"sourceCommitSpecifier" : @"sourceCommitSpecifier",
             @"targetBranch" : @"targetBranch",
             };
}

+ (NSValueTransformer *)conflictDetailLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILE_LEVEL"] == NSOrderedSame) {
            return @(AWSCodecommitConflictDetailLevelTypeEnumFileLevel);
        }
        if ([value caseInsensitiveCompare:@"LINE_LEVEL"] == NSOrderedSame) {
            return @(AWSCodecommitConflictDetailLevelTypeEnumLineLevel);
        }
        return @(AWSCodecommitConflictDetailLevelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitConflictDetailLevelTypeEnumFileLevel:
                return @"FILE_LEVEL";
            case AWSCodecommitConflictDetailLevelTypeEnumLineLevel:
                return @"LINE_LEVEL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)conflictResolutionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitConflictResolution class]];
}

+ (NSValueTransformer *)conflictResolutionStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumNone);
        }
        if ([value caseInsensitiveCompare:@"ACCEPT_SOURCE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource);
        }
        if ([value caseInsensitiveCompare:@"ACCEPT_DESTINATION"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination);
        }
        if ([value caseInsensitiveCompare:@"AUTOMERGE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge);
        }
        return @(AWSCodecommitConflictResolutionStrategyTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitConflictResolutionStrategyTypeEnumNone:
                return @"NONE";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource:
                return @"ACCEPT_SOURCE";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination:
                return @"ACCEPT_DESTINATION";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge:
                return @"AUTOMERGE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitMergeBranchesByThreeWayOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commitId" : @"commitId",
             @"treeId" : @"treeId",
             };
}

@end

@implementation AWSCodecommitMergeHunk

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"base" : @"base",
             @"destination" : @"destination",
             @"isConflict" : @"isConflict",
             @"source" : @"source",
             };
}

+ (NSValueTransformer *)baseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitMergeHunkDetail class]];
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitMergeHunkDetail class]];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitMergeHunkDetail class]];
}

@end

@implementation AWSCodecommitMergeHunkDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endLine" : @"endLine",
             @"hunkContent" : @"hunkContent",
             @"startLine" : @"startLine",
             };
}

@end

@implementation AWSCodecommitMergeMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isMerged" : @"isMerged",
             @"mergeCommitId" : @"mergeCommitId",
             @"mergeOption" : @"mergeOption",
             @"mergedBy" : @"mergedBy",
             };
}

+ (NSValueTransformer *)mergeOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FAST_FORWARD_MERGE"] == NSOrderedSame) {
            return @(AWSCodecommitMergeOptionTypeEnumFastForwardMerge);
        }
        if ([value caseInsensitiveCompare:@"SQUASH_MERGE"] == NSOrderedSame) {
            return @(AWSCodecommitMergeOptionTypeEnumSquashMerge);
        }
        if ([value caseInsensitiveCompare:@"THREE_WAY_MERGE"] == NSOrderedSame) {
            return @(AWSCodecommitMergeOptionTypeEnumThreeWayMerge);
        }
        return @(AWSCodecommitMergeOptionTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitMergeOptionTypeEnumFastForwardMerge:
                return @"FAST_FORWARD_MERGE";
            case AWSCodecommitMergeOptionTypeEnumSquashMerge:
                return @"SQUASH_MERGE";
            case AWSCodecommitMergeOptionTypeEnumThreeWayMerge:
                return @"THREE_WAY_MERGE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitMergeOperations

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"destination",
             @"source" : @"source",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSCodecommitChangeTypeEnumA);
        }
        if ([value caseInsensitiveCompare:@"M"] == NSOrderedSame) {
            return @(AWSCodecommitChangeTypeEnumM);
        }
        if ([value caseInsensitiveCompare:@"D"] == NSOrderedSame) {
            return @(AWSCodecommitChangeTypeEnumD);
        }
        return @(AWSCodecommitChangeTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitChangeTypeEnumA:
                return @"A";
            case AWSCodecommitChangeTypeEnumM:
                return @"M";
            case AWSCodecommitChangeTypeEnumD:
                return @"D";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSCodecommitChangeTypeEnumA);
        }
        if ([value caseInsensitiveCompare:@"M"] == NSOrderedSame) {
            return @(AWSCodecommitChangeTypeEnumM);
        }
        if ([value caseInsensitiveCompare:@"D"] == NSOrderedSame) {
            return @(AWSCodecommitChangeTypeEnumD);
        }
        return @(AWSCodecommitChangeTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitChangeTypeEnumA:
                return @"A";
            case AWSCodecommitChangeTypeEnumM:
                return @"M";
            case AWSCodecommitChangeTypeEnumD:
                return @"D";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitMergePullRequestByFastForwardInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pullRequestId" : @"pullRequestId",
             @"repositoryName" : @"repositoryName",
             @"sourceCommitId" : @"sourceCommitId",
             };
}

@end

@implementation AWSCodecommitMergePullRequestByFastForwardOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pullRequest" : @"pullRequest",
             };
}

+ (NSValueTransformer *)pullRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitPullRequest class]];
}

@end

@implementation AWSCodecommitMergePullRequestBySquashInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorName" : @"authorName",
             @"commitMessage" : @"commitMessage",
             @"conflictDetailLevel" : @"conflictDetailLevel",
             @"conflictResolution" : @"conflictResolution",
             @"conflictResolutionStrategy" : @"conflictResolutionStrategy",
             @"email" : @"email",
             @"keepEmptyFolders" : @"keepEmptyFolders",
             @"pullRequestId" : @"pullRequestId",
             @"repositoryName" : @"repositoryName",
             @"sourceCommitId" : @"sourceCommitId",
             };
}

+ (NSValueTransformer *)conflictDetailLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILE_LEVEL"] == NSOrderedSame) {
            return @(AWSCodecommitConflictDetailLevelTypeEnumFileLevel);
        }
        if ([value caseInsensitiveCompare:@"LINE_LEVEL"] == NSOrderedSame) {
            return @(AWSCodecommitConflictDetailLevelTypeEnumLineLevel);
        }
        return @(AWSCodecommitConflictDetailLevelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitConflictDetailLevelTypeEnumFileLevel:
                return @"FILE_LEVEL";
            case AWSCodecommitConflictDetailLevelTypeEnumLineLevel:
                return @"LINE_LEVEL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)conflictResolutionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitConflictResolution class]];
}

+ (NSValueTransformer *)conflictResolutionStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumNone);
        }
        if ([value caseInsensitiveCompare:@"ACCEPT_SOURCE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource);
        }
        if ([value caseInsensitiveCompare:@"ACCEPT_DESTINATION"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination);
        }
        if ([value caseInsensitiveCompare:@"AUTOMERGE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge);
        }
        return @(AWSCodecommitConflictResolutionStrategyTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitConflictResolutionStrategyTypeEnumNone:
                return @"NONE";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource:
                return @"ACCEPT_SOURCE";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination:
                return @"ACCEPT_DESTINATION";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge:
                return @"AUTOMERGE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitMergePullRequestBySquashOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pullRequest" : @"pullRequest",
             };
}

+ (NSValueTransformer *)pullRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitPullRequest class]];
}

@end

@implementation AWSCodecommitMergePullRequestByThreeWayInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorName" : @"authorName",
             @"commitMessage" : @"commitMessage",
             @"conflictDetailLevel" : @"conflictDetailLevel",
             @"conflictResolution" : @"conflictResolution",
             @"conflictResolutionStrategy" : @"conflictResolutionStrategy",
             @"email" : @"email",
             @"keepEmptyFolders" : @"keepEmptyFolders",
             @"pullRequestId" : @"pullRequestId",
             @"repositoryName" : @"repositoryName",
             @"sourceCommitId" : @"sourceCommitId",
             };
}

+ (NSValueTransformer *)conflictDetailLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILE_LEVEL"] == NSOrderedSame) {
            return @(AWSCodecommitConflictDetailLevelTypeEnumFileLevel);
        }
        if ([value caseInsensitiveCompare:@"LINE_LEVEL"] == NSOrderedSame) {
            return @(AWSCodecommitConflictDetailLevelTypeEnumLineLevel);
        }
        return @(AWSCodecommitConflictDetailLevelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitConflictDetailLevelTypeEnumFileLevel:
                return @"FILE_LEVEL";
            case AWSCodecommitConflictDetailLevelTypeEnumLineLevel:
                return @"LINE_LEVEL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)conflictResolutionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitConflictResolution class]];
}

+ (NSValueTransformer *)conflictResolutionStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumNone);
        }
        if ([value caseInsensitiveCompare:@"ACCEPT_SOURCE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource);
        }
        if ([value caseInsensitiveCompare:@"ACCEPT_DESTINATION"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination);
        }
        if ([value caseInsensitiveCompare:@"AUTOMERGE"] == NSOrderedSame) {
            return @(AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge);
        }
        return @(AWSCodecommitConflictResolutionStrategyTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitConflictResolutionStrategyTypeEnumNone:
                return @"NONE";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource:
                return @"ACCEPT_SOURCE";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination:
                return @"ACCEPT_DESTINATION";
            case AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge:
                return @"AUTOMERGE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitMergePullRequestByThreeWayOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pullRequest" : @"pullRequest",
             };
}

+ (NSValueTransformer *)pullRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitPullRequest class]];
}

@end

@implementation AWSCodecommitObjectTypes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"base" : @"base",
             @"destination" : @"destination",
             @"source" : @"source",
             };
}

+ (NSValueTransformer *)baseJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILE"] == NSOrderedSame) {
            return @(AWSCodecommitObjectTypeEnumFile);
        }
        if ([value caseInsensitiveCompare:@"DIRECTORY"] == NSOrderedSame) {
            return @(AWSCodecommitObjectTypeEnumDirectory);
        }
        if ([value caseInsensitiveCompare:@"GIT_LINK"] == NSOrderedSame) {
            return @(AWSCodecommitObjectTypeEnumGitLink);
        }
        if ([value caseInsensitiveCompare:@"SYMBOLIC_LINK"] == NSOrderedSame) {
            return @(AWSCodecommitObjectTypeEnumSymbolicLink);
        }
        return @(AWSCodecommitObjectTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitObjectTypeEnumFile:
                return @"FILE";
            case AWSCodecommitObjectTypeEnumDirectory:
                return @"DIRECTORY";
            case AWSCodecommitObjectTypeEnumGitLink:
                return @"GIT_LINK";
            case AWSCodecommitObjectTypeEnumSymbolicLink:
                return @"SYMBOLIC_LINK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILE"] == NSOrderedSame) {
            return @(AWSCodecommitObjectTypeEnumFile);
        }
        if ([value caseInsensitiveCompare:@"DIRECTORY"] == NSOrderedSame) {
            return @(AWSCodecommitObjectTypeEnumDirectory);
        }
        if ([value caseInsensitiveCompare:@"GIT_LINK"] == NSOrderedSame) {
            return @(AWSCodecommitObjectTypeEnumGitLink);
        }
        if ([value caseInsensitiveCompare:@"SYMBOLIC_LINK"] == NSOrderedSame) {
            return @(AWSCodecommitObjectTypeEnumSymbolicLink);
        }
        return @(AWSCodecommitObjectTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitObjectTypeEnumFile:
                return @"FILE";
            case AWSCodecommitObjectTypeEnumDirectory:
                return @"DIRECTORY";
            case AWSCodecommitObjectTypeEnumGitLink:
                return @"GIT_LINK";
            case AWSCodecommitObjectTypeEnumSymbolicLink:
                return @"SYMBOLIC_LINK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILE"] == NSOrderedSame) {
            return @(AWSCodecommitObjectTypeEnumFile);
        }
        if ([value caseInsensitiveCompare:@"DIRECTORY"] == NSOrderedSame) {
            return @(AWSCodecommitObjectTypeEnumDirectory);
        }
        if ([value caseInsensitiveCompare:@"GIT_LINK"] == NSOrderedSame) {
            return @(AWSCodecommitObjectTypeEnumGitLink);
        }
        if ([value caseInsensitiveCompare:@"SYMBOLIC_LINK"] == NSOrderedSame) {
            return @(AWSCodecommitObjectTypeEnumSymbolicLink);
        }
        return @(AWSCodecommitObjectTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitObjectTypeEnumFile:
                return @"FILE";
            case AWSCodecommitObjectTypeEnumDirectory:
                return @"DIRECTORY";
            case AWSCodecommitObjectTypeEnumGitLink:
                return @"GIT_LINK";
            case AWSCodecommitObjectTypeEnumSymbolicLink:
                return @"SYMBOLIC_LINK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitOriginApprovalRuleTemplate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleTemplateId" : @"approvalRuleTemplateId",
             @"approvalRuleTemplateName" : @"approvalRuleTemplateName",
             };
}

@end

@implementation AWSCodecommitOverridePullRequestApprovalRulesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"overrideStatus" : @"overrideStatus",
             @"pullRequestId" : @"pullRequestId",
             @"revisionId" : @"revisionId",
             };
}

+ (NSValueTransformer *)overrideStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OVERRIDE"] == NSOrderedSame) {
            return @(AWSCodecommitOverrideStatusOverride);
        }
        if ([value caseInsensitiveCompare:@"REVOKE"] == NSOrderedSame) {
            return @(AWSCodecommitOverrideStatusRevoke);
        }
        return @(AWSCodecommitOverrideStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitOverrideStatusOverride:
                return @"OVERRIDE";
            case AWSCodecommitOverrideStatusRevoke:
                return @"REVOKE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitPostCommentForComparedCommitInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"afterCommitId" : @"afterCommitId",
             @"beforeCommitId" : @"beforeCommitId",
             @"clientRequestToken" : @"clientRequestToken",
             @"content" : @"content",
             @"location" : @"location",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitLocation class]];
}

@end

@implementation AWSCodecommitPostCommentForComparedCommitOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"afterBlobId" : @"afterBlobId",
             @"afterCommitId" : @"afterCommitId",
             @"beforeBlobId" : @"beforeBlobId",
             @"beforeCommitId" : @"beforeCommitId",
             @"comment" : @"comment",
             @"location" : @"location",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)commentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitComment class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitLocation class]];
}

@end

@implementation AWSCodecommitPostCommentForPullRequestInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"afterCommitId" : @"afterCommitId",
             @"beforeCommitId" : @"beforeCommitId",
             @"clientRequestToken" : @"clientRequestToken",
             @"content" : @"content",
             @"location" : @"location",
             @"pullRequestId" : @"pullRequestId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitLocation class]];
}

@end

@implementation AWSCodecommitPostCommentForPullRequestOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"afterBlobId" : @"afterBlobId",
             @"afterCommitId" : @"afterCommitId",
             @"beforeBlobId" : @"beforeBlobId",
             @"beforeCommitId" : @"beforeCommitId",
             @"comment" : @"comment",
             @"location" : @"location",
             @"pullRequestId" : @"pullRequestId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)commentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitComment class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitLocation class]];
}

@end

@implementation AWSCodecommitPostCommentReplyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"clientRequestToken",
             @"content" : @"content",
             @"inReplyTo" : @"inReplyTo",
             };
}

@end

@implementation AWSCodecommitPostCommentReplyOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"comment",
             };
}

+ (NSValueTransformer *)commentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitComment class]];
}

@end

@implementation AWSCodecommitPullRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRules" : @"approvalRules",
             @"authorArn" : @"authorArn",
             @"clientRequestToken" : @"clientRequestToken",
             @"creationDate" : @"creationDate",
             @"detail" : @"description",
             @"lastActivityDate" : @"lastActivityDate",
             @"pullRequestId" : @"pullRequestId",
             @"pullRequestStatus" : @"pullRequestStatus",
             @"pullRequestTargets" : @"pullRequestTargets",
             @"revisionId" : @"revisionId",
             @"title" : @"title",
             };
}

+ (NSValueTransformer *)approvalRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitApprovalRule class]];
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastActivityDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)pullRequestStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestStatusEnumOpen);
        }
        if ([value caseInsensitiveCompare:@"CLOSED"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestStatusEnumClosed);
        }
        return @(AWSCodecommitPullRequestStatusEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitPullRequestStatusEnumOpen:
                return @"OPEN";
            case AWSCodecommitPullRequestStatusEnumClosed:
                return @"CLOSED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pullRequestTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitPullRequestTarget class]];
}

@end

@implementation AWSCodecommitPullRequestCreatedEventMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationCommitId" : @"destinationCommitId",
             @"mergeBase" : @"mergeBase",
             @"repositoryName" : @"repositoryName",
             @"sourceCommitId" : @"sourceCommitId",
             };
}

@end

@implementation AWSCodecommitPullRequestEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actorArn" : @"actorArn",
             @"approvalRuleEventMetadata" : @"approvalRuleEventMetadata",
             @"approvalRuleOverriddenEventMetadata" : @"approvalRuleOverriddenEventMetadata",
             @"approvalStateChangedEventMetadata" : @"approvalStateChangedEventMetadata",
             @"eventDate" : @"eventDate",
             @"pullRequestCreatedEventMetadata" : @"pullRequestCreatedEventMetadata",
             @"pullRequestEventType" : @"pullRequestEventType",
             @"pullRequestId" : @"pullRequestId",
             @"pullRequestMergedStateChangedEventMetadata" : @"pullRequestMergedStateChangedEventMetadata",
             @"pullRequestSourceReferenceUpdatedEventMetadata" : @"pullRequestSourceReferenceUpdatedEventMetadata",
             @"pullRequestStatusChangedEventMetadata" : @"pullRequestStatusChangedEventMetadata",
             };
}

+ (NSValueTransformer *)approvalRuleEventMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitApprovalRuleEventMetadata class]];
}

+ (NSValueTransformer *)approvalRuleOverriddenEventMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitApprovalRuleOverriddenEventMetadata class]];
}

+ (NSValueTransformer *)approvalStateChangedEventMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitApprovalStateChangedEventMetadata class]];
}

+ (NSValueTransformer *)eventDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)pullRequestCreatedEventMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitPullRequestCreatedEventMetadata class]];
}

+ (NSValueTransformer *)pullRequestEventTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PULL_REQUEST_CREATED"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestEventTypePullRequestCreated);
        }
        if ([value caseInsensitiveCompare:@"PULL_REQUEST_STATUS_CHANGED"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestEventTypePullRequestStatusChanged);
        }
        if ([value caseInsensitiveCompare:@"PULL_REQUEST_SOURCE_REFERENCE_UPDATED"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestEventTypePullRequestSourceReferenceUpdated);
        }
        if ([value caseInsensitiveCompare:@"PULL_REQUEST_MERGE_STATE_CHANGED"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestEventTypePullRequestMergeStateChanged);
        }
        if ([value caseInsensitiveCompare:@"PULL_REQUEST_APPROVAL_RULE_CREATED"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestEventTypePullRequestApprovalRuleCreated);
        }
        if ([value caseInsensitiveCompare:@"PULL_REQUEST_APPROVAL_RULE_UPDATED"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestEventTypePullRequestApprovalRuleUpdated);
        }
        if ([value caseInsensitiveCompare:@"PULL_REQUEST_APPROVAL_RULE_DELETED"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestEventTypePullRequestApprovalRuleDeleted);
        }
        if ([value caseInsensitiveCompare:@"PULL_REQUEST_APPROVAL_RULE_OVERRIDDEN"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestEventTypePullRequestApprovalRuleOverridden);
        }
        if ([value caseInsensitiveCompare:@"PULL_REQUEST_APPROVAL_STATE_CHANGED"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestEventTypePullRequestApprovalStateChanged);
        }
        return @(AWSCodecommitPullRequestEventTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitPullRequestEventTypePullRequestCreated:
                return @"PULL_REQUEST_CREATED";
            case AWSCodecommitPullRequestEventTypePullRequestStatusChanged:
                return @"PULL_REQUEST_STATUS_CHANGED";
            case AWSCodecommitPullRequestEventTypePullRequestSourceReferenceUpdated:
                return @"PULL_REQUEST_SOURCE_REFERENCE_UPDATED";
            case AWSCodecommitPullRequestEventTypePullRequestMergeStateChanged:
                return @"PULL_REQUEST_MERGE_STATE_CHANGED";
            case AWSCodecommitPullRequestEventTypePullRequestApprovalRuleCreated:
                return @"PULL_REQUEST_APPROVAL_RULE_CREATED";
            case AWSCodecommitPullRequestEventTypePullRequestApprovalRuleUpdated:
                return @"PULL_REQUEST_APPROVAL_RULE_UPDATED";
            case AWSCodecommitPullRequestEventTypePullRequestApprovalRuleDeleted:
                return @"PULL_REQUEST_APPROVAL_RULE_DELETED";
            case AWSCodecommitPullRequestEventTypePullRequestApprovalRuleOverridden:
                return @"PULL_REQUEST_APPROVAL_RULE_OVERRIDDEN";
            case AWSCodecommitPullRequestEventTypePullRequestApprovalStateChanged:
                return @"PULL_REQUEST_APPROVAL_STATE_CHANGED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pullRequestMergedStateChangedEventMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitPullRequestMergedStateChangedEventMetadata class]];
}

+ (NSValueTransformer *)pullRequestSourceReferenceUpdatedEventMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitPullRequestSourceReferenceUpdatedEventMetadata class]];
}

+ (NSValueTransformer *)pullRequestStatusChangedEventMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitPullRequestStatusChangedEventMetadata class]];
}

@end

@implementation AWSCodecommitPullRequestMergedStateChangedEventMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationReference" : @"destinationReference",
             @"mergeMetadata" : @"mergeMetadata",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)mergeMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitMergeMetadata class]];
}

@end

@implementation AWSCodecommitPullRequestSourceReferenceUpdatedEventMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"afterCommitId" : @"afterCommitId",
             @"beforeCommitId" : @"beforeCommitId",
             @"mergeBase" : @"mergeBase",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitPullRequestStatusChangedEventMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pullRequestStatus" : @"pullRequestStatus",
             };
}

+ (NSValueTransformer *)pullRequestStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestStatusEnumOpen);
        }
        if ([value caseInsensitiveCompare:@"CLOSED"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestStatusEnumClosed);
        }
        return @(AWSCodecommitPullRequestStatusEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitPullRequestStatusEnumOpen:
                return @"OPEN";
            case AWSCodecommitPullRequestStatusEnumClosed:
                return @"CLOSED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitPullRequestTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationCommit" : @"destinationCommit",
             @"destinationReference" : @"destinationReference",
             @"mergeBase" : @"mergeBase",
             @"mergeMetadata" : @"mergeMetadata",
             @"repositoryName" : @"repositoryName",
             @"sourceCommit" : @"sourceCommit",
             @"sourceReference" : @"sourceReference",
             };
}

+ (NSValueTransformer *)mergeMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitMergeMetadata class]];
}

@end

@implementation AWSCodecommitPutCommentReactionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commentId" : @"commentId",
             @"reactionValue" : @"reactionValue",
             };
}

@end

@implementation AWSCodecommitPutFileEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileContent" : @"fileContent",
             @"fileMode" : @"fileMode",
             @"filePath" : @"filePath",
             @"sourceFile" : @"sourceFile",
             };
}

+ (NSValueTransformer *)fileModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXECUTABLE"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumExecutable);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumNormal);
        }
        if ([value caseInsensitiveCompare:@"SYMLINK"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumSymlink);
        }
        return @(AWSCodecommitFileModeTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitFileModeTypeEnumExecutable:
                return @"EXECUTABLE";
            case AWSCodecommitFileModeTypeEnumNormal:
                return @"NORMAL";
            case AWSCodecommitFileModeTypeEnumSymlink:
                return @"SYMLINK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourceFileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitSourceFileSpecifier class]];
}

@end

@implementation AWSCodecommitPutFileInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branchName" : @"branchName",
             @"commitMessage" : @"commitMessage",
             @"email" : @"email",
             @"fileContent" : @"fileContent",
             @"fileMode" : @"fileMode",
             @"filePath" : @"filePath",
             @"name" : @"name",
             @"parentCommitId" : @"parentCommitId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)fileModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXECUTABLE"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumExecutable);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumNormal);
        }
        if ([value caseInsensitiveCompare:@"SYMLINK"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumSymlink);
        }
        return @(AWSCodecommitFileModeTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitFileModeTypeEnumExecutable:
                return @"EXECUTABLE";
            case AWSCodecommitFileModeTypeEnumNormal:
                return @"NORMAL";
            case AWSCodecommitFileModeTypeEnumSymlink:
                return @"SYMLINK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitPutFileOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blobId" : @"blobId",
             @"commitId" : @"commitId",
             @"treeId" : @"treeId",
             };
}

@end

@implementation AWSCodecommitPutRepositoryTriggersInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repositoryName" : @"repositoryName",
             @"triggers" : @"triggers",
             };
}

+ (NSValueTransformer *)triggersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitRepositoryTrigger class]];
}

@end

@implementation AWSCodecommitPutRepositoryTriggersOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationId" : @"configurationId",
             };
}

@end

@implementation AWSCodecommitReactionForComment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reaction" : @"reaction",
             @"reactionUsers" : @"reactionUsers",
             @"reactionsFromDeletedUsersCount" : @"reactionsFromDeletedUsersCount",
             };
}

+ (NSValueTransformer *)reactionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitReactionValueFormats class]];
}

@end

@implementation AWSCodecommitReactionValueFormats

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emoji" : @"emoji",
             @"shortCode" : @"shortCode",
             @"unicode" : @"unicode",
             };
}

@end

@implementation AWSCodecommitReplaceContentEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"content",
             @"fileMode" : @"fileMode",
             @"filePath" : @"filePath",
             @"replacementType" : @"replacementType",
             };
}

+ (NSValueTransformer *)fileModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXECUTABLE"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumExecutable);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumNormal);
        }
        if ([value caseInsensitiveCompare:@"SYMLINK"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumSymlink);
        }
        return @(AWSCodecommitFileModeTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitFileModeTypeEnumExecutable:
                return @"EXECUTABLE";
            case AWSCodecommitFileModeTypeEnumNormal:
                return @"NORMAL";
            case AWSCodecommitFileModeTypeEnumSymlink:
                return @"SYMLINK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)replacementTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"KEEP_BASE"] == NSOrderedSame) {
            return @(AWSCodecommitReplacementTypeEnumKeepBase);
        }
        if ([value caseInsensitiveCompare:@"KEEP_SOURCE"] == NSOrderedSame) {
            return @(AWSCodecommitReplacementTypeEnumKeepSource);
        }
        if ([value caseInsensitiveCompare:@"KEEP_DESTINATION"] == NSOrderedSame) {
            return @(AWSCodecommitReplacementTypeEnumKeepDestination);
        }
        if ([value caseInsensitiveCompare:@"USE_NEW_CONTENT"] == NSOrderedSame) {
            return @(AWSCodecommitReplacementTypeEnumUseNewContent);
        }
        return @(AWSCodecommitReplacementTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitReplacementTypeEnumKeepBase:
                return @"KEEP_BASE";
            case AWSCodecommitReplacementTypeEnumKeepSource:
                return @"KEEP_SOURCE";
            case AWSCodecommitReplacementTypeEnumKeepDestination:
                return @"KEEP_DESTINATION";
            case AWSCodecommitReplacementTypeEnumUseNewContent:
                return @"USE_NEW_CONTENT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitRepositoryMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"accountId" : @"accountId",
             @"cloneUrlHttp" : @"cloneUrlHttp",
             @"cloneUrlSsh" : @"cloneUrlSsh",
             @"creationDate" : @"creationDate",
             @"defaultBranch" : @"defaultBranch",
             @"lastModifiedDate" : @"lastModifiedDate",
             @"repositoryDescription" : @"repositoryDescription",
             @"repositoryId" : @"repositoryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSCodecommitRepositoryNameIdPair

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repositoryId" : @"repositoryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitRepositoryTrigger

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branches" : @"branches",
             @"customData" : @"customData",
             @"destinationArn" : @"destinationArn",
             @"events" : @"events",
             @"name" : @"name",
             };
}

@end

@implementation AWSCodecommitRepositoryTriggerExecutionFailure

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failureMessage" : @"failureMessage",
             @"trigger" : @"trigger",
             };
}

@end

@implementation AWSCodecommitSetFileModeEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileMode" : @"fileMode",
             @"filePath" : @"filePath",
             };
}

+ (NSValueTransformer *)fileModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXECUTABLE"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumExecutable);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumNormal);
        }
        if ([value caseInsensitiveCompare:@"SYMLINK"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumSymlink);
        }
        return @(AWSCodecommitFileModeTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitFileModeTypeEnumExecutable:
                return @"EXECUTABLE";
            case AWSCodecommitFileModeTypeEnumNormal:
                return @"NORMAL";
            case AWSCodecommitFileModeTypeEnumSymlink:
                return @"SYMLINK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitSourceFileSpecifier

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filePath" : @"filePath",
             @"isMove" : @"isMove",
             };
}

@end

@implementation AWSCodecommitSubModule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"absolutePath" : @"absolutePath",
             @"commitId" : @"commitId",
             @"relativePath" : @"relativePath",
             };
}

@end

@implementation AWSCodecommitSymbolicLink

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"absolutePath" : @"absolutePath",
             @"blobId" : @"blobId",
             @"fileMode" : @"fileMode",
             @"relativePath" : @"relativePath",
             };
}

+ (NSValueTransformer *)fileModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXECUTABLE"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumExecutable);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumNormal);
        }
        if ([value caseInsensitiveCompare:@"SYMLINK"] == NSOrderedSame) {
            return @(AWSCodecommitFileModeTypeEnumSymlink);
        }
        return @(AWSCodecommitFileModeTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitFileModeTypeEnumExecutable:
                return @"EXECUTABLE";
            case AWSCodecommitFileModeTypeEnumNormal:
                return @"NORMAL";
            case AWSCodecommitFileModeTypeEnumSymlink:
                return @"SYMLINK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitTagResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSCodecommitTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationReference" : @"destinationReference",
             @"repositoryName" : @"repositoryName",
             @"sourceReference" : @"sourceReference",
             };
}

@end

@implementation AWSCodecommitTestRepositoryTriggersInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repositoryName" : @"repositoryName",
             @"triggers" : @"triggers",
             };
}

+ (NSValueTransformer *)triggersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitRepositoryTrigger class]];
}

@end

@implementation AWSCodecommitTestRepositoryTriggersOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failedExecutions" : @"failedExecutions",
             @"successfulExecutions" : @"successfulExecutions",
             };
}

+ (NSValueTransformer *)failedExecutionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodecommitRepositoryTriggerExecutionFailure class]];
}

@end

@implementation AWSCodecommitUntagResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSCodecommitUpdateApprovalRuleTemplateContentInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleTemplateName" : @"approvalRuleTemplateName",
             @"existingRuleContentSha256" : @"existingRuleContentSha256",
             @"latestRuleContent" : @"newRuleContent",
             };
}

@end

@implementation AWSCodecommitUpdateApprovalRuleTemplateContentOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleTemplate" : @"approvalRuleTemplate",
             };
}

+ (NSValueTransformer *)approvalRuleTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitApprovalRuleTemplate class]];
}

@end

@implementation AWSCodecommitUpdateApprovalRuleTemplateDescriptionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleTemplateDescription" : @"approvalRuleTemplateDescription",
             @"approvalRuleTemplateName" : @"approvalRuleTemplateName",
             };
}

@end

@implementation AWSCodecommitUpdateApprovalRuleTemplateDescriptionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleTemplate" : @"approvalRuleTemplate",
             };
}

+ (NSValueTransformer *)approvalRuleTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitApprovalRuleTemplate class]];
}

@end

@implementation AWSCodecommitUpdateApprovalRuleTemplateNameInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"latestApprovalRuleTemplateName" : @"newApprovalRuleTemplateName",
             @"oldApprovalRuleTemplateName" : @"oldApprovalRuleTemplateName",
             };
}

@end

@implementation AWSCodecommitUpdateApprovalRuleTemplateNameOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleTemplate" : @"approvalRuleTemplate",
             };
}

+ (NSValueTransformer *)approvalRuleTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitApprovalRuleTemplate class]];
}

@end

@implementation AWSCodecommitUpdateCommentInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commentId" : @"commentId",
             @"content" : @"content",
             };
}

@end

@implementation AWSCodecommitUpdateCommentOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"comment",
             };
}

+ (NSValueTransformer *)commentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitComment class]];
}

@end

@implementation AWSCodecommitUpdateDefaultBranchInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultBranchName" : @"defaultBranchName",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitUpdatePullRequestApprovalRuleContentInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRuleName" : @"approvalRuleName",
             @"existingRuleContentSha256" : @"existingRuleContentSha256",
             @"latestRuleContent" : @"newRuleContent",
             @"pullRequestId" : @"pullRequestId",
             };
}

@end

@implementation AWSCodecommitUpdatePullRequestApprovalRuleContentOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalRule" : @"approvalRule",
             };
}

+ (NSValueTransformer *)approvalRuleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitApprovalRule class]];
}

@end

@implementation AWSCodecommitUpdatePullRequestApprovalStateInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approvalState" : @"approvalState",
             @"pullRequestId" : @"pullRequestId",
             @"revisionId" : @"revisionId",
             };
}

+ (NSValueTransformer *)approvalStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"APPROVE"] == NSOrderedSame) {
            return @(AWSCodecommitApprovalStateApprove);
        }
        if ([value caseInsensitiveCompare:@"REVOKE"] == NSOrderedSame) {
            return @(AWSCodecommitApprovalStateRevoke);
        }
        return @(AWSCodecommitApprovalStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitApprovalStateApprove:
                return @"APPROVE";
            case AWSCodecommitApprovalStateRevoke:
                return @"REVOKE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitUpdatePullRequestDescriptionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"pullRequestId" : @"pullRequestId",
             };
}

@end

@implementation AWSCodecommitUpdatePullRequestDescriptionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pullRequest" : @"pullRequest",
             };
}

+ (NSValueTransformer *)pullRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitPullRequest class]];
}

@end

@implementation AWSCodecommitUpdatePullRequestStatusInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pullRequestId" : @"pullRequestId",
             @"pullRequestStatus" : @"pullRequestStatus",
             };
}

+ (NSValueTransformer *)pullRequestStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestStatusEnumOpen);
        }
        if ([value caseInsensitiveCompare:@"CLOSED"] == NSOrderedSame) {
            return @(AWSCodecommitPullRequestStatusEnumClosed);
        }
        return @(AWSCodecommitPullRequestStatusEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodecommitPullRequestStatusEnumOpen:
                return @"OPEN";
            case AWSCodecommitPullRequestStatusEnumClosed:
                return @"CLOSED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodecommitUpdatePullRequestStatusOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pullRequest" : @"pullRequest",
             };
}

+ (NSValueTransformer *)pullRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitPullRequest class]];
}

@end

@implementation AWSCodecommitUpdatePullRequestTitleInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pullRequestId" : @"pullRequestId",
             @"title" : @"title",
             };
}

@end

@implementation AWSCodecommitUpdatePullRequestTitleOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pullRequest" : @"pullRequest",
             };
}

+ (NSValueTransformer *)pullRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodecommitPullRequest class]];
}

@end

@implementation AWSCodecommitUpdateRepositoryDescriptionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repositoryDescription" : @"repositoryDescription",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSCodecommitUpdateRepositoryNameInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"latestName" : @"newName",
             @"oldName" : @"oldName",
             };
}

@end

@implementation AWSCodecommitUserInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"date" : @"date",
             @"email" : @"email",
             @"name" : @"name",
             };
}

@end
