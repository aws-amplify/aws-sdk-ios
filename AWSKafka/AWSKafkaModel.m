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

#import "AWSKafkaModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSKafkaErrorDomain = @"com.amazonaws.AWSKafkaErrorDomain";

@implementation AWSKafkaBrokerEBSVolumeInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kafkaBrokerNodeId" : @"KafkaBrokerNodeId",
             @"volumeSizeGB" : @"VolumeSizeGB",
             };
}

@end

@implementation AWSKafkaBrokerLogs

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLogs" : @"CloudWatchLogs",
             @"firehose" : @"Firehose",
             @"s3" : @"S3",
             };
}

+ (NSValueTransformer *)cloudWatchLogsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaCloudWatchLogs class]];
}

+ (NSValueTransformer *)firehoseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaFirehose class]];
}

+ (NSValueTransformer *)s3JSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaS3 class]];
}

@end

@implementation AWSKafkaBrokerNodeGroupInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"brokerAZDistribution" : @"BrokerAZDistribution",
             @"clientSubnets" : @"ClientSubnets",
             @"instanceType" : @"InstanceType",
             @"securityGroups" : @"SecurityGroups",
             @"storageInfo" : @"StorageInfo",
             };
}

+ (NSValueTransformer *)brokerAZDistributionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSKafkaBrokerAZDistributionDefault);
        }
        return @(AWSKafkaBrokerAZDistributionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKafkaBrokerAZDistributionDefault:
                return @"DEFAULT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)storageInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaStorageInfo class]];
}

@end

@implementation AWSKafkaBrokerNodeInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachedENIId" : @"AttachedENIId",
             @"brokerId" : @"BrokerId",
             @"clientSubnet" : @"ClientSubnet",
             @"clientVpcIpAddress" : @"ClientVpcIpAddress",
             @"currentBrokerSoftwareInfo" : @"CurrentBrokerSoftwareInfo",
             @"endpoints" : @"Endpoints",
             };
}

+ (NSValueTransformer *)currentBrokerSoftwareInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaBrokerSoftwareInfo class]];
}

@end

@implementation AWSKafkaBrokerSoftwareInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationArn" : @"ConfigurationArn",
             @"configurationRevision" : @"ConfigurationRevision",
             @"kafkaVersion" : @"KafkaVersion",
             };
}

@end

@implementation AWSKafkaClientAuthentication

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tls" : @"Tls",
             };
}

+ (NSValueTransformer *)tlsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaTls class]];
}

@end

@implementation AWSKafkaCloudWatchLogs

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"logGroup" : @"LogGroup",
             };
}

@end

@implementation AWSKafkaClusterInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeOperationArn" : @"ActiveOperationArn",
             @"brokerNodeGroupInfo" : @"BrokerNodeGroupInfo",
             @"clientAuthentication" : @"ClientAuthentication",
             @"clusterArn" : @"ClusterArn",
             @"clusterName" : @"ClusterName",
             @"creationTime" : @"CreationTime",
             @"currentBrokerSoftwareInfo" : @"CurrentBrokerSoftwareInfo",
             @"currentVersion" : @"CurrentVersion",
             @"encryptionInfo" : @"EncryptionInfo",
             @"enhancedMonitoring" : @"EnhancedMonitoring",
             @"loggingInfo" : @"LoggingInfo",
             @"numberOfBrokerNodes" : @"NumberOfBrokerNodes",
             @"openMonitoring" : @"OpenMonitoring",
             @"state" : @"State",
             @"stateInfo" : @"StateInfo",
             @"tags" : @"Tags",
             @"zookeeperConnectString" : @"ZookeeperConnectString",
             };
}

+ (NSValueTransformer *)brokerNodeGroupInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaBrokerNodeGroupInfo class]];
}

+ (NSValueTransformer *)clientAuthenticationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaClientAuthentication class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)currentBrokerSoftwareInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaBrokerSoftwareInfo class]];
}

+ (NSValueTransformer *)encryptionInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaEncryptionInfo class]];
}

