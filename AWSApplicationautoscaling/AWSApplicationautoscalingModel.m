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

#import "AWSApplicationautoscalingModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSApplicationautoscalingErrorDomain = @"com.amazonaws.AWSApplicationautoscalingErrorDomain";

@implementation AWSApplicationautoscalingAlarm

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmARN" : @"AlarmARN",
             @"alarmName" : @"AlarmName",
             };
}

@end

@implementation AWSApplicationautoscalingCustomizedMetricSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensions" : @"Dimensions",
             @"metricName" : @"MetricName",
             @"namespace" : @"Namespace",
             @"statistic" : @"Statistic",
             @"unit" : @"Unit",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSApplicationautoscalingMetricDimension class]];
}

+ (NSValueTransformer *)statisticJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Average"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricStatisticAverage);
        }
        if ([value caseInsensitiveCompare:@"Minimum"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricStatisticMinimum);
        }
        if ([value caseInsensitiveCompare:@"Maximum"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricStatisticMaximum);
        }
        if ([value caseInsensitiveCompare:@"SampleCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricStatisticSampleCount);
        }
        if ([value caseInsensitiveCompare:@"Sum"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricStatisticSum);
        }
        return @(AWSApplicationautoscalingMetricStatisticUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingMetricStatisticAverage:
                return @"Average";
            case AWSApplicationautoscalingMetricStatisticMinimum:
                return @"Minimum";
            case AWSApplicationautoscalingMetricStatisticMaximum:
                return @"Maximum";
            case AWSApplicationautoscalingMetricStatisticSampleCount:
                return @"SampleCount";
            case AWSApplicationautoscalingMetricStatisticSum:
                return @"Sum";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSApplicationautoscalingDeleteScalingPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"PolicyName",
             @"resourceId" : @"ResourceId",
             @"scalableDimension" : @"ScalableDimension",
             @"serviceNamespace" : @"ServiceNamespace",
             };
}

+ (NSValueTransformer *)scalableDimensionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs:service:DesiredCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSApplicationautoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCassandra);
        }
        return @(AWSApplicationautoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSApplicationautoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSApplicationautoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSApplicationautoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSApplicationautoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSApplicationautoscalingServiceNamespaceRds:
                return @"rds";
            case AWSApplicationautoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSApplicationautoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSApplicationautoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSApplicationautoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSApplicationautoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSApplicationautoscalingDeleteScalingPolicyResponse

@end

@implementation AWSApplicationautoscalingDeleteScheduledActionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"scalableDimension" : @"ScalableDimension",
             @"scheduledActionName" : @"ScheduledActionName",
             @"serviceNamespace" : @"ServiceNamespace",
             };
}

+ (NSValueTransformer *)scalableDimensionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs:service:DesiredCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSApplicationautoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCassandra);
        }
        return @(AWSApplicationautoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSApplicationautoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSApplicationautoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSApplicationautoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSApplicationautoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSApplicationautoscalingServiceNamespaceRds:
                return @"rds";
            case AWSApplicationautoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSApplicationautoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSApplicationautoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSApplicationautoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSApplicationautoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSApplicationautoscalingDeleteScheduledActionResponse

@end

@implementation AWSApplicationautoscalingDeregisterScalableTargetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"scalableDimension" : @"ScalableDimension",
             @"serviceNamespace" : @"ServiceNamespace",
             };
}

+ (NSValueTransformer *)scalableDimensionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs:service:DesiredCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSApplicationautoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCassandra);
        }
        return @(AWSApplicationautoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSApplicationautoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSApplicationautoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSApplicationautoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSApplicationautoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSApplicationautoscalingServiceNamespaceRds:
                return @"rds";
            case AWSApplicationautoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSApplicationautoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSApplicationautoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSApplicationautoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSApplicationautoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSApplicationautoscalingDeregisterScalableTargetResponse

@end

@implementation AWSApplicationautoscalingDescribeScalableTargetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resourceIds" : @"ResourceIds",
             @"scalableDimension" : @"ScalableDimension",
             @"serviceNamespace" : @"ServiceNamespace",
             };
}

