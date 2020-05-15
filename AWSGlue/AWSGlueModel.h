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

FOUNDATION_EXPORT NSString *const AWSGlueErrorDomain;

typedef NS_ENUM(NSInteger, AWSGlueErrorType) {
    AWSGlueErrorUnknown,
    AWSGlueErrorAccessDenied,
    AWSGlueErrorAlreadyExists,
    AWSGlueErrorConcurrentModification,
    AWSGlueErrorConcurrentRunsExceeded,
    AWSGlueErrorConditionCheckFailure,
    AWSGlueErrorCrawlerNotRunning,
    AWSGlueErrorCrawlerRunning,
    AWSGlueErrorCrawlerStopping,
    AWSGlueErrorEntityNotFound,
    AWSGlueErrorGlueEncryption,
    AWSGlueErrorIdempotentParameterMismatch,
    AWSGlueErrorIllegalWorkflowState,
    AWSGlueErrorInternalService,
    AWSGlueErrorInvalidInput,
    AWSGlueErrorMLTransformNotReady,
    AWSGlueErrorNoSchedule,
    AWSGlueErrorOperationTimeout,
    AWSGlueErrorResourceNumberLimitExceeded,
    AWSGlueErrorSchedulerNotRunning,
    AWSGlueErrorSchedulerRunning,
    AWSGlueErrorSchedulerTransitioning,
    AWSGlueErrorValidation,
    AWSGlueErrorVersionMismatch,
};

typedef NS_ENUM(NSInteger, AWSGlueCatalogEncryptionMode) {
    AWSGlueCatalogEncryptionModeUnknown,
    AWSGlueCatalogEncryptionModeDisabled,
    AWSGlueCatalogEncryptionModeSseKms,
};

typedef NS_ENUM(NSInteger, AWSGlueCloudWatchEncryptionMode) {
    AWSGlueCloudWatchEncryptionModeUnknown,
    AWSGlueCloudWatchEncryptionModeDisabled,
    AWSGlueCloudWatchEncryptionModeSseKms,
};

typedef NS_ENUM(NSInteger, AWSGlueComparator) {
    AWSGlueComparatorUnknown,
    AWSGlueComparatorEquals,
    AWSGlueComparatorGreaterThan,
    AWSGlueComparatorLessThan,
    AWSGlueComparatorGreaterThanEquals,
    AWSGlueComparatorLessThanEquals,
};

typedef NS_ENUM(NSInteger, AWSGlueConnectionPropertyKey) {
    AWSGlueConnectionPropertyKeyUnknown,
    AWSGlueConnectionPropertyKeyHost,
    AWSGlueConnectionPropertyKeyPort,
    AWSGlueConnectionPropertyKeyUsername,
    AWSGlueConnectionPropertyKeyPassword,
    AWSGlueConnectionPropertyKeyEncryptedPassword,
    AWSGlueConnectionPropertyKeyJdbcDriverJarUri,
    AWSGlueConnectionPropertyKeyJdbcDriverClassName,
    AWSGlueConnectionPropertyKeyJdbcEngine,
    AWSGlueConnectionPropertyKeyJdbcEngineVersion,
    AWSGlueConnectionPropertyKeyConfigFiles,
    AWSGlueConnectionPropertyKeyInstanceId,
    AWSGlueConnectionPropertyKeyJdbcConnectionUrl,
    AWSGlueConnectionPropertyKeyJdbcEnforceSsl,
    AWSGlueConnectionPropertyKeyCustomJdbcCert,
    AWSGlueConnectionPropertyKeySkipCustomJdbcCertValidation,
    AWSGlueConnectionPropertyKeyCustomJdbcCertString,
    AWSGlueConnectionPropertyKeyConnectionUrl,
    AWSGlueConnectionPropertyKeyKafkaBootstrapServers,
};

typedef NS_ENUM(NSInteger, AWSGlueConnectionType) {
    AWSGlueConnectionTypeUnknown,
    AWSGlueConnectionTypeJdbc,
    AWSGlueConnectionTypeSftp,
    AWSGlueConnectionTypeMongodb,
    AWSGlueConnectionTypeKafka,
};

typedef NS_ENUM(NSInteger, AWSGlueCrawlState) {
    AWSGlueCrawlStateUnknown,
    AWSGlueCrawlStateRunning,
    AWSGlueCrawlStateCancelling,
    AWSGlueCrawlStateCancelled,
    AWSGlueCrawlStateSucceeded,
    AWSGlueCrawlStateFailed,
};

typedef NS_ENUM(NSInteger, AWSGlueCrawlerState) {
    AWSGlueCrawlerStateUnknown,
    AWSGlueCrawlerStateReady,
    AWSGlueCrawlerStateRunning,
    AWSGlueCrawlerStateStopping,
};

typedef NS_ENUM(NSInteger, AWSGlueCsvHeaderOption) {
    AWSGlueCsvHeaderOptionUnknown,
    AWSGlueCsvHeaderOptionPresent,
    AWSGlueCsvHeaderOptionAbsent,
};

typedef NS_ENUM(NSInteger, AWSGlueDeleteBehavior) {
    AWSGlueDeleteBehaviorUnknown,
    AWSGlueDeleteBehaviorLog,
    AWSGlueDeleteBehaviorDeleteFromDatabase,
    AWSGlueDeleteBehaviorDeprecateInDatabase,
};

typedef NS_ENUM(NSInteger, AWSGlueExistCondition) {
    AWSGlueExistConditionUnknown,
    AWSGlueExistConditionMustExist,
    AWSGlueExistConditionNotExist,
    AWSGlueExistConditionNone,
};

typedef NS_ENUM(NSInteger, AWSGlueJobBookmarksEncryptionMode) {
    AWSGlueJobBookmarksEncryptionModeUnknown,
    AWSGlueJobBookmarksEncryptionModeDisabled,
    AWSGlueJobBookmarksEncryptionModeCseKms,
};

typedef NS_ENUM(NSInteger, AWSGlueJobRunState) {
    AWSGlueJobRunStateUnknown,
    AWSGlueJobRunStateStarting,
    AWSGlueJobRunStateRunning,
    AWSGlueJobRunStateStopping,
    AWSGlueJobRunStateStopped,
    AWSGlueJobRunStateSucceeded,
    AWSGlueJobRunStateFailed,
    AWSGlueJobRunStateTimeout,
};

typedef NS_ENUM(NSInteger, AWSGlueLanguage) {
    AWSGlueLanguageUnknown,
    AWSGlueLanguagePython,
    AWSGlueLanguageScala,
};

typedef NS_ENUM(NSInteger, AWSGlueLastCrawlStatus) {
    AWSGlueLastCrawlStatusUnknown,
    AWSGlueLastCrawlStatusSucceeded,
    AWSGlueLastCrawlStatusCancelled,
    AWSGlueLastCrawlStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSGlueLogical) {
    AWSGlueLogicalUnknown,
    AWSGlueLogicalAnd,
    AWSGlueLogicalAny,
};

typedef NS_ENUM(NSInteger, AWSGlueLogicalOperator) {
    AWSGlueLogicalOperatorUnknown,
    AWSGlueLogicalOperatorEquals,
};

typedef NS_ENUM(NSInteger, AWSGlueNodeType) {
    AWSGlueNodeTypeUnknown,
    AWSGlueNodeTypeCrawler,
    AWSGlueNodeTypeJob,
    AWSGlueNodeTypeTrigger,
};

typedef NS_ENUM(NSInteger, AWSGluePermission) {
    AWSGluePermissionUnknown,
    AWSGluePermissionAll,
    AWSGluePermissionSelect,
    AWSGluePermissionAlter,
    AWSGluePermissionDrop,
    AWSGluePermissionDelete,
    AWSGluePermissionInsert,
    AWSGluePermissionCreateDatabase,
    AWSGluePermissionCreateTable,
    AWSGluePermissionDataLocationAccess,
};

typedef NS_ENUM(NSInteger, AWSGluePrincipalType) {
    AWSGluePrincipalTypeUnknown,
    AWSGluePrincipalTypeUser,
    AWSGluePrincipalTypeRole,
    AWSGluePrincipalTypeGroup,
};

typedef NS_ENUM(NSInteger, AWSGlueResourceType) {
    AWSGlueResourceTypeUnknown,
    AWSGlueResourceTypeJar,
    AWSGlueResourceTypeFile,
    AWSGlueResourceTypeArchive,
};

typedef NS_ENUM(NSInteger, AWSGlueS3EncryptionMode) {
    AWSGlueS3EncryptionModeUnknown,
    AWSGlueS3EncryptionModeDisabled,
    AWSGlueS3EncryptionModeSseKms,
    AWSGlueS3EncryptionModeSseS3,
};

typedef NS_ENUM(NSInteger, AWSGlueScheduleState) {
    AWSGlueScheduleStateUnknown,
    AWSGlueScheduleStateScheduled,
    AWSGlueScheduleStateNotScheduled,
    AWSGlueScheduleStateTransitioning,
};

typedef NS_ENUM(NSInteger, AWSGlueSort) {
    AWSGlueSortUnknown,
    AWSGlueSortAsc,
    AWSGlueSortDesc,
};

typedef NS_ENUM(NSInteger, AWSGlueSortDirectionType) {
    AWSGlueSortDirectionTypeUnknown,
    AWSGlueSortDirectionTypeDescending,
    AWSGlueSortDirectionTypeAscending,
};

typedef NS_ENUM(NSInteger, AWSGlueTaskRunSortColumnType) {
    AWSGlueTaskRunSortColumnTypeUnknown,
    AWSGlueTaskRunSortColumnTypeTaskRunType,
    AWSGlueTaskRunSortColumnTypeStatus,
    AWSGlueTaskRunSortColumnTypeStarted,
};

typedef NS_ENUM(NSInteger, AWSGlueTaskStatusType) {
    AWSGlueTaskStatusTypeUnknown,
    AWSGlueTaskStatusTypeStarting,
    AWSGlueTaskStatusTypeRunning,
    AWSGlueTaskStatusTypeStopping,
    AWSGlueTaskStatusTypeStopped,
    AWSGlueTaskStatusTypeSucceeded,
    AWSGlueTaskStatusTypeFailed,
    AWSGlueTaskStatusTypeTimeout,
};

typedef NS_ENUM(NSInteger, AWSGlueTaskType) {
    AWSGlueTaskTypeUnknown,
    AWSGlueTaskTypeEvaluation,
    AWSGlueTaskTypeLabelingSetGeneration,
    AWSGlueTaskTypeImportLabels,
    AWSGlueTaskTypeExportLabels,
    AWSGlueTaskTypeFindMatches,
};

typedef NS_ENUM(NSInteger, AWSGlueTransformSortColumnType) {
    AWSGlueTransformSortColumnTypeUnknown,
    AWSGlueTransformSortColumnTypeName,
    AWSGlueTransformSortColumnTypeTransformType,
    AWSGlueTransformSortColumnTypeStatus,
    AWSGlueTransformSortColumnTypeCreated,
    AWSGlueTransformSortColumnTypeLastModified,
};

typedef NS_ENUM(NSInteger, AWSGlueTransformStatusType) {
    AWSGlueTransformStatusTypeUnknown,
    AWSGlueTransformStatusTypeNotReady,
    AWSGlueTransformStatusTypeReady,
    AWSGlueTransformStatusTypeDeleting,
};

typedef NS_ENUM(NSInteger, AWSGlueTransformType) {
    AWSGlueTransformTypeUnknown,
    AWSGlueTransformTypeFindMatches,
};

typedef NS_ENUM(NSInteger, AWSGlueTriggerState) {
    AWSGlueTriggerStateUnknown,
    AWSGlueTriggerStateCreating,
    AWSGlueTriggerStateCreated,
    AWSGlueTriggerStateActivating,
    AWSGlueTriggerStateActivated,
    AWSGlueTriggerStateDeactivating,
    AWSGlueTriggerStateDeactivated,
    AWSGlueTriggerStateDeleting,
    AWSGlueTriggerStateUpdating,
};

typedef NS_ENUM(NSInteger, AWSGlueTriggerType) {
    AWSGlueTriggerTypeUnknown,
    AWSGlueTriggerTypeScheduled,
    AWSGlueTriggerTypeConditional,
    AWSGlueTriggerTypeOnDemand,
};

typedef NS_ENUM(NSInteger, AWSGlueUpdateBehavior) {
    AWSGlueUpdateBehaviorUnknown,
    AWSGlueUpdateBehaviorLog,
    AWSGlueUpdateBehaviorUpdateInDatabase,
};

typedef NS_ENUM(NSInteger, AWSGlueWorkerType) {
    AWSGlueWorkerTypeUnknown,
    AWSGlueWorkerTypeStandard,
    AWSGlueWorkerTypeG1x,
    AWSGlueWorkerTypeG2x,
};

typedef NS_ENUM(NSInteger, AWSGlueWorkflowRunStatus) {
    AWSGlueWorkflowRunStatusUnknown,
    AWSGlueWorkflowRunStatusRunning,
    AWSGlueWorkflowRunStatusCompleted,
    AWSGlueWorkflowRunStatusStopping,
    AWSGlueWorkflowRunStatusStopped,
};

@class AWSGlueAction;
@class AWSGlueBatchCreatePartitionRequest;
@class AWSGlueBatchCreatePartitionResponse;
@class AWSGlueBatchDeleteConnectionRequest;
@class AWSGlueBatchDeleteConnectionResponse;
@class AWSGlueBatchDeletePartitionRequest;
@class AWSGlueBatchDeletePartitionResponse;
@class AWSGlueBatchDeleteTableRequest;
@class AWSGlueBatchDeleteTableResponse;
@class AWSGlueBatchDeleteTableVersionRequest;
@class AWSGlueBatchDeleteTableVersionResponse;
@class AWSGlueBatchGetCrawlersRequest;
@class AWSGlueBatchGetCrawlersResponse;
@class AWSGlueBatchGetDevEndpointsRequest;
@class AWSGlueBatchGetDevEndpointsResponse;
@class AWSGlueBatchGetJobsRequest;
@class AWSGlueBatchGetJobsResponse;
@class AWSGlueBatchGetPartitionRequest;
@class AWSGlueBatchGetPartitionResponse;
@class AWSGlueBatchGetTriggersRequest;
@class AWSGlueBatchGetTriggersResponse;
@class AWSGlueBatchGetWorkflowsRequest;
@class AWSGlueBatchGetWorkflowsResponse;
@class AWSGlueBatchStopJobRunError;
@class AWSGlueBatchStopJobRunRequest;
@class AWSGlueBatchStopJobRunResponse;
@class AWSGlueBatchStopJobRunSuccessfulSubmission;
@class AWSGlueCancelMLTaskRunRequest;
@class AWSGlueCancelMLTaskRunResponse;
@class AWSGlueCatalogEntry;
@class AWSGlueCatalogImportStatus;
@class AWSGlueCatalogTarget;
@class AWSGlueClassifier;
@class AWSGlueCloudWatchEncryption;
@class AWSGlueCodeGenEdge;
@class AWSGlueCodeGenNode;
@class AWSGlueCodeGenNodeArg;
@class AWSGlueColumn;
@class AWSGlueCondition;
@class AWSGlueConfusionMatrix;
@class AWSGlueConnection;
@class AWSGlueConnectionInput;
@class AWSGlueConnectionPasswordEncryption;
@class AWSGlueConnectionsList;
@class AWSGlueCrawl;
@class AWSGlueCrawler;
@class AWSGlueCrawlerMetrics;
@class AWSGlueCrawlerNodeDetails;
@class AWSGlueCrawlerTargets;
@class AWSGlueCreateClassifierRequest;
@class AWSGlueCreateClassifierResponse;
@class AWSGlueCreateConnectionRequest;
@class AWSGlueCreateConnectionResponse;
@class AWSGlueCreateCrawlerRequest;
@class AWSGlueCreateCrawlerResponse;
@class AWSGlueCreateCsvClassifierRequest;
@class AWSGlueCreateDatabaseRequest;
@class AWSGlueCreateDatabaseResponse;
@class AWSGlueCreateDevEndpointRequest;
@class AWSGlueCreateDevEndpointResponse;
@class AWSGlueCreateGrokClassifierRequest;
@class AWSGlueCreateJobRequest;
@class AWSGlueCreateJobResponse;
@class AWSGlueCreateJsonClassifierRequest;
@class AWSGlueCreateMLTransformRequest;
@class AWSGlueCreateMLTransformResponse;
@class AWSGlueCreatePartitionRequest;
@class AWSGlueCreatePartitionResponse;
@class AWSGlueCreateScriptRequest;
@class AWSGlueCreateScriptResponse;
@class AWSGlueCreateSecurityConfigurationRequest;
@class AWSGlueCreateSecurityConfigurationResponse;
@class AWSGlueCreateTableRequest;
@class AWSGlueCreateTableResponse;
@class AWSGlueCreateTriggerRequest;
@class AWSGlueCreateTriggerResponse;
@class AWSGlueCreateUserDefinedFunctionRequest;
@class AWSGlueCreateUserDefinedFunctionResponse;
@class AWSGlueCreateWorkflowRequest;
@class AWSGlueCreateWorkflowResponse;
@class AWSGlueCreateXMLClassifierRequest;
@class AWSGlueCsvClassifier;
@class AWSGlueDataCatalogEncryptionSettings;
@class AWSGlueDataLakePrincipal;
@class AWSGlueDatabase;
@class AWSGlueDatabaseInput;
@class AWSGlueDeleteClassifierRequest;
@class AWSGlueDeleteClassifierResponse;
@class AWSGlueDeleteConnectionRequest;
@class AWSGlueDeleteConnectionResponse;
@class AWSGlueDeleteCrawlerRequest;
@class AWSGlueDeleteCrawlerResponse;
@class AWSGlueDeleteDatabaseRequest;
@class AWSGlueDeleteDatabaseResponse;
@class AWSGlueDeleteDevEndpointRequest;
@class AWSGlueDeleteDevEndpointResponse;
@class AWSGlueDeleteJobRequest;
@class AWSGlueDeleteJobResponse;
@class AWSGlueDeleteMLTransformRequest;
@class AWSGlueDeleteMLTransformResponse;
@class AWSGlueDeletePartitionRequest;
@class AWSGlueDeletePartitionResponse;
@class AWSGlueDeleteResourcePolicyRequest;
@class AWSGlueDeleteResourcePolicyResponse;
@class AWSGlueDeleteSecurityConfigurationRequest;
@class AWSGlueDeleteSecurityConfigurationResponse;
@class AWSGlueDeleteTableRequest;
@class AWSGlueDeleteTableResponse;
@class AWSGlueDeleteTableVersionRequest;
@class AWSGlueDeleteTableVersionResponse;
@class AWSGlueDeleteTriggerRequest;
@class AWSGlueDeleteTriggerResponse;
@class AWSGlueDeleteUserDefinedFunctionRequest;
@class AWSGlueDeleteUserDefinedFunctionResponse;
@class AWSGlueDeleteWorkflowRequest;
@class AWSGlueDeleteWorkflowResponse;
@class AWSGlueDevEndpoint;
@class AWSGlueDevEndpointCustomLibraries;
@class AWSGlueDynamoDBTarget;
@class AWSGlueEdge;
@class AWSGlueEncryptionAtRest;
@class AWSGlueEncryptionConfiguration;
@class AWSGlueErrorDetail;
@class AWSGlueEvaluationMetrics;
@class AWSGlueExecutionProperty;
@class AWSGlueExportLabelsTaskRunProperties;
@class AWSGlueFindMatchesMetrics;
@class AWSGlueFindMatchesParameters;
@class AWSGlueFindMatchesTaskRunProperties;
@class AWSGlueGetCatalogImportStatusRequest;
@class AWSGlueGetCatalogImportStatusResponse;
@class AWSGlueGetClassifierRequest;
@class AWSGlueGetClassifierResponse;
@class AWSGlueGetClassifiersRequest;
@class AWSGlueGetClassifiersResponse;
@class AWSGlueGetConnectionRequest;
@class AWSGlueGetConnectionResponse;
@class AWSGlueGetConnectionsFilter;
@class AWSGlueGetConnectionsRequest;
@class AWSGlueGetConnectionsResponse;
@class AWSGlueGetCrawlerMetricsRequest;
@class AWSGlueGetCrawlerMetricsResponse;
@class AWSGlueGetCrawlerRequest;
@class AWSGlueGetCrawlerResponse;
@class AWSGlueGetCrawlersRequest;
@class AWSGlueGetCrawlersResponse;
@class AWSGlueGetDataCatalogEncryptionSettingsRequest;
@class AWSGlueGetDataCatalogEncryptionSettingsResponse;
@class AWSGlueGetDatabaseRequest;
@class AWSGlueGetDatabaseResponse;
@class AWSGlueGetDatabasesRequest;
@class AWSGlueGetDatabasesResponse;
@class AWSGlueGetDataflowGraphRequest;
@class AWSGlueGetDataflowGraphResponse;
@class AWSGlueGetDevEndpointRequest;
@class AWSGlueGetDevEndpointResponse;
@class AWSGlueGetDevEndpointsRequest;
@class AWSGlueGetDevEndpointsResponse;
@class AWSGlueGetJobBookmarkRequest;
@class AWSGlueGetJobBookmarkResponse;
@class AWSGlueGetJobRequest;
@class AWSGlueGetJobResponse;
@class AWSGlueGetJobRunRequest;
@class AWSGlueGetJobRunResponse;
@class AWSGlueGetJobRunsRequest;
@class AWSGlueGetJobRunsResponse;
@class AWSGlueGetJobsRequest;
@class AWSGlueGetJobsResponse;
@class AWSGlueGetMLTaskRunRequest;
@class AWSGlueGetMLTaskRunResponse;
@class AWSGlueGetMLTaskRunsRequest;
@class AWSGlueGetMLTaskRunsResponse;
@class AWSGlueGetMLTransformRequest;
@class AWSGlueGetMLTransformResponse;
@class AWSGlueGetMLTransformsRequest;
@class AWSGlueGetMLTransformsResponse;
@class AWSGlueGetMappingRequest;
@class AWSGlueGetMappingResponse;
@class AWSGlueGetPartitionRequest;
@class AWSGlueGetPartitionResponse;
@class AWSGlueGetPartitionsRequest;
@class AWSGlueGetPartitionsResponse;
@class AWSGlueGetPlanRequest;
@class AWSGlueGetPlanResponse;
@class AWSGlueGetResourcePolicyRequest;
@class AWSGlueGetResourcePolicyResponse;
@class AWSGlueGetSecurityConfigurationRequest;
@class AWSGlueGetSecurityConfigurationResponse;
@class AWSGlueGetSecurityConfigurationsRequest;
@class AWSGlueGetSecurityConfigurationsResponse;
@class AWSGlueGetTableRequest;
@class AWSGlueGetTableResponse;
@class AWSGlueGetTableVersionRequest;
@class AWSGlueGetTableVersionResponse;
@class AWSGlueGetTableVersionsRequest;
@class AWSGlueGetTableVersionsResponse;
@class AWSGlueGetTablesRequest;
@class AWSGlueGetTablesResponse;
@class AWSGlueGetTagsRequest;
@class AWSGlueGetTagsResponse;
@class AWSGlueGetTriggerRequest;
@class AWSGlueGetTriggerResponse;
@class AWSGlueGetTriggersRequest;
@class AWSGlueGetTriggersResponse;
@class AWSGlueGetUserDefinedFunctionRequest;
@class AWSGlueGetUserDefinedFunctionResponse;
@class AWSGlueGetUserDefinedFunctionsRequest;
@class AWSGlueGetUserDefinedFunctionsResponse;
@class AWSGlueGetWorkflowRequest;
@class AWSGlueGetWorkflowResponse;
@class AWSGlueGetWorkflowRunPropertiesRequest;
@class AWSGlueGetWorkflowRunPropertiesResponse;
@class AWSGlueGetWorkflowRunRequest;
@class AWSGlueGetWorkflowRunResponse;
@class AWSGlueGetWorkflowRunsRequest;
@class AWSGlueGetWorkflowRunsResponse;
@class AWSGlueGlueTable;
@class AWSGlueGrokClassifier;
@class AWSGlueImportCatalogToGlueRequest;
@class AWSGlueImportCatalogToGlueResponse;
@class AWSGlueImportLabelsTaskRunProperties;
@class AWSGlueJdbcTarget;
@class AWSGlueJob;
@class AWSGlueJobBookmarkEntry;
@class AWSGlueJobBookmarksEncryption;
@class AWSGlueJobCommand;
@class AWSGlueJobNodeDetails;
@class AWSGlueJobRun;
@class AWSGlueJobUpdate;
@class AWSGlueJsonClassifier;
@class AWSGlueLabelingSetGenerationTaskRunProperties;
@class AWSGlueLastCrawlInfo;
@class AWSGlueListCrawlersRequest;
@class AWSGlueListCrawlersResponse;
@class AWSGlueListDevEndpointsRequest;
@class AWSGlueListDevEndpointsResponse;
@class AWSGlueListJobsRequest;
@class AWSGlueListJobsResponse;
@class AWSGlueListMLTransformsRequest;
@class AWSGlueListMLTransformsResponse;
@class AWSGlueListTriggersRequest;
@class AWSGlueListTriggersResponse;
@class AWSGlueListWorkflowsRequest;
@class AWSGlueListWorkflowsResponse;
@class AWSGlueLocation;
@class AWSGlueMLTransform;
@class AWSGlueMappingEntry;
@class AWSGlueNode;
@class AWSGlueNotificationProperty;
@class AWSGlueOrder;
@class AWSGluePartition;
@class AWSGluePartitionError;
@class AWSGluePartitionInput;
@class AWSGluePartitionValueList;
@class AWSGluePhysicalConnectionRequirements;
@class AWSGluePredecessor;
@class AWSGluePredicate;
@class AWSGluePrincipalPermissions;
@class AWSGluePropertyPredicate;
@class AWSGluePutDataCatalogEncryptionSettingsRequest;
@class AWSGluePutDataCatalogEncryptionSettingsResponse;
@class AWSGluePutResourcePolicyRequest;
@class AWSGluePutResourcePolicyResponse;
@class AWSGluePutWorkflowRunPropertiesRequest;
@class AWSGluePutWorkflowRunPropertiesResponse;
@class AWSGlueResetJobBookmarkRequest;
@class AWSGlueResetJobBookmarkResponse;
@class AWSGlueResourceUri;
@class AWSGlueS3Encryption;
@class AWSGlueS3Target;
@class AWSGlueSchedule;
@class AWSGlueSchemaChangePolicy;
@class AWSGlueSchemaColumn;
@class AWSGlueSearchTablesRequest;
@class AWSGlueSearchTablesResponse;
@class AWSGlueSecurityConfiguration;
@class AWSGlueSegment;
@class AWSGlueSerDeInfo;
@class AWSGlueSkewedInfo;
@class AWSGlueSortCriterion;
@class AWSGlueStartCrawlerRequest;
@class AWSGlueStartCrawlerResponse;
@class AWSGlueStartCrawlerScheduleRequest;
@class AWSGlueStartCrawlerScheduleResponse;
@class AWSGlueStartExportLabelsTaskRunRequest;
@class AWSGlueStartExportLabelsTaskRunResponse;
@class AWSGlueStartImportLabelsTaskRunRequest;
@class AWSGlueStartImportLabelsTaskRunResponse;
@class AWSGlueStartJobRunRequest;
@class AWSGlueStartJobRunResponse;
@class AWSGlueStartMLEvaluationTaskRunRequest;
@class AWSGlueStartMLEvaluationTaskRunResponse;
@class AWSGlueStartMLLabelingSetGenerationTaskRunRequest;
@class AWSGlueStartMLLabelingSetGenerationTaskRunResponse;
@class AWSGlueStartTriggerRequest;
@class AWSGlueStartTriggerResponse;
@class AWSGlueStartWorkflowRunRequest;
@class AWSGlueStartWorkflowRunResponse;
@class AWSGlueStopCrawlerRequest;
@class AWSGlueStopCrawlerResponse;
@class AWSGlueStopCrawlerScheduleRequest;
@class AWSGlueStopCrawlerScheduleResponse;
@class AWSGlueStopTriggerRequest;
@class AWSGlueStopTriggerResponse;
@class AWSGlueStopWorkflowRunRequest;
@class AWSGlueStopWorkflowRunResponse;
@class AWSGlueStorageDescriptor;
@class AWSGlueTable;
@class AWSGlueTableError;
@class AWSGlueTableInput;
@class AWSGlueTableVersion;
@class AWSGlueTableVersionError;
@class AWSGlueTagResourceRequest;
@class AWSGlueTagResourceResponse;
@class AWSGlueTaskRun;
@class AWSGlueTaskRunFilterCriteria;
@class AWSGlueTaskRunProperties;
@class AWSGlueTaskRunSortCriteria;
@class AWSGlueTransformFilterCriteria;
@class AWSGlueTransformParameters;
@class AWSGlueTransformSortCriteria;
@class AWSGlueTrigger;
@class AWSGlueTriggerNodeDetails;
@class AWSGlueTriggerUpdate;
@class AWSGlueUntagResourceRequest;
@class AWSGlueUntagResourceResponse;
@class AWSGlueUpdateClassifierRequest;
@class AWSGlueUpdateClassifierResponse;
@class AWSGlueUpdateConnectionRequest;
@class AWSGlueUpdateConnectionResponse;
@class AWSGlueUpdateCrawlerRequest;
@class AWSGlueUpdateCrawlerResponse;
@class AWSGlueUpdateCrawlerScheduleRequest;
@class AWSGlueUpdateCrawlerScheduleResponse;
@class AWSGlueUpdateCsvClassifierRequest;
@class AWSGlueUpdateDatabaseRequest;
@class AWSGlueUpdateDatabaseResponse;
@class AWSGlueUpdateDevEndpointRequest;
@class AWSGlueUpdateDevEndpointResponse;
@class AWSGlueUpdateGrokClassifierRequest;
@class AWSGlueUpdateJobRequest;
@class AWSGlueUpdateJobResponse;
@class AWSGlueUpdateJsonClassifierRequest;
@class AWSGlueUpdateMLTransformRequest;
@class AWSGlueUpdateMLTransformResponse;
@class AWSGlueUpdatePartitionRequest;
@class AWSGlueUpdatePartitionResponse;
@class AWSGlueUpdateTableRequest;
@class AWSGlueUpdateTableResponse;
@class AWSGlueUpdateTriggerRequest;
@class AWSGlueUpdateTriggerResponse;
@class AWSGlueUpdateUserDefinedFunctionRequest;
@class AWSGlueUpdateUserDefinedFunctionResponse;
@class AWSGlueUpdateWorkflowRequest;
@class AWSGlueUpdateWorkflowResponse;
@class AWSGlueUpdateXMLClassifierRequest;
@class AWSGlueUserDefinedFunction;
@class AWSGlueUserDefinedFunctionInput;
@class AWSGlueWorkflow;
@class AWSGlueWorkflowGraph;
@class AWSGlueWorkflowRun;
@class AWSGlueWorkflowRunStatistics;
@class AWSGlueXMLClassifier;