+ (NSValueTransformer *)enhancedMonitoringJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSKafkaEnhancedMonitoringDefault);
        }
        if ([value caseInsensitiveCompare:@"PER_BROKER"] == NSOrderedSame) {
            return @(AWSKafkaEnhancedMonitoringPerBroker);
        }
        if ([value caseInsensitiveCompare:@"PER_TOPIC_PER_BROKER"] == NSOrderedSame) {
            return @(AWSKafkaEnhancedMonitoringPerTopicPerBroker);
        }
        return @(AWSKafkaEnhancedMonitoringUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKafkaEnhancedMonitoringDefault:
                return @"DEFAULT";
            case AWSKafkaEnhancedMonitoringPerBroker:
                return @"PER_BROKER";
            case AWSKafkaEnhancedMonitoringPerTopicPerBroker:
                return @"PER_TOPIC_PER_BROKER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)loggingInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaLoggingInfo class]];
}

+ (NSValueTransformer *)openMonitoringJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaOpenMonitoring class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSKafkaClusterStateActive);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSKafkaClusterStateCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSKafkaClusterStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSKafkaClusterStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSKafkaClusterStateFailed);
        }
        return @(AWSKafkaClusterStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKafkaClusterStateActive:
                return @"ACTIVE";
            case AWSKafkaClusterStateCreating:
                return @"CREATING";
            case AWSKafkaClusterStateUpdating:
                return @"UPDATING";
            case AWSKafkaClusterStateDeleting:
                return @"DELETING";
            case AWSKafkaClusterStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaStateInfo class]];
}

@end

@implementation AWSKafkaClusterOperationInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestId" : @"ClientRequestId",
             @"clusterArn" : @"ClusterArn",
             @"creationTime" : @"CreationTime",
             @"endTime" : @"EndTime",
             @"errorInfo" : @"ErrorInfo",
             @"operationArn" : @"OperationArn",
             @"operationState" : @"OperationState",
             @"operationSteps" : @"OperationSteps",
             @"operationType" : @"OperationType",
             @"sourceClusterInfo" : @"SourceClusterInfo",
             @"targetClusterInfo" : @"TargetClusterInfo",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)errorInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaErrorInfo class]];
}

+ (NSValueTransformer *)operationStepsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKafkaClusterOperationStep class]];
}

+ (NSValueTransformer *)sourceClusterInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaMutableClusterInfo class]];
}

+ (NSValueTransformer *)targetClusterInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaMutableClusterInfo class]];
}

@end

@implementation AWSKafkaClusterOperationStep

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stepInfo" : @"StepInfo",
             @"stepName" : @"StepName",
             };
}

+ (NSValueTransformer *)stepInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaClusterOperationStepInfo class]];
}

@end

@implementation AWSKafkaClusterOperationStepInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stepStatus" : @"StepStatus",
             };
}

@end

@implementation AWSKafkaCompatibleKafkaVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceVersion" : @"SourceVersion",
             @"targetVersions" : @"TargetVersions",
             };
}

@end

@implementation AWSKafkaConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"creationTime" : @"CreationTime",
             @"detail" : @"Description",
             @"kafkaVersions" : @"KafkaVersions",
             @"latestRevision" : @"LatestRevision",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)latestRevisionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaConfigurationRevision class]];
}

@end

@implementation AWSKafkaConfigurationInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"revision" : @"Revision",
             };
}

@end

@implementation AWSKafkaConfigurationRevision

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"detail" : @"Description",
             @"revision" : @"Revision",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSKafkaCreateClusterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"brokerNodeGroupInfo" : @"BrokerNodeGroupInfo",
             @"clientAuthentication" : @"ClientAuthentication",
             @"clusterName" : @"ClusterName",
             @"configurationInfo" : @"ConfigurationInfo",
             @"encryptionInfo" : @"EncryptionInfo",
             @"enhancedMonitoring" : @"EnhancedMonitoring",
             @"kafkaVersion" : @"KafkaVersion",
             @"loggingInfo" : @"LoggingInfo",
             @"numberOfBrokerNodes" : @"NumberOfBrokerNodes",
             @"openMonitoring" : @"OpenMonitoring",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)brokerNodeGroupInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaBrokerNodeGroupInfo class]];
}

+ (NSValueTransformer *)clientAuthenticationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaClientAuthentication class]];
}

+ (NSValueTransformer *)configurationInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaConfigurationInfo class]];
}

