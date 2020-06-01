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

FOUNDATION_EXPORT NSString *const AWSAthenaErrorDomain;

typedef NS_ENUM(NSInteger, AWSAthenaErrorType) {
    AWSAthenaErrorUnknown,
    AWSAthenaErrorInternalServer,
    AWSAthenaErrorInvalidRequest,
    AWSAthenaErrorMetadata,
    AWSAthenaErrorResourceNotFound,
    AWSAthenaErrorTooManyRequests,
};

typedef NS_ENUM(NSInteger, AWSAthenaColumnNullable) {
    AWSAthenaColumnNullableUnknown,
    AWSAthenaColumnNullableNotNull,
    AWSAthenaColumnNullableNullable,
};

typedef NS_ENUM(NSInteger, AWSAthenaDataCatalogType) {
    AWSAthenaDataCatalogTypeUnknown,
    AWSAthenaDataCatalogTypeLambda,
    AWSAthenaDataCatalogTypeGlue,
    AWSAthenaDataCatalogTypeHive,
};

typedef NS_ENUM(NSInteger, AWSAthenaEncryptionOption) {
    AWSAthenaEncryptionOptionUnknown,
    AWSAthenaEncryptionOptionSseS3,
    AWSAthenaEncryptionOptionSseKms,
    AWSAthenaEncryptionOptionCseKms,
};

typedef NS_ENUM(NSInteger, AWSAthenaQueryExecutionState) {
    AWSAthenaQueryExecutionStateUnknown,
    AWSAthenaQueryExecutionStateQueued,
    AWSAthenaQueryExecutionStateRunning,
    AWSAthenaQueryExecutionStateSucceeded,
    AWSAthenaQueryExecutionStateFailed,
    AWSAthenaQueryExecutionStateCancelled,
};

typedef NS_ENUM(NSInteger, AWSAthenaStatementType) {
    AWSAthenaStatementTypeUnknown,
    AWSAthenaStatementTypeDdl,
    AWSAthenaStatementTypeDml,
    AWSAthenaStatementTypeUtility,
};

typedef NS_ENUM(NSInteger, AWSAthenaThrottleReason) {
    AWSAthenaThrottleReasonUnknown,
    AWSAthenaThrottleReasonConcurrentQueryLimitExceeded,
};

typedef NS_ENUM(NSInteger, AWSAthenaWorkGroupState) {
    AWSAthenaWorkGroupStateUnknown,
    AWSAthenaWorkGroupStateEnabled,
    AWSAthenaWorkGroupStateDisabled,
};

@class AWSAthenaBatchGetNamedQueryInput;
@class AWSAthenaBatchGetNamedQueryOutput;
@class AWSAthenaBatchGetQueryExecutionInput;
@class AWSAthenaBatchGetQueryExecutionOutput;
@class AWSAthenaColumn;
@class AWSAthenaColumnInfo;
@class AWSAthenaCreateDataCatalogInput;
@class AWSAthenaCreateDataCatalogOutput;
@class AWSAthenaCreateNamedQueryInput;
@class AWSAthenaCreateNamedQueryOutput;
@class AWSAthenaCreateWorkGroupInput;
@class AWSAthenaCreateWorkGroupOutput;
@class AWSAthenaDataCatalog;
@class AWSAthenaDataCatalogSummary;
@class AWSAthenaDatabase;
@class AWSAthenaDatum;
@class AWSAthenaDeleteDataCatalogInput;
@class AWSAthenaDeleteDataCatalogOutput;
@class AWSAthenaDeleteNamedQueryInput;
@class AWSAthenaDeleteNamedQueryOutput;
@class AWSAthenaDeleteWorkGroupInput;
@class AWSAthenaDeleteWorkGroupOutput;
@class AWSAthenaEncryptionConfiguration;
@class AWSAthenaGetDataCatalogInput;
@class AWSAthenaGetDataCatalogOutput;
@class AWSAthenaGetDatabaseInput;
@class AWSAthenaGetDatabaseOutput;
@class AWSAthenaGetNamedQueryInput;
@class AWSAthenaGetNamedQueryOutput;
@class AWSAthenaGetQueryExecutionInput;
@class AWSAthenaGetQueryExecutionOutput;
@class AWSAthenaGetQueryResultsInput;
@class AWSAthenaGetQueryResultsOutput;
@class AWSAthenaGetTableMetadataInput;
@class AWSAthenaGetTableMetadataOutput;
@class AWSAthenaGetWorkGroupInput;
@class AWSAthenaGetWorkGroupOutput;
@class AWSAthenaListDataCatalogsInput;
@class AWSAthenaListDataCatalogsOutput;
@class AWSAthenaListDatabasesInput;
@class AWSAthenaListDatabasesOutput;
@class AWSAthenaListNamedQueriesInput;
@class AWSAthenaListNamedQueriesOutput;
@class AWSAthenaListQueryExecutionsInput;
@class AWSAthenaListQueryExecutionsOutput;
@class AWSAthenaListTableMetadataInput;
@class AWSAthenaListTableMetadataOutput;
@class AWSAthenaListTagsForResourceInput;
@class AWSAthenaListTagsForResourceOutput;
@class AWSAthenaListWorkGroupsInput;
@class AWSAthenaListWorkGroupsOutput;
@class AWSAthenaNamedQuery;
@class AWSAthenaQueryExecution;
@class AWSAthenaQueryExecutionContext;
@class AWSAthenaQueryExecutionStatistics;
@class AWSAthenaQueryExecutionStatus;
@class AWSAthenaResultConfiguration;
@class AWSAthenaResultConfigurationUpdates;
@class AWSAthenaResultSet;
@class AWSAthenaResultSetMetadata;
@class AWSAthenaRow;
@class AWSAthenaStartQueryExecutionInput;
@class AWSAthenaStartQueryExecutionOutput;
@class AWSAthenaStopQueryExecutionInput;
@class AWSAthenaStopQueryExecutionOutput;
@class AWSAthenaTableMetadata;
@class AWSAthenaTag;
@class AWSAthenaTagResourceInput;
@class AWSAthenaTagResourceOutput;
@class AWSAthenaUnprocessedNamedQueryId;
@class AWSAthenaUnprocessedQueryExecutionId;
@class AWSAthenaUntagResourceInput;
@class AWSAthenaUntagResourceOutput;
@class AWSAthenaUpdateDataCatalogInput;
@class AWSAthenaUpdateDataCatalogOutput;
@class AWSAthenaUpdateWorkGroupInput;
@class AWSAthenaUpdateWorkGroupOutput;
@class AWSAthenaWorkGroup;
@class AWSAthenaWorkGroupConfiguration;
@class AWSAthenaWorkGroupConfigurationUpdates;
@class AWSAthenaWorkGroupSummary;

