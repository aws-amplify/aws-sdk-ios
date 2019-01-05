//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

FOUNDATION_EXPORT NSString *const AWSMachineLearningErrorDomain;

typedef NS_ENUM(NSInteger, AWSMachineLearningErrorType) {
    AWSMachineLearningErrorUnknown,
    AWSMachineLearningErrorIdempotentParameterMismatch,
    AWSMachineLearningErrorInternalServer,
    AWSMachineLearningErrorInvalidInput,
    AWSMachineLearningErrorInvalidTag,
    AWSMachineLearningErrorLimitExceeded,
    AWSMachineLearningErrorPredictorNotMounted,
    AWSMachineLearningErrorResourceNotFound,
    AWSMachineLearningErrorTagLimitExceeded,
};

typedef NS_ENUM(NSInteger, AWSMachineLearningAlgorithm) {
    AWSMachineLearningAlgorithmUnknown,
    AWSMachineLearningAlgorithmSgd,
};

typedef NS_ENUM(NSInteger, AWSMachineLearningBatchPredictionFilterVariable) {
    AWSMachineLearningBatchPredictionFilterVariableUnknown,
    AWSMachineLearningBatchPredictionFilterVariableCreatedAt,
    AWSMachineLearningBatchPredictionFilterVariableLastUpdatedAt,
    AWSMachineLearningBatchPredictionFilterVariableStatus,
    AWSMachineLearningBatchPredictionFilterVariableName,
    AWSMachineLearningBatchPredictionFilterVariableIAMUser,
    AWSMachineLearningBatchPredictionFilterVariableMLModelId,
    AWSMachineLearningBatchPredictionFilterVariableDataSourceId,
    AWSMachineLearningBatchPredictionFilterVariableDataURI,
};

typedef NS_ENUM(NSInteger, AWSMachineLearningDataSourceFilterVariable) {
    AWSMachineLearningDataSourceFilterVariableUnknown,
    AWSMachineLearningDataSourceFilterVariableCreatedAt,
    AWSMachineLearningDataSourceFilterVariableLastUpdatedAt,
    AWSMachineLearningDataSourceFilterVariableStatus,
    AWSMachineLearningDataSourceFilterVariableName,
    AWSMachineLearningDataSourceFilterVariableDataLocationS3,
    AWSMachineLearningDataSourceFilterVariableIAMUser,
};

typedef NS_ENUM(NSInteger, AWSMachineLearningDetailsAttributes) {
    AWSMachineLearningDetailsAttributesUnknown,
    AWSMachineLearningDetailsAttributesPredictiveModelType,
    AWSMachineLearningDetailsAttributesAlgorithm,
};

typedef NS_ENUM(NSInteger, AWSMachineLearningEntityStatus) {
    AWSMachineLearningEntityStatusUnknown,
    AWSMachineLearningEntityStatusPending,
    AWSMachineLearningEntityStatusInprogress,
    AWSMachineLearningEntityStatusFailed,
    AWSMachineLearningEntityStatusCompleted,
    AWSMachineLearningEntityStatusDeleted,
};

typedef NS_ENUM(NSInteger, AWSMachineLearningEvaluationFilterVariable) {
    AWSMachineLearningEvaluationFilterVariableUnknown,
    AWSMachineLearningEvaluationFilterVariableCreatedAt,
    AWSMachineLearningEvaluationFilterVariableLastUpdatedAt,
    AWSMachineLearningEvaluationFilterVariableStatus,
    AWSMachineLearningEvaluationFilterVariableName,
    AWSMachineLearningEvaluationFilterVariableIAMUser,
    AWSMachineLearningEvaluationFilterVariableMLModelId,
    AWSMachineLearningEvaluationFilterVariableDataSourceId,
    AWSMachineLearningEvaluationFilterVariableDataURI,
};

typedef NS_ENUM(NSInteger, AWSMachineLearningMLModelFilterVariable) {
    AWSMachineLearningMLModelFilterVariableUnknown,
    AWSMachineLearningMLModelFilterVariableCreatedAt,
    AWSMachineLearningMLModelFilterVariableLastUpdatedAt,
    AWSMachineLearningMLModelFilterVariableStatus,
    AWSMachineLearningMLModelFilterVariableName,
    AWSMachineLearningMLModelFilterVariableIAMUser,
    AWSMachineLearningMLModelFilterVariableTrainingDataSourceId,
    AWSMachineLearningMLModelFilterVariableRealtimeEndpointStatus,
    AWSMachineLearningMLModelFilterVariableMLModelType,
    AWSMachineLearningMLModelFilterVariableAlgorithm,
    AWSMachineLearningMLModelFilterVariableTrainingDataURI,
};

typedef NS_ENUM(NSInteger, AWSMachineLearningMLModelType) {
    AWSMachineLearningMLModelTypeUnknown,
    AWSMachineLearningMLModelTypeRegression,
    AWSMachineLearningMLModelTypeBinary,
    AWSMachineLearningMLModelTypeMulticlass,
};

typedef NS_ENUM(NSInteger, AWSMachineLearningRealtimeEndpointStatus) {
    AWSMachineLearningRealtimeEndpointStatusUnknown,
    AWSMachineLearningRealtimeEndpointStatusNone,
    AWSMachineLearningRealtimeEndpointStatusReady,
    AWSMachineLearningRealtimeEndpointStatusUpdating,
    AWSMachineLearningRealtimeEndpointStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSMachineLearningSortOrder) {
    AWSMachineLearningSortOrderUnknown,
    AWSMachineLearningSortOrderAsc,
    AWSMachineLearningSortOrderDsc,
};

typedef NS_ENUM(NSInteger, AWSMachineLearningTaggableResourceType) {
    AWSMachineLearningTaggableResourceTypeUnknown,
    AWSMachineLearningTaggableResourceTypeBatchPrediction,
    AWSMachineLearningTaggableResourceTypeDataSource,
    AWSMachineLearningTaggableResourceTypeEvaluation,
    AWSMachineLearningTaggableResourceTypeMLModel,
};

@class AWSMachineLearningAddTagsInput;
@class AWSMachineLearningAddTagsOutput;
@class AWSMachineLearningBatchPrediction;
@class AWSMachineLearningCreateBatchPredictionInput;
@class AWSMachineLearningCreateBatchPredictionOutput;
@class AWSMachineLearningCreateDataSourceFromRDSInput;
@class AWSMachineLearningCreateDataSourceFromRDSOutput;
@class AWSMachineLearningCreateDataSourceFromRedshiftInput;
@class AWSMachineLearningCreateDataSourceFromRedshiftOutput;
@class AWSMachineLearningCreateDataSourceFromS3Input;
@class AWSMachineLearningCreateDataSourceFromS3Output;
@class AWSMachineLearningCreateEvaluationInput;
@class AWSMachineLearningCreateEvaluationOutput;
@class AWSMachineLearningCreateMLModelInput;
@class AWSMachineLearningCreateMLModelOutput;
@class AWSMachineLearningCreateRealtimeEndpointInput;
@class AWSMachineLearningCreateRealtimeEndpointOutput;
@class AWSMachineLearningDataSource;
@class AWSMachineLearningDeleteBatchPredictionInput;
@class AWSMachineLearningDeleteBatchPredictionOutput;
@class AWSMachineLearningDeleteDataSourceInput;
@class AWSMachineLearningDeleteDataSourceOutput;
@class AWSMachineLearningDeleteEvaluationInput;
@class AWSMachineLearningDeleteEvaluationOutput;
@class AWSMachineLearningDeleteMLModelInput;
@class AWSMachineLearningDeleteMLModelOutput;
@class AWSMachineLearningDeleteRealtimeEndpointInput;
@class AWSMachineLearningDeleteRealtimeEndpointOutput;
@class AWSMachineLearningDeleteTagsInput;
@class AWSMachineLearningDeleteTagsOutput;
@class AWSMachineLearningDescribeBatchPredictionsInput;
@class AWSMachineLearningDescribeBatchPredictionsOutput;
@class AWSMachineLearningDescribeDataSourcesInput;
@class AWSMachineLearningDescribeDataSourcesOutput;
@class AWSMachineLearningDescribeEvaluationsInput;
@class AWSMachineLearningDescribeEvaluationsOutput;
@class AWSMachineLearningDescribeMLModelsInput;
@class AWSMachineLearningDescribeMLModelsOutput;
@class AWSMachineLearningDescribeTagsInput;
@class AWSMachineLearningDescribeTagsOutput;
@class AWSMachineLearningEvaluation;
@class AWSMachineLearningGetBatchPredictionInput;
@class AWSMachineLearningGetBatchPredictionOutput;
@class AWSMachineLearningGetDataSourceInput;
@class AWSMachineLearningGetDataSourceOutput;
@class AWSMachineLearningGetEvaluationInput;
@class AWSMachineLearningGetEvaluationOutput;
@class AWSMachineLearningGetMLModelInput;
@class AWSMachineLearningGetMLModelOutput;
@class AWSMachineLearningMLModel;
@class AWSMachineLearningPerformanceMetrics;
@class AWSMachineLearningPredictInput;
@class AWSMachineLearningPredictOutput;
@class AWSMachineLearningPrediction;
@class AWSMachineLearningRDSDataSpec;
@class AWSMachineLearningRDSDatabase;
@class AWSMachineLearningRDSDatabaseCredentials;
@class AWSMachineLearningRDSMetadata;
@class AWSMachineLearningRealtimeEndpointInfo;
@class AWSMachineLearningRedshiftDataSpec;
@class AWSMachineLearningRedshiftDatabase;
@class AWSMachineLearningRedshiftDatabaseCredentials;
@class AWSMachineLearningRedshiftMetadata;
@class AWSMachineLearningS3DataSpec;
@class AWSMachineLearningTag;
@class AWSMachineLearningUpdateBatchPredictionInput;
@class AWSMachineLearningUpdateBatchPredictionOutput;
@class AWSMachineLearningUpdateDataSourceInput;
@class AWSMachineLearningUpdateDataSourceOutput;
@class AWSMachineLearningUpdateEvaluationInput;
@class AWSMachineLearningUpdateEvaluationOutput;
@class AWSMachineLearningUpdateMLModelInput;
@class AWSMachineLearningUpdateMLModelOutput;

/**
 
 */
@interface AWSMachineLearningAddTagsInput : AWSRequest


/**
 <p>The ID of the ML object to tag. For example, <code>exampleModelId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The type of the ML object to tag. </p>
 */
@property (nonatomic, assign) AWSMachineLearningTaggableResourceType resourceType;

/**
 <p>The key-value pairs to use to create tags. If you specify a key without specifying a value, Amazon ML creates a tag with the specified key and a value of null.</p>
 */
@property (nonatomic, strong) NSArray<AWSMachineLearningTag *> * _Nullable tags;

@end

/**
 <p>Amazon ML returns the following elements. </p>
 */
@interface AWSMachineLearningAddTagsOutput : AWSModel


/**
 <p>The ID of the ML object that was tagged.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The type of the ML object that was tagged.</p>
 */
@property (nonatomic, assign) AWSMachineLearningTaggableResourceType resourceType;

@end

/**
 <p> Represents the output of a <code>GetBatchPrediction</code> operation.</p><p> The content consists of the detailed metadata, the status, and the data file information of a <code>Batch Prediction</code>.</p>
 */
@interface AWSMachineLearningBatchPrediction : AWSModel


/**
 <p>The ID of the <code>DataSource</code> that points to the group of observations to predict.</p>
 */
@property (nonatomic, strong) NSString * _Nullable batchPredictionDataSourceId;

/**
 <p>The ID assigned to the <code>BatchPrediction</code> at creation. This value should be identical to the value of the <code>BatchPredictionID</code> in the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable batchPredictionId;

/**
 <p>Long integer type that is a 64-bit signed number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable computeTime;

/**
 <p>The time that the <code>BatchPrediction</code> was created. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The AWS user account that invoked the <code>BatchPrediction</code>. The account type can be either an AWS root account or an AWS Identity and Access Management (IAM) user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdByIamUser;

/**
 <p>A timestamp represented in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable finishedAt;

/**
 <p>The location of the data file or directory in Amazon Simple Storage Service (Amazon S3).</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputDataLocationS3;

/**
 <p>Long integer type that is a 64-bit signed number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable invalidRecordCount;

/**
 <p>The time of the most recent edit to the <code>BatchPrediction</code>. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The ID of the <code>MLModel</code> that generated predictions for the <code>BatchPrediction</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

/**
 <p>A description of the most recent details about processing the batch prediction request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>A user-supplied name or description of the <code>BatchPrediction</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The location of an Amazon S3 bucket or directory to receive the operation results. The following substrings are not allowed in the <code>s3 key</code> portion of the <code>outputURI</code> field: ':', '//', '/./', '/../'.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputUri;

/**
 <p>A timestamp represented in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedAt;

/**
 <p>The status of the <code>BatchPrediction</code>. This element can have one of the following values:</p><ul><li><code>PENDING</code> - Amazon Machine Learning (Amazon ML) submitted a request to generate predictions for a batch of observations.</li><li><code>INPROGRESS</code> - The process is underway.</li><li><code>FAILED</code> - The request to perform a batch prediction did not run to completion. It is not usable.</li><li><code>COMPLETED</code> - The batch prediction process completed successfully.</li><li><code>DELETED</code> - The <code>BatchPrediction</code> is marked as deleted. It is not usable.</li></ul>
 */
@property (nonatomic, assign) AWSMachineLearningEntityStatus status;

/**
 <p>Long integer type that is a 64-bit signed number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalRecordCount;

@end

/**
 
 */
@interface AWSMachineLearningCreateBatchPredictionInput : AWSRequest


/**
 <p>The ID of the <code>DataSource</code> that points to the group of observations to predict.</p>
 */
@property (nonatomic, strong) NSString * _Nullable batchPredictionDataSourceId;

