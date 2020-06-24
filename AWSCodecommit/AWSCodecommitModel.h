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

FOUNDATION_EXPORT NSString *const AWSCodecommitErrorDomain;

typedef NS_ENUM(NSInteger, AWSCodecommitErrorType) {
    AWSCodecommitErrorUnknown,
    AWSCodecommitErrorActorDoesNotExist,
    AWSCodecommitErrorApprovalRuleContentRequired,
    AWSCodecommitErrorApprovalRuleDoesNotExist,
    AWSCodecommitErrorApprovalRuleNameAlreadyExists,
    AWSCodecommitErrorApprovalRuleNameRequired,
    AWSCodecommitErrorApprovalRuleTemplateContentRequired,
    AWSCodecommitErrorApprovalRuleTemplateDoesNotExist,
    AWSCodecommitErrorApprovalRuleTemplateInUse,
    AWSCodecommitErrorApprovalRuleTemplateNameAlreadyExists,
    AWSCodecommitErrorApprovalRuleTemplateNameRequired,
    AWSCodecommitErrorApprovalStateRequired,
    AWSCodecommitErrorAuthorDoesNotExist,
    AWSCodecommitErrorBeforeCommitIdAndAfterCommitIdAreSame,
    AWSCodecommitErrorBlobIdDoesNotExist,
    AWSCodecommitErrorBlobIdRequired,
    AWSCodecommitErrorBranchDoesNotExist,
    AWSCodecommitErrorBranchNameExists,
    AWSCodecommitErrorBranchNameIsTagName,
    AWSCodecommitErrorBranchNameRequired,
    AWSCodecommitErrorCannotDeleteApprovalRuleFromTemplate,
    AWSCodecommitErrorCannotModifyApprovalRuleFromTemplate,
    AWSCodecommitErrorClientRequestTokenRequired,
    AWSCodecommitErrorCommentContentRequired,
    AWSCodecommitErrorCommentContentSizeLimitExceeded,
    AWSCodecommitErrorCommentDeleted,
    AWSCodecommitErrorCommentDoesNotExist,
    AWSCodecommitErrorCommentIdRequired,
    AWSCodecommitErrorCommentNotCreatedByCaller,
    AWSCodecommitErrorCommitDoesNotExist,
    AWSCodecommitErrorCommitIdDoesNotExist,
    AWSCodecommitErrorCommitIdRequired,
    AWSCodecommitErrorCommitIdsLimitExceeded,
    AWSCodecommitErrorCommitIdsListRequired,
    AWSCodecommitErrorCommitMessageLengthExceeded,
    AWSCodecommitErrorCommitRequired,
    AWSCodecommitErrorConcurrentReferenceUpdate,
    AWSCodecommitErrorDefaultBranchCannotBeDeleted,
    AWSCodecommitErrorDirectoryNameConflictsWithFileName,
    AWSCodecommitErrorEncryptionIntegrityChecksFailed,
    AWSCodecommitErrorEncryptionKeyAccessDenied,
    AWSCodecommitErrorEncryptionKeyDisabled,
    AWSCodecommitErrorEncryptionKeyNotFound,
    AWSCodecommitErrorEncryptionKeyUnavailable,
    AWSCodecommitErrorFileContentAndSourceFileSpecified,
    AWSCodecommitErrorFileContentRequired,
    AWSCodecommitErrorFileContentSizeLimitExceeded,
    AWSCodecommitErrorFileDoesNotExist,
    AWSCodecommitErrorFileEntryRequired,
    AWSCodecommitErrorFileModeRequired,
    AWSCodecommitErrorFileNameConflictsWithDirectoryName,
    AWSCodecommitErrorFilePathConflictsWithSubmodulePath,
    AWSCodecommitErrorFileTooLarge,
    AWSCodecommitErrorFolderContentSizeLimitExceeded,
    AWSCodecommitErrorFolderDoesNotExist,
    AWSCodecommitErrorIdempotencyParameterMismatch,
    AWSCodecommitErrorInvalidActorArn,
    AWSCodecommitErrorInvalidApprovalRuleContent,
    AWSCodecommitErrorInvalidApprovalRuleName,
    AWSCodecommitErrorInvalidApprovalRuleTemplateContent,
    AWSCodecommitErrorInvalidApprovalRuleTemplateDescription,
    AWSCodecommitErrorInvalidApprovalRuleTemplateName,
    AWSCodecommitErrorInvalidApprovalState,
    AWSCodecommitErrorInvalidAuthorArn,
    AWSCodecommitErrorInvalidBlobId,
    AWSCodecommitErrorInvalidBranchName,
    AWSCodecommitErrorInvalidClientRequestToken,
    AWSCodecommitErrorInvalidCommentId,
    AWSCodecommitErrorInvalidCommit,
    AWSCodecommitErrorInvalidCommitId,
    AWSCodecommitErrorInvalidConflictDetailLevel,
    AWSCodecommitErrorInvalidConflictResolution,
    AWSCodecommitErrorInvalidConflictResolutionStrategy,
    AWSCodecommitErrorInvalidContinuationToken,
    AWSCodecommitErrorInvalidDeletionParameter,
    AWSCodecommitErrorInvalidDescription,
    AWSCodecommitErrorInvalidDestinationCommitSpecifier,
    AWSCodecommitErrorInvalidEmail,
    AWSCodecommitErrorInvalidFileLocation,
    AWSCodecommitErrorInvalidFileMode,
    AWSCodecommitErrorInvalidFilePosition,
    AWSCodecommitErrorInvalidMaxConflictFiles,
    AWSCodecommitErrorInvalidMaxMergeHunks,
    AWSCodecommitErrorInvalidMaxResults,
    AWSCodecommitErrorInvalidMergeOption,
    AWSCodecommitErrorInvalidOrder,
    AWSCodecommitErrorInvalidOverrideStatus,
    AWSCodecommitErrorInvalidParentCommitId,
    AWSCodecommitErrorInvalidPath,
    AWSCodecommitErrorInvalidPullRequestEventType,
    AWSCodecommitErrorInvalidPullRequestId,
    AWSCodecommitErrorInvalidPullRequestStatus,
    AWSCodecommitErrorInvalidPullRequestStatusUpdate,
    AWSCodecommitErrorInvalidReactionUserArn,
    AWSCodecommitErrorInvalidReactionValue,
    AWSCodecommitErrorInvalidReferenceName,
    AWSCodecommitErrorInvalidRelativeFileVersionEnum,
    AWSCodecommitErrorInvalidReplacementContent,
    AWSCodecommitErrorInvalidReplacementType,
    AWSCodecommitErrorInvalidRepositoryDescription,
    AWSCodecommitErrorInvalidRepositoryName,
    AWSCodecommitErrorInvalidRepositoryTriggerBranchName,
    AWSCodecommitErrorInvalidRepositoryTriggerCustomData,
    AWSCodecommitErrorInvalidRepositoryTriggerDestinationArn,
    AWSCodecommitErrorInvalidRepositoryTriggerEvents,
    AWSCodecommitErrorInvalidRepositoryTriggerName,
    AWSCodecommitErrorInvalidRepositoryTriggerRegion,
    AWSCodecommitErrorInvalidResourceArn,
    AWSCodecommitErrorInvalidRevisionId,
    AWSCodecommitErrorInvalidRuleContentSha256,
    AWSCodecommitErrorInvalidSortBy,
    AWSCodecommitErrorInvalidSourceCommitSpecifier,
    AWSCodecommitErrorInvalidSystemTagUsage,
    AWSCodecommitErrorInvalidTagKeysList,
    AWSCodecommitErrorInvalidTagsMap,
    AWSCodecommitErrorInvalidTargetBranch,
    AWSCodecommitErrorInvalidTarget,
    AWSCodecommitErrorInvalidTargets,
    AWSCodecommitErrorInvalidTitle,
    AWSCodecommitErrorManualMergeRequired,
    AWSCodecommitErrorMaximumBranchesExceeded,
    AWSCodecommitErrorMaximumConflictResolutionEntriesExceeded,
    AWSCodecommitErrorMaximumFileContentToLoadExceeded,
    AWSCodecommitErrorMaximumFileEntriesExceeded,
    AWSCodecommitErrorMaximumItemsToCompareExceeded,
    AWSCodecommitErrorMaximumNumberOfApprovalsExceeded,
    AWSCodecommitErrorMaximumOpenPullRequestsExceeded,
    AWSCodecommitErrorMaximumRepositoryNamesExceeded,
    AWSCodecommitErrorMaximumRepositoryTriggersExceeded,
    AWSCodecommitErrorMaximumRuleTemplatesAssociatedWithRepository,
    AWSCodecommitErrorMergeOptionRequired,
    AWSCodecommitErrorMultipleConflictResolutionEntries,
    AWSCodecommitErrorMultipleRepositoriesInPullRequest,
    AWSCodecommitErrorNameLengthExceeded,
    AWSCodecommitErrorNoChange,
    AWSCodecommitErrorNumberOfRuleTemplatesExceeded,
    AWSCodecommitErrorNumberOfRulesExceeded,
    AWSCodecommitErrorOverrideAlreadySet,
    AWSCodecommitErrorOverrideStatusRequired,
    AWSCodecommitErrorParentCommitDoesNotExist,
    AWSCodecommitErrorParentCommitIdOutdated,
    AWSCodecommitErrorParentCommitIdRequired,
    AWSCodecommitErrorPathDoesNotExist,
    AWSCodecommitErrorPathRequired,
    AWSCodecommitErrorPullRequestAlreadyClosed,
    AWSCodecommitErrorPullRequestApprovalRulesNotSatisfied,
    AWSCodecommitErrorPullRequestCannotBeApprovedByAuthor,
    AWSCodecommitErrorPullRequestDoesNotExist,
    AWSCodecommitErrorPullRequestIdRequired,
    AWSCodecommitErrorPullRequestStatusRequired,
    AWSCodecommitErrorPutFileEntryConflict,
    AWSCodecommitErrorReactionLimitExceeded,
    AWSCodecommitErrorReactionValueRequired,
    AWSCodecommitErrorReferenceDoesNotExist,
    AWSCodecommitErrorReferenceNameRequired,
    AWSCodecommitErrorReferenceTypeNotSupported,
    AWSCodecommitErrorReplacementContentRequired,
    AWSCodecommitErrorReplacementTypeRequired,
    AWSCodecommitErrorRepositoryDoesNotExist,
    AWSCodecommitErrorRepositoryLimitExceeded,
    AWSCodecommitErrorRepositoryNameExists,
    AWSCodecommitErrorRepositoryNameRequired,
    AWSCodecommitErrorRepositoryNamesRequired,
    AWSCodecommitErrorRepositoryNotAssociatedWithPullRequest,
    AWSCodecommitErrorRepositoryTriggerBranchNameListRequired,
    AWSCodecommitErrorRepositoryTriggerDestinationArnRequired,
    AWSCodecommitErrorRepositoryTriggerEventsListRequired,
    AWSCodecommitErrorRepositoryTriggerNameRequired,
    AWSCodecommitErrorRepositoryTriggersListRequired,
    AWSCodecommitErrorResourceArnRequired,
    AWSCodecommitErrorRestrictedSourceFile,
    AWSCodecommitErrorRevisionIdRequired,
    AWSCodecommitErrorRevisionNotCurrent,
    AWSCodecommitErrorSameFileContent,
    AWSCodecommitErrorSamePathRequest,
    AWSCodecommitErrorSourceAndDestinationAreSame,
    AWSCodecommitErrorSourceFileOrContentRequired,
    AWSCodecommitErrorTagKeysListRequired,
    AWSCodecommitErrorTagPolicy,
    AWSCodecommitErrorTagsMapRequired,
    AWSCodecommitErrorTargetRequired,
    AWSCodecommitErrorTargetsRequired,
    AWSCodecommitErrorTipOfSourceReferenceIsDifferent,
    AWSCodecommitErrorTipsDivergenceExceeded,
    AWSCodecommitErrorTitleRequired,
    AWSCodecommitErrorTooManyTags,
};

typedef NS_ENUM(NSInteger, AWSCodecommitApprovalState) {
    AWSCodecommitApprovalStateUnknown,
    AWSCodecommitApprovalStateApprove,
    AWSCodecommitApprovalStateRevoke,
};

typedef NS_ENUM(NSInteger, AWSCodecommitChangeTypeEnum) {
    AWSCodecommitChangeTypeEnumUnknown,
    AWSCodecommitChangeTypeEnumA,
    AWSCodecommitChangeTypeEnumM,
    AWSCodecommitChangeTypeEnumD,
};

typedef NS_ENUM(NSInteger, AWSCodecommitConflictDetailLevelTypeEnum) {
    AWSCodecommitConflictDetailLevelTypeEnumUnknown,
    AWSCodecommitConflictDetailLevelTypeEnumFileLevel,
    AWSCodecommitConflictDetailLevelTypeEnumLineLevel,
};

typedef NS_ENUM(NSInteger, AWSCodecommitConflictResolutionStrategyTypeEnum) {
    AWSCodecommitConflictResolutionStrategyTypeEnumUnknown,
    AWSCodecommitConflictResolutionStrategyTypeEnumNone,
    AWSCodecommitConflictResolutionStrategyTypeEnumAcceptSource,
    AWSCodecommitConflictResolutionStrategyTypeEnumAcceptDestination,
    AWSCodecommitConflictResolutionStrategyTypeEnumAutomerge,
};

typedef NS_ENUM(NSInteger, AWSCodecommitFileModeTypeEnum) {
    AWSCodecommitFileModeTypeEnumUnknown,
    AWSCodecommitFileModeTypeEnumExecutable,
    AWSCodecommitFileModeTypeEnumNormal,
    AWSCodecommitFileModeTypeEnumSymlink,
};

typedef NS_ENUM(NSInteger, AWSCodecommitMergeOptionTypeEnum) {
    AWSCodecommitMergeOptionTypeEnumUnknown,
    AWSCodecommitMergeOptionTypeEnumFastForwardMerge,
    AWSCodecommitMergeOptionTypeEnumSquashMerge,
    AWSCodecommitMergeOptionTypeEnumThreeWayMerge,
};

typedef NS_ENUM(NSInteger, AWSCodecommitObjectTypeEnum) {
    AWSCodecommitObjectTypeEnumUnknown,
    AWSCodecommitObjectTypeEnumFile,
    AWSCodecommitObjectTypeEnumDirectory,
    AWSCodecommitObjectTypeEnumGitLink,
    AWSCodecommitObjectTypeEnumSymbolicLink,
};

typedef NS_ENUM(NSInteger, AWSCodecommitOrderEnum) {
    AWSCodecommitOrderEnumUnknown,
    AWSCodecommitOrderEnumAscending,
    AWSCodecommitOrderEnumDescending,
};

typedef NS_ENUM(NSInteger, AWSCodecommitOverrideStatus) {
    AWSCodecommitOverrideStatusUnknown,
    AWSCodecommitOverrideStatusOverride,
    AWSCodecommitOverrideStatusRevoke,
};

typedef NS_ENUM(NSInteger, AWSCodecommitPullRequestEventType) {
    AWSCodecommitPullRequestEventTypeUnknown,
    AWSCodecommitPullRequestEventTypePullRequestCreated,
    AWSCodecommitPullRequestEventTypePullRequestStatusChanged,
    AWSCodecommitPullRequestEventTypePullRequestSourceReferenceUpdated,
    AWSCodecommitPullRequestEventTypePullRequestMergeStateChanged,
    AWSCodecommitPullRequestEventTypePullRequestApprovalRuleCreated,
    AWSCodecommitPullRequestEventTypePullRequestApprovalRuleUpdated,
    AWSCodecommitPullRequestEventTypePullRequestApprovalRuleDeleted,
    AWSCodecommitPullRequestEventTypePullRequestApprovalRuleOverridden,
    AWSCodecommitPullRequestEventTypePullRequestApprovalStateChanged,
};

typedef NS_ENUM(NSInteger, AWSCodecommitPullRequestStatusEnum) {
    AWSCodecommitPullRequestStatusEnumUnknown,
    AWSCodecommitPullRequestStatusEnumOpen,
    AWSCodecommitPullRequestStatusEnumClosed,
};

typedef NS_ENUM(NSInteger, AWSCodecommitRelativeFileVersionEnum) {
    AWSCodecommitRelativeFileVersionEnumUnknown,
    AWSCodecommitRelativeFileVersionEnumBefore,
    AWSCodecommitRelativeFileVersionEnumAfter,
};