+ (NSValueTransformer *)encryptionInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaEncryptionInfo class]];
}

+ (NSValueTransformer *)enhancedMonitoringJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSKafkaEnhancedMonitoringDefault);
        }
        if ([value caseInsensitiveCompare:@"PER_BROKER"] == NSOrderedSame) {
            return @(AWSKafkaEnhancedMonitoringPerBroker);
        }
        if ([value caseInsensitiveCompare:@"PER_TOPIC_PER_BROKER"] == NSOrderedSame) {
            return @(AWSKafkaEnhancedMonitoringPerTopicPerBroker);
        }
        return @(AWSKafkaEnhancedMonitoringUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKafkaEnhancedMonitoringDefault:
                return @"DEFAULT";
            case AWSKafkaEnhancedMonitoringPerBroker:
                return @"PER_BROKER";
            case AWSKafkaEnhancedMonitoringPerTopicPerBroker:
                return @"PER_TOPIC_PER_BROKER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)loggingInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaLoggingInfo class]];
}

+ (NSValueTransformer *)openMonitoringJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaOpenMonitoringInfo class]];
}

@end

@implementation AWSKafkaCreateClusterResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"clusterName" : @"ClusterName",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSKafkaClusterStateActive);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSKafkaClusterStateCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSKafkaClusterStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSKafkaClusterStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSKafkaClusterStateFailed);
        }
        return @(AWSKafkaClusterStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKafkaClusterStateActive:
                return @"ACTIVE";
            case AWSKafkaClusterStateCreating:
                return @"CREATING";
            case AWSKafkaClusterStateUpdating:
                return @"UPDATING";
            case AWSKafkaClusterStateDeleting:
                return @"DELETING";
            case AWSKafkaClusterStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKafkaCreateConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"kafkaVersions" : @"KafkaVersions",
             @"name" : @"Name",
             @"serverProperties" : @"ServerProperties",
             };
}

@end

@implementation AWSKafkaCreateConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"creationTime" : @"CreationTime",
             @"latestRevision" : @"LatestRevision",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)latestRevisionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaConfigurationRevision class]];
}

@end

@implementation AWSKafkaDeleteClusterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"currentVersion" : @"CurrentVersion",
             };
}

@end

@implementation AWSKafkaDeleteClusterResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSKafkaClusterStateActive);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSKafkaClusterStateCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSKafkaClusterStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSKafkaClusterStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSKafkaClusterStateFailed);
        }
        return @(AWSKafkaClusterStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKafkaClusterStateActive:
                return @"ACTIVE";
            case AWSKafkaClusterStateCreating:
                return @"CREATING";
            case AWSKafkaClusterStateUpdating:
                return @"UPDATING";
            case AWSKafkaClusterStateDeleting:
                return @"DELETING";
            case AWSKafkaClusterStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKafkaDescribeClusterOperationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterOperationArn" : @"ClusterOperationArn",
             };
}

@end

@implementation AWSKafkaDescribeClusterOperationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterOperationInfo" : @"ClusterOperationInfo",
             };
}

+ (NSValueTransformer *)clusterOperationInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaClusterOperationInfo class]];
}

@end

@implementation AWSKafkaDescribeClusterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             };
}

@end

@implementation AWSKafkaDescribeClusterResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterInfo" : @"ClusterInfo",
             };
}

+ (NSValueTransformer *)clusterInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaClusterInfo class]];
}

@end

@implementation AWSKafkaDescribeConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             };
}

@end

@implementation AWSKafkaDescribeConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"creationTime" : @"CreationTime",
             @"detail" : @"Description",
             @"kafkaVersions" : @"KafkaVersions",
             @"latestRevision" : @"LatestRevision",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)latestRevisionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaConfigurationRevision class]];
}

@end

@implementation AWSKafkaDescribeConfigurationRevisionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"revision" : @"Revision",
             };
}

@end

@implementation AWSKafkaDescribeConfigurationRevisionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"creationTime" : @"CreationTime",
             @"detail" : @"Description",
             @"revision" : @"Revision",
             @"serverProperties" : @"ServerProperties",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSKafkaEBSStorageInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeSize" : @"VolumeSize",
             };
}

