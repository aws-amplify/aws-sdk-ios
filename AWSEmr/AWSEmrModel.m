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

#import "AWSEmrModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSEmrErrorDomain = @"com.amazonaws.AWSEmrErrorDomain";

@implementation AWSEmrAddInstanceFleetInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"instanceFleet" : @"InstanceFleet",
             };
}

+ (NSValueTransformer *)instanceFleetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrInstanceFleetConfig class]];
}

@end

@implementation AWSEmrAddInstanceFleetOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"clusterId" : @"ClusterId",
             @"instanceFleetId" : @"InstanceFleetId",
             };
}

@end

@implementation AWSEmrAddInstanceGroupsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceGroups" : @"InstanceGroups",
             @"jobFlowId" : @"JobFlowId",
             };
}

+ (NSValueTransformer *)instanceGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrInstanceGroupConfig class]];
}

@end

@implementation AWSEmrAddInstanceGroupsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"instanceGroupIds" : @"InstanceGroupIds",
             @"jobFlowId" : @"JobFlowId",
             };
}

@end

@implementation AWSEmrAddJobFlowStepsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobFlowId" : @"JobFlowId",
             @"steps" : @"Steps",
             };
}

+ (NSValueTransformer *)stepsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrStepConfig class]];
}

@end

@implementation AWSEmrAddJobFlowStepsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stepIds" : @"StepIds",
             };
}

@end

@implementation AWSEmrAddTagsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrTag class]];
}

@end

@implementation AWSEmrAddTagsOutput

@end

@implementation AWSEmrApplication

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalInfo" : @"AdditionalInfo",
             @"args" : @"Args",
             @"name" : @"Name",
             @"version" : @"Version",
             };
}

@end

@implementation AWSEmrAutoScalingPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constraints" : @"Constraints",
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)constraintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrScalingConstraints class]];
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrScalingRule class]];
}

@end

@implementation AWSEmrAutoScalingPolicyDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constraints" : @"Constraints",
             @"rules" : @"Rules",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)constraintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrScalingConstraints class]];
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrScalingRule class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrAutoScalingPolicyStatus class]];
}

@end

@implementation AWSEmrAutoScalingPolicyStateChangeReason

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USER_REQUEST"] == NSOrderedSame) {
            return @(AWSEmrAutoScalingPolicyStateChangeReasonCodeUserRequest);
        }
        if ([value caseInsensitiveCompare:@"PROVISION_FAILURE"] == NSOrderedSame) {
            return @(AWSEmrAutoScalingPolicyStateChangeReasonCodeProvisionFailure);
        }
        if ([value caseInsensitiveCompare:@"CLEANUP_FAILURE"] == NSOrderedSame) {
            return @(AWSEmrAutoScalingPolicyStateChangeReasonCodeCleanupFailure);
        }
        return @(AWSEmrAutoScalingPolicyStateChangeReasonCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrAutoScalingPolicyStateChangeReasonCodeUserRequest:
                return @"USER_REQUEST";
            case AWSEmrAutoScalingPolicyStateChangeReasonCodeProvisionFailure:
                return @"PROVISION_FAILURE";
            case AWSEmrAutoScalingPolicyStateChangeReasonCodeCleanupFailure:
                return @"CLEANUP_FAILURE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEmrAutoScalingPolicyStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"state" : @"State",
             @"stateChangeReason" : @"StateChangeReason",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSEmrAutoScalingPolicyStatePending);
        }
        if ([value caseInsensitiveCompare:@"ATTACHING"] == NSOrderedSame) {
            return @(AWSEmrAutoScalingPolicyStateAttaching);
        }
        if ([value caseInsensitiveCompare:@"ATTACHED"] == NSOrderedSame) {
            return @(AWSEmrAutoScalingPolicyStateAttached);
        }
        if ([value caseInsensitiveCompare:@"DETACHING"] == NSOrderedSame) {
            return @(AWSEmrAutoScalingPolicyStateDetaching);
        }
        if ([value caseInsensitiveCompare:@"DETACHED"] == NSOrderedSame) {
            return @(AWSEmrAutoScalingPolicyStateDetached);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSEmrAutoScalingPolicyStateFailed);
        }
        return @(AWSEmrAutoScalingPolicyStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrAutoScalingPolicyStatePending:
                return @"PENDING";
            case AWSEmrAutoScalingPolicyStateAttaching:
                return @"ATTACHING";
            case AWSEmrAutoScalingPolicyStateAttached:
                return @"ATTACHED";
            case AWSEmrAutoScalingPolicyStateDetaching:
                return @"DETACHING";
            case AWSEmrAutoScalingPolicyStateDetached:
                return @"DETACHED";
            case AWSEmrAutoScalingPolicyStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateChangeReasonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrAutoScalingPolicyStateChangeReason class]];
}

@end

@implementation AWSEmrBlockPublicAccessConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockPublicSecurityGroupRules" : @"BlockPublicSecurityGroupRules",
             @"permittedPublicSecurityGroupRuleRanges" : @"PermittedPublicSecurityGroupRuleRanges",
             };
}

+ (NSValueTransformer *)permittedPublicSecurityGroupRuleRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrPortRange class]];
}

@end

@implementation AWSEmrBlockPublicAccessConfigurationMetadata

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

@implementation AWSEmrBootstrapActionConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"scriptBootstrapAction" : @"ScriptBootstrapAction",
             };
}

+ (NSValueTransformer *)scriptBootstrapActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrScriptBootstrapActionConfig class]];
}

@end

@implementation AWSEmrBootstrapActionDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bootstrapActionConfig" : @"BootstrapActionConfig",
             };
}

+ (NSValueTransformer *)bootstrapActionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrBootstrapActionConfig class]];
}

@end

@implementation AWSEmrCancelStepsInfo

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
            return @(AWSEmrCancelStepsRequestStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSEmrCancelStepsRequestStatusFailed);
        }
        return @(AWSEmrCancelStepsRequestStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrCancelStepsRequestStatusSubmitted:
                return @"SUBMITTED";
            case AWSEmrCancelStepsRequestStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEmrCancelStepsInput

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
            return @(AWSEmrStepCancellationOptionSendInterrupt);
        }
        if ([value caseInsensitiveCompare:@"TERMINATE_PROCESS"] == NSOrderedSame) {
            return @(AWSEmrStepCancellationOptionTerminateProcess);
        }
        return @(AWSEmrStepCancellationOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrStepCancellationOptionSendInterrupt:
                return @"SEND_INTERRUPT";
            case AWSEmrStepCancellationOptionTerminateProcess:
                return @"TERMINATE_PROCESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEmrCancelStepsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cancelStepsInfoList" : @"CancelStepsInfoList",
             };
}

+ (NSValueTransformer *)cancelStepsInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrCancelStepsInfo class]];
}

@end

@implementation AWSEmrCloudWatchAlarmDefinition

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
            return @(AWSEmrComparisonOperatorGreaterThanOrEqual);
        }
        if ([value caseInsensitiveCompare:@"GREATER_THAN"] == NSOrderedSame) {
            return @(AWSEmrComparisonOperatorGreaterThan);
        }
        if ([value caseInsensitiveCompare:@"LESS_THAN"] == NSOrderedSame) {
            return @(AWSEmrComparisonOperatorLessThan);
        }
        if ([value caseInsensitiveCompare:@"LESS_THAN_OR_EQUAL"] == NSOrderedSame) {
            return @(AWSEmrComparisonOperatorLessThanOrEqual);
        }
        return @(AWSEmrComparisonOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrComparisonOperatorGreaterThanOrEqual:
                return @"GREATER_THAN_OR_EQUAL";
            case AWSEmrComparisonOperatorGreaterThan:
                return @"GREATER_THAN";
            case AWSEmrComparisonOperatorLessThan:
                return @"LESS_THAN";
            case AWSEmrComparisonOperatorLessThanOrEqual:
                return @"LESS_THAN_OR_EQUAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrMetricDimension class]];
}

