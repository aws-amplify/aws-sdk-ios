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

#import "AWSapplication-autoscalingModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSapplication-autoscalingErrorDomain = @"com.amazonaws.AWSapplication-autoscalingErrorDomain";

@implementation AWSapplication-autoscalingAlarm

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmARN" : @"AlarmARN",
             @"alarmName" : @"AlarmName",
             };
}

@end

@implementation AWSapplication-autoscalingCustomizedMetricSpecification

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapplication-autoscalingMetricDimension class]];
}

+ (NSValueTransformer *)statisticJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Average"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricStatisticAverage);
        }
        if ([value caseInsensitiveCompare:@"Minimum"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricStatisticMinimum);
        }
        if ([value caseInsensitiveCompare:@"Maximum"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricStatisticMaximum);
        }
        if ([value caseInsensitiveCompare:@"SampleCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricStatisticSampleCount);
        }
        if ([value caseInsensitiveCompare:@"Sum"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricStatisticSum);
        }
        return @(AWSapplication-autoscalingMetricStatisticUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingMetricStatisticAverage:
                return @"Average";
            case AWSapplication-autoscalingMetricStatisticMinimum:
                return @"Minimum";
            case AWSapplication-autoscalingMetricStatisticMaximum:
                return @"Maximum";
            case AWSapplication-autoscalingMetricStatisticSampleCount:
                return @"SampleCount";
            case AWSapplication-autoscalingMetricStatisticSum:
                return @"Sum";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapplication-autoscalingDeleteScalingPolicyRequest

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
            return @(AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSapplication-autoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCassandra);
        }
        return @(AWSapplication-autoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSapplication-autoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSapplication-autoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSapplication-autoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSapplication-autoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSapplication-autoscalingServiceNamespaceRds:
                return @"rds";
            case AWSapplication-autoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSapplication-autoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSapplication-autoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSapplication-autoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSapplication-autoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapplication-autoscalingDeleteScalingPolicyResponse

@end

@implementation AWSapplication-autoscalingDeleteScheduledActionRequest

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
            return @(AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSapplication-autoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCassandra);
        }
        return @(AWSapplication-autoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSapplication-autoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSapplication-autoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSapplication-autoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSapplication-autoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSapplication-autoscalingServiceNamespaceRds:
                return @"rds";
            case AWSapplication-autoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSapplication-autoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSapplication-autoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSapplication-autoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSapplication-autoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapplication-autoscalingDeleteScheduledActionResponse

@end

@implementation AWSapplication-autoscalingDeregisterScalableTargetRequest

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
            return @(AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSapplication-autoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCassandra);
        }
        return @(AWSapplication-autoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSapplication-autoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSapplication-autoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSapplication-autoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSapplication-autoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSapplication-autoscalingServiceNamespaceRds:
                return @"rds";
            case AWSapplication-autoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSapplication-autoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSapplication-autoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSapplication-autoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSapplication-autoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapplication-autoscalingDeregisterScalableTargetResponse

@end

@implementation AWSapplication-autoscalingDescribeScalableTargetsRequest

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
            return @(AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSapplication-autoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCassandra);
        }
        return @(AWSapplication-autoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSapplication-autoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSapplication-autoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSapplication-autoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSapplication-autoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSapplication-autoscalingServiceNamespaceRds:
                return @"rds";
            case AWSapplication-autoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSapplication-autoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSapplication-autoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSapplication-autoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSapplication-autoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapplication-autoscalingDescribeScalableTargetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"scalableTargets" : @"ScalableTargets",
             };
}

+ (NSValueTransformer *)scalableTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapplication-autoscalingScalableTarget class]];
}

@end

@implementation AWSapplication-autoscalingDescribeScalingActivitiesRequest

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
            return @(AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSapplication-autoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCassandra);
        }
        return @(AWSapplication-autoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSapplication-autoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSapplication-autoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSapplication-autoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSapplication-autoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSapplication-autoscalingServiceNamespaceRds:
                return @"rds";
            case AWSapplication-autoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSapplication-autoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSapplication-autoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSapplication-autoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSapplication-autoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapplication-autoscalingDescribeScalingActivitiesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"scalingActivities" : @"ScalingActivities",
             };
}

