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

FOUNDATION_EXPORT NSString *const AWSKafkaErrorDomain;

typedef NS_ENUM(NSInteger, AWSKafkaErrorType) {
    AWSKafkaErrorUnknown,
    AWSKafkaErrorBadRequest,
    AWSKafkaErrorConflict,
    AWSKafkaErrorForbidden,
    AWSKafkaErrorInternalServerError,
    AWSKafkaErrorNotFound,
    AWSKafkaErrorServiceUnavailable,
    AWSKafkaErrorTooManyRequests,
    AWSKafkaErrorUnauthorized,
};

typedef NS_ENUM(NSInteger, AWSKafkaBrokerAZDistribution) {
    AWSKafkaBrokerAZDistributionUnknown,
    AWSKafkaBrokerAZDistributionDefault,
};

typedef NS_ENUM(NSInteger, AWSKafkaClientBroker) {
    AWSKafkaClientBrokerUnknown,
    AWSKafkaClientBrokerTls,
    AWSKafkaClientBrokerTlsPlaintext,
    AWSKafkaClientBrokerPlaintext,
};

typedef NS_ENUM(NSInteger, AWSKafkaClusterState) {
    AWSKafkaClusterStateUnknown,
    AWSKafkaClusterStateActive,
    AWSKafkaClusterStateCreating,
    AWSKafkaClusterStateUpdating,
    AWSKafkaClusterStateDeleting,
    AWSKafkaClusterStateFailed,
};

typedef NS_ENUM(NSInteger, AWSKafkaEnhancedMonitoring) {
    AWSKafkaEnhancedMonitoringUnknown,
    AWSKafkaEnhancedMonitoringDefault,
    AWSKafkaEnhancedMonitoringPerBroker,
    AWSKafkaEnhancedMonitoringPerTopicPerBroker,
};

typedef NS_ENUM(NSInteger, AWSKafkaKafkaVersionStatus) {
    AWSKafkaKafkaVersionStatusUnknown,
    AWSKafkaKafkaVersionStatusActive,
    AWSKafkaKafkaVersionStatusDeprecated,
};

typedef NS_ENUM(NSInteger, AWSKafkaNodeType) {
    AWSKafkaNodeTypeUnknown,
    AWSKafkaNodeTypeBroker,
};

@class AWSKafkaBrokerEBSVolumeInfo;
@class AWSKafkaBrokerLogs;
@class AWSKafkaBrokerNodeGroupInfo;
@class AWSKafkaBrokerNodeInfo;
@class AWSKafkaBrokerSoftwareInfo;
@class AWSKafkaClientAuthentication;
@class AWSKafkaCloudWatchLogs;
@class AWSKafkaClusterInfo;
@class AWSKafkaClusterOperationInfo;
@class AWSKafkaClusterOperationStep;
@class AWSKafkaClusterOperationStepInfo;
@class AWSKafkaCompatibleKafkaVersion;
@class AWSKafkaConfiguration;
@class AWSKafkaConfigurationInfo;
@class AWSKafkaConfigurationRevision;
@class AWSKafkaCreateClusterRequest;
@class AWSKafkaCreateClusterResponse;
@class AWSKafkaCreateConfigurationRequest;
@class AWSKafkaCreateConfigurationResponse;
@class AWSKafkaDeleteClusterRequest;
@class AWSKafkaDeleteClusterResponse;
@class AWSKafkaDescribeClusterOperationRequest;
@class AWSKafkaDescribeClusterOperationResponse;
@class AWSKafkaDescribeClusterRequest;
@class AWSKafkaDescribeClusterResponse;
@class AWSKafkaDescribeConfigurationRequest;
@class AWSKafkaDescribeConfigurationResponse;
@class AWSKafkaDescribeConfigurationRevisionRequest;
@class AWSKafkaDescribeConfigurationRevisionResponse;
@class AWSKafkaEBSStorageInfo;
@class AWSKafkaEncryptionAtRest;
@class AWSKafkaEncryptionInTransit;
@class AWSKafkaEncryptionInfo;
@class AWSKafkaError;
@class AWSKafkaErrorInfo;
@class AWSKafkaFirehose;
@class AWSKafkaGetBootstrapBrokersRequest;
@class AWSKafkaGetBootstrapBrokersResponse;
@class AWSKafkaGetCompatibleKafkaVersionsRequest;
@class AWSKafkaGetCompatibleKafkaVersionsResponse;
@class AWSKafkaKafkaVersion;
@class AWSKafkaListClusterOperationsRequest;
@class AWSKafkaListClusterOperationsResponse;
@class AWSKafkaListClustersRequest;
@class AWSKafkaListClustersResponse;
@class AWSKafkaListConfigurationRevisionsRequest;
@class AWSKafkaListConfigurationRevisionsResponse;
@class AWSKafkaListConfigurationsRequest;
@class AWSKafkaListConfigurationsResponse;
@class AWSKafkaListKafkaVersionsRequest;
@class AWSKafkaListKafkaVersionsResponse;
@class AWSKafkaListNodesRequest;
@class AWSKafkaListNodesResponse;
@class AWSKafkaListTagsForResourceRequest;
@class AWSKafkaListTagsForResourceResponse;
@class AWSKafkaLoggingInfo;
@class AWSKafkaMutableClusterInfo;
@class AWSKafkaNodeExporter;
@class AWSKafkaNodeExporterInfo;
@class AWSKafkaJmxExporter;
@class AWSKafkaJmxExporterInfo;
@class AWSKafkaOpenMonitoring;
@class AWSKafkaOpenMonitoringInfo;
@class AWSKafkaPrometheus;
@class AWSKafkaPrometheusInfo;
@class AWSKafkaS3;
@class AWSKafkaNodeInfo;
@class AWSKafkaStateInfo;
@class AWSKafkaStorageInfo;
@class AWSKafkaTagResourceRequest;
@class AWSKafkaTls;
@class AWSKafkaUntagResourceRequest;
@class AWSKafkaUpdateBrokerCountRequest;
@class AWSKafkaUpdateBrokerCountResponse;
@class AWSKafkaUpdateBrokerStorageRequest;
@class AWSKafkaUpdateBrokerStorageResponse;
@class AWSKafkaUpdateClusterConfigurationRequest;
@class AWSKafkaUpdateClusterConfigurationResponse;
@class AWSKafkaUpdateClusterKafkaVersionRequest;
@class AWSKafkaUpdateClusterKafkaVersionResponse;
@class AWSKafkaUpdateMonitoringRequest;
@class AWSKafkaUpdateMonitoringResponse;
@class AWSKafkaZookeeperNodeInfo;

