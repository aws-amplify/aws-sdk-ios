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

#import "AWSelasticmapreduceModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSelasticmapreduceErrorDomain = @"com.amazonaws.AWSelasticmapreduceErrorDomain";

@implementation AWSelasticmapreduceAddInstanceFleetInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"instanceFleet" : @"InstanceFleet",
             };
}

+ (NSValueTransformer *)instanceFleetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceInstanceFleetConfig class]];
}

@end

@implementation AWSelasticmapreduceAddInstanceFleetOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"clusterId" : @"ClusterId",
             @"instanceFleetId" : @"InstanceFleetId",
             };
}

@end

@implementation AWSelasticmapreduceAddInstanceGroupsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceGroups" : @"InstanceGroups",
             @"jobFlowId" : @"JobFlowId",
             };
}

+ (NSValueTransformer *)instanceGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceInstanceGroupConfig class]];
}

@end

@implementation AWSelasticmapreduceAddInstanceGroupsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"instanceGroupIds" : @"InstanceGroupIds",
             @"jobFlowId" : @"JobFlowId",
             };
}

@end

@implementation AWSelasticmapreduceAddJobFlowStepsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobFlowId" : @"JobFlowId",
             @"steps" : @"Steps",
             };
}

+ (NSValueTransformer *)stepsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceStepConfig class]];
}

@end

@implementation AWSelasticmapreduceAddJobFlowStepsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stepIds" : @"StepIds",
             };
}

@end

@implementation AWSelasticmapreduceAddTagsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceTag class]];
}

@end

@implementation AWSelasticmapreduceAddTagsOutput

@end

@implementation AWSelasticmapreduceApplication

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalInfo" : @"AdditionalInfo",
             @"args" : @"Args",
             @"name" : @"Name",
             @"version" : @"Version",
             };
}

@end

@implementation AWSelasticmapreduceAutoScalingPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constraints" : @"Constraints",
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)constraintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceScalingConstraints class]];
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceScalingRule class]];
}

@end

@implementation AWSelasticmapreduceAutoScalingPolicyDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constraints" : @"Constraints",
             @"rules" : @"Rules",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)constraintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceScalingConstraints class]];
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceScalingRule class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceAutoScalingPolicyStatus class]];
}

@end

@implementation AWSelasticmapreduceAutoScalingPolicyStateChangeReason

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USER_REQUEST"] == NSOrderedSame) {
            return @(AWSelasticmapreduceAutoScalingPolicyStateChangeReasonCodeUserRequest);
        }
        if ([value caseInsensitiveCompare:@"PROVISION_FAILURE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceAutoScalingPolicyStateChangeReasonCodeProvisionFailure);
        }
        if ([value caseInsensitiveCompare:@"CLEANUP_FAILURE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceAutoScalingPolicyStateChangeReasonCodeCleanupFailure);
        }
        return @(AWSelasticmapreduceAutoScalingPolicyStateChangeReasonCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceAutoScalingPolicyStateChangeReasonCodeUserRequest:
                return @"USER_REQUEST";
            case AWSelasticmapreduceAutoScalingPolicyStateChangeReasonCodeProvisionFailure:
                return @"PROVISION_FAILURE";
            case AWSelasticmapreduceAutoScalingPolicyStateChangeReasonCodeCleanupFailure:
                return @"CLEANUP_FAILURE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticmapreduceAutoScalingPolicyStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"state" : @"State",
             @"stateChangeReason" : @"StateChangeReason",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceAutoScalingPolicyStatePending);
        }
        if ([value caseInsensitiveCompare:@"ATTACHING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceAutoScalingPolicyStateAttaching);
        }
        if ([value caseInsensitiveCompare:@"ATTACHED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceAutoScalingPolicyStateAttached);
        }
        if ([value caseInsensitiveCompare:@"DETACHING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceAutoScalingPolicyStateDetaching);
        }
        if ([value caseInsensitiveCompare:@"DETACHED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceAutoScalingPolicyStateDetached);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceAutoScalingPolicyStateFailed);
        }
        return @(AWSelasticmapreduceAutoScalingPolicyStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceAutoScalingPolicyStatePending:
                return @"PENDING";
            case AWSelasticmapreduceAutoScalingPolicyStateAttaching:
                return @"ATTACHING";
            case AWSelasticmapreduceAutoScalingPolicyStateAttached:
                return @"ATTACHED";
            case AWSelasticmapreduceAutoScalingPolicyStateDetaching:
                return @"DETACHING";
            case AWSelasticmapreduceAutoScalingPolicyStateDetached:
                return @"DETACHED";
            case AWSelasticmapreduceAutoScalingPolicyStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateChangeReasonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceAutoScalingPolicyStateChangeReason class]];
}

@end

@implementation AWSelasticmapreduceBlockPublicAccessConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockPublicSecurityGroupRules" : @"BlockPublicSecurityGroupRules",
             @"permittedPublicSecurityGroupRuleRanges" : @"PermittedPublicSecurityGroupRuleRanges",
             };
}

+ (NSValueTransformer *)permittedPublicSecurityGroupRuleRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreducePortRange class]];
}

@end

@implementation AWSelasticmapreduceBlockPublicAccessConfigurationMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdByArn" : @"CreatedByArn",
             @"creationDateTime" : @"CreationDateTime",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSelasticmapreduceBootstrapActionConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"scriptBootstrapAction" : @"ScriptBootstrapAction",
             };
}

+ (NSValueTransformer *)scriptBootstrapActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceScriptBootstrapActionConfig class]];
}

@end

@implementation AWSelasticmapreduceBootstrapActionDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bootstrapActionConfig" : @"BootstrapActionConfig",
             };
}

+ (NSValueTransformer *)bootstrapActionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceBootstrapActionConfig class]];
}

@end

@implementation AWSelasticmapreduceCancelStepsInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reason" : @"Reason",
             @"status" : @"Status",
             @"stepId" : @"StepId",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceCancelStepsRequestStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceCancelStepsRequestStatusFailed);
        }
        return @(AWSelasticmapreduceCancelStepsRequestStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceCancelStepsRequestStatusSubmitted:
                return @"SUBMITTED";
            case AWSelasticmapreduceCancelStepsRequestStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticmapreduceCancelStepsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"stepCancellationOption" : @"StepCancellationOption",
             @"stepIds" : @"StepIds",
             };
}

+ (NSValueTransformer *)stepCancellationOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SEND_INTERRUPT"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStepCancellationOptionSendInterrupt);
        }
        if ([value caseInsensitiveCompare:@"TERMINATE_PROCESS"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStepCancellationOptionTerminateProcess);
        }
        return @(AWSelasticmapreduceStepCancellationOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceStepCancellationOptionSendInterrupt:
                return @"SEND_INTERRUPT";
            case AWSelasticmapreduceStepCancellationOptionTerminateProcess:
                return @"TERMINATE_PROCESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticmapreduceCancelStepsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cancelStepsInfoList" : @"CancelStepsInfoList",
             };
}

+ (NSValueTransformer *)cancelStepsInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceCancelStepsInfo class]];
}

@end

@implementation AWSelasticmapreduceCloudWatchAlarmDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comparisonOperator" : @"ComparisonOperator",
             @"dimensions" : @"Dimensions",
             @"evaluationPeriods" : @"EvaluationPeriods",
             @"metricName" : @"MetricName",
             @"namespace" : @"Namespace",
             @"period" : @"Period",
             @"statistic" : @"Statistic",
             @"threshold" : @"Threshold",
             @"unit" : @"Unit",
             };
}

+ (NSValueTransformer *)comparisonOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GREATER_THAN_OR_EQUAL"] == NSOrderedSame) {
            return @(AWSelasticmapreduceComparisonOperatorGreaterThanOrEqual);
        }
        if ([value caseInsensitiveCompare:@"GREATER_THAN"] == NSOrderedSame) {
            return @(AWSelasticmapreduceComparisonOperatorGreaterThan);
        }
        if ([value caseInsensitiveCompare:@"LESS_THAN"] == NSOrderedSame) {
            return @(AWSelasticmapreduceComparisonOperatorLessThan);
        }
        if ([value caseInsensitiveCompare:@"LESS_THAN_OR_EQUAL"] == NSOrderedSame) {
            return @(AWSelasticmapreduceComparisonOperatorLessThanOrEqual);
        }
        return @(AWSelasticmapreduceComparisonOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceComparisonOperatorGreaterThanOrEqual:
                return @"GREATER_THAN_OR_EQUAL";
            case AWSelasticmapreduceComparisonOperatorGreaterThan:
                return @"GREATER_THAN";
            case AWSelasticmapreduceComparisonOperatorLessThan:
                return @"LESS_THAN";
            case AWSelasticmapreduceComparisonOperatorLessThanOrEqual:
                return @"LESS_THAN_OR_EQUAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceMetricDimension class]];
}

