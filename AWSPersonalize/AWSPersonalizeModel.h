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

FOUNDATION_EXPORT NSString *const AWSPersonalizeErrorDomain;

typedef NS_ENUM(NSInteger, AWSPersonalizeErrorType) {
    AWSPersonalizeErrorUnknown,
    AWSPersonalizeErrorInvalidInput,
    AWSPersonalizeErrorInvalidNextToken,
    AWSPersonalizeErrorLimitExceeded,
    AWSPersonalizeErrorResourceAlreadyExists,
    AWSPersonalizeErrorResourceInUse,
    AWSPersonalizeErrorResourceNotFound,
};

typedef NS_ENUM(NSInteger, AWSPersonalizeRecipeProvider) {
    AWSPersonalizeRecipeProviderUnknown,
    AWSPersonalizeRecipeProviderService,
};

typedef NS_ENUM(NSInteger, AWSPersonalizeTrainingMode) {
    AWSPersonalizeTrainingModeUnknown,
    AWSPersonalizeTrainingModeFull,
    AWSPersonalizeTrainingModeUpdate,
};

@class AWSPersonalizeAlgorithm;
@class AWSPersonalizeAlgorithmImage;
@class AWSPersonalizeAutoMLConfig;
@class AWSPersonalizeAutoMLResult;
@class AWSPersonalizeBatchInferenceJob;
@class AWSPersonalizeBatchInferenceJobInput;
@class AWSPersonalizeBatchInferenceJobOutput;
@class AWSPersonalizeBatchInferenceJobSummary;
@class AWSPersonalizeCampaign;
@class AWSPersonalizeCampaignSummary;
@class AWSPersonalizeCampaignUpdateSummary;
@class AWSPersonalizeCategoricalHyperParameterRange;
@class AWSPersonalizeContinuousHyperParameterRange;
@class AWSPersonalizeCreateBatchInferenceJobRequest;
@class AWSPersonalizeCreateBatchInferenceJobResponse;
@class AWSPersonalizeCreateCampaignRequest;
@class AWSPersonalizeCreateCampaignResponse;
@class AWSPersonalizeCreateDatasetGroupRequest;
@class AWSPersonalizeCreateDatasetGroupResponse;
@class AWSPersonalizeCreateDatasetImportJobRequest;
@class AWSPersonalizeCreateDatasetImportJobResponse;
@class AWSPersonalizeCreateDatasetRequest;
@class AWSPersonalizeCreateDatasetResponse;
@class AWSPersonalizeCreateEventTrackerRequest;
@class AWSPersonalizeCreateEventTrackerResponse;
@class AWSPersonalizeCreateFilterRequest;
@class AWSPersonalizeCreateFilterResponse;
@class AWSPersonalizeCreateSchemaRequest;
@class AWSPersonalizeCreateSchemaResponse;
@class AWSPersonalizeCreateSolutionRequest;
@class AWSPersonalizeCreateSolutionResponse;
@class AWSPersonalizeCreateSolutionVersionRequest;
@class AWSPersonalizeCreateSolutionVersionResponse;
@class AWSPersonalizeDataSource;
@class AWSPersonalizeDataset;
@class AWSPersonalizeDatasetGroup;
@class AWSPersonalizeDatasetGroupSummary;
@class AWSPersonalizeDatasetImportJob;
@class AWSPersonalizeDatasetImportJobSummary;
@class AWSPersonalizeDatasetSchema;
@class AWSPersonalizeDatasetSchemaSummary;
@class AWSPersonalizeDatasetSummary;
@class AWSPersonalizeDefaultCategoricalHyperParameterRange;
@class AWSPersonalizeDefaultContinuousHyperParameterRange;
@class AWSPersonalizeDefaultHyperParameterRanges;
@class AWSPersonalizeDefaultIntegerHyperParameterRange;
@class AWSPersonalizeDeleteCampaignRequest;
@class AWSPersonalizeDeleteDatasetGroupRequest;
@class AWSPersonalizeDeleteDatasetRequest;
@class AWSPersonalizeDeleteEventTrackerRequest;
@class AWSPersonalizeDeleteFilterRequest;
@class AWSPersonalizeDeleteSchemaRequest;
@class AWSPersonalizeDeleteSolutionRequest;
@class AWSPersonalizeDescribeAlgorithmRequest;
@class AWSPersonalizeDescribeAlgorithmResponse;
@class AWSPersonalizeDescribeBatchInferenceJobRequest;
@class AWSPersonalizeDescribeBatchInferenceJobResponse;
@class AWSPersonalizeDescribeCampaignRequest;
@class AWSPersonalizeDescribeCampaignResponse;
@class AWSPersonalizeDescribeDatasetGroupRequest;
@class AWSPersonalizeDescribeDatasetGroupResponse;
@class AWSPersonalizeDescribeDatasetImportJobRequest;
@class AWSPersonalizeDescribeDatasetImportJobResponse;
@class AWSPersonalizeDescribeDatasetRequest;
@class AWSPersonalizeDescribeDatasetResponse;
@class AWSPersonalizeDescribeEventTrackerRequest;
@class AWSPersonalizeDescribeEventTrackerResponse;
@class AWSPersonalizeDescribeFeatureTransformationRequest;
@class AWSPersonalizeDescribeFeatureTransformationResponse;
@class AWSPersonalizeDescribeFilterRequest;
@class AWSPersonalizeDescribeFilterResponse;
@class AWSPersonalizeDescribeRecipeRequest;
@class AWSPersonalizeDescribeRecipeResponse;
@class AWSPersonalizeDescribeSchemaRequest;
@class AWSPersonalizeDescribeSchemaResponse;
@class AWSPersonalizeDescribeSolutionRequest;
@class AWSPersonalizeDescribeSolutionResponse;
@class AWSPersonalizeDescribeSolutionVersionRequest;
@class AWSPersonalizeDescribeSolutionVersionResponse;
@class AWSPersonalizeEventTracker;
@class AWSPersonalizeEventTrackerSummary;
@class AWSPersonalizeFeatureTransformation;
@class AWSPersonalizeFilter;
@class AWSPersonalizeFilterSummary;
@class AWSPersonalizeGetSolutionMetricsRequest;
@class AWSPersonalizeGetSolutionMetricsResponse;
@class AWSPersonalizeHPOConfig;
@class AWSPersonalizeHPOObjective;
@class AWSPersonalizeHPOResourceConfig;
@class AWSPersonalizeHyperParameterRanges;
@class AWSPersonalizeIntegerHyperParameterRange;
@class AWSPersonalizeListBatchInferenceJobsRequest;
@class AWSPersonalizeListBatchInferenceJobsResponse;
@class AWSPersonalizeListCampaignsRequest;
@class AWSPersonalizeListCampaignsResponse;
@class AWSPersonalizeListDatasetGroupsRequest;
@class AWSPersonalizeListDatasetGroupsResponse;
@class AWSPersonalizeListDatasetImportJobsRequest;
@class AWSPersonalizeListDatasetImportJobsResponse;
@class AWSPersonalizeListDatasetsRequest;
@class AWSPersonalizeListDatasetsResponse;
@class AWSPersonalizeListEventTrackersRequest;
@class AWSPersonalizeListEventTrackersResponse;
@class AWSPersonalizeListFiltersRequest;
@class AWSPersonalizeListFiltersResponse;
@class AWSPersonalizeListRecipesRequest;
@class AWSPersonalizeListRecipesResponse;
@class AWSPersonalizeListSchemasRequest;
@class AWSPersonalizeListSchemasResponse;
@class AWSPersonalizeListSolutionVersionsRequest;
@class AWSPersonalizeListSolutionVersionsResponse;
@class AWSPersonalizeListSolutionsRequest;
@class AWSPersonalizeListSolutionsResponse;
@class AWSPersonalizeRecipe;
@class AWSPersonalizeRecipeSummary;
@class AWSPersonalizeS3DataConfig;
@class AWSPersonalizeSolution;
@class AWSPersonalizeSolutionConfig;
@class AWSPersonalizeSolutionSummary;
@class AWSPersonalizeSolutionVersion;
@class AWSPersonalizeSolutionVersionSummary;
@class AWSPersonalizeTunedHPOParams;
@class AWSPersonalizeUpdateCampaignRequest;
@class AWSPersonalizeUpdateCampaignResponse;