/**
  <p>Specifies the EBS volume upgrade information. The broker identifier must be set to the keyword ALL. This means the changes apply to all the brokers in the cluster.</p>
 Required parameters: [VolumeSizeGB, KafkaBrokerNodeId]
 */
@interface AWSKafkaBrokerEBSVolumeInfo : AWSModel


/**
  <p>The ID of the broker to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kafkaBrokerNodeId;

/**
  <p>Size of the EBS volume to update.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSizeGB;

@end

/**
 
 */
@interface AWSKafkaBrokerLogs : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSKafkaCloudWatchLogs * _Nullable cloudWatchLogs;

/**
 
 */
@property (nonatomic, strong) AWSKafkaFirehose * _Nullable firehose;

/**
 
 */
@property (nonatomic, strong) AWSKafkaS3 * _Nullable s3;

@end

/**
  <p>Describes the setup to be used for Kafka broker nodes in the cluster.</p>
 Required parameters: [ClientSubnets, InstanceType]
 */
@interface AWSKafkaBrokerNodeGroupInfo : AWSModel


/**
  <p>The distribution of broker nodes across Availability Zones. This is an optional parameter. If you don't specify it, Amazon MSK gives it the value DEFAULT. You can also explicitly set this parameter to the value DEFAULT. No other values are currently allowed.</p><p>Amazon MSK distributes the broker nodes evenly across the Availability Zones that correspond to the subnets you provide when you create the cluster.</p>
 */
@property (nonatomic, assign) AWSKafkaBrokerAZDistribution brokerAZDistribution;

/**
  <p>The list of subnets to connect to in the client virtual private cloud (VPC). AWS creates elastic network interfaces inside these subnets. Client applications use elastic network interfaces to produce and consume data. Client subnets can't be in Availability Zone us-east-1e.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable clientSubnets;

/**
  <p>The type of Amazon EC2 instances to use for Kafka brokers. The following instance types are allowed: kafka.m5.large, kafka.m5.xlarge, kafka.m5.2xlarge, kafka.m5.4xlarge, kafka.m5.12xlarge, and kafka.m5.24xlarge.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
  <p>The AWS security groups to associate with the elastic network interfaces in order to specify who can connect to and communicate with the Amazon MSK cluster. If you don't specify a security group, Amazon MSK uses the default security group associated with the VPC.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

/**
  <p>Contains information about storage volumes attached to MSK broker nodes.</p>
 */
@property (nonatomic, strong) AWSKafkaStorageInfo * _Nullable storageInfo;

@end

/**
  <p>BrokerNodeInfo</p>
 */
@interface AWSKafkaBrokerNodeInfo : AWSModel


/**
  <p>The attached elastic network interface of the broker.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachedENIId;

/**
  <p>The ID of the broker.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable brokerId;

/**
  <p>The client subnet to which this broker node belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientSubnet;

/**
  <p>The virtual private cloud (VPC) of the client.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientVpcIpAddress;

/**
  <p>Information about the version of software currently deployed on the Kafka brokers in the cluster.</p>
 */
@property (nonatomic, strong) AWSKafkaBrokerSoftwareInfo * _Nullable currentBrokerSoftwareInfo;

/**
  <p>Endpoints for accessing the broker.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable endpoints;

@end

/**
  <p>Information about the current software installed on the cluster.</p>
 */
@interface AWSKafkaBrokerSoftwareInfo : AWSModel


/**
  <p>The Amazon Resource Name (ARN) of the configuration used for the cluster. This field isn't visible in this preview release.</p>
 */
@property (nonatomic, strong) NSString * _Nullable configurationArn;

/**
  <p>The revision of the configuration to use. This field isn't visible in this preview release.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable configurationRevision;

/**
  <p>The version of Apache Kafka.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kafkaVersion;

@end

/**
  <p>Includes all client authentication information.</p>
 */
@interface AWSKafkaClientAuthentication : AWSModel


/**
  <p>Details for ClientAuthentication using TLS.</p>
 */