typedef NS_ENUM(NSInteger, AWSCodecommitReplacementTypeEnum) {
    AWSCodecommitReplacementTypeEnumUnknown,
    AWSCodecommitReplacementTypeEnumKeepBase,
    AWSCodecommitReplacementTypeEnumKeepSource,
    AWSCodecommitReplacementTypeEnumKeepDestination,
    AWSCodecommitReplacementTypeEnumUseNewContent,
};

typedef NS_ENUM(NSInteger, AWSCodecommitRepositoryTriggerEventEnum) {
    AWSCodecommitRepositoryTriggerEventEnumUnknown,
    AWSCodecommitRepositoryTriggerEventEnumAll,
    AWSCodecommitRepositoryTriggerEventEnumUpdateReference,
    AWSCodecommitRepositoryTriggerEventEnumCreateReference,
    AWSCodecommitRepositoryTriggerEventEnumDeleteReference,
};

typedef NS_ENUM(NSInteger, AWSCodecommitSortByEnum) {
    AWSCodecommitSortByEnumUnknown,
    AWSCodecommitSortByEnumRepositoryName,
    AWSCodecommitSortByEnumLastModifiedDate,
};

@class AWSCodecommitApproval;
@class AWSCodecommitApprovalRule;
@class AWSCodecommitApprovalRuleEventMetadata;
@class AWSCodecommitApprovalRuleOverriddenEventMetadata;
@class AWSCodecommitApprovalRuleTemplate;
@class AWSCodecommitApprovalStateChangedEventMetadata;
@class AWSCodecommitAssociateApprovalRuleTemplateWithRepositoryInput;
@class AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesError;
@class AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesInput;
@class AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesOutput;
@class AWSCodecommitBatchDescribeMergeConflictsError;
@class AWSCodecommitBatchDescribeMergeConflictsInput;
@class AWSCodecommitBatchDescribeMergeConflictsOutput;
@class AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesError;
@class AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesInput;
@class AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesOutput;
@class AWSCodecommitBatchGetCommitsError;
@class AWSCodecommitBatchGetCommitsInput;
@class AWSCodecommitBatchGetCommitsOutput;
@class AWSCodecommitBatchGetRepositoriesInput;
@class AWSCodecommitBatchGetRepositoriesOutput;
@class AWSCodecommitBlobMetadata;
@class AWSCodecommitBranchInfo;
@class AWSCodecommitComment;
@class AWSCodecommitCommentsForComparedCommit;
@class AWSCodecommitCommentsForPullRequest;
@class AWSCodecommitCommit;
@class AWSCodecommitConflict;
@class AWSCodecommitConflictMetadata;
@class AWSCodecommitConflictResolution;
@class AWSCodecommitCreateApprovalRuleTemplateInput;
@class AWSCodecommitCreateApprovalRuleTemplateOutput;
@class AWSCodecommitCreateBranchInput;
@class AWSCodecommitCreateCommitInput;
@class AWSCodecommitCreateCommitOutput;
@class AWSCodecommitCreatePullRequestApprovalRuleInput;
@class AWSCodecommitCreatePullRequestApprovalRuleOutput;
@class AWSCodecommitCreatePullRequestInput;
@class AWSCodecommitCreatePullRequestOutput;
@class AWSCodecommitCreateRepositoryInput;
@class AWSCodecommitCreateRepositoryOutput;
@class AWSCodecommitCreateUnreferencedMergeCommitInput;
@class AWSCodecommitCreateUnreferencedMergeCommitOutput;
@class AWSCodecommitDeleteApprovalRuleTemplateInput;
@class AWSCodecommitDeleteApprovalRuleTemplateOutput;
@class AWSCodecommitDeleteBranchInput;
@class AWSCodecommitDeleteBranchOutput;
@class AWSCodecommitDeleteCommentContentInput;
@class AWSCodecommitDeleteCommentContentOutput;
@class AWSCodecommitDeleteFileEntry;
@class AWSCodecommitDeleteFileInput;
@class AWSCodecommitDeleteFileOutput;
@class AWSCodecommitDeletePullRequestApprovalRuleInput;
@class AWSCodecommitDeletePullRequestApprovalRuleOutput;
@class AWSCodecommitDeleteRepositoryInput;
@class AWSCodecommitDeleteRepositoryOutput;
@class AWSCodecommitDescribeMergeConflictsInput;
@class AWSCodecommitDescribeMergeConflictsOutput;
@class AWSCodecommitDescribePullRequestEventsInput;
@class AWSCodecommitDescribePullRequestEventsOutput;
@class AWSCodecommitDifference;
@class AWSCodecommitDisassociateApprovalRuleTemplateFromRepositoryInput;
@class AWSCodecommitEvaluatePullRequestApprovalRulesInput;
@class AWSCodecommitEvaluatePullRequestApprovalRulesOutput;
@class AWSCodecommitEvaluation;
@class AWSCodecommitFile;
@class AWSCodecommitFileMetadata;
@class AWSCodecommitFileModes;
@class AWSCodecommitFileSizes;
@class AWSCodecommitFolder;
@class AWSCodecommitGetApprovalRuleTemplateInput;
@class AWSCodecommitGetApprovalRuleTemplateOutput;
@class AWSCodecommitGetBlobInput;
@class AWSCodecommitGetBlobOutput;
@class AWSCodecommitGetBranchInput;
@class AWSCodecommitGetBranchOutput;
@class AWSCodecommitGetCommentInput;
@class AWSCodecommitGetCommentOutput;
@class AWSCodecommitGetCommentReactionsInput;
@class AWSCodecommitGetCommentReactionsOutput;
@class AWSCodecommitGetCommentsForComparedCommitInput;
@class AWSCodecommitGetCommentsForComparedCommitOutput;
@class AWSCodecommitGetCommentsForPullRequestInput;
@class AWSCodecommitGetCommentsForPullRequestOutput;
@class AWSCodecommitGetCommitInput;
@class AWSCodecommitGetCommitOutput;
@class AWSCodecommitGetDifferencesInput;
@class AWSCodecommitGetDifferencesOutput;
@class AWSCodecommitGetFileInput;
@class AWSCodecommitGetFileOutput;
@class AWSCodecommitGetFolderInput;
@class AWSCodecommitGetFolderOutput;
@class AWSCodecommitGetMergeCommitInput;
@class AWSCodecommitGetMergeCommitOutput;
@class AWSCodecommitGetMergeConflictsInput;
@class AWSCodecommitGetMergeConflictsOutput;
@class AWSCodecommitGetMergeOptionsInput;
@class AWSCodecommitGetMergeOptionsOutput;
@class AWSCodecommitGetPullRequestApprovalStatesInput;
@class AWSCodecommitGetPullRequestApprovalStatesOutput;
@class AWSCodecommitGetPullRequestInput;
@class AWSCodecommitGetPullRequestOutput;
@class AWSCodecommitGetPullRequestOverrideStateInput;
@class AWSCodecommitGetPullRequestOverrideStateOutput;
@class AWSCodecommitGetRepositoryInput;
@class AWSCodecommitGetRepositoryOutput;
@class AWSCodecommitGetRepositoryTriggersInput;
@class AWSCodecommitGetRepositoryTriggersOutput;
@class AWSCodecommitIsBinaryFile;
@class AWSCodecommitListApprovalRuleTemplatesInput;
@class AWSCodecommitListApprovalRuleTemplatesOutput;
@class AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryInput;
@class AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryOutput;
@class AWSCodecommitListBranchesInput;
@class AWSCodecommitListBranchesOutput;
@class AWSCodecommitListPullRequestsInput;
@class AWSCodecommitListPullRequestsOutput;
@class AWSCodecommitListRepositoriesForApprovalRuleTemplateInput;
@class AWSCodecommitListRepositoriesForApprovalRuleTemplateOutput;
@class AWSCodecommitListRepositoriesInput;
@class AWSCodecommitListRepositoriesOutput;
@class AWSCodecommitListTagsForResourceInput;
@class AWSCodecommitListTagsForResourceOutput;
@class AWSCodecommitLocation;
@class AWSCodecommitMergeBranchesByFastForwardInput;
@class AWSCodecommitMergeBranchesByFastForwardOutput;
@class AWSCodecommitMergeBranchesBySquashInput;
@class AWSCodecommitMergeBranchesBySquashOutput;
@class AWSCodecommitMergeBranchesByThreeWayInput;
@class AWSCodecommitMergeBranchesByThreeWayOutput;
@class AWSCodecommitMergeHunk;
@class AWSCodecommitMergeHunkDetail;
@class AWSCodecommitMergeMetadata;
@class AWSCodecommitMergeOperations;
@class AWSCodecommitMergePullRequestByFastForwardInput;
@class AWSCodecommitMergePullRequestByFastForwardOutput;
@class AWSCodecommitMergePullRequestBySquashInput;
@class AWSCodecommitMergePullRequestBySquashOutput;
@class AWSCodecommitMergePullRequestByThreeWayInput;
@class AWSCodecommitMergePullRequestByThreeWayOutput;
@class AWSCodecommitObjectTypes;
@class AWSCodecommitOriginApprovalRuleTemplate;
@class AWSCodecommitOverridePullRequestApprovalRulesInput;
@class AWSCodecommitPostCommentForComparedCommitInput;
@class AWSCodecommitPostCommentForComparedCommitOutput;
@class AWSCodecommitPostCommentForPullRequestInput;
@class AWSCodecommitPostCommentForPullRequestOutput;
@class AWSCodecommitPostCommentReplyInput;
@class AWSCodecommitPostCommentReplyOutput;
@class AWSCodecommitPullRequest;
@class AWSCodecommitPullRequestCreatedEventMetadata;
@class AWSCodecommitPullRequestEvent;
@class AWSCodecommitPullRequestMergedStateChangedEventMetadata;
@class AWSCodecommitPullRequestSourceReferenceUpdatedEventMetadata;
@class AWSCodecommitPullRequestStatusChangedEventMetadata;
@class AWSCodecommitPullRequestTarget;
@class AWSCodecommitPutCommentReactionInput;
@class AWSCodecommitPutFileEntry;
@class AWSCodecommitPutFileInput;
@class AWSCodecommitPutFileOutput;
@class AWSCodecommitPutRepositoryTriggersInput;
@class AWSCodecommitPutRepositoryTriggersOutput;
@class AWSCodecommitReactionForComment;
@class AWSCodecommitReactionValueFormats;
@class AWSCodecommitReplaceContentEntry;
@class AWSCodecommitRepositoryMetadata;
@class AWSCodecommitRepositoryNameIdPair;
@class AWSCodecommitRepositoryTrigger;
@class AWSCodecommitRepositoryTriggerExecutionFailure;
@class AWSCodecommitSetFileModeEntry;
@class AWSCodecommitSourceFileSpecifier;
@class AWSCodecommitSubModule;
@class AWSCodecommitSymbolicLink;
@class AWSCodecommitTagResourceInput;
@class AWSCodecommitTarget;
@class AWSCodecommitTestRepositoryTriggersInput;
@class AWSCodecommitTestRepositoryTriggersOutput;
@class AWSCodecommitUntagResourceInput;
@class AWSCodecommitUpdateApprovalRuleTemplateContentInput;
@class AWSCodecommitUpdateApprovalRuleTemplateContentOutput;
@class AWSCodecommitUpdateApprovalRuleTemplateDescriptionInput;
@class AWSCodecommitUpdateApprovalRuleTemplateDescriptionOutput;
@class AWSCodecommitUpdateApprovalRuleTemplateNameInput;
@class AWSCodecommitUpdateApprovalRuleTemplateNameOutput;
@class AWSCodecommitUpdateCommentInput;
@class AWSCodecommitUpdateCommentOutput;
@class AWSCodecommitUpdateDefaultBranchInput;
@class AWSCodecommitUpdatePullRequestApprovalRuleContentInput;
@class AWSCodecommitUpdatePullRequestApprovalRuleContentOutput;
@class AWSCodecommitUpdatePullRequestApprovalStateInput;
@class AWSCodecommitUpdatePullRequestDescriptionInput;
@class AWSCodecommitUpdatePullRequestDescriptionOutput;
@class AWSCodecommitUpdatePullRequestStatusInput;
@class AWSCodecommitUpdatePullRequestStatusOutput;
@class AWSCodecommitUpdatePullRequestTitleInput;
@class AWSCodecommitUpdatePullRequestTitleOutput;
@class AWSCodecommitUpdateRepositoryDescriptionInput;
@class AWSCodecommitUpdateRepositoryNameInput;
@class AWSCodecommitUserInfo;

/**
 <p>Returns information about a specific approval on a pull request.</p>
 */
@interface AWSCodecommitApproval : AWSModel


/**
 <p>The state of the approval, APPROVE or REVOKE. REVOKE states are not stored.</p>
 */
@property (nonatomic, assign) AWSCodecommitApprovalState approvalState;

/**
 <p>The Amazon Resource Name (ARN) of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userArn;

@end

/**
 <p>Returns information about an approval rule.</p>
 */
@interface AWSCodecommitApprovalRule : AWSModel


/**
 <p>The content of the approval rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleContent;

/**
 <p>The system-generated ID of the approval rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleId;

/**
 <p>The name of the approval rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleName;

/**
 <p>The date the approval rule was created, in timestamp format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The date the approval rule was most recently changed, in timestamp format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The Amazon Resource Name (ARN) of the user who made the most recent changes to the approval rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedUser;

/**
 <p>The approval rule template used to create the rule.</p>
 */
@property (nonatomic, strong) AWSCodecommitOriginApprovalRuleTemplate * _Nullable originApprovalRuleTemplate;

/**
 <p>The SHA-256 hash signature for the content of the approval rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleContentSha256;

@end

/**
 <p>Returns information about an event for an approval rule.</p>
 */
@interface AWSCodecommitApprovalRuleEventMetadata : AWSModel


/**
 <p>The content of the approval rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleContent;

/**
 <p>The system-generated ID of the approval rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleId;

/**
 <p>The name of the approval rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleName;

@end

/**
 <p>Returns information about an override event for approval rules for a pull request.</p>
 */
@interface AWSCodecommitApprovalRuleOverriddenEventMetadata : AWSModel


/**
 <p>The status of the override event.</p>
 */
@property (nonatomic, assign) AWSCodecommitOverrideStatus overrideStatus;

/**
 <p>The revision ID of the pull request when the override event occurred.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 <p>Returns information about an approval rule template.</p>
 */
@interface AWSCodecommitApprovalRuleTemplate : AWSModel


/**
 <p>The content of the approval rule template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleTemplateContent;

/**
 <p>The description of the approval rule template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleTemplateDescription;

/**
 <p>The system-generated ID of the approval rule template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleTemplateId;

/**
 <p>The name of the approval rule template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleTemplateName;

/**
 <p>The date the approval rule template was created, in timestamp format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The date the approval rule template was most recently changed, in timestamp format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The Amazon Resource Name (ARN) of the user who made the most recent changes to the approval rule template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastModifiedUser;

/**
 <p>The SHA-256 hash signature for the content of the approval rule template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleContentSha256;

@end

/**
 <p>Returns information about a change in the approval state for a pull request.</p>
 */
@interface AWSCodecommitApprovalStateChangedEventMetadata : AWSModel


/**
 <p>The approval status for the pull request.</p>
 */
@property (nonatomic, assign) AWSCodecommitApprovalState approvalStatus;

/**
 <p>The revision ID of the pull request when the approval state changed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSCodecommitAssociateApprovalRuleTemplateWithRepositoryInput : AWSRequest


/**
 <p>The name for the approval rule template. </p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleTemplateName;

/**
 <p>The name of the repository that you want to associate with the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>Returns information about errors in a BatchAssociateApprovalRuleTemplateWithRepositories operation.</p>
 */
@interface AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesError : AWSModel


/**
 <p>An error code that specifies whether the repository name was not valid or not found.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>An error message that provides details about why the repository name was not found or not valid.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The name of the repository where the association was not made.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesInput : AWSRequest


/**
 <p>The name of the template you want to associate with one or more repositories.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleTemplateName;

/**
 <p>The names of the repositories you want to associate with the template.</p><note><p>The length constraint limit is for each string in the array. The array itself can be empty.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable repositoryNames;

@end

/**
 
 */