+ (NSValueTransformer *)scalingActivitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapplication-autoscalingScalingActivity class]];
}

@end

@implementation AWSapplication-autoscalingDescribeScalingPoliciesRequest

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
            return @(AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSapplication-autoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCassandra);
        }
        return @(AWSapplication-autoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSapplication-autoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSapplication-autoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSapplication-autoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSapplication-autoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSapplication-autoscalingServiceNamespaceRds:
                return @"rds";
            case AWSapplication-autoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSapplication-autoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSapplication-autoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSapplication-autoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSapplication-autoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapplication-autoscalingDescribeScalingPoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"scalingPolicies" : @"ScalingPolicies",
             };
}

+ (NSValueTransformer *)scalingPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapplication-autoscalingScalingPolicy class]];
}

@end

@implementation AWSapplication-autoscalingDescribeScheduledActionsRequest

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
            return @(AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSapplication-autoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCassandra);
        }
        return @(AWSapplication-autoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSapplication-autoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSapplication-autoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSapplication-autoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSapplication-autoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSapplication-autoscalingServiceNamespaceRds:
                return @"rds";
            case AWSapplication-autoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSapplication-autoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSapplication-autoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSapplication-autoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSapplication-autoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapplication-autoscalingDescribeScheduledActionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"scheduledActions" : @"ScheduledActions",
             };
}

+ (NSValueTransformer *)scheduledActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapplication-autoscalingScheduledAction class]];
}

@end

@implementation AWSapplication-autoscalingMetricDimension

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSapplication-autoscalingPredefinedMetricSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"predefinedMetricType" : @"PredefinedMetricType",
             @"resourceLabel" : @"ResourceLabel",
             };
}

