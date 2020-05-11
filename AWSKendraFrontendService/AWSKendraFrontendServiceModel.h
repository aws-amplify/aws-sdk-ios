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

FOUNDATION_EXPORT NSString *const AWSKendraFrontendServiceErrorDomain;

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceErrorType) {
    AWSKendraFrontendServiceErrorUnknown,
    AWSKendraFrontendServiceErrorAccessDenied,
    AWSKendraFrontendServiceErrorConflict,
    AWSKendraFrontendServiceErrorInternalServer,
    AWSKendraFrontendServiceErrorResourceAlreadyExist,
    AWSKendraFrontendServiceErrorResourceInUse,
    AWSKendraFrontendServiceErrorResourceNotFound,
    AWSKendraFrontendServiceErrorResourceUnavailable,
    AWSKendraFrontendServiceErrorServiceQuotaExceeded,
    AWSKendraFrontendServiceErrorThrottling,
    AWSKendraFrontendServiceErrorValidation,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceAdditionalResultAttributeValueType) {
    AWSKendraFrontendServiceAdditionalResultAttributeValueTypeUnknown,
    AWSKendraFrontendServiceAdditionalResultAttributeValueTypeTextWithHighlightsValue,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceContentType) {
    AWSKendraFrontendServiceContentTypeUnknown,
    AWSKendraFrontendServiceContentTypePdf,
    AWSKendraFrontendServiceContentTypeHtml,
    AWSKendraFrontendServiceContentTypeMsWord,
    AWSKendraFrontendServiceContentTypePlainText,
    AWSKendraFrontendServiceContentTypePpt,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceDataSourceStatus) {
    AWSKendraFrontendServiceDataSourceStatusUnknown,
    AWSKendraFrontendServiceDataSourceStatusCreating,
    AWSKendraFrontendServiceDataSourceStatusDeleting,
    AWSKendraFrontendServiceDataSourceStatusFailed,
    AWSKendraFrontendServiceDataSourceStatusUpdating,
    AWSKendraFrontendServiceDataSourceStatusActive,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceDataSourceSyncJobStatus) {
    AWSKendraFrontendServiceDataSourceSyncJobStatusUnknown,
    AWSKendraFrontendServiceDataSourceSyncJobStatusFailed,
    AWSKendraFrontendServiceDataSourceSyncJobStatusSucceeded,
    AWSKendraFrontendServiceDataSourceSyncJobStatusSyncing,
    AWSKendraFrontendServiceDataSourceSyncJobStatusIncomplete,
    AWSKendraFrontendServiceDataSourceSyncJobStatusStopping,
    AWSKendraFrontendServiceDataSourceSyncJobStatusAborted,
    AWSKendraFrontendServiceDataSourceSyncJobStatusSyncingIndexing,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceDataSourceType) {
    AWSKendraFrontendServiceDataSourceTypeUnknown,
    AWSKendraFrontendServiceDataSourceTypeS3,
    AWSKendraFrontendServiceDataSourceTypeSharepoint,
    AWSKendraFrontendServiceDataSourceTypeDatabase,
    AWSKendraFrontendServiceDataSourceTypeSalesforce,
    AWSKendraFrontendServiceDataSourceTypeOnedrive,
    AWSKendraFrontendServiceDataSourceTypeServicenow,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceDatabaseEngineType) {
    AWSKendraFrontendServiceDatabaseEngineTypeUnknown,
    AWSKendraFrontendServiceDatabaseEngineTypeRdsAuroraMysql,
    AWSKendraFrontendServiceDatabaseEngineTypeRdsAuroraPostgresql,
    AWSKendraFrontendServiceDatabaseEngineTypeRdsMysql,
    AWSKendraFrontendServiceDatabaseEngineTypeRdsPostgresql,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceDocumentAttributeValueType) {
    AWSKendraFrontendServiceDocumentAttributeValueTypeUnknown,
    AWSKendraFrontendServiceDocumentAttributeValueTypeStringValue,
    AWSKendraFrontendServiceDocumentAttributeValueTypeStringListValue,
    AWSKendraFrontendServiceDocumentAttributeValueTypeLongValue,
    AWSKendraFrontendServiceDocumentAttributeValueTypeDateValue,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceErrorCode) {
    AWSKendraFrontendServiceErrorCodeUnknown,
    AWSKendraFrontendServiceErrorCodeInternalError,
    AWSKendraFrontendServiceErrorCodeInvalidRequest,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceFaqStatus) {
    AWSKendraFrontendServiceFaqStatusUnknown,
    AWSKendraFrontendServiceFaqStatusCreating,
    AWSKendraFrontendServiceFaqStatusUpdating,
    AWSKendraFrontendServiceFaqStatusActive,
    AWSKendraFrontendServiceFaqStatusDeleting,
    AWSKendraFrontendServiceFaqStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceIndexEdition) {
    AWSKendraFrontendServiceIndexEditionUnknown,
    AWSKendraFrontendServiceIndexEditionDeveloperEdition,
    AWSKendraFrontendServiceIndexEditionEnterpriseEdition,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceIndexStatus) {
    AWSKendraFrontendServiceIndexStatusUnknown,
    AWSKendraFrontendServiceIndexStatusCreating,
    AWSKendraFrontendServiceIndexStatusActive,
    AWSKendraFrontendServiceIndexStatusDeleting,
    AWSKendraFrontendServiceIndexStatusFailed,
    AWSKendraFrontendServiceIndexStatusUpdating,
    AWSKendraFrontendServiceIndexStatusSystemUpdating,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceOrder) {
    AWSKendraFrontendServiceOrderUnknown,
    AWSKendraFrontendServiceOrderAscending,
    AWSKendraFrontendServiceOrderDescending,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServicePrincipalType) {
    AWSKendraFrontendServicePrincipalTypeUnknown,
    AWSKendraFrontendServicePrincipalTypeUser,
    AWSKendraFrontendServicePrincipalTypeGroup,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceQueryResultType) {
    AWSKendraFrontendServiceQueryResultTypeUnknown,
    AWSKendraFrontendServiceQueryResultTypeDocument,
    AWSKendraFrontendServiceQueryResultTypeQuestionAnswer,
    AWSKendraFrontendServiceQueryResultTypeAnswer,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceReadAccessType) {
    AWSKendraFrontendServiceReadAccessTypeUnknown,
    AWSKendraFrontendServiceReadAccessTypeAllow,
    AWSKendraFrontendServiceReadAccessTypeDeny,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceRelevanceType) {
    AWSKendraFrontendServiceRelevanceTypeUnknown,
    AWSKendraFrontendServiceRelevanceTypeRelevant,
    AWSKendraFrontendServiceRelevanceTypeNotRelevant,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceSalesforceChatterFeedIncludeFilterType) {
    AWSKendraFrontendServiceSalesforceChatterFeedIncludeFilterTypeUnknown,
    AWSKendraFrontendServiceSalesforceChatterFeedIncludeFilterTypeActiveUser,
    AWSKendraFrontendServiceSalesforceChatterFeedIncludeFilterTypeStandardUser,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceSalesforceKnowledgeArticleState) {
    AWSKendraFrontendServiceSalesforceKnowledgeArticleStateUnknown,
    AWSKendraFrontendServiceSalesforceKnowledgeArticleStateDraft,
    AWSKendraFrontendServiceSalesforceKnowledgeArticleStatePublished,
    AWSKendraFrontendServiceSalesforceKnowledgeArticleStateArchived,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceSalesforceStandardObjectName) {
    AWSKendraFrontendServiceSalesforceStandardObjectNameUnknown,
    AWSKendraFrontendServiceSalesforceStandardObjectNameAccount,
    AWSKendraFrontendServiceSalesforceStandardObjectNameCampaign,
    AWSKendraFrontendServiceSalesforceStandardObjectNameCase,
    AWSKendraFrontendServiceSalesforceStandardObjectNameContact,
    AWSKendraFrontendServiceSalesforceStandardObjectNameContract,
    AWSKendraFrontendServiceSalesforceStandardObjectNameDocument,
    AWSKendraFrontendServiceSalesforceStandardObjectNameGroup,
    AWSKendraFrontendServiceSalesforceStandardObjectNameIdea,
    AWSKendraFrontendServiceSalesforceStandardObjectNameLead,
    AWSKendraFrontendServiceSalesforceStandardObjectNameOpportunity,
    AWSKendraFrontendServiceSalesforceStandardObjectNamePartner,
    AWSKendraFrontendServiceSalesforceStandardObjectNamePricebook,
    AWSKendraFrontendServiceSalesforceStandardObjectNameProduct,
    AWSKendraFrontendServiceSalesforceStandardObjectNameProfile,
    AWSKendraFrontendServiceSalesforceStandardObjectNameSolution,
    AWSKendraFrontendServiceSalesforceStandardObjectNameTask,
    AWSKendraFrontendServiceSalesforceStandardObjectNameUser,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceServiceNowBuildVersionType) {
    AWSKendraFrontendServiceServiceNowBuildVersionTypeUnknown,
    AWSKendraFrontendServiceServiceNowBuildVersionTypeLondon,
    AWSKendraFrontendServiceServiceNowBuildVersionTypeOthers,
};

typedef NS_ENUM(NSInteger, AWSKendraFrontendServiceSharePointVersion) {
    AWSKendraFrontendServiceSharePointVersionUnknown,
    AWSKendraFrontendServiceSharePointVersionSharepointOnline,
};