/**
 <p>Defines an action to be initiated by a trigger.</p>
 */
@interface AWSGlueAction : AWSModel


/**
 <p>The job arguments used when this trigger fires. For this job run, they replace the default arguments set in the job definition itself.</p><p>You can specify arguments here that your own job-execution script consumes, as well as arguments that AWS Glue itself consumes.</p><p>For information about how to specify and consume your own Job arguments, see the <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html">Calling AWS Glue APIs in Python</a> topic in the developer guide.</p><p>For information about the key-value pairs that AWS Glue consumes to set up your job, see the <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html">Special Parameters Used by AWS Glue</a> topic in the developer guide.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable arguments;

/**
 <p>The name of the crawler to be used with this action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable crawlerName;

/**
 <p>The name of a job to be executed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>Specifies configuration properties of a job run notification.</p>
 */
@property (nonatomic, strong) AWSGlueNotificationProperty * _Nullable notificationProperty;

/**
 <p>The name of the <code>SecurityConfiguration</code> structure to be used with this action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityConfiguration;

/**
 <p>The <code>JobRun</code> timeout in minutes. This is the maximum time that a job run can consume resources before it is terminated and enters <code>TIMEOUT</code> status. The default is 2,880 minutes (48 hours). This overrides the timeout value set in the parent job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

@end

/**
 
 */
@interface AWSGlueBatchCreatePartitionRequest : AWSRequest


/**
 <p>The ID of the catalog in which the partition is to be created. Currently, this should be the AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the metadata database in which the partition is to be created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>A list of <code>PartitionInput</code> structures that define the partitions to be created.</p>
 */
@property (nonatomic, strong) NSArray<AWSGluePartitionInput *> * _Nullable partitionInputList;

/**
 <p>The name of the metadata table in which the partition is to be created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSGlueBatchCreatePartitionResponse : AWSModel


/**
 <p>The errors encountered when trying to create the requested partitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSGluePartitionError *> * _Nullable errors;

@end

/**
 
 */
@interface AWSGlueBatchDeleteConnectionRequest : AWSRequest


/**
 <p>The ID of the Data Catalog in which the connections reside. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>A list of names of the connections to delete.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable connectionNameList;

@end

/**
 
 */
@interface AWSGlueBatchDeleteConnectionResponse : AWSModel


/**
 <p>A map of the names of connections that were not successfully deleted to error details.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSGlueErrorDetail *> * _Nullable errors;

/**
 <p>A list of names of the connection definitions that were successfully deleted.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable succeeded;

@end

/**
 
 */
@interface AWSGlueBatchDeletePartitionRequest : AWSRequest


/**
 <p>The ID of the Data Catalog where the partition to be deleted resides. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the catalog database in which the table in question resides.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>A list of <code>PartitionInput</code> structures that define the partitions to be deleted.</p>
 */
@property (nonatomic, strong) NSArray<AWSGluePartitionValueList *> * _Nullable partitionsToDelete;

/**
 <p>The name of the table that contains the partitions to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSGlueBatchDeletePartitionResponse : AWSModel


/**
 <p>The errors encountered when trying to delete the requested partitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSGluePartitionError *> * _Nullable errors;

@end

/**
 
 */
@interface AWSGlueBatchDeleteTableRequest : AWSRequest


/**
 <p>The ID of the Data Catalog where the table resides. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the catalog database in which the tables to delete reside. For Hive compatibility, this name is entirely lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>A list of the table to delete.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tablesToDelete;

@end

/**
 
 */
@interface AWSGlueBatchDeleteTableResponse : AWSModel


/**
 <p>A list of errors encountered in attempting to delete the specified tables.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueTableError *> * _Nullable errors;

@end

/**
 
 */
@interface AWSGlueBatchDeleteTableVersionRequest : AWSRequest


/**
 <p>The ID of the Data Catalog where the tables reside. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The database in the catalog in which the table resides. For Hive compatibility, this name is entirely lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The name of the table. For Hive compatibility, this name is entirely lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

/**
 <p>A list of the IDs of versions to be deleted. A <code>VersionId</code> is a string representation of an integer. Each version is incremented by 1.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable versionIds;

@end

/**
 
 */
@interface AWSGlueBatchDeleteTableVersionResponse : AWSModel


/**
 <p>A list of errors encountered while trying to delete the specified table versions.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueTableVersionError *> * _Nullable errors;

@end

/**
 
 */
@interface AWSGlueBatchGetCrawlersRequest : AWSRequest


/**
 <p>A list of crawler names, which might be the names returned from the <code>ListCrawlers</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable crawlerNames;

@end

/**
 
 */
@interface AWSGlueBatchGetCrawlersResponse : AWSModel


/**
 <p>A list of crawler definitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueCrawler *> * _Nullable crawlers;

/**
 <p>A list of names of crawlers that were not found.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable crawlersNotFound;

@end

/**
 
 */
@interface AWSGlueBatchGetDevEndpointsRequest : AWSRequest


/**
 <p>The list of <code>DevEndpoint</code> names, which might be the names returned from the <code>ListDevEndpoint</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable devEndpointNames;

@end

/**
 
 */
@interface AWSGlueBatchGetDevEndpointsResponse : AWSModel


/**
 <p>A list of <code>DevEndpoint</code> definitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueDevEndpoint *> * _Nullable devEndpoints;

/**
 <p>A list of <code>DevEndpoints</code> not found.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable devEndpointsNotFound;

@end

/**
 
 */
@interface AWSGlueBatchGetJobsRequest : AWSRequest


/**
 <p>A list of job names, which might be the names returned from the <code>ListJobs</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable jobNames;

@end

/**
 
 */
@interface AWSGlueBatchGetJobsResponse : AWSModel


/**
 <p>A list of job definitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueJob *> * _Nullable jobs;

/**
 <p>A list of names of jobs not found.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable jobsNotFound;

@end

/**
 
 */
@interface AWSGlueBatchGetPartitionRequest : AWSRequest


/**
 <p>The ID of the Data Catalog where the partitions in question reside. If none is supplied, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the catalog database where the partitions reside.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>A list of partition values identifying the partitions to retrieve.</p>
 */
@property (nonatomic, strong) NSArray<AWSGluePartitionValueList *> * _Nullable partitionsToGet;

/**
 <p>The name of the partitions' table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSGlueBatchGetPartitionResponse : AWSModel


/**
 <p>A list of the requested partitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSGluePartition *> * _Nullable partitions;

/**
 <p>A list of the partition values in the request for which partitions were not returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSGluePartitionValueList *> * _Nullable unprocessedKeys;

@end

/**
 
 */
@interface AWSGlueBatchGetTriggersRequest : AWSRequest


/**
 <p>A list of trigger names, which may be the names returned from the <code>ListTriggers</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable triggerNames;

@end

/**
 
 */
@interface AWSGlueBatchGetTriggersResponse : AWSModel


/**
 <p>A list of trigger definitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueTrigger *> * _Nullable triggers;

/**
 <p>A list of names of triggers not found.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable triggersNotFound;

@end

/**
 
 */
@interface AWSGlueBatchGetWorkflowsRequest : AWSRequest


/**
 <p>Specifies whether to include a graph when returning the workflow resource metadata.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeGraph;

/**
 <p>A list of workflow names, which may be the names returned from the <code>ListWorkflows</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable names;

@end

/**
 
 */
@interface AWSGlueBatchGetWorkflowsResponse : AWSModel


/**
 <p>A list of names of workflows not found.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable missingWorkflows;

/**
 <p>A list of workflow resource metadata.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueWorkflow *> * _Nullable workflows;

@end

/**
 <p>Records an error that occurred when attempting to stop a specified job run.</p>
 */
@interface AWSGlueBatchStopJobRunError : AWSModel


/**
 <p>Specifies details about the error that was encountered.</p>
 */
@property (nonatomic, strong) AWSGlueErrorDetail * _Nullable errorDetail;

/**
 <p>The name of the job definition that is used in the job run in question.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The <code>JobRunId</code> of the job run in question.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobRunId;

@end

/**
 
 */
@interface AWSGlueBatchStopJobRunRequest : AWSRequest


/**
 <p>The name of the job definition for which to stop job runs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>A list of the <code>JobRunIds</code> that should be stopped for that job definition.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable jobRunIds;

@end

/**
 
 */
@interface AWSGlueBatchStopJobRunResponse : AWSModel


/**
 <p>A list of the errors that were encountered in trying to stop <code>JobRuns</code>, including the <code>JobRunId</code> for which each error was encountered and details about the error.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueBatchStopJobRunError *> * _Nullable errors;

/**
 <p>A list of the JobRuns that were successfully submitted for stopping.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueBatchStopJobRunSuccessfulSubmission *> * _Nullable successfulSubmissions;

@end

/**
 <p>Records a successful request to stop a specified <code>JobRun</code>.</p>
 */
@interface AWSGlueBatchStopJobRunSuccessfulSubmission : AWSModel


/**
 <p>The name of the job definition used in the job run that was stopped.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The <code>JobRunId</code> of the job run that was stopped.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobRunId;

@end

/**
 
 */
@interface AWSGlueCancelMLTaskRunRequest : AWSRequest


/**
 <p>A unique identifier for the task run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskRunId;

/**
 <p>The unique identifier of the machine learning transform.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 
 */
@interface AWSGlueCancelMLTaskRunResponse : AWSModel


/**
 <p>The status for this run.</p>
 */
@property (nonatomic, assign) AWSGlueTaskStatusType status;

/**
 <p>The unique identifier for the task run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskRunId;

/**
 <p>The unique identifier of the machine learning transform.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 <p>Specifies a table definition in the AWS Glue Data Catalog.</p>
 Required parameters: [DatabaseName, TableName]
 */
@interface AWSGlueCatalogEntry : AWSModel


/**
 <p>The database in which the table metadata resides.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The name of the table in question.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>A structure containing migration status information.</p>
 */
@interface AWSGlueCatalogImportStatus : AWSModel


/**
 <p><code>True</code> if the migration has completed, or <code>False</code> otherwise.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable importCompleted;

/**
 <p>The time that the migration was started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable importTime;

/**
 <p>The name of the person who initiated the migration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable importedBy;

@end

/**
 <p>Specifies an AWS Glue Data Catalog target.</p>
 Required parameters: [DatabaseName, Tables]
 */
@interface AWSGlueCatalogTarget : AWSModel


/**
 <p>The name of the database to be synchronized.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>A list of the tables to be synchronized.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tables;

@end

/**
 <p>Classifiers are triggered during a crawl task. A classifier checks whether a given file is in a format it can handle. If it is, the classifier creates a schema in the form of a <code>StructType</code> object that matches that data format.</p><p>You can use the standard classifiers that AWS Glue provides, or you can write your own classifiers to best categorize your data sources and specify the appropriate schemas to use for them. A classifier can be a <code>grok</code> classifier, an <code>XML</code> classifier, a <code>JSON</code> classifier, or a custom <code>CSV</code> classifier, as specified in one of the fields in the <code>Classifier</code> object.</p>
 */
@interface AWSGlueClassifier : AWSModel


/**
 <p>A classifier for comma-separated values (CSV).</p>
 */
@property (nonatomic, strong) AWSGlueCsvClassifier * _Nullable csvClassifier;

/**
 <p>A classifier that uses <code>grok</code>.</p>
 */
@property (nonatomic, strong) AWSGlueGrokClassifier * _Nullable grokClassifier;

/**
 <p>A classifier for JSON content.</p>
 */
@property (nonatomic, strong) AWSGlueJsonClassifier * _Nullable jsonClassifier;

/**
 <p>A classifier for XML content.</p>
 */
@property (nonatomic, strong) AWSGlueXMLClassifier * _Nullable XMLClassifier;

@end

/**
 <p>Specifies how Amazon CloudWatch data should be encrypted.</p>
 */
@interface AWSGlueCloudWatchEncryption : AWSModel


/**
 <p>The encryption mode to use for CloudWatch data.</p>
 */
@property (nonatomic, assign) AWSGlueCloudWatchEncryptionMode cloudWatchEncryptionMode;

/**
 <p>The Amazon Resource Name (ARN) of the KMS key to be used to encrypt the data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyArn;

@end

/**
 <p>Represents a directional edge in a directed acyclic graph (DAG).</p>
 Required parameters: [Source, Target]
 */
@interface AWSGlueCodeGenEdge : AWSModel


/**
 <p>The ID of the node at which the edge starts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable source;

/**
 <p>The ID of the node at which the edge ends.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

/**
 <p>The target of the edge.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetParameter;

@end

/**
 <p>Represents a node in a directed acyclic graph (DAG)</p>
 Required parameters: [Id, NodeType, Args]
 */
@interface AWSGlueCodeGenNode : AWSModel


/**
 <p>Properties of the node, in the form of name-value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueCodeGenNodeArg *> * _Nullable args;

/**
 <p>A node identifier that is unique within the node's graph.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The line number of the node.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lineNumber;

/**
 <p>The type of node that this is.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeType;

@end

/**
 <p>An argument or property of a node.</p>
 Required parameters: [Name, Value]
 */
@interface AWSGlueCodeGenNodeArg : AWSModel


/**
 <p>The name of the argument or property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>True if the value is used as a parameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable param;

/**
 <p>The value of the argument or property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>A column in a <code>Table</code>.</p>
 Required parameters: [Name]
 */
@interface AWSGlueColumn : AWSModel


/**
 <p>A free-form text comment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The name of the <code>Column</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>These key-value pairs define properties associated with the column.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable parameters;

/**
 <p>The data type of the <code>Column</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>Defines a condition under which a trigger fires.</p>
 */
@interface AWSGlueCondition : AWSModel


/**
 <p>The state of the crawler to which this condition applies.</p>
 */
@property (nonatomic, assign) AWSGlueCrawlState crawlState;

/**
 <p>The name of the crawler to which this condition applies.</p>
 */
@property (nonatomic, strong) NSString * _Nullable crawlerName;

/**
 <p>The name of the job whose <code>JobRuns</code> this condition applies to, and on which this trigger waits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>A logical operator.</p>
 */
@property (nonatomic, assign) AWSGlueLogicalOperator logicalOperator;

/**
 <p>The condition state. Currently, the only job states that a trigger can listen for are <code>SUCCEEDED</code>, <code>STOPPED</code>, <code>FAILED</code>, and <code>TIMEOUT</code>. The only crawler states that a trigger can listen for are <code>SUCCEEDED</code>, <code>FAILED</code>, and <code>CANCELLED</code>.</p>
 */
@property (nonatomic, assign) AWSGlueJobRunState state;

@end

/**
 <p>The confusion matrix shows you what your transform is predicting accurately and what types of errors it is making.</p><p>For more information, see <a href="https://en.wikipedia.org/wiki/Confusion_matrix">Confusion matrix</a> in Wikipedia.</p>
 */
@interface AWSGlueConfusionMatrix : AWSModel


/**
 <p>The number of matches in the data that the transform didn't find, in the confusion matrix for your transform.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numFalseNegatives;

/**
 <p>The number of nonmatches in the data that the transform incorrectly classified as a match, in the confusion matrix for your transform.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numFalsePositives;

/**
 <p>The number of nonmatches in the data that the transform correctly rejected, in the confusion matrix for your transform.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numTrueNegatives;

/**
 <p>The number of matches in the data that the transform correctly found, in the confusion matrix for your transform.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numTruePositives;

@end

/**
 <p>Defines a connection to a data source.</p>
 */
@interface AWSGlueConnection : AWSModel


/**
 <p>These key-value pairs define parameters for the connection:</p><ul><li><p><code>HOST</code> - The host URI: either the fully qualified domain name (FQDN) or the IPv4 address of the database host.</p></li><li><p><code>PORT</code> - The port number, between 1024 and 65535, of the port on which the database host is listening for database connections.</p></li><li><p><code>USER_NAME</code> - The name under which to log in to the database. The value string for <code>USER_NAME</code> is "<code>USERNAME</code>".</p></li><li><p><code>PASSWORD</code> - A password, if one is used, for the user name.</p></li><li><p><code>ENCRYPTED_PASSWORD</code> - When you enable connection password protection by setting <code>ConnectionPasswordEncryption</code> in the Data Catalog encryption settings, this field stores the encrypted password.</p></li><li><p><code>JDBC_DRIVER_JAR_URI</code> - The Amazon Simple Storage Service (Amazon S3) path of the JAR file that contains the JDBC driver to use.</p></li><li><p><code>JDBC_DRIVER_CLASS_NAME</code> - The class name of the JDBC driver to use.</p></li><li><p><code>JDBC_ENGINE</code> - The name of the JDBC engine to use.</p></li><li><p><code>JDBC_ENGINE_VERSION</code> - The version of the JDBC engine to use.</p></li><li><p><code>CONFIG_FILES</code> - (Reserved for future use.)</p></li><li><p><code>INSTANCE_ID</code> - The instance ID to use.</p></li><li><p><code>JDBC_CONNECTION_URL</code> - The URL for connecting to a JDBC data source.</p></li><li><p><code>JDBC_ENFORCE_SSL</code> - A Boolean string (true, false) specifying whether Secure Sockets Layer (SSL) with hostname matching is enforced for the JDBC connection on the client. The default is false.</p></li><li><p><code>CUSTOM_JDBC_CERT</code> - An Amazon S3 location specifying the customer's root certificate. AWS Glue uses this root certificate to validate the customer’s certificate when connecting to the customer database. AWS Glue only handles X.509 certificates. The certificate provided must be DER-encoded and supplied in Base64 encoding PEM format.</p></li><li><p><code>SKIP_CUSTOM_JDBC_CERT_VALIDATION</code> - By default, this is <code>false</code>. AWS Glue validates the Signature algorithm and Subject Public Key Algorithm for the customer certificate. The only permitted algorithms for the Signature algorithm are SHA256withRSA, SHA384withRSA or SHA512withRSA. For the Subject Public Key Algorithm, the key length must be at least 2048. You can set the value of this property to <code>true</code> to skip AWS Glue’s validation of the customer certificate.</p></li><li><p><code>CUSTOM_JDBC_CERT_STRING</code> - A custom JDBC certificate string which is used for domain match or distinguished name match to prevent a man-in-the-middle attack. In Oracle database, this is used as the <code>SSL_SERVER_CERT_DN</code>; in Microsoft SQL Server, this is used as the <code>hostNameInCertificate</code>.</p></li><li><p><code>CONNECTION_URL</code> - The URL for connecting to a general (non-JDBC) data source.</p></li><li><p><code>KAFKA_BOOTSTRAP_SERVERS</code> - A comma-separated list of host and port pairs that are the addresses of the Apache Kafka brokers in a Kafka cluster to which a Kafka client will connect to and bootstrap itself.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable connectionProperties;

/**
 <p>The type of the connection. Currently, only JDBC is supported; SFTP is not supported.</p>
 */
@property (nonatomic, assign) AWSGlueConnectionType connectionType;

/**
 <p>The time that this connection definition was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The description of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The user, group, or role that last updated this connection definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastUpdatedBy;

/**
 <p>The last time that this connection definition was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>A list of criteria that can be used in selecting this connection.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable matchCriteria;

/**
 <p>The name of the connection definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A map of physical connection requirements, such as virtual private cloud (VPC) and <code>SecurityGroup</code>, that are needed to make this connection successfully.</p>
 */
@property (nonatomic, strong) AWSGluePhysicalConnectionRequirements * _Nullable physicalConnectionRequirements;

@end

/**
 <p>A structure that is used to specify a connection to create or update.</p>
 Required parameters: [Name, ConnectionType, ConnectionProperties]
 */
@interface AWSGlueConnectionInput : AWSModel


/**
 <p>These key-value pairs define parameters for the connection.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable connectionProperties;

/**
 <p>The type of the connection. Currently, these types are supported:</p><ul><li><p><code>JDBC</code> - Designates a connection to a database through Java Database Connectivity (JDBC).</p></li><li><p><code>KAFKA</code> - Designates a connection to an Apache Kafka streaming platform.</p></li><li><p><code>MONGODB</code> - Designates a connection to a MongoDB document database.</p></li></ul><p>SFTP is not supported.</p>
 */
@property (nonatomic, assign) AWSGlueConnectionType connectionType;

/**
 <p>The description of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A list of criteria that can be used in selecting this connection.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable matchCriteria;

/**
 <p>The name of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A map of physical connection requirements, such as virtual private cloud (VPC) and <code>SecurityGroup</code>, that are needed to successfully make this connection.</p>
 */
@property (nonatomic, strong) AWSGluePhysicalConnectionRequirements * _Nullable physicalConnectionRequirements;

@end

/**
 <p>The data structure used by the Data Catalog to encrypt the password as part of <code>CreateConnection</code> or <code>UpdateConnection</code> and store it in the <code>ENCRYPTED_PASSWORD</code> field in the connection properties. You can enable catalog encryption or only password encryption.</p><p>When a <code>CreationConnection</code> request arrives containing a password, the Data Catalog first encrypts the password using your AWS KMS key. It then encrypts the whole connection object again if catalog encryption is also enabled.</p><p>This encryption requires that you set AWS KMS key permissions to enable or restrict access on the password key according to your security requirements. For example, you might want only administrators to have decrypt permission on the password key.</p>
 Required parameters: [ReturnConnectionPasswordEncrypted]
 */
@interface AWSGlueConnectionPasswordEncryption : AWSModel


