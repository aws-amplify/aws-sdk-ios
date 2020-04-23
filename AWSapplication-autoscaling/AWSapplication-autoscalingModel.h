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

FOUNDATION_EXPORT NSString *const AWSapplication-autoscalingErrorDomain;

typedef NS_ENUM(NSInteger, AWSapplication-autoscalingErrorType) {
    AWSapplication-autoscalingErrorUnknown,
    AWSapplication-autoscalingErrorConcurrentUpdate,
    AWSapplication-autoscalingErrorFailedResourceAccess,
    AWSapplication-autoscalingErrorInternalService,
    AWSapplication-autoscalingErrorInvalidNextToken,
    AWSapplication-autoscalingErrorLimitExceeded,
    AWSapplication-autoscalingErrorObjectNotFound,
    AWSapplication-autoscalingErrorValidation,
};

typedef NS_ENUM(NSInteger, AWSapplication-autoscalingAdjustmentType) {
    AWSapplication-autoscalingAdjustmentTypeUnknown,
    AWSapplication-autoscalingAdjustmentTypeChangeInCapacity,
    AWSapplication-autoscalingAdjustmentTypePercentChangeInCapacity,
    AWSapplication-autoscalingAdjustmentTypeExactCapacity,
};

typedef NS_ENUM(NSInteger, AWSapplication-autoscalingMetricAggregationType) {
    AWSapplication-autoscalingMetricAggregationTypeUnknown,
    AWSapplication-autoscalingMetricAggregationTypeAverage,
    AWSapplication-autoscalingMetricAggregationTypeMinimum,
    AWSapplication-autoscalingMetricAggregationTypeMaximum,
};

typedef NS_ENUM(NSInteger, AWSapplication-autoscalingMetricStatistic) {
    AWSapplication-autoscalingMetricStatisticUnknown,
    AWSapplication-autoscalingMetricStatisticAverage,
    AWSapplication-autoscalingMetricStatisticMinimum,
    AWSapplication-autoscalingMetricStatisticMaximum,
    AWSapplication-autoscalingMetricStatisticSampleCount,
    AWSapplication-autoscalingMetricStatisticSum,
};

typedef NS_ENUM(NSInteger, AWSapplication-autoscalingMetricType) {
    AWSapplication-autoscalingMetricTypeUnknown,
    AWSapplication-autoscalingMetricTypeDynamoDBReadCapacityUtilization,
    AWSapplication-autoscalingMetricTypeDynamoDBWriteCapacityUtilization,
    AWSapplication-autoscalingMetricTypeALBRequestCountPerTarget,
    AWSapplication-autoscalingMetricTypeRDSReaderAverageCPUUtilization,
    AWSapplication-autoscalingMetricTypeRDSReaderAverageDatabaseConnections,
    AWSapplication-autoscalingMetricTypeEC2SpotFleetRequestAverageCPUUtilization,
    AWSapplication-autoscalingMetricTypeEC2SpotFleetRequestAverageNetworkIn,
    AWSapplication-autoscalingMetricTypeEC2SpotFleetRequestAverageNetworkOut,
    AWSapplication-autoscalingMetricTypeSageMakerVariantInvocationsPerInstance,
    AWSapplication-autoscalingMetricTypeECSServiceAverageCPUUtilization,
    AWSapplication-autoscalingMetricTypeECSServiceAverageMemoryUtilization,
    AWSapplication-autoscalingMetricTypeAppStreamAverageCapacityUtilization,
    AWSapplication-autoscalingMetricTypeComprehendInferenceUtilization,
    AWSapplication-autoscalingMetricTypeLambdaProvisionedConcurrencyUtilization,
    AWSapplication-autoscalingMetricTypeCassandraReadCapacityUtilization,
    AWSapplication-autoscalingMetricTypeCassandraWriteCapacityUtilization,
};

typedef NS_ENUM(NSInteger, AWSapplication-autoscalingPolicyType) {
    AWSapplication-autoscalingPolicyTypeUnknown,
    AWSapplication-autoscalingPolicyTypeStepScaling,
    AWSapplication-autoscalingPolicyTypeTargetTrackingScaling,
};

typedef NS_ENUM(NSInteger, AWSapplication-autoscalingScalableDimension) {
    AWSapplication-autoscalingScalableDimensionUnknown,
    AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount,
    AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity,
    AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount,
    AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity,
    AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits,
    AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits,
    AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits,
    AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits,
    AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount,
    AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount,
    AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty,
    AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits,
    AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency,
    AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits,
    AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits,
};

typedef NS_ENUM(NSInteger, AWSapplication-autoscalingScalingActivityStatusCode) {
    AWSapplication-autoscalingScalingActivityStatusCodeUnknown,
    AWSapplication-autoscalingScalingActivityStatusCodePending,
    AWSapplication-autoscalingScalingActivityStatusCodeInProgress,
    AWSapplication-autoscalingScalingActivityStatusCodeSuccessful,
    AWSapplication-autoscalingScalingActivityStatusCodeOverridden,
    AWSapplication-autoscalingScalingActivityStatusCodeUnfulfilled,
    AWSapplication-autoscalingScalingActivityStatusCodeFailed,
};

typedef NS_ENUM(NSInteger, AWSapplication-autoscalingServiceNamespace) {
    AWSapplication-autoscalingServiceNamespaceUnknown,
    AWSapplication-autoscalingServiceNamespaceEcs,
    AWSapplication-autoscalingServiceNamespaceElasticmapreduce,
    AWSapplication-autoscalingServiceNamespaceEc2,
    AWSapplication-autoscalingServiceNamespaceAppstream,
    AWSapplication-autoscalingServiceNamespaceDynamodb,
    AWSapplication-autoscalingServiceNamespaceRds,
    AWSapplication-autoscalingServiceNamespaceSagemaker,
    AWSapplication-autoscalingServiceNamespaceCustomResource,
    AWSapplication-autoscalingServiceNamespaceComprehend,
    AWSapplication-autoscalingServiceNamespaceLambda,
    AWSapplication-autoscalingServiceNamespaceCassandra,
};

