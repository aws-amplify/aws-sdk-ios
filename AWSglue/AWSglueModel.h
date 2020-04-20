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

FOUNDATION_EXPORT NSString *const AWSglueErrorDomain;

typedef NS_ENUM(NSInteger, AWSglueErrorType) {
    AWSglueErrorUnknown,
    AWSglueErrorAccessDenied,
    AWSglueErrorAlreadyExists,
    AWSglueErrorConcurrentModification,
    AWSglueErrorConcurrentRunsExceeded,
    AWSglueErrorConditionCheckFailure,
    AWSglueErrorCrawlerNotRunning,
    AWSglueErrorCrawlerRunning,
    AWSglueErrorCrawlerStopping,
    AWSglueErrorEntityNotFound,
    AWSglueErrorGlueEncryption,
    AWSglueErrorIdempotentParameterMismatch,
    AWSglueErrorInternalService,
    AWSglueErrorInvalidInput,
    AWSglueErrorMLTransformNotReady,
    AWSglueErrorNoSchedule,
    AWSglueErrorOperationTimeout,
    AWSglueErrorResourceNumberLimitExceeded,
    AWSglueErrorSchedulerNotRunning,
    AWSglueErrorSchedulerRunning,
    AWSglueErrorSchedulerTransitioning,
    AWSglueErrorValidation,
    AWSglueErrorVersionMismatch,
};

typedef NS_ENUM(NSInteger, AWSglueCatalogEncryptionMode) {
    AWSglueCatalogEncryptionModeUnknown,
    AWSglueCatalogEncryptionModeDisabled,
    AWSglueCatalogEncryptionModeSseKms,
};

typedef NS_ENUM(NSInteger, AWSglueCloudWatchEncryptionMode) {
    AWSglueCloudWatchEncryptionModeUnknown,
    AWSglueCloudWatchEncryptionModeDisabled,
    AWSglueCloudWatchEncryptionModeSseKms,
};

typedef NS_ENUM(NSInteger, AWSglueComparator) {
    AWSglueComparatorUnknown,
    AWSglueComparatorEquals,
    AWSglueComparatorGreaterThan,
    AWSglueComparatorLessThan,
    AWSglueComparatorGreaterThanEquals,
    AWSglueComparatorLessThanEquals,
};

typedef NS_ENUM(NSInteger, AWSglueConnectionPropertyKey) {
    AWSglueConnectionPropertyKeyUnknown,
    AWSglueConnectionPropertyKeyHost,
    AWSglueConnectionPropertyKeyPort,
    AWSglueConnectionPropertyKeyUsername,
    AWSglueConnectionPropertyKeyPassword,
    AWSglueConnectionPropertyKeyEncryptedPassword,
    AWSglueConnectionPropertyKeyJdbcDriverJarUri,
    AWSglueConnectionPropertyKeyJdbcDriverClassName,
    AWSglueConnectionPropertyKeyJdbcEngine,
    AWSglueConnectionPropertyKeyJdbcEngineVersion,
    AWSglueConnectionPropertyKeyConfigFiles,
    AWSglueConnectionPropertyKeyInstanceId,
    AWSglueConnectionPropertyKeyJdbcConnectionUrl,
    AWSglueConnectionPropertyKeyJdbcEnforceSsl,
    AWSglueConnectionPropertyKeyCustomJdbcCert,
    AWSglueConnectionPropertyKeySkipCustomJdbcCertValidation,
    AWSglueConnectionPropertyKeyCustomJdbcCertString,
    AWSglueConnectionPropertyKeyConnectionUrl,
    AWSglueConnectionPropertyKeyKafkaBootstrapServers,
};

typedef NS_ENUM(NSInteger, AWSglueConnectionType) {
    AWSglueConnectionTypeUnknown,
    AWSglueConnectionTypeJdbc,
    AWSglueConnectionTypeSftp,
    AWSglueConnectionTypeMongodb,
    AWSglueConnectionTypeKafka,
};

typedef NS_ENUM(NSInteger, AWSglueCrawlState) {
    AWSglueCrawlStateUnknown,
    AWSglueCrawlStateRunning,
    AWSglueCrawlStateSucceeded,
    AWSglueCrawlStateCancelled,
    AWSglueCrawlStateFailed,
};

typedef NS_ENUM(NSInteger, AWSglueCrawlerState) {
    AWSglueCrawlerStateUnknown,
    AWSglueCrawlerStateReady,
    AWSglueCrawlerStateRunning,
    AWSglueCrawlerStateStopping,
};

typedef NS_ENUM(NSInteger, AWSglueCsvHeaderOption) {
    AWSglueCsvHeaderOptionUnknown,
    AWSglueCsvHeaderOptionPresent,
    AWSglueCsvHeaderOptionAbsent,
};

typedef NS_ENUM(NSInteger, AWSglueDeleteBehavior) {
    AWSglueDeleteBehaviorUnknown,
    AWSglueDeleteBehaviorLog,
    AWSglueDeleteBehaviorDeleteFromDatabase,
    AWSglueDeleteBehaviorDeprecateInDatabase,
};

typedef NS_ENUM(NSInteger, AWSglueExistCondition) {
    AWSglueExistConditionUnknown,
    AWSglueExistConditionMustExist,
    AWSglueExistConditionNotExist,
    AWSglueExistConditionNone,
};

typedef NS_ENUM(NSInteger, AWSglueJobBookmarksEncryptionMode) {
    AWSglueJobBookmarksEncryptionModeUnknown,
    AWSglueJobBookmarksEncryptionModeDisabled,
    AWSglueJobBookmarksEncryptionModeCseKms,
};

typedef NS_ENUM(NSInteger, AWSglueJobRunState) {
    AWSglueJobRunStateUnknown,
    AWSglueJobRunStateStarting,
    AWSglueJobRunStateRunning,
    AWSglueJobRunStateStopping,
    AWSglueJobRunStateStopped,
    AWSglueJobRunStateSucceeded,
    AWSglueJobRunStateFailed,
    AWSglueJobRunStateTimeout,
};

typedef NS_ENUM(NSInteger, AWSglueLanguage) {
    AWSglueLanguageUnknown,
    AWSglueLanguagePython,
    AWSglueLanguageScala,
};

typedef NS_ENUM(NSInteger, AWSglueLastCrawlStatus) {
    AWSglueLastCrawlStatusUnknown,
    AWSglueLastCrawlStatusSucceeded,
    AWSglueLastCrawlStatusCancelled,
    AWSglueLastCrawlStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSglueLogical) {
    AWSglueLogicalUnknown,
    AWSglueLogicalAnd,
    AWSglueLogicalAny,
};

typedef NS_ENUM(NSInteger, AWSglueLogicalOperator) {
    AWSglueLogicalOperatorUnknown,
    AWSglueLogicalOperatorEquals,
};

typedef NS_ENUM(NSInteger, AWSglueNodeType) {
    AWSglueNodeTypeUnknown,
    AWSglueNodeTypeCrawler,
    AWSglueNodeTypeJob,
    AWSglueNodeTypeTrigger,
};

typedef NS_ENUM(NSInteger, AWSgluePermission) {
    AWSgluePermissionUnknown,
    AWSgluePermissionAll,
    AWSgluePermissionSelect,
    AWSgluePermissionAlter,
    AWSgluePermissionDrop,
    AWSgluePermissionDelete,
    AWSgluePermissionInsert,
    AWSgluePermissionCreateDatabase,
    AWSgluePermissionCreateTable,
    AWSgluePermissionDataLocationAccess,
};

typedef NS_ENUM(NSInteger, AWSgluePrincipalType) {
    AWSgluePrincipalTypeUnknown,
    AWSgluePrincipalTypeUser,
    AWSgluePrincipalTypeRole,
    AWSgluePrincipalTypeGroup,
};

typedef NS_ENUM(NSInteger, AWSglueResourceType) {
    AWSglueResourceTypeUnknown,
    AWSglueResourceTypeJar,
    AWSglueResourceTypeFile,
    AWSglueResourceTypeArchive,
};

typedef NS_ENUM(NSInteger, AWSglueS3EncryptionMode) {
    AWSglueS3EncryptionModeUnknown,
    AWSglueS3EncryptionModeDisabled,
    AWSglueS3EncryptionModeSseKms,
    AWSglueS3EncryptionModeSseS3,
};

typedef NS_ENUM(NSInteger, AWSglueScheduleState) {
    AWSglueScheduleStateUnknown,
    AWSglueScheduleStateScheduled,
    AWSglueScheduleStateNotScheduled,
    AWSglueScheduleStateTransitioning,
};

typedef NS_ENUM(NSInteger, AWSglueSort) {
    AWSglueSortUnknown,
    AWSglueSortAsc,
    AWSglueSortDesc,
};

typedef NS_ENUM(NSInteger, AWSglueSortDirectionType) {
    AWSglueSortDirectionTypeUnknown,
    AWSglueSortDirectionTypeDescending,
    AWSglueSortDirectionTypeAscending,
};

typedef NS_ENUM(NSInteger, AWSglueTaskRunSortColumnType) {
    AWSglueTaskRunSortColumnTypeUnknown,
    AWSglueTaskRunSortColumnTypeTaskRunType,
    AWSglueTaskRunSortColumnTypeStatus,
    AWSglueTaskRunSortColumnTypeStarted,
};

typedef NS_ENUM(NSInteger, AWSglueTaskStatusType) {
    AWSglueTaskStatusTypeUnknown,
    AWSglueTaskStatusTypeStarting,
    AWSglueTaskStatusTypeRunning,
    AWSglueTaskStatusTypeStopping,
    AWSglueTaskStatusTypeStopped,
    AWSglueTaskStatusTypeSucceeded,
    AWSglueTaskStatusTypeFailed,
    AWSglueTaskStatusTypeTimeout,
};

typedef NS_ENUM(NSInteger, AWSglueTaskType) {
    AWSglueTaskTypeUnknown,
    AWSglueTaskTypeEvaluation,
    AWSglueTaskTypeLabelingSetGeneration,
    AWSglueTaskTypeImportLabels,
    AWSglueTaskTypeExportLabels,
    AWSglueTaskTypeFindMatches,
};

typedef NS_ENUM(NSInteger, AWSglueTransformSortColumnType) {
    AWSglueTransformSortColumnTypeUnknown,
    AWSglueTransformSortColumnTypeName,
    AWSglueTransformSortColumnTypeTransformType,
    AWSglueTransformSortColumnTypeStatus,
    AWSglueTransformSortColumnTypeCreated,
    AWSglueTransformSortColumnTypeLastModified,
};

typedef NS_ENUM(NSInteger, AWSglueTransformStatusType) {
    AWSglueTransformStatusTypeUnknown,
    AWSglueTransformStatusTypeNotReady,
    AWSglueTransformStatusTypeReady,
    AWSglueTransformStatusTypeDeleting,
};

typedef NS_ENUM(NSInteger, AWSglueTransformType) {
    AWSglueTransformTypeUnknown,
    AWSglueTransformTypeFindMatches,
};

typedef NS_ENUM(NSInteger, AWSglueTriggerState) {
    AWSglueTriggerStateUnknown,
    AWSglueTriggerStateCreating,
    AWSglueTriggerStateCreated,
    AWSglueTriggerStateActivating,
    AWSglueTriggerStateActivated,
    AWSglueTriggerStateDeactivating,
    AWSglueTriggerStateDeactivated,
    AWSglueTriggerStateDeleting,
    AWSglueTriggerStateUpdating,
};

typedef NS_ENUM(NSInteger, AWSglueTriggerType) {
    AWSglueTriggerTypeUnknown,
    AWSglueTriggerTypeScheduled,
    AWSglueTriggerTypeConditional,
    AWSglueTriggerTypeOnDemand,
};

typedef NS_ENUM(NSInteger, AWSglueUpdateBehavior) {
    AWSglueUpdateBehaviorUnknown,
    AWSglueUpdateBehaviorLog,
    AWSglueUpdateBehaviorUpdateInDatabase,
};

typedef NS_ENUM(NSInteger, AWSglueWorkerType) {
    AWSglueWorkerTypeUnknown,
    AWSglueWorkerTypeStandard,
    AWSglueWorkerTypeG1x,
    AWSglueWorkerTypeG2x,
};

typedef NS_ENUM(NSInteger, AWSglueWorkflowRunStatus) {
    AWSglueWorkflowRunStatusUnknown,
    AWSglueWorkflowRunStatusRunning,
    AWSglueWorkflowRunStatusCompleted,
};

