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

#import "AWSapi.sagemakerModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSapi.sagemakerErrorDomain = @"com.amazonaws.AWSapi.sagemakerErrorDomain";

@implementation AWSapi.sagemakerAddTagsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerAddTagsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerAlgorithmSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmName" : @"AlgorithmName",
             @"enableSageMakerMetricsTimeSeries" : @"EnableSageMakerMetricsTimeSeries",
             @"metricDefinitions" : @"MetricDefinitions",
             @"trainingImage" : @"TrainingImage",
             @"trainingInputMode" : @"TrainingInputMode",
             };
}

+ (NSValueTransformer *)metricDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerMetricDefinition class]];
}

+ (NSValueTransformer *)trainingInputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pipe"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInputModePipe);
        }
        if ([value caseInsensitiveCompare:@"File"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInputModeFile);
        }
        return @(AWSapi.sagemakerTrainingInputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerTrainingInputModePipe:
                return @"Pipe";
            case AWSapi.sagemakerTrainingInputModeFile:
                return @"File";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerAlgorithmStatusDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageScanStatuses" : @"ImageScanStatuses",
             @"validationStatuses" : @"ValidationStatuses",
             };
}

+ (NSValueTransformer *)imageScanStatusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerAlgorithmStatusItem class]];
}

+ (NSValueTransformer *)validationStatusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerAlgorithmStatusItem class]];
}

@end

@implementation AWSapi.sagemakerAlgorithmStatusItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failureReason" : @"FailureReason",
             @"name" : @"Name",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NotStarted"] == NSOrderedSame) {
            return @(AWSapi.sagemakerDetailedAlgorithmStatusNotStarted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerDetailedAlgorithmStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerDetailedAlgorithmStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerDetailedAlgorithmStatusFailed);
        }
        return @(AWSapi.sagemakerDetailedAlgorithmStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerDetailedAlgorithmStatusNotStarted:
                return @"NotStarted";
            case AWSapi.sagemakerDetailedAlgorithmStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerDetailedAlgorithmStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerDetailedAlgorithmStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerAlgorithmSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmArn" : @"AlgorithmArn",
             @"algorithmDescription" : @"AlgorithmDescription",
             @"algorithmName" : @"AlgorithmName",
             @"algorithmStatus" : @"AlgorithmStatus",
             @"creationTime" : @"CreationTime",
             };
}

+ (NSValueTransformer *)algorithmStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAlgorithmStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAlgorithmStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAlgorithmStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAlgorithmStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAlgorithmStatusDeleting);
        }
        return @(AWSapi.sagemakerAlgorithmStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAlgorithmStatusPending:
                return @"Pending";
            case AWSapi.sagemakerAlgorithmStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerAlgorithmStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerAlgorithmStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerAlgorithmStatusDeleting:
                return @"Deleting";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.sagemakerAlgorithmValidationProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"profileName" : @"ProfileName",
             @"trainingJobDefinition" : @"TrainingJobDefinition",
             @"transformJobDefinition" : @"TransformJobDefinition",
             };
}

+ (NSValueTransformer *)trainingJobDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrainingJobDefinition class]];
}

+ (NSValueTransformer *)transformJobDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTransformJobDefinition class]];
}

@end

@implementation AWSapi.sagemakerAlgorithmValidationSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"validationProfiles" : @"ValidationProfiles",
             @"validationRole" : @"ValidationRole",
             };
}

+ (NSValueTransformer *)validationProfilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerAlgorithmValidationProfile class]];
}

@end

@implementation AWSapi.sagemakerAnnotationConsolidationConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"annotationConsolidationLambdaArn" : @"AnnotationConsolidationLambdaArn",
             };
}

@end

@implementation AWSapi.sagemakerAppDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appName" : @"AppName",
             @"appType" : @"AppType",
             @"creationTime" : @"CreationTime",
             @"domainId" : @"DomainId",
             @"status" : @"Status",
             @"userProfileName" : @"UserProfileName",
             };
}

+ (NSValueTransformer *)appTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JupyterServer"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppTypeJupyterServer);
        }
        if ([value caseInsensitiveCompare:@"KernelGateway"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppTypeKernelGateway);
        }
        if ([value caseInsensitiveCompare:@"TensorBoard"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppTypeTensorBoard);
        }
        return @(AWSapi.sagemakerAppTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAppTypeJupyterServer:
                return @"JupyterServer";
            case AWSapi.sagemakerAppTypeKernelGateway:
                return @"KernelGateway";
            case AWSapi.sagemakerAppTypeTensorBoard:
                return @"TensorBoard";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Deleted"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppStatusPending);
        }
        return @(AWSapi.sagemakerAppStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAppStatusDeleted:
                return @"Deleted";
            case AWSapi.sagemakerAppStatusDeleting:
                return @"Deleting";
            case AWSapi.sagemakerAppStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerAppStatusInService:
                return @"InService";
            case AWSapi.sagemakerAppStatusPending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerAppSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"containerArguments" : @"ContainerArguments",
             @"containerEntrypoint" : @"ContainerEntrypoint",
             @"imageUri" : @"ImageUri",
             };
}

@end

@implementation AWSapi.sagemakerAssociateTrialComponentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentName" : @"TrialComponentName",
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSapi.sagemakerAssociateTrialComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialArn" : @"TrialArn",
             @"trialComponentArn" : @"TrialComponentArn",
             };
}

@end

@implementation AWSapi.sagemakerAutoMLCandidate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"candidateName" : @"CandidateName",
             @"candidateStatus" : @"CandidateStatus",
             @"candidateSteps" : @"CandidateSteps",
             @"creationTime" : @"CreationTime",
             @"endTime" : @"EndTime",
             @"failureReason" : @"FailureReason",
             @"finalAutoMLJobObjectiveMetric" : @"FinalAutoMLJobObjectiveMetric",
             @"inferenceContainers" : @"InferenceContainers",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"objectiveStatus" : @"ObjectiveStatus",
             };
}

+ (NSValueTransformer *)candidateStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCandidateStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCandidateStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCandidateStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCandidateStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCandidateStatusStopping);
        }
        return @(AWSapi.sagemakerCandidateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerCandidateStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerCandidateStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerCandidateStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerCandidateStatusStopped:
                return @"Stopped";
            case AWSapi.sagemakerCandidateStatusStopping:
                return @"Stopping";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)candidateStepsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerAutoMLCandidateStep class]];
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

+ (NSValueTransformer *)finalAutoMLJobObjectiveMetricJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerFinalAutoMLJobObjectiveMetric class]];
}

+ (NSValueTransformer *)inferenceContainersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerAutoMLContainerDefinition class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)objectiveStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Succeeded"] == NSOrderedSame) {
            return @(AWSapi.sagemakerObjectiveStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerObjectiveStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerObjectiveStatusFailed);
        }
        return @(AWSapi.sagemakerObjectiveStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerObjectiveStatusSucceeded:
                return @"Succeeded";
            case AWSapi.sagemakerObjectiveStatusPending:
                return @"Pending";
            case AWSapi.sagemakerObjectiveStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerAutoMLCandidateStep

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"candidateStepArn" : @"CandidateStepArn",
             @"candidateStepName" : @"CandidateStepName",
             @"candidateStepType" : @"CandidateStepType",
             };
}

+ (NSValueTransformer *)candidateStepTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS::SageMaker::TrainingJob"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCandidateStepTypeAWSSageMakerTrainingJob);
        }
        if ([value caseInsensitiveCompare:@"AWS::SageMaker::TransformJob"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCandidateStepTypeAWSSageMakerTransformJob);
        }
        if ([value caseInsensitiveCompare:@"AWS::SageMaker::ProcessingJob"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCandidateStepTypeAWSSageMakerProcessingJob);
        }
        return @(AWSapi.sagemakerCandidateStepTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerCandidateStepTypeAWSSageMakerTrainingJob:
                return @"AWS::SageMaker::TrainingJob";
            case AWSapi.sagemakerCandidateStepTypeAWSSageMakerTransformJob:
                return @"AWS::SageMaker::TransformJob";
            case AWSapi.sagemakerCandidateStepTypeAWSSageMakerProcessingJob:
                return @"AWS::SageMaker::ProcessingJob";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerAutoMLChannel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compressionType" : @"CompressionType",
             @"dataSource" : @"DataSource",
             @"targetAttributeName" : @"TargetAttributeName",
             };
}

+ (NSValueTransformer *)compressionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompressionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"Gzip"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompressionTypeGzip);
        }
        return @(AWSapi.sagemakerCompressionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerCompressionTypeNone:
                return @"None";
            case AWSapi.sagemakerCompressionTypeGzip:
                return @"Gzip";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAutoMLDataSource class]];
}

@end

@implementation AWSapi.sagemakerAutoMLContainerDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"environment" : @"Environment",
             @"image" : @"Image",
             @"modelDataUrl" : @"ModelDataUrl",
             };
}

@end

@implementation AWSapi.sagemakerAutoMLDataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3DataSource" : @"S3DataSource",
             };
}

+ (NSValueTransformer *)s3DataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAutoMLS3DataSource class]];
}

@end

@implementation AWSapi.sagemakerAutoMLJobArtifacts

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"candidateDefinitionNotebookLocation" : @"CandidateDefinitionNotebookLocation",
             @"dataExplorationNotebookLocation" : @"DataExplorationNotebookLocation",
             };
}

@end

@implementation AWSapi.sagemakerAutoMLJobCompletionCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxAutoMLJobRuntimeInSeconds" : @"MaxAutoMLJobRuntimeInSeconds",
             @"maxCandidates" : @"MaxCandidates",
             @"maxRuntimePerTrainingJobInSeconds" : @"MaxRuntimePerTrainingJobInSeconds",
             };
}

@end

@implementation AWSapi.sagemakerAutoMLJobConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completionCriteria" : @"CompletionCriteria",
             @"securityConfig" : @"SecurityConfig",
             };
}

+ (NSValueTransformer *)completionCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAutoMLJobCompletionCriteria class]];
}

+ (NSValueTransformer *)securityConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAutoMLSecurityConfig class]];
}

@end

@implementation AWSapi.sagemakerAutoMLJobObjective

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricName" : @"MetricName",
             };
}

+ (NSValueTransformer *)metricNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Accuracy"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLMetricEnumAccuracy);
        }
        if ([value caseInsensitiveCompare:@"MSE"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLMetricEnumMse);
        }
        if ([value caseInsensitiveCompare:@"F1"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLMetricEnumF1);
        }
        if ([value caseInsensitiveCompare:@"F1macro"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLMetricEnumF1macro);
        }
        return @(AWSapi.sagemakerAutoMLMetricEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAutoMLMetricEnumAccuracy:
                return @"Accuracy";
            case AWSapi.sagemakerAutoMLMetricEnumMse:
                return @"MSE";
            case AWSapi.sagemakerAutoMLMetricEnumF1:
                return @"F1";
            case AWSapi.sagemakerAutoMLMetricEnumF1macro:
                return @"F1macro";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerAutoMLJobSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLJobArn" : @"AutoMLJobArn",
             @"autoMLJobName" : @"AutoMLJobName",
             @"autoMLJobSecondaryStatus" : @"AutoMLJobSecondaryStatus",
             @"autoMLJobStatus" : @"AutoMLJobStatus",
             @"creationTime" : @"CreationTime",
             @"endTime" : @"EndTime",
             @"failureReason" : @"FailureReason",
             @"lastModifiedTime" : @"LastModifiedTime",
             };
}

+ (NSValueTransformer *)autoMLJobSecondaryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Starting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobSecondaryStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"AnalyzingData"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobSecondaryStatusAnalyzingData);
        }
        if ([value caseInsensitiveCompare:@"FeatureEngineering"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobSecondaryStatusFeatureEngineering);
        }
        if ([value caseInsensitiveCompare:@"ModelTuning"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobSecondaryStatusModelTuning);
        }
        if ([value caseInsensitiveCompare:@"MaxCandidatesReached"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobSecondaryStatusMaxCandidatesReached);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobSecondaryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobSecondaryStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"MaxAutoMLJobRuntimeReached"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobSecondaryStatusMaxAutoMLJobRuntimeReached);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobSecondaryStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"CandidateDefinitionsGenerated"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobSecondaryStatusCandidateDefinitionsGenerated);
        }
        return @(AWSapi.sagemakerAutoMLJobSecondaryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAutoMLJobSecondaryStatusStarting:
                return @"Starting";
            case AWSapi.sagemakerAutoMLJobSecondaryStatusAnalyzingData:
                return @"AnalyzingData";
            case AWSapi.sagemakerAutoMLJobSecondaryStatusFeatureEngineering:
                return @"FeatureEngineering";
            case AWSapi.sagemakerAutoMLJobSecondaryStatusModelTuning:
                return @"ModelTuning";
            case AWSapi.sagemakerAutoMLJobSecondaryStatusMaxCandidatesReached:
                return @"MaxCandidatesReached";
            case AWSapi.sagemakerAutoMLJobSecondaryStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerAutoMLJobSecondaryStatusStopped:
                return @"Stopped";
            case AWSapi.sagemakerAutoMLJobSecondaryStatusMaxAutoMLJobRuntimeReached:
                return @"MaxAutoMLJobRuntimeReached";
            case AWSapi.sagemakerAutoMLJobSecondaryStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerAutoMLJobSecondaryStatusCandidateDefinitionsGenerated:
                return @"CandidateDefinitionsGenerated";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)autoMLJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobStatusStopping);
        }
        return @(AWSapi.sagemakerAutoMLJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAutoMLJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerAutoMLJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerAutoMLJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerAutoMLJobStatusStopped:
                return @"Stopped";
            case AWSapi.sagemakerAutoMLJobStatusStopping:
                return @"Stopping";
            default:
                return nil;
        }
    }];
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

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.sagemakerAutoMLOutputDataConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"s3OutputPath" : @"S3OutputPath",
             };
}

@end

@implementation AWSapi.sagemakerAutoMLS3DataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3DataType" : @"S3DataType",
             @"s3Uri" : @"S3Uri",
             };
}

+ (NSValueTransformer *)s3DataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ManifestFile"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLS3DataTypeManifestFile);
        }
        if ([value caseInsensitiveCompare:@"S3Prefix"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLS3DataTypeS3Prefix);
        }
        return @(AWSapi.sagemakerAutoMLS3DataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAutoMLS3DataTypeManifestFile:
                return @"ManifestFile";
            case AWSapi.sagemakerAutoMLS3DataTypeS3Prefix:
                return @"S3Prefix";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerAutoMLSecurityConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enableInterContainerTrafficEncryption" : @"EnableInterContainerTrafficEncryption",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerVpcConfig class]];
}

@end

@implementation AWSapi.sagemakerCaptureContentTypeHeader

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"csvContentTypes" : @"CsvContentTypes",
             @"jsonContentTypes" : @"JsonContentTypes",
             };
}

@end

@implementation AWSapi.sagemakerCaptureOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"captureMode" : @"CaptureMode",
             };
}

+ (NSValueTransformer *)captureModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Input"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCaptureModeInput);
        }
        if ([value caseInsensitiveCompare:@"Output"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCaptureModeOutput);
        }
        return @(AWSapi.sagemakerCaptureModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerCaptureModeInput:
                return @"Input";
            case AWSapi.sagemakerCaptureModeOutput:
                return @"Output";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerCategoricalParameterRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

@end

@implementation AWSapi.sagemakerCategoricalParameterRangeSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"values" : @"Values",
             };
}

@end

@implementation AWSapi.sagemakerChannel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelName" : @"ChannelName",
             @"compressionType" : @"CompressionType",
             @"contentType" : @"ContentType",
             @"dataSource" : @"DataSource",
             @"inputMode" : @"InputMode",
             @"recordWrapperType" : @"RecordWrapperType",
             @"shuffleConfig" : @"ShuffleConfig",
             };
}

+ (NSValueTransformer *)compressionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompressionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"Gzip"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompressionTypeGzip);
        }
        return @(AWSapi.sagemakerCompressionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerCompressionTypeNone:
                return @"None";
            case AWSapi.sagemakerCompressionTypeGzip:
                return @"Gzip";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerDataSource class]];
}

+ (NSValueTransformer *)inputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pipe"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInputModePipe);
        }
        if ([value caseInsensitiveCompare:@"File"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInputModeFile);
        }
        return @(AWSapi.sagemakerTrainingInputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerTrainingInputModePipe:
                return @"Pipe";
            case AWSapi.sagemakerTrainingInputModeFile:
                return @"File";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)recordWrapperTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSapi.sagemakerRecordWrapperNone);
        }
        if ([value caseInsensitiveCompare:@"RecordIO"] == NSOrderedSame) {
            return @(AWSapi.sagemakerRecordWrapperRecordIO);
        }
        return @(AWSapi.sagemakerRecordWrapperUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerRecordWrapperNone:
                return @"None";
            case AWSapi.sagemakerRecordWrapperRecordIO:
                return @"RecordIO";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)shuffleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerShuffleConfig class]];
}

@end

@implementation AWSapi.sagemakerChannelSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"isRequired" : @"IsRequired",
             @"name" : @"Name",
             @"supportedCompressionTypes" : @"SupportedCompressionTypes",
             @"supportedContentTypes" : @"SupportedContentTypes",
             @"supportedInputModes" : @"SupportedInputModes",
             };
}

@end

@implementation AWSapi.sagemakerCheckpointConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"localPath" : @"LocalPath",
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSapi.sagemakerCodeRepositorySummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositoryArn" : @"CodeRepositoryArn",
             @"codeRepositoryName" : @"CodeRepositoryName",
             @"creationTime" : @"CreationTime",
             @"gitConfig" : @"GitConfig",
             @"lastModifiedTime" : @"LastModifiedTime",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)gitConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerGitConfig class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.sagemakerCognitoMemberDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"userGroup" : @"UserGroup",
             @"userPool" : @"UserPool",
             };
}

@end

@implementation AWSapi.sagemakerCollectionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionName" : @"CollectionName",
             @"collectionParameters" : @"CollectionParameters",
             };
}

@end

@implementation AWSapi.sagemakerCompilationJobSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compilationEndTime" : @"CompilationEndTime",
             @"compilationJobArn" : @"CompilationJobArn",
             @"compilationJobName" : @"CompilationJobName",
             @"compilationJobStatus" : @"CompilationJobStatus",
             @"compilationStartTime" : @"CompilationStartTime",
             @"compilationTargetDevice" : @"CompilationTargetDevice",
             @"creationTime" : @"CreationTime",
             @"lastModifiedTime" : @"LastModifiedTime",
             };
}

+ (NSValueTransformer *)compilationEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)compilationJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INPROGRESS"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompilationJobStatusInprogress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompilationJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompilationJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompilationJobStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompilationJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompilationJobStatusStopped);
        }
        return @(AWSapi.sagemakerCompilationJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerCompilationJobStatusInprogress:
                return @"INPROGRESS";
            case AWSapi.sagemakerCompilationJobStatusCompleted:
                return @"COMPLETED";
            case AWSapi.sagemakerCompilationJobStatusFailed:
                return @"FAILED";
            case AWSapi.sagemakerCompilationJobStatusStarting:
                return @"STARTING";
            case AWSapi.sagemakerCompilationJobStatusStopping:
                return @"STOPPING";
            case AWSapi.sagemakerCompilationJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)compilationStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)compilationTargetDeviceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceLambda);
        }
        if ([value caseInsensitiveCompare:@"ml_m4"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceMlM4);
        }
        if ([value caseInsensitiveCompare:@"ml_m5"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceMlM5);
        }
        if ([value caseInsensitiveCompare:@"ml_c4"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceMlC4);
        }
        if ([value caseInsensitiveCompare:@"ml_c5"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceMlC5);
        }
        if ([value caseInsensitiveCompare:@"ml_p2"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceMlP2);
        }
        if ([value caseInsensitiveCompare:@"ml_p3"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceMlP3);
        }
        if ([value caseInsensitiveCompare:@"ml_inf1"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceMlInf1);
        }
        if ([value caseInsensitiveCompare:@"jetson_tx1"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceJetsonTx1);
        }
        if ([value caseInsensitiveCompare:@"jetson_tx2"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceJetsonTx2);
        }
        if ([value caseInsensitiveCompare:@"jetson_nano"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceJetsonNano);
        }
        if ([value caseInsensitiveCompare:@"jetson_xavier"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceJetsonXavier);
        }
        if ([value caseInsensitiveCompare:@"rasp3b"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceRasp3b);
        }
        if ([value caseInsensitiveCompare:@"imx8qm"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceImx8qm);
        }
        if ([value caseInsensitiveCompare:@"deeplens"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceDeeplens);
        }
        if ([value caseInsensitiveCompare:@"rk3399"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceRk3399);
        }
        if ([value caseInsensitiveCompare:@"rk3288"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceRk3288);
        }
        if ([value caseInsensitiveCompare:@"aisage"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceAisage);
        }
        if ([value caseInsensitiveCompare:@"sbe_c"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceSbeC);
        }
        if ([value caseInsensitiveCompare:@"qcs605"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceQcs605);
        }
        if ([value caseInsensitiveCompare:@"qcs603"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceQcs603);
        }
        if ([value caseInsensitiveCompare:@"sitara_am57x"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceSitaraAm57x);
        }
        if ([value caseInsensitiveCompare:@"amba_cv22"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceAmbaCv22);
        }
        return @(AWSapi.sagemakerTargetDeviceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerTargetDeviceLambda:
                return @"lambda";
            case AWSapi.sagemakerTargetDeviceMlM4:
                return @"ml_m4";
            case AWSapi.sagemakerTargetDeviceMlM5:
                return @"ml_m5";
            case AWSapi.sagemakerTargetDeviceMlC4:
                return @"ml_c4";
            case AWSapi.sagemakerTargetDeviceMlC5:
                return @"ml_c5";
            case AWSapi.sagemakerTargetDeviceMlP2:
                return @"ml_p2";
            case AWSapi.sagemakerTargetDeviceMlP3:
                return @"ml_p3";
            case AWSapi.sagemakerTargetDeviceMlInf1:
                return @"ml_inf1";
            case AWSapi.sagemakerTargetDeviceJetsonTx1:
                return @"jetson_tx1";
            case AWSapi.sagemakerTargetDeviceJetsonTx2:
                return @"jetson_tx2";
            case AWSapi.sagemakerTargetDeviceJetsonNano:
                return @"jetson_nano";
            case AWSapi.sagemakerTargetDeviceJetsonXavier:
                return @"jetson_xavier";
            case AWSapi.sagemakerTargetDeviceRasp3b:
                return @"rasp3b";
            case AWSapi.sagemakerTargetDeviceImx8qm:
                return @"imx8qm";
            case AWSapi.sagemakerTargetDeviceDeeplens:
                return @"deeplens";
            case AWSapi.sagemakerTargetDeviceRk3399:
                return @"rk3399";
            case AWSapi.sagemakerTargetDeviceRk3288:
                return @"rk3288";
            case AWSapi.sagemakerTargetDeviceAisage:
                return @"aisage";
            case AWSapi.sagemakerTargetDeviceSbeC:
                return @"sbe_c";
            case AWSapi.sagemakerTargetDeviceQcs605:
                return @"qcs605";
            case AWSapi.sagemakerTargetDeviceQcs603:
                return @"qcs603";
            case AWSapi.sagemakerTargetDeviceSitaraAm57x:
                return @"sitara_am57x";
            case AWSapi.sagemakerTargetDeviceAmbaCv22:
                return @"amba_cv22";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.sagemakerContainerDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"containerHostname" : @"ContainerHostname",
             @"environment" : @"Environment",
             @"image" : @"Image",
             @"mode" : @"Mode",
             @"modelDataUrl" : @"ModelDataUrl",
             @"modelPackageName" : @"ModelPackageName",
             };
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SingleModel"] == NSOrderedSame) {
            return @(AWSapi.sagemakerContainerModeSingleModel);
        }
        if ([value caseInsensitiveCompare:@"MultiModel"] == NSOrderedSame) {
            return @(AWSapi.sagemakerContainerModeMultiModel);
        }
        return @(AWSapi.sagemakerContainerModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerContainerModeSingleModel:
                return @"SingleModel";
            case AWSapi.sagemakerContainerModeMultiModel:
                return @"MultiModel";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerContinuousParameterRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxValue" : @"MaxValue",
             @"minValue" : @"MinValue",
             @"name" : @"Name",
             @"scalingType" : @"ScalingType",
             };
}

+ (NSValueTransformer *)scalingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Auto"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterScalingTypeAuto);
        }
        if ([value caseInsensitiveCompare:@"Linear"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterScalingTypeLinear);
        }
        if ([value caseInsensitiveCompare:@"Logarithmic"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterScalingTypeLogarithmic);
        }
        if ([value caseInsensitiveCompare:@"ReverseLogarithmic"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterScalingTypeReverseLogarithmic);
        }
        return @(AWSapi.sagemakerHyperParameterScalingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerHyperParameterScalingTypeAuto:
                return @"Auto";
            case AWSapi.sagemakerHyperParameterScalingTypeLinear:
                return @"Linear";
            case AWSapi.sagemakerHyperParameterScalingTypeLogarithmic:
                return @"Logarithmic";
            case AWSapi.sagemakerHyperParameterScalingTypeReverseLogarithmic:
                return @"ReverseLogarithmic";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerContinuousParameterRangeSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxValue" : @"MaxValue",
             @"minValue" : @"MinValue",
             };
}

@end

@implementation AWSapi.sagemakerCreateAlgorithmInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmDescription" : @"AlgorithmDescription",
             @"algorithmName" : @"AlgorithmName",
             @"certifyForMarketplace" : @"CertifyForMarketplace",
             @"inferenceSpecification" : @"InferenceSpecification",
             @"trainingSpecification" : @"TrainingSpecification",
             @"validationSpecification" : @"ValidationSpecification",
             };
}

+ (NSValueTransformer *)inferenceSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerInferenceSpecification class]];
}

+ (NSValueTransformer *)trainingSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrainingSpecification class]];
}

+ (NSValueTransformer *)validationSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAlgorithmValidationSpecification class]];
}

@end

@implementation AWSapi.sagemakerCreateAlgorithmOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmArn" : @"AlgorithmArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateAppRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appName" : @"AppName",
             @"appType" : @"AppType",
             @"domainId" : @"DomainId",
             @"resourceSpec" : @"ResourceSpec",
             @"tags" : @"Tags",
             @"userProfileName" : @"UserProfileName",
             };
}

+ (NSValueTransformer *)appTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JupyterServer"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppTypeJupyterServer);
        }
        if ([value caseInsensitiveCompare:@"KernelGateway"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppTypeKernelGateway);
        }
        if ([value caseInsensitiveCompare:@"TensorBoard"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppTypeTensorBoard);
        }
        return @(AWSapi.sagemakerAppTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAppTypeJupyterServer:
                return @"JupyterServer";
            case AWSapi.sagemakerAppTypeKernelGateway:
                return @"KernelGateway";
            case AWSapi.sagemakerAppTypeTensorBoard:
                return @"TensorBoard";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceSpecJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerResourceSpec class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerCreateAppResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appArn" : @"AppArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateAutoMLJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLJobConfig" : @"AutoMLJobConfig",
             @"autoMLJobName" : @"AutoMLJobName",
             @"autoMLJobObjective" : @"AutoMLJobObjective",
             @"generateCandidateDefinitionsOnly" : @"GenerateCandidateDefinitionsOnly",
             @"inputDataConfig" : @"InputDataConfig",
             @"outputDataConfig" : @"OutputDataConfig",
             @"problemType" : @"ProblemType",
             @"roleArn" : @"RoleArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)autoMLJobConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAutoMLJobConfig class]];
}

+ (NSValueTransformer *)autoMLJobObjectiveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAutoMLJobObjective class]];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerAutoMLChannel class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAutoMLOutputDataConfig class]];
}

+ (NSValueTransformer *)problemTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BinaryClassification"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProblemTypeBinaryClassification);
        }
        if ([value caseInsensitiveCompare:@"MulticlassClassification"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProblemTypeMulticlassClassification);
        }
        if ([value caseInsensitiveCompare:@"Regression"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProblemTypeRegression);
        }
        return @(AWSapi.sagemakerProblemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerProblemTypeBinaryClassification:
                return @"BinaryClassification";
            case AWSapi.sagemakerProblemTypeMulticlassClassification:
                return @"MulticlassClassification";
            case AWSapi.sagemakerProblemTypeRegression:
                return @"Regression";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerCreateAutoMLJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLJobArn" : @"AutoMLJobArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateCodeRepositoryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositoryName" : @"CodeRepositoryName",
             @"gitConfig" : @"GitConfig",
             };
}

+ (NSValueTransformer *)gitConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerGitConfig class]];
}

@end

@implementation AWSapi.sagemakerCreateCodeRepositoryOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositoryArn" : @"CodeRepositoryArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateCompilationJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compilationJobName" : @"CompilationJobName",
             @"inputConfig" : @"InputConfig",
             @"outputConfig" : @"OutputConfig",
             @"roleArn" : @"RoleArn",
             @"stoppingCondition" : @"StoppingCondition",
             };
}

+ (NSValueTransformer *)inputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerInputConfig class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerOutputConfig class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerStoppingCondition class]];
}

@end