+ (NSValueTransformer *)predefinedMetricTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DynamoDBReadCapacityUtilization"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricTypeDynamoDBReadCapacityUtilization);
        }
        if ([value caseInsensitiveCompare:@"DynamoDBWriteCapacityUtilization"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricTypeDynamoDBWriteCapacityUtilization);
        }
        if ([value caseInsensitiveCompare:@"ALBRequestCountPerTarget"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricTypeALBRequestCountPerTarget);
        }
        if ([value caseInsensitiveCompare:@"RDSReaderAverageCPUUtilization"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricTypeRDSReaderAverageCPUUtilization);
        }
        if ([value caseInsensitiveCompare:@"RDSReaderAverageDatabaseConnections"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricTypeRDSReaderAverageDatabaseConnections);
        }
        if ([value caseInsensitiveCompare:@"EC2SpotFleetRequestAverageCPUUtilization"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricTypeEC2SpotFleetRequestAverageCPUUtilization);
        }
        if ([value caseInsensitiveCompare:@"EC2SpotFleetRequestAverageNetworkIn"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricTypeEC2SpotFleetRequestAverageNetworkIn);
        }
        if ([value caseInsensitiveCompare:@"EC2SpotFleetRequestAverageNetworkOut"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricTypeEC2SpotFleetRequestAverageNetworkOut);
        }
        if ([value caseInsensitiveCompare:@"SageMakerVariantInvocationsPerInstance"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricTypeSageMakerVariantInvocationsPerInstance);
        }
        if ([value caseInsensitiveCompare:@"ECSServiceAverageCPUUtilization"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricTypeECSServiceAverageCPUUtilization);
        }
        if ([value caseInsensitiveCompare:@"ECSServiceAverageMemoryUtilization"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricTypeECSServiceAverageMemoryUtilization);
        }
        if ([value caseInsensitiveCompare:@"AppStreamAverageCapacityUtilization"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricTypeAppStreamAverageCapacityUtilization);
        }
        if ([value caseInsensitiveCompare:@"ComprehendInferenceUtilization"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricTypeComprehendInferenceUtilization);
        }
        if ([value caseInsensitiveCompare:@"LambdaProvisionedConcurrencyUtilization"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricTypeLambdaProvisionedConcurrencyUtilization);
        }
        if ([value caseInsensitiveCompare:@"CassandraReadCapacityUtilization"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricTypeCassandraReadCapacityUtilization);
        }
        if ([value caseInsensitiveCompare:@"CassandraWriteCapacityUtilization"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricTypeCassandraWriteCapacityUtilization);
        }
        return @(AWSapplication-autoscalingMetricTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingMetricTypeDynamoDBReadCapacityUtilization:
                return @"DynamoDBReadCapacityUtilization";
            case AWSapplication-autoscalingMetricTypeDynamoDBWriteCapacityUtilization:
                return @"DynamoDBWriteCapacityUtilization";
            case AWSapplication-autoscalingMetricTypeALBRequestCountPerTarget:
                return @"ALBRequestCountPerTarget";
            case AWSapplication-autoscalingMetricTypeRDSReaderAverageCPUUtilization:
                return @"RDSReaderAverageCPUUtilization";
            case AWSapplication-autoscalingMetricTypeRDSReaderAverageDatabaseConnections:
                return @"RDSReaderAverageDatabaseConnections";
            case AWSapplication-autoscalingMetricTypeEC2SpotFleetRequestAverageCPUUtilization:
                return @"EC2SpotFleetRequestAverageCPUUtilization";
            case AWSapplication-autoscalingMetricTypeEC2SpotFleetRequestAverageNetworkIn:
                return @"EC2SpotFleetRequestAverageNetworkIn";
            case AWSapplication-autoscalingMetricTypeEC2SpotFleetRequestAverageNetworkOut:
                return @"EC2SpotFleetRequestAverageNetworkOut";
            case AWSapplication-autoscalingMetricTypeSageMakerVariantInvocationsPerInstance:
                return @"SageMakerVariantInvocationsPerInstance";
            case AWSapplication-autoscalingMetricTypeECSServiceAverageCPUUtilization:
                return @"ECSServiceAverageCPUUtilization";
            case AWSapplication-autoscalingMetricTypeECSServiceAverageMemoryUtilization:
                return @"ECSServiceAverageMemoryUtilization";
            case AWSapplication-autoscalingMetricTypeAppStreamAverageCapacityUtilization:
                return @"AppStreamAverageCapacityUtilization";
            case AWSapplication-autoscalingMetricTypeComprehendInferenceUtilization:
                return @"ComprehendInferenceUtilization";
            case AWSapplication-autoscalingMetricTypeLambdaProvisionedConcurrencyUtilization:
                return @"LambdaProvisionedConcurrencyUtilization";
            case AWSapplication-autoscalingMetricTypeCassandraReadCapacityUtilization:
                return @"CassandraReadCapacityUtilization";
            case AWSapplication-autoscalingMetricTypeCassandraWriteCapacityUtilization:
                return @"CassandraWriteCapacityUtilization";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapplication-autoscalingPutScalingPolicyRequest

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
            return @(AWSapplication-autoscalingPolicyTypeStepScaling);
        }
        if ([value caseInsensitiveCompare:@"TargetTrackingScaling"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingPolicyTypeTargetTrackingScaling);
        }
        return @(AWSapplication-autoscalingPolicyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingPolicyTypeStepScaling:
                return @"StepScaling";
            case AWSapplication-autoscalingPolicyTypeTargetTrackingScaling:
                return @"TargetTrackingScaling";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scalableDimensionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs:service:DesiredCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSapplication-autoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCassandra);
        }
        return @(AWSapplication-autoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSapplication-autoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSapplication-autoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSapplication-autoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSapplication-autoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSapplication-autoscalingServiceNamespaceRds:
                return @"rds";
            case AWSapplication-autoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSapplication-autoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSapplication-autoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSapplication-autoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSapplication-autoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stepScalingPolicyConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapplication-autoscalingStepScalingPolicyConfiguration class]];
}

+ (NSValueTransformer *)targetTrackingScalingPolicyConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapplication-autoscalingTargetTrackingScalingPolicyConfiguration class]];
}

@end

@implementation AWSapplication-autoscalingPutScalingPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarms" : @"Alarms",
             @"policyARN" : @"PolicyARN",
             };
}