+ (NSValueTransformer *)scalableDimensionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs:service:DesiredCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSApplicationautoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCassandra);
        }
        return @(AWSApplicationautoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSApplicationautoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSApplicationautoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSApplicationautoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSApplicationautoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSApplicationautoscalingServiceNamespaceRds:
                return @"rds";
            case AWSApplicationautoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSApplicationautoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSApplicationautoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSApplicationautoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSApplicationautoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSApplicationautoscalingDescribeScalableTargetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"scalableTargets" : @"ScalableTargets",
             };
}

+ (NSValueTransformer *)scalableTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSApplicationautoscalingScalableTarget class]];
}

@end

@implementation AWSApplicationautoscalingDescribeScalingActivitiesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resourceId" : @"ResourceId",
             @"scalableDimension" : @"ScalableDimension",
             @"serviceNamespace" : @"ServiceNamespace",
             };
}

+ (NSValueTransformer *)scalableDimensionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs:service:DesiredCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSApplicationautoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCassandra);
        }
        return @(AWSApplicationautoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSApplicationautoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSApplicationautoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSApplicationautoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSApplicationautoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSApplicationautoscalingServiceNamespaceRds:
                return @"rds";
            case AWSApplicationautoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSApplicationautoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSApplicationautoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSApplicationautoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSApplicationautoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSApplicationautoscalingDescribeScalingActivitiesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"scalingActivities" : @"ScalingActivities",
             };
}

+ (NSValueTransformer *)scalingActivitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSApplicationautoscalingScalingActivity class]];
}

@end

@implementation AWSApplicationautoscalingDescribeScalingPoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"policyNames" : @"PolicyNames",
             @"resourceId" : @"ResourceId",
             @"scalableDimension" : @"ScalableDimension",
             @"serviceNamespace" : @"ServiceNamespace",
             };
}

+ (NSValueTransformer *)scalableDimensionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs:service:DesiredCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSApplicationautoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCassandra);
        }
        return @(AWSApplicationautoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSApplicationautoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSApplicationautoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSApplicationautoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSApplicationautoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSApplicationautoscalingServiceNamespaceRds:
                return @"rds";
            case AWSApplicationautoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSApplicationautoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSApplicationautoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSApplicationautoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSApplicationautoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSApplicationautoscalingDescribeScalingPoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"scalingPolicies" : @"ScalingPolicies",
             };
}

+ (NSValueTransformer *)scalingPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSApplicationautoscalingScalingPolicy class]];
}

@end

@implementation AWSApplicationautoscalingDescribeScheduledActionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resourceId" : @"ResourceId",
             @"scalableDimension" : @"ScalableDimension",
             @"scheduledActionNames" : @"ScheduledActionNames",
             @"serviceNamespace" : @"ServiceNamespace",
             };
}

+ (NSValueTransformer *)scalableDimensionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs:service:DesiredCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSApplicationautoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCassandra);
        }
        return @(AWSApplicationautoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSApplicationautoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSApplicationautoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSApplicationautoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSApplicationautoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSApplicationautoscalingServiceNamespaceRds:
                return @"rds";
            case AWSApplicationautoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSApplicationautoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSApplicationautoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSApplicationautoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSApplicationautoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSApplicationautoscalingDescribeScheduledActionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"scheduledActions" : @"ScheduledActions",
             };
}

+ (NSValueTransformer *)scheduledActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSApplicationautoscalingScheduledAction class]];
}

@end

@implementation AWSApplicationautoscalingMetricDimension

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSApplicationautoscalingPredefinedMetricSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"predefinedMetricType" : @"PredefinedMetricType",
             @"resourceLabel" : @"ResourceLabel",
             };
}