+ (NSValueTransformer *)statisticJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SAMPLE_COUNT"] == NSOrderedSame) {
            return @(AWSEmrStatisticSampleCount);
        }
        if ([value caseInsensitiveCompare:@"AVERAGE"] == NSOrderedSame) {
            return @(AWSEmrStatisticAverage);
        }
        if ([value caseInsensitiveCompare:@"SUM"] == NSOrderedSame) {
            return @(AWSEmrStatisticSum);
        }
        if ([value caseInsensitiveCompare:@"MINIMUM"] == NSOrderedSame) {
            return @(AWSEmrStatisticMinimum);
        }
        if ([value caseInsensitiveCompare:@"MAXIMUM"] == NSOrderedSame) {
            return @(AWSEmrStatisticMaximum);
        }
        return @(AWSEmrStatisticUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrStatisticSampleCount:
                return @"SAMPLE_COUNT";
            case AWSEmrStatisticAverage:
                return @"AVERAGE";
            case AWSEmrStatisticSum:
                return @"SUM";
            case AWSEmrStatisticMinimum:
                return @"MINIMUM";
            case AWSEmrStatisticMaximum:
                return @"MAXIMUM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSEmrUnitNone);
        }
        if ([value caseInsensitiveCompare:@"SECONDS"] == NSOrderedSame) {
            return @(AWSEmrUnitSeconds);
        }
        if ([value caseInsensitiveCompare:@"MICRO_SECONDS"] == NSOrderedSame) {
            return @(AWSEmrUnitMicroSeconds);
        }
        if ([value caseInsensitiveCompare:@"MILLI_SECONDS"] == NSOrderedSame) {
            return @(AWSEmrUnitMilliSeconds);
        }
        if ([value caseInsensitiveCompare:@"BYTES"] == NSOrderedSame) {
            return @(AWSEmrUnitBytes);
        }
        if ([value caseInsensitiveCompare:@"KILO_BYTES"] == NSOrderedSame) {
            return @(AWSEmrUnitKiloBytes);
        }
        if ([value caseInsensitiveCompare:@"MEGA_BYTES"] == NSOrderedSame) {
            return @(AWSEmrUnitMegaBytes);
        }
        if ([value caseInsensitiveCompare:@"GIGA_BYTES"] == NSOrderedSame) {
            return @(AWSEmrUnitGigaBytes);
        }
        if ([value caseInsensitiveCompare:@"TERA_BYTES"] == NSOrderedSame) {
            return @(AWSEmrUnitTeraBytes);
        }
        if ([value caseInsensitiveCompare:@"BITS"] == NSOrderedSame) {
            return @(AWSEmrUnitBits);
        }
        if ([value caseInsensitiveCompare:@"KILO_BITS"] == NSOrderedSame) {
            return @(AWSEmrUnitKiloBits);
        }
        if ([value caseInsensitiveCompare:@"MEGA_BITS"] == NSOrderedSame) {
            return @(AWSEmrUnitMegaBits);
        }
        if ([value caseInsensitiveCompare:@"GIGA_BITS"] == NSOrderedSame) {
            return @(AWSEmrUnitGigaBits);
        }
        if ([value caseInsensitiveCompare:@"TERA_BITS"] == NSOrderedSame) {
            return @(AWSEmrUnitTeraBits);
        }
        if ([value caseInsensitiveCompare:@"PERCENT"] == NSOrderedSame) {
            return @(AWSEmrUnitPercent);
        }
        if ([value caseInsensitiveCompare:@"COUNT"] == NSOrderedSame) {
            return @(AWSEmrUnitCount);
        }
        if ([value caseInsensitiveCompare:@"BYTES_PER_SECOND"] == NSOrderedSame) {
            return @(AWSEmrUnitBytesPerSecond);
        }
        if ([value caseInsensitiveCompare:@"KILO_BYTES_PER_SECOND"] == NSOrderedSame) {
            return @(AWSEmrUnitKiloBytesPerSecond);
        }
        if ([value caseInsensitiveCompare:@"MEGA_BYTES_PER_SECOND"] == NSOrderedSame) {
            return @(AWSEmrUnitMegaBytesPerSecond);
        }
        if ([value caseInsensitiveCompare:@"GIGA_BYTES_PER_SECOND"] == NSOrderedSame) {
            return @(AWSEmrUnitGigaBytesPerSecond);
        }
        if ([value caseInsensitiveCompare:@"TERA_BYTES_PER_SECOND"] == NSOrderedSame) {
            return @(AWSEmrUnitTeraBytesPerSecond);
        }
        if ([value caseInsensitiveCompare:@"BITS_PER_SECOND"] == NSOrderedSame) {
            return @(AWSEmrUnitBitsPerSecond);
        }
        if ([value caseInsensitiveCompare:@"KILO_BITS_PER_SECOND"] == NSOrderedSame) {
            return @(AWSEmrUnitKiloBitsPerSecond);
        }
        if ([value caseInsensitiveCompare:@"MEGA_BITS_PER_SECOND"] == NSOrderedSame) {
            return @(AWSEmrUnitMegaBitsPerSecond);
        }
        if ([value caseInsensitiveCompare:@"GIGA_BITS_PER_SECOND"] == NSOrderedSame) {
            return @(AWSEmrUnitGigaBitsPerSecond);
        }
        if ([value caseInsensitiveCompare:@"TERA_BITS_PER_SECOND"] == NSOrderedSame) {
            return @(AWSEmrUnitTeraBitsPerSecond);
        }
        if ([value caseInsensitiveCompare:@"COUNT_PER_SECOND"] == NSOrderedSame) {
            return @(AWSEmrUnitCountPerSecond);
        }
        return @(AWSEmrUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrUnitNone:
                return @"NONE";
            case AWSEmrUnitSeconds:
                return @"SECONDS";
            case AWSEmrUnitMicroSeconds:
                return @"MICRO_SECONDS";
            case AWSEmrUnitMilliSeconds:
                return @"MILLI_SECONDS";
            case AWSEmrUnitBytes:
                return @"BYTES";
            case AWSEmrUnitKiloBytes:
                return @"KILO_BYTES";
            case AWSEmrUnitMegaBytes:
                return @"MEGA_BYTES";
            case AWSEmrUnitGigaBytes:
                return @"GIGA_BYTES";
            case AWSEmrUnitTeraBytes:
                return @"TERA_BYTES";
            case AWSEmrUnitBits:
                return @"BITS";
            case AWSEmrUnitKiloBits:
                return @"KILO_BITS";
            case AWSEmrUnitMegaBits:
                return @"MEGA_BITS";
            case AWSEmrUnitGigaBits:
                return @"GIGA_BITS";
            case AWSEmrUnitTeraBits:
                return @"TERA_BITS";
            case AWSEmrUnitPercent:
                return @"PERCENT";
            case AWSEmrUnitCount:
                return @"COUNT";
            case AWSEmrUnitBytesPerSecond:
                return @"BYTES_PER_SECOND";
            case AWSEmrUnitKiloBytesPerSecond:
                return @"KILO_BYTES_PER_SECOND";
            case AWSEmrUnitMegaBytesPerSecond:
                return @"MEGA_BYTES_PER_SECOND";
            case AWSEmrUnitGigaBytesPerSecond:
                return @"GIGA_BYTES_PER_SECOND";
            case AWSEmrUnitTeraBytesPerSecond:
                return @"TERA_BYTES_PER_SECOND";
            case AWSEmrUnitBitsPerSecond:
                return @"BITS_PER_SECOND";
            case AWSEmrUnitKiloBitsPerSecond:
                return @"KILO_BITS_PER_SECOND";
            case AWSEmrUnitMegaBitsPerSecond:
                return @"MEGA_BITS_PER_SECOND";
            case AWSEmrUnitGigaBitsPerSecond:
                return @"GIGA_BITS_PER_SECOND";
            case AWSEmrUnitTeraBitsPerSecond:
                return @"TERA_BITS_PER_SECOND";
            case AWSEmrUnitCountPerSecond:
                return @"COUNT_PER_SECOND";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEmrCluster

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
             @"logEncryptionKmsKeyId" : @"LogEncryptionKmsKeyId",
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrApplication class]];
}

+ (NSValueTransformer *)configurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrConfiguration class]];
}

+ (NSValueTransformer *)ec2InstanceAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrEc2InstanceAttributes class]];
}

+ (NSValueTransformer *)instanceCollectionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSTANCE_FLEET"] == NSOrderedSame) {
            return @(AWSEmrInstanceCollectionTypeInstanceFleet);
        }
        if ([value caseInsensitiveCompare:@"INSTANCE_GROUP"] == NSOrderedSame) {
            return @(AWSEmrInstanceCollectionTypeInstanceGroup);
        }
        return @(AWSEmrInstanceCollectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrInstanceCollectionTypeInstanceFleet:
                return @"INSTANCE_FLEET";
            case AWSEmrInstanceCollectionTypeInstanceGroup:
                return @"INSTANCE_GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)kerberosAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrKerberosAttributes class]];
}