/**
 
 */
@interface AWSAthenaBatchGetNamedQueryInput : AWSRequest


/**
 <p>An array of query IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable namedQueryIds;

@end

/**
 
 */
@interface AWSAthenaBatchGetNamedQueryOutput : AWSModel


/**
 <p>Information about the named query IDs submitted.</p>
 */
@property (nonatomic, strong) NSArray<AWSAthenaNamedQuery *> * _Nullable namedQueries;

/**
 <p>Information about provided query IDs.</p>
 */
@property (nonatomic, strong) NSArray<AWSAthenaUnprocessedNamedQueryId *> * _Nullable unprocessedNamedQueryIds;

@end

/**
 
 */
@interface AWSAthenaBatchGetQueryExecutionInput : AWSRequest


/**
 <p>An array of query execution IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable queryExecutionIds;

@end

/**
 
 */
@interface AWSAthenaBatchGetQueryExecutionOutput : AWSModel


/**
 <p>Information about a query execution.</p>
 */
@property (nonatomic, strong) NSArray<AWSAthenaQueryExecution *> * _Nullable queryExecutions;

/**
 <p>Information about the query executions that failed to run.</p>
 */
@property (nonatomic, strong) NSArray<AWSAthenaUnprocessedQueryExecutionId *> * _Nullable unprocessedQueryExecutionIds;

@end

/**
 <p>Contains metadata for a column in a table.</p>
 Required parameters: [Name]
 */
@interface AWSAthenaColumn : AWSModel


/**
 <p>Optional information about the column.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The name of the column.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The data type of the column.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>Information about the columns in a query execution result.</p>
 Required parameters: [Name, Type]
 */
@interface AWSAthenaColumnInfo : AWSModel


/**
 <p>Indicates whether values in the column are case-sensitive.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable caseSensitive;

/**
 <p>The catalog to which the query results belong.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogName;

/**
 <p>A column label.</p>
 */
@property (nonatomic, strong) NSString * _Nullable label;

/**
 <p>The name of the column.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Indicates the column's nullable status.</p>
 */
@property (nonatomic, assign) AWSAthenaColumnNullable nullable;

/**
 <p>For <code>DECIMAL</code> data types, specifies the total number of digits, up to 38. For performance reasons, we recommend up to 18 digits.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable precision;

/**
 <p>For <code>DECIMAL</code> data types, specifies the total number of digits in the fractional part of the value. Defaults to 0.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scale;

/**
 <p>The schema name (database name) to which the query results belong.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaName;

/**
 <p>The table name for the query results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

/**
 <p>The data type of the column.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 
 */
@interface AWSAthenaCreateDataCatalogInput : AWSRequest


/**
 <p>A description of the data catalog to be created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the data catalog to create. The catalog name must be unique for the AWS account and can use a maximum of 128 alphanumeric, underscore, at sign, or hyphen characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Specifies the Lambda function or functions to use for creating the data catalog. This is a mapping whose values depend on the catalog type. </p><ul><li><p>For the <code>HIVE</code> data catalog type, use the following syntax. The <code>metadata-function</code> parameter is required. <code>The sdk-version</code> parameter is optional and defaults to the currently supported version.</p><p><code>metadata-function=<i>lambda_arn</i>, sdk-version=<i>version_number</i></code></p></li><li><p>For the <code>LAMBDA</code> data catalog type, use one of the following sets of required parameters, but not both.</p><ul><li><p>If you have one Lambda function that processes metadata and another for reading the actual data, use the following syntax. Both parameters are required.</p><p><code>metadata-function=<i>lambda_arn</i>, record-function=<i>lambda_arn</i></code></p></li><li><p> If you have a composite Lambda function that processes both metadata and data, use the following syntax to specify your Lambda function.</p><p><code>function=<i>lambda_arn</i></code></p></li></ul></li><li><p>The <code>GLUE</code> type has no parameters.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable parameters;

/**
 <p>A list of comma separated tags to add to the data catalog that is created.</p>
 */
@property (nonatomic, strong) NSArray<AWSAthenaTag *> * _Nullable tags;

/**
 <p>The type of data catalog to create: <code>LAMBDA</code> for a federated catalog, <code>GLUE</code> for AWS Glue Catalog, or <code>HIVE</code> for an external hive metastore.</p>
 */
@property (nonatomic, assign) AWSAthenaDataCatalogType types;

@end

/**
 
 */
@interface AWSAthenaCreateDataCatalogOutput : AWSModel


@end

/**
 
 */
@interface AWSAthenaCreateNamedQueryInput : AWSRequest


/**
 <p>A unique case-sensitive string used to ensure the request to create the query is idempotent (executes only once). If another <code>CreateNamedQuery</code> request is received, the same response is returned and another query is not created. If a parameter has changed, for example, the <code>QueryString</code>, an error is returned.</p><important><p>This token is listed as not required because AWS SDKs (for example the AWS SDK for Java) auto-generate the token for users. If you are not using the AWS SDK or the AWS CLI, you must provide this token or the action will fail.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The database to which the query belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable database;

/**
 <p>The query description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The query name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The contents of the query with all query statements.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

/**
 <p>The name of the workgroup in which the named query is being created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workGroup;

@end

/**
 
 */
@interface AWSAthenaCreateNamedQueryOutput : AWSModel


/**
 <p>The unique ID of the query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namedQueryId;

@end

/**
 
 */
