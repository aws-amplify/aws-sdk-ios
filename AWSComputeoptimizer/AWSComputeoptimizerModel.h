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

FOUNDATION_EXPORT NSString *const AWSComputeoptimizerErrorDomain;

typedef NS_ENUM(NSInteger, AWSComputeoptimizerErrorType) {
    AWSComputeoptimizerErrorUnknown,
    AWSComputeoptimizerErrorAccessDenied,
    AWSComputeoptimizerErrorInternalServer,
    AWSComputeoptimizerErrorInvalidParameterValue,
    AWSComputeoptimizerErrorLimitExceeded,
    AWSComputeoptimizerErrorMissingAuthenticationToken,
    AWSComputeoptimizerErrorOptInRequired,
    AWSComputeoptimizerErrorResourceNotFound,
    AWSComputeoptimizerErrorServiceUnavailable,
    AWSComputeoptimizerErrorThrottling,
};

typedef NS_ENUM(NSInteger, AWSComputeoptimizerExportableAutoScalingGroupField) {
    AWSComputeoptimizerExportableAutoScalingGroupFieldUnknown,
    AWSComputeoptimizerExportableAutoScalingGroupFieldAccountId,
    AWSComputeoptimizerExportableAutoScalingGroupFieldAutoScalingGroupArn,
    AWSComputeoptimizerExportableAutoScalingGroupFieldAutoScalingGroupName,
    AWSComputeoptimizerExportableAutoScalingGroupFieldFinding,
    AWSComputeoptimizerExportableAutoScalingGroupFieldUtilizationMetricsCpuMaximum,
    AWSComputeoptimizerExportableAutoScalingGroupFieldUtilizationMetricsMemoryMaximum,
    AWSComputeoptimizerExportableAutoScalingGroupFieldLookbackPeriodInDays,
    AWSComputeoptimizerExportableAutoScalingGroupFieldCurrentConfigurationInstanceType,
    AWSComputeoptimizerExportableAutoScalingGroupFieldCurrentConfigurationDesiredCapacity,
    AWSComputeoptimizerExportableAutoScalingGroupFieldCurrentConfigurationMinSize,
    AWSComputeoptimizerExportableAutoScalingGroupFieldCurrentConfigurationMaxSize,
    AWSComputeoptimizerExportableAutoScalingGroupFieldCurrentOnDemandPrice,
    AWSComputeoptimizerExportableAutoScalingGroupFieldCurrentStandardOneYearNoUpfrontReservedPrice,
    AWSComputeoptimizerExportableAutoScalingGroupFieldCurrentStandardThreeYearNoUpfrontReservedPrice,
    AWSComputeoptimizerExportableAutoScalingGroupFieldCurrentVCpus,
    AWSComputeoptimizerExportableAutoScalingGroupFieldCurrentMemory,
    AWSComputeoptimizerExportableAutoScalingGroupFieldCurrentStorage,
    AWSComputeoptimizerExportableAutoScalingGroupFieldCurrentNetwork,
    AWSComputeoptimizerExportableAutoScalingGroupFieldRecommendationOptionsConfigurationInstanceType,
    AWSComputeoptimizerExportableAutoScalingGroupFieldRecommendationOptionsConfigurationDesiredCapacity,
    AWSComputeoptimizerExportableAutoScalingGroupFieldRecommendationOptionsConfigurationMinSize,
    AWSComputeoptimizerExportableAutoScalingGroupFieldRecommendationOptionsConfigurationMaxSize,
    AWSComputeoptimizerExportableAutoScalingGroupFieldRecommendationOptionsProjectedUtilizationMetricsCpuMaximum,
    AWSComputeoptimizerExportableAutoScalingGroupFieldRecommendationOptionsProjectedUtilizationMetricsMemoryMaximum,
    AWSComputeoptimizerExportableAutoScalingGroupFieldRecommendationOptionsPerformanceRisk,
    AWSComputeoptimizerExportableAutoScalingGroupFieldRecommendationOptionsOnDemandPrice,
    AWSComputeoptimizerExportableAutoScalingGroupFieldRecommendationOptionsStandardOneYearNoUpfrontReservedPrice,
    AWSComputeoptimizerExportableAutoScalingGroupFieldRecommendationOptionsStandardThreeYearNoUpfrontReservedPrice,
    AWSComputeoptimizerExportableAutoScalingGroupFieldRecommendationOptionsVcpus,
    AWSComputeoptimizerExportableAutoScalingGroupFieldRecommendationOptionsMemory,
    AWSComputeoptimizerExportableAutoScalingGroupFieldRecommendationOptionsStorage,
    AWSComputeoptimizerExportableAutoScalingGroupFieldRecommendationOptionsNetwork,
    AWSComputeoptimizerExportableAutoScalingGroupFieldLastRefreshTimestamp,
};