@class AWSglueAction;
@class AWSglueBatchCreatePartitionRequest;
@class AWSglueBatchCreatePartitionResponse;
@class AWSglueBatchDeleteConnectionRequest;
@class AWSglueBatchDeleteConnectionResponse;
@class AWSglueBatchDeletePartitionRequest;
@class AWSglueBatchDeletePartitionResponse;
@class AWSglueBatchDeleteTableRequest;
@class AWSglueBatchDeleteTableResponse;
@class AWSglueBatchDeleteTableVersionRequest;
@class AWSglueBatchDeleteTableVersionResponse;
@class AWSglueBatchGetCrawlersRequest;
@class AWSglueBatchGetCrawlersResponse;
@class AWSglueBatchGetDevEndpointsRequest;
@class AWSglueBatchGetDevEndpointsResponse;
@class AWSglueBatchGetJobsRequest;
@class AWSglueBatchGetJobsResponse;
@class AWSglueBatchGetPartitionRequest;
@class AWSglueBatchGetPartitionResponse;
@class AWSglueBatchGetTriggersRequest;
@class AWSglueBatchGetTriggersResponse;
@class AWSglueBatchGetWorkflowsRequest;
@class AWSglueBatchGetWorkflowsResponse;
@class AWSglueBatchStopJobRunError;
@class AWSglueBatchStopJobRunRequest;
@class AWSglueBatchStopJobRunResponse;
@class AWSglueBatchStopJobRunSuccessfulSubmission;
@class AWSglueCancelMLTaskRunRequest;
@class AWSglueCancelMLTaskRunResponse;
@class AWSglueCatalogEntry;
@class AWSglueCatalogImportStatus;
@class AWSglueCatalogTarget;
@class AWSglueClassifier;
@class AWSglueCloudWatchEncryption;
@class AWSglueCodeGenEdge;
@class AWSglueCodeGenNode;
@class AWSglueCodeGenNodeArg;
@class AWSglueColumn;
@class AWSglueCondition;
@class AWSglueConfusionMatrix;
@class AWSglueConnection;
@class AWSglueConnectionInput;
@class AWSglueConnectionPasswordEncryption;
@class AWSglueConnectionsList;
@class AWSglueCrawl;
@class AWSglueCrawler;
@class AWSglueCrawlerMetrics;
@class AWSglueCrawlerNodeDetails;
@class AWSglueCrawlerTargets;
@class AWSglueCreateClassifierRequest;
@class AWSglueCreateClassifierResponse;
@class AWSglueCreateConnectionRequest;
@class AWSglueCreateConnectionResponse;
@class AWSglueCreateCrawlerRequest;
@class AWSglueCreateCrawlerResponse;
@class AWSglueCreateCsvClassifierRequest;
@class AWSglueCreateDatabaseRequest;
@class AWSglueCreateDatabaseResponse;
@class AWSglueCreateDevEndpointRequest;
@class AWSglueCreateDevEndpointResponse;
@class AWSglueCreateGrokClassifierRequest;
@class AWSglueCreateJobRequest;
@class AWSglueCreateJobResponse;
@class AWSglueCreateJsonClassifierRequest;
@class AWSglueCreateMLTransformRequest;
@class AWSglueCreateMLTransformResponse;
@class AWSglueCreatePartitionRequest;
@class AWSglueCreatePartitionResponse;
@class AWSglueCreateScriptRequest;
@class AWSglueCreateScriptResponse;
@class AWSglueCreateSecurityConfigurationRequest;
@class AWSglueCreateSecurityConfigurationResponse;
@class AWSglueCreateTableRequest;
@class AWSglueCreateTableResponse;
@class AWSglueCreateTriggerRequest;
@class AWSglueCreateTriggerResponse;
@class AWSglueCreateUserDefinedFunctionRequest;
@class AWSglueCreateUserDefinedFunctionResponse;
@class AWSglueCreateWorkflowRequest;
@class AWSglueCreateWorkflowResponse;
@class AWSglueCreateXMLClassifierRequest;
@class AWSglueCsvClassifier;
@class AWSglueDataCatalogEncryptionSettings;
@class AWSglueDataLakePrincipal;
@class AWSglueDatabase;
@class AWSglueDatabaseInput;
@class AWSglueDeleteClassifierRequest;
@class AWSglueDeleteClassifierResponse;
@class AWSglueDeleteConnectionRequest;
@class AWSglueDeleteConnectionResponse;
@class AWSglueDeleteCrawlerRequest;
@class AWSglueDeleteCrawlerResponse;
@class AWSglueDeleteDatabaseRequest;
@class AWSglueDeleteDatabaseResponse;
@class AWSglueDeleteDevEndpointRequest;
@class AWSglueDeleteDevEndpointResponse;
@class AWSglueDeleteJobRequest;
@class AWSglueDeleteJobResponse;
@class AWSglueDeleteMLTransformRequest;
@class AWSglueDeleteMLTransformResponse;
@class AWSglueDeletePartitionRequest;
@class AWSglueDeletePartitionResponse;
@class AWSglueDeleteResourcePolicyRequest;
@class AWSglueDeleteResourcePolicyResponse;
@class AWSglueDeleteSecurityConfigurationRequest;
@class AWSglueDeleteSecurityConfigurationResponse;
@class AWSglueDeleteTableRequest;
@class AWSglueDeleteTableResponse;
@class AWSglueDeleteTableVersionRequest;
@class AWSglueDeleteTableVersionResponse;
@class AWSglueDeleteTriggerRequest;
@class AWSglueDeleteTriggerResponse;
@class AWSglueDeleteUserDefinedFunctionRequest;
@class AWSglueDeleteUserDefinedFunctionResponse;
@class AWSglueDeleteWorkflowRequest;
@class AWSglueDeleteWorkflowResponse;
@class AWSglueDevEndpoint;
@class AWSglueDevEndpointCustomLibraries;
@class AWSglueDynamoDBTarget;
@class AWSglueEdge;
@class AWSglueEncryptionAtRest;
@class AWSglueEncryptionConfiguration;
@class AWSglueErrorDetail;
@class AWSglueEvaluationMetrics;
@class AWSglueExecutionProperty;
@class AWSglueExportLabelsTaskRunProperties;
@class AWSglueFindMatchesMetrics;
@class AWSglueFindMatchesParameters;
@class AWSglueFindMatchesTaskRunProperties;
@class AWSglueGetCatalogImportStatusRequest;
@class AWSglueGetCatalogImportStatusResponse;
@class AWSglueGetClassifierRequest;
@class AWSglueGetClassifierResponse;
@class AWSglueGetClassifiersRequest;
@class AWSglueGetClassifiersResponse;
@class AWSglueGetConnectionRequest;
@class AWSglueGetConnectionResponse;
@class AWSglueGetConnectionsFilter;
@class AWSglueGetConnectionsRequest;
@class AWSglueGetConnectionsResponse;
@class AWSglueGetCrawlerMetricsRequest;
@class AWSglueGetCrawlerMetricsResponse;
@class AWSglueGetCrawlerRequest;
@class AWSglueGetCrawlerResponse;
@class AWSglueGetCrawlersRequest;
@class AWSglueGetCrawlersResponse;
@class AWSglueGetDataCatalogEncryptionSettingsRequest;
@class AWSglueGetDataCatalogEncryptionSettingsResponse;
@class AWSglueGetDatabaseRequest;
@class AWSglueGetDatabaseResponse;
@class AWSglueGetDatabasesRequest;
@class AWSglueGetDatabasesResponse;
@class AWSglueGetDataflowGraphRequest;
@class AWSglueGetDataflowGraphResponse;
@class AWSglueGetDevEndpointRequest;
@class AWSglueGetDevEndpointResponse;
@class AWSglueGetDevEndpointsRequest;
@class AWSglueGetDevEndpointsResponse;
@class AWSglueGetJobBookmarkRequest;
@class AWSglueGetJobBookmarkResponse;
@class AWSglueGetJobRequest;
@class AWSglueGetJobResponse;
@class AWSglueGetJobRunRequest;
@class AWSglueGetJobRunResponse;
@class AWSglueGetJobRunsRequest;
@class AWSglueGetJobRunsResponse;
@class AWSglueGetJobsRequest;
@class AWSglueGetJobsResponse;
@class AWSglueGetMLTaskRunRequest;
@class AWSglueGetMLTaskRunResponse;
@class AWSglueGetMLTaskRunsRequest;
@class AWSglueGetMLTaskRunsResponse;
@class AWSglueGetMLTransformRequest;
@class AWSglueGetMLTransformResponse;
@class AWSglueGetMLTransformsRequest;
@class AWSglueGetMLTransformsResponse;
@class AWSglueGetMappingRequest;
@class AWSglueGetMappingResponse;
@class AWSglueGetPartitionRequest;
@class AWSglueGetPartitionResponse;
@class AWSglueGetPartitionsRequest;
@class AWSglueGetPartitionsResponse;
@class AWSglueGetPlanRequest;
@class AWSglueGetPlanResponse;
@class AWSglueGetResourcePolicyRequest;
@class AWSglueGetResourcePolicyResponse;
@class AWSglueGetSecurityConfigurationRequest;
@class AWSglueGetSecurityConfigurationResponse;
@class AWSglueGetSecurityConfigurationsRequest;
@class AWSglueGetSecurityConfigurationsResponse;
@class AWSglueGetTableRequest;
@class AWSglueGetTableResponse;
@class AWSglueGetTableVersionRequest;
@class AWSglueGetTableVersionResponse;
@class AWSglueGetTableVersionsRequest;
@class AWSglueGetTableVersionsResponse;
@class AWSglueGetTablesRequest;
@class AWSglueGetTablesResponse;
@class AWSglueGetTagsRequest;
@class AWSglueGetTagsResponse;
@class AWSglueGetTriggerRequest;
@class AWSglueGetTriggerResponse;
@class AWSglueGetTriggersRequest;
@class AWSglueGetTriggersResponse;
@class AWSglueGetUserDefinedFunctionRequest;
@class AWSglueGetUserDefinedFunctionResponse;
@class AWSglueGetUserDefinedFunctionsRequest;
@class AWSglueGetUserDefinedFunctionsResponse;
@class AWSglueGetWorkflowRequest;
@class AWSglueGetWorkflowResponse;
@class AWSglueGetWorkflowRunPropertiesRequest;
@class AWSglueGetWorkflowRunPropertiesResponse;
@class AWSglueGetWorkflowRunRequest;
@class AWSglueGetWorkflowRunResponse;
@class AWSglueGetWorkflowRunsRequest;
@class AWSglueGetWorkflowRunsResponse;
@class AWSglueGlueTable;
@class AWSglueGrokClassifier;
@class AWSglueImportCatalogToGlueRequest;
@class AWSglueImportCatalogToGlueResponse;
@class AWSglueImportLabelsTaskRunProperties;
@class AWSglueJdbcTarget;
@class AWSglueJob;
@class AWSglueJobBookmarkEntry;
@class AWSglueJobBookmarksEncryption;
@class AWSglueJobCommand;
@class AWSglueJobNodeDetails;
@class AWSglueJobRun;
@class AWSglueJobUpdate;
@class AWSglueJsonClassifier;
@class AWSglueLabelingSetGenerationTaskRunProperties;
@class AWSglueLastCrawlInfo;
@class AWSglueListCrawlersRequest;
@class AWSglueListCrawlersResponse;
@class AWSglueListDevEndpointsRequest;
@class AWSglueListDevEndpointsResponse;
@class AWSglueListJobsRequest;
@class AWSglueListJobsResponse;
@class AWSglueListMLTransformsRequest;
@class AWSglueListMLTransformsResponse;
@class AWSglueListTriggersRequest;
@class AWSglueListTriggersResponse;
@class AWSglueListWorkflowsRequest;
@class AWSglueListWorkflowsResponse;
@class AWSglueLocation;
@class AWSglueMLTransform;
@class AWSglueMappingEntry;
@class AWSglueNode;
@class AWSglueNotificationProperty;
@class AWSglueOrder;
@class AWSgluePartition;
@class AWSgluePartitionError;
@class AWSgluePartitionInput;
@class AWSgluePartitionValueList;
@class AWSgluePhysicalConnectionRequirements;
@class AWSgluePredecessor;
@class AWSgluePredicate;
@class AWSgluePrincipalPermissions;
@class AWSgluePropertyPredicate;
@class AWSgluePutDataCatalogEncryptionSettingsRequest;
@class AWSgluePutDataCatalogEncryptionSettingsResponse;
@class AWSgluePutResourcePolicyRequest;
@class AWSgluePutResourcePolicyResponse;
@class AWSgluePutWorkflowRunPropertiesRequest;
@class AWSgluePutWorkflowRunPropertiesResponse;
@class AWSglueResetJobBookmarkRequest;
@class AWSglueResetJobBookmarkResponse;
@class AWSglueResourceUri;
@class AWSglueS3Encryption;
@class AWSglueS3Target;
@class AWSglueSchedule;
@class AWSglueSchemaChangePolicy;
@class AWSglueSchemaColumn;
@class AWSglueSearchTablesRequest;
@class AWSglueSearchTablesResponse;
@class AWSglueSecurityConfiguration;
@class AWSglueSegment;
@class AWSglueSerDeInfo;
@class AWSglueSkewedInfo;
@class AWSglueSortCriterion;
@class AWSglueStartCrawlerRequest;
@class AWSglueStartCrawlerResponse;
@class AWSglueStartCrawlerScheduleRequest;
@class AWSglueStartCrawlerScheduleResponse;
@class AWSglueStartExportLabelsTaskRunRequest;
@class AWSglueStartExportLabelsTaskRunResponse;
@class AWSglueStartImportLabelsTaskRunRequest;
@class AWSglueStartImportLabelsTaskRunResponse;
@class AWSglueStartJobRunRequest;
@class AWSglueStartJobRunResponse;
@class AWSglueStartMLEvaluationTaskRunRequest;
@class AWSglueStartMLEvaluationTaskRunResponse;
@class AWSglueStartMLLabelingSetGenerationTaskRunRequest;
@class AWSglueStartMLLabelingSetGenerationTaskRunResponse;
@class AWSglueStartTriggerRequest;
@class AWSglueStartTriggerResponse;
@class AWSglueStartWorkflowRunRequest;
@class AWSglueStartWorkflowRunResponse;
@class AWSglueStopCrawlerRequest;
@class AWSglueStopCrawlerResponse;
@class AWSglueStopCrawlerScheduleRequest;
@class AWSglueStopCrawlerScheduleResponse;
@class AWSglueStopTriggerRequest;
@class AWSglueStopTriggerResponse;
@class AWSglueStorageDescriptor;
@class AWSglueTable;
@class AWSglueTableError;
@class AWSglueTableInput;
@class AWSglueTableVersion;
@class AWSglueTableVersionError;
@class AWSglueTagResourceRequest;
@class AWSglueTagResourceResponse;
@class AWSglueTaskRun;
@class AWSglueTaskRunFilterCriteria;
@class AWSglueTaskRunProperties;
@class AWSglueTaskRunSortCriteria;
@class AWSglueTransformFilterCriteria;
@class AWSglueTransformParameters;
@class AWSglueTransformSortCriteria;
@class AWSglueTrigger;
@class AWSglueTriggerNodeDetails;
@class AWSglueTriggerUpdate;
@class AWSglueUntagResourceRequest;
@class AWSglueUntagResourceResponse;
@class AWSglueUpdateClassifierRequest;
@class AWSglueUpdateClassifierResponse;
@class AWSglueUpdateConnectionRequest;
@class AWSglueUpdateConnectionResponse;
@class AWSglueUpdateCrawlerRequest;
@class AWSglueUpdateCrawlerResponse;
@class AWSglueUpdateCrawlerScheduleRequest;
@class AWSglueUpdateCrawlerScheduleResponse;
@class AWSglueUpdateCsvClassifierRequest;
@class AWSglueUpdateDatabaseRequest;
@class AWSglueUpdateDatabaseResponse;
@class AWSglueUpdateDevEndpointRequest;
@class AWSglueUpdateDevEndpointResponse;
@class AWSglueUpdateGrokClassifierRequest;
@class AWSglueUpdateJobRequest;
@class AWSglueUpdateJobResponse;
@class AWSglueUpdateJsonClassifierRequest;
@class AWSglueUpdateMLTransformRequest;
@class AWSglueUpdateMLTransformResponse;
@class AWSglueUpdatePartitionRequest;
@class AWSglueUpdatePartitionResponse;
@class AWSglueUpdateTableRequest;
@class AWSglueUpdateTableResponse;
@class AWSglueUpdateTriggerRequest;
@class AWSglueUpdateTriggerResponse;
@class AWSglueUpdateUserDefinedFunctionRequest;
@class AWSglueUpdateUserDefinedFunctionResponse;
@class AWSglueUpdateWorkflowRequest;
@class AWSglueUpdateWorkflowResponse;
@class AWSglueUpdateXMLClassifierRequest;
@class AWSglueUserDefinedFunction;
@class AWSglueUserDefinedFunctionInput;
@class AWSglueWorkflow;
@class AWSglueWorkflowGraph;
@class AWSglueWorkflowRun;
@class AWSglueWorkflowRunStatistics;
@class AWSglueXMLClassifier;