/**
 <p>An AWS KMS key that is used to encrypt the connection password. </p><p>If connection password protection is enabled, the caller of <code>CreateConnection</code> and <code>UpdateConnection</code> needs at least <code>kms:Encrypt</code> permission on the specified AWS KMS key, to encrypt passwords before storing them in the Data Catalog. </p><p>You can set the decrypt permission to enable or restrict access on the password key according to your security requirements.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsKmsKeyId;

/**
 <p>When the <code>ReturnConnectionPasswordEncrypted</code> flag is set to "true", passwords remain encrypted in the responses of <code>GetConnection</code> and <code>GetConnections</code>. This encryption takes effect independently from catalog encryption. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returnConnectionPasswordEncrypted;

@end

/**
 <p>Specifies the connections used by a job.</p>
 */
@interface AWSGlueConnectionsList : AWSModel


/**
 <p>A list of connections used by the job.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable connections;

@end

/**
 <p>The details of a crawl in the workflow.</p>
 */
@interface AWSGlueCrawl : AWSModel


/**
 <p>The date and time on which the crawl completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completedOn;

/**
 <p>The error message associated with the crawl.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The log group associated with the crawl.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroup;

/**
 <p>The log stream associated with the crawl.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logStream;

/**
 <p>The date and time on which the crawl started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedOn;

/**
 <p>The state of the crawler.</p>
 */
@property (nonatomic, assign) AWSGlueCrawlState state;

@end

/**
 <p>Specifies a crawler program that examines a data source and uses classifiers to try to determine its schema. If successful, the crawler records metadata concerning the data source in the AWS Glue Data Catalog.</p>
 */
@interface AWSGlueCrawler : AWSModel


/**
 <p>A list of UTF-8 strings that specify the custom classifiers that are associated with the crawler.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable classifiers;

/**
 <p>Crawler configuration information. This versioned JSON string allows users to specify aspects of a crawler's behavior. For more information, see <a href="http://docs.aws.amazon.com/glue/latest/dg/crawler-configuration.html">Configuring a Crawler</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configuration;

/**
 <p>If the crawler is running, contains the total time elapsed since the last crawl began.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable crawlElapsedTime;

/**
 <p>The name of the <code>SecurityConfiguration</code> structure to be used by this crawler.</p>
 */
@property (nonatomic, strong) NSString * _Nullable crawlerSecurityConfiguration;

/**
 <p>The time that the crawler was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The name of the database in which the crawler's output is stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>A description of the crawler.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The status of the last crawl, and potentially error information if an error occurred.</p>
 */
@property (nonatomic, strong) AWSGlueLastCrawlInfo * _Nullable lastCrawl;

/**
 <p>The time that the crawler was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdated;

/**
 <p>The name of the crawler.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Resource Name (ARN) of an IAM role that's used to access customer resources, such as Amazon Simple Storage Service (Amazon S3) data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>For scheduled crawlers, the schedule when the crawler runs.</p>
 */
@property (nonatomic, strong) AWSGlueSchedule * _Nullable schedule;

/**
 <p>The policy that specifies update and delete behaviors for the crawler.</p>
 */
@property (nonatomic, strong) AWSGlueSchemaChangePolicy * _Nullable schemaChangePolicy;

/**
 <p>Indicates whether the crawler is running, or whether a run is pending.</p>
 */
@property (nonatomic, assign) AWSGlueCrawlerState state;

/**
 <p>The prefix added to the names of tables that are created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tablePrefix;

/**
 <p>A collection of targets to crawl.</p>
 */
@property (nonatomic, strong) AWSGlueCrawlerTargets * _Nullable targets;

/**
 <p>The version of the crawler.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>Metrics for a specified crawler.</p>
 */
@interface AWSGlueCrawlerMetrics : AWSModel


/**
 <p>The name of the crawler.</p>
 */
@property (nonatomic, strong) NSString * _Nullable crawlerName;

/**
 <p>The duration of the crawler's most recent run, in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lastRuntimeSeconds;

/**
 <p>The median duration of this crawler's runs, in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable medianRuntimeSeconds;

/**
 <p>True if the crawler is still estimating how long it will take to complete this run.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable stillEstimating;

/**
 <p>The number of tables created by this crawler.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tablesCreated;

/**
 <p>The number of tables deleted by this crawler.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tablesDeleted;

/**
 <p>The number of tables updated by this crawler.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tablesUpdated;

/**
 <p>The estimated time left to complete a running crawl.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeLeftSeconds;

@end

/**
 <p>The details of a Crawler node present in the workflow.</p>
 */
@interface AWSGlueCrawlerNodeDetails : AWSModel


/**
 <p>A list of crawls represented by the crawl node.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueCrawl *> * _Nullable crawls;

@end

/**
 <p>Specifies data stores to crawl.</p>
 */
@interface AWSGlueCrawlerTargets : AWSModel


/**
 <p>Specifies AWS Glue Data Catalog targets.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueCatalogTarget *> * _Nullable catalogTargets;

/**
 <p>Specifies Amazon DynamoDB targets.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueDynamoDBTarget *> * _Nullable dynamoDBTargets;

/**
 <p>Specifies JDBC targets.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueJdbcTarget *> * _Nullable jdbcTargets;

/**
 <p>Specifies Amazon Simple Storage Service (Amazon S3) targets.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueS3Target *> * _Nullable s3Targets;

@end

/**
 
 */
@interface AWSGlueCreateClassifierRequest : AWSRequest


/**
 <p>A <code>CsvClassifier</code> object specifying the classifier to create.</p>
 */
@property (nonatomic, strong) AWSGlueCreateCsvClassifierRequest * _Nullable csvClassifier;

/**
 <p>A <code>GrokClassifier</code> object specifying the classifier to create.</p>
 */
@property (nonatomic, strong) AWSGlueCreateGrokClassifierRequest * _Nullable grokClassifier;

/**
 <p>A <code>JsonClassifier</code> object specifying the classifier to create.</p>
 */
@property (nonatomic, strong) AWSGlueCreateJsonClassifierRequest * _Nullable jsonClassifier;

/**
 <p>An <code>XMLClassifier</code> object specifying the classifier to create.</p>
 */
@property (nonatomic, strong) AWSGlueCreateXMLClassifierRequest * _Nullable XMLClassifier;

@end

/**
 
 */
@interface AWSGlueCreateClassifierResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueCreateConnectionRequest : AWSRequest


/**
 <p>The ID of the Data Catalog in which to create the connection. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>A <code>ConnectionInput</code> object defining the connection to create.</p>
 */
@property (nonatomic, strong) AWSGlueConnectionInput * _Nullable connectionInput;

@end

/**
 
 */
@interface AWSGlueCreateConnectionResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueCreateCrawlerRequest : AWSRequest


/**
 <p>A list of custom classifiers that the user has registered. By default, all built-in classifiers are included in a crawl, but these custom classifiers always override the default classifiers for a given classification.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable classifiers;

/**
 <p>The crawler configuration information. This versioned JSON string allows users to specify aspects of a crawler's behavior. For more information, see <a href="http://docs.aws.amazon.com/glue/latest/dg/crawler-configuration.html">Configuring a Crawler</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configuration;

/**
 <p>The name of the <code>SecurityConfiguration</code> structure to be used by this crawler.</p>
 */
@property (nonatomic, strong) NSString * _Nullable crawlerSecurityConfiguration;

/**
 <p>The AWS Glue database where results are written, such as: <code>arn:aws:daylight:us-east-1::database/sometable/*</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>A description of the new crawler.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Name of the new crawler.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The IAM role or Amazon Resource Name (ARN) of an IAM role used by the new crawler to access customer resources.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>A <code>cron</code> expression used to specify the schedule. For more information, see <a href="http://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based Schedules for Jobs and Crawlers</a>. For example, to run something every day at 12:15 UTC, specify <code>cron(15 12 * * ? *)</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

/**
 <p>The policy for the crawler's update and deletion behavior.</p>
 */
@property (nonatomic, strong) AWSGlueSchemaChangePolicy * _Nullable schemaChangePolicy;

/**
 <p>The table prefix used for catalog tables that are created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tablePrefix;

/**
 <p>The tags to use with this crawler request. You can use tags to limit access to the crawler. For more information, see <a href="http://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">AWS Tags in AWS Glue</a>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>A list of collection of targets to crawl.</p>
 */
@property (nonatomic, strong) AWSGlueCrawlerTargets * _Nullable targets;

@end

/**
 
 */
@interface AWSGlueCreateCrawlerResponse : AWSModel


@end

/**
 <p>Specifies a custom CSV classifier for <code>CreateClassifier</code> to create.</p>
 Required parameters: [Name]
 */
@interface AWSGlueCreateCsvClassifierRequest : AWSModel


/**
 <p>Enables the processing of files that contain only one column.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowSingleColumn;

/**
 <p>Indicates whether the CSV file contains a header.</p>
 */
@property (nonatomic, assign) AWSGlueCsvHeaderOption containsHeader;

/**
 <p>A custom symbol to denote what separates each column entry in the row.</p>
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 <p>Specifies not to trim values before identifying the type of column values. The default value is true.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableValueTrimming;

/**
 <p>A list of strings representing column names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable header;

/**
 <p>The name of the classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A custom symbol to denote what combines content into a single column value. Must be different from the column delimiter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable quoteSymbol;

@end

/**
 
 */
@interface AWSGlueCreateDatabaseRequest : AWSRequest


/**
 <p>The ID of the Data Catalog in which to create the database. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The metadata for the database.</p>
 */
@property (nonatomic, strong) AWSGlueDatabaseInput * _Nullable databaseInput;

@end

/**
 
 */
@interface AWSGlueCreateDatabaseResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueCreateDevEndpointRequest : AWSRequest


/**
 <p>A map of arguments used to configure the <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable arguments;

/**
 <p>The name to be assigned to the new <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

/**
 <p>The path to one or more Java <code>.jar</code> files in an S3 bucket that should be loaded in your <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable extraJarsS3Path;

/**
 <p>The paths to one or more Python libraries in an Amazon S3 bucket that should be loaded in your <code>DevEndpoint</code>. Multiple values must be complete paths separated by a comma.</p><note><p>You can only use pure Python libraries with a <code>DevEndpoint</code>. Libraries that rely on C extensions, such as the <a href="http://pandas.pydata.org/">pandas</a> Python data analysis library, are not yet supported.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable extraPythonLibsS3Path;

/**
 <p>Glue version determines the versions of Apache Spark and Python that AWS Glue supports. The Python version indicates the version supported for running your ETL scripts on development endpoints. </p><p>For more information about the available AWS Glue versions and corresponding Spark and Python versions, see <a href="https://docs.aws.amazon.com/glue/latest/dg/add-job.html">Glue version</a> in the developer guide.</p><p>Development endpoints that are created without specifying a Glue version default to Glue 0.9.</p><p>You can specify a version of Python support for development endpoints by using the <code>Arguments</code> parameter in the <code>CreateDevEndpoint</code> or <code>UpdateDevEndpoint</code> APIs. If no arguments are provided, the version defaults to Python 2.</p>
 */
@property (nonatomic, strong) NSString * _Nullable glueVersion;

/**
 <p>The number of AWS Glue Data Processing Units (DPUs) to allocate to this <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfNodes;

/**
 <p>The number of workers of a defined <code>workerType</code> that are allocated to the development endpoint.</p><p>The maximum number of workers you can define are 299 for <code>G.1X</code>, and 149 for <code>G.2X</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfWorkers;

/**
 <p>The public key to be used by this <code>DevEndpoint</code> for authentication. This attribute is provided for backward compatibility because the recommended attribute to use is public keys.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicKey;

/**
 <p>A list of public keys to be used by the development endpoints for authentication. The use of this attribute is preferred over a single public key because the public keys allow you to have a different private key per client.</p><note><p>If you previously created an endpoint with a public key, you must remove that key to be able to set a list of public keys. Call the <code>UpdateDevEndpoint</code> API with the public key content in the <code>deletePublicKeys</code> attribute, and the list of new keys in the <code>addPublicKeys</code> attribute.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable publicKeys;

/**
 <p>The IAM role for the <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The name of the <code>SecurityConfiguration</code> structure to be used with this <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityConfiguration;

/**
 <p>Security group IDs for the security groups to be used by the new <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>The subnet ID for the new <code>DevEndpoint</code> to use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>The tags to use with this DevEndpoint. You may use tags to limit access to the DevEndpoint. For more information about tags in AWS Glue, see <a href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">AWS Tags in AWS Glue</a> in the developer guide.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of predefined worker that is allocated to the development endpoint. Accepts a value of Standard, G.1X, or G.2X.</p><ul><li><p>For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16 GB of memory and a 50GB disk, and 2 executors per worker.</p></li><li><p>For the <code>G.1X</code> worker type, each worker maps to 1 DPU (4 vCPU, 16 GB of memory, 64 GB disk), and provides 1 executor per worker. We recommend this worker type for memory-intensive jobs.</p></li><li><p>For the <code>G.2X</code> worker type, each worker maps to 2 DPU (8 vCPU, 32 GB of memory, 128 GB disk), and provides 1 executor per worker. We recommend this worker type for memory-intensive jobs.</p></li></ul><p>Known issue: when a development endpoint is created with the <code>G.2X</code><code>WorkerType</code> configuration, the Spark drivers for the development endpoint will run on 4 vCPU, 16 GB of memory, and a 64 GB disk. </p>
 */
@property (nonatomic, assign) AWSGlueWorkerType workerType;

@end

/**
 
 */
@interface AWSGlueCreateDevEndpointResponse : AWSModel


/**
 <p>The map of arguments used to configure this <code>DevEndpoint</code>.</p><p>Valid arguments are:</p><ul><li><p><code>"--enable-glue-datacatalog": ""</code></p></li><li><p><code>"GLUE_PYTHON_VERSION": "3"</code></p></li><li><p><code>"GLUE_PYTHON_VERSION": "2"</code></p></li></ul><p>You can specify a version of Python support for development endpoints by using the <code>Arguments</code> parameter in the <code>CreateDevEndpoint</code> or <code>UpdateDevEndpoint</code> APIs. If no arguments are provided, the version defaults to Python 2.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable arguments;

/**
 <p>The AWS Availability Zone where this <code>DevEndpoint</code> is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The point in time at which this <code>DevEndpoint</code> was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>The name assigned to the new <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

/**
 <p>Path to one or more Java <code>.jar</code> files in an S3 bucket that will be loaded in your <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable extraJarsS3Path;

/**
 <p>The paths to one or more Python libraries in an S3 bucket that will be loaded in your <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable extraPythonLibsS3Path;

/**
 <p>The reason for a current failure in this <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>Glue version determines the versions of Apache Spark and Python that AWS Glue supports. The Python version indicates the version supported for running your ETL scripts on development endpoints. </p>
 */
@property (nonatomic, strong) NSString * _Nullable glueVersion;

/**
 <p>The number of AWS Glue Data Processing Units (DPUs) allocated to this DevEndpoint.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfNodes;

/**
 <p>The number of workers of a defined <code>workerType</code> that are allocated to the development endpoint.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfWorkers;

/**
 <p>The Amazon Resource Name (ARN) of the role assigned to the new <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The name of the <code>SecurityConfiguration</code> structure being used with this <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityConfiguration;

/**
 <p>The security groups assigned to the new <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>The current status of the new <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The subnet ID assigned to the new <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>The ID of the virtual private cloud (VPC) used by this <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

/**
 <p>The type of predefined worker that is allocated to the development endpoint. May be a value of Standard, G.1X, or G.2X.</p>
 */
@property (nonatomic, assign) AWSGlueWorkerType workerType;

/**
 <p>The address of the YARN endpoint used by this <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable yarnEndpointAddress;

/**
 <p>The Apache Zeppelin port for the remote Apache Spark interpreter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable zeppelinRemoteSparkInterpreterPort;

@end

/**
 <p>Specifies a <code>grok</code> classifier for <code>CreateClassifier</code> to create.</p>
 Required parameters: [Classification, Name, GrokPattern]
 */
@interface AWSGlueCreateGrokClassifierRequest : AWSModel


/**
 <p>An identifier of the data format that the classifier matches, such as Twitter, JSON, Omniture logs, Amazon CloudWatch Logs, and so on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable classification;

/**
 <p>Optional custom grok patterns used by this classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customPatterns;

/**
 <p>The grok pattern used by this classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grokPattern;

/**
 <p>The name of the new classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueCreateJobRequest : AWSRequest


/**
 <p>This parameter is deprecated. Use <code>MaxCapacity</code> instead.</p><p>The number of AWS Glue data processing units (DPUs) to allocate to this Job. You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For more information, see the <a href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedCapacity;

/**
 <p>The <code>JobCommand</code> that executes this job.</p>
 */
@property (nonatomic, strong) AWSGlueJobCommand * _Nullable command;

/**
 <p>The connections used for this job.</p>
 */
@property (nonatomic, strong) AWSGlueConnectionsList * _Nullable connections;

/**
 <p>The default arguments for this job.</p><p>You can specify arguments here that your own job-execution script consumes, as well as arguments that AWS Glue itself consumes.</p><p>For information about how to specify and consume your own Job arguments, see the <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html">Calling AWS Glue APIs in Python</a> topic in the developer guide.</p><p>For information about the key-value pairs that AWS Glue consumes to set up your job, see the <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html">Special Parameters Used by AWS Glue</a> topic in the developer guide.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable defaultArguments;

/**
 <p>Description of the job being defined.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>An <code>ExecutionProperty</code> specifying the maximum number of concurrent runs allowed for this job.</p>
 */
@property (nonatomic, strong) AWSGlueExecutionProperty * _Nullable executionProperty;

/**
 <p>Glue version determines the versions of Apache Spark and Python that AWS Glue supports. The Python version indicates the version supported for jobs of type Spark. </p><p>For more information about the available AWS Glue versions and corresponding Spark and Python versions, see <a href="https://docs.aws.amazon.com/glue/latest/dg/add-job.html">Glue version</a> in the developer guide.</p><p>Jobs that are created without specifying a Glue version default to Glue 0.9.</p>
 */
@property (nonatomic, strong) NSString * _Nullable glueVersion;

/**
 <p>This field is reserved for future use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logUri;

/**
 <p>The number of AWS Glue data processing units (DPUs) that can be allocated when this job runs. A DPU is a relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For more information, see the <a href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>.</p><p>Do not set <code>Max Capacity</code> if using <code>WorkerType</code> and <code>NumberOfWorkers</code>.</p><p>The value that can be allocated for <code>MaxCapacity</code> depends on whether you are running a Python shell job or an Apache Spark ETL job:</p><ul><li><p>When you specify a Python shell job (<code>JobCommand.Name</code>="pythonshell"), you can allocate either 0.0625 or 1 DPU. The default is 0.0625 DPU.</p></li><li><p>When you specify an Apache Spark ETL job (<code>JobCommand.Name</code>="glueetl"), you can allocate from 2 to 100 DPUs. The default is 10 DPUs. This job type cannot have a fractional DPU allocation.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCapacity;

/**
 <p>The maximum number of times to retry this job if it fails.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRetries;

/**
 <p>The name you assign to this job definition. It must be unique in your account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Non-overridable arguments for this job, specified as name-value pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable nonOverridableArguments;

/**
 <p>Specifies configuration properties of a job notification.</p>
 */
@property (nonatomic, strong) AWSGlueNotificationProperty * _Nullable notificationProperty;

/**
 <p>The number of workers of a defined <code>workerType</code> that are allocated when a job runs.</p><p>The maximum number of workers you can define are 299 for <code>G.1X</code>, and 149 for <code>G.2X</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfWorkers;

/**
 <p>The name or Amazon Resource Name (ARN) of the IAM role associated with this job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>The name of the <code>SecurityConfiguration</code> structure to be used with this job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityConfiguration;

/**
 <p>The tags to use with this job. You may use tags to limit access to the job. For more information about tags in AWS Glue, see <a href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">AWS Tags in AWS Glue</a> in the developer guide.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The job timeout in minutes. This is the maximum time that a job run can consume resources before it is terminated and enters <code>TIMEOUT</code> status. The default is 2,880 minutes (48 hours).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

/**
 <p>The type of predefined worker that is allocated when a job runs. Accepts a value of Standard, G.1X, or G.2X.</p><ul><li><p>For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16 GB of memory and a 50GB disk, and 2 executors per worker.</p></li><li><p>For the <code>G.1X</code> worker type, each worker maps to 1 DPU (4 vCPU, 16 GB of memory, 64 GB disk), and provides 1 executor per worker. We recommend this worker type for memory-intensive jobs.</p></li><li><p>For the <code>G.2X</code> worker type, each worker maps to 2 DPU (8 vCPU, 32 GB of memory, 128 GB disk), and provides 1 executor per worker. We recommend this worker type for memory-intensive jobs.</p></li></ul>
 */
@property (nonatomic, assign) AWSGlueWorkerType workerType;

@end

/**
 
 */
@interface AWSGlueCreateJobResponse : AWSModel


/**
 <p>The unique name that was provided for this job definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Specifies a JSON classifier for <code>CreateClassifier</code> to create.</p>
 Required parameters: [Name, JsonPath]
 */
@interface AWSGlueCreateJsonClassifierRequest : AWSModel


/**
 <p>A <code>JsonPath</code> string defining the JSON data for the classifier to classify. AWS Glue supports a subset of <code>JsonPath</code>, as described in <a href="https://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html#custom-classifier-json">Writing JsonPath Custom Classifiers</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jsonPath;

/**
 <p>The name of the classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueCreateMLTransformRequest : AWSRequest


/**
 <p>A description of the machine learning transform that is being defined. The default is an empty string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>This value determines which version of AWS Glue this machine learning transform is compatible with. Glue 1.0 is recommended for most customers. If the value is not set, the Glue compatibility defaults to Glue 0.9. For more information, see <a href="https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions">AWS Glue Versions</a> in the developer guide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable glueVersion;

/**
 <p>A list of AWS Glue table definitions used by the transform.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueGlueTable *> * _Nullable inputRecordTables;

/**
 <p>The number of AWS Glue data processing units (DPUs) that are allocated to task runs for this transform. You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For more information, see the <a href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>. </p><p><code>MaxCapacity</code> is a mutually exclusive option with <code>NumberOfWorkers</code> and <code>WorkerType</code>.</p><ul><li><p>If either <code>NumberOfWorkers</code> or <code>WorkerType</code> is set, then <code>MaxCapacity</code> cannot be set.</p></li><li><p>If <code>MaxCapacity</code> is set then neither <code>NumberOfWorkers</code> or <code>WorkerType</code> can be set.</p></li><li><p>If <code>WorkerType</code> is set, then <code>NumberOfWorkers</code> is required (and vice versa).</p></li><li><p><code>MaxCapacity</code> and <code>NumberOfWorkers</code> must both be at least 1.</p></li></ul><p>When the <code>WorkerType</code> field is set to a value other than <code>Standard</code>, the <code>MaxCapacity</code> field is set automatically and becomes read-only.</p><p>When the <code>WorkerType</code> field is set to a value other than <code>Standard</code>, the <code>MaxCapacity</code> field is set automatically and becomes read-only.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCapacity;

/**
 <p>The maximum number of times to retry a task for this transform after a task run fails.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRetries;

/**
 <p>The unique name that you give the transform when you create it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The number of workers of a defined <code>workerType</code> that are allocated when this task runs.</p><p>If <code>WorkerType</code> is set, then <code>NumberOfWorkers</code> is required (and vice versa).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfWorkers;

/**
 <p>The algorithmic parameters that are specific to the transform type used. Conditionally dependent on the transform type.</p>
 */
@property (nonatomic, strong) AWSGlueTransformParameters * _Nullable parameters;

/**
 <p>The name or Amazon Resource Name (ARN) of the IAM role with the required permissions. The required permissions include both AWS Glue service role permissions to AWS Glue resources, and Amazon S3 permissions required by the transform. </p><ul><li><p>This role needs AWS Glue service role permissions to allow access to resources in AWS Glue. See <a href="https://docs.aws.amazon.com/glue/latest/dg/attach-policy-iam-user.html">Attach a Policy to IAM Users That Access AWS Glue</a>.</p></li><li><p>This role needs permission to your Amazon Simple Storage Service (Amazon S3) sources, targets, temporary directory, scripts, and any libraries used by the task run for this transform.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>The tags to use with this machine learning transform. You may use tags to limit access to the machine learning transform. For more information about tags in AWS Glue, see <a href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">AWS Tags in AWS Glue</a> in the developer guide.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The timeout of the task run for this transform in minutes. This is the maximum time that a task run for this transform can consume resources before it is terminated and enters <code>TIMEOUT</code> status. The default is 2,880 minutes (48 hours).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

/**
 <p>The type of predefined worker that is allocated when this task runs. Accepts a value of Standard, G.1X, or G.2X.</p><ul><li><p>For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16 GB of memory and a 50GB disk, and 2 executors per worker.</p></li><li><p>For the <code>G.1X</code> worker type, each worker provides 4 vCPU, 16 GB of memory and a 64GB disk, and 1 executor per worker.</p></li><li><p>For the <code>G.2X</code> worker type, each worker provides 8 vCPU, 32 GB of memory and a 128GB disk, and 1 executor per worker.</p></li></ul><p><code>MaxCapacity</code> is a mutually exclusive option with <code>NumberOfWorkers</code> and <code>WorkerType</code>.</p><ul><li><p>If either <code>NumberOfWorkers</code> or <code>WorkerType</code> is set, then <code>MaxCapacity</code> cannot be set.</p></li><li><p>If <code>MaxCapacity</code> is set then neither <code>NumberOfWorkers</code> or <code>WorkerType</code> can be set.</p></li><li><p>If <code>WorkerType</code> is set, then <code>NumberOfWorkers</code> is required (and vice versa).</p></li><li><p><code>MaxCapacity</code> and <code>NumberOfWorkers</code> must both be at least 1.</p></li></ul>
 */
@property (nonatomic, assign) AWSGlueWorkerType workerType;

@end

/**
 
 */
@interface AWSGlueCreateMLTransformResponse : AWSModel


/**
 <p>A unique identifier that is generated for the transform.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 
 */
@interface AWSGlueCreatePartitionRequest : AWSRequest


/**
 <p>The AWS account ID of the catalog in which the partition is to be created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the metadata database in which the partition is to be created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>A <code>PartitionInput</code> structure defining the partition to be created.</p>
 */