@class AWSKendraFrontendServiceAccessControlListConfiguration;
@class AWSKendraFrontendServiceAclConfiguration;
@class AWSKendraFrontendServiceAdditionalResultAttribute;
@class AWSKendraFrontendServiceAdditionalResultAttributeValue;
@class AWSKendraFrontendServiceAttributeFilter;
@class AWSKendraFrontendServiceBatchDeleteDocumentRequest;
@class AWSKendraFrontendServiceBatchDeleteDocumentResponse;
@class AWSKendraFrontendServiceBatchDeleteDocumentResponseFailedDocument;
@class AWSKendraFrontendServiceBatchPutDocumentRequest;
@class AWSKendraFrontendServiceBatchPutDocumentResponse;
@class AWSKendraFrontendServiceBatchPutDocumentResponseFailedDocument;
@class AWSKendraFrontendServiceCapacityUnitsConfiguration;
@class AWSKendraFrontendServiceClickFeedback;
@class AWSKendraFrontendServiceColumnConfiguration;
@class AWSKendraFrontendServiceConnectionConfiguration;
@class AWSKendraFrontendServiceCreateDataSourceRequest;
@class AWSKendraFrontendServiceCreateDataSourceResponse;
@class AWSKendraFrontendServiceCreateFaqRequest;
@class AWSKendraFrontendServiceCreateFaqResponse;
@class AWSKendraFrontendServiceCreateIndexRequest;
@class AWSKendraFrontendServiceCreateIndexResponse;
@class AWSKendraFrontendServiceDataSourceConfiguration;
@class AWSKendraFrontendServiceDataSourceSummary;
@class AWSKendraFrontendServiceDataSourceSyncJob;
@class AWSKendraFrontendServiceDataSourceSyncJobMetricTarget;
@class AWSKendraFrontendServiceDataSourceSyncJobMetrics;
@class AWSKendraFrontendServiceDataSourceToIndexFieldMapping;
@class AWSKendraFrontendServiceDataSourceVpcConfiguration;
@class AWSKendraFrontendServiceDatabaseConfiguration;
@class AWSKendraFrontendServiceDeleteDataSourceRequest;
@class AWSKendraFrontendServiceDeleteFaqRequest;
@class AWSKendraFrontendServiceDeleteIndexRequest;
@class AWSKendraFrontendServiceDescribeDataSourceRequest;
@class AWSKendraFrontendServiceDescribeDataSourceResponse;
@class AWSKendraFrontendServiceDescribeFaqRequest;
@class AWSKendraFrontendServiceDescribeFaqResponse;
@class AWSKendraFrontendServiceDescribeIndexRequest;
@class AWSKendraFrontendServiceDescribeIndexResponse;
@class AWSKendraFrontendServiceDocument;
@class AWSKendraFrontendServiceDocumentAttribute;
@class AWSKendraFrontendServiceDocumentAttributeValue;
@class AWSKendraFrontendServiceDocumentAttributeValueCountPair;
@class AWSKendraFrontendServiceDocumentMetadataConfiguration;
@class AWSKendraFrontendServiceDocumentsMetadataConfiguration;
@class AWSKendraFrontendServiceFacet;
@class AWSKendraFrontendServiceFacetResult;
@class AWSKendraFrontendServiceFaqStatistics;
@class AWSKendraFrontendServiceFaqSummary;
@class AWSKendraFrontendServiceHighlight;
@class AWSKendraFrontendServiceIndexConfigurationSummary;
@class AWSKendraFrontendServiceIndexStatistics;
@class AWSKendraFrontendServiceListDataSourceSyncJobsRequest;
@class AWSKendraFrontendServiceListDataSourceSyncJobsResponse;
@class AWSKendraFrontendServiceListDataSourcesRequest;
@class AWSKendraFrontendServiceListDataSourcesResponse;
@class AWSKendraFrontendServiceListFaqsRequest;
@class AWSKendraFrontendServiceListFaqsResponse;
@class AWSKendraFrontendServiceListIndicesRequest;
@class AWSKendraFrontendServiceListIndicesResponse;
@class AWSKendraFrontendServiceListTagsForResourceRequest;
@class AWSKendraFrontendServiceListTagsForResourceResponse;
@class AWSKendraFrontendServiceOneDriveConfiguration;
@class AWSKendraFrontendServiceOneDriveUsers;
@class AWSKendraFrontendServicePrincipal;
@class AWSKendraFrontendServiceQueryRequest;
@class AWSKendraFrontendServiceQueryResult;
@class AWSKendraFrontendServiceQueryResultItem;
@class AWSKendraFrontendServiceRelevance;
@class AWSKendraFrontendServiceRelevanceFeedback;
@class AWSKendraFrontendServiceS3DataSourceConfiguration;
@class AWSKendraFrontendServiceS3Path;
@class AWSKendraFrontendServiceSalesforceChatterFeedConfiguration;
@class AWSKendraFrontendServiceSalesforceConfiguration;
@class AWSKendraFrontendServiceSalesforceCustomKnowledgeArticleTypeConfiguration;
@class AWSKendraFrontendServiceSalesforceKnowledgeArticleConfiguration;
@class AWSKendraFrontendServiceSalesforceStandardKnowledgeArticleTypeConfiguration;
@class AWSKendraFrontendServiceSalesforceStandardObjectAttachmentConfiguration;
@class AWSKendraFrontendServiceSalesforceStandardObjectConfiguration;
@class AWSKendraFrontendServiceSearch;
@class AWSKendraFrontendServiceServerSideEncryptionConfiguration;
@class AWSKendraFrontendServiceServiceNowConfiguration;
@class AWSKendraFrontendServiceServiceNowKnowledgeArticleConfiguration;
@class AWSKendraFrontendServiceServiceNowServiceCatalogConfiguration;
@class AWSKendraFrontendServiceSharePointConfiguration;
@class AWSKendraFrontendServiceStartDataSourceSyncJobRequest;
@class AWSKendraFrontendServiceStartDataSourceSyncJobResponse;
@class AWSKendraFrontendServiceStopDataSourceSyncJobRequest;
@class AWSKendraFrontendServiceSubmitFeedbackRequest;
@class AWSKendraFrontendServiceTag;
@class AWSKendraFrontendServiceTagResourceRequest;
@class AWSKendraFrontendServiceTagResourceResponse;
@class AWSKendraFrontendServiceTextDocumentStatistics;
@class AWSKendraFrontendServiceTextWithHighlights;
@class AWSKendraFrontendServiceTimeRange;
@class AWSKendraFrontendServiceUntagResourceRequest;
@class AWSKendraFrontendServiceUntagResourceResponse;
@class AWSKendraFrontendServiceUpdateDataSourceRequest;
@class AWSKendraFrontendServiceUpdateIndexRequest;

/**
 <p>Access Control List files for the documents in a data source.</p>
 */
@interface AWSKendraFrontendServiceAccessControlListConfiguration : AWSModel


/**
 <p>Path to the AWS S3 bucket that contains the ACL files.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyPath;

@end

/**
 <p>Provides information about the column that should be used for filtering the query response by groups.</p>
 Required parameters: [AllowedGroupsColumnName]
 */
@interface AWSKendraFrontendServiceAclConfiguration : AWSModel


/**
 <p>A list of groups, separated by semi-colons, that filters a query response based on user context. The document is only returned to users that are in one of the groups specified in the <code>UserContext</code> field of the <a>Query</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable allowedGroupsColumnName;

@end

/**
 <p>An attribute returned from an index query.</p>
 Required parameters: [Key, ValueType, Value]
 */
@interface AWSKendraFrontendServiceAdditionalResultAttribute : AWSModel


/**
 <p>The key that identifies the attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>An object that contains the attribute value.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceAdditionalResultAttributeValue * _Nullable value;

/**
 <p>The data type of the <code>Value</code> property.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceAdditionalResultAttributeValueType valueType;

@end

/**
 <p>An attribute returned with a document from a search.</p>
 */
@interface AWSKendraFrontendServiceAdditionalResultAttributeValue : AWSModel


/**
 <p>The text associated with the attribute and information about the highlight to apply to the text.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceTextWithHighlights * _Nullable textWithHighlightsValue;

@end

/**
 <p>Provides filtering the query results based on document attributes.</p><p>When you use the <code>AndAllFilters</code> or <code>OrAllFilters</code>, filters you can use 2 layers under the first attribute filter. For example, you can use:</p><p><code>&lt;AndAllFilters&gt;</code></p><ol><li><p><code> &lt;OrAllFilters&gt;</code></p></li><li><p><code> &lt;EqualTo&gt;</code></p></li></ol><p>If you use more than 2 layers, you receive a <code>ValidationException</code> exception with the message "<code>AttributeFilter</code> cannot have a depth of more than 2."</p>
 */
@interface AWSKendraFrontendServiceAttributeFilter : AWSModel


/**
 <p>Performs a logical <code>AND</code> operation on all supplied filters.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceAttributeFilter *> * _Nullable andAllFilters;

/**
 <p>Returns true when a document contains all of the specified document attributes. This filter is only appicable to <code>StringListValue</code> metadata.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceDocumentAttribute * _Nullable containsAll;

/**
 <p>Returns true when a document contains any of the specified document attributes.This filter is only appicable to <code>StringListValue</code> metadata.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceDocumentAttribute * _Nullable containsAny;

/**
 <p>Performs an equals operation on two document attributes.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceDocumentAttribute * _Nullable equalsTo;

/**
 <p>Performs a greater than operation on two document attributes. Use with a document attribute of type <code>Integer</code> or <code>Long</code>.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceDocumentAttribute * _Nullable greaterThan;

/**
 <p>Performs a greater or equals than operation on two document attributes. Use with a document attribute of type <code>Integer</code> or <code>Long</code>.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceDocumentAttribute * _Nullable greaterThanOrEquals;

/**
 <p>Performs a less than operation on two document attributes. Use with a document attribute of type <code>Integer</code> or <code>Long</code>.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceDocumentAttribute * _Nullable lessThan;

/**
 <p>Performs a less than or equals operation on two document attributes. Use with a document attribute of type <code>Integer</code> or <code>Long</code>.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceDocumentAttribute * _Nullable lessThanOrEquals;

/**
 <p>Performs a logical <code>NOT</code> operation on all supplied filters.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceAttributeFilter * _Nullable notFilter;

/**
 <p>Performs a logical <code>OR</code> operation on all supplied filters.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceAttributeFilter *> * _Nullable orAllFilters;

@end

/**
 
 */