+ (NSValueTransformer *)predefinedMetricTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DynamoDBReadCapacityUtilization"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricTypeDynamoDBReadCapacityUtilization);
        }
        if ([value caseInsensitiveCompare:@"DynamoDBWriteCapacityUtilization"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricTypeDynamoDBWriteCapacityUtilization);
        }
        if ([value caseInsensitiveCompare:@"ALBRequestCountPerTarget"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricTypeALBRequestCountPerTarget);
        }
        if ([value caseInsensitiveCompare:@"RDSReaderAverageCPUUtilization"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricTypeRDSReaderAverageCPUUtilization);
        }
        if ([value caseInsensitiveCompare:@"RDSReaderAverageDatabaseConnections"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricTypeRDSReaderAverageDatabaseConnections);
        }
        if ([value caseInsensitiveCompare:@"EC2SpotFleetRequestAverageCPUUtilization"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricTypeEC2SpotFleetRequestAverageCPUUtilization);
        }
        if ([value caseInsensitiveCompare:@"EC2SpotFleetRequestAverageNetworkIn"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricTypeEC2SpotFleetRequestAverageNetworkIn);
        }
        if ([value caseInsensitiveCompare:@"EC2SpotFleetRequestAverageNetworkOut"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricTypeEC2SpotFleetRequestAverageNetworkOut);
        }
        if ([value caseInsensitiveCompare:@"SageMakerVariantInvocationsPerInstance"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricTypeSageMakerVariantInvocationsPerInstance);
        }
        if ([value caseInsensitiveCompare:@"ECSServiceAverageCPUUtilization"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricTypeECSServiceAverageCPUUtilization);
        }
        if ([value caseInsensitiveCompare:@"ECSServiceAverageMemoryUtilization"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricTypeECSServiceAverageMemoryUtilization);
        }
        if ([value caseInsensitiveCompare:@"AppStreamAverageCapacityUtilization"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricTypeAppStreamAverageCapacityUtilization);
        }
        if ([value caseInsensitiveCompare:@"ComprehendInferenceUtilization"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricTypeComprehendInferenceUtilization);
        }
        if ([value caseInsensitiveCompare:@"LambdaProvisionedConcurrencyUtilization"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricTypeLambdaProvisionedConcurrencyUtilization);
        }
        if ([value caseInsensitiveCompare:@"CassandraReadCapacityUtilization"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricTypeCassandraReadCapacityUtilization);
        }
        if ([value caseInsensitiveCompare:@"CassandraWriteCapacityUtilization"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricTypeCassandraWriteCapacityUtilization);
        }
        return @(AWSApplicationautoscalingMetricTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingMetricTypeDynamoDBReadCapacityUtilization:
                return @"DynamoDBReadCapacityUtilization";
            case AWSApplicationautoscalingMetricTypeDynamoDBWriteCapacityUtilization:
                return @"DynamoDBWriteCapacityUtilization";
            case AWSApplicationautoscalingMetricTypeALBRequestCountPerTarget:
                return @"ALBRequestCountPerTarget";
            case AWSApplicationautoscalingMetricTypeRDSReaderAverageCPUUtilization:
                return @"RDSReaderAverageCPUUtilization";
            case AWSApplicationautoscalingMetricTypeRDSReaderAverageDatabaseConnections:
                return @"RDSReaderAverageDatabaseConnections";
            case AWSApplicationautoscalingMetricTypeEC2SpotFleetRequestAverageCPUUtilization:
                return @"EC2SpotFleetRequestAverageCPUUtilization";
            case AWSApplicationautoscalingMetricTypeEC2SpotFleetRequestAverageNetworkIn:
                return @"EC2SpotFleetRequestAverageNetworkIn";
            case AWSApplicationautoscalingMetricTypeEC2SpotFleetRequestAverageNetworkOut:
                return @"EC2SpotFleetRequestAverageNetworkOut";
            case AWSApplicationautoscalingMetricTypeSageMakerVariantInvocationsPerInstance:
                return @"SageMakerVariantInvocationsPerInstance";
            case AWSApplicationautoscalingMetricTypeECSServiceAverageCPUUtilization:
                return @"ECSServiceAverageCPUUtilization";
            case AWSApplicationautoscalingMetricTypeECSServiceAverageMemoryUtilization:
                return @"ECSServiceAverageMemoryUtilization";
            case AWSApplicationautoscalingMetricTypeAppStreamAverageCapacityUtilization:
                return @"AppStreamAverageCapacityUtilization";
            case AWSApplicationautoscalingMetricTypeComprehendInferenceUtilization:
                return @"ComprehendInferenceUtilization";
            case AWSApplicationautoscalingMetricTypeLambdaProvisionedConcurrencyUtilization:
                return @"LambdaProvisionedConcurrencyUtilization";
            case AWSApplicationautoscalingMetricTypeCassandraReadCapacityUtilization:
                return @"CassandraReadCapacityUtilization";
            case AWSApplicationautoscalingMetricTypeCassandraWriteCapacityUtilization:
                return @"CassandraWriteCapacityUtilization";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSApplicationautoscalingPutScalingPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"PolicyName",
             @"policyType" : @"PolicyType",
             @"resourceId" : @"ResourceId",
             @"scalableDimension" : @"ScalableDimension",
             @"serviceNamespace" : @"ServiceNamespace",
             @"stepScalingPolicyConfiguration" : @"StepScalingPolicyConfiguration",
             @"targetTrackingScalingPolicyConfiguration" : @"TargetTrackingScalingPolicyConfiguration",
             };
}