+ (NSValueTransformer *)alarmsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapplication-autoscalingAlarm class]];
}

@end

@implementation AWSapplication-autoscalingPutScheduledActionRequest

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
            return @(AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSapplication-autoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scalableTargetActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapplication-autoscalingScalableTargetAction class]];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCassandra);
        }
        return @(AWSapplication-autoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSapplication-autoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSapplication-autoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSapplication-autoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSapplication-autoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSapplication-autoscalingServiceNamespaceRds:
                return @"rds";
            case AWSapplication-autoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSapplication-autoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSapplication-autoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSapplication-autoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSapplication-autoscalingServiceNamespaceCassandra:
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

@implementation AWSapplication-autoscalingPutScheduledActionResponse

@end

@implementation AWSapplication-autoscalingRegisterScalableTargetRequest

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
            return @(AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSapplication-autoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCassandra);
        }
        return @(AWSapplication-autoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSapplication-autoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSapplication-autoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSapplication-autoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSapplication-autoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSapplication-autoscalingServiceNamespaceRds:
                return @"rds";
            case AWSapplication-autoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSapplication-autoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSapplication-autoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSapplication-autoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSapplication-autoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)suspendedStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapplication-autoscalingSuspendedState class]];
}

@end

@implementation AWSapplication-autoscalingRegisterScalableTargetResponse

@end

@implementation AWSapplication-autoscalingScalableTarget

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
            return @(AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSapplication-autoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCassandra);
        }
        return @(AWSapplication-autoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSapplication-autoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSapplication-autoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSapplication-autoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSapplication-autoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSapplication-autoscalingServiceNamespaceRds:
                return @"rds";
            case AWSapplication-autoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSapplication-autoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSapplication-autoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSapplication-autoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSapplication-autoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)suspendedStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapplication-autoscalingSuspendedState class]];
}

@end

@implementation AWSapplication-autoscalingScalableTargetAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxCapacity" : @"MaxCapacity",
             @"minCapacity" : @"MinCapacity",
             };
}

@end

@implementation AWSapplication-autoscalingScalingActivity

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
            return @(AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSapplication-autoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCassandra);
        }
        return @(AWSapplication-autoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSapplication-autoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSapplication-autoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSapplication-autoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSapplication-autoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSapplication-autoscalingServiceNamespaceRds:
                return @"rds";
            case AWSapplication-autoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSapplication-autoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSapplication-autoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSapplication-autoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSapplication-autoscalingServiceNamespaceCassandra:
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
            return @(AWSapplication-autoscalingScalingActivityStatusCodePending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalingActivityStatusCodeInProgress);
        }
        if ([value caseInsensitiveCompare:@"Successful"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalingActivityStatusCodeSuccessful);
        }
        if ([value caseInsensitiveCompare:@"Overridden"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalingActivityStatusCodeOverridden);
        }
        if ([value caseInsensitiveCompare:@"Unfulfilled"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalingActivityStatusCodeUnfulfilled);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalingActivityStatusCodeFailed);
        }
        return @(AWSapplication-autoscalingScalingActivityStatusCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingScalingActivityStatusCodePending:
                return @"Pending";
            case AWSapplication-autoscalingScalingActivityStatusCodeInProgress:
                return @"InProgress";
            case AWSapplication-autoscalingScalingActivityStatusCodeSuccessful:
                return @"Successful";
            case AWSapplication-autoscalingScalingActivityStatusCodeOverridden:
                return @"Overridden";
            case AWSapplication-autoscalingScalingActivityStatusCodeUnfulfilled:
                return @"Unfulfilled";
            case AWSapplication-autoscalingScalingActivityStatusCodeFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapplication-autoscalingScalingPolicy

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapplication-autoscalingAlarm class]];
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
            return @(AWSapplication-autoscalingPolicyTypeStepScaling);
        }
        if ([value caseInsensitiveCompare:@"TargetTrackingScaling"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingPolicyTypeTargetTrackingScaling);
        }
        return @(AWSapplication-autoscalingPolicyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingPolicyTypeStepScaling:
                return @"StepScaling";
            case AWSapplication-autoscalingPolicyTypeTargetTrackingScaling:
                return @"TargetTrackingScaling";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scalableDimensionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs:service:DesiredCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSapplication-autoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCassandra);
        }
        return @(AWSapplication-autoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSapplication-autoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSapplication-autoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSapplication-autoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSapplication-autoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSapplication-autoscalingServiceNamespaceRds:
                return @"rds";
            case AWSapplication-autoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSapplication-autoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSapplication-autoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSapplication-autoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSapplication-autoscalingServiceNamespaceCassandra:
                return @"cassandra";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stepScalingPolicyConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapplication-autoscalingStepScalingPolicyConfiguration class]];
}