/**
 <p>Describes a custom algorithm.</p>
 */
@interface AWSPersonalizeAlgorithm : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the algorithm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable algorithmArn;

/**
 <p>The URI of the Docker container for the algorithm image.</p>
 */
@property (nonatomic, strong) AWSPersonalizeAlgorithmImage * _Nullable algorithmImage;

/**
 <p>The date and time (in Unix time) that the algorithm was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>Specifies the default hyperparameters, their ranges, and whether they are tunable. A tunable hyperparameter can have its value determined during hyperparameter optimization (HPO).</p>
 */
@property (nonatomic, strong) AWSPersonalizeDefaultHyperParameterRanges * _Nullable defaultHyperParameterRanges;

/**
 <p>Specifies the default hyperparameters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable defaultHyperParameters;

/**
 <p>Specifies the default maximum number of training jobs and parallel training jobs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable defaultResourceConfig;

/**
 <p>The date and time (in Unix time) that the algorithm was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The name of the algorithm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Resource Name (ARN) of the role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The training input mode.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingInputMode;

@end

/**
 <p>Describes an algorithm image.</p>
 Required parameters: [dockerURI]
 */
@interface AWSPersonalizeAlgorithmImage : AWSModel


/**
 <p>The URI of the Docker container for the algorithm image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dockerURI;

/**
 <p>The name of the algorithm image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>When the solution performs AutoML (<code>performAutoML</code> is true in <a>CreateSolution</a>), Amazon Personalize determines which recipe, from the specified list, optimizes the given metric. Amazon Personalize then uses that recipe for the solution.</p>
 */
@interface AWSPersonalizeAutoMLConfig : AWSModel


/**
 <p>The metric to optimize.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The list of candidate recipes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable recipeList;

@end

/**
 <p>When the solution performs AutoML (<code>performAutoML</code> is true in <a>CreateSolution</a>), specifies the recipe that best optimized the specified metric.</p>
 */
@interface AWSPersonalizeAutoMLResult : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the best recipe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bestRecipeArn;

@end

/**
 <p>Contains information on a batch inference job.</p>
 */
@interface AWSPersonalizeBatchInferenceJob : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the batch inference job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable batchInferenceJobArn;

/**
 <p>The time at which the batch inference job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>If the batch inference job failed, the reason for the failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The ARN of the filter used on the batch inference job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterArn;

/**
 <p>The Amazon S3 path that leads to the input data used to generate the batch inference job.</p>
 */
@property (nonatomic, strong) AWSPersonalizeBatchInferenceJobInput * _Nullable jobInput;

/**
 <p>The name of the batch inference job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The Amazon S3 bucket that contains the output data generated by the batch inference job.</p>
 */
@property (nonatomic, strong) AWSPersonalizeBatchInferenceJobOutput * _Nullable jobOutput;

/**
 <p>The time at which the batch inference job was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The number of recommendations generated by the batch inference job. This number includes the error messages generated for failed input records.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numResults;

/**
 <p>The ARN of the Amazon Identity and Access Management (IAM) role that requested the batch inference job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The Amazon Resource Name (ARN) of the solution version from which the batch inference job was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionVersionArn;

/**
 <p>The status of the batch inference job. The status is one of the following values:</p><ul><li><p>PENDING</p></li><li><p>IN PROGRESS</p></li><li><p>ACTIVE</p></li><li><p>CREATE FAILED</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>The input configuration of a batch inference job.</p>
 Required parameters: [s3DataSource]
 */
@interface AWSPersonalizeBatchInferenceJobInput : AWSModel


/**
 <p>The URI of the Amazon S3 location that contains your input data. The Amazon S3 bucket must be in the same region as the API endpoint you are calling.</p>
 */
@property (nonatomic, strong) AWSPersonalizeS3DataConfig * _Nullable s3DataSource;

@end

/**
 <p>The output configuration parameters of a batch inference job.</p>
 Required parameters: [s3DataDestination]
 */
@interface AWSPersonalizeBatchInferenceJobOutput : AWSModel


/**
 <p>Information on the Amazon S3 bucket in which the batch inference job's output is stored.</p>
 */
@property (nonatomic, strong) AWSPersonalizeS3DataConfig * _Nullable s3DataDestination;

@end

/**
 <p>A truncated version of the <a>BatchInferenceJob</a> datatype. The <a>ListBatchInferenceJobs</a> operation returns a list of batch inference job summaries.</p>
 */
@interface AWSPersonalizeBatchInferenceJobSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the batch inference job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable batchInferenceJobArn;

/**
 <p>The time at which the batch inference job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>If the batch inference job failed, the reason for the failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The name of the batch inference job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The time at which the batch inference job was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The ARN of the solution version used by the batch inference job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionVersionArn;

/**
 <p>The status of the batch inference job. The status is one of the following values:</p><ul><li><p>PENDING</p></li><li><p>IN PROGRESS</p></li><li><p>ACTIVE</p></li><li><p>CREATE FAILED</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Describes a deployed solution version, otherwise known as a campaign. For more information on campaigns, see <a>CreateCampaign</a>.</p>
 */
@interface AWSPersonalizeCampaign : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the campaign. </p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignArn;

/**
 <p>The date and time (in Unix format) that the campaign was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>If a campaign fails, the reason behind the failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The date and time (in Unix format) that the campaign was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>Provides a summary of the properties of a campaign update. For a complete listing, call the <a>DescribeCampaign</a> API.</p>
 */
@property (nonatomic, strong) AWSPersonalizeCampaignUpdateSummary * _Nullable latestCampaignUpdate;

/**
 <p>Specifies the requested minimum provisioned transactions (recommendations) per second.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minProvisionedTPS;

/**
 <p>The name of the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Resource Name (ARN) of a specific version of the solution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionVersionArn;

/**
 <p>The status of the campaign.</p><p>A campaign can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING &gt; DELETE IN_PROGRESS</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Provides a summary of the properties of a campaign. For a complete listing, call the <a>DescribeCampaign</a> API.</p>
 */
@interface AWSPersonalizeCampaignSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignArn;

/**
 <p>The date and time (in Unix time) that the campaign was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>If a campaign fails, the reason behind the failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The date and time (in Unix time) that the campaign was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The name of the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the campaign.</p><p>A campaign can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING &gt; DELETE IN_PROGRESS</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Provides a summary of the properties of a campaign update. For a complete listing, call the <a>DescribeCampaign</a> API.</p>
 */