@property (nonatomic, strong) AWSKafkaTls * _Nullable tls;

@end

/**
 
 */
@interface AWSKafkaCloudWatchLogs : AWSModel


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable logGroup;

@end

/**
  <p>Returns information about a cluster.</p>
 */
@interface AWSKafkaClusterInfo : AWSModel


/**
  <p>Arn of active cluster operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable activeOperationArn;

/**
  <p>Information about the broker nodes.</p>
 */
@property (nonatomic, strong) AWSKafkaBrokerNodeGroupInfo * _Nullable brokerNodeGroupInfo;

/**
  <p>Includes all client authentication information.</p>
 */
@property (nonatomic, strong) AWSKafkaClientAuthentication * _Nullable clientAuthentication;

/**
  <p>The Amazon Resource Name (ARN) that uniquely identifies the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
  <p>The name of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterName;

/**
  <p>The time when the cluster was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
  <p>Information about the version of software currently deployed on the Kafka brokers in the cluster.</p>
 */
@property (nonatomic, strong) AWSKafkaBrokerSoftwareInfo * _Nullable currentBrokerSoftwareInfo;

/**
  <p>The current version of the MSK cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentVersion;

/**
  <p>Includes all encryption-related information.</p>
 */
@property (nonatomic, strong) AWSKafkaEncryptionInfo * _Nullable encryptionInfo;

/**
  <p>Specifies which metrics are gathered for the MSK cluster. This property has three possible values: DEFAULT, PER_BROKER, and PER_TOPIC_PER_BROKER. For a list of the metrics associated with each of these three levels of monitoring, see <a href="https://docs.aws.amazon.com/msk/latest/developerguide/monitoring.html">Monitoring</a>.</p>
 */
@property (nonatomic, assign) AWSKafkaEnhancedMonitoring enhancedMonitoring;

/**
 
 */
@property (nonatomic, strong) AWSKafkaLoggingInfo * _Nullable loggingInfo;

/**
  <p>The number of broker nodes in the cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfBrokerNodes;

/**
  <p>Settings for open monitoring using Prometheus.</p>
 */
@property (nonatomic, strong) AWSKafkaOpenMonitoring * _Nullable openMonitoring;

/**
  <p>The state of the cluster. The possible states are CREATING, ACTIVE, and FAILED.</p>
 */
@property (nonatomic, assign) AWSKafkaClusterState state;

/**
 
 */
@property (nonatomic, strong) AWSKafkaStateInfo * _Nullable stateInfo;

/**
  <p>Tags attached to the cluster.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
  <p>The connection string to use to connect to the Apache ZooKeeper cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable zookeeperConnectString;

@end

/**
  <p>Returns information about a cluster operation.</p>
 */
@interface AWSKafkaClusterOperationInfo : AWSModel


/**
  <p>The ID of the API request that triggered this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestId;

/**
  <p>ARN of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
  <p>The time that the operation was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
  <p>The time at which the operation finished.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
  <p>Describes the error if the operation fails.</p>
 */
@property (nonatomic, strong) AWSKafkaErrorInfo * _Nullable errorInfo;

/**
  <p>ARN of the cluster operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationArn;

/**
  <p>State of the cluster operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationState;

/**
  <p>Steps completed during the operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSKafkaClusterOperationStep *> * _Nullable operationSteps;

/**
  <p>Type of the cluster operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationType;

/**
  <p>Information about cluster attributes before a cluster is updated.</p>
 */
@property (nonatomic, strong) AWSKafkaMutableClusterInfo * _Nullable sourceClusterInfo;

/**
  <p>Information about cluster attributes after a cluster is updated.</p>
 */
@property (nonatomic, strong) AWSKafkaMutableClusterInfo * _Nullable targetClusterInfo;

@end

/**
  <p>Step taken during a cluster operation.</p>
 */
@interface AWSKafkaClusterOperationStep : AWSModel


/**
  <p>Information about the step and its status.</p>
 */
@property (nonatomic, strong) AWSKafkaClusterOperationStepInfo * _Nullable stepInfo;

/**
  <p>The name of the step.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stepName;

@end

/**
  <p>State information about the operation step.</p>
 */
@interface AWSKafkaClusterOperationStepInfo : AWSModel


/**
  <p>The steps current status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stepStatus;

@end

/**
  <p>Contains source Kafka versions and compatible target Kafka versions.</p> 
 */
@interface AWSKafkaCompatibleKafkaVersion : AWSModel


/**
  <p>A Kafka version.</p> 
 */
@property (nonatomic, strong) NSString * _Nullable sourceVersion;

/**
  <p>A list of Kafka versions.</p> 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetVersions;

@end

/**
  <p>Represents an MSK Configuration.</p>
 Required parameters: [Description, LatestRevision, CreationTime, KafkaVersions, Arn, Name]
 */
@interface AWSKafkaConfiguration : AWSModel


/**
  <p>The Amazon Resource Name (ARN) of the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
  <p>The time when the configuration was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
  <p>The description of the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
  <p>An array of the versions of Apache Kafka with which you can use this MSK configuration. You can use this configuration for an MSK cluster only if the Apache Kafka version specified for the cluster appears in this array.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable kafkaVersions;

/**
  <p>Latest revision of the configuration.</p>
 */