/**
 <p>A user-supplied ID that uniquely identifies the <code>BatchPrediction</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable batchPredictionId;

/**
 <p>A user-supplied name or description of the <code>BatchPrediction</code>. <code>BatchPredictionName</code> can only use the UTF-8 character set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable batchPredictionName;

/**
 <p>The ID of the <code>MLModel</code> that will generate predictions for the group of observations. </p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

/**
 <p>The location of an Amazon Simple Storage Service (Amazon S3) bucket or directory to store the batch prediction results. The following substrings are not allowed in the <code>s3 key</code> portion of the <code>outputURI</code> field: ':', '//', '/./', '/../'.</p><p>Amazon ML needs permissions to store and retrieve the logs on your behalf. For information about how to set permissions, see the <a href="http://docs.aws.amazon.com/machine-learning/latest/dg">Amazon Machine Learning Developer Guide</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputUri;

@end

/**
 <p> Represents the output of a <code>CreateBatchPrediction</code> operation, and is an acknowledgement that Amazon ML received the request.</p><p>The <code>CreateBatchPrediction</code> operation is asynchronous. You can poll for status updates by using the <code>&gt;GetBatchPrediction</code> operation and checking the <code>Status</code> parameter of the result. </p>
 */
@interface AWSMachineLearningCreateBatchPredictionOutput : AWSModel


/**
 <p>A user-supplied ID that uniquely identifies the <code>BatchPrediction</code>. This value is identical to the value of the <code>BatchPredictionId</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable batchPredictionId;

@end

/**
 
 */
@interface AWSMachineLearningCreateDataSourceFromRDSInput : AWSRequest


/**
 <p>The compute statistics for a <code>DataSource</code>. The statistics are generated from the observation data referenced by a <code>DataSource</code>. Amazon ML uses the statistics internally during <code>MLModel</code> training. This parameter must be set to <code>true</code> if the <code></code>DataSource<code></code> needs to be used for <code>MLModel</code> training. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable computeStatistics;

/**
 <p>A user-supplied ID that uniquely identifies the <code>DataSource</code>. Typically, an Amazon Resource Number (ARN) becomes the ID for a <code>DataSource</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

/**
 <p>A user-supplied name or description of the <code>DataSource</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceName;

/**
 <p>The data specification of an Amazon RDS <code>DataSource</code>:</p><ul><li><p>DatabaseInformation - <ul><li><code>DatabaseName</code> - The name of the Amazon RDS database.</li><li><code>InstanceIdentifier </code> - A unique identifier for the Amazon RDS database instance.</li></ul></p></li><li><p>DatabaseCredentials - AWS Identity and Access Management (IAM) credentials that are used to connect to the Amazon RDS database.</p></li><li><p>ResourceRole - A role (DataPipelineDefaultResourceRole) assumed by an EC2 instance to carry out the copy task from Amazon RDS to Amazon Simple Storage Service (Amazon S3). For more information, see <a href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html">Role templates</a> for data pipelines.</p></li><li><p>ServiceRole - A role (DataPipelineDefaultRole) assumed by the AWS Data Pipeline service to monitor the progress of the copy task from Amazon RDS to Amazon S3. For more information, see <a href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html">Role templates</a> for data pipelines.</p></li><li><p>SecurityInfo - The security information to use to access an RDS DB instance. You need to set up appropriate ingress rules for the security entity IDs provided to allow access to the Amazon RDS instance. Specify a [<code>SubnetId</code>, <code>SecurityGroupIds</code>] pair for a VPC-based RDS DB instance.</p></li><li><p>SelectSqlQuery - A query that is used to retrieve the observation data for the <code>Datasource</code>.</p></li><li><p>S3StagingLocation - The Amazon S3 location for staging Amazon RDS data. The data retrieved from Amazon RDS using <code>SelectSqlQuery</code> is stored in this location.</p></li><li><p>DataSchemaUri - The Amazon S3 location of the <code>DataSchema</code>.</p></li><li><p>DataSchema - A JSON string representing the schema. This is not required if <code>DataSchemaUri</code> is specified. </p></li><li><p>DataRearrangement - A JSON string that represents the splitting and rearrangement requirements for the <code>Datasource</code>. </p><br><p> Sample - <code> "{\"splitting\":{\"percentBegin\":10,\"percentEnd\":60}}"</code></p></li></ul>
 */
@property (nonatomic, strong) AWSMachineLearningRDSDataSpec * _Nullable RDSData;

/**
 <p>The role that Amazon ML assumes on behalf of the user to create and activate a data pipeline in the user's account and copy data using the <code>SelectSqlQuery</code> query from Amazon RDS to Amazon S3.</p><p></p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

@end

/**
 <p> Represents the output of a <code>CreateDataSourceFromRDS</code> operation, and is an acknowledgement that Amazon ML received the request.</p><p>The <code>CreateDataSourceFromRDS</code>&gt; operation is asynchronous. You can poll for updates by using the <code>GetBatchPrediction</code> operation and checking the <code>Status</code> parameter. You can inspect the <code>Message</code> when <code>Status</code> shows up as <code>FAILED</code>. You can also check the progress of the copy operation by going to the <code>DataPipeline</code> console and looking up the pipeline using the <code>pipelineId </code> from the describe call.</p>
 */
@interface AWSMachineLearningCreateDataSourceFromRDSOutput : AWSModel


/**
 <p>A user-supplied ID that uniquely identifies the datasource. This value should be identical to the value of the <code>DataSourceID</code> in the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

@end

/**
 
 */
@interface AWSMachineLearningCreateDataSourceFromRedshiftInput : AWSRequest


/**
 <p>The compute statistics for a <code>DataSource</code>. The statistics are generated from the observation data referenced by a <code>DataSource</code>. Amazon ML uses the statistics internally during <code>MLModel</code> training. This parameter must be set to <code>true</code> if the <code>DataSource</code> needs to be used for <code>MLModel</code> training.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable computeStatistics;

/**
 <p>A user-supplied ID that uniquely identifies the <code>DataSource</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

/**
 <p>A user-supplied name or description of the <code>DataSource</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceName;

/**
 <p>The data specification of an Amazon Redshift <code>DataSource</code>:</p><ul><li><p>DatabaseInformation - <ul><li><code>DatabaseName</code> - The name of the Amazon Redshift database. </li><li><code> ClusterIdentifier</code> - The unique ID for the Amazon Redshift cluster.</li></ul></p></li><li><p>DatabaseCredentials - The AWS Identity and Access Management (IAM) credentials that are used to connect to the Amazon Redshift database.</p></li><li><p>SelectSqlQuery - The query that is used to retrieve the observation data for the <code>Datasource</code>.</p></li><li><p>S3StagingLocation - The Amazon Simple Storage Service (Amazon S3) location for staging Amazon Redshift data. The data retrieved from Amazon Redshift using the <code>SelectSqlQuery</code> query is stored in this location.</p></li><li><p>DataSchemaUri - The Amazon S3 location of the <code>DataSchema</code>.</p></li><li><p>DataSchema - A JSON string representing the schema. This is not required if <code>DataSchemaUri</code> is specified. </p></li><li><p>DataRearrangement - A JSON string that represents the splitting and rearrangement requirements for the <code>DataSource</code>.</p><p> Sample - <code> "{\"splitting\":{\"percentBegin\":10,\"percentEnd\":60}}"</code></p></li></ul>
 */
@property (nonatomic, strong) AWSMachineLearningRedshiftDataSpec * _Nullable dataSpec;

/**
 <p>A fully specified role Amazon Resource Name (ARN). Amazon ML assumes the role on behalf of the user to create the following: </p><p><ul><li><p>A security group to allow Amazon ML to execute the <code>SelectSqlQuery</code> query on an Amazon Redshift cluster</p></li><li><p>An Amazon S3 bucket policy to grant Amazon ML read/write permissions on the <code>S3StagingLocation</code></p></li></ul></p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

@end

/**
 <p> Represents the output of a <code>CreateDataSourceFromRedshift</code> operation, and is an acknowledgement that Amazon ML received the request.</p><p>The <code>CreateDataSourceFromRedshift</code> operation is asynchronous. You can poll for updates by using the <code>GetBatchPrediction</code> operation and checking the <code>Status</code> parameter. </p>
 */
@interface AWSMachineLearningCreateDataSourceFromRedshiftOutput : AWSModel


/**
 <p>A user-supplied ID that uniquely identifies the datasource. This value should be identical to the value of the <code>DataSourceID</code> in the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

@end

/**
 
 */
@interface AWSMachineLearningCreateDataSourceFromS3Input : AWSRequest


/**
 <p>The compute statistics for a <code>DataSource</code>. The statistics are generated from the observation data referenced by a <code>DataSource</code>. Amazon ML uses the statistics internally during <code>MLModel</code> training. This parameter must be set to <code>true</code> if the <code></code>DataSource<code></code> needs to be used for <code>MLModel</code> training.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable computeStatistics;

/**
 <p>A user-supplied identifier that uniquely identifies the <code>DataSource</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

/**
 <p>A user-supplied name or description of the <code>DataSource</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceName;

/**
 <p>The data specification of a <code>DataSource</code>:</p><ul><li><p>DataLocationS3 - The Amazon S3 location of the observation data.</p></li><li><p>DataSchemaLocationS3 - The Amazon S3 location of the <code>DataSchema</code>.</p></li><li><p>DataSchema - A JSON string representing the schema. This is not required if <code>DataSchemaUri</code> is specified. </p></li><li><p>DataRearrangement - A JSON string that represents the splitting and rearrangement requirements for the <code>Datasource</code>. </p><p> Sample - <code> "{\"splitting\":{\"percentBegin\":10,\"percentEnd\":60}}"</code></p></li></ul>
 */
@property (nonatomic, strong) AWSMachineLearningS3DataSpec * _Nullable dataSpec;

@end

/**
 <p> Represents the output of a <code>CreateDataSourceFromS3</code> operation, and is an acknowledgement that Amazon ML received the request.</p><p>The <code>CreateDataSourceFromS3</code> operation is asynchronous. You can poll for updates by using the <code>GetBatchPrediction</code> operation and checking the <code>Status</code> parameter. </p>
 */
@interface AWSMachineLearningCreateDataSourceFromS3Output : AWSModel


/**
 <p>A user-supplied ID that uniquely identifies the <code>DataSource</code>. This value should be identical to the value of the <code>DataSourceID</code> in the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

@end

/**
 
 */
@interface AWSMachineLearningCreateEvaluationInput : AWSRequest


/**
 <p>The ID of the <code>DataSource</code> for the evaluation. The schema of the <code>DataSource</code> must match the schema used to create the <code>MLModel</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationDataSourceId;

/**
 <p>A user-supplied ID that uniquely identifies the <code>Evaluation</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationId;

/**
 <p>A user-supplied name or description of the <code>Evaluation</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationName;

/**
 <p>The ID of the <code>MLModel</code> to evaluate.</p><p>The schema used in creating the <code>MLModel</code> must match the schema of the <code>DataSource</code> used in the <code>Evaluation</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

@end

/**
 <p> Represents the output of a <code>CreateEvaluation</code> operation, and is an acknowledgement that Amazon ML received the request.</p><p><code>CreateEvaluation</code> operation is asynchronous. You can poll for status updates by using the <code>GetEvcaluation</code> operation and checking the <code>Status</code> parameter. </p>
 */
@interface AWSMachineLearningCreateEvaluationOutput : AWSModel


/**
 <p>The user-supplied ID that uniquely identifies the <code>Evaluation</code>. This value should be identical to the value of the <code>EvaluationId</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationId;

@end

/**
 
 */
@interface AWSMachineLearningCreateMLModelInput : AWSRequest


/**
 <p>A user-supplied ID that uniquely identifies the <code>MLModel</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

/**
 <p>A user-supplied name or description of the <code>MLModel</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelName;

/**
 <p>The category of supervised learning that this <code>MLModel</code> will address. Choose from the following types:</p><ul><li>Choose <code>REGRESSION</code> if the <code>MLModel</code> will be used to predict a numeric value.</li><li>Choose <code>BINARY</code> if the <code>MLModel</code> result has two possible values.</li><li>Choose <code>MULTICLASS</code> if the <code>MLModel</code> result has a limited number of values. </li></ul><p> For more information, see the <a href="http://docs.aws.amazon.com/machine-learning/latest/dg">Amazon Machine Learning Developer Guide</a>.</p>
 */
@property (nonatomic, assign) AWSMachineLearningMLModelType MLModelType;