/**
 <p>Defines an action to be initiated by a trigger.</p>
 */
@interface AWSglueAction : AWSModel


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
@property (nonatomic, strong) AWSglueNotificationProperty * _Nullable notificationProperty;

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
@interface AWSglueBatchCreatePartitionRequest : AWSRequest


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
@property (nonatomic, strong) NSArray<AWSgluePartitionInput *> * _Nullable partitionInputList;

/**
 <p>The name of the metadata table in which the partition is to be created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSglueBatchCreatePartitionResponse : AWSModel


/**
 <p>The errors encountered when trying to create the requested partitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSgluePartitionError *> * _Nullable errors;

@end

/**
 
 */
@interface AWSglueBatchDeleteConnectionRequest : AWSRequest


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
@interface AWSglueBatchDeleteConnectionResponse : AWSModel


/**
 <p>A map of the names of connections that were not successfully deleted to error details.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSglueErrorDetail *> * _Nullable errors;

/**
 <p>A list of names of the connection definitions that were successfully deleted.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable succeeded;

@end

/**
 
 */
@interface AWSglueBatchDeletePartitionRequest : AWSRequest


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
@property (nonatomic, strong) NSArray<AWSgluePartitionValueList *> * _Nullable partitionsToDelete;

/**
 <p>The name of the table that contains the partitions to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSglueBatchDeletePartitionResponse : AWSModel


/**
 <p>The errors encountered when trying to delete the requested partitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSgluePartitionError *> * _Nullable errors;

@end

/**
 
 */
@interface AWSglueBatchDeleteTableRequest : AWSRequest


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
@interface AWSglueBatchDeleteTableResponse : AWSModel


/**
 <p>A list of errors encountered in attempting to delete the specified tables.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueTableError *> * _Nullable errors;

@end

/**
 
 */
@interface AWSglueBatchDeleteTableVersionRequest : AWSRequest


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
@interface AWSglueBatchDeleteTableVersionResponse : AWSModel


/**
 <p>A list of errors encountered while trying to delete the specified table versions.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueTableVersionError *> * _Nullable errors;

@end

/**
 
 */
@interface AWSglueBatchGetCrawlersRequest : AWSRequest


/**
 <p>A list of crawler names, which might be the names returned from the <code>ListCrawlers</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable crawlerNames;

@end

/**
 
 */
@interface AWSglueBatchGetCrawlersResponse : AWSModel


/**
 <p>A list of crawler definitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueCrawler *> * _Nullable crawlers;

/**
 <p>A list of names of crawlers that were not found.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable crawlersNotFound;

@end

/**
 
 */
@interface AWSglueBatchGetDevEndpointsRequest : AWSRequest


/**
 <p>The list of <code>DevEndpoint</code> names, which might be the names returned from the <code>ListDevEndpoint</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable devEndpointNames;

@end

/**
 
 */
@interface AWSglueBatchGetDevEndpointsResponse : AWSModel


/**
 <p>A list of <code>DevEndpoint</code> definitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueDevEndpoint *> * _Nullable devEndpoints;

/**
 <p>A list of <code>DevEndpoints</code> not found.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable devEndpointsNotFound;

@end

/**
 
 */
@interface AWSglueBatchGetJobsRequest : AWSRequest


/**
 <p>A list of job names, which might be the names returned from the <code>ListJobs</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable jobNames;

@end

/**
 
 */
@interface AWSglueBatchGetJobsResponse : AWSModel


/**
 <p>A list of job definitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueJob *> * _Nullable jobs;

/**
 <p>A list of names of jobs not found.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable jobsNotFound;

@end

/**
 
 */
@interface AWSglueBatchGetPartitionRequest : AWSRequest


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
@property (nonatomic, strong) NSArray<AWSgluePartitionValueList *> * _Nullable partitionsToGet;

/**
 <p>The name of the partitions' table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSglueBatchGetPartitionResponse : AWSModel


/**
 <p>A list of the requested partitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSgluePartition *> * _Nullable partitions;

/**
 <p>A list of the partition values in the request for which partitions were not returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSgluePartitionValueList *> * _Nullable unprocessedKeys;

@end

/**
 
 */
@interface AWSglueBatchGetTriggersRequest : AWSRequest


/**
 <p>A list of trigger names, which may be the names returned from the <code>ListTriggers</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable triggerNames;

@end

/**
 
 */
@interface AWSglueBatchGetTriggersResponse : AWSModel


/**
 <p>A list of trigger definitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueTrigger *> * _Nullable triggers;

/**
 <p>A list of names of triggers not found.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable triggersNotFound;

@end

/**
 
 */
@interface AWSglueBatchGetWorkflowsRequest : AWSRequest


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
@interface AWSglueBatchGetWorkflowsResponse : AWSModel


/**
 <p>A list of names of workflows not found.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable missingWorkflows;

/**
 <p>A list of workflow resource metadata.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueWorkflow *> * _Nullable workflows;

@end

/**
 <p>Records an error that occurred when attempting to stop a specified job run.</p>
 */
@interface AWSglueBatchStopJobRunError : AWSModel


/**
 <p>Specifies details about the error that was encountered.</p>
 */
@property (nonatomic, strong) AWSglueErrorDetail * _Nullable errorDetail;

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
@interface AWSglueBatchStopJobRunRequest : AWSRequest


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
@interface AWSglueBatchStopJobRunResponse : AWSModel


/**
 <p>A list of the errors that were encountered in trying to stop <code>JobRuns</code>, including the <code>JobRunId</code> for which each error was encountered and details about the error.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueBatchStopJobRunError *> * _Nullable errors;

/**
 <p>A list of the JobRuns that were successfully submitted for stopping.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueBatchStopJobRunSuccessfulSubmission *> * _Nullable successfulSubmissions;

@end

/**
 <p>Records a successful request to stop a specified <code>JobRun</code>.</p>
 */
@interface AWSglueBatchStopJobRunSuccessfulSubmission : AWSModel


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
@interface AWSglueCancelMLTaskRunRequest : AWSRequest


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
@interface AWSglueCancelMLTaskRunResponse : AWSModel


/**
 <p>The status for this run.</p>
 */
@property (nonatomic, assign) AWSglueTaskStatusType status;

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
@interface AWSglueCatalogEntry : AWSModel


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
@interface AWSglueCatalogImportStatus : AWSModel


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
@interface AWSglueCatalogTarget : AWSModel


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
@interface AWSglueClassifier : AWSModel


/**
 <p>A classifier for comma-separated values (CSV).</p>
 */
@property (nonatomic, strong) AWSglueCsvClassifier * _Nullable csvClassifier;

/**
 <p>A classifier that uses <code>grok</code>.</p>
 */
@property (nonatomic, strong) AWSglueGrokClassifier * _Nullable grokClassifier;

/**
 <p>A classifier for JSON content.</p>
 */
@property (nonatomic, strong) AWSglueJsonClassifier * _Nullable jsonClassifier;

/**
 <p>A classifier for XML content.</p>
 */
@property (nonatomic, strong) AWSglueXMLClassifier * _Nullable XMLClassifier;

@end

/**
 <p>Specifies how Amazon CloudWatch data should be encrypted.</p>
 */
@interface AWSglueCloudWatchEncryption : AWSModel


/**
 <p>The encryption mode to use for CloudWatch data.</p>
 */
@property (nonatomic, assign) AWSglueCloudWatchEncryptionMode cloudWatchEncryptionMode;

/**
 <p>The Amazon Resource Name (ARN) of the KMS key to be used to encrypt the data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyArn;

@end

/**
 <p>Represents a directional edge in a directed acyclic graph (DAG).</p>
 Required parameters: [Source, Target]
 */
@interface AWSglueCodeGenEdge : AWSModel


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
@interface AWSglueCodeGenNode : AWSModel


/**
 <p>Properties of the node, in the form of name-value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueCodeGenNodeArg *> * _Nullable args;

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
@interface AWSglueCodeGenNodeArg : AWSModel


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
@interface AWSglueColumn : AWSModel


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
@interface AWSglueCondition : AWSModel


/**
 <p>The state of the crawler to which this condition applies.</p>
 */
@property (nonatomic, assign) AWSglueCrawlState crawlState;

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
@property (nonatomic, assign) AWSglueLogicalOperator logicalOperator;

/**
 <p>The condition state. Currently, the values supported are <code>SUCCEEDED</code>, <code>STOPPED</code>, <code>TIMEOUT</code>, and <code>FAILED</code>.</p>
 */
@property (nonatomic, assign) AWSglueJobRunState state;

@end

/**
 <p>The confusion matrix shows you what your transform is predicting accurately and what types of errors it is making.</p><p>For more information, see <a href="https://en.wikipedia.org/wiki/Confusion_matrix">Confusion matrix</a> in Wikipedia.</p>
 */
@interface AWSglueConfusionMatrix : AWSModel


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
@interface AWSglueConnection : AWSModel


/**
 <p>These key-value pairs define parameters for the connection:</p><ul><li><p><code>HOST</code> - The host URI: either the fully qualified domain name (FQDN) or the IPv4 address of the database host.</p></li><li><p><code>PORT</code> - The port number, between 1024 and 65535, of the port on which the database host is listening for database connections.</p></li><li><p><code>USER_NAME</code> - The name under which to log in to the database. The value string for <code>USER_NAME</code> is "<code>USERNAME</code>".</p></li><li><p><code>PASSWORD</code> - A password, if one is used, for the user name.</p></li><li><p><code>ENCRYPTED_PASSWORD</code> - When you enable connection password protection by setting <code>ConnectionPasswordEncryption</code> in the Data Catalog encryption settings, this field stores the encrypted password.</p></li><li><p><code>JDBC_DRIVER_JAR_URI</code> - The Amazon Simple Storage Service (Amazon S3) path of the JAR file that contains the JDBC driver to use.</p></li><li><p><code>JDBC_DRIVER_CLASS_NAME</code> - The class name of the JDBC driver to use.</p></li><li><p><code>JDBC_ENGINE</code> - The name of the JDBC engine to use.</p></li><li><p><code>JDBC_ENGINE_VERSION</code> - The version of the JDBC engine to use.</p></li><li><p><code>CONFIG_FILES</code> - (Reserved for future use.)</p></li><li><p><code>INSTANCE_ID</code> - The instance ID to use.</p></li><li><p><code>JDBC_CONNECTION_URL</code> - The URL for connecting to a JDBC data source.</p></li><li><p><code>JDBC_ENFORCE_SSL</code> - A Boolean string (true, false) specifying whether Secure Sockets Layer (SSL) with hostname matching is enforced for the JDBC connection on the client. The default is false.</p></li><li><p><code>CUSTOM_JDBC_CERT</code> - An Amazon S3 location specifying the customer's root certificate. AWS Glue uses this root certificate to validate the customer’s certificate when connecting to the customer database. AWS Glue only handles X.509 certificates. The certificate provided must be DER-encoded and supplied in Base64 encoding PEM format.</p></li><li><p><code>SKIP_CUSTOM_JDBC_CERT_VALIDATION</code> - By default, this is <code>false</code>. AWS Glue validates the Signature algorithm and Subject Public Key Algorithm for the customer certificate. The only permitted algorithms for the Signature algorithm are SHA256withRSA, SHA384withRSA or SHA512withRSA. For the Subject Public Key Algorithm, the key length must be at least 2048. You can set the value of this property to <code>true</code> to skip AWS Glue’s validation of the customer certificate.</p></li><li><p><code>CUSTOM_JDBC_CERT_STRING</code> - A custom JDBC certificate string which is used for domain match or distinguished name match to prevent a man-in-the-middle attack. In Oracle database, this is used as the <code>SSL_SERVER_CERT_DN</code>; in Microsoft SQL Server, this is used as the <code>hostNameInCertificate</code>.</p></li><li><p><code>CONNECTION_URL</code> - The URL for connecting to a general (non-JDBC) data source.</p></li><li><p><code>KAFKA_BOOTSTRAP_SERVERS</code> - A comma-separated list of host and port pairs that are the addresses of the Apache Kafka brokers in a Kafka cluster to which a Kafka client will connect to and bootstrap itself.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable connectionProperties;

/**
 <p>The type of the connection. Currently, only JDBC is supported; SFTP is not supported.</p>
 */
@property (nonatomic, assign) AWSglueConnectionType connectionType;

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
@property (nonatomic, strong) AWSgluePhysicalConnectionRequirements * _Nullable physicalConnectionRequirements;

@end

/**
 <p>A structure that is used to specify a connection to create or update.</p>
 Required parameters: [Name, ConnectionType, ConnectionProperties]
 */
@interface AWSglueConnectionInput : AWSModel


/**
 <p>These key-value pairs define parameters for the connection.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable connectionProperties;

/**
 <p>The type of the connection. Currently, these types are supported:</p><ul><li><p><code>JDBC</code> - Designates a connection to a database through Java Database Connectivity (JDBC).</p></li><li><p><code>KAFKA</code> - Designates a connection to an Apache Kafka streaming platform.</p></li><li><p><code>MONGODB</code> - Designates a connection to a MongoDB document database.</p></li></ul><p>SFTP is not supported.</p>
 */
@property (nonatomic, assign) AWSglueConnectionType connectionType;

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
@property (nonatomic, strong) AWSgluePhysicalConnectionRequirements * _Nullable physicalConnectionRequirements;

@end

/**
 <p>The data structure used by the Data Catalog to encrypt the password as part of <code>CreateConnection</code> or <code>UpdateConnection</code> and store it in the <code>ENCRYPTED_PASSWORD</code> field in the connection properties. You can enable catalog encryption or only password encryption.</p><p>When a <code>CreationConnection</code> request arrives containing a password, the Data Catalog first encrypts the password using your AWS KMS key. It then encrypts the whole connection object again if catalog encryption is also enabled.</p><p>This encryption requires that you set AWS KMS key permissions to enable or restrict access on the password key according to your security requirements. For example, you might want only administrators to have decrypt permission on the password key.</p>
 Required parameters: [ReturnConnectionPasswordEncrypted]
 */