@property (nonatomic, strong) AWSGluePartitionInput * _Nullable partitionInput;

/**
 <p>The name of the metadata table in which the partition is to be created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSGlueCreatePartitionResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueCreateScriptRequest : AWSRequest


/**
 <p>A list of the edges in the DAG.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueCodeGenEdge *> * _Nullable dagEdges;

/**
 <p>A list of the nodes in the DAG.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueCodeGenNode *> * _Nullable dagNodes;

/**
 <p>The programming language of the resulting code from the DAG.</p>
 */
@property (nonatomic, assign) AWSGlueLanguage language;

@end

/**
 
 */
@interface AWSGlueCreateScriptResponse : AWSModel


/**
 <p>The Python script generated from the DAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pythonScript;

/**
 <p>The Scala code generated from the DAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scalaCode;

@end

/**
 
 */
@interface AWSGlueCreateSecurityConfigurationRequest : AWSRequest


/**
 <p>The encryption configuration for the new security configuration.</p>
 */
@property (nonatomic, strong) AWSGlueEncryptionConfiguration * _Nullable encryptionConfiguration;

/**
 <p>The name for the new security configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueCreateSecurityConfigurationResponse : AWSModel


/**
 <p>The time at which the new security configuration was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>The name assigned to the new security configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueCreateTableRequest : AWSRequest


/**
 <p>The ID of the Data Catalog in which to create the <code>Table</code>. If none is supplied, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The catalog database in which to create the new table. For Hive compatibility, this name is entirely lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The <code>TableInput</code> object that defines the metadata table to create in the catalog.</p>
 */
@property (nonatomic, strong) AWSGlueTableInput * _Nullable tableInput;

@end

/**
 
 */
@interface AWSGlueCreateTableResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueCreateTriggerRequest : AWSRequest


/**
 <p>The actions initiated by this trigger when it fires.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueAction *> * _Nullable actions;

/**
 <p>A description of the new trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A predicate to specify when the new trigger should fire.</p><p>This field is required when the trigger type is <code>CONDITIONAL</code>.</p>
 */
@property (nonatomic, strong) AWSGluePredicate * _Nullable predicate;

/**
 <p>A <code>cron</code> expression used to specify the schedule (see <a href="https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based Schedules for Jobs and Crawlers</a>. For example, to run something every day at 12:15 UTC, you would specify: <code>cron(15 12 * * ? *)</code>.</p><p>This field is required when the trigger type is SCHEDULED.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

/**
 <p>Set to <code>true</code> to start <code>SCHEDULED</code> and <code>CONDITIONAL</code> triggers when created. True is not supported for <code>ON_DEMAND</code> triggers.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startOnCreation;

/**
 <p>The tags to use with this trigger. You may use tags to limit access to the trigger. For more information about tags in AWS Glue, see <a href="https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html">AWS Tags in AWS Glue</a> in the developer guide. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of the new trigger.</p>
 */
@property (nonatomic, assign) AWSGlueTriggerType types;

/**
 <p>The name of the workflow associated with the trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workflowName;

@end

/**
 
 */
@interface AWSGlueCreateTriggerResponse : AWSModel


/**
 <p>The name of the trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueCreateUserDefinedFunctionRequest : AWSRequest


/**
 <p>The ID of the Data Catalog in which to create the function. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the catalog database in which to create the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>A <code>FunctionInput</code> object that defines the function to create in the Data Catalog.</p>
 */
@property (nonatomic, strong) AWSGlueUserDefinedFunctionInput * _Nullable functionInput;

@end

/**
 
 */
@interface AWSGlueCreateUserDefinedFunctionResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueCreateWorkflowRequest : AWSRequest


/**
 <p>A collection of properties to be used as part of each execution of the workflow.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable defaultRunProperties;

/**
 <p>A description of the workflow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name to be assigned to the workflow. It should be unique within your account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The tags to be used with this workflow.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSGlueCreateWorkflowResponse : AWSModel


/**
 <p>The name of the workflow which was provided as part of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Specifies an XML classifier for <code>CreateClassifier</code> to create.</p>
 Required parameters: [Classification, Name]
 */
@interface AWSGlueCreateXMLClassifierRequest : AWSModel


/**
 <p>An identifier of the data format that the classifier matches.</p>
 */
@property (nonatomic, strong) NSString * _Nullable classification;

/**
 <p>The name of the classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The XML tag designating the element that contains each record in an XML document being parsed. This can't identify a self-closing element (closed by <code>/&gt;</code>). An empty row element that contains only attributes can be parsed as long as it ends with a closing tag (for example, <code>&lt;row item_a="A" item_b="B"&gt;&lt;/row&gt;</code> is okay, but <code>&lt;row item_a="A" item_b="B" /&gt;</code> is not).</p>
 */
@property (nonatomic, strong) NSString * _Nullable rowTag;

@end

/**
 <p>A classifier for custom <code>CSV</code> content.</p>
 Required parameters: [Name]
 */
@interface AWSGlueCsvClassifier : AWSModel


/**
 <p>Enables the processing of files that contain only one column.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowSingleColumn;

/**
 <p>Indicates whether the CSV file contains a header.</p>
 */
@property (nonatomic, assign) AWSGlueCsvHeaderOption containsHeader;

/**
 <p>The time that this classifier was registered.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>A custom symbol to denote what separates each column entry in the row.</p>
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 <p>Specifies not to trim values before identifying the type of column values. The default value is <code>true</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableValueTrimming;

/**
 <p>A list of strings representing column names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable header;

/**
 <p>The time that this classifier was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdated;

/**
 <p>The name of the classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A custom symbol to denote what combines content into a single column value. It must be different from the column delimiter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable quoteSymbol;

/**
 <p>The version of this classifier.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>Contains configuration information for maintaining Data Catalog security.</p>
 */
@interface AWSGlueDataCatalogEncryptionSettings : AWSModel


/**
 <p>When connection password protection is enabled, the Data Catalog uses a customer-provided key to encrypt the password as part of <code>CreateConnection</code> or <code>UpdateConnection</code> and store it in the <code>ENCRYPTED_PASSWORD</code> field in the connection properties. You can enable catalog encryption or only password encryption.</p>
 */
@property (nonatomic, strong) AWSGlueConnectionPasswordEncryption * _Nullable connectionPasswordEncryption;

/**
 <p>Specifies the encryption-at-rest configuration for the Data Catalog.</p>
 */
@property (nonatomic, strong) AWSGlueEncryptionAtRest * _Nullable encryptionAtRest;

@end

/**
 <p>The AWS Lake Formation principal.</p>
 */
@interface AWSGlueDataLakePrincipal : AWSModel


/**
 <p>An identifier for the AWS Lake Formation principal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataLakePrincipalIdentifier;

@end

/**
 <p>The <code>Database</code> object represents a logical grouping of tables that might reside in a Hive metastore or an RDBMS.</p>
 Required parameters: [Name]
 */
@interface AWSGlueDatabase : AWSModel


/**
 <p>Creates a set of default permissions on the table for principals. </p>
 */
@property (nonatomic, strong) NSArray<AWSGluePrincipalPermissions *> * _Nullable createTableDefaultPermissions;

/**
 <p>The time at which the metadata database was created in the catalog.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>A description of the database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The location of the database (for example, an HDFS path).</p>
 */
@property (nonatomic, strong) NSString * _Nullable locationUri;

/**
 <p>The name of the database. For Hive compatibility, this is folded to lowercase when it is stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>These key-value pairs define parameters and properties of the database.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable parameters;

@end

/**
 <p>The structure used to create or update a database.</p>
 Required parameters: [Name]
 */
@interface AWSGlueDatabaseInput : AWSModel


/**
 <p>Creates a set of default permissions on the table for principals. </p>
 */
@property (nonatomic, strong) NSArray<AWSGluePrincipalPermissions *> * _Nullable createTableDefaultPermissions;

/**
 <p>A description of the database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The location of the database (for example, an HDFS path). </p>
 */
@property (nonatomic, strong) NSString * _Nullable locationUri;

/**
 <p>The name of the database. For Hive compatibility, this is folded to lowercase when it is stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>These key-value pairs define parameters and properties of the database.</p><p>These key-value pairs define parameters and properties of the database.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable parameters;

@end

/**
 
 */
@interface AWSGlueDeleteClassifierRequest : AWSRequest


/**
 <p>Name of the classifier to remove.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueDeleteClassifierResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueDeleteConnectionRequest : AWSRequest


/**
 <p>The ID of the Data Catalog in which the connection resides. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the connection to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionName;

@end

/**
 
 */
@interface AWSGlueDeleteConnectionResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueDeleteCrawlerRequest : AWSRequest


/**
 <p>The name of the crawler to remove.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueDeleteCrawlerResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueDeleteDatabaseRequest : AWSRequest


/**
 <p>The ID of the Data Catalog in which the database resides. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the database to delete. For Hive compatibility, this must be all lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueDeleteDatabaseResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueDeleteDevEndpointRequest : AWSRequest


/**
 <p>The name of the <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

@end

/**
 
 */
@interface AWSGlueDeleteDevEndpointResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueDeleteJobRequest : AWSRequest


/**
 <p>The name of the job definition to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

@end

/**
 
 */
@interface AWSGlueDeleteJobResponse : AWSModel


/**
 <p>The name of the job definition that was deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

@end

/**
 
 */
@interface AWSGlueDeleteMLTransformRequest : AWSRequest


/**
 <p>The unique identifier of the transform to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 
 */
@interface AWSGlueDeleteMLTransformResponse : AWSModel


/**
 <p>The unique identifier of the transform that was deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 
 */
@interface AWSGlueDeletePartitionRequest : AWSRequest


/**
 <p>The ID of the Data Catalog where the partition to be deleted resides. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the catalog database in which the table in question resides.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The values that define the partition.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable partitionValues;

/**
 <p>The name of the table that contains the partition to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSGlueDeletePartitionResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueDeleteResourcePolicyRequest : AWSRequest


/**
 <p>The hash value returned when this policy was set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyHashCondition;

@end

/**
 
 */
@interface AWSGlueDeleteResourcePolicyResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueDeleteSecurityConfigurationRequest : AWSRequest


/**
 <p>The name of the security configuration to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueDeleteSecurityConfigurationResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueDeleteTableRequest : AWSRequest


/**
 <p>The ID of the Data Catalog where the table resides. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the catalog database in which the table resides. For Hive compatibility, this name is entirely lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The name of the table to be deleted. For Hive compatibility, this name is entirely lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueDeleteTableResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueDeleteTableVersionRequest : AWSRequest


/**
 <p>The ID of the Data Catalog where the tables reside. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The database in the catalog in which the table resides. For Hive compatibility, this name is entirely lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The name of the table. For Hive compatibility, this name is entirely lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

/**
 <p>The ID of the table version to be deleted. A <code>VersionID</code> is a string representation of an integer. Each version is incremented by 1.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSGlueDeleteTableVersionResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueDeleteTriggerRequest : AWSRequest


/**
 <p>The name of the trigger to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueDeleteTriggerResponse : AWSModel


/**
 <p>The name of the trigger that was deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueDeleteUserDefinedFunctionRequest : AWSRequest


/**
 <p>The ID of the Data Catalog where the function to be deleted is located. If none is supplied, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the catalog database where the function is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The name of the function definition to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

@end

/**
 
 */
@interface AWSGlueDeleteUserDefinedFunctionResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueDeleteWorkflowRequest : AWSRequest


/**
 <p>Name of the workflow to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueDeleteWorkflowResponse : AWSModel


/**
 <p>Name of the workflow specified in input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>A development endpoint where a developer can remotely debug extract, transform, and load (ETL) scripts.</p>
 */
@interface AWSGlueDevEndpoint : AWSModel


/**
 <p>A map of arguments used to configure the <code>DevEndpoint</code>.</p><p>Valid arguments are:</p><ul><li><p><code>"--enable-glue-datacatalog": ""</code></p></li><li><p><code>"GLUE_PYTHON_VERSION": "3"</code></p></li><li><p><code>"GLUE_PYTHON_VERSION": "2"</code></p></li></ul><p>You can specify a version of Python support for development endpoints by using the <code>Arguments</code> parameter in the <code>CreateDevEndpoint</code> or <code>UpdateDevEndpoint</code> APIs. If no arguments are provided, the version defaults to Python 2.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable arguments;

/**
 <p>The AWS Availability Zone where this <code>DevEndpoint</code> is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The point in time at which this DevEndpoint was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimestamp;

/**
 <p>The name of the <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

/**
 <p>The path to one or more Java <code>.jar</code> files in an S3 bucket that should be loaded in your <code>DevEndpoint</code>.</p><note><p>You can only use pure Java/Scala libraries with a <code>DevEndpoint</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable extraJarsS3Path;

/**
 <p>The paths to one or more Python libraries in an Amazon S3 bucket that should be loaded in your <code>DevEndpoint</code>. Multiple values must be complete paths separated by a comma.</p><note><p>You can only use pure Python libraries with a <code>DevEndpoint</code>. Libraries that rely on C extensions, such as the <a href="http://pandas.pydata.org/">pandas</a> Python data analysis library, are not currently supported.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable extraPythonLibsS3Path;

/**
 <p>The reason for a current failure in this <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>Glue version determines the versions of Apache Spark and Python that AWS Glue supports. The Python version indicates the version supported for running your ETL scripts on development endpoints. </p><p>For more information about the available AWS Glue versions and corresponding Spark and Python versions, see <a href="https://docs.aws.amazon.com/glue/latest/dg/add-job.html">Glue version</a> in the developer guide.</p><p>Development endpoints that are created without specifying a Glue version default to Glue 0.9.</p><p>You can specify a version of Python support for development endpoints by using the <code>Arguments</code> parameter in the <code>CreateDevEndpoint</code> or <code>UpdateDevEndpoint</code> APIs. If no arguments are provided, the version defaults to Python 2.</p>
 */
@property (nonatomic, strong) NSString * _Nullable glueVersion;

/**
 <p>The point in time at which this <code>DevEndpoint</code> was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimestamp;

/**
 <p>The status of the last update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastUpdateStatus;

/**
 <p>The number of AWS Glue Data Processing Units (DPUs) allocated to this <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfNodes;

/**
 <p>The number of workers of a defined <code>workerType</code> that are allocated to the development endpoint.</p><p>The maximum number of workers you can define are 299 for <code>G.1X</code>, and 149 for <code>G.2X</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfWorkers;

/**
 <p>A private IP address to access the <code>DevEndpoint</code> within a VPC if the <code>DevEndpoint</code> is created within one. The <code>PrivateAddress</code> field is present only when you create the <code>DevEndpoint</code> within your VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateAddress;

/**
 <p>The public IP address used by this <code>DevEndpoint</code>. The <code>PublicAddress</code> field is present only when you create a non-virtual private cloud (VPC) <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicAddress;

/**
 <p>The public key to be used by this <code>DevEndpoint</code> for authentication. This attribute is provided for backward compatibility because the recommended attribute to use is public keys.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicKey;

/**
 <p>A list of public keys to be used by the <code>DevEndpoints</code> for authentication. Using this attribute is preferred over a single public key because the public keys allow you to have a different private key per client.</p><note><p>If you previously created an endpoint with a public key, you must remove that key to be able to set a list of public keys. Call the <code>UpdateDevEndpoint</code> API operation with the public key content in the <code>deletePublicKeys</code> attribute, and the list of new keys in the <code>addPublicKeys</code> attribute.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable publicKeys;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role used in this <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The name of the <code>SecurityConfiguration</code> structure to be used with this <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityConfiguration;

/**
 <p>A list of security group identifiers used in this <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>The current status of this <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The subnet ID for this <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>The ID of the virtual private cloud (VPC) used by this <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

/**
 <p>The type of predefined worker that is allocated to the development endpoint. Accepts a value of Standard, G.1X, or G.2X.</p><ul><li><p>For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16 GB of memory and a 50GB disk, and 2 executors per worker.</p></li><li><p>For the <code>G.1X</code> worker type, each worker maps to 1 DPU (4 vCPU, 16 GB of memory, 64 GB disk), and provides 1 executor per worker. We recommend this worker type for memory-intensive jobs.</p></li><li><p>For the <code>G.2X</code> worker type, each worker maps to 2 DPU (8 vCPU, 32 GB of memory, 128 GB disk), and provides 1 executor per worker. We recommend this worker type for memory-intensive jobs.</p></li></ul><p>Known issue: when a development endpoint is created with the <code>G.2X</code><code>WorkerType</code> configuration, the Spark drivers for the development endpoint will run on 4 vCPU, 16 GB of memory, and a 64 GB disk. </p>
 */
@property (nonatomic, assign) AWSGlueWorkerType workerType;

/**
 <p>The YARN endpoint address used by this <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable yarnEndpointAddress;

/**
 <p>The Apache Zeppelin port for the remote Apache Spark interpreter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable zeppelinRemoteSparkInterpreterPort;

@end

/**
 <p>Custom libraries to be loaded into a development endpoint.</p>
 */
@interface AWSGlueDevEndpointCustomLibraries : AWSModel


/**
 <p>The path to one or more Java <code>.jar</code> files in an S3 bucket that should be loaded in your <code>DevEndpoint</code>.</p><note><p>You can only use pure Java/Scala libraries with a <code>DevEndpoint</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable extraJarsS3Path;

/**
 <p>The paths to one or more Python libraries in an Amazon Simple Storage Service (Amazon S3) bucket that should be loaded in your <code>DevEndpoint</code>. Multiple values must be complete paths separated by a comma.</p><note><p>You can only use pure Python libraries with a <code>DevEndpoint</code>. Libraries that rely on C extensions, such as the <a href="http://pandas.pydata.org/">pandas</a> Python data analysis library, are not currently supported.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable extraPythonLibsS3Path;

@end

/**
 <p>Specifies an Amazon DynamoDB table to crawl.</p>
 */
@interface AWSGlueDynamoDBTarget : AWSModel


/**
 <p>The name of the DynamoDB table to crawl.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

@end

/**
 <p>An edge represents a directed connection between two AWS Glue components which are part of the workflow the edge belongs to.</p>
 */
@interface AWSGlueEdge : AWSModel


/**
 <p>The unique of the node within the workflow where the edge ends.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationId;

/**
 <p>The unique of the node within the workflow where the edge starts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceId;

@end

/**
 <p>Specifies the encryption-at-rest configuration for the Data Catalog.</p>
 Required parameters: [CatalogEncryptionMode]
 */
@interface AWSGlueEncryptionAtRest : AWSModel


/**
 <p>The encryption-at-rest mode for encrypting Data Catalog data.</p>
 */
@property (nonatomic, assign) AWSGlueCatalogEncryptionMode catalogEncryptionMode;

/**
 <p>The ID of the AWS KMS key to use for encryption at rest.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sseAwsKmsKeyId;

@end

/**
 <p>Specifies an encryption configuration.</p>
 */
@interface AWSGlueEncryptionConfiguration : AWSModel


/**
 <p>The encryption configuration for Amazon CloudWatch.</p>
 */
@property (nonatomic, strong) AWSGlueCloudWatchEncryption * _Nullable cloudWatchEncryption;

/**
 <p>The encryption configuration for job bookmarks.</p>
 */
@property (nonatomic, strong) AWSGlueJobBookmarksEncryption * _Nullable jobBookmarksEncryption;

/**
 <p>The encryption configuration for Amazon Simple Storage Service (Amazon S3) data.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueS3Encryption *> * _Nullable s3Encryption;

@end

/**
 <p>Contains details about an error.</p>
 */
@interface AWSGlueErrorDetail : AWSModel


/**
 <p>The code associated with this error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>A message describing the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

@end

/**
 <p>Evaluation metrics provide an estimate of the quality of your machine learning transform.</p>
 Required parameters: [TransformType]
 */
@interface AWSGlueEvaluationMetrics : AWSModel


/**
 <p>The evaluation metrics for the find matches algorithm.</p>
 */
@property (nonatomic, strong) AWSGlueFindMatchesMetrics * _Nullable findMatchesMetrics;

/**
 <p>The type of machine learning transform.</p>
 */
@property (nonatomic, assign) AWSGlueTransformType transformType;

@end

/**
 <p>An execution property of a job.</p>
 */
@interface AWSGlueExecutionProperty : AWSModel


/**
 <p>The maximum number of concurrent runs allowed for the job. The default is 1. An error is returned when this threshold is reached. The maximum value you can specify is controlled by a service limit.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxConcurrentRuns;

@end

/**
 <p>Specifies configuration properties for an exporting labels task run.</p>
 */
@interface AWSGlueExportLabelsTaskRunProperties : AWSModel


/**
 <p>The Amazon Simple Storage Service (Amazon S3) path where you will export the labels.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3Path;

@end

/**
 <p>The evaluation metrics for the find matches algorithm. The quality of your machine learning transform is measured by getting your transform to predict some matches and comparing the results to known matches from the same dataset. The quality metrics are based on a subset of your data, so they are not precise.</p>
 */
@interface AWSGlueFindMatchesMetrics : AWSModel


/**
 <p>The area under the precision/recall curve (AUPRC) is a single number measuring the overall quality of the transform, that is independent of the choice made for precision vs. recall. Higher values indicate that you have a more attractive precision vs. recall tradeoff.</p><p>For more information, see <a href="https://en.wikipedia.org/wiki/Precision_and_recall">Precision and recall</a> in Wikipedia.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable areaUnderPRCurve;

/**
 <p>The confusion matrix shows you what your transform is predicting accurately and what types of errors it is making.</p><p>For more information, see <a href="https://en.wikipedia.org/wiki/Confusion_matrix">Confusion matrix</a> in Wikipedia.</p>
 */
@property (nonatomic, strong) AWSGlueConfusionMatrix * _Nullable confusionMatrix;

/**
 <p>The maximum F1 metric indicates the transform's accuracy between 0 and 1, where 1 is the best accuracy.</p><p>For more information, see <a href="https://en.wikipedia.org/wiki/F1_score">F1 score</a> in Wikipedia.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable f1;

/**
 <p>The precision metric indicates when often your transform is correct when it predicts a match. Specifically, it measures how well the transform finds true positives from the total true positives possible.</p><p>For more information, see <a href="https://en.wikipedia.org/wiki/Precision_and_recall">Precision and recall</a> in Wikipedia.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable precision;

/**
 <p>The recall metric indicates that for an actual match, how often your transform predicts the match. Specifically, it measures how well the transform finds true positives from the total records in the source data.</p><p>For more information, see <a href="https://en.wikipedia.org/wiki/Precision_and_recall">Precision and recall</a> in Wikipedia.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recall;

@end

/**
 <p>The parameters to configure the find matches transform.</p>
 */
@interface AWSGlueFindMatchesParameters : AWSModel


/**
 <p>The value that is selected when tuning your transform for a balance between accuracy and cost. A value of 0.5 means that the system balances accuracy and cost concerns. A value of 1.0 means a bias purely for accuracy, which typically results in a higher cost, sometimes substantially higher. A value of 0.0 means a bias purely for cost, which results in a less accurate <code>FindMatches</code> transform, sometimes with unacceptable accuracy.</p><p>Accuracy measures how well the transform finds true positives and true negatives. Increasing accuracy requires more machine resources and cost. But it also results in increased recall. </p><p>Cost measures how many compute resources, and thus money, are consumed to run the transform.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable accuracyCostTradeoff;

/**
 <p>The value to switch on or off to force the output to match the provided labels from users. If the value is <code>True</code>, the <code>find matches</code> transform forces the output to match the provided labels. The results override the normal conflation results. If the value is <code>False</code>, the <code>find matches</code> transform does not ensure all the labels provided are respected, and the results rely on the trained model.</p><p>Note that setting this value to true may increase the conflation execution time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enforceProvidedLabels;

/**
 <p>The value selected when tuning your transform for a balance between precision and recall. A value of 0.5 means no preference; a value of 1.0 means a bias purely for precision, and a value of 0.0 means a bias for recall. Because this is a tradeoff, choosing values close to 1.0 means very low recall, and choosing values close to 0.0 results in very low precision.</p><p>The precision metric indicates how often your model is correct when it predicts a match. </p><p>The recall metric indicates that for an actual match, how often your model predicts the match.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable precisionRecallTradeoff;

/**
 <p>The name of a column that uniquely identifies rows in the source table. Used to help identify matching records.</p>
 */
@property (nonatomic, strong) NSString * _Nullable primaryKeyColumnName;

@end

/**
 <p>Specifies configuration properties for a Find Matches task run.</p>
 */
@interface AWSGlueFindMatchesTaskRunProperties : AWSModel


/**
 <p>The job ID for the Find Matches task run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The name assigned to the job for the Find Matches task run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The job run ID for the Find Matches task run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobRunId;

@end

/**
 
 */
@interface AWSGlueGetCatalogImportStatusRequest : AWSRequest


/**
 <p>The ID of the catalog to migrate. Currently, this should be the AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

@end

/**
 
 */
@interface AWSGlueGetCatalogImportStatusResponse : AWSModel


/**
 <p>The status of the specified catalog migration.</p>
 */
@property (nonatomic, strong) AWSGlueCatalogImportStatus * _Nullable importStatus;

@end

/**
 
 */
@interface AWSGlueGetClassifierRequest : AWSRequest


/**
 <p>Name of the classifier to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueGetClassifierResponse : AWSModel


/**
 <p>The requested classifier.</p>
 */
@property (nonatomic, strong) AWSGlueClassifier * _Nullable classifier;

@end

/**
 
 */
@interface AWSGlueGetClassifiersRequest : AWSRequest


/**
 <p>The size of the list to return (optional).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An optional continuation token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueGetClassifiersResponse : AWSModel


/**
 <p>The requested list of classifier objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueClassifier *> * _Nullable classifiers;

/**
 <p>A continuation token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueGetConnectionRequest : AWSRequest


/**
 <p>The ID of the Data Catalog in which the connection resides. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>Allows you to retrieve the connection metadata without returning the password. For instance, the AWS Glue console uses this flag to retrieve the connection, and does not display the password. Set this parameter when the caller might not have permission to use the AWS KMS key to decrypt the password, but it does have permission to access the rest of the connection properties.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hidePassword;

/**
 <p>The name of the connection definition to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueGetConnectionResponse : AWSModel


/**
 <p>The requested connection definition.</p>
 */