/**
 <p>A list of the training parameters in the <code>MLModel</code>. The list is implemented as a map of key-value pairs.</p><p>The following is the current set of training parameters: </p><ul><li><p><code>sgd.maxMLModelSizeInBytes</code> - The maximum allowed size of the model. Depending on the input data, the size of the model might affect its performance.</p><p> The value is an integer that ranges from <code>100000</code> to <code>2147483648</code>. The default value is <code>33554432</code>.</p></li><li><p><code>sgd.maxPasses</code> - The number of times that the training process traverses the observations to build the <code>MLModel</code>. The value is an integer that ranges from <code>1</code> to <code>10000</code>. The default value is <code>10</code>.</p></li><li><p><code>sgd.shuffleType</code> - Whether Amazon ML shuffles the training data. Shuffling the data improves a model's ability to find the optimal solution for a variety of data types. The valid values are <code>auto</code> and <code>none</code>. The default value is <code>none</code>. We <?oxy_insert_start author="laurama" timestamp="20160329T131121-0700">strongly recommend that you shuffle your data.<?oxy_insert_end></p></li><li><p><code>sgd.l1RegularizationAmount</code> - The coefficient regularization L1 norm. It controls overfitting the data by penalizing large coefficients. This tends to drive coefficients to zero, resulting in a sparse feature set. If you use this parameter, start by specifying a small value, such as <code>1.0E-08</code>.</p><p>The value is a double that ranges from <code>0</code> to <code>MAX_DOUBLE</code>. The default is to not use L1 normalization. This parameter can't be used when <code>L2</code> is specified. Use this parameter sparingly.</p></li><li><p><code>sgd.l2RegularizationAmount</code> - The coefficient regularization L2 norm. It controls overfitting the data by penalizing large coefficients. This tends to drive coefficients to small, nonzero values. If you use this parameter, start by specifying a small value, such as <code>1.0E-08</code>.</p><p>The value is a double that ranges from <code>0</code> to <code>MAX_DOUBLE</code>. The default is to not use L2 normalization. This parameter can't be used when <code>L1</code> is specified. Use this parameter sparingly.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable parameters;

/**
 <p>The data recipe for creating the <code>MLModel</code>. You must specify either the recipe or its URI. If you don't specify a recipe or its URI, Amazon ML creates a default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recipe;

/**
 <p>The Amazon Simple Storage Service (Amazon S3) location and file name that contains the <code>MLModel</code> recipe. You must specify either the recipe or its URI. If you don't specify a recipe or its URI, Amazon ML creates a default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recipeUri;

/**
 <p>The <code>DataSource</code> that points to the training data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingDataSourceId;

@end

/**
 <p> Represents the output of a <code>CreateMLModel</code> operation, and is an acknowledgement that Amazon ML received the request.</p><p>The <code>CreateMLModel</code> operation is asynchronous. You can poll for status updates by using the <code>GetMLModel</code> operation and checking the <code>Status</code> parameter. </p>
 */
@interface AWSMachineLearningCreateMLModelOutput : AWSModel


/**
 <p>A user-supplied ID that uniquely identifies the <code>MLModel</code>. This value should be identical to the value of the <code>MLModelId</code> in the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

@end

/**
 
 */
@interface AWSMachineLearningCreateRealtimeEndpointInput : AWSRequest


/**
 <p>The ID assigned to the <code>MLModel</code> during creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

@end

/**
 <p>Represents the output of an <code>CreateRealtimeEndpoint</code> operation.</p><p>The result contains the <code>MLModelId</code> and the endpoint information for the <code>MLModel</code>.</p><note><p>The endpoint information includes the URI of the <code>MLModel</code>; that is, the location to send online prediction requests for the specified <code>MLModel</code>.</p></note>
 */
@interface AWSMachineLearningCreateRealtimeEndpointOutput : AWSModel


/**
 <p>A user-supplied ID that uniquely identifies the <code>MLModel</code>. This value should be identical to the value of the <code>MLModelId</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

/**
 <p>The endpoint information of the <code>MLModel</code></p>
 */
@property (nonatomic, strong) AWSMachineLearningRealtimeEndpointInfo * _Nullable realtimeEndpointInfo;

@end

/**
 <p> Represents the output of the <code>GetDataSource</code> operation. </p><p> The content consists of the detailed metadata and data file information and the current status of the <code>DataSource</code>. </p>
 */
@interface AWSMachineLearningDataSource : AWSModel


/**
 <p> The parameter is <code>true</code> if statistics need to be generated from the observation data. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable computeStatistics;

/**
 <p>Long integer type that is a 64-bit signed number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable computeTime;

/**
 <p>The time that the <code>DataSource</code> was created. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The AWS user account from which the <code>DataSource</code> was created. The account type can be either an AWS root account or an AWS Identity and Access Management (IAM) user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdByIamUser;

/**
 <p>The location and name of the data in Amazon Simple Storage Service (Amazon S3) that is used by a <code>DataSource</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataLocationS3;

/**
 <p>A JSON string that represents the splitting and rearrangement requirement used when this <code>DataSource</code> was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataRearrangement;

/**
 <p>The total number of observations contained in the data files that the <code>DataSource</code> references.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dataSizeInBytes;

/**
 <p>The ID that is assigned to the <code>DataSource</code> during creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

/**
 <p>A timestamp represented in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable finishedAt;

/**
 <p>The time of the most recent edit to the <code>BatchPrediction</code>. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>A description of the most recent details about creating the <code>DataSource</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>A user-supplied name or description of the <code>DataSource</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The number of data files referenced by the <code>DataSource</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfFiles;

/**
 <p>The datasource details that are specific to Amazon RDS.</p>
 */
@property (nonatomic, strong) AWSMachineLearningRDSMetadata * _Nullable RDSMetadata;

/**
 <p>Describes the <code>DataSource</code> details specific to Amazon Redshift.</p>
 */
@property (nonatomic, strong) AWSMachineLearningRedshiftMetadata * _Nullable redshiftMetadata;

/**
 <p>The Amazon Resource Name (ARN) of an <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/roles-toplevel.html#roles-about-termsandconcepts">AWS IAM Role</a>, such as the following: arn:aws:iam::account:role/rolename. </p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

/**
 <p>A timestamp represented in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedAt;

/**
 <p>The current status of the <code>DataSource</code>. This element can have one of the following values: </p><ul><li>PENDING - Amazon Machine Learning (Amazon ML) submitted a request to create a <code>DataSource</code>.</li><li>INPROGRESS - The creation process is underway.</li><li>FAILED - The request to create a <code>DataSource</code> did not run to completion. It is not usable.</li><li>COMPLETED - The creation process completed successfully.</li><li>DELETED - The <code>DataSource</code> is marked as deleted. It is not usable.</li></ul>
 */
@property (nonatomic, assign) AWSMachineLearningEntityStatus status;

@end

/**
 
 */
@interface AWSMachineLearningDeleteBatchPredictionInput : AWSRequest


/**
 <p>A user-supplied ID that uniquely identifies the <code>BatchPrediction</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable batchPredictionId;

@end

/**
 <p> Represents the output of a <code>DeleteBatchPrediction</code> operation.</p><p>You can use the <code>GetBatchPrediction</code> operation and check the value of the <code>Status</code> parameter to see whether a <code>BatchPrediction</code> is marked as <code>DELETED</code>.</p>
 */
@interface AWSMachineLearningDeleteBatchPredictionOutput : AWSModel


/**
 <p>A user-supplied ID that uniquely identifies the <code>BatchPrediction</code>. This value should be identical to the value of the <code>BatchPredictionID</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable batchPredictionId;

@end

/**
 
 */
@interface AWSMachineLearningDeleteDataSourceInput : AWSRequest


/**
 <p>A user-supplied ID that uniquely identifies the <code>DataSource</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

@end

/**
 <p> Represents the output of a <code>DeleteDataSource</code> operation.</p>
 */
@interface AWSMachineLearningDeleteDataSourceOutput : AWSModel


/**
 <p>A user-supplied ID that uniquely identifies the <code>DataSource</code>. This value should be identical to the value of the <code>DataSourceID</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

@end

/**
 
 */
@interface AWSMachineLearningDeleteEvaluationInput : AWSRequest


/**
 <p>A user-supplied ID that uniquely identifies the <code>Evaluation</code> to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationId;

@end

/**
 <p> Represents the output of a <code>DeleteEvaluation</code> operation. The output indicates that Amazon Machine Learning (Amazon ML) received the request.</p><p>You can use the <code>GetEvaluation</code> operation and check the value of the <code>Status</code> parameter to see whether an <code>Evaluation</code> is marked as <code>DELETED</code>.</p>
 */
@interface AWSMachineLearningDeleteEvaluationOutput : AWSModel


/**
 <p>A user-supplied ID that uniquely identifies the <code>Evaluation</code>. This value should be identical to the value of the <code>EvaluationId</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationId;

@end

/**
 
 */
@interface AWSMachineLearningDeleteMLModelInput : AWSRequest


/**
 <p>A user-supplied ID that uniquely identifies the <code>MLModel</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

@end

/**
 <p>Represents the output of a <code>DeleteMLModel</code> operation.</p><p>You can use the <code>GetMLModel</code> operation and check the value of the <code>Status</code> parameter to see whether an <code>MLModel</code> is marked as <code>DELETED</code>.</p>
 */
@interface AWSMachineLearningDeleteMLModelOutput : AWSModel


/**
 <p>A user-supplied ID that uniquely identifies the <code>MLModel</code>. This value should be identical to the value of the <code>MLModelID</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

@end

/**
 
 */
@interface AWSMachineLearningDeleteRealtimeEndpointInput : AWSRequest


/**
 <p>The ID assigned to the <code>MLModel</code> during creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

@end

/**
 <p>Represents the output of an <code>DeleteRealtimeEndpoint</code> operation.</p><p>The result contains the <code>MLModelId</code> and the endpoint information for the <code>MLModel</code>. </p>
 */
@interface AWSMachineLearningDeleteRealtimeEndpointOutput : AWSModel


/**
 <p>A user-supplied ID that uniquely identifies the <code>MLModel</code>. This value should be identical to the value of the <code>MLModelId</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

/**
 <p>The endpoint information of the <code>MLModel</code></p>
 */
@property (nonatomic, strong) AWSMachineLearningRealtimeEndpointInfo * _Nullable realtimeEndpointInfo;

@end

/**
 
 */
@interface AWSMachineLearningDeleteTagsInput : AWSRequest


/**
 <p>The ID of the tagged ML object. For example, <code>exampleModelId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The type of the tagged ML object.</p>
 */
@property (nonatomic, assign) AWSMachineLearningTaggableResourceType resourceType;

/**
 <p>One or more tags to delete.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 <p>Amazon ML returns the following elements. </p>
 */
@interface AWSMachineLearningDeleteTagsOutput : AWSModel


/**
 <p>The ID of the ML object from which tags were deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The type of the ML object from which tags were deleted.</p>
 */
@property (nonatomic, assign) AWSMachineLearningTaggableResourceType resourceType;

@end

/**
 
 */
@interface AWSMachineLearningDescribeBatchPredictionsInput : AWSRequest


/**
 <p>The equal to operator. The <code>BatchPrediction</code> results will have <code>FilterVariable</code> values that exactly match the value specified with <code>EQ</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable EQ;

/**
 <p>Use one of the following variables to filter a list of <code>BatchPrediction</code>:</p><ul><li><code>CreatedAt</code> - Sets the search criteria to the <code>BatchPrediction</code> creation date.</li><li><code>Status</code> - Sets the search criteria to the <code>BatchPrediction</code> status.</li><li><code>Name</code> - Sets the search criteria to the contents of the <code>BatchPrediction</code><b></b><code>Name</code>.</li><li><code>IAMUser</code> - Sets the search criteria to the user account that invoked the <code>BatchPrediction</code> creation.</li><li><code>MLModelId</code> - Sets the search criteria to the <code>MLModel</code> used in the <code>BatchPrediction</code>.</li><li><code>DataSourceId</code> - Sets the search criteria to the <code>DataSource</code> used in the <code>BatchPrediction</code>.</li><li><code>DataURI</code> - Sets the search criteria to the data file(s) used in the <code>BatchPrediction</code>. The URL can identify either a file or an Amazon Simple Storage Solution (Amazon S3) bucket or directory.</li></ul>
 */
@property (nonatomic, assign) AWSMachineLearningBatchPredictionFilterVariable filterVariable;

/**
 <p>The greater than or equal to operator. The <code>BatchPrediction</code> results will have <code>FilterVariable</code> values that are greater than or equal to the value specified with <code>GE</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable GE;

/**
 <p>The greater than operator. The <code>BatchPrediction</code> results will have <code>FilterVariable</code> values that are greater than the value specified with <code>GT</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable GT;

/**
 <p>The less than or equal to operator. The <code>BatchPrediction</code> results will have <code>FilterVariable</code> values that are less than or equal to the value specified with <code>LE</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable LE;

/**
 <p>The less than operator. The <code>BatchPrediction</code> results will have <code>FilterVariable</code> values that are less than the value specified with <code>LT</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable LT;

/**
 <p>The number of pages of information to include in the result. The range of acceptable values is <code>1</code> through <code>100</code>. The default value is <code>100</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The not equal to operator. The <code>BatchPrediction</code> results will have <code>FilterVariable</code> values not equal to the value specified with <code>NE</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable NE;

/**
 <p>An ID of the page in the paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A string that is found at the beginning of a variable, such as <code>Name</code> or <code>Id</code>.</p><p>For example, a <code>Batch Prediction</code> operation could have the <code>Name</code><code>2014-09-09-HolidayGiftMailer</code>. To search for this <code>BatchPrediction</code>, select <code>Name</code> for the <code>FilterVariable</code> and any of the following strings for the <code>Prefix</code>: </p><ul><li><p>2014-09</p></li><li><p>2014-09-09</p></li><li><p>2014-09-09-Holiday</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>A two-value parameter that determines the sequence of the resulting list of <code>MLModel</code>s.</p><ul><li><code>asc</code> - Arranges the list in ascending order (A-Z, 0-9).</li><li><code>dsc</code> - Arranges the list in descending order (Z-A, 9-0).</li></ul><p>Results are sorted by <code>FilterVariable</code>.</p>
 */
@property (nonatomic, assign) AWSMachineLearningSortOrder sortOrder;

@end

/**
 <p>Represents the output of a <code>DescribeBatchPredictions</code> operation. The content is essentially a list of <code>BatchPrediction</code>s.</p>
 */
@interface AWSMachineLearningDescribeBatchPredictionsOutput : AWSModel


/**
 <p>The ID of the next page in the paginated results that indicates at least one more page follows.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of <code>BatchPrediction</code> objects that meet the search criteria. </p>
 */
@property (nonatomic, strong) NSArray<AWSMachineLearningBatchPrediction *> * _Nullable results;

@end

/**
 
 */
@interface AWSMachineLearningDescribeDataSourcesInput : AWSRequest