@interface AWSPersonalizeCampaignUpdateSummary : AWSModel


/**
 <p>The date and time (in Unix time) that the campaign update was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>If a campaign update fails, the reason behind the failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The date and time (in Unix time) that the campaign update was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>Specifies the requested minimum provisioned transactions (recommendations) per second that Amazon Personalize will support.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minProvisionedTPS;

/**
 <p>The Amazon Resource Name (ARN) of the deployed solution version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionVersionArn;

/**
 <p>The status of the campaign update.</p><p>A campaign update can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING &gt; DELETE IN_PROGRESS</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Provides the name and range of a categorical hyperparameter.</p>
 */
@interface AWSPersonalizeCategoricalHyperParameterRange : AWSModel


/**
 <p>The name of the hyperparameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of the categories for the hyperparameter.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Provides the name and range of a continuous hyperparameter.</p>
 */
@interface AWSPersonalizeContinuousHyperParameterRange : AWSModel


/**
 <p>The maximum allowable value for the hyperparameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxValue;

/**
 <p>The minimum allowable value for the hyperparameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minValue;

/**
 <p>The name of the hyperparameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSPersonalizeCreateBatchInferenceJobRequest : AWSRequest


/**
 <p>The ARN of the filter to apply to the batch inference job. For more information on using filters, see Using Filters with Amazon Personalize.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterArn;

/**
 <p>The Amazon S3 path that leads to the input file to base your recommendations on. The input material must be in JSON format.</p>
 */
@property (nonatomic, strong) AWSPersonalizeBatchInferenceJobInput * _Nullable jobInput;

/**
 <p>The name of the batch inference job to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The path to the Amazon S3 bucket where the job's output will be stored.</p>
 */
@property (nonatomic, strong) AWSPersonalizeBatchInferenceJobOutput * _Nullable jobOutput;

/**
 <p>The number of recommendations to retreive.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numResults;

/**
 <p>The ARN of the Amazon Identity and Access Management role that has permissions to read and write to your input and out Amazon S3 buckets respectively.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The Amazon Resource Name (ARN) of the solution version that will be used to generate the batch inference recommendations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionVersionArn;

@end

/**
 
 */
@interface AWSPersonalizeCreateBatchInferenceJobResponse : AWSModel


/**
 <p>The ARN of the batch inference job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable batchInferenceJobArn;

@end

/**
 
 */
@interface AWSPersonalizeCreateCampaignRequest : AWSRequest


/**
 <p>Specifies the requested minimum provisioned transactions (recommendations) per second that Amazon Personalize will support.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minProvisionedTPS;

/**
 <p>A name for the new campaign. The campaign name must be unique within your account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Resource Name (ARN) of the solution version to deploy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionVersionArn;

@end

/**
 
 */
@interface AWSPersonalizeCreateCampaignResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignArn;

@end

/**
 
 */
@interface AWSPersonalizeCreateDatasetGroupRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of a KMS key used to encrypt the datasets.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyArn;

/**
 <p>The name for the new dataset group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ARN of the IAM role that has permissions to access the KMS key. Supplying an IAM role is only valid when also specifying a KMS key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSPersonalizeCreateDatasetGroupResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the new dataset group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetGroupArn;

@end

/**
 
 */
@interface AWSPersonalizeCreateDatasetImportJobRequest : AWSRequest


/**
 <p>The Amazon S3 bucket that contains the training data to import.</p>
 */
@property (nonatomic, strong) AWSPersonalizeDataSource * _Nullable dataSource;

/**
 <p>The ARN of the dataset that receives the imported data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetArn;

/**
 <p>The name for the dataset import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The ARN of the IAM role that has permissions to read from the Amazon S3 data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSPersonalizeCreateDatasetImportJobResponse : AWSModel


/**
 <p>The ARN of the dataset import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetImportJobArn;

@end

/**
 
 */
@interface AWSPersonalizeCreateDatasetRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the dataset group to add the dataset to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetGroupArn;

/**
 <p>The type of dataset.</p><p>One of the following (case insensitive) values:</p><ul><li><p>Interactions</p></li><li><p>Items</p></li><li><p>Users</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable datasetType;

/**
 <p>The name for the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ARN of the schema to associate with the dataset. The schema defines the dataset fields.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaArn;

@end

/**
 
 */
@interface AWSPersonalizeCreateDatasetResponse : AWSModel


/**
 <p>The ARN of the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetArn;

@end

/**
 
 */
@interface AWSPersonalizeCreateEventTrackerRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the dataset group that receives the event data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetGroupArn;

/**
 <p>The name for the event tracker.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSPersonalizeCreateEventTrackerResponse : AWSModel


/**
 <p>The ARN of the event tracker.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventTrackerArn;

/**
 <p>The ID of the event tracker. Include this ID in requests to the <a href="https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html">PutEvents</a> API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackingId;

@end

/**
 
 */
@interface AWSPersonalizeCreateFilterRequest : AWSRequest


/**
 <p>The ARN of the dataset group that the filter will belong to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetGroupArn;

/**
 <p>The filter expression that designates the interaction types that the filter will filter out. A filter expression must follow the following format:</p><p><code>EXCLUDE itemId WHERE INTERACTIONS.event_type in ("EVENT_TYPE")</code></p><p>Where "EVENT_TYPE" is the type of event to filter out. To filter out all items with any interactions history, set <code>"*"</code> as the EVENT_TYPE. For more information, see Using Filters with Amazon Personalize.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterExpression;

/**
 <p>The name of the filter to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSPersonalizeCreateFilterResponse : AWSModel


/**
 <p>The ARN of the new filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterArn;

@end

/**
 
 */
@interface AWSPersonalizeCreateSchemaRequest : AWSRequest


/**
 <p>The name for the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A schema in Avro JSON format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schema;

@end

/**
 
 */
@interface AWSPersonalizeCreateSchemaResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the created schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaArn;

@end

/**
 
 */
@interface AWSPersonalizeCreateSolutionRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the dataset group that provides the training data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetGroupArn;

/**
 <p>When your have multiple event types (using an <code>EVENT_TYPE</code> schema field), this parameter specifies which event type (for example, 'click' or 'like') is used for training the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventType;

/**
 <p>The name for the solution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Whether to perform automated machine learning (AutoML). The default is <code>false</code>. For this case, you must specify <code>recipeArn</code>.</p><p>When set to <code>true</code>, Amazon Personalize analyzes your training data and selects the optimal USER_PERSONALIZATION recipe and hyperparameters. In this case, you must omit <code>recipeArn</code>. Amazon Personalize determines the optimal recipe by running tests with different values for the hyperparameters. AutoML lengthens the training process as compared to selecting a specific recipe.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable performAutoML;

/**
 <p>Whether to perform hyperparameter optimization (HPO) on the specified or selected recipe. The default is <code>false</code>.</p><p>When performing AutoML, this parameter is always <code>true</code> and you should not set it to <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable performHPO;

/**
 <p>The ARN of the recipe to use for model training. Only specified when <code>performAutoML</code> is false.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recipeArn;

/**
 <p>The configuration to use with the solution. When <code>performAutoML</code> is set to true, Amazon Personalize only evaluates the <code>autoMLConfig</code> section of the solution configuration.</p>
 */