@property (nonatomic, strong) AWSGlueConnection * _Nullable connection;

@end

/**
 <p>Filters the connection definitions that are returned by the <code>GetConnections</code> API operation.</p>
 */
@interface AWSGlueGetConnectionsFilter : AWSModel


/**
 <p>The type of connections to return. Currently, only JDBC is supported; SFTP is not supported.</p>
 */
@property (nonatomic, assign) AWSGlueConnectionType connectionType;

/**
 <p>A criteria string that must match the criteria recorded in the connection definition for that connection definition to be returned.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable matchCriteria;

@end

/**
 
 */
@interface AWSGlueGetConnectionsRequest : AWSRequest


/**
 <p>The ID of the Data Catalog in which the connections reside. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>A filter that controls which connections are returned.</p>
 */
@property (nonatomic, strong) AWSGlueGetConnectionsFilter * _Nullable filter;

/**
 <p>Allows you to retrieve the connection metadata without returning the password. For instance, the AWS Glue console uses this flag to retrieve the connection, and does not display the password. Set this parameter when the caller might not have permission to use the AWS KMS key to decrypt the password, but it does have permission to access the rest of the connection properties.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hidePassword;

/**
 <p>The maximum number of connections to return in one response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token, if this is a continuation call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueGetConnectionsResponse : AWSModel


/**
 <p>A list of requested connection definitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueConnection *> * _Nullable connectionList;

/**
 <p>A continuation token, if the list of connections returned does not include the last of the filtered connections.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueGetCrawlerMetricsRequest : AWSRequest


/**
 <p>A list of the names of crawlers about which to retrieve metrics.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable crawlerNameList;

/**
 <p>The maximum size of a list to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token, if this is a continuation call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueGetCrawlerMetricsResponse : AWSModel


/**
 <p>A list of metrics for the specified crawler.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueCrawlerMetrics *> * _Nullable crawlerMetricsList;

/**
 <p>A continuation token, if the returned list does not contain the last metric available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueGetCrawlerRequest : AWSRequest


/**
 <p>The name of the crawler to retrieve metadata for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueGetCrawlerResponse : AWSModel


/**
 <p>The metadata for the specified crawler.</p>
 */
@property (nonatomic, strong) AWSGlueCrawler * _Nullable crawler;

@end

/**
 
 */
@interface AWSGlueGetCrawlersRequest : AWSRequest


/**
 <p>The number of crawlers to return on each call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token, if this is a continuation request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueGetCrawlersResponse : AWSModel


/**
 <p>A list of crawler metadata.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueCrawler *> * _Nullable crawlers;

/**
 <p>A continuation token, if the returned list has not reached the end of those defined in this customer account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueGetDataCatalogEncryptionSettingsRequest : AWSRequest


/**
 <p>The ID of the Data Catalog to retrieve the security configuration for. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

@end

/**
 
 */
@interface AWSGlueGetDataCatalogEncryptionSettingsResponse : AWSModel


/**
 <p>The requested security configuration.</p>
 */
@property (nonatomic, strong) AWSGlueDataCatalogEncryptionSettings * _Nullable dataCatalogEncryptionSettings;

@end

/**
 
 */
@interface AWSGlueGetDatabaseRequest : AWSRequest


/**
 <p>The ID of the Data Catalog in which the database resides. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the database to retrieve. For Hive compatibility, this should be all lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueGetDatabaseResponse : AWSModel


/**
 <p>The definition of the specified database in the Data Catalog.</p>
 */
@property (nonatomic, strong) AWSGlueDatabase * _Nullable database;

@end

/**
 
 */
@interface AWSGlueGetDatabasesRequest : AWSRequest


/**
 <p>The ID of the Data Catalog from which to retrieve <code>Databases</code>. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The maximum number of databases to return in one response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token, if this is a continuation call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueGetDatabasesResponse : AWSModel


/**
 <p>A list of <code>Database</code> objects from the specified catalog.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueDatabase *> * _Nullable databaseList;

/**
 <p>A continuation token for paginating the returned list of tokens, returned if the current segment of the list is not the last.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueGetDataflowGraphRequest : AWSRequest


/**
 <p>The Python script to transform.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pythonScript;

@end

/**
 
 */
@interface AWSGlueGetDataflowGraphResponse : AWSModel


/**
 <p>A list of the edges in the resulting DAG.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueCodeGenEdge *> * _Nullable dagEdges;

/**
 <p>A list of the nodes in the resulting DAG.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueCodeGenNode *> * _Nullable dagNodes;

@end

/**
 
 */
@interface AWSGlueGetDevEndpointRequest : AWSRequest


/**
 <p>Name of the <code>DevEndpoint</code> to retrieve information for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

@end

/**
 
 */
@interface AWSGlueGetDevEndpointResponse : AWSModel


/**
 <p>A <code>DevEndpoint</code> definition.</p>
 */
@property (nonatomic, strong) AWSGlueDevEndpoint * _Nullable devEndpoint;

@end

/**
 
 */
@interface AWSGlueGetDevEndpointsRequest : AWSRequest


/**
 <p>The maximum size of information to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token, if this is a continuation call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueGetDevEndpointsResponse : AWSModel


/**
 <p>A list of <code>DevEndpoint</code> definitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueDevEndpoint *> * _Nullable devEndpoints;

/**
 <p>A continuation token, if not all <code>DevEndpoint</code> definitions have yet been returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueGetJobBookmarkRequest : AWSRequest


/**
 <p>The name of the job in question.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The unique run identifier associated with this job run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable runId;

@end

/**
 
 */
@interface AWSGlueGetJobBookmarkResponse : AWSModel


/**
 <p>A structure that defines a point that a job can resume processing.</p>
 */
@property (nonatomic, strong) AWSGlueJobBookmarkEntry * _Nullable jobBookmarkEntry;

@end

/**
 
 */
@interface AWSGlueGetJobRequest : AWSRequest


/**
 <p>The name of the job definition to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

@end

/**
 
 */
@interface AWSGlueGetJobResponse : AWSModel


/**
 <p>The requested job definition.</p>
 */
@property (nonatomic, strong) AWSGlueJob * _Nullable job;

@end

/**
 
 */
@interface AWSGlueGetJobRunRequest : AWSRequest


/**
 <p>Name of the job definition being run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>True if a list of predecessor runs should be returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable predecessorsIncluded;

/**
 <p>The ID of the job run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable runId;

@end

/**
 
 */
@interface AWSGlueGetJobRunResponse : AWSModel


/**
 <p>The requested job-run metadata.</p>
 */
@property (nonatomic, strong) AWSGlueJobRun * _Nullable jobRun;

@end

/**
 
 */
@interface AWSGlueGetJobRunsRequest : AWSRequest


/**
 <p>The name of the job definition for which to retrieve all job runs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The maximum size of the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token, if this is a continuation call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueGetJobRunsResponse : AWSModel


/**
 <p>A list of job-run metadata objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueJobRun *> * _Nullable jobRuns;

/**
 <p>A continuation token, if not all requested job runs have been returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueGetJobsRequest : AWSRequest


/**
 <p>The maximum size of the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token, if this is a continuation call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueGetJobsResponse : AWSModel


/**
 <p>A list of job definitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueJob *> * _Nullable jobs;

/**
 <p>A continuation token, if not all job definitions have yet been returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueGetMLTaskRunRequest : AWSRequest


/**
 <p>The unique identifier of the task run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskRunId;

/**
 <p>The unique identifier of the machine learning transform.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 
 */
@interface AWSGlueGetMLTaskRunResponse : AWSModel


/**
 <p>The date and time when this task run was completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completedOn;

/**
 <p>The error strings that are associated with the task run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorString;

/**
 <p>The amount of time (in seconds) that the task run consumed resources.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable executionTime;

/**
 <p>The date and time when this task run was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedOn;

/**
 <p>The names of the log groups that are associated with the task run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The list of properties that are associated with the task run.</p>
 */
@property (nonatomic, strong) AWSGlueTaskRunProperties * _Nullable properties;

/**
 <p>The date and time when this task run started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedOn;

/**
 <p>The status for this task run.</p>
 */
@property (nonatomic, assign) AWSGlueTaskStatusType status;

/**
 <p>The unique run identifier associated with this run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskRunId;

/**
 <p>The unique identifier of the task run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 
 */
@interface AWSGlueGetMLTaskRunsRequest : AWSRequest


/**
 <p>The filter criteria, in the <code>TaskRunFilterCriteria</code> structure, for the task run.</p>
 */
@property (nonatomic, strong) AWSGlueTaskRunFilterCriteria * _Nullable filter;

/**
 <p>The maximum number of results to return. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token for pagination of the results. The default is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The sorting criteria, in the <code>TaskRunSortCriteria</code> structure, for the task run.</p>
 */
@property (nonatomic, strong) AWSGlueTaskRunSortCriteria * _Nullable sort;

/**
 <p>The unique identifier of the machine learning transform.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 
 */
@interface AWSGlueGetMLTaskRunsResponse : AWSModel


/**
 <p>A pagination token, if more results are available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of task runs that are associated with the transform.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueTaskRun *> * _Nullable taskRuns;

@end

/**
 
 */
@interface AWSGlueGetMLTransformRequest : AWSRequest


/**
 <p>The unique identifier of the transform, generated at the time that the transform was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 
 */
@interface AWSGlueGetMLTransformResponse : AWSModel


/**
 <p>The date and time when the transform was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdOn;

/**
 <p>A description of the transform.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The latest evaluation metrics.</p>
 */
@property (nonatomic, strong) AWSGlueEvaluationMetrics * _Nullable evaluationMetrics;

/**
 <p>This value determines which version of AWS Glue this machine learning transform is compatible with. Glue 1.0 is recommended for most customers. If the value is not set, the Glue compatibility defaults to Glue 0.9. For more information, see <a href="https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions">AWS Glue Versions</a> in the developer guide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable glueVersion;

/**
 <p>A list of AWS Glue table definitions used by the transform.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueGlueTable *> * _Nullable inputRecordTables;

/**
 <p>The number of labels available for this transform.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable labelCount;

/**
 <p>The date and time when the transform was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedOn;

/**
 <p>The number of AWS Glue data processing units (DPUs) that are allocated to task runs for this transform. You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For more information, see the <a href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>. </p><p>When the <code>WorkerType</code> field is set to a value other than <code>Standard</code>, the <code>MaxCapacity</code> field is set automatically and becomes read-only.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCapacity;

/**
 <p>The maximum number of times to retry a task for this transform after a task run fails.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRetries;

/**
 <p>The unique name given to the transform when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The number of workers of a defined <code>workerType</code> that are allocated when this task runs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfWorkers;

/**
 <p>The configuration parameters that are specific to the algorithm used.</p>
 */
@property (nonatomic, strong) AWSGlueTransformParameters * _Nullable parameters;

/**
 <p>The name or Amazon Resource Name (ARN) of the IAM role with the required permissions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>The <code>Map&lt;Column, Type&gt;</code> object that represents the schema that this transform accepts. Has an upper bound of 100 columns.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueSchemaColumn *> * _Nullable schema;

/**
 <p>The last known status of the transform (to indicate whether it can be used or not). One of "NOT_READY", "READY", or "DELETING".</p>
 */
@property (nonatomic, assign) AWSGlueTransformStatusType status;

/**
 <p>The timeout for a task run for this transform in minutes. This is the maximum time that a task run for this transform can consume resources before it is terminated and enters <code>TIMEOUT</code> status. The default is 2,880 minutes (48 hours).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

/**
 <p>The unique identifier of the transform, generated at the time that the transform was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

/**
 <p>The type of predefined worker that is allocated when this task runs. Accepts a value of Standard, G.1X, or G.2X.</p><ul><li><p>For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16 GB of memory and a 50GB disk, and 2 executors per worker.</p></li><li><p>For the <code>G.1X</code> worker type, each worker provides 4 vCPU, 16 GB of memory and a 64GB disk, and 1 executor per worker.</p></li><li><p>For the <code>G.2X</code> worker type, each worker provides 8 vCPU, 32 GB of memory and a 128GB disk, and 1 executor per worker.</p></li></ul>
 */
@property (nonatomic, assign) AWSGlueWorkerType workerType;

@end

/**
 
 */
@interface AWSGlueGetMLTransformsRequest : AWSRequest


/**
 <p>The filter transformation criteria.</p>
 */
@property (nonatomic, strong) AWSGlueTransformFilterCriteria * _Nullable filter;

/**
 <p>The maximum number of results to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A paginated token to offset the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The sorting criteria.</p>
 */
@property (nonatomic, strong) AWSGlueTransformSortCriteria * _Nullable sort;

@end

/**
 
 */
@interface AWSGlueGetMLTransformsResponse : AWSModel


/**
 <p>A pagination token, if more results are available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of machine learning transforms.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueMLTransform *> * _Nullable transforms;

@end

/**
 
 */
@interface AWSGlueGetMappingRequest : AWSRequest


/**
 <p>Parameters for the mapping.</p>
 */
@property (nonatomic, strong) AWSGlueLocation * _Nullable location;

/**
 <p>A list of target tables.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueCatalogEntry *> * _Nullable sinks;

/**
 <p>Specifies the source table.</p>
 */
@property (nonatomic, strong) AWSGlueCatalogEntry * _Nullable source;

@end

/**
 
 */
@interface AWSGlueGetMappingResponse : AWSModel


/**
 <p>A list of mappings to the specified targets.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueMappingEntry *> * _Nullable mapping;

@end

/**
 
 */
@interface AWSGlueGetPartitionRequest : AWSRequest


/**
 <p>The ID of the Data Catalog where the partition in question resides. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the catalog database where the partition resides.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The values that define the partition.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable partitionValues;

/**
 <p>The name of the partition's table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSGlueGetPartitionResponse : AWSModel


/**
 <p>The requested information, in the form of a <code>Partition</code> object.</p>
 */
@property (nonatomic, strong) AWSGluePartition * _Nullable partition;

@end

/**
 
 */
@interface AWSGlueGetPartitionsRequest : AWSRequest


/**
 <p>The ID of the Data Catalog where the partitions in question reside. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the catalog database where the partitions reside.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>An expression that filters the partitions to be returned.</p><p>The expression uses SQL syntax similar to the SQL <code>WHERE</code> filter clause. The SQL statement parser <a href="http://jsqlparser.sourceforge.net/home.php">JSQLParser</a> parses the expression. </p><p><i>Operators</i>: The following are the operators that you can use in the <code>Expression</code> API call:</p><dl><dt>=</dt><dd><p>Checks whether the values of the two operands are equal; if yes, then the condition becomes true.</p><p>Example: Assume 'variable a' holds 10 and 'variable b' holds 20. </p><p>(a = b) is not true.</p></dd><dt>&lt; &gt;</dt><dd><p>Checks whether the values of two operands are equal; if the values are not equal, then the condition becomes true.</p><p>Example: (a &lt; &gt; b) is true.</p></dd><dt>&gt;</dt><dd><p>Checks whether the value of the left operand is greater than the value of the right operand; if yes, then the condition becomes true.</p><p>Example: (a &gt; b) is not true.</p></dd><dt>&lt;</dt><dd><p>Checks whether the value of the left operand is less than the value of the right operand; if yes, then the condition becomes true.</p><p>Example: (a &lt; b) is true.</p></dd><dt>&gt;=</dt><dd><p>Checks whether the value of the left operand is greater than or equal to the value of the right operand; if yes, then the condition becomes true.</p><p>Example: (a &gt;= b) is not true.</p></dd><dt>&lt;=</dt><dd><p>Checks whether the value of the left operand is less than or equal to the value of the right operand; if yes, then the condition becomes true.</p><p>Example: (a &lt;= b) is true.</p></dd><dt>AND, OR, IN, BETWEEN, LIKE, NOT, IS NULL</dt><dd><p>Logical operators.</p></dd></dl><p><i>Supported Partition Key Types</i>: The following are the supported partition keys.</p><ul><li><p><code>string</code></p></li><li><p><code>date</code></p></li><li><p><code>timestamp</code></p></li><li><p><code>int</code></p></li><li><p><code>bigint</code></p></li><li><p><code>long</code></p></li><li><p><code>tinyint</code></p></li><li><p><code>smallint</code></p></li><li><p><code>decimal</code></p></li></ul><p>If an invalid type is encountered, an exception is thrown. </p><p>The following list shows the valid operators on each type. When you define a crawler, the <code>partitionKey</code> type is created as a <code>STRING</code>, to be compatible with the catalog partitions. </p><p><i>Sample API Call</i>: </p>
 */
@property (nonatomic, strong) NSString * _Nullable expression;

/**
 <p>The maximum number of partitions to return in a single response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token, if this is not the first call to retrieve these partitions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The segment of the table's partitions to scan in this request.</p>
 */
@property (nonatomic, strong) AWSGlueSegment * _Nullable segment;

/**
 <p>The name of the partitions' table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSGlueGetPartitionsResponse : AWSModel


/**
 <p>A continuation token, if the returned list of partitions does not include the last one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of requested partitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSGluePartition *> * _Nullable partitions;

@end

/**
 
 */
@interface AWSGlueGetPlanRequest : AWSRequest


/**
 <p>The programming language of the code to perform the mapping.</p>
 */
@property (nonatomic, assign) AWSGlueLanguage language;

/**
 <p>The parameters for the mapping.</p>
 */
@property (nonatomic, strong) AWSGlueLocation * _Nullable location;

/**
 <p>The list of mappings from a source table to target tables.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueMappingEntry *> * _Nullable mapping;

/**
 <p>The target tables.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueCatalogEntry *> * _Nullable sinks;

/**
 <p>The source table.</p>
 */
@property (nonatomic, strong) AWSGlueCatalogEntry * _Nullable source;

@end

/**
 
 */
@interface AWSGlueGetPlanResponse : AWSModel


/**
 <p>A Python script to perform the mapping.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pythonScript;

/**
 <p>The Scala code to perform the mapping.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scalaCode;

@end

/**
 
 */
@interface AWSGlueGetResourcePolicyRequest : AWSRequest


@end

/**
 
 */
@interface AWSGlueGetResourcePolicyResponse : AWSModel


/**
 <p>The date and time at which the policy was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>Contains the hash value associated with this policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyHash;

/**
 <p>Contains the requested policy document, in JSON format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyInJson;

/**
 <p>The date and time at which the policy was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSGlueGetSecurityConfigurationRequest : AWSRequest


/**
 <p>The name of the security configuration to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueGetSecurityConfigurationResponse : AWSModel


/**
 <p>The requested security configuration.</p>
 */
@property (nonatomic, strong) AWSGlueSecurityConfiguration * _Nullable securityConfiguration;

@end

/**
 
 */
@interface AWSGlueGetSecurityConfigurationsRequest : AWSRequest


/**
 <p>The maximum number of results to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token, if this is a continuation call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueGetSecurityConfigurationsResponse : AWSModel


/**
 <p>A continuation token, if there are more security configurations to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of security configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueSecurityConfiguration *> * _Nullable securityConfigurations;

@end

/**
 
 */
@interface AWSGlueGetTableRequest : AWSRequest


/**
 <p>The ID of the Data Catalog where the table resides. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the database in the catalog in which the table resides. For Hive compatibility, this name is entirely lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The name of the table for which to retrieve the definition. For Hive compatibility, this name is entirely lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueGetTableResponse : AWSModel


/**
 <p>The <code>Table</code> object that defines the specified table.</p>
 */
@property (nonatomic, strong) AWSGlueTable * _Nullable table;

@end

/**
 
 */
@interface AWSGlueGetTableVersionRequest : AWSRequest


/**
 <p>The ID of the Data Catalog where the tables reside. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The database in the catalog in which the table resides. For Hive compatibility, this name is entirely lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The name of the table. For Hive compatibility, this name is entirely lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

/**
 <p>The ID value of the table version to be retrieved. A <code>VersionID</code> is a string representation of an integer. Each version is incremented by 1. </p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSGlueGetTableVersionResponse : AWSModel


/**
 <p>The requested table version.</p>
 */
@property (nonatomic, strong) AWSGlueTableVersion * _Nullable tableVersion;

@end

/**
 
 */
@interface AWSGlueGetTableVersionsRequest : AWSRequest


/**
 <p>The ID of the Data Catalog where the tables reside. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The database in the catalog in which the table resides. For Hive compatibility, this name is entirely lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The maximum number of table versions to return in one response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token, if this is not the first call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the table. For Hive compatibility, this name is entirely lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSGlueGetTableVersionsResponse : AWSModel


/**
 <p>A continuation token, if the list of available versions does not include the last one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of strings identifying available versions of the specified table.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueTableVersion *> * _Nullable tableVersions;

@end

/**
 
 */
@interface AWSGlueGetTablesRequest : AWSRequest


/**
 <p>The ID of the Data Catalog where the tables reside. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The database in the catalog whose tables to list. For Hive compatibility, this name is entirely lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>A regular expression pattern. If present, only those tables whose names match the pattern are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expression;

/**
 <p>The maximum number of tables to return in a single response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token, included if this is a continuation call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueGetTablesResponse : AWSModel


/**
 <p>A continuation token, present if the current list segment is not the last.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of the requested <code>Table</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueTable *> * _Nullable tableList;

@end

/**
 
 */
@interface AWSGlueGetTagsRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource for which to retrieve tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSGlueGetTagsResponse : AWSModel


/**
 <p>The requested tags.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSGlueGetTriggerRequest : AWSRequest


/**
 <p>The name of the trigger to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueGetTriggerResponse : AWSModel


/**
 <p>The requested trigger definition.</p>
 */
@property (nonatomic, strong) AWSGlueTrigger * _Nullable trigger;

@end

/**
 
 */
@interface AWSGlueGetTriggersRequest : AWSRequest


/**
 <p>The name of the job to retrieve triggers for. The trigger that can start this job is returned, and if there is no such trigger, all triggers are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dependentJobName;

/**
 <p>The maximum size of the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token, if this is a continuation call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueGetTriggersResponse : AWSModel


/**
 <p>A continuation token, if not all the requested triggers have yet been returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of triggers for the specified job.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueTrigger *> * _Nullable triggers;

@end

/**
 
 */
@interface AWSGlueGetUserDefinedFunctionRequest : AWSRequest


/**
 <p>The ID of the Data Catalog where the function to be retrieved is located. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the catalog database where the function is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The name of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

@end

/**
 
 */
@interface AWSGlueGetUserDefinedFunctionResponse : AWSModel


/**
 <p>The requested function definition.</p>
 */
@property (nonatomic, strong) AWSGlueUserDefinedFunction * _Nullable userDefinedFunction;

@end

/**
 
 */
@interface AWSGlueGetUserDefinedFunctionsRequest : AWSRequest


/**
 <p>The ID of the Data Catalog where the functions to be retrieved are located. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the catalog database where the functions are located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The maximum number of functions to return in one response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token, if this is a continuation call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An optional function-name pattern string that filters the function definitions returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pattern;

@end

/**
 
 */
@interface AWSGlueGetUserDefinedFunctionsResponse : AWSModel


/**
 <p>A continuation token, if the list of functions returned does not include the last requested function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of requested function definitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueUserDefinedFunction *> * _Nullable userDefinedFunctions;

@end

/**
 
 */
@interface AWSGlueGetWorkflowRequest : AWSRequest


/**
 <p>Specifies whether to include a graph when returning the workflow resource metadata.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeGraph;

/**
 <p>The name of the workflow to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueGetWorkflowResponse : AWSModel


/**
 <p>The resource metadata for the workflow.</p>
 */
@property (nonatomic, strong) AWSGlueWorkflow * _Nullable workflow;

@end

/**
 
 */
@interface AWSGlueGetWorkflowRunPropertiesRequest : AWSRequest


/**
 <p>Name of the workflow which was run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ID of the workflow run whose run properties should be returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable runId;

@end

/**
 
 */
@interface AWSGlueGetWorkflowRunPropertiesResponse : AWSModel


/**
 <p>The workflow run properties which were set during the specified run.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable runProperties;

@end

/**
 
 */
@interface AWSGlueGetWorkflowRunRequest : AWSRequest


/**
 <p>Specifies whether to include the workflow graph in response or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeGraph;

/**
 <p>Name of the workflow being run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ID of the workflow run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable runId;

@end

/**
 
 */
@interface AWSGlueGetWorkflowRunResponse : AWSModel


/**
 <p>The requested workflow run metadata.</p>
 */
@property (nonatomic, strong) AWSGlueWorkflowRun * _Nullable run;

@end

/**
 
 */
@interface AWSGlueGetWorkflowRunsRequest : AWSRequest


/**
 <p>Specifies whether to include the workflow graph in response or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeGraph;

/**
 <p>The maximum number of workflow runs to be included in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Name of the workflow whose metadata of runs should be returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The maximum size of the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueGetWorkflowRunsResponse : AWSModel


/**
 <p>A continuation token, if not all requested workflow runs have been returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of workflow run metadata objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueWorkflowRun *> * _Nullable runs;

@end

/**
 <p>The database and table in the AWS Glue Data Catalog that is used for input or output data.</p>
 Required parameters: [DatabaseName, TableName]
 */
@interface AWSGlueGlueTable : AWSModel


/**
 <p>A unique identifier for the AWS Glue Data Catalog.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the connection to the AWS Glue Data Catalog.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionName;

/**
 <p>A database name in the AWS Glue Data Catalog.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>A table name in the AWS Glue Data Catalog.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>A classifier that uses <code>grok</code> patterns.</p>
 Required parameters: [Name, Classification, GrokPattern]
 */
@interface AWSGlueGrokClassifier : AWSModel


/**
 <p>An identifier of the data format that the classifier matches, such as Twitter, JSON, Omniture logs, and so on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable classification;

/**
 <p>The time that this classifier was registered.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>Optional custom grok patterns defined by this classifier. For more information, see custom patterns in <a href="http://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html">Writing Custom Classifiers</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customPatterns;

/**
 <p>The grok pattern applied to a data store by this classifier. For more information, see built-in patterns in <a href="http://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html">Writing Custom Classifiers</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grokPattern;

/**
 <p>The time that this classifier was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdated;

/**
 <p>The name of the classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The version of this classifier.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 
 */