@interface AWSglueConnectionPasswordEncryption : AWSModel


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
@interface AWSglueConnectionsList : AWSModel


/**
 <p>A list of connections used by the job.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable connections;

@end

/**
 <p>The details of a crawl in the workflow.</p>
 */
@interface AWSglueCrawl : AWSModel


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
@property (nonatomic, assign) AWSglueCrawlState state;

@end

/**
 <p>Specifies a crawler program that examines a data source and uses classifiers to try to determine its schema. If successful, the crawler records metadata concerning the data source in the AWS Glue Data Catalog.</p>
 */
@interface AWSglueCrawler : AWSModel


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
@property (nonatomic, strong) AWSglueLastCrawlInfo * _Nullable lastCrawl;

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
@property (nonatomic, strong) AWSglueSchedule * _Nullable schedule;

/**
 <p>The policy that specifies update and delete behaviors for the crawler.</p>
 */
@property (nonatomic, strong) AWSglueSchemaChangePolicy * _Nullable schemaChangePolicy;

/**
 <p>Indicates whether the crawler is running, or whether a run is pending.</p>
 */
@property (nonatomic, assign) AWSglueCrawlerState state;

/**
 <p>The prefix added to the names of tables that are created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tablePrefix;

/**
 <p>A collection of targets to crawl.</p>
 */
@property (nonatomic, strong) AWSglueCrawlerTargets * _Nullable targets;

/**
 <p>The version of the crawler.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>Metrics for a specified crawler.</p>
 */
@interface AWSglueCrawlerMetrics : AWSModel


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
@interface AWSglueCrawlerNodeDetails : AWSModel


/**
 <p>A list of crawls represented by the crawl node.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueCrawl *> * _Nullable crawls;

@end

/**
 <p>Specifies data stores to crawl.</p>
 */
@interface AWSglueCrawlerTargets : AWSModel


/**
 <p>Specifies AWS Glue Data Catalog targets.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueCatalogTarget *> * _Nullable catalogTargets;

/**
 <p>Specifies Amazon DynamoDB targets.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueDynamoDBTarget *> * _Nullable dynamoDBTargets;

/**
 <p>Specifies JDBC targets.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueJdbcTarget *> * _Nullable jdbcTargets;

/**
 <p>Specifies Amazon Simple Storage Service (Amazon S3) targets.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueS3Target *> * _Nullable s3Targets;

@end

/**
 
 */
@interface AWSglueCreateClassifierRequest : AWSRequest


/**
 <p>A <code>CsvClassifier</code> object specifying the classifier to create.</p>
 */
@property (nonatomic, strong) AWSglueCreateCsvClassifierRequest * _Nullable csvClassifier;

/**
 <p>A <code>GrokClassifier</code> object specifying the classifier to create.</p>
 */
@property (nonatomic, strong) AWSglueCreateGrokClassifierRequest * _Nullable grokClassifier;

/**
 <p>A <code>JsonClassifier</code> object specifying the classifier to create.</p>
 */
@property (nonatomic, strong) AWSglueCreateJsonClassifierRequest * _Nullable jsonClassifier;

/**
 <p>An <code>XMLClassifier</code> object specifying the classifier to create.</p>
 */
@property (nonatomic, strong) AWSglueCreateXMLClassifierRequest * _Nullable XMLClassifier;

@end

/**
 
 */
@interface AWSglueCreateClassifierResponse : AWSModel


@end

/**
 
 */
@interface AWSglueCreateConnectionRequest : AWSRequest


/**
 <p>The ID of the Data Catalog in which to create the connection. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>A <code>ConnectionInput</code> object defining the connection to create.</p>
 */
@property (nonatomic, strong) AWSglueConnectionInput * _Nullable connectionInput;

@end

/**
 
 */
@interface AWSglueCreateConnectionResponse : AWSModel


@end

/**
 
 */
@interface AWSglueCreateCrawlerRequest : AWSRequest


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
@property (nonatomic, strong) AWSglueSchemaChangePolicy * _Nullable schemaChangePolicy;

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
@property (nonatomic, strong) AWSglueCrawlerTargets * _Nullable targets;

@end

/**
 
 */
@interface AWSglueCreateCrawlerResponse : AWSModel


@end

/**
 <p>Specifies a custom CSV classifier for <code>CreateClassifier</code> to create.</p>
 Required parameters: [Name]
 */
@interface AWSglueCreateCsvClassifierRequest : AWSModel


/**
 <p>Enables the processing of files that contain only one column.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowSingleColumn;

/**
 <p>Indicates whether the CSV file contains a header.</p>
 */
@property (nonatomic, assign) AWSglueCsvHeaderOption containsHeader;

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
@interface AWSglueCreateDatabaseRequest : AWSRequest


/**
 <p>The ID of the Data Catalog in which to create the database. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The metadata for the database.</p>
 */
@property (nonatomic, strong) AWSglueDatabaseInput * _Nullable databaseInput;

@end

/**
 
 */
@interface AWSglueCreateDatabaseResponse : AWSModel


@end

/**
 
 */
@interface AWSglueCreateDevEndpointRequest : AWSRequest


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
@property (nonatomic, assign) AWSglueWorkerType workerType;

@end

/**
 
 */
@interface AWSglueCreateDevEndpointResponse : AWSModel


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
@property (nonatomic, assign) AWSglueWorkerType workerType;

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
@interface AWSglueCreateGrokClassifierRequest : AWSModel


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
@interface AWSglueCreateJobRequest : AWSRequest


/**
 <p>This parameter is deprecated. Use <code>MaxCapacity</code> instead.</p><p>The number of AWS Glue data processing units (DPUs) to allocate to this Job. You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For more information, see the <a href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedCapacity;

/**
 <p>The <code>JobCommand</code> that executes this job.</p>
 */
@property (nonatomic, strong) AWSglueJobCommand * _Nullable command;

/**
 <p>The connections used for this job.</p>
 */
@property (nonatomic, strong) AWSglueConnectionsList * _Nullable connections;

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
@property (nonatomic, strong) AWSglueExecutionProperty * _Nullable executionProperty;

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
@property (nonatomic, strong) AWSglueNotificationProperty * _Nullable notificationProperty;

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
@property (nonatomic, assign) AWSglueWorkerType workerType;

@end

/**
 
 */
@interface AWSglueCreateJobResponse : AWSModel


/**
 <p>The unique name that was provided for this job definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Specifies a JSON classifier for <code>CreateClassifier</code> to create.</p>
 Required parameters: [Name, JsonPath]
 */
@interface AWSglueCreateJsonClassifierRequest : AWSModel


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
@interface AWSglueCreateMLTransformRequest : AWSRequest


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
@property (nonatomic, strong) NSArray<AWSglueGlueTable *> * _Nullable inputRecordTables;

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
@property (nonatomic, strong) AWSglueTransformParameters * _Nullable parameters;

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
@property (nonatomic, assign) AWSglueWorkerType workerType;

@end

/**
 
 */
@interface AWSglueCreateMLTransformResponse : AWSModel


/**
 <p>A unique identifier that is generated for the transform.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 
 */
@interface AWSglueCreatePartitionRequest : AWSRequest


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
@property (nonatomic, strong) AWSgluePartitionInput * _Nullable partitionInput;

/**
 <p>The name of the metadata table in which the partition is to be created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSglueCreatePartitionResponse : AWSModel


@end

/**
 
 */
@interface AWSglueCreateScriptRequest : AWSRequest


/**
 <p>A list of the edges in the DAG.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueCodeGenEdge *> * _Nullable dagEdges;

/**
 <p>A list of the nodes in the DAG.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueCodeGenNode *> * _Nullable dagNodes;

/**
 <p>The programming language of the resulting code from the DAG.</p>
 */
@property (nonatomic, assign) AWSglueLanguage language;

@end

/**
 
 */
@interface AWSglueCreateScriptResponse : AWSModel


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
@interface AWSglueCreateSecurityConfigurationRequest : AWSRequest


/**
 <p>The encryption configuration for the new security configuration.</p>
 */
@property (nonatomic, strong) AWSglueEncryptionConfiguration * _Nullable encryptionConfiguration;

/**
 <p>The name for the new security configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSglueCreateSecurityConfigurationResponse : AWSModel


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
@interface AWSglueCreateTableRequest : AWSRequest


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
@property (nonatomic, strong) AWSglueTableInput * _Nullable tableInput;

@end

/**
 
 */
@interface AWSglueCreateTableResponse : AWSModel


@end

/**
 
 */
@interface AWSglueCreateTriggerRequest : AWSRequest


/**
 <p>The actions initiated by this trigger when it fires.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueAction *> * _Nullable actions;

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
@property (nonatomic, strong) AWSgluePredicate * _Nullable predicate;

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
@property (nonatomic, assign) AWSglueTriggerType types;

/**
 <p>The name of the workflow associated with the trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workflowName;

@end

/**
 
 */
@interface AWSglueCreateTriggerResponse : AWSModel


/**
 <p>The name of the trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSglueCreateUserDefinedFunctionRequest : AWSRequest


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
@property (nonatomic, strong) AWSglueUserDefinedFunctionInput * _Nullable functionInput;

@end

/**
 
 */
@interface AWSglueCreateUserDefinedFunctionResponse : AWSModel


@end

/**
 
 */
@interface AWSglueCreateWorkflowRequest : AWSRequest


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
@interface AWSglueCreateWorkflowResponse : AWSModel


/**
 <p>The name of the workflow which was provided as part of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Specifies an XML classifier for <code>CreateClassifier</code> to create.</p>
 Required parameters: [Classification, Name]
 */
@interface AWSglueCreateXMLClassifierRequest : AWSModel


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
@interface AWSglueCsvClassifier : AWSModel


/**
 <p>Enables the processing of files that contain only one column.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowSingleColumn;

/**
 <p>Indicates whether the CSV file contains a header.</p>
 */
@property (nonatomic, assign) AWSglueCsvHeaderOption containsHeader;

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
@interface AWSglueDataCatalogEncryptionSettings : AWSModel


/**
 <p>When connection password protection is enabled, the Data Catalog uses a customer-provided key to encrypt the password as part of <code>CreateConnection</code> or <code>UpdateConnection</code> and store it in the <code>ENCRYPTED_PASSWORD</code> field in the connection properties. You can enable catalog encryption or only password encryption.</p>
 */
@property (nonatomic, strong) AWSglueConnectionPasswordEncryption * _Nullable connectionPasswordEncryption;

/**
 <p>Specifies the encryption-at-rest configuration for the Data Catalog.</p>
 */
@property (nonatomic, strong) AWSglueEncryptionAtRest * _Nullable encryptionAtRest;

@end

/**
 <p>The AWS Lake Formation principal.</p>
 */
@interface AWSglueDataLakePrincipal : AWSModel


/**
 <p>An identifier for the AWS Lake Formation principal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataLakePrincipalIdentifier;

@end

/**
 <p>The <code>Database</code> object represents a logical grouping of tables that might reside in a Hive metastore or an RDBMS.</p>
 Required parameters: [Name]
 */
@interface AWSglueDatabase : AWSModel


/**
 <p>Creates a set of default permissions on the table for principals. </p>
 */
@property (nonatomic, strong) NSArray<AWSgluePrincipalPermissions *> * _Nullable createTableDefaultPermissions;

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
@interface AWSglueDatabaseInput : AWSModel


/**
 <p>Creates a set of default permissions on the table for principals. </p>
 */
@property (nonatomic, strong) NSArray<AWSgluePrincipalPermissions *> * _Nullable createTableDefaultPermissions;

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
@interface AWSglueDeleteClassifierRequest : AWSRequest


/**
 <p>Name of the classifier to remove.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSglueDeleteClassifierResponse : AWSModel


@end

/**
 
 */
@interface AWSglueDeleteConnectionRequest : AWSRequest


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
@interface AWSglueDeleteConnectionResponse : AWSModel


@end

/**
 
 */
@interface AWSglueDeleteCrawlerRequest : AWSRequest


/**
 <p>The name of the crawler to remove.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSglueDeleteCrawlerResponse : AWSModel


@end

/**
 
 */
@interface AWSglueDeleteDatabaseRequest : AWSRequest


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
@interface AWSglueDeleteDatabaseResponse : AWSModel


@end

/**
 
 */
@interface AWSglueDeleteDevEndpointRequest : AWSRequest


/**
 <p>The name of the <code>DevEndpoint</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

@end

/**
 
 */
@interface AWSglueDeleteDevEndpointResponse : AWSModel


@end

/**
 
 */
@interface AWSglueDeleteJobRequest : AWSRequest


/**
 <p>The name of the job definition to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

@end

/**
 
 */
@interface AWSglueDeleteJobResponse : AWSModel


/**
 <p>The name of the job definition that was deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

@end

/**
 
 */
@interface AWSglueDeleteMLTransformRequest : AWSRequest


/**
 <p>The unique identifier of the transform to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 
 */
@interface AWSglueDeleteMLTransformResponse : AWSModel


/**
 <p>The unique identifier of the transform that was deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 
 */
@interface AWSglueDeletePartitionRequest : AWSRequest


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
@interface AWSglueDeletePartitionResponse : AWSModel


@end

/**
 
 */
@interface AWSglueDeleteResourcePolicyRequest : AWSRequest


/**
 <p>The hash value returned when this policy was set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyHashCondition;

@end

/**
 
 */
@interface AWSglueDeleteResourcePolicyResponse : AWSModel


@end

/**
 
 */
@interface AWSglueDeleteSecurityConfigurationRequest : AWSRequest


/**
 <p>The name of the security configuration to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSglueDeleteSecurityConfigurationResponse : AWSModel


@end

/**
 
 */
@interface AWSglueDeleteTableRequest : AWSRequest


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
@interface AWSglueDeleteTableResponse : AWSModel


@end

/**
 
 */
@interface AWSglueDeleteTableVersionRequest : AWSRequest


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
@interface AWSglueDeleteTableVersionResponse : AWSModel


@end

/**
 
 */
@interface AWSglueDeleteTriggerRequest : AWSRequest


/**
 <p>The name of the trigger to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSglueDeleteTriggerResponse : AWSModel


/**
 <p>The name of the trigger that was deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSglueDeleteUserDefinedFunctionRequest : AWSRequest


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
@interface AWSglueDeleteUserDefinedFunctionResponse : AWSModel


@end

/**
 
 */
@interface AWSglueDeleteWorkflowRequest : AWSRequest