/**
 <p>The equal to operator. The <code>DataSource</code> results will have <code>FilterVariable</code> values that exactly match the value specified with <code>EQ</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable EQ;

/**
 <p>Use one of the following variables to filter a list of <code>DataSource</code>:</p><ul><li><code>CreatedAt</code> - Sets the search criteria to <code>DataSource</code> creation dates.</li><li><code>Status</code> - Sets the search criteria to <code>DataSource</code> statuses.</li><li><code>Name</code> - Sets the search criteria to the contents of <code>DataSource</code><b></b><code>Name</code>.</li><li><code>DataUri</code> - Sets the search criteria to the URI of data files used to create the <code>DataSource</code>. The URI can identify either a file or an Amazon Simple Storage Service (Amazon S3) bucket or directory.</li><li><code>IAMUser</code> - Sets the search criteria to the user account that invoked the <code>DataSource</code> creation.</li></ul>
 */
@property (nonatomic, assign) AWSMachineLearningDataSourceFilterVariable filterVariable;

/**
 <p>The greater than or equal to operator. The <code>DataSource</code> results will have <code>FilterVariable</code> values that are greater than or equal to the value specified with <code>GE</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable GE;

/**
 <p>The greater than operator. The <code>DataSource</code> results will have <code>FilterVariable</code> values that are greater than the value specified with <code>GT</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable GT;

/**
 <p>The less than or equal to operator. The <code>DataSource</code> results will have <code>FilterVariable</code> values that are less than or equal to the value specified with <code>LE</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable LE;

/**
 <p>The less than operator. The <code>DataSource</code> results will have <code>FilterVariable</code> values that are less than the value specified with <code>LT</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable LT;

/**
 <p> The maximum number of <code>DataSource</code> to include in the result.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The not equal to operator. The <code>DataSource</code> results will have <code>FilterVariable</code> values not equal to the value specified with <code>NE</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable NE;

/**
 <p>The ID of the page in the paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A string that is found at the beginning of a variable, such as <code>Name</code> or <code>Id</code>.</p><p>For example, a <code>DataSource</code> could have the <code>Name</code><code>2014-09-09-HolidayGiftMailer</code>. To search for this <code>DataSource</code>, select <code>Name</code> for the <code>FilterVariable</code> and any of the following strings for the <code>Prefix</code>: </p><ul><li><p>2014-09</p></li><li><p>2014-09-09</p></li><li><p>2014-09-09-Holiday</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>A two-value parameter that determines the sequence of the resulting list of <code>DataSource</code>.</p><ul><li><code>asc</code> - Arranges the list in ascending order (A-Z, 0-9).</li><li><code>dsc</code> - Arranges the list in descending order (Z-A, 9-0).</li></ul><p>Results are sorted by <code>FilterVariable</code>.</p>
 */
@property (nonatomic, assign) AWSMachineLearningSortOrder sortOrder;

@end

/**
 <p>Represents the query results from a <a>DescribeDataSources</a> operation. The content is essentially a list of <code>DataSource</code>.</p>
 */
@interface AWSMachineLearningDescribeDataSourcesOutput : AWSModel


/**
 <p>An ID of the next page in the paginated results that indicates at least one more page follows.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of <code>DataSource</code> that meet the search criteria. </p>
 */
@property (nonatomic, strong) NSArray<AWSMachineLearningDataSource *> * _Nullable results;

@end

/**
 
 */
@interface AWSMachineLearningDescribeEvaluationsInput : AWSRequest


/**
 <p>The equal to operator. The <code>Evaluation</code> results will have <code>FilterVariable</code> values that exactly match the value specified with <code>EQ</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable EQ;

/**
 <p>Use one of the following variable to filter a list of <code>Evaluation</code> objects:</p><ul><li><code>CreatedAt</code> - Sets the search criteria to the <code>Evaluation</code> creation date.</li><li><code>Status</code> - Sets the search criteria to the <code>Evaluation</code> status.</li><li><code>Name</code> - Sets the search criteria to the contents of <code>Evaluation</code><b></b><code>Name</code>.</li><li><code>IAMUser</code> - Sets the search criteria to the user account that invoked an <code>Evaluation</code>.</li><li><code>MLModelId</code> - Sets the search criteria to the <code>MLModel</code> that was evaluated.</li><li><code>DataSourceId</code> - Sets the search criteria to the <code>DataSource</code> used in <code>Evaluation</code>.</li><li><code>DataUri</code> - Sets the search criteria to the data file(s) used in <code>Evaluation</code>. The URL can identify either a file or an Amazon Simple Storage Solution (Amazon S3) bucket or directory.</li></ul>
 */
@property (nonatomic, assign) AWSMachineLearningEvaluationFilterVariable filterVariable;

/**
 <p>The greater than or equal to operator. The <code>Evaluation</code> results will have <code>FilterVariable</code> values that are greater than or equal to the value specified with <code>GE</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable GE;

/**
 <p>The greater than operator. The <code>Evaluation</code> results will have <code>FilterVariable</code> values that are greater than the value specified with <code>GT</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable GT;

/**
 <p>The less than or equal to operator. The <code>Evaluation</code> results will have <code>FilterVariable</code> values that are less than or equal to the value specified with <code>LE</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable LE;

/**
 <p>The less than operator. The <code>Evaluation</code> results will have <code>FilterVariable</code> values that are less than the value specified with <code>LT</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable LT;

/**
 <p> The maximum number of <code>Evaluation</code> to include in the result.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The not equal to operator. The <code>Evaluation</code> results will have <code>FilterVariable</code> values not equal to the value specified with <code>NE</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable NE;

/**
 <p>The ID of the page in the paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A string that is found at the beginning of a variable, such as <code>Name</code> or <code>Id</code>.</p><p>For example, an <code>Evaluation</code> could have the <code>Name</code><code>2014-09-09-HolidayGiftMailer</code>. To search for this <code>Evaluation</code>, select <code>Name</code> for the <code>FilterVariable</code> and any of the following strings for the <code>Prefix</code>: </p><ul><li><p>2014-09</p></li><li><p>2014-09-09</p></li><li><p>2014-09-09-Holiday</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>A two-value parameter that determines the sequence of the resulting list of <code>Evaluation</code>.</p><ul><li><code>asc</code> - Arranges the list in ascending order (A-Z, 0-9).</li><li><code>dsc</code> - Arranges the list in descending order (Z-A, 9-0).</li></ul><p>Results are sorted by <code>FilterVariable</code>.</p>
 */
@property (nonatomic, assign) AWSMachineLearningSortOrder sortOrder;

@end

/**
 <p>Represents the query results from a <code>DescribeEvaluations</code> operation. The content is essentially a list of <code>Evaluation</code>.</p>
 */
@interface AWSMachineLearningDescribeEvaluationsOutput : AWSModel


/**
 <p>The ID of the next page in the paginated results that indicates at least one more page follows.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of <code>Evaluation</code> that meet the search criteria. </p>
 */
@property (nonatomic, strong) NSArray<AWSMachineLearningEvaluation *> * _Nullable results;

@end

/**
 
 */
@interface AWSMachineLearningDescribeMLModelsInput : AWSRequest


/**
 <p>The equal to operator. The <code>MLModel</code> results will have <code>FilterVariable</code> values that exactly match the value specified with <code>EQ</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable EQ;

/**
 <p>Use one of the following variables to filter a list of <code>MLModel</code>:</p><ul><li><code>CreatedAt</code> - Sets the search criteria to <code>MLModel</code> creation date.</li><li><code>Status</code> - Sets the search criteria to <code>MLModel</code> status.</li><li><code>Name</code> - Sets the search criteria to the contents of <code>MLModel</code><b></b><code>Name</code>.</li><li><code>IAMUser</code> - Sets the search criteria to the user account that invoked the <code>MLModel</code> creation.</li><li><code>TrainingDataSourceId</code> - Sets the search criteria to the <code>DataSource</code> used to train one or more <code>MLModel</code>.</li><li><code>RealtimeEndpointStatus</code> - Sets the search criteria to the <code>MLModel</code> real-time endpoint status.</li><li><code>MLModelType</code> - Sets the search criteria to <code>MLModel</code> type: binary, regression, or multi-class.</li><li><code>Algorithm</code> - Sets the search criteria to the algorithm that the <code>MLModel</code> uses.</li><li><code>TrainingDataURI</code> - Sets the search criteria to the data file(s) used in training a <code>MLModel</code>. The URL can identify either a file or an Amazon Simple Storage Service (Amazon S3) bucket or directory.</li></ul>
 */
@property (nonatomic, assign) AWSMachineLearningMLModelFilterVariable filterVariable;

/**
 <p>The greater than or equal to operator. The <code>MLModel</code> results will have <code>FilterVariable</code> values that are greater than or equal to the value specified with <code>GE</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable GE;

/**
 <p>The greater than operator. The <code>MLModel</code> results will have <code>FilterVariable</code> values that are greater than the value specified with <code>GT</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable GT;

/**
 <p>The less than or equal to operator. The <code>MLModel</code> results will have <code>FilterVariable</code> values that are less than or equal to the value specified with <code>LE</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable LE;

/**
 <p>The less than operator. The <code>MLModel</code> results will have <code>FilterVariable</code> values that are less than the value specified with <code>LT</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable LT;

/**
 <p>The number of pages of information to include in the result. The range of acceptable values is <code>1</code> through <code>100</code>. The default value is <code>100</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The not equal to operator. The <code>MLModel</code> results will have <code>FilterVariable</code> values not equal to the value specified with <code>NE</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable NE;

/**
 <p>The ID of the page in the paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A string that is found at the beginning of a variable, such as <code>Name</code> or <code>Id</code>.</p><p>For example, an <code>MLModel</code> could have the <code>Name</code><code>2014-09-09-HolidayGiftMailer</code>. To search for this <code>MLModel</code>, select <code>Name</code> for the <code>FilterVariable</code> and any of the following strings for the <code>Prefix</code>: </p><ul><li><p>2014-09</p></li><li><p>2014-09-09</p></li><li><p>2014-09-09-Holiday</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>A two-value parameter that determines the sequence of the resulting list of <code>MLModel</code>.</p><ul><li><code>asc</code> - Arranges the list in ascending order (A-Z, 0-9).</li><li><code>dsc</code> - Arranges the list in descending order (Z-A, 9-0).</li></ul><p>Results are sorted by <code>FilterVariable</code>.</p>
 */
@property (nonatomic, assign) AWSMachineLearningSortOrder sortOrder;

@end

/**
 <p>Represents the output of a <code>DescribeMLModels</code> operation. The content is essentially a list of <code>MLModel</code>.</p>
 */
@interface AWSMachineLearningDescribeMLModelsOutput : AWSModel


/**
 <p>The ID of the next page in the paginated results that indicates at least one more page follows.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of <code>MLModel</code> that meet the search criteria.</p>
 */
@property (nonatomic, strong) NSArray<AWSMachineLearningMLModel *> * _Nullable results;

@end

/**
 
 */
@interface AWSMachineLearningDescribeTagsInput : AWSRequest


/**
 <p>The ID of the ML object. For example, <code>exampleModelId</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The type of the ML object.</p>
 */
@property (nonatomic, assign) AWSMachineLearningTaggableResourceType resourceType;

@end

/**
 <p>Amazon ML returns the following elements. </p>
 */
@interface AWSMachineLearningDescribeTagsOutput : AWSModel


/**
 <p>The ID of the tagged ML object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The type of the tagged ML object.</p>
 */
@property (nonatomic, assign) AWSMachineLearningTaggableResourceType resourceType;

/**
 <p>A list of tags associated with the ML object.</p>
 */
@property (nonatomic, strong) NSArray<AWSMachineLearningTag *> * _Nullable tags;

@end

/**
 <p> Represents the output of <code>GetEvaluation</code> operation. </p><p>The content consists of the detailed metadata and data file information and the current status of the <code>Evaluation</code>.</p>
 */
@interface AWSMachineLearningEvaluation : AWSModel


/**
 <p>Long integer type that is a 64-bit signed number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable computeTime;

/**
 <p>The time that the <code>Evaluation</code> was created. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The AWS user account that invoked the evaluation. The account type can be either an AWS root account or an AWS Identity and Access Management (IAM) user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdByIamUser;

/**
 <p>The ID of the <code>DataSource</code> that is used to evaluate the <code>MLModel</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationDataSourceId;

/**
 <p>The ID that is assigned to the <code>Evaluation</code> at creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationId;

/**
 <p>A timestamp represented in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable finishedAt;

/**
 <p>The location and name of the data in Amazon Simple Storage Server (Amazon S3) that is used in the evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputDataLocationS3;

/**
 <p>The time of the most recent edit to the <code>Evaluation</code>. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The ID of the <code>MLModel</code> that is the focus of the evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

/**
 <p>A description of the most recent details about evaluating the <code>MLModel</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>A user-supplied name or description of the <code>Evaluation</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Measurements of how well the <code>MLModel</code> performed, using observations referenced by the <code>DataSource</code>. One of the following metrics is returned, based on the type of the <code>MLModel</code>: </p><ul><li><p>BinaryAUC: A binary <code>MLModel</code> uses the Area Under the Curve (AUC) technique to measure performance. </p></li><li><p>RegressionRMSE: A regression <code>MLModel</code> uses the Root Mean Square Error (RMSE) technique to measure performance. RMSE measures the difference between predicted and actual values for a single variable.</p></li><li><p>MulticlassAvgFScore: A multiclass <code>MLModel</code> uses the F1 score technique to measure performance. </p></li></ul><p> For more information about performance metrics, please see the <a href="http://docs.aws.amazon.com/machine-learning/latest/dg">Amazon Machine Learning Developer Guide</a>. </p>
 */
@property (nonatomic, strong) AWSMachineLearningPerformanceMetrics * _Nullable performanceMetrics;