+ (NSValueTransformer *)repoUpgradeOnBootJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECURITY"] == NSOrderedSame) {
            return @(AWSEmrRepoUpgradeOnBootSecurity);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSEmrRepoUpgradeOnBootNone);
        }
        return @(AWSEmrRepoUpgradeOnBootUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrRepoUpgradeOnBootSecurity:
                return @"SECURITY";
            case AWSEmrRepoUpgradeOnBootNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scaleDownBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TERMINATE_AT_INSTANCE_HOUR"] == NSOrderedSame) {
            return @(AWSEmrScaleDownBehaviorTerminateAtInstanceHour);
        }
        if ([value caseInsensitiveCompare:@"TERMINATE_AT_TASK_COMPLETION"] == NSOrderedSame) {
            return @(AWSEmrScaleDownBehaviorTerminateAtTaskCompletion);
        }
        return @(AWSEmrScaleDownBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrScaleDownBehaviorTerminateAtInstanceHour:
                return @"TERMINATE_AT_INSTANCE_HOUR";
            case AWSEmrScaleDownBehaviorTerminateAtTaskCompletion:
                return @"TERMINATE_AT_TASK_COMPLETION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrClusterStatus class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrTag class]];
}

@end

@implementation AWSEmrClusterStateChangeReason

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERNAL_ERROR"] == NSOrderedSame) {
            return @(AWSEmrClusterStateChangeReasonCodeInternalError);
        }
        if ([value caseInsensitiveCompare:@"VALIDATION_ERROR"] == NSOrderedSame) {
            return @(AWSEmrClusterStateChangeReasonCodeValidationError);
        }
        if ([value caseInsensitiveCompare:@"INSTANCE_FAILURE"] == NSOrderedSame) {
            return @(AWSEmrClusterStateChangeReasonCodeInstanceFailure);
        }
        if ([value caseInsensitiveCompare:@"INSTANCE_FLEET_TIMEOUT"] == NSOrderedSame) {
            return @(AWSEmrClusterStateChangeReasonCodeInstanceFleetTimeout);
        }
        if ([value caseInsensitiveCompare:@"BOOTSTRAP_FAILURE"] == NSOrderedSame) {
            return @(AWSEmrClusterStateChangeReasonCodeBootstrapFailure);
        }
        if ([value caseInsensitiveCompare:@"USER_REQUEST"] == NSOrderedSame) {
            return @(AWSEmrClusterStateChangeReasonCodeUserRequest);
        }
        if ([value caseInsensitiveCompare:@"STEP_FAILURE"] == NSOrderedSame) {
            return @(AWSEmrClusterStateChangeReasonCodeStepFailure);
        }
        if ([value caseInsensitiveCompare:@"ALL_STEPS_COMPLETED"] == NSOrderedSame) {
            return @(AWSEmrClusterStateChangeReasonCodeAllStepsCompleted);
        }
        return @(AWSEmrClusterStateChangeReasonCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrClusterStateChangeReasonCodeInternalError:
                return @"INTERNAL_ERROR";
            case AWSEmrClusterStateChangeReasonCodeValidationError:
                return @"VALIDATION_ERROR";
            case AWSEmrClusterStateChangeReasonCodeInstanceFailure:
                return @"INSTANCE_FAILURE";
            case AWSEmrClusterStateChangeReasonCodeInstanceFleetTimeout:
                return @"INSTANCE_FLEET_TIMEOUT";
            case AWSEmrClusterStateChangeReasonCodeBootstrapFailure:
                return @"BOOTSTRAP_FAILURE";
            case AWSEmrClusterStateChangeReasonCodeUserRequest:
                return @"USER_REQUEST";
            case AWSEmrClusterStateChangeReasonCodeStepFailure:
                return @"STEP_FAILURE";
            case AWSEmrClusterStateChangeReasonCodeAllStepsCompleted:
                return @"ALL_STEPS_COMPLETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEmrClusterStatus

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
            return @(AWSEmrClusterStateStarting);
        }
        if ([value caseInsensitiveCompare:@"BOOTSTRAPPING"] == NSOrderedSame) {
            return @(AWSEmrClusterStateBootstrapping);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSEmrClusterStateRunning);
        }
        if ([value caseInsensitiveCompare:@"WAITING"] == NSOrderedSame) {
            return @(AWSEmrClusterStateWaiting);
        }
        if ([value caseInsensitiveCompare:@"TERMINATING"] == NSOrderedSame) {
            return @(AWSEmrClusterStateTerminating);
        }
        if ([value caseInsensitiveCompare:@"TERMINATED"] == NSOrderedSame) {
            return @(AWSEmrClusterStateTerminated);
        }
        if ([value caseInsensitiveCompare:@"TERMINATED_WITH_ERRORS"] == NSOrderedSame) {
            return @(AWSEmrClusterStateTerminatedWithErrors);
        }
        return @(AWSEmrClusterStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrClusterStateStarting:
                return @"STARTING";
            case AWSEmrClusterStateBootstrapping:
                return @"BOOTSTRAPPING";
            case AWSEmrClusterStateRunning:
                return @"RUNNING";
            case AWSEmrClusterStateWaiting:
                return @"WAITING";
            case AWSEmrClusterStateTerminating:
                return @"TERMINATING";
            case AWSEmrClusterStateTerminated:
                return @"TERMINATED";
            case AWSEmrClusterStateTerminatedWithErrors:
                return @"TERMINATED_WITH_ERRORS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateChangeReasonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrClusterStateChangeReason class]];
}

+ (NSValueTransformer *)timelineJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrClusterTimeline class]];
}

@end

@implementation AWSEmrClusterSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrClusterStatus class]];
}

@end

@implementation AWSEmrClusterTimeline

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

@implementation AWSEmrCommand

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"args" : @"Args",
             @"name" : @"Name",
             @"scriptPath" : @"ScriptPath",
             };
}

@end

@implementation AWSEmrComputeLimits

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
            return @(AWSEmrComputeLimitsUnitTypeInstanceFleetUnits);
        }
        if ([value caseInsensitiveCompare:@"Instances"] == NSOrderedSame) {
            return @(AWSEmrComputeLimitsUnitTypeInstances);
        }
        if ([value caseInsensitiveCompare:@"VCPU"] == NSOrderedSame) {
            return @(AWSEmrComputeLimitsUnitTypeVcpu);
        }
        return @(AWSEmrComputeLimitsUnitTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrComputeLimitsUnitTypeInstanceFleetUnits:
                return @"InstanceFleetUnits";
            case AWSEmrComputeLimitsUnitTypeInstances:
                return @"Instances";
            case AWSEmrComputeLimitsUnitTypeVcpu:
                return @"VCPU";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEmrConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classification" : @"Classification",
             @"configurations" : @"Configurations",
             @"properties" : @"Properties",
             };
}

+ (NSValueTransformer *)configurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrConfiguration class]];
}

@end

@implementation AWSEmrCreateSecurityConfigurationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"securityConfiguration" : @"SecurityConfiguration",
             };
}

@end

@implementation AWSEmrCreateSecurityConfigurationOutput

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

@implementation AWSEmrDeleteSecurityConfigurationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSEmrDeleteSecurityConfigurationOutput

@end

@implementation AWSEmrDescribeClusterInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             };
}

@end

@implementation AWSEmrDescribeClusterOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cluster" : @"Cluster",
             };
}

+ (NSValueTransformer *)clusterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrCluster class]];
}

@end

@implementation AWSEmrDescribeJobFlowsInput

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

@implementation AWSEmrDescribeJobFlowsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobFlows" : @"JobFlows",
             };
}

+ (NSValueTransformer *)jobFlowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrJobFlowDetail class]];
}

@end

@implementation AWSEmrDescribeSecurityConfigurationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSEmrDescribeSecurityConfigurationOutput

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

@implementation AWSEmrDescribeStepInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"stepId" : @"StepId",
             };
}

@end

@implementation AWSEmrDescribeStepOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"step" : @"Step",
             };
}

+ (NSValueTransformer *)stepJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrStep class]];
}

@end

@implementation AWSEmrEbsBlockDevice

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"device" : @"Device",
             @"volumeSpecification" : @"VolumeSpecification",
             };
}

+ (NSValueTransformer *)volumeSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrVolumeSpecification class]];
}

@end

@implementation AWSEmrEbsBlockDeviceConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeSpecification" : @"VolumeSpecification",
             @"volumesPerInstance" : @"VolumesPerInstance",
             };
}

+ (NSValueTransformer *)volumeSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrVolumeSpecification class]];
}

@end