@end

@implementation AWSKafkaEncryptionAtRest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataVolumeKMSKeyId" : @"DataVolumeKMSKeyId",
             };
}

@end

@implementation AWSKafkaEncryptionInTransit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientBroker" : @"ClientBroker",
             @"inCluster" : @"InCluster",
             };
}

+ (NSValueTransformer *)clientBrokerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TLS"] == NSOrderedSame) {
            return @(AWSKafkaClientBrokerTls);
        }
        if ([value caseInsensitiveCompare:@"TLS_PLAINTEXT"] == NSOrderedSame) {
            return @(AWSKafkaClientBrokerTlsPlaintext);
        }
        if ([value caseInsensitiveCompare:@"PLAINTEXT"] == NSOrderedSame) {
            return @(AWSKafkaClientBrokerPlaintext);
        }
        return @(AWSKafkaClientBrokerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKafkaClientBrokerTls:
                return @"TLS";
            case AWSKafkaClientBrokerTlsPlaintext:
                return @"TLS_PLAINTEXT";
            case AWSKafkaClientBrokerPlaintext:
                return @"PLAINTEXT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKafkaEncryptionInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionAtRest" : @"EncryptionAtRest",
             @"encryptionInTransit" : @"EncryptionInTransit",
             };
}

+ (NSValueTransformer *)encryptionAtRestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaEncryptionAtRest class]];
}

+ (NSValueTransformer *)encryptionInTransitJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaEncryptionInTransit class]];
}

@end

@implementation AWSKafkaError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invalidParameter" : @"InvalidParameter",
             @"message" : @"Message",
             };
}

@end

@implementation AWSKafkaErrorInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorString" : @"ErrorString",
             };
}

@end

@implementation AWSKafkaFirehose

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStream" : @"DeliveryStream",
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSKafkaGetBootstrapBrokersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             };
}

@end

@implementation AWSKafkaGetBootstrapBrokersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bootstrapBrokerString" : @"BootstrapBrokerString",
             @"bootstrapBrokerStringTls" : @"BootstrapBrokerStringTls",
             };
}

@end

@implementation AWSKafkaGetCompatibleKafkaVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             };
}

@end

@implementation AWSKafkaGetCompatibleKafkaVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compatibleKafkaVersions" : @"CompatibleKafkaVersions",
             };
}

+ (NSValueTransformer *)compatibleKafkaVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKafkaCompatibleKafkaVersion class]];
}

@end

@implementation AWSKafkaKafkaVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSKafkaKafkaVersionStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DEPRECATED"] == NSOrderedSame) {
            return @(AWSKafkaKafkaVersionStatusDeprecated);
        }
        return @(AWSKafkaKafkaVersionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKafkaKafkaVersionStatusActive:
                return @"ACTIVE";
            case AWSKafkaKafkaVersionStatusDeprecated:
                return @"DEPRECATED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKafkaListClusterOperationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSKafkaListClusterOperationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterOperationInfoList" : @"ClusterOperationInfoList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)clusterOperationInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKafkaClusterOperationInfo class]];
}

@end

@implementation AWSKafkaListClustersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterNameFilter" : @"ClusterNameFilter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSKafkaListClustersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterInfoList" : @"ClusterInfoList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)clusterInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKafkaClusterInfo class]];
}

@end

@implementation AWSKafkaListConfigurationRevisionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSKafkaListConfigurationRevisionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"revisions" : @"Revisions",
             };
}

+ (NSValueTransformer *)revisionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKafkaConfigurationRevision class]];
}

@end

@implementation AWSKafkaListConfigurationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSKafkaListConfigurationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurations" : @"Configurations",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)configurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKafkaConfiguration class]];
}

@end

@implementation AWSKafkaListKafkaVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSKafkaListKafkaVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kafkaVersions" : @"KafkaVersions",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)kafkaVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKafkaKafkaVersion class]];
}

@end

@implementation AWSKafkaListNodesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSKafkaListNodesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"nodeInfoList" : @"NodeInfoList",
             };
}

+ (NSValueTransformer *)nodeInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKafkaNodeInfo class]];
}

@end

@implementation AWSKafkaListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSKafkaListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSKafkaLoggingInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"brokerLogs" : @"BrokerLogs",
             };
}