typedef NS_ENUM(NSInteger, AWSComputeoptimizerExportableInstanceField) {
    AWSComputeoptimizerExportableInstanceFieldUnknown,
    AWSComputeoptimizerExportableInstanceFieldAccountId,
    AWSComputeoptimizerExportableInstanceFieldInstanceArn,
    AWSComputeoptimizerExportableInstanceFieldInstanceName,
    AWSComputeoptimizerExportableInstanceFieldFinding,
    AWSComputeoptimizerExportableInstanceFieldLookbackPeriodInDays,
    AWSComputeoptimizerExportableInstanceFieldCurrentInstanceType,
    AWSComputeoptimizerExportableInstanceFieldUtilizationMetricsCpuMaximum,
    AWSComputeoptimizerExportableInstanceFieldUtilizationMetricsMemoryMaximum,
    AWSComputeoptimizerExportableInstanceFieldCurrentOnDemandPrice,
    AWSComputeoptimizerExportableInstanceFieldCurrentStandardOneYearNoUpfrontReservedPrice,
    AWSComputeoptimizerExportableInstanceFieldCurrentStandardThreeYearNoUpfrontReservedPrice,
    AWSComputeoptimizerExportableInstanceFieldCurrentVCpus,
    AWSComputeoptimizerExportableInstanceFieldCurrentMemory,
    AWSComputeoptimizerExportableInstanceFieldCurrentStorage,
    AWSComputeoptimizerExportableInstanceFieldCurrentNetwork,
    AWSComputeoptimizerExportableInstanceFieldRecommendationOptionsInstanceType,
    AWSComputeoptimizerExportableInstanceFieldRecommendationOptionsProjectedUtilizationMetricsCpuMaximum,
    AWSComputeoptimizerExportableInstanceFieldRecommendationOptionsProjectedUtilizationMetricsMemoryMaximum,
    AWSComputeoptimizerExportableInstanceFieldRecommendationOptionsPerformanceRisk,
    AWSComputeoptimizerExportableInstanceFieldRecommendationOptionsVcpus,
    AWSComputeoptimizerExportableInstanceFieldRecommendationOptionsMemory,
    AWSComputeoptimizerExportableInstanceFieldRecommendationOptionsStorage,
    AWSComputeoptimizerExportableInstanceFieldRecommendationOptionsNetwork,
    AWSComputeoptimizerExportableInstanceFieldRecommendationOptionsOnDemandPrice,
    AWSComputeoptimizerExportableInstanceFieldRecommendationOptionsStandardOneYearNoUpfrontReservedPrice,
    AWSComputeoptimizerExportableInstanceFieldRecommendationOptionsStandardThreeYearNoUpfrontReservedPrice,
    AWSComputeoptimizerExportableInstanceFieldRecommendationsSourcesRecommendationSourceArn,
    AWSComputeoptimizerExportableInstanceFieldRecommendationsSourcesRecommendationSourceType,
    AWSComputeoptimizerExportableInstanceFieldLastRefreshTimestamp,
};

typedef NS_ENUM(NSInteger, AWSComputeoptimizerFileFormat) {
    AWSComputeoptimizerFileFormatUnknown,
    AWSComputeoptimizerFileFormatCsv,
};

typedef NS_ENUM(NSInteger, AWSComputeoptimizerFilterName) {
    AWSComputeoptimizerFilterNameUnknown,
    AWSComputeoptimizerFilterNameFinding,
    AWSComputeoptimizerFilterNameRecommendationSourceType,
};

typedef NS_ENUM(NSInteger, AWSComputeoptimizerFinding) {
    AWSComputeoptimizerFindingUnknown,
    AWSComputeoptimizerFindingUnderprovisioned,
    AWSComputeoptimizerFindingOverprovisioned,
    AWSComputeoptimizerFindingOptimized,
    AWSComputeoptimizerFindingNotOptimized,
};

typedef NS_ENUM(NSInteger, AWSComputeoptimizerJobFilterName) {
    AWSComputeoptimizerJobFilterNameUnknown,
    AWSComputeoptimizerJobFilterNameResourceType,
    AWSComputeoptimizerJobFilterNameJobStatus,
};

typedef NS_ENUM(NSInteger, AWSComputeoptimizerJobStatus) {
    AWSComputeoptimizerJobStatusUnknown,
    AWSComputeoptimizerJobStatusQueued,
    AWSComputeoptimizerJobStatusInProgress,
    AWSComputeoptimizerJobStatusComplete,
    AWSComputeoptimizerJobStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSComputeoptimizerMetricName) {
    AWSComputeoptimizerMetricNameUnknown,
    AWSComputeoptimizerMetricNameCpu,
    AWSComputeoptimizerMetricNameMemory,
};

typedef NS_ENUM(NSInteger, AWSComputeoptimizerMetricStatistic) {
    AWSComputeoptimizerMetricStatisticUnknown,
    AWSComputeoptimizerMetricStatisticMaximum,
    AWSComputeoptimizerMetricStatisticAverage,
};

typedef NS_ENUM(NSInteger, AWSComputeoptimizerRecommendationSourceType) {
    AWSComputeoptimizerRecommendationSourceTypeUnknown,
    AWSComputeoptimizerRecommendationSourceTypeEc2Instance,
    AWSComputeoptimizerRecommendationSourceTypeAutoScalingGroup,
};