@property (nonatomic, strong) AWSKafkaConfigurationRevision * _Nullable latestRevision;

/**
  <p>The name of the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
  <p>Specifies the configuration to use for the brokers.</p>
 Required parameters: [Revision, Arn]
 */
@interface AWSKafkaConfigurationInfo : AWSModel


/**
  <p>ARN of the configuration to use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
  <p>The revision of the configuration to use.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable revision;

@end

/**
  <p>Describes a configuration revision.</p>
 Required parameters: [Revision, CreationTime]
 */
@interface AWSKafkaConfigurationRevision : AWSModel


/**
  <p>The time when the configuration revision was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
  <p>The description of the configuration revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
  <p>The revision number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable revision;

@end

/**
 
 */
@interface AWSKafkaCreateClusterRequest : AWSRequest


/**
  <p>Information about the broker nodes in the cluster.</p>
 */
@property (nonatomic, strong) AWSKafkaBrokerNodeGroupInfo * _Nullable brokerNodeGroupInfo;

/**
  <p>Includes all client authentication related information.</p>
 */
@property (nonatomic, strong) AWSKafkaClientAuthentication * _Nullable clientAuthentication;

/**
  <p>The name of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterName;

/**
  <p>Represents the configuration that you want MSK to use for the brokers in a cluster.</p>
 */
@property (nonatomic, strong) AWSKafkaConfigurationInfo * _Nullable configurationInfo;

/**
  <p>Includes all encryption-related information.</p>
 */
@property (nonatomic, strong) AWSKafkaEncryptionInfo * _Nullable encryptionInfo;

/**
  <p>Specifies the level of monitoring for the MSK cluster. The possible values are DEFAULT, PER_BROKER, and PER_TOPIC_PER_BROKER.</p>
 */
@property (nonatomic, assign) AWSKafkaEnhancedMonitoring enhancedMonitoring;

/**
  <p>The version of Apache Kafka.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kafkaVersion;

/**
 
 */
@property (nonatomic, strong) AWSKafkaLoggingInfo * _Nullable loggingInfo;

/**
  <p>The number of broker nodes in the cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfBrokerNodes;

/**
  <p>The settings for open monitoring.</p>
 */
@property (nonatomic, strong) AWSKafkaOpenMonitoringInfo * _Nullable openMonitoring;

/**
  <p>Create tags when creating the cluster.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSKafkaCreateClusterResponse : AWSModel


/**
  <p>The Amazon Resource Name (ARN) of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
  <p>The name of the MSK cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterName;

/**
  <p>The state of the cluster. The possible states are CREATING, ACTIVE, and FAILED.</p>
 */
@property (nonatomic, assign) AWSKafkaClusterState state;

@end

/**
 
 */
@interface AWSKafkaCreateConfigurationRequest : AWSRequest


/**
  <p>The description of the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
  <p>The versions of Apache Kafka with which you can use this MSK configuration.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable kafkaVersions;

/**
  <p>The name of the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
  <p>Contents of the <filename>server.properties</filename> file. When using the API, you must ensure that the contents of the file are base64 encoded. When using the AWS Management Console, the SDK, or the AWS CLI, the contents of <filename>server.properties</filename> can be in plaintext.</p>
 */
@property (nonatomic, strong) NSData * _Nullable serverProperties;

@end

/**
 
 */
@interface AWSKafkaCreateConfigurationResponse : AWSModel


/**
  <p>The Amazon Resource Name (ARN) of the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
  <p>The time when the configuration was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
  <p>Latest revision of the configuration.</p>
 */
@property (nonatomic, strong) AWSKafkaConfigurationRevision * _Nullable latestRevision;

/**
  <p>The name of the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSKafkaDeleteClusterRequest : AWSRequest


/**
  <p>The Amazon Resource Name (ARN) that uniquely identifies the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
  <p>The current version of the MSK cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentVersion;

@end

/**
 
 */
@interface AWSKafkaDeleteClusterResponse : AWSModel


/**
  <p>The Amazon Resource Name (ARN) of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
  <p>The state of the cluster. The possible states are CREATING, ACTIVE, and FAILED.</p>
 */
@property (nonatomic, assign) AWSKafkaClusterState state;

@end

/**
 
 */
@interface AWSKafkaDescribeClusterOperationRequest : AWSRequest


/**
  <p>The Amazon Resource Name (ARN) that uniquely identifies the MSK cluster operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterOperationArn;

@end

/**
 
 */
@interface AWSKafkaDescribeClusterOperationResponse : AWSModel


/**
  <p>Cluster operation information</p>
 */
@property (nonatomic, strong) AWSKafkaClusterOperationInfo * _Nullable clusterOperationInfo;

@end

/**
 
 */
@interface AWSKafkaDescribeClusterRequest : AWSRequest


/**
  <p>The Amazon Resource Name (ARN) that uniquely identifies the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

@end

/**
 
 */
@interface AWSKafkaDescribeClusterResponse : AWSModel


/**
  <p>The cluster information.</p>
 */
@property (nonatomic, strong) AWSKafkaClusterInfo * _Nullable clusterInfo;

@end

/**
 
 */
@interface AWSKafkaDescribeConfigurationRequest : AWSRequest


/**
  <p>The Amazon Resource Name (ARN) that uniquely identifies an MSK configuration and all of its revisions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 
 */