+ (NSValueTransformer *)targetTrackingScalingPolicyConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapplication-autoscalingTargetTrackingScalingPolicyConfiguration class]];
}

@end

@implementation AWSapplication-autoscalingScheduledAction

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
            return @(AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount);
        }
        if ([value caseInsensitiveCompare:@"ec2:spot-fleet-request:TargetCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce:instancegroup:InstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"appstream:fleet:DesiredCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"dynamodb:index:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"rds:cluster:ReadReplicaCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount);
        }
        if ([value caseInsensitiveCompare:@"sagemaker:variant:DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"custom-resource:ResourceType:Property"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty);
        }
        if ([value caseInsensitiveCompare:@"comprehend:document-classifier-endpoint:DesiredInferenceUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits);
        }
        if ([value caseInsensitiveCompare:@"lambda:function:ProvisionedConcurrency"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:ReadCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits);
        }
        if ([value caseInsensitiveCompare:@"cassandra:table:WriteCapacityUnits"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits);
        }
        return @(AWSapplication-autoscalingScalableDimensionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingScalableDimensionEcsServiceDesiredCount:
                return @"ecs:service:DesiredCount";
            case AWSapplication-autoscalingScalableDimensionEc2SpotFleetRequestTargetCapacity:
                return @"ec2:spot-fleet-request:TargetCapacity";
            case AWSapplication-autoscalingScalableDimensionElasticmapreduceInstancegroupInstanceCount:
                return @"elasticmapreduce:instancegroup:InstanceCount";
            case AWSapplication-autoscalingScalableDimensionAppstreamFleetDesiredCapacity:
                return @"appstream:fleet:DesiredCapacity";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableReadCapacityUnits:
                return @"dynamodb:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbTableWriteCapacityUnits:
                return @"dynamodb:table:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexReadCapacityUnits:
                return @"dynamodb:index:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionDynamodbIndexWriteCapacityUnits:
                return @"dynamodb:index:WriteCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionRdsClusterReadReplicaCount:
                return @"rds:cluster:ReadReplicaCount";
            case AWSapplication-autoscalingScalableDimensionSagemakerVariantDesiredInstanceCount:
                return @"sagemaker:variant:DesiredInstanceCount";
            case AWSapplication-autoscalingScalableDimensionCustomResourceResourceTypeProperty:
                return @"custom-resource:ResourceType:Property";
            case AWSapplication-autoscalingScalableDimensionComprehendDocumentClassifierEndpointDesiredInferenceUnits:
                return @"comprehend:document-classifier-endpoint:DesiredInferenceUnits";
            case AWSapplication-autoscalingScalableDimensionLambdaFunctionProvisionedConcurrency:
                return @"lambda:function:ProvisionedConcurrency";
            case AWSapplication-autoscalingScalableDimensionCassandraTableReadCapacityUnits:
                return @"cassandra:table:ReadCapacityUnits";
            case AWSapplication-autoscalingScalableDimensionCassandraTableWriteCapacityUnits:
                return @"cassandra:table:WriteCapacityUnits";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scalableTargetActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapplication-autoscalingScalableTargetAction class]];
}