@interface AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesOutput : AWSModel


/**
 <p>A list of names of the repositories that have been associated with the template.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable associatedRepositoryNames;

/**
 <p>A list of any errors that might have occurred while attempting to create the association between the template and the repositories.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesError *> * _Nullable errors;

@end

/**
 <p>Returns information about errors in a BatchDescribeMergeConflicts operation.</p>
 Required parameters: [filePath, exceptionName, message]
 */
@interface AWSCodecommitBatchDescribeMergeConflictsError : AWSModel


/**
 <p>The name of the exception.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exceptionName;

/**
 <p>The path to the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filePath;

/**
 <p>The message provided by the exception.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 
 */
@interface AWSCodecommitBatchDescribeMergeConflictsInput : AWSRequest


/**
 <p>The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in both branches has differences on the same line.</p>
 */
@property (nonatomic, assign) AWSCodecommitConflictDetailLevelTypeEnum conflictDetailLevel;

/**
 <p>Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging two versions of a file. The default is NONE, which requires any conflicts to be resolved manually before the merge operation is successful.</p>
 */
@property (nonatomic, assign) AWSCodecommitConflictResolutionStrategyTypeEnum conflictResolutionStrategy;

/**
 <p>The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCommitSpecifier;

/**
 <p>The path of the target files used to describe the conflicts. If not specified, the default is all conflict files.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable filePaths;

/**
 <p>The maximum number of files to include in the output.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxConflictFiles;

/**
 <p>The maximum number of merge hunks to include in the output.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxMergeHunks;

/**
 <p>The merge option or strategy you want to use to merge the code.</p>
 */
@property (nonatomic, assign) AWSCodecommitMergeOptionTypeEnum mergeOption;

/**
 <p>An enumeration token that, when provided in a request, returns the next batch of the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the repository that contains the merge conflicts you want to review.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCommitSpecifier;

@end

/**
 
 */
@interface AWSCodecommitBatchDescribeMergeConflictsOutput : AWSModel


/**
 <p>The commit ID of the merge base.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baseCommitId;

/**
 <p>A list of conflicts for each file, including the conflict metadata and the hunks of the differences between the files.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitConflict *> * _Nullable conflicts;

/**
 <p>The commit ID of the destination commit specifier that was used in the merge evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCommitId;

/**
 <p>A list of any errors returned while describing the merge conflicts for each file.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitBatchDescribeMergeConflictsError *> * _Nullable errors;

/**
 <p>An enumeration token that can be used in a request to return the next batch of the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The commit ID of the source commit specifier that was used in the merge evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCommitId;

@end

/**
 <p>Returns information about errors in a BatchDisassociateApprovalRuleTemplateFromRepositories operation.</p>
 */
@interface AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesError : AWSModel


/**
 <p>An error code that specifies whether the repository name was not valid or not found.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>An error message that provides details about why the repository name was either not found or not valid.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The name of the repository where the association with the template was not able to be removed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesInput : AWSRequest


/**
 <p>The name of the template that you want to disassociate from one or more repositories.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleTemplateName;

/**
 <p>The repository names that you want to disassociate from the approval rule template.</p><note><p>The length constraint limit is for each string in the array. The array itself can be empty.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable repositoryNames;

@end

/**
 
 */
@interface AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesOutput : AWSModel


/**
 <p>A list of repository names that have had their association with the template removed.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable disassociatedRepositoryNames;

/**
 <p>A list of any errors that might have occurred while attempting to remove the association between the template and the repositories.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesError *> * _Nullable errors;

@end

/**
 <p>Returns information about errors in a BatchGetCommits operation.</p>
 */
@interface AWSCodecommitBatchGetCommitsError : AWSModel


/**
 <p>A commit ID that either could not be found or was not in a valid format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitId;

/**
 <p>An error code that specifies whether the commit ID was not valid or not found.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>An error message that provides detail about why the commit ID either was not found or was not valid.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

@end

/**
 
 */
@interface AWSCodecommitBatchGetCommitsInput : AWSRequest


/**
 <p>The full commit IDs of the commits to get information about.</p><note><p>You must supply the full SHA IDs of each commit. You cannot use shortened SHA IDs.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable commitIds;

/**
 <p>The name of the repository that contains the commits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSCodecommitBatchGetCommitsOutput : AWSModel


/**
 <p>An array of commit data type objects, each of which contains information about a specified commit.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitCommit *> * _Nullable commits;

/**
 <p>Returns any commit IDs for which information could not be found. For example, if one of the commit IDs was a shortened SHA ID or that commit was not found in the specified repository, the ID returns an error object with more information.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitBatchGetCommitsError *> * _Nullable errors;

@end

/**
 <p>Represents the input of a batch get repositories operation.</p>
 Required parameters: [repositoryNames]
 */
@interface AWSCodecommitBatchGetRepositoriesInput : AWSRequest


/**
 <p>The names of the repositories to get information about.</p><note><p>The length constraint limit is for each string in the array. The array itself can be empty.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable repositoryNames;

@end

/**
 <p>Represents the output of a batch get repositories operation.</p>
 */
@interface AWSCodecommitBatchGetRepositoriesOutput : AWSModel


/**
 <p>A list of repositories returned by the batch get repositories operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitRepositoryMetadata *> * _Nullable repositories;

/**
 <p>Returns a list of repository names for which information could not be found.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable repositoriesNotFound;

@end

/**
 <p>Returns information about a specific Git blob object.</p>
 */
@interface AWSCodecommitBlobMetadata : AWSModel


/**
 <p>The full ID of the blob.</p>
 */
@property (nonatomic, strong) NSString * _Nullable blobId;

/**
 <p>The file mode permissions of the blob. File mode permission codes include:</p><ul><li><p><code>100644</code> indicates read/write</p></li><li><p><code>100755</code> indicates read/write/execute</p></li><li><p><code>160000</code> indicates a submodule</p></li><li><p><code>120000</code> indicates a symlink</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable mode;

/**
 <p>The path to the blob and associated file name, if any.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

@end

/**
 <p>Returns information about a branch.</p>
 */
@interface AWSCodecommitBranchInfo : AWSModel


/**
 <p>The name of the branch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p>The ID of the last commit made to the branch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitId;

@end

/**
 <p>Returns information about a specific comment.</p>
 */
@interface AWSCodecommitComment : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the person who posted the comment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorArn;

/**
 <p>The emoji reactions to a comment, if any, submitted by the user whose credentials are associated with the call to the API.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable callerReactions;

/**
 <p>A unique, client-generated idempotency token that, when provided in a request, ensures the request cannot be repeated with a changed parameter. If a request is received with the same parameters and a token is included, the request returns information about the initial request that used that token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The system-generated comment ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commentId;

/**
 <p>The content of the comment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The date and time the comment was created, in timestamp format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>A Boolean value indicating whether the comment has been deleted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleted;

/**
 <p>The ID of the comment for which this comment is a reply, if any.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inReplyTo;

/**
 <p>The date and time the comment was most recently modified, in timestamp format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>A string to integer map that represents the number of individual users who have responded to a comment with the specified reactions.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable reactionCounts;

@end

/**
 <p>Returns information about comments on the comparison between two commits.</p>
 */
@interface AWSCodecommitCommentsForComparedCommit : AWSModel


/**
 <p>The full blob ID of the commit used to establish the after of the comparison.</p>
 */
@property (nonatomic, strong) NSString * _Nullable afterBlobId;

/**
 <p>The full commit ID of the commit used to establish the after of the comparison.</p>
 */
@property (nonatomic, strong) NSString * _Nullable afterCommitId;

/**
 <p>The full blob ID of the commit used to establish the before of the comparison.</p>
 */
@property (nonatomic, strong) NSString * _Nullable beforeBlobId;

/**
 <p>The full commit ID of the commit used to establish the before of the comparison.</p>
 */
@property (nonatomic, strong) NSString * _Nullable beforeCommitId;

/**
 <p>An array of comment objects. Each comment object contains information about a comment on the comparison between commits.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitComment *> * _Nullable comments;

/**
 <p>Location information about the comment on the comparison, including the file name, line number, and whether the version of the file where the comment was made is BEFORE or AFTER.</p>
 */
@property (nonatomic, strong) AWSCodecommitLocation * _Nullable location;

/**
 <p>The name of the repository that contains the compared commits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>Returns information about comments on a pull request.</p>
 */
@interface AWSCodecommitCommentsForPullRequest : AWSModel


/**
 <p>The full blob ID of the file on which you want to comment on the source commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable afterBlobId;

/**
 <p>The full commit ID of the commit that was the tip of the source branch at the time the comment was made. </p>
 */
@property (nonatomic, strong) NSString * _Nullable afterCommitId;

/**
 <p>The full blob ID of the file on which you want to comment on the destination commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable beforeBlobId;

/**
 <p>The full commit ID of the commit that was the tip of the destination branch when the pull request was created. This commit is superceded by the after commit in the source branch when and if you merge the source branch into the destination branch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable beforeCommitId;

/**
 <p>An array of comment objects. Each comment object contains information about a comment on the pull request.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitComment *> * _Nullable comments;

/**
 <p>Location information about the comment on the pull request, including the file name, line number, and whether the version of the file where the comment was made is BEFORE (destination branch) or AFTER (source branch).</p>
 */
@property (nonatomic, strong) AWSCodecommitLocation * _Nullable location;

/**
 <p>The system-generated ID of the pull request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

/**
 <p>The name of the repository that contains the pull request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>Returns information about a specific commit.</p>
 */
@interface AWSCodecommitCommit : AWSModel


/**
 <p>Any other data associated with the specified commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable additionalData;

/**
 <p>Information about the author of the specified commit. Information includes the date in timestamp format with GMT offset, the name of the author, and the email address for the author, as configured in Git.</p>
 */
@property (nonatomic, strong) AWSCodecommitUserInfo * _Nullable author;

/**
 <p>The full SHA ID of the specified commit. </p>
 */
@property (nonatomic, strong) NSString * _Nullable commitId;

/**
 <p>Information about the person who committed the specified commit, also known as the committer. Information includes the date in timestamp format with GMT offset, the name of the committer, and the email address for the committer, as configured in Git.</p><p>For more information about the difference between an author and a committer in Git, see <a href="http://git-scm.com/book/ch2-3.html">Viewing the Commit History</a> in Pro Git by Scott Chacon and Ben Straub.</p>
 */
@property (nonatomic, strong) AWSCodecommitUserInfo * _Nullable committer;

/**
 <p>The commit message associated with the specified commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>A list of parent commits for the specified commit. Each parent commit ID is the full commit ID.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable parents;

/**
 <p>Tree information for the specified commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable treeId;

@end

/**
 <p>Information about conflicts in a merge operation.</p>
 */
@interface AWSCodecommitConflict : AWSModel


/**
 <p>Metadata about a conflict in a merge operation.</p>
 */
@property (nonatomic, strong) AWSCodecommitConflictMetadata * _Nullable conflictMetadata;

/**
 <p>A list of hunks that contain the differences between files or lines causing the conflict.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitMergeHunk *> * _Nullable mergeHunks;

@end

/**
 <p>Information about the metadata for a conflict in a merge operation.</p>
 */
@interface AWSCodecommitConflictMetadata : AWSModel


/**
 <p>A boolean value indicating whether there are conflicts in the content of a file.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable contentConflict;

/**
 <p>A boolean value indicating whether there are conflicts in the file mode of a file.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fileModeConflict;

/**
 <p>The file modes of the file in the source, destination, and base of the merge.</p>
 */
@property (nonatomic, strong) AWSCodecommitFileModes * _Nullable fileModes;

/**
 <p>The path of the file that contains conflicts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filePath;

/**
 <p>The file sizes of the file in the source, destination, and base of the merge.</p>
 */
@property (nonatomic, strong) AWSCodecommitFileSizes * _Nullable fileSizes;

/**
 <p>A boolean value (true or false) indicating whether the file is binary or textual in the source, destination, and base of the merge.</p>
 */
@property (nonatomic, strong) AWSCodecommitIsBinaryFile * _Nullable isBinaryFile;

/**
 <p>Whether an add, modify, or delete operation caused the conflict between the source and destination of the merge.</p>
 */
@property (nonatomic, strong) AWSCodecommitMergeOperations * _Nullable mergeOperations;

/**
 <p>The number of conflicts, including both hunk conflicts and metadata conflicts.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfConflicts;

/**
 <p>A boolean value (true or false) indicating whether there are conflicts between the branches in the object type of a file, folder, or submodule.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable objectTypeConflict;

/**
 <p>Information about any object type conflicts in a merge operation.</p>
 */
@property (nonatomic, strong) AWSCodecommitObjectTypes * _Nullable objectTypes;

@end

/**
 <p>If AUTOMERGE is the conflict resolution strategy, a list of inputs to use when resolving conflicts during a merge.</p>
 */
@interface AWSCodecommitConflictResolution : AWSModel


/**
 <p>Files to be deleted as part of the merge conflict resolution.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitDeleteFileEntry *> * _Nullable deleteFiles;

/**
 <p>Files to have content replaced as part of the merge conflict resolution.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitReplaceContentEntry *> * _Nullable replaceContents;

/**
 <p>File modes that are set as part of the merge conflict resolution.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitSetFileModeEntry *> * _Nullable setFileModes;

@end

/**
 
 */
@interface AWSCodecommitCreateApprovalRuleTemplateInput : AWSRequest


/**
 <p>The content of the approval rule that is created on pull requests in associated repositories. If you specify one or more destination references (branches), approval rules are created in an associated repository only if their destination references (branches) match those specified in the template.</p><note><p>When you create the content of the approval rule template, you can specify approvers in an approval pool in one of two ways:</p><ul><li><p><b>CodeCommitApprovers</b>: This option only requires an AWS account and a resource. It can be used for both IAM users and federated access users whose name matches the provided resource name. This is a very powerful option that offers a great deal of flexibility. For example, if you specify the AWS account <i>123456789012</i> and <i>Mary_Major</i>, all of the following are counted as approvals coming from that user:</p><ul><li><p>An IAM user in the account (arn:aws:iam::<i>123456789012</i>:user/<i>Mary_Major</i>)</p></li><li><p>A federated user identified in IAM as Mary_Major (arn:aws:sts::<i>123456789012</i>:federated-user/<i>Mary_Major</i>)</p></li></ul><p>This option does not recognize an active session of someone assuming the role of CodeCommitReview with a role session name of <i>Mary_Major</i> (arn:aws:sts::<i>123456789012</i>:assumed-role/CodeCommitReview/<i>Mary_Major</i>) unless you include a wildcard (*Mary_Major).</p></li><li><p><b>Fully qualified ARN</b>: This option allows you to specify the fully qualified Amazon Resource Name (ARN) of the IAM user or role. </p></li></ul><p>For more information about IAM ARNs, wildcards, and formats, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleTemplateContent;

/**
 <p>The description of the approval rule template. Consider providing a description that explains what this template does and when it might be appropriate to associate it with repositories.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleTemplateDescription;

/**
 <p>The name of the approval rule template. Provide descriptive names, because this name is applied to the approval rules created automatically in associated repositories.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleTemplateName;

@end

/**
 
 */
@interface AWSCodecommitCreateApprovalRuleTemplateOutput : AWSModel


/**
 <p>The content and structure of the created approval rule template.</p>
 */
@property (nonatomic, strong) AWSCodecommitApprovalRuleTemplate * _Nullable approvalRuleTemplate;

@end

/**
 <p>Represents the input of a create branch operation.</p>
 Required parameters: [repositoryName, branchName, commitId]
 */
@interface AWSCodecommitCreateBranchInput : AWSRequest


/**
 <p>The name of the new branch to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p>The ID of the commit to point the new branch to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitId;

/**
 <p>The name of the repository in which you want to create the new branch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSCodecommitCreateCommitInput : AWSRequest


/**
 <p>The name of the author who created the commit. This information is used as both the author and committer for the commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorName;

/**
 <p>The name of the branch where you create the commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p>The commit message you want to include in the commit. Commit messages are limited to 256 KB. If no message is specified, a default message is used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitMessage;

/**
 <p>The files to delete in this commit. These files still exist in earlier commits.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitDeleteFileEntry *> * _Nullable deleteFiles;

/**
 <p>The email address of the person who created the commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>If the commit contains deletions, whether to keep a folder or folder structure if the changes leave the folders empty. If true, a ..gitkeep file is created for empty folders. The default is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable keepEmptyFolders;

/**
 <p>The ID of the commit that is the parent of the commit you create. Not required if this is an empty repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentCommitId;

/**
 <p>The files to add or update in this commit.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitPutFileEntry *> * _Nullable putFiles;

/**
 <p>The name of the repository where you create the commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The file modes to update for files in this commit.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitSetFileModeEntry *> * _Nullable setFileModes;

@end

/**
 
 */