@class AWSapplication-autoscalingAlarm;
@class AWSapplication-autoscalingCustomizedMetricSpecification;
@class AWSapplication-autoscalingDeleteScalingPolicyRequest;
@class AWSapplication-autoscalingDeleteScalingPolicyResponse;
@class AWSapplication-autoscalingDeleteScheduledActionRequest;
@class AWSapplication-autoscalingDeleteScheduledActionResponse;
@class AWSapplication-autoscalingDeregisterScalableTargetRequest;
@class AWSapplication-autoscalingDeregisterScalableTargetResponse;
@class AWSapplication-autoscalingDescribeScalableTargetsRequest;
@class AWSapplication-autoscalingDescribeScalableTargetsResponse;
@class AWSapplication-autoscalingDescribeScalingActivitiesRequest;
@class AWSapplication-autoscalingDescribeScalingActivitiesResponse;
@class AWSapplication-autoscalingDescribeScalingPoliciesRequest;
@class AWSapplication-autoscalingDescribeScalingPoliciesResponse;
@class AWSapplication-autoscalingDescribeScheduledActionsRequest;
@class AWSapplication-autoscalingDescribeScheduledActionsResponse;
@class AWSapplication-autoscalingMetricDimension;
@class AWSapplication-autoscalingPredefinedMetricSpecification;
@class AWSapplication-autoscalingPutScalingPolicyRequest;
@class AWSapplication-autoscalingPutScalingPolicyResponse;
@class AWSapplication-autoscalingPutScheduledActionRequest;
@class AWSapplication-autoscalingPutScheduledActionResponse;
@class AWSapplication-autoscalingRegisterScalableTargetRequest;
@class AWSapplication-autoscalingRegisterScalableTargetResponse;
@class AWSapplication-autoscalingScalableTarget;
@class AWSapplication-autoscalingScalableTargetAction;
@class AWSapplication-autoscalingScalingActivity;
@class AWSapplication-autoscalingScalingPolicy;
@class AWSapplication-autoscalingScheduledAction;
@class AWSapplication-autoscalingStepAdjustment;
@class AWSapplication-autoscalingStepScalingPolicyConfiguration;
@class AWSapplication-autoscalingSuspendedState;
@class AWSapplication-autoscalingTargetTrackingScalingPolicyConfiguration;

/**
 <p>Represents a CloudWatch alarm associated with a scaling policy.</p>
 Required parameters: [AlarmName, AlarmARN]
 */
@interface AWSapplication-autoscalingAlarm : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmARN;

/**
 <p>The name of the alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmName;

@end

/**
 <p>Represents a CloudWatch metric of your choosing for a target tracking scaling policy to use with Application Auto Scaling.</p><p>For information about the available metrics for a service, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html">AWS Services That Publish CloudWatch Metrics</a> in the <i>Amazon CloudWatch User Guide</i>.</p><p>To create your customized metric specification:</p><ul><li><p>Add values for each required parameter from CloudWatch. You can use an existing metric, or a new metric that you create. To use your own metric, you must first publish the metric to CloudWatch. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html">Publish Custom Metrics</a> in the <i>Amazon CloudWatch User Guide</i>.</p></li><li><p>Choose a metric that changes proportionally with capacity. The value of the metric should increase or decrease in inverse proportion to the number of capacity units. That is, the value of the metric should decrease when capacity increases, and increase when capacity decreases. </p></li></ul><p>For more information about CloudWatch, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html">Amazon CloudWatch Concepts</a>. </p>
 Required parameters: [MetricName, Namespace, Statistic]
 */
@interface AWSapplication-autoscalingCustomizedMetricSpecification : AWSModel


/**
 <p>The dimensions of the metric. </p><p>Conditional: If you published your metric with dimensions, you must specify the same dimensions in your scaling policy.</p>
 */
@property (nonatomic, strong) NSArray<AWSapplication-autoscalingMetricDimension *> * _Nullable dimensions;

/**
 <p>The name of the metric. </p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The namespace of the metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>The statistic of the metric.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingMetricStatistic statistic;

/**
 <p>The unit of the metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable unit;

@end

/**
 
 */
@interface AWSapplication-autoscalingDeleteScalingPolicyRequest : AWSRequest


/**
 <p>The name of the scaling policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The identifier of the resource associated with the scalable target. This string consists of the resource type and unique identifier.</p><ul><li><p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p></li><li><p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p></li><li><p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p></li><li><p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p></li><li><p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p></li><li><p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p></li><li><p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p></li><li><p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p></li><li><p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub repository</a>.</p></li><li><p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p></li><li><p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p></li><li><p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The scalable dimension. This string consists of the service namespace, resource type, and scaling property.</p><ul><li><p><code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p></li><li><p><code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p></li><li><p><code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p></li><li><p><code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p></li><li><p><code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p></li><li><p><code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p></li><li><p><code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p></li><li><p><code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p></li><li><p><code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p></li><li><p><code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p></li><li><p><code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p></li><li><p><code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p></li><li><p><code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p></li></ul>
 */
@property (nonatomic, assign) AWSapplication-autoscalingScalableDimension scalableDimension;

/**
 <p>The namespace of the AWS service that provides the resource. For a resource provided by your own application or service, use <code>custom-resource</code> instead.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingServiceNamespace serviceNamespace;

@end

/**
 
 */
@interface AWSapplication-autoscalingDeleteScalingPolicyResponse : AWSModel


@end

/**
 
 */
@interface AWSapplication-autoscalingDeleteScheduledActionRequest : AWSRequest


/**
 <p>The identifier of the resource associated with the scheduled action. This string consists of the resource type and unique identifier.</p><ul><li><p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p></li><li><p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p></li><li><p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p></li><li><p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p></li><li><p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p></li><li><p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p></li><li><p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p></li><li><p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p></li><li><p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub repository</a>.</p></li><li><p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p></li><li><p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p></li><li><p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The scalable dimension. This string consists of the service namespace, resource type, and scaling property.</p><ul><li><p><code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p></li><li><p><code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p></li><li><p><code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p></li><li><p><code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p></li><li><p><code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p></li><li><p><code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p></li><li><p><code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p></li><li><p><code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p></li><li><p><code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p></li><li><p><code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p></li><li><p><code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p></li><li><p><code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p></li><li><p><code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p></li></ul>
 */
@property (nonatomic, assign) AWSapplication-autoscalingScalableDimension scalableDimension;

/**
 <p>The name of the scheduled action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledActionName;

/**
 <p>The namespace of the AWS service that provides the resource. For a resource provided by your own application or service, use <code>custom-resource</code> instead.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingServiceNamespace serviceNamespace;

@end

/**
 
 */
@interface AWSapplication-autoscalingDeleteScheduledActionResponse : AWSModel


@end

/**
 
 */
@interface AWSapplication-autoscalingDeregisterScalableTargetRequest : AWSRequest


/**
 <p>The identifier of the resource associated with the scalable target. This string consists of the resource type and unique identifier.</p><ul><li><p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p></li><li><p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p></li><li><p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p></li><li><p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p></li><li><p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p></li><li><p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p></li><li><p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p></li><li><p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p></li><li><p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub repository</a>.</p></li><li><p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p></li><li><p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p></li><li><p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The scalable dimension associated with the scalable target. This string consists of the service namespace, resource type, and scaling property.</p><ul><li><p><code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p></li><li><p><code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p></li><li><p><code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p></li><li><p><code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p></li><li><p><code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p></li><li><p><code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p></li><li><p><code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p></li><li><p><code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p></li><li><p><code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p></li><li><p><code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p></li><li><p><code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p></li><li><p><code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p></li><li><p><code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p></li></ul>
 */