+ (NSValueTransformer *)serviceNamespaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ecs"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEcs);
        }
        if ([value caseInsensitiveCompare:@"elasticmapreduce"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceElasticmapreduce);
        }
        if ([value caseInsensitiveCompare:@"ec2"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceEc2);
        }
        if ([value caseInsensitiveCompare:@"appstream"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceAppstream);
        }
        if ([value caseInsensitiveCompare:@"dynamodb"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceDynamodb);
        }
        if ([value caseInsensitiveCompare:@"rds"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceRds);
        }
        if ([value caseInsensitiveCompare:@"sagemaker"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceSagemaker);
        }
        if ([value caseInsensitiveCompare:@"custom-resource"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCustomResource);
        }
        if ([value caseInsensitiveCompare:@"comprehend"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceComprehend);
        }
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceLambda);
        }
        if ([value caseInsensitiveCompare:@"cassandra"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingServiceNamespaceCassandra);
        }
        return @(AWSapplication-autoscalingServiceNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingServiceNamespaceEcs:
                return @"ecs";
            case AWSapplication-autoscalingServiceNamespaceElasticmapreduce:
                return @"elasticmapreduce";
            case AWSapplication-autoscalingServiceNamespaceEc2:
                return @"ec2";
            case AWSapplication-autoscalingServiceNamespaceAppstream:
                return @"appstream";
            case AWSapplication-autoscalingServiceNamespaceDynamodb:
                return @"dynamodb";
            case AWSapplication-autoscalingServiceNamespaceRds:
                return @"rds";
            case AWSapplication-autoscalingServiceNamespaceSagemaker:
                return @"sagemaker";
            case AWSapplication-autoscalingServiceNamespaceCustomResource:
                return @"custom-resource";
            case AWSapplication-autoscalingServiceNamespaceComprehend:
                return @"comprehend";
            case AWSapplication-autoscalingServiceNamespaceLambda:
                return @"lambda";
            case AWSapplication-autoscalingServiceNamespaceCassandra:
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

@implementation AWSapplication-autoscalingStepAdjustment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricIntervalLowerBound" : @"MetricIntervalLowerBound",
             @"metricIntervalUpperBound" : @"MetricIntervalUpperBound",
             @"scalingAdjustment" : @"ScalingAdjustment",
             };
}

@end

@implementation AWSapplication-autoscalingStepScalingPolicyConfiguration

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
            return @(AWSapplication-autoscalingAdjustmentTypeChangeInCapacity);
        }
        if ([value caseInsensitiveCompare:@"PercentChangeInCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingAdjustmentTypePercentChangeInCapacity);
        }
        if ([value caseInsensitiveCompare:@"ExactCapacity"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingAdjustmentTypeExactCapacity);
        }
        return @(AWSapplication-autoscalingAdjustmentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingAdjustmentTypeChangeInCapacity:
                return @"ChangeInCapacity";
            case AWSapplication-autoscalingAdjustmentTypePercentChangeInCapacity:
                return @"PercentChangeInCapacity";
            case AWSapplication-autoscalingAdjustmentTypeExactCapacity:
                return @"ExactCapacity";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)metricAggregationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Average"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricAggregationTypeAverage);
        }
        if ([value caseInsensitiveCompare:@"Minimum"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricAggregationTypeMinimum);
        }
        if ([value caseInsensitiveCompare:@"Maximum"] == NSOrderedSame) {
            return @(AWSapplication-autoscalingMetricAggregationTypeMaximum);
        }
        return @(AWSapplication-autoscalingMetricAggregationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapplication-autoscalingMetricAggregationTypeAverage:
                return @"Average";
            case AWSapplication-autoscalingMetricAggregationTypeMinimum:
                return @"Minimum";
            case AWSapplication-autoscalingMetricAggregationTypeMaximum:
                return @"Maximum";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stepAdjustmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapplication-autoscalingStepAdjustment class]];
}

@end

@implementation AWSapplication-autoscalingSuspendedState

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dynamicScalingInSuspended" : @"DynamicScalingInSuspended",
             @"dynamicScalingOutSuspended" : @"DynamicScalingOutSuspended",
             @"scheduledScalingSuspended" : @"ScheduledScalingSuspended",
             };
}

@end

@implementation AWSapplication-autoscalingTargetTrackingScalingPolicyConfiguration

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapplication-autoscalingCustomizedMetricSpecification class]];
}

+ (NSValueTransformer *)predefinedMetricSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapplication-autoscalingPredefinedMetricSpecification class]];
}

@end