@interface AWSAthenaCreateWorkGroupInput : AWSRequest


/**
 <p>The configuration for the workgroup, which includes the location in Amazon S3 where query results are stored, the encryption configuration, if any, used for encrypting query results, whether the Amazon CloudWatch Metrics are enabled for the workgroup, the limit for the amount of bytes scanned (cutoff) per query, if it is specified, and whether workgroup's settings (specified with EnforceWorkGroupConfiguration) in the WorkGroupConfiguration override client-side settings. See <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.</p>
 */
@property (nonatomic, strong) AWSAthenaWorkGroupConfiguration * _Nullable configuration;

/**
 <p>The workgroup description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The workgroup name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of comma separated tags to add to the workgroup that is created.</p>
 */
@property (nonatomic, strong) NSArray<AWSAthenaTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAthenaCreateWorkGroupOutput : AWSModel


@end

/**
 <p>Contains information about a data catalog in an AWS account.</p>
 Required parameters: [Name, Type]
 */
@interface AWSAthenaDataCatalog : AWSModel


/**
 <p>An optional description of the data catalog.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the data catalog. The catalog name must be unique for the AWS account and can use a maximum of 128 alphanumeric, underscore, at sign, or hyphen characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Specifies the Lambda function or functions to use for the data catalog. This is a mapping whose values depend on the catalog type. </p><ul><li><p>For the <code>HIVE</code> data catalog type, use the following syntax. The <code>metadata-function</code> parameter is required. <code>The sdk-version</code> parameter is optional and defaults to the currently supported version.</p><p><code>metadata-function=<i>lambda_arn</i>, sdk-version=<i>version_number</i></code></p></li><li><p>For the <code>LAMBDA</code> data catalog type, use one of the following sets of required parameters, but not both.</p><ul><li><p>If you have one Lambda function that processes metadata and another for reading the actual data, use the following syntax. Both parameters are required.</p><p><code>metadata-function=<i>lambda_arn</i>, record-function=<i>lambda_arn</i></code></p></li><li><p> If you have a composite Lambda function that processes both metadata and data, use the following syntax to specify your Lambda function.</p><p><code>function=<i>lambda_arn</i></code></p></li></ul></li><li><p>The <code>GLUE</code> type has no parameters.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable parameters;

/**
 <p>The type of data catalog: <code>LAMBDA</code> for a federated catalog, <code>GLUE</code> for AWS Glue Catalog, or <code>HIVE</code> for an external hive metastore.</p>
 */
@property (nonatomic, assign) AWSAthenaDataCatalogType types;

@end

/**
 <p>The summary information for the data catalog, which includes its name and type.</p>
 */
@interface AWSAthenaDataCatalogSummary : AWSModel


/**
 <p>The name of the data catalog.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogName;

/**
 <p>The data catalog type.</p>
 */
@property (nonatomic, assign) AWSAthenaDataCatalogType types;

@end

/**
 <p>Contains metadata information for a database in a data catalog.</p>
 Required parameters: [Name]
 */
@interface AWSAthenaDatabase : AWSModel


/**
 <p>An optional description of the database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A set of custom key/value pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable parameters;

@end

/**
 <p>A piece of data (a field in the table).</p>
 */
@interface AWSAthenaDatum : AWSModel


/**
 <p>The value of the datum.</p>
 */
@property (nonatomic, strong) NSString * _Nullable varCharValue;

@end

/**
 
 */
@interface AWSAthenaDeleteDataCatalogInput : AWSRequest


/**
 <p>The name of the data catalog to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSAthenaDeleteDataCatalogOutput : AWSModel


@end

/**
 
 */
@interface AWSAthenaDeleteNamedQueryInput : AWSRequest


/**
 <p>The unique ID of the query to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namedQueryId;

@end

/**
 
 */
@interface AWSAthenaDeleteNamedQueryOutput : AWSModel


@end

/**
 
 */
@interface AWSAthenaDeleteWorkGroupInput : AWSRequest


/**
 <p>The option to delete the workgroup and its contents even if the workgroup contains any named queries.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recursiveDeleteOption;

/**
 <p>The unique name of the workgroup to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workGroup;

@end

/**
 
 */
@interface AWSAthenaDeleteWorkGroupOutput : AWSModel


@end

/**
 <p>If query results are encrypted in Amazon S3, indicates the encryption option used (for example, <code>SSE-KMS</code> or <code>CSE-KMS</code>) and key information.</p>
 Required parameters: [EncryptionOption]
 */
@interface AWSAthenaEncryptionConfiguration : AWSModel


/**
 <p>Indicates whether Amazon S3 server-side encryption with Amazon S3-managed keys (<code>SSE-S3</code>), server-side encryption with KMS-managed keys (<code>SSE-KMS</code>), or client-side encryption with KMS-managed keys (CSE-KMS) is used.</p><p>If a query runs in a workgroup and the workgroup overrides client-side settings, then the workgroup's setting for encryption is used. It specifies whether query results must be encrypted, for all queries that run in this workgroup. </p>
 */
@property (nonatomic, assign) AWSAthenaEncryptionOption encryptionOption;

/**
 <p>For <code>SSE-KMS</code> and <code>CSE-KMS</code>, this is the KMS key ARN or ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKey;

@end

/**
 
 */
@interface AWSAthenaGetDataCatalogInput : AWSRequest


/**
 <p>The name of the data catalog to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSAthenaGetDataCatalogOutput : AWSModel


/**
 <p>The data catalog returned.</p>
 */
@property (nonatomic, strong) AWSAthenaDataCatalog * _Nullable dataCatalog;

@end

/**
 
 */
@interface AWSAthenaGetDatabaseInput : AWSRequest


/**
 <p>The name of the data catalog that contains the database to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogName;

/**
 <p>The name of the database to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

@end

/**
 
 */
@interface AWSAthenaGetDatabaseOutput : AWSModel


/**
 <p>The database returned.</p>
 */
@property (nonatomic, strong) AWSAthenaDatabase * _Nullable database;

@end