@interface AWSKendraFrontendServiceBatchDeleteDocumentRequest : AWSRequest


/**
 <p>Maps a particular data source sync job to a particular data source.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceDataSourceSyncJobMetricTarget * _Nullable dataSourceSyncJobMetricTarget;

/**
 <p>One or more identifiers for documents to delete from the index.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable documentIdList;

/**
 <p>The identifier of the index that contains the documents to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexId;

@end

/**
 
 */
@interface AWSKendraFrontendServiceBatchDeleteDocumentResponse : AWSModel


/**
 <p>A list of documents that could not be removed from the index. Each entry contains an error message that indicates why the document couldn't be removed from the index.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceBatchDeleteDocumentResponseFailedDocument *> * _Nullable failedDocuments;

@end

/**
 <p>Provides information about documents that could not be removed from an index by the <a>BatchDeleteDocument</a> operation.</p>
 */
@interface AWSKendraFrontendServiceBatchDeleteDocumentResponseFailedDocument : AWSModel


/**
 <p>The error code for why the document couldn't be removed from the index.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceErrorCode errorCode;

/**
 <p>An explanation for why the document couldn't be removed from the index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The identifier of the document that couldn't be removed from the index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSKendraFrontendServiceBatchPutDocumentRequest : AWSRequest


/**
 <p>One or more documents to add to the index. </p><p>Documents have the following file size limits.</p><ul><li><p>5 MB total size for inline documents</p></li><li><p>50 MB total size for files from an S3 bucket</p></li><li><p>5 MB extracted text for any file</p></li></ul><p>For more information about file size and transaction per second quotas, see <a href="https://docs.aws.amazon.com/kendra/latest/dg/quotas.html">Quotas</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceDocument *> * _Nullable documents;

/**
 <p>The identifier of the index to add the documents to. You need to create the index first using the <a>CreateIndex</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexId;

/**
 <p>The Amazon Resource Name (ARN) of a role that is allowed to run the <code>BatchPutDocument</code> operation. For more information, see <a href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html">IAM Roles for Amazon Kendra</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSKendraFrontendServiceBatchPutDocumentResponse : AWSModel


/**
 <p>A list of documents that were not added to the index because the document failed a validation check. Each document contains an error message that indicates why the document couldn't be added to the index.</p><p>If there was an error adding a document to an index the error is reported in your AWS CloudWatch log. For more information, see <a href="https://docs.aws.amazon.com/kendra/latest/dg/cloudwatch-logs.html">Monitoring Amazon Kendra with Amazon CloudWatch Logs</a></p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceBatchPutDocumentResponseFailedDocument *> * _Nullable failedDocuments;

@end

/**
 <p>Provides information about a document that could not be indexed.</p>
 */
@interface AWSKendraFrontendServiceBatchPutDocumentResponseFailedDocument : AWSModel


/**
 <p>The type of error that caused the document to fail to be indexed.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceErrorCode errorCode;

/**
 <p>A description of the reason why the document could not be indexed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The unique identifier of the document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Specifies capacity units configured for your index. You can add and remove capacity units to tune an index to your requirements.</p>
 Required parameters: [StorageCapacityUnits, QueryCapacityUnits]
 */
@interface AWSKendraFrontendServiceCapacityUnitsConfiguration : AWSModel


/**
 <p>The amount of extra query capacity for an index. Each capacity unit provides 0.5 queries per second and 40,000 queries per day.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable queryCapacityUnits;

/**
 <p>The amount of extra storage capacity for an index. Each capacity unit provides 150 Gb of storage space or 500,000 documents, whichever is reached first.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable storageCapacityUnits;

@end

/**
 <p>Gathers information about when a particular result was clicked by a user. Your application uses the <a>SubmitFeedback</a> operation to provide click information.</p>
 Required parameters: [ResultId, ClickTime]
 */
@interface AWSKendraFrontendServiceClickFeedback : AWSModel


/**
 <p>The Unix timestamp of the date and time that the result was clicked.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable clickTime;

/**
 <p>The unique identifier of the search result that was clicked.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resultId;

@end

/**
 <p>Provides information about how Amazon Kendra should use the columns of a database in an index.</p>
 Required parameters: [DocumentIdColumnName, DocumentDataColumnName, ChangeDetectingColumns]
 */
@interface AWSKendraFrontendServiceColumnConfiguration : AWSModel


/**
 <p>One to five columns that indicate when a document in the database has changed.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable changeDetectingColumns;

/**
 <p>The column that contains the contents of the document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentDataColumnName;

/**
 <p>The column that provides the document's unique identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentIdColumnName;

/**
 <p>The column that contains the title of the document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentTitleColumnName;

/**
 <p>An array of objects that map database column names to the corresponding fields in an index. You must first create the fields in the index using the <a>UpdateIndex</a> operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceDataSourceToIndexFieldMapping *> * _Nullable fieldMappings;

@end

/**
 <p>Provides the information necessary to connect to a database.</p>
 Required parameters: [DatabaseHost, DatabasePort, DatabaseName, TableName, SecretArn]
 */
@interface AWSKendraFrontendServiceConnectionConfiguration : AWSModel


/**
 <p>The name of the host for the database. Can be either a string (host.subdomain.domain.tld) or an IPv4 or IPv6 address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseHost;

/**
 <p>The name of the database containing the document data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The port that the database uses for connections.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable databasePort;

/**
 <p>The Amazon Resource Name (ARN) of credentials stored in AWS Secrets Manager. The credentials should be a user/password pair. For more information, see <a href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-database.html">Using a Database Data Source</a>. For more information about AWS Secrets Manager, see <a href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html"> What Is AWS Secrets Manager </a> in the <i>AWS Secrets Manager</i> user guide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretArn;

/**
 <p>The name of the table that contains the document data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSKendraFrontendServiceCreateDataSourceRequest : AWSRequest


/**
 <p>The connector configuration information that is required to access the repository.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceDataSourceConfiguration * _Nullable configuration;

/**
 <p>A description for the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the index that should be associated with this data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexId;

/**
 <p>A unique name for the data source. A data source name can't be changed without deleting and recreating the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Resource Name (ARN) of a role with permission to access the data source. For more information, see <a href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html">IAM Roles for Amazon Kendra</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Sets the frequency that Amazon Kendra will check the documents in your repository and update the index. If you don't set a schedule Amazon Kendra will not periodically update the index. You can call the <code>StartDataSourceSyncJob</code> operation to update the index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

/**
 <p>A list of key-value pairs that identify the data source. You can use the tags to identify and organize your resources and to control access to resources.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceTag *> * _Nullable tags;

/**
 <p>The type of repository that contains the data source.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceDataSourceType types;

@end

/**
 
 */
@interface AWSKendraFrontendServiceCreateDataSourceResponse : AWSModel


/**
 <p>A unique identifier for the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSKendraFrontendServiceCreateFaqRequest : AWSRequest


/**
 <p>A description of the FAQ.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the index that contains the FAQ.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexId;

/**
 <p>The name that should be associated with the FAQ.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Resource Name (ARN) of a role with permission to access the S3 bucket that contains the FAQs. For more information, see <a href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html">IAM Roles for Amazon Kendra</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The S3 location of the FAQ input data.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceS3Path * _Nullable s3Path;

/**
 <p>A list of key-value pairs that identify the FAQ. You can use the tags to identify and organize your resources and to control access to resources.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSKendraFrontendServiceCreateFaqResponse : AWSModel


/**
 <p>The unique identifier of the FAQ.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSKendraFrontendServiceCreateIndexRequest : AWSRequest


/**
 <p>A token that you provide to identify the request to create an index. Multiple calls to the <code>CreateIndex</code> operation with the same client token will create only one index.”</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>A description for the index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The Amazon Kendra edition to use for the index. Choose <code>DEVELOPER_EDITION</code> for indexes intended for development, testing, or proof of concept. Use <code>ENTERPRISE_EDITION</code> for your production databases. Once you set the edition for an index, it can't be changed. </p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceIndexEdition edition;

/**
 <p>The name for the new index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>An IAM role that gives Amazon Kendra permissions to access your Amazon CloudWatch logs and metrics. This is also the role used when you use the <code>BatchPutDocument</code> operation to index documents from an Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The identifier of the AWS KMS customer managed key (CMK) to use to encrypt data indexed by Amazon Kendra. Amazon Kendra doesn't support asymmetric CMKs.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceServerSideEncryptionConfiguration * _Nullable serverSideEncryptionConfiguration;

/**
 <p>A list of key-value pairs that identify the index. You can use the tags to identify and organize your resources and to control access to resources.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSKendraFrontendServiceCreateIndexResponse : AWSModel


/**
 <p>The unique identifier of the index. Use this identifier when you query an index, set up a data source, or index a document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Configuration information for a Amazon Kendra data source.</p>
 */
@interface AWSKendraFrontendServiceDataSourceConfiguration : AWSModel