@interface AWSGlueImportCatalogToGlueRequest : AWSRequest


/**
 <p>The ID of the catalog to import. Currently, this should be the AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

@end

/**
 
 */
@interface AWSGlueImportCatalogToGlueResponse : AWSModel


@end

/**
 <p>Specifies configuration properties for an importing labels task run.</p>
 */
@interface AWSGlueImportLabelsTaskRunProperties : AWSModel


/**
 <p>The Amazon Simple Storage Service (Amazon S3) path from where you will import the labels.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputS3Path;

/**
 <p>Indicates whether to overwrite your existing labels.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replace;

@end

/**
 <p>Specifies a JDBC data store to crawl.</p>
 */
@interface AWSGlueJdbcTarget : AWSModel


/**
 <p>The name of the connection to use to connect to the JDBC target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionName;

/**
 <p>A list of glob patterns used to exclude from the crawl. For more information, see <a href="http://docs.aws.amazon.com/glue/latest/dg/add-crawler.html">Catalog Tables with a Crawler</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable exclusions;

/**
 <p>The path of the JDBC target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

@end

/**
 <p>Specifies a job definition.</p>
 */
@interface AWSGlueJob : AWSModel


/**
 <p>This field is deprecated. Use <code>MaxCapacity</code> instead.</p><p>The number of AWS Glue data processing units (DPUs) allocated to runs of this job. You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For more information, see the <a href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>.</p><p/>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedCapacity;

/**
 <p>The <code>JobCommand</code> that executes this job.</p>
 */
@property (nonatomic, strong) AWSGlueJobCommand * _Nullable command;

/**
 <p>The connections used for this job.</p>
 */
@property (nonatomic, strong) AWSGlueConnectionsList * _Nullable connections;

/**
 <p>The time and date that this job definition was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdOn;

/**
 <p>The default arguments for this job, specified as name-value pairs.</p><p>You can specify arguments here that your own job-execution script consumes, as well as arguments that AWS Glue itself consumes.</p><p>For information about how to specify and consume your own Job arguments, see the <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html">Calling AWS Glue APIs in Python</a> topic in the developer guide.</p><p>For information about the key-value pairs that AWS Glue consumes to set up your job, see the <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html">Special Parameters Used by AWS Glue</a> topic in the developer guide.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable defaultArguments;

/**
 <p>A description of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>An <code>ExecutionProperty</code> specifying the maximum number of concurrent runs allowed for this job.</p>
 */
@property (nonatomic, strong) AWSGlueExecutionProperty * _Nullable executionProperty;

/**
 <p>Glue version determines the versions of Apache Spark and Python that AWS Glue supports. The Python version indicates the version supported for jobs of type Spark. </p><p>For more information about the available AWS Glue versions and corresponding Spark and Python versions, see <a href="https://docs.aws.amazon.com/glue/latest/dg/add-job.html">Glue version</a> in the developer guide.</p><p>Jobs that are created without specifying a Glue version default to Glue 0.9.</p>
 */
@property (nonatomic, strong) NSString * _Nullable glueVersion;

/**
 <p>The last point in time when this job definition was modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedOn;

/**
 <p>This field is reserved for future use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logUri;

/**
 <p>The number of AWS Glue data processing units (DPUs) that can be allocated when this job runs. A DPU is a relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For more information, see the <a href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>.</p><p>Do not set <code>Max Capacity</code> if using <code>WorkerType</code> and <code>NumberOfWorkers</code>.</p><p>The value that can be allocated for <code>MaxCapacity</code> depends on whether you are running a Python shell job or an Apache Spark ETL job:</p><ul><li><p>When you specify a Python shell job (<code>JobCommand.Name</code>="pythonshell"), you can allocate either 0.0625 or 1 DPU. The default is 0.0625 DPU.</p></li><li><p>When you specify an Apache Spark ETL job (<code>JobCommand.Name</code>="glueetl"), you can allocate from 2 to 100 DPUs. The default is 10 DPUs. This job type cannot have a fractional DPU allocation.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCapacity;

/**
 <p>The maximum number of times to retry this job after a JobRun fails.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRetries;

/**
 <p>The name you assign to this job definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Non-overridable arguments for this job, specified as name-value pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable nonOverridableArguments;

/**
 <p>Specifies configuration properties of a job notification.</p>
 */
@property (nonatomic, strong) AWSGlueNotificationProperty * _Nullable notificationProperty;

/**
 <p>The number of workers of a defined <code>workerType</code> that are allocated when a job runs.</p><p>The maximum number of workers you can define are 299 for <code>G.1X</code>, and 149 for <code>G.2X</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfWorkers;

/**
 <p>The name or Amazon Resource Name (ARN) of the IAM role associated with this job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>The name of the <code>SecurityConfiguration</code> structure to be used with this job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityConfiguration;

/**
 <p>The job timeout in minutes. This is the maximum time that a job run can consume resources before it is terminated and enters <code>TIMEOUT</code> status. The default is 2,880 minutes (48 hours).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

/**
 <p>The type of predefined worker that is allocated when a job runs. Accepts a value of Standard, G.1X, or G.2X.</p><ul><li><p>For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16 GB of memory and a 50GB disk, and 2 executors per worker.</p></li><li><p>For the <code>G.1X</code> worker type, each worker maps to 1 DPU (4 vCPU, 16 GB of memory, 64 GB disk), and provides 1 executor per worker. We recommend this worker type for memory-intensive jobs.</p></li><li><p>For the <code>G.2X</code> worker type, each worker maps to 2 DPU (8 vCPU, 32 GB of memory, 128 GB disk), and provides 1 executor per worker. We recommend this worker type for memory-intensive jobs.</p></li></ul>
 */
@property (nonatomic, assign) AWSGlueWorkerType workerType;

@end

/**
 <p>Defines a point that a job can resume processing.</p>
 */
@interface AWSGlueJobBookmarkEntry : AWSModel


/**
 <p>The attempt ID number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable attempt;

/**
 <p>The bookmark itself.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobBookmark;

/**
 <p>The name of the job in question.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The unique run identifier associated with the previous job run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable previousRunId;

/**
 <p>The run ID number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable run;

/**
 <p>The run ID number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable runId;

/**
 <p>The version of the job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>Specifies how job bookmark data should be encrypted.</p>
 */
@interface AWSGlueJobBookmarksEncryption : AWSModel


/**
 <p>The encryption mode to use for job bookmarks data.</p>
 */
@property (nonatomic, assign) AWSGlueJobBookmarksEncryptionMode jobBookmarksEncryptionMode;

/**
 <p>The Amazon Resource Name (ARN) of the KMS key to be used to encrypt the data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyArn;

@end

/**
 <p>Specifies code executed when a job is run.</p>
 */
@interface AWSGlueJobCommand : AWSModel


/**
 <p>The name of the job command. For an Apache Spark ETL job, this must be <code>glueetl</code>. For a Python shell job, it must be <code>pythonshell</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Python version being used to execute a Python shell job. Allowed values are 2 or 3.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pythonVersion;

/**
 <p>Specifies the Amazon Simple Storage Service (Amazon S3) path to a script that executes a job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scriptLocation;

@end

/**
 <p>The details of a Job node present in the workflow.</p>
 */
@interface AWSGlueJobNodeDetails : AWSModel


/**
 <p>The information for the job runs represented by the job node.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueJobRun *> * _Nullable jobRuns;

@end

/**
 <p>Contains information about a job run.</p>
 */
@interface AWSGlueJobRun : AWSModel


/**
 <p>This field is deprecated. Use <code>MaxCapacity</code> instead.</p><p>The number of AWS Glue data processing units (DPUs) allocated to this JobRun. From 2 to 100 DPUs can be allocated; the default is 10. A DPU is a relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For more information, see the <a href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedCapacity;

/**
 <p>The job arguments associated with this run. For this job run, they replace the default arguments set in the job definition itself.</p><p>You can specify arguments here that your own job-execution script consumes, as well as arguments that AWS Glue itself consumes.</p><p>For information about how to specify and consume your own job arguments, see the <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html">Calling AWS Glue APIs in Python</a> topic in the developer guide.</p><p>For information about the key-value pairs that AWS Glue consumes to set up your job, see the <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html">Special Parameters Used by AWS Glue</a> topic in the developer guide.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable arguments;

/**
 <p>The number of the attempt to run this job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable attempt;

/**
 <p>The date and time that this job run completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completedOn;

/**
 <p>An error message associated with this job run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The amount of time (in seconds) that the job run consumed resources.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable executionTime;

/**
 <p>Glue version determines the versions of Apache Spark and Python that AWS Glue supports. The Python version indicates the version supported for jobs of type Spark. </p><p>For more information about the available AWS Glue versions and corresponding Spark and Python versions, see <a href="https://docs.aws.amazon.com/glue/latest/dg/add-job.html">Glue version</a> in the developer guide.</p><p>Jobs that are created without specifying a Glue version default to Glue 0.9.</p>
 */
@property (nonatomic, strong) NSString * _Nullable glueVersion;

/**
 <p>The ID of this job run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the job definition being used in this run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The current state of the job run. For more information about the statuses of jobs that have terminated abnormally, see <a href="https://docs.aws.amazon.com/glue/latest/dg/job-run-statuses.html">AWS Glue Job Run Statuses</a>.</p>
 */
@property (nonatomic, assign) AWSGlueJobRunState jobRunState;

/**
 <p>The last time that this job run was modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedOn;

/**
 <p>The name of the log group for secure logging that can be server-side encrypted in Amazon CloudWatch using AWS KMS. This name can be <code>/aws-glue/jobs/</code>, in which case the default encryption is <code>NONE</code>. If you add a role name and <code>SecurityConfiguration</code> name (in other words, <code>/aws-glue/jobs-yourRoleName-yourSecurityConfigurationName/</code>), then that security configuration is used to encrypt the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The number of AWS Glue data processing units (DPUs) that can be allocated when this job runs. A DPU is a relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For more information, see the <a href="https://docs.aws.amazon.com/https:/aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>.</p><p>Do not set <code>Max Capacity</code> if using <code>WorkerType</code> and <code>NumberOfWorkers</code>.</p><p>The value that can be allocated for <code>MaxCapacity</code> depends on whether you are running a Python shell job or an Apache Spark ETL job:</p><ul><li><p>When you specify a Python shell job (<code>JobCommand.Name</code>="pythonshell"), you can allocate either 0.0625 or 1 DPU. The default is 0.0625 DPU.</p></li><li><p>When you specify an Apache Spark ETL job (<code>JobCommand.Name</code>="glueetl"), you can allocate from 2 to 100 DPUs. The default is 10 DPUs. This job type cannot have a fractional DPU allocation.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCapacity;

/**
 <p>Specifies configuration properties of a job run notification.</p>
 */
@property (nonatomic, strong) AWSGlueNotificationProperty * _Nullable notificationProperty;

/**
 <p>The number of workers of a defined <code>workerType</code> that are allocated when a job runs.</p><p>The maximum number of workers you can define are 299 for <code>G.1X</code>, and 149 for <code>G.2X</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfWorkers;

/**
 <p>A list of predecessors to this job run.</p>
 */
@property (nonatomic, strong) NSArray<AWSGluePredecessor *> * _Nullable predecessorRuns;

/**
 <p>The ID of the previous run of this job. For example, the <code>JobRunId</code> specified in the <code>StartJobRun</code> action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable previousRunId;

/**
 <p>The name of the <code>SecurityConfiguration</code> structure to be used with this job run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityConfiguration;

/**
 <p>The date and time at which this job run was started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedOn;

/**
 <p>The <code>JobRun</code> timeout in minutes. This is the maximum time that a job run can consume resources before it is terminated and enters <code>TIMEOUT</code> status. The default is 2,880 minutes (48 hours). This overrides the timeout value set in the parent job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

/**
 <p>The name of the trigger that started this job run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable triggerName;

/**
 <p>The type of predefined worker that is allocated when a job runs. Accepts a value of Standard, G.1X, or G.2X.</p><ul><li><p>For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16 GB of memory and a 50GB disk, and 2 executors per worker.</p></li><li><p>For the <code>G.1X</code> worker type, each worker provides 4 vCPU, 16 GB of memory and a 64GB disk, and 1 executor per worker.</p></li><li><p>For the <code>G.2X</code> worker type, each worker provides 8 vCPU, 32 GB of memory and a 128GB disk, and 1 executor per worker.</p></li></ul>
 */
@property (nonatomic, assign) AWSGlueWorkerType workerType;

@end

/**
 <p>Specifies information used to update an existing job definition. The previous job definition is completely overwritten by this information.</p>
 */
@interface AWSGlueJobUpdate : AWSModel


/**
 <p>This field is deprecated. Use <code>MaxCapacity</code> instead.</p><p>The number of AWS Glue data processing units (DPUs) to allocate to this job. You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For more information, see the <a href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedCapacity;

/**
 <p>The <code>JobCommand</code> that executes this job (required).</p>
 */
@property (nonatomic, strong) AWSGlueJobCommand * _Nullable command;

/**
 <p>The connections used for this job.</p>
 */
@property (nonatomic, strong) AWSGlueConnectionsList * _Nullable connections;

/**
 <p>The default arguments for this job.</p><p>You can specify arguments here that your own job-execution script consumes, as well as arguments that AWS Glue itself consumes.</p><p>For information about how to specify and consume your own Job arguments, see the <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html">Calling AWS Glue APIs in Python</a> topic in the developer guide.</p><p>For information about the key-value pairs that AWS Glue consumes to set up your job, see the <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html">Special Parameters Used by AWS Glue</a> topic in the developer guide.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable defaultArguments;

/**
 <p>Description of the job being defined.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>An <code>ExecutionProperty</code> specifying the maximum number of concurrent runs allowed for this job.</p>
 */
@property (nonatomic, strong) AWSGlueExecutionProperty * _Nullable executionProperty;

/**
 <p>Glue version determines the versions of Apache Spark and Python that AWS Glue supports. The Python version indicates the version supported for jobs of type Spark. </p><p>For more information about the available AWS Glue versions and corresponding Spark and Python versions, see <a href="https://docs.aws.amazon.com/glue/latest/dg/add-job.html">Glue version</a> in the developer guide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable glueVersion;

/**
 <p>This field is reserved for future use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logUri;

/**
 <p>The number of AWS Glue data processing units (DPUs) that can be allocated when this job runs. A DPU is a relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For more information, see the <a href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>.</p><p>Do not set <code>Max Capacity</code> if using <code>WorkerType</code> and <code>NumberOfWorkers</code>.</p><p>The value that can be allocated for <code>MaxCapacity</code> depends on whether you are running a Python shell job or an Apache Spark ETL job:</p><ul><li><p>When you specify a Python shell job (<code>JobCommand.Name</code>="pythonshell"), you can allocate either 0.0625 or 1 DPU. The default is 0.0625 DPU.</p></li><li><p>When you specify an Apache Spark ETL job (<code>JobCommand.Name</code>="glueetl"), you can allocate from 2 to 100 DPUs. The default is 10 DPUs. This job type cannot have a fractional DPU allocation.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCapacity;

/**
 <p>The maximum number of times to retry this job if it fails.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRetries;

/**
 <p>Non-overridable arguments for this job, specified as name-value pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable nonOverridableArguments;

/**
 <p>Specifies the configuration properties of a job notification.</p>
 */
@property (nonatomic, strong) AWSGlueNotificationProperty * _Nullable notificationProperty;

/**
 <p>The number of workers of a defined <code>workerType</code> that are allocated when a job runs.</p><p>The maximum number of workers you can define are 299 for <code>G.1X</code>, and 149 for <code>G.2X</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfWorkers;

/**
 <p>The name or Amazon Resource Name (ARN) of the IAM role associated with this job (required).</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>The name of the <code>SecurityConfiguration</code> structure to be used with this job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityConfiguration;

/**
 <p>The job timeout in minutes. This is the maximum time that a job run can consume resources before it is terminated and enters <code>TIMEOUT</code> status. The default is 2,880 minutes (48 hours).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

/**
 <p>The type of predefined worker that is allocated when a job runs. Accepts a value of Standard, G.1X, or G.2X.</p><ul><li><p>For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16 GB of memory and a 50GB disk, and 2 executors per worker.</p></li><li><p>For the <code>G.1X</code> worker type, each worker maps to 1 DPU (4 vCPU, 16 GB of memory, 64 GB disk), and provides 1 executor per worker. We recommend this worker type for memory-intensive jobs.</p></li><li><p>For the <code>G.2X</code> worker type, each worker maps to 2 DPU (8 vCPU, 32 GB of memory, 128 GB disk), and provides 1 executor per worker. We recommend this worker type for memory-intensive jobs.</p></li></ul>
 */
@property (nonatomic, assign) AWSGlueWorkerType workerType;

@end

/**
 <p>A classifier for <code>JSON</code> content.</p>
 Required parameters: [Name, JsonPath]
 */
@interface AWSGlueJsonClassifier : AWSModel


/**
 <p>The time that this classifier was registered.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>A <code>JsonPath</code> string defining the JSON data for the classifier to classify. AWS Glue supports a subset of <code>JsonPath</code>, as described in <a href="https://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html#custom-classifier-json">Writing JsonPath Custom Classifiers</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jsonPath;

/**
 <p>The time that this classifier was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdated;

/**
 <p>The name of the classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The version of this classifier.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>Specifies configuration properties for a labeling set generation task run.</p>
 */
@interface AWSGlueLabelingSetGenerationTaskRunProperties : AWSModel


/**
 <p>The Amazon Simple Storage Service (Amazon S3) path where you will generate the labeling set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3Path;

@end

/**
 <p>Status and error information about the most recent crawl.</p>
 */
@interface AWSGlueLastCrawlInfo : AWSModel


/**
 <p>If an error occurred, the error information about the last crawl.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The log group for the last crawl.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroup;

/**
 <p>The log stream for the last crawl.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logStream;

/**
 <p>The prefix for a message about this crawl.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messagePrefix;

/**
 <p>The time at which the crawl started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>Status of the last crawl.</p>
 */
@property (nonatomic, assign) AWSGlueLastCrawlStatus status;

@end

/**
 
 */
@interface AWSGlueListCrawlersRequest : AWSRequest


/**
 <p>The maximum size of a list to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token, if this is a continuation request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Specifies to return only these tagged resources.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSGlueListCrawlersResponse : AWSModel


/**
 <p>The names of all crawlers in the account, or the crawlers with the specified tags.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable crawlerNames;

/**
 <p>A continuation token, if the returned list does not contain the last metric available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueListDevEndpointsRequest : AWSRequest


/**
 <p>The maximum size of a list to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token, if this is a continuation request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Specifies to return only these tagged resources.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSGlueListDevEndpointsResponse : AWSModel


/**
 <p>The names of all the <code>DevEndpoint</code>s in the account, or the <code>DevEndpoint</code>s with the specified tags.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable devEndpointNames;

/**
 <p>A continuation token, if the returned list does not contain the last metric available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueListJobsRequest : AWSRequest


/**
 <p>The maximum size of a list to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token, if this is a continuation request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Specifies to return only these tagged resources.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSGlueListJobsResponse : AWSModel


/**
 <p>The names of all jobs in the account, or the jobs with the specified tags.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable jobNames;

/**
 <p>A continuation token, if the returned list does not contain the last metric available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueListMLTransformsRequest : AWSRequest


/**
 <p>A <code>TransformFilterCriteria</code> used to filter the machine learning transforms.</p>
 */
@property (nonatomic, strong) AWSGlueTransformFilterCriteria * _Nullable filter;

/**
 <p>The maximum size of a list to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token, if this is a continuation request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A <code>TransformSortCriteria</code> used to sort the machine learning transforms.</p>
 */
@property (nonatomic, strong) AWSGlueTransformSortCriteria * _Nullable sort;

/**
 <p>Specifies to return only these tagged resources.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSGlueListMLTransformsResponse : AWSModel


/**
 <p>A continuation token, if the returned list does not contain the last metric available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The identifiers of all the machine learning transforms in the account, or the machine learning transforms with the specified tags.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable transformIds;

@end

/**
 
 */
@interface AWSGlueListTriggersRequest : AWSRequest


/**
 <p> The name of the job for which to retrieve triggers. The trigger that can start this job is returned. If there is no such trigger, all triggers are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dependentJobName;

/**
 <p>The maximum size of a list to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token, if this is a continuation request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Specifies to return only these tagged resources.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSGlueListTriggersResponse : AWSModel


/**
 <p>A continuation token, if the returned list does not contain the last metric available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The names of all triggers in the account, or the triggers with the specified tags.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable triggerNames;

@end

/**
 
 */
@interface AWSGlueListWorkflowsRequest : AWSRequest


/**
 <p>The maximum size of a list to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token, if this is a continuation request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGlueListWorkflowsResponse : AWSModel


/**
 <p>A continuation token, if not all workflow names have been returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>List of names of workflows in the account.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable workflows;

@end

/**
 <p>The location of resources.</p>
 */
@interface AWSGlueLocation : AWSModel


/**
 <p>An Amazon DynamoDB table location.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueCodeGenNodeArg *> * _Nullable dynamoDB;

/**
 <p>A JDBC location.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueCodeGenNodeArg *> * _Nullable jdbc;

/**
 <p>An Amazon Simple Storage Service (Amazon S3) location.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueCodeGenNodeArg *> * _Nullable s3;

@end

/**
 <p>A structure for a machine learning transform.</p>
 */
@interface AWSGlueMLTransform : AWSModel


/**
 <p>A timestamp. The time and date that this machine learning transform was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdOn;

/**
 <p>A user-defined, long-form description text for the machine learning transform. Descriptions are not guaranteed to be unique and can be changed at any time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>An <code>EvaluationMetrics</code> object. Evaluation metrics provide an estimate of the quality of your machine learning transform.</p>
 */
@property (nonatomic, strong) AWSGlueEvaluationMetrics * _Nullable evaluationMetrics;

/**
 <p>This value determines which version of AWS Glue this machine learning transform is compatible with. Glue 1.0 is recommended for most customers. If the value is not set, the Glue compatibility defaults to Glue 0.9. For more information, see <a href="https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions">AWS Glue Versions</a> in the developer guide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable glueVersion;

/**
 <p>A list of AWS Glue table definitions used by the transform.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueGlueTable *> * _Nullable inputRecordTables;

/**
 <p>A count identifier for the labeling files generated by AWS Glue for this transform. As you create a better transform, you can iteratively download, label, and upload the labeling file.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable labelCount;

/**
 <p>A timestamp. The last point in time when this machine learning transform was modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedOn;

/**
 <p>The number of AWS Glue data processing units (DPUs) that are allocated to task runs for this transform. You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For more information, see the <a href="http://aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>. </p><p><code>MaxCapacity</code> is a mutually exclusive option with <code>NumberOfWorkers</code> and <code>WorkerType</code>.</p><ul><li><p>If either <code>NumberOfWorkers</code> or <code>WorkerType</code> is set, then <code>MaxCapacity</code> cannot be set.</p></li><li><p>If <code>MaxCapacity</code> is set then neither <code>NumberOfWorkers</code> or <code>WorkerType</code> can be set.</p></li><li><p>If <code>WorkerType</code> is set, then <code>NumberOfWorkers</code> is required (and vice versa).</p></li><li><p><code>MaxCapacity</code> and <code>NumberOfWorkers</code> must both be at least 1.</p></li></ul><p>When the <code>WorkerType</code> field is set to a value other than <code>Standard</code>, the <code>MaxCapacity</code> field is set automatically and becomes read-only.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCapacity;

/**
 <p>The maximum number of times to retry after an <code>MLTaskRun</code> of the machine learning transform fails.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRetries;

/**
 <p>A user-defined name for the machine learning transform. Names are not guaranteed unique and can be changed at any time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The number of workers of a defined <code>workerType</code> that are allocated when a task of the transform runs.</p><p>If <code>WorkerType</code> is set, then <code>NumberOfWorkers</code> is required (and vice versa).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfWorkers;

/**
 <p>A <code>TransformParameters</code> object. You can use parameters to tune (customize) the behavior of the machine learning transform by specifying what data it learns from and your preference on various tradeoffs (such as precious vs. recall, or accuracy vs. cost).</p>
 */
@property (nonatomic, strong) AWSGlueTransformParameters * _Nullable parameters;

/**
 <p>The name or Amazon Resource Name (ARN) of the IAM role with the required permissions. The required permissions include both AWS Glue service role permissions to AWS Glue resources, and Amazon S3 permissions required by the transform. </p><ul><li><p>This role needs AWS Glue service role permissions to allow access to resources in AWS Glue. See <a href="https://docs.aws.amazon.com/glue/latest/dg/attach-policy-iam-user.html">Attach a Policy to IAM Users That Access AWS Glue</a>.</p></li><li><p>This role needs permission to your Amazon Simple Storage Service (Amazon S3) sources, targets, temporary directory, scripts, and any libraries used by the task run for this transform.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>A map of key-value pairs representing the columns and data types that this transform can run against. Has an upper bound of 100 columns.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueSchemaColumn *> * _Nullable schema;

/**
 <p>The current status of the machine learning transform.</p>
 */
@property (nonatomic, assign) AWSGlueTransformStatusType status;

/**
 <p>The timeout in minutes of the machine learning transform.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

/**
 <p>The unique transform ID that is generated for the machine learning transform. The ID is guaranteed to be unique and does not change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

/**
 <p>The type of predefined worker that is allocated when a task of this transform runs. Accepts a value of Standard, G.1X, or G.2X.</p><ul><li><p>For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16 GB of memory and a 50GB disk, and 2 executors per worker.</p></li><li><p>For the <code>G.1X</code> worker type, each worker provides 4 vCPU, 16 GB of memory and a 64GB disk, and 1 executor per worker.</p></li><li><p>For the <code>G.2X</code> worker type, each worker provides 8 vCPU, 32 GB of memory and a 128GB disk, and 1 executor per worker.</p></li></ul><p><code>MaxCapacity</code> is a mutually exclusive option with <code>NumberOfWorkers</code> and <code>WorkerType</code>.</p><ul><li><p>If either <code>NumberOfWorkers</code> or <code>WorkerType</code> is set, then <code>MaxCapacity</code> cannot be set.</p></li><li><p>If <code>MaxCapacity</code> is set then neither <code>NumberOfWorkers</code> or <code>WorkerType</code> can be set.</p></li><li><p>If <code>WorkerType</code> is set, then <code>NumberOfWorkers</code> is required (and vice versa).</p></li><li><p><code>MaxCapacity</code> and <code>NumberOfWorkers</code> must both be at least 1.</p></li></ul>
 */