@interface AWSCodecommitCreateCommitOutput : AWSModel


/**
 <p>The full commit ID of the commit that contains your committed file changes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitId;

/**
 <p>The files added as part of the committed file changes.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitFileMetadata *> * _Nullable filesAdded;

/**
 <p>The files deleted as part of the committed file changes.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitFileMetadata *> * _Nullable filesDeleted;

/**
 <p>The files updated as part of the commited file changes.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitFileMetadata *> * _Nullable filesUpdated;

/**
 <p>The full SHA-1 pointer of the tree information for the commit that contains the commited file changes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable treeId;

@end

/**
 
 */
@interface AWSCodecommitCreatePullRequestApprovalRuleInput : AWSRequest


/**
 <p>The content of the approval rule, including the number of approvals needed and the structure of an approval pool defined for approvals, if any. For more information about approval pools, see the AWS CodeCommit User Guide.</p><note><p>When you create the content of the approval rule, you can specify approvers in an approval pool in one of two ways:</p><ul><li><p><b>CodeCommitApprovers</b>: This option only requires an AWS account and a resource. It can be used for both IAM users and federated access users whose name matches the provided resource name. This is a very powerful option that offers a great deal of flexibility. For example, if you specify the AWS account <i>123456789012</i> and <i>Mary_Major</i>, all of the following would be counted as approvals coming from that user:</p><ul><li><p>An IAM user in the account (arn:aws:iam::<i>123456789012</i>:user/<i>Mary_Major</i>)</p></li><li><p>A federated user identified in IAM as Mary_Major (arn:aws:sts::<i>123456789012</i>:federated-user/<i>Mary_Major</i>)</p></li></ul><p>This option does not recognize an active session of someone assuming the role of CodeCommitReview with a role session name of <i>Mary_Major</i> (arn:aws:sts::<i>123456789012</i>:assumed-role/CodeCommitReview/<i>Mary_Major</i>) unless you include a wildcard (*Mary_Major).</p></li><li><p><b>Fully qualified ARN</b>: This option allows you to specify the fully qualified Amazon Resource Name (ARN) of the IAM user or role. </p></li></ul><p>For more information about IAM ARNs, wildcards, and formats, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleContent;

/**
 <p>The name for the approval rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleName;

/**
 <p>The system-generated ID of the pull request for which you want to create the approval rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

@end

/**
 
 */
@interface AWSCodecommitCreatePullRequestApprovalRuleOutput : AWSModel


/**
 <p>Information about the created approval rule.</p>
 */
@property (nonatomic, strong) AWSCodecommitApprovalRule * _Nullable approvalRule;

@end

/**
 
 */
@interface AWSCodecommitCreatePullRequestInput : AWSRequest


/**
 <p>A unique, client-generated idempotency token that, when provided in a request, ensures the request cannot be repeated with a changed parameter. If a request is received with the same parameters and a token is included, the request returns information about the initial request that used that token.</p><note><p>The AWS SDKs prepopulate client request tokens. If you are using an AWS SDK, an idempotency token is created for you.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>A description of the pull request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The targets for the pull request, including the source of the code to be reviewed (the source branch) and the destination where the creator of the pull request intends the code to be merged after the pull request is closed (the destination branch).</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitTarget *> * _Nullable targets;

/**
 <p>The title of the pull request. This title is used to identify the pull request to other users in the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

@end

/**
 
 */
@interface AWSCodecommitCreatePullRequestOutput : AWSModel


/**
 <p>Information about the newly created pull request.</p>
 */
@property (nonatomic, strong) AWSCodecommitPullRequest * _Nullable pullRequest;

@end

/**
 <p>Represents the input of a create repository operation.</p>
 Required parameters: [repositoryName]
 */
@interface AWSCodecommitCreateRepositoryInput : AWSRequest


/**
 <p>A comment or description about the new repository.</p><note><p>The description field for a repository accepts all HTML characters and all valid Unicode characters. Applications that do not HTML-encode the description and display it in a webpage can expose users to potentially malicious code. Make sure that you HTML-encode the description field in any application that uses this API to display the repository description on a webpage.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryDescription;

/**
 <p>The name of the new repository to be created.</p><note><p>The repository name must be unique across the calling AWS account. Repository names are limited to 100 alphanumeric, dash, and underscore characters, and cannot include certain characters. For more information about the limits on repository names, see <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/limits.html">Limits</a> in the <i>AWS CodeCommit User Guide</i>. The suffix .git is prohibited.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>One or more tag key-value pairs to use when tagging this repository.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Represents the output of a create repository operation.</p>
 */
@interface AWSCodecommitCreateRepositoryOutput : AWSModel


/**
 <p>Information about the newly created repository.</p>
 */
@property (nonatomic, strong) AWSCodecommitRepositoryMetadata * _Nullable repositoryMetadata;

@end

/**
 
 */
@interface AWSCodecommitCreateUnreferencedMergeCommitInput : AWSRequest


/**
 <p>The name of the author who created the unreferenced commit. This information is used as both the author and committer for the commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorName;

/**
 <p>The commit message for the unreferenced commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitMessage;

/**
 <p>The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in both branches has differences on the same line.</p>
 */
@property (nonatomic, assign) AWSCodecommitConflictDetailLevelTypeEnum conflictDetailLevel;

/**
 <p>If AUTOMERGE is the conflict resolution strategy, a list of inputs to use when resolving conflicts during a merge.</p>
 */
@property (nonatomic, strong) AWSCodecommitConflictResolution * _Nullable conflictResolution;

/**
 <p>Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging two versions of a file. The default is NONE, which requires any conflicts to be resolved manually before the merge operation is successful.</p>
 */
@property (nonatomic, assign) AWSCodecommitConflictResolutionStrategyTypeEnum conflictResolutionStrategy;

/**
 <p>The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCommitSpecifier;

/**
 <p>The email address for the person who created the unreferenced commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>If the commit contains deletions, whether to keep a folder or folder structure if the changes leave the folders empty. If this is specified as true, a .gitkeep file is created for empty folders. The default is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable keepEmptyFolders;

/**
 <p>The merge option or strategy you want to use to merge the code.</p>
 */
@property (nonatomic, assign) AWSCodecommitMergeOptionTypeEnum mergeOption;

/**
 <p>The name of the repository where you want to create the unreferenced merge commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCommitSpecifier;

@end

/**
 
 */
@interface AWSCodecommitCreateUnreferencedMergeCommitOutput : AWSModel


/**
 <p>The full commit ID of the commit that contains your merge results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitId;

/**
 <p>The full SHA-1 pointer of the tree information for the commit that contains the merge results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable treeId;

@end

/**
 
 */
@interface AWSCodecommitDeleteApprovalRuleTemplateInput : AWSRequest


/**
 <p>The name of the approval rule template to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleTemplateName;

@end

/**
 
 */
@interface AWSCodecommitDeleteApprovalRuleTemplateOutput : AWSModel


/**
 <p>The system-generated ID of the deleted approval rule template. If the template has been previously deleted, the only response is a 200 OK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleTemplateId;

@end

/**
 <p>Represents the input of a delete branch operation.</p>
 Required parameters: [repositoryName, branchName]
 */
@interface AWSCodecommitDeleteBranchInput : AWSRequest


/**
 <p>The name of the branch to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p>The name of the repository that contains the branch to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>Represents the output of a delete branch operation.</p>
 */
@interface AWSCodecommitDeleteBranchOutput : AWSModel


/**
 <p>Information about the branch deleted by the operation, including the branch name and the commit ID that was the tip of the branch.</p>
 */
@property (nonatomic, strong) AWSCodecommitBranchInfo * _Nullable deletedBranch;

@end

/**
 
 */
@interface AWSCodecommitDeleteCommentContentInput : AWSRequest


/**
 <p>The unique, system-generated ID of the comment. To get this ID, use <a>GetCommentsForComparedCommit</a> or <a>GetCommentsForPullRequest</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commentId;

@end

/**
 
 */
@interface AWSCodecommitDeleteCommentContentOutput : AWSModel


/**
 <p>Information about the comment you just deleted.</p>
 */
@property (nonatomic, strong) AWSCodecommitComment * _Nullable comment;

@end

/**
 <p>A file that is deleted as part of a commit.</p>
 Required parameters: [filePath]
 */
@interface AWSCodecommitDeleteFileEntry : AWSModel


/**
 <p>The full path of the file to be deleted, including the name of the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filePath;

@end

/**
 
 */
@interface AWSCodecommitDeleteFileInput : AWSRequest


/**
 <p>The name of the branch where the commit that deletes the file is made.</p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p>The commit message you want to include as part of deleting the file. Commit messages are limited to 256 KB. If no message is specified, a default message is used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitMessage;

/**
 <p>The email address for the commit that deletes the file. If no email address is specified, the email address is left blank.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The fully qualified path to the file that to be deleted, including the full name and extension of that file. For example, /examples/file.md is a fully qualified path to a file named file.md in a folder named examples.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filePath;

/**
 <p>If a file is the only object in the folder or directory, specifies whether to delete the folder or directory that contains the file. By default, empty folders are deleted. This includes empty folders that are part of the directory structure. For example, if the path to a file is dir1/dir2/dir3/dir4, and dir2 and dir3 are empty, deleting the last file in dir4 also deletes the empty folders dir4, dir3, and dir2.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable keepEmptyFolders;

/**
 <p>The name of the author of the commit that deletes the file. If no name is specified, the user's ARN is used as the author name and committer name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ID of the commit that is the tip of the branch where you want to create the commit that deletes the file. This must be the HEAD commit for the branch. The commit that deletes the file is created from this commit ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentCommitId;

/**
 <p>The name of the repository that contains the file to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSCodecommitDeleteFileOutput : AWSModel


/**
 <p>The blob ID removed from the tree as part of deleting the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable blobId;

/**
 <p>The full commit ID of the commit that contains the change that deletes the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitId;

/**
 <p>The fully qualified path to the file to be deleted, including the full name and extension of that file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filePath;

/**
 <p>The full SHA-1 pointer of the tree information for the commit that contains the delete file change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable treeId;

@end

/**
 
 */
@interface AWSCodecommitDeletePullRequestApprovalRuleInput : AWSRequest


/**
 <p>The name of the approval rule you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleName;

/**
 <p>The system-generated ID of the pull request that contains the approval rule you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

@end

/**
 
 */
@interface AWSCodecommitDeletePullRequestApprovalRuleOutput : AWSModel


/**
 <p>The ID of the deleted approval rule. </p><note><p>If the approval rule was deleted in an earlier API call, the response is 200 OK without content.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleId;

@end

/**
 <p>Represents the input of a delete repository operation.</p>
 Required parameters: [repositoryName]
 */
@interface AWSCodecommitDeleteRepositoryInput : AWSRequest


/**
 <p>The name of the repository to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>Represents the output of a delete repository operation.</p>
 */
@interface AWSCodecommitDeleteRepositoryOutput : AWSModel


/**
 <p>The ID of the repository that was deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryId;

@end

/**
 
 */
@interface AWSCodecommitDescribeMergeConflictsInput : AWSRequest


/**
 <p>The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in both branches has differences on the same line.</p>
 */
@property (nonatomic, assign) AWSCodecommitConflictDetailLevelTypeEnum conflictDetailLevel;

/**
 <p>Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging two versions of a file. The default is NONE, which requires any conflicts to be resolved manually before the merge operation is successful.</p>
 */
@property (nonatomic, assign) AWSCodecommitConflictResolutionStrategyTypeEnum conflictResolutionStrategy;

/**
 <p>The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCommitSpecifier;

/**
 <p>The path of the target files used to describe the conflicts. </p>
 */
@property (nonatomic, strong) NSString * _Nullable filePath;

/**
 <p>The maximum number of merge hunks to include in the output.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxMergeHunks;

/**
 <p>The merge option or strategy you want to use to merge the code.</p>
 */
@property (nonatomic, assign) AWSCodecommitMergeOptionTypeEnum mergeOption;

/**
 <p>An enumeration token that, when provided in a request, returns the next batch of the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the repository where you want to get information about a merge conflict.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCommitSpecifier;

@end

/**
 
 */
@interface AWSCodecommitDescribeMergeConflictsOutput : AWSModel


/**
 <p>The commit ID of the merge base.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baseCommitId;

/**
 <p>Contains metadata about the conflicts found in the merge.</p>
 */
@property (nonatomic, strong) AWSCodecommitConflictMetadata * _Nullable conflictMetadata;

/**
 <p>The commit ID of the destination commit specifier that was used in the merge evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCommitId;

/**
 <p>A list of merge hunks of the differences between the files or lines.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitMergeHunk *> * _Nullable mergeHunks;

/**
 <p>An enumeration token that can be used in a request to return the next batch of the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The commit ID of the source commit specifier that was used in the merge evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCommitId;

@end

/**
 
 */
@interface AWSCodecommitDescribePullRequestEventsInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the user whose actions resulted in the event. Examples include updating the pull request with more commits or changing the status of a pull request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actorArn;

/**
 <p>A non-zero, non-negative integer used to limit the number of returned results. The default is 100 events, which is also the maximum number of events that can be returned in a result.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An enumeration token that, when provided in a request, returns the next batch of the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Optional. The pull request event type about which you want to return information.</p>
 */
@property (nonatomic, assign) AWSCodecommitPullRequestEventType pullRequestEventType;

/**
 <p>The system-generated ID of the pull request. To get this ID, use <a>ListPullRequests</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

@end

/**
 
 */
@interface AWSCodecommitDescribePullRequestEventsOutput : AWSModel


/**
 <p>An enumeration token that can be used in a request to return the next batch of the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the pull request events.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitPullRequestEvent *> * _Nullable pullRequestEvents;

@end

/**
 <p>Returns information about a set of differences for a commit specifier.</p>
 */
@interface AWSCodecommitDifference : AWSModel


/**
 <p>Information about an <code>afterBlob</code> data type object, including the ID, the file mode permission code, and the path.</p>
 */
@property (nonatomic, strong) AWSCodecommitBlobMetadata * _Nullable afterBlob;

/**
 <p>Information about a <code>beforeBlob</code> data type object, including the ID, the file mode permission code, and the path.</p>
 */
@property (nonatomic, strong) AWSCodecommitBlobMetadata * _Nullable beforeBlob;

/**
 <p>Whether the change type of the difference is an addition (A), deletion (D), or modification (M).</p>
 */
@property (nonatomic, assign) AWSCodecommitChangeTypeEnum changeType;

@end

/**
 
 */
@interface AWSCodecommitDisassociateApprovalRuleTemplateFromRepositoryInput : AWSRequest


/**
 <p>The name of the approval rule template to disassociate from a specified repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleTemplateName;

/**
 <p>The name of the repository you want to disassociate from the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSCodecommitEvaluatePullRequestApprovalRulesInput : AWSRequest


/**
 <p>The system-generated ID of the pull request you want to evaluate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

/**
 <p>The system-generated ID for the pull request revision. To retrieve the most recent revision ID for a pull request, use <a>GetPullRequest</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSCodecommitEvaluatePullRequestApprovalRulesOutput : AWSModel


/**
 <p>The result of the evaluation, including the names of the rules whose conditions have been met (if any), the names of the rules whose conditions have not been met (if any), whether the pull request is in the approved state, and whether the pull request approval rule has been set aside by an override. </p>
 */
@property (nonatomic, strong) AWSCodecommitEvaluation * _Nullable evaluation;

@end

/**
 <p>Returns information about the approval rules applied to a pull request and whether conditions have been met.</p>
 */
@interface AWSCodecommitEvaluation : AWSModel


/**
 <p>The names of the approval rules that have not had their conditions met.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable approvalRulesNotSatisfied;

/**
 <p>The names of the approval rules that have had their conditions met.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable approvalRulesSatisfied;

/**
 <p>Whether the state of the pull request is approved.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable approved;

/**
 <p>Whether the approval rule requirements for the pull request have been overridden and no longer need to be met.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable overridden;

@end

/**
 <p>Returns information about a file in a repository.</p>
 */