/**
 <p>Name of the workflow to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSglueDeleteWorkflowResponse : AWSModel


/**
 <p>Name of the workflow specified in input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>A development endpoint where a developer can remotely debug extract, transform, and load (ETL) scripts.</p>
 */
@interface AWSglueDevEndpoint : AWSModel


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
@property (nonatomic, assign) AWSglueWorkerType workerType;

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
@interface AWSglueDevEndpointCustomLibraries : AWSModel


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
@interface AWSglueDynamoDBTarget : AWSModel


/**
 <p>The name of the DynamoDB table to crawl.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

@end

/**
 <p>An edge represents a directed connection between two AWS Glue components which are part of the workflow the edge belongs to.</p>
 */
@interface AWSglueEdge : AWSModel


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
@interface AWSglueEncryptionAtRest : AWSModel


/**
 <p>The encryption-at-rest mode for encrypting Data Catalog data.</p>
 */
@property (nonatomic, assign) AWSglueCatalogEncryptionMode catalogEncryptionMode;

/**
 <p>The ID of the AWS KMS key to use for encryption at rest.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sseAwsKmsKeyId;

@end

/**
 <p>Specifies an encryption configuration.</p>
 */
@interface AWSglueEncryptionConfiguration : AWSModel


/**
 <p>The encryption configuration for Amazon CloudWatch.</p>
 */
@property (nonatomic, strong) AWSglueCloudWatchEncryption * _Nullable cloudWatchEncryption;

/**
 <p>The encryption configuration for job bookmarks.</p>
 */
@property (nonatomic, strong) AWSglueJobBookmarksEncryption * _Nullable jobBookmarksEncryption;

/**
 <p>The encryption configuration for Amazon Simple Storage Service (Amazon S3) data.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueS3Encryption *> * _Nullable s3Encryption;

@end

/**
 <p>Contains details about an error.</p>
 */
@interface AWSglueErrorDetail : AWSModel


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
@interface AWSglueEvaluationMetrics : AWSModel


/**
 <p>The evaluation metrics for the find matches algorithm.</p>
 */
@property (nonatomic, strong) AWSglueFindMatchesMetrics * _Nullable findMatchesMetrics;

/**
 <p>The type of machine learning transform.</p>
 */
@property (nonatomic, assign) AWSglueTransformType transformType;

@end

/**
 <p>An execution property of a job.</p>
 */
@interface AWSglueExecutionProperty : AWSModel


/**
 <p>The maximum number of concurrent runs allowed for the job. The default is 1. An error is returned when this threshold is reached. The maximum value you can specify is controlled by a service limit.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxConcurrentRuns;

@end

/**
 <p>Specifies configuration properties for an exporting labels task run.</p>
 */
@interface AWSglueExportLabelsTaskRunProperties : AWSModel


/**
 <p>The Amazon Simple Storage Service (Amazon S3) path where you will export the labels.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3Path;

@end

/**
 <p>The evaluation metrics for the find matches algorithm. The quality of your machine learning transform is measured by getting your transform to predict some matches and comparing the results to known matches from the same dataset. The quality metrics are based on a subset of your data, so they are not precise.</p>
 */
@interface AWSglueFindMatchesMetrics : AWSModel


/**
 <p>The area under the precision/recall curve (AUPRC) is a single number measuring the overall quality of the transform, that is independent of the choice made for precision vs. recall. Higher values indicate that you have a more attractive precision vs. recall tradeoff.</p><p>For more information, see <a href="https://en.wikipedia.org/wiki/Precision_and_recall">Precision and recall</a> in Wikipedia.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable areaUnderPRCurve;

/**
 <p>The confusion matrix shows you what your transform is predicting accurately and what types of errors it is making.</p><p>For more information, see <a href="https://en.wikipedia.org/wiki/Confusion_matrix">Confusion matrix</a> in Wikipedia.</p>
 */
@property (nonatomic, strong) AWSglueConfusionMatrix * _Nullable confusionMatrix;

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
@interface AWSglueFindMatchesParameters : AWSModel


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
@interface AWSglueFindMatchesTaskRunProperties : AWSModel


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
@interface AWSglueGetCatalogImportStatusRequest : AWSRequest


/**
 <p>The ID of the catalog to migrate. Currently, this should be the AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

@end

/**
 
 */
@interface AWSglueGetCatalogImportStatusResponse : AWSModel


/**
 <p>The status of the specified catalog migration.</p>
 */
@property (nonatomic, strong) AWSglueCatalogImportStatus * _Nullable importStatus;

@end

/**
 
 */
@interface AWSglueGetClassifierRequest : AWSRequest


/**
 <p>Name of the classifier to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSglueGetClassifierResponse : AWSModel


/**
 <p>The requested classifier.</p>
 */
@property (nonatomic, strong) AWSglueClassifier * _Nullable classifier;

@end

/**
 
 */
@interface AWSglueGetClassifiersRequest : AWSRequest


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
@interface AWSglueGetClassifiersResponse : AWSModel


/**
 <p>The requested list of classifier objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueClassifier *> * _Nullable classifiers;

/**
 <p>A continuation token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSglueGetConnectionRequest : AWSRequest


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
@interface AWSglueGetConnectionResponse : AWSModel


/**
 <p>The requested connection definition.</p>
 */
@property (nonatomic, strong) AWSglueConnection * _Nullable connection;

@end

/**
 <p>Filters the connection definitions that are returned by the <code>GetConnections</code> API operation.</p>
 */
@interface AWSglueGetConnectionsFilter : AWSModel


/**
 <p>The type of connections to return. Currently, only JDBC is supported; SFTP is not supported.</p>
 */
@property (nonatomic, assign) AWSglueConnectionType connectionType;

/**
 <p>A criteria string that must match the criteria recorded in the connection definition for that connection definition to be returned.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable matchCriteria;

@end

/**
 
 */
@interface AWSglueGetConnectionsRequest : AWSRequest


/**
 <p>The ID of the Data Catalog in which the connections reside. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>A filter that controls which connections are returned.</p>
 */
@property (nonatomic, strong) AWSglueGetConnectionsFilter * _Nullable filter;

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
@interface AWSglueGetConnectionsResponse : AWSModel


/**
 <p>A list of requested connection definitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueConnection *> * _Nullable connectionList;

/**
 <p>A continuation token, if the list of connections returned does not include the last of the filtered connections.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSglueGetCrawlerMetricsRequest : AWSRequest


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
@interface AWSglueGetCrawlerMetricsResponse : AWSModel


/**
 <p>A list of metrics for the specified crawler.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueCrawlerMetrics *> * _Nullable crawlerMetricsList;

/**
 <p>A continuation token, if the returned list does not contain the last metric available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSglueGetCrawlerRequest : AWSRequest


/**
 <p>The name of the crawler to retrieve metadata for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSglueGetCrawlerResponse : AWSModel


/**
 <p>The metadata for the specified crawler.</p>
 */
@property (nonatomic, strong) AWSglueCrawler * _Nullable crawler;

@end

/**
 
 */
@interface AWSglueGetCrawlersRequest : AWSRequest


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
@interface AWSglueGetCrawlersResponse : AWSModel


/**
 <p>A list of crawler metadata.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueCrawler *> * _Nullable crawlers;

/**
 <p>A continuation token, if the returned list has not reached the end of those defined in this customer account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSglueGetDataCatalogEncryptionSettingsRequest : AWSRequest


/**
 <p>The ID of the Data Catalog to retrieve the security configuration for. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

@end

/**
 
 */
@interface AWSglueGetDataCatalogEncryptionSettingsResponse : AWSModel


/**
 <p>The requested security configuration.</p>
 */
@property (nonatomic, strong) AWSglueDataCatalogEncryptionSettings * _Nullable dataCatalogEncryptionSettings;

@end

/**
 
 */
@interface AWSglueGetDatabaseRequest : AWSRequest


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
@interface AWSglueGetDatabaseResponse : AWSModel


/**
 <p>The definition of the specified database in the Data Catalog.</p>
 */
@property (nonatomic, strong) AWSglueDatabase * _Nullable database;

@end

/**
 
 */
@interface AWSglueGetDatabasesRequest : AWSRequest


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
@interface AWSglueGetDatabasesResponse : AWSModel


/**
 <p>A list of <code>Database</code> objects from the specified catalog.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueDatabase *> * _Nullable databaseList;

/**
 <p>A continuation token for paginating the returned list of tokens, returned if the current segment of the list is not the last.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSglueGetDataflowGraphRequest : AWSRequest


/**
 <p>The Python script to transform.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pythonScript;

@end

/**
 
 */
@interface AWSglueGetDataflowGraphResponse : AWSModel


/**
 <p>A list of the edges in the resulting DAG.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueCodeGenEdge *> * _Nullable dagEdges;

/**
 <p>A list of the nodes in the resulting DAG.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueCodeGenNode *> * _Nullable dagNodes;

@end

/**
 
 */
@interface AWSglueGetDevEndpointRequest : AWSRequest


/**
 <p>Name of the <code>DevEndpoint</code> to retrieve information for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

@end

/**
 
 */
@interface AWSglueGetDevEndpointResponse : AWSModel


/**
 <p>A <code>DevEndpoint</code> definition.</p>
 */
@property (nonatomic, strong) AWSglueDevEndpoint * _Nullable devEndpoint;

@end

/**
 
 */
@interface AWSglueGetDevEndpointsRequest : AWSRequest


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
@interface AWSglueGetDevEndpointsResponse : AWSModel


/**
 <p>A list of <code>DevEndpoint</code> definitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueDevEndpoint *> * _Nullable devEndpoints;

/**
 <p>A continuation token, if not all <code>DevEndpoint</code> definitions have yet been returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSglueGetJobBookmarkRequest : AWSRequest


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
@interface AWSglueGetJobBookmarkResponse : AWSModel


/**
 <p>A structure that defines a point that a job can resume processing.</p>
 */
@property (nonatomic, strong) AWSglueJobBookmarkEntry * _Nullable jobBookmarkEntry;

@end

/**
 
 */
@interface AWSglueGetJobRequest : AWSRequest


/**
 <p>The name of the job definition to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

@end

/**
 
 */
@interface AWSglueGetJobResponse : AWSModel


/**
 <p>The requested job definition.</p>
 */
@property (nonatomic, strong) AWSglueJob * _Nullable job;

@end

/**
 
 */
@interface AWSglueGetJobRunRequest : AWSRequest


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
@interface AWSglueGetJobRunResponse : AWSModel


/**
 <p>The requested job-run metadata.</p>
 */
@property (nonatomic, strong) AWSglueJobRun * _Nullable jobRun;

@end

/**
 
 */
@interface AWSglueGetJobRunsRequest : AWSRequest


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
@interface AWSglueGetJobRunsResponse : AWSModel


/**
 <p>A list of job-run metadata objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueJobRun *> * _Nullable jobRuns;

/**
 <p>A continuation token, if not all requested job runs have been returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSglueGetJobsRequest : AWSRequest


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
@interface AWSglueGetJobsResponse : AWSModel


/**
 <p>A list of job definitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueJob *> * _Nullable jobs;

/**
 <p>A continuation token, if not all job definitions have yet been returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSglueGetMLTaskRunRequest : AWSRequest


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
@interface AWSglueGetMLTaskRunResponse : AWSModel


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
@property (nonatomic, strong) AWSglueTaskRunProperties * _Nullable properties;

/**
 <p>The date and time when this task run started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedOn;

/**
 <p>The status for this task run.</p>
 */
@property (nonatomic, assign) AWSglueTaskStatusType status;

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
@interface AWSglueGetMLTaskRunsRequest : AWSRequest


/**
 <p>The filter criteria, in the <code>TaskRunFilterCriteria</code> structure, for the task run.</p>
 */
@property (nonatomic, strong) AWSglueTaskRunFilterCriteria * _Nullable filter;

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
@property (nonatomic, strong) AWSglueTaskRunSortCriteria * _Nullable sort;

/**
 <p>The unique identifier of the machine learning transform.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 
 */
@interface AWSglueGetMLTaskRunsResponse : AWSModel


/**
 <p>A pagination token, if more results are available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of task runs that are associated with the transform.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueTaskRun *> * _Nullable taskRuns;

@end

/**
 
 */
@interface AWSglueGetMLTransformRequest : AWSRequest


/**
 <p>The unique identifier of the transform, generated at the time that the transform was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 
 */
@interface AWSglueGetMLTransformResponse : AWSModel


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
@property (nonatomic, strong) AWSglueEvaluationMetrics * _Nullable evaluationMetrics;

/**
 <p>This value determines which version of AWS Glue this machine learning transform is compatible with. Glue 1.0 is recommended for most customers. If the value is not set, the Glue compatibility defaults to Glue 0.9. For more information, see <a href="https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions">AWS Glue Versions</a> in the developer guide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable glueVersion;

/**
 <p>A list of AWS Glue table definitions used by the transform.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueGlueTable *> * _Nullable inputRecordTables;

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
@property (nonatomic, strong) AWSglueTransformParameters * _Nullable parameters;

/**
 <p>The name or Amazon Resource Name (ARN) of the IAM role with the required permissions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>The <code>Map&lt;Column, Type&gt;</code> object that represents the schema that this transform accepts. Has an upper bound of 100 columns.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueSchemaColumn *> * _Nullable schema;

/**
 <p>The last known status of the transform (to indicate whether it can be used or not). One of "NOT_READY", "READY", or "DELETING".</p>
 */
@property (nonatomic, assign) AWSglueTransformStatusType status;

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
@property (nonatomic, assign) AWSglueWorkerType workerType;

@end

/**
 
 */
@interface AWSglueGetMLTransformsRequest : AWSRequest


/**
 <p>The filter transformation criteria.</p>
 */
@property (nonatomic, strong) AWSglueTransformFilterCriteria * _Nullable filter;

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
@property (nonatomic, strong) AWSglueTransformSortCriteria * _Nullable sort;

@end

/**
 
 */
@interface AWSglueGetMLTransformsResponse : AWSModel


/**
 <p>A pagination token, if more results are available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of machine learning transforms.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueMLTransform *> * _Nullable transforms;

@end

/**
 
 */
@interface AWSglueGetMappingRequest : AWSRequest


/**
 <p>Parameters for the mapping.</p>
 */
@property (nonatomic, strong) AWSglueLocation * _Nullable location;

/**
 <p>A list of target tables.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueCatalogEntry *> * _Nullable sinks;

/**
 <p>Specifies the source table.</p>
 */
@property (nonatomic, strong) AWSglueCatalogEntry * _Nullable source;

@end