@implementation AWSapi.sagemakerCreateCompilationJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compilationJobArn" : @"CompilationJobArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authMode" : @"AuthMode",
             @"defaultUserSettings" : @"DefaultUserSettings",
             @"domainName" : @"DomainName",
             @"homeEfsFileSystemKmsKeyId" : @"HomeEfsFileSystemKmsKeyId",
             @"subnetIds" : @"SubnetIds",
             @"tags" : @"Tags",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)authModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SSO"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAuthModeSso);
        }
        if ([value caseInsensitiveCompare:@"IAM"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAuthModeIam);
        }
        return @(AWSapi.sagemakerAuthModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAuthModeSso:
                return @"SSO";
            case AWSapi.sagemakerAuthModeIam:
                return @"IAM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)defaultUserSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserSettings class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerCreateDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainArn" : @"DomainArn",
             @"url" : @"Url",
             };
}

@end

@implementation AWSapi.sagemakerCreateEndpointConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataCaptureConfig" : @"DataCaptureConfig",
             @"endpointConfigName" : @"EndpointConfigName",
             @"kmsKeyId" : @"KmsKeyId",
             @"productionVariants" : @"ProductionVariants",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)dataCaptureConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerDataCaptureConfig class]];
}

+ (NSValueTransformer *)productionVariantsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerProductionVariant class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerCreateEndpointConfigOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointConfigArn" : @"EndpointConfigArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateEndpointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointConfigName" : @"EndpointConfigName",
             @"endpointName" : @"EndpointName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerCreateEndpointOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateExperimentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"displayName" : @"DisplayName",
             @"experimentName" : @"ExperimentName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerCreateExperimentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentArn" : @"ExperimentArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateFlowDefinitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flowDefinitionName" : @"FlowDefinitionName",
             @"humanLoopActivationConfig" : @"HumanLoopActivationConfig",
             @"humanLoopConfig" : @"HumanLoopConfig",
             @"humanLoopRequestSource" : @"HumanLoopRequestSource",
             @"outputConfig" : @"OutputConfig",
             @"roleArn" : @"RoleArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)humanLoopActivationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerHumanLoopActivationConfig class]];
}

+ (NSValueTransformer *)humanLoopConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerHumanLoopConfig class]];
}

+ (NSValueTransformer *)humanLoopRequestSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerHumanLoopRequestSource class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerFlowDefinitionOutputConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerCreateFlowDefinitionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flowDefinitionArn" : @"FlowDefinitionArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateHumanTaskUiRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanTaskUiName" : @"HumanTaskUiName",
             @"tags" : @"Tags",
             @"uiTemplate" : @"UiTemplate",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

+ (NSValueTransformer *)uiTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUiTemplate class]];
}

@end

@implementation AWSapi.sagemakerCreateHumanTaskUiResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanTaskUiArn" : @"HumanTaskUiArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateHyperParameterTuningJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hyperParameterTuningJobConfig" : @"HyperParameterTuningJobConfig",
             @"hyperParameterTuningJobName" : @"HyperParameterTuningJobName",
             @"tags" : @"Tags",
             @"trainingJobDefinition" : @"TrainingJobDefinition",
             @"trainingJobDefinitions" : @"TrainingJobDefinitions",
             @"warmStartConfig" : @"WarmStartConfig",
             };
}

+ (NSValueTransformer *)hyperParameterTuningJobConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerHyperParameterTuningJobConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

+ (NSValueTransformer *)trainingJobDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerHyperParameterTrainingJobDefinition class]];
}

+ (NSValueTransformer *)trainingJobDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerHyperParameterTrainingJobDefinition class]];
}

+ (NSValueTransformer *)warmStartConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerHyperParameterTuningJobWarmStartConfig class]];
}

@end

@implementation AWSapi.sagemakerCreateHyperParameterTuningJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hyperParameterTuningJobArn" : @"HyperParameterTuningJobArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateLabelingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanTaskConfig" : @"HumanTaskConfig",
             @"inputConfig" : @"InputConfig",
             @"labelAttributeName" : @"LabelAttributeName",
             @"labelCategoryConfigS3Uri" : @"LabelCategoryConfigS3Uri",
             @"labelingJobAlgorithmsConfig" : @"LabelingJobAlgorithmsConfig",
             @"labelingJobName" : @"LabelingJobName",
             @"outputConfig" : @"OutputConfig",
             @"roleArn" : @"RoleArn",
             @"stoppingConditions" : @"StoppingConditions",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)humanTaskConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerHumanTaskConfig class]];
}

+ (NSValueTransformer *)inputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerLabelingJobInputConfig class]];
}

+ (NSValueTransformer *)labelingJobAlgorithmsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerLabelingJobAlgorithmsConfig class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerLabelingJobOutputConfig class]];
}

+ (NSValueTransformer *)stoppingConditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerLabelingJobStoppingConditions class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerCreateLabelingJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelingJobArn" : @"LabelingJobArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateModelInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"containers" : @"Containers",
             @"enableNetworkIsolation" : @"EnableNetworkIsolation",
             @"executionRoleArn" : @"ExecutionRoleArn",
             @"modelName" : @"ModelName",
             @"primaryContainer" : @"PrimaryContainer",
             @"tags" : @"Tags",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)containersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerContainerDefinition class]];
}

+ (NSValueTransformer *)primaryContainerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerContainerDefinition class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerVpcConfig class]];
}

@end

@implementation AWSapi.sagemakerCreateModelOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelArn" : @"ModelArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateModelPackageInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certifyForMarketplace" : @"CertifyForMarketplace",
             @"inferenceSpecification" : @"InferenceSpecification",
             @"modelPackageDescription" : @"ModelPackageDescription",
             @"modelPackageName" : @"ModelPackageName",
             @"sourceAlgorithmSpecification" : @"SourceAlgorithmSpecification",
             @"validationSpecification" : @"ValidationSpecification",
             };
}

+ (NSValueTransformer *)inferenceSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerInferenceSpecification class]];
}

+ (NSValueTransformer *)sourceAlgorithmSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerSourceAlgorithmSpecification class]];
}

+ (NSValueTransformer *)validationSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerModelPackageValidationSpecification class]];
}

@end

@implementation AWSapi.sagemakerCreateModelPackageOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelPackageArn" : @"ModelPackageArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateMonitoringScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleConfig" : @"MonitoringScheduleConfig",
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)monitoringScheduleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerMonitoringScheduleConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerCreateMonitoringScheduleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleArn" : @"MonitoringScheduleArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateNotebookInstanceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceleratorTypes" : @"AcceleratorTypes",
             @"additionalCodeRepositories" : @"AdditionalCodeRepositories",
             @"defaultCodeRepository" : @"DefaultCodeRepository",
             @"directInternetAccess" : @"DirectInternetAccess",
             @"instanceType" : @"InstanceType",
             @"kmsKeyId" : @"KmsKeyId",
             @"lifecycleConfigName" : @"LifecycleConfigName",
             @"notebookInstanceName" : @"NotebookInstanceName",
             @"roleArn" : @"RoleArn",
             @"rootAccess" : @"RootAccess",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetId" : @"SubnetId",
             @"tags" : @"Tags",
             @"volumeSizeInGB" : @"VolumeSizeInGB",
             };
}

+ (NSValueTransformer *)directInternetAccessJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSapi.sagemakerDirectInternetAccessEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSapi.sagemakerDirectInternetAccessDisabled);
        }
        return @(AWSapi.sagemakerDirectInternetAccessUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerDirectInternetAccessEnabled:
                return @"Enabled";
            case AWSapi.sagemakerDirectInternetAccessDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ml.t2.medium"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT2Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT2Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT22xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.medium"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.9xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5d9xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.18xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5d18xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP316xlarge);
        }
        return @(AWSapi.sagemakerInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerInstanceTypeMlT2Medium:
                return @"ml.t2.medium";
            case AWSapi.sagemakerInstanceTypeMlT2Large:
                return @"ml.t2.large";
            case AWSapi.sagemakerInstanceTypeMlT2Xlarge:
                return @"ml.t2.xlarge";
            case AWSapi.sagemakerInstanceTypeMlT22xlarge:
                return @"ml.t2.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSapi.sagemakerInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSapi.sagemakerInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSapi.sagemakerInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSapi.sagemakerInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSapi.sagemakerInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSapi.sagemakerInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSapi.sagemakerInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSapi.sagemakerInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSapi.sagemakerInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSapi.sagemakerInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSapi.sagemakerInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSapi.sagemakerInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSapi.sagemakerInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSapi.sagemakerInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSapi.sagemakerInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSapi.sagemakerInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5dXlarge:
                return @"ml.c5d.xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5d2xlarge:
                return @"ml.c5d.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5d4xlarge:
                return @"ml.c5d.4xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5d9xlarge:
                return @"ml.c5d.9xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5d18xlarge:
                return @"ml.c5d.18xlarge";
            case AWSapi.sagemakerInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSapi.sagemakerInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSapi.sagemakerInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSapi.sagemakerInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSapi.sagemakerInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rootAccessJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSapi.sagemakerRootAccessEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSapi.sagemakerRootAccessDisabled);
        }
        return @(AWSapi.sagemakerRootAccessUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerRootAccessEnabled:
                return @"Enabled";
            case AWSapi.sagemakerRootAccessDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceLifecycleConfigName" : @"NotebookInstanceLifecycleConfigName",
             @"onCreate" : @"OnCreate",
             @"onStart" : @"OnStart",
             };
}

+ (NSValueTransformer *)onCreateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerNotebookInstanceLifecycleHook class]];
}

+ (NSValueTransformer *)onStartJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerNotebookInstanceLifecycleHook class]];
}

@end

@implementation AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceLifecycleConfigArn" : @"NotebookInstanceLifecycleConfigArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateNotebookInstanceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceArn" : @"NotebookInstanceArn",
             };
}

@end

@implementation AWSapi.sagemakerCreatePresignedDomainUrlRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             @"sessionExpirationDurationInSeconds" : @"SessionExpirationDurationInSeconds",
             @"userProfileName" : @"UserProfileName",
             };
}

@end

@implementation AWSapi.sagemakerCreatePresignedDomainUrlResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizedUrl" : @"AuthorizedUrl",
             };
}

@end

@implementation AWSapi.sagemakerCreatePresignedNotebookInstanceUrlInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceName" : @"NotebookInstanceName",
             @"sessionExpirationDurationInSeconds" : @"SessionExpirationDurationInSeconds",
             };
}

@end

@implementation AWSapi.sagemakerCreatePresignedNotebookInstanceUrlOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizedUrl" : @"AuthorizedUrl",
             };
}

@end

@implementation AWSapi.sagemakerCreateProcessingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appSpecification" : @"AppSpecification",
             @"environment" : @"Environment",
             @"experimentConfig" : @"ExperimentConfig",
             @"networkConfig" : @"NetworkConfig",
             @"processingInputs" : @"ProcessingInputs",
             @"processingJobName" : @"ProcessingJobName",
             @"processingOutputConfig" : @"ProcessingOutputConfig",
             @"processingResources" : @"ProcessingResources",
             @"roleArn" : @"RoleArn",
             @"stoppingCondition" : @"StoppingCondition",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)appSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAppSpecification class]];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerExperimentConfig class]];
}

+ (NSValueTransformer *)networkConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerNetworkConfig class]];
}

+ (NSValueTransformer *)processingInputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerProcessingInput class]];
}

+ (NSValueTransformer *)processingOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerProcessingOutputConfig class]];
}

+ (NSValueTransformer *)processingResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerProcessingResources class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerProcessingStoppingCondition class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerCreateProcessingJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"processingJobArn" : @"ProcessingJobArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateTrainingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmSpecification" : @"AlgorithmSpecification",
             @"checkpointConfig" : @"CheckpointConfig",
             @"debugHookConfig" : @"DebugHookConfig",
             @"debugRuleConfigurations" : @"DebugRuleConfigurations",
             @"enableInterContainerTrafficEncryption" : @"EnableInterContainerTrafficEncryption",
             @"enableManagedSpotTraining" : @"EnableManagedSpotTraining",
             @"enableNetworkIsolation" : @"EnableNetworkIsolation",
             @"experimentConfig" : @"ExperimentConfig",
             @"hyperParameters" : @"HyperParameters",
             @"inputDataConfig" : @"InputDataConfig",
             @"outputDataConfig" : @"OutputDataConfig",
             @"resourceConfig" : @"ResourceConfig",
             @"roleArn" : @"RoleArn",
             @"stoppingCondition" : @"StoppingCondition",
             @"tags" : @"Tags",
             @"tensorBoardOutputConfig" : @"TensorBoardOutputConfig",
             @"trainingJobName" : @"TrainingJobName",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)algorithmSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAlgorithmSpecification class]];
}

+ (NSValueTransformer *)checkpointConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerCheckpointConfig class]];
}

+ (NSValueTransformer *)debugHookConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerDebugHookConfig class]];
}

+ (NSValueTransformer *)debugRuleConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerDebugRuleConfiguration class]];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerExperimentConfig class]];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerChannel class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerOutputDataConfig class]];
}

+ (NSValueTransformer *)resourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerResourceConfig class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerStoppingCondition class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

+ (NSValueTransformer *)tensorBoardOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTensorBoardOutputConfig class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerVpcConfig class]];
}

@end

@implementation AWSapi.sagemakerCreateTrainingJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trainingJobArn" : @"TrainingJobArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateTransformJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchStrategy" : @"BatchStrategy",
             @"dataProcessing" : @"DataProcessing",
             @"environment" : @"Environment",
             @"experimentConfig" : @"ExperimentConfig",
             @"maxConcurrentTransforms" : @"MaxConcurrentTransforms",
             @"maxPayloadInMB" : @"MaxPayloadInMB",
             @"modelName" : @"ModelName",
             @"tags" : @"Tags",
             @"transformInput" : @"TransformInput",
             @"transformJobName" : @"TransformJobName",
             @"transformOutput" : @"TransformOutput",
             @"transformResources" : @"TransformResources",
             };
}

+ (NSValueTransformer *)batchStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MultiRecord"] == NSOrderedSame) {
            return @(AWSapi.sagemakerBatchStrategyMultiRecord);
        }
        if ([value caseInsensitiveCompare:@"SingleRecord"] == NSOrderedSame) {
            return @(AWSapi.sagemakerBatchStrategySingleRecord);
        }
        return @(AWSapi.sagemakerBatchStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerBatchStrategyMultiRecord:
                return @"MultiRecord";
            case AWSapi.sagemakerBatchStrategySingleRecord:
                return @"SingleRecord";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dataProcessingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerDataProcessing class]];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerExperimentConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

+ (NSValueTransformer *)transformInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTransformInput class]];
}

+ (NSValueTransformer *)transformOutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTransformOutput class]];
}

+ (NSValueTransformer *)transformResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTransformResources class]];
}

@end

@implementation AWSapi.sagemakerCreateTransformJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformJobArn" : @"TransformJobArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateTrialComponentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             @"endTime" : @"EndTime",
             @"inputArtifacts" : @"InputArtifacts",
             @"outputArtifacts" : @"OutputArtifacts",
             @"parameters" : @"Parameters",
             @"startTime" : @"StartTime",
             @"status" : @"Status",
             @"tags" : @"Tags",
             @"trialComponentName" : @"TrialComponentName",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inputArtifactsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapi.sagemakerTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)outputArtifactsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapi.sagemakerTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapi.sagemakerTrialComponentParameterValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrialComponentStatus class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerCreateTrialComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentArn" : @"TrialComponentArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateTrialRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             @"experimentName" : @"ExperimentName",
             @"tags" : @"Tags",
             @"trialName" : @"TrialName",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerCreateTrialResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialArn" : @"TrialArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateUserProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             @"singleSignOnUserIdentifier" : @"SingleSignOnUserIdentifier",
             @"singleSignOnUserValue" : @"SingleSignOnUserValue",
             @"tags" : @"Tags",
             @"userProfileName" : @"UserProfileName",
             @"userSettings" : @"UserSettings",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

+ (NSValueTransformer *)userSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserSettings class]];
}

@end

@implementation AWSapi.sagemakerCreateUserProfileResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userProfileArn" : @"UserProfileArn",
             };
}

@end

@implementation AWSapi.sagemakerCreateWorkteamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"memberDefinitions" : @"MemberDefinitions",
             @"notificationConfiguration" : @"NotificationConfiguration",
             @"tags" : @"Tags",
             @"workteamName" : @"WorkteamName",
             };
}

+ (NSValueTransformer *)memberDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerMemberDefinition class]];
}

+ (NSValueTransformer *)notificationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerNotificationConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerCreateWorkteamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workteamArn" : @"WorkteamArn",
             };
}

@end

@implementation AWSapi.sagemakerDataCaptureConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"captureContentTypeHeader" : @"CaptureContentTypeHeader",
             @"captureOptions" : @"CaptureOptions",
             @"destinationS3Uri" : @"DestinationS3Uri",
             @"enableCapture" : @"EnableCapture",
             @"initialSamplingPercentage" : @"InitialSamplingPercentage",
             @"kmsKeyId" : @"KmsKeyId",
             };
}

+ (NSValueTransformer *)captureContentTypeHeaderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerCaptureContentTypeHeader class]];
}

+ (NSValueTransformer *)captureOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerCaptureOption class]];
}

@end

@implementation AWSapi.sagemakerDataCaptureConfigSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"captureStatus" : @"CaptureStatus",
             @"currentSamplingPercentage" : @"CurrentSamplingPercentage",
             @"destinationS3Uri" : @"DestinationS3Uri",
             @"enableCapture" : @"EnableCapture",
             @"kmsKeyId" : @"KmsKeyId",
             };
}

+ (NSValueTransformer *)captureStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Started"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCaptureStatusStarted);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCaptureStatusStopped);
        }
        return @(AWSapi.sagemakerCaptureStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerCaptureStatusStarted:
                return @"Started";
            case AWSapi.sagemakerCaptureStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerDataProcessing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputFilter" : @"InputFilter",
             @"joinSource" : @"JoinSource",
             @"outputFilter" : @"OutputFilter",
             };
}

+ (NSValueTransformer *)joinSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Input"] == NSOrderedSame) {
            return @(AWSapi.sagemakerJoinSourceInput);
        }
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSapi.sagemakerJoinSourceNone);
        }
        return @(AWSapi.sagemakerJoinSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerJoinSourceInput:
                return @"Input";
            case AWSapi.sagemakerJoinSourceNone:
                return @"None";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerDataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystemDataSource" : @"FileSystemDataSource",
             @"s3DataSource" : @"S3DataSource",
             };
}

+ (NSValueTransformer *)fileSystemDataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerFileSystemDataSource class]];
}

+ (NSValueTransformer *)s3DataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerS3DataSource class]];
}

@end

@implementation AWSapi.sagemakerDebugHookConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionConfigurations" : @"CollectionConfigurations",
             @"hookParameters" : @"HookParameters",
             @"localPath" : @"LocalPath",
             @"s3OutputPath" : @"S3OutputPath",
             };
}

+ (NSValueTransformer *)collectionConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerCollectionConfiguration class]];
}

@end

@implementation AWSapi.sagemakerDebugRuleConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceType" : @"InstanceType",
             @"localPath" : @"LocalPath",
             @"ruleConfigurationName" : @"RuleConfigurationName",
             @"ruleEvaluatorImage" : @"RuleEvaluatorImage",
             @"ruleParameters" : @"RuleParameters",
             @"s3OutputPath" : @"S3OutputPath",
             @"volumeSizeInGB" : @"VolumeSizeInGB",
             };
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ml.t3.medium"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR58xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR516xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.24xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR524xlarge);
        }
        return @(AWSapi.sagemakerProcessingInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerProcessingInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSapi.sagemakerProcessingInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSapi.sagemakerProcessingInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSapi.sagemakerProcessingInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR5Large:
                return @"ml.r5.large";
            case AWSapi.sagemakerProcessingInstanceTypeMlR5Xlarge:
                return @"ml.r5.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR52xlarge:
                return @"ml.r5.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR54xlarge:
                return @"ml.r5.4xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR58xlarge:
                return @"ml.r5.8xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR512xlarge:
                return @"ml.r5.12xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR516xlarge:
                return @"ml.r5.16xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR524xlarge:
                return @"ml.r5.24xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerDebugRuleEvaluationStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastModifiedTime" : @"LastModifiedTime",
             @"ruleConfigurationName" : @"RuleConfigurationName",
             @"ruleEvaluationJobArn" : @"RuleEvaluationJobArn",
             @"ruleEvaluationStatus" : @"RuleEvaluationStatus",
             @"statusDetails" : @"StatusDetails",
             };
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)ruleEvaluationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerRuleEvaluationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"NoIssuesFound"] == NSOrderedSame) {
            return @(AWSapi.sagemakerRuleEvaluationStatusNoIssuesFound);
        }
        if ([value caseInsensitiveCompare:@"IssuesFound"] == NSOrderedSame) {
            return @(AWSapi.sagemakerRuleEvaluationStatusIssuesFound);
        }
        if ([value caseInsensitiveCompare:@"Error"] == NSOrderedSame) {
            return @(AWSapi.sagemakerRuleEvaluationStatusError);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerRuleEvaluationStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerRuleEvaluationStatusStopped);
        }
        return @(AWSapi.sagemakerRuleEvaluationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerRuleEvaluationStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerRuleEvaluationStatusNoIssuesFound:
                return @"NoIssuesFound";
            case AWSapi.sagemakerRuleEvaluationStatusIssuesFound:
                return @"IssuesFound";
            case AWSapi.sagemakerRuleEvaluationStatusError:
                return @"Error";
            case AWSapi.sagemakerRuleEvaluationStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerRuleEvaluationStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerDeleteAlgorithmInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmName" : @"AlgorithmName",
             };
}

@end

@implementation AWSapi.sagemakerDeleteAppRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appName" : @"AppName",
             @"appType" : @"AppType",
             @"domainId" : @"DomainId",
             @"userProfileName" : @"UserProfileName",
             };
}

+ (NSValueTransformer *)appTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JupyterServer"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppTypeJupyterServer);
        }
        if ([value caseInsensitiveCompare:@"KernelGateway"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppTypeKernelGateway);
        }
        if ([value caseInsensitiveCompare:@"TensorBoard"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppTypeTensorBoard);
        }
        return @(AWSapi.sagemakerAppTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAppTypeJupyterServer:
                return @"JupyterServer";
            case AWSapi.sagemakerAppTypeKernelGateway:
                return @"KernelGateway";
            case AWSapi.sagemakerAppTypeTensorBoard:
                return @"TensorBoard";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerDeleteCodeRepositoryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositoryName" : @"CodeRepositoryName",
             };
}

@end

@implementation AWSapi.sagemakerDeleteDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             @"retentionPolicy" : @"RetentionPolicy",
             };
}

+ (NSValueTransformer *)retentionPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerRetentionPolicy class]];
}

@end

@implementation AWSapi.sagemakerDeleteEndpointConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointConfigName" : @"EndpointConfigName",
             };
}

@end

@implementation AWSapi.sagemakerDeleteEndpointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointName" : @"EndpointName",
             };
}

@end

@implementation AWSapi.sagemakerDeleteExperimentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentName" : @"ExperimentName",
             };
}

@end

@implementation AWSapi.sagemakerDeleteExperimentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentArn" : @"ExperimentArn",
             };
}

@end

@implementation AWSapi.sagemakerDeleteFlowDefinitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flowDefinitionName" : @"FlowDefinitionName",
             };
}

@end

@implementation AWSapi.sagemakerDeleteFlowDefinitionResponse

@end

@implementation AWSapi.sagemakerDeleteModelInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelName" : @"ModelName",
             };
}

@end

@implementation AWSapi.sagemakerDeleteModelPackageInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelPackageName" : @"ModelPackageName",
             };
}

@end

@implementation AWSapi.sagemakerDeleteMonitoringScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             };
}

@end

@implementation AWSapi.sagemakerDeleteNotebookInstanceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceName" : @"NotebookInstanceName",
             };
}

@end

@implementation AWSapi.sagemakerDeleteNotebookInstanceLifecycleConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceLifecycleConfigName" : @"NotebookInstanceLifecycleConfigName",
             };
}

@end

@implementation AWSapi.sagemakerDeleteTagsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSapi.sagemakerDeleteTagsOutput

@end

@implementation AWSapi.sagemakerDeleteTrialComponentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentName" : @"TrialComponentName",
             };
}

@end

@implementation AWSapi.sagemakerDeleteTrialComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentArn" : @"TrialComponentArn",
             };
}

@end

@implementation AWSapi.sagemakerDeleteTrialRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSapi.sagemakerDeleteTrialResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialArn" : @"TrialArn",
             };
}

@end

@implementation AWSapi.sagemakerDeleteUserProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             @"userProfileName" : @"UserProfileName",
             };
}

@end

@implementation AWSapi.sagemakerDeleteWorkteamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workteamName" : @"WorkteamName",
             };
}

@end

@implementation AWSapi.sagemakerDeleteWorkteamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"success" : @"Success",
             };
}

@end

@implementation AWSapi.sagemakerDeployedImage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resolutionTime" : @"ResolutionTime",
             @"resolvedImage" : @"ResolvedImage",
             @"specifiedImage" : @"SpecifiedImage",
             };
}

+ (NSValueTransformer *)resolutionTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.sagemakerDescribeAlgorithmInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmName" : @"AlgorithmName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeAlgorithmOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmArn" : @"AlgorithmArn",
             @"algorithmDescription" : @"AlgorithmDescription",
             @"algorithmName" : @"AlgorithmName",
             @"algorithmStatus" : @"AlgorithmStatus",
             @"algorithmStatusDetails" : @"AlgorithmStatusDetails",
             @"certifyForMarketplace" : @"CertifyForMarketplace",
             @"creationTime" : @"CreationTime",
             @"inferenceSpecification" : @"InferenceSpecification",
             @"productId" : @"ProductId",
             @"trainingSpecification" : @"TrainingSpecification",
             @"validationSpecification" : @"ValidationSpecification",
             };
}

+ (NSValueTransformer *)algorithmStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAlgorithmStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAlgorithmStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAlgorithmStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAlgorithmStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAlgorithmStatusDeleting);
        }
        return @(AWSapi.sagemakerAlgorithmStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAlgorithmStatusPending:
                return @"Pending";
            case AWSapi.sagemakerAlgorithmStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerAlgorithmStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerAlgorithmStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerAlgorithmStatusDeleting:
                return @"Deleting";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)algorithmStatusDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAlgorithmStatusDetails class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inferenceSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerInferenceSpecification class]];
}

+ (NSValueTransformer *)trainingSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrainingSpecification class]];
}

+ (NSValueTransformer *)validationSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAlgorithmValidationSpecification class]];
}

@end

@implementation AWSapi.sagemakerDescribeAppRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appName" : @"AppName",
             @"appType" : @"AppType",
             @"domainId" : @"DomainId",
             @"userProfileName" : @"UserProfileName",
             };
}

+ (NSValueTransformer *)appTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JupyterServer"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppTypeJupyterServer);
        }
        if ([value caseInsensitiveCompare:@"KernelGateway"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppTypeKernelGateway);
        }
        if ([value caseInsensitiveCompare:@"TensorBoard"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppTypeTensorBoard);
        }
        return @(AWSapi.sagemakerAppTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAppTypeJupyterServer:
                return @"JupyterServer";
            case AWSapi.sagemakerAppTypeKernelGateway:
                return @"KernelGateway";
            case AWSapi.sagemakerAppTypeTensorBoard:
                return @"TensorBoard";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerDescribeAppResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appArn" : @"AppArn",
             @"appName" : @"AppName",
             @"appType" : @"AppType",
             @"creationTime" : @"CreationTime",
             @"domainId" : @"DomainId",
             @"failureReason" : @"FailureReason",
             @"lastHealthCheckTimestamp" : @"LastHealthCheckTimestamp",
             @"lastUserActivityTimestamp" : @"LastUserActivityTimestamp",
             @"resourceSpec" : @"ResourceSpec",
             @"status" : @"Status",
             @"userProfileName" : @"UserProfileName",
             };
}

+ (NSValueTransformer *)appTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JupyterServer"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppTypeJupyterServer);
        }
        if ([value caseInsensitiveCompare:@"KernelGateway"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppTypeKernelGateway);
        }
        if ([value caseInsensitiveCompare:@"TensorBoard"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppTypeTensorBoard);
        }
        return @(AWSapi.sagemakerAppTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAppTypeJupyterServer:
                return @"JupyterServer";
            case AWSapi.sagemakerAppTypeKernelGateway:
                return @"KernelGateway";
            case AWSapi.sagemakerAppTypeTensorBoard:
                return @"TensorBoard";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastHealthCheckTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUserActivityTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)resourceSpecJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerResourceSpec class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Deleted"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppStatusPending);
        }
        return @(AWSapi.sagemakerAppStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAppStatusDeleted:
                return @"Deleted";
            case AWSapi.sagemakerAppStatusDeleting:
                return @"Deleting";
            case AWSapi.sagemakerAppStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerAppStatusInService:
                return @"InService";
            case AWSapi.sagemakerAppStatusPending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerDescribeAutoMLJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLJobName" : @"AutoMLJobName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeAutoMLJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLJobArn" : @"AutoMLJobArn",
             @"autoMLJobArtifacts" : @"AutoMLJobArtifacts",
             @"autoMLJobConfig" : @"AutoMLJobConfig",
             @"autoMLJobName" : @"AutoMLJobName",
             @"autoMLJobObjective" : @"AutoMLJobObjective",
             @"autoMLJobSecondaryStatus" : @"AutoMLJobSecondaryStatus",
             @"autoMLJobStatus" : @"AutoMLJobStatus",
             @"bestCandidate" : @"BestCandidate",
             @"creationTime" : @"CreationTime",
             @"endTime" : @"EndTime",
             @"failureReason" : @"FailureReason",
             @"generateCandidateDefinitionsOnly" : @"GenerateCandidateDefinitionsOnly",
             @"inputDataConfig" : @"InputDataConfig",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"outputDataConfig" : @"OutputDataConfig",
             @"problemType" : @"ProblemType",
             @"resolvedAttributes" : @"ResolvedAttributes",
             @"roleArn" : @"RoleArn",
             };
}