@interface AWSKafkaDescribeConfigurationResponse : AWSModel


/**
  <p>The Amazon Resource Name (ARN) of the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
  <p>The time when the configuration was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
  <p>The description of the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
  <p>The versions of Apache Kafka with which you can use this MSK configuration.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable kafkaVersions;

/**
  <p>Latest revision of the configuration.</p>
 */
@property (nonatomic, strong) AWSKafkaConfigurationRevision * _Nullable latestRevision;

/**
  <p>The name of the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSKafkaDescribeConfigurationRevisionRequest : AWSRequest


/**
  <p>The Amazon Resource Name (ARN) that uniquely identifies an MSK configuration and all of its revisions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
  <p>A string that uniquely identifies a revision of an MSK configuration.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable revision;

@end

/**
 
 */
@interface AWSKafkaDescribeConfigurationRevisionResponse : AWSModel


/**
  <p>The Amazon Resource Name (ARN) of the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
  <p>The time when the configuration was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
  <p>The description of the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
  <p>The revision number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable revision;

/**
  <p>Contents of the <filename>server.properties</filename> file. When using the API, you must ensure that the contents of the file are base64 encoded. When using the AWS Management Console, the SDK, or the AWS CLI, the contents of <filename>server.properties</filename> can be in plaintext.</p>
 */
@property (nonatomic, strong) NSData * _Nullable serverProperties;

@end

/**
  <p>Contains information about the EBS storage volumes attached to Kafka broker nodes.</p>
 */
@interface AWSKafkaEBSStorageInfo : AWSModel


/**
  <p>The size in GiB of the EBS volume for the data drive on each broker node.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSize;

@end

/**
  <p>The data-volume encryption details.</p>
 Required parameters: [DataVolumeKMSKeyId]
 */
@interface AWSKafkaEncryptionAtRest : AWSModel


/**
  <p>The ARN of the AWS KMS key for encrypting data at rest. If you don't specify a KMS key, MSK creates one for you and uses it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataVolumeKMSKeyId;

@end

/**
  <p>The settings for encrypting data in transit.</p>
 */
@interface AWSKafkaEncryptionInTransit : AWSModel


/**
  <p>Indicates the encryption setting for data in transit between clients and brokers. The following are the possible values.</p><p>TLS means that client-broker communication is enabled with TLS only.</p><p>TLS_PLAINTEXT means that client-broker communication is enabled for both TLS-encrypted, as well as plaintext data.</p><p>PLAINTEXT means that client-broker communication is enabled in plaintext only.</p><p>The default value is TLS_PLAINTEXT.</p>
 */
@property (nonatomic, assign) AWSKafkaClientBroker clientBroker;

/**
  <p>When set to true, it indicates that data communication among the broker nodes of the cluster is encrypted. When set to false, the communication happens in plaintext.</p><p>The default value is true.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inCluster;

@end

/**
  <p>Includes encryption-related information, such as the AWS KMS key used for encrypting data at rest and whether you want MSK to encrypt your data in transit.</p>
 */
@interface AWSKafkaEncryptionInfo : AWSModel


/**
  <p>The data-volume encryption details.</p>
 */
@property (nonatomic, strong) AWSKafkaEncryptionAtRest * _Nullable encryptionAtRest;

/**
  <p>The details for encryption in transit.</p>
 */
@property (nonatomic, strong) AWSKafkaEncryptionInTransit * _Nullable encryptionInTransit;

@end

/**
  <p>Returns information about an error.</p>
 */
@interface AWSKafkaError : AWSModel


/**
  <p>The parameter that caused the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable invalidParameter;

/**
  <p>The description of the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
  <p>Returns information about an error state of the cluster.</p>
 */
@interface AWSKafkaErrorInfo : AWSModel


/**
  <p>A number describing the error programmatically.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
  <p>An optional field to provide more details about the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorString;

@end

/**
 
 */
@interface AWSKafkaFirehose : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable deliveryStream;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 
 */
@interface AWSKafkaGetBootstrapBrokersRequest : AWSRequest


/**
  <p>The Amazon Resource Name (ARN) that uniquely identifies the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

@end

/**
 
 */
@interface AWSKafkaGetBootstrapBrokersResponse : AWSModel


/**
  <p>A string containing one or more hostname:port pairs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bootstrapBrokerString;

/**
  <p>A string containing one or more DNS names (or IP) and TLS port pairs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bootstrapBrokerStringTls;

@end

/**
 
 */
@interface AWSKafkaGetCompatibleKafkaVersionsRequest : AWSRequest


/**
  <p>The Amazon Resource Name (ARN) of the cluster check.</p> 
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

@end

/**
 
 */
@interface AWSKafkaGetCompatibleKafkaVersionsResponse : AWSModel


/**
  <p>A list of CompatibleKafkaVersion objects.</p> 
 */
@property (nonatomic, strong) NSArray<AWSKafkaCompatibleKafkaVersion *> * _Nullable compatibleKafkaVersions;

@end

/**
 
 */
@interface AWSKafkaKafkaVersion : AWSModel


/**
 
 */
@property (nonatomic, assign) AWSKafkaKafkaVersionStatus status;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSKafkaListClusterOperationsRequest : AWSRequest