+ (NSValueTransformer *)brokerLogsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaBrokerLogs class]];
}

@end

@implementation AWSKafkaMutableClusterInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"brokerEBSVolumeInfo" : @"BrokerEBSVolumeInfo",
             @"configurationInfo" : @"ConfigurationInfo",
             @"enhancedMonitoring" : @"EnhancedMonitoring",
             @"kafkaVersion" : @"KafkaVersion",
             @"loggingInfo" : @"LoggingInfo",
             @"numberOfBrokerNodes" : @"NumberOfBrokerNodes",
             @"openMonitoring" : @"OpenMonitoring",
             };
}

+ (NSValueTransformer *)brokerEBSVolumeInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKafkaBrokerEBSVolumeInfo class]];
}

+ (NSValueTransformer *)configurationInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaConfigurationInfo class]];
}

+ (NSValueTransformer *)enhancedMonitoringJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSKafkaEnhancedMonitoringDefault);
        }
        if ([value caseInsensitiveCompare:@"PER_BROKER"] == NSOrderedSame) {
            return @(AWSKafkaEnhancedMonitoringPerBroker);
        }
        if ([value caseInsensitiveCompare:@"PER_TOPIC_PER_BROKER"] == NSOrderedSame) {
            return @(AWSKafkaEnhancedMonitoringPerTopicPerBroker);
        }
        return @(AWSKafkaEnhancedMonitoringUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKafkaEnhancedMonitoringDefault:
                return @"DEFAULT";
            case AWSKafkaEnhancedMonitoringPerBroker:
                return @"PER_BROKER";
            case AWSKafkaEnhancedMonitoringPerTopicPerBroker:
                return @"PER_TOPIC_PER_BROKER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)loggingInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaLoggingInfo class]];
}

+ (NSValueTransformer *)openMonitoringJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaOpenMonitoring class]];
}

@end

@implementation AWSKafkaNodeExporter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabledInBroker" : @"EnabledInBroker",
             };
}

@end

@implementation AWSKafkaNodeExporterInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabledInBroker" : @"EnabledInBroker",
             };
}

@end

@implementation AWSKafkaJmxExporter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabledInBroker" : @"EnabledInBroker",
             };
}

@end

@implementation AWSKafkaJmxExporterInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabledInBroker" : @"EnabledInBroker",
             };
}

@end

@implementation AWSKafkaOpenMonitoring

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"prometheus" : @"Prometheus",
             };
}

+ (NSValueTransformer *)prometheusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaPrometheus class]];
}

@end

@implementation AWSKafkaOpenMonitoringInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"prometheus" : @"Prometheus",
             };
}

+ (NSValueTransformer *)prometheusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaPrometheusInfo class]];
}

@end

@implementation AWSKafkaPrometheus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jmxExporter" : @"JmxExporter",
             @"nodeExporter" : @"NodeExporter",
             };
}

+ (NSValueTransformer *)jmxExporterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaJmxExporter class]];
}

+ (NSValueTransformer *)nodeExporterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaNodeExporter class]];
}

@end

@implementation AWSKafkaPrometheusInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jmxExporter" : @"JmxExporter",
             @"nodeExporter" : @"NodeExporter",
             };
}

+ (NSValueTransformer *)jmxExporterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaJmxExporterInfo class]];
}

+ (NSValueTransformer *)nodeExporterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaNodeExporterInfo class]];
}

@end

@implementation AWSKafkaS3

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"enabled" : @"Enabled",
             @"prefix" : @"Prefix",
             };
}

@end

@implementation AWSKafkaNodeInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addedToClusterTime" : @"AddedToClusterTime",
             @"brokerNodeInfo" : @"BrokerNodeInfo",
             @"instanceType" : @"InstanceType",
             @"nodeARN" : @"NodeARN",
             @"nodeType" : @"NodeType",
             @"zookeeperNodeInfo" : @"ZookeeperNodeInfo",
             };
}

+ (NSValueTransformer *)brokerNodeInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaBrokerNodeInfo class]];
}