+ (NSValueTransformer *)statisticJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SAMPLE_COUNT"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStatisticSampleCount);
        }
        if ([value caseInsensitiveCompare:@"AVERAGE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStatisticAverage);
        }
        if ([value caseInsensitiveCompare:@"SUM"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStatisticSum);
        }
        if ([value caseInsensitiveCompare:@"MINIMUM"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStatisticMinimum);
        }
        if ([value caseInsensitiveCompare:@"MAXIMUM"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStatisticMaximum);
        }
        return @(AWSelasticmapreduceStatisticUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceStatisticSampleCount:
                return @"SAMPLE_COUNT";
            case AWSelasticmapreduceStatisticAverage:
                return @"AVERAGE";
            case AWSelasticmapreduceStatisticSum:
                return @"SUM";
            case AWSelasticmapreduceStatisticMinimum:
                return @"MINIMUM";
            case AWSelasticmapreduceStatisticMaximum:
                return @"MAXIMUM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitNone);
        }
        if ([value caseInsensitiveCompare:@"SECONDS"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitSeconds);
        }
        if ([value caseInsensitiveCompare:@"MICRO_SECONDS"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitMicroSeconds);
        }
        if ([value caseInsensitiveCompare:@"MILLI_SECONDS"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitMilliSeconds);
        }
        if ([value caseInsensitiveCompare:@"BYTES"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitBytes);
        }
        if ([value caseInsensitiveCompare:@"KILO_BYTES"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitKiloBytes);
        }
        if ([value caseInsensitiveCompare:@"MEGA_BYTES"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitMegaBytes);
        }
        if ([value caseInsensitiveCompare:@"GIGA_BYTES"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitGigaBytes);
        }
        if ([value caseInsensitiveCompare:@"TERA_BYTES"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitTeraBytes);
        }
        if ([value caseInsensitiveCompare:@"BITS"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitBits);
        }
        if ([value caseInsensitiveCompare:@"KILO_BITS"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitKiloBits);
        }
        if ([value caseInsensitiveCompare:@"MEGA_BITS"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitMegaBits);
        }
        if ([value caseInsensitiveCompare:@"GIGA_BITS"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitGigaBits);
        }
        if ([value caseInsensitiveCompare:@"TERA_BITS"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitTeraBits);
        }
        if ([value caseInsensitiveCompare:@"PERCENT"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitPercent);
        }
        if ([value caseInsensitiveCompare:@"COUNT"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitCount);
        }
        if ([value caseInsensitiveCompare:@"BYTES_PER_SECOND"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitBytesPerSecond);
        }
        if ([value caseInsensitiveCompare:@"KILO_BYTES_PER_SECOND"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitKiloBytesPerSecond);
        }
        if ([value caseInsensitiveCompare:@"MEGA_BYTES_PER_SECOND"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitMegaBytesPerSecond);
        }
        if ([value caseInsensitiveCompare:@"GIGA_BYTES_PER_SECOND"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitGigaBytesPerSecond);
        }
        if ([value caseInsensitiveCompare:@"TERA_BYTES_PER_SECOND"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitTeraBytesPerSecond);
        }
        if ([value caseInsensitiveCompare:@"BITS_PER_SECOND"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitBitsPerSecond);
        }
        if ([value caseInsensitiveCompare:@"KILO_BITS_PER_SECOND"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitKiloBitsPerSecond);
        }
        if ([value caseInsensitiveCompare:@"MEGA_BITS_PER_SECOND"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitMegaBitsPerSecond);
        }
        if ([value caseInsensitiveCompare:@"GIGA_BITS_PER_SECOND"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitGigaBitsPerSecond);
        }
        if ([value caseInsensitiveCompare:@"TERA_BITS_PER_SECOND"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitTeraBitsPerSecond);
        }
        if ([value caseInsensitiveCompare:@"COUNT_PER_SECOND"] == NSOrderedSame) {
            return @(AWSelasticmapreduceUnitCountPerSecond);
        }
        return @(AWSelasticmapreduceUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceUnitNone:
                return @"NONE";
            case AWSelasticmapreduceUnitSeconds:
                return @"SECONDS";
            case AWSelasticmapreduceUnitMicroSeconds:
                return @"MICRO_SECONDS";
            case AWSelasticmapreduceUnitMilliSeconds:
                return @"MILLI_SECONDS";
            case AWSelasticmapreduceUnitBytes:
                return @"BYTES";
            case AWSelasticmapreduceUnitKiloBytes:
                return @"KILO_BYTES";
            case AWSelasticmapreduceUnitMegaBytes:
                return @"MEGA_BYTES";
            case AWSelasticmapreduceUnitGigaBytes:
                return @"GIGA_BYTES";
            case AWSelasticmapreduceUnitTeraBytes:
                return @"TERA_BYTES";
            case AWSelasticmapreduceUnitBits:
                return @"BITS";
            case AWSelasticmapreduceUnitKiloBits:
                return @"KILO_BITS";
            case AWSelasticmapreduceUnitMegaBits:
                return @"MEGA_BITS";
            case AWSelasticmapreduceUnitGigaBits:
                return @"GIGA_BITS";
            case AWSelasticmapreduceUnitTeraBits:
                return @"TERA_BITS";
            case AWSelasticmapreduceUnitPercent:
                return @"PERCENT";
            case AWSelasticmapreduceUnitCount:
                return @"COUNT";
            case AWSelasticmapreduceUnitBytesPerSecond:
                return @"BYTES_PER_SECOND";
            case AWSelasticmapreduceUnitKiloBytesPerSecond:
                return @"KILO_BYTES_PER_SECOND";
            case AWSelasticmapreduceUnitMegaBytesPerSecond:
                return @"MEGA_BYTES_PER_SECOND";
            case AWSelasticmapreduceUnitGigaBytesPerSecond:
                return @"GIGA_BYTES_PER_SECOND";
            case AWSelasticmapreduceUnitTeraBytesPerSecond:
                return @"TERA_BYTES_PER_SECOND";
            case AWSelasticmapreduceUnitBitsPerSecond:
                return @"BITS_PER_SECOND";
            case AWSelasticmapreduceUnitKiloBitsPerSecond:
                return @"KILO_BITS_PER_SECOND";
            case AWSelasticmapreduceUnitMegaBitsPerSecond:
                return @"MEGA_BITS_PER_SECOND";
            case AWSelasticmapreduceUnitGigaBitsPerSecond:
                return @"GIGA_BITS_PER_SECOND";
            case AWSelasticmapreduceUnitTeraBitsPerSecond:
                return @"TERA_BITS_PER_SECOND";
            case AWSelasticmapreduceUnitCountPerSecond:
                return @"COUNT_PER_SECOND";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticmapreduceCluster

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applications" : @"Applications",
             @"autoScalingRole" : @"AutoScalingRole",
             @"autoTerminate" : @"AutoTerminate",
             @"clusterArn" : @"ClusterArn",
             @"configurations" : @"Configurations",
             @"customAmiId" : @"CustomAmiId",
             @"ebsRootVolumeSize" : @"EbsRootVolumeSize",
             @"ec2InstanceAttributes" : @"Ec2InstanceAttributes",
             @"identifier" : @"Id",
             @"instanceCollectionType" : @"InstanceCollectionType",
             @"kerberosAttributes" : @"KerberosAttributes",
             @"logUri" : @"LogUri",
             @"masterPublicDnsName" : @"MasterPublicDnsName",
             @"name" : @"Name",
             @"normalizedInstanceHours" : @"NormalizedInstanceHours",
             @"outpostArn" : @"OutpostArn",
             @"releaseLabel" : @"ReleaseLabel",
             @"repoUpgradeOnBoot" : @"RepoUpgradeOnBoot",
             @"requestedAmiVersion" : @"RequestedAmiVersion",
             @"runningAmiVersion" : @"RunningAmiVersion",
             @"scaleDownBehavior" : @"ScaleDownBehavior",
             @"securityConfiguration" : @"SecurityConfiguration",
             @"serviceRole" : @"ServiceRole",
             @"status" : @"Status",
             @"stepConcurrencyLevel" : @"StepConcurrencyLevel",
             @"tags" : @"Tags",
             @"terminationProtected" : @"TerminationProtected",
             @"visibleToAllUsers" : @"VisibleToAllUsers",
             };
}

+ (NSValueTransformer *)applicationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceApplication class]];
}

+ (NSValueTransformer *)configurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceConfiguration class]];
}

+ (NSValueTransformer *)ec2InstanceAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceEc2InstanceAttributes class]];
}

+ (NSValueTransformer *)instanceCollectionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSTANCE_FLEET"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceCollectionTypeInstanceFleet);
        }
        if ([value caseInsensitiveCompare:@"INSTANCE_GROUP"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceCollectionTypeInstanceGroup);
        }
        return @(AWSelasticmapreduceInstanceCollectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceInstanceCollectionTypeInstanceFleet:
                return @"INSTANCE_FLEET";
            case AWSelasticmapreduceInstanceCollectionTypeInstanceGroup:
                return @"INSTANCE_GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)kerberosAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceKerberosAttributes class]];
}

+ (NSValueTransformer *)repoUpgradeOnBootJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECURITY"] == NSOrderedSame) {
            return @(AWSelasticmapreduceRepoUpgradeOnBootSecurity);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceRepoUpgradeOnBootNone);
        }
        return @(AWSelasticmapreduceRepoUpgradeOnBootUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceRepoUpgradeOnBootSecurity:
                return @"SECURITY";
            case AWSelasticmapreduceRepoUpgradeOnBootNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scaleDownBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TERMINATE_AT_INSTANCE_HOUR"] == NSOrderedSame) {
            return @(AWSelasticmapreduceScaleDownBehaviorTerminateAtInstanceHour);
        }
        if ([value caseInsensitiveCompare:@"TERMINATE_AT_TASK_COMPLETION"] == NSOrderedSame) {
            return @(AWSelasticmapreduceScaleDownBehaviorTerminateAtTaskCompletion);
        }
        return @(AWSelasticmapreduceScaleDownBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceScaleDownBehaviorTerminateAtInstanceHour:
                return @"TERMINATE_AT_INSTANCE_HOUR";
            case AWSelasticmapreduceScaleDownBehaviorTerminateAtTaskCompletion:
                return @"TERMINATE_AT_TASK_COMPLETION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceClusterStatus class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceTag class]];
}

@end