+ (NSValueTransformer *)autoMLJobArtifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAutoMLJobArtifacts class]];
}

+ (NSValueTransformer *)autoMLJobConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAutoMLJobConfig class]];
}

+ (NSValueTransformer *)autoMLJobObjectiveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAutoMLJobObjective class]];
}

+ (NSValueTransformer *)autoMLJobSecondaryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Starting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobSecondaryStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"AnalyzingData"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobSecondaryStatusAnalyzingData);
        }
        if ([value caseInsensitiveCompare:@"FeatureEngineering"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobSecondaryStatusFeatureEngineering);
        }
        if ([value caseInsensitiveCompare:@"ModelTuning"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobSecondaryStatusModelTuning);
        }
        if ([value caseInsensitiveCompare:@"MaxCandidatesReached"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobSecondaryStatusMaxCandidatesReached);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobSecondaryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobSecondaryStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"MaxAutoMLJobRuntimeReached"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobSecondaryStatusMaxAutoMLJobRuntimeReached);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobSecondaryStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"CandidateDefinitionsGenerated"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobSecondaryStatusCandidateDefinitionsGenerated);
        }
        return @(AWSapi.sagemakerAutoMLJobSecondaryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAutoMLJobSecondaryStatusStarting:
                return @"Starting";
            case AWSapi.sagemakerAutoMLJobSecondaryStatusAnalyzingData:
                return @"AnalyzingData";
            case AWSapi.sagemakerAutoMLJobSecondaryStatusFeatureEngineering:
                return @"FeatureEngineering";
            case AWSapi.sagemakerAutoMLJobSecondaryStatusModelTuning:
                return @"ModelTuning";
            case AWSapi.sagemakerAutoMLJobSecondaryStatusMaxCandidatesReached:
                return @"MaxCandidatesReached";
            case AWSapi.sagemakerAutoMLJobSecondaryStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerAutoMLJobSecondaryStatusStopped:
                return @"Stopped";
            case AWSapi.sagemakerAutoMLJobSecondaryStatusMaxAutoMLJobRuntimeReached:
                return @"MaxAutoMLJobRuntimeReached";
            case AWSapi.sagemakerAutoMLJobSecondaryStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerAutoMLJobSecondaryStatusCandidateDefinitionsGenerated:
                return @"CandidateDefinitionsGenerated";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)autoMLJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobStatusStopping);
        }
        return @(AWSapi.sagemakerAutoMLJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAutoMLJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerAutoMLJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerAutoMLJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerAutoMLJobStatusStopped:
                return @"Stopped";
            case AWSapi.sagemakerAutoMLJobStatusStopping:
                return @"Stopping";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)bestCandidateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAutoMLCandidate class]];
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

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerAutoMLChannel class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAutoMLOutputDataConfig class]];
}

+ (NSValueTransformer *)problemTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BinaryClassification"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProblemTypeBinaryClassification);
        }
        if ([value caseInsensitiveCompare:@"MulticlassClassification"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProblemTypeMulticlassClassification);
        }
        if ([value caseInsensitiveCompare:@"Regression"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProblemTypeRegression);
        }
        return @(AWSapi.sagemakerProblemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerProblemTypeBinaryClassification:
                return @"BinaryClassification";
            case AWSapi.sagemakerProblemTypeMulticlassClassification:
                return @"MulticlassClassification";
            case AWSapi.sagemakerProblemTypeRegression:
                return @"Regression";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resolvedAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerResolvedAttributes class]];
}

@end

@implementation AWSapi.sagemakerDescribeCodeRepositoryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositoryName" : @"CodeRepositoryName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeCodeRepositoryOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositoryArn" : @"CodeRepositoryArn",
             @"codeRepositoryName" : @"CodeRepositoryName",
             @"creationTime" : @"CreationTime",
             @"gitConfig" : @"GitConfig",
             @"lastModifiedTime" : @"LastModifiedTime",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)gitConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerGitConfig class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.sagemakerDescribeCompilationJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compilationJobName" : @"CompilationJobName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeCompilationJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compilationEndTime" : @"CompilationEndTime",
             @"compilationJobArn" : @"CompilationJobArn",
             @"compilationJobName" : @"CompilationJobName",
             @"compilationJobStatus" : @"CompilationJobStatus",
             @"compilationStartTime" : @"CompilationStartTime",
             @"creationTime" : @"CreationTime",
             @"failureReason" : @"FailureReason",
             @"inputConfig" : @"InputConfig",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"modelArtifacts" : @"ModelArtifacts",
             @"outputConfig" : @"OutputConfig",
             @"roleArn" : @"RoleArn",
             @"stoppingCondition" : @"StoppingCondition",
             };
}

+ (NSValueTransformer *)compilationEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)compilationJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INPROGRESS"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompilationJobStatusInprogress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompilationJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompilationJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompilationJobStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompilationJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompilationJobStatusStopped);
        }
        return @(AWSapi.sagemakerCompilationJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerCompilationJobStatusInprogress:
                return @"INPROGRESS";
            case AWSapi.sagemakerCompilationJobStatusCompleted:
                return @"COMPLETED";
            case AWSapi.sagemakerCompilationJobStatusFailed:
                return @"FAILED";
            case AWSapi.sagemakerCompilationJobStatusStarting:
                return @"STARTING";
            case AWSapi.sagemakerCompilationJobStatusStopping:
                return @"STOPPING";
            case AWSapi.sagemakerCompilationJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)compilationStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerInputConfig class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)modelArtifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerModelArtifacts class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerOutputConfig class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerStoppingCondition class]];
}

@end

@implementation AWSapi.sagemakerDescribeDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             };
}

@end

@implementation AWSapi.sagemakerDescribeDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authMode" : @"AuthMode",
             @"creationTime" : @"CreationTime",
             @"defaultUserSettings" : @"DefaultUserSettings",
             @"domainArn" : @"DomainArn",
             @"domainId" : @"DomainId",
             @"domainName" : @"DomainName",
             @"failureReason" : @"FailureReason",
             @"homeEfsFileSystemId" : @"HomeEfsFileSystemId",
             @"homeEfsFileSystemKmsKeyId" : @"HomeEfsFileSystemKmsKeyId",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"singleSignOnManagedApplicationInstanceId" : @"SingleSignOnManagedApplicationInstanceId",
             @"status" : @"Status",
             @"subnetIds" : @"SubnetIds",
             @"url" : @"Url",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)authModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SSO"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAuthModeSso);
        }
        if ([value caseInsensitiveCompare:@"IAM"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAuthModeIam);
        }
        return @(AWSapi.sagemakerAuthModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAuthModeSso:
                return @"SSO";
            case AWSapi.sagemakerAuthModeIam:
                return @"IAM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)defaultUserSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserSettings class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerDomainStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerDomainStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSapi.sagemakerDomainStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerDomainStatusPending);
        }
        return @(AWSapi.sagemakerDomainStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerDomainStatusDeleting:
                return @"Deleting";
            case AWSapi.sagemakerDomainStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerDomainStatusInService:
                return @"InService";
            case AWSapi.sagemakerDomainStatusPending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerDescribeEndpointConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointConfigName" : @"EndpointConfigName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeEndpointConfigOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"dataCaptureConfig" : @"DataCaptureConfig",
             @"endpointConfigArn" : @"EndpointConfigArn",
             @"endpointConfigName" : @"EndpointConfigName",
             @"kmsKeyId" : @"KmsKeyId",
             @"productionVariants" : @"ProductionVariants",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)dataCaptureConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerDataCaptureConfig class]];
}

+ (NSValueTransformer *)productionVariantsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerProductionVariant class]];
}

@end

@implementation AWSapi.sagemakerDescribeEndpointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointName" : @"EndpointName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeEndpointOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"dataCaptureConfig" : @"DataCaptureConfig",
             @"endpointArn" : @"EndpointArn",
             @"endpointConfigName" : @"EndpointConfigName",
             @"endpointName" : @"EndpointName",
             @"endpointStatus" : @"EndpointStatus",
             @"failureReason" : @"FailureReason",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"productionVariants" : @"ProductionVariants",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)dataCaptureConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerDataCaptureConfigSummary class]];
}

+ (NSValueTransformer *)endpointStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OutOfService"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusOutOfService);
        }
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"SystemUpdating"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusSystemUpdating);
        }
        if ([value caseInsensitiveCompare:@"RollingBack"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusRollingBack);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusFailed);
        }
        return @(AWSapi.sagemakerEndpointStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerEndpointStatusOutOfService:
                return @"OutOfService";
            case AWSapi.sagemakerEndpointStatusCreating:
                return @"Creating";
            case AWSapi.sagemakerEndpointStatusUpdating:
                return @"Updating";
            case AWSapi.sagemakerEndpointStatusSystemUpdating:
                return @"SystemUpdating";
            case AWSapi.sagemakerEndpointStatusRollingBack:
                return @"RollingBack";
            case AWSapi.sagemakerEndpointStatusInService:
                return @"InService";
            case AWSapi.sagemakerEndpointStatusDeleting:
                return @"Deleting";
            case AWSapi.sagemakerEndpointStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)productionVariantsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerProductionVariantSummary class]];
}

@end

@implementation AWSapi.sagemakerDescribeExperimentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentName" : @"ExperimentName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeExperimentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdBy" : @"CreatedBy",
             @"creationTime" : @"CreationTime",
             @"detail" : @"Description",
             @"displayName" : @"DisplayName",
             @"experimentArn" : @"ExperimentArn",
             @"experimentName" : @"ExperimentName",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"source" : @"Source",
             };
}

+ (NSValueTransformer *)createdByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserContext class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserContext class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerExperimentSource class]];
}

@end

@implementation AWSapi.sagemakerDescribeFlowDefinitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flowDefinitionName" : @"FlowDefinitionName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeFlowDefinitionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"failureReason" : @"FailureReason",
             @"flowDefinitionArn" : @"FlowDefinitionArn",
             @"flowDefinitionName" : @"FlowDefinitionName",
             @"flowDefinitionStatus" : @"FlowDefinitionStatus",
             @"humanLoopActivationConfig" : @"HumanLoopActivationConfig",
             @"humanLoopConfig" : @"HumanLoopConfig",
             @"humanLoopRequestSource" : @"HumanLoopRequestSource",
             @"outputConfig" : @"OutputConfig",
             @"roleArn" : @"RoleArn",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)flowDefinitionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Initializing"] == NSOrderedSame) {
            return @(AWSapi.sagemakerFlowDefinitionStatusInitializing);
        }
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSapi.sagemakerFlowDefinitionStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerFlowDefinitionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerFlowDefinitionStatusDeleting);
        }
        return @(AWSapi.sagemakerFlowDefinitionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerFlowDefinitionStatusInitializing:
                return @"Initializing";
            case AWSapi.sagemakerFlowDefinitionStatusActive:
                return @"Active";
            case AWSapi.sagemakerFlowDefinitionStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerFlowDefinitionStatusDeleting:
                return @"Deleting";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)humanLoopActivationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerHumanLoopActivationConfig class]];
}

+ (NSValueTransformer *)humanLoopConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerHumanLoopConfig class]];
}

+ (NSValueTransformer *)humanLoopRequestSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerHumanLoopRequestSource class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerFlowDefinitionOutputConfig class]];
}

@end

@implementation AWSapi.sagemakerDescribeHumanTaskUiRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanTaskUiName" : @"HumanTaskUiName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeHumanTaskUiResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"humanTaskUiArn" : @"HumanTaskUiArn",
             @"humanTaskUiName" : @"HumanTaskUiName",
             @"uiTemplate" : @"UiTemplate",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)uiTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUiTemplateInfo class]];
}

@end

@implementation AWSapi.sagemakerDescribeHyperParameterTuningJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hyperParameterTuningJobName" : @"HyperParameterTuningJobName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeHyperParameterTuningJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bestTrainingJob" : @"BestTrainingJob",
             @"creationTime" : @"CreationTime",
             @"failureReason" : @"FailureReason",
             @"hyperParameterTuningEndTime" : @"HyperParameterTuningEndTime",
             @"hyperParameterTuningJobArn" : @"HyperParameterTuningJobArn",
             @"hyperParameterTuningJobConfig" : @"HyperParameterTuningJobConfig",
             @"hyperParameterTuningJobName" : @"HyperParameterTuningJobName",
             @"hyperParameterTuningJobStatus" : @"HyperParameterTuningJobStatus",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"objectiveStatusCounters" : @"ObjectiveStatusCounters",
             @"overallBestTrainingJob" : @"OverallBestTrainingJob",
             @"trainingJobDefinition" : @"TrainingJobDefinition",
             @"trainingJobDefinitions" : @"TrainingJobDefinitions",
             @"trainingJobStatusCounters" : @"TrainingJobStatusCounters",
             @"warmStartConfig" : @"WarmStartConfig",
             };
}

+ (NSValueTransformer *)bestTrainingJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerHyperParameterTrainingJobSummary class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)hyperParameterTuningEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)hyperParameterTuningJobConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerHyperParameterTuningJobConfig class]];
}

+ (NSValueTransformer *)hyperParameterTuningJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobStatusStopping);
        }
        return @(AWSapi.sagemakerHyperParameterTuningJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerHyperParameterTuningJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerHyperParameterTuningJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerHyperParameterTuningJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerHyperParameterTuningJobStatusStopped:
                return @"Stopped";
            case AWSapi.sagemakerHyperParameterTuningJobStatusStopping:
                return @"Stopping";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)objectiveStatusCountersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerObjectiveStatusCounters class]];
}

+ (NSValueTransformer *)overallBestTrainingJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerHyperParameterTrainingJobSummary class]];
}

+ (NSValueTransformer *)trainingJobDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerHyperParameterTrainingJobDefinition class]];
}

+ (NSValueTransformer *)trainingJobDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerHyperParameterTrainingJobDefinition class]];
}

+ (NSValueTransformer *)trainingJobStatusCountersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrainingJobStatusCounters class]];
}

+ (NSValueTransformer *)warmStartConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerHyperParameterTuningJobWarmStartConfig class]];
}

@end

@implementation AWSapi.sagemakerDescribeLabelingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelingJobName" : @"LabelingJobName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeLabelingJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"failureReason" : @"FailureReason",
             @"humanTaskConfig" : @"HumanTaskConfig",
             @"inputConfig" : @"InputConfig",
             @"jobReferenceCode" : @"JobReferenceCode",
             @"labelAttributeName" : @"LabelAttributeName",
             @"labelCategoryConfigS3Uri" : @"LabelCategoryConfigS3Uri",
             @"labelCounters" : @"LabelCounters",
             @"labelingJobAlgorithmsConfig" : @"LabelingJobAlgorithmsConfig",
             @"labelingJobArn" : @"LabelingJobArn",
             @"labelingJobName" : @"LabelingJobName",
             @"labelingJobOutput" : @"LabelingJobOutput",
             @"labelingJobStatus" : @"LabelingJobStatus",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"outputConfig" : @"OutputConfig",
             @"roleArn" : @"RoleArn",
             @"stoppingConditions" : @"StoppingConditions",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)humanTaskConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerHumanTaskConfig class]];
}

+ (NSValueTransformer *)inputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerLabelingJobInputConfig class]];
}

+ (NSValueTransformer *)labelCountersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerLabelCounters class]];
}

+ (NSValueTransformer *)labelingJobAlgorithmsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerLabelingJobAlgorithmsConfig class]];
}

+ (NSValueTransformer *)labelingJobOutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerLabelingJobOutput class]];
}

+ (NSValueTransformer *)labelingJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerLabelingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerLabelingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerLabelingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerLabelingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerLabelingJobStatusStopped);
        }
        return @(AWSapi.sagemakerLabelingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerLabelingJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerLabelingJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerLabelingJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerLabelingJobStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerLabelingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerLabelingJobOutputConfig class]];
}

+ (NSValueTransformer *)stoppingConditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerLabelingJobStoppingConditions class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerDescribeModelInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelName" : @"ModelName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeModelOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"containers" : @"Containers",
             @"creationTime" : @"CreationTime",
             @"enableNetworkIsolation" : @"EnableNetworkIsolation",
             @"executionRoleArn" : @"ExecutionRoleArn",
             @"modelArn" : @"ModelArn",
             @"modelName" : @"ModelName",
             @"primaryContainer" : @"PrimaryContainer",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)containersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerContainerDefinition class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)primaryContainerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerContainerDefinition class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerVpcConfig class]];
}

@end

@implementation AWSapi.sagemakerDescribeModelPackageInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelPackageName" : @"ModelPackageName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeModelPackageOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certifyForMarketplace" : @"CertifyForMarketplace",
             @"creationTime" : @"CreationTime",
             @"inferenceSpecification" : @"InferenceSpecification",
             @"modelPackageArn" : @"ModelPackageArn",
             @"modelPackageDescription" : @"ModelPackageDescription",
             @"modelPackageName" : @"ModelPackageName",
             @"modelPackageStatus" : @"ModelPackageStatus",
             @"modelPackageStatusDetails" : @"ModelPackageStatusDetails",
             @"sourceAlgorithmSpecification" : @"SourceAlgorithmSpecification",
             @"validationSpecification" : @"ValidationSpecification",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inferenceSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerInferenceSpecification class]];
}

+ (NSValueTransformer *)modelPackageStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerModelPackageStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerModelPackageStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerModelPackageStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerModelPackageStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerModelPackageStatusDeleting);
        }
        return @(AWSapi.sagemakerModelPackageStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerModelPackageStatusPending:
                return @"Pending";
            case AWSapi.sagemakerModelPackageStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerModelPackageStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerModelPackageStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerModelPackageStatusDeleting:
                return @"Deleting";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modelPackageStatusDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerModelPackageStatusDetails class]];
}

+ (NSValueTransformer *)sourceAlgorithmSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerSourceAlgorithmSpecification class]];
}

+ (NSValueTransformer *)validationSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerModelPackageValidationSpecification class]];
}

@end

@implementation AWSapi.sagemakerDescribeMonitoringScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeMonitoringScheduleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"endpointName" : @"EndpointName",
             @"failureReason" : @"FailureReason",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"lastMonitoringExecutionSummary" : @"LastMonitoringExecutionSummary",
             @"monitoringScheduleArn" : @"MonitoringScheduleArn",
             @"monitoringScheduleConfig" : @"MonitoringScheduleConfig",
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             @"monitoringScheduleStatus" : @"MonitoringScheduleStatus",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastMonitoringExecutionSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerMonitoringExecutionSummary class]];
}

+ (NSValueTransformer *)monitoringScheduleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerMonitoringScheduleConfig class]];
}

+ (NSValueTransformer *)monitoringScheduleStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerScheduleStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerScheduleStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Scheduled"] == NSOrderedSame) {
            return @(AWSapi.sagemakerScheduleStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerScheduleStatusStopped);
        }
        return @(AWSapi.sagemakerScheduleStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerScheduleStatusPending:
                return @"Pending";
            case AWSapi.sagemakerScheduleStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerScheduleStatusScheduled:
                return @"Scheduled";
            case AWSapi.sagemakerScheduleStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerDescribeNotebookInstanceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceName" : @"NotebookInstanceName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceLifecycleConfigName" : @"NotebookInstanceLifecycleConfigName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"notebookInstanceLifecycleConfigArn" : @"NotebookInstanceLifecycleConfigArn",
             @"notebookInstanceLifecycleConfigName" : @"NotebookInstanceLifecycleConfigName",
             @"onCreate" : @"OnCreate",
             @"onStart" : @"OnStart",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)onCreateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerNotebookInstanceLifecycleHook class]];
}

+ (NSValueTransformer *)onStartJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerNotebookInstanceLifecycleHook class]];
}

@end

@implementation AWSapi.sagemakerDescribeNotebookInstanceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceleratorTypes" : @"AcceleratorTypes",
             @"additionalCodeRepositories" : @"AdditionalCodeRepositories",
             @"creationTime" : @"CreationTime",
             @"defaultCodeRepository" : @"DefaultCodeRepository",
             @"directInternetAccess" : @"DirectInternetAccess",
             @"failureReason" : @"FailureReason",
             @"instanceType" : @"InstanceType",
             @"kmsKeyId" : @"KmsKeyId",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"notebookInstanceArn" : @"NotebookInstanceArn",
             @"notebookInstanceLifecycleConfigName" : @"NotebookInstanceLifecycleConfigName",
             @"notebookInstanceName" : @"NotebookInstanceName",
             @"notebookInstanceStatus" : @"NotebookInstanceStatus",
             @"roleArn" : @"RoleArn",
             @"rootAccess" : @"RootAccess",
             @"securityGroups" : @"SecurityGroups",
             @"subnetId" : @"SubnetId",
             @"url" : @"Url",
             @"volumeSizeInGB" : @"VolumeSizeInGB",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)directInternetAccessJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSapi.sagemakerDirectInternetAccessEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSapi.sagemakerDirectInternetAccessDisabled);
        }
        return @(AWSapi.sagemakerDirectInternetAccessUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerDirectInternetAccessEnabled:
                return @"Enabled";
            case AWSapi.sagemakerDirectInternetAccessDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ml.t2.medium"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT2Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT2Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT22xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.medium"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.9xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5d9xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.18xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5d18xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP316xlarge);
        }
        return @(AWSapi.sagemakerInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerInstanceTypeMlT2Medium:
                return @"ml.t2.medium";
            case AWSapi.sagemakerInstanceTypeMlT2Large:
                return @"ml.t2.large";
            case AWSapi.sagemakerInstanceTypeMlT2Xlarge:
                return @"ml.t2.xlarge";
            case AWSapi.sagemakerInstanceTypeMlT22xlarge:
                return @"ml.t2.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSapi.sagemakerInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSapi.sagemakerInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSapi.sagemakerInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSapi.sagemakerInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSapi.sagemakerInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSapi.sagemakerInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSapi.sagemakerInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSapi.sagemakerInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSapi.sagemakerInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSapi.sagemakerInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSapi.sagemakerInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSapi.sagemakerInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSapi.sagemakerInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSapi.sagemakerInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSapi.sagemakerInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSapi.sagemakerInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5dXlarge:
                return @"ml.c5d.xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5d2xlarge:
                return @"ml.c5d.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5d4xlarge:
                return @"ml.c5d.4xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5d9xlarge:
                return @"ml.c5d.9xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5d18xlarge:
                return @"ml.c5d.18xlarge";
            case AWSapi.sagemakerInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSapi.sagemakerInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSapi.sagemakerInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSapi.sagemakerInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSapi.sagemakerInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)notebookInstanceStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusUpdating);
        }
        return @(AWSapi.sagemakerNotebookInstanceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerNotebookInstanceStatusPending:
                return @"Pending";
            case AWSapi.sagemakerNotebookInstanceStatusInService:
                return @"InService";
            case AWSapi.sagemakerNotebookInstanceStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerNotebookInstanceStatusStopped:
                return @"Stopped";
            case AWSapi.sagemakerNotebookInstanceStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerNotebookInstanceStatusDeleting:
                return @"Deleting";
            case AWSapi.sagemakerNotebookInstanceStatusUpdating:
                return @"Updating";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rootAccessJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSapi.sagemakerRootAccessEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSapi.sagemakerRootAccessDisabled);
        }
        return @(AWSapi.sagemakerRootAccessUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerRootAccessEnabled:
                return @"Enabled";
            case AWSapi.sagemakerRootAccessDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerDescribeProcessingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"processingJobName" : @"ProcessingJobName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeProcessingJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appSpecification" : @"AppSpecification",
             @"autoMLJobArn" : @"AutoMLJobArn",
             @"creationTime" : @"CreationTime",
             @"environment" : @"Environment",
             @"exitMessage" : @"ExitMessage",
             @"experimentConfig" : @"ExperimentConfig",
             @"failureReason" : @"FailureReason",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"monitoringScheduleArn" : @"MonitoringScheduleArn",
             @"networkConfig" : @"NetworkConfig",
             @"processingEndTime" : @"ProcessingEndTime",
             @"processingInputs" : @"ProcessingInputs",
             @"processingJobArn" : @"ProcessingJobArn",
             @"processingJobName" : @"ProcessingJobName",
             @"processingJobStatus" : @"ProcessingJobStatus",
             @"processingOutputConfig" : @"ProcessingOutputConfig",
             @"processingResources" : @"ProcessingResources",
             @"processingStartTime" : @"ProcessingStartTime",
             @"roleArn" : @"RoleArn",
             @"stoppingCondition" : @"StoppingCondition",
             @"trainingJobArn" : @"TrainingJobArn",
             };
}

+ (NSValueTransformer *)appSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAppSpecification class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerExperimentConfig class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)networkConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerNetworkConfig class]];
}

+ (NSValueTransformer *)processingEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)processingInputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerProcessingInput class]];
}

+ (NSValueTransformer *)processingJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingJobStatusStopped);
        }
        return @(AWSapi.sagemakerProcessingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerProcessingJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerProcessingJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerProcessingJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerProcessingJobStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerProcessingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)processingOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerProcessingOutputConfig class]];
}

+ (NSValueTransformer *)processingResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerProcessingResources class]];
}

+ (NSValueTransformer *)processingStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerProcessingStoppingCondition class]];
}

@end

@implementation AWSapi.sagemakerDescribeSubscribedWorkteamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workteamArn" : @"WorkteamArn",
             };
}

@end

@implementation AWSapi.sagemakerDescribeSubscribedWorkteamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subscribedWorkteam" : @"SubscribedWorkteam",
             };
}

+ (NSValueTransformer *)subscribedWorkteamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerSubscribedWorkteam class]];
}

@end

@implementation AWSapi.sagemakerDescribeTrainingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trainingJobName" : @"TrainingJobName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeTrainingJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmSpecification" : @"AlgorithmSpecification",
             @"autoMLJobArn" : @"AutoMLJobArn",
             @"billableTimeInSeconds" : @"BillableTimeInSeconds",
             @"checkpointConfig" : @"CheckpointConfig",
             @"creationTime" : @"CreationTime",
             @"debugHookConfig" : @"DebugHookConfig",
             @"debugRuleConfigurations" : @"DebugRuleConfigurations",
             @"debugRuleEvaluationStatuses" : @"DebugRuleEvaluationStatuses",
             @"enableInterContainerTrafficEncryption" : @"EnableInterContainerTrafficEncryption",
             @"enableManagedSpotTraining" : @"EnableManagedSpotTraining",
             @"enableNetworkIsolation" : @"EnableNetworkIsolation",
             @"experimentConfig" : @"ExperimentConfig",
             @"failureReason" : @"FailureReason",
             @"finalMetricDataList" : @"FinalMetricDataList",
             @"hyperParameters" : @"HyperParameters",
             @"inputDataConfig" : @"InputDataConfig",
             @"labelingJobArn" : @"LabelingJobArn",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"modelArtifacts" : @"ModelArtifacts",
             @"outputDataConfig" : @"OutputDataConfig",
             @"resourceConfig" : @"ResourceConfig",
             @"roleArn" : @"RoleArn",
             @"secondaryStatus" : @"SecondaryStatus",
             @"secondaryStatusTransitions" : @"SecondaryStatusTransitions",
             @"stoppingCondition" : @"StoppingCondition",
             @"tensorBoardOutputConfig" : @"TensorBoardOutputConfig",
             @"trainingEndTime" : @"TrainingEndTime",
             @"trainingJobArn" : @"TrainingJobArn",
             @"trainingJobName" : @"TrainingJobName",
             @"trainingJobStatus" : @"TrainingJobStatus",
             @"trainingStartTime" : @"TrainingStartTime",
             @"trainingTimeInSeconds" : @"TrainingTimeInSeconds",
             @"tuningJobArn" : @"TuningJobArn",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)algorithmSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAlgorithmSpecification class]];
}

+ (NSValueTransformer *)checkpointConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerCheckpointConfig class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)debugHookConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerDebugHookConfig class]];
}

+ (NSValueTransformer *)debugRuleConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerDebugRuleConfiguration class]];
}

+ (NSValueTransformer *)debugRuleEvaluationStatusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerDebugRuleEvaluationStatus class]];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerExperimentConfig class]];
}

+ (NSValueTransformer *)finalMetricDataListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerMetricData class]];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerChannel class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)modelArtifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerModelArtifacts class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerOutputDataConfig class]];
}

+ (NSValueTransformer *)resourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerResourceConfig class]];
}