@property (nonatomic, assign) AWSapplication-autoscalingScalableDimension scalableDimension;

/**
 <p>The namespace of the AWS service that provides the resource. For a resource provided by your own application or service, use <code>custom-resource</code> instead.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingServiceNamespace serviceNamespace;

@end

/**
 
 */
@interface AWSapplication-autoscalingDeregisterScalableTargetResponse : AWSModel


@end

/**
 
 */
@interface AWSapplication-autoscalingDescribeScalableTargetsRequest : AWSRequest


/**
 <p>The maximum number of scalable targets. This value can be between 1 and 50. The default value is 50.</p><p>If this parameter is used, the operation returns up to <code>MaxResults</code> results at a time, along with a <code>NextToken</code> value. To get the next set of results, include the <code>NextToken</code> value in a subsequent call. If this parameter is not used, the operation returns up to 50 results and a <code>NextToken</code> value, if applicable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The identifier of the resource associated with the scalable target. This string consists of the resource type and unique identifier. If you specify a scalable dimension, you must also specify a resource ID.</p><ul><li><p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p></li><li><p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p></li><li><p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p></li><li><p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p></li><li><p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p></li><li><p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p></li><li><p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p></li><li><p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p></li><li><p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub repository</a>.</p></li><li><p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p></li><li><p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p></li><li><p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceIds;

/**
 <p>The scalable dimension associated with the scalable target. This string consists of the service namespace, resource type, and scaling property. If you specify a scalable dimension, you must also specify a resource ID.</p><ul><li><p><code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p></li><li><p><code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p></li><li><p><code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p></li><li><p><code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p></li><li><p><code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p></li><li><p><code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p></li><li><p><code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p></li><li><p><code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p></li><li><p><code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p></li><li><p><code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p></li><li><p><code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p></li><li><p><code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p></li><li><p><code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p></li></ul>
 */
@property (nonatomic, assign) AWSapplication-autoscalingScalableDimension scalableDimension;

/**
 <p>The namespace of the AWS service that provides the resource. For a resource provided by your own application or service, use <code>custom-resource</code> instead.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingServiceNamespace serviceNamespace;

@end

/**
 
 */
@interface AWSapplication-autoscalingDescribeScalableTargetsResponse : AWSModel


/**
 <p>The token required to get the next set of results. This value is <code>null</code> if there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The scalable targets that match the request parameters.</p>
 */
@property (nonatomic, strong) NSArray<AWSapplication-autoscalingScalableTarget *> * _Nullable scalableTargets;

@end

/**
 
 */
@interface AWSapplication-autoscalingDescribeScalingActivitiesRequest : AWSRequest


/**
 <p>The maximum number of scalable targets. This value can be between 1 and 50. The default value is 50.</p><p>If this parameter is used, the operation returns up to <code>MaxResults</code> results at a time, along with a <code>NextToken</code> value. To get the next set of results, include the <code>NextToken</code> value in a subsequent call. If this parameter is not used, the operation returns up to 50 results and a <code>NextToken</code> value, if applicable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The identifier of the resource associated with the scaling activity. This string consists of the resource type and unique identifier. If you specify a scalable dimension, you must also specify a resource ID.</p><ul><li><p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p></li><li><p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p></li><li><p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p></li><li><p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p></li><li><p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p></li><li><p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p></li><li><p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p></li><li><p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p></li><li><p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub repository</a>.</p></li><li><p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p></li><li><p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p></li><li><p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The scalable dimension. This string consists of the service namespace, resource type, and scaling property. If you specify a scalable dimension, you must also specify a resource ID.</p><ul><li><p><code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p></li><li><p><code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p></li><li><p><code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p></li><li><p><code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p></li><li><p><code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p></li><li><p><code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p></li><li><p><code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p></li><li><p><code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p></li><li><p><code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p></li><li><p><code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p></li><li><p><code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p></li><li><p><code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p></li><li><p><code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p></li></ul>
 */
@property (nonatomic, assign) AWSapplication-autoscalingScalableDimension scalableDimension;

/**
 <p>The namespace of the AWS service that provides the resource. For a resource provided by your own application or service, use <code>custom-resource</code> instead.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingServiceNamespace serviceNamespace;

@end

/**
 
 */
@interface AWSapplication-autoscalingDescribeScalingActivitiesResponse : AWSModel


/**
 <p>The token required to get the next set of results. This value is <code>null</code> if there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of scaling activity objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSapplication-autoscalingScalingActivity *> * _Nullable scalingActivities;

@end

/**
 
 */
@interface AWSapplication-autoscalingDescribeScalingPoliciesRequest : AWSRequest


/**
 <p>The maximum number of scalable targets. This value can be between 1 and 50. The default value is 50.</p><p>If this parameter is used, the operation returns up to <code>MaxResults</code> results at a time, along with a <code>NextToken</code> value. To get the next set of results, include the <code>NextToken</code> value in a subsequent call. If this parameter is not used, the operation returns up to 50 results and a <code>NextToken</code> value, if applicable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The names of the scaling policies to describe.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyNames;

/**
 <p>The identifier of the resource associated with the scaling policy. This string consists of the resource type and unique identifier. If you specify a scalable dimension, you must also specify a resource ID.</p><ul><li><p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p></li><li><p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p></li><li><p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p></li><li><p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p></li><li><p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p></li><li><p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p></li><li><p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p></li><li><p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p></li><li><p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub repository</a>.</p></li><li><p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p></li><li><p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p></li><li><p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The scalable dimension. This string consists of the service namespace, resource type, and scaling property. If you specify a scalable dimension, you must also specify a resource ID.</p><ul><li><p><code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p></li><li><p><code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p></li><li><p><code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p></li><li><p><code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p></li><li><p><code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p></li><li><p><code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p></li><li><p><code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p></li><li><p><code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p></li><li><p><code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p></li><li><p><code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p></li><li><p><code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p></li><li><p><code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p></li><li><p><code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p></li></ul>
 */
@property (nonatomic, assign) AWSapplication-autoscalingScalableDimension scalableDimension;

/**
 <p>The namespace of the AWS service that provides the resource. For a resource provided by your own application or service, use <code>custom-resource</code> instead.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingServiceNamespace serviceNamespace;

@end

/**
 
 */
@interface AWSapplication-autoscalingDescribeScalingPoliciesResponse : AWSModel


/**
 <p>The token required to get the next set of results. This value is <code>null</code> if there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the scaling policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSapplication-autoscalingScalingPolicy *> * _Nullable scalingPolicies;

@end

/**
 
 */