typedef NS_ENUM(NSInteger, AWSComputeoptimizerResourceType) {
    AWSComputeoptimizerResourceTypeUnknown,
    AWSComputeoptimizerResourceTypeEc2Instance,
    AWSComputeoptimizerResourceTypeAutoScalingGroup,
};

typedef NS_ENUM(NSInteger, AWSComputeoptimizerStatus) {
    AWSComputeoptimizerStatusUnknown,
    AWSComputeoptimizerStatusActive,
    AWSComputeoptimizerStatusInactive,
    AWSComputeoptimizerStatusPending,
    AWSComputeoptimizerStatusFailed,
};

@class AWSComputeoptimizerAutoScalingGroupConfiguration;
@class AWSComputeoptimizerAutoScalingGroupRecommendation;
@class AWSComputeoptimizerAutoScalingGroupRecommendationOption;
@class AWSComputeoptimizerDescribeRecommendationExportJobsRequest;
@class AWSComputeoptimizerDescribeRecommendationExportJobsResponse;
@class AWSComputeoptimizerExportAutoScalingGroupRecommendationsRequest;
@class AWSComputeoptimizerExportAutoScalingGroupRecommendationsResponse;
@class AWSComputeoptimizerExportDestination;
@class AWSComputeoptimizerExportEC2InstanceRecommendationsRequest;
@class AWSComputeoptimizerExportEC2InstanceRecommendationsResponse;
@class AWSComputeoptimizerFilter;
@class AWSComputeoptimizerGetAutoScalingGroupRecommendationsRequest;
@class AWSComputeoptimizerGetAutoScalingGroupRecommendationsResponse;
@class AWSComputeoptimizerGetEC2InstanceRecommendationsRequest;
@class AWSComputeoptimizerGetEC2InstanceRecommendationsResponse;
@class AWSComputeoptimizerGetEC2RecommendationProjectedMetricsRequest;
@class AWSComputeoptimizerGetEC2RecommendationProjectedMetricsResponse;
@class AWSComputeoptimizerGetEnrollmentStatusRequest;
@class AWSComputeoptimizerGetEnrollmentStatusResponse;
@class AWSComputeoptimizerGetRecommendationError;
@class AWSComputeoptimizerGetRecommendationSummariesRequest;
@class AWSComputeoptimizerGetRecommendationSummariesResponse;
@class AWSComputeoptimizerInstanceRecommendation;
@class AWSComputeoptimizerInstanceRecommendationOption;
@class AWSComputeoptimizerJobFilter;
@class AWSComputeoptimizerProjectedMetric;
@class AWSComputeoptimizerRecommendationExportJob;
@class AWSComputeoptimizerRecommendationSource;
@class AWSComputeoptimizerRecommendationSummary;
@class AWSComputeoptimizerRecommendedOptionProjectedMetric;
@class AWSComputeoptimizerS3Destination;
@class AWSComputeoptimizerS3DestinationConfig;
@class AWSComputeoptimizerSummary;
@class AWSComputeoptimizerUpdateEnrollmentStatusRequest;
@class AWSComputeoptimizerUpdateEnrollmentStatusResponse;
@class AWSComputeoptimizerUtilizationMetric;

/**
 <p>Describes the configuration of an Auto Scaling group.</p>
 */
@interface AWSComputeoptimizerAutoScalingGroupConfiguration : AWSModel


/**
 <p>The desired capacity, or number of instances, for the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredCapacity;

/**
 <p>The instance type for the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The maximum size, or maximum number of instances, for the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSize;

/**
 <p>The minimum size, or minimum number of instances, for the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minSize;

@end

/**
 <p>Describes an Auto Scaling group recommendation.</p>
 */
@interface AWSComputeoptimizerAutoScalingGroupRecommendation : AWSModel


/**
 <p>The AWS account ID of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The Amazon Resource Name (ARN) of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupArn;

/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>An array of objects that describe the current configuration of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) AWSComputeoptimizerAutoScalingGroupConfiguration * _Nullable currentConfiguration;

/**
 <p>The finding classification for the Auto Scaling group.</p><p>Findings for Auto Scaling groups include:</p><ul><li><p><b><code>NotOptimized</code></b>—An Auto Scaling group is considered not optimized when AWS Compute Optimizer identifies a recommendation that can provide better performance for your workload.</p></li><li><p><b><code>Optimized</code></b>—An Auto Scaling group is considered optimized when Compute Optimizer determines that the group is correctly provisioned to run your workload based on the chosen instance type. For optimized resources, Compute Optimizer might recommend a new generation instance type.</p></li></ul><note><p>The values that are returned might be <code>NOT_OPTIMIZED</code> or <code>OPTIMIZED</code>.</p></note>
 */
@property (nonatomic, assign) AWSComputeoptimizerFinding finding;

/**
 <p>The time stamp of when the Auto Scaling group recommendation was last refreshed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastRefreshTimestamp;

/**
 <p>The number of days for which utilization metrics were analyzed for the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lookBackPeriodInDays;

/**
 <p>An array of objects that describe the recommendation options for the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerAutoScalingGroupRecommendationOption *> * _Nullable recommendationOptions;

/**
 <p>An array of objects that describe the utilization metrics of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerUtilizationMetric *> * _Nullable utilizationMetrics;

@end

/**
 <p>Describes a recommendation option for an Auto Scaling group.</p>
 */