/**
  <p>The Amazon Resource Name (ARN) that uniquely identifies the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
  <p>The maximum number of results to return in the response. If there are more results, the response includes a NextToken parameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
  <p>The paginated results marker. When the result of the operation is truncated, the call returns NextToken in the response.To get the next batch, provide this token in your next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSKafkaListClusterOperationsResponse : AWSModel


/**
  <p>An array of cluster operation information objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSKafkaClusterOperationInfo *> * _Nullable clusterOperationInfoList;

/**
  <p>If the response of ListClusterOperations is truncated, it returns a NextToken in the response. This Nexttoken should be sent in the subsequent request to ListClusterOperations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSKafkaListClustersRequest : AWSRequest


/**
  <p>Specify a prefix of the name of the clusters that you want to list. The service lists all the clusters whose names start with this prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterNameFilter;

/**
  <p>The maximum number of results to return in the response. If there are more results, the response includes a NextToken parameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
  <p>The paginated results marker. When the result of the operation is truncated, the call returns NextToken in the response.To get the next batch, provide this token in your next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSKafkaListClustersResponse : AWSModel


/**
  <p>Information on each of the MSK clusters in the response.</p>
 */
@property (nonatomic, strong) NSArray<AWSKafkaClusterInfo *> * _Nullable clusterInfoList;

/**
  <p>The paginated results marker. When the result of a ListClusters operation is truncated, the call returns NextToken in the response. To get another batch of clusters, provide this token in your next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSKafkaListConfigurationRevisionsRequest : AWSRequest


/**
  <p>The Amazon Resource Name (ARN) that uniquely identifies an MSK configuration and all of its revisions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
  <p>The maximum number of results to return in the response. If there are more results, the response includes a NextToken parameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
  <p>The paginated results marker. When the result of the operation is truncated, the call returns NextToken in the response.To get the next batch, provide this token in your next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSKafkaListConfigurationRevisionsResponse : AWSModel


/**
  <p>Paginated results marker.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
  <p>List of ConfigurationRevision objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSKafkaConfigurationRevision *> * _Nullable revisions;

@end

/**
 
 */
@interface AWSKafkaListConfigurationsRequest : AWSRequest


/**
  <p>The maximum number of results to return in the response. If there are more results, the response includes a NextToken parameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
  <p>The paginated results marker. When the result of the operation is truncated, the call returns NextToken in the response.To get the next batch, provide this token in your next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSKafkaListConfigurationsResponse : AWSModel


/**
  <p>An array of MSK configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSKafkaConfiguration *> * _Nullable configurations;

/**
  <p>The paginated results marker. When the result of a ListConfigurations operation is truncated, the call returns NextToken in the response. To get another batch of configurations, provide this token in your next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSKafkaListKafkaVersionsRequest : AWSRequest


/**
  <p>The maximum number of results to return in the response. If there are more results, the response includes a NextToken parameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
  <p>The paginated results marker. When the result of the operation is truncated, the call returns NextToken in the response. To get the next batch, provide this token in your next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSKafkaListKafkaVersionsResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSKafkaKafkaVersion *> * _Nullable kafkaVersions;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSKafkaListNodesRequest : AWSRequest


/**
  <p>The Amazon Resource Name (ARN) that uniquely identifies the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
  <p>The maximum number of results to return in the response. If there are more results, the response includes a NextToken parameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
  <p>The paginated results marker. When the result of the operation is truncated, the call returns NextToken in the response.To get the next batch, provide this token in your next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSKafkaListNodesResponse : AWSModel


/**
  <p>The paginated results marker. When the result of a ListNodes operation is truncated, the call returns NextToken in the response. To get another batch of nodes, provide this token in your next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
  <p>List containing a NodeInfo object.</p>
 */
@property (nonatomic, strong) NSArray<AWSKafkaNodeInfo *> * _Nullable nodeInfoList;

@end

/**
 
 */
@interface AWSKafkaListTagsForResourceRequest : AWSRequest


/**
  <p>The Amazon Resource Name (ARN) that uniquely identifies the resource that's associated with the tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSKafkaListTagsForResourceResponse : AWSModel


/**
  <p>The key-value pair for the resource tag.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSKafkaLoggingInfo : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSKafkaBrokerLogs * _Nullable brokerLogs;

@end

/**
  <p>Information about cluster attributes that can be updated via update APIs.</p>
 */
@interface AWSKafkaMutableClusterInfo : AWSModel


/**
  <p>Specifies the size of the EBS volume and the ID of the associated broker.</p>
 */
@property (nonatomic, strong) NSArray<AWSKafkaBrokerEBSVolumeInfo *> * _Nullable brokerEBSVolumeInfo;

/**
  <p>Information about the changes in the configuration of the brokers.</p>
 */
@property (nonatomic, strong) AWSKafkaConfigurationInfo * _Nullable configurationInfo;

/**
  <p>Specifies which Apache Kafka metrics Amazon MSK gathers and sends to Amazon CloudWatch for this cluster.</p>
 */
@property (nonatomic, assign) AWSKafkaEnhancedMonitoring enhancedMonitoring;

/**
  <p>The Kafka version.</p> 
 */
@property (nonatomic, strong) NSString * _Nullable kafkaVersion;

/**
 
 */
@property (nonatomic, strong) AWSKafkaLoggingInfo * _Nullable loggingInfo;