@implementation AWSEmrEbsConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ebsBlockDeviceConfigs" : @"EbsBlockDeviceConfigs",
             @"ebsOptimized" : @"EbsOptimized",
             };
}

+ (NSValueTransformer *)ebsBlockDeviceConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrEbsBlockDeviceConfig class]];
}

@end

@implementation AWSEmrEbsVolume

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"device" : @"Device",
             @"volumeId" : @"VolumeId",
             };
}

@end

@implementation AWSEmrEc2InstanceAttributes

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

@implementation AWSEmrFailureDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logFile" : @"LogFile",
             @"message" : @"Message",
             @"reason" : @"Reason",
             };
}

@end

@implementation AWSEmrGetBlockPublicAccessConfigurationInput

@end

@implementation AWSEmrGetBlockPublicAccessConfigurationOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockPublicAccessConfiguration" : @"BlockPublicAccessConfiguration",
             @"blockPublicAccessConfigurationMetadata" : @"BlockPublicAccessConfigurationMetadata",
             };
}

+ (NSValueTransformer *)blockPublicAccessConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrBlockPublicAccessConfiguration class]];
}

+ (NSValueTransformer *)blockPublicAccessConfigurationMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrBlockPublicAccessConfigurationMetadata class]];
}

@end

@implementation AWSEmrGetManagedScalingPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             };
}

@end

@implementation AWSEmrGetManagedScalingPolicyOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"managedScalingPolicy" : @"ManagedScalingPolicy",
             };
}

+ (NSValueTransformer *)managedScalingPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrManagedScalingPolicy class]];
}

@end

@implementation AWSEmrHadoopJarStepConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"args" : @"Args",
             @"jar" : @"Jar",
             @"mainClass" : @"MainClass",
             @"properties" : @"Properties",
             };
}

+ (NSValueTransformer *)propertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrKeyValue class]];
}

@end

@implementation AWSEmrHadoopStepConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"args" : @"Args",
             @"jar" : @"Jar",
             @"mainClass" : @"MainClass",
             @"properties" : @"Properties",
             };
}

@end

@implementation AWSEmrInstance

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrEbsVolume class]];
}

+ (NSValueTransformer *)marketJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSEmrMarketTypeOnDemand);
        }
        if ([value caseInsensitiveCompare:@"SPOT"] == NSOrderedSame) {
            return @(AWSEmrMarketTypeSpot);
        }
        return @(AWSEmrMarketTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrMarketTypeOnDemand:
                return @"ON_DEMAND";
            case AWSEmrMarketTypeSpot:
                return @"SPOT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrInstanceStatus class]];
}

@end

@implementation AWSEmrInstanceFleet

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
            return @(AWSEmrInstanceFleetTypeMaster);
        }
        if ([value caseInsensitiveCompare:@"CORE"] == NSOrderedSame) {
            return @(AWSEmrInstanceFleetTypeCore);
        }
        if ([value caseInsensitiveCompare:@"TASK"] == NSOrderedSame) {
            return @(AWSEmrInstanceFleetTypeTask);
        }
        return @(AWSEmrInstanceFleetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrInstanceFleetTypeMaster:
                return @"MASTER";
            case AWSEmrInstanceFleetTypeCore:
                return @"CORE";
            case AWSEmrInstanceFleetTypeTask:
                return @"TASK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeSpecificationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrInstanceTypeSpecification class]];
}

+ (NSValueTransformer *)launchSpecificationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrInstanceFleetProvisioningSpecifications class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrInstanceFleetStatus class]];
}

@end

@implementation AWSEmrInstanceFleetConfig

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
            return @(AWSEmrInstanceFleetTypeMaster);
        }
        if ([value caseInsensitiveCompare:@"CORE"] == NSOrderedSame) {
            return @(AWSEmrInstanceFleetTypeCore);
        }
        if ([value caseInsensitiveCompare:@"TASK"] == NSOrderedSame) {
            return @(AWSEmrInstanceFleetTypeTask);
        }
        return @(AWSEmrInstanceFleetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrInstanceFleetTypeMaster:
                return @"MASTER";
            case AWSEmrInstanceFleetTypeCore:
                return @"CORE";
            case AWSEmrInstanceFleetTypeTask:
                return @"TASK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrInstanceTypeConfig class]];
}

+ (NSValueTransformer *)launchSpecificationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrInstanceFleetProvisioningSpecifications class]];
}

@end

@implementation AWSEmrInstanceFleetModifyConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceFleetId" : @"InstanceFleetId",
             @"targetOnDemandCapacity" : @"TargetOnDemandCapacity",
             @"targetSpotCapacity" : @"TargetSpotCapacity",
             };
}

@end

@implementation AWSEmrInstanceFleetProvisioningSpecifications

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"spotSpecification" : @"SpotSpecification",
             };
}

+ (NSValueTransformer *)spotSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrSpotProvisioningSpecification class]];
}

@end

@implementation AWSEmrInstanceFleetStateChangeReason

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERNAL_ERROR"] == NSOrderedSame) {
            return @(AWSEmrInstanceFleetStateChangeReasonCodeInternalError);
        }
        if ([value caseInsensitiveCompare:@"VALIDATION_ERROR"] == NSOrderedSame) {
            return @(AWSEmrInstanceFleetStateChangeReasonCodeValidationError);
        }
        if ([value caseInsensitiveCompare:@"INSTANCE_FAILURE"] == NSOrderedSame) {
            return @(AWSEmrInstanceFleetStateChangeReasonCodeInstanceFailure);
        }
        if ([value caseInsensitiveCompare:@"CLUSTER_TERMINATED"] == NSOrderedSame) {
            return @(AWSEmrInstanceFleetStateChangeReasonCodeClusterTerminated);
        }
        return @(AWSEmrInstanceFleetStateChangeReasonCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrInstanceFleetStateChangeReasonCodeInternalError:
                return @"INTERNAL_ERROR";
            case AWSEmrInstanceFleetStateChangeReasonCodeValidationError:
                return @"VALIDATION_ERROR";
            case AWSEmrInstanceFleetStateChangeReasonCodeInstanceFailure:
                return @"INSTANCE_FAILURE";
            case AWSEmrInstanceFleetStateChangeReasonCodeClusterTerminated:
                return @"CLUSTER_TERMINATED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEmrInstanceFleetStatus

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
            return @(AWSEmrInstanceFleetStateProvisioning);
        }
        if ([value caseInsensitiveCompare:@"BOOTSTRAPPING"] == NSOrderedSame) {
            return @(AWSEmrInstanceFleetStateBootstrapping);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSEmrInstanceFleetStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RESIZING"] == NSOrderedSame) {
            return @(AWSEmrInstanceFleetStateResizing);
        }
        if ([value caseInsensitiveCompare:@"SUSPENDED"] == NSOrderedSame) {
            return @(AWSEmrInstanceFleetStateSuspended);
        }
        if ([value caseInsensitiveCompare:@"TERMINATING"] == NSOrderedSame) {
            return @(AWSEmrInstanceFleetStateTerminating);
        }
        if ([value caseInsensitiveCompare:@"TERMINATED"] == NSOrderedSame) {
            return @(AWSEmrInstanceFleetStateTerminated);
        }
        return @(AWSEmrInstanceFleetStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrInstanceFleetStateProvisioning:
                return @"PROVISIONING";
            case AWSEmrInstanceFleetStateBootstrapping:
                return @"BOOTSTRAPPING";
            case AWSEmrInstanceFleetStateRunning:
                return @"RUNNING";
            case AWSEmrInstanceFleetStateResizing:
                return @"RESIZING";
            case AWSEmrInstanceFleetStateSuspended:
                return @"SUSPENDED";
            case AWSEmrInstanceFleetStateTerminating:
                return @"TERMINATING";
            case AWSEmrInstanceFleetStateTerminated:
                return @"TERMINATED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateChangeReasonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrInstanceFleetStateChangeReason class]];
}

+ (NSValueTransformer *)timelineJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrInstanceFleetTimeline class]];
}

@end

@implementation AWSEmrInstanceFleetTimeline

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

@implementation AWSEmrInstanceGroup

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrAutoScalingPolicyDescription class]];
}

+ (NSValueTransformer *)configurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrConfiguration class]];
}

+ (NSValueTransformer *)ebsBlockDevicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrEbsBlockDevice class]];
}