@interface AWSComputeoptimizerAutoScalingGroupRecommendationOption : AWSModel


/**
 <p>An array of objects that describe an Auto Scaling group configuration.</p>
 */
@property (nonatomic, strong) AWSComputeoptimizerAutoScalingGroupConfiguration * _Nullable configuration;

/**
 <p>The performance risk of the Auto Scaling group configuration recommendation.</p><p>Performance risk is the likelihood of the recommended instance type not meeting the performance requirement of your workload.</p><p>The lowest performance risk is categorized as <code>0</code>, and the highest as <code>5</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable performanceRisk;

/**
 <p>An array of objects that describe the projected utilization metrics of the Auto Scaling group recommendation option.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerUtilizationMetric *> * _Nullable projectedUtilizationMetrics;

/**
 <p>The rank of the Auto Scaling group recommendation option.</p><p>The top recommendation option is ranked as <code>1</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rank;

@end

/**
 
 */
@interface AWSComputeoptimizerDescribeRecommendationExportJobsRequest : AWSRequest


/**
 <p>An array of objects that describe a filter to return a more specific list of export jobs.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerJobFilter *> * _Nullable filters;

/**
 <p>The identification numbers of the export jobs to return.</p><p>An export job ID is returned when you create an export using the <code>ExportAutoScalingGroupRecommendations</code> or <code>ExportEC2InstanceRecommendations</code> actions.</p><p>All export jobs created in the last seven days are returned if this parameter is omitted.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable jobIds;

/**
 <p>The maximum number of export jobs to return with a single request.</p><p>To retrieve the remaining results, make another request with the returned <code>NextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to advance to the next page of export jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComputeoptimizerDescribeRecommendationExportJobsResponse : AWSModel


/**
 <p>The token to use to advance to the next page of export jobs.</p><p>This value is null when there are no more pages of export jobs to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of objects that describe recommendation export jobs.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerRecommendationExportJob *> * _Nullable recommendationExportJobs;

@end

/**
 
 */
@interface AWSComputeoptimizerExportAutoScalingGroupRecommendationsRequest : AWSRequest


/**
 <p>The IDs of the AWS accounts for which to export Auto Scaling group recommendations.</p><p>If your account is the master account of an organization, use this parameter to specify the member accounts for which you want to export recommendations.</p><p>This parameter cannot be specified together with the include member accounts parameter. The parameters are mutually exclusive.</p><p>Recommendations for member accounts are not included in the export if this parameter, or the include member accounts parameter, is omitted.</p><p>You can specify multiple account IDs per request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

/**
 <p>The recommendations data to include in the export file.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable fieldsToExport;

/**
 <p>The format of the export file.</p><p>The only export file format currently supported is <code>Csv</code>.</p>
 */
@property (nonatomic, assign) AWSComputeoptimizerFileFormat fileFormat;

/**
 <p>An array of objects that describe a filter to export a more specific set of Auto Scaling group recommendations.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerFilter *> * _Nullable filters;

/**
 <p>Indicates whether to include recommendations for resources in all member accounts of the organization if your account is the master account of an organization.</p><p>The member accounts must also be opted in to Compute Optimizer.</p><p>Recommendations for member accounts of the organization are not included in the export file if this parameter is omitted.</p><p>This parameter cannot be specified together with the account IDs parameter. The parameters are mutually exclusive.</p><p>Recommendations for member accounts are not included in the export if this parameter, or the account IDs parameter, is omitted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeMemberAccounts;

/**
 <p>An object to specify the destination Amazon Simple Storage Service (Amazon S3) bucket name and key prefix for the export job.</p><p>You must create the destination Amazon S3 bucket for your recommendations export before you create the export job. Compute Optimizer does not create the S3 bucket for you. After you create the S3 bucket, ensure that it has the required permission policy to allow Compute Optimizer to write the export file to it. If you plan to specify an object prefix when you create the export job, you must include the object prefix in the policy that you add to the S3 bucket. For more information, see <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/create-s3-bucket-policy-for-compute-optimizer.html">Amazon S3 Bucket Policy for Compute Optimizer</a> in the <i>Compute Optimizer user guide</i>.</p>
 */
@property (nonatomic, strong) AWSComputeoptimizerS3DestinationConfig * _Nullable s3DestinationConfig;

@end

/**
 
 */
@interface AWSComputeoptimizerExportAutoScalingGroupRecommendationsResponse : AWSModel


/**
 <p>The identification number of the export job.</p><p>Use the <code>DescribeRecommendationExportJobs</code> action, and specify the job ID to view the status of an export job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>An object that describes the destination Amazon S3 bucket of a recommendations export file.</p>
 */
@property (nonatomic, strong) AWSComputeoptimizerS3Destination * _Nullable s3Destination;

@end

/**
 <p>Describes the destination of the recommendations export and metadata files.</p>
 */
@interface AWSComputeoptimizerExportDestination : AWSModel