/**
 
 */
@interface AWSAthenaGetNamedQueryInput : AWSRequest


/**
 <p>The unique ID of the query. Use <a>ListNamedQueries</a> to get query IDs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namedQueryId;

@end

/**
 
 */
@interface AWSAthenaGetNamedQueryOutput : AWSModel


/**
 <p>Information about the query.</p>
 */
@property (nonatomic, strong) AWSAthenaNamedQuery * _Nullable namedQuery;

@end

/**
 
 */
@interface AWSAthenaGetQueryExecutionInput : AWSRequest


/**
 <p>The unique ID of the query execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryExecutionId;

@end

/**
 
 */
@interface AWSAthenaGetQueryExecutionOutput : AWSModel


/**
 <p>Information about the query execution.</p>
 */
@property (nonatomic, strong) AWSAthenaQueryExecution * _Nullable queryExecution;

@end

/**
 
 */
@interface AWSAthenaGetQueryResultsInput : AWSRequest


/**
 <p>The maximum number of results (rows) to return in this request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token generated by the Athena service that specifies where to continue pagination if a previous request was truncated. To obtain the next set of pages, pass in the <code>NextToken</code> from the response object of the previous page call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The unique ID of the query execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryExecutionId;

@end

/**
 
 */
@interface AWSAthenaGetQueryResultsOutput : AWSModel


/**
 <p>A token generated by the Athena service that specifies where to continue pagination if a previous request was truncated. To obtain the next set of pages, pass in the <code>NextToken</code> from the response object of the previous page call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The results of the query execution.</p>
 */
@property (nonatomic, strong) AWSAthenaResultSet * _Nullable resultSet;

/**
 <p>The number of rows inserted with a CREATE TABLE AS SELECT statement. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable updateCount;

@end

/**
 
 */
@interface AWSAthenaGetTableMetadataInput : AWSRequest


/**
 <p>The name of the data catalog that contains the database and table metadata to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogName;

/**
 <p>The name of the database that contains the table metadata to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The name of the table for which metadata is returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSAthenaGetTableMetadataOutput : AWSModel


/**
 <p>An object that contains table metadata.</p>
 */
@property (nonatomic, strong) AWSAthenaTableMetadata * _Nullable tableMetadata;

@end

/**
 
 */
@interface AWSAthenaGetWorkGroupInput : AWSRequest


/**
 <p>The name of the workgroup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workGroup;

@end

/**
 
 */
@interface AWSAthenaGetWorkGroupOutput : AWSModel


/**
 <p>Information about the workgroup.</p>
 */
@property (nonatomic, strong) AWSAthenaWorkGroup * _Nullable workGroup;

@end

/**
 
 */
@interface AWSAthenaListDataCatalogsInput : AWSRequest


/**
 <p>Specifies the maximum number of data catalogs to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token generated by the Athena service that specifies where to continue pagination if a previous request was truncated. To obtain the next set of pages, pass in the NextToken from the response object of the previous page call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAthenaListDataCatalogsOutput : AWSModel


/**
 <p>A summary list of data catalogs.</p>
 */
@property (nonatomic, strong) NSArray<AWSAthenaDataCatalogSummary *> * _Nullable dataCatalogsSummary;

/**
 <p>A token generated by the Athena service that specifies where to continue pagination if a previous request was truncated. To obtain the next set of pages, pass in the NextToken from the response object of the previous page call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAthenaListDatabasesInput : AWSRequest


/**
 <p>The name of the data catalog that contains the databases to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogName;

/**
 <p>Specifies the maximum number of results to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token generated by the Athena service that specifies where to continue pagination if a previous request was truncated. To obtain the next set of pages, pass in the <code>NextToken</code> from the response object of the previous page call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAthenaListDatabasesOutput : AWSModel


/**
 <p>A list of databases from a data catalog.</p>
 */
@property (nonatomic, strong) NSArray<AWSAthenaDatabase *> * _Nullable databaseList;

/**
 <p>A token generated by the Athena service that specifies where to continue pagination if a previous request was truncated. To obtain the next set of pages, pass in the NextToken from the response object of the previous page call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAthenaListNamedQueriesInput : AWSRequest


/**
 <p>The maximum number of queries to return in this request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token generated by the Athena service that specifies where to continue pagination if a previous request was truncated. To obtain the next set of pages, pass in the <code>NextToken</code> from the response object of the previous page call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the workgroup from which the named queries are being returned. If a workgroup is not specified, the saved queries for the primary workgroup are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workGroup;

@end

/**
 
 */
@interface AWSAthenaListNamedQueriesOutput : AWSModel


/**
 <p>The list of unique query IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable namedQueryIds;

/**
 <p>A token generated by the Athena service that specifies where to continue pagination if a previous request was truncated. To obtain the next set of pages, pass in the <code>NextToken</code> from the response object of the previous page call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAthenaListQueryExecutionsInput : AWSRequest


/**
 <p>The maximum number of query executions to return in this request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token generated by the Athena service that specifies where to continue pagination if a previous request was truncated. To obtain the next set of pages, pass in the <code>NextToken</code> from the response object of the previous page call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the workgroup from which queries are being returned. If a workgroup is not specified, a list of available query execution IDs for the queries in the primary workgroup is returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workGroup;

@end

/**
 
 */
@interface AWSAthenaListQueryExecutionsOutput : AWSModel


/**
 <p>A token to be used by the next request if this request is truncated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The unique IDs of each query execution as an array of strings.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable queryExecutionIds;

@end

/**
 
 */
@interface AWSAthenaListTableMetadataInput : AWSRequest


/**
 <p>The name of the data catalog for which table metadata should be returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalogName;

/**
 <p>The name of the database for which table metadata should be returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>A regex filter that pattern-matches table names. If no expression is supplied, metadata for all tables are listed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expression;

/**
 <p>Specifies the maximum number of results to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token generated by the Athena service that specifies where to continue pagination if a previous request was truncated. To obtain the next set of pages, pass in the NextToken from the response object of the previous page call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAthenaListTableMetadataOutput : AWSModel


/**
 <p>A token generated by the Athena service that specifies where to continue pagination if a previous request was truncated. To obtain the next set of pages, pass in the NextToken from the response object of the previous page call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of table metadata.</p>
 */