@interface AWSCodecommitFile : AWSModel


/**
 <p>The fully qualified path to the file in the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable absolutePath;

/**
 <p>The blob ID that contains the file information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable blobId;

/**
 <p>The extrapolated file mode permissions for the file. Valid values include EXECUTABLE and NORMAL.</p>
 */
@property (nonatomic, assign) AWSCodecommitFileModeTypeEnum fileMode;

/**
 <p>The relative path of the file from the folder where the query originated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relativePath;

@end

/**
 <p>A file to be added, updated, or deleted as part of a commit.</p>
 */
@interface AWSCodecommitFileMetadata : AWSModel


/**
 <p>The full path to the file to be added or updated, including the name of the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable absolutePath;

/**
 <p>The blob ID that contains the file information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable blobId;

/**
 <p>The extrapolated file mode permissions for the file. Valid values include EXECUTABLE and NORMAL.</p>
 */
@property (nonatomic, assign) AWSCodecommitFileModeTypeEnum fileMode;

@end

/**
 <p>Information about file modes in a merge or pull request.</p>
 */
@interface AWSCodecommitFileModes : AWSModel


/**
 <p>The file mode of a file in the base of a merge or pull request.</p>
 */
@property (nonatomic, assign) AWSCodecommitFileModeTypeEnum base;

/**
 <p>The file mode of a file in the destination of a merge or pull request.</p>
 */
@property (nonatomic, assign) AWSCodecommitFileModeTypeEnum destination;

/**
 <p>The file mode of a file in the source of a merge or pull request.</p>
 */
@property (nonatomic, assign) AWSCodecommitFileModeTypeEnum source;

@end

/**
 <p>Information about the size of files in a merge or pull request.</p>
 */
@interface AWSCodecommitFileSizes : AWSModel


/**
 <p>The size of a file in the base of a merge or pull request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable base;

/**
 <p>The size of a file in the destination of a merge or pull request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable destination;

/**
 <p>The size of a file in the source of a merge or pull request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable source;

@end

/**
 <p>Returns information about a folder in a repository.</p>
 */
@interface AWSCodecommitFolder : AWSModel


/**
 <p>The fully qualified path of the folder in the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable absolutePath;

/**
 <p>The relative path of the specified folder from the folder where the query originated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relativePath;

/**
 <p>The full SHA-1 pointer of the tree information for the commit that contains the folder.</p>
 */
@property (nonatomic, strong) NSString * _Nullable treeId;

@end

/**
 
 */
@interface AWSCodecommitGetApprovalRuleTemplateInput : AWSRequest


/**
 <p>The name of the approval rule template for which you want to get information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleTemplateName;

@end

/**
 
 */
@interface AWSCodecommitGetApprovalRuleTemplateOutput : AWSModel


/**
 <p>The content and structure of the approval rule template.</p>
 */
@property (nonatomic, strong) AWSCodecommitApprovalRuleTemplate * _Nullable approvalRuleTemplate;

@end

/**
 <p>Represents the input of a get blob operation.</p>
 Required parameters: [repositoryName, blobId]
 */
@interface AWSCodecommitGetBlobInput : AWSRequest


/**
 <p>The ID of the blob, which is its SHA-1 pointer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable blobId;

/**
 <p>The name of the repository that contains the blob.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>Represents the output of a get blob operation.</p>
 Required parameters: [content]
 */
@interface AWSCodecommitGetBlobOutput : AWSModel


/**
 <p>The content of the blob, usually a file.</p>
 */
@property (nonatomic, strong) NSData * _Nullable content;

@end

/**
 <p>Represents the input of a get branch operation.</p>
 */
@interface AWSCodecommitGetBranchInput : AWSRequest


/**
 <p>The name of the branch for which you want to retrieve information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p>The name of the repository that contains the branch for which you want to retrieve information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>Represents the output of a get branch operation.</p>
 */
@interface AWSCodecommitGetBranchOutput : AWSModel


/**
 <p>The name of the branch.</p>
 */
@property (nonatomic, strong) AWSCodecommitBranchInfo * _Nullable branch;

@end

/**
 
 */
@interface AWSCodecommitGetCommentInput : AWSRequest


/**
 <p>The unique, system-generated ID of the comment. To get this ID, use <a>GetCommentsForComparedCommit</a> or <a>GetCommentsForPullRequest</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commentId;

@end

/**
 
 */
@interface AWSCodecommitGetCommentOutput : AWSModel


/**
 <p>The contents of the comment.</p>
 */
@property (nonatomic, strong) AWSCodecommitComment * _Nullable comment;

@end

/**
 
 */
@interface AWSCodecommitGetCommentReactionsInput : AWSRequest


/**
 <p>The ID of the comment for which you want to get reactions information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commentId;

/**
 <p>A non-zero, non-negative integer used to limit the number of returned results. The default is the same as the allowed maximum, 1,000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An enumeration token that, when provided in a request, returns the next batch of the results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Optional. The Amazon Resource Name (ARN) of the user or identity for which you want to get reaction information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reactionUserArn;

@end

/**
 
 */
@interface AWSCodecommitGetCommentReactionsOutput : AWSModel


/**
 <p>An enumeration token that can be used in a request to return the next batch of the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of reactions to the specified comment.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitReactionForComment *> * _Nullable reactionsForComment;

@end

/**
 
 */
@interface AWSCodecommitGetCommentsForComparedCommitInput : AWSRequest


/**
 <p>To establish the directionality of the comparison, the full commit ID of the after commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable afterCommitId;

/**
 <p>To establish the directionality of the comparison, the full commit ID of the before commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable beforeCommitId;

/**
 <p>A non-zero, non-negative integer used to limit the number of returned results. The default is 100 comments, but you can configure up to 500.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An enumeration token that when provided in a request, returns the next batch of the results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the repository where you want to compare commits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSCodecommitGetCommentsForComparedCommitOutput : AWSModel


/**
 <p>A list of comment objects on the compared commit.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitCommentsForComparedCommit *> * _Nullable commentsForComparedCommitData;

/**
 <p>An enumeration token that can be used in a request to return the next batch of the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCodecommitGetCommentsForPullRequestInput : AWSRequest


/**
 <p>The full commit ID of the commit in the source branch that was the tip of the branch at the time the comment was made.</p>
 */
@property (nonatomic, strong) NSString * _Nullable afterCommitId;

/**
 <p>The full commit ID of the commit in the destination branch that was the tip of the branch at the time the pull request was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable beforeCommitId;

/**
 <p>A non-zero, non-negative integer used to limit the number of returned results. The default is 100 comments. You can return up to 500 comments with a single request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An enumeration token that, when provided in a request, returns the next batch of the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The system-generated ID of the pull request. To get this ID, use <a>ListPullRequests</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

/**
 <p>The name of the repository that contains the pull request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSCodecommitGetCommentsForPullRequestOutput : AWSModel


/**
 <p>An array of comment objects on the pull request.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitCommentsForPullRequest *> * _Nullable commentsForPullRequestData;

/**
 <p>An enumeration token that can be used in a request to return the next batch of the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents the input of a get commit operation.</p>
 Required parameters: [repositoryName, commitId]
 */
@interface AWSCodecommitGetCommitInput : AWSRequest


/**
 <p>The commit ID. Commit IDs are the full SHA ID of the commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitId;

/**
 <p>The name of the repository to which the commit was made.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>Represents the output of a get commit operation.</p>
 Required parameters: [commit]
 */
@interface AWSCodecommitGetCommitOutput : AWSModel


/**
 <p>A commit data type object that contains information about the specified commit.</p>
 */
@property (nonatomic, strong) AWSCodecommitCommit * _Nullable commit;

@end

/**
 
 */
@interface AWSCodecommitGetDifferencesInput : AWSRequest


/**
 <p>A non-zero, non-negative integer used to limit the number of returned results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An enumeration token that, when provided in a request, returns the next batch of the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The branch, tag, HEAD, or other fully qualified reference used to identify a commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable afterCommitSpecifier;

/**
 <p>The file path in which to check differences. Limits the results to this path. Can also be used to specify the changed name of a directory or folder, if it has changed. If not specified, differences are shown for all paths.</p>
 */
@property (nonatomic, strong) NSString * _Nullable afterPath;

/**
 <p>The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, the full commit ID). Optional. If not specified, all changes before the <code>afterCommitSpecifier</code> value are shown. If you do not use <code>beforeCommitSpecifier</code> in your request, consider limiting the results with <code>maxResults</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable beforeCommitSpecifier;

/**
 <p>The file path in which to check for differences. Limits the results to this path. Can also be used to specify the previous name of a directory or folder. If <code>beforePath</code> and <code>afterPath</code> are not specified, differences are shown for all paths.</p>
 */
@property (nonatomic, strong) NSString * _Nullable beforePath;

/**
 <p>The name of the repository where you want to get differences.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSCodecommitGetDifferencesOutput : AWSModel


/**
 <p>An enumeration token that can be used in a request to return the next batch of the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A data type object that contains information about the differences, including whether the difference is added, modified, or deleted (A, D, M).</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitDifference *> * _Nullable differences;

@end

/**
 
 */
@interface AWSCodecommitGetFileInput : AWSRequest


/**
 <p>The fully quaified reference that identifies the commit that contains the file. For example, you can specify a full commit ID, a tag, a branch name, or a reference such as refs/heads/master. If none is provided, the head commit is used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitSpecifier;

/**
 <p>The fully qualified path to the file, including the full name and extension of the file. For example, /examples/file.md is the fully qualified path to a file named file.md in a folder named examples.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filePath;

/**
 <p>The name of the repository that contains the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSCodecommitGetFileOutput : AWSModel


/**
 <p>The blob ID of the object that represents the file content.</p>
 */
@property (nonatomic, strong) NSString * _Nullable blobId;

/**
 <p>The full commit ID of the commit that contains the content returned by GetFile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitId;

/**
 <p>The base-64 encoded binary data object that represents the content of the file.</p>
 */
@property (nonatomic, strong) NSData * _Nullable fileContent;

/**
 <p>The extrapolated file mode permissions of the blob. Valid values include strings such as EXECUTABLE and not numeric values.</p><note><p>The file mode permissions returned by this API are not the standard file mode permission values, such as 100644, but rather extrapolated values. See the supported return values.</p></note>
 */
@property (nonatomic, assign) AWSCodecommitFileModeTypeEnum fileMode;

/**
 <p>The fully qualified path to the specified file. Returns the name and extension of the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filePath;

/**
 <p>The size of the contents of the file, in bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fileSize;

@end

/**
 
 */
@interface AWSCodecommitGetFolderInput : AWSRequest


/**
 <p>A fully qualified reference used to identify a commit that contains the version of the folder's content to return. A fully qualified reference can be a commit ID, branch name, tag, or reference such as HEAD. If no specifier is provided, the folder content is returned as it exists in the HEAD commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitSpecifier;

/**
 <p>The fully qualified path to the folder whose contents are returned, including the folder name. For example, /examples is a fully-qualified path to a folder named examples that was created off of the root directory (/) of a repository. </p>
 */
@property (nonatomic, strong) NSString * _Nullable folderPath;

/**
 <p>The name of the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSCodecommitGetFolderOutput : AWSModel


/**
 <p>The full commit ID used as a reference for the returned version of the folder content.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitId;

/**
 <p>The list of files in the specified folder, if any.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitFile *> * _Nullable files;

/**
 <p>The fully qualified path of the folder whose contents are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable folderPath;

/**
 <p>The list of folders that exist under the specified folder, if any.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitFolder *> * _Nullable subFolders;

/**
 <p>The list of submodules in the specified folder, if any.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitSubModule *> * _Nullable subModules;

/**
 <p>The list of symbolic links to other files and folders in the specified folder, if any.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitSymbolicLink *> * _Nullable symbolicLinks;

/**
 <p>The full SHA-1 pointer of the tree information for the commit that contains the folder.</p>
 */
@property (nonatomic, strong) NSString * _Nullable treeId;

@end

/**
 
 */
@interface AWSCodecommitGetMergeCommitInput : AWSRequest


/**
 <p>The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in both branches has differences on the same line.</p>
 */
@property (nonatomic, assign) AWSCodecommitConflictDetailLevelTypeEnum conflictDetailLevel;

/**
 <p>Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging two versions of a file. The default is NONE, which requires any conflicts to be resolved manually before the merge operation is successful.</p>
 */
@property (nonatomic, assign) AWSCodecommitConflictResolutionStrategyTypeEnum conflictResolutionStrategy;

/**
 <p>The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCommitSpecifier;

/**
 <p>The name of the repository that contains the merge commit about which you want to get information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCommitSpecifier;

@end

/**
 
 */
@interface AWSCodecommitGetMergeCommitOutput : AWSModel


/**
 <p>The commit ID of the merge base.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baseCommitId;

/**
 <p>The commit ID of the destination commit specifier that was used in the merge evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCommitId;

/**
 <p>The commit ID for the merge commit created when the source branch was merged into the destination branch. If the fast-forward merge strategy was used, there is no merge commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mergedCommitId;

/**
 <p>The commit ID of the source commit specifier that was used in the merge evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCommitId;

@end

/**
 
 */
@interface AWSCodecommitGetMergeConflictsInput : AWSRequest


/**
 <p>The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in both branches has differences on the same line.</p>
 */
@property (nonatomic, assign) AWSCodecommitConflictDetailLevelTypeEnum conflictDetailLevel;

/**
 <p>Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging two versions of a file. The default is NONE, which requires any conflicts to be resolved manually before the merge operation is successful.</p>
 */
@property (nonatomic, assign) AWSCodecommitConflictResolutionStrategyTypeEnum conflictResolutionStrategy;

/**
 <p>The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCommitSpecifier;

/**
 <p>The maximum number of files to include in the output.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxConflictFiles;

/**
 <p>The merge option or strategy you want to use to merge the code. </p>
 */
@property (nonatomic, assign) AWSCodecommitMergeOptionTypeEnum mergeOption;

/**
 <p>An enumeration token that, when provided in a request, returns the next batch of the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the repository where the pull request was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCommitSpecifier;

@end

/**
 
 */
@interface AWSCodecommitGetMergeConflictsOutput : AWSModel


/**
 <p>The commit ID of the merge base.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baseCommitId;

/**
 <p>A list of metadata for any conflicting files. If the specified merge strategy is FAST_FORWARD_MERGE, this list is always empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitConflictMetadata *> * _Nullable conflictMetadataList;

/**
 <p>The commit ID of the destination commit specifier that was used in the merge evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCommitId;

/**
 <p>A Boolean value that indicates whether the code is mergeable by the specified merge option.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mergeable;

/**
 <p>An enumeration token that can be used in a request to return the next batch of the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The commit ID of the source commit specifier that was used in the merge evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCommitId;

@end

/**
 
 */
@interface AWSCodecommitGetMergeOptionsInput : AWSRequest


/**
 <p>The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in both branches has differences on the same line.</p>
 */
@property (nonatomic, assign) AWSCodecommitConflictDetailLevelTypeEnum conflictDetailLevel;

/**
 <p>Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging two versions of a file. The default is NONE, which requires any conflicts to be resolved manually before the merge operation is successful.</p>
 */
@property (nonatomic, assign) AWSCodecommitConflictResolutionStrategyTypeEnum conflictResolutionStrategy;

/**
 <p>The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCommitSpecifier;

/**
 <p>The name of the repository that contains the commits about which you want to get merge options.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCommitSpecifier;

@end

/**
 
 */
@interface AWSCodecommitGetMergeOptionsOutput : AWSModel


/**
 <p>The commit ID of the merge base.</p>
 */
@property (nonatomic, strong) NSString * _Nullable baseCommitId;

/**
 <p>The commit ID of the destination commit specifier that was used in the merge evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCommitId;

/**
 <p>The merge option or strategy used to merge the code.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable mergeOptions;

/**
 <p>The commit ID of the source commit specifier that was used in the merge evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCommitId;

@end

/**
 
 */
@interface AWSCodecommitGetPullRequestApprovalStatesInput : AWSRequest


/**
 <p>The system-generated ID for the pull request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

/**
 <p>The system-generated ID for the pull request revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSCodecommitGetPullRequestApprovalStatesOutput : AWSModel


/**
 <p>Information about users who have approved the pull request.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitApproval *> * _Nullable approvals;

@end

/**
 
 */