@property (nonatomic, assign) AWSGlueWorkerType workerType;

@end

/**
 <p>Defines a mapping.</p>
 */
@interface AWSGlueMappingEntry : AWSModel


/**
 <p>The source path.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourcePath;

/**
 <p>The name of the source table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceTable;

/**
 <p>The source type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

/**
 <p>The target path.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetPath;

/**
 <p>The target table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetTable;

/**
 <p>The target type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetType;

@end

/**
 <p>A node represents an AWS Glue component like Trigger, Job etc. which is part of a workflow.</p>
 */
@interface AWSGlueNode : AWSModel


/**
 <p>Details of the crawler when the node represents a crawler.</p>
 */
@property (nonatomic, strong) AWSGlueCrawlerNodeDetails * _Nullable crawlerDetails;

/**
 <p>Details of the Job when the node represents a Job.</p>
 */
@property (nonatomic, strong) AWSGlueJobNodeDetails * _Nullable jobDetails;

/**
 <p>The name of the AWS Glue component represented by the node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Details of the Trigger when the node represents a Trigger.</p>
 */
@property (nonatomic, strong) AWSGlueTriggerNodeDetails * _Nullable triggerDetails;

/**
 <p>The type of AWS Glue component represented by the node.</p>
 */
@property (nonatomic, assign) AWSGlueNodeType types;

/**
 <p>The unique Id assigned to the node within the workflow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uniqueId;

@end

/**
 <p>Specifies configuration properties of a notification.</p>
 */
@interface AWSGlueNotificationProperty : AWSModel


/**
 <p>After a job run starts, the number of minutes to wait before sending a job run delay notification.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable notifyDelayAfter;

@end

/**
 <p>Specifies the sort order of a sorted column.</p>
 Required parameters: [Column, SortOrder]
 */
@interface AWSGlueOrder : AWSModel


/**
 <p>The name of the column.</p>
 */
@property (nonatomic, strong) NSString * _Nullable column;

/**
 <p>Indicates that the column is sorted in ascending order (<code>== 1</code>), or in descending order (<code>==0</code>).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sortOrder;

@end

/**
 <p>Represents a slice of table data.</p>
 */
@interface AWSGluePartition : AWSModel


/**
 <p>The time at which the partition was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The name of the catalog database in which to create the partition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The last time at which the partition was accessed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastAccessTime;

/**
 <p>The last time at which column statistics were computed for this partition.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastAnalyzedTime;

/**
 <p>These key-value pairs define partition parameters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable parameters;

/**
 <p>Provides information about the physical location where the partition is stored.</p>
 */
@property (nonatomic, strong) AWSGlueStorageDescriptor * _Nullable storageDescriptor;

/**
 <p>The name of the database table in which to create the partition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

/**
 <p>The values of the partition.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Contains information about a partition error.</p>
 */
@interface AWSGluePartitionError : AWSModel


/**
 <p>The details about the partition error.</p>
 */
@property (nonatomic, strong) AWSGlueErrorDetail * _Nullable errorDetail;

/**
 <p>The values that define the partition.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable partitionValues;

@end

/**
 <p>The structure used to create and update a partition.</p>
 */
@interface AWSGluePartitionInput : AWSModel


/**
 <p>The last time at which the partition was accessed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastAccessTime;

/**
 <p>The last time at which column statistics were computed for this partition.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastAnalyzedTime;

/**
 <p>These key-value pairs define partition parameters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable parameters;

/**
 <p>Provides information about the physical location where the partition is stored.</p>
 */
@property (nonatomic, strong) AWSGlueStorageDescriptor * _Nullable storageDescriptor;

/**
 <p>The values of the partition. Although this parameter is not required by the SDK, you must specify this parameter for a valid input.</p><p>The values for the keys for the new partition must be passed as an array of String objects that must be ordered in the same order as the partition keys appearing in the Amazon S3 prefix. Otherwise AWS Glue will add the values to the wrong keys.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Contains a list of values defining partitions.</p>
 Required parameters: [Values]
 */
@interface AWSGluePartitionValueList : AWSModel


/**
 <p>The list of values.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Specifies the physical requirements for a connection.</p>
 */
@interface AWSGluePhysicalConnectionRequirements : AWSModel


/**
 <p>The connection's Availability Zone. This field is redundant because the specified subnet implies the Availability Zone to be used. Currently the field must be populated, but it will be deprecated in the future.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The security group ID list used by the connection.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIdList;

/**
 <p>The subnet ID used by the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

@end

/**
 <p>A job run that was used in the predicate of a conditional trigger that triggered this job run.</p>
 */
@interface AWSGluePredecessor : AWSModel


/**
 <p>The name of the job definition used by the predecessor job run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The job-run ID of the predecessor job run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable runId;

@end

/**
 <p>Defines the predicate of the trigger, which determines when it fires.</p>
 */
@interface AWSGluePredicate : AWSModel


/**
 <p>A list of the conditions that determine when the trigger will fire.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueCondition *> * _Nullable conditions;

/**
 <p>An optional field if only one condition is listed. If multiple conditions are listed, then this field is required.</p>
 */
@property (nonatomic, assign) AWSGlueLogical logical;

@end

/**
 <p>Permissions granted to a principal.</p>
 */
@interface AWSGluePrincipalPermissions : AWSModel


/**
 <p>The permissions that are granted to the principal.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable permissions;

/**
 <p>The principal who is granted permissions.</p>
 */
@property (nonatomic, strong) AWSGlueDataLakePrincipal * _Nullable principal;

@end

/**
 <p>Defines a property predicate.</p>
 */
@interface AWSGluePropertyPredicate : AWSModel


/**
 <p>The comparator used to compare this property to others.</p>
 */
@property (nonatomic, assign) AWSGlueComparator comparator;

/**
 <p>The key of the property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value of the property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSGluePutDataCatalogEncryptionSettingsRequest : AWSRequest


/**
 <p>The ID of the Data Catalog to set the security configuration for. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The security configuration to set.</p>
 */
@property (nonatomic, strong) AWSGlueDataCatalogEncryptionSettings * _Nullable dataCatalogEncryptionSettings;

@end

/**
 
 */
@interface AWSGluePutDataCatalogEncryptionSettingsResponse : AWSModel


@end

/**
 
 */
@interface AWSGluePutResourcePolicyRequest : AWSRequest


/**
 <p>A value of <code>MUST_EXIST</code> is used to update a policy. A value of <code>NOT_EXIST</code> is used to create a new policy. If a value of <code>NONE</code> or a null value is used, the call will not depend on the existence of a policy.</p>
 */
@property (nonatomic, assign) AWSGlueExistCondition policyExistsCondition;

/**
 <p>The hash value returned when the previous policy was set using <code>PutResourcePolicy</code>. Its purpose is to prevent concurrent modifications of a policy. Do not use this parameter if no previous policy has been set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyHashCondition;

/**
 <p>Contains the policy document to set, in JSON format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyInJson;

@end

/**
 
 */
@interface AWSGluePutResourcePolicyResponse : AWSModel


/**
 <p>A hash of the policy that has just been set. This must be included in a subsequent call that overwrites or updates this policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyHash;

@end

/**
 
 */
@interface AWSGluePutWorkflowRunPropertiesRequest : AWSRequest


/**
 <p>Name of the workflow which was run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ID of the workflow run for which the run properties should be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable runId;

/**
 <p>The properties to put for the specified run.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable runProperties;

@end

/**
 
 */
@interface AWSGluePutWorkflowRunPropertiesResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueResetJobBookmarkRequest : AWSRequest


/**
 <p>The name of the job in question.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The unique run identifier associated with this job run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable runId;

@end

/**
 
 */
@interface AWSGlueResetJobBookmarkResponse : AWSModel


/**
 <p>The reset bookmark entry.</p>
 */
@property (nonatomic, strong) AWSGlueJobBookmarkEntry * _Nullable jobBookmarkEntry;

@end

/**
 <p>The URIs for function resources.</p>
 */
@interface AWSGlueResourceUri : AWSModel


/**
 <p>The type of the resource.</p>
 */
@property (nonatomic, assign) AWSGlueResourceType resourceType;

/**
 <p>The URI for accessing the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uri;

@end

/**
 <p>Specifies how Amazon Simple Storage Service (Amazon S3) data should be encrypted.</p>
 */
@interface AWSGlueS3Encryption : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the KMS key to be used to encrypt the data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyArn;

/**
 <p>The encryption mode to use for Amazon S3 data.</p>
 */
@property (nonatomic, assign) AWSGlueS3EncryptionMode s3EncryptionMode;

@end

/**
 <p>Specifies a data store in Amazon Simple Storage Service (Amazon S3).</p>
 */
@interface AWSGlueS3Target : AWSModel


/**
 <p>A list of glob patterns used to exclude from the crawl. For more information, see <a href="http://docs.aws.amazon.com/glue/latest/dg/add-crawler.html">Catalog Tables with a Crawler</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable exclusions;

/**
 <p>The path to the Amazon S3 target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

@end

/**
 <p>A scheduling object using a <code>cron</code> statement to schedule an event.</p>
 */
@interface AWSGlueSchedule : AWSModel


/**
 <p>A <code>cron</code> expression used to specify the schedule. For more information, see <a href="http://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based Schedules for Jobs and Crawlers</a>. For example, to run something every day at 12:15 UTC, specify <code>cron(15 12 * * ? *)</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleExpression;

/**
 <p>The state of the schedule.</p>
 */
@property (nonatomic, assign) AWSGlueScheduleState state;

@end

/**
 <p>A policy that specifies update and deletion behaviors for the crawler.</p>
 */
@interface AWSGlueSchemaChangePolicy : AWSModel


/**
 <p>The deletion behavior when the crawler finds a deleted object.</p>
 */
@property (nonatomic, assign) AWSGlueDeleteBehavior deleteBehavior;

/**
 <p>The update behavior when the crawler finds a changed schema.</p>
 */
@property (nonatomic, assign) AWSGlueUpdateBehavior updateBehavior;

@end

/**
 <p>A key-value pair representing a column and data type that this transform can run against. The <code>Schema</code> parameter of the <code>MLTransform</code> may contain up to 100 of these structures.</p>
 */
@interface AWSGlueSchemaColumn : AWSModel


/**
 <p>The type of data in the column.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataType;

/**
 <p>The name of the column.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueSearchTablesRequest : AWSRequest


/**
 <p>A unique identifier, consisting of <code><i>account_id</i>/datalake</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>A list of key-value pairs, and a comparator used to filter the search results. Returns all entities matching the predicate.</p>
 */
@property (nonatomic, strong) NSArray<AWSGluePropertyPredicate *> * _Nullable filters;

/**
 <p>The maximum number of tables to return in a single response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token, included if this is a continuation call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A string used for a text search.</p><p>Specifying a value in quotes filters based on an exact match to the value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable searchText;

/**
 <p>A list of criteria for sorting the results by a field name, in an ascending or descending order.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueSortCriterion *> * _Nullable sortCriteria;

@end

/**
 
 */
@interface AWSGlueSearchTablesResponse : AWSModel


/**
 <p>A continuation token, present if the current list segment is not the last.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of the requested <code>Table</code> objects. The <code>SearchTables</code> response returns only the tables that you have access to.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueTable *> * _Nullable tableList;

@end

/**
 <p>Specifies a security configuration.</p>
 */
@interface AWSGlueSecurityConfiguration : AWSModel


/**
 <p>The time at which this security configuration was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimeStamp;

/**
 <p>The encryption configuration associated with this security configuration.</p>
 */
@property (nonatomic, strong) AWSGlueEncryptionConfiguration * _Nullable encryptionConfiguration;

/**
 <p>The name of the security configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Defines a non-overlapping region of a table's partitions, allowing multiple requests to be executed in parallel.</p>
 Required parameters: [SegmentNumber, TotalSegments]
 */
@interface AWSGlueSegment : AWSModel


/**
 <p>The zero-based index number of the segment. For example, if the total number of segments is 4, <code>SegmentNumber</code> values range from 0 through 3.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentNumber;

/**
 <p>The total number of segments.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalSegments;

@end

/**
 <p>Information about a serialization/deserialization program (SerDe) that serves as an extractor and loader.</p>
 */
@interface AWSGlueSerDeInfo : AWSModel


/**
 <p>Name of the SerDe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>These key-value pairs define initialization parameters for the SerDe.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable parameters;

/**
 <p>Usually the class that implements the SerDe. An example is <code>org.apache.hadoop.hive.serde2.columnar.ColumnarSerDe</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serializationLibrary;

@end

/**
 <p>Specifies skewed values in a table. Skewed values are those that occur with very high frequency.</p>
 */
@interface AWSGlueSkewedInfo : AWSModel


/**
 <p>A list of names of columns that contain skewed values.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable skewedColumnNames;

/**
 <p>A mapping of skewed values to the columns that contain them.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable skewedColumnValueLocationMaps;

/**
 <p>A list of values that appear so frequently as to be considered skewed.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable skewedColumnValues;

@end

/**
 <p>Specifies a field to sort by and a sort order.</p>
 */
@interface AWSGlueSortCriterion : AWSModel


/**
 <p>The name of the field on which to sort.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fieldName;

/**
 <p>An ascending or descending sort.</p>
 */
@property (nonatomic, assign) AWSGlueSort sort;

@end

/**
 
 */
@interface AWSGlueStartCrawlerRequest : AWSRequest


/**
 <p>Name of the crawler to start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueStartCrawlerResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueStartCrawlerScheduleRequest : AWSRequest


/**
 <p>Name of the crawler to schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable crawlerName;

@end

/**
 
 */
@interface AWSGlueStartCrawlerScheduleResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueStartExportLabelsTaskRunRequest : AWSRequest


/**
 <p>The Amazon S3 path where you export the labels.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3Path;

/**
 <p>The unique identifier of the machine learning transform.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 
 */
@interface AWSGlueStartExportLabelsTaskRunResponse : AWSModel


/**
 <p>The unique identifier for the task run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskRunId;

@end

/**
 
 */
@interface AWSGlueStartImportLabelsTaskRunRequest : AWSRequest


/**
 <p>The Amazon Simple Storage Service (Amazon S3) path from where you import the labels.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputS3Path;

/**
 <p>Indicates whether to overwrite your existing labels.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replaceAllLabels;

/**
 <p>The unique identifier of the machine learning transform.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 
 */
@interface AWSGlueStartImportLabelsTaskRunResponse : AWSModel


/**
 <p>The unique identifier for the task run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskRunId;

@end

/**
 
 */
@interface AWSGlueStartJobRunRequest : AWSRequest


/**
 <p>This field is deprecated. Use <code>MaxCapacity</code> instead.</p><p>The number of AWS Glue data processing units (DPUs) to allocate to this JobRun. From 2 to 100 DPUs can be allocated; the default is 10. A DPU is a relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For more information, see the <a href="https://docs.aws.amazon.com/https:/aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedCapacity;

/**
 <p>The job arguments specifically for this run. For this job run, they replace the default arguments set in the job definition itself.</p><p>You can specify arguments here that your own job-execution script consumes, as well as arguments that AWS Glue itself consumes.</p><p>For information about how to specify and consume your own Job arguments, see the <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html">Calling AWS Glue APIs in Python</a> topic in the developer guide.</p><p>For information about the key-value pairs that AWS Glue consumes to set up your job, see the <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html">Special Parameters Used by AWS Glue</a> topic in the developer guide.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable arguments;

/**
 <p>The name of the job definition to use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The ID of a previous <code>JobRun</code> to retry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobRunId;

/**
 <p>The number of AWS Glue data processing units (DPUs) that can be allocated when this job runs. A DPU is a relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For more information, see the <a href="https://docs.aws.amazon.com/https:/aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>.</p><p>Do not set <code>Max Capacity</code> if using <code>WorkerType</code> and <code>NumberOfWorkers</code>.</p><p>The value that can be allocated for <code>MaxCapacity</code> depends on whether you are running a Python shell job, or an Apache Spark ETL job:</p><ul><li><p>When you specify a Python shell job (<code>JobCommand.Name</code>="pythonshell"), you can allocate either 0.0625 or 1 DPU. The default is 0.0625 DPU.</p></li><li><p>When you specify an Apache Spark ETL job (<code>JobCommand.Name</code>="glueetl"), you can allocate from 2 to 100 DPUs. The default is 10 DPUs. This job type cannot have a fractional DPU allocation.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCapacity;

/**
 <p>Specifies configuration properties of a job run notification.</p>
 */
@property (nonatomic, strong) AWSGlueNotificationProperty * _Nullable notificationProperty;

/**
 <p>The number of workers of a defined <code>workerType</code> that are allocated when a job runs.</p><p>The maximum number of workers you can define are 299 for <code>G.1X</code>, and 149 for <code>G.2X</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfWorkers;

/**
 <p>The name of the <code>SecurityConfiguration</code> structure to be used with this job run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityConfiguration;

/**
 <p>The <code>JobRun</code> timeout in minutes. This is the maximum time that a job run can consume resources before it is terminated and enters <code>TIMEOUT</code> status. The default is 2,880 minutes (48 hours). This overrides the timeout value set in the parent job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

/**
 <p>The type of predefined worker that is allocated when a job runs. Accepts a value of Standard, G.1X, or G.2X.</p><ul><li><p>For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16 GB of memory and a 50GB disk, and 2 executors per worker.</p></li><li><p>For the <code>G.1X</code> worker type, each worker provides 4 vCPU, 16 GB of memory and a 64GB disk, and 1 executor per worker.</p></li><li><p>For the <code>G.2X</code> worker type, each worker provides 8 vCPU, 32 GB of memory and a 128GB disk, and 1 executor per worker.</p></li></ul>
 */
@property (nonatomic, assign) AWSGlueWorkerType workerType;

@end

/**
 
 */
@interface AWSGlueStartJobRunResponse : AWSModel


/**
 <p>The ID assigned to this job run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobRunId;

@end

/**
 
 */
@interface AWSGlueStartMLEvaluationTaskRunRequest : AWSRequest


/**
 <p>The unique identifier of the machine learning transform.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 
 */
@interface AWSGlueStartMLEvaluationTaskRunResponse : AWSModel


/**
 <p>The unique identifier associated with this run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskRunId;

@end

/**
 
 */
@interface AWSGlueStartMLLabelingSetGenerationTaskRunRequest : AWSRequest


/**
 <p>The Amazon Simple Storage Service (Amazon S3) path where you generate the labeling set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3Path;

/**
 <p>The unique identifier of the machine learning transform.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 
 */
@interface AWSGlueStartMLLabelingSetGenerationTaskRunResponse : AWSModel


/**
 <p>The unique run identifier that is associated with this task run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskRunId;

@end

/**
 
 */
@interface AWSGlueStartTriggerRequest : AWSRequest


/**
 <p>The name of the trigger to start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueStartTriggerResponse : AWSModel


/**
 <p>The name of the trigger that was started.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueStartWorkflowRunRequest : AWSRequest


/**
 <p>The name of the workflow to start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueStartWorkflowRunResponse : AWSModel


/**
 <p>An Id for the new run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable runId;

@end

/**
 
 */
@interface AWSGlueStopCrawlerRequest : AWSRequest


/**
 <p>Name of the crawler to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueStopCrawlerResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueStopCrawlerScheduleRequest : AWSRequest


/**
 <p>Name of the crawler whose schedule state to set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable crawlerName;

@end

/**
 
 */
@interface AWSGlueStopCrawlerScheduleResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueStopTriggerRequest : AWSRequest


/**
 <p>The name of the trigger to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueStopTriggerResponse : AWSModel


/**
 <p>The name of the trigger that was stopped.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueStopWorkflowRunRequest : AWSRequest


/**
 <p>The name of the workflow to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ID of the workflow run to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable runId;

@end

/**
 
 */
@interface AWSGlueStopWorkflowRunResponse : AWSModel


@end

/**
 <p>Describes the physical storage of table data.</p>
 */
@interface AWSGlueStorageDescriptor : AWSModel


/**
 <p>A list of reducer grouping columns, clustering columns, and bucketing columns in the table.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable bucketColumns;

/**
 <p>A list of the <code>Columns</code> in the table.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueColumn *> * _Nullable columns;

/**
 <p><code>True</code> if the data in the table is compressed, or <code>False</code> if not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable compressed;

/**
 <p>The input format: <code>SequenceFileInputFormat</code> (binary), or <code>TextInputFormat</code>, or a custom format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputFormat;

/**
 <p>The physical location of the table. By default, this takes the form of the warehouse location, followed by the database location in the warehouse, followed by the table name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>Must be specified if the table contains any dimension columns.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfBuckets;

/**
 <p>The output format: <code>SequenceFileOutputFormat</code> (binary), or <code>IgnoreKeyTextOutputFormat</code>, or a custom format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputFormat;

/**
 <p>The user-supplied properties in key-value form.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable parameters;

/**
 <p>The serialization/deserialization (SerDe) information.</p>
 */
@property (nonatomic, strong) AWSGlueSerDeInfo * _Nullable serdeInfo;

/**
 <p>The information about values that appear frequently in a column (skewed values).</p>
 */
@property (nonatomic, strong) AWSGlueSkewedInfo * _Nullable skewedInfo;

/**
 <p>A list specifying the sort order of each bucket in the table.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueOrder *> * _Nullable sortColumns;

/**
 <p><code>True</code> if the table data is stored in subdirectories, or <code>False</code> if not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable storedAsSubDirectories;

@end

/**
 <p>Represents a collection of related data organized in columns and rows.</p>
 Required parameters: [Name]
 */
@interface AWSGlueTable : AWSModel


/**
 <p>The time when the table definition was created in the Data Catalog.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The person or entity who created the table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdBy;

/**
 <p>The name of the database where the table metadata resides. For Hive compatibility, this must be all lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>A description of the table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Indicates whether the table has been registered with AWS Lake Formation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isRegisteredWithLakeFormation;

/**
 <p>The last time that the table was accessed. This is usually taken from HDFS, and might not be reliable.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastAccessTime;

/**
 <p>The last time that column statistics were computed for this table.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastAnalyzedTime;

/**
 <p>The table name. For Hive compatibility, this must be entirely lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The owner of the table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>These key-value pairs define properties associated with the table.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable parameters;

/**
 <p>A list of columns by which the table is partitioned. Only primitive types are supported as partition keys.</p><p>When you create a table used by Amazon Athena, and you do not specify any <code>partitionKeys</code>, you must at least set the value of <code>partitionKeys</code> to an empty list. For example:</p><p><code>"PartitionKeys": []</code></p>
 */
@property (nonatomic, strong) NSArray<AWSGlueColumn *> * _Nullable partitionKeys;

/**
 <p>The retention time for this table.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retention;

/**
 <p>A storage descriptor containing information about the physical storage of this table.</p>
 */
@property (nonatomic, strong) AWSGlueStorageDescriptor * _Nullable storageDescriptor;

/**
 <p>The type of this table (<code>EXTERNAL_TABLE</code>, <code>VIRTUAL_VIEW</code>, etc.).</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableType;

/**
 <p>The last time that the table was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

/**
 <p>If the table is a view, the expanded text of the view; otherwise <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable viewExpandedText;

/**
 <p>If the table is a view, the original text of the view; otherwise <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable viewOriginalText;

@end

/**
 <p>An error record for table operations.</p>
 */
@interface AWSGlueTableError : AWSModel


/**
 <p>The details about the error.</p>
 */
@property (nonatomic, strong) AWSGlueErrorDetail * _Nullable errorDetail;

/**
 <p>The name of the table. For Hive compatibility, this must be entirely lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>A structure used to define a table.</p>
 Required parameters: [Name]
 */
@interface AWSGlueTableInput : AWSModel


/**
 <p>A description of the table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The last time that the table was accessed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastAccessTime;

/**
 <p>The last time that column statistics were computed for this table.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastAnalyzedTime;

/**
 <p>The table name. For Hive compatibility, this is folded to lowercase when it is stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The table owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>These key-value pairs define properties associated with the table.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable parameters;

/**
 <p>A list of columns by which the table is partitioned. Only primitive types are supported as partition keys.</p><p>When you create a table used by Amazon Athena, and you do not specify any <code>partitionKeys</code>, you must at least set the value of <code>partitionKeys</code> to an empty list. For example:</p><p><code>"PartitionKeys": []</code></p>
 */
@property (nonatomic, strong) NSArray<AWSGlueColumn *> * _Nullable partitionKeys;

/**
 <p>The retention time for this table.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retention;

/**
 <p>A storage descriptor containing information about the physical storage of this table.</p>
 */
@property (nonatomic, strong) AWSGlueStorageDescriptor * _Nullable storageDescriptor;

/**
 <p>The type of this table (<code>EXTERNAL_TABLE</code>, <code>VIRTUAL_VIEW</code>, etc.).</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableType;

/**
 <p>If the table is a view, the expanded text of the view; otherwise <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable viewExpandedText;

/**
 <p>If the table is a view, the original text of the view; otherwise <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable viewOriginalText;

@end

/**
 <p>Specifies a version of a table.</p>
 */
@interface AWSGlueTableVersion : AWSModel


/**
 <p>The table in question.</p>
 */
@property (nonatomic, strong) AWSGlueTable * _Nullable table;

/**
 <p>The ID value that identifies this table version. A <code>VersionId</code> is a string representation of an integer. Each version is incremented by 1.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>An error record for table-version operations.</p>
 */
@interface AWSGlueTableVersionError : AWSModel


/**
 <p>The details about the error.</p>
 */
@property (nonatomic, strong) AWSGlueErrorDetail * _Nullable errorDetail;