@property (nonatomic, strong) NSArray<AWSAthenaTableMetadata *> * _Nullable tableMetadataList;

@end

/**
 
 */
@interface AWSAthenaListTagsForResourceInput : AWSRequest


/**
 <p>The maximum number of results to be returned per request that lists the tags for the resource.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results, or null if there are no additional results for this request, where the request lists the tags for the resource with the specified ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Lists the tags for the resource with the specified ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

@end

/**
 
 */
@interface AWSAthenaListTagsForResourceOutput : AWSModel


/**
 <p>A token to be used by the next request if this request is truncated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of tags associated with the specified resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSAthenaTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAthenaListWorkGroupsInput : AWSRequest


/**
 <p>The maximum number of workgroups to return in this request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token generated by the Athena service that specifies where to continue pagination if a previous request was truncated. To obtain the next set of pages, pass in the <code>NextToken</code> from the response object of the previous page call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAthenaListWorkGroupsOutput : AWSModel


/**
 <p>A token generated by the Athena service that specifies where to continue pagination if a previous request was truncated. To obtain the next set of pages, pass in the <code>NextToken</code> from the response object of the previous page call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of workgroups, including their names, descriptions, creation times, and states.</p>
 */
@property (nonatomic, strong) NSArray<AWSAthenaWorkGroupSummary *> * _Nullable workGroups;

@end

/**
 <p>A query, where <code>QueryString</code> is the list of SQL query statements that comprise the query.</p>
 Required parameters: [Name, Database, QueryString]
 */
@interface AWSAthenaNamedQuery : AWSModel


/**
 <p>The database to which the query belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable database;

/**
 <p>The query description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The query name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The unique identifier of the query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namedQueryId;

/**
 <p>The SQL query statements that comprise the query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

/**
 <p>The name of the workgroup that contains the named query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workGroup;

@end

/**
 <p>Information about a single instance of a query execution.</p>
 */
@interface AWSAthenaQueryExecution : AWSModel


/**
 <p>The SQL query statements which the query execution ran.</p>
 */
@property (nonatomic, strong) NSString * _Nullable query;

/**
 <p>The database in which the query execution occurred.</p>
 */
@property (nonatomic, strong) AWSAthenaQueryExecutionContext * _Nullable queryExecutionContext;

/**
 <p>The unique identifier for each query execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryExecutionId;

/**
 <p>The location in Amazon S3 where query results were stored and the encryption option, if any, used for query results. These are known as "client-side settings". If workgroup settings override client-side settings, then the query uses the location for the query results and the encryption configuration that are specified for the workgroup.</p>
 */
@property (nonatomic, strong) AWSAthenaResultConfiguration * _Nullable resultConfiguration;

/**
 <p>The type of query statement that was run. <code>DDL</code> indicates DDL query statements. <code>DML</code> indicates DML (Data Manipulation Language) query statements, such as <code>CREATE TABLE AS SELECT</code>. <code>UTILITY</code> indicates query statements other than DDL and DML, such as <code>SHOW CREATE TABLE</code>, or <code>DESCRIBE &lt;table&gt;</code>.</p>
 */
@property (nonatomic, assign) AWSAthenaStatementType statementType;

/**
 <p>Query execution statistics, such as the amount of data scanned, the amount of time that the query took to process, and the type of statement that was run.</p>
 */
@property (nonatomic, strong) AWSAthenaQueryExecutionStatistics * _Nullable statistics;

/**
 <p>The completion date, current state, submission time, and state change reason (if applicable) for the query execution.</p>
 */
@property (nonatomic, strong) AWSAthenaQueryExecutionStatus * _Nullable status;

/**
 <p>The name of the workgroup in which the query ran.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workGroup;

@end

/**
 <p>The database and data catalog context in which the query execution occurs.</p>
 */
@interface AWSAthenaQueryExecutionContext : AWSModel


/**
 <p>The name of the data catalog used in the query execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable catalog;

/**
 <p>The name of the database used in the query execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable database;

@end

/**
 <p>The amount of data scanned during the query execution and the amount of time that it took to execute, and the type of statement that was run.</p>
 */
@interface AWSAthenaQueryExecutionStatistics : AWSModel


/**
 <p>The location and file name of a data manifest file. The manifest file is saved to the Athena query results location in Amazon S3. The manifest file tracks files that the query wrote to Amazon S3. If the query fails, the manifest file also tracks files that the query intended to write. The manifest is useful for identifying orphaned files resulting from a failed query. For more information, see <a href="https://docs.aws.amazon.com/athena/latest/ug/querying.html">Working with Query Results, Output Files, and Query History</a> in the <i>Amazon Athena User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataManifestLocation;

/**
 <p>The number of bytes in the data that was queried.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dataScannedInBytes;

/**
 <p>The number of milliseconds that the query took to execute.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable engineExecutionTimeInMillis;

/**
 <p>The number of milliseconds that Athena took to plan the query processing flow. This includes the time spent retrieving table partitions from the data source. Note that because the query engine performs the query planning, query planning time is a subset of engine processing time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable queryPlanningTimeInMillis;

/**
 <p>The number of milliseconds that the query was in your query queue waiting for resources. Note that if transient errors occur, Athena might automatically add the query back to the queue.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable queryQueueTimeInMillis;

/**
 <p>The number of milliseconds that Athena took to finalize and publish the query results after the query engine finished running the query.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable serviceProcessingTimeInMillis;

/**
 <p>The number of milliseconds that Athena took to run the query.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalExecutionTimeInMillis;

@end

/**
 <p>The completion date, current state, submission time, and state change reason (if applicable) for the query execution.</p>
 */
@interface AWSAthenaQueryExecutionStatus : AWSModel