/**
 <p>Provides information necessary to create a connector for a database.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceDatabaseConfiguration * _Nullable databaseConfiguration;

/**
 <p>Provided configuration for data sources that connect to Microsoft OneDrive.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceOneDriveConfiguration * _Nullable oneDriveConfiguration;

/**
 <p>Provides information to create a connector for a document repository in an Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceS3DataSourceConfiguration * _Nullable s3Configuration;

/**
 <p>Provides configuration information for data sources that connect to a Salesforce site.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceSalesforceConfiguration * _Nullable salesforceConfiguration;

/**
 <p>Provides configuration for data sources that connect to ServiceNow instances.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceServiceNowConfiguration * _Nullable serviceNowConfiguration;

/**
 <p>Provides information necessary to create a connector for a Microsoft SharePoint site.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceSharePointConfiguration * _Nullable sharePointConfiguration;

@end

/**
 <p>Summary information for a Amazon Kendra data source. Returned in a call to .</p>
 */
@interface AWSKendraFrontendServiceDataSourceSummary : AWSModel


/**
 <p>The UNIX datetime that the data source was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The unique identifier for the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the data source. When the status is <code>ATIVE</code> the data source is ready to use.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceDataSourceStatus status;

/**
 <p>The type of the data source.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceDataSourceType types;

/**
 <p>The UNIX datetime that the data source was lasted updated. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 <p>Provides information about a synchronization job.</p>
 */
@interface AWSKendraFrontendServiceDataSourceSyncJob : AWSModel


/**
 <p>If the reason that the synchronization failed is due to an error with the underlying data source, this field contains a code that identifies the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceErrorCode;

/**
 <p>The UNIX datetime that the synchronization job was completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>If the <code>Status</code> field is set to <code>FAILED</code>, the <code>ErrorCode</code> field contains a the reason that the synchronization failed.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceErrorCode errorCode;

/**
 <p>If the <code>Status</code> field is set to <code>ERROR</code>, the <code>ErrorMessage</code> field contains a description of the error that caused the synchronization to fail.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>A unique identifier for the synchronization job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionId;

/**
 <p>Maps a batch delete document request to a specific data source sync job. This is optional and should only be supplied when documents are deleted by a connector.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceDataSourceSyncJobMetrics * _Nullable metrics;

/**
 <p>The UNIX datetime that the synchronization job was started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The execution status of the synchronization job. When the <code>Status</code> field is set to <code>SUCCEEDED</code>, the synchronization job is done. If the status code is set to <code>FAILED</code>, the <code>ErrorCode</code> and <code>ErrorMessage</code> fields give you the reason for the failure.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceDataSourceSyncJobStatus status;

@end

/**
 <p>Maps a particular data source sync job to a particular data source.</p>
 Required parameters: [DataSourceId, DataSourceSyncJobId]
 */
@interface AWSKendraFrontendServiceDataSourceSyncJobMetricTarget : AWSModel


/**
 <p>The ID of the data source that is running the sync job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

/**
 <p>The ID of the sync job that is running on the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceSyncJobId;

@end

/**
 <p>Maps a batch delete document request to a specific data source sync job. This is optional and should only be supplied when documents are deleted by a connector.</p>
 */
@interface AWSKendraFrontendServiceDataSourceSyncJobMetrics : AWSModel


/**
 <p>The number of documents added from the data source up to now in the data source sync.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentsAdded;

/**
 <p>The number of documents deleted from the data source up to now in the data source sync run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentsDeleted;

/**
 <p>The number of documents that failed to sync from the data source up to now in the data source sync run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentsFailed;

/**
 <p>The number of documents modified in the data source up to now in the data source sync run.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentsModified;

/**
 <p>The current number of documents crawled by the current sync job in the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentsScanned;

@end

/**
 <p>Maps a column or attribute in the data source to an index field. You must first create the fields in the index using the <a>UpdateIndex</a> operation.</p>
 Required parameters: [DataSourceFieldName, IndexFieldName]
 */
@interface AWSKendraFrontendServiceDataSourceToIndexFieldMapping : AWSModel


/**
 <p>The name of the column or attribute in the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceFieldName;

/**
 <p>The type of data stored in the column or attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dateFieldFormat;

/**
 <p>The name of the field in the index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexFieldName;

@end

/**
 <p>Provides information for connecting to an Amazon VPC.</p>
 Required parameters: [SubnetIds, SecurityGroupIds]
 */
@interface AWSKendraFrontendServiceDataSourceVpcConfiguration : AWSModel


/**
 <p>A list of identifiers of security groups within your Amazon VPC. The security groups should enable Amazon Kendra to connect to the data source.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>A list of identifiers for subnets within your Amazon VPC. The subnets should be able to connect to each other in the VPC, and they should have outgoing access to the Internet through a NAT device.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

@end

/**
 <p>Provides the information necessary to connect a database to an index. </p>
 Required parameters: [DatabaseEngineType, ConnectionConfiguration, ColumnConfiguration]
 */
@interface AWSKendraFrontendServiceDatabaseConfiguration : AWSModel


/**
 <p>Information about the database column that provides information for user context filtering.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceAclConfiguration * _Nullable aclConfiguration;

/**
 <p>Information about where the index should get the document information from the database.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceColumnConfiguration * _Nullable columnConfiguration;

/**
 <p>The information necessary to connect to a database.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceConnectionConfiguration * _Nullable connectionConfiguration;

/**
 <p>The type of database engine that runs the database.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceDatabaseEngineType databaseEngineType;

/**
 <p>Provides information for connecting to an Amazon VPC.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceDataSourceVpcConfiguration * _Nullable vpcConfiguration;

@end

/**
 
 */
@interface AWSKendraFrontendServiceDeleteDataSourceRequest : AWSRequest


/**
 <p>The unique identifier of the data source to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The unique identifier of the index associated with the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexId;

@end

/**
 
 */
@interface AWSKendraFrontendServiceDeleteFaqRequest : AWSRequest


/**
 <p>The identifier of the FAQ to remove.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The index to remove the FAQ from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexId;

@end

/**
 
 */
@interface AWSKendraFrontendServiceDeleteIndexRequest : AWSRequest


/**
 <p>The identifier of the index to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSKendraFrontendServiceDescribeDataSourceRequest : AWSRequest


/**
 <p>The unique identifier of the data source to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The identifier of the index that contains the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexId;

@end

/**
 
 */
@interface AWSKendraFrontendServiceDescribeDataSourceResponse : AWSModel


/**
 <p>Information that describes where the data source is located and how the data source is configured. The specific information in the description depends on the data source provider.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceDataSourceConfiguration * _Nullable configuration;

/**
 <p>The Unix timestamp of when the data source was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The description of the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>When the <code>Status</code> field value is <code>FAILED</code>, the <code>ErrorMessage</code> field contains a description of the error that caused the data source to fail.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The identifier of the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The identifier of the index that contains the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexId;

/**
 <p>The name that you gave the data source when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Resource Name (ARN) of the role that enables the data source to access its resources.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The schedule that Amazon Kendra will update the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

/**
 <p>The current status of the data source. When the status is <code>ACTIVE</code> the data source is ready to use. When the status is <code>FAILED</code>, the <code>ErrorMessage</code> field contains the reason that the data source failed.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceDataSourceStatus status;

/**
 <p>The type of the data source.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceDataSourceType types;

/**
 <p>The Unix timestamp of when the data source was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 
 */
@interface AWSKendraFrontendServiceDescribeFaqRequest : AWSRequest


/**
 <p>The unique identifier of the FAQ.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The identifier of the index that contains the FAQ.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexId;

@end

/**
 
 */
@interface AWSKendraFrontendServiceDescribeFaqResponse : AWSModel


/**
 <p>The date and time that the FAQ was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The description of the FAQ that you provided when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>If the <code>Status</code> field is <code>FAILED</code>, the <code>ErrorMessage</code> field contains the reason why the FAQ failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The identifier of the FAQ.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The identifier of the index that contains the FAQ.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexId;

/**
 <p>The name that you gave the FAQ when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Resource Name (ARN) of the role that provides access to the S3 bucket containing the input files for the FAQ.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Information required to find a specific file in an Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceS3Path * _Nullable s3Path;

/**
 <p>The status of the FAQ. It is ready to use when the status is <code>ACTIVE</code>.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceFaqStatus status;

/**
 <p>The date and time that the FAQ was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 
 */
@interface AWSKendraFrontendServiceDescribeIndexRequest : AWSRequest


/**
 <p>The name of the index to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSKendraFrontendServiceDescribeIndexResponse : AWSModel


/**
 <p>For enterprise edtion indexes, you can choose to use additional capacity to meet the needs of your application. This contains the capacity units used for the index. A 0 for the query capacity or the storage capacity indicates that the index is using the default capacity for the index.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceCapacityUnitsConfiguration * _Nullable capacityUnits;

/**
 <p>The Unix datetime that the index was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The description of the index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Configuration settings for any metadata applied to the documents in the index.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceDocumentMetadataConfiguration *> * _Nullable documentMetadataConfigurations;

/**
 <p>The Amazon Kendra edition used for the index. You decide the edition when you create the index.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceIndexEdition edition;

/**
 <p>When th e<code>Status</code> field value is <code>FAILED</code>, the <code>ErrorMessage</code> field contains a message that explains why.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>the name of the index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Provides information about the number of FAQ questions and answers and the number of text documents indexed.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceIndexStatistics * _Nullable indexStatistics;

/**
 <p>The name of the index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role that gives Amazon Kendra permission to write to your Amazon Cloudwatch logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The identifier of the AWS KMS customer master key (CMK) used to encrypt your data. Amazon Kendra doesn't support asymmetric CMKs.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceServerSideEncryptionConfiguration * _Nullable serverSideEncryptionConfiguration;

/**
 <p>The current status of the index. When the value is <code>ACTIVE</code>, the index is ready for use. If the <code>Status</code> field value is <code>FAILED</code>, the <code>ErrorMessage</code> field contains a message that explains why.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceIndexStatus status;

/**
 <p>The Unix datetime that the index was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 <p>A document in an index.</p>
 Required parameters: [Id]
 */