@interface AWSCodecommitGetPullRequestInput : AWSRequest


/**
 <p>The system-generated ID of the pull request. To get this ID, use <a>ListPullRequests</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

@end

/**
 
 */
@interface AWSCodecommitGetPullRequestOutput : AWSModel


/**
 <p>Information about the specified pull request.</p>
 */
@property (nonatomic, strong) AWSCodecommitPullRequest * _Nullable pullRequest;

@end

/**
 
 */
@interface AWSCodecommitGetPullRequestOverrideStateInput : AWSRequest


/**
 <p>The ID of the pull request for which you want to get information about whether approval rules have been set aside (overridden).</p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

/**
 <p>The system-generated ID of the revision for the pull request. To retrieve the most recent revision ID, use <a>GetPullRequest</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSCodecommitGetPullRequestOverrideStateOutput : AWSModel


/**
 <p>A Boolean value that indicates whether a pull request has had its rules set aside (TRUE) or whether all approval rules still apply (FALSE).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable overridden;

/**
 <p>The Amazon Resource Name (ARN) of the user or identity that overrode the rules and their requirements for the pull request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable overrider;

@end

/**
 <p>Represents the input of a get repository operation.</p>
 Required parameters: [repositoryName]
 */
@interface AWSCodecommitGetRepositoryInput : AWSRequest


/**
 <p>The name of the repository to get information about.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>Represents the output of a get repository operation.</p>
 */
@interface AWSCodecommitGetRepositoryOutput : AWSModel


/**
 <p>Information about the repository.</p>
 */
@property (nonatomic, strong) AWSCodecommitRepositoryMetadata * _Nullable repositoryMetadata;

@end

/**
 <p>Represents the input of a get repository triggers operation.</p>
 Required parameters: [repositoryName]
 */
@interface AWSCodecommitGetRepositoryTriggersInput : AWSRequest


/**
 <p>The name of the repository for which the trigger is configured.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>Represents the output of a get repository triggers operation.</p>
 */
@interface AWSCodecommitGetRepositoryTriggersOutput : AWSModel


/**
 <p>The system-generated unique ID for the trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationId;

/**
 <p>The JSON block of configuration information for each trigger.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitRepositoryTrigger *> * _Nullable triggers;

@end

/**
 <p>Information about whether a file is binary or textual in a merge or pull request operation.</p>
 */
@interface AWSCodecommitIsBinaryFile : AWSModel


/**
 <p>The binary or non-binary status of a file in the base of a merge or pull request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable base;

/**
 <p>The binary or non-binary status of a file in the destination of a merge or pull request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable destination;

/**
 <p>The binary or non-binary status of file in the source of a merge or pull request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable source;

@end

/**
 
 */
@interface AWSCodecommitListApprovalRuleTemplatesInput : AWSRequest


/**
 <p>A non-zero, non-negative integer used to limit the number of returned results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An enumeration token that, when provided in a request, returns the next batch of the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCodecommitListApprovalRuleTemplatesOutput : AWSModel


/**
 <p>The names of all the approval rule templates found in the AWS Region for your AWS account.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable approvalRuleTemplateNames;

/**
 <p>An enumeration token that allows the operation to batch the next results of the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryInput : AWSRequest


/**
 <p>A non-zero, non-negative integer used to limit the number of returned results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An enumeration token that, when provided in a request, returns the next batch of the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the repository for which you want to list all associated approval rule templates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryOutput : AWSModel


/**
 <p>The names of all approval rule templates associated with the repository.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable approvalRuleTemplateNames;

/**
 <p>An enumeration token that allows the operation to batch the next results of the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents the input of a list branches operation.</p>
 Required parameters: [repositoryName]
 */
@interface AWSCodecommitListBranchesInput : AWSRequest


/**
 <p>An enumeration token that allows the operation to batch the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the repository that contains the branches.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>Represents the output of a list branches operation.</p>
 */
@interface AWSCodecommitListBranchesOutput : AWSModel


/**
 <p>The list of branch names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable branches;

/**
 <p>An enumeration token that returns the batch of the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCodecommitListPullRequestsInput : AWSRequest


/**
 <p>Optional. The Amazon Resource Name (ARN) of the user who created the pull request. If used, this filters the results to pull requests created by that user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorArn;

/**
 <p>A non-zero, non-negative integer used to limit the number of returned results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An enumeration token that, when provided in a request, returns the next batch of the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Optional. The status of the pull request. If used, this refines the results to the pull requests that match the specified status.</p>
 */
@property (nonatomic, assign) AWSCodecommitPullRequestStatusEnum pullRequestStatus;

/**
 <p>The name of the repository for which you want to list pull requests.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSCodecommitListPullRequestsOutput : AWSModel


/**
 <p>An enumeration token that allows the operation to batch the next results of the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The system-generated IDs of the pull requests.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable pullRequestIds;

@end

/**
 
 */
@interface AWSCodecommitListRepositoriesForApprovalRuleTemplateInput : AWSRequest


/**
 <p>The name of the approval rule template for which you want to list repositories that are associated with that template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleTemplateName;

/**
 <p>A non-zero, non-negative integer used to limit the number of returned results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An enumeration token that, when provided in a request, returns the next batch of the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCodecommitListRepositoriesForApprovalRuleTemplateOutput : AWSModel


/**
 <p>An enumeration token that allows the operation to batch the next results of the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of repository names that are associated with the specified approval rule template.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable repositoryNames;

@end

/**
 <p>Represents the input of a list repositories operation.</p>
 */
@interface AWSCodecommitListRepositoriesInput : AWSRequest


/**
 <p>An enumeration token that allows the operation to batch the results of the operation. Batch sizes are 1,000 for list repository operations. When the client sends the token back to AWS CodeCommit, another page of 1,000 records is retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The order in which to sort the results of a list repositories operation.</p>
 */
@property (nonatomic, assign) AWSCodecommitOrderEnum order;

/**
 <p>The criteria used to sort the results of a list repositories operation.</p>
 */
@property (nonatomic, assign) AWSCodecommitSortByEnum sortBy;

@end

/**
 <p>Represents the output of a list repositories operation.</p>
 */
@interface AWSCodecommitListRepositoriesOutput : AWSModel


/**
 <p>An enumeration token that allows the operation to batch the results of the operation. Batch sizes are 1,000 for list repository operations. When the client sends the token back to AWS CodeCommit, another page of 1,000 records is retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Lists the repositories called by the list repositories operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitRepositoryNameIdPair *> * _Nullable repositories;

@end

/**
 
 */
@interface AWSCodecommitListTagsForResourceInput : AWSRequest


/**
 <p>An enumeration token that, when provided in a request, returns the next batch of the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The Amazon Resource Name (ARN) of the resource for which you want to get information about tags, if any.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSCodecommitListTagsForResourceOutput : AWSModel


/**
 <p>An enumeration token that allows the operation to batch the next results of the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of tag key and value pairs associated with the specified resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Returns information about the location of a change or comment in the comparison between two commits or a pull request.</p>
 */
@interface AWSCodecommitLocation : AWSModel


/**
 <p>The name of the file being compared, including its extension and subdirectory, if any.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filePath;

/**
 <p>The position of a change in a compared file, in line number format.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable filePosition;

/**
 <p>In a comparison of commits or a pull request, whether the change is in the before or after of that comparison.</p>
 */
@property (nonatomic, assign) AWSCodecommitRelativeFileVersionEnum relativeFileVersion;

@end

/**
 
 */
@interface AWSCodecommitMergeBranchesByFastForwardInput : AWSRequest


/**
 <p>The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCommitSpecifier;

/**
 <p>The name of the repository where you want to merge two branches.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCommitSpecifier;

/**
 <p>The branch where the merge is applied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetBranch;

@end

/**
 
 */
@interface AWSCodecommitMergeBranchesByFastForwardOutput : AWSModel


/**
 <p>The commit ID of the merge in the destination or target branch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitId;

/**
 <p>The tree ID of the merge in the destination or target branch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable treeId;

@end

/**
 
 */
@interface AWSCodecommitMergeBranchesBySquashInput : AWSRequest


/**
 <p>The name of the author who created the commit. This information is used as both the author and committer for the commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorName;

/**
 <p>The commit message for the merge.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitMessage;

/**
 <p>The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in both branches has differences on the same line.</p>
 */
@property (nonatomic, assign) AWSCodecommitConflictDetailLevelTypeEnum conflictDetailLevel;

/**
 <p>If AUTOMERGE is the conflict resolution strategy, a list of inputs to use when resolving conflicts during a merge.</p>
 */
@property (nonatomic, strong) AWSCodecommitConflictResolution * _Nullable conflictResolution;

/**
 <p>Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging two versions of a file. The default is NONE, which requires any conflicts to be resolved manually before the merge operation is successful.</p>
 */
@property (nonatomic, assign) AWSCodecommitConflictResolutionStrategyTypeEnum conflictResolutionStrategy;

/**
 <p>The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCommitSpecifier;

/**
 <p>The email address of the person merging the branches. This information is used in the commit information for the merge.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>If the commit contains deletions, whether to keep a folder or folder structure if the changes leave the folders empty. If this is specified as true, a .gitkeep file is created for empty folders. The default is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable keepEmptyFolders;

/**
 <p>The name of the repository where you want to merge two branches.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCommitSpecifier;

/**
 <p>The branch where the merge is applied. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetBranch;

@end

/**
 
 */
@interface AWSCodecommitMergeBranchesBySquashOutput : AWSModel


/**
 <p>The commit ID of the merge in the destination or target branch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitId;

/**
 <p>The tree ID of the merge in the destination or target branch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable treeId;

@end

/**
 
 */
@interface AWSCodecommitMergeBranchesByThreeWayInput : AWSRequest


/**
 <p>The name of the author who created the commit. This information is used as both the author and committer for the commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorName;

/**
 <p>The commit message to include in the commit information for the merge.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitMessage;

/**
 <p>The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in both branches has differences on the same line.</p>
 */
@property (nonatomic, assign) AWSCodecommitConflictDetailLevelTypeEnum conflictDetailLevel;

/**
 <p>If AUTOMERGE is the conflict resolution strategy, a list of inputs to use when resolving conflicts during a merge.</p>
 */
@property (nonatomic, strong) AWSCodecommitConflictResolution * _Nullable conflictResolution;

/**
 <p>Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging two versions of a file. The default is NONE, which requires any conflicts to be resolved manually before the merge operation is successful.</p>
 */
@property (nonatomic, assign) AWSCodecommitConflictResolutionStrategyTypeEnum conflictResolutionStrategy;

/**
 <p>The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCommitSpecifier;

/**
 <p>The email address of the person merging the branches. This information is used in the commit information for the merge.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>If the commit contains deletions, whether to keep a folder or folder structure if the changes leave the folders empty. If true, a .gitkeep file is created for empty folders. The default is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable keepEmptyFolders;

/**
 <p>The name of the repository where you want to merge two branches.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a branch name or a full commit ID).</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCommitSpecifier;

/**
 <p>The branch where the merge is applied. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetBranch;

@end

/**
 
 */
@interface AWSCodecommitMergeBranchesByThreeWayOutput : AWSModel


/**
 <p>The commit ID of the merge in the destination or target branch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitId;

/**
 <p>The tree ID of the merge in the destination or target branch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable treeId;

@end

/**
 <p>Information about merge hunks in a merge or pull request operation.</p>
 */
@interface AWSCodecommitMergeHunk : AWSModel


/**
 <p>Information about the merge hunk in the base of a merge or pull request.</p>
 */
@property (nonatomic, strong) AWSCodecommitMergeHunkDetail * _Nullable base;

/**
 <p>Information about the merge hunk in the destination of a merge or pull request.</p>
 */
@property (nonatomic, strong) AWSCodecommitMergeHunkDetail * _Nullable destination;

/**
 <p>A Boolean value indicating whether a combination of hunks contains a conflict. Conflicts occur when the same file or the same lines in a file were modified in both the source and destination of a merge or pull request. Valid values include true, false, and null. True when the hunk represents a conflict and one or more files contains a line conflict. File mode conflicts in a merge do not set this to true.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isConflict;

/**
 <p>Information about the merge hunk in the source of a merge or pull request.</p>
 */
@property (nonatomic, strong) AWSCodecommitMergeHunkDetail * _Nullable source;

@end

/**
 <p>Information about the details of a merge hunk that contains a conflict in a merge or pull request operation.</p>
 */
@interface AWSCodecommitMergeHunkDetail : AWSModel


/**
 <p>The end position of the hunk in the merge result.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endLine;

/**
 <p>The base-64 encoded content of the hunk merged region that might contain a conflict.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hunkContent;

/**
 <p>The start position of the hunk in the merge result.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startLine;

@end

/**
 <p>Returns information about a merge or potential merge between a source reference and a destination reference in a pull request.</p>
 */
@interface AWSCodecommitMergeMetadata : AWSModel


/**
 <p>A Boolean value indicating whether the merge has been made.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isMerged;

/**
 <p>The commit ID for the merge commit, if any.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mergeCommitId;

/**
 <p>The merge strategy used in the merge.</p>
 */
@property (nonatomic, assign) AWSCodecommitMergeOptionTypeEnum mergeOption;

/**
 <p>The Amazon Resource Name (ARN) of the user who merged the branches.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mergedBy;

@end

/**
 <p>Information about the file operation conflicts in a merge operation.</p>
 */
@interface AWSCodecommitMergeOperations : AWSModel


/**
 <p>The operation on a file in the destination of a merge or pull request.</p>
 */
@property (nonatomic, assign) AWSCodecommitChangeTypeEnum destination;

/**
 <p>The operation (add, modify, or delete) on a file in the source of a merge or pull request.</p>
 */
@property (nonatomic, assign) AWSCodecommitChangeTypeEnum source;

@end

/**
 
 */
@interface AWSCodecommitMergePullRequestByFastForwardInput : AWSRequest


/**
 <p>The system-generated ID of the pull request. To get this ID, use <a>ListPullRequests</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

/**
 <p>The name of the repository where the pull request was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The full commit ID of the original or updated commit in the pull request source branch. Pass this value if you want an exception thrown if the current commit ID of the tip of the source branch does not match this commit ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCommitId;

@end

/**
 
 */
@interface AWSCodecommitMergePullRequestByFastForwardOutput : AWSModel


/**
 <p>Information about the specified pull request, including the merge.</p>
 */
@property (nonatomic, strong) AWSCodecommitPullRequest * _Nullable pullRequest;

@end

/**
 
 */
@interface AWSCodecommitMergePullRequestBySquashInput : AWSRequest


/**
 <p>The name of the author who created the commit. This information is used as both the author and committer for the commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorName;

/**
 <p>The commit message to include in the commit information for the merge.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitMessage;

/**
 <p>The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in both branches has differences on the same line.</p>
 */
@property (nonatomic, assign) AWSCodecommitConflictDetailLevelTypeEnum conflictDetailLevel;

/**
 <p>If AUTOMERGE is the conflict resolution strategy, a list of inputs to use when resolving conflicts during a merge.</p>
 */
@property (nonatomic, strong) AWSCodecommitConflictResolution * _Nullable conflictResolution;

/**
 <p>Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging two versions of a file. The default is NONE, which requires any conflicts to be resolved manually before the merge operation is successful.</p>
 */
@property (nonatomic, assign) AWSCodecommitConflictResolutionStrategyTypeEnum conflictResolutionStrategy;

/**
 <p>The email address of the person merging the branches. This information is used in the commit information for the merge.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>If the commit contains deletions, whether to keep a folder or folder structure if the changes leave the folders empty. If true, a .gitkeep file is created for empty folders. The default is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable keepEmptyFolders;

/**
 <p>The system-generated ID of the pull request. To get this ID, use <a>ListPullRequests</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

/**
 <p>The name of the repository where the pull request was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The full commit ID of the original or updated commit in the pull request source branch. Pass this value if you want an exception thrown if the current commit ID of the tip of the source branch does not match this commit ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCommitId;

@end

/**
 
 */
@interface AWSCodecommitMergePullRequestBySquashOutput : AWSModel


/**
 <p>Returns information about a pull request.</p>
 */
@property (nonatomic, strong) AWSCodecommitPullRequest * _Nullable pullRequest;

@end

/**
 
 */