@implementation AWSelasticmapreduceClusterStateChangeReason

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERNAL_ERROR"] == NSOrderedSame) {
            return @(AWSelasticmapreduceClusterStateChangeReasonCodeInternalError);
        }
        if ([value caseInsensitiveCompare:@"VALIDATION_ERROR"] == NSOrderedSame) {
            return @(AWSelasticmapreduceClusterStateChangeReasonCodeValidationError);
        }
        if ([value caseInsensitiveCompare:@"INSTANCE_FAILURE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceClusterStateChangeReasonCodeInstanceFailure);
        }
        if ([value caseInsensitiveCompare:@"INSTANCE_FLEET_TIMEOUT"] == NSOrderedSame) {
            return @(AWSelasticmapreduceClusterStateChangeReasonCodeInstanceFleetTimeout);
        }
        if ([value caseInsensitiveCompare:@"BOOTSTRAP_FAILURE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceClusterStateChangeReasonCodeBootstrapFailure);
        }
        if ([value caseInsensitiveCompare:@"USER_REQUEST"] == NSOrderedSame) {
            return @(AWSelasticmapreduceClusterStateChangeReasonCodeUserRequest);
        }
        if ([value caseInsensitiveCompare:@"STEP_FAILURE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceClusterStateChangeReasonCodeStepFailure);
        }
        if ([value caseInsensitiveCompare:@"ALL_STEPS_COMPLETED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceClusterStateChangeReasonCodeAllStepsCompleted);
        }
        return @(AWSelasticmapreduceClusterStateChangeReasonCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceClusterStateChangeReasonCodeInternalError:
                return @"INTERNAL_ERROR";
            case AWSelasticmapreduceClusterStateChangeReasonCodeValidationError:
                return @"VALIDATION_ERROR";
            case AWSelasticmapreduceClusterStateChangeReasonCodeInstanceFailure:
                return @"INSTANCE_FAILURE";
            case AWSelasticmapreduceClusterStateChangeReasonCodeInstanceFleetTimeout:
                return @"INSTANCE_FLEET_TIMEOUT";
            case AWSelasticmapreduceClusterStateChangeReasonCodeBootstrapFailure:
                return @"BOOTSTRAP_FAILURE";
            case AWSelasticmapreduceClusterStateChangeReasonCodeUserRequest:
                return @"USER_REQUEST";
            case AWSelasticmapreduceClusterStateChangeReasonCodeStepFailure:
                return @"STEP_FAILURE";
            case AWSelasticmapreduceClusterStateChangeReasonCodeAllStepsCompleted:
                return @"ALL_STEPS_COMPLETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticmapreduceClusterStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"state" : @"State",
             @"stateChangeReason" : @"StateChangeReason",
             @"timeline" : @"Timeline",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceClusterStateStarting);
        }
        if ([value caseInsensitiveCompare:@"BOOTSTRAPPING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceClusterStateBootstrapping);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceClusterStateRunning);
        }
        if ([value caseInsensitiveCompare:@"WAITING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceClusterStateWaiting);
        }
        if ([value caseInsensitiveCompare:@"TERMINATING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceClusterStateTerminating);
        }
        if ([value caseInsensitiveCompare:@"TERMINATED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceClusterStateTerminated);
        }
        if ([value caseInsensitiveCompare:@"TERMINATED_WITH_ERRORS"] == NSOrderedSame) {
            return @(AWSelasticmapreduceClusterStateTerminatedWithErrors);
        }
        return @(AWSelasticmapreduceClusterStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceClusterStateStarting:
                return @"STARTING";
            case AWSelasticmapreduceClusterStateBootstrapping:
                return @"BOOTSTRAPPING";
            case AWSelasticmapreduceClusterStateRunning:
                return @"RUNNING";
            case AWSelasticmapreduceClusterStateWaiting:
                return @"WAITING";
            case AWSelasticmapreduceClusterStateTerminating:
                return @"TERMINATING";
            case AWSelasticmapreduceClusterStateTerminated:
                return @"TERMINATED";
            case AWSelasticmapreduceClusterStateTerminatedWithErrors:
                return @"TERMINATED_WITH_ERRORS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateChangeReasonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceClusterStateChangeReason class]];
}

+ (NSValueTransformer *)timelineJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceClusterTimeline class]];
}

@end

@implementation AWSelasticmapreduceClusterSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"normalizedInstanceHours" : @"NormalizedInstanceHours",
             @"outpostArn" : @"OutpostArn",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceClusterStatus class]];
}

@end

@implementation AWSelasticmapreduceClusterTimeline

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"CreationDateTime",
             @"endDateTime" : @"EndDateTime",
             @"readyDateTime" : @"ReadyDateTime",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)endDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)readyDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSelasticmapreduceCommand

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"args" : @"Args",
             @"name" : @"Name",
             @"scriptPath" : @"ScriptPath",
             };
}

@end

@implementation AWSelasticmapreduceComputeLimits

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maximumCapacityUnits" : @"MaximumCapacityUnits",
             @"maximumOnDemandCapacityUnits" : @"MaximumOnDemandCapacityUnits",
             @"minimumCapacityUnits" : @"MinimumCapacityUnits",
             @"unitType" : @"UnitType",
             };
}

+ (NSValueTransformer *)unitTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InstanceFleetUnits"] == NSOrderedSame) {
            return @(AWSelasticmapreduceComputeLimitsUnitTypeInstanceFleetUnits);
        }
        if ([value caseInsensitiveCompare:@"Instances"] == NSOrderedSame) {
            return @(AWSelasticmapreduceComputeLimitsUnitTypeInstances);
        }
        if ([value caseInsensitiveCompare:@"VCPU"] == NSOrderedSame) {
            return @(AWSelasticmapreduceComputeLimitsUnitTypeVcpu);
        }
        return @(AWSelasticmapreduceComputeLimitsUnitTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceComputeLimitsUnitTypeInstanceFleetUnits:
                return @"InstanceFleetUnits";
            case AWSelasticmapreduceComputeLimitsUnitTypeInstances:
                return @"Instances";
            case AWSelasticmapreduceComputeLimitsUnitTypeVcpu:
                return @"VCPU";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticmapreduceConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classification" : @"Classification",
             @"configurations" : @"Configurations",
             @"properties" : @"Properties",
             };
}

+ (NSValueTransformer *)configurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceConfiguration class]];
}

@end

@implementation AWSelasticmapreduceCreateSecurityConfigurationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"securityConfiguration" : @"SecurityConfiguration",
             };
}

@end

@implementation AWSelasticmapreduceCreateSecurityConfigurationOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"CreationDateTime",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSelasticmapreduceDeleteSecurityConfigurationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSelasticmapreduceDeleteSecurityConfigurationOutput

@end

@implementation AWSelasticmapreduceDescribeClusterInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             };
}

@end

@implementation AWSelasticmapreduceDescribeClusterOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cluster" : @"Cluster",
             };
}

+ (NSValueTransformer *)clusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceCluster class]];
}

@end

@implementation AWSelasticmapreduceDescribeJobFlowsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAfter" : @"CreatedAfter",
             @"createdBefore" : @"CreatedBefore",
             @"jobFlowIds" : @"JobFlowIds",
             @"jobFlowStates" : @"JobFlowStates",
             };
}

+ (NSValueTransformer *)createdAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)createdBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSelasticmapreduceDescribeJobFlowsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobFlows" : @"JobFlows",
             };
}

+ (NSValueTransformer *)jobFlowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceJobFlowDetail class]];
}

@end

@implementation AWSelasticmapreduceDescribeSecurityConfigurationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSelasticmapreduceDescribeSecurityConfigurationOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"CreationDateTime",
             @"name" : @"Name",
             @"securityConfiguration" : @"SecurityConfiguration",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSelasticmapreduceDescribeStepInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"stepId" : @"StepId",
             };
}

@end

@implementation AWSelasticmapreduceDescribeStepOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"step" : @"Step",
             };
}

+ (NSValueTransformer *)stepJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceStep class]];
}

@end

@implementation AWSelasticmapreduceEbsBlockDevice

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"device" : @"Device",
             @"volumeSpecification" : @"VolumeSpecification",
             };
}

+ (NSValueTransformer *)volumeSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceVolumeSpecification class]];
}

@end

@implementation AWSelasticmapreduceEbsBlockDeviceConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeSpecification" : @"VolumeSpecification",
             @"volumesPerInstance" : @"VolumesPerInstance",
             };
}

+ (NSValueTransformer *)volumeSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceVolumeSpecification class]];
}

@end

@implementation AWSelasticmapreduceEbsConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ebsBlockDeviceConfigs" : @"EbsBlockDeviceConfigs",
             @"ebsOptimized" : @"EbsOptimized",
             };
}

+ (NSValueTransformer *)ebsBlockDeviceConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceEbsBlockDeviceConfig class]];
}

@end

@implementation AWSelasticmapreduceEbsVolume

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"device" : @"Device",
             @"volumeId" : @"VolumeId",
             };
}

@end

@implementation AWSelasticmapreduceEc2InstanceAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalMasterSecurityGroups" : @"AdditionalMasterSecurityGroups",
             @"additionalSlaveSecurityGroups" : @"AdditionalSlaveSecurityGroups",
             @"ec2AvailabilityZone" : @"Ec2AvailabilityZone",
             @"ec2KeyName" : @"Ec2KeyName",
             @"ec2SubnetId" : @"Ec2SubnetId",
             @"emrManagedMasterSecurityGroup" : @"EmrManagedMasterSecurityGroup",
             @"emrManagedSlaveSecurityGroup" : @"EmrManagedSlaveSecurityGroup",
             @"iamInstanceProfile" : @"IamInstanceProfile",
             @"requestedEc2AvailabilityZones" : @"RequestedEc2AvailabilityZones",
             @"requestedEc2SubnetIds" : @"RequestedEc2SubnetIds",
             @"serviceAccessSecurityGroup" : @"ServiceAccessSecurityGroup",
             };
}

@end

@implementation AWSelasticmapreduceFailureDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logFile" : @"LogFile",
             @"message" : @"Message",
             @"reason" : @"Reason",
             };
}

@end

@implementation AWSelasticmapreduceGetBlockPublicAccessConfigurationInput

@end

@implementation AWSelasticmapreduceGetBlockPublicAccessConfigurationOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockPublicAccessConfiguration" : @"BlockPublicAccessConfiguration",
             @"blockPublicAccessConfigurationMetadata" : @"BlockPublicAccessConfigurationMetadata",
             };
}

+ (NSValueTransformer *)blockPublicAccessConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceBlockPublicAccessConfiguration class]];
}

+ (NSValueTransformer *)blockPublicAccessConfigurationMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceBlockPublicAccessConfigurationMetadata class]];
}

@end

@implementation AWSelasticmapreduceGetManagedScalingPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             };
}

@end

@implementation AWSelasticmapreduceGetManagedScalingPolicyOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"managedScalingPolicy" : @"ManagedScalingPolicy",
             };
}

+ (NSValueTransformer *)managedScalingPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceManagedScalingPolicy class]];
}

@end

@implementation AWSelasticmapreduceHadoopJarStepConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"args" : @"Args",
             @"jar" : @"Jar",
             @"mainClass" : @"MainClass",
             @"properties" : @"Properties",
             };
}

+ (NSValueTransformer *)propertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceKeyValue class]];
}

@end

@implementation AWSelasticmapreduceHadoopStepConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"args" : @"Args",
             @"jar" : @"Jar",
             @"mainClass" : @"MainClass",
             @"properties" : @"Properties",
             };
}

@end

@implementation AWSelasticmapreduceInstance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ebsVolumes" : @"EbsVolumes",
             @"ec2InstanceId" : @"Ec2InstanceId",
             @"identifier" : @"Id",
             @"instanceFleetId" : @"InstanceFleetId",
             @"instanceGroupId" : @"InstanceGroupId",
             @"instanceType" : @"InstanceType",
             @"market" : @"Market",
             @"privateDnsName" : @"PrivateDnsName",
             @"privateIpAddress" : @"PrivateIpAddress",
             @"publicDnsName" : @"PublicDnsName",
             @"publicIpAddress" : @"PublicIpAddress",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)ebsVolumesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceEbsVolume class]];
}