/**
 <p>The date and time that the query completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completionDateTime;

/**
 <p>The state of query execution. <code>QUEUED</code> indicates that the query has been submitted to the service, and Athena will execute the query as soon as resources are available. <code>RUNNING</code> indicates that the query is in execution phase. <code>SUCCEEDED</code> indicates that the query completed without errors. <code>FAILED</code> indicates that the query experienced an error and did not complete processing. <code>CANCELLED</code> indicates that a user input interrupted query execution.</p><note><p>Athena automatically retries your queries in cases of certain transient errors. As a result, you may see the query state transition from <code>RUNNING</code> or <code>FAILED</code> to <code>QUEUED</code>. </p></note>
 */
@property (nonatomic, assign) AWSAthenaQueryExecutionState state;

/**
 <p>Further detail about the status of the query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateChangeReason;

/**
 <p>The date and time that the query was submitted.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submissionDateTime;

@end

/**
 <p>The location in Amazon S3 where query results are stored and the encryption option, if any, used for query results. These are known as "client-side settings". If workgroup settings override client-side settings, then the query uses the workgroup settings.</p>
 */
@interface AWSAthenaResultConfiguration : AWSModel


/**
 <p>If query results are encrypted in Amazon S3, indicates the encryption option used (for example, <code>SSE-KMS</code> or <code>CSE-KMS</code>) and key information. This is a client-side setting. If workgroup settings override client-side settings, then the query uses the encryption configuration that is specified for the workgroup, and also uses the location for storing query results specified in the workgroup. See <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a> and <a href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup Settings Override Client-Side Settings</a>.</p>
 */
@property (nonatomic, strong) AWSAthenaEncryptionConfiguration * _Nullable encryptionConfiguration;

/**
 <p>The location in Amazon S3 where your query results are stored, such as <code>s3://path/to/query/bucket/</code>. To run the query, you must specify the query results location using one of the ways: either for individual queries using either this setting (client-side), or in the workgroup, using <a>WorkGroupConfiguration</a>. If none of them is set, Athena issues an error that no output location is provided. For more information, see <a href="https://docs.aws.amazon.com/athena/latest/ug/querying.html">Query Results</a>. If workgroup settings override client-side settings, then the query uses the settings specified for the workgroup. See <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputLocation;

@end

/**
 <p>The information about the updates in the query results, such as output location and encryption configuration for the query results.</p>
 */
@interface AWSAthenaResultConfigurationUpdates : AWSModel


/**
 <p>The encryption configuration for the query results.</p>
 */
@property (nonatomic, strong) AWSAthenaEncryptionConfiguration * _Nullable encryptionConfiguration;

/**
 <p>The location in Amazon S3 where your query results are stored, such as <code>s3://path/to/query/bucket/</code>. For more information, see <a href="https://docs.aws.amazon.com/athena/latest/ug/querying.html">Query Results</a> If workgroup settings override client-side settings, then the query uses the location for the query results and the encryption configuration that are specified for the workgroup. The "workgroup settings override" is specified in EnforceWorkGroupConfiguration (true/false) in the WorkGroupConfiguration. See <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputLocation;

/**
 <p>If set to "true", indicates that the previously-specified encryption configuration (also known as the client-side setting) for queries in this workgroup should be ignored and set to null. If set to "false" or not set, and a value is present in the EncryptionConfiguration in ResultConfigurationUpdates (the client-side setting), the EncryptionConfiguration in the workgroup's ResultConfiguration will be updated with the new value. For more information, see <a href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup Settings Override Client-Side Settings</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable removeEncryptionConfiguration;

/**
 <p>If set to "true", indicates that the previously-specified query results location (also known as a client-side setting) for queries in this workgroup should be ignored and set to null. If set to "false" or not set, and a value is present in the OutputLocation in ResultConfigurationUpdates (the client-side setting), the OutputLocation in the workgroup's ResultConfiguration will be updated with the new value. For more information, see <a href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup Settings Override Client-Side Settings</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable removeOutputLocation;

@end

/**
 <p>The metadata and rows that comprise a query result set. The metadata describes the column structure and data types. To return a <code>ResultSet</code> object, use <a>GetQueryResults</a>.</p>
 */
@interface AWSAthenaResultSet : AWSModel


/**
 <p>The metadata that describes the column structure and data types of a table of query results.</p>
 */
@property (nonatomic, strong) AWSAthenaResultSetMetadata * _Nullable resultSetMetadata;

/**
 <p>The rows in the table.</p>
 */
@property (nonatomic, strong) NSArray<AWSAthenaRow *> * _Nullable rows;

@end

/**
 <p>The metadata that describes the column structure and data types of a table of query results. To return a <code>ResultSetMetadata</code> object, use <a>GetQueryResults</a>.</p>
 */
@interface AWSAthenaResultSetMetadata : AWSModel


/**
 <p>Information about the columns returned in a query result metadata.</p>
 */
@property (nonatomic, strong) NSArray<AWSAthenaColumnInfo *> * _Nullable columnInfo;

@end

/**
 <p>The rows that comprise a query result table.</p>
 */
@interface AWSAthenaRow : AWSModel


/**
 <p>The data that populates a row in a query result table.</p>
 */
@property (nonatomic, strong) NSArray<AWSAthenaDatum *> * _Nullable data;

@end

/**
 
 */
@interface AWSAthenaStartQueryExecutionInput : AWSRequest


/**
 <p>A unique case-sensitive string used to ensure the request to create the query is idempotent (executes only once). If another <code>StartQueryExecution</code> request is received, the same response is returned and another query is not created. If a parameter has changed, for example, the <code>QueryString</code>, an error is returned.</p><important><p>This token is listed as not required because AWS SDKs (for example the AWS SDK for Java) auto-generate the token for users. If you are not using the AWS SDK or the AWS CLI, you must provide this token or the action will fail.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The database within which the query executes.</p>
 */
@property (nonatomic, strong) AWSAthenaQueryExecutionContext * _Nullable queryExecutionContext;

/**
 <p>The SQL query statements to be executed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

/**
 <p>Specifies information about where and how to save the results of the query execution. If the query runs in a workgroup, then workgroup's settings may override query settings. This affects the query results location. The workgroup settings override is specified in EnforceWorkGroupConfiguration (true/false) in the WorkGroupConfiguration. See <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.</p>
 */