/**
 <p>The name of the table in question.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

/**
 <p>The ID value of the version in question. A <code>VersionID</code> is a string representation of an integer. Each version is incremented by 1.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSGlueTagResourceRequest : AWSRequest


/**
 <p>The ARN of the AWS Glue resource to which to add the tags. For more information about AWS Glue resource ARNs, see the <a href="https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-common.html#aws-glue-api-regex-aws-glue-arn-id">AWS Glue ARN string pattern</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>Tags to add to this resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tagsToAdd;

@end

/**
 
 */
@interface AWSGlueTagResourceResponse : AWSModel


@end

/**
 <p>The sampling parameters that are associated with the machine learning transform.</p>
 */
@interface AWSGlueTaskRun : AWSModel


/**
 <p>The last point in time that the requested task run was completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completedOn;

/**
 <p>The list of error strings associated with this task run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorString;

/**
 <p>The amount of time (in seconds) that the task run consumed resources.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable executionTime;

/**
 <p>The last point in time that the requested task run was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedOn;

/**
 <p>The names of the log group for secure logging, associated with this task run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>Specifies configuration properties associated with this task run.</p>
 */
@property (nonatomic, strong) AWSGlueTaskRunProperties * _Nullable properties;

/**
 <p>The date and time that this task run started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedOn;

/**
 <p>The current status of the requested task run.</p>
 */
@property (nonatomic, assign) AWSGlueTaskStatusType status;

/**
 <p>The unique identifier for this task run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskRunId;

/**
 <p>The unique identifier for the transform.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 <p>The criteria that are used to filter the task runs for the machine learning transform.</p>
 */
@interface AWSGlueTaskRunFilterCriteria : AWSModel


/**
 <p>Filter on task runs started after this date.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedAfter;

/**
 <p>Filter on task runs started before this date.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedBefore;

/**
 <p>The current status of the task run.</p>
 */
@property (nonatomic, assign) AWSGlueTaskStatusType status;

/**
 <p>The type of task run.</p>
 */
@property (nonatomic, assign) AWSGlueTaskType taskRunType;

@end

/**
 <p>The configuration properties for the task run.</p>
 */
@interface AWSGlueTaskRunProperties : AWSModel


/**
 <p>The configuration properties for an exporting labels task run.</p>
 */
@property (nonatomic, strong) AWSGlueExportLabelsTaskRunProperties * _Nullable exportLabelsTaskRunProperties;

/**
 <p>The configuration properties for a find matches task run.</p>
 */
@property (nonatomic, strong) AWSGlueFindMatchesTaskRunProperties * _Nullable findMatchesTaskRunProperties;

/**
 <p>The configuration properties for an importing labels task run.</p>
 */
@property (nonatomic, strong) AWSGlueImportLabelsTaskRunProperties * _Nullable importLabelsTaskRunProperties;

/**
 <p>The configuration properties for a labeling set generation task run.</p>
 */
@property (nonatomic, strong) AWSGlueLabelingSetGenerationTaskRunProperties * _Nullable labelingSetGenerationTaskRunProperties;

/**
 <p>The type of task run.</p>
 */
@property (nonatomic, assign) AWSGlueTaskType taskType;

@end

/**
 <p>The sorting criteria that are used to sort the list of task runs for the machine learning transform.</p>
 Required parameters: [Column, SortDirection]
 */
@interface AWSGlueTaskRunSortCriteria : AWSModel


/**
 <p>The column to be used to sort the list of task runs for the machine learning transform.</p>
 */
@property (nonatomic, assign) AWSGlueTaskRunSortColumnType column;

/**
 <p>The sort direction to be used to sort the list of task runs for the machine learning transform.</p>
 */
@property (nonatomic, assign) AWSGlueSortDirectionType sortDirection;

@end

/**
 <p>The criteria used to filter the machine learning transforms.</p>
 */
@interface AWSGlueTransformFilterCriteria : AWSModel


/**
 <p>The time and date after which the transforms were created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAfter;

/**
 <p>The time and date before which the transforms were created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdBefore;

/**
 <p>This value determines which version of AWS Glue this machine learning transform is compatible with. Glue 1.0 is recommended for most customers. If the value is not set, the Glue compatibility defaults to Glue 0.9. For more information, see <a href="https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions">AWS Glue Versions</a> in the developer guide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable glueVersion;

/**
 <p>Filter on transforms last modified after this date.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedAfter;

/**
 <p>Filter on transforms last modified before this date.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedBefore;

/**
 <p>A unique transform name that is used to filter the machine learning transforms.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Filters on datasets with a specific schema. The <code>Map&lt;Column, Type&gt;</code> object is an array of key-value pairs representing the schema this transform accepts, where <code>Column</code> is the name of a column, and <code>Type</code> is the type of the data such as an integer or string. Has an upper bound of 100 columns.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueSchemaColumn *> * _Nullable schema;

/**
 <p>Filters the list of machine learning transforms by the last known status of the transforms (to indicate whether a transform can be used or not). One of "NOT_READY", "READY", or "DELETING".</p>
 */
@property (nonatomic, assign) AWSGlueTransformStatusType status;

/**
 <p>The type of machine learning transform that is used to filter the machine learning transforms.</p>
 */
@property (nonatomic, assign) AWSGlueTransformType transformType;

@end

/**
 <p>The algorithm-specific parameters that are associated with the machine learning transform.</p>
 Required parameters: [TransformType]
 */
@interface AWSGlueTransformParameters : AWSModel


/**
 <p>The parameters for the find matches algorithm.</p>
 */
@property (nonatomic, strong) AWSGlueFindMatchesParameters * _Nullable findMatchesParameters;

/**
 <p>The type of machine learning transform.</p><p>For information about the types of machine learning transforms, see <a href="http://docs.aws.amazon.com/glue/latest/dg/add-job-machine-learning-transform.html">Creating Machine Learning Transforms</a>.</p>
 */
@property (nonatomic, assign) AWSGlueTransformType transformType;

@end

/**
 <p>The sorting criteria that are associated with the machine learning transform.</p>
 Required parameters: [Column, SortDirection]
 */
@interface AWSGlueTransformSortCriteria : AWSModel


/**
 <p>The column to be used in the sorting criteria that are associated with the machine learning transform.</p>
 */
@property (nonatomic, assign) AWSGlueTransformSortColumnType column;

/**
 <p>The sort direction to be used in the sorting criteria that are associated with the machine learning transform.</p>
 */
@property (nonatomic, assign) AWSGlueSortDirectionType sortDirection;

@end

/**
 <p>Information about a specific trigger.</p>
 */
@interface AWSGlueTrigger : AWSModel


/**
 <p>The actions initiated by this trigger.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueAction *> * _Nullable actions;

/**
 <p>A description of this trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Reserved for future use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The predicate of this trigger, which defines when it will fire.</p>
 */
@property (nonatomic, strong) AWSGluePredicate * _Nullable predicate;

/**
 <p>A <code>cron</code> expression used to specify the schedule (see <a href="https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based Schedules for Jobs and Crawlers</a>. For example, to run something every day at 12:15 UTC, you would specify: <code>cron(15 12 * * ? *)</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

/**
 <p>The current state of the trigger.</p>
 */
@property (nonatomic, assign) AWSGlueTriggerState state;

/**
 <p>The type of trigger that this is.</p>
 */
@property (nonatomic, assign) AWSGlueTriggerType types;

/**
 <p>The name of the workflow associated with the trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workflowName;

@end

/**
 <p>The details of a Trigger node present in the workflow.</p>
 */
@interface AWSGlueTriggerNodeDetails : AWSModel


/**
 <p>The information of the trigger represented by the trigger node.</p>
 */
@property (nonatomic, strong) AWSGlueTrigger * _Nullable trigger;

@end

/**
 <p>A structure used to provide information used to update a trigger. This object updates the previous trigger definition by overwriting it completely.</p>
 */
@interface AWSGlueTriggerUpdate : AWSModel


/**
 <p>The actions initiated by this trigger.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueAction *> * _Nullable actions;

/**
 <p>A description of this trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Reserved for future use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The predicate of this trigger, which defines when it will fire.</p>
 */
@property (nonatomic, strong) AWSGluePredicate * _Nullable predicate;

/**
 <p>A <code>cron</code> expression used to specify the schedule (see <a href="https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based Schedules for Jobs and Crawlers</a>. For example, to run something every day at 12:15 UTC, you would specify: <code>cron(15 12 * * ? *)</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

@end

/**
 
 */
@interface AWSGlueUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource from which to remove the tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>Tags to remove from this resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagsToRemove;

@end

/**
 
 */
@interface AWSGlueUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueUpdateClassifierRequest : AWSRequest


/**
 <p>A <code>CsvClassifier</code> object with updated fields.</p>
 */
@property (nonatomic, strong) AWSGlueUpdateCsvClassifierRequest * _Nullable csvClassifier;

/**
 <p>A <code>GrokClassifier</code> object with updated fields.</p>
 */
@property (nonatomic, strong) AWSGlueUpdateGrokClassifierRequest * _Nullable grokClassifier;

/**
 <p>A <code>JsonClassifier</code> object with updated fields.</p>
 */
@property (nonatomic, strong) AWSGlueUpdateJsonClassifierRequest * _Nullable jsonClassifier;

/**
 <p>An <code>XMLClassifier</code> object with updated fields.</p>
 */
@property (nonatomic, strong) AWSGlueUpdateXMLClassifierRequest * _Nullable XMLClassifier;

@end

/**
 
 */
@interface AWSGlueUpdateClassifierResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueUpdateConnectionRequest : AWSRequest


/**
 <p>The ID of the Data Catalog in which the connection resides. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>A <code>ConnectionInput</code> object that redefines the connection in question.</p>
 */
@property (nonatomic, strong) AWSGlueConnectionInput * _Nullable connectionInput;

/**
 <p>The name of the connection definition to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueUpdateConnectionResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueUpdateCrawlerRequest : AWSRequest


/**
 <p>A list of custom classifiers that the user has registered. By default, all built-in classifiers are included in a crawl, but these custom classifiers always override the default classifiers for a given classification.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable classifiers;

/**
 <p>The crawler configuration information. This versioned JSON string allows users to specify aspects of a crawler's behavior. For more information, see <a href="http://docs.aws.amazon.com/glue/latest/dg/crawler-configuration.html">Configuring a Crawler</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configuration;

/**
 <p>The name of the <code>SecurityConfiguration</code> structure to be used by this crawler.</p>
 */
@property (nonatomic, strong) NSString * _Nullable crawlerSecurityConfiguration;

/**
 <p>The AWS Glue database where results are stored, such as: <code>arn:aws:daylight:us-east-1::database/sometable/*</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>A description of the new crawler.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Name of the new crawler.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The IAM role or Amazon Resource Name (ARN) of an IAM role that is used by the new crawler to access customer resources.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>A <code>cron</code> expression used to specify the schedule. For more information, see <a href="http://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based Schedules for Jobs and Crawlers</a>. For example, to run something every day at 12:15 UTC, specify <code>cron(15 12 * * ? *)</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

/**
 <p>The policy for the crawler's update and deletion behavior.</p>
 */
@property (nonatomic, strong) AWSGlueSchemaChangePolicy * _Nullable schemaChangePolicy;

/**
 <p>The table prefix used for catalog tables that are created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tablePrefix;

/**
 <p>A list of targets to crawl.</p>
 */
@property (nonatomic, strong) AWSGlueCrawlerTargets * _Nullable targets;

@end

/**
 
 */
@interface AWSGlueUpdateCrawlerResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueUpdateCrawlerScheduleRequest : AWSRequest


/**
 <p>The name of the crawler whose schedule to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable crawlerName;

/**
 <p>The updated <code>cron</code> expression used to specify the schedule. For more information, see <a href="http://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based Schedules for Jobs and Crawlers</a>. For example, to run something every day at 12:15 UTC, specify <code>cron(15 12 * * ? *)</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

@end

/**
 
 */
@interface AWSGlueUpdateCrawlerScheduleResponse : AWSModel


@end

/**
 <p>Specifies a custom CSV classifier to be updated.</p>
 Required parameters: [Name]
 */
@interface AWSGlueUpdateCsvClassifierRequest : AWSModel


/**
 <p>Enables the processing of files that contain only one column.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowSingleColumn;

/**
 <p>Indicates whether the CSV file contains a header.</p>
 */
@property (nonatomic, assign) AWSGlueCsvHeaderOption containsHeader;

/**
 <p>A custom symbol to denote what separates each column entry in the row.</p>
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 <p>Specifies not to trim values before identifying the type of column values. The default value is true.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableValueTrimming;

/**
 <p>A list of strings representing column names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable header;

/**
 <p>The name of the classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A custom symbol to denote what combines content into a single column value. It must be different from the column delimiter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable quoteSymbol;

@end

/**
 
 */
@interface AWSGlueUpdateDatabaseRequest : AWSRequest


/**
 <p>The ID of the Data Catalog in which the metadata database resides. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>A <code>DatabaseInput</code> object specifying the new definition of the metadata database in the catalog.</p>
 */
@property (nonatomic, strong) AWSGlueDatabaseInput * _Nullable databaseInput;

/**
 <p>The name of the database to update in the catalog. For Hive compatibility, this is folded to lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueUpdateDatabaseResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueUpdateDevEndpointRequest : AWSRequest


/**
 <p>The map of arguments to add the map of arguments used to configure the <code>DevEndpoint</code>.</p><p>Valid arguments are:</p><ul><li><p><code>"--enable-glue-datacatalog": ""</code></p></li><li><p><code>"GLUE_PYTHON_VERSION": "3"</code></p></li><li><p><code>"GLUE_PYTHON_VERSION": "2"</code></p></li></ul><p>You can specify a version of Python support for development endpoints by using the <code>Arguments</code> parameter in the <code>CreateDevEndpoint</code> or <code>UpdateDevEndpoint</code> APIs. If no arguments are provided, the version defaults to Python 2.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable addArguments;

/**
 <p>The list of public keys for the <code>DevEndpoint</code> to use.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable addPublicKeys;

/**
 <p>Custom Python or Java libraries to be loaded in the <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) AWSGlueDevEndpointCustomLibraries * _Nullable customLibraries;

/**
 <p>The list of argument keys to be deleted from the map of arguments used to configure the <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable deleteArguments;

/**
 <p>The list of public keys to be deleted from the <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable deletePublicKeys;

/**
 <p>The name of the <code>DevEndpoint</code> to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

/**
 <p>The public key for the <code>DevEndpoint</code> to use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicKey;

/**
 <p><code>True</code> if the list of custom libraries to be loaded in the development endpoint needs to be updated, or <code>False</code> if otherwise.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable updateEtlLibraries;

@end

/**
 
 */
@interface AWSGlueUpdateDevEndpointResponse : AWSModel


@end

/**
 <p>Specifies a grok classifier to update when passed to <code>UpdateClassifier</code>.</p>
 Required parameters: [Name]
 */
@interface AWSGlueUpdateGrokClassifierRequest : AWSModel


/**
 <p>An identifier of the data format that the classifier matches, such as Twitter, JSON, Omniture logs, Amazon CloudWatch Logs, and so on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable classification;

/**
 <p>Optional custom grok patterns used by this classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customPatterns;

/**
 <p>The grok pattern used by this classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grokPattern;

/**
 <p>The name of the <code>GrokClassifier</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueUpdateJobRequest : AWSRequest


/**
 <p>The name of the job definition to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>Specifies the values with which to update the job definition.</p>
 */
@property (nonatomic, strong) AWSGlueJobUpdate * _Nullable jobUpdate;

@end

/**
 
 */
@interface AWSGlueUpdateJobResponse : AWSModel


/**
 <p>Returns the name of the updated job definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

@end

/**
 <p>Specifies a JSON classifier to be updated.</p>
 Required parameters: [Name]
 */
@interface AWSGlueUpdateJsonClassifierRequest : AWSModel


/**
 <p>A <code>JsonPath</code> string defining the JSON data for the classifier to classify. AWS Glue supports a subset of <code>JsonPath</code>, as described in <a href="https://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html#custom-classifier-json">Writing JsonPath Custom Classifiers</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jsonPath;

/**
 <p>The name of the classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueUpdateMLTransformRequest : AWSRequest


/**
 <p>A description of the transform. The default is an empty string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>This value determines which version of AWS Glue this machine learning transform is compatible with. Glue 1.0 is recommended for most customers. If the value is not set, the Glue compatibility defaults to Glue 0.9. For more information, see <a href="https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions">AWS Glue Versions</a> in the developer guide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable glueVersion;

/**
 <p>The number of AWS Glue data processing units (DPUs) that are allocated to task runs for this transform. You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For more information, see the <a href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>. </p><p>When the <code>WorkerType</code> field is set to a value other than <code>Standard</code>, the <code>MaxCapacity</code> field is set automatically and becomes read-only.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCapacity;

/**
 <p>The maximum number of times to retry a task for this transform after a task run fails.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRetries;

/**
 <p>The unique name that you gave the transform when you created it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The number of workers of a defined <code>workerType</code> that are allocated when this task runs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfWorkers;

/**
 <p>The configuration parameters that are specific to the transform type (algorithm) used. Conditionally dependent on the transform type.</p>
 */
@property (nonatomic, strong) AWSGlueTransformParameters * _Nullable parameters;

/**
 <p>The name or Amazon Resource Name (ARN) of the IAM role with the required permissions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>The timeout for a task run for this transform in minutes. This is the maximum time that a task run for this transform can consume resources before it is terminated and enters <code>TIMEOUT</code> status. The default is 2,880 minutes (48 hours).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeout;

/**
 <p>A unique identifier that was generated when the transform was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

/**
 <p>The type of predefined worker that is allocated when this task runs. Accepts a value of Standard, G.1X, or G.2X.</p><ul><li><p>For the <code>Standard</code> worker type, each worker provides 4 vCPU, 16 GB of memory and a 50GB disk, and 2 executors per worker.</p></li><li><p>For the <code>G.1X</code> worker type, each worker provides 4 vCPU, 16 GB of memory and a 64GB disk, and 1 executor per worker.</p></li><li><p>For the <code>G.2X</code> worker type, each worker provides 8 vCPU, 32 GB of memory and a 128GB disk, and 1 executor per worker.</p></li></ul>
 */
@property (nonatomic, assign) AWSGlueWorkerType workerType;

@end

/**
 
 */
@interface AWSGlueUpdateMLTransformResponse : AWSModel


/**
 <p>The unique identifier for the transform that was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 
 */
@interface AWSGlueUpdatePartitionRequest : AWSRequest


/**
 <p>The ID of the Data Catalog where the partition to be updated resides. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the catalog database in which the table in question resides.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The new partition object to update the partition to.</p>
 */
@property (nonatomic, strong) AWSGluePartitionInput * _Nullable partitionInput;

/**
 <p>A list of the values defining the partition.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable partitionValueList;

/**
 <p>The name of the table in which the partition to be updated is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSGlueUpdatePartitionResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueUpdateTableRequest : AWSRequest


/**
 <p>The ID of the Data Catalog where the table resides. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the catalog database in which the table resides. For Hive compatibility, this name is entirely lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>By default, <code>UpdateTable</code> always creates an archived version of the table before updating it. However, if <code>skipArchive</code> is set to true, <code>UpdateTable</code> does not create the archived version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable skipArchive;

/**
 <p>An updated <code>TableInput</code> object to define the metadata table in the catalog.</p>
 */
@property (nonatomic, strong) AWSGlueTableInput * _Nullable tableInput;

@end

/**
 
 */
@interface AWSGlueUpdateTableResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueUpdateTriggerRequest : AWSRequest


/**
 <p>The name of the trigger to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The new values with which to update the trigger.</p>
 */
@property (nonatomic, strong) AWSGlueTriggerUpdate * _Nullable triggerUpdate;

@end

/**
 
 */
@interface AWSGlueUpdateTriggerResponse : AWSModel


/**
 <p>The resulting trigger definition.</p>
 */
@property (nonatomic, strong) AWSGlueTrigger * _Nullable trigger;

@end

/**
 
 */
@interface AWSGlueUpdateUserDefinedFunctionRequest : AWSRequest


/**
 <p>The ID of the Data Catalog where the function to be updated is located. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The name of the catalog database where the function to be updated is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>A <code>FunctionInput</code> object that redefines the function in the Data Catalog.</p>
 */
@property (nonatomic, strong) AWSGlueUserDefinedFunctionInput * _Nullable functionInput;

/**
 <p>The name of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

@end

/**
 
 */
@interface AWSGlueUpdateUserDefinedFunctionResponse : AWSModel


@end

/**
 
 */
@interface AWSGlueUpdateWorkflowRequest : AWSRequest


/**
 <p>A collection of properties to be used as part of each execution of the workflow.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable defaultRunProperties;

/**
 <p>The description of the workflow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Name of the workflow to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGlueUpdateWorkflowResponse : AWSModel


/**
 <p>The name of the workflow which was specified in input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Specifies an XML classifier to be updated.</p>
 Required parameters: [Name]
 */
@interface AWSGlueUpdateXMLClassifierRequest : AWSModel


/**
 <p>An identifier of the data format that the classifier matches.</p>
 */
@property (nonatomic, strong) NSString * _Nullable classification;

/**
 <p>The name of the classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The XML tag designating the element that contains each record in an XML document being parsed. This cannot identify a self-closing element (closed by <code>/&gt;</code>). An empty row element that contains only attributes can be parsed as long as it ends with a closing tag (for example, <code>&lt;row item_a="A" item_b="B"&gt;&lt;/row&gt;</code> is okay, but <code>&lt;row item_a="A" item_b="B" /&gt;</code> is not).</p>
 */
@property (nonatomic, strong) NSString * _Nullable rowTag;

@end

/**
 <p>Represents the equivalent of a Hive user-defined function (<code>UDF</code>) definition.</p>
 */
@interface AWSGlueUserDefinedFunction : AWSModel


/**
 <p>The Java class that contains the function code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable className;

/**
 <p>The time at which the function was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The name of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The owner of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerName;

/**
 <p>The owner type.</p>
 */
@property (nonatomic, assign) AWSGluePrincipalType ownerType;

/**
 <p>The resource URIs for the function.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueResourceUri *> * _Nullable resourceUris;

@end

/**
 <p>A structure used to create or update a user-defined function.</p>
 */
@interface AWSGlueUserDefinedFunctionInput : AWSModel


/**
 <p>The Java class that contains the function code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable className;

/**
 <p>The name of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p>The owner of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerName;

/**
 <p>The owner type.</p>
 */
@property (nonatomic, assign) AWSGluePrincipalType ownerType;

/**
 <p>The resource URIs for the function.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueResourceUri *> * _Nullable resourceUris;

@end

/**
 <p>A workflow represents a flow in which AWS Glue components should be executed to complete a logical task.</p>
 */
@interface AWSGlueWorkflow : AWSModel


/**
 <p>The date and time when the workflow was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdOn;

/**
 <p>A collection of properties to be used as part of each execution of the workflow.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable defaultRunProperties;

/**
 <p>A description of the workflow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The graph representing all the AWS Glue components that belong to the workflow as nodes and directed connections between them as edges.</p>
 */
@property (nonatomic, strong) AWSGlueWorkflowGraph * _Nullable graph;

/**
 <p>The date and time when the workflow was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedOn;

/**
 <p>The information about the last execution of the workflow.</p>
 */
@property (nonatomic, strong) AWSGlueWorkflowRun * _Nullable lastRun;

/**
 <p>The name of the workflow representing the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>A workflow graph represents the complete workflow containing all the AWS Glue components present in the workflow and all the directed connections between them.</p>
 */
@interface AWSGlueWorkflowGraph : AWSModel


/**
 <p>A list of all the directed connections between the nodes belonging to the workflow.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueEdge *> * _Nullable edges;

/**
 <p>A list of the the AWS Glue components belong to the workflow represented as nodes.</p>
 */
@property (nonatomic, strong) NSArray<AWSGlueNode *> * _Nullable nodes;

@end

/**
 <p>A workflow run is an execution of a workflow providing all the runtime information.</p>
 */
@interface AWSGlueWorkflowRun : AWSModel


/**
 <p>The date and time when the workflow run completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completedOn;

/**
 <p>The graph representing all the AWS Glue components that belong to the workflow as nodes and directed connections between them as edges.</p>
 */
@property (nonatomic, strong) AWSGlueWorkflowGraph * _Nullable graph;

/**
 <p>Name of the workflow which was executed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The date and time when the workflow run was started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedOn;

/**
 <p>The statistics of the run.</p>
 */
@property (nonatomic, strong) AWSGlueWorkflowRunStatistics * _Nullable statistics;

/**
 <p>The status of the workflow run.</p>
 */
@property (nonatomic, assign) AWSGlueWorkflowRunStatus status;

/**
 <p>The ID of this workflow run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workflowRunId;

/**
 <p>The workflow run properties which were set during the run.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable workflowRunProperties;

@end

/**
 <p>Workflow run statistics provides statistics about the workflow run.</p>
 */
@interface AWSGlueWorkflowRunStatistics : AWSModel


/**
 <p>Total number of Actions which have failed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failedActions;

/**
 <p>Total number Actions in running state.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable runningActions;

/**
 <p>Total number of Actions which have stopped.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable stoppedActions;

/**
 <p>Total number of Actions which have succeeded.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable succeededActions;

/**
 <p>Total number of Actions which timed out.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutActions;

/**
 <p>Total number of Actions in the workflow run.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalActions;

@end

/**
 <p>A classifier for <code>XML</code> content.</p>
 Required parameters: [Name, Classification]
 */
@interface AWSGlueXMLClassifier : AWSModel


/**
 <p>An identifier of the data format that the classifier matches.</p>
 */
@property (nonatomic, strong) NSString * _Nullable classification;

/**
 <p>The time that this classifier was registered.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The time that this classifier was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdated;

/**
 <p>The name of the classifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The XML tag designating the element that contains each record in an XML document being parsed. This can't identify a self-closing element (closed by <code>/&gt;</code>). An empty row element that contains only attributes can be parsed as long as it ends with a closing tag (for example, <code>&lt;row item_a="A" item_b="B"&gt;&lt;/row&gt;</code> is okay, but <code>&lt;row item_a="A" item_b="B" /&gt;</code> is not).</p>
 */
@property (nonatomic, strong) NSString * _Nullable rowTag;

/**
 <p>The version of this classifier.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

NS_ASSUME_NONNULL_END