+ (NSValueTransformer *)marketJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSelasticmapreduceMarketTypeOnDemand);
        }
        if ([value caseInsensitiveCompare:@"SPOT"] == NSOrderedSame) {
            return @(AWSelasticmapreduceMarketTypeSpot);
        }
        return @(AWSelasticmapreduceMarketTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceMarketTypeOnDemand:
                return @"ON_DEMAND";
            case AWSelasticmapreduceMarketTypeSpot:
                return @"SPOT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceInstanceStatus class]];
}

@end

@implementation AWSelasticmapreduceInstanceFleet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"instanceFleetType" : @"InstanceFleetType",
             @"instanceTypeSpecifications" : @"InstanceTypeSpecifications",
             @"launchSpecifications" : @"LaunchSpecifications",
             @"name" : @"Name",
             @"provisionedOnDemandCapacity" : @"ProvisionedOnDemandCapacity",
             @"provisionedSpotCapacity" : @"ProvisionedSpotCapacity",
             @"status" : @"Status",
             @"targetOnDemandCapacity" : @"TargetOnDemandCapacity",
             @"targetSpotCapacity" : @"TargetSpotCapacity",
             };
}

+ (NSValueTransformer *)instanceFleetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MASTER"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceFleetTypeMaster);
        }
        if ([value caseInsensitiveCompare:@"CORE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceFleetTypeCore);
        }
        if ([value caseInsensitiveCompare:@"TASK"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceFleetTypeTask);
        }
        return @(AWSelasticmapreduceInstanceFleetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceInstanceFleetTypeMaster:
                return @"MASTER";
            case AWSelasticmapreduceInstanceFleetTypeCore:
                return @"CORE";
            case AWSelasticmapreduceInstanceFleetTypeTask:
                return @"TASK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeSpecificationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceInstanceTypeSpecification class]];
}

+ (NSValueTransformer *)launchSpecificationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceInstanceFleetProvisioningSpecifications class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceInstanceFleetStatus class]];
}

@end

@implementation AWSelasticmapreduceInstanceFleetConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceFleetType" : @"InstanceFleetType",
             @"instanceTypeConfigs" : @"InstanceTypeConfigs",
             @"launchSpecifications" : @"LaunchSpecifications",
             @"name" : @"Name",
             @"targetOnDemandCapacity" : @"TargetOnDemandCapacity",
             @"targetSpotCapacity" : @"TargetSpotCapacity",
             };
}

+ (NSValueTransformer *)instanceFleetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MASTER"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceFleetTypeMaster);
        }
        if ([value caseInsensitiveCompare:@"CORE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceFleetTypeCore);
        }
        if ([value caseInsensitiveCompare:@"TASK"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceFleetTypeTask);
        }
        return @(AWSelasticmapreduceInstanceFleetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceInstanceFleetTypeMaster:
                return @"MASTER";
            case AWSelasticmapreduceInstanceFleetTypeCore:
                return @"CORE";
            case AWSelasticmapreduceInstanceFleetTypeTask:
                return @"TASK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceInstanceTypeConfig class]];
}

+ (NSValueTransformer *)launchSpecificationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceInstanceFleetProvisioningSpecifications class]];
}

@end

@implementation AWSelasticmapreduceInstanceFleetModifyConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceFleetId" : @"InstanceFleetId",
             @"targetOnDemandCapacity" : @"TargetOnDemandCapacity",
             @"targetSpotCapacity" : @"TargetSpotCapacity",
             };
}

@end

@implementation AWSelasticmapreduceInstanceFleetProvisioningSpecifications

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"spotSpecification" : @"SpotSpecification",
             };
}

+ (NSValueTransformer *)spotSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceSpotProvisioningSpecification class]];
}

@end

@implementation AWSelasticmapreduceInstanceFleetStateChangeReason

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERNAL_ERROR"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceFleetStateChangeReasonCodeInternalError);
        }
        if ([value caseInsensitiveCompare:@"VALIDATION_ERROR"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceFleetStateChangeReasonCodeValidationError);
        }
        if ([value caseInsensitiveCompare:@"INSTANCE_FAILURE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceFleetStateChangeReasonCodeInstanceFailure);
        }
        if ([value caseInsensitiveCompare:@"CLUSTER_TERMINATED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceFleetStateChangeReasonCodeClusterTerminated);
        }
        return @(AWSelasticmapreduceInstanceFleetStateChangeReasonCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceInstanceFleetStateChangeReasonCodeInternalError:
                return @"INTERNAL_ERROR";
            case AWSelasticmapreduceInstanceFleetStateChangeReasonCodeValidationError:
                return @"VALIDATION_ERROR";
            case AWSelasticmapreduceInstanceFleetStateChangeReasonCodeInstanceFailure:
                return @"INSTANCE_FAILURE";
            case AWSelasticmapreduceInstanceFleetStateChangeReasonCodeClusterTerminated:
                return @"CLUSTER_TERMINATED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticmapreduceInstanceFleetStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"state" : @"State",
             @"stateChangeReason" : @"StateChangeReason",
             @"timeline" : @"Timeline",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROVISIONING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceFleetStateProvisioning);
        }
        if ([value caseInsensitiveCompare:@"BOOTSTRAPPING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceFleetStateBootstrapping);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceFleetStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RESIZING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceFleetStateResizing);
        }
        if ([value caseInsensitiveCompare:@"SUSPENDED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceFleetStateSuspended);
        }
        if ([value caseInsensitiveCompare:@"TERMINATING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceFleetStateTerminating);
        }
        if ([value caseInsensitiveCompare:@"TERMINATED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceFleetStateTerminated);
        }
        return @(AWSelasticmapreduceInstanceFleetStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceInstanceFleetStateProvisioning:
                return @"PROVISIONING";
            case AWSelasticmapreduceInstanceFleetStateBootstrapping:
                return @"BOOTSTRAPPING";
            case AWSelasticmapreduceInstanceFleetStateRunning:
                return @"RUNNING";
            case AWSelasticmapreduceInstanceFleetStateResizing:
                return @"RESIZING";
            case AWSelasticmapreduceInstanceFleetStateSuspended:
                return @"SUSPENDED";
            case AWSelasticmapreduceInstanceFleetStateTerminating:
                return @"TERMINATING";
            case AWSelasticmapreduceInstanceFleetStateTerminated:
                return @"TERMINATED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateChangeReasonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceInstanceFleetStateChangeReason class]];
}

+ (NSValueTransformer *)timelineJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceInstanceFleetTimeline class]];
}

@end

@implementation AWSelasticmapreduceInstanceFleetTimeline

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"CreationDateTime",
             @"endDateTime" : @"EndDateTime",
             @"readyDateTime" : @"ReadyDateTime",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)endDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)readyDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSelasticmapreduceInstanceGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingPolicy" : @"AutoScalingPolicy",
             @"bidPrice" : @"BidPrice",
             @"configurations" : @"Configurations",
             @"configurationsVersion" : @"ConfigurationsVersion",
             @"ebsBlockDevices" : @"EbsBlockDevices",
             @"ebsOptimized" : @"EbsOptimized",
             @"identifier" : @"Id",
             @"instanceGroupType" : @"InstanceGroupType",
             @"instanceType" : @"InstanceType",
             @"lastSuccessfullyAppliedConfigurations" : @"LastSuccessfullyAppliedConfigurations",
             @"lastSuccessfullyAppliedConfigurationsVersion" : @"LastSuccessfullyAppliedConfigurationsVersion",
             @"market" : @"Market",
             @"name" : @"Name",
             @"requestedInstanceCount" : @"RequestedInstanceCount",
             @"runningInstanceCount" : @"RunningInstanceCount",
             @"shrinkPolicy" : @"ShrinkPolicy",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)autoScalingPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceAutoScalingPolicyDescription class]];
}

+ (NSValueTransformer *)configurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceConfiguration class]];
}

+ (NSValueTransformer *)ebsBlockDevicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceEbsBlockDevice class]];
}

+ (NSValueTransformer *)instanceGroupTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MASTER"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupTypeMaster);
        }
        if ([value caseInsensitiveCompare:@"CORE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupTypeCore);
        }
        if ([value caseInsensitiveCompare:@"TASK"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupTypeTask);
        }
        return @(AWSelasticmapreduceInstanceGroupTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceInstanceGroupTypeMaster:
                return @"MASTER";
            case AWSelasticmapreduceInstanceGroupTypeCore:
                return @"CORE";
            case AWSelasticmapreduceInstanceGroupTypeTask:
                return @"TASK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastSuccessfullyAppliedConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceConfiguration class]];
}

+ (NSValueTransformer *)marketJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSelasticmapreduceMarketTypeOnDemand);
        }
        if ([value caseInsensitiveCompare:@"SPOT"] == NSOrderedSame) {
            return @(AWSelasticmapreduceMarketTypeSpot);
        }
        return @(AWSelasticmapreduceMarketTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceMarketTypeOnDemand:
                return @"ON_DEMAND";
            case AWSelasticmapreduceMarketTypeSpot:
                return @"SPOT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)shrinkPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceShrinkPolicy class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceInstanceGroupStatus class]];
}

@end

@implementation AWSelasticmapreduceInstanceGroupConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingPolicy" : @"AutoScalingPolicy",
             @"bidPrice" : @"BidPrice",
             @"configurations" : @"Configurations",
             @"ebsConfiguration" : @"EbsConfiguration",
             @"instanceCount" : @"InstanceCount",
             @"instanceRole" : @"InstanceRole",
             @"instanceType" : @"InstanceType",
             @"market" : @"Market",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)autoScalingPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceAutoScalingPolicy class]];
}

+ (NSValueTransformer *)configurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceConfiguration class]];
}

+ (NSValueTransformer *)ebsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceEbsConfiguration class]];
}