@interface AWSCodecommitMergePullRequestByThreeWayInput : AWSRequest


/**
 <p>The name of the author who created the commit. This information is used as both the author and committer for the commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorName;

/**
 <p>The commit message to include in the commit information for the merge.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitMessage;

/**
 <p>The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified, a conflict is considered not mergeable if the same file in both branches has differences on the same line.</p>
 */
@property (nonatomic, assign) AWSCodecommitConflictDetailLevelTypeEnum conflictDetailLevel;

/**
 <p>If AUTOMERGE is the conflict resolution strategy, a list of inputs to use when resolving conflicts during a merge.</p>
 */
@property (nonatomic, strong) AWSCodecommitConflictResolution * _Nullable conflictResolution;

/**
 <p>Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging two versions of a file. The default is NONE, which requires any conflicts to be resolved manually before the merge operation is successful.</p>
 */
@property (nonatomic, assign) AWSCodecommitConflictResolutionStrategyTypeEnum conflictResolutionStrategy;

/**
 <p>The email address of the person merging the branches. This information is used in the commit information for the merge.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>If the commit contains deletions, whether to keep a folder or folder structure if the changes leave the folders empty. If true, a .gitkeep file is created for empty folders. The default is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable keepEmptyFolders;

/**
 <p>The system-generated ID of the pull request. To get this ID, use <a>ListPullRequests</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

/**
 <p>The name of the repository where the pull request was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The full commit ID of the original or updated commit in the pull request source branch. Pass this value if you want an exception thrown if the current commit ID of the tip of the source branch does not match this commit ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCommitId;

@end

/**
 
 */
@interface AWSCodecommitMergePullRequestByThreeWayOutput : AWSModel


/**
 <p>Returns information about a pull request.</p>
 */
@property (nonatomic, strong) AWSCodecommitPullRequest * _Nullable pullRequest;

@end

/**
 <p>Information about the type of an object in a merge operation.</p>
 */
@interface AWSCodecommitObjectTypes : AWSModel


/**
 <p>The type of the object in the base commit of the merge.</p>
 */
@property (nonatomic, assign) AWSCodecommitObjectTypeEnum base;

/**
 <p>The type of the object in the destination branch.</p>
 */
@property (nonatomic, assign) AWSCodecommitObjectTypeEnum destination;

/**
 <p>The type of the object in the source branch.</p>
 */
@property (nonatomic, assign) AWSCodecommitObjectTypeEnum source;

@end

/**
 <p>Returns information about the template that created the approval rule for a pull request.</p>
 */
@interface AWSCodecommitOriginApprovalRuleTemplate : AWSModel


/**
 <p>The ID of the template that created the approval rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleTemplateId;

/**
 <p>The name of the template that created the approval rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleTemplateName;

@end

/**
 
 */
@interface AWSCodecommitOverridePullRequestApprovalRulesInput : AWSRequest


/**
 <p>Whether you want to set aside approval rule requirements for the pull request (OVERRIDE) or revoke a previous override and apply approval rule requirements (REVOKE). REVOKE status is not stored.</p>
 */
@property (nonatomic, assign) AWSCodecommitOverrideStatus overrideStatus;

/**
 <p>The system-generated ID of the pull request for which you want to override all approval rule requirements. To get this information, use <a>GetPullRequest</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

/**
 <p>The system-generated ID of the most recent revision of the pull request. You cannot override approval rules for anything but the most recent revision of a pull request. To get the revision ID, use GetPullRequest.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSCodecommitPostCommentForComparedCommitInput : AWSRequest


/**
 <p>To establish the directionality of the comparison, the full commit ID of the after commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable afterCommitId;

/**
 <p>To establish the directionality of the comparison, the full commit ID of the before commit. Required for commenting on any commit unless that commit is the initial commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable beforeCommitId;

/**
 <p>A unique, client-generated idempotency token that, when provided in a request, ensures the request cannot be repeated with a changed parameter. If a request is received with the same parameters and a token is included, the request returns information about the initial request that used that token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The content of the comment you want to make.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The location of the comparison where you want to comment.</p>
 */
@property (nonatomic, strong) AWSCodecommitLocation * _Nullable location;

/**
 <p>The name of the repository where you want to post a comment on the comparison between commits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSCodecommitPostCommentForComparedCommitOutput : AWSModel


/**
 <p>In the directionality you established, the blob ID of the after blob.</p>
 */
@property (nonatomic, strong) NSString * _Nullable afterBlobId;

/**
 <p>In the directionality you established, the full commit ID of the after commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable afterCommitId;

/**
 <p>In the directionality you established, the blob ID of the before blob.</p>
 */
@property (nonatomic, strong) NSString * _Nullable beforeBlobId;

/**
 <p>In the directionality you established, the full commit ID of the before commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable beforeCommitId;

/**
 <p>The content of the comment you posted.</p>
 */
@property (nonatomic, strong) AWSCodecommitComment * _Nullable comment;

/**
 <p>The location of the comment in the comparison between the two commits.</p>
 */
@property (nonatomic, strong) AWSCodecommitLocation * _Nullable location;

/**
 <p>The name of the repository where you posted a comment on the comparison between commits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSCodecommitPostCommentForPullRequestInput : AWSRequest


/**
 <p>The full commit ID of the commit in the source branch that is the current tip of the branch for the pull request when you post the comment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable afterCommitId;

/**
 <p>The full commit ID of the commit in the destination branch that was the tip of the branch at the time the pull request was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable beforeCommitId;

/**
 <p>A unique, client-generated idempotency token that, when provided in a request, ensures the request cannot be repeated with a changed parameter. If a request is received with the same parameters and a token is included, the request returns information about the initial request that used that token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The content of your comment on the change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The location of the change where you want to post your comment. If no location is provided, the comment is posted as a general comment on the pull request difference between the before commit ID and the after commit ID.</p>
 */
@property (nonatomic, strong) AWSCodecommitLocation * _Nullable location;

/**
 <p>The system-generated ID of the pull request. To get this ID, use <a>ListPullRequests</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

/**
 <p>The name of the repository where you want to post a comment on a pull request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSCodecommitPostCommentForPullRequestOutput : AWSModel


/**
 <p>In the directionality of the pull request, the blob ID of the after blob.</p>
 */
@property (nonatomic, strong) NSString * _Nullable afterBlobId;

/**
 <p>The full commit ID of the commit in the destination branch where the pull request is merged.</p>
 */
@property (nonatomic, strong) NSString * _Nullable afterCommitId;

/**
 <p>In the directionality of the pull request, the blob ID of the before blob.</p>
 */
@property (nonatomic, strong) NSString * _Nullable beforeBlobId;

/**
 <p>The full commit ID of the commit in the source branch used to create the pull request, or in the case of an updated pull request, the full commit ID of the commit used to update the pull request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable beforeCommitId;

/**
 <p>The content of the comment you posted.</p>
 */
@property (nonatomic, strong) AWSCodecommitComment * _Nullable comment;

/**
 <p>The location of the change where you posted your comment.</p>
 */
@property (nonatomic, strong) AWSCodecommitLocation * _Nullable location;

/**
 <p>The system-generated ID of the pull request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

/**
 <p>The name of the repository where you posted a comment on a pull request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSCodecommitPostCommentReplyInput : AWSRequest


/**
 <p>A unique, client-generated idempotency token that, when provided in a request, ensures the request cannot be repeated with a changed parameter. If a request is received with the same parameters and a token is included, the request returns information about the initial request that used that token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The contents of your reply to a comment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The system-generated ID of the comment to which you want to reply. To get this ID, use <a>GetCommentsForComparedCommit</a> or <a>GetCommentsForPullRequest</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inReplyTo;

@end

/**
 
 */
@interface AWSCodecommitPostCommentReplyOutput : AWSModel


/**
 <p>Information about the reply to a comment.</p>
 */
@property (nonatomic, strong) AWSCodecommitComment * _Nullable comment;

@end

/**
 <p>Returns information about a pull request.</p>
 */
@interface AWSCodecommitPullRequest : AWSModel


/**
 <p>The approval rules applied to the pull request.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitApprovalRule *> * _Nullable approvalRules;

/**
 <p>The Amazon Resource Name (ARN) of the user who created the pull request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorArn;

/**
 <p>A unique, client-generated idempotency token that, when provided in a request, ensures the request cannot be repeated with a changed parameter. If a request is received with the same parameters and a token is included, the request returns information about the initial request that used that token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The date and time the pull request was originally created, in timestamp format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The user-defined description of the pull request. This description can be used to clarify what should be reviewed and other details of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The day and time of the last user or system activity on the pull request, in timestamp format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastActivityDate;

/**
 <p>The system-generated ID of the pull request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

/**
 <p>The status of the pull request. Pull request status can only change from <code>OPEN</code> to <code>CLOSED</code>.</p>
 */
@property (nonatomic, assign) AWSCodecommitPullRequestStatusEnum pullRequestStatus;

/**
 <p>The targets of the pull request, including the source branch and destination branch for the pull request.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitPullRequestTarget *> * _Nullable pullRequestTargets;

/**
 <p>The system-generated revision ID for the pull request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>The user-defined title of the pull request. This title is displayed in the list of pull requests to other repository users.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

@end

/**
 <p>Metadata about the pull request that is used when comparing the pull request source with its destination.</p>
 */
@interface AWSCodecommitPullRequestCreatedEventMetadata : AWSModel


/**
 <p>The commit ID of the tip of the branch specified as the destination branch when the pull request was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCommitId;

/**
 <p>The commit ID of the most recent commit that the source branch and the destination branch have in common.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mergeBase;

/**
 <p>The name of the repository where the pull request was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The commit ID on the source branch used when the pull request was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCommitId;

@end

/**
 <p>Returns information about a pull request event.</p>
 */
@interface AWSCodecommitPullRequestEvent : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the user whose actions resulted in the event. Examples include updating the pull request with more commits or changing the status of a pull request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actorArn;

/**
 <p>Information about a pull request event.</p>
 */
@property (nonatomic, strong) AWSCodecommitApprovalRuleEventMetadata * _Nullable approvalRuleEventMetadata;

/**
 <p>Information about an approval rule override event for a pull request.</p>
 */
@property (nonatomic, strong) AWSCodecommitApprovalRuleOverriddenEventMetadata * _Nullable approvalRuleOverriddenEventMetadata;

/**
 <p>Information about an approval state change for a pull request.</p>
 */
@property (nonatomic, strong) AWSCodecommitApprovalStateChangedEventMetadata * _Nullable approvalStateChangedEventMetadata;

/**
 <p>The day and time of the pull request event, in timestamp format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable eventDate;

/**
 <p>Information about the source and destination branches for the pull request.</p>
 */
@property (nonatomic, strong) AWSCodecommitPullRequestCreatedEventMetadata * _Nullable pullRequestCreatedEventMetadata;

/**
 <p>The type of the pull request event (for example, a status change event (PULL_REQUEST_STATUS_CHANGED) or update event (PULL_REQUEST_SOURCE_REFERENCE_UPDATED)).</p>
 */
@property (nonatomic, assign) AWSCodecommitPullRequestEventType pullRequestEventType;

/**
 <p>The system-generated ID of the pull request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

/**
 <p>Information about the change in mergability state for the pull request event.</p>
 */
@property (nonatomic, strong) AWSCodecommitPullRequestMergedStateChangedEventMetadata * _Nullable pullRequestMergedStateChangedEventMetadata;

/**
 <p>Information about the updated source branch for the pull request event. </p>
 */
@property (nonatomic, strong) AWSCodecommitPullRequestSourceReferenceUpdatedEventMetadata * _Nullable pullRequestSourceReferenceUpdatedEventMetadata;

/**
 <p>Information about the change in status for the pull request event.</p>
 */
@property (nonatomic, strong) AWSCodecommitPullRequestStatusChangedEventMetadata * _Nullable pullRequestStatusChangedEventMetadata;

@end

/**
 <p>Returns information about the change in the merge state for a pull request event. </p>
 */
@interface AWSCodecommitPullRequestMergedStateChangedEventMetadata : AWSModel


/**
 <p>The name of the branch that the pull request is merged into.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationReference;

/**
 <p>Information about the merge state change event.</p>
 */
@property (nonatomic, strong) AWSCodecommitMergeMetadata * _Nullable mergeMetadata;

/**
 <p>The name of the repository where the pull request was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>Information about an update to the source branch of a pull request.</p>
 */
@interface AWSCodecommitPullRequestSourceReferenceUpdatedEventMetadata : AWSModel


/**
 <p>The full commit ID of the commit in the source branch that was the tip of the branch at the time the pull request was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable afterCommitId;

/**
 <p>The full commit ID of the commit in the destination branch that was the tip of the branch at the time the pull request was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable beforeCommitId;

/**
 <p>The commit ID of the most recent commit that the source branch and the destination branch have in common.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mergeBase;

/**
 <p>The name of the repository where the pull request was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>Information about a change to the status of a pull request.</p>
 */
@interface AWSCodecommitPullRequestStatusChangedEventMetadata : AWSModel


/**
 <p>The changed status of the pull request.</p>
 */
@property (nonatomic, assign) AWSCodecommitPullRequestStatusEnum pullRequestStatus;

@end

/**
 <p>Returns information about a pull request target.</p>
 */
@interface AWSCodecommitPullRequestTarget : AWSModel


/**
 <p>The full commit ID that is the tip of the destination branch. This is the commit where the pull request was or will be merged.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCommit;

/**
 <p>The branch of the repository where the pull request changes are merged. Also known as the destination branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationReference;

/**
 <p>The commit ID of the most recent commit that the source branch and the destination branch have in common.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mergeBase;

/**
 <p>Returns metadata about the state of the merge, including whether the merge has been made.</p>
 */
@property (nonatomic, strong) AWSCodecommitMergeMetadata * _Nullable mergeMetadata;

/**
 <p>The name of the repository that contains the pull request source and destination branches.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The full commit ID of the tip of the source branch used to create the pull request. If the pull request branch is updated by a push while the pull request is open, the commit ID changes to reflect the new tip of the branch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCommit;

/**
 <p>The branch of the repository that contains the changes for the pull request. Also known as the source branch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceReference;

@end

/**
 
 */
@interface AWSCodecommitPutCommentReactionInput : AWSRequest


/**
 <p>The ID of the comment to which you want to add or update a reaction.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commentId;

/**
 <p>The emoji reaction you want to add or update. To remove a reaction, provide a value of blank or null. You can also provide the value of none. For information about emoji reaction values supported in AWS CodeCommit, see the <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/how-to-commit-comment.html#emoji-reaction-table">AWS CodeCommit User Guide</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reactionValue;

@end

/**
 <p>Information about a file added or updated as part of a commit.</p>
 Required parameters: [filePath]
 */
@interface AWSCodecommitPutFileEntry : AWSModel


/**
 <p>The content of the file, if a source file is not specified.</p>
 */
@property (nonatomic, strong) NSData * _Nullable fileContent;

/**
 <p>The extrapolated file mode permissions for the file. Valid values include EXECUTABLE and NORMAL.</p>
 */
@property (nonatomic, assign) AWSCodecommitFileModeTypeEnum fileMode;

/**
 <p>The full path to the file in the repository, including the name of the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filePath;

/**
 <p>The name and full path of the file that contains the changes you want to make as part of the commit, if you are not providing the file content directly.</p>
 */
@property (nonatomic, strong) AWSCodecommitSourceFileSpecifier * _Nullable sourceFile;

@end

/**
 
 */
@interface AWSCodecommitPutFileInput : AWSRequest


/**
 <p>The name of the branch where you want to add or update the file. If this is an empty repository, this branch is created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p>A message about why this file was added or updated. Although it is optional, a message makes the commit history for your repository more useful.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitMessage;

/**
 <p>An email address for the person adding or updating the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The content of the file, in binary object format. </p>
 */
@property (nonatomic, strong) NSData * _Nullable fileContent;

/**
 <p>The file mode permissions of the blob. Valid file mode permissions are listed here.</p>
 */
@property (nonatomic, assign) AWSCodecommitFileModeTypeEnum fileMode;