/**
  <p>The number of broker nodes in the cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfBrokerNodes;

/**
  <p>The settings for open monitoring.</p>
 */
@property (nonatomic, strong) AWSKafkaOpenMonitoring * _Nullable openMonitoring;

@end

/**
  <p>Indicates whether you want to enable or disable the Node Exporter.</p>
 Required parameters: [EnabledInBroker]
 */
@interface AWSKafkaNodeExporter : AWSModel


/**
  <p>Indicates whether you want to enable or disable the Node Exporter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabledInBroker;

@end

/**
  <p>Indicates whether you want to enable or disable the Node Exporter.</p>
 Required parameters: [EnabledInBroker]
 */
@interface AWSKafkaNodeExporterInfo : AWSModel


/**
  <p>Indicates whether you want to enable or disable the Node Exporter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabledInBroker;

@end

/**
  <p>Indicates whether you want to enable or disable the JMX Exporter.</p>
 Required parameters: [EnabledInBroker]
 */
@interface AWSKafkaJmxExporter : AWSModel


/**
  <p>Indicates whether you want to enable or disable the JMX Exporter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabledInBroker;

@end

/**
  <p>Indicates whether you want to enable or disable the JMX Exporter.</p>
 Required parameters: [EnabledInBroker]
 */
@interface AWSKafkaJmxExporterInfo : AWSModel


/**
  <p>Indicates whether you want to enable or disable the JMX Exporter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabledInBroker;

@end

/**
  <p>JMX and Node monitoring for the MSK cluster.</p>
 Required parameters: [Prometheus]
 */
@interface AWSKafkaOpenMonitoring : AWSModel


/**
  <p>Prometheus settings.</p>
 */
@property (nonatomic, strong) AWSKafkaPrometheus * _Nullable prometheus;

@end

/**
  <p>JMX and Node monitoring for the MSK cluster.</p>
 Required parameters: [Prometheus]
 */
@interface AWSKafkaOpenMonitoringInfo : AWSModel


/**
  <p>Prometheus settings.</p>
 */
@property (nonatomic, strong) AWSKafkaPrometheusInfo * _Nullable prometheus;

@end

/**
  <p>Prometheus settings.</p>
 */
@interface AWSKafkaPrometheus : AWSModel


/**
  <p>Indicates whether you want to enable or disable the JMX Exporter.</p>
 */
@property (nonatomic, strong) AWSKafkaJmxExporter * _Nullable jmxExporter;

/**
  <p>Indicates whether you want to enable or disable the Node Exporter.</p>
 */
@property (nonatomic, strong) AWSKafkaNodeExporter * _Nullable nodeExporter;

@end

/**
  <p>Prometheus settings.</p>
 */
@interface AWSKafkaPrometheusInfo : AWSModel


/**
  <p>Indicates whether you want to enable or disable the JMX Exporter.</p>
 */
@property (nonatomic, strong) AWSKafkaJmxExporterInfo * _Nullable jmxExporter;

/**
  <p>Indicates whether you want to enable or disable the Node Exporter.</p>
 */
@property (nonatomic, strong) AWSKafkaNodeExporterInfo * _Nullable nodeExporter;

@end

/**
 
 */
@interface AWSKafkaS3 : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
  <p>The node information object.</p>
 */
@interface AWSKafkaNodeInfo : AWSModel


/**
  <p>The start time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addedToClusterTime;

/**
  <p>The broker node info.</p>
 */
@property (nonatomic, strong) AWSKafkaBrokerNodeInfo * _Nullable brokerNodeInfo;

/**
  <p>The instance type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
  <p>The Amazon Resource Name (ARN) of the node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nodeARN;

/**
  <p>The node type.</p>
 */
@property (nonatomic, assign) AWSKafkaNodeType nodeType;

/**
  <p>The ZookeeperNodeInfo.</p>
 */
@property (nonatomic, strong) AWSKafkaZookeeperNodeInfo * _Nullable zookeeperNodeInfo;

@end

/**
 
 */
@interface AWSKafkaStateInfo : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
  <p>Contains information about storage volumes attached to MSK broker nodes.</p>
 */
@interface AWSKafkaStorageInfo : AWSModel


/**
  <p>EBS volume information.</p>
 */
@property (nonatomic, strong) AWSKafkaEBSStorageInfo * _Nullable ebsStorageInfo;

@end

/**
 
 */
@interface AWSKafkaTagResourceRequest : AWSRequest


/**
  <p>The Amazon Resource Name (ARN) that uniquely identifies the resource that's associated with the tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
  <p>The key-value pair for the resource tag.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
  <p>Details for client authentication using TLS.</p>
 */
@interface AWSKafkaTls : AWSModel


/**
  <p>List of ACM Certificate Authority ARNs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable certificateAuthorityArnList;

@end

/**
 
 */
@interface AWSKafkaUntagResourceRequest : AWSRequest