+ (NSValueTransformer *)secondaryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Starting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"LaunchingMLInstances"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusLaunchingMLInstances);
        }
        if ([value caseInsensitiveCompare:@"PreparingTrainingStack"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusPreparingTrainingStack);
        }
        if ([value caseInsensitiveCompare:@"Downloading"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusDownloading);
        }
        if ([value caseInsensitiveCompare:@"DownloadingTrainingImage"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusDownloadingTrainingImage);
        }
        if ([value caseInsensitiveCompare:@"Training"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusTraining);
        }
        if ([value caseInsensitiveCompare:@"Uploading"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusUploading);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"MaxRuntimeExceeded"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusMaxRuntimeExceeded);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Interrupted"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusInterrupted);
        }
        if ([value caseInsensitiveCompare:@"MaxWaitTimeExceeded"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusMaxWaitTimeExceeded);
        }
        return @(AWSapi.sagemakerSecondaryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSecondaryStatusStarting:
                return @"Starting";
            case AWSapi.sagemakerSecondaryStatusLaunchingMLInstances:
                return @"LaunchingMLInstances";
            case AWSapi.sagemakerSecondaryStatusPreparingTrainingStack:
                return @"PreparingTrainingStack";
            case AWSapi.sagemakerSecondaryStatusDownloading:
                return @"Downloading";
            case AWSapi.sagemakerSecondaryStatusDownloadingTrainingImage:
                return @"DownloadingTrainingImage";
            case AWSapi.sagemakerSecondaryStatusTraining:
                return @"Training";
            case AWSapi.sagemakerSecondaryStatusUploading:
                return @"Uploading";
            case AWSapi.sagemakerSecondaryStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerSecondaryStatusStopped:
                return @"Stopped";
            case AWSapi.sagemakerSecondaryStatusMaxRuntimeExceeded:
                return @"MaxRuntimeExceeded";
            case AWSapi.sagemakerSecondaryStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerSecondaryStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerSecondaryStatusInterrupted:
                return @"Interrupted";
            case AWSapi.sagemakerSecondaryStatusMaxWaitTimeExceeded:
                return @"MaxWaitTimeExceeded";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)secondaryStatusTransitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerSecondaryStatusTransition class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerStoppingCondition class]];
}

+ (NSValueTransformer *)tensorBoardOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTensorBoardOutputConfig class]];
}

+ (NSValueTransformer *)trainingEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)trainingJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusStopped);
        }
        return @(AWSapi.sagemakerTrainingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerTrainingJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerTrainingJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerTrainingJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerTrainingJobStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerTrainingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)trainingStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerVpcConfig class]];
}

@end

@implementation AWSapi.sagemakerDescribeTransformJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformJobName" : @"TransformJobName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeTransformJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLJobArn" : @"AutoMLJobArn",
             @"batchStrategy" : @"BatchStrategy",
             @"creationTime" : @"CreationTime",
             @"dataProcessing" : @"DataProcessing",
             @"environment" : @"Environment",
             @"experimentConfig" : @"ExperimentConfig",
             @"failureReason" : @"FailureReason",
             @"labelingJobArn" : @"LabelingJobArn",
             @"maxConcurrentTransforms" : @"MaxConcurrentTransforms",
             @"maxPayloadInMB" : @"MaxPayloadInMB",
             @"modelName" : @"ModelName",
             @"transformEndTime" : @"TransformEndTime",
             @"transformInput" : @"TransformInput",
             @"transformJobArn" : @"TransformJobArn",
             @"transformJobName" : @"TransformJobName",
             @"transformJobStatus" : @"TransformJobStatus",
             @"transformOutput" : @"TransformOutput",
             @"transformResources" : @"TransformResources",
             @"transformStartTime" : @"TransformStartTime",
             };
}

+ (NSValueTransformer *)batchStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MultiRecord"] == NSOrderedSame) {
            return @(AWSapi.sagemakerBatchStrategyMultiRecord);
        }
        if ([value caseInsensitiveCompare:@"SingleRecord"] == NSOrderedSame) {
            return @(AWSapi.sagemakerBatchStrategySingleRecord);
        }
        return @(AWSapi.sagemakerBatchStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerBatchStrategyMultiRecord:
                return @"MultiRecord";
            case AWSapi.sagemakerBatchStrategySingleRecord:
                return @"SingleRecord";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)dataProcessingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerDataProcessing class]];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerExperimentConfig class]];
}

+ (NSValueTransformer *)transformEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)transformInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTransformInput class]];
}

+ (NSValueTransformer *)transformJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformJobStatusStopped);
        }
        return @(AWSapi.sagemakerTransformJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerTransformJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerTransformJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerTransformJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerTransformJobStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerTransformJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transformOutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTransformOutput class]];
}

+ (NSValueTransformer *)transformResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTransformResources class]];
}

+ (NSValueTransformer *)transformStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.sagemakerDescribeTrialComponentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentName" : @"TrialComponentName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeTrialComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdBy" : @"CreatedBy",
             @"creationTime" : @"CreationTime",
             @"displayName" : @"DisplayName",
             @"endTime" : @"EndTime",
             @"inputArtifacts" : @"InputArtifacts",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"metrics" : @"Metrics",
             @"outputArtifacts" : @"OutputArtifacts",
             @"parameters" : @"Parameters",
             @"source" : @"Source",
             @"startTime" : @"StartTime",
             @"status" : @"Status",
             @"trialComponentArn" : @"TrialComponentArn",
             @"trialComponentName" : @"TrialComponentName",
             };
}

+ (NSValueTransformer *)createdByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserContext class]];
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

+ (NSValueTransformer *)inputArtifactsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapi.sagemakerTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)lastModifiedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserContext class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)metricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTrialComponentMetricSummary class]];
}

+ (NSValueTransformer *)outputArtifactsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapi.sagemakerTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapi.sagemakerTrialComponentParameterValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrialComponentSource class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrialComponentStatus class]];
}

@end

@implementation AWSapi.sagemakerDescribeTrialRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeTrialResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdBy" : @"CreatedBy",
             @"creationTime" : @"CreationTime",
             @"displayName" : @"DisplayName",
             @"experimentName" : @"ExperimentName",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"source" : @"Source",
             @"trialArn" : @"TrialArn",
             @"trialName" : @"TrialName",
             };
}

+ (NSValueTransformer *)createdByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserContext class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserContext class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrialSource class]];
}

@end

@implementation AWSapi.sagemakerDescribeUserProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             @"userProfileName" : @"UserProfileName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeUserProfileResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"domainId" : @"DomainId",
             @"failureReason" : @"FailureReason",
             @"homeEfsFileSystemUid" : @"HomeEfsFileSystemUid",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"singleSignOnUserIdentifier" : @"SingleSignOnUserIdentifier",
             @"singleSignOnUserValue" : @"SingleSignOnUserValue",
             @"status" : @"Status",
             @"userProfileArn" : @"UserProfileArn",
             @"userProfileName" : @"UserProfileName",
             @"userSettings" : @"UserSettings",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerUserProfileStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerUserProfileStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSapi.sagemakerUserProfileStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerUserProfileStatusPending);
        }
        return @(AWSapi.sagemakerUserProfileStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerUserProfileStatusDeleting:
                return @"Deleting";
            case AWSapi.sagemakerUserProfileStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerUserProfileStatusInService:
                return @"InService";
            case AWSapi.sagemakerUserProfileStatusPending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)userSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserSettings class]];
}

@end

@implementation AWSapi.sagemakerDescribeWorkforceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workforceName" : @"WorkforceName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeWorkforceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workforce" : @"Workforce",
             };
}

+ (NSValueTransformer *)workforceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerWorkforce class]];
}

@end

@implementation AWSapi.sagemakerDescribeWorkteamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workteamName" : @"WorkteamName",
             };
}

@end

@implementation AWSapi.sagemakerDescribeWorkteamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workteam" : @"Workteam",
             };
}

+ (NSValueTransformer *)workteamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerWorkteam class]];
}

@end

@implementation AWSapi.sagemakerDesiredWeightAndCapacity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"desiredInstanceCount" : @"DesiredInstanceCount",
             @"desiredWeight" : @"DesiredWeight",
             @"variantName" : @"VariantName",
             };
}

@end

@implementation AWSapi.sagemakerDisassociateTrialComponentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentName" : @"TrialComponentName",
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSapi.sagemakerDisassociateTrialComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialArn" : @"TrialArn",
             @"trialComponentArn" : @"TrialComponentArn",
             };
}

@end

@implementation AWSapi.sagemakerDomainDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"domainArn" : @"DomainArn",
             @"domainId" : @"DomainId",
             @"domainName" : @"DomainName",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"status" : @"Status",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerDomainStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerDomainStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSapi.sagemakerDomainStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerDomainStatusPending);
        }
        return @(AWSapi.sagemakerDomainStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerDomainStatusDeleting:
                return @"Deleting";
            case AWSapi.sagemakerDomainStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerDomainStatusInService:
                return @"InService";
            case AWSapi.sagemakerDomainStatusPending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerEndpointConfigSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"endpointConfigArn" : @"EndpointConfigArn",
             @"endpointConfigName" : @"EndpointConfigName",
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

@implementation AWSapi.sagemakerEndpointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointName" : @"EndpointName",
             @"localPath" : @"LocalPath",
             @"s3DataDistributionType" : @"S3DataDistributionType",
             @"s3InputMode" : @"S3InputMode",
             };
}

+ (NSValueTransformer *)s3DataDistributionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FullyReplicated"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingS3DataDistributionTypeFullyReplicated);
        }
        if ([value caseInsensitiveCompare:@"ShardedByS3Key"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingS3DataDistributionTypeShardedByS3Key);
        }
        return @(AWSapi.sagemakerProcessingS3DataDistributionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerProcessingS3DataDistributionTypeFullyReplicated:
                return @"FullyReplicated";
            case AWSapi.sagemakerProcessingS3DataDistributionTypeShardedByS3Key:
                return @"ShardedByS3Key";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3InputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pipe"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingS3InputModePipe);
        }
        if ([value caseInsensitiveCompare:@"File"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingS3InputModeFile);
        }
        return @(AWSapi.sagemakerProcessingS3InputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerProcessingS3InputModePipe:
                return @"Pipe";
            case AWSapi.sagemakerProcessingS3InputModeFile:
                return @"File";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerEndpointSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"endpointArn" : @"EndpointArn",
             @"endpointName" : @"EndpointName",
             @"endpointStatus" : @"EndpointStatus",
             @"lastModifiedTime" : @"LastModifiedTime",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)endpointStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OutOfService"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusOutOfService);
        }
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"SystemUpdating"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusSystemUpdating);
        }
        if ([value caseInsensitiveCompare:@"RollingBack"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusRollingBack);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusFailed);
        }
        return @(AWSapi.sagemakerEndpointStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerEndpointStatusOutOfService:
                return @"OutOfService";
            case AWSapi.sagemakerEndpointStatusCreating:
                return @"Creating";
            case AWSapi.sagemakerEndpointStatusUpdating:
                return @"Updating";
            case AWSapi.sagemakerEndpointStatusSystemUpdating:
                return @"SystemUpdating";
            case AWSapi.sagemakerEndpointStatusRollingBack:
                return @"RollingBack";
            case AWSapi.sagemakerEndpointStatusInService:
                return @"InService";
            case AWSapi.sagemakerEndpointStatusDeleting:
                return @"Deleting";
            case AWSapi.sagemakerEndpointStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.sagemakerExperiment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdBy" : @"CreatedBy",
             @"creationTime" : @"CreationTime",
             @"detail" : @"Description",
             @"displayName" : @"DisplayName",
             @"experimentArn" : @"ExperimentArn",
             @"experimentName" : @"ExperimentName",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"source" : @"Source",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)createdByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserContext class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserContext class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerExperimentSource class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerExperimentConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentName" : @"ExperimentName",
             @"trialComponentDisplayName" : @"TrialComponentDisplayName",
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSapi.sagemakerExperimentSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceArn" : @"SourceArn",
             @"sourceType" : @"SourceType",
             };
}

@end

@implementation AWSapi.sagemakerExperimentSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"displayName" : @"DisplayName",
             @"experimentArn" : @"ExperimentArn",
             @"experimentName" : @"ExperimentName",
             @"experimentSource" : @"ExperimentSource",
             @"lastModifiedTime" : @"LastModifiedTime",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)experimentSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerExperimentSource class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.sagemakerFileSystemDataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directoryPath" : @"DirectoryPath",
             @"fileSystemAccessMode" : @"FileSystemAccessMode",
             @"fileSystemId" : @"FileSystemId",
             @"fileSystemType" : @"FileSystemType",
             };
}

+ (NSValueTransformer *)fileSystemAccessModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"rw"] == NSOrderedSame) {
            return @(AWSapi.sagemakerFileSystemAccessModeRw);
        }
        if ([value caseInsensitiveCompare:@"ro"] == NSOrderedSame) {
            return @(AWSapi.sagemakerFileSystemAccessModeRo);
        }
        return @(AWSapi.sagemakerFileSystemAccessModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerFileSystemAccessModeRw:
                return @"rw";
            case AWSapi.sagemakerFileSystemAccessModeRo:
                return @"ro";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)fileSystemTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EFS"] == NSOrderedSame) {
            return @(AWSapi.sagemakerFileSystemTypeEfs);
        }
        if ([value caseInsensitiveCompare:@"FSxLustre"] == NSOrderedSame) {
            return @(AWSapi.sagemakerFileSystemTypeFSxLustre);
        }
        return @(AWSapi.sagemakerFileSystemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerFileSystemTypeEfs:
                return @"EFS";
            case AWSapi.sagemakerFileSystemTypeFSxLustre:
                return @"FSxLustre";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"operator" : @"Operator",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)operatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Equals"] == NSOrderedSame) {
            return @(AWSapi.sagemakerOperatorEquals);
        }
        if ([value caseInsensitiveCompare:@"NotEquals"] == NSOrderedSame) {
            return @(AWSapi.sagemakerOperatorNotEquals);
        }
        if ([value caseInsensitiveCompare:@"GreaterThan"] == NSOrderedSame) {
            return @(AWSapi.sagemakerOperatorGreaterThan);
        }
        if ([value caseInsensitiveCompare:@"GreaterThanOrEqualTo"] == NSOrderedSame) {
            return @(AWSapi.sagemakerOperatorGreaterThanOrEqualTo);
        }
        if ([value caseInsensitiveCompare:@"LessThan"] == NSOrderedSame) {
            return @(AWSapi.sagemakerOperatorLessThan);
        }
        if ([value caseInsensitiveCompare:@"LessThanOrEqualTo"] == NSOrderedSame) {
            return @(AWSapi.sagemakerOperatorLessThanOrEqualTo);
        }
        if ([value caseInsensitiveCompare:@"Contains"] == NSOrderedSame) {
            return @(AWSapi.sagemakerOperatorContains);
        }
        if ([value caseInsensitiveCompare:@"Exists"] == NSOrderedSame) {
            return @(AWSapi.sagemakerOperatorExists);
        }
        if ([value caseInsensitiveCompare:@"NotExists"] == NSOrderedSame) {
            return @(AWSapi.sagemakerOperatorNotExists);
        }
        if ([value caseInsensitiveCompare:@"In"] == NSOrderedSame) {
            return @(AWSapi.sagemakerOperatorIn);
        }
        return @(AWSapi.sagemakerOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerOperatorEquals:
                return @"Equals";
            case AWSapi.sagemakerOperatorNotEquals:
                return @"NotEquals";
            case AWSapi.sagemakerOperatorGreaterThan:
                return @"GreaterThan";
            case AWSapi.sagemakerOperatorGreaterThanOrEqualTo:
                return @"GreaterThanOrEqualTo";
            case AWSapi.sagemakerOperatorLessThan:
                return @"LessThan";
            case AWSapi.sagemakerOperatorLessThanOrEqualTo:
                return @"LessThanOrEqualTo";
            case AWSapi.sagemakerOperatorContains:
                return @"Contains";
            case AWSapi.sagemakerOperatorExists:
                return @"Exists";
            case AWSapi.sagemakerOperatorNotExists:
                return @"NotExists";
            case AWSapi.sagemakerOperatorIn:
                return @"In";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerFinalAutoMLJobObjectiveMetric

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricName" : @"MetricName",
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)metricNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Accuracy"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLMetricEnumAccuracy);
        }
        if ([value caseInsensitiveCompare:@"MSE"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLMetricEnumMse);
        }
        if ([value caseInsensitiveCompare:@"F1"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLMetricEnumF1);
        }
        if ([value caseInsensitiveCompare:@"F1macro"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLMetricEnumF1macro);
        }
        return @(AWSapi.sagemakerAutoMLMetricEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAutoMLMetricEnumAccuracy:
                return @"Accuracy";
            case AWSapi.sagemakerAutoMLMetricEnumMse:
                return @"MSE";
            case AWSapi.sagemakerAutoMLMetricEnumF1:
                return @"F1";
            case AWSapi.sagemakerAutoMLMetricEnumF1macro:
                return @"F1macro";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Maximize"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobObjectiveTypeMaximize);
        }
        if ([value caseInsensitiveCompare:@"Minimize"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobObjectiveTypeMinimize);
        }
        return @(AWSapi.sagemakerAutoMLJobObjectiveTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAutoMLJobObjectiveTypeMaximize:
                return @"Maximize";
            case AWSapi.sagemakerAutoMLJobObjectiveTypeMinimize:
                return @"Minimize";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerFinalHyperParameterTuningJobObjectiveMetric

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricName" : @"MetricName",
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Maximize"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobObjectiveTypeMaximize);
        }
        if ([value caseInsensitiveCompare:@"Minimize"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobObjectiveTypeMinimize);
        }
        return @(AWSapi.sagemakerHyperParameterTuningJobObjectiveTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerHyperParameterTuningJobObjectiveTypeMaximize:
                return @"Maximize";
            case AWSapi.sagemakerHyperParameterTuningJobObjectiveTypeMinimize:
                return @"Minimize";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerFlowDefinitionOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"s3OutputPath" : @"S3OutputPath",
             };
}

@end

@implementation AWSapi.sagemakerFlowDefinitionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"failureReason" : @"FailureReason",
             @"flowDefinitionArn" : @"FlowDefinitionArn",
             @"flowDefinitionName" : @"FlowDefinitionName",
             @"flowDefinitionStatus" : @"FlowDefinitionStatus",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)flowDefinitionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Initializing"] == NSOrderedSame) {
            return @(AWSapi.sagemakerFlowDefinitionStatusInitializing);
        }
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSapi.sagemakerFlowDefinitionStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerFlowDefinitionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerFlowDefinitionStatusDeleting);
        }
        return @(AWSapi.sagemakerFlowDefinitionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerFlowDefinitionStatusInitializing:
                return @"Initializing";
            case AWSapi.sagemakerFlowDefinitionStatusActive:
                return @"Active";
            case AWSapi.sagemakerFlowDefinitionStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerFlowDefinitionStatusDeleting:
                return @"Deleting";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerGetSearchSuggestionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resource" : @"Resource",
             @"suggestionQuery" : @"SuggestionQuery",
             };
}

+ (NSValueTransformer *)resourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TrainingJob"] == NSOrderedSame) {
            return @(AWSapi.sagemakerResourceTypeTrainingJob);
        }
        if ([value caseInsensitiveCompare:@"Experiment"] == NSOrderedSame) {
            return @(AWSapi.sagemakerResourceTypeExperiment);
        }
        if ([value caseInsensitiveCompare:@"ExperimentTrial"] == NSOrderedSame) {
            return @(AWSapi.sagemakerResourceTypeExperimentTrial);
        }
        if ([value caseInsensitiveCompare:@"ExperimentTrialComponent"] == NSOrderedSame) {
            return @(AWSapi.sagemakerResourceTypeExperimentTrialComponent);
        }
        return @(AWSapi.sagemakerResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerResourceTypeTrainingJob:
                return @"TrainingJob";
            case AWSapi.sagemakerResourceTypeExperiment:
                return @"Experiment";
            case AWSapi.sagemakerResourceTypeExperimentTrial:
                return @"ExperimentTrial";
            case AWSapi.sagemakerResourceTypeExperimentTrialComponent:
                return @"ExperimentTrialComponent";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)suggestionQueryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerSuggestionQuery class]];
}

@end

@implementation AWSapi.sagemakerGetSearchSuggestionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"propertyNameSuggestions" : @"PropertyNameSuggestions",
             };
}

+ (NSValueTransformer *)propertyNameSuggestionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerPropertyNameSuggestion class]];
}

@end

@implementation AWSapi.sagemakerGitConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branch" : @"Branch",
             @"repositoryUrl" : @"RepositoryUrl",
             @"secretArn" : @"SecretArn",
             };
}

@end

@implementation AWSapi.sagemakerGitConfigForUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"secretArn" : @"SecretArn",
             };
}

@end

@implementation AWSapi.sagemakerHumanLoopActivationConditionsConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanLoopActivationConditions" : @"HumanLoopActivationConditions",
             };
}

@end

@implementation AWSapi.sagemakerHumanLoopActivationConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanLoopActivationConditionsConfig" : @"HumanLoopActivationConditionsConfig",
             };
}

+ (NSValueTransformer *)humanLoopActivationConditionsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerHumanLoopActivationConditionsConfig class]];
}

@end

@implementation AWSapi.sagemakerHumanLoopConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanTaskUiArn" : @"HumanTaskUiArn",
             @"publicWorkforceTaskPrice" : @"PublicWorkforceTaskPrice",
             @"taskAvailabilityLifetimeInSeconds" : @"TaskAvailabilityLifetimeInSeconds",
             @"taskCount" : @"TaskCount",
             @"taskDescription" : @"TaskDescription",
             @"taskKeywords" : @"TaskKeywords",
             @"taskTimeLimitInSeconds" : @"TaskTimeLimitInSeconds",
             @"taskTitle" : @"TaskTitle",
             @"workteamArn" : @"WorkteamArn",
             };
}

+ (NSValueTransformer *)publicWorkforceTaskPriceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerPublicWorkforceTaskPrice class]];
}

@end

@implementation AWSapi.sagemakerHumanLoopRequestSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsManagedHumanLoopRequestSource" : @"AwsManagedHumanLoopRequestSource",
             };
}

+ (NSValueTransformer *)awsManagedHumanLoopRequestSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS/Rekognition/DetectModerationLabels/Image/V3"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAwsManagedHumanLoopRequestSourceAWSRekognitionDetectModerationLabelsImageV3);
        }
        if ([value caseInsensitiveCompare:@"AWS/Textract/AnalyzeDocument/Forms/V1"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAwsManagedHumanLoopRequestSourceAWSTextractAnalyzeDocumentFormsV1);
        }
        return @(AWSapi.sagemakerAwsManagedHumanLoopRequestSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAwsManagedHumanLoopRequestSourceAWSRekognitionDetectModerationLabelsImageV3:
                return @"AWS/Rekognition/DetectModerationLabels/Image/V3";
            case AWSapi.sagemakerAwsManagedHumanLoopRequestSourceAWSTextractAnalyzeDocumentFormsV1:
                return @"AWS/Textract/AnalyzeDocument/Forms/V1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerHumanTaskConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"annotationConsolidationConfig" : @"AnnotationConsolidationConfig",
             @"maxConcurrentTaskCount" : @"MaxConcurrentTaskCount",
             @"numberOfHumanWorkersPerDataObject" : @"NumberOfHumanWorkersPerDataObject",
             @"preHumanTaskLambdaArn" : @"PreHumanTaskLambdaArn",
             @"publicWorkforceTaskPrice" : @"PublicWorkforceTaskPrice",
             @"taskAvailabilityLifetimeInSeconds" : @"TaskAvailabilityLifetimeInSeconds",
             @"taskDescription" : @"TaskDescription",
             @"taskKeywords" : @"TaskKeywords",
             @"taskTimeLimitInSeconds" : @"TaskTimeLimitInSeconds",
             @"taskTitle" : @"TaskTitle",
             @"uiConfig" : @"UiConfig",
             @"workteamArn" : @"WorkteamArn",
             };
}

+ (NSValueTransformer *)annotationConsolidationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAnnotationConsolidationConfig class]];
}

+ (NSValueTransformer *)publicWorkforceTaskPriceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerPublicWorkforceTaskPrice class]];
}

+ (NSValueTransformer *)uiConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUiConfig class]];
}

@end

@implementation AWSapi.sagemakerHumanTaskUiSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"humanTaskUiArn" : @"HumanTaskUiArn",
             @"humanTaskUiName" : @"HumanTaskUiName",
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

@implementation AWSapi.sagemakerHyperParameterAlgorithmSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmName" : @"AlgorithmName",
             @"metricDefinitions" : @"MetricDefinitions",
             @"trainingImage" : @"TrainingImage",
             @"trainingInputMode" : @"TrainingInputMode",
             };
}

+ (NSValueTransformer *)metricDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerMetricDefinition class]];
}

+ (NSValueTransformer *)trainingInputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pipe"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInputModePipe);
        }
        if ([value caseInsensitiveCompare:@"File"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInputModeFile);
        }
        return @(AWSapi.sagemakerTrainingInputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerTrainingInputModePipe:
                return @"Pipe";
            case AWSapi.sagemakerTrainingInputModeFile:
                return @"File";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerHyperParameterSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultValue" : @"DefaultValue",
             @"detail" : @"Description",
             @"isRequired" : @"IsRequired",
             @"isTunable" : @"IsTunable",
             @"name" : @"Name",
             @"range" : @"Range",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)rangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerParameterRange class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Integer"] == NSOrderedSame) {
            return @(AWSapi.sagemakerParameterTypeInteger);
        }
        if ([value caseInsensitiveCompare:@"Continuous"] == NSOrderedSame) {
            return @(AWSapi.sagemakerParameterTypeContinuous);
        }
        if ([value caseInsensitiveCompare:@"Categorical"] == NSOrderedSame) {
            return @(AWSapi.sagemakerParameterTypeCategorical);
        }
        if ([value caseInsensitiveCompare:@"FreeText"] == NSOrderedSame) {
            return @(AWSapi.sagemakerParameterTypeFreeText);
        }
        return @(AWSapi.sagemakerParameterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerParameterTypeInteger:
                return @"Integer";
            case AWSapi.sagemakerParameterTypeContinuous:
                return @"Continuous";
            case AWSapi.sagemakerParameterTypeCategorical:
                return @"Categorical";
            case AWSapi.sagemakerParameterTypeFreeText:
                return @"FreeText";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerHyperParameterTrainingJobDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmSpecification" : @"AlgorithmSpecification",
             @"checkpointConfig" : @"CheckpointConfig",
             @"definitionName" : @"DefinitionName",
             @"enableInterContainerTrafficEncryption" : @"EnableInterContainerTrafficEncryption",
             @"enableManagedSpotTraining" : @"EnableManagedSpotTraining",
             @"enableNetworkIsolation" : @"EnableNetworkIsolation",
             @"hyperParameterRanges" : @"HyperParameterRanges",
             @"inputDataConfig" : @"InputDataConfig",
             @"outputDataConfig" : @"OutputDataConfig",
             @"resourceConfig" : @"ResourceConfig",
             @"roleArn" : @"RoleArn",
             @"staticHyperParameters" : @"StaticHyperParameters",
             @"stoppingCondition" : @"StoppingCondition",
             @"tuningObjective" : @"TuningObjective",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)algorithmSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerHyperParameterAlgorithmSpecification class]];
}

+ (NSValueTransformer *)checkpointConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerCheckpointConfig class]];
}

+ (NSValueTransformer *)hyperParameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerParameterRanges class]];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerChannel class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerOutputDataConfig class]];
}

+ (NSValueTransformer *)resourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerResourceConfig class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerStoppingCondition class]];
}

+ (NSValueTransformer *)tuningObjectiveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerHyperParameterTuningJobObjective class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerVpcConfig class]];
}

@end

@implementation AWSapi.sagemakerHyperParameterTrainingJobSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"failureReason" : @"FailureReason",
             @"finalHyperParameterTuningJobObjectiveMetric" : @"FinalHyperParameterTuningJobObjectiveMetric",
             @"objectiveStatus" : @"ObjectiveStatus",
             @"trainingEndTime" : @"TrainingEndTime",
             @"trainingJobArn" : @"TrainingJobArn",
             @"trainingJobDefinitionName" : @"TrainingJobDefinitionName",
             @"trainingJobName" : @"TrainingJobName",
             @"trainingJobStatus" : @"TrainingJobStatus",
             @"trainingStartTime" : @"TrainingStartTime",
             @"tunedHyperParameters" : @"TunedHyperParameters",
             @"tuningJobName" : @"TuningJobName",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)finalHyperParameterTuningJobObjectiveMetricJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerFinalHyperParameterTuningJobObjectiveMetric class]];
}

+ (NSValueTransformer *)objectiveStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Succeeded"] == NSOrderedSame) {
            return @(AWSapi.sagemakerObjectiveStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerObjectiveStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerObjectiveStatusFailed);
        }
        return @(AWSapi.sagemakerObjectiveStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerObjectiveStatusSucceeded:
                return @"Succeeded";
            case AWSapi.sagemakerObjectiveStatusPending:
                return @"Pending";
            case AWSapi.sagemakerObjectiveStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)trainingEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)trainingJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusStopped);
        }
        return @(AWSapi.sagemakerTrainingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerTrainingJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerTrainingJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerTrainingJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerTrainingJobStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerTrainingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)trainingStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.sagemakerHyperParameterTuningJobConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hyperParameterTuningJobObjective" : @"HyperParameterTuningJobObjective",
             @"parameterRanges" : @"ParameterRanges",
             @"resourceLimits" : @"ResourceLimits",
             @"strategy" : @"Strategy",
             @"trainingJobEarlyStoppingType" : @"TrainingJobEarlyStoppingType",
             @"tuningJobCompletionCriteria" : @"TuningJobCompletionCriteria",
             };
}

+ (NSValueTransformer *)hyperParameterTuningJobObjectiveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerHyperParameterTuningJobObjective class]];
}

+ (NSValueTransformer *)parameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerParameterRanges class]];
}

+ (NSValueTransformer *)resourceLimitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerResourceLimits class]];
}