@interface AWSapplication-autoscalingDescribeScheduledActionsRequest : AWSRequest


/**
 <p>The maximum number of scheduled action results. This value can be between 1 and 50. The default value is 50.</p><p>If this parameter is used, the operation returns up to <code>MaxResults</code> results at a time, along with a <code>NextToken</code> value. To get the next set of results, include the <code>NextToken</code> value in a subsequent call. If this parameter is not used, the operation returns up to 50 results and a <code>NextToken</code> value, if applicable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The identifier of the resource associated with the scheduled action. This string consists of the resource type and unique identifier. If you specify a scalable dimension, you must also specify a resource ID.</p><ul><li><p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p></li><li><p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p></li><li><p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p></li><li><p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p></li><li><p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p></li><li><p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p></li><li><p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p></li><li><p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p></li><li><p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub repository</a>.</p></li><li><p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p></li><li><p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p></li><li><p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The scalable dimension. This string consists of the service namespace, resource type, and scaling property. If you specify a scalable dimension, you must also specify a resource ID.</p><ul><li><p><code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p></li><li><p><code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p></li><li><p><code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p></li><li><p><code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p></li><li><p><code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p></li><li><p><code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p></li><li><p><code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p></li><li><p><code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p></li><li><p><code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p></li><li><p><code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p></li><li><p><code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p></li><li><p><code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p></li><li><p><code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p></li></ul>
 */
@property (nonatomic, assign) AWSapplication-autoscalingScalableDimension scalableDimension;

/**
 <p>The names of the scheduled actions to describe.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable scheduledActionNames;

/**
 <p>The namespace of the AWS service that provides the resource. For a resource provided by your own application or service, use <code>custom-resource</code> instead.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingServiceNamespace serviceNamespace;

@end

/**
 
 */
@interface AWSapplication-autoscalingDescribeScheduledActionsResponse : AWSModel


/**
 <p>The token required to get the next set of results. This value is <code>null</code> if there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the scheduled actions.</p>
 */
@property (nonatomic, strong) NSArray<AWSapplication-autoscalingScheduledAction *> * _Nullable scheduledActions;

@end

/**
 <p>Describes the dimension names and values associated with a metric.</p>
 Required parameters: [Name, Value]
 */
@interface AWSapplication-autoscalingMetricDimension : AWSModel


/**
 <p>The name of the dimension.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The value of the dimension.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Represents a predefined metric for a target tracking scaling policy to use with Application Auto Scaling.</p><p>Only the AWS services that you're using send metrics to Amazon CloudWatch. To determine whether a desired metric already exists by looking up its namespace and dimension using the CloudWatch metrics dashboard in the console, follow the procedure in <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/monitoring-cloudwatch.html">Building Dashboards with CloudWatch</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 Required parameters: [PredefinedMetricType]
 */
@interface AWSapplication-autoscalingPredefinedMetricSpecification : AWSModel


/**
 <p>The metric type. The <code>ALBRequestCountPerTarget</code> metric type applies only to Spot Fleet requests and ECS services.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingMetricType predefinedMetricType;

/**
 <p>Identifies the resource associated with the metric type. You can't specify a resource label unless the metric type is <code>ALBRequestCountPerTarget</code> and there is a target group attached to the Spot Fleet request or ECS service.</p><p>The format is app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt;/targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt;, where:</p><ul><li><p>app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion of the load balancer ARN</p></li><li><p>targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final portion of the target group ARN.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceLabel;

@end

/**
 
 */
@interface AWSapplication-autoscalingPutScalingPolicyRequest : AWSRequest


/**
 <p>The name of the scaling policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The policy type. This parameter is required if you are creating a scaling policy.</p><p>The following policy types are supported: </p><p><code>TargetTrackingScaling</code>—Not supported for Amazon EMR</p><p><code>StepScaling</code>—Not supported for DynamoDB, Amazon Comprehend, Lambda, or Amazon Keyspaces for Apache Cassandra.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html">Target Tracking Scaling Policies</a> and <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html">Step Scaling Policies</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingPolicyType policyType;

/**
 <p>The identifier of the resource associated with the scaling policy. This string consists of the resource type and unique identifier.</p><ul><li><p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p></li><li><p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p></li><li><p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p></li><li><p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p></li><li><p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p></li><li><p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p></li><li><p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p></li><li><p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p></li><li><p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub repository</a>.</p></li><li><p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p></li><li><p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p></li><li><p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The scalable dimension. This string consists of the service namespace, resource type, and scaling property.</p><ul><li><p><code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p></li><li><p><code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p></li><li><p><code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p></li><li><p><code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p></li><li><p><code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p></li><li><p><code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p></li><li><p><code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p></li><li><p><code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p></li><li><p><code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p></li><li><p><code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p></li><li><p><code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p></li><li><p><code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p></li><li><p><code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p></li></ul>
 */
@property (nonatomic, assign) AWSapplication-autoscalingScalableDimension scalableDimension;

/**
 <p>The namespace of the AWS service that provides the resource. For a resource provided by your own application or service, use <code>custom-resource</code> instead.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingServiceNamespace serviceNamespace;

/**
 <p>A step scaling policy.</p><p>This parameter is required if you are creating a policy and the policy type is <code>StepScaling</code>.</p>
 */
@property (nonatomic, strong) AWSapplication-autoscalingStepScalingPolicyConfiguration * _Nullable stepScalingPolicyConfiguration;

/**
 <p>A target tracking scaling policy. Includes support for predefined or customized metrics.</p><p>This parameter is required if you are creating a policy and the policy type is <code>TargetTrackingScaling</code>.</p>
 */
@property (nonatomic, strong) AWSapplication-autoscalingTargetTrackingScalingPolicyConfiguration * _Nullable targetTrackingScalingPolicyConfiguration;

@end

/**
 
 */
@interface AWSapplication-autoscalingPutScalingPolicyResponse : AWSModel


/**
 <p>The CloudWatch alarms created for the target tracking scaling policy.</p>
 */
@property (nonatomic, strong) NSArray<AWSapplication-autoscalingAlarm *> * _Nullable alarms;

/**
 <p>The Amazon Resource Name (ARN) of the resulting scaling policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyARN;

@end

/**
 
 */
@interface AWSapplication-autoscalingPutScheduledActionRequest : AWSRequest


/**
 <p>The date and time for the recurring schedule to end.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The identifier of the resource associated with the scheduled action. This string consists of the resource type and unique identifier.</p><ul><li><p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p></li><li><p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p></li><li><p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p></li><li><p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p></li><li><p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p></li><li><p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p></li><li><p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p></li><li><p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p></li><li><p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub repository</a>.</p></li><li><p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p></li><li><p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p></li><li><p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The scalable dimension. This string consists of the service namespace, resource type, and scaling property.</p><ul><li><p><code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p></li><li><p><code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p></li><li><p><code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p></li><li><p><code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p></li><li><p><code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p></li><li><p><code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p></li><li><p><code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p></li><li><p><code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p></li><li><p><code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p></li><li><p><code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p></li><li><p><code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p></li><li><p><code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p></li><li><p><code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p></li></ul>
 */