+ (NSValueTransformer *)instanceGroupTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MASTER"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupTypeMaster);
        }
        if ([value caseInsensitiveCompare:@"CORE"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupTypeCore);
        }
        if ([value caseInsensitiveCompare:@"TASK"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupTypeTask);
        }
        return @(AWSEmrInstanceGroupTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrInstanceGroupTypeMaster:
                return @"MASTER";
            case AWSEmrInstanceGroupTypeCore:
                return @"CORE";
            case AWSEmrInstanceGroupTypeTask:
                return @"TASK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastSuccessfullyAppliedConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrConfiguration class]];
}

+ (NSValueTransformer *)marketJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSEmrMarketTypeOnDemand);
        }
        if ([value caseInsensitiveCompare:@"SPOT"] == NSOrderedSame) {
            return @(AWSEmrMarketTypeSpot);
        }
        return @(AWSEmrMarketTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrMarketTypeOnDemand:
                return @"ON_DEMAND";
            case AWSEmrMarketTypeSpot:
                return @"SPOT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)shrinkPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrShrinkPolicy class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrInstanceGroupStatus class]];
}

@end

@implementation AWSEmrInstanceGroupConfig

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrAutoScalingPolicy class]];
}

+ (NSValueTransformer *)configurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrConfiguration class]];
}

+ (NSValueTransformer *)ebsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrEbsConfiguration class]];
}

+ (NSValueTransformer *)instanceRoleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MASTER"] == NSOrderedSame) {
            return @(AWSEmrInstanceRoleTypeMaster);
        }
        if ([value caseInsensitiveCompare:@"CORE"] == NSOrderedSame) {
            return @(AWSEmrInstanceRoleTypeCore);
        }
        if ([value caseInsensitiveCompare:@"TASK"] == NSOrderedSame) {
            return @(AWSEmrInstanceRoleTypeTask);
        }
        return @(AWSEmrInstanceRoleTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrInstanceRoleTypeMaster:
                return @"MASTER";
            case AWSEmrInstanceRoleTypeCore:
                return @"CORE";
            case AWSEmrInstanceRoleTypeTask:
                return @"TASK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)marketJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSEmrMarketTypeOnDemand);
        }
        if ([value caseInsensitiveCompare:@"SPOT"] == NSOrderedSame) {
            return @(AWSEmrMarketTypeSpot);
        }
        return @(AWSEmrMarketTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrMarketTypeOnDemand:
                return @"ON_DEMAND";
            case AWSEmrMarketTypeSpot:
                return @"SPOT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEmrInstanceGroupDetail

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
            return @(AWSEmrInstanceRoleTypeMaster);
        }
        if ([value caseInsensitiveCompare:@"CORE"] == NSOrderedSame) {
            return @(AWSEmrInstanceRoleTypeCore);
        }
        if ([value caseInsensitiveCompare:@"TASK"] == NSOrderedSame) {
            return @(AWSEmrInstanceRoleTypeTask);
        }
        return @(AWSEmrInstanceRoleTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrInstanceRoleTypeMaster:
                return @"MASTER";
            case AWSEmrInstanceRoleTypeCore:
                return @"CORE";
            case AWSEmrInstanceRoleTypeTask:
                return @"TASK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)marketJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSEmrMarketTypeOnDemand);
        }
        if ([value caseInsensitiveCompare:@"SPOT"] == NSOrderedSame) {
            return @(AWSEmrMarketTypeSpot);
        }
        return @(AWSEmrMarketTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrMarketTypeOnDemand:
                return @"ON_DEMAND";
            case AWSEmrMarketTypeSpot:
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
            return @(AWSEmrInstanceGroupStateProvisioning);
        }
        if ([value caseInsensitiveCompare:@"BOOTSTRAPPING"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateBootstrapping);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECONFIGURING"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateReconfiguring);
        }
        if ([value caseInsensitiveCompare:@"RESIZING"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateResizing);
        }
        if ([value caseInsensitiveCompare:@"SUSPENDED"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateSuspended);
        }
        if ([value caseInsensitiveCompare:@"TERMINATING"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateTerminating);
        }
        if ([value caseInsensitiveCompare:@"TERMINATED"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateTerminated);
        }
        if ([value caseInsensitiveCompare:@"ARRESTED"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateArrested);
        }
        if ([value caseInsensitiveCompare:@"SHUTTING_DOWN"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateShuttingDown);
        }
        if ([value caseInsensitiveCompare:@"ENDED"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateEnded);
        }
        return @(AWSEmrInstanceGroupStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrInstanceGroupStateProvisioning:
                return @"PROVISIONING";
            case AWSEmrInstanceGroupStateBootstrapping:
                return @"BOOTSTRAPPING";
            case AWSEmrInstanceGroupStateRunning:
                return @"RUNNING";
            case AWSEmrInstanceGroupStateReconfiguring:
                return @"RECONFIGURING";
            case AWSEmrInstanceGroupStateResizing:
                return @"RESIZING";
            case AWSEmrInstanceGroupStateSuspended:
                return @"SUSPENDED";
            case AWSEmrInstanceGroupStateTerminating:
                return @"TERMINATING";
            case AWSEmrInstanceGroupStateTerminated:
                return @"TERMINATED";
            case AWSEmrInstanceGroupStateArrested:
                return @"ARRESTED";
            case AWSEmrInstanceGroupStateShuttingDown:
                return @"SHUTTING_DOWN";
            case AWSEmrInstanceGroupStateEnded:
                return @"ENDED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEmrInstanceGroupModifyConfig

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrConfiguration class]];
}

+ (NSValueTransformer *)shrinkPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrShrinkPolicy class]];
}

@end

@implementation AWSEmrInstanceGroupStateChangeReason

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERNAL_ERROR"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateChangeReasonCodeInternalError);
        }
        if ([value caseInsensitiveCompare:@"VALIDATION_ERROR"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateChangeReasonCodeValidationError);
        }
        if ([value caseInsensitiveCompare:@"INSTANCE_FAILURE"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateChangeReasonCodeInstanceFailure);
        }
        if ([value caseInsensitiveCompare:@"CLUSTER_TERMINATED"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateChangeReasonCodeClusterTerminated);
        }
        return @(AWSEmrInstanceGroupStateChangeReasonCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrInstanceGroupStateChangeReasonCodeInternalError:
                return @"INTERNAL_ERROR";
            case AWSEmrInstanceGroupStateChangeReasonCodeValidationError:
                return @"VALIDATION_ERROR";
            case AWSEmrInstanceGroupStateChangeReasonCodeInstanceFailure:
                return @"INSTANCE_FAILURE";
            case AWSEmrInstanceGroupStateChangeReasonCodeClusterTerminated:
                return @"CLUSTER_TERMINATED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEmrInstanceGroupStatus

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
            return @(AWSEmrInstanceGroupStateProvisioning);
        }
        if ([value caseInsensitiveCompare:@"BOOTSTRAPPING"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateBootstrapping);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECONFIGURING"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateReconfiguring);
        }
        if ([value caseInsensitiveCompare:@"RESIZING"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateResizing);
        }
        if ([value caseInsensitiveCompare:@"SUSPENDED"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateSuspended);
        }
        if ([value caseInsensitiveCompare:@"TERMINATING"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateTerminating);
        }
        if ([value caseInsensitiveCompare:@"TERMINATED"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateTerminated);
        }
        if ([value caseInsensitiveCompare:@"ARRESTED"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateArrested);
        }
        if ([value caseInsensitiveCompare:@"SHUTTING_DOWN"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateShuttingDown);
        }
        if ([value caseInsensitiveCompare:@"ENDED"] == NSOrderedSame) {
            return @(AWSEmrInstanceGroupStateEnded);
        }
        return @(AWSEmrInstanceGroupStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrInstanceGroupStateProvisioning:
                return @"PROVISIONING";
            case AWSEmrInstanceGroupStateBootstrapping:
                return @"BOOTSTRAPPING";
            case AWSEmrInstanceGroupStateRunning:
                return @"RUNNING";
            case AWSEmrInstanceGroupStateReconfiguring:
                return @"RECONFIGURING";
            case AWSEmrInstanceGroupStateResizing:
                return @"RESIZING";
            case AWSEmrInstanceGroupStateSuspended:
                return @"SUSPENDED";
            case AWSEmrInstanceGroupStateTerminating:
                return @"TERMINATING";
            case AWSEmrInstanceGroupStateTerminated:
                return @"TERMINATED";
            case AWSEmrInstanceGroupStateArrested:
                return @"ARRESTED";
            case AWSEmrInstanceGroupStateShuttingDown:
                return @"SHUTTING_DOWN";
            case AWSEmrInstanceGroupStateEnded:
                return @"ENDED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateChangeReasonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrInstanceGroupStateChangeReason class]];
}