@property (nonatomic, strong) AWSPersonalizeSolutionConfig * _Nullable solutionConfig;

@end

/**
 
 */
@interface AWSPersonalizeCreateSolutionResponse : AWSModel


/**
 <p>The ARN of the solution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionArn;

@end

/**
 
 */
@interface AWSPersonalizeCreateSolutionVersionRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the solution containing the training configuration information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionArn;

/**
 <p>The scope of training to be performed when creating the solution version. The <code>FULL</code> option trains the solution version based on the entirety of the input solution's training data, while the <code>UPDATE</code> option processes only the data that has changed in comparison to the input solution. Choose <code>UPDATE</code> when you want to incrementally update your solution version instead of creating an entirely new one.</p><important><p>The <code>UPDATE</code> option can only be used when you already have an active solution version created from the input solution using the <code>FULL</code> option and the input solution was trained with the <a>native-recipe-hrnn-coldstart</a> recipe.</p></important>
 */
@property (nonatomic, assign) AWSPersonalizeTrainingMode trainingMode;

@end

/**
 
 */
@interface AWSPersonalizeCreateSolutionVersionResponse : AWSModel


/**
 <p>The ARN of the new solution version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionVersionArn;

@end

/**
 <p>Describes the data source that contains the data to upload to a dataset.</p>
 */
@interface AWSPersonalizeDataSource : AWSModel


/**
 <p>The path to the Amazon S3 bucket where the data that you want to upload to your dataset is stored. For example: </p><p><code>s3://bucket-name/training-data.csv</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable dataLocation;

@end

/**
 <p>Provides metadata for a dataset.</p>
 */
@interface AWSPersonalizeDataset : AWSModel


/**
 <p>The creation date and time (in Unix time) of the dataset.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The Amazon Resource Name (ARN) of the dataset that you want metadata for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetArn;

/**
 <p>The Amazon Resource Name (ARN) of the dataset group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetGroupArn;

/**
 <p>One of the following values:</p><ul><li><p>Interactions</p></li><li><p>Items</p></li><li><p>Users</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable datasetType;

/**
 <p>A time stamp that shows when the dataset was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The name of the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ARN of the associated schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaArn;

/**
 <p>The status of the dataset.</p><p>A dataset can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING &gt; DELETE IN_PROGRESS</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>A dataset group is a collection of related datasets (Interactions, User, and Item). You create a dataset group by calling <a>CreateDatasetGroup</a>. You then create a dataset and add it to a dataset group by calling <a>CreateDataset</a>. The dataset group is used to create and train a solution by calling <a>CreateSolution</a>. A dataset group can contain only one of each type of dataset.</p><p>You can specify an AWS Key Management Service (KMS) key to encrypt the datasets in the group.</p>
 */
@interface AWSPersonalizeDatasetGroup : AWSModel


/**
 <p>The creation date and time (in Unix time) of the dataset group.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The Amazon Resource Name (ARN) of the dataset group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetGroupArn;

/**
 <p>If creating a dataset group fails, provides the reason why.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The Amazon Resource Name (ARN) of the KMS key used to encrypt the datasets.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyArn;

/**
 <p>The last update date and time (in Unix time) of the dataset group.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The name of the dataset group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ARN of the IAM role that has permissions to create the dataset group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The current status of the dataset group.</p><p>A dataset group can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Provides a summary of the properties of a dataset group. For a complete listing, call the <a>DescribeDatasetGroup</a> API.</p>
 */
@interface AWSPersonalizeDatasetGroupSummary : AWSModel


/**
 <p>The date and time (in Unix time) that the dataset group was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The Amazon Resource Name (ARN) of the dataset group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetGroupArn;

/**
 <p>If creating a dataset group fails, the reason behind the failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The date and time (in Unix time) that the dataset group was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The name of the dataset group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the dataset group.</p><p>A dataset group can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Describes a job that imports training data from a data source (Amazon S3 bucket) to an Amazon Personalize dataset. For more information, see <a>CreateDatasetImportJob</a>.</p><p>A dataset import job can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li></ul>
 */
@interface AWSPersonalizeDatasetImportJob : AWSModel


/**
 <p>The creation date and time (in Unix time) of the dataset import job.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The Amazon S3 bucket that contains the training data to import.</p>
 */
@property (nonatomic, strong) AWSPersonalizeDataSource * _Nullable dataSource;

/**
 <p>The Amazon Resource Name (ARN) of the dataset that receives the imported data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetArn;

/**
 <p>The ARN of the dataset import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetImportJobArn;

/**
 <p>If a dataset import job fails, provides the reason why.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The name of the import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The date and time (in Unix time) the dataset was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The ARN of the AWS Identity and Access Management (IAM) role that has permissions to read from the Amazon S3 data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The status of the dataset import job.</p><p>A dataset import job can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Provides a summary of the properties of a dataset import job. For a complete listing, call the <a>DescribeDatasetImportJob</a> API.</p>
 */
@interface AWSPersonalizeDatasetImportJobSummary : AWSModel


/**
 <p>The date and time (in Unix time) that the dataset import job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The Amazon Resource Name (ARN) of the dataset import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetImportJobArn;

/**
 <p>If a dataset import job fails, the reason behind the failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The name of the dataset import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The date and time (in Unix time) that the dataset was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The status of the dataset import job.</p><p>A dataset import job can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Describes the schema for a dataset. For more information on schemas, see <a>CreateSchema</a>.</p>
 */
@interface AWSPersonalizeDatasetSchema : AWSModel


/**
 <p>The date and time (in Unix time) that the schema was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The date and time (in Unix time) that the schema was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The name of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schema;

/**
 <p>The Amazon Resource Name (ARN) of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaArn;

@end

/**
 <p>Provides a summary of the properties of a dataset schema. For a complete listing, call the <a>DescribeSchema</a> API.</p>
 */
@interface AWSPersonalizeDatasetSchemaSummary : AWSModel


/**
 <p>The date and time (in Unix time) that the schema was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The date and time (in Unix time) that the schema was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The name of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Resource Name (ARN) of the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaArn;

@end

/**
 <p>Provides a summary of the properties of a dataset. For a complete listing, call the <a>DescribeDataset</a> API.</p>
 */
@interface AWSPersonalizeDatasetSummary : AWSModel


/**
 <p>The date and time (in Unix time) that the dataset was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The Amazon Resource Name (ARN) of the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetArn;

/**
 <p>The dataset type. One of the following values:</p><ul><li><p>Interactions</p></li><li><p>Items</p></li><li><p>Users</p></li><li><p>Event-Interactions</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable datasetType;

/**
 <p>The date and time (in Unix time) that the dataset was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The name of the dataset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the dataset.</p><p>A dataset can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING &gt; DELETE IN_PROGRESS</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Provides the name and default range of a categorical hyperparameter and whether the hyperparameter is tunable. A tunable hyperparameter can have its value determined during hyperparameter optimization (HPO).</p>
 */
@interface AWSPersonalizeDefaultCategoricalHyperParameterRange : AWSModel