/**
 <p>A timestamp represented in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedAt;

/**
 <p>The status of the evaluation. This element can have one of the following values:</p><ul><li><code>PENDING</code> - Amazon Machine Learning (Amazon ML) submitted a request to evaluate an <code>MLModel</code>.</li><li><code>INPROGRESS</code> - The evaluation is underway.</li><li><code>FAILED</code> - The request to evaluate an <code>MLModel</code> did not run to completion. It is not usable.</li><li><code>COMPLETED</code> - The evaluation process completed successfully.</li><li><code>DELETED</code> - The <code>Evaluation</code> is marked as deleted. It is not usable.</li></ul>
 */
@property (nonatomic, assign) AWSMachineLearningEntityStatus status;

@end

/**
 
 */
@interface AWSMachineLearningGetBatchPredictionInput : AWSRequest


/**
 <p>An ID assigned to the <code>BatchPrediction</code> at creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable batchPredictionId;

@end

/**
 <p>Represents the output of a <code>GetBatchPrediction</code> operation and describes a <code>BatchPrediction</code>.</p>
 */
@interface AWSMachineLearningGetBatchPredictionOutput : AWSModel


/**
 <p>The ID of the <code>DataSource</code> that was used to create the <code>BatchPrediction</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable batchPredictionDataSourceId;

/**
 <p>An ID assigned to the <code>BatchPrediction</code> at creation. This value should be identical to the value of the <code>BatchPredictionID</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable batchPredictionId;

/**
 <p>The approximate CPU time in milliseconds that Amazon Machine Learning spent processing the <code>BatchPrediction</code>, normalized and scaled on computation resources. <code>ComputeTime</code> is only available if the <code>BatchPrediction</code> is in the <code>COMPLETED</code> state.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable computeTime;

/**
 <p>The time when the <code>BatchPrediction</code> was created. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The AWS user account that invoked the <code>BatchPrediction</code>. The account type can be either an AWS root account or an AWS Identity and Access Management (IAM) user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdByIamUser;

/**
 <p>The epoch time when Amazon Machine Learning marked the <code>BatchPrediction</code> as <code>COMPLETED</code> or <code>FAILED</code>. <code>FinishedAt</code> is only available when the <code>BatchPrediction</code> is in the <code>COMPLETED</code> or <code>FAILED</code> state.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable finishedAt;

/**
 <p>The location of the data file or directory in Amazon Simple Storage Service (Amazon S3).</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputDataLocationS3;

/**
 <p>The number of invalid records that Amazon Machine Learning saw while processing the <code>BatchPrediction</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable invalidRecordCount;

/**
 <p>The time of the most recent edit to <code>BatchPrediction</code>. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>A link to the file that contains logs of the <code>CreateBatchPrediction</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logUri;

/**
 <p>The ID of the <code>MLModel</code> that generated predictions for the <code>BatchPrediction</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

/**
 <p>A description of the most recent details about processing the batch prediction request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>A user-supplied name or description of the <code>BatchPrediction</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The location of an Amazon S3 bucket or directory to receive the operation results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputUri;

/**
 <p>The epoch time when Amazon Machine Learning marked the <code>BatchPrediction</code> as <code>INPROGRESS</code>. <code>StartedAt</code> isn't available if the <code>BatchPrediction</code> is in the <code>PENDING</code> state.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedAt;

/**
 <p>The status of the <code>BatchPrediction</code>, which can be one of the following values:</p><ul><li><code>PENDING</code> - Amazon Machine Learning (Amazon ML) submitted a request to generate batch predictions.</li><li><code>INPROGRESS</code> - The batch predictions are in progress.</li><li><code>FAILED</code> - The request to perform a batch prediction did not run to completion. It is not usable.</li><li><code>COMPLETED</code> - The batch prediction process completed successfully.</li><li><code>DELETED</code> - The <code>BatchPrediction</code> is marked as deleted. It is not usable.</li></ul>
 */
@property (nonatomic, assign) AWSMachineLearningEntityStatus status;

/**
 <p>The number of total records that Amazon Machine Learning saw while processing the <code>BatchPrediction</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalRecordCount;

@end

/**
 
 */
@interface AWSMachineLearningGetDataSourceInput : AWSRequest


/**
 <p>The ID assigned to the <code>DataSource</code> at creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

/**
 <p>Specifies whether the <code>GetDataSource</code> operation should return <code>DataSourceSchema</code>.</p><p>If true, <code>DataSourceSchema</code> is returned.</p><p>If false, <code>DataSourceSchema</code> is not returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable verbose;

@end

/**
 <p>Represents the output of a <code>GetDataSource</code> operation and describes a <code>DataSource</code>.</p>
 */
@interface AWSMachineLearningGetDataSourceOutput : AWSModel


/**
 <p> The parameter is <code>true</code> if statistics need to be generated from the observation data. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable computeStatistics;

/**
 <p>The approximate CPU time in milliseconds that Amazon Machine Learning spent processing the <code>DataSource</code>, normalized and scaled on computation resources. <code>ComputeTime</code> is only available if the <code>DataSource</code> is in the <code>COMPLETED</code> state and the <code>ComputeStatistics</code> is set to true.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable computeTime;

/**
 <p>The time that the <code>DataSource</code> was created. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The AWS user account from which the <code>DataSource</code> was created. The account type can be either an AWS root account or an AWS Identity and Access Management (IAM) user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdByIamUser;

/**
 <p>The location of the data file or directory in Amazon Simple Storage Service (Amazon S3).</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataLocationS3;

/**
 <p>A JSON string that represents the splitting and rearrangement requirement used when this <code>DataSource</code> was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataRearrangement;

/**
 <p>The total size of observations in the data files.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dataSizeInBytes;

/**
 <p>The ID assigned to the <code>DataSource</code> at creation. This value should be identical to the value of the <code>DataSourceId</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

/**
 <p>The schema used by all of the data files of this <code>DataSource</code>.</p><note><title>Note</title><p>This parameter is provided as part of the verbose format.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceSchema;

/**
 <p>The epoch time when Amazon Machine Learning marked the <code>DataSource</code> as <code>COMPLETED</code> or <code>FAILED</code>. <code>FinishedAt</code> is only available when the <code>DataSource</code> is in the <code>COMPLETED</code> or <code>FAILED</code> state.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable finishedAt;

/**
 <p>The time of the most recent edit to the <code>DataSource</code>. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>A link to the file containing logs of <code>CreateDataSourceFrom*</code> operations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logUri;

/**
 <p>The user-supplied description of the most recent details about creating the <code>DataSource</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>A user-supplied name or description of the <code>DataSource</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The number of data files referenced by the <code>DataSource</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfFiles;

/**
 <p>The datasource details that are specific to Amazon RDS.</p>
 */
@property (nonatomic, strong) AWSMachineLearningRDSMetadata * _Nullable RDSMetadata;

/**
 <p>Describes the <code>DataSource</code> details specific to Amazon Redshift.</p>
 */
@property (nonatomic, strong) AWSMachineLearningRedshiftMetadata * _Nullable redshiftMetadata;

/**
 <p>The Amazon Resource Name (ARN) of an <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/roles-toplevel.html#roles-about-termsandconcepts">AWS IAM Role</a>, such as the following: arn:aws:iam::account:role/rolename. </p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

/**
 <p>The epoch time when Amazon Machine Learning marked the <code>DataSource</code> as <code>INPROGRESS</code>. <code>StartedAt</code> isn't available if the <code>DataSource</code> is in the <code>PENDING</code> state.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedAt;

/**
 <p>The current status of the <code>DataSource</code>. This element can have one of the following values:</p><ul><li><code>PENDING</code> - Amazon ML submitted a request to create a <code>DataSource</code>.</li><li><code>INPROGRESS</code> - The creation process is underway.</li><li><code>FAILED</code> - The request to create a <code>DataSource</code> did not run to completion. It is not usable.</li><li><code>COMPLETED</code> - The creation process completed successfully.</li><li><code>DELETED</code> - The <code>DataSource</code> is marked as deleted. It is not usable.</li></ul>
 */
@property (nonatomic, assign) AWSMachineLearningEntityStatus status;

@end

/**
 
 */
@interface AWSMachineLearningGetEvaluationInput : AWSRequest


/**
 <p>The ID of the <code>Evaluation</code> to retrieve. The evaluation of each <code>MLModel</code> is recorded and cataloged. The ID provides the means to access the information. </p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationId;

@end

/**
 <p>Represents the output of a <code>GetEvaluation</code> operation and describes an <code>Evaluation</code>.</p>
 */
@interface AWSMachineLearningGetEvaluationOutput : AWSModel


/**
 <p>The approximate CPU time in milliseconds that Amazon Machine Learning spent processing the <code>Evaluation</code>, normalized and scaled on computation resources. <code>ComputeTime</code> is only available if the <code>Evaluation</code> is in the <code>COMPLETED</code> state.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable computeTime;

/**
 <p>The time that the <code>Evaluation</code> was created. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The AWS user account that invoked the evaluation. The account type can be either an AWS root account or an AWS Identity and Access Management (IAM) user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdByIamUser;

/**
 <p>The <code>DataSource</code> used for this evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationDataSourceId;

/**
 <p>The evaluation ID which is same as the <code>EvaluationId</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationId;

/**
 <p>The epoch time when Amazon Machine Learning marked the <code>Evaluation</code> as <code>COMPLETED</code> or <code>FAILED</code>. <code>FinishedAt</code> is only available when the <code>Evaluation</code> is in the <code>COMPLETED</code> or <code>FAILED</code> state.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable finishedAt;

/**
 <p>The location of the data file or directory in Amazon Simple Storage Service (Amazon S3).</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputDataLocationS3;

/**
 <p>The time of the most recent edit to the <code>Evaluation</code>. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>A link to the file that contains logs of the <code>CreateEvaluation</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logUri;

/**
 <p>The ID of the <code>MLModel</code> that was the focus of the evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

/**
 <p>A description of the most recent details about evaluating the <code>MLModel</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>A user-supplied name or description of the <code>Evaluation</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Measurements of how well the <code>MLModel</code> performed using observations referenced by the <code>DataSource</code>. One of the following metric is returned based on the type of the <code>MLModel</code>: </p><ul><li><p>BinaryAUC: A binary <code>MLModel</code> uses the Area Under the Curve (AUC) technique to measure performance. </p></li><li><p>RegressionRMSE: A regression <code>MLModel</code> uses the Root Mean Square Error (RMSE) technique to measure performance. RMSE measures the difference between predicted and actual values for a single variable.</p></li><li><p>MulticlassAvgFScore: A multiclass <code>MLModel</code> uses the F1 score technique to measure performance. </p></li></ul><p> For more information about performance metrics, please see the <a href="http://docs.aws.amazon.com/machine-learning/latest/dg">Amazon Machine Learning Developer Guide</a>. </p>
 */
@property (nonatomic, strong) AWSMachineLearningPerformanceMetrics * _Nullable performanceMetrics;

/**
 <p>The epoch time when Amazon Machine Learning marked the <code>Evaluation</code> as <code>INPROGRESS</code>. <code>StartedAt</code> isn't available if the <code>Evaluation</code> is in the <code>PENDING</code> state.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedAt;

/**
 <p>The status of the evaluation. This element can have one of the following values:</p><ul><li><code>PENDING</code> - Amazon Machine Language (Amazon ML) submitted a request to evaluate an <code>MLModel</code>.</li><li><code>INPROGRESS</code> - The evaluation is underway.</li><li><code>FAILED</code> - The request to evaluate an <code>MLModel</code> did not run to completion. It is not usable.</li><li><code>COMPLETED</code> - The evaluation process completed successfully.</li><li><code>DELETED</code> - The <code>Evaluation</code> is marked as deleted. It is not usable.</li></ul>
 */
@property (nonatomic, assign) AWSMachineLearningEntityStatus status;

@end

/**
 
 */
@interface AWSMachineLearningGetMLModelInput : AWSRequest


/**
 <p>The ID assigned to the <code>MLModel</code> at creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

/**
 <p>Specifies whether the <code>GetMLModel</code> operation should return <code>Recipe</code>.</p><p>If true, <code>Recipe</code> is returned.</p><p>If false, <code>Recipe</code> is not returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable verbose;

@end

/**
 <p>Represents the output of a <code>GetMLModel</code> operation, and provides detailed information about a <code>MLModel</code>.</p>
 */
@interface AWSMachineLearningGetMLModelOutput : AWSModel


/**
 <p>The approximate CPU time in milliseconds that Amazon Machine Learning spent processing the <code>MLModel</code>, normalized and scaled on computation resources. <code>ComputeTime</code> is only available if the <code>MLModel</code> is in the <code>COMPLETED</code> state.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable computeTime;

/**
 <p>The time that the <code>MLModel</code> was created. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The AWS user account from which the <code>MLModel</code> was created. The account type can be either an AWS root account or an AWS Identity and Access Management (IAM) user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdByIamUser;

/**
 <p>The current endpoint of the <code>MLModel</code></p>
 */
@property (nonatomic, strong) AWSMachineLearningRealtimeEndpointInfo * _Nullable endpointInfo;

/**
 <p>The epoch time when Amazon Machine Learning marked the <code>MLModel</code> as <code>COMPLETED</code> or <code>FAILED</code>. <code>FinishedAt</code> is only available when the <code>MLModel</code> is in the <code>COMPLETED</code> or <code>FAILED</code> state.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable finishedAt;

/**
 <p>The location of the data file or directory in Amazon Simple Storage Service (Amazon S3).</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputDataLocationS3;

/**
 <p>The time of the most recent edit to the <code>MLModel</code>. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>A link to the file that contains logs of the <code>CreateMLModel</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logUri;

/**
 <p>The MLModel ID<?oxy_insert_start author="annbech" timestamp="20160328T151251-0700">,<?oxy_insert_end> which is same as the <code>MLModelId</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

/**
 <p>Identifies the <code>MLModel</code> category. The following are the available types: </p><ul><li>REGRESSION -- Produces a numeric result. For example, "What price should a house be listed at?"</li><li>BINARY -- Produces one of two possible results. For example, "Is this an e-commerce website?"</li><li>MULTICLASS -- Produces one of several possible results. For example, "Is this a HIGH, LOW or MEDIUM risk trade?"</li></ul>
 */