+ (NSValueTransformer *)timelineJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrInstanceGroupTimeline class]];
}

@end

@implementation AWSEmrInstanceGroupTimeline

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

@implementation AWSEmrInstanceResizePolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceTerminationTimeout" : @"InstanceTerminationTimeout",
             @"instancesToProtect" : @"InstancesToProtect",
             @"instancesToTerminate" : @"InstancesToTerminate",
             };
}

@end

@implementation AWSEmrInstanceStateChangeReason

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERNAL_ERROR"] == NSOrderedSame) {
            return @(AWSEmrInstanceStateChangeReasonCodeInternalError);
        }
        if ([value caseInsensitiveCompare:@"VALIDATION_ERROR"] == NSOrderedSame) {
            return @(AWSEmrInstanceStateChangeReasonCodeValidationError);
        }
        if ([value caseInsensitiveCompare:@"INSTANCE_FAILURE"] == NSOrderedSame) {
            return @(AWSEmrInstanceStateChangeReasonCodeInstanceFailure);
        }
        if ([value caseInsensitiveCompare:@"BOOTSTRAP_FAILURE"] == NSOrderedSame) {
            return @(AWSEmrInstanceStateChangeReasonCodeBootstrapFailure);
        }
        if ([value caseInsensitiveCompare:@"CLUSTER_TERMINATED"] == NSOrderedSame) {
            return @(AWSEmrInstanceStateChangeReasonCodeClusterTerminated);
        }
        return @(AWSEmrInstanceStateChangeReasonCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrInstanceStateChangeReasonCodeInternalError:
                return @"INTERNAL_ERROR";
            case AWSEmrInstanceStateChangeReasonCodeValidationError:
                return @"VALIDATION_ERROR";
            case AWSEmrInstanceStateChangeReasonCodeInstanceFailure:
                return @"INSTANCE_FAILURE";
            case AWSEmrInstanceStateChangeReasonCodeBootstrapFailure:
                return @"BOOTSTRAP_FAILURE";
            case AWSEmrInstanceStateChangeReasonCodeClusterTerminated:
                return @"CLUSTER_TERMINATED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEmrInstanceStatus

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
            return @(AWSEmrInstanceStateAwaitingFulfillment);
        }
        if ([value caseInsensitiveCompare:@"PROVISIONING"] == NSOrderedSame) {
            return @(AWSEmrInstanceStateProvisioning);
        }
        if ([value caseInsensitiveCompare:@"BOOTSTRAPPING"] == NSOrderedSame) {
            return @(AWSEmrInstanceStateBootstrapping);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSEmrInstanceStateRunning);
        }
        if ([value caseInsensitiveCompare:@"TERMINATED"] == NSOrderedSame) {
            return @(AWSEmrInstanceStateTerminated);
        }
        return @(AWSEmrInstanceStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrInstanceStateAwaitingFulfillment:
                return @"AWAITING_FULFILLMENT";
            case AWSEmrInstanceStateProvisioning:
                return @"PROVISIONING";
            case AWSEmrInstanceStateBootstrapping:
                return @"BOOTSTRAPPING";
            case AWSEmrInstanceStateRunning:
                return @"RUNNING";
            case AWSEmrInstanceStateTerminated:
                return @"TERMINATED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateChangeReasonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrInstanceStateChangeReason class]];
}

+ (NSValueTransformer *)timelineJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrInstanceTimeline class]];
}

@end

@implementation AWSEmrInstanceTimeline

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

@implementation AWSEmrInstanceTypeConfig

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrConfiguration class]];
}

+ (NSValueTransformer *)ebsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrEbsConfiguration class]];
}

@end

@implementation AWSEmrInstanceTypeSpecification

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrConfiguration class]];
}

+ (NSValueTransformer *)ebsBlockDevicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrEbsBlockDevice class]];
}

@end

@implementation AWSEmrJobFlowDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amiVersion" : @"AmiVersion",
             @"autoScalingRole" : @"AutoScalingRole",
             @"bootstrapActions" : @"BootstrapActions",
             @"executionStatusDetail" : @"ExecutionStatusDetail",
             @"instances" : @"Instances",
             @"jobFlowId" : @"JobFlowId",
             @"jobFlowRole" : @"JobFlowRole",
             @"logEncryptionKmsKeyId" : @"LogEncryptionKmsKeyId",
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrBootstrapActionDetail class]];
}

+ (NSValueTransformer *)executionStatusDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrJobFlowExecutionStatusDetail class]];
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrJobFlowInstancesDetail class]];
}

+ (NSValueTransformer *)scaleDownBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TERMINATE_AT_INSTANCE_HOUR"] == NSOrderedSame) {
            return @(AWSEmrScaleDownBehaviorTerminateAtInstanceHour);
        }
        if ([value caseInsensitiveCompare:@"TERMINATE_AT_TASK_COMPLETION"] == NSOrderedSame) {
            return @(AWSEmrScaleDownBehaviorTerminateAtTaskCompletion);
        }
        return @(AWSEmrScaleDownBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrScaleDownBehaviorTerminateAtInstanceHour:
                return @"TERMINATE_AT_INSTANCE_HOUR";
            case AWSEmrScaleDownBehaviorTerminateAtTaskCompletion:
                return @"TERMINATE_AT_TASK_COMPLETION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stepsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrStepDetail class]];
}

@end

@implementation AWSEmrJobFlowExecutionStatusDetail

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
            return @(AWSEmrJobFlowExecutionStateStarting);
        }
        if ([value caseInsensitiveCompare:@"BOOTSTRAPPING"] == NSOrderedSame) {
            return @(AWSEmrJobFlowExecutionStateBootstrapping);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSEmrJobFlowExecutionStateRunning);
        }
        if ([value caseInsensitiveCompare:@"WAITING"] == NSOrderedSame) {
            return @(AWSEmrJobFlowExecutionStateWaiting);
        }
        if ([value caseInsensitiveCompare:@"SHUTTING_DOWN"] == NSOrderedSame) {
            return @(AWSEmrJobFlowExecutionStateShuttingDown);
        }
        if ([value caseInsensitiveCompare:@"TERMINATED"] == NSOrderedSame) {
            return @(AWSEmrJobFlowExecutionStateTerminated);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSEmrJobFlowExecutionStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSEmrJobFlowExecutionStateFailed);
        }
        return @(AWSEmrJobFlowExecutionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrJobFlowExecutionStateStarting:
                return @"STARTING";
            case AWSEmrJobFlowExecutionStateBootstrapping:
                return @"BOOTSTRAPPING";
            case AWSEmrJobFlowExecutionStateRunning:
                return @"RUNNING";
            case AWSEmrJobFlowExecutionStateWaiting:
                return @"WAITING";
            case AWSEmrJobFlowExecutionStateShuttingDown:
                return @"SHUTTING_DOWN";
            case AWSEmrJobFlowExecutionStateTerminated:
                return @"TERMINATED";
            case AWSEmrJobFlowExecutionStateCompleted:
                return @"COMPLETED";
            case AWSEmrJobFlowExecutionStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEmrJobFlowInstancesConfig

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrInstanceFleetConfig class]];
}

+ (NSValueTransformer *)instanceGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrInstanceGroupConfig class]];
}

+ (NSValueTransformer *)placementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrPlacementType class]];
}

@end

@implementation AWSEmrJobFlowInstancesDetail

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrInstanceGroupDetail class]];
}

+ (NSValueTransformer *)placementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrPlacementType class]];
}

@end

@implementation AWSEmrKerberosAttributes

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

@implementation AWSEmrKeyValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSEmrListBootstrapActionsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSEmrListBootstrapActionsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bootstrapActions" : @"BootstrapActions",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)bootstrapActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrCommand class]];
}

@end

@implementation AWSEmrListClustersInput

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

@implementation AWSEmrListClustersOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusters" : @"Clusters",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)clustersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrClusterSummary class]];
}

@end

@implementation AWSEmrListInstanceFleetsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSEmrListInstanceFleetsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceFleets" : @"InstanceFleets",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)instanceFleetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrInstanceFleet class]];
}

@end

@implementation AWSEmrListInstanceGroupsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSEmrListInstanceGroupsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceGroups" : @"InstanceGroups",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)instanceGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrInstanceGroup class]];
}

@end