/**
 <p>Whether the hyperparameter is tunable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTunable;

/**
 <p>The name of the hyperparameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of the categories for the hyperparameter.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Provides the name and default range of a continuous hyperparameter and whether the hyperparameter is tunable. A tunable hyperparameter can have its value determined during hyperparameter optimization (HPO).</p>
 */
@interface AWSPersonalizeDefaultContinuousHyperParameterRange : AWSModel


/**
 <p>Whether the hyperparameter is tunable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTunable;

/**
 <p>The maximum allowable value for the hyperparameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxValue;

/**
 <p>The minimum allowable value for the hyperparameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minValue;

/**
 <p>The name of the hyperparameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Specifies the hyperparameters and their default ranges. Hyperparameters can be categorical, continuous, or integer-valued.</p>
 */
@interface AWSPersonalizeDefaultHyperParameterRanges : AWSModel


/**
 <p>The categorical hyperparameters and their default ranges.</p>
 */
@property (nonatomic, strong) NSArray<AWSPersonalizeDefaultCategoricalHyperParameterRange *> * _Nullable categoricalHyperParameterRanges;

/**
 <p>The continuous hyperparameters and their default ranges.</p>
 */
@property (nonatomic, strong) NSArray<AWSPersonalizeDefaultContinuousHyperParameterRange *> * _Nullable continuousHyperParameterRanges;

/**
 <p>The integer-valued hyperparameters and their default ranges.</p>
 */
@property (nonatomic, strong) NSArray<AWSPersonalizeDefaultIntegerHyperParameterRange *> * _Nullable integerHyperParameterRanges;

@end

/**
 <p>Provides the name and default range of a integer-valued hyperparameter and whether the hyperparameter is tunable. A tunable hyperparameter can have its value determined during hyperparameter optimization (HPO).</p>
 */
@interface AWSPersonalizeDefaultIntegerHyperParameterRange : AWSModel


/**
 <p>Indicates whether the hyperparameter is tunable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTunable;

/**
 <p>The maximum allowable value for the hyperparameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxValue;

/**
 <p>The minimum allowable value for the hyperparameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minValue;

/**
 <p>The name of the hyperparameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSPersonalizeDeleteCampaignRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the campaign to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignArn;

@end

/**
 
 */
@interface AWSPersonalizeDeleteDatasetGroupRequest : AWSRequest


/**
 <p>The ARN of the dataset group to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetGroupArn;

@end

/**
 
 */
@interface AWSPersonalizeDeleteDatasetRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the dataset to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetArn;

@end

/**
 
 */
@interface AWSPersonalizeDeleteEventTrackerRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the event tracker to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventTrackerArn;

@end

/**
 
 */
@interface AWSPersonalizeDeleteFilterRequest : AWSRequest


/**
 <p>The ARN of the filter to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterArn;

@end

/**
 
 */
@interface AWSPersonalizeDeleteSchemaRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the schema to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaArn;

@end

/**
 
 */
@interface AWSPersonalizeDeleteSolutionRequest : AWSRequest


/**
 <p>The ARN of the solution to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionArn;

@end

/**
 
 */
@interface AWSPersonalizeDescribeAlgorithmRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the algorithm to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable algorithmArn;

@end

/**
 
 */
@interface AWSPersonalizeDescribeAlgorithmResponse : AWSModel


/**
 <p>A listing of the properties of the algorithm.</p>
 */
@property (nonatomic, strong) AWSPersonalizeAlgorithm * _Nullable algorithm;

@end

/**
 
 */
@interface AWSPersonalizeDescribeBatchInferenceJobRequest : AWSRequest


/**
 <p>The ARN of the batch inference job to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable batchInferenceJobArn;

@end

/**
 
 */
@interface AWSPersonalizeDescribeBatchInferenceJobResponse : AWSModel


/**
 <p>Information on the specified batch inference job.</p>
 */
@property (nonatomic, strong) AWSPersonalizeBatchInferenceJob * _Nullable batchInferenceJob;

@end

/**
 
 */
@interface AWSPersonalizeDescribeCampaignRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignArn;

@end

/**
 
 */
@interface AWSPersonalizeDescribeCampaignResponse : AWSModel


/**
 <p>The properties of the campaign.</p>
 */
@property (nonatomic, strong) AWSPersonalizeCampaign * _Nullable campaign;

@end

/**
 
 */
@interface AWSPersonalizeDescribeDatasetGroupRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the dataset group to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetGroupArn;

@end

/**
 
 */
@interface AWSPersonalizeDescribeDatasetGroupResponse : AWSModel


/**
 <p>A listing of the dataset group's properties.</p>
 */
@property (nonatomic, strong) AWSPersonalizeDatasetGroup * _Nullable datasetGroup;

@end

/**
 
 */
@interface AWSPersonalizeDescribeDatasetImportJobRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the dataset import job to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetImportJobArn;

@end

/**
 
 */
@interface AWSPersonalizeDescribeDatasetImportJobResponse : AWSModel


/**
 <p>Information about the dataset import job, including the status.</p><p>The status is one of the following values:</p><ul><li><p>CREATE PENDING</p></li><li><p>CREATE IN_PROGRESS</p></li><li><p>ACTIVE</p></li><li><p>CREATE FAILED</p></li></ul>
 */
@property (nonatomic, strong) AWSPersonalizeDatasetImportJob * _Nullable datasetImportJob;

@end

/**
 
 */
@interface AWSPersonalizeDescribeDatasetRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the dataset to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetArn;

@end

/**
 
 */
@interface AWSPersonalizeDescribeDatasetResponse : AWSModel


/**
 <p>A listing of the dataset's properties.</p>
 */
@property (nonatomic, strong) AWSPersonalizeDataset * _Nullable dataset;

@end

/**
 
 */
@interface AWSPersonalizeDescribeEventTrackerRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the event tracker to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventTrackerArn;

@end

/**
 
 */
@interface AWSPersonalizeDescribeEventTrackerResponse : AWSModel


/**
 <p>An object that describes the event tracker.</p>
 */
@property (nonatomic, strong) AWSPersonalizeEventTracker * _Nullable eventTracker;

@end

/**
 
 */
@interface AWSPersonalizeDescribeFeatureTransformationRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the feature transformation to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable featureTransformationArn;

@end

/**
 
 */
@interface AWSPersonalizeDescribeFeatureTransformationResponse : AWSModel


/**
 <p>A listing of the FeatureTransformation properties.</p>
 */
@property (nonatomic, strong) AWSPersonalizeFeatureTransformation * _Nullable featureTransformation;

@end

/**
 
 */
@interface AWSPersonalizeDescribeFilterRequest : AWSRequest


/**
 <p>The ARN of the filter to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterArn;

@end

/**
 
 */
@interface AWSPersonalizeDescribeFilterResponse : AWSModel


/**
 <p>The filter's details.</p>
 */
@property (nonatomic, strong) AWSPersonalizeFilter * _Nullable filter;

@end

/**
 
 */
@interface AWSPersonalizeDescribeRecipeRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the recipe to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recipeArn;

@end

/**
 
 */
@interface AWSPersonalizeDescribeRecipeResponse : AWSModel


/**
 <p>An object that describes the recipe.</p>
 */
@property (nonatomic, strong) AWSPersonalizeRecipe * _Nullable recipe;

@end

/**
 
 */
@interface AWSPersonalizeDescribeSchemaRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the schema to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaArn;