@interface AWSKendraFrontendServiceDocument : AWSModel


/**
 <p>Information to use for user context filtering.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServicePrincipal *> * _Nullable accessControlList;

/**
 <p>Custom attributes to apply to the document. Use the custom attributes to provide additional information for searching, to provide facets for refining searches, and to provide additional information in the query response.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceDocumentAttribute *> * _Nullable attributes;

/**
 <p>The contents of the document. </p><p>Documents passed to the <code>Blob</code> parameter must be base64 encoded. Your code might not need to encode the document file bytes if you're using an AWS SDK to call Amazon Kendra operations. If you are calling the Amazon Kendra endpoint directly using REST, you must base64 encode the contents before sending.</p>
 */
@property (nonatomic, strong) NSData * _Nullable blob;

/**
 <p>The file type of the document in the <code>Blob</code> field.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceContentType contentType;

/**
 <p>A unique identifier of the document in the index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Information required to find a specific file in an Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceS3Path * _Nullable s3Path;

/**
 <p>The title of the document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

@end

/**
 <p>A custom attribute value assigned to a document. </p>
 Required parameters: [Key, Value]
 */
@interface AWSKendraFrontendServiceDocumentAttribute : AWSModel


/**
 <p>The identifier for the attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value of the attribute.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceDocumentAttributeValue * _Nullable value;

@end

/**
 <p>The value of a custom document attribute. You can only provide one value for a custom attribute.</p>
 */
@interface AWSKendraFrontendServiceDocumentAttributeValue : AWSModel


/**
 <p>A date value expressed as seconds from the Unix epoch.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable dateValue;

/**
 <p>A long integer value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable longValue;

/**
 <p>A list of strings. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable stringListValue;

/**
 <p>A string, such as "department".</p>
 */
@property (nonatomic, strong) NSString * _Nullable stringValue;

@end

/**
 <p>Provides the count of documents that match a particular attribute when doing a faceted search.</p>
 */
@interface AWSKendraFrontendServiceDocumentAttributeValueCountPair : AWSModel


/**
 <p>The number of documents in the response that have the attribute value for the key.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>The value of the attribute. For example, "HR."</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceDocumentAttributeValue * _Nullable documentAttributeValue;

@end

/**
 <p>Specifies the properties of a custom index field.</p>
 Required parameters: [Name, Type]
 */
@interface AWSKendraFrontendServiceDocumentMetadataConfiguration : AWSModel


/**
 <p>The name of the index field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Provides manual tuning parameters to determine how the field affects the search results.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceRelevance * _Nullable relevance;

/**
 <p>Provides information about how the field is used during a search.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceSearch * _Nullable search;

/**
 <p>The data type of the index field. </p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceDocumentAttributeValueType types;

@end

/**
 <p>Document metadata files that contain information such as the document access control information, source URI, document author, and custom attributes. Each metadata file contains metadata about a single document.</p>
 */
@interface AWSKendraFrontendServiceDocumentsMetadataConfiguration : AWSModel


/**
 <p>A prefix used to filter metadata configuration files in the AWS S3 bucket. The S3 bucket might contain multiple metadata files. Use <code>S3Prefix</code> to include only the desired metadata files.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Prefix;

@end

/**
 <p>Information about a document attribute</p>
 */
@interface AWSKendraFrontendServiceFacet : AWSModel


/**
 <p>The unique key for the document attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentAttributeKey;

@end

/**
 <p>The facet values for the documents in the response.</p>
 */
@interface AWSKendraFrontendServiceFacetResult : AWSModel


/**
 <p>The key for the facet values. This is the same as the <code>DocumentAttributeKey</code> provided in the query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentAttributeKey;

/**
 <p>An array of key/value pairs, where the key is the value of the attribute and the count is the number of documents that share the key value.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceDocumentAttributeValueCountPair *> * _Nullable documentAttributeValueCountPairs;

@end

/**
 <p>Provides statistical information about the FAQ questions and answers contained in an index.</p>
 Required parameters: [IndexedQuestionAnswersCount]
 */
@interface AWSKendraFrontendServiceFaqStatistics : AWSModel


/**
 <p>The total number of FAQ questions and answers contained in the index.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable indexedQuestionAnswersCount;

@end

/**
 <p>Provides information about a frequently asked questions and answer contained in an index.</p>
 */
@interface AWSKendraFrontendServiceFaqSummary : AWSModel


/**
 <p>The UNIX datetime that the FAQ was added to the index.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The unique identifier of the FAQ.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name that you assigned the FAQ when you created or updated the FAQ.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The current status of the FAQ. When the status is <code>ACTIVE</code> the FAQ is ready for use.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceFaqStatus status;

/**
 <p>The UNIX datetime that the FAQ was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 <p>Provides information that you can use to highlight a search result so that your users can quickly identify terms in the response.</p>
 Required parameters: [BeginOffset, EndOffset]
 */
@interface AWSKendraFrontendServiceHighlight : AWSModel


/**
 <p>The zero-based location in the response string where the highlight starts.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable beginOffset;

/**
 <p>The zero-based location in the response string where the highlight ends.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endOffset;

/**
 <p>Indicates whether the response is the best response. True if this is the best response; otherwise, false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable topAnswer;

@end

/**
 <p>A summary of information about an index.</p>
 Required parameters: [CreatedAt, UpdatedAt, Status]
 */
@interface AWSKendraFrontendServiceIndexConfigurationSummary : AWSModel


/**
 <p>The Unix timestamp when the index was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>Indicates whether the index is a enterprise edition index or a developer edition index. </p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceIndexEdition edition;

/**
 <p>A unique identifier for the index. Use this to identify the index when you are using operations such as <code>Query</code>, <code>DescribeIndex</code>, <code>UpdateIndex</code>, and <code>DeleteIndex</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The current status of the index. When the status is <code>ACTIVE</code>, the index is ready to search.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceIndexStatus status;

/**
 <p>The Unix timestamp when the index was last updated by the <code>UpdateIndex</code> operation.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 <p>Provides information about the number of documents and the number of questions and answers in an index.</p>
 Required parameters: [FaqStatistics, TextDocumentStatistics]
 */
@interface AWSKendraFrontendServiceIndexStatistics : AWSModel


/**
 <p>The number of question and answer topics in the index.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceFaqStatistics * _Nullable faqStatistics;

/**
 <p>The number of text documents indexed.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceTextDocumentStatistics * _Nullable textDocumentStatistics;

@end

/**
 
 */
@interface AWSKendraFrontendServiceListDataSourceSyncJobsRequest : AWSRequest


/**
 <p>The identifier of the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The identifier of the index that contains the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexId;

/**
 <p>The maximum number of synchronization jobs to return in the response. If there are fewer results in the list, this response contains only the actual results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the result of the previous request to <code>GetDataSourceSyncJobHistory</code> was truncated, include the <code>NextToken</code> to fetch the next set of jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>When specified, the synchronization jobs returned in the list are limited to jobs between the specified dates. </p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceTimeRange * _Nullable startTimeFilter;

/**
 <p>When specified, only returns synchronization jobs with the <code>Status</code> field equal to the specified status.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceDataSourceSyncJobStatus statusFilter;

@end

/**
 
 */
@interface AWSKendraFrontendServiceListDataSourceSyncJobsResponse : AWSModel


/**
 <p>A history of synchronization jobs for the data source.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceDataSourceSyncJob *> * _Nullable history;

/**
 <p>The <code>GetDataSourceSyncJobHistory</code> operation returns a page of vocabularies at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If there are more jobs in the list than the page size, Amazon Kendra returns the NextPage token. Include the token in the next request to the <code>GetDataSourceSyncJobHistory</code> operation to return in the next page of jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSKendraFrontendServiceListDataSourcesRequest : AWSRequest


/**
 <p>The identifier of the index that contains the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexId;

/**
 <p>The maximum number of data sources to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra returns a pagination token in the response. You can use this pagination token to retrieve the next set of data sources (<code>DataSourceSummaryItems</code>). </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSKendraFrontendServiceListDataSourcesResponse : AWSModel


/**
 <p>If the response is truncated, Amazon Kendra returns this token that you can use in the subsequent request to retrieve the next set of data sources. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of summary information for one or more data sources.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceDataSourceSummary *> * _Nullable summaryItems;

@end

/**
 
 */
@interface AWSKendraFrontendServiceListFaqsRequest : AWSRequest


/**
 <p>The index that contains the FAQ lists.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexId;

/**
 <p>The maximum number of FAQs to return in the response. If there are fewer results in the list, this response contains only the actual results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the result of the previous request to <code>ListFaqs</code> was truncated, include the <code>NextToken</code> to fetch the next set of FAQs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSKendraFrontendServiceListFaqsResponse : AWSModel


/**
 <p>information about the FAQs associated with the specified index.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceFaqSummary *> * _Nullable faqSummaryItems;

/**
 <p>The <code>ListFaqs</code> operation returns a page of FAQs at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If there are more jobs in the list than the page size, Amazon Kendra returns the <code>NextPage</code> token. Include the token in the next request to the <code>ListFaqs</code> operation to return the next page of FAQs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSKendraFrontendServiceListIndicesRequest : AWSRequest


/**
 <p>The maximum number of data sources to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra returns a pagination token in the response. You can use this pagination token to retrieve the next set of indexes (<code>DataSourceSummaryItems</code>). </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSKendraFrontendServiceListIndicesResponse : AWSModel


/**
 <p>An array of summary information for one or more indexes.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceIndexConfigurationSummary *> * _Nullable indexConfigurationSummaryItems;

/**
 <p>If the response is truncated, Amazon Kendra returns this token that you can use in the subsequent request to retrieve the next set of indexes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSKendraFrontendServiceListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the index, FAQ, or data source to get a list of tags for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

@end

/**
 
 */