+ (NSValueTransformer *)instanceRoleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MASTER"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceRoleTypeMaster);
        }
        if ([value caseInsensitiveCompare:@"CORE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceRoleTypeCore);
        }
        if ([value caseInsensitiveCompare:@"TASK"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceRoleTypeTask);
        }
        return @(AWSelasticmapreduceInstanceRoleTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceInstanceRoleTypeMaster:
                return @"MASTER";
            case AWSelasticmapreduceInstanceRoleTypeCore:
                return @"CORE";
            case AWSelasticmapreduceInstanceRoleTypeTask:
                return @"TASK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)marketJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSelasticmapreduceMarketTypeOnDemand);
        }
        if ([value caseInsensitiveCompare:@"SPOT"] == NSOrderedSame) {
            return @(AWSelasticmapreduceMarketTypeSpot);
        }
        return @(AWSelasticmapreduceMarketTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceMarketTypeOnDemand:
                return @"ON_DEMAND";
            case AWSelasticmapreduceMarketTypeSpot:
                return @"SPOT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticmapreduceInstanceGroupDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bidPrice" : @"BidPrice",
             @"creationDateTime" : @"CreationDateTime",
             @"endDateTime" : @"EndDateTime",
             @"instanceGroupId" : @"InstanceGroupId",
             @"instanceRequestCount" : @"InstanceRequestCount",
             @"instanceRole" : @"InstanceRole",
             @"instanceRunningCount" : @"InstanceRunningCount",
             @"instanceType" : @"InstanceType",
             @"lastStateChangeReason" : @"LastStateChangeReason",
             @"market" : @"Market",
             @"name" : @"Name",
             @"readyDateTime" : @"ReadyDateTime",
             @"startDateTime" : @"StartDateTime",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)endDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)instanceRoleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MASTER"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceRoleTypeMaster);
        }
        if ([value caseInsensitiveCompare:@"CORE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceRoleTypeCore);
        }
        if ([value caseInsensitiveCompare:@"TASK"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceRoleTypeTask);
        }
        return @(AWSelasticmapreduceInstanceRoleTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceInstanceRoleTypeMaster:
                return @"MASTER";
            case AWSelasticmapreduceInstanceRoleTypeCore:
                return @"CORE";
            case AWSelasticmapreduceInstanceRoleTypeTask:
                return @"TASK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)marketJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSelasticmapreduceMarketTypeOnDemand);
        }
        if ([value caseInsensitiveCompare:@"SPOT"] == NSOrderedSame) {
            return @(AWSelasticmapreduceMarketTypeSpot);
        }
        return @(AWSelasticmapreduceMarketTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceMarketTypeOnDemand:
                return @"ON_DEMAND";
            case AWSelasticmapreduceMarketTypeSpot:
                return @"SPOT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)readyDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROVISIONING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateProvisioning);
        }
        if ([value caseInsensitiveCompare:@"BOOTSTRAPPING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateBootstrapping);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECONFIGURING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateReconfiguring);
        }
        if ([value caseInsensitiveCompare:@"RESIZING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateResizing);
        }
        if ([value caseInsensitiveCompare:@"SUSPENDED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateSuspended);
        }
        if ([value caseInsensitiveCompare:@"TERMINATING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateTerminating);
        }
        if ([value caseInsensitiveCompare:@"TERMINATED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateTerminated);
        }
        if ([value caseInsensitiveCompare:@"ARRESTED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateArrested);
        }
        if ([value caseInsensitiveCompare:@"SHUTTING_DOWN"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateShuttingDown);
        }
        if ([value caseInsensitiveCompare:@"ENDED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateEnded);
        }
        return @(AWSelasticmapreduceInstanceGroupStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceInstanceGroupStateProvisioning:
                return @"PROVISIONING";
            case AWSelasticmapreduceInstanceGroupStateBootstrapping:
                return @"BOOTSTRAPPING";
            case AWSelasticmapreduceInstanceGroupStateRunning:
                return @"RUNNING";
            case AWSelasticmapreduceInstanceGroupStateReconfiguring:
                return @"RECONFIGURING";
            case AWSelasticmapreduceInstanceGroupStateResizing:
                return @"RESIZING";
            case AWSelasticmapreduceInstanceGroupStateSuspended:
                return @"SUSPENDED";
            case AWSelasticmapreduceInstanceGroupStateTerminating:
                return @"TERMINATING";
            case AWSelasticmapreduceInstanceGroupStateTerminated:
                return @"TERMINATED";
            case AWSelasticmapreduceInstanceGroupStateArrested:
                return @"ARRESTED";
            case AWSelasticmapreduceInstanceGroupStateShuttingDown:
                return @"SHUTTING_DOWN";
            case AWSelasticmapreduceInstanceGroupStateEnded:
                return @"ENDED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticmapreduceInstanceGroupModifyConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurations" : @"Configurations",
             @"EC2InstanceIdsToTerminate" : @"EC2InstanceIdsToTerminate",
             @"instanceCount" : @"InstanceCount",
             @"instanceGroupId" : @"InstanceGroupId",
             @"shrinkPolicy" : @"ShrinkPolicy",
             };
}

+ (NSValueTransformer *)configurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceConfiguration class]];
}

+ (NSValueTransformer *)shrinkPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceShrinkPolicy class]];
}

@end

@implementation AWSelasticmapreduceInstanceGroupStateChangeReason

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERNAL_ERROR"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateChangeReasonCodeInternalError);
        }
        if ([value caseInsensitiveCompare:@"VALIDATION_ERROR"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateChangeReasonCodeValidationError);
        }
        if ([value caseInsensitiveCompare:@"INSTANCE_FAILURE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateChangeReasonCodeInstanceFailure);
        }
        if ([value caseInsensitiveCompare:@"CLUSTER_TERMINATED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateChangeReasonCodeClusterTerminated);
        }
        return @(AWSelasticmapreduceInstanceGroupStateChangeReasonCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceInstanceGroupStateChangeReasonCodeInternalError:
                return @"INTERNAL_ERROR";
            case AWSelasticmapreduceInstanceGroupStateChangeReasonCodeValidationError:
                return @"VALIDATION_ERROR";
            case AWSelasticmapreduceInstanceGroupStateChangeReasonCodeInstanceFailure:
                return @"INSTANCE_FAILURE";
            case AWSelasticmapreduceInstanceGroupStateChangeReasonCodeClusterTerminated:
                return @"CLUSTER_TERMINATED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticmapreduceInstanceGroupStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"state" : @"State",
             @"stateChangeReason" : @"StateChangeReason",
             @"timeline" : @"Timeline",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROVISIONING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateProvisioning);
        }
        if ([value caseInsensitiveCompare:@"BOOTSTRAPPING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateBootstrapping);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECONFIGURING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateReconfiguring);
        }
        if ([value caseInsensitiveCompare:@"RESIZING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateResizing);
        }
        if ([value caseInsensitiveCompare:@"SUSPENDED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateSuspended);
        }
        if ([value caseInsensitiveCompare:@"TERMINATING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateTerminating);
        }
        if ([value caseInsensitiveCompare:@"TERMINATED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateTerminated);
        }
        if ([value caseInsensitiveCompare:@"ARRESTED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateArrested);
        }
        if ([value caseInsensitiveCompare:@"SHUTTING_DOWN"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateShuttingDown);
        }
        if ([value caseInsensitiveCompare:@"ENDED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceGroupStateEnded);
        }
        return @(AWSelasticmapreduceInstanceGroupStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceInstanceGroupStateProvisioning:
                return @"PROVISIONING";
            case AWSelasticmapreduceInstanceGroupStateBootstrapping:
                return @"BOOTSTRAPPING";
            case AWSelasticmapreduceInstanceGroupStateRunning:
                return @"RUNNING";
            case AWSelasticmapreduceInstanceGroupStateReconfiguring:
                return @"RECONFIGURING";
            case AWSelasticmapreduceInstanceGroupStateResizing:
                return @"RESIZING";
            case AWSelasticmapreduceInstanceGroupStateSuspended:
                return @"SUSPENDED";
            case AWSelasticmapreduceInstanceGroupStateTerminating:
                return @"TERMINATING";
            case AWSelasticmapreduceInstanceGroupStateTerminated:
                return @"TERMINATED";
            case AWSelasticmapreduceInstanceGroupStateArrested:
                return @"ARRESTED";
            case AWSelasticmapreduceInstanceGroupStateShuttingDown:
                return @"SHUTTING_DOWN";
            case AWSelasticmapreduceInstanceGroupStateEnded:
                return @"ENDED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateChangeReasonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceInstanceGroupStateChangeReason class]];
}

+ (NSValueTransformer *)timelineJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceInstanceGroupTimeline class]];
}

@end

@implementation AWSelasticmapreduceInstanceGroupTimeline

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"CreationDateTime",
             @"endDateTime" : @"EndDateTime",
             @"readyDateTime" : @"ReadyDateTime",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)endDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)readyDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSelasticmapreduceInstanceResizePolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceTerminationTimeout" : @"InstanceTerminationTimeout",
             @"instancesToProtect" : @"InstancesToProtect",
             @"instancesToTerminate" : @"InstancesToTerminate",
             };
}

@end

@implementation AWSelasticmapreduceInstanceStateChangeReason

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERNAL_ERROR"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceStateChangeReasonCodeInternalError);
        }
        if ([value caseInsensitiveCompare:@"VALIDATION_ERROR"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceStateChangeReasonCodeValidationError);
        }
        if ([value caseInsensitiveCompare:@"INSTANCE_FAILURE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceStateChangeReasonCodeInstanceFailure);
        }
        if ([value caseInsensitiveCompare:@"BOOTSTRAP_FAILURE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceStateChangeReasonCodeBootstrapFailure);
        }
        if ([value caseInsensitiveCompare:@"CLUSTER_TERMINATED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceStateChangeReasonCodeClusterTerminated);
        }
        return @(AWSelasticmapreduceInstanceStateChangeReasonCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceInstanceStateChangeReasonCodeInternalError:
                return @"INTERNAL_ERROR";
            case AWSelasticmapreduceInstanceStateChangeReasonCodeValidationError:
                return @"VALIDATION_ERROR";
            case AWSelasticmapreduceInstanceStateChangeReasonCodeInstanceFailure:
                return @"INSTANCE_FAILURE";
            case AWSelasticmapreduceInstanceStateChangeReasonCodeBootstrapFailure:
                return @"BOOTSTRAP_FAILURE";
            case AWSelasticmapreduceInstanceStateChangeReasonCodeClusterTerminated:
                return @"CLUSTER_TERMINATED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticmapreduceInstanceStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"state" : @"State",
             @"stateChangeReason" : @"StateChangeReason",
             @"timeline" : @"Timeline",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWAITING_FULFILLMENT"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceStateAwaitingFulfillment);
        }
        if ([value caseInsensitiveCompare:@"PROVISIONING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceStateProvisioning);
        }
        if ([value caseInsensitiveCompare:@"BOOTSTRAPPING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceStateBootstrapping);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceStateRunning);
        }
        if ([value caseInsensitiveCompare:@"TERMINATED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceStateTerminated);
        }
        return @(AWSelasticmapreduceInstanceStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceInstanceStateAwaitingFulfillment:
                return @"AWAITING_FULFILLMENT";
            case AWSelasticmapreduceInstanceStateProvisioning:
                return @"PROVISIONING";
            case AWSelasticmapreduceInstanceStateBootstrapping:
                return @"BOOTSTRAPPING";
            case AWSelasticmapreduceInstanceStateRunning:
                return @"RUNNING";
            case AWSelasticmapreduceInstanceStateTerminated:
                return @"TERMINATED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateChangeReasonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceInstanceStateChangeReason class]];
}

+ (NSValueTransformer *)timelineJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceInstanceTimeline class]];
}

@end

@implementation AWSelasticmapreduceInstanceTimeline

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"CreationDateTime",
             @"endDateTime" : @"EndDateTime",
             @"readyDateTime" : @"ReadyDateTime",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)endDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)readyDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSelasticmapreduceInstanceTypeConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bidPrice" : @"BidPrice",
             @"bidPriceAsPercentageOfOnDemandPrice" : @"BidPriceAsPercentageOfOnDemandPrice",
             @"configurations" : @"Configurations",
             @"ebsConfiguration" : @"EbsConfiguration",
             @"instanceType" : @"InstanceType",
             @"weightedCapacity" : @"WeightedCapacity",
             };
}