@end

/**
 
 */
@interface AWSPersonalizeDescribeSchemaResponse : AWSModel


/**
 <p>The requested schema.</p>
 */
@property (nonatomic, strong) AWSPersonalizeDatasetSchema * _Nullable schema;

@end

/**
 
 */
@interface AWSPersonalizeDescribeSolutionRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the solution to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionArn;

@end

/**
 
 */
@interface AWSPersonalizeDescribeSolutionResponse : AWSModel


/**
 <p>An object that describes the solution.</p>
 */
@property (nonatomic, strong) AWSPersonalizeSolution * _Nullable solution;

@end

/**
 
 */
@interface AWSPersonalizeDescribeSolutionVersionRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the solution version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionVersionArn;

@end

/**
 
 */
@interface AWSPersonalizeDescribeSolutionVersionResponse : AWSModel


/**
 <p>The solution version.</p>
 */
@property (nonatomic, strong) AWSPersonalizeSolutionVersion * _Nullable solutionVersion;

@end

/**
 <p>Provides information about an event tracker.</p>
 */
@interface AWSPersonalizeEventTracker : AWSModel


/**
 <p>The Amazon AWS account that owns the event tracker.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The date and time (in Unix format) that the event tracker was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The Amazon Resource Name (ARN) of the dataset group that receives the event data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetGroupArn;

/**
 <p>The ARN of the event tracker.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventTrackerArn;

/**
 <p>The date and time (in Unix time) that the event tracker was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The name of the event tracker.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the event tracker.</p><p>An event tracker can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING &gt; DELETE IN_PROGRESS</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The ID of the event tracker. Include this ID in requests to the <a href="https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html">PutEvents</a> API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackingId;

@end

/**
 <p>Provides a summary of the properties of an event tracker. For a complete listing, call the <a>DescribeEventTracker</a> API.</p>
 */
@interface AWSPersonalizeEventTrackerSummary : AWSModel


/**
 <p>The date and time (in Unix time) that the event tracker was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The Amazon Resource Name (ARN) of the event tracker.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventTrackerArn;

/**
 <p>The date and time (in Unix time) that the event tracker was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The name of the event tracker.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the event tracker.</p><p>An event tracker can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING &gt; DELETE IN_PROGRESS</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Provides feature transformation information. Feature transformation is the process of modifying raw input data into a form more suitable for model training.</p>
 */
@interface AWSPersonalizeFeatureTransformation : AWSModel


/**
 <p>The creation date and time (in Unix time) of the feature transformation.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>Provides the default parameters for feature transformation.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable defaultParameters;

/**
 <p>The Amazon Resource Name (ARN) of the FeatureTransformation object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable featureTransformationArn;

/**
 <p>The last update date and time (in Unix time) of the feature transformation.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The name of the feature transformation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the feature transformation.</p><p>A feature transformation can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Contains information on a recommendation filter, including its ARN, status, and filter expression.</p>
 */
@interface AWSPersonalizeFilter : AWSModel


/**
 <p>The time at which the filter was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The ARN of the dataset group to which the filter belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetGroupArn;

/**
 <p>If the filter failed, the reason for its failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The ARN of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterArn;

/**
 <p>Specifies the type of item interactions to filter out of recommendation results. The filter expression must follow the following format:</p><p><code>EXCLUDE itemId WHERE INTERACTIONS.event_type in ("EVENT_TYPE")</code></p><p>Where "EVENT_TYPE" is the type of event to filter out. For more information, see Using Filters with Amazon Personalize.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterExpression;

/**
 <p>The time at which the filter was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The name of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>A short summary of a filter's attributes.</p>
 */
@interface AWSPersonalizeFilterSummary : AWSModel


/**
 <p>The time at which the filter was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The ARN of the dataset group to which the filter belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetGroupArn;

/**
 <p>If the filter failed, the reason for the failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The ARN of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterArn;

/**
 <p>The time at which the filter was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The name of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 
 */
@interface AWSPersonalizeGetSolutionMetricsRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the solution version for which to get metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionVersionArn;

@end

/**
 
 */
@interface AWSPersonalizeGetSolutionMetricsResponse : AWSModel


/**
 <p>The metrics for the solution version.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable metrics;

/**
 <p>The same solution version ARN as specified in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionVersionArn;

@end

/**
 <p>Describes the properties for hyperparameter optimization (HPO). For use with the bring-your-own-recipe feature. Do not use for Amazon Personalize native recipes.</p>
 */
@interface AWSPersonalizeHPOConfig : AWSModel


/**
 <p>The hyperparameters and their allowable ranges.</p>
 */
@property (nonatomic, strong) AWSPersonalizeHyperParameterRanges * _Nullable algorithmHyperParameterRanges;

/**
 <p>The metric to optimize during HPO.</p>
 */
@property (nonatomic, strong) AWSPersonalizeHPOObjective * _Nullable hpoObjective;

/**
 <p>Describes the resource configuration for HPO.</p>
 */
@property (nonatomic, strong) AWSPersonalizeHPOResourceConfig * _Nullable hpoResourceConfig;

@end

/**
 <p>The metric to optimize during hyperparameter optimization (HPO).</p>
 */
@interface AWSPersonalizeHPOObjective : AWSModel


/**
 <p>The name of the metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>A regular expression for finding the metric in the training job logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricRegex;

/**
 <p>The type of the metric. Valid values are <code>Maximize</code> and <code>Minimize</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>Describes the resource configuration for hyperparameter optimization (HPO).</p>
 */
@interface AWSPersonalizeHPOResourceConfig : AWSModel


/**
 <p>The maximum number of training jobs when you create a solution version. The maximum value for <code>maxNumberOfTrainingJobs</code> is <code>40</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxNumberOfTrainingJobs;

/**
 <p>The maximum number of parallel training jobs when you create a solution version. The maximum value for <code>maxParallelTrainingJobs</code> is <code>10</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxParallelTrainingJobs;

@end

/**
 <p>Specifies the hyperparameters and their ranges. Hyperparameters can be categorical, continuous, or integer-valued.</p>
 */
@interface AWSPersonalizeHyperParameterRanges : AWSModel


/**
 <p>The categorical hyperparameters and their ranges.</p>
 */
@property (nonatomic, strong) NSArray<AWSPersonalizeCategoricalHyperParameterRange *> * _Nullable categoricalHyperParameterRanges;

/**
 <p>The continuous hyperparameters and their ranges.</p>
 */
@property (nonatomic, strong) NSArray<AWSPersonalizeContinuousHyperParameterRange *> * _Nullable continuousHyperParameterRanges;

/**
 <p>The integer-valued hyperparameters and their ranges.</p>
 */
@property (nonatomic, strong) NSArray<AWSPersonalizeIntegerHyperParameterRange *> * _Nullable integerHyperParameterRanges;

@end

/**
 <p>Provides the name and range of an integer-valued hyperparameter.</p>
 */
@interface AWSPersonalizeIntegerHyperParameterRange : AWSModel


/**
 <p>The maximum allowable value for the hyperparameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxValue;

/**
 <p>The minimum allowable value for the hyperparameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minValue;

/**
 <p>The name of the hyperparameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSPersonalizeListBatchInferenceJobsRequest : AWSRequest


/**
 <p>The maximum number of batch inference job results to return in each page. The default value is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to request the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The Amazon Resource Name (ARN) of the solution version from which the batch inference jobs were created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionVersionArn;

@end

/**
 
 */