/**
 
 */
@interface AWSglueGetMappingResponse : AWSModel


/**
 <p>A list of mappings to the specified targets.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueMappingEntry *> * _Nullable mapping;

@end

/**
 
 */
@interface AWSglueGetPartitionRequest : AWSRequest


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
@interface AWSglueGetPartitionResponse : AWSModel


/**
 <p>The requested information, in the form of a <code>Partition</code> object.</p>
 */
@property (nonatomic, strong) AWSgluePartition * _Nullable partition;

@end

/**
 
 */
@interface AWSglueGetPartitionsRequest : AWSRequest


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
@property (nonatomic, strong) AWSglueSegment * _Nullable segment;

/**
 <p>The name of the partitions' table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSglueGetPartitionsResponse : AWSModel


/**
 <p>A continuation token, if the returned list of partitions does not include the last one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of requested partitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSgluePartition *> * _Nullable partitions;

@end

/**
 
 */
@interface AWSglueGetPlanRequest : AWSRequest


/**
 <p>The programming language of the code to perform the mapping.</p>
 */
@property (nonatomic, assign) AWSglueLanguage language;

/**
 <p>The parameters for the mapping.</p>
 */
@property (nonatomic, strong) AWSglueLocation * _Nullable location;

/**
 <p>The list of mappings from a source table to target tables.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueMappingEntry *> * _Nullable mapping;

/**
 <p>The target tables.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueCatalogEntry *> * _Nullable sinks;

/**
 <p>The source table.</p>
 */
@property (nonatomic, strong) AWSglueCatalogEntry * _Nullable source;

@end

/**
 
 */
@interface AWSglueGetPlanResponse : AWSModel


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
@interface AWSglueGetResourcePolicyRequest : AWSRequest


@end

/**
 
 */
@interface AWSglueGetResourcePolicyResponse : AWSModel


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
@interface AWSglueGetSecurityConfigurationRequest : AWSRequest


/**
 <p>The name of the security configuration to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSglueGetSecurityConfigurationResponse : AWSModel


/**
 <p>The requested security configuration.</p>
 */
@property (nonatomic, strong) AWSglueSecurityConfiguration * _Nullable securityConfiguration;

@end

/**
 
 */
@interface AWSglueGetSecurityConfigurationsRequest : AWSRequest


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
@interface AWSglueGetSecurityConfigurationsResponse : AWSModel


/**
 <p>A continuation token, if there are more security configurations to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of security configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueSecurityConfiguration *> * _Nullable securityConfigurations;

@end

/**
 
 */
@interface AWSglueGetTableRequest : AWSRequest


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
@interface AWSglueGetTableResponse : AWSModel


/**
 <p>The <code>Table</code> object that defines the specified table.</p>
 */
@property (nonatomic, strong) AWSglueTable * _Nullable table;

@end

/**
 
 */
@interface AWSglueGetTableVersionRequest : AWSRequest


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
@interface AWSglueGetTableVersionResponse : AWSModel


/**
 <p>The requested table version.</p>
 */
@property (nonatomic, strong) AWSglueTableVersion * _Nullable tableVersion;

@end

/**
 
 */
@interface AWSglueGetTableVersionsRequest : AWSRequest


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
@interface AWSglueGetTableVersionsResponse : AWSModel


/**
 <p>A continuation token, if the list of available versions does not include the last one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of strings identifying available versions of the specified table.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueTableVersion *> * _Nullable tableVersions;

@end

/**
 
 */
@interface AWSglueGetTablesRequest : AWSRequest


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
@interface AWSglueGetTablesResponse : AWSModel


/**
 <p>A continuation token, present if the current list segment is not the last.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of the requested <code>Table</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueTable *> * _Nullable tableList;

@end

/**
 
 */
@interface AWSglueGetTagsRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource for which to retrieve tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSglueGetTagsResponse : AWSModel


/**
 <p>The requested tags.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSglueGetTriggerRequest : AWSRequest


/**
 <p>The name of the trigger to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSglueGetTriggerResponse : AWSModel


/**
 <p>The requested trigger definition.</p>
 */
@property (nonatomic, strong) AWSglueTrigger * _Nullable trigger;

@end

/**
 
 */
@interface AWSglueGetTriggersRequest : AWSRequest


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
@interface AWSglueGetTriggersResponse : AWSModel


/**
 <p>A continuation token, if not all the requested triggers have yet been returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of triggers for the specified job.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueTrigger *> * _Nullable triggers;

@end

/**
 
 */
@interface AWSglueGetUserDefinedFunctionRequest : AWSRequest


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
@interface AWSglueGetUserDefinedFunctionResponse : AWSModel


/**
 <p>The requested function definition.</p>
 */
@property (nonatomic, strong) AWSglueUserDefinedFunction * _Nullable userDefinedFunction;

@end

/**
 
 */
@interface AWSglueGetUserDefinedFunctionsRequest : AWSRequest


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
@interface AWSglueGetUserDefinedFunctionsResponse : AWSModel


/**
 <p>A continuation token, if the list of functions returned does not include the last requested function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of requested function definitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueUserDefinedFunction *> * _Nullable userDefinedFunctions;

@end

/**
 
 */
@interface AWSglueGetWorkflowRequest : AWSRequest


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
@interface AWSglueGetWorkflowResponse : AWSModel


/**
 <p>The resource metadata for the workflow.</p>
 */
@property (nonatomic, strong) AWSglueWorkflow * _Nullable workflow;

@end

/**
 
 */
@interface AWSglueGetWorkflowRunPropertiesRequest : AWSRequest


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
@interface AWSglueGetWorkflowRunPropertiesResponse : AWSModel


/**
 <p>The workflow run properties which were set during the specified run.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable runProperties;

@end

/**
 
 */
@interface AWSglueGetWorkflowRunRequest : AWSRequest


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
@interface AWSglueGetWorkflowRunResponse : AWSModel


/**
 <p>The requested workflow run metadata.</p>
 */
@property (nonatomic, strong) AWSglueWorkflowRun * _Nullable run;

@end

/**
 
 */
@interface AWSglueGetWorkflowRunsRequest : AWSRequest


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
@interface AWSglueGetWorkflowRunsResponse : AWSModel


/**
 <p>A continuation token, if not all requested workflow runs have been returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of workflow run metadata objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueWorkflowRun *> * _Nullable runs;

@end

/**
 <p>The database and table in the AWS Glue Data Catalog that is used for input or output data.</p>
 Required parameters: [DatabaseName, TableName]
 */
@interface AWSglueGlueTable : AWSModel


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
@interface AWSglueGrokClassifier : AWSModel


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
@interface AWSglueImportCatalogToGlueRequest : AWSRequest


/**
 <p>The ID of the catalog to import. Currently, this should be the AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

@end

/**
 
 */
@interface AWSglueImportCatalogToGlueResponse : AWSModel


@end

/**
 <p>Specifies configuration properties for an importing labels task run.</p>
 */
@interface AWSglueImportLabelsTaskRunProperties : AWSModel


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
@interface AWSglueJdbcTarget : AWSModel


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
@interface AWSglueJob : AWSModel


/**
 <p>This field is deprecated. Use <code>MaxCapacity</code> instead.</p><p>The number of AWS Glue data processing units (DPUs) allocated to runs of this job. You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For more information, see the <a href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>.</p><p/>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedCapacity;

/**
 <p>The <code>JobCommand</code> that executes this job.</p>
 */
@property (nonatomic, strong) AWSglueJobCommand * _Nullable command;

/**
 <p>The connections used for this job.</p>
 */
@property (nonatomic, strong) AWSglueConnectionsList * _Nullable connections;

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
@property (nonatomic, strong) AWSglueExecutionProperty * _Nullable executionProperty;

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
@property (nonatomic, strong) AWSglueNotificationProperty * _Nullable notificationProperty;

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
@property (nonatomic, assign) AWSglueWorkerType workerType;

@end

/**
 <p>Defines a point that a job can resume processing.</p>
 */
@interface AWSglueJobBookmarkEntry : AWSModel


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
@interface AWSglueJobBookmarksEncryption : AWSModel


/**
 <p>The encryption mode to use for job bookmarks data.</p>
 */
@property (nonatomic, assign) AWSglueJobBookmarksEncryptionMode jobBookmarksEncryptionMode;

/**
 <p>The Amazon Resource Name (ARN) of the KMS key to be used to encrypt the data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyArn;

@end

/**
 <p>Specifies code executed when a job is run.</p>
 */
@interface AWSglueJobCommand : AWSModel


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
@interface AWSglueJobNodeDetails : AWSModel


/**
 <p>The information for the job runs represented by the job node.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueJobRun *> * _Nullable jobRuns;

@end

/**
 <p>Contains information about a job run.</p>
 */
@interface AWSglueJobRun : AWSModel


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
 <p>The current state of the job run.</p>
 */
@property (nonatomic, assign) AWSglueJobRunState jobRunState;

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
@property (nonatomic, strong) AWSglueNotificationProperty * _Nullable notificationProperty;

/**
 <p>The number of workers of a defined <code>workerType</code> that are allocated when a job runs.</p><p>The maximum number of workers you can define are 299 for <code>G.1X</code>, and 149 for <code>G.2X</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfWorkers;

/**
 <p>A list of predecessors to this job run.</p>
 */
@property (nonatomic, strong) NSArray<AWSgluePredecessor *> * _Nullable predecessorRuns;

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
@property (nonatomic, assign) AWSglueWorkerType workerType;

@end

/**
 <p>Specifies information used to update an existing job definition. The previous job definition is completely overwritten by this information.</p>
 */
@interface AWSglueJobUpdate : AWSModel


/**
 <p>This field is deprecated. Use <code>MaxCapacity</code> instead.</p><p>The number of AWS Glue data processing units (DPUs) to allocate to this job. You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a relative measure of processing power that consists of 4 vCPUs of compute capacity and 16 GB of memory. For more information, see the <a href="https://aws.amazon.com/glue/pricing/">AWS Glue pricing page</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedCapacity;

/**
 <p>The <code>JobCommand</code> that executes this job (required).</p>
 */
@property (nonatomic, strong) AWSglueJobCommand * _Nullable command;

/**
 <p>The connections used for this job.</p>
 */
@property (nonatomic, strong) AWSglueConnectionsList * _Nullable connections;

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
@property (nonatomic, strong) AWSglueExecutionProperty * _Nullable executionProperty;

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
@property (nonatomic, strong) AWSglueNotificationProperty * _Nullable notificationProperty;

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
@property (nonatomic, assign) AWSglueWorkerType workerType;

@end

/**
 <p>A classifier for <code>JSON</code> content.</p>
 Required parameters: [Name, JsonPath]
 */
@interface AWSglueJsonClassifier : AWSModel


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
@interface AWSglueLabelingSetGenerationTaskRunProperties : AWSModel


/**
 <p>The Amazon Simple Storage Service (Amazon S3) path where you will generate the labeling set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3Path;

@end

/**
 <p>Status and error information about the most recent crawl.</p>
 */
@interface AWSglueLastCrawlInfo : AWSModel


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
@property (nonatomic, assign) AWSglueLastCrawlStatus status;

@end

/**
 
 */
@interface AWSglueListCrawlersRequest : AWSRequest


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
@interface AWSglueListCrawlersResponse : AWSModel


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
@interface AWSglueListDevEndpointsRequest : AWSRequest


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
@interface AWSglueListDevEndpointsResponse : AWSModel


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
@interface AWSglueListJobsRequest : AWSRequest


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
@interface AWSglueListJobsResponse : AWSModel


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
@interface AWSglueListMLTransformsRequest : AWSRequest


/**
 <p>A <code>TransformFilterCriteria</code> used to filter the machine learning transforms.</p>
 */
@property (nonatomic, strong) AWSglueTransformFilterCriteria * _Nullable filter;

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
@property (nonatomic, strong) AWSglueTransformSortCriteria * _Nullable sort;

/**
 <p>Specifies to return only these tagged resources.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSglueListMLTransformsResponse : AWSModel


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
@interface AWSglueListTriggersRequest : AWSRequest


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
@interface AWSglueListTriggersResponse : AWSModel


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
@interface AWSglueListWorkflowsRequest : AWSRequest


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
@interface AWSglueListWorkflowsResponse : AWSModel


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
@interface AWSglueLocation : AWSModel


/**
 <p>An Amazon DynamoDB table location.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueCodeGenNodeArg *> * _Nullable dynamoDB;

/**
 <p>A JDBC location.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueCodeGenNodeArg *> * _Nullable jdbc;

/**
 <p>An Amazon Simple Storage Service (Amazon S3) location.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueCodeGenNodeArg *> * _Nullable s3;

@end

/**
 <p>A structure for a machine learning transform.</p>
 */
@interface AWSglueMLTransform : AWSModel


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
@property (nonatomic, strong) AWSglueEvaluationMetrics * _Nullable evaluationMetrics;

/**
 <p>This value determines which version of AWS Glue this machine learning transform is compatible with. Glue 1.0 is recommended for most customers. If the value is not set, the Glue compatibility defaults to Glue 0.9. For more information, see <a href="https://docs.aws.amazon.com/glue/latest/dg/release-notes.html#release-notes-versions">AWS Glue Versions</a> in the developer guide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable glueVersion;

/**
 <p>A list of AWS Glue table definitions used by the transform.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueGlueTable *> * _Nullable inputRecordTables;

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
@property (nonatomic, strong) AWSglueTransformParameters * _Nullable parameters;

/**
 <p>The name or Amazon Resource Name (ARN) of the IAM role with the required permissions. The required permissions include both AWS Glue service role permissions to AWS Glue resources, and Amazon S3 permissions required by the transform. </p><ul><li><p>This role needs AWS Glue service role permissions to allow access to resources in AWS Glue. See <a href="https://docs.aws.amazon.com/glue/latest/dg/attach-policy-iam-user.html">Attach a Policy to IAM Users That Access AWS Glue</a>.</p></li><li><p>This role needs permission to your Amazon Simple Storage Service (Amazon S3) sources, targets, temporary directory, scripts, and any libraries used by the task run for this transform.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>A map of key-value pairs representing the columns and data types that this transform can run against. Has an upper bound of 100 columns.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueSchemaColumn *> * _Nullable schema;

/**
 <p>The current status of the machine learning transform.</p>
 */
@property (nonatomic, assign) AWSglueTransformStatusType status;

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
@property (nonatomic, assign) AWSglueWorkerType workerType;

@end

/**
 <p>Defines a mapping.</p>
 */