+ (NSValueTransformer *)configurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceConfiguration class]];
}

+ (NSValueTransformer *)ebsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceEbsConfiguration class]];
}

@end

@implementation AWSelasticmapreduceInstanceTypeSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bidPrice" : @"BidPrice",
             @"bidPriceAsPercentageOfOnDemandPrice" : @"BidPriceAsPercentageOfOnDemandPrice",
             @"configurations" : @"Configurations",
             @"ebsBlockDevices" : @"EbsBlockDevices",
             @"ebsOptimized" : @"EbsOptimized",
             @"instanceType" : @"InstanceType",
             @"weightedCapacity" : @"WeightedCapacity",
             };
}

+ (NSValueTransformer *)configurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceConfiguration class]];
}

+ (NSValueTransformer *)ebsBlockDevicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceEbsBlockDevice class]];
}

@end

@implementation AWSelasticmapreduceJobFlowDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amiVersion" : @"AmiVersion",
             @"autoScalingRole" : @"AutoScalingRole",
             @"bootstrapActions" : @"BootstrapActions",
             @"executionStatusDetail" : @"ExecutionStatusDetail",
             @"instances" : @"Instances",
             @"jobFlowId" : @"JobFlowId",
             @"jobFlowRole" : @"JobFlowRole",
             @"logUri" : @"LogUri",
             @"name" : @"Name",
             @"scaleDownBehavior" : @"ScaleDownBehavior",
             @"serviceRole" : @"ServiceRole",
             @"steps" : @"Steps",
             @"supportedProducts" : @"SupportedProducts",
             @"visibleToAllUsers" : @"VisibleToAllUsers",
             };
}

+ (NSValueTransformer *)bootstrapActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceBootstrapActionDetail class]];
}

+ (NSValueTransformer *)executionStatusDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceJobFlowExecutionStatusDetail class]];
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceJobFlowInstancesDetail class]];
}

+ (NSValueTransformer *)scaleDownBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TERMINATE_AT_INSTANCE_HOUR"] == NSOrderedSame) {
            return @(AWSelasticmapreduceScaleDownBehaviorTerminateAtInstanceHour);
        }
        if ([value caseInsensitiveCompare:@"TERMINATE_AT_TASK_COMPLETION"] == NSOrderedSame) {
            return @(AWSelasticmapreduceScaleDownBehaviorTerminateAtTaskCompletion);
        }
        return @(AWSelasticmapreduceScaleDownBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceScaleDownBehaviorTerminateAtInstanceHour:
                return @"TERMINATE_AT_INSTANCE_HOUR";
            case AWSelasticmapreduceScaleDownBehaviorTerminateAtTaskCompletion:
                return @"TERMINATE_AT_TASK_COMPLETION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stepsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceStepDetail class]];
}

@end

@implementation AWSelasticmapreduceJobFlowExecutionStatusDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"CreationDateTime",
             @"endDateTime" : @"EndDateTime",
             @"lastStateChangeReason" : @"LastStateChangeReason",
             @"readyDateTime" : @"ReadyDateTime",
             @"startDateTime" : @"StartDateTime",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)endDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)readyDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceJobFlowExecutionStateStarting);
        }
        if ([value caseInsensitiveCompare:@"BOOTSTRAPPING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceJobFlowExecutionStateBootstrapping);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceJobFlowExecutionStateRunning);
        }
        if ([value caseInsensitiveCompare:@"WAITING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceJobFlowExecutionStateWaiting);
        }
        if ([value caseInsensitiveCompare:@"SHUTTING_DOWN"] == NSOrderedSame) {
            return @(AWSelasticmapreduceJobFlowExecutionStateShuttingDown);
        }
        if ([value caseInsensitiveCompare:@"TERMINATED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceJobFlowExecutionStateTerminated);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceJobFlowExecutionStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceJobFlowExecutionStateFailed);
        }
        return @(AWSelasticmapreduceJobFlowExecutionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceJobFlowExecutionStateStarting:
                return @"STARTING";
            case AWSelasticmapreduceJobFlowExecutionStateBootstrapping:
                return @"BOOTSTRAPPING";
            case AWSelasticmapreduceJobFlowExecutionStateRunning:
                return @"RUNNING";
            case AWSelasticmapreduceJobFlowExecutionStateWaiting:
                return @"WAITING";
            case AWSelasticmapreduceJobFlowExecutionStateShuttingDown:
                return @"SHUTTING_DOWN";
            case AWSelasticmapreduceJobFlowExecutionStateTerminated:
                return @"TERMINATED";
            case AWSelasticmapreduceJobFlowExecutionStateCompleted:
                return @"COMPLETED";
            case AWSelasticmapreduceJobFlowExecutionStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticmapreduceJobFlowInstancesConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalMasterSecurityGroups" : @"AdditionalMasterSecurityGroups",
             @"additionalSlaveSecurityGroups" : @"AdditionalSlaveSecurityGroups",
             @"ec2KeyName" : @"Ec2KeyName",
             @"ec2SubnetId" : @"Ec2SubnetId",
             @"ec2SubnetIds" : @"Ec2SubnetIds",
             @"emrManagedMasterSecurityGroup" : @"EmrManagedMasterSecurityGroup",
             @"emrManagedSlaveSecurityGroup" : @"EmrManagedSlaveSecurityGroup",
             @"hadoopVersion" : @"HadoopVersion",
             @"instanceCount" : @"InstanceCount",
             @"instanceFleets" : @"InstanceFleets",
             @"instanceGroups" : @"InstanceGroups",
             @"keepJobFlowAliveWhenNoSteps" : @"KeepJobFlowAliveWhenNoSteps",
             @"masterInstanceType" : @"MasterInstanceType",
             @"placement" : @"Placement",
             @"serviceAccessSecurityGroup" : @"ServiceAccessSecurityGroup",
             @"slaveInstanceType" : @"SlaveInstanceType",
             @"terminationProtected" : @"TerminationProtected",
             };
}

+ (NSValueTransformer *)instanceFleetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceInstanceFleetConfig class]];
}

+ (NSValueTransformer *)instanceGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceInstanceGroupConfig class]];
}

+ (NSValueTransformer *)placementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreducePlacementType class]];
}

@end

@implementation AWSelasticmapreduceJobFlowInstancesDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ec2KeyName" : @"Ec2KeyName",
             @"ec2SubnetId" : @"Ec2SubnetId",
             @"hadoopVersion" : @"HadoopVersion",
             @"instanceCount" : @"InstanceCount",
             @"instanceGroups" : @"InstanceGroups",
             @"keepJobFlowAliveWhenNoSteps" : @"KeepJobFlowAliveWhenNoSteps",
             @"masterInstanceId" : @"MasterInstanceId",
             @"masterInstanceType" : @"MasterInstanceType",
             @"masterPublicDnsName" : @"MasterPublicDnsName",
             @"normalizedInstanceHours" : @"NormalizedInstanceHours",
             @"placement" : @"Placement",
             @"slaveInstanceType" : @"SlaveInstanceType",
             @"terminationProtected" : @"TerminationProtected",
             };
}

+ (NSValueTransformer *)instanceGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceInstanceGroupDetail class]];
}

+ (NSValueTransformer *)placementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreducePlacementType class]];
}

@end

@implementation AWSelasticmapreduceKerberosAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ADDomainJoinPassword" : @"ADDomainJoinPassword",
             @"ADDomainJoinUser" : @"ADDomainJoinUser",
             @"crossRealmTrustPrincipalPassword" : @"CrossRealmTrustPrincipalPassword",
             @"kdcAdminPassword" : @"KdcAdminPassword",
             @"realm" : @"Realm",
             };
}

@end

@implementation AWSelasticmapreduceKeyValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSelasticmapreduceListBootstrapActionsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSelasticmapreduceListBootstrapActionsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bootstrapActions" : @"BootstrapActions",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)bootstrapActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceCommand class]];
}

@end

@implementation AWSelasticmapreduceListClustersInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterStates" : @"ClusterStates",
             @"createdAfter" : @"CreatedAfter",
             @"createdBefore" : @"CreatedBefore",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)createdAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)createdBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSelasticmapreduceListClustersOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusters" : @"Clusters",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)clustersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceClusterSummary class]];
}

@end

@implementation AWSelasticmapreduceListInstanceFleetsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSelasticmapreduceListInstanceFleetsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceFleets" : @"InstanceFleets",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)instanceFleetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceInstanceFleet class]];
}

@end

@implementation AWSelasticmapreduceListInstanceGroupsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSelasticmapreduceListInstanceGroupsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceGroups" : @"InstanceGroups",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)instanceGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceInstanceGroup class]];
}

@end

@implementation AWSelasticmapreduceListInstancesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"instanceFleetId" : @"InstanceFleetId",
             @"instanceFleetType" : @"InstanceFleetType",
             @"instanceGroupId" : @"InstanceGroupId",
             @"instanceGroupTypes" : @"InstanceGroupTypes",
             @"instanceStates" : @"InstanceStates",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)instanceFleetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MASTER"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceFleetTypeMaster);
        }
        if ([value caseInsensitiveCompare:@"CORE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceFleetTypeCore);
        }
        if ([value caseInsensitiveCompare:@"TASK"] == NSOrderedSame) {
            return @(AWSelasticmapreduceInstanceFleetTypeTask);
        }
        return @(AWSelasticmapreduceInstanceFleetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceInstanceFleetTypeMaster:
                return @"MASTER";
            case AWSelasticmapreduceInstanceFleetTypeCore:
                return @"CORE";
            case AWSelasticmapreduceInstanceFleetTypeTask:
                return @"TASK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticmapreduceListInstancesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instances" : @"Instances",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceInstance class]];
}

@end

@implementation AWSelasticmapreduceListSecurityConfigurationsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSelasticmapreduceListSecurityConfigurationsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"securityConfigurations" : @"SecurityConfigurations",
             };
}

+ (NSValueTransformer *)securityConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceSecurityConfigurationSummary class]];
}

@end

@implementation AWSelasticmapreduceListStepsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"marker" : @"Marker",
             @"stepIds" : @"StepIds",
             @"stepStates" : @"StepStates",
             };
}

@end

@implementation AWSelasticmapreduceListStepsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"steps" : @"Steps",
             };
}

+ (NSValueTransformer *)stepsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceStepSummary class]];
}

@end

@implementation AWSelasticmapreduceManagedScalingPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"computeLimits" : @"ComputeLimits",
             };
}

+ (NSValueTransformer *)computeLimitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceComputeLimits class]];
}

@end

@implementation AWSelasticmapreduceMetricDimension

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSelasticmapreduceModifyClusterInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"stepConcurrencyLevel" : @"StepConcurrencyLevel",
             };
}

@end

@implementation AWSelasticmapreduceModifyClusterOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stepConcurrencyLevel" : @"StepConcurrencyLevel",
             };
}

@end

@implementation AWSelasticmapreduceModifyInstanceFleetInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"instanceFleet" : @"InstanceFleet",
             };
}

+ (NSValueTransformer *)instanceFleetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceInstanceFleetModifyConfig class]];
}

@end

@implementation AWSelasticmapreduceModifyInstanceGroupsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"instanceGroups" : @"InstanceGroups",
             };
}

+ (NSValueTransformer *)instanceGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceInstanceGroupModifyConfig class]];
}

@end

@implementation AWSelasticmapreducePlacementType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"availabilityZones" : @"AvailabilityZones",
             };
}

@end

@implementation AWSelasticmapreducePortRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxRange" : @"MaxRange",
             @"minRange" : @"MinRange",
             };
}

@end

@implementation AWSelasticmapreducePutAutoScalingPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingPolicy" : @"AutoScalingPolicy",
             @"clusterId" : @"ClusterId",
             @"instanceGroupId" : @"InstanceGroupId",
             };
}

+ (NSValueTransformer *)autoScalingPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceAutoScalingPolicy class]];
}

@end

@implementation AWSelasticmapreducePutAutoScalingPolicyOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingPolicy" : @"AutoScalingPolicy",
             @"clusterArn" : @"ClusterArn",
             @"clusterId" : @"ClusterId",
             @"instanceGroupId" : @"InstanceGroupId",
             };
}

+ (NSValueTransformer *)autoScalingPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceAutoScalingPolicyDescription class]];
}

@end

@implementation AWSelasticmapreducePutBlockPublicAccessConfigurationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockPublicAccessConfiguration" : @"BlockPublicAccessConfiguration",
             };
}

+ (NSValueTransformer *)blockPublicAccessConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceBlockPublicAccessConfiguration class]];
}

@end

@implementation AWSelasticmapreducePutBlockPublicAccessConfigurationOutput

@end

@implementation AWSelasticmapreducePutManagedScalingPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"managedScalingPolicy" : @"ManagedScalingPolicy",
             };
}

+ (NSValueTransformer *)managedScalingPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceManagedScalingPolicy class]];
}

@end

@implementation AWSelasticmapreducePutManagedScalingPolicyOutput

@end

@implementation AWSelasticmapreduceRemoveAutoScalingPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"instanceGroupId" : @"InstanceGroupId",
             };
}

@end

@implementation AWSelasticmapreduceRemoveAutoScalingPolicyOutput

@end

@implementation AWSelasticmapreduceRemoveManagedScalingPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             };
}

@end

@implementation AWSelasticmapreduceRemoveManagedScalingPolicyOutput

@end

@implementation AWSelasticmapreduceRemoveTagsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSelasticmapreduceRemoveTagsOutput

@end

@implementation AWSelasticmapreduceRunJobFlowInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalInfo" : @"AdditionalInfo",
             @"amiVersion" : @"AmiVersion",
             @"applications" : @"Applications",
             @"autoScalingRole" : @"AutoScalingRole",
             @"bootstrapActions" : @"BootstrapActions",
             @"configurations" : @"Configurations",
             @"customAmiId" : @"CustomAmiId",
             @"ebsRootVolumeSize" : @"EbsRootVolumeSize",
             @"instances" : @"Instances",
             @"jobFlowRole" : @"JobFlowRole",
             @"kerberosAttributes" : @"KerberosAttributes",
             @"logUri" : @"LogUri",
             @"managedScalingPolicy" : @"ManagedScalingPolicy",
             @"name" : @"Name",
             @"latestSupportedProducts" : @"NewSupportedProducts",
             @"releaseLabel" : @"ReleaseLabel",
             @"repoUpgradeOnBoot" : @"RepoUpgradeOnBoot",
             @"scaleDownBehavior" : @"ScaleDownBehavior",
             @"securityConfiguration" : @"SecurityConfiguration",
             @"serviceRole" : @"ServiceRole",
             @"stepConcurrencyLevel" : @"StepConcurrencyLevel",
             @"steps" : @"Steps",
             @"supportedProducts" : @"SupportedProducts",
             @"tags" : @"Tags",
             @"visibleToAllUsers" : @"VisibleToAllUsers",
             };
}

+ (NSValueTransformer *)applicationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceApplication class]];
}

+ (NSValueTransformer *)bootstrapActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceBootstrapActionConfig class]];
}

+ (NSValueTransformer *)configurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceConfiguration class]];
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceJobFlowInstancesConfig class]];
}

+ (NSValueTransformer *)kerberosAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceKerberosAttributes class]];
}

+ (NSValueTransformer *)managedScalingPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceManagedScalingPolicy class]];
}

+ (NSValueTransformer *)latestSupportedProductsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceSupportedProductConfig class]];
}

+ (NSValueTransformer *)repoUpgradeOnBootJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECURITY"] == NSOrderedSame) {
            return @(AWSelasticmapreduceRepoUpgradeOnBootSecurity);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceRepoUpgradeOnBootNone);
        }
        return @(AWSelasticmapreduceRepoUpgradeOnBootUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceRepoUpgradeOnBootSecurity:
                return @"SECURITY";
            case AWSelasticmapreduceRepoUpgradeOnBootNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scaleDownBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TERMINATE_AT_INSTANCE_HOUR"] == NSOrderedSame) {
            return @(AWSelasticmapreduceScaleDownBehaviorTerminateAtInstanceHour);
        }
        if ([value caseInsensitiveCompare:@"TERMINATE_AT_TASK_COMPLETION"] == NSOrderedSame) {
            return @(AWSelasticmapreduceScaleDownBehaviorTerminateAtTaskCompletion);
        }
        return @(AWSelasticmapreduceScaleDownBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceScaleDownBehaviorTerminateAtInstanceHour:
                return @"TERMINATE_AT_INSTANCE_HOUR";
            case AWSelasticmapreduceScaleDownBehaviorTerminateAtTaskCompletion:
                return @"TERMINATE_AT_TASK_COMPLETION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stepsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceStepConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSelasticmapreduceTag class]];
}

@end

@implementation AWSelasticmapreduceRunJobFlowOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"jobFlowId" : @"JobFlowId",
             };
}

@end

@implementation AWSelasticmapreduceScalingAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"market" : @"Market",
             @"simpleScalingPolicyConfiguration" : @"SimpleScalingPolicyConfiguration",
             };
}

+ (NSValueTransformer *)marketJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSelasticmapreduceMarketTypeOnDemand);
        }
        if ([value caseInsensitiveCompare:@"SPOT"] == NSOrderedSame) {
            return @(AWSelasticmapreduceMarketTypeSpot);
        }
        return @(AWSelasticmapreduceMarketTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceMarketTypeOnDemand:
                return @"ON_DEMAND";
            case AWSelasticmapreduceMarketTypeSpot:
                return @"SPOT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)simpleScalingPolicyConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceSimpleScalingPolicyConfiguration class]];
}

@end

@implementation AWSelasticmapreduceScalingConstraints

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxCapacity" : @"MaxCapacity",
             @"minCapacity" : @"MinCapacity",
             };
}

@end

@implementation AWSelasticmapreduceScalingRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"trigger" : @"Trigger",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceScalingAction class]];
}

+ (NSValueTransformer *)triggerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceScalingTrigger class]];
}

@end

@implementation AWSelasticmapreduceScalingTrigger

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchAlarmDefinition" : @"CloudWatchAlarmDefinition",
             };
}

+ (NSValueTransformer *)cloudWatchAlarmDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceCloudWatchAlarmDefinition class]];
}

@end

@implementation AWSelasticmapreduceScriptBootstrapActionConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"args" : @"Args",
             @"path" : @"Path",
             };
}

@end

@implementation AWSelasticmapreduceSecurityConfigurationSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"CreationDateTime",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSelasticmapreduceSetTerminationProtectionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobFlowIds" : @"JobFlowIds",
             @"terminationProtected" : @"TerminationProtected",
             };
}

@end

@implementation AWSelasticmapreduceSetVisibleToAllUsersInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobFlowIds" : @"JobFlowIds",
             @"visibleToAllUsers" : @"VisibleToAllUsers",
             };
}

@end

@implementation AWSelasticmapreduceShrinkPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"decommissionTimeout" : @"DecommissionTimeout",
             @"instanceResizePolicy" : @"InstanceResizePolicy",
             };
}

+ (NSValueTransformer *)instanceResizePolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceInstanceResizePolicy class]];
}

@end