@interface AWSPersonalizeListBatchInferenceJobsResponse : AWSModel


/**
 <p>A list containing information on each job that is returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSPersonalizeBatchInferenceJobSummary *> * _Nullable batchInferenceJobs;

/**
 <p>The token to use to retreive the next page of results. The value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPersonalizeListCampaignsRequest : AWSRequest


/**
 <p>The maximum number of campaigns to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token returned from the previous call to <code>ListCampaigns</code> for getting the next set of campaigns (if they exist).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The Amazon Resource Name (ARN) of the solution to list the campaigns for. When a solution is not specified, all the campaigns associated with the account are listed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionArn;

@end

/**
 
 */
@interface AWSPersonalizeListCampaignsResponse : AWSModel


/**
 <p>A list of the campaigns.</p>
 */
@property (nonatomic, strong) NSArray<AWSPersonalizeCampaignSummary *> * _Nullable campaigns;

/**
 <p>A token for getting the next set of campaigns (if they exist).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPersonalizeListDatasetGroupsRequest : AWSRequest


/**
 <p>The maximum number of dataset groups to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token returned from the previous call to <code>ListDatasetGroups</code> for getting the next set of dataset groups (if they exist).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPersonalizeListDatasetGroupsResponse : AWSModel


/**
 <p>The list of your dataset groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSPersonalizeDatasetGroupSummary *> * _Nullable datasetGroups;

/**
 <p>A token for getting the next set of dataset groups (if they exist).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPersonalizeListDatasetImportJobsRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the dataset to list the dataset import jobs for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetArn;

/**
 <p>The maximum number of dataset import jobs to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token returned from the previous call to <code>ListDatasetImportJobs</code> for getting the next set of dataset import jobs (if they exist).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPersonalizeListDatasetImportJobsResponse : AWSModel


/**
 <p>The list of dataset import jobs.</p>
 */
@property (nonatomic, strong) NSArray<AWSPersonalizeDatasetImportJobSummary *> * _Nullable datasetImportJobs;

/**
 <p>A token for getting the next set of dataset import jobs (if they exist).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPersonalizeListDatasetsRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the dataset group that contains the datasets to list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetGroupArn;

/**
 <p>The maximum number of datasets to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token returned from the previous call to <code>ListDatasetImportJobs</code> for getting the next set of dataset import jobs (if they exist).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPersonalizeListDatasetsResponse : AWSModel


/**
 <p>An array of <code>Dataset</code> objects. Each object provides metadata information.</p>
 */
@property (nonatomic, strong) NSArray<AWSPersonalizeDatasetSummary *> * _Nullable datasets;

/**
 <p>A token for getting the next set of datasets (if they exist).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPersonalizeListEventTrackersRequest : AWSRequest


/**
 <p>The ARN of a dataset group used to filter the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetGroupArn;

/**
 <p>The maximum number of event trackers to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token returned from the previous call to <code>ListEventTrackers</code> for getting the next set of event trackers (if they exist).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPersonalizeListEventTrackersResponse : AWSModel


/**
 <p>A list of event trackers.</p>
 */
@property (nonatomic, strong) NSArray<AWSPersonalizeEventTrackerSummary *> * _Nullable eventTrackers;

/**
 <p>A token for getting the next set of event trackers (if they exist).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPersonalizeListFiltersRequest : AWSRequest


/**
 <p>The ARN of the dataset group that contains the filters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetGroupArn;

/**
 <p>The maximum number of filters to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token returned from the previous call to <code>ListFilters</code> for getting the next set of filters (if they exist).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPersonalizeListFiltersResponse : AWSModel


/**
 <p>A list of returned filters.</p>
 */
@property (nonatomic, strong) NSArray<AWSPersonalizeFilterSummary *> * _Nullable filters;

/**
 <p>A token for getting the next set of filters (if they exist).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPersonalizeListRecipesRequest : AWSRequest


/**
 <p>The maximum number of recipes to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token returned from the previous call to <code>ListRecipes</code> for getting the next set of recipes (if they exist).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The default is <code>SERVICE</code>.</p>
 */
@property (nonatomic, assign) AWSPersonalizeRecipeProvider recipeProvider;

@end

/**
 
 */
@interface AWSPersonalizeListRecipesResponse : AWSModel


/**
 <p>A token for getting the next set of recipes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of available recipes.</p>
 */
@property (nonatomic, strong) NSArray<AWSPersonalizeRecipeSummary *> * _Nullable recipes;

@end

/**
 
 */
@interface AWSPersonalizeListSchemasRequest : AWSRequest


/**
 <p>The maximum number of schemas to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token returned from the previous call to <code>ListSchemas</code> for getting the next set of schemas (if they exist).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPersonalizeListSchemasResponse : AWSModel


/**
 <p>A token used to get the next set of schemas (if they exist).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of schemas.</p>
 */
@property (nonatomic, strong) NSArray<AWSPersonalizeDatasetSchemaSummary *> * _Nullable schemas;

@end

/**
 
 */
@interface AWSPersonalizeListSolutionVersionsRequest : AWSRequest


/**
 <p>The maximum number of solution versions to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token returned from the previous call to <code>ListSolutionVersions</code> for getting the next set of solution versions (if they exist).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The Amazon Resource Name (ARN) of the solution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionArn;

@end

/**
 
 */
@interface AWSPersonalizeListSolutionVersionsResponse : AWSModel


/**
 <p>A token for getting the next set of solution versions (if they exist).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of solution versions describing the version properties.</p>
 */
@property (nonatomic, strong) NSArray<AWSPersonalizeSolutionVersionSummary *> * _Nullable solutionVersions;

@end

/**
 
 */
@interface AWSPersonalizeListSolutionsRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the dataset group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetGroupArn;

/**
 <p>The maximum number of solutions to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token returned from the previous call to <code>ListSolutions</code> for getting the next set of solutions (if they exist).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPersonalizeListSolutionsResponse : AWSModel


/**
 <p>A token for getting the next set of solutions (if they exist).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of the current solutions.</p>
 */
@property (nonatomic, strong) NSArray<AWSPersonalizeSolutionSummary *> * _Nullable solutions;

@end

/**
 <p>Provides information about a recipe. Each recipe provides an algorithm that Amazon Personalize uses in model training when you use the <a>CreateSolution</a> operation. </p>
 */
@interface AWSPersonalizeRecipe : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the algorithm that Amazon Personalize uses to train the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable algorithmArn;

/**
 <p>The date and time (in Unix format) that the recipe was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The description of the recipe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN of the FeatureTransformation object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable featureTransformationArn;

/**
 <p>The date and time (in Unix format) that the recipe was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The name of the recipe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Resource Name (ARN) of the recipe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recipeArn;

/**
 <p>One of the following values:</p><ul><li><p>PERSONALIZED_RANKING</p></li><li><p>RELATED_ITEMS</p></li><li><p>USER_PERSONALIZATION</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable recipeType;

/**
 <p>The status of the recipe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Provides a summary of the properties of a recipe. For a complete listing, call the <a>DescribeRecipe</a> API.</p>
 */
@interface AWSPersonalizeRecipeSummary : AWSModel