+ (NSValueTransformer *)policyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"StepScaling"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingPolicyTypeStepScaling);
        }
        if ([value caseInsensitiveCompare:@"TargetTrackingScaling"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingPolicyTypeTargetTrackingScaling);
        }
        return @(AWSApplicationautoscalingPolicyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingPolicyTypeStepScaling:
                return @"StepScaling";
            case AWSApplicationautoscalingPolicyTypeTargetTrackingScaling:
                return @"TargetTrackingScaling";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scalableDimensionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs:service:DesiredCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSApplicationautoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCassandra);
        }
        return @(AWSApplicationautoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSApplicationautoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSApplicationautoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSApplicationautoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSApplicationautoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSApplicationautoscalingServiceNamespaceRds:
                return @"rds";
            case AWSApplicationautoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSApplicationautoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSApplicationautoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSApplicationautoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSApplicationautoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stepScalingPolicyConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSApplicationautoscalingStepScalingPolicyConfiguration class]];
}

+ (NSValueTransformer *)targetTrackingScalingPolicyConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSApplicationautoscalingTargetTrackingScalingPolicyConfiguration class]];
}

@end

@implementation AWSApplicationautoscalingPutScalingPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarms" : @"Alarms",
             @"policyARN" : @"PolicyARN",
             };
}

+ (NSValueTransformer *)alarmsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSApplicationautoscalingAlarm class]];
}

@end

@implementation AWSApplicationautoscalingPutScheduledActionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"resourceId" : @"ResourceId",
             @"scalableDimension" : @"ScalableDimension",
             @"scalableTargetAction" : @"ScalableTargetAction",
             @"schedule" : @"Schedule",
             @"scheduledActionName" : @"ScheduledActionName",
             @"serviceNamespace" : @"ServiceNamespace",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)scalableDimensionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs:service:DesiredCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSApplicationautoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scalableTargetActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSApplicationautoscalingScalableTargetAction class]];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCassandra);
        }
        return @(AWSApplicationautoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSApplicationautoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSApplicationautoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSApplicationautoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSApplicationautoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSApplicationautoscalingServiceNamespaceRds:
                return @"rds";
            case AWSApplicationautoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSApplicationautoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSApplicationautoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSApplicationautoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSApplicationautoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSApplicationautoscalingPutScheduledActionResponse

@end

@implementation AWSApplicationautoscalingRegisterScalableTargetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxCapacity" : @"MaxCapacity",
             @"minCapacity" : @"MinCapacity",
             @"resourceId" : @"ResourceId",
             @"roleARN" : @"RoleARN",
             @"scalableDimension" : @"ScalableDimension",
             @"serviceNamespace" : @"ServiceNamespace",
             @"suspendedState" : @"SuspendedState",
             };
}

+ (NSValueTransformer *)scalableDimensionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs:service:DesiredCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSApplicationautoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCassandra);
        }
        return @(AWSApplicationautoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSApplicationautoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSApplicationautoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSApplicationautoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSApplicationautoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSApplicationautoscalingServiceNamespaceRds:
                return @"rds";
            case AWSApplicationautoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSApplicationautoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSApplicationautoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSApplicationautoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSApplicationautoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)suspendedStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSApplicationautoscalingSuspendedState class]];
}

@end

@implementation AWSApplicationautoscalingRegisterScalableTargetResponse

@end

@implementation AWSApplicationautoscalingScalableTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"maxCapacity" : @"MaxCapacity",
             @"minCapacity" : @"MinCapacity",
             @"resourceId" : @"ResourceId",
             @"roleARN" : @"RoleARN",
             @"scalableDimension" : @"ScalableDimension",
             @"serviceNamespace" : @"ServiceNamespace",
             @"suspendedState" : @"SuspendedState",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)scalableDimensionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs:service:DesiredCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSApplicationautoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCassandra);
        }
        return @(AWSApplicationautoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSApplicationautoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSApplicationautoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSApplicationautoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSApplicationautoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSApplicationautoscalingServiceNamespaceRds:
                return @"rds";
            case AWSApplicationautoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSApplicationautoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSApplicationautoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSApplicationautoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSApplicationautoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)suspendedStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSApplicationautoscalingSuspendedState class]];
}