@property (nonatomic, strong) AWSAthenaResultConfiguration * _Nullable resultConfiguration;

/**
 <p>The name of the workgroup in which the query is being started.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workGroup;

@end

/**
 
 */
@interface AWSAthenaStartQueryExecutionOutput : AWSModel


/**
 <p>The unique ID of the query that ran as a result of this request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryExecutionId;

@end

/**
 
 */
@interface AWSAthenaStopQueryExecutionInput : AWSRequest


/**
 <p>The unique ID of the query execution to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryExecutionId;

@end

/**
 
 */
@interface AWSAthenaStopQueryExecutionOutput : AWSModel


@end

/**
 <p>Contains metadata for a table.</p>
 Required parameters: [Name]
 */
@interface AWSAthenaTableMetadata : AWSModel


/**
 <p>A list of the columns in the table.</p>
 */
@property (nonatomic, strong) NSArray<AWSAthenaColumn *> * _Nullable columns;

/**
 <p>The time that the table was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The last time the table was accessed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastAccessTime;

/**
 <p>The name of the table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A set of custom key/value pairs for table properties.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable parameters;

/**
 <p>A list of the partition keys in the table.</p>
 */
@property (nonatomic, strong) NSArray<AWSAthenaColumn *> * _Nullable partitionKeys;

/**
 <p>The type of table. In Athena, only <code>EXTERNAL_TABLE</code> is supported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableType;

@end

/**
 <p>A label that you assign to a resource. In Athena, a resource can be a workgroup or data catalog. Each tag consists of a key and an optional value, both of which you define. For example, you can use tags to categorize Athena workgroups or data catalogs by purpose, owner, or environment. Use a consistent set of tag keys to make it easier to search and filter workgroups or data catalogs in your account. For best practices, see <a href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">Tagging Best Practices</a>. Tag keys can be from 1 to 128 UTF-8 Unicode characters, and tag values can be from 0 to 256 UTF-8 Unicode characters. Tags can use letters and numbers representable in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case-sensitive. Tag keys must be unique per resource. If you specify more than one tag, separate them by commas. </p>
 */
@interface AWSAthenaTag : AWSModel


/**
 <p>A tag key. The tag key length is from 1 to 128 Unicode characters in UTF-8. You can use letters and numbers representable in UTF-8, and the following characters: + - = . _ : / @. Tag keys are case-sensitive and must be unique per resource. </p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>A tag value. The tag value length is from 0 to 256 Unicode characters in UTF-8. You can use letters and numbers representable in UTF-8, and the following characters: + - = . _ : / @. Tag values are case-sensitive. </p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSAthenaTagResourceInput : AWSRequest


/**
 <p>Specifies the ARN of the Athena resource (workgroup or data catalog) to which tags are to be added.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p>A collection of one or more tags, separated by commas, to be added to an Athena workgroup or data catalog resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSAthenaTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAthenaTagResourceOutput : AWSModel


@end

/**
 <p>Information about a named query ID that could not be processed.</p>
 */
@interface AWSAthenaUnprocessedNamedQueryId : AWSModel


/**
 <p>The error code returned when the processing request for the named query failed, if applicable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>The error message returned when the processing request for the named query failed, if applicable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The unique identifier of the named query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namedQueryId;

@end

/**
 <p>Describes a query execution that failed to process.</p>
 */
@interface AWSAthenaUnprocessedQueryExecutionId : AWSModel


/**
 <p>The error code returned when the query execution failed to process, if applicable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>The error message returned when the query execution failed to process, if applicable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The unique identifier of the query execution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryExecutionId;

@end

/**
 
 */
@interface AWSAthenaUntagResourceInput : AWSRequest


/**
 <p>Specifies the ARN of the resource from which tags are to be removed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p>A comma-separated list of one or more tag keys whose tags are to be removed from the specified resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSAthenaUntagResourceOutput : AWSModel


@end

/**
 
 */
@interface AWSAthenaUpdateDataCatalogInput : AWSRequest


/**
 <p>New or modified text that describes the data catalog.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the data catalog to update. The catalog name must be unique for the AWS account and can use a maximum of 128 alphanumeric, underscore, at sign, or hyphen characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Specifies the Lambda function or functions to use for updating the data catalog. This is a mapping whose values depend on the catalog type. </p><ul><li><p>For the <code>HIVE</code> data catalog type, use the following syntax. The <code>metadata-function</code> parameter is required. <code>The sdk-version</code> parameter is optional and defaults to the currently supported version.</p><p><code>metadata-function=<i>lambda_arn</i>, sdk-version=<i>version_number</i></code></p></li><li><p>For the <code>LAMBDA</code> data catalog type, use one of the following sets of required parameters, but not both.</p><ul><li><p>If you have one Lambda function that processes metadata and another for reading the actual data, use the following syntax. Both parameters are required.</p><p><code>metadata-function=<i>lambda_arn</i>, record-function=<i>lambda_arn</i></code></p></li><li><p> If you have a composite Lambda function that processes both metadata and data, use the following syntax to specify your Lambda function.</p><p><code>function=<i>lambda_arn</i></code></p></li></ul></li><li><p>The <code>GLUE</code> type has no parameters.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable parameters;

/**
 <p>Specifies the type of data catalog to update. Specify <code>LAMBDA</code> for a federated catalog, <code>GLUE</code> for AWS Glue Catalog, or <code>HIVE</code> for an external hive metastore.</p>
 */
@property (nonatomic, assign) AWSAthenaDataCatalogType types;

@end

/**
 
 */
@interface AWSAthenaUpdateDataCatalogOutput : AWSModel


@end

/**
 
 */
@interface AWSAthenaUpdateWorkGroupInput : AWSRequest


/**
 <p>The workgroup configuration that will be updated for the given workgroup.</p>
 */
@property (nonatomic, strong) AWSAthenaWorkGroupConfigurationUpdates * _Nullable configurationUpdates;