/**
 <p>An object that describes the destination Amazon Simple Storage Service (Amazon S3) bucket name and object keys of a recommendations export file, and its associated metadata file.</p>
 */
@property (nonatomic, strong) AWSComputeoptimizerS3Destination * _Nullable s3;

@end

/**
 
 */
@interface AWSComputeoptimizerExportEC2InstanceRecommendationsRequest : AWSRequest


/**
 <p>The IDs of the AWS accounts for which to export instance recommendations.</p><p>If your account is the master account of an organization, use this parameter to specify the member accounts for which you want to export recommendations.</p><p>This parameter cannot be specified together with the include member accounts parameter. The parameters are mutually exclusive.</p><p>Recommendations for member accounts are not included in the export if this parameter, or the include member accounts parameter, is omitted.</p><p>You can specify multiple account IDs per request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

/**
 <p>The recommendations data to include in the export file.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable fieldsToExport;

/**
 <p>The format of the export file.</p><p>The only export file format currently supported is <code>Csv</code>.</p>
 */
@property (nonatomic, assign) AWSComputeoptimizerFileFormat fileFormat;

/**
 <p>An array of objects that describe a filter to export a more specific set of instance recommendations.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerFilter *> * _Nullable filters;

/**
 <p>Indicates whether to include recommendations for resources in all member accounts of the organization if your account is the master account of an organization.</p><p>The member accounts must also be opted in to Compute Optimizer.</p><p>Recommendations for member accounts of the organization are not included in the export file if this parameter is omitted.</p><p>Recommendations for member accounts are not included in the export if this parameter, or the account IDs parameter, is omitted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeMemberAccounts;

/**
 <p>An object to specify the destination Amazon Simple Storage Service (Amazon S3) bucket name and key prefix for the export job.</p><p>You must create the destination Amazon S3 bucket for your recommendations export before you create the export job. Compute Optimizer does not create the S3 bucket for you. After you create the S3 bucket, ensure that it has the required permission policy to allow Compute Optimizer to write the export file to it. If you plan to specify an object prefix when you create the export job, you must include the object prefix in the policy that you add to the S3 bucket. For more information, see <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/create-s3-bucket-policy-for-compute-optimizer.html">Amazon S3 Bucket Policy for Compute Optimizer</a> in the <i>Compute Optimizer user guide</i>.</p>
 */
@property (nonatomic, strong) AWSComputeoptimizerS3DestinationConfig * _Nullable s3DestinationConfig;

@end

/**
 
 */
@interface AWSComputeoptimizerExportEC2InstanceRecommendationsResponse : AWSModel


/**
 <p>The identification number of the export job.</p><p>Use the <code>DescribeRecommendationExportJobs</code> action, and specify the job ID to view the status of an export job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>An object that describes the destination Amazon S3 bucket of a recommendations export file.</p>
 */
@property (nonatomic, strong) AWSComputeoptimizerS3Destination * _Nullable s3Destination;

@end

/**
 <p>Describes a filter that returns a more specific list of recommendations.</p>
 */
@interface AWSComputeoptimizerFilter : AWSModel


/**
 <p>The name of the filter.</p><p>Specify <code>Finding</code> to return recommendations with a specific findings classification (e.g., <code>Overprovisioned</code>).</p><p>Specify <code>RecommendationSourceType</code> to return recommendations of a specific resource type (e.g., <code>AutoScalingGroup</code>).</p>
 */
@property (nonatomic, assign) AWSComputeoptimizerFilterName name;

/**
 <p>The value of the filter.</p><p>If you specify the <code>name</code> parameter as <code>Finding</code>, and you request recommendations for an <i>instance</i>, then the valid values are <code>Underprovisioned</code>, <code>Overprovisioned</code>, <code>NotOptimized</code>, or <code>Optimized</code>.</p><p>If you specify the <code>name</code> parameter as <code>Finding</code>, and you request recommendations for an <i>Auto Scaling group</i>, then the valid values are <code>Optimized</code>, or <code>NotOptimized</code>.</p><p>If you specify the <code>name</code> parameter as <code>RecommendationSourceType</code>, then the valid values are <code>Ec2Instance</code>, or <code>AutoScalingGroup</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 
 */
@interface AWSComputeoptimizerGetAutoScalingGroupRecommendationsRequest : AWSRequest