+ (NSValueTransformer *)strategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Bayesian"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobStrategyTypeBayesian);
        }
        if ([value caseInsensitiveCompare:@"Random"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobStrategyTypeRandom);
        }
        return @(AWSapi.sagemakerHyperParameterTuningJobStrategyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerHyperParameterTuningJobStrategyTypeBayesian:
                return @"Bayesian";
            case AWSapi.sagemakerHyperParameterTuningJobStrategyTypeRandom:
                return @"Random";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)trainingJobEarlyStoppingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Off"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobEarlyStoppingTypeOff);
        }
        if ([value caseInsensitiveCompare:@"Auto"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobEarlyStoppingTypeAuto);
        }
        return @(AWSapi.sagemakerTrainingJobEarlyStoppingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerTrainingJobEarlyStoppingTypeOff:
                return @"Off";
            case AWSapi.sagemakerTrainingJobEarlyStoppingTypeAuto:
                return @"Auto";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tuningJobCompletionCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTuningJobCompletionCriteria class]];
}

@end

@implementation AWSapi.sagemakerHyperParameterTuningJobObjective

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricName" : @"MetricName",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Maximize"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobObjectiveTypeMaximize);
        }
        if ([value caseInsensitiveCompare:@"Minimize"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobObjectiveTypeMinimize);
        }
        return @(AWSapi.sagemakerHyperParameterTuningJobObjectiveTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerHyperParameterTuningJobObjectiveTypeMaximize:
                return @"Maximize";
            case AWSapi.sagemakerHyperParameterTuningJobObjectiveTypeMinimize:
                return @"Minimize";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerHyperParameterTuningJobSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"hyperParameterTuningEndTime" : @"HyperParameterTuningEndTime",
             @"hyperParameterTuningJobArn" : @"HyperParameterTuningJobArn",
             @"hyperParameterTuningJobName" : @"HyperParameterTuningJobName",
             @"hyperParameterTuningJobStatus" : @"HyperParameterTuningJobStatus",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"objectiveStatusCounters" : @"ObjectiveStatusCounters",
             @"resourceLimits" : @"ResourceLimits",
             @"strategy" : @"Strategy",
             @"trainingJobStatusCounters" : @"TrainingJobStatusCounters",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)hyperParameterTuningEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)hyperParameterTuningJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobStatusStopping);
        }
        return @(AWSapi.sagemakerHyperParameterTuningJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerHyperParameterTuningJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerHyperParameterTuningJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerHyperParameterTuningJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerHyperParameterTuningJobStatusStopped:
                return @"Stopped";
            case AWSapi.sagemakerHyperParameterTuningJobStatusStopping:
                return @"Stopping";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)objectiveStatusCountersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerObjectiveStatusCounters class]];
}

+ (NSValueTransformer *)resourceLimitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerResourceLimits class]];
}

+ (NSValueTransformer *)strategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Bayesian"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobStrategyTypeBayesian);
        }
        if ([value caseInsensitiveCompare:@"Random"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobStrategyTypeRandom);
        }
        return @(AWSapi.sagemakerHyperParameterTuningJobStrategyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerHyperParameterTuningJobStrategyTypeBayesian:
                return @"Bayesian";
            case AWSapi.sagemakerHyperParameterTuningJobStrategyTypeRandom:
                return @"Random";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)trainingJobStatusCountersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrainingJobStatusCounters class]];
}

@end

@implementation AWSapi.sagemakerHyperParameterTuningJobWarmStartConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parentHyperParameterTuningJobs" : @"ParentHyperParameterTuningJobs",
             @"warmStartType" : @"WarmStartType",
             };
}

+ (NSValueTransformer *)parentHyperParameterTuningJobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerParentHyperParameterTuningJob class]];
}

+ (NSValueTransformer *)warmStartTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IdenticalDataAndAlgorithm"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobWarmStartTypeIdenticalDataAndAlgorithm);
        }
        if ([value caseInsensitiveCompare:@"TransferLearning"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobWarmStartTypeTransferLearning);
        }
        return @(AWSapi.sagemakerHyperParameterTuningJobWarmStartTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerHyperParameterTuningJobWarmStartTypeIdenticalDataAndAlgorithm:
                return @"IdenticalDataAndAlgorithm";
            case AWSapi.sagemakerHyperParameterTuningJobWarmStartTypeTransferLearning:
                return @"TransferLearning";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerInferenceSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"containers" : @"Containers",
             @"supportedContentTypes" : @"SupportedContentTypes",
             @"supportedRealtimeInferenceInstanceTypes" : @"SupportedRealtimeInferenceInstanceTypes",
             @"supportedResponseMIMETypes" : @"SupportedResponseMIMETypes",
             @"supportedTransformInstanceTypes" : @"SupportedTransformInstanceTypes",
             };
}

+ (NSValueTransformer *)containersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerModelPackageContainerDefinition class]];
}

@end

@implementation AWSapi.sagemakerInputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataInputConfig" : @"DataInputConfig",
             @"framework" : @"Framework",
             @"s3Uri" : @"S3Uri",
             };
}

+ (NSValueTransformer *)frameworkJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TENSORFLOW"] == NSOrderedSame) {
            return @(AWSapi.sagemakerFrameworkTensorflow);
        }
        if ([value caseInsensitiveCompare:@"KERAS"] == NSOrderedSame) {
            return @(AWSapi.sagemakerFrameworkKeras);
        }
        if ([value caseInsensitiveCompare:@"MXNET"] == NSOrderedSame) {
            return @(AWSapi.sagemakerFrameworkMxnet);
        }
        if ([value caseInsensitiveCompare:@"ONNX"] == NSOrderedSame) {
            return @(AWSapi.sagemakerFrameworkOnnx);
        }
        if ([value caseInsensitiveCompare:@"PYTORCH"] == NSOrderedSame) {
            return @(AWSapi.sagemakerFrameworkPytorch);
        }
        if ([value caseInsensitiveCompare:@"XGBOOST"] == NSOrderedSame) {
            return @(AWSapi.sagemakerFrameworkXgboost);
        }
        if ([value caseInsensitiveCompare:@"TFLITE"] == NSOrderedSame) {
            return @(AWSapi.sagemakerFrameworkTflite);
        }
        return @(AWSapi.sagemakerFrameworkUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerFrameworkTensorflow:
                return @"TENSORFLOW";
            case AWSapi.sagemakerFrameworkKeras:
                return @"KERAS";
            case AWSapi.sagemakerFrameworkMxnet:
                return @"MXNET";
            case AWSapi.sagemakerFrameworkOnnx:
                return @"ONNX";
            case AWSapi.sagemakerFrameworkPytorch:
                return @"PYTORCH";
            case AWSapi.sagemakerFrameworkXgboost:
                return @"XGBOOST";
            case AWSapi.sagemakerFrameworkTflite:
                return @"TFLITE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerIntegerParameterRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxValue" : @"MaxValue",
             @"minValue" : @"MinValue",
             @"name" : @"Name",
             @"scalingType" : @"ScalingType",
             };
}

+ (NSValueTransformer *)scalingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Auto"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterScalingTypeAuto);
        }
        if ([value caseInsensitiveCompare:@"Linear"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterScalingTypeLinear);
        }
        if ([value caseInsensitiveCompare:@"Logarithmic"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterScalingTypeLogarithmic);
        }
        if ([value caseInsensitiveCompare:@"ReverseLogarithmic"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterScalingTypeReverseLogarithmic);
        }
        return @(AWSapi.sagemakerHyperParameterScalingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerHyperParameterScalingTypeAuto:
                return @"Auto";
            case AWSapi.sagemakerHyperParameterScalingTypeLinear:
                return @"Linear";
            case AWSapi.sagemakerHyperParameterScalingTypeLogarithmic:
                return @"Logarithmic";
            case AWSapi.sagemakerHyperParameterScalingTypeReverseLogarithmic:
                return @"ReverseLogarithmic";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerIntegerParameterRangeSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxValue" : @"MaxValue",
             @"minValue" : @"MinValue",
             };
}

@end

@implementation AWSapi.sagemakerJupyterServerAppSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultResourceSpec" : @"DefaultResourceSpec",
             };
}

+ (NSValueTransformer *)defaultResourceSpecJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerResourceSpec class]];
}

@end

@implementation AWSapi.sagemakerKernelGatewayAppSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultResourceSpec" : @"DefaultResourceSpec",
             };
}

+ (NSValueTransformer *)defaultResourceSpecJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerResourceSpec class]];
}

@end

@implementation AWSapi.sagemakerLabelCounters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failedNonRetryableError" : @"FailedNonRetryableError",
             @"humanLabeled" : @"HumanLabeled",
             @"machineLabeled" : @"MachineLabeled",
             @"totalLabeled" : @"TotalLabeled",
             @"unlabeled" : @"Unlabeled",
             };
}

@end

@implementation AWSapi.sagemakerLabelCountersForWorkteam

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanLabeled" : @"HumanLabeled",
             @"pendingHuman" : @"PendingHuman",
             @"total" : @"Total",
             };
}

@end

@implementation AWSapi.sagemakerLabelingJobAlgorithmsConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initialActiveLearningModelArn" : @"InitialActiveLearningModelArn",
             @"labelingJobAlgorithmSpecificationArn" : @"LabelingJobAlgorithmSpecificationArn",
             @"labelingJobResourceConfig" : @"LabelingJobResourceConfig",
             };
}

+ (NSValueTransformer *)labelingJobResourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerLabelingJobResourceConfig class]];
}

@end

@implementation AWSapi.sagemakerLabelingJobDataAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentClassifiers" : @"ContentClassifiers",
             };
}

@end

@implementation AWSapi.sagemakerLabelingJobDataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3DataSource" : @"S3DataSource",
             };
}

+ (NSValueTransformer *)s3DataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerLabelingJobS3DataSource class]];
}

@end

@implementation AWSapi.sagemakerLabelingJobForWorkteamSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"jobReferenceCode" : @"JobReferenceCode",
             @"labelCounters" : @"LabelCounters",
             @"labelingJobName" : @"LabelingJobName",
             @"numberOfHumanWorkersPerDataObject" : @"NumberOfHumanWorkersPerDataObject",
             @"workRequesterAccountId" : @"WorkRequesterAccountId",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)labelCountersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerLabelCountersForWorkteam class]];
}

@end

@implementation AWSapi.sagemakerLabelingJobInputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAttributes" : @"DataAttributes",
             @"dataSource" : @"DataSource",
             };
}

+ (NSValueTransformer *)dataAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerLabelingJobDataAttributes class]];
}

+ (NSValueTransformer *)dataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerLabelingJobDataSource class]];
}

@end

@implementation AWSapi.sagemakerLabelingJobOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"finalActiveLearningModelArn" : @"FinalActiveLearningModelArn",
             @"outputDatasetS3Uri" : @"OutputDatasetS3Uri",
             };
}

@end

@implementation AWSapi.sagemakerLabelingJobOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"s3OutputPath" : @"S3OutputPath",
             };
}

@end

@implementation AWSapi.sagemakerLabelingJobResourceConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             };
}

@end

@implementation AWSapi.sagemakerLabelingJobS3DataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestS3Uri" : @"ManifestS3Uri",
             };
}

@end

@implementation AWSapi.sagemakerLabelingJobStoppingConditions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxHumanLabeledObjectCount" : @"MaxHumanLabeledObjectCount",
             @"maxPercentageOfInputDatasetLabeled" : @"MaxPercentageOfInputDatasetLabeled",
             };
}

@end

@implementation AWSapi.sagemakerLabelingJobSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"annotationConsolidationLambdaArn" : @"AnnotationConsolidationLambdaArn",
             @"creationTime" : @"CreationTime",
             @"failureReason" : @"FailureReason",
             @"inputConfig" : @"InputConfig",
             @"labelCounters" : @"LabelCounters",
             @"labelingJobArn" : @"LabelingJobArn",
             @"labelingJobName" : @"LabelingJobName",
             @"labelingJobOutput" : @"LabelingJobOutput",
             @"labelingJobStatus" : @"LabelingJobStatus",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"preHumanTaskLambdaArn" : @"PreHumanTaskLambdaArn",
             @"workteamArn" : @"WorkteamArn",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerLabelingJobInputConfig class]];
}

+ (NSValueTransformer *)labelCountersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerLabelCounters class]];
}

+ (NSValueTransformer *)labelingJobOutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerLabelingJobOutput class]];
}

+ (NSValueTransformer *)labelingJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerLabelingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerLabelingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerLabelingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerLabelingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerLabelingJobStatusStopped);
        }
        return @(AWSapi.sagemakerLabelingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerLabelingJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerLabelingJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerLabelingJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerLabelingJobStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerLabelingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.sagemakerListAlgorithmsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAlgorithmSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAlgorithmSortByCreationTime);
        }
        return @(AWSapi.sagemakerAlgorithmSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAlgorithmSortByName:
                return @"Name";
            case AWSapi.sagemakerAlgorithmSortByCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderDescending);
        }
        return @(AWSapi.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListAlgorithmsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmSummaryList" : @"AlgorithmSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)algorithmSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerAlgorithmSummary class]];
}

@end

@implementation AWSapi.sagemakerListAppsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainIdEquals" : @"DomainIdEquals",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             @"userProfileNameEquals" : @"UserProfileNameEquals",
             };
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppSortKeyCreationTime);
        }
        return @(AWSapi.sagemakerAppSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAppSortKeyCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderDescending);
        }
        return @(AWSapi.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListAppsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apps" : @"Apps",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)appsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerAppDetails class]];
}

@end

@implementation AWSapi.sagemakerListAutoMLJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"lastModifiedTimeAfter" : @"LastModifiedTimeAfter",
             @"lastModifiedTimeBefore" : @"LastModifiedTimeBefore",
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             @"statusEquals" : @"StatusEquals",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLSortByStatus);
        }
        return @(AWSapi.sagemakerAutoMLSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAutoMLSortByName:
                return @"Name";
            case AWSapi.sagemakerAutoMLSortByCreationTime:
                return @"CreationTime";
            case AWSapi.sagemakerAutoMLSortByStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLSortOrderDescending);
        }
        return @(AWSapi.sagemakerAutoMLSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAutoMLSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerAutoMLSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLJobStatusStopping);
        }
        return @(AWSapi.sagemakerAutoMLJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAutoMLJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerAutoMLJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerAutoMLJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerAutoMLJobStatusStopped:
                return @"Stopped";
            case AWSapi.sagemakerAutoMLJobStatusStopping:
                return @"Stopping";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListAutoMLJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLJobSummaries" : @"AutoMLJobSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)autoMLJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerAutoMLJobSummary class]];
}

@end

@implementation AWSapi.sagemakerListCandidatesForAutoMLJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLJobName" : @"AutoMLJobName",
             @"candidateNameEquals" : @"CandidateNameEquals",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             @"statusEquals" : @"StatusEquals",
             };
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCandidateSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCandidateSortByStatus);
        }
        if ([value caseInsensitiveCompare:@"FinalObjectiveMetricValue"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCandidateSortByFinalObjectiveMetricValue);
        }
        return @(AWSapi.sagemakerCandidateSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerCandidateSortByCreationTime:
                return @"CreationTime";
            case AWSapi.sagemakerCandidateSortByStatus:
                return @"Status";
            case AWSapi.sagemakerCandidateSortByFinalObjectiveMetricValue:
                return @"FinalObjectiveMetricValue";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAutoMLSortOrderDescending);
        }
        return @(AWSapi.sagemakerAutoMLSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAutoMLSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerAutoMLSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCandidateStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCandidateStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCandidateStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCandidateStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCandidateStatusStopping);
        }
        return @(AWSapi.sagemakerCandidateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerCandidateStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerCandidateStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerCandidateStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerCandidateStatusStopped:
                return @"Stopped";
            case AWSapi.sagemakerCandidateStatusStopping:
                return @"Stopping";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListCandidatesForAutoMLJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"candidates" : @"Candidates",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)candidatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerAutoMLCandidate class]];
}

@end

@implementation AWSapi.sagemakerListCodeRepositoriesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"lastModifiedTimeAfter" : @"LastModifiedTimeAfter",
             @"lastModifiedTimeBefore" : @"LastModifiedTimeBefore",
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCodeRepositorySortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCodeRepositorySortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"LastModifiedTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCodeRepositorySortByLastModifiedTime);
        }
        return @(AWSapi.sagemakerCodeRepositorySortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerCodeRepositorySortByName:
                return @"Name";
            case AWSapi.sagemakerCodeRepositorySortByCreationTime:
                return @"CreationTime";
            case AWSapi.sagemakerCodeRepositorySortByLastModifiedTime:
                return @"LastModifiedTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCodeRepositorySortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCodeRepositorySortOrderDescending);
        }
        return @(AWSapi.sagemakerCodeRepositorySortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerCodeRepositorySortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerCodeRepositorySortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListCodeRepositoriesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositorySummaryList" : @"CodeRepositorySummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)codeRepositorySummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerCodeRepositorySummary class]];
}

@end

@implementation AWSapi.sagemakerListCompilationJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"lastModifiedTimeAfter" : @"LastModifiedTimeAfter",
             @"lastModifiedTimeBefore" : @"LastModifiedTimeBefore",
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             @"statusEquals" : @"StatusEquals",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerListCompilationJobsSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerListCompilationJobsSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSapi.sagemakerListCompilationJobsSortByStatus);
        }
        return @(AWSapi.sagemakerListCompilationJobsSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerListCompilationJobsSortByName:
                return @"Name";
            case AWSapi.sagemakerListCompilationJobsSortByCreationTime:
                return @"CreationTime";
            case AWSapi.sagemakerListCompilationJobsSortByStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderDescending);
        }
        return @(AWSapi.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INPROGRESS"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompilationJobStatusInprogress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompilationJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompilationJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompilationJobStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompilationJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompilationJobStatusStopped);
        }
        return @(AWSapi.sagemakerCompilationJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerCompilationJobStatusInprogress:
                return @"INPROGRESS";
            case AWSapi.sagemakerCompilationJobStatusCompleted:
                return @"COMPLETED";
            case AWSapi.sagemakerCompilationJobStatusFailed:
                return @"FAILED";
            case AWSapi.sagemakerCompilationJobStatusStarting:
                return @"STARTING";
            case AWSapi.sagemakerCompilationJobStatusStopping:
                return @"STOPPING";
            case AWSapi.sagemakerCompilationJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListCompilationJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compilationJobSummaries" : @"CompilationJobSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)compilationJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerCompilationJobSummary class]];
}

@end

@implementation AWSapi.sagemakerListDomainsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSapi.sagemakerListDomainsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domains" : @"Domains",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)domainsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerDomainDetails class]];
}

@end

@implementation AWSapi.sagemakerListEndpointConfigsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointConfigSortKeyName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointConfigSortKeyCreationTime);
        }
        return @(AWSapi.sagemakerEndpointConfigSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerEndpointConfigSortKeyName:
                return @"Name";
            case AWSapi.sagemakerEndpointConfigSortKeyCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerOrderKeyAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerOrderKeyDescending);
        }
        return @(AWSapi.sagemakerOrderKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerOrderKeyAscending:
                return @"Ascending";
            case AWSapi.sagemakerOrderKeyDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListEndpointConfigsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointConfigs" : @"EndpointConfigs",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)endpointConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerEndpointConfigSummary class]];
}

@end

@implementation AWSapi.sagemakerListEndpointsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"lastModifiedTimeAfter" : @"LastModifiedTimeAfter",
             @"lastModifiedTimeBefore" : @"LastModifiedTimeBefore",
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             @"statusEquals" : @"StatusEquals",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointSortKeyName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointSortKeyCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointSortKeyStatus);
        }
        return @(AWSapi.sagemakerEndpointSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerEndpointSortKeyName:
                return @"Name";
            case AWSapi.sagemakerEndpointSortKeyCreationTime:
                return @"CreationTime";
            case AWSapi.sagemakerEndpointSortKeyStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerOrderKeyAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerOrderKeyDescending);
        }
        return @(AWSapi.sagemakerOrderKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerOrderKeyAscending:
                return @"Ascending";
            case AWSapi.sagemakerOrderKeyDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OutOfService"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusOutOfService);
        }
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"SystemUpdating"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusSystemUpdating);
        }
        if ([value caseInsensitiveCompare:@"RollingBack"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusRollingBack);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerEndpointStatusFailed);
        }
        return @(AWSapi.sagemakerEndpointStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerEndpointStatusOutOfService:
                return @"OutOfService";
            case AWSapi.sagemakerEndpointStatusCreating:
                return @"Creating";
            case AWSapi.sagemakerEndpointStatusUpdating:
                return @"Updating";
            case AWSapi.sagemakerEndpointStatusSystemUpdating:
                return @"SystemUpdating";
            case AWSapi.sagemakerEndpointStatusRollingBack:
                return @"RollingBack";
            case AWSapi.sagemakerEndpointStatusInService:
                return @"InService";
            case AWSapi.sagemakerEndpointStatusDeleting:
                return @"Deleting";
            case AWSapi.sagemakerEndpointStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListEndpointsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoints" : @"Endpoints",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)endpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerEndpointSummary class]];
}

@end

@implementation AWSapi.sagemakerListExperimentsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAfter" : @"CreatedAfter",
             @"createdBefore" : @"CreatedBefore",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
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

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortExperimentsByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortExperimentsByCreationTime);
        }
        return @(AWSapi.sagemakerSortExperimentsByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortExperimentsByName:
                return @"Name";
            case AWSapi.sagemakerSortExperimentsByCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderDescending);
        }
        return @(AWSapi.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListExperimentsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentSummaries" : @"ExperimentSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)experimentSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerExperimentSummary class]];
}

@end

@implementation AWSapi.sagemakerListFlowDefinitionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderDescending);
        }
        return @(AWSapi.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListFlowDefinitionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flowDefinitionSummaries" : @"FlowDefinitionSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)flowDefinitionSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerFlowDefinitionSummary class]];
}

@end

@implementation AWSapi.sagemakerListHumanTaskUisRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderDescending);
        }
        return @(AWSapi.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListHumanTaskUisResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanTaskUiSummaries" : @"HumanTaskUiSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)humanTaskUiSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerHumanTaskUiSummary class]];
}

@end

@implementation AWSapi.sagemakerListHyperParameterTuningJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"lastModifiedTimeAfter" : @"LastModifiedTimeAfter",
             @"lastModifiedTimeBefore" : @"LastModifiedTimeBefore",
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             @"statusEquals" : @"StatusEquals",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobSortByOptionsName);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobSortByOptionsStatus);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobSortByOptionsCreationTime);
        }
        return @(AWSapi.sagemakerHyperParameterTuningJobSortByOptionsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerHyperParameterTuningJobSortByOptionsName:
                return @"Name";
            case AWSapi.sagemakerHyperParameterTuningJobSortByOptionsStatus:
                return @"Status";
            case AWSapi.sagemakerHyperParameterTuningJobSortByOptionsCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderDescending);
        }
        return @(AWSapi.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerHyperParameterTuningJobStatusStopping);
        }
        return @(AWSapi.sagemakerHyperParameterTuningJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerHyperParameterTuningJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerHyperParameterTuningJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerHyperParameterTuningJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerHyperParameterTuningJobStatusStopped:
                return @"Stopped";
            case AWSapi.sagemakerHyperParameterTuningJobStatusStopping:
                return @"Stopping";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListHyperParameterTuningJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hyperParameterTuningJobSummaries" : @"HyperParameterTuningJobSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)hyperParameterTuningJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerHyperParameterTuningJobSummary class]];
}

@end

@implementation AWSapi.sagemakerListLabelingJobsForWorkteamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"jobReferenceCodeContains" : @"JobReferenceCodeContains",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             @"workteamArn" : @"WorkteamArn",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerListLabelingJobsForWorkteamSortByOptionsCreationTime);
        }
        return @(AWSapi.sagemakerListLabelingJobsForWorkteamSortByOptionsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerListLabelingJobsForWorkteamSortByOptionsCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderDescending);
        }
        return @(AWSapi.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListLabelingJobsForWorkteamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelingJobSummaryList" : @"LabelingJobSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)labelingJobSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerLabelingJobForWorkteamSummary class]];
}

@end

@implementation AWSapi.sagemakerListLabelingJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"lastModifiedTimeAfter" : @"LastModifiedTimeAfter",
             @"lastModifiedTimeBefore" : @"LastModifiedTimeBefore",
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             @"statusEquals" : @"StatusEquals",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortByStatus);
        }
        return @(AWSapi.sagemakerSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortByName:
                return @"Name";
            case AWSapi.sagemakerSortByCreationTime:
                return @"CreationTime";
            case AWSapi.sagemakerSortByStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderDescending);
        }
        return @(AWSapi.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerLabelingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerLabelingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerLabelingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerLabelingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerLabelingJobStatusStopped);
        }
        return @(AWSapi.sagemakerLabelingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerLabelingJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerLabelingJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerLabelingJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerLabelingJobStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerLabelingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListLabelingJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelingJobSummaryList" : @"LabelingJobSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)labelingJobSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerLabelingJobSummary class]];
}

@end

@implementation AWSapi.sagemakerListModelPackagesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerModelPackageSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerModelPackageSortByCreationTime);
        }
        return @(AWSapi.sagemakerModelPackageSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerModelPackageSortByName:
                return @"Name";
            case AWSapi.sagemakerModelPackageSortByCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderDescending);
        }
        return @(AWSapi.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListModelPackagesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelPackageSummaryList" : @"ModelPackageSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)modelPackageSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerModelPackageSummary class]];
}

@end

@implementation AWSapi.sagemakerListModelsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerModelSortKeyName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerModelSortKeyCreationTime);
        }
        return @(AWSapi.sagemakerModelSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerModelSortKeyName:
                return @"Name";
            case AWSapi.sagemakerModelSortKeyCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerOrderKeyAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerOrderKeyDescending);
        }
        return @(AWSapi.sagemakerOrderKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerOrderKeyAscending:
                return @"Ascending";
            case AWSapi.sagemakerOrderKeyDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListModelsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"models" : @"Models",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)modelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerModelSummary class]];
}

@end

@implementation AWSapi.sagemakerListMonitoringExecutionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"endpointName" : @"EndpointName",
             @"lastModifiedTimeAfter" : @"LastModifiedTimeAfter",
             @"lastModifiedTimeBefore" : @"LastModifiedTimeBefore",
             @"maxResults" : @"MaxResults",
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             @"nextToken" : @"NextToken",
             @"scheduledTimeAfter" : @"ScheduledTimeAfter",
             @"scheduledTimeBefore" : @"ScheduledTimeBefore",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             @"statusEquals" : @"StatusEquals",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)scheduledTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)scheduledTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerMonitoringExecutionSortKeyCreationTime);
        }
        if ([value caseInsensitiveCompare:@"ScheduledTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerMonitoringExecutionSortKeyScheduledTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSapi.sagemakerMonitoringExecutionSortKeyStatus);
        }
        return @(AWSapi.sagemakerMonitoringExecutionSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerMonitoringExecutionSortKeyCreationTime:
                return @"CreationTime";
            case AWSapi.sagemakerMonitoringExecutionSortKeyScheduledTime:
                return @"ScheduledTime";
            case AWSapi.sagemakerMonitoringExecutionSortKeyStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderDescending);
        }
        return @(AWSapi.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerExecutionStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"CompletedWithViolations"] == NSOrderedSame) {
            return @(AWSapi.sagemakerExecutionStatusCompletedWithViolations);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerExecutionStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerExecutionStatusStopped);
        }
        return @(AWSapi.sagemakerExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerExecutionStatusPending:
                return @"Pending";
            case AWSapi.sagemakerExecutionStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerExecutionStatusCompletedWithViolations:
                return @"CompletedWithViolations";
            case AWSapi.sagemakerExecutionStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerExecutionStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerExecutionStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerExecutionStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListMonitoringExecutionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringExecutionSummaries" : @"MonitoringExecutionSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)monitoringExecutionSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerMonitoringExecutionSummary class]];
}

@end

@implementation AWSapi.sagemakerListMonitoringSchedulesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"endpointName" : @"EndpointName",
             @"lastModifiedTimeAfter" : @"LastModifiedTimeAfter",
             @"lastModifiedTimeBefore" : @"LastModifiedTimeBefore",
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             @"statusEquals" : @"StatusEquals",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerMonitoringScheduleSortKeyName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerMonitoringScheduleSortKeyCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSapi.sagemakerMonitoringScheduleSortKeyStatus);
        }
        return @(AWSapi.sagemakerMonitoringScheduleSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerMonitoringScheduleSortKeyName:
                return @"Name";
            case AWSapi.sagemakerMonitoringScheduleSortKeyCreationTime:
                return @"CreationTime";
            case AWSapi.sagemakerMonitoringScheduleSortKeyStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderDescending);
        }
        return @(AWSapi.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerScheduleStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerScheduleStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Scheduled"] == NSOrderedSame) {
            return @(AWSapi.sagemakerScheduleStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerScheduleStatusStopped);
        }
        return @(AWSapi.sagemakerScheduleStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerScheduleStatusPending:
                return @"Pending";
            case AWSapi.sagemakerScheduleStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerScheduleStatusScheduled:
                return @"Scheduled";
            case AWSapi.sagemakerScheduleStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListMonitoringSchedulesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleSummaries" : @"MonitoringScheduleSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)monitoringScheduleSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerMonitoringScheduleSummary class]];
}

@end