@implementation AWSEmrListInstancesInput

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
            return @(AWSEmrInstanceFleetTypeMaster);
        }
        if ([value caseInsensitiveCompare:@"CORE"] == NSOrderedSame) {
            return @(AWSEmrInstanceFleetTypeCore);
        }
        if ([value caseInsensitiveCompare:@"TASK"] == NSOrderedSame) {
            return @(AWSEmrInstanceFleetTypeTask);
        }
        return @(AWSEmrInstanceFleetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrInstanceFleetTypeMaster:
                return @"MASTER";
            case AWSEmrInstanceFleetTypeCore:
                return @"CORE";
            case AWSEmrInstanceFleetTypeTask:
                return @"TASK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEmrListInstancesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instances" : @"Instances",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrInstance class]];
}

@end

@implementation AWSEmrListSecurityConfigurationsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSEmrListSecurityConfigurationsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"securityConfigurations" : @"SecurityConfigurations",
             };
}

+ (NSValueTransformer *)securityConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrSecurityConfigurationSummary class]];
}

@end

@implementation AWSEmrListStepsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"marker" : @"Marker",
             @"stepIds" : @"StepIds",
             @"stepStates" : @"StepStates",
             };
}

@end

@implementation AWSEmrListStepsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"steps" : @"Steps",
             };
}

+ (NSValueTransformer *)stepsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrStepSummary class]];
}

@end

@implementation AWSEmrManagedScalingPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"computeLimits" : @"ComputeLimits",
             };
}

+ (NSValueTransformer *)computeLimitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrComputeLimits class]];
}

@end

@implementation AWSEmrMetricDimension

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSEmrModifyClusterInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"stepConcurrencyLevel" : @"StepConcurrencyLevel",
             };
}

@end

@implementation AWSEmrModifyClusterOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stepConcurrencyLevel" : @"StepConcurrencyLevel",
             };
}

@end

@implementation AWSEmrModifyInstanceFleetInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"instanceFleet" : @"InstanceFleet",
             };
}

+ (NSValueTransformer *)instanceFleetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrInstanceFleetModifyConfig class]];
}

@end

@implementation AWSEmrModifyInstanceGroupsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"instanceGroups" : @"InstanceGroups",
             };
}

+ (NSValueTransformer *)instanceGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrInstanceGroupModifyConfig class]];
}

@end

@implementation AWSEmrPlacementType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"availabilityZones" : @"AvailabilityZones",
             };
}

@end

@implementation AWSEmrPortRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxRange" : @"MaxRange",
             @"minRange" : @"MinRange",
             };
}

@end

@implementation AWSEmrPutAutoScalingPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingPolicy" : @"AutoScalingPolicy",
             @"clusterId" : @"ClusterId",
             @"instanceGroupId" : @"InstanceGroupId",
             };
}

+ (NSValueTransformer *)autoScalingPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrAutoScalingPolicy class]];
}

@end

@implementation AWSEmrPutAutoScalingPolicyOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingPolicy" : @"AutoScalingPolicy",
             @"clusterArn" : @"ClusterArn",
             @"clusterId" : @"ClusterId",
             @"instanceGroupId" : @"InstanceGroupId",
             };
}

+ (NSValueTransformer *)autoScalingPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrAutoScalingPolicyDescription class]];
}

@end

@implementation AWSEmrPutBlockPublicAccessConfigurationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockPublicAccessConfiguration" : @"BlockPublicAccessConfiguration",
             };
}

+ (NSValueTransformer *)blockPublicAccessConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrBlockPublicAccessConfiguration class]];
}

@end

@implementation AWSEmrPutBlockPublicAccessConfigurationOutput

@end

@implementation AWSEmrPutManagedScalingPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"managedScalingPolicy" : @"ManagedScalingPolicy",
             };
}

+ (NSValueTransformer *)managedScalingPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrManagedScalingPolicy class]];
}

@end

@implementation AWSEmrPutManagedScalingPolicyOutput

@end

@implementation AWSEmrRemoveAutoScalingPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"instanceGroupId" : @"InstanceGroupId",
             };
}

@end

@implementation AWSEmrRemoveAutoScalingPolicyOutput

@end

@implementation AWSEmrRemoveManagedScalingPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             };
}

@end

@implementation AWSEmrRemoveManagedScalingPolicyOutput

@end

@implementation AWSEmrRemoveTagsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSEmrRemoveTagsOutput

@end

@implementation AWSEmrRunJobFlowInput

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
             @"logEncryptionKmsKeyId" : @"LogEncryptionKmsKeyId",
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrApplication class]];
}

+ (NSValueTransformer *)bootstrapActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrBootstrapActionConfig class]];
}

+ (NSValueTransformer *)configurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrConfiguration class]];
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrJobFlowInstancesConfig class]];
}

+ (NSValueTransformer *)kerberosAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrKerberosAttributes class]];
}

+ (NSValueTransformer *)managedScalingPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrManagedScalingPolicy class]];
}

+ (NSValueTransformer *)latestSupportedProductsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrSupportedProductConfig class]];
}

+ (NSValueTransformer *)repoUpgradeOnBootJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECURITY"] == NSOrderedSame) {
            return @(AWSEmrRepoUpgradeOnBootSecurity);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSEmrRepoUpgradeOnBootNone);
        }
        return @(AWSEmrRepoUpgradeOnBootUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrRepoUpgradeOnBootSecurity:
                return @"SECURITY";
            case AWSEmrRepoUpgradeOnBootNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scaleDownBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TERMINATE_AT_INSTANCE_HOUR"] == NSOrderedSame) {
            return @(AWSEmrScaleDownBehaviorTerminateAtInstanceHour);
        }
        if ([value caseInsensitiveCompare:@"TERMINATE_AT_TASK_COMPLETION"] == NSOrderedSame) {
            return @(AWSEmrScaleDownBehaviorTerminateAtTaskCompletion);
        }
        return @(AWSEmrScaleDownBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrScaleDownBehaviorTerminateAtInstanceHour:
                return @"TERMINATE_AT_INSTANCE_HOUR";
            case AWSEmrScaleDownBehaviorTerminateAtTaskCompletion:
                return @"TERMINATE_AT_TASK_COMPLETION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stepsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrStepConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEmrTag class]];
}

@end

@implementation AWSEmrRunJobFlowOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterArn" : @"ClusterArn",
             @"jobFlowId" : @"JobFlowId",
             };
}

@end

@implementation AWSEmrScalingAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"market" : @"Market",
             @"simpleScalingPolicyConfiguration" : @"SimpleScalingPolicyConfiguration",
             };
}

+ (NSValueTransformer *)marketJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSEmrMarketTypeOnDemand);
        }
        if ([value caseInsensitiveCompare:@"SPOT"] == NSOrderedSame) {
            return @(AWSEmrMarketTypeSpot);
        }
        return @(AWSEmrMarketTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrMarketTypeOnDemand:
                return @"ON_DEMAND";
            case AWSEmrMarketTypeSpot:
                return @"SPOT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)simpleScalingPolicyConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrSimpleScalingPolicyConfiguration class]];
}

@end

@implementation AWSEmrScalingConstraints

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxCapacity" : @"MaxCapacity",
             @"minCapacity" : @"MinCapacity",
             };
}

@end

@implementation AWSEmrScalingRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"trigger" : @"Trigger",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrScalingAction class]];
}

+ (NSValueTransformer *)triggerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrScalingTrigger class]];
}

@end

@implementation AWSEmrScalingTrigger

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchAlarmDefinition" : @"CloudWatchAlarmDefinition",
             };
}

+ (NSValueTransformer *)cloudWatchAlarmDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrCloudWatchAlarmDefinition class]];
}

@end

@implementation AWSEmrScriptBootstrapActionConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"args" : @"Args",
             @"path" : @"Path",
             };
}

@end

@implementation AWSEmrSecurityConfigurationSummary

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

@implementation AWSEmrSetTerminationProtectionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobFlowIds" : @"JobFlowIds",
             @"terminationProtected" : @"TerminationProtected",
             };
}

@end

@implementation AWSEmrSetVisibleToAllUsersInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobFlowIds" : @"JobFlowIds",
             @"visibleToAllUsers" : @"VisibleToAllUsers",
             };
}

@end

@implementation AWSEmrShrinkPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"decommissionTimeout" : @"DecommissionTimeout",
             @"instanceResizePolicy" : @"InstanceResizePolicy",
             };
}

+ (NSValueTransformer *)instanceResizePolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrInstanceResizePolicy class]];
}

@end