@implementation AWSelasticmapreduceSimpleScalingPolicyConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adjustmentType" : @"AdjustmentType",
             @"coolDown" : @"CoolDown",
             @"scalingAdjustment" : @"ScalingAdjustment",
             };
}

+ (NSValueTransformer *)adjustmentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CHANGE_IN_CAPACITY"] == NSOrderedSame) {
            return @(AWSelasticmapreduceAdjustmentTypeChangeInCapacity);
        }
        if ([value caseInsensitiveCompare:@"PERCENT_CHANGE_IN_CAPACITY"] == NSOrderedSame) {
            return @(AWSelasticmapreduceAdjustmentTypePercentChangeInCapacity);
        }
        if ([value caseInsensitiveCompare:@"EXACT_CAPACITY"] == NSOrderedSame) {
            return @(AWSelasticmapreduceAdjustmentTypeExactCapacity);
        }
        return @(AWSelasticmapreduceAdjustmentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceAdjustmentTypeChangeInCapacity:
                return @"CHANGE_IN_CAPACITY";
            case AWSelasticmapreduceAdjustmentTypePercentChangeInCapacity:
                return @"PERCENT_CHANGE_IN_CAPACITY";
            case AWSelasticmapreduceAdjustmentTypeExactCapacity:
                return @"EXACT_CAPACITY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticmapreduceSpotProvisioningSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockDurationMinutes" : @"BlockDurationMinutes",
             @"timeoutAction" : @"TimeoutAction",
             @"timeoutDurationMinutes" : @"TimeoutDurationMinutes",
             };
}

+ (NSValueTransformer *)timeoutActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SWITCH_TO_ON_DEMAND"] == NSOrderedSame) {
            return @(AWSelasticmapreduceSpotProvisioningTimeoutActionSwitchToOnDemand);
        }
        if ([value caseInsensitiveCompare:@"TERMINATE_CLUSTER"] == NSOrderedSame) {
            return @(AWSelasticmapreduceSpotProvisioningTimeoutActionTerminateCluster);
        }
        return @(AWSelasticmapreduceSpotProvisioningTimeoutActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceSpotProvisioningTimeoutActionSwitchToOnDemand:
                return @"SWITCH_TO_ON_DEMAND";
            case AWSelasticmapreduceSpotProvisioningTimeoutActionTerminateCluster:
                return @"TERMINATE_CLUSTER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticmapreduceStep

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionOnFailure" : @"ActionOnFailure",
             @"config" : @"Config",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)actionOnFailureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TERMINATE_JOB_FLOW"] == NSOrderedSame) {
            return @(AWSelasticmapreduceActionOnFailureTerminateJobFlow);
        }
        if ([value caseInsensitiveCompare:@"TERMINATE_CLUSTER"] == NSOrderedSame) {
            return @(AWSelasticmapreduceActionOnFailureTerminateCluster);
        }
        if ([value caseInsensitiveCompare:@"CANCEL_AND_WAIT"] == NSOrderedSame) {
            return @(AWSelasticmapreduceActionOnFailureCancelAndWait);
        }
        if ([value caseInsensitiveCompare:@"CONTINUE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceActionOnFailureContinue);
        }
        return @(AWSelasticmapreduceActionOnFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceActionOnFailureTerminateJobFlow:
                return @"TERMINATE_JOB_FLOW";
            case AWSelasticmapreduceActionOnFailureTerminateCluster:
                return @"TERMINATE_CLUSTER";
            case AWSelasticmapreduceActionOnFailureCancelAndWait:
                return @"CANCEL_AND_WAIT";
            case AWSelasticmapreduceActionOnFailureContinue:
                return @"CONTINUE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)configJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceHadoopStepConfig class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceStepStatus class]];
}

@end

@implementation AWSelasticmapreduceStepConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionOnFailure" : @"ActionOnFailure",
             @"hadoopJarStep" : @"HadoopJarStep",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)actionOnFailureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TERMINATE_JOB_FLOW"] == NSOrderedSame) {
            return @(AWSelasticmapreduceActionOnFailureTerminateJobFlow);
        }
        if ([value caseInsensitiveCompare:@"TERMINATE_CLUSTER"] == NSOrderedSame) {
            return @(AWSelasticmapreduceActionOnFailureTerminateCluster);
        }
        if ([value caseInsensitiveCompare:@"CANCEL_AND_WAIT"] == NSOrderedSame) {
            return @(AWSelasticmapreduceActionOnFailureCancelAndWait);
        }
        if ([value caseInsensitiveCompare:@"CONTINUE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceActionOnFailureContinue);
        }
        return @(AWSelasticmapreduceActionOnFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceActionOnFailureTerminateJobFlow:
                return @"TERMINATE_JOB_FLOW";
            case AWSelasticmapreduceActionOnFailureTerminateCluster:
                return @"TERMINATE_CLUSTER";
            case AWSelasticmapreduceActionOnFailureCancelAndWait:
                return @"CANCEL_AND_WAIT";
            case AWSelasticmapreduceActionOnFailureContinue:
                return @"CONTINUE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hadoopJarStepJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceHadoopJarStepConfig class]];
}

@end

@implementation AWSelasticmapreduceStepDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"executionStatusDetail" : @"ExecutionStatusDetail",
             @"stepConfig" : @"StepConfig",
             };
}

+ (NSValueTransformer *)executionStatusDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceStepExecutionStatusDetail class]];
}

+ (NSValueTransformer *)stepConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceStepConfig class]];
}

@end

@implementation AWSelasticmapreduceStepExecutionStatusDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"CreationDateTime",
             @"endDateTime" : @"EndDateTime",
             @"lastStateChangeReason" : @"LastStateChangeReason",
             @"startDateTime" : @"StartDateTime",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)endDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStepExecutionStatePending);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStepExecutionStateRunning);
        }
        if ([value caseInsensitiveCompare:@"CONTINUE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStepExecutionStateContinue);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStepExecutionStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStepExecutionStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStepExecutionStateFailed);
        }
        if ([value caseInsensitiveCompare:@"INTERRUPTED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStepExecutionStateInterrupted);
        }
        return @(AWSelasticmapreduceStepExecutionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceStepExecutionStatePending:
                return @"PENDING";
            case AWSelasticmapreduceStepExecutionStateRunning:
                return @"RUNNING";
            case AWSelasticmapreduceStepExecutionStateContinue:
                return @"CONTINUE";
            case AWSelasticmapreduceStepExecutionStateCompleted:
                return @"COMPLETED";
            case AWSelasticmapreduceStepExecutionStateCancelled:
                return @"CANCELLED";
            case AWSelasticmapreduceStepExecutionStateFailed:
                return @"FAILED";
            case AWSelasticmapreduceStepExecutionStateInterrupted:
                return @"INTERRUPTED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticmapreduceStepStateChangeReason

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStepStateChangeReasonCodeNone);
        }
        return @(AWSelasticmapreduceStepStateChangeReasonCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceStepStateChangeReasonCodeNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSelasticmapreduceStepStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failureDetails" : @"FailureDetails",
             @"state" : @"State",
             @"stateChangeReason" : @"StateChangeReason",
             @"timeline" : @"Timeline",
             };
}

+ (NSValueTransformer *)failureDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceFailureDetails class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStepStatePending);
        }
        if ([value caseInsensitiveCompare:@"CANCEL_PENDING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStepStateCancelPending);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStepStateRunning);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStepStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStepStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStepStateFailed);
        }
        if ([value caseInsensitiveCompare:@"INTERRUPTED"] == NSOrderedSame) {
            return @(AWSelasticmapreduceStepStateInterrupted);
        }
        return @(AWSelasticmapreduceStepStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceStepStatePending:
                return @"PENDING";
            case AWSelasticmapreduceStepStateCancelPending:
                return @"CANCEL_PENDING";
            case AWSelasticmapreduceStepStateRunning:
                return @"RUNNING";
            case AWSelasticmapreduceStepStateCompleted:
                return @"COMPLETED";
            case AWSelasticmapreduceStepStateCancelled:
                return @"CANCELLED";
            case AWSelasticmapreduceStepStateFailed:
                return @"FAILED";
            case AWSelasticmapreduceStepStateInterrupted:
                return @"INTERRUPTED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateChangeReasonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceStepStateChangeReason class]];
}

+ (NSValueTransformer *)timelineJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceStepTimeline class]];
}

@end

@implementation AWSelasticmapreduceStepSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionOnFailure" : @"ActionOnFailure",
             @"config" : @"Config",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)actionOnFailureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TERMINATE_JOB_FLOW"] == NSOrderedSame) {
            return @(AWSelasticmapreduceActionOnFailureTerminateJobFlow);
        }
        if ([value caseInsensitiveCompare:@"TERMINATE_CLUSTER"] == NSOrderedSame) {
            return @(AWSelasticmapreduceActionOnFailureTerminateCluster);
        }
        if ([value caseInsensitiveCompare:@"CANCEL_AND_WAIT"] == NSOrderedSame) {
            return @(AWSelasticmapreduceActionOnFailureCancelAndWait);
        }
        if ([value caseInsensitiveCompare:@"CONTINUE"] == NSOrderedSame) {
            return @(AWSelasticmapreduceActionOnFailureContinue);
        }
        return @(AWSelasticmapreduceActionOnFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSelasticmapreduceActionOnFailureTerminateJobFlow:
                return @"TERMINATE_JOB_FLOW";
            case AWSelasticmapreduceActionOnFailureTerminateCluster:
                return @"TERMINATE_CLUSTER";
            case AWSelasticmapreduceActionOnFailureCancelAndWait:
                return @"CANCEL_AND_WAIT";
            case AWSelasticmapreduceActionOnFailureContinue:
                return @"CONTINUE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)configJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceHadoopStepConfig class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSelasticmapreduceStepStatus class]];
}

@end

@implementation AWSelasticmapreduceStepTimeline

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"CreationDateTime",
             @"endDateTime" : @"EndDateTime",
             @"startDateTime" : @"StartDateTime",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)endDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSelasticmapreduceSupportedProductConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"args" : @"Args",
             @"name" : @"Name",
             };
}

@end

@implementation AWSelasticmapreduceTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSelasticmapreduceTerminateJobFlowsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobFlowIds" : @"JobFlowIds",
             };
}

@end

@implementation AWSelasticmapreduceVolumeSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"iops" : @"Iops",
             @"sizeInGB" : @"SizeInGB",
             @"volumeType" : @"VolumeType",
             };
}

@end