+ (NSValueTransformer *)nodeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BROKER"] == NSOrderedSame) {
            return @(AWSKafkaNodeTypeBroker);
        }
        return @(AWSKafkaNodeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKafkaNodeTypeBroker:
                return @"BROKER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)zookeeperNodeInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaZookeeperNodeInfo class]];
}

@end

@implementation AWSKafkaStateInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

@end

@implementation AWSKafkaStorageInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ebsStorageInfo" : @"EbsStorageInfo",
             };
}

+ (NSValueTransformer *)ebsStorageInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaEBSStorageInfo class]];
}

@end

@implementation AWSKafkaTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSKafkaTls

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateAuthorityArnList" : @"CertificateAuthorityArnList",
             };
}

@end

@implementation AWSKafkaUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSKafkaUpdateBrokerCountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"currentVersion" : @"CurrentVersion",
             @"targetNumberOfBrokerNodes" : @"TargetNumberOfBrokerNodes",
             };
}

@end

@implementation AWSKafkaUpdateBrokerCountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"clusterOperationArn" : @"ClusterOperationArn",
             };
}

@end

@implementation AWSKafkaUpdateBrokerStorageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"currentVersion" : @"CurrentVersion",
             @"targetBrokerEBSVolumeInfo" : @"TargetBrokerEBSVolumeInfo",
             };
}

+ (NSValueTransformer *)targetBrokerEBSVolumeInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKafkaBrokerEBSVolumeInfo class]];
}

@end

@implementation AWSKafkaUpdateBrokerStorageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"clusterOperationArn" : @"ClusterOperationArn",
             };
}

@end

@implementation AWSKafkaUpdateClusterConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"configurationInfo" : @"ConfigurationInfo",
             @"currentVersion" : @"CurrentVersion",
             };
}

+ (NSValueTransformer *)configurationInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaConfigurationInfo class]];
}

@end

@implementation AWSKafkaUpdateClusterConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"clusterOperationArn" : @"ClusterOperationArn",
             };
}

@end

@implementation AWSKafkaUpdateClusterKafkaVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"configurationInfo" : @"ConfigurationInfo",
             @"currentVersion" : @"CurrentVersion",
             @"targetKafkaVersion" : @"TargetKafkaVersion",
             };
}

+ (NSValueTransformer *)configurationInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaConfigurationInfo class]];
}

@end

@implementation AWSKafkaUpdateClusterKafkaVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"clusterOperationArn" : @"ClusterOperationArn",
             };
}

@end

@implementation AWSKafkaUpdateMonitoringRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"currentVersion" : @"CurrentVersion",
             @"enhancedMonitoring" : @"EnhancedMonitoring",
             @"loggingInfo" : @"LoggingInfo",
             @"openMonitoring" : @"OpenMonitoring",
             };
}

+ (NSValueTransformer *)enhancedMonitoringJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSKafkaEnhancedMonitoringDefault);
        }
        if ([value caseInsensitiveCompare:@"PER_BROKER"] == NSOrderedSame) {
            return @(AWSKafkaEnhancedMonitoringPerBroker);
        }
        if ([value caseInsensitiveCompare:@"PER_TOPIC_PER_BROKER"] == NSOrderedSame) {
            return @(AWSKafkaEnhancedMonitoringPerTopicPerBroker);
        }
        return @(AWSKafkaEnhancedMonitoringUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKafkaEnhancedMonitoringDefault:
                return @"DEFAULT";
            case AWSKafkaEnhancedMonitoringPerBroker:
                return @"PER_BROKER";
            case AWSKafkaEnhancedMonitoringPerTopicPerBroker:
                return @"PER_TOPIC_PER_BROKER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)loggingInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaLoggingInfo class]];
}

+ (NSValueTransformer *)openMonitoringJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKafkaOpenMonitoringInfo class]];
}

@end

@implementation AWSKafkaUpdateMonitoringResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"clusterOperationArn" : @"ClusterOperationArn",
             };
}

@end

@implementation AWSKafkaZookeeperNodeInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachedENIId" : @"AttachedENIId",
             @"clientVpcIpAddress" : @"ClientVpcIpAddress",
             @"endpoints" : @"Endpoints",
             @"zookeeperId" : @"ZookeeperId",
             @"zookeeperVersion" : @"ZookeeperVersion",
             };
}

@end