@property (nonatomic, assign) AWSMachineLearningMLModelType MLModelType;

/**
 <p>A description of the most recent details about accessing the <code>MLModel</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>A user-supplied name or description of the <code>MLModel</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The recipe to use when training the <code>MLModel</code>. The <code>Recipe</code> provides detailed information about the observation data to use during training, and manipulations to perform on the observation data during training.</p><note><title>Note</title><p>This parameter is provided as part of the verbose format.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable recipe;

/**
 <p>The schema used by all of the data files referenced by the <code>DataSource</code>.</p><note><title>Note</title><p>This parameter is provided as part of the verbose format.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable schema;

/**
 <p>The scoring threshold is used in binary classification <code>MLModel</code><?oxy_insert_start author="laurama" timestamp="20160329T114851-0700"><?oxy_insert_end>models. It marks the boundary between a positive prediction and a negative prediction.</p><p>Output values greater than or equal to the threshold receive a positive result from the MLModel, such as <code>true</code>. Output values less than the threshold receive a negative response from the MLModel, such as <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scoreThreshold;

/**
 <p>The time of the most recent edit to the <code>ScoreThreshold</code>. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable scoreThresholdLastUpdatedAt;

/**
 <p>Long integer type that is a 64-bit signed number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeInBytes;

/**
 <p>The epoch time when Amazon Machine Learning marked the <code>MLModel</code> as <code>INPROGRESS</code>. <code>StartedAt</code> isn't available if the <code>MLModel</code> is in the <code>PENDING</code> state.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedAt;

/**
 <p>The current status of the <code>MLModel</code>. This element can have one of the following values:</p><ul><li><code>PENDING</code> - Amazon Machine Learning (Amazon ML) submitted a request to describe a <code>MLModel</code>.</li><li><code>INPROGRESS</code> - The request is processing.</li><li><code>FAILED</code> - The request did not run to completion. The ML model isn't usable.</li><li><code>COMPLETED</code> - The request completed successfully.</li><li><code>DELETED</code> - The <code>MLModel</code> is marked as deleted. It isn't usable.</li></ul>
 */
@property (nonatomic, assign) AWSMachineLearningEntityStatus status;

/**
 <p>The ID of the training <code>DataSource</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingDataSourceId;

/**
 <p>A list of the training parameters in the <code>MLModel</code>. The list is implemented as a map of key-value pairs.</p><p>The following is the current set of training parameters: </p><ul><li><p><code>sgd.maxMLModelSizeInBytes</code> - The maximum allowed size of the model. Depending on the input data, the size of the model might affect its performance.</p><p> The value is an integer that ranges from <code>100000</code> to <code>2147483648</code>. The default value is <code>33554432</code>.</p></li><li><p><code>sgd.maxPasses</code> - The number of times that the training process traverses the observations to build the <code>MLModel</code>. The value is an integer that ranges from <code>1</code> to <code>10000</code>. The default value is <code>10</code>.</p></li><li><p><code>sgd.shuffleType</code> - Whether Amazon ML shuffles the training data. Shuffling data improves a model's ability to find the optimal solution for a variety of data types. The valid values are <code>auto</code> and <code>none</code>. The default value is <code>none</code>. We strongly recommend that you shuffle your data.</p></li><li><p><code>sgd.l1RegularizationAmount</code> - The coefficient regularization L1 norm. It controls overfitting the data by penalizing large coefficients. This tends to drive coefficients to zero, resulting in a sparse feature set. If you use this parameter, start by specifying a small value, such as <code>1.0E-08</code>.</p><p>The value is a double that ranges from <code>0</code> to <code>MAX_DOUBLE</code>. The default is to not use L1 normalization. This parameter can't be used when <code>L2</code> is specified. Use this parameter sparingly.</p></li><li><p><code>sgd.l2RegularizationAmount</code> - The coefficient regularization L2 norm. It controls overfitting the data by penalizing large coefficients. This tends to drive coefficients to small, nonzero values. If you use this parameter, start by specifying a small value, such as <code>1.0E-08</code>.</p><p>The value is a double that ranges from <code>0</code> to <code>MAX_DOUBLE</code>. The default is to not use L2 normalization. This parameter can't be used when <code>L1</code> is specified. Use this parameter sparingly.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable trainingParameters;

@end

/**
 <p> Represents the output of a <code>GetMLModel</code> operation. </p><p>The content consists of the detailed metadata and the current status of the <code>MLModel</code>.</p>
 */
@interface AWSMachineLearningMLModel : AWSModel


/**
 <p>The algorithm used to train the <code>MLModel</code>. The following algorithm is supported:</p><ul><li><code>SGD</code> -- Stochastic gradient descent. The goal of <code>SGD</code> is to minimize the gradient of the loss function. </li></ul>
 */
@property (nonatomic, assign) AWSMachineLearningAlgorithm algorithm;

/**
 <p>Long integer type that is a 64-bit signed number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable computeTime;

/**
 <p>The time that the <code>MLModel</code> was created. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The AWS user account from which the <code>MLModel</code> was created. The account type can be either an AWS root account or an AWS Identity and Access Management (IAM) user account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdByIamUser;

/**
 <p>The current endpoint of the <code>MLModel</code>.</p>
 */
@property (nonatomic, strong) AWSMachineLearningRealtimeEndpointInfo * _Nullable endpointInfo;

/**
 <p>A timestamp represented in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable finishedAt;

/**
 <p>The location of the data file or directory in Amazon Simple Storage Service (Amazon S3).</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputDataLocationS3;

/**
 <p>The time of the most recent edit to the <code>MLModel</code>. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The ID assigned to the <code>MLModel</code> at creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

/**
 <p>Identifies the <code>MLModel</code> category. The following are the available types:</p><ul><li><code>REGRESSION</code> - Produces a numeric result. For example, "What price should a house be listed at?"</li><li><code>BINARY</code> - Produces one of two possible results. For example, "Is this a child-friendly web site?".</li><li><code>MULTICLASS</code> - Produces one of several possible results. For example, "Is this a HIGH-, LOW-, or MEDIUM<?oxy_delete author="annbech" timestamp="20160328T175050-0700" content=" "><?oxy_insert_start author="annbech" timestamp="20160328T175050-0700">-<?oxy_insert_end>risk trade?".</li></ul>
 */
@property (nonatomic, assign) AWSMachineLearningMLModelType MLModelType;

/**
 <p>A description of the most recent details about accessing the <code>MLModel</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>A user-supplied name or description of the <code>MLModel</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable scoreThreshold;

/**
 <p>The time of the most recent edit to the <code>ScoreThreshold</code>. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable scoreThresholdLastUpdatedAt;

/**
 <p>Long integer type that is a 64-bit signed number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeInBytes;

/**
 <p>A timestamp represented in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startedAt;

/**
 <p>The current status of an <code>MLModel</code>. This element can have one of the following values: </p><ul><li><code>PENDING</code> - Amazon Machine Learning (Amazon ML) submitted a request to create an <code>MLModel</code>.</li><li><code>INPROGRESS</code> - The creation process is underway.</li><li><code>FAILED</code> - The request to create an <code>MLModel</code> didn't run to completion. The model isn't usable.</li><li><code>COMPLETED</code> - The creation process completed successfully.</li><li><code>DELETED</code> - The <code>MLModel</code> is marked as deleted. It isn't usable.</li></ul>
 */
@property (nonatomic, assign) AWSMachineLearningEntityStatus status;

/**
 <p>The ID of the training <code>DataSource</code>. The <code>CreateMLModel</code> operation uses the <code>TrainingDataSourceId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingDataSourceId;

/**
 <p>A list of the training parameters in the <code>MLModel</code>. The list is implemented as a map of key-value pairs.</p><p>The following is the current set of training parameters: </p><ul><li><p><code>sgd.maxMLModelSizeInBytes</code> - The maximum allowed size of the model. Depending on the input data, the size of the model might affect its performance.</p><p> The value is an integer that ranges from <code>100000</code> to <code>2147483648</code>. The default value is <code>33554432</code>.</p></li><li><p><code>sgd.maxPasses</code> - The number of times that the training process traverses the observations to build the <code>MLModel</code>. The value is an integer that ranges from <code>1</code> to <code>10000</code>. The default value is <code>10</code>.</p></li><li><p><code>sgd.shuffleType</code> - Whether Amazon ML shuffles the training data. Shuffling the data improves a model's ability to find the optimal solution for a variety of data types. The valid values are <code>auto</code> and <code>none</code>. The default value is <code>none</code>.</p></li><li><p><code>sgd.l1RegularizationAmount</code> - The coefficient regularization L1 norm, which controls overfitting the data by penalizing large coefficients. This parameter tends to drive coefficients to zero, resulting in sparse feature set. If you use this parameter, start by specifying a small value, such as <code>1.0E-08</code>.</p><p>The value is a double that ranges from <code>0</code> to <code>MAX_DOUBLE</code>. The default is to not use L1 normalization. This parameter can't be used when <code>L2</code> is specified. Use this parameter sparingly.</p></li><li><p><code>sgd.l2RegularizationAmount</code> - The coefficient regularization L2 norm, which controls overfitting the data by penalizing large coefficients. This tends to drive coefficients to small, nonzero values. If you use this parameter, start by specifying a small value, such as <code>1.0E-08</code>.</p><p>The value is a double that ranges from <code>0</code> to <code>MAX_DOUBLE</code>. The default is to not use L2 normalization. This parameter can't be used when <code>L1</code> is specified. Use this parameter sparingly.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable trainingParameters;

@end

/**
 <p>Measurements of how well the <code>MLModel</code> performed on known observations. One of the following metrics is returned, based on the type of the <code>MLModel</code>: </p><ul><li><p>BinaryAUC: The binary <code>MLModel</code> uses the Area Under the Curve (AUC) technique to measure performance. </p></li><li><p>RegressionRMSE: The regression <code>MLModel</code> uses the Root Mean Square Error (RMSE) technique to measure performance. RMSE measures the difference between predicted and actual values for a single variable.</p></li><li><p>MulticlassAvgFScore: The multiclass <code>MLModel</code> uses the F1 score technique to measure performance. </p></li></ul><p> For more information about performance metrics, please see the <a href="http://docs.aws.amazon.com/machine-learning/latest/dg">Amazon Machine Learning Developer Guide</a>. </p>
 */
@interface AWSMachineLearningPerformanceMetrics : AWSModel


/**
 
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable properties;

@end

/**
 
 */
@interface AWSMachineLearningPredictInput : AWSRequest


/**
 <p>A unique identifier of the <code>MLModel</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable predictEndpoint;

/**
 <p>A map of variable name-value pairs that represent an observation.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable record;

@end

/**
 
 */
@interface AWSMachineLearningPredictOutput : AWSModel


/**
 <p>The output from a <code>Predict</code> operation: </p><ul><li><p><code>Details</code> - Contains the following attributes: <code>DetailsAttributes.PREDICTIVE_MODEL_TYPE - REGRESSION | BINARY | MULTICLASS</code><code>DetailsAttributes.ALGORITHM - SGD</code></p></li><li><p><code>PredictedLabel</code> - Present for either a <code>BINARY</code> or <code>MULTICLASS</code><code>MLModel</code> request. </p></li><li><p><code>PredictedScores</code> - Contains the raw classification score corresponding to each label. </p></li><li><p><code>PredictedValue</code> - Present for a <code>REGRESSION</code><code>MLModel</code> request. </p></li></ul>
 */
@property (nonatomic, strong) AWSMachineLearningPrediction * _Nullable prediction;

@end

/**
 <p>The output from a <code>Predict</code> operation: </p><ul><li><p><code>Details</code> - Contains the following attributes: <code>DetailsAttributes.PREDICTIVE_MODEL_TYPE - REGRESSION | BINARY | MULTICLASS</code><code>DetailsAttributes.ALGORITHM - SGD</code></p></li><li><p><code>PredictedLabel</code> - Present for either a <code>BINARY</code> or <code>MULTICLASS</code><code>MLModel</code> request. </p></li><li><p><code>PredictedScores</code> - Contains the raw classification score corresponding to each label. </p></li><li><p><code>PredictedValue</code> - Present for a <code>REGRESSION</code><code>MLModel</code> request. </p></li></ul>
 */
@interface AWSMachineLearningPrediction : AWSModel


/**
 Provides any additional details regarding the prediction.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable details;

/**
 <p>The prediction label for either a <code>BINARY</code> or <code>MULTICLASS</code><code>MLModel</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable predictedLabel;

/**
 Provides the raw classification score corresponding to each label.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable predictedScores;

/**
 The prediction value for <code>REGRESSION</code><code>MLModel</code>.
 */
@property (nonatomic, strong) NSNumber * _Nullable predictedValue;

@end

/**
 <p>The data specification of an Amazon Relational Database Service (Amazon RDS) <code>DataSource</code>.</p>
 Required parameters: [DatabaseInformation, SelectSqlQuery, DatabaseCredentials, S3StagingLocation, ResourceRole, ServiceRole, SubnetId, SecurityGroupIds]
 */
@interface AWSMachineLearningRDSDataSpec : AWSModel