@property (nonatomic, assign) AWSapplication-autoscalingScalableDimension scalableDimension;

/**
 <p>The new minimum and maximum capacity. You can set both values or just one. At the scheduled time, if the current capacity is below the minimum capacity, Application Auto Scaling scales out to the minimum capacity. If the current capacity is above the maximum capacity, Application Auto Scaling scales in to the maximum capacity.</p>
 */
@property (nonatomic, strong) AWSapplication-autoscalingScalableTargetAction * _Nullable scalableTargetAction;

/**
 <p>The schedule for this action. The following formats are supported:</p><ul><li><p>At expressions - "<code>at(<i>yyyy</i>-<i>mm</i>-<i>dd</i>T<i>hh</i>:<i>mm</i>:<i>ss</i>)</code>"</p></li><li><p>Rate expressions - "<code>rate(<i>value</i><i>unit</i>)</code>"</p></li><li><p>Cron expressions - "<code>cron(<i>fields</i>)</code>"</p></li></ul><p>At expressions are useful for one-time schedules. Specify the time in UTC.</p><p>For rate expressions, <i>value</i> is a positive integer and <i>unit</i> is <code>minute</code> | <code>minutes</code> | <code>hour</code> | <code>hours</code> | <code>day</code> | <code>days</code>.</p><p>For more information about cron expressions, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions">Cron Expressions</a> in the <i>Amazon CloudWatch Events User Guide</i>.</p><p>For examples of using these expressions, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html">Scheduled Scaling</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

/**
 <p>The name of the scheduled action. This name must be unique among all other scheduled actions on the specified scalable target. </p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledActionName;

/**
 <p>The namespace of the AWS service that provides the resource. For a resource provided by your own application or service, use <code>custom-resource</code> instead.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingServiceNamespace serviceNamespace;

/**
 <p>The date and time for this scheduled action to start.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 
 */
@interface AWSapplication-autoscalingPutScheduledActionResponse : AWSModel


@end

/**
 
 */
@interface AWSapplication-autoscalingRegisterScalableTargetRequest : AWSRequest


/**
 <p>The maximum value that you plan to scale out to. When a scaling policy is in effect, Application Auto Scaling can scale out (expand) as needed to the maximum capacity limit in response to changing demand. </p><p>This parameter is required if you are registering a scalable target.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCapacity;

/**
 <p>The minimum value that you plan to scale in to. When a scaling policy is in effect, Application Auto Scaling can scale in (contract) as needed to the minimum capacity limit in response to changing demand. </p><p>This parameter is required if you are registering a scalable target. For Lambda provisioned concurrency, the minimum value allowed is 0. For all other resources, the minimum value allowed is 1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minCapacity;

/**
 <p>The identifier of the resource that is associated with the scalable target. This string consists of the resource type and unique identifier.</p><ul><li><p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p></li><li><p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p></li><li><p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p></li><li><p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p></li><li><p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p></li><li><p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p></li><li><p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p></li><li><p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p></li><li><p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub repository</a>.</p></li><li><p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p></li><li><p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p></li><li><p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>This parameter is required for services that do not support service-linked roles (such as Amazon EMR), and it must specify the ARN of an IAM role that allows Application Auto Scaling to modify the scalable target on your behalf. </p><p>If the service supports service-linked roles, Application Auto Scaling uses a service-linked role, which it creates if it does not yet exist. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/security_iam_service-with-iam.html#security_iam_service-with-iam-roles">Application Auto Scaling IAM Roles</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

/**
 <p>The scalable dimension associated with the scalable target. This string consists of the service namespace, resource type, and scaling property.</p><ul><li><p><code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p></li><li><p><code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p></li><li><p><code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p></li><li><p><code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p></li><li><p><code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p></li><li><p><code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p></li><li><p><code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p></li><li><p><code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p></li><li><p><code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p></li><li><p><code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p></li><li><p><code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p></li><li><p><code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p></li><li><p><code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p></li></ul>
 */
@property (nonatomic, assign) AWSapplication-autoscalingScalableDimension scalableDimension;

/**
 <p>The namespace of the AWS service that provides the resource. For a resource provided by your own application or service, use <code>custom-resource</code> instead.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingServiceNamespace serviceNamespace;

/**
 <p>An embedded object that contains attributes and attribute values that are used to suspend and resume automatic scaling. Setting the value of an attribute to <code>true</code> suspends the specified scaling activities. Setting it to <code>false</code> (default) resumes the specified scaling activities. </p><p><b>Suspension Outcomes</b></p><ul><li><p>For <code>DynamicScalingInSuspended</code>, while a suspension is in effect, all scale-in activities that are triggered by a scaling policy are suspended.</p></li><li><p>For <code>DynamicScalingOutSuspended</code>, while a suspension is in effect, all scale-out activities that are triggered by a scaling policy are suspended.</p></li><li><p>For <code>ScheduledScalingSuspended</code>, while a suspension is in effect, all scaling activities that involve scheduled actions are suspended. </p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-suspend-resume-scaling.html">Suspending and Resuming Scaling</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSapplication-autoscalingSuspendedState * _Nullable suspendedState;

@end

/**
 
 */
@interface AWSapplication-autoscalingRegisterScalableTargetResponse : AWSModel


@end

/**
 <p>Represents a scalable target.</p>
 Required parameters: [ServiceNamespace, ResourceId, ScalableDimension, MinCapacity, MaxCapacity, RoleARN, CreationTime]
 */
@interface AWSapplication-autoscalingScalableTarget : AWSModel


/**
 <p>The Unix timestamp for when the scalable target was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The maximum value to scale to in response to a scale-out event.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCapacity;

/**
 <p>The minimum value to scale to in response to a scale-in event.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minCapacity;

/**
 <p>The identifier of the resource associated with the scalable target. This string consists of the resource type and unique identifier.</p><ul><li><p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p></li><li><p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p></li><li><p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p></li><li><p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p></li><li><p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p></li><li><p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p></li><li><p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p></li><li><p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p></li><li><p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub repository</a>.</p></li><li><p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p></li><li><p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p></li><li><p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The ARN of an IAM role that allows Application Auto Scaling to modify the scalable target on your behalf.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

/**
 <p>The scalable dimension associated with the scalable target. This string consists of the service namespace, resource type, and scaling property.</p><ul><li><p><code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p></li><li><p><code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p></li><li><p><code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p></li><li><p><code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p></li><li><p><code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p></li><li><p><code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p></li><li><p><code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p></li><li><p><code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p></li><li><p><code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p></li><li><p><code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p></li><li><p><code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p></li><li><p><code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p></li><li><p><code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p></li></ul>
 */