@implementation AWSapi.sagemakerListNotebookInstanceLifecycleConfigsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"lastModifiedTimeAfter" : @"LastModifiedTimeAfter",
             @"lastModifiedTimeBefore" : @"LastModifiedTimeBefore",
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceLifecycleConfigSortKeyName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceLifecycleConfigSortKeyCreationTime);
        }
        if ([value caseInsensitiveCompare:@"LastModifiedTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceLifecycleConfigSortKeyLastModifiedTime);
        }
        return @(AWSapi.sagemakerNotebookInstanceLifecycleConfigSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerNotebookInstanceLifecycleConfigSortKeyName:
                return @"Name";
            case AWSapi.sagemakerNotebookInstanceLifecycleConfigSortKeyCreationTime:
                return @"CreationTime";
            case AWSapi.sagemakerNotebookInstanceLifecycleConfigSortKeyLastModifiedTime:
                return @"LastModifiedTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceLifecycleConfigSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceLifecycleConfigSortOrderDescending);
        }
        return @(AWSapi.sagemakerNotebookInstanceLifecycleConfigSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerNotebookInstanceLifecycleConfigSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerNotebookInstanceLifecycleConfigSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListNotebookInstanceLifecycleConfigsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"notebookInstanceLifecycleConfigs" : @"NotebookInstanceLifecycleConfigs",
             };
}

+ (NSValueTransformer *)notebookInstanceLifecycleConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerNotebookInstanceLifecycleConfigSummary class]];
}

@end

@implementation AWSapi.sagemakerListNotebookInstancesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalCodeRepositoryEquals" : @"AdditionalCodeRepositoryEquals",
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"defaultCodeRepositoryContains" : @"DefaultCodeRepositoryContains",
             @"lastModifiedTimeAfter" : @"LastModifiedTimeAfter",
             @"lastModifiedTimeBefore" : @"LastModifiedTimeBefore",
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             @"notebookInstanceLifecycleConfigNameContains" : @"NotebookInstanceLifecycleConfigNameContains",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             @"statusEquals" : @"StatusEquals",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceSortKeyName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceSortKeyCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceSortKeyStatus);
        }
        return @(AWSapi.sagemakerNotebookInstanceSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerNotebookInstanceSortKeyName:
                return @"Name";
            case AWSapi.sagemakerNotebookInstanceSortKeyCreationTime:
                return @"CreationTime";
            case AWSapi.sagemakerNotebookInstanceSortKeyStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceSortOrderDescending);
        }
        return @(AWSapi.sagemakerNotebookInstanceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerNotebookInstanceSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerNotebookInstanceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusUpdating);
        }
        return @(AWSapi.sagemakerNotebookInstanceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerNotebookInstanceStatusPending:
                return @"Pending";
            case AWSapi.sagemakerNotebookInstanceStatusInService:
                return @"InService";
            case AWSapi.sagemakerNotebookInstanceStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerNotebookInstanceStatusStopped:
                return @"Stopped";
            case AWSapi.sagemakerNotebookInstanceStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerNotebookInstanceStatusDeleting:
                return @"Deleting";
            case AWSapi.sagemakerNotebookInstanceStatusUpdating:
                return @"Updating";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListNotebookInstancesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"notebookInstances" : @"NotebookInstances",
             };
}

+ (NSValueTransformer *)notebookInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerNotebookInstanceSummary class]];
}

@end

@implementation AWSapi.sagemakerListProcessingJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"lastModifiedTimeAfter" : @"LastModifiedTimeAfter",
             @"lastModifiedTimeBefore" : @"LastModifiedTimeBefore",
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             @"statusEquals" : @"StatusEquals",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortByStatus);
        }
        return @(AWSapi.sagemakerSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortByName:
                return @"Name";
            case AWSapi.sagemakerSortByCreationTime:
                return @"CreationTime";
            case AWSapi.sagemakerSortByStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderDescending);
        }
        return @(AWSapi.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingJobStatusStopped);
        }
        return @(AWSapi.sagemakerProcessingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerProcessingJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerProcessingJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerProcessingJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerProcessingJobStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerProcessingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListProcessingJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"processingJobSummaries" : @"ProcessingJobSummaries",
             };
}

+ (NSValueTransformer *)processingJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerProcessingJobSummary class]];
}

@end

@implementation AWSapi.sagemakerListSubscribedWorkteamsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSapi.sagemakerListSubscribedWorkteamsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"subscribedWorkteams" : @"SubscribedWorkteams",
             };
}

+ (NSValueTransformer *)subscribedWorkteamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerSubscribedWorkteam class]];
}

@end

@implementation AWSapi.sagemakerListTagsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSapi.sagemakerListTagsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hyperParameterTuningJobName" : @"HyperParameterTuningJobName",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             @"statusEquals" : @"StatusEquals",
             };
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobSortByOptionsName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobSortByOptionsCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobSortByOptionsStatus);
        }
        if ([value caseInsensitiveCompare:@"FinalObjectiveMetricValue"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobSortByOptionsFinalObjectiveMetricValue);
        }
        return @(AWSapi.sagemakerTrainingJobSortByOptionsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerTrainingJobSortByOptionsName:
                return @"Name";
            case AWSapi.sagemakerTrainingJobSortByOptionsCreationTime:
                return @"CreationTime";
            case AWSapi.sagemakerTrainingJobSortByOptionsStatus:
                return @"Status";
            case AWSapi.sagemakerTrainingJobSortByOptionsFinalObjectiveMetricValue:
                return @"FinalObjectiveMetricValue";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderDescending);
        }
        return @(AWSapi.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusStopped);
        }
        return @(AWSapi.sagemakerTrainingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerTrainingJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerTrainingJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerTrainingJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerTrainingJobStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerTrainingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"trainingJobSummaries" : @"TrainingJobSummaries",
             };
}

+ (NSValueTransformer *)trainingJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerHyperParameterTrainingJobSummary class]];
}

@end

@implementation AWSapi.sagemakerListTrainingJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"lastModifiedTimeAfter" : @"LastModifiedTimeAfter",
             @"lastModifiedTimeBefore" : @"LastModifiedTimeBefore",
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             @"statusEquals" : @"StatusEquals",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortByStatus);
        }
        return @(AWSapi.sagemakerSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortByName:
                return @"Name";
            case AWSapi.sagemakerSortByCreationTime:
                return @"CreationTime";
            case AWSapi.sagemakerSortByStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderDescending);
        }
        return @(AWSapi.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusStopped);
        }
        return @(AWSapi.sagemakerTrainingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerTrainingJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerTrainingJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerTrainingJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerTrainingJobStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerTrainingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListTrainingJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"trainingJobSummaries" : @"TrainingJobSummaries",
             };
}

+ (NSValueTransformer *)trainingJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTrainingJobSummary class]];
}

@end

@implementation AWSapi.sagemakerListTransformJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"lastModifiedTimeAfter" : @"LastModifiedTimeAfter",
             @"lastModifiedTimeBefore" : @"LastModifiedTimeBefore",
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             @"statusEquals" : @"StatusEquals",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortByStatus);
        }
        return @(AWSapi.sagemakerSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortByName:
                return @"Name";
            case AWSapi.sagemakerSortByCreationTime:
                return @"CreationTime";
            case AWSapi.sagemakerSortByStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderDescending);
        }
        return @(AWSapi.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformJobStatusStopped);
        }
        return @(AWSapi.sagemakerTransformJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerTransformJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerTransformJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerTransformJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerTransformJobStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerTransformJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListTransformJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"transformJobSummaries" : @"TransformJobSummaries",
             };
}

+ (NSValueTransformer *)transformJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTransformJobSummary class]];
}

@end

@implementation AWSapi.sagemakerListTrialComponentsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAfter" : @"CreatedAfter",
             @"createdBefore" : @"CreatedBefore",
             @"experimentName" : @"ExperimentName",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             @"sourceArn" : @"SourceArn",
             @"trialName" : @"TrialName",
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

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortTrialComponentsByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortTrialComponentsByCreationTime);
        }
        return @(AWSapi.sagemakerSortTrialComponentsByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortTrialComponentsByName:
                return @"Name";
            case AWSapi.sagemakerSortTrialComponentsByCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderDescending);
        }
        return @(AWSapi.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListTrialComponentsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"trialComponentSummaries" : @"TrialComponentSummaries",
             };
}

+ (NSValueTransformer *)trialComponentSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTrialComponentSummary class]];
}

@end

@implementation AWSapi.sagemakerListTrialsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAfter" : @"CreatedAfter",
             @"createdBefore" : @"CreatedBefore",
             @"experimentName" : @"ExperimentName",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             @"trialComponentName" : @"TrialComponentName",
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

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortTrialsByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortTrialsByCreationTime);
        }
        return @(AWSapi.sagemakerSortTrialsByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortTrialsByName:
                return @"Name";
            case AWSapi.sagemakerSortTrialsByCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderDescending);
        }
        return @(AWSapi.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListTrialsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"trialSummaries" : @"TrialSummaries",
             };
}

+ (NSValueTransformer *)trialSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTrialSummary class]];
}

@end

@implementation AWSapi.sagemakerListUserProfilesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainIdEquals" : @"DomainIdEquals",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             @"userProfileNameContains" : @"UserProfileNameContains",
             };
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerUserProfileSortKeyCreationTime);
        }
        if ([value caseInsensitiveCompare:@"LastModifiedTime"] == NSOrderedSame) {
            return @(AWSapi.sagemakerUserProfileSortKeyLastModifiedTime);
        }
        return @(AWSapi.sagemakerUserProfileSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerUserProfileSortKeyCreationTime:
                return @"CreationTime";
            case AWSapi.sagemakerUserProfileSortKeyLastModifiedTime:
                return @"LastModifiedTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderDescending);
        }
        return @(AWSapi.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListUserProfilesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"userProfiles" : @"UserProfiles",
             };
}

+ (NSValueTransformer *)userProfilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerUserProfileDetails class]];
}

@end

@implementation AWSapi.sagemakerListWorkteamsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSapi.sagemakerListWorkteamsSortByOptionsName);
        }
        if ([value caseInsensitiveCompare:@"CreateDate"] == NSOrderedSame) {
            return @(AWSapi.sagemakerListWorkteamsSortByOptionsCreateDate);
        }
        return @(AWSapi.sagemakerListWorkteamsSortByOptionsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerListWorkteamsSortByOptionsName:
                return @"Name";
            case AWSapi.sagemakerListWorkteamsSortByOptionsCreateDate:
                return @"CreateDate";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSortOrderDescending);
        }
        return @(AWSapi.sagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerListWorkteamsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"workteams" : @"Workteams",
             };
}

+ (NSValueTransformer *)workteamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerWorkteam class]];
}

@end

@implementation AWSapi.sagemakerMemberDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cognitoMemberDefinition" : @"CognitoMemberDefinition",
             };
}

+ (NSValueTransformer *)cognitoMemberDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerCognitoMemberDefinition class]];
}

@end

@implementation AWSapi.sagemakerMetricData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricName" : @"MetricName",
             @"timestamp" : @"Timestamp",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.sagemakerMetricDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"regex" : @"Regex",
             };
}

@end

@implementation AWSapi.sagemakerModelArtifacts

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3ModelArtifacts" : @"S3ModelArtifacts",
             };
}

@end

@implementation AWSapi.sagemakerModelPackageContainerDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"containerHostname" : @"ContainerHostname",
             @"image" : @"Image",
             @"imageDigest" : @"ImageDigest",
             @"modelDataUrl" : @"ModelDataUrl",
             @"productId" : @"ProductId",
             };
}

@end

@implementation AWSapi.sagemakerModelPackageStatusDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageScanStatuses" : @"ImageScanStatuses",
             @"validationStatuses" : @"ValidationStatuses",
             };
}

+ (NSValueTransformer *)imageScanStatusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerModelPackageStatusItem class]];
}

+ (NSValueTransformer *)validationStatusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerModelPackageStatusItem class]];
}

@end

@implementation AWSapi.sagemakerModelPackageStatusItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failureReason" : @"FailureReason",
             @"name" : @"Name",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NotStarted"] == NSOrderedSame) {
            return @(AWSapi.sagemakerDetailedModelPackageStatusNotStarted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerDetailedModelPackageStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerDetailedModelPackageStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerDetailedModelPackageStatusFailed);
        }
        return @(AWSapi.sagemakerDetailedModelPackageStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerDetailedModelPackageStatusNotStarted:
                return @"NotStarted";
            case AWSapi.sagemakerDetailedModelPackageStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerDetailedModelPackageStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerDetailedModelPackageStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerModelPackageSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"modelPackageArn" : @"ModelPackageArn",
             @"modelPackageDescription" : @"ModelPackageDescription",
             @"modelPackageName" : @"ModelPackageName",
             @"modelPackageStatus" : @"ModelPackageStatus",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)modelPackageStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerModelPackageStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerModelPackageStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerModelPackageStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerModelPackageStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerModelPackageStatusDeleting);
        }
        return @(AWSapi.sagemakerModelPackageStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerModelPackageStatusPending:
                return @"Pending";
            case AWSapi.sagemakerModelPackageStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerModelPackageStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerModelPackageStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerModelPackageStatusDeleting:
                return @"Deleting";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerModelPackageValidationProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"profileName" : @"ProfileName",
             @"transformJobDefinition" : @"TransformJobDefinition",
             };
}

+ (NSValueTransformer *)transformJobDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTransformJobDefinition class]];
}

@end

@implementation AWSapi.sagemakerModelPackageValidationSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"validationProfiles" : @"ValidationProfiles",
             @"validationRole" : @"ValidationRole",
             };
}

+ (NSValueTransformer *)validationProfilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerModelPackageValidationProfile class]];
}

@end

@implementation AWSapi.sagemakerModelSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"modelArn" : @"ModelArn",
             @"modelName" : @"ModelName",
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

@implementation AWSapi.sagemakerMonitoringAppSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"containerArguments" : @"ContainerArguments",
             @"containerEntrypoint" : @"ContainerEntrypoint",
             @"imageUri" : @"ImageUri",
             @"postAnalyticsProcessorSourceUri" : @"PostAnalyticsProcessorSourceUri",
             @"recordPreprocessorSourceUri" : @"RecordPreprocessorSourceUri",
             };
}

@end

@implementation AWSapi.sagemakerMonitoringBaselineConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constraintsResource" : @"ConstraintsResource",
             @"statisticsResource" : @"StatisticsResource",
             };
}

+ (NSValueTransformer *)constraintsResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerMonitoringConstraintsResource class]];
}

+ (NSValueTransformer *)statisticsResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerMonitoringStatisticsResource class]];
}

@end

@implementation AWSapi.sagemakerMonitoringClusterConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceCount" : @"InstanceCount",
             @"instanceType" : @"InstanceType",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"volumeSizeInGB" : @"VolumeSizeInGB",
             };
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ml.t3.medium"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR58xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR516xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.24xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR524xlarge);
        }
        return @(AWSapi.sagemakerProcessingInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerProcessingInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSapi.sagemakerProcessingInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSapi.sagemakerProcessingInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSapi.sagemakerProcessingInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR5Large:
                return @"ml.r5.large";
            case AWSapi.sagemakerProcessingInstanceTypeMlR5Xlarge:
                return @"ml.r5.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR52xlarge:
                return @"ml.r5.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR54xlarge:
                return @"ml.r5.4xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR58xlarge:
                return @"ml.r5.8xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR512xlarge:
                return @"ml.r5.12xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR516xlarge:
                return @"ml.r5.16xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR524xlarge:
                return @"ml.r5.24xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerMonitoringConstraintsResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSapi.sagemakerMonitoringExecutionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"endpointName" : @"EndpointName",
             @"failureReason" : @"FailureReason",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"monitoringExecutionStatus" : @"MonitoringExecutionStatus",
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             @"processingJobArn" : @"ProcessingJobArn",
             @"scheduledTime" : @"ScheduledTime",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)monitoringExecutionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerExecutionStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"CompletedWithViolations"] == NSOrderedSame) {
            return @(AWSapi.sagemakerExecutionStatusCompletedWithViolations);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerExecutionStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerExecutionStatusStopped);
        }
        return @(AWSapi.sagemakerExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerExecutionStatusPending:
                return @"Pending";
            case AWSapi.sagemakerExecutionStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerExecutionStatusCompletedWithViolations:
                return @"CompletedWithViolations";
            case AWSapi.sagemakerExecutionStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerExecutionStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerExecutionStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerExecutionStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scheduledTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.sagemakerMonitoringInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointInput" : @"EndpointInput",
             };
}

+ (NSValueTransformer *)endpointInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerEndpointInput class]];
}

@end

@implementation AWSapi.sagemakerMonitoringJobDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baselineConfig" : @"BaselineConfig",
             @"environment" : @"Environment",
             @"monitoringAppSpecification" : @"MonitoringAppSpecification",
             @"monitoringInputs" : @"MonitoringInputs",
             @"monitoringOutputConfig" : @"MonitoringOutputConfig",
             @"monitoringResources" : @"MonitoringResources",
             @"networkConfig" : @"NetworkConfig",
             @"roleArn" : @"RoleArn",
             @"stoppingCondition" : @"StoppingCondition",
             };
}

+ (NSValueTransformer *)baselineConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerMonitoringBaselineConfig class]];
}

+ (NSValueTransformer *)monitoringAppSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerMonitoringAppSpecification class]];
}

+ (NSValueTransformer *)monitoringInputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerMonitoringInput class]];
}

+ (NSValueTransformer *)monitoringOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerMonitoringOutputConfig class]];
}

+ (NSValueTransformer *)monitoringResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerMonitoringResources class]];
}

+ (NSValueTransformer *)networkConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerNetworkConfig class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerMonitoringStoppingCondition class]];
}

@end

@implementation AWSapi.sagemakerMonitoringOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Output" : @"S3Output",
             };
}

+ (NSValueTransformer *)s3OutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerMonitoringS3Output class]];
}

@end

@implementation AWSapi.sagemakerMonitoringOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"monitoringOutputs" : @"MonitoringOutputs",
             };
}

+ (NSValueTransformer *)monitoringOutputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerMonitoringOutput class]];
}

@end

@implementation AWSapi.sagemakerMonitoringResources

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterConfig" : @"ClusterConfig",
             };
}

+ (NSValueTransformer *)clusterConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerMonitoringClusterConfig class]];
}

@end

@implementation AWSapi.sagemakerMonitoringS3Output

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"localPath" : @"LocalPath",
             @"s3UploadMode" : @"S3UploadMode",
             @"s3Uri" : @"S3Uri",
             };
}

+ (NSValueTransformer *)s3UploadModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Continuous"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingS3UploadModeContinuous);
        }
        if ([value caseInsensitiveCompare:@"EndOfJob"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingS3UploadModeEndOfJob);
        }
        return @(AWSapi.sagemakerProcessingS3UploadModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerProcessingS3UploadModeContinuous:
                return @"Continuous";
            case AWSapi.sagemakerProcessingS3UploadModeEndOfJob:
                return @"EndOfJob";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerMonitoringScheduleConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringJobDefinition" : @"MonitoringJobDefinition",
             @"scheduleConfig" : @"ScheduleConfig",
             };
}

+ (NSValueTransformer *)monitoringJobDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerMonitoringJobDefinition class]];
}

+ (NSValueTransformer *)scheduleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerScheduleConfig class]];
}

@end

@implementation AWSapi.sagemakerMonitoringScheduleSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"endpointName" : @"EndpointName",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"monitoringScheduleArn" : @"MonitoringScheduleArn",
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             @"monitoringScheduleStatus" : @"MonitoringScheduleStatus",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)monitoringScheduleStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerScheduleStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerScheduleStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Scheduled"] == NSOrderedSame) {
            return @(AWSapi.sagemakerScheduleStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerScheduleStatusStopped);
        }
        return @(AWSapi.sagemakerScheduleStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerScheduleStatusPending:
                return @"Pending";
            case AWSapi.sagemakerScheduleStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerScheduleStatusScheduled:
                return @"Scheduled";
            case AWSapi.sagemakerScheduleStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerMonitoringStatisticsResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSapi.sagemakerMonitoringStoppingCondition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxRuntimeInSeconds" : @"MaxRuntimeInSeconds",
             };
}

@end

@implementation AWSapi.sagemakerNestedFilters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"nestedPropertyName" : @"NestedPropertyName",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerFilter class]];
}

@end

@implementation AWSapi.sagemakerNetworkConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enableNetworkIsolation" : @"EnableNetworkIsolation",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerVpcConfig class]];
}

@end

@implementation AWSapi.sagemakerNotebookInstanceLifecycleConfigSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"notebookInstanceLifecycleConfigArn" : @"NotebookInstanceLifecycleConfigArn",
             @"notebookInstanceLifecycleConfigName" : @"NotebookInstanceLifecycleConfigName",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.sagemakerNotebookInstanceLifecycleHook

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             };
}

@end

@implementation AWSapi.sagemakerNotebookInstanceSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalCodeRepositories" : @"AdditionalCodeRepositories",
             @"creationTime" : @"CreationTime",
             @"defaultCodeRepository" : @"DefaultCodeRepository",
             @"instanceType" : @"InstanceType",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"notebookInstanceArn" : @"NotebookInstanceArn",
             @"notebookInstanceLifecycleConfigName" : @"NotebookInstanceLifecycleConfigName",
             @"notebookInstanceName" : @"NotebookInstanceName",
             @"notebookInstanceStatus" : @"NotebookInstanceStatus",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ml.t2.medium"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT2Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT2Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT22xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.medium"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.9xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5d9xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.18xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5d18xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP316xlarge);
        }
        return @(AWSapi.sagemakerInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerInstanceTypeMlT2Medium:
                return @"ml.t2.medium";
            case AWSapi.sagemakerInstanceTypeMlT2Large:
                return @"ml.t2.large";
            case AWSapi.sagemakerInstanceTypeMlT2Xlarge:
                return @"ml.t2.xlarge";
            case AWSapi.sagemakerInstanceTypeMlT22xlarge:
                return @"ml.t2.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSapi.sagemakerInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSapi.sagemakerInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSapi.sagemakerInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSapi.sagemakerInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSapi.sagemakerInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSapi.sagemakerInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSapi.sagemakerInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSapi.sagemakerInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSapi.sagemakerInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSapi.sagemakerInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSapi.sagemakerInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSapi.sagemakerInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSapi.sagemakerInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSapi.sagemakerInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSapi.sagemakerInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSapi.sagemakerInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5dXlarge:
                return @"ml.c5d.xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5d2xlarge:
                return @"ml.c5d.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5d4xlarge:
                return @"ml.c5d.4xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5d9xlarge:
                return @"ml.c5d.9xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5d18xlarge:
                return @"ml.c5d.18xlarge";
            case AWSapi.sagemakerInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSapi.sagemakerInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSapi.sagemakerInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSapi.sagemakerInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSapi.sagemakerInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)notebookInstanceStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookInstanceStatusUpdating);
        }
        return @(AWSapi.sagemakerNotebookInstanceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerNotebookInstanceStatusPending:
                return @"Pending";
            case AWSapi.sagemakerNotebookInstanceStatusInService:
                return @"InService";
            case AWSapi.sagemakerNotebookInstanceStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerNotebookInstanceStatusStopped:
                return @"Stopped";
            case AWSapi.sagemakerNotebookInstanceStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerNotebookInstanceStatusDeleting:
                return @"Deleting";
            case AWSapi.sagemakerNotebookInstanceStatusUpdating:
                return @"Updating";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerNotificationConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notificationTopicArn" : @"NotificationTopicArn",
             };
}

@end

@implementation AWSapi.sagemakerObjectiveStatusCounters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failed" : @"Failed",
             @"pending" : @"Pending",
             @"succeeded" : @"Succeeded",
             };
}

@end

@implementation AWSapi.sagemakerOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3OutputLocation" : @"S3OutputLocation",
             @"targetDevice" : @"TargetDevice",
             };
}

+ (NSValueTransformer *)targetDeviceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceLambda);
        }
        if ([value caseInsensitiveCompare:@"ml_m4"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceMlM4);
        }
        if ([value caseInsensitiveCompare:@"ml_m5"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceMlM5);
        }
        if ([value caseInsensitiveCompare:@"ml_c4"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceMlC4);
        }
        if ([value caseInsensitiveCompare:@"ml_c5"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceMlC5);
        }
        if ([value caseInsensitiveCompare:@"ml_p2"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceMlP2);
        }
        if ([value caseInsensitiveCompare:@"ml_p3"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceMlP3);
        }
        if ([value caseInsensitiveCompare:@"ml_inf1"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceMlInf1);
        }
        if ([value caseInsensitiveCompare:@"jetson_tx1"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceJetsonTx1);
        }
        if ([value caseInsensitiveCompare:@"jetson_tx2"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceJetsonTx2);
        }
        if ([value caseInsensitiveCompare:@"jetson_nano"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceJetsonNano);
        }
        if ([value caseInsensitiveCompare:@"jetson_xavier"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceJetsonXavier);
        }
        if ([value caseInsensitiveCompare:@"rasp3b"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceRasp3b);
        }
        if ([value caseInsensitiveCompare:@"imx8qm"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceImx8qm);
        }
        if ([value caseInsensitiveCompare:@"deeplens"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceDeeplens);
        }
        if ([value caseInsensitiveCompare:@"rk3399"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceRk3399);
        }
        if ([value caseInsensitiveCompare:@"rk3288"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceRk3288);
        }
        if ([value caseInsensitiveCompare:@"aisage"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceAisage);
        }
        if ([value caseInsensitiveCompare:@"sbe_c"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceSbeC);
        }
        if ([value caseInsensitiveCompare:@"qcs605"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceQcs605);
        }
        if ([value caseInsensitiveCompare:@"qcs603"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceQcs603);
        }
        if ([value caseInsensitiveCompare:@"sitara_am57x"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceSitaraAm57x);
        }
        if ([value caseInsensitiveCompare:@"amba_cv22"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTargetDeviceAmbaCv22);
        }
        return @(AWSapi.sagemakerTargetDeviceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerTargetDeviceLambda:
                return @"lambda";
            case AWSapi.sagemakerTargetDeviceMlM4:
                return @"ml_m4";
            case AWSapi.sagemakerTargetDeviceMlM5:
                return @"ml_m5";
            case AWSapi.sagemakerTargetDeviceMlC4:
                return @"ml_c4";
            case AWSapi.sagemakerTargetDeviceMlC5:
                return @"ml_c5";
            case AWSapi.sagemakerTargetDeviceMlP2:
                return @"ml_p2";
            case AWSapi.sagemakerTargetDeviceMlP3:
                return @"ml_p3";
            case AWSapi.sagemakerTargetDeviceMlInf1:
                return @"ml_inf1";
            case AWSapi.sagemakerTargetDeviceJetsonTx1:
                return @"jetson_tx1";
            case AWSapi.sagemakerTargetDeviceJetsonTx2:
                return @"jetson_tx2";
            case AWSapi.sagemakerTargetDeviceJetsonNano:
                return @"jetson_nano";
            case AWSapi.sagemakerTargetDeviceJetsonXavier:
                return @"jetson_xavier";
            case AWSapi.sagemakerTargetDeviceRasp3b:
                return @"rasp3b";
            case AWSapi.sagemakerTargetDeviceImx8qm:
                return @"imx8qm";
            case AWSapi.sagemakerTargetDeviceDeeplens:
                return @"deeplens";
            case AWSapi.sagemakerTargetDeviceRk3399:
                return @"rk3399";
            case AWSapi.sagemakerTargetDeviceRk3288:
                return @"rk3288";
            case AWSapi.sagemakerTargetDeviceAisage:
                return @"aisage";
            case AWSapi.sagemakerTargetDeviceSbeC:
                return @"sbe_c";
            case AWSapi.sagemakerTargetDeviceQcs605:
                return @"qcs605";
            case AWSapi.sagemakerTargetDeviceQcs603:
                return @"qcs603";
            case AWSapi.sagemakerTargetDeviceSitaraAm57x:
                return @"sitara_am57x";
            case AWSapi.sagemakerTargetDeviceAmbaCv22:
                return @"amba_cv22";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerOutputDataConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"s3OutputPath" : @"S3OutputPath",
             };
}

@end

@implementation AWSapi.sagemakerParameterRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"categoricalParameterRangeSpecification" : @"CategoricalParameterRangeSpecification",
             @"continuousParameterRangeSpecification" : @"ContinuousParameterRangeSpecification",
             @"integerParameterRangeSpecification" : @"IntegerParameterRangeSpecification",
             };
}

+ (NSValueTransformer *)categoricalParameterRangeSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerCategoricalParameterRangeSpecification class]];
}

+ (NSValueTransformer *)continuousParameterRangeSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerContinuousParameterRangeSpecification class]];
}

+ (NSValueTransformer *)integerParameterRangeSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerIntegerParameterRangeSpecification class]];
}

@end

@implementation AWSapi.sagemakerParameterRanges

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"categoricalParameterRanges" : @"CategoricalParameterRanges",
             @"continuousParameterRanges" : @"ContinuousParameterRanges",
             @"integerParameterRanges" : @"IntegerParameterRanges",
             };
}

+ (NSValueTransformer *)categoricalParameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerCategoricalParameterRange class]];
}

+ (NSValueTransformer *)continuousParameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerContinuousParameterRange class]];
}

+ (NSValueTransformer *)integerParameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerIntegerParameterRange class]];
}

@end

@implementation AWSapi.sagemakerParent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentName" : @"ExperimentName",
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSapi.sagemakerParentHyperParameterTuningJob

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hyperParameterTuningJobName" : @"HyperParameterTuningJobName",
             };
}

@end