/**
 <p>The workgroup description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The workgroup state that will be updated for the given workgroup.</p>
 */
@property (nonatomic, assign) AWSAthenaWorkGroupState state;

/**
 <p>The specified workgroup that will be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workGroup;

@end

/**
 
 */
@interface AWSAthenaUpdateWorkGroupOutput : AWSModel


@end

/**
 <p>A workgroup, which contains a name, description, creation time, state, and other configuration, listed under <a>WorkGroup$Configuration</a>. Each workgroup enables you to isolate queries for you or your group of users from other queries in the same account, to configure the query results location and the encryption configuration (known as workgroup settings), to enable sending query metrics to Amazon CloudWatch, and to establish per-query data usage control limits for all queries in a workgroup. The workgroup settings override is specified in EnforceWorkGroupConfiguration (true/false) in the WorkGroupConfiguration. See <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.</p>
 Required parameters: [Name]
 */
@interface AWSAthenaWorkGroup : AWSModel


/**
 <p>The configuration of the workgroup, which includes the location in Amazon S3 where query results are stored, the encryption configuration, if any, used for query results; whether the Amazon CloudWatch Metrics are enabled for the workgroup; whether workgroup settings override client-side settings; and the data usage limits for the amount of data scanned per query or per workgroup. The workgroup settings override is specified in EnforceWorkGroupConfiguration (true/false) in the WorkGroupConfiguration. See <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>.</p>
 */
@property (nonatomic, strong) AWSAthenaWorkGroupConfiguration * _Nullable configuration;

/**
 <p>The date and time the workgroup was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The workgroup description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The workgroup name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The state of the workgroup: ENABLED or DISABLED.</p>
 */
@property (nonatomic, assign) AWSAthenaWorkGroupState state;

@end

/**
 <p>The configuration of the workgroup, which includes the location in Amazon S3 where query results are stored, the encryption option, if any, used for query results, whether the Amazon CloudWatch Metrics are enabled for the workgroup and whether workgroup settings override query settings, and the data usage limits for the amount of data scanned per query or per workgroup. The workgroup settings override is specified in EnforceWorkGroupConfiguration (true/false) in the WorkGroupConfiguration. See <a>WorkGroupConfiguration$EnforceWorkGroupConfiguration</a>. </p>
 */
@interface AWSAthenaWorkGroupConfiguration : AWSModel


/**
 <p>The upper data usage limit (cutoff) for the amount of bytes a single query in a workgroup is allowed to scan.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bytesScannedCutoffPerQuery;

/**
 <p>If set to "true", the settings for the workgroup override client-side settings. If set to "false", client-side settings are used. For more information, see <a href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup Settings Override Client-Side Settings</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enforceWorkGroupConfiguration;

/**
 <p>Indicates that the Amazon CloudWatch metrics are enabled for the workgroup.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publishCloudWatchMetricsEnabled;

/**
 <p>If set to <code>true</code>, allows members assigned to a workgroup to reference Amazon S3 Requester Pays buckets in queries. If set to <code>false</code>, workgroup members cannot query data from Requester Pays buckets, and queries that retrieve data from Requester Pays buckets cause an error. The default is <code>false</code>. For more information about Requester Pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html">Requester Pays Buckets</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requesterPaysEnabled;

/**
 <p>The configuration for the workgroup, which includes the location in Amazon S3 where query results are stored and the encryption option, if any, used for query results. To run the query, you must specify the query results location using one of the ways: either in the workgroup using this setting, or for individual queries (client-side), using <a>ResultConfiguration$OutputLocation</a>. If none of them is set, Athena issues an error that no output location is provided. For more information, see <a href="https://docs.aws.amazon.com/athena/latest/ug/querying.html">Query Results</a>.</p>
 */
@property (nonatomic, strong) AWSAthenaResultConfiguration * _Nullable resultConfiguration;

@end

/**
 <p>The configuration information that will be updated for this workgroup, which includes the location in Amazon S3 where query results are stored, the encryption option, if any, used for query results, whether the Amazon CloudWatch Metrics are enabled for the workgroup, whether the workgroup settings override the client-side settings, and the data usage limit for the amount of bytes scanned per query, if it is specified.</p>
 */
@interface AWSAthenaWorkGroupConfigurationUpdates : AWSModel


/**
 <p>The upper limit (cutoff) for the amount of bytes a single query in a workgroup is allowed to scan.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bytesScannedCutoffPerQuery;

/**
 <p>If set to "true", the settings for the workgroup override client-side settings. If set to "false" client-side settings are used. For more information, see <a href="https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html">Workgroup Settings Override Client-Side Settings</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enforceWorkGroupConfiguration;

/**
 <p>Indicates whether this workgroup enables publishing metrics to Amazon CloudWatch.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publishCloudWatchMetricsEnabled;

/**
 <p>Indicates that the data usage control limit per query is removed. <a>WorkGroupConfiguration$BytesScannedCutoffPerQuery</a></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable removeBytesScannedCutoffPerQuery;

/**
 <p>If set to <code>true</code>, allows members assigned to a workgroup to specify Amazon S3 Requester Pays buckets in queries. If set to <code>false</code>, workgroup members cannot query data from Requester Pays buckets, and queries that retrieve data from Requester Pays buckets cause an error. The default is <code>false</code>. For more information about Requester Pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html">Requester Pays Buckets</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requesterPaysEnabled;

/**
 <p>The result configuration information about the queries in this workgroup that will be updated. Includes the updated results location and an updated option for encrypting query results.</p>
 */
@property (nonatomic, strong) AWSAthenaResultConfigurationUpdates * _Nullable resultConfigurationUpdates;

@end

/**
 <p>The summary information for the workgroup, which includes its name, state, description, and the date and time it was created.</p>
 */
@interface AWSAthenaWorkGroupSummary : AWSModel


/**
 <p>The workgroup creation date and time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The workgroup description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the workgroup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The state of the workgroup.</p>
 */
@property (nonatomic, assign) AWSAthenaWorkGroupState state;

@end

NS_ASSUME_NONNULL_END