@interface AWSglueMappingEntry : AWSModel


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
@interface AWSglueNode : AWSModel


/**
 <p>Details of the crawler when the node represents a crawler.</p>
 */
@property (nonatomic, strong) AWSglueCrawlerNodeDetails * _Nullable crawlerDetails;

/**
 <p>Details of the Job when the node represents a Job.</p>
 */
@property (nonatomic, strong) AWSglueJobNodeDetails * _Nullable jobDetails;

/**
 <p>The name of the AWS Glue component represented by the node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Details of the Trigger when the node represents a Trigger.</p>
 */
@property (nonatomic, strong) AWSglueTriggerNodeDetails * _Nullable triggerDetails;

/**
 <p>The type of AWS Glue component represented by the node.</p>
 */
@property (nonatomic, assign) AWSglueNodeType types;

/**
 <p>The unique Id assigned to the node within the workflow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uniqueId;

@end

/**
 <p>Specifies configuration properties of a notification.</p>
 */
@interface AWSglueNotificationProperty : AWSModel


/**
 <p>After a job run starts, the number of minutes to wait before sending a job run delay notification.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable notifyDelayAfter;

@end

/**
 <p>Specifies the sort order of a sorted column.</p>
 Required parameters: [Column, SortOrder]
 */
@interface AWSglueOrder : AWSModel


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
@interface AWSgluePartition : AWSModel


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
@property (nonatomic, strong) AWSglueStorageDescriptor * _Nullable storageDescriptor;

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
@interface AWSgluePartitionError : AWSModel


/**
 <p>The details about the partition error.</p>
 */
@property (nonatomic, strong) AWSglueErrorDetail * _Nullable errorDetail;

/**
 <p>The values that define the partition.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable partitionValues;

@end

/**
 <p>The structure used to create and update a partition.</p>
 */
@interface AWSgluePartitionInput : AWSModel


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
@property (nonatomic, strong) AWSglueStorageDescriptor * _Nullable storageDescriptor;

/**
 <p>The values of the partition. Although this parameter is not required by the SDK, you must specify this parameter for a valid input.</p><p>The values for the keys for the new partition must be passed as an array of String objects that must be ordered in the same order as the partition keys appearing in the Amazon S3 prefix. Otherwise AWS Glue will add the values to the wrong keys.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Contains a list of values defining partitions.</p>
 Required parameters: [Values]
 */
@interface AWSgluePartitionValueList : AWSModel


/**
 <p>The list of values.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Specifies the physical requirements for a connection.</p>
 */
@interface AWSgluePhysicalConnectionRequirements : AWSModel


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
@interface AWSgluePredecessor : AWSModel


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
@interface AWSgluePredicate : AWSModel


/**
 <p>A list of the conditions that determine when the trigger will fire.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueCondition *> * _Nullable conditions;

/**
 <p>An optional field if only one condition is listed. If multiple conditions are listed, then this field is required.</p>
 */
@property (nonatomic, assign) AWSglueLogical logical;

@end

/**
 <p>Permissions granted to a principal.</p>
 */
@interface AWSgluePrincipalPermissions : AWSModel


/**
 <p>The permissions that are granted to the principal.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable permissions;

/**
 <p>The principal who is granted permissions.</p>
 */
@property (nonatomic, strong) AWSglueDataLakePrincipal * _Nullable principal;

@end

/**
 <p>Defines a property predicate.</p>
 */
@interface AWSgluePropertyPredicate : AWSModel


/**
 <p>The comparator used to compare this property to others.</p>
 */
@property (nonatomic, assign) AWSglueComparator comparator;

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
@interface AWSgluePutDataCatalogEncryptionSettingsRequest : AWSRequest


/**
 <p>The ID of the Data Catalog to set the security configuration for. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>The security configuration to set.</p>
 */
@property (nonatomic, strong) AWSglueDataCatalogEncryptionSettings * _Nullable dataCatalogEncryptionSettings;

@end

/**
 
 */
@interface AWSgluePutDataCatalogEncryptionSettingsResponse : AWSModel


@end

/**
 
 */
@interface AWSgluePutResourcePolicyRequest : AWSRequest


/**
 <p>A value of <code>MUST_EXIST</code> is used to update a policy. A value of <code>NOT_EXIST</code> is used to create a new policy. If a value of <code>NONE</code> or a null value is used, the call will not depend on the existence of a policy.</p>
 */
@property (nonatomic, assign) AWSglueExistCondition policyExistsCondition;

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
@interface AWSgluePutResourcePolicyResponse : AWSModel


/**
 <p>A hash of the policy that has just been set. This must be included in a subsequent call that overwrites or updates this policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyHash;

@end

/**
 
 */
@interface AWSgluePutWorkflowRunPropertiesRequest : AWSRequest


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
@interface AWSgluePutWorkflowRunPropertiesResponse : AWSModel


@end

/**
 
 */
@interface AWSglueResetJobBookmarkRequest : AWSRequest


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
@interface AWSglueResetJobBookmarkResponse : AWSModel


/**
 <p>The reset bookmark entry.</p>
 */
@property (nonatomic, strong) AWSglueJobBookmarkEntry * _Nullable jobBookmarkEntry;

@end

/**
 <p>The URIs for function resources.</p>
 */
@interface AWSglueResourceUri : AWSModel


/**
 <p>The type of the resource.</p>
 */
@property (nonatomic, assign) AWSglueResourceType resourceType;

/**
 <p>The URI for accessing the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uri;

@end

/**
 <p>Specifies how Amazon Simple Storage Service (Amazon S3) data should be encrypted.</p>
 */
@interface AWSglueS3Encryption : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the KMS key to be used to encrypt the data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyArn;

/**
 <p>The encryption mode to use for Amazon S3 data.</p>
 */
@property (nonatomic, assign) AWSglueS3EncryptionMode s3EncryptionMode;

@end

/**
 <p>Specifies a data store in Amazon Simple Storage Service (Amazon S3).</p>
 */
@interface AWSglueS3Target : AWSModel


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
@interface AWSglueSchedule : AWSModel


/**
 <p>A <code>cron</code> expression used to specify the schedule. For more information, see <a href="http://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based Schedules for Jobs and Crawlers</a>. For example, to run something every day at 12:15 UTC, specify <code>cron(15 12 * * ? *)</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleExpression;

/**
 <p>The state of the schedule.</p>
 */
@property (nonatomic, assign) AWSglueScheduleState state;

@end

/**
 <p>A policy that specifies update and deletion behaviors for the crawler.</p>
 */
@interface AWSglueSchemaChangePolicy : AWSModel


/**
 <p>The deletion behavior when the crawler finds a deleted object.</p>
 */
@property (nonatomic, assign) AWSglueDeleteBehavior deleteBehavior;

/**
 <p>The update behavior when the crawler finds a changed schema.</p>
 */
@property (nonatomic, assign) AWSglueUpdateBehavior updateBehavior;

@end

/**
 <p>A key-value pair representing a column and data type that this transform can run against. The <code>Schema</code> parameter of the <code>MLTransform</code> may contain up to 100 of these structures.</p>
 */
@interface AWSglueSchemaColumn : AWSModel


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
@interface AWSglueSearchTablesRequest : AWSRequest


/**
 <p>A unique identifier, consisting of <code><i>account_id</i>/datalake</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>A list of key-value pairs, and a comparator used to filter the search results. Returns all entities matching the predicate.</p>
 */
@property (nonatomic, strong) NSArray<AWSgluePropertyPredicate *> * _Nullable filters;

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
@property (nonatomic, strong) NSArray<AWSglueSortCriterion *> * _Nullable sortCriteria;

@end

/**
 
 */
@interface AWSglueSearchTablesResponse : AWSModel


/**
 <p>A continuation token, present if the current list segment is not the last.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of the requested <code>Table</code> objects. The <code>SearchTables</code> response returns only the tables that you have access to.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueTable *> * _Nullable tableList;

@end

/**
 <p>Specifies a security configuration.</p>
 */
@interface AWSglueSecurityConfiguration : AWSModel


/**
 <p>The time at which this security configuration was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimeStamp;

/**
 <p>The encryption configuration associated with this security configuration.</p>
 */
@property (nonatomic, strong) AWSglueEncryptionConfiguration * _Nullable encryptionConfiguration;

/**
 <p>The name of the security configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Defines a non-overlapping region of a table's partitions, allowing multiple requests to be executed in parallel.</p>
 Required parameters: [SegmentNumber, TotalSegments]
 */
@interface AWSglueSegment : AWSModel


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
@interface AWSglueSerDeInfo : AWSModel


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
@interface AWSglueSkewedInfo : AWSModel


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
@interface AWSglueSortCriterion : AWSModel


/**
 <p>The name of the field on which to sort.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fieldName;

/**
 <p>An ascending or descending sort.</p>
 */
@property (nonatomic, assign) AWSglueSort sort;

@end

/**
 
 */
@interface AWSglueStartCrawlerRequest : AWSRequest


/**
 <p>Name of the crawler to start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSglueStartCrawlerResponse : AWSModel


@end

/**
 
 */
@interface AWSglueStartCrawlerScheduleRequest : AWSRequest


/**
 <p>Name of the crawler to schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable crawlerName;

@end

/**
 
 */
@interface AWSglueStartCrawlerScheduleResponse : AWSModel


@end

/**
 
 */
@interface AWSglueStartExportLabelsTaskRunRequest : AWSRequest


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
@interface AWSglueStartExportLabelsTaskRunResponse : AWSModel


/**
 <p>The unique identifier for the task run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskRunId;

@end

/**
 
 */
@interface AWSglueStartImportLabelsTaskRunRequest : AWSRequest


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
@interface AWSglueStartImportLabelsTaskRunResponse : AWSModel


/**
 <p>The unique identifier for the task run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskRunId;

@end

/**
 
 */
@interface AWSglueStartJobRunRequest : AWSRequest


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
@property (nonatomic, strong) AWSglueNotificationProperty * _Nullable notificationProperty;

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
@property (nonatomic, assign) AWSglueWorkerType workerType;

@end

/**
 
 */
@interface AWSglueStartJobRunResponse : AWSModel


/**
 <p>The ID assigned to this job run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobRunId;

@end

/**
 
 */
@interface AWSglueStartMLEvaluationTaskRunRequest : AWSRequest


/**
 <p>The unique identifier of the machine learning transform.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 
 */
@interface AWSglueStartMLEvaluationTaskRunResponse : AWSModel


/**
 <p>The unique identifier associated with this run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskRunId;

@end

/**
 
 */
@interface AWSglueStartMLLabelingSetGenerationTaskRunRequest : AWSRequest


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
@interface AWSglueStartMLLabelingSetGenerationTaskRunResponse : AWSModel


/**
 <p>The unique run identifier that is associated with this task run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskRunId;

@end

/**
 
 */
@interface AWSglueStartTriggerRequest : AWSRequest


/**
 <p>The name of the trigger to start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSglueStartTriggerResponse : AWSModel


/**
 <p>The name of the trigger that was started.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSglueStartWorkflowRunRequest : AWSRequest


/**
 <p>The name of the workflow to start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSglueStartWorkflowRunResponse : AWSModel


/**
 <p>An Id for the new run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable runId;

@end

/**
 
 */
@interface AWSglueStopCrawlerRequest : AWSRequest


/**
 <p>Name of the crawler to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSglueStopCrawlerResponse : AWSModel


@end

/**
 
 */
@interface AWSglueStopCrawlerScheduleRequest : AWSRequest


/**
 <p>Name of the crawler whose schedule state to set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable crawlerName;

@end

/**
 
 */
@interface AWSglueStopCrawlerScheduleResponse : AWSModel


@end

/**
 
 */
@interface AWSglueStopTriggerRequest : AWSRequest


/**
 <p>The name of the trigger to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSglueStopTriggerResponse : AWSModel


/**
 <p>The name of the trigger that was stopped.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Describes the physical storage of table data.</p>
 */
@interface AWSglueStorageDescriptor : AWSModel


/**
 <p>A list of reducer grouping columns, clustering columns, and bucketing columns in the table.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable bucketColumns;

/**
 <p>A list of the <code>Columns</code> in the table.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueColumn *> * _Nullable columns;

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
@property (nonatomic, strong) AWSglueSerDeInfo * _Nullable serdeInfo;

/**
 <p>The information about values that appear frequently in a column (skewed values).</p>
 */
@property (nonatomic, strong) AWSglueSkewedInfo * _Nullable skewedInfo;

/**
 <p>A list specifying the sort order of each bucket in the table.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueOrder *> * _Nullable sortColumns;

/**
 <p><code>True</code> if the table data is stored in subdirectories, or <code>False</code> if not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable storedAsSubDirectories;

@end

/**
 <p>Represents a collection of related data organized in columns and rows.</p>
 Required parameters: [Name]
 */
@interface AWSglueTable : AWSModel


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
@property (nonatomic, strong) NSArray<AWSglueColumn *> * _Nullable partitionKeys;

/**
 <p>The retention time for this table.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retention;

/**
 <p>A storage descriptor containing information about the physical storage of this table.</p>
 */
@property (nonatomic, strong) AWSglueStorageDescriptor * _Nullable storageDescriptor;

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
@interface AWSglueTableError : AWSModel


/**
 <p>The details about the error.</p>
 */
@property (nonatomic, strong) AWSglueErrorDetail * _Nullable errorDetail;

/**
 <p>The name of the table. For Hive compatibility, this must be entirely lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>A structure used to define a table.</p>
 Required parameters: [Name]
 */
@interface AWSglueTableInput : AWSModel


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
@property (nonatomic, strong) NSArray<AWSglueColumn *> * _Nullable partitionKeys;

/**
 <p>The retention time for this table.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retention;

/**
 <p>A storage descriptor containing information about the physical storage of this table.</p>
 */
@property (nonatomic, strong) AWSglueStorageDescriptor * _Nullable storageDescriptor;

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
@interface AWSglueTableVersion : AWSModel


/**
 <p>The table in question.</p>
 */
@property (nonatomic, strong) AWSglueTable * _Nullable table;

/**
 <p>The ID value that identifies this table version. A <code>VersionId</code> is a string representation of an integer. Each version is incremented by 1.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>An error record for table-version operations.</p>
 */
@interface AWSglueTableVersionError : AWSModel


/**
 <p>The details about the error.</p>
 */
@property (nonatomic, strong) AWSglueErrorDetail * _Nullable errorDetail;

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
@interface AWSglueTagResourceRequest : AWSRequest


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
@interface AWSglueTagResourceResponse : AWSModel


@end

/**
 <p>The sampling parameters that are associated with the machine learning transform.</p>
 */