@implementation AWSapi.sagemakerProcessingClusterConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceCount" : @"InstanceCount",
             @"instanceType" : @"InstanceType",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"volumeSizeInGB" : @"VolumeSizeInGB",
             };
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ml.t3.medium"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR58xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR516xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.24xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingInstanceTypeMlR524xlarge);
        }
        return @(AWSapi.sagemakerProcessingInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerProcessingInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSapi.sagemakerProcessingInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSapi.sagemakerProcessingInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSapi.sagemakerProcessingInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR5Large:
                return @"ml.r5.large";
            case AWSapi.sagemakerProcessingInstanceTypeMlR5Xlarge:
                return @"ml.r5.xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR52xlarge:
                return @"ml.r5.2xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR54xlarge:
                return @"ml.r5.4xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR58xlarge:
                return @"ml.r5.8xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR512xlarge:
                return @"ml.r5.12xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR516xlarge:
                return @"ml.r5.16xlarge";
            case AWSapi.sagemakerProcessingInstanceTypeMlR524xlarge:
                return @"ml.r5.24xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerProcessingInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputName" : @"InputName",
             @"s3Input" : @"S3Input",
             };
}

+ (NSValueTransformer *)s3InputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerProcessingS3Input class]];
}

@end

@implementation AWSapi.sagemakerProcessingJob

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appSpecification" : @"AppSpecification",
             @"autoMLJobArn" : @"AutoMLJobArn",
             @"creationTime" : @"CreationTime",
             @"environment" : @"Environment",
             @"exitMessage" : @"ExitMessage",
             @"experimentConfig" : @"ExperimentConfig",
             @"failureReason" : @"FailureReason",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"monitoringScheduleArn" : @"MonitoringScheduleArn",
             @"networkConfig" : @"NetworkConfig",
             @"processingEndTime" : @"ProcessingEndTime",
             @"processingInputs" : @"ProcessingInputs",
             @"processingJobArn" : @"ProcessingJobArn",
             @"processingJobName" : @"ProcessingJobName",
             @"processingJobStatus" : @"ProcessingJobStatus",
             @"processingOutputConfig" : @"ProcessingOutputConfig",
             @"processingResources" : @"ProcessingResources",
             @"processingStartTime" : @"ProcessingStartTime",
             @"roleArn" : @"RoleArn",
             @"stoppingCondition" : @"StoppingCondition",
             @"tags" : @"Tags",
             @"trainingJobArn" : @"TrainingJobArn",
             };
}

+ (NSValueTransformer *)appSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAppSpecification class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerExperimentConfig class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)networkConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerNetworkConfig class]];
}

+ (NSValueTransformer *)processingEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)processingInputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerProcessingInput class]];
}

+ (NSValueTransformer *)processingJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingJobStatusStopped);
        }
        return @(AWSapi.sagemakerProcessingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerProcessingJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerProcessingJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerProcessingJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerProcessingJobStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerProcessingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)processingOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerProcessingOutputConfig class]];
}

+ (NSValueTransformer *)processingResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerProcessingResources class]];
}

+ (NSValueTransformer *)processingStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerProcessingStoppingCondition class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerProcessingJobSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"exitMessage" : @"ExitMessage",
             @"failureReason" : @"FailureReason",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"processingEndTime" : @"ProcessingEndTime",
             @"processingJobArn" : @"ProcessingJobArn",
             @"processingJobName" : @"ProcessingJobName",
             @"processingJobStatus" : @"ProcessingJobStatus",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)processingEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)processingJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingJobStatusStopped);
        }
        return @(AWSapi.sagemakerProcessingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerProcessingJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerProcessingJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerProcessingJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerProcessingJobStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerProcessingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerProcessingOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputName" : @"OutputName",
             @"s3Output" : @"S3Output",
             };
}

+ (NSValueTransformer *)s3OutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerProcessingS3Output class]];
}

@end

@implementation AWSapi.sagemakerProcessingOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"outputs" : @"Outputs",
             };
}

+ (NSValueTransformer *)outputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerProcessingOutput class]];
}

@end

@implementation AWSapi.sagemakerProcessingResources

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterConfig" : @"ClusterConfig",
             };
}

+ (NSValueTransformer *)clusterConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerProcessingClusterConfig class]];
}

@end

@implementation AWSapi.sagemakerProcessingS3Input

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"localPath" : @"LocalPath",
             @"s3CompressionType" : @"S3CompressionType",
             @"s3DataDistributionType" : @"S3DataDistributionType",
             @"s3DataType" : @"S3DataType",
             @"s3InputMode" : @"S3InputMode",
             @"s3Uri" : @"S3Uri",
             };
}

+ (NSValueTransformer *)s3CompressionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingS3CompressionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"Gzip"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingS3CompressionTypeGzip);
        }
        return @(AWSapi.sagemakerProcessingS3CompressionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerProcessingS3CompressionTypeNone:
                return @"None";
            case AWSapi.sagemakerProcessingS3CompressionTypeGzip:
                return @"Gzip";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3DataDistributionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FullyReplicated"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingS3DataDistributionTypeFullyReplicated);
        }
        if ([value caseInsensitiveCompare:@"ShardedByS3Key"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingS3DataDistributionTypeShardedByS3Key);
        }
        return @(AWSapi.sagemakerProcessingS3DataDistributionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerProcessingS3DataDistributionTypeFullyReplicated:
                return @"FullyReplicated";
            case AWSapi.sagemakerProcessingS3DataDistributionTypeShardedByS3Key:
                return @"ShardedByS3Key";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3DataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ManifestFile"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingS3DataTypeManifestFile);
        }
        if ([value caseInsensitiveCompare:@"S3Prefix"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingS3DataTypeS3Prefix);
        }
        return @(AWSapi.sagemakerProcessingS3DataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerProcessingS3DataTypeManifestFile:
                return @"ManifestFile";
            case AWSapi.sagemakerProcessingS3DataTypeS3Prefix:
                return @"S3Prefix";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3InputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pipe"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingS3InputModePipe);
        }
        if ([value caseInsensitiveCompare:@"File"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingS3InputModeFile);
        }
        return @(AWSapi.sagemakerProcessingS3InputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerProcessingS3InputModePipe:
                return @"Pipe";
            case AWSapi.sagemakerProcessingS3InputModeFile:
                return @"File";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerProcessingS3Output

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"localPath" : @"LocalPath",
             @"s3UploadMode" : @"S3UploadMode",
             @"s3Uri" : @"S3Uri",
             };
}

+ (NSValueTransformer *)s3UploadModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Continuous"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingS3UploadModeContinuous);
        }
        if ([value caseInsensitiveCompare:@"EndOfJob"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProcessingS3UploadModeEndOfJob);
        }
        return @(AWSapi.sagemakerProcessingS3UploadModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerProcessingS3UploadModeContinuous:
                return @"Continuous";
            case AWSapi.sagemakerProcessingS3UploadModeEndOfJob:
                return @"EndOfJob";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerProcessingStoppingCondition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxRuntimeInSeconds" : @"MaxRuntimeInSeconds",
             };
}

@end

@implementation AWSapi.sagemakerProductionVariant

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceleratorType" : @"AcceleratorType",
             @"initialInstanceCount" : @"InitialInstanceCount",
             @"initialVariantWeight" : @"InitialVariantWeight",
             @"instanceType" : @"InstanceType",
             @"modelName" : @"ModelName",
             @"variantName" : @"VariantName",
             };
}

+ (NSValueTransformer *)acceleratorTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ml.eia1.medium"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantAcceleratorTypeMlEia1Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.eia1.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantAcceleratorTypeMlEia1Large);
        }
        if ([value caseInsensitiveCompare:@"ml.eia1.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantAcceleratorTypeMlEia1Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.eia2.medium"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantAcceleratorTypeMlEia2Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.eia2.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantAcceleratorTypeMlEia2Large);
        }
        if ([value caseInsensitiveCompare:@"ml.eia2.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantAcceleratorTypeMlEia2Xlarge);
        }
        return @(AWSapi.sagemakerProductionVariantAcceleratorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerProductionVariantAcceleratorTypeMlEia1Medium:
                return @"ml.eia1.medium";
            case AWSapi.sagemakerProductionVariantAcceleratorTypeMlEia1Large:
                return @"ml.eia1.large";
            case AWSapi.sagemakerProductionVariantAcceleratorTypeMlEia1Xlarge:
                return @"ml.eia1.xlarge";
            case AWSapi.sagemakerProductionVariantAcceleratorTypeMlEia2Medium:
                return @"ml.eia2.medium";
            case AWSapi.sagemakerProductionVariantAcceleratorTypeMlEia2Large:
                return @"ml.eia2.large";
            case AWSapi.sagemakerProductionVariantAcceleratorTypeMlEia2Xlarge:
                return @"ml.eia2.xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ml.t2.medium"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlT2Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlT2Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlT2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlT22xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5d.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlM5dLarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5d.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlM5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5d.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlM5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5d.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlM5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5d.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlM5d12xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5d.24xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlM5d24xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlC4Large);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlC5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlC5dLarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlC5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlC5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlC5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.9xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlC5d9xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.18xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlC5d18xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlG4dnXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlG4dn2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlG4dn4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlG4dn8xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlG4dn12xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlG4dn16xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlR5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlR5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlR52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlR54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlR512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.24xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlR524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5d.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlR5dLarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5d.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlR5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5d.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlR5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5d.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlR5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5d.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlR5d12xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5d.24xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlR5d24xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.inf1.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlInf1Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.inf1.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlInf12xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.inf1.6xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlInf16xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.inf1.24xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProductionVariantInstanceTypeMlInf124xlarge);
        }
        return @(AWSapi.sagemakerProductionVariantInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerProductionVariantInstanceTypeMlT2Medium:
                return @"ml.t2.medium";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlT2Large:
                return @"ml.t2.large";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlT2Xlarge:
                return @"ml.t2.xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlT22xlarge:
                return @"ml.t2.2xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlM5dLarge:
                return @"ml.m5d.large";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlM5dXlarge:
                return @"ml.m5d.xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlM5d2xlarge:
                return @"ml.m5d.2xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlM5d4xlarge:
                return @"ml.m5d.4xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlM5d12xlarge:
                return @"ml.m5d.12xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlM5d24xlarge:
                return @"ml.m5d.24xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlC4Large:
                return @"ml.c4.large";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlC5Large:
                return @"ml.c5.large";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlC5dLarge:
                return @"ml.c5d.large";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlC5dXlarge:
                return @"ml.c5d.xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlC5d2xlarge:
                return @"ml.c5d.2xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlC5d4xlarge:
                return @"ml.c5d.4xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlC5d9xlarge:
                return @"ml.c5d.9xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlC5d18xlarge:
                return @"ml.c5d.18xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlG4dnXlarge:
                return @"ml.g4dn.xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlG4dn2xlarge:
                return @"ml.g4dn.2xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlG4dn4xlarge:
                return @"ml.g4dn.4xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlG4dn8xlarge:
                return @"ml.g4dn.8xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlG4dn12xlarge:
                return @"ml.g4dn.12xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlG4dn16xlarge:
                return @"ml.g4dn.16xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlR5Large:
                return @"ml.r5.large";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlR5Xlarge:
                return @"ml.r5.xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlR52xlarge:
                return @"ml.r5.2xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlR54xlarge:
                return @"ml.r5.4xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlR512xlarge:
                return @"ml.r5.12xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlR524xlarge:
                return @"ml.r5.24xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlR5dLarge:
                return @"ml.r5d.large";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlR5dXlarge:
                return @"ml.r5d.xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlR5d2xlarge:
                return @"ml.r5d.2xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlR5d4xlarge:
                return @"ml.r5d.4xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlR5d12xlarge:
                return @"ml.r5d.12xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlR5d24xlarge:
                return @"ml.r5d.24xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlInf1Xlarge:
                return @"ml.inf1.xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlInf12xlarge:
                return @"ml.inf1.2xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlInf16xlarge:
                return @"ml.inf1.6xlarge";
            case AWSapi.sagemakerProductionVariantInstanceTypeMlInf124xlarge:
                return @"ml.inf1.24xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerProductionVariantSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentInstanceCount" : @"CurrentInstanceCount",
             @"currentWeight" : @"CurrentWeight",
             @"deployedImages" : @"DeployedImages",
             @"desiredInstanceCount" : @"DesiredInstanceCount",
             @"desiredWeight" : @"DesiredWeight",
             @"variantName" : @"VariantName",
             };
}

+ (NSValueTransformer *)deployedImagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerDeployedImage class]];
}

@end

@implementation AWSapi.sagemakerPropertyNameQuery

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"propertyNameHint" : @"PropertyNameHint",
             };
}

@end

@implementation AWSapi.sagemakerPropertyNameSuggestion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"propertyName" : @"PropertyName",
             };
}

@end

@implementation AWSapi.sagemakerPublicWorkforceTaskPrice

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amountInUsd" : @"AmountInUsd",
             };
}

+ (NSValueTransformer *)amountInUsdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUSD class]];
}

@end

@implementation AWSapi.sagemakerRenderUiTemplateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"RoleArn",
             @"task" : @"Task",
             @"uiTemplate" : @"UiTemplate",
             };
}

+ (NSValueTransformer *)taskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerRenderableTask class]];
}

+ (NSValueTransformer *)uiTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUiTemplate class]];
}

@end

@implementation AWSapi.sagemakerRenderUiTemplateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             @"renderedContent" : @"RenderedContent",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerRenderingError class]];
}

@end

@implementation AWSapi.sagemakerRenderableTask

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"input" : @"Input",
             };
}

@end

@implementation AWSapi.sagemakerRenderingError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

@end

@implementation AWSapi.sagemakerResolvedAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLJobObjective" : @"AutoMLJobObjective",
             @"completionCriteria" : @"CompletionCriteria",
             @"problemType" : @"ProblemType",
             };
}

+ (NSValueTransformer *)autoMLJobObjectiveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAutoMLJobObjective class]];
}

+ (NSValueTransformer *)completionCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAutoMLJobCompletionCriteria class]];
}

+ (NSValueTransformer *)problemTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BinaryClassification"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProblemTypeBinaryClassification);
        }
        if ([value caseInsensitiveCompare:@"MulticlassClassification"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProblemTypeMulticlassClassification);
        }
        if ([value caseInsensitiveCompare:@"Regression"] == NSOrderedSame) {
            return @(AWSapi.sagemakerProblemTypeRegression);
        }
        return @(AWSapi.sagemakerProblemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerProblemTypeBinaryClassification:
                return @"BinaryClassification";
            case AWSapi.sagemakerProblemTypeMulticlassClassification:
                return @"MulticlassClassification";
            case AWSapi.sagemakerProblemTypeRegression:
                return @"Regression";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerResourceConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceCount" : @"InstanceCount",
             @"instanceType" : @"InstanceType",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"volumeSizeInGB" : @"VolumeSizeInGB",
             };
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlG4dnXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlG4dn2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlG4dn4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlG4dn8xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlG4dn12xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlG4dn16xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3dn.24xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlP3dn24xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5n.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlC5nXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5n.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlC5n2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5n.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlC5n4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5n.9xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlC5n9xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5n.18xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInstanceTypeMlC5n18xlarge);
        }
        return @(AWSapi.sagemakerTrainingInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerTrainingInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlG4dnXlarge:
                return @"ml.g4dn.xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlG4dn2xlarge:
                return @"ml.g4dn.2xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlG4dn4xlarge:
                return @"ml.g4dn.4xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlG4dn8xlarge:
                return @"ml.g4dn.8xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlG4dn12xlarge:
                return @"ml.g4dn.12xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlG4dn16xlarge:
                return @"ml.g4dn.16xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSapi.sagemakerTrainingInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlP3dn24xlarge:
                return @"ml.p3dn.24xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlC5nXlarge:
                return @"ml.c5n.xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlC5n2xlarge:
                return @"ml.c5n.2xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlC5n4xlarge:
                return @"ml.c5n.4xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlC5n9xlarge:
                return @"ml.c5n.9xlarge";
            case AWSapi.sagemakerTrainingInstanceTypeMlC5n18xlarge:
                return @"ml.c5n.18xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerResourceLimits

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxNumberOfTrainingJobs" : @"MaxNumberOfTrainingJobs",
             @"maxParallelTrainingJobs" : @"MaxParallelTrainingJobs",
             };
}

@end

@implementation AWSapi.sagemakerResourceSpec

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceType" : @"InstanceType",
             @"sageMakerImageArn" : @"SageMakerImageArn",
             };
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"system"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeSystem);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.micro"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlT3Micro);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.small"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlT3Small);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.medium"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlM58xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlM516xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlC5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlC512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.24xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlC524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlG4dnXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlG4dn2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlG4dn4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlG4dn8xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlG4dn12xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAppInstanceTypeMlG4dn16xlarge);
        }
        return @(AWSapi.sagemakerAppInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAppInstanceTypeSystem:
                return @"system";
            case AWSapi.sagemakerAppInstanceTypeMlT3Micro:
                return @"ml.t3.micro";
            case AWSapi.sagemakerAppInstanceTypeMlT3Small:
                return @"ml.t3.small";
            case AWSapi.sagemakerAppInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSapi.sagemakerAppInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSapi.sagemakerAppInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSapi.sagemakerAppInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlM58xlarge:
                return @"ml.m5.8xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlM516xlarge:
                return @"ml.m5.16xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlC5Large:
                return @"ml.c5.large";
            case AWSapi.sagemakerAppInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlC512xlarge:
                return @"ml.c5.12xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlC524xlarge:
                return @"ml.c5.24xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlG4dnXlarge:
                return @"ml.g4dn.xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlG4dn2xlarge:
                return @"ml.g4dn.2xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlG4dn4xlarge:
                return @"ml.g4dn.4xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlG4dn8xlarge:
                return @"ml.g4dn.8xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlG4dn12xlarge:
                return @"ml.g4dn.12xlarge";
            case AWSapi.sagemakerAppInstanceTypeMlG4dn16xlarge:
                return @"ml.g4dn.16xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerRetentionPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"homeEfsFileSystem" : @"HomeEfsFileSystem",
             };
}

+ (NSValueTransformer *)homeEfsFileSystemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Retain"] == NSOrderedSame) {
            return @(AWSapi.sagemakerRetentionTypeRetain);
        }
        if ([value caseInsensitiveCompare:@"Delete"] == NSOrderedSame) {
            return @(AWSapi.sagemakerRetentionTypeDelete);
        }
        return @(AWSapi.sagemakerRetentionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerRetentionTypeRetain:
                return @"Retain";
            case AWSapi.sagemakerRetentionTypeDelete:
                return @"Delete";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerS3DataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeNames" : @"AttributeNames",
             @"s3DataDistributionType" : @"S3DataDistributionType",
             @"s3DataType" : @"S3DataType",
             @"s3Uri" : @"S3Uri",
             };
}

+ (NSValueTransformer *)s3DataDistributionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FullyReplicated"] == NSOrderedSame) {
            return @(AWSapi.sagemakerS3DataDistributionFullyReplicated);
        }
        if ([value caseInsensitiveCompare:@"ShardedByS3Key"] == NSOrderedSame) {
            return @(AWSapi.sagemakerS3DataDistributionShardedByS3Key);
        }
        return @(AWSapi.sagemakerS3DataDistributionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerS3DataDistributionFullyReplicated:
                return @"FullyReplicated";
            case AWSapi.sagemakerS3DataDistributionShardedByS3Key:
                return @"ShardedByS3Key";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3DataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ManifestFile"] == NSOrderedSame) {
            return @(AWSapi.sagemakerS3DataTypeManifestFile);
        }
        if ([value caseInsensitiveCompare:@"S3Prefix"] == NSOrderedSame) {
            return @(AWSapi.sagemakerS3DataTypeS3Prefix);
        }
        if ([value caseInsensitiveCompare:@"AugmentedManifestFile"] == NSOrderedSame) {
            return @(AWSapi.sagemakerS3DataTypeAugmentedManifestFile);
        }
        return @(AWSapi.sagemakerS3DataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerS3DataTypeManifestFile:
                return @"ManifestFile";
            case AWSapi.sagemakerS3DataTypeS3Prefix:
                return @"S3Prefix";
            case AWSapi.sagemakerS3DataTypeAugmentedManifestFile:
                return @"AugmentedManifestFile";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerScheduleConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduleExpression" : @"ScheduleExpression",
             };
}

@end

@implementation AWSapi.sagemakerSearchExpression

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"nestedFilters" : @"NestedFilters",
             @"operator" : @"Operator",
             @"subExpressions" : @"SubExpressions",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerFilter class]];
}

+ (NSValueTransformer *)nestedFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerNestedFilters class]];
}

+ (NSValueTransformer *)operatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"And"] == NSOrderedSame) {
            return @(AWSapi.sagemakerBooleanOperatorAnd);
        }
        if ([value caseInsensitiveCompare:@"Or"] == NSOrderedSame) {
            return @(AWSapi.sagemakerBooleanOperatorOr);
        }
        return @(AWSapi.sagemakerBooleanOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerBooleanOperatorAnd:
                return @"And";
            case AWSapi.sagemakerBooleanOperatorOr:
                return @"Or";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)subExpressionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerSearchExpression class]];
}

@end

@implementation AWSapi.sagemakerSearchRecord

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experiment" : @"Experiment",
             @"trainingJob" : @"TrainingJob",
             @"trial" : @"Trial",
             @"trialComponent" : @"TrialComponent",
             };
}

+ (NSValueTransformer *)experimentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerExperiment class]];
}

+ (NSValueTransformer *)trainingJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrainingJob class]];
}

+ (NSValueTransformer *)trialJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrial class]];
}

+ (NSValueTransformer *)trialComponentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrialComponent class]];
}

@end

@implementation AWSapi.sagemakerSearchRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resource" : @"Resource",
             @"searchExpression" : @"SearchExpression",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)resourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TrainingJob"] == NSOrderedSame) {
            return @(AWSapi.sagemakerResourceTypeTrainingJob);
        }
        if ([value caseInsensitiveCompare:@"Experiment"] == NSOrderedSame) {
            return @(AWSapi.sagemakerResourceTypeExperiment);
        }
        if ([value caseInsensitiveCompare:@"ExperimentTrial"] == NSOrderedSame) {
            return @(AWSapi.sagemakerResourceTypeExperimentTrial);
        }
        if ([value caseInsensitiveCompare:@"ExperimentTrialComponent"] == NSOrderedSame) {
            return @(AWSapi.sagemakerResourceTypeExperimentTrialComponent);
        }
        return @(AWSapi.sagemakerResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerResourceTypeTrainingJob:
                return @"TrainingJob";
            case AWSapi.sagemakerResourceTypeExperiment:
                return @"Experiment";
            case AWSapi.sagemakerResourceTypeExperimentTrial:
                return @"ExperimentTrial";
            case AWSapi.sagemakerResourceTypeExperimentTrialComponent:
                return @"ExperimentTrialComponent";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)searchExpressionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerSearchExpression class]];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSearchSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSearchSortOrderDescending);
        }
        return @(AWSapi.sagemakerSearchSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSearchSortOrderAscending:
                return @"Ascending";
            case AWSapi.sagemakerSearchSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerSearchResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"results" : @"Results",
             };
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerSearchRecord class]];
}

@end

@implementation AWSapi.sagemakerSecondaryStatusTransition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"startTime" : @"StartTime",
             @"status" : @"Status",
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

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Starting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"LaunchingMLInstances"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusLaunchingMLInstances);
        }
        if ([value caseInsensitiveCompare:@"PreparingTrainingStack"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusPreparingTrainingStack);
        }
        if ([value caseInsensitiveCompare:@"Downloading"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusDownloading);
        }
        if ([value caseInsensitiveCompare:@"DownloadingTrainingImage"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusDownloadingTrainingImage);
        }
        if ([value caseInsensitiveCompare:@"Training"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusTraining);
        }
        if ([value caseInsensitiveCompare:@"Uploading"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusUploading);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"MaxRuntimeExceeded"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusMaxRuntimeExceeded);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Interrupted"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusInterrupted);
        }
        if ([value caseInsensitiveCompare:@"MaxWaitTimeExceeded"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusMaxWaitTimeExceeded);
        }
        return @(AWSapi.sagemakerSecondaryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSecondaryStatusStarting:
                return @"Starting";
            case AWSapi.sagemakerSecondaryStatusLaunchingMLInstances:
                return @"LaunchingMLInstances";
            case AWSapi.sagemakerSecondaryStatusPreparingTrainingStack:
                return @"PreparingTrainingStack";
            case AWSapi.sagemakerSecondaryStatusDownloading:
                return @"Downloading";
            case AWSapi.sagemakerSecondaryStatusDownloadingTrainingImage:
                return @"DownloadingTrainingImage";
            case AWSapi.sagemakerSecondaryStatusTraining:
                return @"Training";
            case AWSapi.sagemakerSecondaryStatusUploading:
                return @"Uploading";
            case AWSapi.sagemakerSecondaryStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerSecondaryStatusStopped:
                return @"Stopped";
            case AWSapi.sagemakerSecondaryStatusMaxRuntimeExceeded:
                return @"MaxRuntimeExceeded";
            case AWSapi.sagemakerSecondaryStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerSecondaryStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerSecondaryStatusInterrupted:
                return @"Interrupted";
            case AWSapi.sagemakerSecondaryStatusMaxWaitTimeExceeded:
                return @"MaxWaitTimeExceeded";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerSharingSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookOutputOption" : @"NotebookOutputOption",
             @"s3KmsKeyId" : @"S3KmsKeyId",
             @"s3OutputPath" : @"S3OutputPath",
             };
}

+ (NSValueTransformer *)notebookOutputOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Allowed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookOutputOptionAllowed);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSapi.sagemakerNotebookOutputOptionDisabled);
        }
        return @(AWSapi.sagemakerNotebookOutputOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerNotebookOutputOptionAllowed:
                return @"Allowed";
            case AWSapi.sagemakerNotebookOutputOptionDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerShuffleConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"seed" : @"Seed",
             };
}

@end

@implementation AWSapi.sagemakerSourceAlgorithm

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmName" : @"AlgorithmName",
             @"modelDataUrl" : @"ModelDataUrl",
             };
}

@end

@implementation AWSapi.sagemakerSourceAlgorithmSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceAlgorithms" : @"SourceAlgorithms",
             };
}

+ (NSValueTransformer *)sourceAlgorithmsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerSourceAlgorithm class]];
}

@end

@implementation AWSapi.sagemakerSourceIpConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrs" : @"Cidrs",
             };
}

@end

@implementation AWSapi.sagemakerStartMonitoringScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             };
}

@end

@implementation AWSapi.sagemakerStartNotebookInstanceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceName" : @"NotebookInstanceName",
             };
}

@end

@implementation AWSapi.sagemakerStopAutoMLJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLJobName" : @"AutoMLJobName",
             };
}

@end

@implementation AWSapi.sagemakerStopCompilationJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compilationJobName" : @"CompilationJobName",
             };
}

@end

@implementation AWSapi.sagemakerStopHyperParameterTuningJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hyperParameterTuningJobName" : @"HyperParameterTuningJobName",
             };
}

@end

@implementation AWSapi.sagemakerStopLabelingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelingJobName" : @"LabelingJobName",
             };
}

@end

@implementation AWSapi.sagemakerStopMonitoringScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             };
}

@end

@implementation AWSapi.sagemakerStopNotebookInstanceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceName" : @"NotebookInstanceName",
             };
}

@end

@implementation AWSapi.sagemakerStopProcessingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"processingJobName" : @"ProcessingJobName",
             };
}

@end

@implementation AWSapi.sagemakerStopTrainingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trainingJobName" : @"TrainingJobName",
             };
}

@end

@implementation AWSapi.sagemakerStopTransformJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformJobName" : @"TransformJobName",
             };
}

@end

@implementation AWSapi.sagemakerStoppingCondition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxRuntimeInSeconds" : @"MaxRuntimeInSeconds",
             @"maxWaitTimeInSeconds" : @"MaxWaitTimeInSeconds",
             };
}

@end

@implementation AWSapi.sagemakerSubscribedWorkteam

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"listingId" : @"ListingId",
             @"marketplaceDescription" : @"MarketplaceDescription",
             @"marketplaceTitle" : @"MarketplaceTitle",
             @"sellerName" : @"SellerName",
             @"workteamArn" : @"WorkteamArn",
             };
}

@end

@implementation AWSapi.sagemakerSuggestionQuery

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"propertyNameQuery" : @"PropertyNameQuery",
             };
}

+ (NSValueTransformer *)propertyNameQueryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerPropertyNameQuery class]];
}

@end

@implementation AWSapi.sagemakerTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSapi.sagemakerTensorBoardAppSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultResourceSpec" : @"DefaultResourceSpec",
             };
}

+ (NSValueTransformer *)defaultResourceSpecJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerResourceSpec class]];
}

@end

@implementation AWSapi.sagemakerTensorBoardOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"localPath" : @"LocalPath",
             @"s3OutputPath" : @"S3OutputPath",
             };
}

@end

@implementation AWSapi.sagemakerTrainingJob

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmSpecification" : @"AlgorithmSpecification",
             @"autoMLJobArn" : @"AutoMLJobArn",
             @"billableTimeInSeconds" : @"BillableTimeInSeconds",
             @"checkpointConfig" : @"CheckpointConfig",
             @"creationTime" : @"CreationTime",
             @"debugHookConfig" : @"DebugHookConfig",
             @"debugRuleConfigurations" : @"DebugRuleConfigurations",
             @"debugRuleEvaluationStatuses" : @"DebugRuleEvaluationStatuses",
             @"enableInterContainerTrafficEncryption" : @"EnableInterContainerTrafficEncryption",
             @"enableManagedSpotTraining" : @"EnableManagedSpotTraining",
             @"enableNetworkIsolation" : @"EnableNetworkIsolation",
             @"experimentConfig" : @"ExperimentConfig",
             @"failureReason" : @"FailureReason",
             @"finalMetricDataList" : @"FinalMetricDataList",
             @"hyperParameters" : @"HyperParameters",
             @"inputDataConfig" : @"InputDataConfig",
             @"labelingJobArn" : @"LabelingJobArn",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"modelArtifacts" : @"ModelArtifacts",
             @"outputDataConfig" : @"OutputDataConfig",
             @"resourceConfig" : @"ResourceConfig",
             @"roleArn" : @"RoleArn",
             @"secondaryStatus" : @"SecondaryStatus",
             @"secondaryStatusTransitions" : @"SecondaryStatusTransitions",
             @"stoppingCondition" : @"StoppingCondition",
             @"tags" : @"Tags",
             @"tensorBoardOutputConfig" : @"TensorBoardOutputConfig",
             @"trainingEndTime" : @"TrainingEndTime",
             @"trainingJobArn" : @"TrainingJobArn",
             @"trainingJobName" : @"TrainingJobName",
             @"trainingJobStatus" : @"TrainingJobStatus",
             @"trainingStartTime" : @"TrainingStartTime",
             @"trainingTimeInSeconds" : @"TrainingTimeInSeconds",
             @"tuningJobArn" : @"TuningJobArn",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)algorithmSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerAlgorithmSpecification class]];
}