/**
  <p>The Amazon Resource Name (ARN) that uniquely identifies the resource that's associated with the tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
  <p>Tag keys must be unique for a given cluster. In addition, the following restrictions apply:</p><ul><li><p>Each tag key must be unique. If you add a tag with a key that's already in use, your new tag overwrites the existing key-value pair. </p></li><li><p>You can't start a tag key with aws: because this prefix is reserved for use byAWS.AWS creates tags that begin with this prefix on your behalf, but you can't edit or delete them.</p></li><li><p>Tag keys must be between 1 and 128 Unicode characters in length.</p></li><li><p>Tag keys must consist of the following characters: Unicode letters, digits, white space, and the following special characters: _ . / = + -@.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSKafkaUpdateBrokerCountRequest : AWSRequest


/**
  <p>The Amazon Resource Name (ARN) that uniquely identifies the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
  <p>The version of cluster to update from. A successful operation will then generate a new version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentVersion;

/**
  <p>The number of broker nodes that you want the cluster to have after this operation completes successfully.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetNumberOfBrokerNodes;

@end

/**
 
 */
@interface AWSKafkaUpdateBrokerCountResponse : AWSModel


/**
  <p>The Amazon Resource Name (ARN) of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
  <p>The Amazon Resource Name (ARN) of the cluster operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterOperationArn;

@end

/**
 
 */
@interface AWSKafkaUpdateBrokerStorageRequest : AWSRequest


/**
  <p>The Amazon Resource Name (ARN) that uniquely identifies the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
  <p>The version of cluster to update from. A successful operation will then generate a new version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentVersion;

/**
  <p>Describes the target volume size and the ID of the broker to apply the update to.</p>
 */
@property (nonatomic, strong) NSArray<AWSKafkaBrokerEBSVolumeInfo *> * _Nullable targetBrokerEBSVolumeInfo;

@end

/**
 
 */
@interface AWSKafkaUpdateBrokerStorageResponse : AWSModel


/**
  <p>The Amazon Resource Name (ARN) of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
  <p>The Amazon Resource Name (ARN) of the cluster operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterOperationArn;

@end

/**
 
 */
@interface AWSKafkaUpdateClusterConfigurationRequest : AWSRequest


/**
  <p>The Amazon Resource Name (ARN) that uniquely identifies the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
  <p>Represents the configuration that you want MSK to use for the brokers in a cluster.</p>
 */
@property (nonatomic, strong) AWSKafkaConfigurationInfo * _Nullable configurationInfo;

/**
  <p>The version of the cluster that needs to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentVersion;

@end

/**
 
 */
@interface AWSKafkaUpdateClusterConfigurationResponse : AWSModel


/**
  <p>The Amazon Resource Name (ARN) of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
  <p>The Amazon Resource Name (ARN) of the cluster operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterOperationArn;

@end

/**
 
 */
@interface AWSKafkaUpdateClusterKafkaVersionRequest : AWSRequest


/**
  <p>The Amazon Resource Name (ARN) of the cluster to be updated.</p> 
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
  <p>The custom configuration that should be applied on the new version of cluster.</p> 
 */
@property (nonatomic, strong) AWSKafkaConfigurationInfo * _Nullable configurationInfo;

/**
  <p>Current cluster version.</p> 
 */
@property (nonatomic, strong) NSString * _Nullable currentVersion;

/**
  <p>Target Kafka version.</p> 
 */
@property (nonatomic, strong) NSString * _Nullable targetKafkaVersion;

@end

/**
 
 */
@interface AWSKafkaUpdateClusterKafkaVersionResponse : AWSModel


/**
  <p>The Amazon Resource Name (ARN) of the cluster.</p> 
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
  <p>The Amazon Resource Name (ARN) of the cluster operation.</p> 
 */
@property (nonatomic, strong) NSString * _Nullable clusterOperationArn;

@end

/**
 Request body for UpdateMonitoring.
 Required parameters: [ClusterArn, CurrentVersion]
 */
@interface AWSKafkaUpdateMonitoringRequest : AWSRequest


/**
  <p>The Amazon Resource Name (ARN) that uniquely identifies the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
  <p>The version of the MSK cluster to update. Cluster versions aren't simple numbers. You can describe an MSK cluster to find its version. When this update operation is successful, it generates a new cluster version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentVersion;

/**
  <p>Specifies which Apache Kafka metrics Amazon MSK gathers and sends to Amazon CloudWatch for this cluster.</p>
 */
@property (nonatomic, assign) AWSKafkaEnhancedMonitoring enhancedMonitoring;

/**
 
 */
@property (nonatomic, strong) AWSKafkaLoggingInfo * _Nullable loggingInfo;

/**
  <p>The settings for open monitoring.</p>
 */
@property (nonatomic, strong) AWSKafkaOpenMonitoringInfo * _Nullable openMonitoring;

@end

/**
 
 */
@interface AWSKafkaUpdateMonitoringResponse : AWSModel


/**
  <p>The Amazon Resource Name (ARN) of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
  <p>The Amazon Resource Name (ARN) of the cluster operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterOperationArn;

@end

/**
  <p>Zookeeper node information.</p>
 */
@interface AWSKafkaZookeeperNodeInfo : AWSModel


/**
  <p>The attached elastic network interface of the broker.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachedENIId;

/**
  <p>The virtual private cloud (VPC) IP address of the client.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientVpcIpAddress;

/**
  <p>Endpoints for accessing the ZooKeeper.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable endpoints;

/**
  <p>The role-specific ID for Zookeeper.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable zookeeperId;

/**
  <p>The version of Zookeeper.</p>
 */
@property (nonatomic, strong) NSString * _Nullable zookeeperVersion;

@end

NS_ASSUME_NONNULL_END