@interface AWSKendraFrontendServiceListTagsForResourceResponse : AWSModel


/**
 <p>A list of tags associated with the index, FAQ, or data source.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceTag *> * _Nullable tags;

@end

/**
 <p>Provides configuration information for data sources that connect to OneDrive.</p>
 Required parameters: [TenantDomain, SecretArn, OneDriveUsers]
 */
@interface AWSKendraFrontendServiceOneDriveConfiguration : AWSModel


/**
 <p>List of regular expressions applied to documents. Items that match the exclusion pattern are not indexed. If you provide both an inclusion pattern and an exclusion pattern, any item that matches the exclusion pattern isn't indexed. </p><p>The exclusion pattern is applied to the file name.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable exclusionPatterns;

/**
 <p>A list of <code>DataSourceToIndexFieldMapping</code> objects that map Microsoft OneDrive fields to custom fields in the Amazon Kendra index. You must first create the index fields before you map OneDrive fields.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceDataSourceToIndexFieldMapping *> * _Nullable fieldMappings;

/**
 <p>A list of regular expression patterns. Documents that match the pattern are included in the index. Documents that don't match the pattern are excluded from the index. If a document matches both an inclusion pattern and an exclusion pattern, the document is not included in the index. </p><p>The exclusion pattern is applied to the file name.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable inclusionPatterns;

/**
 <p>A list of user accounts whose documents should be indexed.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceOneDriveUsers * _Nullable oneDriveUsers;

/**
 <p>The Amazon Resource Name (ARN) of an AWS Secrets Manager secret that contains the user name and password to connect to OneDrive. The user namd should be the application ID for the OneDrive application, and the password is the application key for the OneDrive application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretArn;

/**
 <p>Tha Azure Active Directory domain of the organization. </p>
 */
@property (nonatomic, strong) NSString * _Nullable tenantDomain;

@end

/**
 <p>User accounts whose documents should be indexed.</p>
 */
@interface AWSKendraFrontendServiceOneDriveUsers : AWSModel


/**
 <p>A list of users whose documents should be indexed. Specify the user names in email format, for example, <code>username@tenantdomain</code>. If you need to index the documents of more than 100 users, use the <code>OneDriveUserS3Path</code> field to specify the location of a file containing a list of users.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable oneDriveUserList;

/**
 <p>The S3 bucket location of a file containing a list of users whose documents should be indexed.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceS3Path * _Nullable oneDriveUserS3Path;

@end

/**
 <p>Provides user and group information for document access filtering.</p>
 Required parameters: [Name, Type, Access]
 */
@interface AWSKendraFrontendServicePrincipal : AWSModel


/**
 <p>Whether to allow or deny access to the principal.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceReadAccessType access;

/**
 <p>The name of the user or group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of principal.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServicePrincipalType types;

@end

/**
 
 */
@interface AWSKendraFrontendServiceQueryRequest : AWSRequest


/**
 <p>Enables filtered searches based on document attributes. You can only provide one attribute filter; however, the <code>AndAllFilters</code>, <code>NotFilter</code>, and <code>OrAllFilters</code> parameters contain a list of other filters.</p><p>The <code>AttributeFilter</code> parameter enables you to create a set of filtering rules that a document must satisfy to be included in the query results.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceAttributeFilter * _Nullable attributeFilter;

/**
 <p>An array of documents attributes. Amazon Kendra returns a count for each attribute key specified. You can use this information to help narrow the search for your user.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceFacet *> * _Nullable facets;

/**
 <p>The unique identifier of the index to search. The identifier is returned in the response from the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexId;

/**
 <p>Query results are returned in pages the size of the <code>PageSize</code> parameter. By default, Amazon Kendra returns the first page of results. Use this parameter to get result pages after the first one.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageNumber;

/**
 <p>Sets the number of results that are returned in each page of results. The default page size is 10. The maximum number of results returned is 100. If you ask for more than 100 results, only 100 are returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>Sets the type of query. Only results for the specified query type are returned.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceQueryResultType queryResultTypeFilter;

/**
 <p>The text to search for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryText;

/**
 <p>An array of document attributes to include in the response. No other document attributes are included in the response. By default all document attributes are included in the response. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable requestedDocumentAttributes;

@end

/**
 
 */
@interface AWSKendraFrontendServiceQueryResult : AWSModel


/**
 <p>Contains the facet results. A <code>FacetResult</code> contains the counts for each attribute key that was specified in the <code>Facets</code> input parameter.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceFacetResult *> * _Nullable facetResults;

/**
 <p>The unique identifier for the search. You use <code>QueryId</code> to identify the search when using the feedback API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryId;

/**
 <p>The results of the search.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceQueryResultItem *> * _Nullable resultItems;

/**
 <p>The number of items returned by the search. Use this to determine when you have requested the last set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalNumberOfResults;

@end

/**
 <p>A single query result.</p><p>A query result contains information about a document returned by the query. This includes the original location of the document, a list of attributes assigned to the document, and relevant text from the document that satisfies the query.</p>
 */
@interface AWSKendraFrontendServiceQueryResultItem : AWSModel


/**
 <p>One or more additional attribues associated with the query result.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceAdditionalResultAttribute *> * _Nullable additionalAttributes;

/**
 <p>An array of document attributes for the document that the query result maps to. For example, the document author (Author) or the source URI (SourceUri) of the document.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceDocumentAttribute *> * _Nullable documentAttributes;

/**
 <p>An extract of the text in the document. Contains information about highlighting the relevant terms in the excerpt.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceTextWithHighlights * _Nullable documentExcerpt;

/**
 <p>The unique identifier for the document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentId;

/**
 <p>The title of the document. Contains the text of the title and information for highlighting the relevant terms in the title.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceTextWithHighlights * _Nullable documentTitle;

/**
 <p>The URI of the original location of the document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentURI;

/**
 <p>The unique identifier for the query result.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The type of document. </p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceQueryResultType types;

@end

/**
 <p>Provides information for manually tuning the relevance of a field in a search. When a query includes terms that match the field, the results are given a boost in the response based on these tuning parameters.</p>
 */
@interface AWSKendraFrontendServiceRelevance : AWSModel


/**
 <p>Specifies the time period that the boost applies to. For example, to make the boost apply to documents with the field value within the last month, you would use "2628000s". Once the field value is beyond the specified range, the effect of the boost drops off. The higher the importance, the faster the effect drops off. If you don't specify a value, the default is 3 months. The value of the field is a numeric string followed by the character "s", for example "86400s" for one day, or "604800s" for one week. </p><p>Only applies to <code>DATE</code> fields.</p>
 */
@property (nonatomic, strong) NSString * _Nullable duration;

/**
 <p>Indicates that this field determines how "fresh" a document is. For example, if document 1 was created on November 5, and document 2 was created on October 31, document 1 is "fresher" than document 2. You can only set the <code>Freshness</code> field on one <code>DATE</code> type field. Only applies to <code>DATE</code> fields.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable freshness;

/**
 <p>The relative importance of the field in the search. Larger numbers provide more of a boost than smaller numbers.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable importance;

/**
 <p>Determines how values should be interpreted.</p><p>When the <code>RankOrder</code> field is <code>ASCENDING</code>, higher numbers are better. For example, a document with a rating score of 10 is higher ranking than a document with a rating score of 1.</p><p>When the <code>RankOrder</code> field is <code>DESCENDING</code>, lower numbers are better. For example, in a task tracking application, a priority 1 task is more important than a priority 5 task.</p><p>Only applies to <code>LONG</code> and <code>DOUBLE</code> fields.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceOrder rankOrder;

/**
 <p>A list of values that should be given a different boost when they appear in the result list. For example, if you are boosting a field called "department," query terms that match the department field are boosted in the result. However, you can add entries from the department field to boost documents with those values higher. </p><p>For example, you can add entries to the map with names of departments. If you add "HR",5 and "Legal",3 those departments are given special attention when they appear in the metadata of a document. When those terms appear they are given the specified importance instead of the regular importance for the boost.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable valueImportanceMap;

@end

/**
 <p>Provides feedback on how relevant a document is to a search. Your application uses the <a>SubmitFeedback</a> operation to provide relevance information.</p>
 Required parameters: [ResultId, RelevanceValue]
 */
@interface AWSKendraFrontendServiceRelevanceFeedback : AWSModel


/**
 <p>Whether to document was relevant or not relevant to the search.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceRelevanceType relevanceValue;

/**
 <p>The unique identifier of the search result that the user provided relevance feedback for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resultId;

@end

/**
 <p>Provides configuration information for a data source to index documents in an Amazon S3 bucket.</p>
 Required parameters: [BucketName]
 */
@interface AWSKendraFrontendServiceS3DataSourceConfiguration : AWSModel