/**
 <p>The IDs of the AWS accounts for which to return Auto Scaling group recommendations.</p><p>If your account is the master account of an organization, use this parameter to specify the member accounts for which you want to return Auto Scaling group recommendations.</p><p>Only one account ID can be specified per request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

/**
 <p>The Amazon Resource Name (ARN) of the Auto Scaling groups for which to return recommendations.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoScalingGroupArns;

/**
 <p>An array of objects that describe a filter that returns a more specific list of Auto Scaling group recommendations.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerFilter *> * _Nullable filters;

/**
 <p>The maximum number of Auto Scaling group recommendations to return with a single request.</p><p>To retrieve the remaining results, make another request with the returned <code>NextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to advance to the next page of Auto Scaling group recommendations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComputeoptimizerGetAutoScalingGroupRecommendationsResponse : AWSModel


/**
 <p>An array of objects that describe Auto Scaling group recommendations.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerAutoScalingGroupRecommendation *> * _Nullable autoScalingGroupRecommendations;

/**
 <p>An array of objects that describe errors of the request.</p><p>For example, an error is returned if you request recommendations for an unsupported Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerGetRecommendationError *> * _Nullable errors;

/**
 <p>The token to use to advance to the next page of Auto Scaling group recommendations.</p><p>This value is null when there are no more pages of Auto Scaling group recommendations to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComputeoptimizerGetEC2InstanceRecommendationsRequest : AWSRequest


/**
 <p>The IDs of the AWS accounts for which to return instance recommendations.</p><p>If your account is the master account of an organization, use this parameter to specify the member accounts for which you want to return instance recommendations.</p><p>Only one account ID can be specified per request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

/**
 <p>An array of objects that describe a filter that returns a more specific list of instance recommendations.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerFilter *> * _Nullable filters;

/**
 <p>The Amazon Resource Name (ARN) of the instances for which to return recommendations.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceArns;

/**
 <p>The maximum number of instance recommendations to return with a single request.</p><p>To retrieve the remaining results, make another request with the returned <code>NextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to advance to the next page of instance recommendations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComputeoptimizerGetEC2InstanceRecommendationsResponse : AWSModel


/**
 <p>An array of objects that describe errors of the request.</p><p>For example, an error is returned if you request recommendations for an instance of an unsupported instance family.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerGetRecommendationError *> * _Nullable errors;

/**
 <p>An array of objects that describe instance recommendations.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerInstanceRecommendation *> * _Nullable instanceRecommendations;

/**
 <p>The token to use to advance to the next page of instance recommendations.</p><p>This value is null when there are no more pages of instance recommendations to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComputeoptimizerGetEC2RecommendationProjectedMetricsRequest : AWSRequest


/**
 <p>The time stamp of the last projected metrics data point to return.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The Amazon Resource Name (ARN) of the instances for which to return recommendation projected metrics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceArn;

/**
 <p>The granularity, in seconds, of the projected metrics data points.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable period;

/**
 <p>The time stamp of the first projected metrics data point to return.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The statistic of the projected metrics.</p>
 */
@property (nonatomic, assign) AWSComputeoptimizerMetricStatistic stat;

@end

/**
 
 */
@interface AWSComputeoptimizerGetEC2RecommendationProjectedMetricsResponse : AWSModel


/**
 <p>An array of objects that describe a projected metrics.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerRecommendedOptionProjectedMetric *> * _Nullable recommendedOptionProjectedMetrics;

@end

/**
 
 */
@interface AWSComputeoptimizerGetEnrollmentStatusRequest : AWSRequest


@end

/**
 
 */
@interface AWSComputeoptimizerGetEnrollmentStatusResponse : AWSModel


/**
 <p>Confirms the enrollment status of member accounts within the organization, if the account is a master account of an organization.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable memberAccountsEnrolled;

/**
 <p>The enrollment status of the account.</p>
 */
@property (nonatomic, assign) AWSComputeoptimizerStatus status;

/**
 <p>The reason for the enrollment status of the account.</p><p>For example, an account might show a status of <code>Pending</code> because member accounts of an organization require more time to be enrolled in the service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusReason;

@end

/**
 <p>Describes an error experienced when getting recommendations.</p><p>For example, an error is returned if you request recommendations for an unsupported Auto Scaling group, or if you request recommendations for an instance of an unsupported instance family.</p>
 */
@interface AWSComputeoptimizerGetRecommendationError : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>The ID of the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The message, or reason, for the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 
 */
@interface AWSComputeoptimizerGetRecommendationSummariesRequest : AWSRequest


/**
 <p>The IDs of the AWS accounts for which to return recommendation summaries.</p><p>If your account is the master account of an organization, use this parameter to specify the member accounts for which you want to return recommendation summaries.</p><p>Only one account ID can be specified per request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

/**
 <p>The maximum number of recommendation summaries to return with a single request.</p><p>To retrieve the remaining results, make another request with the returned <code>NextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to advance to the next page of recommendation summaries.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComputeoptimizerGetRecommendationSummariesResponse : AWSModel


/**
 <p>The token to use to advance to the next page of recommendation summaries.</p><p>This value is null when there are no more pages of recommendation summaries to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of objects that summarize a recommendation.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerRecommendationSummary *> * _Nullable recommendationSummaries;

@end

/**
 <p>Describes an Amazon EC2 instance recommendation.</p>
 */
@interface AWSComputeoptimizerInstanceRecommendation : AWSModel