@end

@implementation AWSApplicationautoscalingScalableTargetAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxCapacity" : @"MaxCapacity",
             @"minCapacity" : @"MinCapacity",
             };
}

@end

@implementation AWSApplicationautoscalingScalingActivity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activityId" : @"ActivityId",
             @"cause" : @"Cause",
             @"detail" : @"Description",
             @"details" : @"Details",
             @"endTime" : @"EndTime",
             @"resourceId" : @"ResourceId",
             @"scalableDimension" : @"ScalableDimension",
             @"serviceNamespace" : @"ServiceNamespace",
             @"startTime" : @"StartTime",
             @"statusCode" : @"StatusCode",
             @"statusMessage" : @"StatusMessage",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)scalableDimensionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs:service:DesiredCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSApplicationautoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCassandra);
        }
        return @(AWSApplicationautoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSApplicationautoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSApplicationautoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSApplicationautoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSApplicationautoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSApplicationautoscalingServiceNamespaceRds:
                return @"rds";
            case AWSApplicationautoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSApplicationautoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSApplicationautoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSApplicationautoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSApplicationautoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalingActivityStatusCodePending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalingActivityStatusCodeInProgress);
        }
        if ([value caseInsensitiveCompare:@"Successful"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalingActivityStatusCodeSuccessful);
        }
        if ([value caseInsensitiveCompare:@"Overridden"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalingActivityStatusCodeOverridden);
        }
        if ([value caseInsensitiveCompare:@"Unfulfilled"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalingActivityStatusCodeUnfulfilled);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalingActivityStatusCodeFailed);
        }
        return @(AWSApplicationautoscalingScalingActivityStatusCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingScalingActivityStatusCodePending:
                return @"Pending";
            case AWSApplicationautoscalingScalingActivityStatusCodeInProgress:
                return @"InProgress";
            case AWSApplicationautoscalingScalingActivityStatusCodeSuccessful:
                return @"Successful";
            case AWSApplicationautoscalingScalingActivityStatusCodeOverridden:
                return @"Overridden";
            case AWSApplicationautoscalingScalingActivityStatusCodeUnfulfilled:
                return @"Unfulfilled";
            case AWSApplicationautoscalingScalingActivityStatusCodeFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSApplicationautoscalingScalingPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarms" : @"Alarms",
             @"creationTime" : @"CreationTime",
             @"policyARN" : @"PolicyARN",
             @"policyName" : @"PolicyName",
             @"policyType" : @"PolicyType",
             @"resourceId" : @"ResourceId",
             @"scalableDimension" : @"ScalableDimension",
             @"serviceNamespace" : @"ServiceNamespace",
             @"stepScalingPolicyConfiguration" : @"StepScalingPolicyConfiguration",
             @"targetTrackingScalingPolicyConfiguration" : @"TargetTrackingScalingPolicyConfiguration",
             };
}

+ (NSValueTransformer *)alarmsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSApplicationautoscalingAlarm class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)policyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"StepScaling"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingPolicyTypeStepScaling);
        }
        if ([value caseInsensitiveCompare:@"TargetTrackingScaling"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingPolicyTypeTargetTrackingScaling);
        }
        return @(AWSApplicationautoscalingPolicyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingPolicyTypeStepScaling:
                return @"StepScaling";
            case AWSApplicationautoscalingPolicyTypeTargetTrackingScaling:
                return @"TargetTrackingScaling";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scalableDimensionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs:service:DesiredCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSApplicationautoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCassandra);
        }
        return @(AWSApplicationautoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSApplicationautoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSApplicationautoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSApplicationautoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSApplicationautoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSApplicationautoscalingServiceNamespaceRds:
                return @"rds";
            case AWSApplicationautoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSApplicationautoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSApplicationautoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSApplicationautoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSApplicationautoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stepScalingPolicyConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSApplicationautoscalingStepScalingPolicyConfiguration class]];
}

+ (NSValueTransformer *)targetTrackingScalingPolicyConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSApplicationautoscalingTargetTrackingScalingPolicyConfiguration class]];
}

@end

@implementation AWSApplicationautoscalingScheduledAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"endTime" : @"EndTime",
             @"resourceId" : @"ResourceId",
             @"scalableDimension" : @"ScalableDimension",
             @"scalableTargetAction" : @"ScalableTargetAction",
             @"schedule" : @"Schedule",
             @"scheduledActionARN" : @"ScheduledActionARN",
             @"scheduledActionName" : @"ScheduledActionName",
             @"serviceNamespace" : @"ServiceNamespace",
             @"startTime" : @"StartTime",
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

+ (NSValueTransformer *)scalableDimensionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs:service:DesiredCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSApplicationautoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSApplicationautoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSApplicationautoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSApplicationautoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSApplicationautoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSApplicationautoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSApplicationautoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSApplicationautoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSApplicationautoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSApplicationautoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scalableTargetActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSApplicationautoscalingScalableTargetAction class]];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingServiceNamespaceCassandra);
        }
        return @(AWSApplicationautoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSApplicationautoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSApplicationautoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSApplicationautoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSApplicationautoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSApplicationautoscalingServiceNamespaceRds:
                return @"rds";
            case AWSApplicationautoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSApplicationautoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSApplicationautoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSApplicationautoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSApplicationautoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSApplicationautoscalingStepAdjustment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricIntervalLowerBound" : @"MetricIntervalLowerBound",
             @"metricIntervalUpperBound" : @"MetricIntervalUpperBound",
             @"scalingAdjustment" : @"ScalingAdjustment",
             };
}

@end

@implementation AWSApplicationautoscalingStepScalingPolicyConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adjustmentType" : @"AdjustmentType",
             @"cooldown" : @"Cooldown",
             @"metricAggregationType" : @"MetricAggregationType",
             @"minAdjustmentMagnitude" : @"MinAdjustmentMagnitude",
             @"stepAdjustments" : @"StepAdjustments",
             };
}

+ (NSValueTransformer *)adjustmentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ChangeInCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingAdjustmentTypeChangeInCapacity);
        }
        if ([value caseInsensitiveCompare:@"PercentChangeInCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingAdjustmentTypePercentChangeInCapacity);
        }
        if ([value caseInsensitiveCompare:@"ExactCapacity"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingAdjustmentTypeExactCapacity);
        }
        return @(AWSApplicationautoscalingAdjustmentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingAdjustmentTypeChangeInCapacity:
                return @"ChangeInCapacity";
            case AWSApplicationautoscalingAdjustmentTypePercentChangeInCapacity:
                return @"PercentChangeInCapacity";
            case AWSApplicationautoscalingAdjustmentTypeExactCapacity:
                return @"ExactCapacity";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)metricAggregationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Average"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricAggregationTypeAverage);
        }
        if ([value caseInsensitiveCompare:@"Minimum"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricAggregationTypeMinimum);
        }
        if ([value caseInsensitiveCompare:@"Maximum"] == NSOrderedSame) {
            return @(AWSApplicationautoscalingMetricAggregationTypeMaximum);
        }
        return @(AWSApplicationautoscalingMetricAggregationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSApplicationautoscalingMetricAggregationTypeAverage:
                return @"Average";
            case AWSApplicationautoscalingMetricAggregationTypeMinimum:
                return @"Minimum";
            case AWSApplicationautoscalingMetricAggregationTypeMaximum:
                return @"Maximum";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stepAdjustmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSApplicationautoscalingStepAdjustment class]];
}

@end

@implementation AWSApplicationautoscalingSuspendedState

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dynamicScalingInSuspended" : @"DynamicScalingInSuspended",
             @"dynamicScalingOutSuspended" : @"DynamicScalingOutSuspended",
             @"scheduledScalingSuspended" : @"ScheduledScalingSuspended",
             };
}

@end

@implementation AWSApplicationautoscalingTargetTrackingScalingPolicyConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customizedMetricSpecification" : @"CustomizedMetricSpecification",
             @"disableScaleIn" : @"DisableScaleIn",
             @"predefinedMetricSpecification" : @"PredefinedMetricSpecification",
             @"scaleInCooldown" : @"ScaleInCooldown",
             @"scaleOutCooldown" : @"ScaleOutCooldown",
             @"targetValue" : @"TargetValue",
             };
}

+ (NSValueTransformer *)customizedMetricSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSApplicationautoscalingCustomizedMetricSpecification class]];
}

+ (NSValueTransformer *)predefinedMetricSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSApplicationautoscalingPredefinedMetricSpecification class]];
}

@end