/**
 <p>The date and time (in Unix time) that the recipe was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The date and time (in Unix time) that the recipe was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The name of the recipe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Resource Name (ARN) of the recipe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recipeArn;

/**
 <p>The status of the recipe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>The configuration details of an Amazon S3 input or output bucket.</p>
 Required parameters: [path]
 */
@interface AWSPersonalizeS3DataConfig : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the Amazon Key Management Service (KMS) key that Amazon Personalize uses to encrypt or decrypt the input and output files of a batch inference job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyArn;

/**
 <p>The file path of the Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

@end

/**
 <p>An object that provides information about a solution. A solution is a trained model that can be deployed as a campaign.</p>
 */
@interface AWSPersonalizeSolution : AWSModel


/**
 <p>When <code>performAutoML</code> is true, specifies the best recipe found.</p>
 */
@property (nonatomic, strong) AWSPersonalizeAutoMLResult * _Nullable autoMLResult;

/**
 <p>The creation date and time (in Unix time) of the solution.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The Amazon Resource Name (ARN) of the dataset group that provides the training data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetGroupArn;

/**
 <p>The event type (for example, 'click' or 'like') that is used for training the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventType;

/**
 <p>The date and time (in Unix time) that the solution was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>Describes the latest version of the solution, including the status and the ARN.</p>
 */
@property (nonatomic, strong) AWSPersonalizeSolutionVersionSummary * _Nullable latestSolutionVersion;

/**
 <p>The name of the solution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>When true, Amazon Personalize performs a search for the best USER_PERSONALIZATION recipe from the list specified in the solution configuration (<code>recipeArn</code> must not be specified). When false (the default), Amazon Personalize uses <code>recipeArn</code> for training.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable performAutoML;

/**
 <p>Whether to perform hyperparameter optimization (HPO) on the chosen recipe. The default is <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable performHPO;

/**
 <p>The ARN of the recipe used to create the solution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recipeArn;

/**
 <p>The ARN of the solution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionArn;

/**
 <p>Describes the configuration properties for the solution.</p>
 */
@property (nonatomic, strong) AWSPersonalizeSolutionConfig * _Nullable solutionConfig;

/**
 <p>The status of the solution.</p><p>A solution can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING &gt; DELETE IN_PROGRESS</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Describes the configuration properties for the solution.</p>
 */
@interface AWSPersonalizeSolutionConfig : AWSModel


/**
 <p>Lists the hyperparameter names and ranges.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable algorithmHyperParameters;

/**
 <p>The <a>AutoMLConfig</a> object containing a list of recipes to search when AutoML is performed.</p>
 */
@property (nonatomic, strong) AWSPersonalizeAutoMLConfig * _Nullable autoMLConfig;

/**
 <p>Only events with a value greater than or equal to this threshold are used for training a model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventValueThreshold;

/**
 <p>Lists the feature transformation parameters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable featureTransformationParameters;

/**
 <p>Describes the properties for hyperparameter optimization (HPO).</p>
 */
@property (nonatomic, strong) AWSPersonalizeHPOConfig * _Nullable hpoConfig;

@end

/**
 <p>Provides a summary of the properties of a solution. For a complete listing, call the <a>DescribeSolution</a> API.</p>
 */
@interface AWSPersonalizeSolutionSummary : AWSModel


/**
 <p>The date and time (in Unix time) that the solution was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The date and time (in Unix time) that the solution was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The name of the solution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Resource Name (ARN) of the solution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionArn;

/**
 <p>The status of the solution.</p><p>A solution can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING &gt; DELETE IN_PROGRESS</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>An object that provides information about a specific version of a <a>Solution</a>.</p>
 */
@interface AWSPersonalizeSolutionVersion : AWSModel


/**
 <p>The date and time (in Unix time) that this version of the solution was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The Amazon Resource Name (ARN) of the dataset group providing the training data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetGroupArn;

/**
 <p>The event type (for example, 'click' or 'like') that is used for training the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventType;

/**
 <p>If training a solution version fails, the reason for the failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The date and time (in Unix time) that the solution was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>When true, Amazon Personalize searches for the most optimal recipe according to the solution configuration. When false (the default), Amazon Personalize uses <code>recipeArn</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable performAutoML;

/**
 <p>Whether to perform hyperparameter optimization (HPO) on the chosen recipe. The default is <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable performHPO;

/**
 <p>The ARN of the recipe used in the solution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recipeArn;

/**
 <p>The ARN of the solution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionArn;

/**
 <p>Describes the configuration properties for the solution.</p>
 */
@property (nonatomic, strong) AWSPersonalizeSolutionConfig * _Nullable solutionConfig;

/**
 <p>The ARN of the solution version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionVersionArn;

/**
 <p>The status of the solution version.</p><p>A solution version can be in one of the following states:</p><ul><li><p>CREATE PENDING</p></li><li><p>CREATE IN_PROGRESS</p></li><li><p>ACTIVE</p></li><li><p>CREATE FAILED</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The time used to train the model. You are billed for the time it takes to train a model. This field is visible only after Amazon Personalize successfully trains a model.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable trainingHours;

/**
 <p>The scope of training used to create the solution version. The <code>FULL</code> option trains the solution version based on the entirety of the input solution's training data, while the <code>UPDATE</code> option processes only the training data that has changed since the creation of the last solution version. Choose <code>UPDATE</code> when you want to start recommending items added to the dataset without retraining the model.</p><important><p>The <code>UPDATE</code> option can only be used after you've created a solution version with the <code>FULL</code> option and the training solution uses the <a>native-recipe-hrnn-coldstart</a>.</p></important>
 */
@property (nonatomic, assign) AWSPersonalizeTrainingMode trainingMode;

/**
 <p>If hyperparameter optimization was performed, contains the hyperparameter values of the best performing model.</p>
 */
@property (nonatomic, strong) AWSPersonalizeTunedHPOParams * _Nullable tunedHPOParams;

@end

/**
 <p>Provides a summary of the properties of a solution version. For a complete listing, call the <a>DescribeSolutionVersion</a> API.</p>
 */
@interface AWSPersonalizeSolutionVersionSummary : AWSModel


/**
 <p>The date and time (in Unix time) that this version of a solution was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>If a solution version fails, the reason behind the failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The date and time (in Unix time) that the solution version was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDateTime;

/**
 <p>The Amazon Resource Name (ARN) of the solution version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionVersionArn;

/**
 <p>The status of the solution version.</p><p>A solution version can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>If hyperparameter optimization (HPO) was performed, contains the hyperparameter values of the best performing model.</p>
 */
@interface AWSPersonalizeTunedHPOParams : AWSModel


/**
 <p>A list of the hyperparameter values of the best performing model.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable algorithmHyperParameters;

@end

/**
 
 */
@interface AWSPersonalizeUpdateCampaignRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the campaign.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignArn;

/**
 <p>Specifies the requested minimum provisioned transactions (recommendations) per second that Amazon Personalize will support.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minProvisionedTPS;

/**
 <p>The ARN of a new solution version to deploy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable solutionVersionArn;

@end

/**
 
 */
@interface AWSPersonalizeUpdateCampaignResponse : AWSModel


/**
 <p>The same campaign ARN as given in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignArn;

@end

NS_ASSUME_NONNULL_END