/**
 <p>The AWS account ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The instance type of the current instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentInstanceType;

/**
 <p>The finding classification for the instance.</p><p>Findings for instances include:</p><ul><li><p><b><code>Underprovisioned</code></b>—An instance is considered under-provisioned when at least one specification of your instance, such as CPU, memory, or network, does not meet the performance requirements of your workload. Under-provisioned instances may lead to poor application performance.</p></li><li><p><b><code>Overprovisioned</code></b>—An instance is considered over-provisioned when at least one specification of your instance, such as CPU, memory, or network, can be sized down while still meeting the performance requirements of your workload, and no specification is under-provisioned. Over-provisioned instances may lead to unnecessary infrastructure cost.</p></li><li><p><b><code>Optimized</code></b>—An instance is considered optimized when all specifications of your instance, such as CPU, memory, and network, meet the performance requirements of your workload and is not over provisioned. An optimized instance runs your workloads with optimal performance and infrastructure cost. For optimized resources, AWS Compute Optimizer might recommend a new generation instance type.</p></li></ul><note><p>The values that are returned might be <code>UNDER_PROVISIONED</code>, <code>OVER_PROVISIONED</code>, or <code>OPTIMIZED</code>.</p></note>
 */
@property (nonatomic, assign) AWSComputeoptimizerFinding finding;

/**
 <p>The Amazon Resource Name (ARN) of the current instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceArn;

/**
 <p>The name of the current instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

/**
 <p>The time stamp of when the instance recommendation was last refreshed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastRefreshTimestamp;

/**
 <p>The number of days for which utilization metrics were analyzed for the instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lookBackPeriodInDays;

/**
 <p>An array of objects that describe the recommendation options for the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerInstanceRecommendationOption *> * _Nullable recommendationOptions;

/**
 <p>An array of objects that describe the source resource of the recommendation.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerRecommendationSource *> * _Nullable recommendationSources;

/**
 <p>An array of objects that describe the utilization metrics of the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerUtilizationMetric *> * _Nullable utilizationMetrics;

@end

/**
 <p>Describes a recommendation option for an Amazon EC2 instance.</p>
 */
@interface AWSComputeoptimizerInstanceRecommendationOption : AWSModel


/**
 <p>The instance type of the instance recommendation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The performance risk of the instance recommendation option.</p><p>Performance risk is the likelihood of the recommended instance type not meeting the performance requirement of your workload.</p><p>The lowest performance risk is categorized as <code>0</code>, and the highest as <code>5</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable performanceRisk;

/**
 <p>An array of objects that describe the projected utilization metrics of the instance recommendation option.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerUtilizationMetric *> * _Nullable projectedUtilizationMetrics;

/**
 <p>The rank of the instance recommendation option.</p><p>The top recommendation option is ranked as <code>1</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rank;

@end

/**
 <p>Describes a filter that returns a more specific list of recommendation export jobs.</p><p>This filter is used with the <code>DescribeRecommendationExportJobs</code> action.</p>
 */
@interface AWSComputeoptimizerJobFilter : AWSModel


/**
 <p>The name of the filter.</p><p>Specify <code>ResourceType</code> to return export jobs of a specific resource type (e.g., <code>Ec2Instance</code>).</p><p>Specify <code>JobStatus</code> to return export jobs with a specific status (e.g, <code>Complete</code>).</p>
 */
@property (nonatomic, assign) AWSComputeoptimizerJobFilterName name;

/**
 <p>The value of the filter.</p><p>If you specify the <code>name</code> parameter as <code>ResourceType</code>, the valid values are <code>Ec2Instance</code> or <code>AutoScalingGroup</code>.</p><p>If you specify the <code>name</code> parameter as <code>JobStatus</code>, the valid values are <code>Queued</code>, <code>InProgress</code>, <code>Complete</code>, or <code>Failed</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Describes a projected utilization metric of a recommendation option, such as an Amazon EC2 instance.</p>
 */
@interface AWSComputeoptimizerProjectedMetric : AWSModel


/**
 <p>The name of the projected utilization metric.</p><note><p>Memory metrics are only returned for resources that have the unified CloudWatch agent installed on them. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html">Enabling Memory Utilization with the CloudWatch Agent</a>.</p></note>
 */
@property (nonatomic, assign) AWSComputeoptimizerMetricName name;

/**
 <p>The time stamps of the projected utilization metric.</p>
 */
@property (nonatomic, strong) NSArray<NSDate *> * _Nullable timestamps;

/**
 <p>The values of the projected utilization metrics.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable values;

@end

/**
 <p>Describes a recommendation export job.</p><p>Use the <code>DescribeRecommendationExportJobs</code> action to view your recommendation export jobs.</p><p>Use the <code>ExportAutoScalingGroupRecommendations</code> or <code>ExportEC2InstanceRecommendations</code> actions to request an export of your recommendations.</p>
 */
@interface AWSComputeoptimizerRecommendationExportJob : AWSModel


/**
 <p>The timestamp of when the export job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimestamp;

/**
 <p>An object that describes the destination of the export file.</p>
 */
@property (nonatomic, strong) AWSComputeoptimizerExportDestination * _Nullable destination;

/**
 <p>The reason for an export job failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The identification number of the export job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The timestamp of when the export job was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTimestamp;

/**
 <p>The resource type of the exported recommendations.</p>
 */
@property (nonatomic, assign) AWSComputeoptimizerResourceType resourceType;

/**
 <p>The status of the export job.</p>
 */
@property (nonatomic, assign) AWSComputeoptimizerJobStatus status;