/**
 <p>A JSON string that represents the splitting and rearrangement processing to be applied to a <code>DataSource</code>. If the <code>DataRearrangement</code> parameter is not provided, all of the input data is used to create the <code>Datasource</code>.</p><p>There are multiple parameters that control what data is used to create a datasource:</p><ul><li><p><b><code>percentBegin</code></b></p><p>Use <code>percentBegin</code> to indicate the beginning of the range of the data used to create the Datasource. If you do not include <code>percentBegin</code> and <code>percentEnd</code>, Amazon ML includes all of the data when creating the datasource.</p></li><li><p><b><code>percentEnd</code></b></p><p>Use <code>percentEnd</code> to indicate the end of the range of the data used to create the Datasource. If you do not include <code>percentBegin</code> and <code>percentEnd</code>, Amazon ML includes all of the data when creating the datasource.</p></li><li><p><b><code>complement</code></b></p><p>The <code>complement</code> parameter instructs Amazon ML to use the data that is not included in the range of <code>percentBegin</code> to <code>percentEnd</code> to create a datasource. The <code>complement</code> parameter is useful if you need to create complementary datasources for training and evaluation. To create a complementary datasource, use the same values for <code>percentBegin</code> and <code>percentEnd</code>, along with the <code>complement</code> parameter.</p><p>For example, the following two datasources do not share any data, and can be used to train and evaluate a model. The first datasource has 25 percent of the data, and the second one has 75 percent of the data.</p><p>Datasource for evaluation: <code>{"splitting":{"percentBegin":0, "percentEnd":25}}</code></p><p>Datasource for training: <code>{"splitting":{"percentBegin":0, "percentEnd":25, "complement":"true"}}</code></p></li><li><p><b><code>strategy</code></b></p><p>To change how Amazon ML splits the data for a datasource, use the <code>strategy</code> parameter.</p><p>The default value for the <code>strategy</code> parameter is <code>sequential</code>, meaning that Amazon ML takes all of the data records between the <code>percentBegin</code> and <code>percentEnd</code> parameters for the datasource, in the order that the records appear in the input data.</p><p>The following two <code>DataRearrangement</code> lines are examples of sequentially ordered training and evaluation datasources:</p><p>Datasource for evaluation: <code>{"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"sequential"}}</code></p><p>Datasource for training: <code>{"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"sequential", "complement":"true"}}</code></p><p>To randomly split the input data into the proportions indicated by the percentBegin and percentEnd parameters, set the <code>strategy</code> parameter to <code>random</code> and provide a string that is used as the seed value for the random data splitting (for example, you can use the S3 path to your data as the random seed string). If you choose the random split strategy, Amazon ML assigns each row of data a pseudo-random number between 0 and 100, and then selects the rows that have an assigned number between <code>percentBegin</code> and <code>percentEnd</code>. Pseudo-random numbers are assigned using both the input seed string value and the byte offset as a seed, so changing the data results in a different split. Any existing ordering is preserved. The random splitting strategy ensures that variables in the training and evaluation data are distributed similarly. It is useful in the cases where the input data may have an implicit sort order, which would otherwise result in training and evaluation datasources containing non-similar data records.</p><p>The following two <code>DataRearrangement</code> lines are examples of non-sequentially ordered training and evaluation datasources:</p><p>Datasource for evaluation: <code>{"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"random", "randomSeed"="s3://my_s3_path/bucket/file.csv"}}</code></p><p>Datasource for training: <code>{"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"random", "randomSeed"="s3://my_s3_path/bucket/file.csv", "complement":"true"}}</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable dataRearrangement;

/**
 <p>A JSON string that represents the schema for an Amazon RDS <code>DataSource</code>. The <code>DataSchema</code> defines the structure of the observation data in the data file(s) referenced in the <code>DataSource</code>.</p><p>A <code>DataSchema</code> is not required if you specify a <code>DataSchemaUri</code></p><p>Define your <code>DataSchema</code> as a series of key-value pairs. <code>attributes</code> and <code>excludedVariableNames</code> have an array of key-value pairs for their value. Use the following format to define your <code>DataSchema</code>.</p><p>{ "version": "1.0",</p><p> "recordAnnotationFieldName": "F1",</p><p> "recordWeightFieldName": "F2",</p><p> "targetFieldName": "F3",</p><p> "dataFormat": "CSV",</p><p> "dataFileContainsHeader": true,</p><p> "attributes": [</p><p> { "fieldName": "F1", "fieldType": "TEXT" }, { "fieldName": "F2", "fieldType": "NUMERIC" }, { "fieldName": "F3", "fieldType": "CATEGORICAL" }, { "fieldName": "F4", "fieldType": "NUMERIC" }, { "fieldName": "F5", "fieldType": "CATEGORICAL" }, { "fieldName": "F6", "fieldType": "TEXT" }, { "fieldName": "F7", "fieldType": "WEIGHTED_INT_SEQUENCE" }, { "fieldName": "F8", "fieldType": "WEIGHTED_STRING_SEQUENCE" } ],</p><p> "excludedVariableNames": [ "F6" ] } </p><?oxy_insert_end>
 */
@property (nonatomic, strong) NSString * _Nullable dataSchema;

/**
 <p>The Amazon S3 location of the <code>DataSchema</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSchemaUri;

/**
 <p>The AWS Identity and Access Management (IAM) credentials that are used connect to the Amazon RDS database.</p>
 */
@property (nonatomic, strong) AWSMachineLearningRDSDatabaseCredentials * _Nullable databaseCredentials;

/**
 <p>Describes the <code>DatabaseName</code> and <code>InstanceIdentifier</code> of an Amazon RDS database.</p>
 */
@property (nonatomic, strong) AWSMachineLearningRDSDatabase * _Nullable databaseInformation;

/**
 <p>The role (DataPipelineDefaultResourceRole) assumed by an Amazon Elastic Compute Cloud (Amazon EC2) instance to carry out the copy operation from Amazon RDS to an Amazon S3 task. For more information, see <a href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html">Role templates</a> for data pipelines.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceRole;

/**
 <p>The Amazon S3 location for staging Amazon RDS data. The data retrieved from Amazon RDS using <code>SelectSqlQuery</code> is stored in this location.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3StagingLocation;

/**
 <p>The security group IDs to be used to access a VPC-based RDS DB instance. Ensure that there are appropriate ingress rules set up to allow access to the RDS DB instance. This attribute is used by Data Pipeline to carry out the copy operation from Amazon RDS to an Amazon S3 task.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>The query that is used to retrieve the observation data for the <code>DataSource</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable selectSqlQuery;

/**
 <p>The role (DataPipelineDefaultRole) assumed by AWS Data Pipeline service to monitor the progress of the copy task from Amazon RDS to Amazon S3. For more information, see <a href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html">Role templates</a> for data pipelines.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRole;

/**
 <p>The subnet ID to be used to access a VPC-based RDS DB instance. This attribute is used by Data Pipeline to carry out the copy task from Amazon RDS to Amazon S3.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

@end

/**
 <p>The database details of an Amazon RDS database.</p>
 Required parameters: [InstanceIdentifier, DatabaseName]
 */
@interface AWSMachineLearningRDSDatabase : AWSModel


/**
 <p>The name of a database hosted on an RDS DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The ID of an RDS DB instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceIdentifier;

@end

/**
 <p>The database credentials to connect to a database on an RDS DB instance.</p>
 Required parameters: [Username, Password]
 */
@interface AWSMachineLearningRDSDatabaseCredentials : AWSModel


/**
 <p>The password to be used by Amazon ML to connect to a database on an RDS DB instance. The password should have sufficient permissions to execute the <code>RDSSelectQuery</code> query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>The username to be used by Amazon ML to connect to database on an Amazon RDS instance. The username should have sufficient permissions to execute an <code>RDSSelectSqlQuery</code> query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>The datasource details that are specific to Amazon RDS.</p>
 */
@interface AWSMachineLearningRDSMetadata : AWSModel


/**
 <p>The ID of the Data Pipeline instance that is used to carry to copy data from Amazon RDS to Amazon S3. You can use the ID to find details about the instance in the Data Pipeline console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataPipelineId;

/**
 <p>The database details required to connect to an Amazon RDS.</p>
 */
@property (nonatomic, strong) AWSMachineLearningRDSDatabase * _Nullable database;

/**
 <p>The username to be used by Amazon ML to connect to database on an Amazon RDS instance. The username should have sufficient permissions to execute an <code>RDSSelectSqlQuery</code> query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseUserName;

/**
 <p>The role (DataPipelineDefaultResourceRole) assumed by an Amazon EC2 instance to carry out the copy task from Amazon RDS to Amazon S3. For more information, see <a href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html">Role templates</a> for data pipelines.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceRole;

/**
 <p>The SQL query that is supplied during <a>CreateDataSourceFromRDS</a>. Returns only if <code>Verbose</code> is true in <code>GetDataSourceInput</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable selectSqlQuery;

/**
 <p>The role (DataPipelineDefaultRole) assumed by the Data Pipeline service to monitor the progress of the copy task from Amazon RDS to Amazon S3. For more information, see <a href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html">Role templates</a> for data pipelines.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRole;

@end

/**
 <p> Describes the real-time endpoint information for an <code>MLModel</code>.</p>
 */
@interface AWSMachineLearningRealtimeEndpointInfo : AWSModel


/**
 <p>The time that the request to create the real-time endpoint for the <code>MLModel</code> was received. The time is expressed in epoch time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p> The current status of the real-time endpoint for the <code>MLModel</code>. This element can have one of the following values: </p><ul><li><code>NONE</code> - Endpoint does not exist or was previously deleted.</li><li><code>READY</code> - Endpoint is ready to be used for real-time predictions.</li><li><code>UPDATING</code> - Updating/creating the endpoint. </li></ul>
 */
@property (nonatomic, assign) AWSMachineLearningRealtimeEndpointStatus endpointStatus;

/**
 <p>The URI that specifies where to send real-time prediction requests for the <code>MLModel</code>.</p><note><title>Note</title><p>The application must wait until the real-time endpoint is ready before using this URI.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable endpointUrl;

/**
 <p> The maximum processing rate for the real-time endpoint for <code>MLModel</code>, measured in incoming requests per second.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable peakRequestsPerSecond;

@end

/**
 <p>Describes the data specification of an Amazon Redshift <code>DataSource</code>.</p>
 Required parameters: [DatabaseInformation, SelectSqlQuery, DatabaseCredentials, S3StagingLocation]
 */
@interface AWSMachineLearningRedshiftDataSpec : AWSModel


/**
 <p>A JSON string that represents the splitting and rearrangement processing to be applied to a <code>DataSource</code>. If the <code>DataRearrangement</code> parameter is not provided, all of the input data is used to create the <code>Datasource</code>.</p><p>There are multiple parameters that control what data is used to create a datasource:</p><ul><li><p><b><code>percentBegin</code></b></p><p>Use <code>percentBegin</code> to indicate the beginning of the range of the data used to create the Datasource. If you do not include <code>percentBegin</code> and <code>percentEnd</code>, Amazon ML includes all of the data when creating the datasource.</p></li><li><p><b><code>percentEnd</code></b></p><p>Use <code>percentEnd</code> to indicate the end of the range of the data used to create the Datasource. If you do not include <code>percentBegin</code> and <code>percentEnd</code>, Amazon ML includes all of the data when creating the datasource.</p></li><li><p><b><code>complement</code></b></p><p>The <code>complement</code> parameter instructs Amazon ML to use the data that is not included in the range of <code>percentBegin</code> to <code>percentEnd</code> to create a datasource. The <code>complement</code> parameter is useful if you need to create complementary datasources for training and evaluation. To create a complementary datasource, use the same values for <code>percentBegin</code> and <code>percentEnd</code>, along with the <code>complement</code> parameter.</p><p>For example, the following two datasources do not share any data, and can be used to train and evaluate a model. The first datasource has 25 percent of the data, and the second one has 75 percent of the data.</p><p>Datasource for evaluation: <code>{"splitting":{"percentBegin":0, "percentEnd":25}}</code></p><p>Datasource for training: <code>{"splitting":{"percentBegin":0, "percentEnd":25, "complement":"true"}}</code></p></li><li><p><b><code>strategy</code></b></p><p>To change how Amazon ML splits the data for a datasource, use the <code>strategy</code> parameter.</p><p>The default value for the <code>strategy</code> parameter is <code>sequential</code>, meaning that Amazon ML takes all of the data records between the <code>percentBegin</code> and <code>percentEnd</code> parameters for the datasource, in the order that the records appear in the input data.</p><p>The following two <code>DataRearrangement</code> lines are examples of sequentially ordered training and evaluation datasources:</p><p>Datasource for evaluation: <code>{"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"sequential"}}</code></p><p>Datasource for training: <code>{"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"sequential", "complement":"true"}}</code></p><p>To randomly split the input data into the proportions indicated by the percentBegin and percentEnd parameters, set the <code>strategy</code> parameter to <code>random</code> and provide a string that is used as the seed value for the random data splitting (for example, you can use the S3 path to your data as the random seed string). If you choose the random split strategy, Amazon ML assigns each row of data a pseudo-random number between 0 and 100, and then selects the rows that have an assigned number between <code>percentBegin</code> and <code>percentEnd</code>. Pseudo-random numbers are assigned using both the input seed string value and the byte offset as a seed, so changing the data results in a different split. Any existing ordering is preserved. The random splitting strategy ensures that variables in the training and evaluation data are distributed similarly. It is useful in the cases where the input data may have an implicit sort order, which would otherwise result in training and evaluation datasources containing non-similar data records.</p><p>The following two <code>DataRearrangement</code> lines are examples of non-sequentially ordered training and evaluation datasources:</p><p>Datasource for evaluation: <code>{"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"random", "randomSeed"="s3://my_s3_path/bucket/file.csv"}}</code></p><p>Datasource for training: <code>{"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"random", "randomSeed"="s3://my_s3_path/bucket/file.csv", "complement":"true"}}</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable dataRearrangement;

/**
 <p>A JSON string that represents the schema for an Amazon Redshift <code>DataSource</code>. The <code>DataSchema</code> defines the structure of the observation data in the data file(s) referenced in the <code>DataSource</code>.</p><p>A <code>DataSchema</code> is not required if you specify a <code>DataSchemaUri</code>.</p><p>Define your <code>DataSchema</code> as a series of key-value pairs. <code>attributes</code> and <code>excludedVariableNames</code> have an array of key-value pairs for their value. Use the following format to define your <code>DataSchema</code>.</p><p>{ "version": "1.0",</p><p> "recordAnnotationFieldName": "F1",</p><p> "recordWeightFieldName": "F2",</p><p> "targetFieldName": "F3",</p><p> "dataFormat": "CSV",</p><p> "dataFileContainsHeader": true,</p><p> "attributes": [</p><p> { "fieldName": "F1", "fieldType": "TEXT" }, { "fieldName": "F2", "fieldType": "NUMERIC" }, { "fieldName": "F3", "fieldType": "CATEGORICAL" }, { "fieldName": "F4", "fieldType": "NUMERIC" }, { "fieldName": "F5", "fieldType": "CATEGORICAL" }, { "fieldName": "F6", "fieldType": "TEXT" }, { "fieldName": "F7", "fieldType": "WEIGHTED_INT_SEQUENCE" }, { "fieldName": "F8", "fieldType": "WEIGHTED_STRING_SEQUENCE" } ],</p><p> "excludedVariableNames": [ "F6" ] } </p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSchema;

/**
 <p>Describes the schema location for an Amazon Redshift <code>DataSource</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSchemaUri;

/**
 <p>Describes AWS Identity and Access Management (IAM) credentials that are used connect to the Amazon Redshift database.</p>
 */