/**
 <p>The name of the file you want to add or update, including the relative path to the file in the repository.</p><note><p>If the path does not currently exist in the repository, the path is created as part of adding the file.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable filePath;

/**
 <p>The name of the person adding or updating the file. Although it is optional, a name makes the commit history for your repository more useful.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The full commit ID of the head commit in the branch where you want to add or update the file. If this is an empty repository, no commit ID is required. If this is not an empty repository, a commit ID is required. </p><p>The commit ID must match the ID of the head commit at the time of the operation. Otherwise, an error occurs, and the file is not added or updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentCommitId;

/**
 <p>The name of the repository where you want to add or update the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSCodecommitPutFileOutput : AWSModel


/**
 <p>The ID of the blob, which is its SHA-1 pointer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable blobId;

/**
 <p>The full SHA ID of the commit that contains this file change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitId;

/**
 <p>The full SHA-1 pointer of the tree information for the commit that contains this file change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable treeId;

@end

/**
 <p>Represents the input of a put repository triggers operation.</p>
 Required parameters: [repositoryName, triggers]
 */
@interface AWSCodecommitPutRepositoryTriggersInput : AWSRequest


/**
 <p>The name of the repository where you want to create or update the trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The JSON block of configuration information for each trigger.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitRepositoryTrigger *> * _Nullable triggers;

@end

/**
 <p>Represents the output of a put repository triggers operation.</p>
 */
@interface AWSCodecommitPutRepositoryTriggersOutput : AWSModel


/**
 <p>The system-generated unique ID for the create or update operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationId;

@end

/**
 <p>Information about the reaction values provided by users on a comment.</p>
 */
@interface AWSCodecommitReactionForComment : AWSModel


/**
 <p>The reaction for a specified comment.</p>
 */
@property (nonatomic, strong) AWSCodecommitReactionValueFormats * _Nullable reaction;

/**
 <p>The Amazon Resource Names (ARNs) of users who have provided reactions to the comment.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable reactionUsers;

/**
 <p>A numerical count of users who reacted with the specified emoji whose identities have been subsequently deleted from IAM. While these IAM users or roles no longer exist, the reactions might still appear in total reaction counts.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable reactionsFromDeletedUsersCount;

@end

/**
 <p>Information about the values for reactions to a comment. AWS CodeCommit supports a limited set of reactions.</p>
 */
@interface AWSCodecommitReactionValueFormats : AWSModel


/**
 <p>The Emoji Version 1.0 graphic of the reaction. These graphics are interpreted slightly differently on different operating systems.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emoji;

/**
 <p>The emoji short code for the reaction. Short codes are interpreted slightly differently on different operating systems. </p>
 */
@property (nonatomic, strong) NSString * _Nullable shortCode;

/**
 <p>The Unicode codepoint for the reaction.</p>
 */
@property (nonatomic, strong) NSString * _Nullable unicode;

@end

/**
 <p>Information about a replacement content entry in the conflict of a merge or pull request operation.</p>
 Required parameters: [filePath, replacementType]
 */
@interface AWSCodecommitReplaceContentEntry : AWSModel


/**
 <p>The base-64 encoded content to use when the replacement type is USE_NEW_CONTENT.</p>
 */
@property (nonatomic, strong) NSData * _Nullable content;

/**
 <p>The file mode to apply during conflict resoltion.</p>
 */
@property (nonatomic, assign) AWSCodecommitFileModeTypeEnum fileMode;

/**
 <p>The path of the conflicting file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filePath;

/**
 <p>The replacement type to use when determining how to resolve the conflict.</p>
 */
@property (nonatomic, assign) AWSCodecommitReplacementTypeEnum replacementType;

@end

/**
 <p>Information about a repository.</p>
 */
@interface AWSCodecommitRepositoryMetadata : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The ID of the AWS account associated with the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The URL to use for cloning the repository over HTTPS.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloneUrlHttp;

/**
 <p>The URL to use for cloning the repository over SSH.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloneUrlSsh;

/**
 <p>The date and time the repository was created, in timestamp format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The repository's default branch name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultBranch;

/**
 <p>The date and time the repository was last modified, in timestamp format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>A comment or description about the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryDescription;

/**
 <p>The ID of the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryId;

/**
 <p>The repository's name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>Information about a repository name and ID.</p>
 */
@interface AWSCodecommitRepositoryNameIdPair : AWSModel


/**
 <p>The ID associated with the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryId;

/**
 <p>The name associated with the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>Information about a trigger for a repository.</p>
 Required parameters: [name, destinationArn, events]
 */
@interface AWSCodecommitRepositoryTrigger : AWSModel


/**
 <p>The branches to be included in the trigger configuration. If you specify an empty array, the trigger applies to all branches.</p><note><p>Although no content is required in the array, you must include the array itself.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable branches;

/**
 <p>Any custom data associated with the trigger to be included in the information sent to the target of the trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customData;

/**
 <p>The ARN of the resource that is the target for a trigger (for example, the ARN of a topic in Amazon SNS).</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationArn;

/**
 <p>The repository events that cause the trigger to run actions in another service, such as sending a notification through Amazon SNS. </p><note><p>The valid value "all" cannot be used with any other values.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

/**
 <p>The name of the trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>A trigger failed to run.</p>
 */
@interface AWSCodecommitRepositoryTriggerExecutionFailure : AWSModel


/**
 <p>Message information about the trigger that did not run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureMessage;

/**
 <p>The name of the trigger that did not run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trigger;

@end

/**
 <p>Information about the file mode changes.</p>
 Required parameters: [filePath, fileMode]
 */
@interface AWSCodecommitSetFileModeEntry : AWSModel


/**
 <p>The file mode for the file.</p>
 */
@property (nonatomic, assign) AWSCodecommitFileModeTypeEnum fileMode;

/**
 <p>The full path to the file, including the name of the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filePath;

@end

/**
 <p>Information about a source file that is part of changes made in a commit.</p>
 Required parameters: [filePath]
 */
@interface AWSCodecommitSourceFileSpecifier : AWSModel


/**
 <p>The full path to the file, including the name of the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filePath;

/**
 <p>Whether to remove the source file from the parent commit.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isMove;

@end

/**
 <p>Returns information about a submodule reference in a repository folder.</p>
 */
@interface AWSCodecommitSubModule : AWSModel


/**
 <p>The fully qualified path to the folder that contains the reference to the submodule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable absolutePath;

/**
 <p>The commit ID that contains the reference to the submodule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitId;

/**
 <p>The relative path of the submodule from the folder where the query originated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relativePath;

@end

/**
 <p>Returns information about a symbolic link in a repository folder.</p>
 */
@interface AWSCodecommitSymbolicLink : AWSModel


/**
 <p>The fully qualified path to the folder that contains the symbolic link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable absolutePath;

/**
 <p>The blob ID that contains the information about the symbolic link.</p>
 */
@property (nonatomic, strong) NSString * _Nullable blobId;

/**
 <p>The file mode permissions of the blob that cotains information about the symbolic link.</p>
 */
@property (nonatomic, assign) AWSCodecommitFileModeTypeEnum fileMode;

/**
 <p>The relative path of the symbolic link from the folder where the query originated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relativePath;

@end

/**
 
 */
@interface AWSCodecommitTagResourceInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource to which you want to add or update tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The key-value pair to use when tagging this repository.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Returns information about a target for a pull request.</p>
 Required parameters: [repositoryName, sourceReference]
 */
@interface AWSCodecommitTarget : AWSModel


/**
 <p>The branch of the repository where the pull request changes are merged. Also known as the destination branch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationReference;

/**
 <p>The name of the repository that contains the pull request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The branch of the repository that contains the changes for the pull request. Also known as the source branch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceReference;

@end

/**
 <p>Represents the input of a test repository triggers operation.</p>
 Required parameters: [repositoryName, triggers]
 */
@interface AWSCodecommitTestRepositoryTriggersInput : AWSRequest


/**
 <p>The name of the repository in which to test the triggers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The list of triggers to test.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitRepositoryTrigger *> * _Nullable triggers;

@end

/**
 <p>Represents the output of a test repository triggers operation.</p>
 */
@interface AWSCodecommitTestRepositoryTriggersOutput : AWSModel


/**
 <p>The list of triggers that were not tested. This list provides the names of the triggers that could not be tested, separated by commas.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodecommitRepositoryTriggerExecutionFailure *> * _Nullable failedExecutions;

/**
 <p>The list of triggers that were successfully tested. This list provides the names of the triggers that were successfully tested, separated by commas.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable successfulExecutions;

@end

/**
 
 */
@interface AWSCodecommitUntagResourceInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource to which you want to remove tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tag key for each tag that you want to remove from the resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSCodecommitUpdateApprovalRuleTemplateContentInput : AWSRequest


/**
 <p>The name of the approval rule template where you want to update the content of the rule. </p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleTemplateName;

/**
 <p>The SHA-256 hash signature for the content of the approval rule. You can retrieve this information by using <a>GetPullRequest</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable existingRuleContentSha256;

/**
 <p>The content that replaces the existing content of the rule. Content statements must be complete. You cannot provide only the changes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestRuleContent;

@end

/**
 
 */
@interface AWSCodecommitUpdateApprovalRuleTemplateContentOutput : AWSModel


/**
 <p>Returns information about an approval rule template.</p>
 */
@property (nonatomic, strong) AWSCodecommitApprovalRuleTemplate * _Nullable approvalRuleTemplate;

@end

/**
 
 */
@interface AWSCodecommitUpdateApprovalRuleTemplateDescriptionInput : AWSRequest


/**
 <p>The updated description of the approval rule template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleTemplateDescription;

/**
 <p>The name of the template for which you want to update the description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleTemplateName;

@end

/**
 
 */
@interface AWSCodecommitUpdateApprovalRuleTemplateDescriptionOutput : AWSModel


/**
 <p>The structure and content of the updated approval rule template.</p>
 */
@property (nonatomic, strong) AWSCodecommitApprovalRuleTemplate * _Nullable approvalRuleTemplate;

@end

/**
 
 */
@interface AWSCodecommitUpdateApprovalRuleTemplateNameInput : AWSRequest


/**
 <p>The new name you want to apply to the approval rule template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestApprovalRuleTemplateName;

/**
 <p>The current name of the approval rule template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable oldApprovalRuleTemplateName;

@end

/**
 
 */
@interface AWSCodecommitUpdateApprovalRuleTemplateNameOutput : AWSModel


/**
 <p>The structure and content of the updated approval rule template.</p>
 */
@property (nonatomic, strong) AWSCodecommitApprovalRuleTemplate * _Nullable approvalRuleTemplate;

@end

/**
 
 */
@interface AWSCodecommitUpdateCommentInput : AWSRequest


/**
 <p>The system-generated ID of the comment you want to update. To get this ID, use <a>GetCommentsForComparedCommit</a> or <a>GetCommentsForPullRequest</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commentId;

/**
 <p>The updated content to replace the existing content of the comment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

@end

/**
 
 */
@interface AWSCodecommitUpdateCommentOutput : AWSModel


/**
 <p>Information about the updated comment.</p>
 */
@property (nonatomic, strong) AWSCodecommitComment * _Nullable comment;

@end

/**
 <p>Represents the input of an update default branch operation.</p>
 Required parameters: [repositoryName, defaultBranchName]
 */
@interface AWSCodecommitUpdateDefaultBranchInput : AWSRequest


/**
 <p>The name of the branch to set as the default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultBranchName;

/**
 <p>The name of the repository to set or change the default branch for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSCodecommitUpdatePullRequestApprovalRuleContentInput : AWSRequest


/**
 <p>The name of the approval rule you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable approvalRuleName;

/**
 <p>The SHA-256 hash signature for the content of the approval rule. You can retrieve this information by using <a>GetPullRequest</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable existingRuleContentSha256;

/**
 <p>The updated content for the approval rule.</p><note><p>When you update the content of the approval rule, you can specify approvers in an approval pool in one of two ways:</p><ul><li><p><b>CodeCommitApprovers</b>: This option only requires an AWS account and a resource. It can be used for both IAM users and federated access users whose name matches the provided resource name. This is a very powerful option that offers a great deal of flexibility. For example, if you specify the AWS account <i>123456789012</i> and <i>Mary_Major</i>, all of the following are counted as approvals coming from that user:</p><ul><li><p>An IAM user in the account (arn:aws:iam::<i>123456789012</i>:user/<i>Mary_Major</i>)</p></li><li><p>A federated user identified in IAM as Mary_Major (arn:aws:sts::<i>123456789012</i>:federated-user/<i>Mary_Major</i>)</p></li></ul><p>This option does not recognize an active session of someone assuming the role of CodeCommitReview with a role session name of <i>Mary_Major</i> (arn:aws:sts::<i>123456789012</i>:assumed-role/CodeCommitReview/<i>Mary_Major</i>) unless you include a wildcard (*Mary_Major).</p></li><li><p><b>Fully qualified ARN</b>: This option allows you to specify the fully qualified Amazon Resource Name (ARN) of the IAM user or role. </p></li></ul><p>For more information about IAM ARNs, wildcards, and formats, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable latestRuleContent;

/**
 <p>The system-generated ID of the pull request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

@end

/**
 
 */
@interface AWSCodecommitUpdatePullRequestApprovalRuleContentOutput : AWSModel


/**
 <p>Information about the updated approval rule.</p>
 */
@property (nonatomic, strong) AWSCodecommitApprovalRule * _Nullable approvalRule;

@end

/**
 
 */
@interface AWSCodecommitUpdatePullRequestApprovalStateInput : AWSRequest


/**
 <p>The approval state to associate with the user on the pull request.</p>
 */
@property (nonatomic, assign) AWSCodecommitApprovalState approvalState;

/**
 <p>The system-generated ID of the pull request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

/**
 <p>The system-generated ID of the revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSCodecommitUpdatePullRequestDescriptionInput : AWSRequest


/**
 <p>The updated content of the description for the pull request. This content replaces the existing description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The system-generated ID of the pull request. To get this ID, use <a>ListPullRequests</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

@end

/**
 
 */
@interface AWSCodecommitUpdatePullRequestDescriptionOutput : AWSModel


/**
 <p>Information about the updated pull request.</p>
 */
@property (nonatomic, strong) AWSCodecommitPullRequest * _Nullable pullRequest;

@end

/**
 
 */
@interface AWSCodecommitUpdatePullRequestStatusInput : AWSRequest


/**
 <p>The system-generated ID of the pull request. To get this ID, use <a>ListPullRequests</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

/**
 <p>The status of the pull request. The only valid operations are to update the status from <code>OPEN</code> to <code>OPEN</code>, <code>OPEN</code> to <code>CLOSED</code> or from <code>CLOSED</code> to <code>CLOSED</code>.</p>
 */
@property (nonatomic, assign) AWSCodecommitPullRequestStatusEnum pullRequestStatus;

@end

/**
 
 */
@interface AWSCodecommitUpdatePullRequestStatusOutput : AWSModel


/**
 <p>Information about the pull request.</p>
 */
@property (nonatomic, strong) AWSCodecommitPullRequest * _Nullable pullRequest;

@end

/**
 
 */
@interface AWSCodecommitUpdatePullRequestTitleInput : AWSRequest


/**
 <p>The system-generated ID of the pull request. To get this ID, use <a>ListPullRequests</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

/**
 <p>The updated title of the pull request. This replaces the existing title.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

@end

/**
 
 */
@interface AWSCodecommitUpdatePullRequestTitleOutput : AWSModel


/**
 <p>Information about the updated pull request.</p>
 */
@property (nonatomic, strong) AWSCodecommitPullRequest * _Nullable pullRequest;

@end

/**
 <p>Represents the input of an update repository description operation.</p>
 Required parameters: [repositoryName]
 */
@interface AWSCodecommitUpdateRepositoryDescriptionInput : AWSRequest


/**
 <p>The new comment or description for the specified repository. Repository descriptions are limited to 1,000 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryDescription;

/**
 <p>The name of the repository to set or change the comment or description for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>Represents the input of an update repository description operation.</p>
 Required parameters: [oldName, newName]
 */
@interface AWSCodecommitUpdateRepositoryNameInput : AWSRequest


/**
 <p>The new name for the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestName;

/**
 <p>The current name of the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable oldName;

@end

/**
 <p>Information about the user who made a specified commit.</p>
 */
@interface AWSCodecommitUserInfo : AWSModel


/**
 <p>The date when the specified commit was commited, in timestamp format with GMT offset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable date;

/**
 <p>The email address associated with the user who made the commit, if any.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The name of the user who made the specified commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

NS_ASSUME_NONNULL_END