@interface AWSglueTaskRun : AWSModel


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
@property (nonatomic, strong) AWSglueTaskRunProperties * _Nullable properties;

/**
 <p>The date and time that this task run started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedOn;

/**
 <p>The current status of the requested task run.</p>
 */
@property (nonatomic, assign) AWSglueTaskStatusType status;

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
@interface AWSglueTaskRunFilterCriteria : AWSModel


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
@property (nonatomic, assign) AWSglueTaskStatusType status;

/**
 <p>The type of task run.</p>
 */
@property (nonatomic, assign) AWSglueTaskType taskRunType;

@end

/**
 <p>The configuration properties for the task run.</p>
 */
@interface AWSglueTaskRunProperties : AWSModel


/**
 <p>The configuration properties for an exporting labels task run.</p>
 */
@property (nonatomic, strong) AWSglueExportLabelsTaskRunProperties * _Nullable exportLabelsTaskRunProperties;

/**
 <p>The configuration properties for a find matches task run.</p>
 */
@property (nonatomic, strong) AWSglueFindMatchesTaskRunProperties * _Nullable findMatchesTaskRunProperties;

/**
 <p>The configuration properties for an importing labels task run.</p>
 */
@property (nonatomic, strong) AWSglueImportLabelsTaskRunProperties * _Nullable importLabelsTaskRunProperties;

/**
 <p>The configuration properties for a labeling set generation task run.</p>
 */
@property (nonatomic, strong) AWSglueLabelingSetGenerationTaskRunProperties * _Nullable labelingSetGenerationTaskRunProperties;

/**
 <p>The type of task run.</p>
 */
@property (nonatomic, assign) AWSglueTaskType taskType;

@end

/**
 <p>The sorting criteria that are used to sort the list of task runs for the machine learning transform.</p>
 Required parameters: [Column, SortDirection]
 */
@interface AWSglueTaskRunSortCriteria : AWSModel


/**
 <p>The column to be used to sort the list of task runs for the machine learning transform.</p>
 */
@property (nonatomic, assign) AWSglueTaskRunSortColumnType column;

/**
 <p>The sort direction to be used to sort the list of task runs for the machine learning transform.</p>
 */
@property (nonatomic, assign) AWSglueSortDirectionType sortDirection;

@end

/**
 <p>The criteria used to filter the machine learning transforms.</p>
 */
@interface AWSglueTransformFilterCriteria : AWSModel


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
@property (nonatomic, strong) NSArray<AWSglueSchemaColumn *> * _Nullable schema;

/**
 <p>Filters the list of machine learning transforms by the last known status of the transforms (to indicate whether a transform can be used or not). One of "NOT_READY", "READY", or "DELETING".</p>
 */
@property (nonatomic, assign) AWSglueTransformStatusType status;

/**
 <p>The type of machine learning transform that is used to filter the machine learning transforms.</p>
 */
@property (nonatomic, assign) AWSglueTransformType transformType;

@end

/**
 <p>The algorithm-specific parameters that are associated with the machine learning transform.</p>
 Required parameters: [TransformType]
 */
@interface AWSglueTransformParameters : AWSModel


/**
 <p>The parameters for the find matches algorithm.</p>
 */
@property (nonatomic, strong) AWSglueFindMatchesParameters * _Nullable findMatchesParameters;

/**
 <p>The type of machine learning transform.</p><p>For information about the types of machine learning transforms, see <a href="http://docs.aws.amazon.com/glue/latest/dg/add-job-machine-learning-transform.html">Creating Machine Learning Transforms</a>.</p>
 */
@property (nonatomic, assign) AWSglueTransformType transformType;

@end

/**
 <p>The sorting criteria that are associated with the machine learning transform.</p>
 Required parameters: [Column, SortDirection]
 */
@interface AWSglueTransformSortCriteria : AWSModel


/**
 <p>The column to be used in the sorting criteria that are associated with the machine learning transform.</p>
 */
@property (nonatomic, assign) AWSglueTransformSortColumnType column;

/**
 <p>The sort direction to be used in the sorting criteria that are associated with the machine learning transform.</p>
 */
@property (nonatomic, assign) AWSglueSortDirectionType sortDirection;

@end

/**
 <p>Information about a specific trigger.</p>
 */
@interface AWSglueTrigger : AWSModel


/**
 <p>The actions initiated by this trigger.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueAction *> * _Nullable actions;

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
@property (nonatomic, strong) AWSgluePredicate * _Nullable predicate;

/**
 <p>A <code>cron</code> expression used to specify the schedule (see <a href="https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based Schedules for Jobs and Crawlers</a>. For example, to run something every day at 12:15 UTC, you would specify: <code>cron(15 12 * * ? *)</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

/**
 <p>The current state of the trigger.</p>
 */
@property (nonatomic, assign) AWSglueTriggerState state;

/**
 <p>The type of trigger that this is.</p>
 */
@property (nonatomic, assign) AWSglueTriggerType types;

/**
 <p>The name of the workflow associated with the trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workflowName;

@end

/**
 <p>The details of a Trigger node present in the workflow.</p>
 */
@interface AWSglueTriggerNodeDetails : AWSModel


/**
 <p>The information of the trigger represented by the trigger node.</p>
 */
@property (nonatomic, strong) AWSglueTrigger * _Nullable trigger;

@end

/**
 <p>A structure used to provide information used to update a trigger. This object updates the previous trigger definition by overwriting it completely.</p>
 */
@interface AWSglueTriggerUpdate : AWSModel


/**
 <p>The actions initiated by this trigger.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueAction *> * _Nullable actions;

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
@property (nonatomic, strong) AWSgluePredicate * _Nullable predicate;

/**
 <p>A <code>cron</code> expression used to specify the schedule (see <a href="https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html">Time-Based Schedules for Jobs and Crawlers</a>. For example, to run something every day at 12:15 UTC, you would specify: <code>cron(15 12 * * ? *)</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

@end

/**
 
 */
@interface AWSglueUntagResourceRequest : AWSRequest


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
@interface AWSglueUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSglueUpdateClassifierRequest : AWSRequest


/**
 <p>A <code>CsvClassifier</code> object with updated fields.</p>
 */
@property (nonatomic, strong) AWSglueUpdateCsvClassifierRequest * _Nullable csvClassifier;

/**
 <p>A <code>GrokClassifier</code> object with updated fields.</p>
 */
@property (nonatomic, strong) AWSglueUpdateGrokClassifierRequest * _Nullable grokClassifier;

/**
 <p>A <code>JsonClassifier</code> object with updated fields.</p>
 */
@property (nonatomic, strong) AWSglueUpdateJsonClassifierRequest * _Nullable jsonClassifier;

/**
 <p>An <code>XMLClassifier</code> object with updated fields.</p>
 */
@property (nonatomic, strong) AWSglueUpdateXMLClassifierRequest * _Nullable XMLClassifier;

@end

/**
 
 */
@interface AWSglueUpdateClassifierResponse : AWSModel


@end

/**
 
 */
@interface AWSglueUpdateConnectionRequest : AWSRequest


/**
 <p>The ID of the Data Catalog in which the connection resides. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>A <code>ConnectionInput</code> object that redefines the connection in question.</p>
 */
@property (nonatomic, strong) AWSglueConnectionInput * _Nullable connectionInput;

/**
 <p>The name of the connection definition to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSglueUpdateConnectionResponse : AWSModel


@end

/**
 
 */
@interface AWSglueUpdateCrawlerRequest : AWSRequest


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
@property (nonatomic, strong) AWSglueSchemaChangePolicy * _Nullable schemaChangePolicy;

/**
 <p>The table prefix used for catalog tables that are created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tablePrefix;

/**
 <p>A list of targets to crawl.</p>
 */
@property (nonatomic, strong) AWSglueCrawlerTargets * _Nullable targets;

@end

/**
 
 */
@interface AWSglueUpdateCrawlerResponse : AWSModel


@end

/**
 
 */
@interface AWSglueUpdateCrawlerScheduleRequest : AWSRequest


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
@interface AWSglueUpdateCrawlerScheduleResponse : AWSModel


@end

/**
 <p>Specifies a custom CSV classifier to be updated.</p>
 Required parameters: [Name]
 */
@interface AWSglueUpdateCsvClassifierRequest : AWSModel


/**
 <p>Enables the processing of files that contain only one column.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowSingleColumn;

/**
 <p>Indicates whether the CSV file contains a header.</p>
 */
@property (nonatomic, assign) AWSglueCsvHeaderOption containsHeader;

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
@interface AWSglueUpdateDatabaseRequest : AWSRequest


/**
 <p>The ID of the Data Catalog in which the metadata database resides. If none is provided, the AWS account ID is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogId;

/**
 <p>A <code>DatabaseInput</code> object specifying the new definition of the metadata database in the catalog.</p>
 */
@property (nonatomic, strong) AWSglueDatabaseInput * _Nullable databaseInput;

/**
 <p>The name of the database to update in the catalog. For Hive compatibility, this is folded to lowercase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSglueUpdateDatabaseResponse : AWSModel


@end

/**
 
 */
@interface AWSglueUpdateDevEndpointRequest : AWSRequest


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
@property (nonatomic, strong) AWSglueDevEndpointCustomLibraries * _Nullable customLibraries;

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
@interface AWSglueUpdateDevEndpointResponse : AWSModel


@end

/**
 <p>Specifies a grok classifier to update when passed to <code>UpdateClassifier</code>.</p>
 Required parameters: [Name]
 */
@interface AWSglueUpdateGrokClassifierRequest : AWSModel


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
@interface AWSglueUpdateJobRequest : AWSRequest


/**
 <p>The name of the job definition to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>Specifies the values with which to update the job definition.</p>
 */
@property (nonatomic, strong) AWSglueJobUpdate * _Nullable jobUpdate;

@end

/**
 
 */
@interface AWSglueUpdateJobResponse : AWSModel


/**
 <p>Returns the name of the updated job definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

@end

/**
 <p>Specifies a JSON classifier to be updated.</p>
 Required parameters: [Name]
 */
@interface AWSglueUpdateJsonClassifierRequest : AWSModel


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
@interface AWSglueUpdateMLTransformRequest : AWSRequest


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
@property (nonatomic, strong) AWSglueTransformParameters * _Nullable parameters;

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
@property (nonatomic, assign) AWSglueWorkerType workerType;

@end

/**
 
 */
@interface AWSglueUpdateMLTransformResponse : AWSModel


/**
 <p>The unique identifier for the transform that was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformId;

@end

/**
 
 */
@interface AWSglueUpdatePartitionRequest : AWSRequest


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
@property (nonatomic, strong) AWSgluePartitionInput * _Nullable partitionInput;

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
@interface AWSglueUpdatePartitionResponse : AWSModel


@end

/**
 
 */
@interface AWSglueUpdateTableRequest : AWSRequest


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
@property (nonatomic, strong) AWSglueTableInput * _Nullable tableInput;

@end

/**
 
 */
@interface AWSglueUpdateTableResponse : AWSModel


@end

/**
 
 */
@interface AWSglueUpdateTriggerRequest : AWSRequest


/**
 <p>The name of the trigger to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The new values with which to update the trigger.</p>
 */
@property (nonatomic, strong) AWSglueTriggerUpdate * _Nullable triggerUpdate;

@end

/**
 
 */
@interface AWSglueUpdateTriggerResponse : AWSModel


/**
 <p>The resulting trigger definition.</p>
 */
@property (nonatomic, strong) AWSglueTrigger * _Nullable trigger;

@end

/**
 
 */
@interface AWSglueUpdateUserDefinedFunctionRequest : AWSRequest


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
@property (nonatomic, strong) AWSglueUserDefinedFunctionInput * _Nullable functionInput;

/**
 <p>The name of the function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

@end

/**
 
 */
@interface AWSglueUpdateUserDefinedFunctionResponse : AWSModel


@end

/**
 
 */
@interface AWSglueUpdateWorkflowRequest : AWSRequest


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
@interface AWSglueUpdateWorkflowResponse : AWSModel


/**
 <p>The name of the workflow which was specified in input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Specifies an XML classifier to be updated.</p>
 Required parameters: [Name]
 */
@interface AWSglueUpdateXMLClassifierRequest : AWSModel


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
@interface AWSglueUserDefinedFunction : AWSModel


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
@property (nonatomic, assign) AWSgluePrincipalType ownerType;

/**
 <p>The resource URIs for the function.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueResourceUri *> * _Nullable resourceUris;

@end

/**
 <p>A structure used to create or update a user-defined function.</p>
 */
@interface AWSglueUserDefinedFunctionInput : AWSModel


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
@property (nonatomic, assign) AWSgluePrincipalType ownerType;

/**
 <p>The resource URIs for the function.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueResourceUri *> * _Nullable resourceUris;

@end

/**
 <p>A workflow represents a flow in which AWS Glue components should be executed to complete a logical task.</p>
 */
@interface AWSglueWorkflow : AWSModel


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
@property (nonatomic, strong) AWSglueWorkflowGraph * _Nullable graph;

/**
 <p>The date and time when the workflow was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedOn;

/**
 <p>The information about the last execution of the workflow.</p>
 */
@property (nonatomic, strong) AWSglueWorkflowRun * _Nullable lastRun;

/**
 <p>The name of the workflow representing the flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>A workflow graph represents the complete workflow containing all the AWS Glue components present in the workflow and all the directed connections between them.</p>
 */
@interface AWSglueWorkflowGraph : AWSModel


/**
 <p>A list of all the directed connections between the nodes belonging to the workflow.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueEdge *> * _Nullable edges;

/**
 <p>A list of the the AWS Glue components belong to the workflow represented as nodes.</p>
 */
@property (nonatomic, strong) NSArray<AWSglueNode *> * _Nullable nodes;

@end

/**
 <p>A workflow run is an execution of a workflow providing all the runtime information.</p>
 */
@interface AWSglueWorkflowRun : AWSModel


/**
 <p>The date and time when the workflow run completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completedOn;

/**
 <p>The graph representing all the AWS Glue components that belong to the workflow as nodes and directed connections between them as edges.</p>
 */
@property (nonatomic, strong) AWSglueWorkflowGraph * _Nullable graph;

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
@property (nonatomic, strong) AWSglueWorkflowRunStatistics * _Nullable statistics;

/**
 <p>The status of the workflow run.</p>
 */
@property (nonatomic, assign) AWSglueWorkflowRunStatus status;

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
@interface AWSglueWorkflowRunStatistics : AWSModel


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
@interface AWSglueXMLClassifier : AWSModel


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