@end

/**
 <p>Describes the source of a recommendation, such as an Amazon EC2 instance or Auto Scaling group.</p>
 */
@interface AWSComputeoptimizerRecommendationSource : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the recommendation source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationSourceArn;

/**
 <p>The resource type of the recommendation source.</p>
 */
@property (nonatomic, assign) AWSComputeoptimizerRecommendationSourceType recommendationSourceType;

@end

/**
 <p>A summary of a recommendation.</p>
 */
@interface AWSComputeoptimizerRecommendationSummary : AWSModel


/**
 <p>The AWS account ID of the recommendation summary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The resource type of the recommendation.</p>
 */
@property (nonatomic, assign) AWSComputeoptimizerRecommendationSourceType recommendationResourceType;

/**
 <p>An array of objects that describe a recommendation summary.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerSummary *> * _Nullable summaries;

@end

/**
 <p>Describes a projected utilization metric of a recommendation option.</p>
 */
@interface AWSComputeoptimizerRecommendedOptionProjectedMetric : AWSModel


/**
 <p>An array of objects that describe a projected utilization metric.</p>
 */
@property (nonatomic, strong) NSArray<AWSComputeoptimizerProjectedMetric *> * _Nullable projectedMetrics;

/**
 <p>The rank of the recommendation option projected metric.</p><p>The top recommendation option is ranked as <code>1</code>.</p><p>The projected metric rank correlates to the recommendation option rank. For example, the projected metric ranked as <code>1</code> is related to the recommendation option that is also ranked as <code>1</code> in the same response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rank;

/**
 <p>The recommended instance type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendedInstanceType;

@end

/**
 <p>Describes the destination Amazon Simple Storage Service (Amazon S3) bucket name and object keys of a recommendations export file, and its associated metadata file.</p>
 */
@interface AWSComputeoptimizerS3Destination : AWSModel


/**
 <p>The name of the Amazon S3 bucket used as the destination of an export file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The Amazon S3 bucket key of an export file.</p><p>The key uniquely identifies the object, or export file, in the S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The Amazon S3 bucket key of a metadata file.</p><p>The key uniquely identifies the object, or metadata file, in the S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadataKey;

@end

/**
 <p>Describes the destination Amazon Simple Storage Service (Amazon S3) bucket name and key prefix for a recommendations export job.</p><p>You must create the destination Amazon S3 bucket for your recommendations export before you create the export job. Compute Optimizer does not create the S3 bucket for you. After you create the S3 bucket, ensure that it has the required permission policy to allow Compute Optimizer to write the export file to it. If you plan to specify an object prefix when you create the export job, you must include the object prefix in the policy that you add to the S3 bucket. For more information, see <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/create-s3-bucket-policy-for-compute-optimizer.html">Amazon S3 Bucket Policy for Compute Optimizer</a> in the <i>Compute Optimizer user guide</i>.</p>
 */
@interface AWSComputeoptimizerS3DestinationConfig : AWSModel


/**
 <p>The name of the Amazon S3 bucket to use as the destination for an export job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The Amazon S3 bucket prefix for an export job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyPrefix;

@end

/**
 <p>The summary of a recommendation.</p>
 */
@interface AWSComputeoptimizerSummary : AWSModel


/**
 <p>The finding classification of the recommendation.</p>
 */
@property (nonatomic, assign) AWSComputeoptimizerFinding name;

/**
 <p>The value of the recommendation summary.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 
 */
@interface AWSComputeoptimizerUpdateEnrollmentStatusRequest : AWSRequest


/**
 <p>Indicates whether to enroll member accounts of the organization if the your account is the master account of an organization.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeMemberAccounts;

/**
 <p>The new enrollment status of the account.</p><p>Accepted options are <code>Active</code> or <code>Inactive</code>. You will get an error if <code>Pending</code> or <code>Failed</code> are specified.</p>
 */
@property (nonatomic, assign) AWSComputeoptimizerStatus status;

@end

/**
 
 */
@interface AWSComputeoptimizerUpdateEnrollmentStatusResponse : AWSModel


/**
 <p>The enrollment status of the account.</p>
 */
@property (nonatomic, assign) AWSComputeoptimizerStatus status;

/**
 <p>The reason for the enrollment status of the account. For example, an account might show a status of <code>Pending</code> because member accounts of an organization require more time to be enrolled in the service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusReason;

@end

/**
 <p>Describes a utilization metric of a resource, such as an Amazon EC2 instance.</p>
 */
@interface AWSComputeoptimizerUtilizationMetric : AWSModel


/**
 <p>The name of the utilization metric.</p><note><p>Memory metrics are only returned for resources that have the unified CloudWatch agent installed on them. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html">Enabling Memory Utilization with the CloudWatch Agent</a>.</p></note>
 */
@property (nonatomic, assign) AWSComputeoptimizerMetricName name;

/**
 <p>The statistic of the utilization metric.</p>
 */
@property (nonatomic, assign) AWSComputeoptimizerMetricStatistic statistic;

/**
 <p>The value of the utilization metric.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

NS_ASSUME_NONNULL_END