@property (nonatomic, assign) AWSapplication-autoscalingScalableDimension scalableDimension;

/**
 <p>The namespace of the AWS service that provides the resource, or a <code>custom-resource</code>.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingServiceNamespace serviceNamespace;

/**
 <p>Specifies whether the scaling activities for a scalable target are in a suspended state. </p>
 */
@property (nonatomic, strong) AWSapplication-autoscalingSuspendedState * _Nullable suspendedState;

@end

/**
 <p>Represents the minimum and maximum capacity for a scheduled action.</p>
 */
@interface AWSapplication-autoscalingScalableTargetAction : AWSModel


/**
 <p>The maximum capacity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCapacity;

/**
 <p>The minimum capacity.</p><p>For Lambda provisioned concurrency, the minimum value allowed is 0. For all other resources, the minimum value allowed is 1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minCapacity;

@end

/**
 <p>Represents a scaling activity.</p>
 Required parameters: [ActivityId, ServiceNamespace, ResourceId, ScalableDimension, Description, Cause, StartTime, StatusCode]
 */
@interface AWSapplication-autoscalingScalingActivity : AWSModel


/**
 <p>The unique identifier of the scaling activity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable activityId;

/**
 <p>A simple description of what caused the scaling activity to happen.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cause;

/**
 <p>A simple description of what action the scaling activity intends to accomplish.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The details about the scaling activity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable details;

/**
 <p>The Unix timestamp for when the scaling activity ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The identifier of the resource associated with the scaling activity. This string consists of the resource type and unique identifier.</p><ul><li><p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p></li><li><p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p></li><li><p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p></li><li><p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p></li><li><p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p></li><li><p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p></li><li><p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p></li><li><p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p></li><li><p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub repository</a>.</p></li><li><p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p></li><li><p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p></li><li><p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The scalable dimension. This string consists of the service namespace, resource type, and scaling property.</p><ul><li><p><code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p></li><li><p><code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p></li><li><p><code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p></li><li><p><code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p></li><li><p><code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p></li><li><p><code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p></li><li><p><code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p></li><li><p><code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p></li><li><p><code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p></li><li><p><code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p></li><li><p><code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p></li><li><p><code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p></li><li><p><code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p></li></ul>
 */
@property (nonatomic, assign) AWSapplication-autoscalingScalableDimension scalableDimension;

/**
 <p>The namespace of the AWS service that provides the resource, or a <code>custom-resource</code>.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingServiceNamespace serviceNamespace;

/**
 <p>The Unix timestamp for when the scaling activity began.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>Indicates the status of the scaling activity.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingScalingActivityStatusCode statusCode;

/**
 <p>A simple message about the current status of the scaling activity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

@end

/**
 <p>Represents a scaling policy to use with Application Auto Scaling.</p>
 Required parameters: [PolicyARN, PolicyName, ServiceNamespace, ResourceId, ScalableDimension, PolicyType, CreationTime]
 */
@interface AWSapplication-autoscalingScalingPolicy : AWSModel


/**
 <p>The CloudWatch alarms associated with the scaling policy.</p>
 */
@property (nonatomic, strong) NSArray<AWSapplication-autoscalingAlarm *> * _Nullable alarms;

/**
 <p>The Unix timestamp for when the scaling policy was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The Amazon Resource Name (ARN) of the scaling policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyARN;

/**
 <p>The name of the scaling policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The scaling policy type.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingPolicyType policyType;

/**
 <p>The identifier of the resource associated with the scaling policy. This string consists of the resource type and unique identifier.</p><ul><li><p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p></li><li><p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p></li><li><p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p></li><li><p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p></li><li><p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p></li><li><p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p></li><li><p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p></li><li><p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p></li><li><p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub repository</a>.</p></li><li><p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p></li><li><p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p></li><li><p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The scalable dimension. This string consists of the service namespace, resource type, and scaling property.</p><ul><li><p><code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p></li><li><p><code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p></li><li><p><code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p></li><li><p><code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p></li><li><p><code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p></li><li><p><code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p></li><li><p><code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p></li><li><p><code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p></li><li><p><code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p></li><li><p><code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p></li><li><p><code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p></li><li><p><code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p></li><li><p><code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p></li></ul>
 */
@property (nonatomic, assign) AWSapplication-autoscalingScalableDimension scalableDimension;

/**
 <p>The namespace of the AWS service that provides the resource, or a <code>custom-resource</code>.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingServiceNamespace serviceNamespace;

/**
 <p>A step scaling policy.</p>
 */
@property (nonatomic, strong) AWSapplication-autoscalingStepScalingPolicyConfiguration * _Nullable stepScalingPolicyConfiguration;

/**
 <p>A target tracking scaling policy.</p>
 */
@property (nonatomic, strong) AWSapplication-autoscalingTargetTrackingScalingPolicyConfiguration * _Nullable targetTrackingScalingPolicyConfiguration;

@end

/**
 <p>Represents a scheduled action.</p>
 Required parameters: [ScheduledActionName, ScheduledActionARN, ServiceNamespace, Schedule, ResourceId, CreationTime]
 */
@interface AWSapplication-autoscalingScheduledAction : AWSModel