/**
 <p>Provides the path to the S3 bucket that contains the user context filtering files for the data source.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceAccessControlListConfiguration * _Nullable accessControlListConfiguration;

/**
 <p>The name of the bucket that contains the documents.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketName;

/**
 <p>Document metadata files that contain information such as the document access control information, source URI, document author, and custom attributes. Each metadata file contains metadata about a single document.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceDocumentsMetadataConfiguration * _Nullable documentsMetadataConfiguration;

/**
 <p>A list of glob patterns for documents that should not be indexed. If a document that matches an inclusion prefix also matches an exclusion pattern, the document is not indexed.</p><p>For more information about glob patterns, see <a href="https://en.wikipedia.org/wiki/Glob_(programming)">glob (programming)</a> in <i>Wikipedia</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable exclusionPatterns;

/**
 <p>A list of S3 prefixes for the documents that should be included in the index.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable inclusionPrefixes;

@end

/**
 <p>Information required to find a specific file in an Amazon S3 bucket.</p>
 Required parameters: [Bucket, Key]
 */
@interface AWSKendraFrontendServiceS3Path : AWSModel


/**
 <p>The name of the S3 bucket that contains the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The name of the file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

@end

/**
 <p>Defines configuration for syncing a Salesforce chatter feed. The contents of the object comes from the Salesforce FeedItem table.</p>
 Required parameters: [DocumentDataFieldName]
 */
@interface AWSKendraFrontendServiceSalesforceChatterFeedConfiguration : AWSModel


/**
 <p>The name of the column in the Salesforce FeedItem table that contains the content to index. Typically this is the <code>Body</code> column.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentDataFieldName;

/**
 <p>The name of the column in the Salesforce FeedItem table that contains the title of the document. This is typically the <code>Title</code> collumn.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentTitleFieldName;

/**
 <p>Maps fields from a Salesforce chatter feed into Amazon Kendra index fields.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceDataSourceToIndexFieldMapping *> * _Nullable fieldMappings;

/**
 <p>Filters the documents in the feed based on status of the user. When you specify <code>ACTIVE_USERS</code> only documents from users who have an active account are indexed. When you specify <code>STANDARD_USER</code> only documents for Salesforce standard users are documented. You can specify both.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable includeFilterTypes;

@end

/**
 <p>Provides configuration information for connecting to a Salesforce data source.</p>
 Required parameters: [ServerUrl, SecretArn]
 */
@interface AWSKendraFrontendServiceSalesforceConfiguration : AWSModel


/**
 <p>Specifies configuration information for Salesforce chatter feeds.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceSalesforceChatterFeedConfiguration * _Nullable chatterFeedConfiguration;

/**
 <p>Indicates whether Amazon Kendra should index attachments to Salesforce objects.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable crawlAttachments;

/**
 <p>A list of regular expression patterns. Documents that match the patterns are excluded from the index. Documents that don't match the patterns are included in the index. If a document matches both an exclusion pattern and an inclusion pattern, the document is not included in the index.</p><p>The regex is applied to the name of the attached file.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable excludeAttachmentFilePatterns;

/**
 <p>A list of regular expression patterns. Documents that match the patterns are included in the index. Documents that don't match the patterns are excluded from the index. If a document matches both an inclusion pattern and an exclusion pattern, the document is not included in the index.</p><p>The regex is applied to the name of the attached file.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable includeAttachmentFilePatterns;

/**
 <p>Specifies configuration information for the knowlege article types that Amazon Kendra indexes. Amazon Kendra indexes standard knowledge articles and the standard fields of knowledge articles, or the custom fields of custom knowledge articles, but not both.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceSalesforceKnowledgeArticleConfiguration * _Nullable knowledgeArticleConfiguration;

/**
 <p>The Amazon Resource Name (ARN) of an AWS Secrets Manager secret that contains the key/value pairs required to connect to your Salesforce instance. The secret must contain a JSON structure with the following keys:</p><ul><li><p>authenticationUrl - The OAUTH endpoint that Amazon Kendra connects to get an OAUTH token. </p></li><li><p>consumerKey - The application public key generated when you created your Salesforce application.</p></li><li><p>consumerSecret - The application private key generated when you created your Salesforce application.</p></li><li><p>password - The password associated with the user logging in to the Salesforce instance.</p></li><li><p>securityToken - The token associated with the user account logging in to the Salesforce instance.</p></li><li><p>username - The user name of the user logging in to the Salesforce instance.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable secretArn;

/**
 <p>The instance URL for the Salesforce site that you want to index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverUrl;

/**
 <p>Provides configuration information for processing attachments to Salesforce standard objects. </p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceSalesforceStandardObjectAttachmentConfiguration * _Nullable standardObjectAttachmentConfiguration;

/**
 <p>Specifies the Salesforce standard objects that Amazon Kendra indexes.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceSalesforceStandardObjectConfiguration *> * _Nullable standardObjectConfigurations;

@end

/**
 <p>Provides configuration information for indexing Salesforce custom articles.</p>
 Required parameters: [Name, DocumentDataFieldName]
 */
@interface AWSKendraFrontendServiceSalesforceCustomKnowledgeArticleTypeConfiguration : AWSModel


/**
 <p>The name of the field in the custom knowledge article that contains the document data to index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentDataFieldName;

/**
 <p>The name of the field in the custom knowledge article that contains the document title.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentTitleFieldName;

/**
 <p>One or more objects that map fields in the custom knowledge article to fields in the Amazon Kendra index.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceDataSourceToIndexFieldMapping *> * _Nullable fieldMappings;

/**
 <p>The name of the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Specifies configuration information for the knowlege article types that Amazon Kendra indexes. Amazon Kendra indexes standard knowledge articles and the standard fields of knowledge articles, or the custom fields of custom knowledge articles, but not both </p>
 Required parameters: [IncludedStates]
 */
@interface AWSKendraFrontendServiceSalesforceKnowledgeArticleConfiguration : AWSModel


/**
 <p>Provides configuration information for custom Salesforce knowledge articles.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceSalesforceCustomKnowledgeArticleTypeConfiguration *> * _Nullable customKnowledgeArticleTypeConfigurations;

/**
 <p>Specifies the document states that should be included when Amazon Kendra indexes knowledge articles. You must specify at least one state.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable includedStates;

/**
 <p>Provides configuration information for standard Salesforce knowledge articles.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceSalesforceStandardKnowledgeArticleTypeConfiguration * _Nullable standardKnowledgeArticleTypeConfiguration;

@end

/**
 <p>Provides configuration information for standard Salesforce knowledge articles.</p>
 Required parameters: [DocumentDataFieldName]
 */
@interface AWSKendraFrontendServiceSalesforceStandardKnowledgeArticleTypeConfiguration : AWSModel


/**
 <p>The name of the field that contains the document data to index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentDataFieldName;

/**
 <p>The name of the field that contains the document title.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentTitleFieldName;

/**
 <p>One or more objects that map fields in the knowledge article to Amazon Kendra index fields. The index field must exist before you can map a Salesforce field to it.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceDataSourceToIndexFieldMapping *> * _Nullable fieldMappings;

@end

/**
 <p>Provides configuration information for processing attachments to Salesforce standard objects. </p>
 */
@interface AWSKendraFrontendServiceSalesforceStandardObjectAttachmentConfiguration : AWSModel


/**
 <p>The name of the field used for the document title.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentTitleFieldName;

/**
 <p>One or more objects that map fields in attachments to Amazon Kendra index fields.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceDataSourceToIndexFieldMapping *> * _Nullable fieldMappings;

@end

/**
 <p>Specifies confguration information for indexing a single standard object.</p>
 Required parameters: [Name, DocumentDataFieldName]
 */
@interface AWSKendraFrontendServiceSalesforceStandardObjectConfiguration : AWSModel


/**
 <p>The name of the field in the standard object table that contains the document contents.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentDataFieldName;

/**
 <p>The name of the field in the standard object table that contains the document titleB.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentTitleFieldName;

/**
 <p>One or more objects that map fields in the standard object to Amazon Kendra index fields. The index field must exist before you can map a Salesforce field to it.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceDataSourceToIndexFieldMapping *> * _Nullable fieldMappings;

/**
 <p>The name of the standard object.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceSalesforceStandardObjectName name;

@end

/**
 <p>Provides information about how a custom index field is used during a search.</p>
 */
@interface AWSKendraFrontendServiceSearch : AWSModel


/**
 <p>Determines whether the field is returned in the query response. The default is <code>true</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable displayable;

/**
 <p>Indicates that the field can be used to create search facets, a count of results for each value in the field. The default is <code>false</code> .</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable facetable;

/**
 <p>Determines whether the field is used in the search. If the <code>Searchable</code> field is <code>true</code>, you can use relevance tuning to manually tune how Amazon Kendra weights the field in the search. The default is <code>true</code> for string fields and <code>false</code> for number and date fields.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable searchable;

@end

/**
 <p>Provides the identifier of the AWS KMS customer master key (CMK) used to encrypt data indexed by Amazon Kendra. Amazon Kendra doesn't support asymmetric CMKs.</p>
 */
@interface AWSKendraFrontendServiceServerSideEncryptionConfiguration : AWSModel


/**
 <p>The identifier of the AWS KMS customer master key (CMK). Amazon Kendra doesn't support asymmetric CMKs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

@end

/**
 <p>Provides configuration information required to connect to a ServiceNow data source.</p>
 Required parameters: [HostUrl, SecretArn, ServiceNowBuildVersion]
 */
@interface AWSKendraFrontendServiceServiceNowConfiguration : AWSModel


/**
 <p>The ServiceNow instance that the data source connects to. The host endpoint should look like the following: <code>{instance}.service-now.com.</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable hostUrl;

/**
 <p>Provides configuration information for crawling knowledge articles in the ServiceNow site.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceServiceNowKnowledgeArticleConfiguration * _Nullable knowledgeArticleConfiguration;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Secret Manager secret that contains the user name and password required to connect to the ServiceNow instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretArn;

/**
 <p>Provides configuration information for crawling service catalogs in the ServiceNow site.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceServiceNowServiceCatalogConfiguration * _Nullable serviceCatalogConfiguration;

/**
 <p>The identifier of the release that the ServiceNow host is running. If the host is not running the <code>LONDON</code> release, use <code>OTHERS</code>.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceServiceNowBuildVersionType serviceNowBuildVersion;

@end

/**
 <p>Provides configuration information for crawling knowledge articles in the ServiceNow site.</p>
 Required parameters: [DocumentDataFieldName]
 */