@implementation AWSEmrSimpleScalingPolicyConfiguration

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
            return @(AWSEmrAdjustmentTypeChangeInCapacity);
        }
        if ([value caseInsensitiveCompare:@"PERCENT_CHANGE_IN_CAPACITY"] == NSOrderedSame) {
            return @(AWSEmrAdjustmentTypePercentChangeInCapacity);
        }
        if ([value caseInsensitiveCompare:@"EXACT_CAPACITY"] == NSOrderedSame) {
            return @(AWSEmrAdjustmentTypeExactCapacity);
        }
        return @(AWSEmrAdjustmentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrAdjustmentTypeChangeInCapacity:
                return @"CHANGE_IN_CAPACITY";
            case AWSEmrAdjustmentTypePercentChangeInCapacity:
                return @"PERCENT_CHANGE_IN_CAPACITY";
            case AWSEmrAdjustmentTypeExactCapacity:
                return @"EXACT_CAPACITY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEmrSpotProvisioningSpecification

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
            return @(AWSEmrSpotProvisioningTimeoutActionSwitchToOnDemand);
        }
        if ([value caseInsensitiveCompare:@"TERMINATE_CLUSTER"] == NSOrderedSame) {
            return @(AWSEmrSpotProvisioningTimeoutActionTerminateCluster);
        }
        return @(AWSEmrSpotProvisioningTimeoutActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrSpotProvisioningTimeoutActionSwitchToOnDemand:
                return @"SWITCH_TO_ON_DEMAND";
            case AWSEmrSpotProvisioningTimeoutActionTerminateCluster:
                return @"TERMINATE_CLUSTER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEmrStep

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
            return @(AWSEmrActionOnFailureTerminateJobFlow);
        }
        if ([value caseInsensitiveCompare:@"TERMINATE_CLUSTER"] == NSOrderedSame) {
            return @(AWSEmrActionOnFailureTerminateCluster);
        }
        if ([value caseInsensitiveCompare:@"CANCEL_AND_WAIT"] == NSOrderedSame) {
            return @(AWSEmrActionOnFailureCancelAndWait);
        }
        if ([value caseInsensitiveCompare:@"CONTINUE"] == NSOrderedSame) {
            return @(AWSEmrActionOnFailureContinue);
        }
        return @(AWSEmrActionOnFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrActionOnFailureTerminateJobFlow:
                return @"TERMINATE_JOB_FLOW";
            case AWSEmrActionOnFailureTerminateCluster:
                return @"TERMINATE_CLUSTER";
            case AWSEmrActionOnFailureCancelAndWait:
                return @"CANCEL_AND_WAIT";
            case AWSEmrActionOnFailureContinue:
                return @"CONTINUE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)configJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrHadoopStepConfig class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrStepStatus class]];
}

@end

@implementation AWSEmrStepConfig

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
            return @(AWSEmrActionOnFailureTerminateJobFlow);
        }
        if ([value caseInsensitiveCompare:@"TERMINATE_CLUSTER"] == NSOrderedSame) {
            return @(AWSEmrActionOnFailureTerminateCluster);
        }
        if ([value caseInsensitiveCompare:@"CANCEL_AND_WAIT"] == NSOrderedSame) {
            return @(AWSEmrActionOnFailureCancelAndWait);
        }
        if ([value caseInsensitiveCompare:@"CONTINUE"] == NSOrderedSame) {
            return @(AWSEmrActionOnFailureContinue);
        }
        return @(AWSEmrActionOnFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrActionOnFailureTerminateJobFlow:
                return @"TERMINATE_JOB_FLOW";
            case AWSEmrActionOnFailureTerminateCluster:
                return @"TERMINATE_CLUSTER";
            case AWSEmrActionOnFailureCancelAndWait:
                return @"CANCEL_AND_WAIT";
            case AWSEmrActionOnFailureContinue:
                return @"CONTINUE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hadoopJarStepJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrHadoopJarStepConfig class]];
}

@end

@implementation AWSEmrStepDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"executionStatusDetail" : @"ExecutionStatusDetail",
             @"stepConfig" : @"StepConfig",
             };
}

+ (NSValueTransformer *)executionStatusDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrStepExecutionStatusDetail class]];
}

+ (NSValueTransformer *)stepConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrStepConfig class]];
}

@end

@implementation AWSEmrStepExecutionStatusDetail

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
            return @(AWSEmrStepExecutionStatePending);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSEmrStepExecutionStateRunning);
        }
        if ([value caseInsensitiveCompare:@"CONTINUE"] == NSOrderedSame) {
            return @(AWSEmrStepExecutionStateContinue);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSEmrStepExecutionStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSEmrStepExecutionStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSEmrStepExecutionStateFailed);
        }
        if ([value caseInsensitiveCompare:@"INTERRUPTED"] == NSOrderedSame) {
            return @(AWSEmrStepExecutionStateInterrupted);
        }
        return @(AWSEmrStepExecutionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrStepExecutionStatePending:
                return @"PENDING";
            case AWSEmrStepExecutionStateRunning:
                return @"RUNNING";
            case AWSEmrStepExecutionStateContinue:
                return @"CONTINUE";
            case AWSEmrStepExecutionStateCompleted:
                return @"COMPLETED";
            case AWSEmrStepExecutionStateCancelled:
                return @"CANCELLED";
            case AWSEmrStepExecutionStateFailed:
                return @"FAILED";
            case AWSEmrStepExecutionStateInterrupted:
                return @"INTERRUPTED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEmrStepStateChangeReason

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSEmrStepStateChangeReasonCodeNone);
        }
        return @(AWSEmrStepStateChangeReasonCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrStepStateChangeReasonCodeNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEmrStepStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failureDetails" : @"FailureDetails",
             @"state" : @"State",
             @"stateChangeReason" : @"StateChangeReason",
             @"timeline" : @"Timeline",
             };
}

+ (NSValueTransformer *)failureDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrFailureDetails class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSEmrStepStatePending);
        }
        if ([value caseInsensitiveCompare:@"CANCEL_PENDING"] == NSOrderedSame) {
            return @(AWSEmrStepStateCancelPending);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSEmrStepStateRunning);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSEmrStepStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSEmrStepStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSEmrStepStateFailed);
        }
        if ([value caseInsensitiveCompare:@"INTERRUPTED"] == NSOrderedSame) {
            return @(AWSEmrStepStateInterrupted);
        }
        return @(AWSEmrStepStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrStepStatePending:
                return @"PENDING";
            case AWSEmrStepStateCancelPending:
                return @"CANCEL_PENDING";
            case AWSEmrStepStateRunning:
                return @"RUNNING";
            case AWSEmrStepStateCompleted:
                return @"COMPLETED";
            case AWSEmrStepStateCancelled:
                return @"CANCELLED";
            case AWSEmrStepStateFailed:
                return @"FAILED";
            case AWSEmrStepStateInterrupted:
                return @"INTERRUPTED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateChangeReasonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrStepStateChangeReason class]];
}

+ (NSValueTransformer *)timelineJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrStepTimeline class]];
}

@end

@implementation AWSEmrStepSummary

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
            return @(AWSEmrActionOnFailureTerminateJobFlow);
        }
        if ([value caseInsensitiveCompare:@"TERMINATE_CLUSTER"] == NSOrderedSame) {
            return @(AWSEmrActionOnFailureTerminateCluster);
        }
        if ([value caseInsensitiveCompare:@"CANCEL_AND_WAIT"] == NSOrderedSame) {
            return @(AWSEmrActionOnFailureCancelAndWait);
        }
        if ([value caseInsensitiveCompare:@"CONTINUE"] == NSOrderedSame) {
            return @(AWSEmrActionOnFailureContinue);
        }
        return @(AWSEmrActionOnFailureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEmrActionOnFailureTerminateJobFlow:
                return @"TERMINATE_JOB_FLOW";
            case AWSEmrActionOnFailureTerminateCluster:
                return @"TERMINATE_CLUSTER";
            case AWSEmrActionOnFailureCancelAndWait:
                return @"CANCEL_AND_WAIT";
            case AWSEmrActionOnFailureContinue:
                return @"CONTINUE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)configJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrHadoopStepConfig class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEmrStepStatus class]];
}

@end

@implementation AWSEmrStepTimeline

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

@implementation AWSEmrSupportedProductConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"args" : @"Args",
             @"name" : @"Name",
             };
}

@end

@implementation AWSEmrTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSEmrTerminateJobFlowsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobFlowIds" : @"JobFlowIds",
             };
}

@end

@implementation AWSEmrVolumeSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"iops" : @"Iops",
             @"sizeInGB" : @"SizeInGB",
             @"volumeType" : @"VolumeType",
             };
}

@end