/**
 <p>The date and time that the scheduled action was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The date and time that the action is scheduled to end.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The identifier of the resource associated with the scaling policy. This string consists of the resource type and unique identifier.</p><ul><li><p>ECS service - The resource type is <code>service</code> and the unique identifier is the cluster name and service name. Example: <code>service/default/sample-webapp</code>.</p></li><li><p>Spot Fleet request - The resource type is <code>spot-fleet-request</code> and the unique identifier is the Spot Fleet request ID. Example: <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.</p></li><li><p>EMR cluster - The resource type is <code>instancegroup</code> and the unique identifier is the cluster ID and instance group ID. Example: <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.</p></li><li><p>AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.</p></li><li><p>DynamoDB table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>table/my-table</code>.</p></li><li><p>DynamoDB global secondary index - The resource type is <code>index</code> and the unique identifier is the index name. Example: <code>table/my-table/index/my-table-index</code>.</p></li><li><p>Aurora DB cluster - The resource type is <code>cluster</code> and the unique identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.</p></li><li><p>Amazon SageMaker endpoint variant - The resource type is <code>variant</code> and the unique identifier is the resource ID. Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.</p></li><li><p>Custom resources are not supported with a resource type. This parameter must specify the <code>OutputValue</code> from the CloudFormation template stack used to access the resources. The unique identifier is defined by the service provider. More information is available in our <a href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub repository</a>.</p></li><li><p>Amazon Comprehend document classification endpoint - The resource type and unique identifier are specified using the endpoint ARN. Example: <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.</p></li><li><p>Lambda provisioned concurrency - The resource type is <code>function</code> and the unique identifier is the function name with a function version or alias name suffix that is not <code>$LATEST</code>. Example: <code>function:my-function:prod</code> or <code>function:my-function:1</code>.</p></li><li><p>Amazon Keyspaces table - The resource type is <code>table</code> and the unique identifier is the table name. Example: <code>keyspace/mykeyspace/table/mytable</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The scalable dimension. This string consists of the service namespace, resource type, and scaling property.</p><ul><li><p><code>ecs:service:DesiredCount</code> - The desired task count of an ECS service.</p></li><li><p><code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of a Spot Fleet request.</p></li><li><p><code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance count of an EMR Instance Group.</p></li><li><p><code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an AppStream 2.0 fleet.</p></li><li><p><code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB table.</p></li><li><p><code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read capacity for a DynamoDB global secondary index.</p></li><li><p><code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write capacity for a DynamoDB global secondary index.</p></li><li><p><code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible edition.</p></li><li><p><code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2 instances for an Amazon SageMaker model endpoint variant.</p></li><li><p><code>custom-resource:ResourceType:Property</code> - The scalable dimension for a custom resource provided by your own application or service.</p></li><li><p><code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> - The number of inference units for an Amazon Comprehend document classification endpoint.</p></li><li><p><code>lambda:function:ProvisionedConcurrency</code> - The provisioned concurrency for a Lambda function.</p></li><li><p><code>cassandra:table:ReadCapacityUnits</code> - The provisioned read capacity for an Amazon Keyspaces table.</p></li><li><p><code>cassandra:table:WriteCapacityUnits</code> - The provisioned write capacity for an Amazon Keyspaces table.</p></li></ul>
 */
@property (nonatomic, assign) AWSapplication-autoscalingScalableDimension scalableDimension;

/**
 <p>The new minimum and maximum capacity. You can set both values or just one. At the scheduled time, if the current capacity is below the minimum capacity, Application Auto Scaling scales out to the minimum capacity. If the current capacity is above the maximum capacity, Application Auto Scaling scales in to the maximum capacity.</p>
 */
@property (nonatomic, strong) AWSapplication-autoscalingScalableTargetAction * _Nullable scalableTargetAction;

/**
 <p>The schedule for this action. The following formats are supported:</p><ul><li><p>At expressions - "<code>at(<i>yyyy</i>-<i>mm</i>-<i>dd</i>T<i>hh</i>:<i>mm</i>:<i>ss</i>)</code>"</p></li><li><p>Rate expressions - "<code>rate(<i>value</i><i>unit</i>)</code>"</p></li><li><p>Cron expressions - "<code>cron(<i>fields</i>)</code>"</p></li></ul><p>At expressions are useful for one-time schedules. Specify the time in UTC.</p><p>For rate expressions, <i>value</i> is a positive integer and <i>unit</i> is <code>minute</code> | <code>minutes</code> | <code>hour</code> | <code>hours</code> | <code>day</code> | <code>days</code>.</p><p>For more information about cron expressions, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions">Cron Expressions</a> in the <i>Amazon CloudWatch Events User Guide</i>.</p><p>For examples of using these expressions, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html">Scheduled Scaling</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schedule;

/**
 <p>The Amazon Resource Name (ARN) of the scheduled action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledActionARN;

/**
 <p>The name of the scheduled action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledActionName;

/**
 <p>The namespace of the AWS service that provides the resource, or a <code>custom-resource</code>.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingServiceNamespace serviceNamespace;

/**
 <p>The date and time that the action is scheduled to begin.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 <p>Represents a step adjustment for a <a href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_StepScalingPolicyConfiguration.html">StepScalingPolicyConfiguration</a>. Describes an adjustment based on the difference between the value of the aggregated CloudWatch metric and the breach threshold that you've defined for the alarm. </p><p>For the following examples, suppose that you have an alarm with a breach threshold of 50:</p><ul><li><p>To trigger the adjustment when the metric is greater than or equal to 50 and less than 60, specify a lower bound of 0 and an upper bound of 10.</p></li><li><p>To trigger the adjustment when the metric is greater than 40 and less than or equal to 50, specify a lower bound of -10 and an upper bound of 0.</p></li></ul><p>There are a few rules for the step adjustments for your step policy:</p><ul><li><p>The ranges of your step adjustments can't overlap or have a gap.</p></li><li><p>At most one step adjustment can have a null lower bound. If one step adjustment has a negative lower bound, then there must be a step adjustment with a null lower bound.</p></li><li><p>At most one step adjustment can have a null upper bound. If one step adjustment has a positive upper bound, then there must be a step adjustment with a null upper bound.</p></li><li><p>The upper and lower bound can't be null in the same step adjustment.</p></li></ul>
 Required parameters: [ScalingAdjustment]
 */
@interface AWSapplication-autoscalingStepAdjustment : AWSModel


/**
 <p>The lower bound for the difference between the alarm threshold and the CloudWatch metric. If the metric value is above the breach threshold, the lower bound is inclusive (the metric must be greater than or equal to the threshold plus the lower bound). Otherwise, it is exclusive (the metric must be greater than the threshold plus the lower bound). A null value indicates negative infinity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable metricIntervalLowerBound;

/**
 <p>The upper bound for the difference between the alarm threshold and the CloudWatch metric. If the metric value is above the breach threshold, the upper bound is exclusive (the metric must be less than the threshold plus the upper bound). Otherwise, it is inclusive (the metric must be less than or equal to the threshold plus the upper bound). A null value indicates positive infinity.</p><p>The upper bound must be greater than the lower bound.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable metricIntervalUpperBound;

/**
 <p>The amount by which to scale, based on the specified adjustment type. A positive value adds to the current capacity while a negative number removes from the current capacity. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scalingAdjustment;

@end

/**
 <p>Represents a step scaling policy configuration to use with Application Auto Scaling.</p>
 */
@interface AWSapplication-autoscalingStepScalingPolicyConfiguration : AWSModel