@interface AWSKendraFrontendServiceServiceNowKnowledgeArticleConfiguration : AWSModel


/**
 <p>Indicates whether Amazon Kendra should index attachments to knowledge articles.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable crawlAttachments;

/**
 <p>The name of the ServiceNow field that is mapped to the index document contents field in the Amazon Kendra index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentDataFieldName;

/**
 <p>The name of the ServiceNow field that is mapped to the index document title field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentTitleFieldName;

/**
 <p>List of regular expressions applied to knowledge articles. Items that don't match the inclusion pattern are not indexed. The regex is applied to the field specified in the <code>PatternTargetField</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable excludeAttachmentFilePatterns;

/**
 <p>Mapping between ServiceNow fields and Amazon Kendra index fields. You must create the index field before you map the field.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceDataSourceToIndexFieldMapping *> * _Nullable fieldMappings;

/**
 <p>List of regular expressions applied to knowledge articles. Items that don't match the inclusion pattern are not indexed. The regex is applied to the field specified in the <code>PatternTargetField</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable includeAttachmentFilePatterns;

@end

/**
 <p>Provides configuration information for crawling service catalog items in the ServiceNow site</p>
 Required parameters: [DocumentDataFieldName]
 */
@interface AWSKendraFrontendServiceServiceNowServiceCatalogConfiguration : AWSModel


/**
 <p>Indicates whether Amazon Kendra should crawl attachments to the service catalog items. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable crawlAttachments;

/**
 <p>The name of the ServiceNow field that is mapped to the index document contents field in the Amazon Kendra index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentDataFieldName;

/**
 <p>The name of the ServiceNow field that is mapped to the index document title field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentTitleFieldName;

/**
 <p>Determines the types of file attachments that are excluded from the index.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable excludeAttachmentFilePatterns;

/**
 <p>Mapping between ServiceNow fields and Amazon Kendra index fields. You must create the index field before you map the field.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceDataSourceToIndexFieldMapping *> * _Nullable fieldMappings;

/**
 <p>Determines the types of file attachments that are included in the index. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable includeAttachmentFilePatterns;

@end

/**
 <p>Provides configuration information for connecting to a Microsoft SharePoint data source.</p>
 Required parameters: [SharePointVersion, Urls, SecretArn]
 */
@interface AWSKendraFrontendServiceSharePointConfiguration : AWSModel


/**
 <p><code>TRUE</code> to include attachments to documents stored in your Microsoft SharePoint site in the index; otherwise, <code>FALSE</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable crawlAttachments;

/**
 <p>The Microsoft SharePoint attribute field that contains the title of the document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentTitleFieldName;

/**
 <p>A list of regulary expression patterns. Documents that match the patterns are excluded from the index. Documents that don't match the patterns are included in the index. If a document matches both an exclusion pattern and an inclusion pattern, the document is not included in the index.</p><p>The regex is applied to the display URL of the SharePoint document.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable exclusionPatterns;

/**
 <p>A list of <code>DataSourceToIndexFieldMapping</code> objects that map Microsoft SharePoint attributes to custom fields in the Amazon Kendra index. You must first create the index fields using the operation before you map SharePoint attributes. For more information, see <a href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping Data Source Fields</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceDataSourceToIndexFieldMapping *> * _Nullable fieldMappings;

/**
 <p>A list of regular expression patterns. Documents that match the patterns are included in the index. Documents that don't match the patterns are excluded from the index. If a document matches both an inclusion pattern and an exclusion pattern, the document is not included in the index.</p><p>The regex is applied to the display URL of the SharePoint document.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable inclusionPatterns;

/**
 <p>The Amazon Resource Name (ARN) of credentials stored in AWS Secrets Manager. The credentials should be a user/password pair. For more information, see <a href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-sharepoint.html">Using a Microsoft SharePoint Data Source</a>. For more information about AWS Secrets Manager, see <a href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html"> What Is AWS Secrets Manager </a> in the <i>AWS Secrets Manager</i> user guide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretArn;

/**
 <p>The version of Microsoft SharePoint that you are using as a data source.</p>
 */
@property (nonatomic, assign) AWSKendraFrontendServiceSharePointVersion sharePointVersion;

/**
 <p>The URLs of the Microsoft SharePoint site that contains the documents that should be indexed.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable urls;

/**
 <p>Set to <code>TRUE</code> to use the Microsoft SharePoint change log to determine the documents that need to be updated in the index. Depending on the size of the SharePoint change log, it may take longer for Amazon Kendra to use the change log than it takes it to determine the changed documents using the Amazon Kendra document crawler.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable useChangeLog;

/**
 <p>Provides information for connecting to an Amazon VPC.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceDataSourceVpcConfiguration * _Nullable vpcConfiguration;

@end

/**
 
 */
@interface AWSKendraFrontendServiceStartDataSourceSyncJobRequest : AWSRequest


/**
 <p>The identifier of the data source to synchronize.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The identifier of the index that contains the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexId;

@end

/**
 
 */
@interface AWSKendraFrontendServiceStartDataSourceSyncJobResponse : AWSModel


/**
 <p>Identifies a particular synchronization job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionId;

@end

/**
 
 */
@interface AWSKendraFrontendServiceStopDataSourceSyncJobRequest : AWSRequest


/**
 <p>The identifier of the data source for which to stop the synchronization jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The identifier of the index that contains the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexId;

@end

/**
 
 */
@interface AWSKendraFrontendServiceSubmitFeedbackRequest : AWSRequest


/**
 <p>Tells Amazon Kendra that a particular search result link was chosen by the user. </p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceClickFeedback *> * _Nullable clickFeedbackItems;

/**
 <p>The identifier of the index that was queried.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexId;

/**
 <p>The identifier of the specific query for which you are submitting feedback. The query ID is returned in the response to the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryId;

/**
 <p>Provides Amazon Kendra with relevant or not relevant feedback for whether a particular item was relevant to the search.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceRelevanceFeedback *> * _Nullable relevanceFeedbackItems;

@end

/**
 <p>A list of key/value pairs that identify an index, FAQ, or data source. Tag keys and values can consist of Unicode letters, digits, white space, and any of the following symbols: _ . : / = + - @.</p>
 Required parameters: [Key, Value]
 */
@interface AWSKendraFrontendServiceTag : AWSModel


/**
 <p>The key for the tag. Keys are not case sensitive and must be unique for the index, FAQ, or data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value associated with the tag. The value may be an empty string but it can't be null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSKendraFrontendServiceTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the index, FAQ, or data source to tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p>A list of tag keys to add to the index, FAQ, or data source. If a tag already exists, the existing value is replaced with the new value.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSKendraFrontendServiceTagResourceResponse : AWSModel


@end

/**
 <p>Provides information about text documents indexed in an index.</p>
 Required parameters: [IndexedTextDocumentsCount, IndexedTextBytes]
 */
@interface AWSKendraFrontendServiceTextDocumentStatistics : AWSModel


/**
 <p>The total size, in bytes, of the indexed documents.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable indexedTextBytes;

/**
 <p>The number of text documents indexed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable indexedTextDocumentsCount;

@end

/**
 <p>Provides text and information about where to highlight the text.</p>
 */
@interface AWSKendraFrontendServiceTextWithHighlights : AWSModel


/**
 <p>The beginning and end of the text that should be highlighted.</p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceHighlight *> * _Nullable highlights;

/**
 <p>The text to display to the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 <p>Provides a range of time.</p>
 */
@interface AWSKendraFrontendServiceTimeRange : AWSModel


/**
 <p>The UNIX datetime of the end of the time range.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The UNIX datetime of the beginning of the time range.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 
 */
@interface AWSKendraFrontendServiceUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the index, FAQ, or data source to remove the tag from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p>A list of tag keys to remove from the index, FAQ, or data source. If a tag key does not exist on the resource, it is ignored.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSKendraFrontendServiceUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSKendraFrontendServiceUpdateDataSourceRequest : AWSRequest


/**
 <p>Configuration information for a Amazon Kendra data source.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceDataSourceConfiguration * _Nullable configuration;

/**
 <p>The new description for the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The unique identifier of the data source to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The identifier of the index that contains the data source to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexId;

/**
 <p>The name of the data source to update. The name of the data source can't be updated. To rename a data source you must delete the data source and re-create it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Resource Name (ARN) of the new role to use when the data source is accessing resources on your behalf.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The new update schedule for the data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

@end

/**
 
 */
@interface AWSKendraFrontendServiceUpdateIndexRequest : AWSRequest


/**
 <p>Sets the number of addtional storage and query capacity units that should be used by the index. You can change the capacity of the index up to 5 times per day.</p><p>If you are using extra storage units, you can't reduce the storage capacity below that required to meet the storage needs for your index.</p>
 */
@property (nonatomic, strong) AWSKendraFrontendServiceCapacityUnitsConfiguration * _Nullable capacityUnits;

/**
 <p>A new description for the index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The document metadata to update. </p>
 */
@property (nonatomic, strong) NSArray<AWSKendraFrontendServiceDocumentMetadataConfiguration *> * _Nullable documentMetadataConfigurationUpdates;

/**
 <p>The identifier of the index to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the index to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A new IAM role that gives Amazon Kendra permission to access your Amazon CloudWatch logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

NS_ASSUME_NONNULL_END