@property (nonatomic, strong) AWSMachineLearningRedshiftDatabaseCredentials * _Nullable databaseCredentials;

/**
 <p>Describes the <code>DatabaseName</code> and <code>ClusterIdentifier</code> for an Amazon Redshift <code>DataSource</code>.</p>
 */
@property (nonatomic, strong) AWSMachineLearningRedshiftDatabase * _Nullable databaseInformation;

/**
 <p>Describes an Amazon S3 location to store the result set of the <code>SelectSqlQuery</code> query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3StagingLocation;

/**
 <p>Describes the SQL Query to execute on an Amazon Redshift database for an Amazon Redshift <code>DataSource</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable selectSqlQuery;

@end

/**
 <p>Describes the database details required to connect to an Amazon Redshift database.</p>
 Required parameters: [DatabaseName, ClusterIdentifier]
 */
@interface AWSMachineLearningRedshiftDatabase : AWSModel


/**
 <p>The ID of an Amazon Redshift cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterIdentifier;

/**
 <p>The name of a database hosted on an Amazon Redshift cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

@end

/**
 <p> Describes the database credentials for connecting to a database on an Amazon Redshift cluster.</p>
 Required parameters: [Username, Password]
 */
@interface AWSMachineLearningRedshiftDatabaseCredentials : AWSModel


/**
 <p>A password to be used by Amazon ML to connect to a database on an Amazon Redshift cluster. The password should have sufficient permissions to execute a <code>RedshiftSelectSqlQuery</code> query. The password should be valid for an Amazon Redshift <a href="http://docs.aws.amazon.com/redshift/latest/dg/r_CREATE_USER.html">USER</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>A username to be used by Amazon Machine Learning (Amazon ML)to connect to a database on an Amazon Redshift cluster. The username should have sufficient permissions to execute the <code>RedshiftSelectSqlQuery</code> query. The username should be valid for an Amazon Redshift <a href="http://docs.aws.amazon.com/redshift/latest/dg/r_CREATE_USER.html">USER</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Describes the <code>DataSource</code> details specific to Amazon Redshift.</p>
 */
@interface AWSMachineLearningRedshiftMetadata : AWSModel


/**
 <p>A username to be used by Amazon Machine Learning (Amazon ML)to connect to a database on an Amazon Redshift cluster. The username should have sufficient permissions to execute the <code>RedshiftSelectSqlQuery</code> query. The username should be valid for an Amazon Redshift <a href="http://docs.aws.amazon.com/redshift/latest/dg/r_CREATE_USER.html">USER</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseUserName;

/**
 <p>Describes the database details required to connect to an Amazon Redshift database.</p>
 */
@property (nonatomic, strong) AWSMachineLearningRedshiftDatabase * _Nullable redshiftDatabase;

/**
 <p> The SQL query that is specified during <a>CreateDataSourceFromRedshift</a>. Returns only if <code>Verbose</code> is true in GetDataSourceInput. </p>
 */
@property (nonatomic, strong) NSString * _Nullable selectSqlQuery;

@end

/**
 <p> Describes the data specification of a <code>DataSource</code>.</p>
 Required parameters: [DataLocationS3]
 */
@interface AWSMachineLearningS3DataSpec : AWSModel


/**
 <p>The location of the data file(s) used by a <code>DataSource</code>. The URI specifies a data file or an Amazon Simple Storage Service (Amazon S3) directory or bucket containing data files.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataLocationS3;

/**
 <p>A JSON string that represents the splitting and rearrangement processing to be applied to a <code>DataSource</code>. If the <code>DataRearrangement</code> parameter is not provided, all of the input data is used to create the <code>Datasource</code>.</p><p>There are multiple parameters that control what data is used to create a datasource:</p><ul><li><p><b><code>percentBegin</code></b></p><p>Use <code>percentBegin</code> to indicate the beginning of the range of the data used to create the Datasource. If you do not include <code>percentBegin</code> and <code>percentEnd</code>, Amazon ML includes all of the data when creating the datasource.</p></li><li><p><b><code>percentEnd</code></b></p><p>Use <code>percentEnd</code> to indicate the end of the range of the data used to create the Datasource. If you do not include <code>percentBegin</code> and <code>percentEnd</code>, Amazon ML includes all of the data when creating the datasource.</p></li><li><p><b><code>complement</code></b></p><p>The <code>complement</code> parameter instructs Amazon ML to use the data that is not included in the range of <code>percentBegin</code> to <code>percentEnd</code> to create a datasource. The <code>complement</code> parameter is useful if you need to create complementary datasources for training and evaluation. To create a complementary datasource, use the same values for <code>percentBegin</code> and <code>percentEnd</code>, along with the <code>complement</code> parameter.</p><p>For example, the following two datasources do not share any data, and can be used to train and evaluate a model. The first datasource has 25 percent of the data, and the second one has 75 percent of the data.</p><p>Datasource for evaluation: <code>{"splitting":{"percentBegin":0, "percentEnd":25}}</code></p><p>Datasource for training: <code>{"splitting":{"percentBegin":0, "percentEnd":25, "complement":"true"}}</code></p></li><li><p><b><code>strategy</code></b></p><p>To change how Amazon ML splits the data for a datasource, use the <code>strategy</code> parameter.</p><p>The default value for the <code>strategy</code> parameter is <code>sequential</code>, meaning that Amazon ML takes all of the data records between the <code>percentBegin</code> and <code>percentEnd</code> parameters for the datasource, in the order that the records appear in the input data.</p><p>The following two <code>DataRearrangement</code> lines are examples of sequentially ordered training and evaluation datasources:</p><p>Datasource for evaluation: <code>{"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"sequential"}}</code></p><p>Datasource for training: <code>{"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"sequential", "complement":"true"}}</code></p><p>To randomly split the input data into the proportions indicated by the percentBegin and percentEnd parameters, set the <code>strategy</code> parameter to <code>random</code> and provide a string that is used as the seed value for the random data splitting (for example, you can use the S3 path to your data as the random seed string). If you choose the random split strategy, Amazon ML assigns each row of data a pseudo-random number between 0 and 100, and then selects the rows that have an assigned number between <code>percentBegin</code> and <code>percentEnd</code>. Pseudo-random numbers are assigned using both the input seed string value and the byte offset as a seed, so changing the data results in a different split. Any existing ordering is preserved. The random splitting strategy ensures that variables in the training and evaluation data are distributed similarly. It is useful in the cases where the input data may have an implicit sort order, which would otherwise result in training and evaluation datasources containing non-similar data records.</p><p>The following two <code>DataRearrangement</code> lines are examples of non-sequentially ordered training and evaluation datasources:</p><p>Datasource for evaluation: <code>{"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"random", "randomSeed"="s3://my_s3_path/bucket/file.csv"}}</code></p><p>Datasource for training: <code>{"splitting":{"percentBegin":70, "percentEnd":100, "strategy":"random", "randomSeed"="s3://my_s3_path/bucket/file.csv", "complement":"true"}}</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable dataRearrangement;

/**
 <p> A JSON string that represents the schema for an Amazon S3 <code>DataSource</code>. The <code>DataSchema</code> defines the structure of the observation data in the data file(s) referenced in the <code>DataSource</code>.</p><p>You must provide either the <code>DataSchema</code> or the <code>DataSchemaLocationS3</code>.</p><p>Define your <code>DataSchema</code> as a series of key-value pairs. <code>attributes</code> and <code>excludedVariableNames</code> have an array of key-value pairs for their value. Use the following format to define your <code>DataSchema</code>.</p><p>{ "version": "1.0",</p><p> "recordAnnotationFieldName": "F1",</p><p> "recordWeightFieldName": "F2",</p><p> "targetFieldName": "F3",</p><p> "dataFormat": "CSV",</p><p> "dataFileContainsHeader": true,</p><p> "attributes": [</p><p> { "fieldName": "F1", "fieldType": "TEXT" }, { "fieldName": "F2", "fieldType": "NUMERIC" }, { "fieldName": "F3", "fieldType": "CATEGORICAL" }, { "fieldName": "F4", "fieldType": "NUMERIC" }, { "fieldName": "F5", "fieldType": "CATEGORICAL" }, { "fieldName": "F6", "fieldType": "TEXT" }, { "fieldName": "F7", "fieldType": "WEIGHTED_INT_SEQUENCE" }, { "fieldName": "F8", "fieldType": "WEIGHTED_STRING_SEQUENCE" } ],</p><p> "excludedVariableNames": [ "F6" ] } </p><?oxy_insert_end>
 */
@property (nonatomic, strong) NSString * _Nullable dataSchema;

/**
 <p>Describes the schema location in Amazon S3. You must provide either the <code>DataSchema</code> or the <code>DataSchemaLocationS3</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSchemaLocationS3;

@end

/**
 <p>A custom key-value pair associated with an ML object, such as an ML model.</p>
 */
@interface AWSMachineLearningTag : AWSModel


/**
 <p>A unique identifier for the tag. Valid characters include Unicode letters, digits, white space, _, ., /, =, +, -, %, and @.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>An optional string, typically used to describe or define the tag. Valid characters include Unicode letters, digits, white space, _, ., /, =, +, -, %, and @.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSMachineLearningUpdateBatchPredictionInput : AWSRequest


/**
 <p>The ID assigned to the <code>BatchPrediction</code> during creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable batchPredictionId;

/**
 <p>A new user-supplied name or description of the <code>BatchPrediction</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable batchPredictionName;

@end

/**
 <p>Represents the output of an <code>UpdateBatchPrediction</code> operation.</p><p>You can see the updated content by using the <code>GetBatchPrediction</code> operation.</p>
 */
@interface AWSMachineLearningUpdateBatchPredictionOutput : AWSModel


/**
 <p>The ID assigned to the <code>BatchPrediction</code> during creation. This value should be identical to the value of the <code>BatchPredictionId</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable batchPredictionId;

@end

/**
 
 */
@interface AWSMachineLearningUpdateDataSourceInput : AWSRequest


/**
 <p>The ID assigned to the <code>DataSource</code> during creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

/**
 <p>A new user-supplied name or description of the <code>DataSource</code> that will replace the current description. </p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceName;

@end

/**
 <p>Represents the output of an <code>UpdateDataSource</code> operation.</p><p>You can see the updated content by using the <code>GetBatchPrediction</code> operation.</p>
 */
@interface AWSMachineLearningUpdateDataSourceOutput : AWSModel


/**
 <p>The ID assigned to the <code>DataSource</code> during creation. This value should be identical to the value of the <code>DataSourceID</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSourceId;

@end

/**
 
 */
@interface AWSMachineLearningUpdateEvaluationInput : AWSRequest


/**
 <p>The ID assigned to the <code>Evaluation</code> during creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationId;

/**
 <p>A new user-supplied name or description of the <code>Evaluation</code> that will replace the current content. </p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationName;

@end

/**
 <p>Represents the output of an <code>UpdateEvaluation</code> operation.</p><p>You can see the updated content by using the <code>GetEvaluation</code> operation.</p>
 */
@interface AWSMachineLearningUpdateEvaluationOutput : AWSModel


/**
 <p>The ID assigned to the <code>Evaluation</code> during creation. This value should be identical to the value of the <code>Evaluation</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evaluationId;

@end

/**
 
 */
@interface AWSMachineLearningUpdateMLModelInput : AWSRequest


/**
 <p>The ID assigned to the <code>MLModel</code> during creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

/**
 <p>A user-supplied name or description of the <code>MLModel</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelName;

/**
 <p>The <code>ScoreThreshold</code> used in binary classification <code>MLModel</code> that marks the boundary between a positive prediction and a negative prediction.</p><p>Output values greater than or equal to the <code>ScoreThreshold</code> receive a positive result from the <code>MLModel</code>, such as <code>true</code>. Output values less than the <code>ScoreThreshold</code> receive a negative response from the <code>MLModel</code>, such as <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scoreThreshold;

@end

/**
 <p>Represents the output of an <code>UpdateMLModel</code> operation.</p><p>You can see the updated content by using the <code>GetMLModel</code> operation.</p>
 */
@interface AWSMachineLearningUpdateMLModelOutput : AWSModel


/**
 <p>The ID assigned to the <code>MLModel</code> during creation. This value should be identical to the value of the <code>MLModelID</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MLModelId;

@end

NS_ASSUME_NONNULL_END