/**
 <p>Specifies whether the <code>ScalingAdjustment</code> value in a <a href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_StepAdjustment.html">StepAdjustment</a> is an absolute number or a percentage of the current capacity. </p><p><code>AdjustmentType</code> is required if you are adding a new step scaling policy configuration.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingAdjustmentType adjustmentType;

/**
 <p>The amount of time, in seconds, after a scaling activity completes where previous trigger-related scaling activities can influence future scaling events.</p><p>For scale-out policies, while the cooldown period is in effect, the capacity that has been added by the previous scale-out action that initiated the cooldown is calculated as part of the desired capacity for the next scale out. The intention is to continuously (but not excessively) scale out. For example, an alarm triggers a step scaling policy to scale out an Amazon ECS service by 2 tasks, the scaling activity completes successfully, and a cooldown period of 5 minutes starts. During the cooldown period, if the alarm triggers the same policy again but at a more aggressive step adjustment to scale out the service by 3 tasks, the 2 tasks that were added in the previous scale-out action are considered part of that capacity and only 1 additional task is added to the desired count.</p><p>For scale-in policies, the cooldown period is used to block subsequent scale-in requests until it has expired. The intention is to scale in conservatively to protect your application's availability. However, if another alarm triggers a scale-out policy during the cooldown period after a scale-in, Application Auto Scaling scales out your scalable target immediately.</p><p>Application Auto Scaling provides a default value of 300 for the following scalable targets:</p><ul><li><p>ECS services</p></li><li><p>Spot Fleet requests</p></li><li><p>EMR clusters</p></li><li><p>AppStream 2.0 fleets</p></li><li><p>Aurora DB clusters</p></li><li><p>Amazon SageMaker endpoint variants</p></li><li><p>Custom resources</p></li></ul><p>For all other scalable targets, the default value is 0:</p><ul><li><p>DynamoDB tables</p></li><li><p>DynamoDB global secondary indexes</p></li><li><p>Amazon Comprehend document classification endpoints</p></li><li><p>Lambda provisioned concurrency</p></li><li><p>Amazon Keyspaces tables</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable cooldown;

/**
 <p>The aggregation type for the CloudWatch metrics. Valid values are <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code>. If the aggregation type is null, the value is treated as <code>Average</code>.</p>
 */
@property (nonatomic, assign) AWSapplication-autoscalingMetricAggregationType metricAggregationType;

/**
 <p>The minimum value to scale by when scaling by percentages. For example, suppose that you create a step scaling policy to scale out an Amazon ECS service by 25 percent and you specify a <code>MinAdjustmentMagnitude</code> of 2. If the service has 4 tasks and the scaling policy is performed, 25 percent of 4 is 1. However, because you specified a <code>MinAdjustmentMagnitude</code> of 2, Application Auto Scaling scales out the service by 2 tasks.</p><p>Valid only if the adjustment type is <code>PercentChangeInCapacity</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minAdjustmentMagnitude;

/**
 <p>A set of adjustments that enable you to scale based on the size of the alarm breach.</p><p>At least one step adjustment is required if you are adding a new step scaling policy configuration.</p>
 */
@property (nonatomic, strong) NSArray<AWSapplication-autoscalingStepAdjustment *> * _Nullable stepAdjustments;

@end

/**
 <p>Specifies whether the scaling activities for a scalable target are in a suspended state. </p>
 */
@interface AWSapplication-autoscalingSuspendedState : AWSModel


/**
 <p>Whether scale in by a target tracking scaling policy or a step scaling policy is suspended. Set the value to <code>true</code> if you don't want Application Auto Scaling to remove capacity when a scaling policy is triggered. The default is <code>false</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dynamicScalingInSuspended;

/**
 <p>Whether scale out by a target tracking scaling policy or a step scaling policy is suspended. Set the value to <code>true</code> if you don't want Application Auto Scaling to add capacity when a scaling policy is triggered. The default is <code>false</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dynamicScalingOutSuspended;

/**
 <p>Whether scheduled scaling is suspended. Set the value to <code>true</code> if you don't want Application Auto Scaling to add or remove capacity by initiating scheduled actions. The default is <code>false</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scheduledScalingSuspended;

@end

/**
 <p>Represents a target tracking scaling policy configuration to use with Application Auto Scaling.</p>
 Required parameters: [TargetValue]
 */
@interface AWSapplication-autoscalingTargetTrackingScalingPolicyConfiguration : AWSModel


/**
 <p>A customized metric. You can specify either a predefined metric or a customized metric.</p>
 */
@property (nonatomic, strong) AWSapplication-autoscalingCustomizedMetricSpecification * _Nullable customizedMetricSpecification;

/**
 <p>Indicates whether scale in by the target tracking scaling policy is disabled. If the value is <code>true</code>, scale in is disabled and the target tracking scaling policy won't remove capacity from the scalable target. Otherwise, scale in is enabled and the target tracking scaling policy can remove capacity from the scalable target. The default value is <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableScaleIn;

/**
 <p>A predefined metric. You can specify either a predefined metric or a customized metric.</p>
 */
@property (nonatomic, strong) AWSapplication-autoscalingPredefinedMetricSpecification * _Nullable predefinedMetricSpecification;

/**
 <p>The amount of time, in seconds, after a scale-in activity completes before another scale in activity can start.</p><p>The cooldown period is used to block subsequent scale-in requests until it has expired. The intention is to scale in conservatively to protect your application's availability. However, if another alarm triggers a scale-out policy during the cooldown period after a scale-in, Application Auto Scaling scales out your scalable target immediately.</p><p>Application Auto Scaling provides a default value of 300 for the following scalable targets:</p><ul><li><p>ECS services</p></li><li><p>Spot Fleet requests</p></li><li><p>EMR clusters</p></li><li><p>AppStream 2.0 fleets</p></li><li><p>Aurora DB clusters</p></li><li><p>Amazon SageMaker endpoint variants</p></li><li><p>Custom resources</p></li></ul><p>For all other scalable targets, the default value is 0:</p><ul><li><p>DynamoDB tables</p></li><li><p>DynamoDB global secondary indexes</p></li><li><p>Amazon Comprehend document classification endpoints</p></li><li><p>Lambda provisioned concurrency</p></li><li><p>Amazon Keyspaces tables</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable scaleInCooldown;

/**
 <p>The amount of time, in seconds, after a scale-out activity completes before another scale-out activity can start.</p><p>While the cooldown period is in effect, the capacity that has been added by the previous scale-out action that initiated the cooldown is calculated as part of the desired capacity for the next scale out. The intention is to continuously (but not excessively) scale out.</p><p>Application Auto Scaling provides a default value of 300 for the following scalable targets:</p><ul><li><p>ECS services</p></li><li><p>Spot Fleet requests</p></li><li><p>EMR clusters</p></li><li><p>AppStream 2.0 fleets</p></li><li><p>Aurora DB clusters</p></li><li><p>Amazon SageMaker endpoint variants</p></li><li><p>Custom resources</p></li></ul><p>For all other scalable targets, the default value is 0:</p><ul><li><p>DynamoDB tables</p></li><li><p>DynamoDB global secondary indexes</p></li><li><p>Amazon Comprehend document classification endpoints</p></li><li><p>Lambda provisioned concurrency</p></li><li><p>Amazon Keyspaces tables</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable scaleOutCooldown;

/**
 <p>The target value for the metric. The range is 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetValue;

@end

NS_ASSUME_NONNULL_END