+ (NSValueTransformer *)checkpointConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerCheckpointConfig class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)debugHookConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerDebugHookConfig class]];
}

+ (NSValueTransformer *)debugRuleConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerDebugRuleConfiguration class]];
}

+ (NSValueTransformer *)debugRuleEvaluationStatusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerDebugRuleEvaluationStatus class]];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerExperimentConfig class]];
}

+ (NSValueTransformer *)finalMetricDataListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerMetricData class]];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerChannel class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)modelArtifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerModelArtifacts class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerOutputDataConfig class]];
}

+ (NSValueTransformer *)resourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerResourceConfig class]];
}

+ (NSValueTransformer *)secondaryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Starting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"LaunchingMLInstances"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusLaunchingMLInstances);
        }
        if ([value caseInsensitiveCompare:@"PreparingTrainingStack"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusPreparingTrainingStack);
        }
        if ([value caseInsensitiveCompare:@"Downloading"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusDownloading);
        }
        if ([value caseInsensitiveCompare:@"DownloadingTrainingImage"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusDownloadingTrainingImage);
        }
        if ([value caseInsensitiveCompare:@"Training"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusTraining);
        }
        if ([value caseInsensitiveCompare:@"Uploading"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusUploading);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"MaxRuntimeExceeded"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusMaxRuntimeExceeded);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Interrupted"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusInterrupted);
        }
        if ([value caseInsensitiveCompare:@"MaxWaitTimeExceeded"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSecondaryStatusMaxWaitTimeExceeded);
        }
        return @(AWSapi.sagemakerSecondaryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSecondaryStatusStarting:
                return @"Starting";
            case AWSapi.sagemakerSecondaryStatusLaunchingMLInstances:
                return @"LaunchingMLInstances";
            case AWSapi.sagemakerSecondaryStatusPreparingTrainingStack:
                return @"PreparingTrainingStack";
            case AWSapi.sagemakerSecondaryStatusDownloading:
                return @"Downloading";
            case AWSapi.sagemakerSecondaryStatusDownloadingTrainingImage:
                return @"DownloadingTrainingImage";
            case AWSapi.sagemakerSecondaryStatusTraining:
                return @"Training";
            case AWSapi.sagemakerSecondaryStatusUploading:
                return @"Uploading";
            case AWSapi.sagemakerSecondaryStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerSecondaryStatusStopped:
                return @"Stopped";
            case AWSapi.sagemakerSecondaryStatusMaxRuntimeExceeded:
                return @"MaxRuntimeExceeded";
            case AWSapi.sagemakerSecondaryStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerSecondaryStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerSecondaryStatusInterrupted:
                return @"Interrupted";
            case AWSapi.sagemakerSecondaryStatusMaxWaitTimeExceeded:
                return @"MaxWaitTimeExceeded";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)secondaryStatusTransitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerSecondaryStatusTransition class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerStoppingCondition class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

+ (NSValueTransformer *)tensorBoardOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTensorBoardOutputConfig class]];
}

+ (NSValueTransformer *)trainingEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)trainingJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusStopped);
        }
        return @(AWSapi.sagemakerTrainingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerTrainingJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerTrainingJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerTrainingJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerTrainingJobStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerTrainingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)trainingStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerVpcConfig class]];
}

@end

@implementation AWSapi.sagemakerTrainingJobDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hyperParameters" : @"HyperParameters",
             @"inputDataConfig" : @"InputDataConfig",
             @"outputDataConfig" : @"OutputDataConfig",
             @"resourceConfig" : @"ResourceConfig",
             @"stoppingCondition" : @"StoppingCondition",
             @"trainingInputMode" : @"TrainingInputMode",
             };
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerChannel class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerOutputDataConfig class]];
}

+ (NSValueTransformer *)resourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerResourceConfig class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerStoppingCondition class]];
}

+ (NSValueTransformer *)trainingInputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pipe"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInputModePipe);
        }
        if ([value caseInsensitiveCompare:@"File"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingInputModeFile);
        }
        return @(AWSapi.sagemakerTrainingInputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerTrainingInputModePipe:
                return @"Pipe";
            case AWSapi.sagemakerTrainingInputModeFile:
                return @"File";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerTrainingJobStatusCounters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completed" : @"Completed",
             @"inProgress" : @"InProgress",
             @"nonRetryableError" : @"NonRetryableError",
             @"retryableError" : @"RetryableError",
             @"stopped" : @"Stopped",
             };
}

@end

@implementation AWSapi.sagemakerTrainingJobSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"trainingEndTime" : @"TrainingEndTime",
             @"trainingJobArn" : @"TrainingJobArn",
             @"trainingJobName" : @"TrainingJobName",
             @"trainingJobStatus" : @"TrainingJobStatus",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)trainingEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)trainingJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrainingJobStatusStopped);
        }
        return @(AWSapi.sagemakerTrainingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerTrainingJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerTrainingJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerTrainingJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerTrainingJobStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerTrainingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerTrainingSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricDefinitions" : @"MetricDefinitions",
             @"supportedHyperParameters" : @"SupportedHyperParameters",
             @"supportedTrainingInstanceTypes" : @"SupportedTrainingInstanceTypes",
             @"supportedTuningJobObjectiveMetrics" : @"SupportedTuningJobObjectiveMetrics",
             @"supportsDistributedTraining" : @"SupportsDistributedTraining",
             @"trainingChannels" : @"TrainingChannels",
             @"trainingImage" : @"TrainingImage",
             @"trainingImageDigest" : @"TrainingImageDigest",
             };
}

+ (NSValueTransformer *)metricDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerMetricDefinition class]];
}

+ (NSValueTransformer *)supportedHyperParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerHyperParameterSpecification class]];
}

+ (NSValueTransformer *)supportedTuningJobObjectiveMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerHyperParameterTuningJobObjective class]];
}

+ (NSValueTransformer *)trainingChannelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerChannelSpecification class]];
}

@end

@implementation AWSapi.sagemakerTransformDataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3DataSource" : @"S3DataSource",
             };
}

+ (NSValueTransformer *)s3DataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTransformS3DataSource class]];
}

@end

@implementation AWSapi.sagemakerTransformInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compressionType" : @"CompressionType",
             @"contentType" : @"ContentType",
             @"dataSource" : @"DataSource",
             @"splitType" : @"SplitType",
             };
}

+ (NSValueTransformer *)compressionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompressionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"Gzip"] == NSOrderedSame) {
            return @(AWSapi.sagemakerCompressionTypeGzip);
        }
        return @(AWSapi.sagemakerCompressionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerCompressionTypeNone:
                return @"None";
            case AWSapi.sagemakerCompressionTypeGzip:
                return @"Gzip";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTransformDataSource class]];
}

+ (NSValueTransformer *)splitTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSplitTypeNone);
        }
        if ([value caseInsensitiveCompare:@"Line"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSplitTypeLine);
        }
        if ([value caseInsensitiveCompare:@"RecordIO"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSplitTypeRecordIO);
        }
        if ([value caseInsensitiveCompare:@"TFRecord"] == NSOrderedSame) {
            return @(AWSapi.sagemakerSplitTypeTFRecord);
        }
        return @(AWSapi.sagemakerSplitTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerSplitTypeNone:
                return @"None";
            case AWSapi.sagemakerSplitTypeLine:
                return @"Line";
            case AWSapi.sagemakerSplitTypeRecordIO:
                return @"RecordIO";
            case AWSapi.sagemakerSplitTypeTFRecord:
                return @"TFRecord";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerTransformJobDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchStrategy" : @"BatchStrategy",
             @"environment" : @"Environment",
             @"maxConcurrentTransforms" : @"MaxConcurrentTransforms",
             @"maxPayloadInMB" : @"MaxPayloadInMB",
             @"transformInput" : @"TransformInput",
             @"transformOutput" : @"TransformOutput",
             @"transformResources" : @"TransformResources",
             };
}

+ (NSValueTransformer *)batchStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MultiRecord"] == NSOrderedSame) {
            return @(AWSapi.sagemakerBatchStrategyMultiRecord);
        }
        if ([value caseInsensitiveCompare:@"SingleRecord"] == NSOrderedSame) {
            return @(AWSapi.sagemakerBatchStrategySingleRecord);
        }
        return @(AWSapi.sagemakerBatchStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerBatchStrategyMultiRecord:
                return @"MultiRecord";
            case AWSapi.sagemakerBatchStrategySingleRecord:
                return @"SingleRecord";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transformInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTransformInput class]];
}

+ (NSValueTransformer *)transformOutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTransformOutput class]];
}

+ (NSValueTransformer *)transformResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTransformResources class]];
}

@end

@implementation AWSapi.sagemakerTransformJobSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"failureReason" : @"FailureReason",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"transformEndTime" : @"TransformEndTime",
             @"transformJobArn" : @"TransformJobArn",
             @"transformJobName" : @"TransformJobName",
             @"transformJobStatus" : @"TransformJobStatus",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)transformEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)transformJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformJobStatusStopped);
        }
        return @(AWSapi.sagemakerTransformJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerTransformJobStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerTransformJobStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerTransformJobStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerTransformJobStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerTransformJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerTransformOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accept" : @"Accept",
             @"assembleWith" : @"AssembleWith",
             @"kmsKeyId" : @"KmsKeyId",
             @"s3OutputPath" : @"S3OutputPath",
             };
}

+ (NSValueTransformer *)assembleWithJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAssemblyTypeNone);
        }
        if ([value caseInsensitiveCompare:@"Line"] == NSOrderedSame) {
            return @(AWSapi.sagemakerAssemblyTypeLine);
        }
        return @(AWSapi.sagemakerAssemblyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerAssemblyTypeNone:
                return @"None";
            case AWSapi.sagemakerAssemblyTypeLine:
                return @"Line";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerTransformResources

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceCount" : @"InstanceCount",
             @"instanceType" : @"InstanceType",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             };
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTransformInstanceTypeMlM524xlarge);
        }
        return @(AWSapi.sagemakerTransformInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerTransformInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSapi.sagemakerTransformInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSapi.sagemakerTransformInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerTransformS3DataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3DataType" : @"S3DataType",
             @"s3Uri" : @"S3Uri",
             };
}

+ (NSValueTransformer *)s3DataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ManifestFile"] == NSOrderedSame) {
            return @(AWSapi.sagemakerS3DataTypeManifestFile);
        }
        if ([value caseInsensitiveCompare:@"S3Prefix"] == NSOrderedSame) {
            return @(AWSapi.sagemakerS3DataTypeS3Prefix);
        }
        if ([value caseInsensitiveCompare:@"AugmentedManifestFile"] == NSOrderedSame) {
            return @(AWSapi.sagemakerS3DataTypeAugmentedManifestFile);
        }
        return @(AWSapi.sagemakerS3DataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerS3DataTypeManifestFile:
                return @"ManifestFile";
            case AWSapi.sagemakerS3DataTypeS3Prefix:
                return @"S3Prefix";
            case AWSapi.sagemakerS3DataTypeAugmentedManifestFile:
                return @"AugmentedManifestFile";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerTrial

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdBy" : @"CreatedBy",
             @"creationTime" : @"CreationTime",
             @"displayName" : @"DisplayName",
             @"experimentName" : @"ExperimentName",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"source" : @"Source",
             @"tags" : @"Tags",
             @"trialArn" : @"TrialArn",
             @"trialComponentSummaries" : @"TrialComponentSummaries",
             @"trialName" : @"TrialName",
             };
}

+ (NSValueTransformer *)createdByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserContext class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserContext class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrialSource class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

+ (NSValueTransformer *)trialComponentSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTrialComponentSimpleSummary class]];
}

@end

@implementation AWSapi.sagemakerTrialComponent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdBy" : @"CreatedBy",
             @"creationTime" : @"CreationTime",
             @"displayName" : @"DisplayName",
             @"endTime" : @"EndTime",
             @"inputArtifacts" : @"InputArtifacts",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"metrics" : @"Metrics",
             @"outputArtifacts" : @"OutputArtifacts",
             @"parameters" : @"Parameters",
             @"parents" : @"Parents",
             @"source" : @"Source",
             @"sourceDetail" : @"SourceDetail",
             @"startTime" : @"StartTime",
             @"status" : @"Status",
             @"tags" : @"Tags",
             @"trialComponentArn" : @"TrialComponentArn",
             @"trialComponentName" : @"TrialComponentName",
             };
}

+ (NSValueTransformer *)createdByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserContext class]];
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

+ (NSValueTransformer *)inputArtifactsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapi.sagemakerTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)lastModifiedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserContext class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)metricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTrialComponentMetricSummary class]];
}

+ (NSValueTransformer *)outputArtifactsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapi.sagemakerTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapi.sagemakerTrialComponentParameterValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)parentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerParent class]];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrialComponentSource class]];
}

+ (NSValueTransformer *)sourceDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrialComponentSourceDetail class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrialComponentStatus class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerTag class]];
}

@end

@implementation AWSapi.sagemakerTrialComponentArtifact

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mediaType" : @"MediaType",
             @"value" : @"Value",
             };
}

@end

@implementation AWSapi.sagemakerTrialComponentMetricSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"avg" : @"Avg",
             @"count" : @"Count",
             @"last" : @"Last",
             @"max" : @"Max",
             @"metricName" : @"MetricName",
             @"min" : @"Min",
             @"sourceArn" : @"SourceArn",
             @"stdDev" : @"StdDev",
             @"timeStamp" : @"TimeStamp",
             };
}

+ (NSValueTransformer *)timeStampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.sagemakerTrialComponentParameterValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"numberValue" : @"NumberValue",
             @"stringValue" : @"StringValue",
             };
}

@end

@implementation AWSapi.sagemakerTrialComponentSimpleSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdBy" : @"CreatedBy",
             @"creationTime" : @"CreationTime",
             @"trialComponentArn" : @"TrialComponentArn",
             @"trialComponentName" : @"TrialComponentName",
             @"trialComponentSource" : @"TrialComponentSource",
             };
}

+ (NSValueTransformer *)createdByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserContext class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)trialComponentSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrialComponentSource class]];
}

@end

@implementation AWSapi.sagemakerTrialComponentSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceArn" : @"SourceArn",
             @"sourceType" : @"SourceType",
             };
}

@end

@implementation AWSapi.sagemakerTrialComponentSourceDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"processingJob" : @"ProcessingJob",
             @"sourceArn" : @"SourceArn",
             @"trainingJob" : @"TrainingJob",
             };
}

+ (NSValueTransformer *)processingJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerProcessingJob class]];
}

+ (NSValueTransformer *)trainingJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrainingJob class]];
}

@end

@implementation AWSapi.sagemakerTrialComponentStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"primaryStatus" : @"PrimaryStatus",
             };
}

+ (NSValueTransformer *)primaryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrialComponentPrimaryStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrialComponentPrimaryStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrialComponentPrimaryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrialComponentPrimaryStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSapi.sagemakerTrialComponentPrimaryStatusStopped);
        }
        return @(AWSapi.sagemakerTrialComponentPrimaryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerTrialComponentPrimaryStatusInProgress:
                return @"InProgress";
            case AWSapi.sagemakerTrialComponentPrimaryStatusCompleted:
                return @"Completed";
            case AWSapi.sagemakerTrialComponentPrimaryStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerTrialComponentPrimaryStatusStopping:
                return @"Stopping";
            case AWSapi.sagemakerTrialComponentPrimaryStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerTrialComponentSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdBy" : @"CreatedBy",
             @"creationTime" : @"CreationTime",
             @"displayName" : @"DisplayName",
             @"endTime" : @"EndTime",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"startTime" : @"StartTime",
             @"status" : @"Status",
             @"trialComponentArn" : @"TrialComponentArn",
             @"trialComponentName" : @"TrialComponentName",
             @"trialComponentSource" : @"TrialComponentSource",
             };
}

+ (NSValueTransformer *)createdByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserContext class]];
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

+ (NSValueTransformer *)lastModifiedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserContext class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrialComponentStatus class]];
}

+ (NSValueTransformer *)trialComponentSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrialComponentSource class]];
}

@end

@implementation AWSapi.sagemakerTrialSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceArn" : @"SourceArn",
             @"sourceType" : @"SourceType",
             };
}

@end

@implementation AWSapi.sagemakerTrialSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"displayName" : @"DisplayName",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"trialArn" : @"TrialArn",
             @"trialName" : @"TrialName",
             @"trialSource" : @"TrialSource",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)trialSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrialSource class]];
}

@end

@implementation AWSapi.sagemakerTuningJobCompletionCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetObjectiveMetricValue" : @"TargetObjectiveMetricValue",
             };
}

@end

@implementation AWSapi.sagemakerUSD

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cents" : @"Cents",
             @"dollars" : @"Dollars",
             @"tenthFractionsOfACent" : @"TenthFractionsOfACent",
             };
}

@end

@implementation AWSapi.sagemakerUiConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"uiTemplateS3Uri" : @"UiTemplateS3Uri",
             };
}

@end

@implementation AWSapi.sagemakerUiTemplate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             };
}

@end

@implementation AWSapi.sagemakerUiTemplateInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentSha256" : @"ContentSha256",
             @"url" : @"Url",
             };
}

@end

@implementation AWSapi.sagemakerUpdateCodeRepositoryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositoryName" : @"CodeRepositoryName",
             @"gitConfig" : @"GitConfig",
             };
}

+ (NSValueTransformer *)gitConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerGitConfigForUpdate class]];
}

@end

@implementation AWSapi.sagemakerUpdateCodeRepositoryOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositoryArn" : @"CodeRepositoryArn",
             };
}

@end

@implementation AWSapi.sagemakerUpdateDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultUserSettings" : @"DefaultUserSettings",
             @"domainId" : @"DomainId",
             };
}

+ (NSValueTransformer *)defaultUserSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserSettings class]];
}

@end

@implementation AWSapi.sagemakerUpdateDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainArn" : @"DomainArn",
             };
}

@end

@implementation AWSapi.sagemakerUpdateEndpointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointConfigName" : @"EndpointConfigName",
             @"endpointName" : @"EndpointName",
             @"excludeRetainedVariantProperties" : @"ExcludeRetainedVariantProperties",
             @"retainAllVariantProperties" : @"RetainAllVariantProperties",
             };
}

+ (NSValueTransformer *)excludeRetainedVariantPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerVariantProperty class]];
}

@end

@implementation AWSapi.sagemakerUpdateEndpointOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"desiredWeightsAndCapacities" : @"DesiredWeightsAndCapacities",
             @"endpointName" : @"EndpointName",
             };
}

+ (NSValueTransformer *)desiredWeightsAndCapacitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerDesiredWeightAndCapacity class]];
}

@end

@implementation AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSapi.sagemakerUpdateExperimentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"displayName" : @"DisplayName",
             @"experimentName" : @"ExperimentName",
             };
}

@end

@implementation AWSapi.sagemakerUpdateExperimentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentArn" : @"ExperimentArn",
             };
}

@end

@implementation AWSapi.sagemakerUpdateMonitoringScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleConfig" : @"MonitoringScheduleConfig",
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             };
}

+ (NSValueTransformer *)monitoringScheduleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerMonitoringScheduleConfig class]];
}

@end

@implementation AWSapi.sagemakerUpdateMonitoringScheduleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleArn" : @"MonitoringScheduleArn",
             };
}

@end

@implementation AWSapi.sagemakerUpdateNotebookInstanceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceleratorTypes" : @"AcceleratorTypes",
             @"additionalCodeRepositories" : @"AdditionalCodeRepositories",
             @"defaultCodeRepository" : @"DefaultCodeRepository",
             @"disassociateAcceleratorTypes" : @"DisassociateAcceleratorTypes",
             @"disassociateAdditionalCodeRepositories" : @"DisassociateAdditionalCodeRepositories",
             @"disassociateDefaultCodeRepository" : @"DisassociateDefaultCodeRepository",
             @"disassociateLifecycleConfig" : @"DisassociateLifecycleConfig",
             @"instanceType" : @"InstanceType",
             @"lifecycleConfigName" : @"LifecycleConfigName",
             @"notebookInstanceName" : @"NotebookInstanceName",
             @"roleArn" : @"RoleArn",
             @"rootAccess" : @"RootAccess",
             @"volumeSizeInGB" : @"VolumeSizeInGB",
             };
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ml.t2.medium"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT2Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT2Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT22xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.medium"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.4xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.9xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5d9xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.18xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlC5d18xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSapi.sagemakerInstanceTypeMlP316xlarge);
        }
        return @(AWSapi.sagemakerInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerInstanceTypeMlT2Medium:
                return @"ml.t2.medium";
            case AWSapi.sagemakerInstanceTypeMlT2Large:
                return @"ml.t2.large";
            case AWSapi.sagemakerInstanceTypeMlT2Xlarge:
                return @"ml.t2.xlarge";
            case AWSapi.sagemakerInstanceTypeMlT22xlarge:
                return @"ml.t2.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSapi.sagemakerInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSapi.sagemakerInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSapi.sagemakerInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSapi.sagemakerInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSapi.sagemakerInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSapi.sagemakerInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSapi.sagemakerInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSapi.sagemakerInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSapi.sagemakerInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSapi.sagemakerInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSapi.sagemakerInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSapi.sagemakerInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSapi.sagemakerInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSapi.sagemakerInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSapi.sagemakerInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSapi.sagemakerInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5dXlarge:
                return @"ml.c5d.xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5d2xlarge:
                return @"ml.c5d.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5d4xlarge:
                return @"ml.c5d.4xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5d9xlarge:
                return @"ml.c5d.9xlarge";
            case AWSapi.sagemakerInstanceTypeMlC5d18xlarge:
                return @"ml.c5d.18xlarge";
            case AWSapi.sagemakerInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSapi.sagemakerInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSapi.sagemakerInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSapi.sagemakerInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSapi.sagemakerInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSapi.sagemakerInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rootAccessJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSapi.sagemakerRootAccessEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSapi.sagemakerRootAccessDisabled);
        }
        return @(AWSapi.sagemakerRootAccessUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerRootAccessEnabled:
                return @"Enabled";
            case AWSapi.sagemakerRootAccessDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceLifecycleConfigName" : @"NotebookInstanceLifecycleConfigName",
             @"onCreate" : @"OnCreate",
             @"onStart" : @"OnStart",
             };
}

+ (NSValueTransformer *)onCreateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerNotebookInstanceLifecycleHook class]];
}

+ (NSValueTransformer *)onStartJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerNotebookInstanceLifecycleHook class]];
}

@end

@implementation AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigOutput

@end

@implementation AWSapi.sagemakerUpdateNotebookInstanceOutput

@end

@implementation AWSapi.sagemakerUpdateTrialComponentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             @"endTime" : @"EndTime",
             @"inputArtifacts" : @"InputArtifacts",
             @"inputArtifactsToRemove" : @"InputArtifactsToRemove",
             @"outputArtifacts" : @"OutputArtifacts",
             @"outputArtifactsToRemove" : @"OutputArtifactsToRemove",
             @"parameters" : @"Parameters",
             @"parametersToRemove" : @"ParametersToRemove",
             @"startTime" : @"StartTime",
             @"status" : @"Status",
             @"trialComponentName" : @"TrialComponentName",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inputArtifactsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapi.sagemakerTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)outputArtifactsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapi.sagemakerTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSapi.sagemakerTrialComponentParameterValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTrialComponentStatus class]];
}

@end

@implementation AWSapi.sagemakerUpdateTrialComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentArn" : @"TrialComponentArn",
             };
}

@end

@implementation AWSapi.sagemakerUpdateTrialRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSapi.sagemakerUpdateTrialResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialArn" : @"TrialArn",
             };
}

@end

@implementation AWSapi.sagemakerUpdateUserProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             @"userProfileName" : @"UserProfileName",
             @"userSettings" : @"UserSettings",
             };
}

+ (NSValueTransformer *)userSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerUserSettings class]];
}

@end

@implementation AWSapi.sagemakerUpdateUserProfileResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userProfileArn" : @"UserProfileArn",
             };
}

@end

@implementation AWSapi.sagemakerUpdateWorkforceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceIpConfig" : @"SourceIpConfig",
             @"workforceName" : @"WorkforceName",
             };
}

+ (NSValueTransformer *)sourceIpConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerSourceIpConfig class]];
}

@end

@implementation AWSapi.sagemakerUpdateWorkforceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workforce" : @"Workforce",
             };
}

+ (NSValueTransformer *)workforceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerWorkforce class]];
}

@end

@implementation AWSapi.sagemakerUpdateWorkteamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"memberDefinitions" : @"MemberDefinitions",
             @"notificationConfiguration" : @"NotificationConfiguration",
             @"workteamName" : @"WorkteamName",
             };
}

+ (NSValueTransformer *)memberDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerMemberDefinition class]];
}

+ (NSValueTransformer *)notificationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerNotificationConfiguration class]];
}

@end

@implementation AWSapi.sagemakerUpdateWorkteamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workteam" : @"Workteam",
             };
}

+ (NSValueTransformer *)workteamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerWorkteam class]];
}

@end

@implementation AWSapi.sagemakerUserContext

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             @"userProfileArn" : @"UserProfileArn",
             @"userProfileName" : @"UserProfileName",
             };
}

@end

@implementation AWSapi.sagemakerUserProfileDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"domainId" : @"DomainId",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"status" : @"Status",
             @"userProfileName" : @"UserProfileName",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSapi.sagemakerUserProfileStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSapi.sagemakerUserProfileStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSapi.sagemakerUserProfileStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSapi.sagemakerUserProfileStatusPending);
        }
        return @(AWSapi.sagemakerUserProfileStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerUserProfileStatusDeleting:
                return @"Deleting";
            case AWSapi.sagemakerUserProfileStatusFailed:
                return @"Failed";
            case AWSapi.sagemakerUserProfileStatusInService:
                return @"InService";
            case AWSapi.sagemakerUserProfileStatusPending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerUserSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"executionRole" : @"ExecutionRole",
             @"jupyterServerAppSettings" : @"JupyterServerAppSettings",
             @"kernelGatewayAppSettings" : @"KernelGatewayAppSettings",
             @"securityGroups" : @"SecurityGroups",
             @"sharingSettings" : @"SharingSettings",
             @"tensorBoardAppSettings" : @"TensorBoardAppSettings",
             };
}

+ (NSValueTransformer *)jupyterServerAppSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerJupyterServerAppSettings class]];
}

+ (NSValueTransformer *)kernelGatewayAppSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerKernelGatewayAppSettings class]];
}

+ (NSValueTransformer *)sharingSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerSharingSettings class]];
}

+ (NSValueTransformer *)tensorBoardAppSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerTensorBoardAppSettings class]];
}

@end

@implementation AWSapi.sagemakerVariantProperty

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"variantPropertyType" : @"VariantPropertyType",
             };
}

+ (NSValueTransformer *)variantPropertyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSapi.sagemakerVariantPropertyTypeDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"DesiredWeight"] == NSOrderedSame) {
            return @(AWSapi.sagemakerVariantPropertyTypeDesiredWeight);
        }
        if ([value caseInsensitiveCompare:@"DataCaptureConfig"] == NSOrderedSame) {
            return @(AWSapi.sagemakerVariantPropertyTypeDataCaptureConfig);
        }
        return @(AWSapi.sagemakerVariantPropertyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.sagemakerVariantPropertyTypeDesiredInstanceCount:
                return @"DesiredInstanceCount";
            case AWSapi.sagemakerVariantPropertyTypeDesiredWeight:
                return @"DesiredWeight";
            case AWSapi.sagemakerVariantPropertyTypeDataCaptureConfig:
                return @"DataCaptureConfig";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.sagemakerVpcConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnets" : @"Subnets",
             };
}

@end

@implementation AWSapi.sagemakerWorkforce

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastUpdatedDate" : @"LastUpdatedDate",
             @"sourceIpConfig" : @"SourceIpConfig",
             @"workforceArn" : @"WorkforceArn",
             @"workforceName" : @"WorkforceName",
             };
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sourceIpConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerSourceIpConfig class]];
}

@end

@implementation AWSapi.sagemakerWorkteam

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createDate" : @"CreateDate",
             @"detail" : @"Description",
             @"lastUpdatedDate" : @"LastUpdatedDate",
             @"memberDefinitions" : @"MemberDefinitions",
             @"notificationConfiguration" : @"NotificationConfiguration",
             @"productListingIds" : @"ProductListingIds",
             @"subDomain" : @"SubDomain",
             @"workteamArn" : @"WorkteamArn",
             @"workteamName" : @"WorkteamName",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)memberDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.sagemakerMemberDefinition class]];
}

+ (NSValueTransformer *)notificationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.sagemakerNotificationConfiguration class]];
}

@end
