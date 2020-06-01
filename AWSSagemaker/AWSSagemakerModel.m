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

#import "AWSSagemakerModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSSagemakerErrorDomain = @"com.amazonaws.AWSSagemakerErrorDomain";

@implementation AWSSagemakerAddTagsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerAddTagsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerAlgorithmSpecification

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerMetricDefinition class]];
}

+ (NSValueTransformer *)trainingInputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pipe"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInputModePipe);
        }
        if ([value caseInsensitiveCompare:@"File"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInputModeFile);
        }
        return @(AWSSagemakerTrainingInputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerTrainingInputModePipe:
                return @"Pipe";
            case AWSSagemakerTrainingInputModeFile:
                return @"File";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerAlgorithmStatusDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageScanStatuses" : @"ImageScanStatuses",
             @"validationStatuses" : @"ValidationStatuses",
             };
}

+ (NSValueTransformer *)imageScanStatusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerAlgorithmStatusItem class]];
}

+ (NSValueTransformer *)validationStatusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerAlgorithmStatusItem class]];
}

@end

@implementation AWSSagemakerAlgorithmStatusItem

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
            return @(AWSSagemakerDetailedAlgorithmStatusNotStarted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerDetailedAlgorithmStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerDetailedAlgorithmStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerDetailedAlgorithmStatusFailed);
        }
        return @(AWSSagemakerDetailedAlgorithmStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerDetailedAlgorithmStatusNotStarted:
                return @"NotStarted";
            case AWSSagemakerDetailedAlgorithmStatusInProgress:
                return @"InProgress";
            case AWSSagemakerDetailedAlgorithmStatusCompleted:
                return @"Completed";
            case AWSSagemakerDetailedAlgorithmStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerAlgorithmSummary

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
            return @(AWSSagemakerAlgorithmStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerAlgorithmStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerAlgorithmStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerAlgorithmStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSagemakerAlgorithmStatusDeleting);
        }
        return @(AWSSagemakerAlgorithmStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAlgorithmStatusPending:
                return @"Pending";
            case AWSSagemakerAlgorithmStatusInProgress:
                return @"InProgress";
            case AWSSagemakerAlgorithmStatusCompleted:
                return @"Completed";
            case AWSSagemakerAlgorithmStatusFailed:
                return @"Failed";
            case AWSSagemakerAlgorithmStatusDeleting:
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

@implementation AWSSagemakerAlgorithmValidationProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"profileName" : @"ProfileName",
             @"trainingJobDefinition" : @"TrainingJobDefinition",
             @"transformJobDefinition" : @"TransformJobDefinition",
             };
}

+ (NSValueTransformer *)trainingJobDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrainingJobDefinition class]];
}

+ (NSValueTransformer *)transformJobDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTransformJobDefinition class]];
}

@end

@implementation AWSSagemakerAlgorithmValidationSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"validationProfiles" : @"ValidationProfiles",
             @"validationRole" : @"ValidationRole",
             };
}

+ (NSValueTransformer *)validationProfilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerAlgorithmValidationProfile class]];
}

@end

@implementation AWSSagemakerAnnotationConsolidationConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"annotationConsolidationLambdaArn" : @"AnnotationConsolidationLambdaArn",
             };
}

@end

@implementation AWSSagemakerAppDetails

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
            return @(AWSSagemakerAppTypeJupyterServer);
        }
        if ([value caseInsensitiveCompare:@"KernelGateway"] == NSOrderedSame) {
            return @(AWSSagemakerAppTypeKernelGateway);
        }
        if ([value caseInsensitiveCompare:@"TensorBoard"] == NSOrderedSame) {
            return @(AWSSagemakerAppTypeTensorBoard);
        }
        return @(AWSSagemakerAppTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAppTypeJupyterServer:
                return @"JupyterServer";
            case AWSSagemakerAppTypeKernelGateway:
                return @"KernelGateway";
            case AWSSagemakerAppTypeTensorBoard:
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
            return @(AWSSagemakerAppStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSagemakerAppStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerAppStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSagemakerAppStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSagemakerAppStatusPending);
        }
        return @(AWSSagemakerAppStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAppStatusDeleted:
                return @"Deleted";
            case AWSSagemakerAppStatusDeleting:
                return @"Deleting";
            case AWSSagemakerAppStatusFailed:
                return @"Failed";
            case AWSSagemakerAppStatusInService:
                return @"InService";
            case AWSSagemakerAppStatusPending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerAppSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"containerArguments" : @"ContainerArguments",
             @"containerEntrypoint" : @"ContainerEntrypoint",
             @"imageUri" : @"ImageUri",
             };
}

@end

@implementation AWSSagemakerAssociateTrialComponentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentName" : @"TrialComponentName",
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSSagemakerAssociateTrialComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialArn" : @"TrialArn",
             @"trialComponentArn" : @"TrialComponentArn",
             };
}

@end

@implementation AWSSagemakerAutoMLCandidate

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
            return @(AWSSagemakerCandidateStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerCandidateStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerCandidateStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerCandidateStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerCandidateStatusStopping);
        }
        return @(AWSSagemakerCandidateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerCandidateStatusCompleted:
                return @"Completed";
            case AWSSagemakerCandidateStatusInProgress:
                return @"InProgress";
            case AWSSagemakerCandidateStatusFailed:
                return @"Failed";
            case AWSSagemakerCandidateStatusStopped:
                return @"Stopped";
            case AWSSagemakerCandidateStatusStopping:
                return @"Stopping";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)candidateStepsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerAutoMLCandidateStep class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerFinalAutoMLJobObjectiveMetric class]];
}

+ (NSValueTransformer *)inferenceContainersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerAutoMLContainerDefinition class]];
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
            return @(AWSSagemakerObjectiveStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSagemakerObjectiveStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerObjectiveStatusFailed);
        }
        return @(AWSSagemakerObjectiveStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerObjectiveStatusSucceeded:
                return @"Succeeded";
            case AWSSagemakerObjectiveStatusPending:
                return @"Pending";
            case AWSSagemakerObjectiveStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerAutoMLCandidateStep

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
            return @(AWSSagemakerCandidateStepTypeAWSSageMakerTrainingJob);
        }
        if ([value caseInsensitiveCompare:@"AWS::SageMaker::TransformJob"] == NSOrderedSame) {
            return @(AWSSagemakerCandidateStepTypeAWSSageMakerTransformJob);
        }
        if ([value caseInsensitiveCompare:@"AWS::SageMaker::ProcessingJob"] == NSOrderedSame) {
            return @(AWSSagemakerCandidateStepTypeAWSSageMakerProcessingJob);
        }
        return @(AWSSagemakerCandidateStepTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerCandidateStepTypeAWSSageMakerTrainingJob:
                return @"AWS::SageMaker::TrainingJob";
            case AWSSagemakerCandidateStepTypeAWSSageMakerTransformJob:
                return @"AWS::SageMaker::TransformJob";
            case AWSSagemakerCandidateStepTypeAWSSageMakerProcessingJob:
                return @"AWS::SageMaker::ProcessingJob";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerAutoMLChannel

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
            return @(AWSSagemakerCompressionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"Gzip"] == NSOrderedSame) {
            return @(AWSSagemakerCompressionTypeGzip);
        }
        return @(AWSSagemakerCompressionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerCompressionTypeNone:
                return @"None";
            case AWSSagemakerCompressionTypeGzip:
                return @"Gzip";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAutoMLDataSource class]];
}

@end

@implementation AWSSagemakerAutoMLContainerDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"environment" : @"Environment",
             @"image" : @"Image",
             @"modelDataUrl" : @"ModelDataUrl",
             };
}

@end

@implementation AWSSagemakerAutoMLDataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3DataSource" : @"S3DataSource",
             };
}

+ (NSValueTransformer *)s3DataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAutoMLS3DataSource class]];
}

@end

@implementation AWSSagemakerAutoMLJobArtifacts

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"candidateDefinitionNotebookLocation" : @"CandidateDefinitionNotebookLocation",
             @"dataExplorationNotebookLocation" : @"DataExplorationNotebookLocation",
             };
}

@end

@implementation AWSSagemakerAutoMLJobCompletionCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxAutoMLJobRuntimeInSeconds" : @"MaxAutoMLJobRuntimeInSeconds",
             @"maxCandidates" : @"MaxCandidates",
             @"maxRuntimePerTrainingJobInSeconds" : @"MaxRuntimePerTrainingJobInSeconds",
             };
}

@end

@implementation AWSSagemakerAutoMLJobConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completionCriteria" : @"CompletionCriteria",
             @"securityConfig" : @"SecurityConfig",
             };
}

+ (NSValueTransformer *)completionCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAutoMLJobCompletionCriteria class]];
}

+ (NSValueTransformer *)securityConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAutoMLSecurityConfig class]];
}

@end

@implementation AWSSagemakerAutoMLJobObjective

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricName" : @"MetricName",
             };
}

+ (NSValueTransformer *)metricNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Accuracy"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLMetricEnumAccuracy);
        }
        if ([value caseInsensitiveCompare:@"MSE"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLMetricEnumMse);
        }
        if ([value caseInsensitiveCompare:@"F1"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLMetricEnumF1);
        }
        if ([value caseInsensitiveCompare:@"F1macro"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLMetricEnumF1macro);
        }
        return @(AWSSagemakerAutoMLMetricEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAutoMLMetricEnumAccuracy:
                return @"Accuracy";
            case AWSSagemakerAutoMLMetricEnumMse:
                return @"MSE";
            case AWSSagemakerAutoMLMetricEnumF1:
                return @"F1";
            case AWSSagemakerAutoMLMetricEnumF1macro:
                return @"F1macro";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerAutoMLJobSummary

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
            return @(AWSSagemakerAutoMLJobSecondaryStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"AnalyzingData"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobSecondaryStatusAnalyzingData);
        }
        if ([value caseInsensitiveCompare:@"FeatureEngineering"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobSecondaryStatusFeatureEngineering);
        }
        if ([value caseInsensitiveCompare:@"ModelTuning"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobSecondaryStatusModelTuning);
        }
        if ([value caseInsensitiveCompare:@"MaxCandidatesReached"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobSecondaryStatusMaxCandidatesReached);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobSecondaryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobSecondaryStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"MaxAutoMLJobRuntimeReached"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobSecondaryStatusMaxAutoMLJobRuntimeReached);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobSecondaryStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"CandidateDefinitionsGenerated"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobSecondaryStatusCandidateDefinitionsGenerated);
        }
        return @(AWSSagemakerAutoMLJobSecondaryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAutoMLJobSecondaryStatusStarting:
                return @"Starting";
            case AWSSagemakerAutoMLJobSecondaryStatusAnalyzingData:
                return @"AnalyzingData";
            case AWSSagemakerAutoMLJobSecondaryStatusFeatureEngineering:
                return @"FeatureEngineering";
            case AWSSagemakerAutoMLJobSecondaryStatusModelTuning:
                return @"ModelTuning";
            case AWSSagemakerAutoMLJobSecondaryStatusMaxCandidatesReached:
                return @"MaxCandidatesReached";
            case AWSSagemakerAutoMLJobSecondaryStatusFailed:
                return @"Failed";
            case AWSSagemakerAutoMLJobSecondaryStatusStopped:
                return @"Stopped";
            case AWSSagemakerAutoMLJobSecondaryStatusMaxAutoMLJobRuntimeReached:
                return @"MaxAutoMLJobRuntimeReached";
            case AWSSagemakerAutoMLJobSecondaryStatusStopping:
                return @"Stopping";
            case AWSSagemakerAutoMLJobSecondaryStatusCandidateDefinitionsGenerated:
                return @"CandidateDefinitionsGenerated";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)autoMLJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobStatusStopping);
        }
        return @(AWSSagemakerAutoMLJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAutoMLJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerAutoMLJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerAutoMLJobStatusFailed:
                return @"Failed";
            case AWSSagemakerAutoMLJobStatusStopped:
                return @"Stopped";
            case AWSSagemakerAutoMLJobStatusStopping:
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

@implementation AWSSagemakerAutoMLOutputDataConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"s3OutputPath" : @"S3OutputPath",
             };
}

@end

@implementation AWSSagemakerAutoMLS3DataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3DataType" : @"S3DataType",
             @"s3Uri" : @"S3Uri",
             };
}

+ (NSValueTransformer *)s3DataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ManifestFile"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLS3DataTypeManifestFile);
        }
        if ([value caseInsensitiveCompare:@"S3Prefix"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLS3DataTypeS3Prefix);
        }
        return @(AWSSagemakerAutoMLS3DataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAutoMLS3DataTypeManifestFile:
                return @"ManifestFile";
            case AWSSagemakerAutoMLS3DataTypeS3Prefix:
                return @"S3Prefix";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerAutoMLSecurityConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enableInterContainerTrafficEncryption" : @"EnableInterContainerTrafficEncryption",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerVpcConfig class]];
}

@end

@implementation AWSSagemakerCaptureContentTypeHeader

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"csvContentTypes" : @"CsvContentTypes",
             @"jsonContentTypes" : @"JsonContentTypes",
             };
}

@end

@implementation AWSSagemakerCaptureOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"captureMode" : @"CaptureMode",
             };
}

+ (NSValueTransformer *)captureModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Input"] == NSOrderedSame) {
            return @(AWSSagemakerCaptureModeInput);
        }
        if ([value caseInsensitiveCompare:@"Output"] == NSOrderedSame) {
            return @(AWSSagemakerCaptureModeOutput);
        }
        return @(AWSSagemakerCaptureModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerCaptureModeInput:
                return @"Input";
            case AWSSagemakerCaptureModeOutput:
                return @"Output";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerCategoricalParameterRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

@end

@implementation AWSSagemakerCategoricalParameterRangeSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"values" : @"Values",
             };
}

@end

@implementation AWSSagemakerChannel

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
            return @(AWSSagemakerCompressionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"Gzip"] == NSOrderedSame) {
            return @(AWSSagemakerCompressionTypeGzip);
        }
        return @(AWSSagemakerCompressionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerCompressionTypeNone:
                return @"None";
            case AWSSagemakerCompressionTypeGzip:
                return @"Gzip";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerDataSource class]];
}

+ (NSValueTransformer *)inputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pipe"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInputModePipe);
        }
        if ([value caseInsensitiveCompare:@"File"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInputModeFile);
        }
        return @(AWSSagemakerTrainingInputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerTrainingInputModePipe:
                return @"Pipe";
            case AWSSagemakerTrainingInputModeFile:
                return @"File";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)recordWrapperTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSSagemakerRecordWrapperNone);
        }
        if ([value caseInsensitiveCompare:@"RecordIO"] == NSOrderedSame) {
            return @(AWSSagemakerRecordWrapperRecordIO);
        }
        return @(AWSSagemakerRecordWrapperUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerRecordWrapperNone:
                return @"None";
            case AWSSagemakerRecordWrapperRecordIO:
                return @"RecordIO";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)shuffleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerShuffleConfig class]];
}

@end

@implementation AWSSagemakerChannelSpecification

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

@implementation AWSSagemakerCheckpointConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"localPath" : @"LocalPath",
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSSagemakerCodeRepositorySummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerGitConfig class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSagemakerCognitoMemberDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"userGroup" : @"UserGroup",
             @"userPool" : @"UserPool",
             };
}

@end

@implementation AWSSagemakerCollectionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionName" : @"CollectionName",
             @"collectionParameters" : @"CollectionParameters",
             };
}

@end

@implementation AWSSagemakerCompilationJobSummary

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
            return @(AWSSagemakerCompilationJobStatusInprogress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSSagemakerCompilationJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSagemakerCompilationJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSSagemakerCompilationJobStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSSagemakerCompilationJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSSagemakerCompilationJobStatusStopped);
        }
        return @(AWSSagemakerCompilationJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerCompilationJobStatusInprogress:
                return @"INPROGRESS";
            case AWSSagemakerCompilationJobStatusCompleted:
                return @"COMPLETED";
            case AWSSagemakerCompilationJobStatusFailed:
                return @"FAILED";
            case AWSSagemakerCompilationJobStatusStarting:
                return @"STARTING";
            case AWSSagemakerCompilationJobStatusStopping:
                return @"STOPPING";
            case AWSSagemakerCompilationJobStatusStopped:
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
            return @(AWSSagemakerTargetDeviceLambda);
        }
        if ([value caseInsensitiveCompare:@"ml_m4"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceMlM4);
        }
        if ([value caseInsensitiveCompare:@"ml_m5"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceMlM5);
        }
        if ([value caseInsensitiveCompare:@"ml_c4"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceMlC4);
        }
        if ([value caseInsensitiveCompare:@"ml_c5"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceMlC5);
        }
        if ([value caseInsensitiveCompare:@"ml_p2"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceMlP2);
        }
        if ([value caseInsensitiveCompare:@"ml_p3"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceMlP3);
        }
        if ([value caseInsensitiveCompare:@"ml_inf1"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceMlInf1);
        }
        if ([value caseInsensitiveCompare:@"jetson_tx1"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceJetsonTx1);
        }
        if ([value caseInsensitiveCompare:@"jetson_tx2"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceJetsonTx2);
        }
        if ([value caseInsensitiveCompare:@"jetson_nano"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceJetsonNano);
        }
        if ([value caseInsensitiveCompare:@"jetson_xavier"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceJetsonXavier);
        }
        if ([value caseInsensitiveCompare:@"rasp3b"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceRasp3b);
        }
        if ([value caseInsensitiveCompare:@"imx8qm"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceImx8qm);
        }
        if ([value caseInsensitiveCompare:@"deeplens"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceDeeplens);
        }
        if ([value caseInsensitiveCompare:@"rk3399"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceRk3399);
        }
        if ([value caseInsensitiveCompare:@"rk3288"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceRk3288);
        }
        if ([value caseInsensitiveCompare:@"aisage"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceAisage);
        }
        if ([value caseInsensitiveCompare:@"sbe_c"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceSbeC);
        }
        if ([value caseInsensitiveCompare:@"qcs605"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceQcs605);
        }
        if ([value caseInsensitiveCompare:@"qcs603"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceQcs603);
        }
        if ([value caseInsensitiveCompare:@"sitara_am57x"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceSitaraAm57x);
        }
        if ([value caseInsensitiveCompare:@"amba_cv22"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceAmbaCv22);
        }
        return @(AWSSagemakerTargetDeviceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerTargetDeviceLambda:
                return @"lambda";
            case AWSSagemakerTargetDeviceMlM4:
                return @"ml_m4";
            case AWSSagemakerTargetDeviceMlM5:
                return @"ml_m5";
            case AWSSagemakerTargetDeviceMlC4:
                return @"ml_c4";
            case AWSSagemakerTargetDeviceMlC5:
                return @"ml_c5";
            case AWSSagemakerTargetDeviceMlP2:
                return @"ml_p2";
            case AWSSagemakerTargetDeviceMlP3:
                return @"ml_p3";
            case AWSSagemakerTargetDeviceMlInf1:
                return @"ml_inf1";
            case AWSSagemakerTargetDeviceJetsonTx1:
                return @"jetson_tx1";
            case AWSSagemakerTargetDeviceJetsonTx2:
                return @"jetson_tx2";
            case AWSSagemakerTargetDeviceJetsonNano:
                return @"jetson_nano";
            case AWSSagemakerTargetDeviceJetsonXavier:
                return @"jetson_xavier";
            case AWSSagemakerTargetDeviceRasp3b:
                return @"rasp3b";
            case AWSSagemakerTargetDeviceImx8qm:
                return @"imx8qm";
            case AWSSagemakerTargetDeviceDeeplens:
                return @"deeplens";
            case AWSSagemakerTargetDeviceRk3399:
                return @"rk3399";
            case AWSSagemakerTargetDeviceRk3288:
                return @"rk3288";
            case AWSSagemakerTargetDeviceAisage:
                return @"aisage";
            case AWSSagemakerTargetDeviceSbeC:
                return @"sbe_c";
            case AWSSagemakerTargetDeviceQcs605:
                return @"qcs605";
            case AWSSagemakerTargetDeviceQcs603:
                return @"qcs603";
            case AWSSagemakerTargetDeviceSitaraAm57x:
                return @"sitara_am57x";
            case AWSSagemakerTargetDeviceAmbaCv22:
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

@implementation AWSSagemakerContainerDefinition

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
            return @(AWSSagemakerContainerModeSingleModel);
        }
        if ([value caseInsensitiveCompare:@"MultiModel"] == NSOrderedSame) {
            return @(AWSSagemakerContainerModeMultiModel);
        }
        return @(AWSSagemakerContainerModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerContainerModeSingleModel:
                return @"SingleModel";
            case AWSSagemakerContainerModeMultiModel:
                return @"MultiModel";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerContinuousParameterRange

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
            return @(AWSSagemakerHyperParameterScalingTypeAuto);
        }
        if ([value caseInsensitiveCompare:@"Linear"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterScalingTypeLinear);
        }
        if ([value caseInsensitiveCompare:@"Logarithmic"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterScalingTypeLogarithmic);
        }
        if ([value caseInsensitiveCompare:@"ReverseLogarithmic"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterScalingTypeReverseLogarithmic);
        }
        return @(AWSSagemakerHyperParameterScalingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerHyperParameterScalingTypeAuto:
                return @"Auto";
            case AWSSagemakerHyperParameterScalingTypeLinear:
                return @"Linear";
            case AWSSagemakerHyperParameterScalingTypeLogarithmic:
                return @"Logarithmic";
            case AWSSagemakerHyperParameterScalingTypeReverseLogarithmic:
                return @"ReverseLogarithmic";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerContinuousParameterRangeSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxValue" : @"MaxValue",
             @"minValue" : @"MinValue",
             };
}

@end

@implementation AWSSagemakerCreateAlgorithmInput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerInferenceSpecification class]];
}

+ (NSValueTransformer *)trainingSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrainingSpecification class]];
}

+ (NSValueTransformer *)validationSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAlgorithmValidationSpecification class]];
}

@end

@implementation AWSSagemakerCreateAlgorithmOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmArn" : @"AlgorithmArn",
             };
}

@end

@implementation AWSSagemakerCreateAppRequest

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
            return @(AWSSagemakerAppTypeJupyterServer);
        }
        if ([value caseInsensitiveCompare:@"KernelGateway"] == NSOrderedSame) {
            return @(AWSSagemakerAppTypeKernelGateway);
        }
        if ([value caseInsensitiveCompare:@"TensorBoard"] == NSOrderedSame) {
            return @(AWSSagemakerAppTypeTensorBoard);
        }
        return @(AWSSagemakerAppTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAppTypeJupyterServer:
                return @"JupyterServer";
            case AWSSagemakerAppTypeKernelGateway:
                return @"KernelGateway";
            case AWSSagemakerAppTypeTensorBoard:
                return @"TensorBoard";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceSpecJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerResourceSpec class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerCreateAppResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appArn" : @"AppArn",
             };
}

@end

@implementation AWSSagemakerCreateAutoMLJobRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAutoMLJobConfig class]];
}

+ (NSValueTransformer *)autoMLJobObjectiveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAutoMLJobObjective class]];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerAutoMLChannel class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAutoMLOutputDataConfig class]];
}

+ (NSValueTransformer *)problemTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BinaryClassification"] == NSOrderedSame) {
            return @(AWSSagemakerProblemTypeBinaryClassification);
        }
        if ([value caseInsensitiveCompare:@"MulticlassClassification"] == NSOrderedSame) {
            return @(AWSSagemakerProblemTypeMulticlassClassification);
        }
        if ([value caseInsensitiveCompare:@"Regression"] == NSOrderedSame) {
            return @(AWSSagemakerProblemTypeRegression);
        }
        return @(AWSSagemakerProblemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerProblemTypeBinaryClassification:
                return @"BinaryClassification";
            case AWSSagemakerProblemTypeMulticlassClassification:
                return @"MulticlassClassification";
            case AWSSagemakerProblemTypeRegression:
                return @"Regression";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerCreateAutoMLJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLJobArn" : @"AutoMLJobArn",
             };
}

@end

@implementation AWSSagemakerCreateCodeRepositoryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositoryName" : @"CodeRepositoryName",
             @"gitConfig" : @"GitConfig",
             };
}

+ (NSValueTransformer *)gitConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerGitConfig class]];
}

@end

@implementation AWSSagemakerCreateCodeRepositoryOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositoryArn" : @"CodeRepositoryArn",
             };
}

@end

@implementation AWSSagemakerCreateCompilationJobRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerInputConfig class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerOutputConfig class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerStoppingCondition class]];
}

@end

@implementation AWSSagemakerCreateCompilationJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compilationJobArn" : @"CompilationJobArn",
             };
}

@end

@implementation AWSSagemakerCreateDomainRequest

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
            return @(AWSSagemakerAuthModeSso);
        }
        if ([value caseInsensitiveCompare:@"IAM"] == NSOrderedSame) {
            return @(AWSSagemakerAuthModeIam);
        }
        return @(AWSSagemakerAuthModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAuthModeSso:
                return @"SSO";
            case AWSSagemakerAuthModeIam:
                return @"IAM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)defaultUserSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserSettings class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerCreateDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainArn" : @"DomainArn",
             @"url" : @"Url",
             };
}

@end

@implementation AWSSagemakerCreateEndpointConfigInput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerDataCaptureConfig class]];
}

+ (NSValueTransformer *)productionVariantsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerProductionVariant class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerCreateEndpointConfigOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointConfigArn" : @"EndpointConfigArn",
             };
}

@end

@implementation AWSSagemakerCreateEndpointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointConfigName" : @"EndpointConfigName",
             @"endpointName" : @"EndpointName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerCreateEndpointOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSSagemakerCreateExperimentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"displayName" : @"DisplayName",
             @"experimentName" : @"ExperimentName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerCreateExperimentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentArn" : @"ExperimentArn",
             };
}

@end

@implementation AWSSagemakerCreateFlowDefinitionRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerHumanLoopActivationConfig class]];
}

+ (NSValueTransformer *)humanLoopConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerHumanLoopConfig class]];
}

+ (NSValueTransformer *)humanLoopRequestSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerHumanLoopRequestSource class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerFlowDefinitionOutputConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerCreateFlowDefinitionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flowDefinitionArn" : @"FlowDefinitionArn",
             };
}

@end

@implementation AWSSagemakerCreateHumanTaskUiRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanTaskUiName" : @"HumanTaskUiName",
             @"tags" : @"Tags",
             @"uiTemplate" : @"UiTemplate",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

+ (NSValueTransformer *)uiTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUiTemplate class]];
}

@end

@implementation AWSSagemakerCreateHumanTaskUiResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanTaskUiArn" : @"HumanTaskUiArn",
             };
}

@end

@implementation AWSSagemakerCreateHyperParameterTuningJobRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerHyperParameterTuningJobConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

+ (NSValueTransformer *)trainingJobDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerHyperParameterTrainingJobDefinition class]];
}

+ (NSValueTransformer *)trainingJobDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerHyperParameterTrainingJobDefinition class]];
}

+ (NSValueTransformer *)warmStartConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerHyperParameterTuningJobWarmStartConfig class]];
}

@end

@implementation AWSSagemakerCreateHyperParameterTuningJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hyperParameterTuningJobArn" : @"HyperParameterTuningJobArn",
             };
}

@end

@implementation AWSSagemakerCreateLabelingJobRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerHumanTaskConfig class]];
}

+ (NSValueTransformer *)inputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerLabelingJobInputConfig class]];
}

+ (NSValueTransformer *)labelingJobAlgorithmsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerLabelingJobAlgorithmsConfig class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerLabelingJobOutputConfig class]];
}

+ (NSValueTransformer *)stoppingConditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerLabelingJobStoppingConditions class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerCreateLabelingJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelingJobArn" : @"LabelingJobArn",
             };
}

@end

@implementation AWSSagemakerCreateModelInput

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerContainerDefinition class]];
}

+ (NSValueTransformer *)primaryContainerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerContainerDefinition class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerVpcConfig class]];
}

@end

@implementation AWSSagemakerCreateModelOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelArn" : @"ModelArn",
             };
}

@end

@implementation AWSSagemakerCreateModelPackageInput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerInferenceSpecification class]];
}

+ (NSValueTransformer *)sourceAlgorithmSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerSourceAlgorithmSpecification class]];
}

+ (NSValueTransformer *)validationSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerModelPackageValidationSpecification class]];
}

@end

@implementation AWSSagemakerCreateModelPackageOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelPackageArn" : @"ModelPackageArn",
             };
}

@end

@implementation AWSSagemakerCreateMonitoringScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleConfig" : @"MonitoringScheduleConfig",
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)monitoringScheduleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerMonitoringScheduleConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerCreateMonitoringScheduleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleArn" : @"MonitoringScheduleArn",
             };
}

@end

@implementation AWSSagemakerCreateNotebookInstanceInput

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
            return @(AWSSagemakerDirectInternetAccessEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSSagemakerDirectInternetAccessDisabled);
        }
        return @(AWSSagemakerDirectInternetAccessUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerDirectInternetAccessEnabled:
                return @"Enabled";
            case AWSSagemakerDirectInternetAccessDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ml.t2.medium"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT2Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.large"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT2Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT22xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.medium"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.9xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5d9xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.18xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5d18xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP316xlarge);
        }
        return @(AWSSagemakerInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerInstanceTypeMlT2Medium:
                return @"ml.t2.medium";
            case AWSSagemakerInstanceTypeMlT2Large:
                return @"ml.t2.large";
            case AWSSagemakerInstanceTypeMlT2Xlarge:
                return @"ml.t2.xlarge";
            case AWSSagemakerInstanceTypeMlT22xlarge:
                return @"ml.t2.2xlarge";
            case AWSSagemakerInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSSagemakerInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSSagemakerInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSSagemakerInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSSagemakerInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSSagemakerInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSSagemakerInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSSagemakerInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSSagemakerInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSSagemakerInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSagemakerInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSagemakerInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSagemakerInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSagemakerInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSSagemakerInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSSagemakerInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSSagemakerInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSSagemakerInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSSagemakerInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSagemakerInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSagemakerInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSagemakerInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSagemakerInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSagemakerInstanceTypeMlC5dXlarge:
                return @"ml.c5d.xlarge";
            case AWSSagemakerInstanceTypeMlC5d2xlarge:
                return @"ml.c5d.2xlarge";
            case AWSSagemakerInstanceTypeMlC5d4xlarge:
                return @"ml.c5d.4xlarge";
            case AWSSagemakerInstanceTypeMlC5d9xlarge:
                return @"ml.c5d.9xlarge";
            case AWSSagemakerInstanceTypeMlC5d18xlarge:
                return @"ml.c5d.18xlarge";
            case AWSSagemakerInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSSagemakerInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSSagemakerInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSSagemakerInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSagemakerInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSagemakerInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rootAccessJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSSagemakerRootAccessEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSSagemakerRootAccessDisabled);
        }
        return @(AWSSagemakerRootAccessUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerRootAccessEnabled:
                return @"Enabled";
            case AWSSagemakerRootAccessDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerCreateNotebookInstanceLifecycleConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceLifecycleConfigName" : @"NotebookInstanceLifecycleConfigName",
             @"onCreate" : @"OnCreate",
             @"onStart" : @"OnStart",
             };
}

+ (NSValueTransformer *)onCreateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerNotebookInstanceLifecycleHook class]];
}

+ (NSValueTransformer *)onStartJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerNotebookInstanceLifecycleHook class]];
}

@end

@implementation AWSSagemakerCreateNotebookInstanceLifecycleConfigOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceLifecycleConfigArn" : @"NotebookInstanceLifecycleConfigArn",
             };
}

@end

@implementation AWSSagemakerCreateNotebookInstanceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceArn" : @"NotebookInstanceArn",
             };
}

@end

@implementation AWSSagemakerCreatePresignedDomainUrlRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             @"sessionExpirationDurationInSeconds" : @"SessionExpirationDurationInSeconds",
             @"userProfileName" : @"UserProfileName",
             };
}

@end

@implementation AWSSagemakerCreatePresignedDomainUrlResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizedUrl" : @"AuthorizedUrl",
             };
}

@end

@implementation AWSSagemakerCreatePresignedNotebookInstanceUrlInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceName" : @"NotebookInstanceName",
             @"sessionExpirationDurationInSeconds" : @"SessionExpirationDurationInSeconds",
             };
}

@end

@implementation AWSSagemakerCreatePresignedNotebookInstanceUrlOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizedUrl" : @"AuthorizedUrl",
             };
}

@end

@implementation AWSSagemakerCreateProcessingJobRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAppSpecification class]];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerExperimentConfig class]];
}

+ (NSValueTransformer *)networkConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerNetworkConfig class]];
}

+ (NSValueTransformer *)processingInputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerProcessingInput class]];
}

+ (NSValueTransformer *)processingOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerProcessingOutputConfig class]];
}

+ (NSValueTransformer *)processingResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerProcessingResources class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerProcessingStoppingCondition class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerCreateProcessingJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"processingJobArn" : @"ProcessingJobArn",
             };
}

@end

@implementation AWSSagemakerCreateTrainingJobRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAlgorithmSpecification class]];
}

+ (NSValueTransformer *)checkpointConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerCheckpointConfig class]];
}

+ (NSValueTransformer *)debugHookConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerDebugHookConfig class]];
}

+ (NSValueTransformer *)debugRuleConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerDebugRuleConfiguration class]];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerExperimentConfig class]];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerChannel class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerOutputDataConfig class]];
}

+ (NSValueTransformer *)resourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerResourceConfig class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerStoppingCondition class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

+ (NSValueTransformer *)tensorBoardOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTensorBoardOutputConfig class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerVpcConfig class]];
}

@end

@implementation AWSSagemakerCreateTrainingJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trainingJobArn" : @"TrainingJobArn",
             };
}

@end

@implementation AWSSagemakerCreateTransformJobRequest

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
            return @(AWSSagemakerBatchStrategyMultiRecord);
        }
        if ([value caseInsensitiveCompare:@"SingleRecord"] == NSOrderedSame) {
            return @(AWSSagemakerBatchStrategySingleRecord);
        }
        return @(AWSSagemakerBatchStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerBatchStrategyMultiRecord:
                return @"MultiRecord";
            case AWSSagemakerBatchStrategySingleRecord:
                return @"SingleRecord";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dataProcessingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerDataProcessing class]];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerExperimentConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

+ (NSValueTransformer *)transformInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTransformInput class]];
}

+ (NSValueTransformer *)transformOutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTransformOutput class]];
}

+ (NSValueTransformer *)transformResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTransformResources class]];
}

@end

@implementation AWSSagemakerCreateTransformJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformJobArn" : @"TransformJobArn",
             };
}

@end

@implementation AWSSagemakerCreateTrialComponentRequest

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
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSagemakerTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)outputArtifactsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSagemakerTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSagemakerTrialComponentParameterValue class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrialComponentStatus class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerCreateTrialComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentArn" : @"TrialComponentArn",
             };
}

@end

@implementation AWSSagemakerCreateTrialRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             @"experimentName" : @"ExperimentName",
             @"tags" : @"Tags",
             @"trialName" : @"TrialName",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerCreateTrialResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialArn" : @"TrialArn",
             };
}

@end

@implementation AWSSagemakerCreateUserProfileRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

+ (NSValueTransformer *)userSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserSettings class]];
}

@end

@implementation AWSSagemakerCreateUserProfileResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userProfileArn" : @"UserProfileArn",
             };
}

@end

@implementation AWSSagemakerCreateWorkteamRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerMemberDefinition class]];
}

+ (NSValueTransformer *)notificationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerNotificationConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerCreateWorkteamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workteamArn" : @"WorkteamArn",
             };
}

@end

@implementation AWSSagemakerDataCaptureConfig

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerCaptureContentTypeHeader class]];
}

+ (NSValueTransformer *)captureOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerCaptureOption class]];
}

@end

@implementation AWSSagemakerDataCaptureConfigSummary

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
            return @(AWSSagemakerCaptureStatusStarted);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerCaptureStatusStopped);
        }
        return @(AWSSagemakerCaptureStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerCaptureStatusStarted:
                return @"Started";
            case AWSSagemakerCaptureStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerDataProcessing

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
            return @(AWSSagemakerJoinSourceInput);
        }
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSSagemakerJoinSourceNone);
        }
        return @(AWSSagemakerJoinSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerJoinSourceInput:
                return @"Input";
            case AWSSagemakerJoinSourceNone:
                return @"None";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerDataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystemDataSource" : @"FileSystemDataSource",
             @"s3DataSource" : @"S3DataSource",
             };
}

+ (NSValueTransformer *)fileSystemDataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerFileSystemDataSource class]];
}

+ (NSValueTransformer *)s3DataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerS3DataSource class]];
}

@end

@implementation AWSSagemakerDebugHookConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionConfigurations" : @"CollectionConfigurations",
             @"hookParameters" : @"HookParameters",
             @"localPath" : @"LocalPath",
             @"s3OutputPath" : @"S3OutputPath",
             };
}

+ (NSValueTransformer *)collectionConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerCollectionConfiguration class]];
}

@end

@implementation AWSSagemakerDebugRuleConfiguration

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
            return @(AWSSagemakerProcessingInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.large"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR58xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR516xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.24xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR524xlarge);
        }
        return @(AWSSagemakerProcessingInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerProcessingInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSSagemakerProcessingInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSSagemakerProcessingInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSSagemakerProcessingInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSSagemakerProcessingInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSSagemakerProcessingInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSagemakerProcessingInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSSagemakerProcessingInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR5Large:
                return @"ml.r5.large";
            case AWSSagemakerProcessingInstanceTypeMlR5Xlarge:
                return @"ml.r5.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR52xlarge:
                return @"ml.r5.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR54xlarge:
                return @"ml.r5.4xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR58xlarge:
                return @"ml.r5.8xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR512xlarge:
                return @"ml.r5.12xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR516xlarge:
                return @"ml.r5.16xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR524xlarge:
                return @"ml.r5.24xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerDebugRuleEvaluationStatus

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
            return @(AWSSagemakerRuleEvaluationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"NoIssuesFound"] == NSOrderedSame) {
            return @(AWSSagemakerRuleEvaluationStatusNoIssuesFound);
        }
        if ([value caseInsensitiveCompare:@"IssuesFound"] == NSOrderedSame) {
            return @(AWSSagemakerRuleEvaluationStatusIssuesFound);
        }
        if ([value caseInsensitiveCompare:@"Error"] == NSOrderedSame) {
            return @(AWSSagemakerRuleEvaluationStatusError);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerRuleEvaluationStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerRuleEvaluationStatusStopped);
        }
        return @(AWSSagemakerRuleEvaluationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerRuleEvaluationStatusInProgress:
                return @"InProgress";
            case AWSSagemakerRuleEvaluationStatusNoIssuesFound:
                return @"NoIssuesFound";
            case AWSSagemakerRuleEvaluationStatusIssuesFound:
                return @"IssuesFound";
            case AWSSagemakerRuleEvaluationStatusError:
                return @"Error";
            case AWSSagemakerRuleEvaluationStatusStopping:
                return @"Stopping";
            case AWSSagemakerRuleEvaluationStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerDeleteAlgorithmInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmName" : @"AlgorithmName",
             };
}

@end

@implementation AWSSagemakerDeleteAppRequest

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
            return @(AWSSagemakerAppTypeJupyterServer);
        }
        if ([value caseInsensitiveCompare:@"KernelGateway"] == NSOrderedSame) {
            return @(AWSSagemakerAppTypeKernelGateway);
        }
        if ([value caseInsensitiveCompare:@"TensorBoard"] == NSOrderedSame) {
            return @(AWSSagemakerAppTypeTensorBoard);
        }
        return @(AWSSagemakerAppTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAppTypeJupyterServer:
                return @"JupyterServer";
            case AWSSagemakerAppTypeKernelGateway:
                return @"KernelGateway";
            case AWSSagemakerAppTypeTensorBoard:
                return @"TensorBoard";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerDeleteCodeRepositoryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositoryName" : @"CodeRepositoryName",
             };
}

@end

@implementation AWSSagemakerDeleteDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             @"retentionPolicy" : @"RetentionPolicy",
             };
}

+ (NSValueTransformer *)retentionPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerRetentionPolicy class]];
}

@end

@implementation AWSSagemakerDeleteEndpointConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointConfigName" : @"EndpointConfigName",
             };
}

@end

@implementation AWSSagemakerDeleteEndpointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointName" : @"EndpointName",
             };
}

@end

@implementation AWSSagemakerDeleteExperimentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentName" : @"ExperimentName",
             };
}

@end

@implementation AWSSagemakerDeleteExperimentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentArn" : @"ExperimentArn",
             };
}

@end

@implementation AWSSagemakerDeleteFlowDefinitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flowDefinitionName" : @"FlowDefinitionName",
             };
}

@end

@implementation AWSSagemakerDeleteFlowDefinitionResponse

@end

@implementation AWSSagemakerDeleteModelInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelName" : @"ModelName",
             };
}

@end

@implementation AWSSagemakerDeleteModelPackageInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelPackageName" : @"ModelPackageName",
             };
}

@end

@implementation AWSSagemakerDeleteMonitoringScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             };
}

@end

@implementation AWSSagemakerDeleteNotebookInstanceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceName" : @"NotebookInstanceName",
             };
}

@end

@implementation AWSSagemakerDeleteNotebookInstanceLifecycleConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceLifecycleConfigName" : @"NotebookInstanceLifecycleConfigName",
             };
}

@end

@implementation AWSSagemakerDeleteTagsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSSagemakerDeleteTagsOutput

@end

@implementation AWSSagemakerDeleteTrialComponentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentName" : @"TrialComponentName",
             };
}

@end

@implementation AWSSagemakerDeleteTrialComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentArn" : @"TrialComponentArn",
             };
}

@end

@implementation AWSSagemakerDeleteTrialRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSSagemakerDeleteTrialResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialArn" : @"TrialArn",
             };
}

@end

@implementation AWSSagemakerDeleteUserProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             @"userProfileName" : @"UserProfileName",
             };
}

@end

@implementation AWSSagemakerDeleteWorkteamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workteamName" : @"WorkteamName",
             };
}

@end

@implementation AWSSagemakerDeleteWorkteamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"success" : @"Success",
             };
}

@end

@implementation AWSSagemakerDeployedImage

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

@implementation AWSSagemakerDescribeAlgorithmInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmName" : @"AlgorithmName",
             };
}

@end

@implementation AWSSagemakerDescribeAlgorithmOutput

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
            return @(AWSSagemakerAlgorithmStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerAlgorithmStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerAlgorithmStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerAlgorithmStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSagemakerAlgorithmStatusDeleting);
        }
        return @(AWSSagemakerAlgorithmStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAlgorithmStatusPending:
                return @"Pending";
            case AWSSagemakerAlgorithmStatusInProgress:
                return @"InProgress";
            case AWSSagemakerAlgorithmStatusCompleted:
                return @"Completed";
            case AWSSagemakerAlgorithmStatusFailed:
                return @"Failed";
            case AWSSagemakerAlgorithmStatusDeleting:
                return @"Deleting";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)algorithmStatusDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAlgorithmStatusDetails class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inferenceSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerInferenceSpecification class]];
}

+ (NSValueTransformer *)trainingSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrainingSpecification class]];
}

+ (NSValueTransformer *)validationSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAlgorithmValidationSpecification class]];
}

@end

@implementation AWSSagemakerDescribeAppRequest

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
            return @(AWSSagemakerAppTypeJupyterServer);
        }
        if ([value caseInsensitiveCompare:@"KernelGateway"] == NSOrderedSame) {
            return @(AWSSagemakerAppTypeKernelGateway);
        }
        if ([value caseInsensitiveCompare:@"TensorBoard"] == NSOrderedSame) {
            return @(AWSSagemakerAppTypeTensorBoard);
        }
        return @(AWSSagemakerAppTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAppTypeJupyterServer:
                return @"JupyterServer";
            case AWSSagemakerAppTypeKernelGateway:
                return @"KernelGateway";
            case AWSSagemakerAppTypeTensorBoard:
                return @"TensorBoard";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerDescribeAppResponse

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
            return @(AWSSagemakerAppTypeJupyterServer);
        }
        if ([value caseInsensitiveCompare:@"KernelGateway"] == NSOrderedSame) {
            return @(AWSSagemakerAppTypeKernelGateway);
        }
        if ([value caseInsensitiveCompare:@"TensorBoard"] == NSOrderedSame) {
            return @(AWSSagemakerAppTypeTensorBoard);
        }
        return @(AWSSagemakerAppTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAppTypeJupyterServer:
                return @"JupyterServer";
            case AWSSagemakerAppTypeKernelGateway:
                return @"KernelGateway";
            case AWSSagemakerAppTypeTensorBoard:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerResourceSpec class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Deleted"] == NSOrderedSame) {
            return @(AWSSagemakerAppStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSagemakerAppStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerAppStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSagemakerAppStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSagemakerAppStatusPending);
        }
        return @(AWSSagemakerAppStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAppStatusDeleted:
                return @"Deleted";
            case AWSSagemakerAppStatusDeleting:
                return @"Deleting";
            case AWSSagemakerAppStatusFailed:
                return @"Failed";
            case AWSSagemakerAppStatusInService:
                return @"InService";
            case AWSSagemakerAppStatusPending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerDescribeAutoMLJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLJobName" : @"AutoMLJobName",
             };
}

@end

@implementation AWSSagemakerDescribeAutoMLJobResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAutoMLJobArtifacts class]];
}

+ (NSValueTransformer *)autoMLJobConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAutoMLJobConfig class]];
}

+ (NSValueTransformer *)autoMLJobObjectiveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAutoMLJobObjective class]];
}

+ (NSValueTransformer *)autoMLJobSecondaryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Starting"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobSecondaryStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"AnalyzingData"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobSecondaryStatusAnalyzingData);
        }
        if ([value caseInsensitiveCompare:@"FeatureEngineering"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobSecondaryStatusFeatureEngineering);
        }
        if ([value caseInsensitiveCompare:@"ModelTuning"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobSecondaryStatusModelTuning);
        }
        if ([value caseInsensitiveCompare:@"MaxCandidatesReached"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobSecondaryStatusMaxCandidatesReached);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobSecondaryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobSecondaryStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"MaxAutoMLJobRuntimeReached"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobSecondaryStatusMaxAutoMLJobRuntimeReached);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobSecondaryStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"CandidateDefinitionsGenerated"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobSecondaryStatusCandidateDefinitionsGenerated);
        }
        return @(AWSSagemakerAutoMLJobSecondaryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAutoMLJobSecondaryStatusStarting:
                return @"Starting";
            case AWSSagemakerAutoMLJobSecondaryStatusAnalyzingData:
                return @"AnalyzingData";
            case AWSSagemakerAutoMLJobSecondaryStatusFeatureEngineering:
                return @"FeatureEngineering";
            case AWSSagemakerAutoMLJobSecondaryStatusModelTuning:
                return @"ModelTuning";
            case AWSSagemakerAutoMLJobSecondaryStatusMaxCandidatesReached:
                return @"MaxCandidatesReached";
            case AWSSagemakerAutoMLJobSecondaryStatusFailed:
                return @"Failed";
            case AWSSagemakerAutoMLJobSecondaryStatusStopped:
                return @"Stopped";
            case AWSSagemakerAutoMLJobSecondaryStatusMaxAutoMLJobRuntimeReached:
                return @"MaxAutoMLJobRuntimeReached";
            case AWSSagemakerAutoMLJobSecondaryStatusStopping:
                return @"Stopping";
            case AWSSagemakerAutoMLJobSecondaryStatusCandidateDefinitionsGenerated:
                return @"CandidateDefinitionsGenerated";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)autoMLJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobStatusStopping);
        }
        return @(AWSSagemakerAutoMLJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAutoMLJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerAutoMLJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerAutoMLJobStatusFailed:
                return @"Failed";
            case AWSSagemakerAutoMLJobStatusStopped:
                return @"Stopped";
            case AWSSagemakerAutoMLJobStatusStopping:
                return @"Stopping";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)bestCandidateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAutoMLCandidate class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerAutoMLChannel class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAutoMLOutputDataConfig class]];
}

+ (NSValueTransformer *)problemTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BinaryClassification"] == NSOrderedSame) {
            return @(AWSSagemakerProblemTypeBinaryClassification);
        }
        if ([value caseInsensitiveCompare:@"MulticlassClassification"] == NSOrderedSame) {
            return @(AWSSagemakerProblemTypeMulticlassClassification);
        }
        if ([value caseInsensitiveCompare:@"Regression"] == NSOrderedSame) {
            return @(AWSSagemakerProblemTypeRegression);
        }
        return @(AWSSagemakerProblemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerProblemTypeBinaryClassification:
                return @"BinaryClassification";
            case AWSSagemakerProblemTypeMulticlassClassification:
                return @"MulticlassClassification";
            case AWSSagemakerProblemTypeRegression:
                return @"Regression";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resolvedAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerResolvedAttributes class]];
}

@end

@implementation AWSSagemakerDescribeCodeRepositoryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositoryName" : @"CodeRepositoryName",
             };
}

@end

@implementation AWSSagemakerDescribeCodeRepositoryOutput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerGitConfig class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSagemakerDescribeCompilationJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compilationJobName" : @"CompilationJobName",
             };
}

@end

@implementation AWSSagemakerDescribeCompilationJobResponse

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
            return @(AWSSagemakerCompilationJobStatusInprogress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSSagemakerCompilationJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSagemakerCompilationJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSSagemakerCompilationJobStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSSagemakerCompilationJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSSagemakerCompilationJobStatusStopped);
        }
        return @(AWSSagemakerCompilationJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerCompilationJobStatusInprogress:
                return @"INPROGRESS";
            case AWSSagemakerCompilationJobStatusCompleted:
                return @"COMPLETED";
            case AWSSagemakerCompilationJobStatusFailed:
                return @"FAILED";
            case AWSSagemakerCompilationJobStatusStarting:
                return @"STARTING";
            case AWSSagemakerCompilationJobStatusStopping:
                return @"STOPPING";
            case AWSSagemakerCompilationJobStatusStopped:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerInputConfig class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)modelArtifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerModelArtifacts class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerOutputConfig class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerStoppingCondition class]];
}

@end

@implementation AWSSagemakerDescribeDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             };
}

@end

@implementation AWSSagemakerDescribeDomainResponse

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
            return @(AWSSagemakerAuthModeSso);
        }
        if ([value caseInsensitiveCompare:@"IAM"] == NSOrderedSame) {
            return @(AWSSagemakerAuthModeIam);
        }
        return @(AWSSagemakerAuthModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAuthModeSso:
                return @"SSO";
            case AWSSagemakerAuthModeIam:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserSettings class]];
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
            return @(AWSSagemakerDomainStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerDomainStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSagemakerDomainStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSagemakerDomainStatusPending);
        }
        return @(AWSSagemakerDomainStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerDomainStatusDeleting:
                return @"Deleting";
            case AWSSagemakerDomainStatusFailed:
                return @"Failed";
            case AWSSagemakerDomainStatusInService:
                return @"InService";
            case AWSSagemakerDomainStatusPending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerDescribeEndpointConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointConfigName" : @"EndpointConfigName",
             };
}

@end

@implementation AWSSagemakerDescribeEndpointConfigOutput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerDataCaptureConfig class]];
}

+ (NSValueTransformer *)productionVariantsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerProductionVariant class]];
}

@end

@implementation AWSSagemakerDescribeEndpointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointName" : @"EndpointName",
             };
}

@end

@implementation AWSSagemakerDescribeEndpointOutput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerDataCaptureConfigSummary class]];
}

+ (NSValueTransformer *)endpointStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OutOfService"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusOutOfService);
        }
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"SystemUpdating"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusSystemUpdating);
        }
        if ([value caseInsensitiveCompare:@"RollingBack"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusRollingBack);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusFailed);
        }
        return @(AWSSagemakerEndpointStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerEndpointStatusOutOfService:
                return @"OutOfService";
            case AWSSagemakerEndpointStatusCreating:
                return @"Creating";
            case AWSSagemakerEndpointStatusUpdating:
                return @"Updating";
            case AWSSagemakerEndpointStatusSystemUpdating:
                return @"SystemUpdating";
            case AWSSagemakerEndpointStatusRollingBack:
                return @"RollingBack";
            case AWSSagemakerEndpointStatusInService:
                return @"InService";
            case AWSSagemakerEndpointStatusDeleting:
                return @"Deleting";
            case AWSSagemakerEndpointStatusFailed:
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerProductionVariantSummary class]];
}

@end

@implementation AWSSagemakerDescribeExperimentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentName" : @"ExperimentName",
             };
}

@end

@implementation AWSSagemakerDescribeExperimentResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserContext class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserContext class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerExperimentSource class]];
}

@end

@implementation AWSSagemakerDescribeFlowDefinitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flowDefinitionName" : @"FlowDefinitionName",
             };
}

@end

@implementation AWSSagemakerDescribeFlowDefinitionResponse

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
            return @(AWSSagemakerFlowDefinitionStatusInitializing);
        }
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSSagemakerFlowDefinitionStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerFlowDefinitionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSagemakerFlowDefinitionStatusDeleting);
        }
        return @(AWSSagemakerFlowDefinitionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerFlowDefinitionStatusInitializing:
                return @"Initializing";
            case AWSSagemakerFlowDefinitionStatusActive:
                return @"Active";
            case AWSSagemakerFlowDefinitionStatusFailed:
                return @"Failed";
            case AWSSagemakerFlowDefinitionStatusDeleting:
                return @"Deleting";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)humanLoopActivationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerHumanLoopActivationConfig class]];
}

+ (NSValueTransformer *)humanLoopConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerHumanLoopConfig class]];
}

+ (NSValueTransformer *)humanLoopRequestSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerHumanLoopRequestSource class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerFlowDefinitionOutputConfig class]];
}

@end

@implementation AWSSagemakerDescribeHumanTaskUiRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanTaskUiName" : @"HumanTaskUiName",
             };
}

@end

@implementation AWSSagemakerDescribeHumanTaskUiResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUiTemplateInfo class]];
}

@end

@implementation AWSSagemakerDescribeHyperParameterTuningJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hyperParameterTuningJobName" : @"HyperParameterTuningJobName",
             };
}

@end

@implementation AWSSagemakerDescribeHyperParameterTuningJobResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerHyperParameterTrainingJobSummary class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerHyperParameterTuningJobConfig class]];
}

+ (NSValueTransformer *)hyperParameterTuningJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobStatusStopping);
        }
        return @(AWSSagemakerHyperParameterTuningJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerHyperParameterTuningJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerHyperParameterTuningJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerHyperParameterTuningJobStatusFailed:
                return @"Failed";
            case AWSSagemakerHyperParameterTuningJobStatusStopped:
                return @"Stopped";
            case AWSSagemakerHyperParameterTuningJobStatusStopping:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerObjectiveStatusCounters class]];
}

+ (NSValueTransformer *)overallBestTrainingJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerHyperParameterTrainingJobSummary class]];
}

+ (NSValueTransformer *)trainingJobDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerHyperParameterTrainingJobDefinition class]];
}

+ (NSValueTransformer *)trainingJobDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerHyperParameterTrainingJobDefinition class]];
}

+ (NSValueTransformer *)trainingJobStatusCountersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrainingJobStatusCounters class]];
}

+ (NSValueTransformer *)warmStartConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerHyperParameterTuningJobWarmStartConfig class]];
}

@end

@implementation AWSSagemakerDescribeLabelingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelingJobName" : @"LabelingJobName",
             };
}

@end

@implementation AWSSagemakerDescribeLabelingJobResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerHumanTaskConfig class]];
}

+ (NSValueTransformer *)inputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerLabelingJobInputConfig class]];
}

+ (NSValueTransformer *)labelCountersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerLabelCounters class]];
}

+ (NSValueTransformer *)labelingJobAlgorithmsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerLabelingJobAlgorithmsConfig class]];
}

+ (NSValueTransformer *)labelingJobOutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerLabelingJobOutput class]];
}

+ (NSValueTransformer *)labelingJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerLabelingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerLabelingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerLabelingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerLabelingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerLabelingJobStatusStopped);
        }
        return @(AWSSagemakerLabelingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerLabelingJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerLabelingJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerLabelingJobStatusFailed:
                return @"Failed";
            case AWSSagemakerLabelingJobStatusStopping:
                return @"Stopping";
            case AWSSagemakerLabelingJobStatusStopped:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerLabelingJobOutputConfig class]];
}

+ (NSValueTransformer *)stoppingConditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerLabelingJobStoppingConditions class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerDescribeModelInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelName" : @"ModelName",
             };
}

@end

@implementation AWSSagemakerDescribeModelOutput

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerContainerDefinition class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)primaryContainerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerContainerDefinition class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerVpcConfig class]];
}

@end

@implementation AWSSagemakerDescribeModelPackageInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelPackageName" : @"ModelPackageName",
             };
}

@end

@implementation AWSSagemakerDescribeModelPackageOutput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerInferenceSpecification class]];
}

+ (NSValueTransformer *)modelPackageStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSagemakerModelPackageStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerModelPackageStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerModelPackageStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerModelPackageStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSagemakerModelPackageStatusDeleting);
        }
        return @(AWSSagemakerModelPackageStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerModelPackageStatusPending:
                return @"Pending";
            case AWSSagemakerModelPackageStatusInProgress:
                return @"InProgress";
            case AWSSagemakerModelPackageStatusCompleted:
                return @"Completed";
            case AWSSagemakerModelPackageStatusFailed:
                return @"Failed";
            case AWSSagemakerModelPackageStatusDeleting:
                return @"Deleting";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modelPackageStatusDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerModelPackageStatusDetails class]];
}

+ (NSValueTransformer *)sourceAlgorithmSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerSourceAlgorithmSpecification class]];
}

+ (NSValueTransformer *)validationSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerModelPackageValidationSpecification class]];
}

@end

@implementation AWSSagemakerDescribeMonitoringScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             };
}

@end

@implementation AWSSagemakerDescribeMonitoringScheduleResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerMonitoringExecutionSummary class]];
}

+ (NSValueTransformer *)monitoringScheduleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerMonitoringScheduleConfig class]];
}

+ (NSValueTransformer *)monitoringScheduleStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSagemakerScheduleStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerScheduleStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Scheduled"] == NSOrderedSame) {
            return @(AWSSagemakerScheduleStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerScheduleStatusStopped);
        }
        return @(AWSSagemakerScheduleStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerScheduleStatusPending:
                return @"Pending";
            case AWSSagemakerScheduleStatusFailed:
                return @"Failed";
            case AWSSagemakerScheduleStatusScheduled:
                return @"Scheduled";
            case AWSSagemakerScheduleStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerDescribeNotebookInstanceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceName" : @"NotebookInstanceName",
             };
}

@end

@implementation AWSSagemakerDescribeNotebookInstanceLifecycleConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceLifecycleConfigName" : @"NotebookInstanceLifecycleConfigName",
             };
}

@end

@implementation AWSSagemakerDescribeNotebookInstanceLifecycleConfigOutput

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerNotebookInstanceLifecycleHook class]];
}

+ (NSValueTransformer *)onStartJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerNotebookInstanceLifecycleHook class]];
}

@end

@implementation AWSSagemakerDescribeNotebookInstanceOutput

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
            return @(AWSSagemakerDirectInternetAccessEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSSagemakerDirectInternetAccessDisabled);
        }
        return @(AWSSagemakerDirectInternetAccessUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerDirectInternetAccessEnabled:
                return @"Enabled";
            case AWSSagemakerDirectInternetAccessDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ml.t2.medium"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT2Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.large"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT2Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT22xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.medium"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.9xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5d9xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.18xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5d18xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP316xlarge);
        }
        return @(AWSSagemakerInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerInstanceTypeMlT2Medium:
                return @"ml.t2.medium";
            case AWSSagemakerInstanceTypeMlT2Large:
                return @"ml.t2.large";
            case AWSSagemakerInstanceTypeMlT2Xlarge:
                return @"ml.t2.xlarge";
            case AWSSagemakerInstanceTypeMlT22xlarge:
                return @"ml.t2.2xlarge";
            case AWSSagemakerInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSSagemakerInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSSagemakerInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSSagemakerInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSSagemakerInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSSagemakerInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSSagemakerInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSSagemakerInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSSagemakerInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSSagemakerInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSagemakerInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSagemakerInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSagemakerInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSagemakerInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSSagemakerInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSSagemakerInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSSagemakerInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSSagemakerInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSSagemakerInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSagemakerInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSagemakerInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSagemakerInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSagemakerInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSagemakerInstanceTypeMlC5dXlarge:
                return @"ml.c5d.xlarge";
            case AWSSagemakerInstanceTypeMlC5d2xlarge:
                return @"ml.c5d.2xlarge";
            case AWSSagemakerInstanceTypeMlC5d4xlarge:
                return @"ml.c5d.4xlarge";
            case AWSSagemakerInstanceTypeMlC5d9xlarge:
                return @"ml.c5d.9xlarge";
            case AWSSagemakerInstanceTypeMlC5d18xlarge:
                return @"ml.c5d.18xlarge";
            case AWSSagemakerInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSSagemakerInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSSagemakerInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSSagemakerInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSagemakerInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSagemakerInstanceTypeMlP316xlarge:
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
            return @(AWSSagemakerNotebookInstanceStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceStatusUpdating);
        }
        return @(AWSSagemakerNotebookInstanceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerNotebookInstanceStatusPending:
                return @"Pending";
            case AWSSagemakerNotebookInstanceStatusInService:
                return @"InService";
            case AWSSagemakerNotebookInstanceStatusStopping:
                return @"Stopping";
            case AWSSagemakerNotebookInstanceStatusStopped:
                return @"Stopped";
            case AWSSagemakerNotebookInstanceStatusFailed:
                return @"Failed";
            case AWSSagemakerNotebookInstanceStatusDeleting:
                return @"Deleting";
            case AWSSagemakerNotebookInstanceStatusUpdating:
                return @"Updating";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rootAccessJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSSagemakerRootAccessEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSSagemakerRootAccessDisabled);
        }
        return @(AWSSagemakerRootAccessUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerRootAccessEnabled:
                return @"Enabled";
            case AWSSagemakerRootAccessDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerDescribeProcessingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"processingJobName" : @"ProcessingJobName",
             };
}

@end

@implementation AWSSagemakerDescribeProcessingJobResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAppSpecification class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerExperimentConfig class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)networkConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerNetworkConfig class]];
}

+ (NSValueTransformer *)processingEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)processingInputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerProcessingInput class]];
}

+ (NSValueTransformer *)processingJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingJobStatusStopped);
        }
        return @(AWSSagemakerProcessingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerProcessingJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerProcessingJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerProcessingJobStatusFailed:
                return @"Failed";
            case AWSSagemakerProcessingJobStatusStopping:
                return @"Stopping";
            case AWSSagemakerProcessingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)processingOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerProcessingOutputConfig class]];
}

+ (NSValueTransformer *)processingResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerProcessingResources class]];
}

+ (NSValueTransformer *)processingStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerProcessingStoppingCondition class]];
}

@end

@implementation AWSSagemakerDescribeSubscribedWorkteamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workteamArn" : @"WorkteamArn",
             };
}

@end

@implementation AWSSagemakerDescribeSubscribedWorkteamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subscribedWorkteam" : @"SubscribedWorkteam",
             };
}

+ (NSValueTransformer *)subscribedWorkteamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerSubscribedWorkteam class]];
}

@end

@implementation AWSSagemakerDescribeTrainingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trainingJobName" : @"TrainingJobName",
             };
}

@end

@implementation AWSSagemakerDescribeTrainingJobResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAlgorithmSpecification class]];
}

+ (NSValueTransformer *)checkpointConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerCheckpointConfig class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)debugHookConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerDebugHookConfig class]];
}

+ (NSValueTransformer *)debugRuleConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerDebugRuleConfiguration class]];
}

+ (NSValueTransformer *)debugRuleEvaluationStatusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerDebugRuleEvaluationStatus class]];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerExperimentConfig class]];
}

+ (NSValueTransformer *)finalMetricDataListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerMetricData class]];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerChannel class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)modelArtifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerModelArtifacts class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerOutputDataConfig class]];
}

+ (NSValueTransformer *)resourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerResourceConfig class]];
}

+ (NSValueTransformer *)secondaryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Starting"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"LaunchingMLInstances"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusLaunchingMLInstances);
        }
        if ([value caseInsensitiveCompare:@"PreparingTrainingStack"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusPreparingTrainingStack);
        }
        if ([value caseInsensitiveCompare:@"Downloading"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusDownloading);
        }
        if ([value caseInsensitiveCompare:@"DownloadingTrainingImage"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusDownloadingTrainingImage);
        }
        if ([value caseInsensitiveCompare:@"Training"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusTraining);
        }
        if ([value caseInsensitiveCompare:@"Uploading"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusUploading);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"MaxRuntimeExceeded"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusMaxRuntimeExceeded);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Interrupted"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusInterrupted);
        }
        if ([value caseInsensitiveCompare:@"MaxWaitTimeExceeded"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusMaxWaitTimeExceeded);
        }
        return @(AWSSagemakerSecondaryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSecondaryStatusStarting:
                return @"Starting";
            case AWSSagemakerSecondaryStatusLaunchingMLInstances:
                return @"LaunchingMLInstances";
            case AWSSagemakerSecondaryStatusPreparingTrainingStack:
                return @"PreparingTrainingStack";
            case AWSSagemakerSecondaryStatusDownloading:
                return @"Downloading";
            case AWSSagemakerSecondaryStatusDownloadingTrainingImage:
                return @"DownloadingTrainingImage";
            case AWSSagemakerSecondaryStatusTraining:
                return @"Training";
            case AWSSagemakerSecondaryStatusUploading:
                return @"Uploading";
            case AWSSagemakerSecondaryStatusStopping:
                return @"Stopping";
            case AWSSagemakerSecondaryStatusStopped:
                return @"Stopped";
            case AWSSagemakerSecondaryStatusMaxRuntimeExceeded:
                return @"MaxRuntimeExceeded";
            case AWSSagemakerSecondaryStatusCompleted:
                return @"Completed";
            case AWSSagemakerSecondaryStatusFailed:
                return @"Failed";
            case AWSSagemakerSecondaryStatusInterrupted:
                return @"Interrupted";
            case AWSSagemakerSecondaryStatusMaxWaitTimeExceeded:
                return @"MaxWaitTimeExceeded";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)secondaryStatusTransitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerSecondaryStatusTransition class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerStoppingCondition class]];
}

+ (NSValueTransformer *)tensorBoardOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTensorBoardOutputConfig class]];
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
            return @(AWSSagemakerTrainingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusStopped);
        }
        return @(AWSSagemakerTrainingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerTrainingJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerTrainingJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerTrainingJobStatusFailed:
                return @"Failed";
            case AWSSagemakerTrainingJobStatusStopping:
                return @"Stopping";
            case AWSSagemakerTrainingJobStatusStopped:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerVpcConfig class]];
}

@end

@implementation AWSSagemakerDescribeTransformJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformJobName" : @"TransformJobName",
             };
}

@end

@implementation AWSSagemakerDescribeTransformJobResponse

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
            return @(AWSSagemakerBatchStrategyMultiRecord);
        }
        if ([value caseInsensitiveCompare:@"SingleRecord"] == NSOrderedSame) {
            return @(AWSSagemakerBatchStrategySingleRecord);
        }
        return @(AWSSagemakerBatchStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerBatchStrategyMultiRecord:
                return @"MultiRecord";
            case AWSSagemakerBatchStrategySingleRecord:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerDataProcessing class]];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerExperimentConfig class]];
}

+ (NSValueTransformer *)transformEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)transformInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTransformInput class]];
}

+ (NSValueTransformer *)transformJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerTransformJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerTransformJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerTransformJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerTransformJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerTransformJobStatusStopped);
        }
        return @(AWSSagemakerTransformJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerTransformJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerTransformJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerTransformJobStatusFailed:
                return @"Failed";
            case AWSSagemakerTransformJobStatusStopping:
                return @"Stopping";
            case AWSSagemakerTransformJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transformOutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTransformOutput class]];
}

+ (NSValueTransformer *)transformResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTransformResources class]];
}

+ (NSValueTransformer *)transformStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSagemakerDescribeTrialComponentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentName" : @"TrialComponentName",
             };
}

@end

@implementation AWSSagemakerDescribeTrialComponentResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserContext class]];
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
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSagemakerTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)lastModifiedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserContext class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)metricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTrialComponentMetricSummary class]];
}

+ (NSValueTransformer *)outputArtifactsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSagemakerTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSagemakerTrialComponentParameterValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrialComponentSource class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrialComponentStatus class]];
}

@end

@implementation AWSSagemakerDescribeTrialRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSSagemakerDescribeTrialResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserContext class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserContext class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrialSource class]];
}

@end

@implementation AWSSagemakerDescribeUserProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             @"userProfileName" : @"UserProfileName",
             };
}

@end

@implementation AWSSagemakerDescribeUserProfileResponse

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
            return @(AWSSagemakerUserProfileStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerUserProfileStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSagemakerUserProfileStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSagemakerUserProfileStatusPending);
        }
        return @(AWSSagemakerUserProfileStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerUserProfileStatusDeleting:
                return @"Deleting";
            case AWSSagemakerUserProfileStatusFailed:
                return @"Failed";
            case AWSSagemakerUserProfileStatusInService:
                return @"InService";
            case AWSSagemakerUserProfileStatusPending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)userSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserSettings class]];
}

@end

@implementation AWSSagemakerDescribeWorkforceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workforceName" : @"WorkforceName",
             };
}

@end

@implementation AWSSagemakerDescribeWorkforceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workforce" : @"Workforce",
             };
}

+ (NSValueTransformer *)workforceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerWorkforce class]];
}

@end

@implementation AWSSagemakerDescribeWorkteamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workteamName" : @"WorkteamName",
             };
}

@end

@implementation AWSSagemakerDescribeWorkteamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workteam" : @"Workteam",
             };
}

+ (NSValueTransformer *)workteamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerWorkteam class]];
}

@end

@implementation AWSSagemakerDesiredWeightAndCapacity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"desiredInstanceCount" : @"DesiredInstanceCount",
             @"desiredWeight" : @"DesiredWeight",
             @"variantName" : @"VariantName",
             };
}

@end

@implementation AWSSagemakerDisassociateTrialComponentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentName" : @"TrialComponentName",
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSSagemakerDisassociateTrialComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialArn" : @"TrialArn",
             @"trialComponentArn" : @"TrialComponentArn",
             };
}

@end

@implementation AWSSagemakerDomainDetails

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
            return @(AWSSagemakerDomainStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerDomainStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSagemakerDomainStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSagemakerDomainStatusPending);
        }
        return @(AWSSagemakerDomainStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerDomainStatusDeleting:
                return @"Deleting";
            case AWSSagemakerDomainStatusFailed:
                return @"Failed";
            case AWSSagemakerDomainStatusInService:
                return @"InService";
            case AWSSagemakerDomainStatusPending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerEndpointConfigSummary

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

@implementation AWSSagemakerEndpointInput

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
            return @(AWSSagemakerProcessingS3DataDistributionTypeFullyReplicated);
        }
        if ([value caseInsensitiveCompare:@"ShardedByS3Key"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingS3DataDistributionTypeShardedByS3Key);
        }
        return @(AWSSagemakerProcessingS3DataDistributionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerProcessingS3DataDistributionTypeFullyReplicated:
                return @"FullyReplicated";
            case AWSSagemakerProcessingS3DataDistributionTypeShardedByS3Key:
                return @"ShardedByS3Key";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3InputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pipe"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingS3InputModePipe);
        }
        if ([value caseInsensitiveCompare:@"File"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingS3InputModeFile);
        }
        return @(AWSSagemakerProcessingS3InputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerProcessingS3InputModePipe:
                return @"Pipe";
            case AWSSagemakerProcessingS3InputModeFile:
                return @"File";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerEndpointSummary

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
            return @(AWSSagemakerEndpointStatusOutOfService);
        }
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"SystemUpdating"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusSystemUpdating);
        }
        if ([value caseInsensitiveCompare:@"RollingBack"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusRollingBack);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusFailed);
        }
        return @(AWSSagemakerEndpointStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerEndpointStatusOutOfService:
                return @"OutOfService";
            case AWSSagemakerEndpointStatusCreating:
                return @"Creating";
            case AWSSagemakerEndpointStatusUpdating:
                return @"Updating";
            case AWSSagemakerEndpointStatusSystemUpdating:
                return @"SystemUpdating";
            case AWSSagemakerEndpointStatusRollingBack:
                return @"RollingBack";
            case AWSSagemakerEndpointStatusInService:
                return @"InService";
            case AWSSagemakerEndpointStatusDeleting:
                return @"Deleting";
            case AWSSagemakerEndpointStatusFailed:
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

@implementation AWSSagemakerExperiment

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserContext class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserContext class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerExperimentSource class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerExperimentConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentName" : @"ExperimentName",
             @"trialComponentDisplayName" : @"TrialComponentDisplayName",
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSSagemakerExperimentSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceArn" : @"SourceArn",
             @"sourceType" : @"SourceType",
             };
}

@end

@implementation AWSSagemakerExperimentSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerExperimentSource class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSagemakerFileSystemDataSource

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
            return @(AWSSagemakerFileSystemAccessModeRw);
        }
        if ([value caseInsensitiveCompare:@"ro"] == NSOrderedSame) {
            return @(AWSSagemakerFileSystemAccessModeRo);
        }
        return @(AWSSagemakerFileSystemAccessModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerFileSystemAccessModeRw:
                return @"rw";
            case AWSSagemakerFileSystemAccessModeRo:
                return @"ro";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)fileSystemTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EFS"] == NSOrderedSame) {
            return @(AWSSagemakerFileSystemTypeEfs);
        }
        if ([value caseInsensitiveCompare:@"FSxLustre"] == NSOrderedSame) {
            return @(AWSSagemakerFileSystemTypeFSxLustre);
        }
        return @(AWSSagemakerFileSystemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerFileSystemTypeEfs:
                return @"EFS";
            case AWSSagemakerFileSystemTypeFSxLustre:
                return @"FSxLustre";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerFilter

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
            return @(AWSSagemakerOperatorEquals);
        }
        if ([value caseInsensitiveCompare:@"NotEquals"] == NSOrderedSame) {
            return @(AWSSagemakerOperatorNotEquals);
        }
        if ([value caseInsensitiveCompare:@"GreaterThan"] == NSOrderedSame) {
            return @(AWSSagemakerOperatorGreaterThan);
        }
        if ([value caseInsensitiveCompare:@"GreaterThanOrEqualTo"] == NSOrderedSame) {
            return @(AWSSagemakerOperatorGreaterThanOrEqualTo);
        }
        if ([value caseInsensitiveCompare:@"LessThan"] == NSOrderedSame) {
            return @(AWSSagemakerOperatorLessThan);
        }
        if ([value caseInsensitiveCompare:@"LessThanOrEqualTo"] == NSOrderedSame) {
            return @(AWSSagemakerOperatorLessThanOrEqualTo);
        }
        if ([value caseInsensitiveCompare:@"Contains"] == NSOrderedSame) {
            return @(AWSSagemakerOperatorContains);
        }
        if ([value caseInsensitiveCompare:@"Exists"] == NSOrderedSame) {
            return @(AWSSagemakerOperatorExists);
        }
        if ([value caseInsensitiveCompare:@"NotExists"] == NSOrderedSame) {
            return @(AWSSagemakerOperatorNotExists);
        }
        if ([value caseInsensitiveCompare:@"In"] == NSOrderedSame) {
            return @(AWSSagemakerOperatorIn);
        }
        return @(AWSSagemakerOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerOperatorEquals:
                return @"Equals";
            case AWSSagemakerOperatorNotEquals:
                return @"NotEquals";
            case AWSSagemakerOperatorGreaterThan:
                return @"GreaterThan";
            case AWSSagemakerOperatorGreaterThanOrEqualTo:
                return @"GreaterThanOrEqualTo";
            case AWSSagemakerOperatorLessThan:
                return @"LessThan";
            case AWSSagemakerOperatorLessThanOrEqualTo:
                return @"LessThanOrEqualTo";
            case AWSSagemakerOperatorContains:
                return @"Contains";
            case AWSSagemakerOperatorExists:
                return @"Exists";
            case AWSSagemakerOperatorNotExists:
                return @"NotExists";
            case AWSSagemakerOperatorIn:
                return @"In";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerFinalAutoMLJobObjectiveMetric

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
            return @(AWSSagemakerAutoMLMetricEnumAccuracy);
        }
        if ([value caseInsensitiveCompare:@"MSE"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLMetricEnumMse);
        }
        if ([value caseInsensitiveCompare:@"F1"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLMetricEnumF1);
        }
        if ([value caseInsensitiveCompare:@"F1macro"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLMetricEnumF1macro);
        }
        return @(AWSSagemakerAutoMLMetricEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAutoMLMetricEnumAccuracy:
                return @"Accuracy";
            case AWSSagemakerAutoMLMetricEnumMse:
                return @"MSE";
            case AWSSagemakerAutoMLMetricEnumF1:
                return @"F1";
            case AWSSagemakerAutoMLMetricEnumF1macro:
                return @"F1macro";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Maximize"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobObjectiveTypeMaximize);
        }
        if ([value caseInsensitiveCompare:@"Minimize"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobObjectiveTypeMinimize);
        }
        return @(AWSSagemakerAutoMLJobObjectiveTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAutoMLJobObjectiveTypeMaximize:
                return @"Maximize";
            case AWSSagemakerAutoMLJobObjectiveTypeMinimize:
                return @"Minimize";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerFinalHyperParameterTuningJobObjectiveMetric

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
            return @(AWSSagemakerHyperParameterTuningJobObjectiveTypeMaximize);
        }
        if ([value caseInsensitiveCompare:@"Minimize"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobObjectiveTypeMinimize);
        }
        return @(AWSSagemakerHyperParameterTuningJobObjectiveTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerHyperParameterTuningJobObjectiveTypeMaximize:
                return @"Maximize";
            case AWSSagemakerHyperParameterTuningJobObjectiveTypeMinimize:
                return @"Minimize";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerFlowDefinitionOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"s3OutputPath" : @"S3OutputPath",
             };
}

@end

@implementation AWSSagemakerFlowDefinitionSummary

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
            return @(AWSSagemakerFlowDefinitionStatusInitializing);
        }
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSSagemakerFlowDefinitionStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerFlowDefinitionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSagemakerFlowDefinitionStatusDeleting);
        }
        return @(AWSSagemakerFlowDefinitionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerFlowDefinitionStatusInitializing:
                return @"Initializing";
            case AWSSagemakerFlowDefinitionStatusActive:
                return @"Active";
            case AWSSagemakerFlowDefinitionStatusFailed:
                return @"Failed";
            case AWSSagemakerFlowDefinitionStatusDeleting:
                return @"Deleting";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerGetSearchSuggestionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resource" : @"Resource",
             @"suggestionQuery" : @"SuggestionQuery",
             };
}

+ (NSValueTransformer *)resourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TrainingJob"] == NSOrderedSame) {
            return @(AWSSagemakerResourceTypeTrainingJob);
        }
        if ([value caseInsensitiveCompare:@"Experiment"] == NSOrderedSame) {
            return @(AWSSagemakerResourceTypeExperiment);
        }
        if ([value caseInsensitiveCompare:@"ExperimentTrial"] == NSOrderedSame) {
            return @(AWSSagemakerResourceTypeExperimentTrial);
        }
        if ([value caseInsensitiveCompare:@"ExperimentTrialComponent"] == NSOrderedSame) {
            return @(AWSSagemakerResourceTypeExperimentTrialComponent);
        }
        return @(AWSSagemakerResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerResourceTypeTrainingJob:
                return @"TrainingJob";
            case AWSSagemakerResourceTypeExperiment:
                return @"Experiment";
            case AWSSagemakerResourceTypeExperimentTrial:
                return @"ExperimentTrial";
            case AWSSagemakerResourceTypeExperimentTrialComponent:
                return @"ExperimentTrialComponent";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)suggestionQueryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerSuggestionQuery class]];
}

@end

@implementation AWSSagemakerGetSearchSuggestionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"propertyNameSuggestions" : @"PropertyNameSuggestions",
             };
}

+ (NSValueTransformer *)propertyNameSuggestionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerPropertyNameSuggestion class]];
}

@end

@implementation AWSSagemakerGitConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branch" : @"Branch",
             @"repositoryUrl" : @"RepositoryUrl",
             @"secretArn" : @"SecretArn",
             };
}

@end

@implementation AWSSagemakerGitConfigForUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"secretArn" : @"SecretArn",
             };
}

@end

@implementation AWSSagemakerHumanLoopActivationConditionsConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanLoopActivationConditions" : @"HumanLoopActivationConditions",
             };
}

@end

@implementation AWSSagemakerHumanLoopActivationConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanLoopActivationConditionsConfig" : @"HumanLoopActivationConditionsConfig",
             };
}

+ (NSValueTransformer *)humanLoopActivationConditionsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerHumanLoopActivationConditionsConfig class]];
}

@end

@implementation AWSSagemakerHumanLoopConfig

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerPublicWorkforceTaskPrice class]];
}

@end

@implementation AWSSagemakerHumanLoopRequestSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsManagedHumanLoopRequestSource" : @"AwsManagedHumanLoopRequestSource",
             };
}

+ (NSValueTransformer *)awsManagedHumanLoopRequestSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS/Rekognition/DetectModerationLabels/Image/V3"] == NSOrderedSame) {
            return @(AWSSagemakerAwsManagedHumanLoopRequestSourceAWSRekognitionDetectModerationLabelsImageV3);
        }
        if ([value caseInsensitiveCompare:@"AWS/Textract/AnalyzeDocument/Forms/V1"] == NSOrderedSame) {
            return @(AWSSagemakerAwsManagedHumanLoopRequestSourceAWSTextractAnalyzeDocumentFormsV1);
        }
        return @(AWSSagemakerAwsManagedHumanLoopRequestSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAwsManagedHumanLoopRequestSourceAWSRekognitionDetectModerationLabelsImageV3:
                return @"AWS/Rekognition/DetectModerationLabels/Image/V3";
            case AWSSagemakerAwsManagedHumanLoopRequestSourceAWSTextractAnalyzeDocumentFormsV1:
                return @"AWS/Textract/AnalyzeDocument/Forms/V1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerHumanTaskConfig

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAnnotationConsolidationConfig class]];
}

+ (NSValueTransformer *)publicWorkforceTaskPriceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerPublicWorkforceTaskPrice class]];
}

+ (NSValueTransformer *)uiConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUiConfig class]];
}

@end

@implementation AWSSagemakerHumanTaskUiSummary

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

@implementation AWSSagemakerHyperParameterAlgorithmSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmName" : @"AlgorithmName",
             @"metricDefinitions" : @"MetricDefinitions",
             @"trainingImage" : @"TrainingImage",
             @"trainingInputMode" : @"TrainingInputMode",
             };
}

+ (NSValueTransformer *)metricDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerMetricDefinition class]];
}

+ (NSValueTransformer *)trainingInputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pipe"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInputModePipe);
        }
        if ([value caseInsensitiveCompare:@"File"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInputModeFile);
        }
        return @(AWSSagemakerTrainingInputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerTrainingInputModePipe:
                return @"Pipe";
            case AWSSagemakerTrainingInputModeFile:
                return @"File";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerHyperParameterSpecification

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerParameterRange class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Integer"] == NSOrderedSame) {
            return @(AWSSagemakerParameterTypeInteger);
        }
        if ([value caseInsensitiveCompare:@"Continuous"] == NSOrderedSame) {
            return @(AWSSagemakerParameterTypeContinuous);
        }
        if ([value caseInsensitiveCompare:@"Categorical"] == NSOrderedSame) {
            return @(AWSSagemakerParameterTypeCategorical);
        }
        if ([value caseInsensitiveCompare:@"FreeText"] == NSOrderedSame) {
            return @(AWSSagemakerParameterTypeFreeText);
        }
        return @(AWSSagemakerParameterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerParameterTypeInteger:
                return @"Integer";
            case AWSSagemakerParameterTypeContinuous:
                return @"Continuous";
            case AWSSagemakerParameterTypeCategorical:
                return @"Categorical";
            case AWSSagemakerParameterTypeFreeText:
                return @"FreeText";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerHyperParameterTrainingJobDefinition

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerHyperParameterAlgorithmSpecification class]];
}

+ (NSValueTransformer *)checkpointConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerCheckpointConfig class]];
}

+ (NSValueTransformer *)hyperParameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerParameterRanges class]];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerChannel class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerOutputDataConfig class]];
}

+ (NSValueTransformer *)resourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerResourceConfig class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerStoppingCondition class]];
}

+ (NSValueTransformer *)tuningObjectiveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerHyperParameterTuningJobObjective class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerVpcConfig class]];
}

@end

@implementation AWSSagemakerHyperParameterTrainingJobSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerFinalHyperParameterTuningJobObjectiveMetric class]];
}

+ (NSValueTransformer *)objectiveStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Succeeded"] == NSOrderedSame) {
            return @(AWSSagemakerObjectiveStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSagemakerObjectiveStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerObjectiveStatusFailed);
        }
        return @(AWSSagemakerObjectiveStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerObjectiveStatusSucceeded:
                return @"Succeeded";
            case AWSSagemakerObjectiveStatusPending:
                return @"Pending";
            case AWSSagemakerObjectiveStatusFailed:
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
            return @(AWSSagemakerTrainingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusStopped);
        }
        return @(AWSSagemakerTrainingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerTrainingJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerTrainingJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerTrainingJobStatusFailed:
                return @"Failed";
            case AWSSagemakerTrainingJobStatusStopping:
                return @"Stopping";
            case AWSSagemakerTrainingJobStatusStopped:
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

@implementation AWSSagemakerHyperParameterTuningJobConfig

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerHyperParameterTuningJobObjective class]];
}

+ (NSValueTransformer *)parameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerParameterRanges class]];
}

+ (NSValueTransformer *)resourceLimitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerResourceLimits class]];
}

+ (NSValueTransformer *)strategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Bayesian"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobStrategyTypeBayesian);
        }
        if ([value caseInsensitiveCompare:@"Random"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobStrategyTypeRandom);
        }
        return @(AWSSagemakerHyperParameterTuningJobStrategyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerHyperParameterTuningJobStrategyTypeBayesian:
                return @"Bayesian";
            case AWSSagemakerHyperParameterTuningJobStrategyTypeRandom:
                return @"Random";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)trainingJobEarlyStoppingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Off"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobEarlyStoppingTypeOff);
        }
        if ([value caseInsensitiveCompare:@"Auto"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobEarlyStoppingTypeAuto);
        }
        return @(AWSSagemakerTrainingJobEarlyStoppingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerTrainingJobEarlyStoppingTypeOff:
                return @"Off";
            case AWSSagemakerTrainingJobEarlyStoppingTypeAuto:
                return @"Auto";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tuningJobCompletionCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTuningJobCompletionCriteria class]];
}

@end

@implementation AWSSagemakerHyperParameterTuningJobObjective

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricName" : @"MetricName",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Maximize"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobObjectiveTypeMaximize);
        }
        if ([value caseInsensitiveCompare:@"Minimize"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobObjectiveTypeMinimize);
        }
        return @(AWSSagemakerHyperParameterTuningJobObjectiveTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerHyperParameterTuningJobObjectiveTypeMaximize:
                return @"Maximize";
            case AWSSagemakerHyperParameterTuningJobObjectiveTypeMinimize:
                return @"Minimize";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerHyperParameterTuningJobSummary

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
            return @(AWSSagemakerHyperParameterTuningJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobStatusStopping);
        }
        return @(AWSSagemakerHyperParameterTuningJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerHyperParameterTuningJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerHyperParameterTuningJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerHyperParameterTuningJobStatusFailed:
                return @"Failed";
            case AWSSagemakerHyperParameterTuningJobStatusStopped:
                return @"Stopped";
            case AWSSagemakerHyperParameterTuningJobStatusStopping:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerObjectiveStatusCounters class]];
}

+ (NSValueTransformer *)resourceLimitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerResourceLimits class]];
}

+ (NSValueTransformer *)strategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Bayesian"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobStrategyTypeBayesian);
        }
        if ([value caseInsensitiveCompare:@"Random"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobStrategyTypeRandom);
        }
        return @(AWSSagemakerHyperParameterTuningJobStrategyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerHyperParameterTuningJobStrategyTypeBayesian:
                return @"Bayesian";
            case AWSSagemakerHyperParameterTuningJobStrategyTypeRandom:
                return @"Random";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)trainingJobStatusCountersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrainingJobStatusCounters class]];
}

@end

@implementation AWSSagemakerHyperParameterTuningJobWarmStartConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parentHyperParameterTuningJobs" : @"ParentHyperParameterTuningJobs",
             @"warmStartType" : @"WarmStartType",
             };
}

+ (NSValueTransformer *)parentHyperParameterTuningJobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerParentHyperParameterTuningJob class]];
}

+ (NSValueTransformer *)warmStartTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IdenticalDataAndAlgorithm"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobWarmStartTypeIdenticalDataAndAlgorithm);
        }
        if ([value caseInsensitiveCompare:@"TransferLearning"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobWarmStartTypeTransferLearning);
        }
        return @(AWSSagemakerHyperParameterTuningJobWarmStartTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerHyperParameterTuningJobWarmStartTypeIdenticalDataAndAlgorithm:
                return @"IdenticalDataAndAlgorithm";
            case AWSSagemakerHyperParameterTuningJobWarmStartTypeTransferLearning:
                return @"TransferLearning";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerInferenceSpecification

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerModelPackageContainerDefinition class]];
}

@end

@implementation AWSSagemakerInputConfig

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
            return @(AWSSagemakerFrameworkTensorflow);
        }
        if ([value caseInsensitiveCompare:@"KERAS"] == NSOrderedSame) {
            return @(AWSSagemakerFrameworkKeras);
        }
        if ([value caseInsensitiveCompare:@"MXNET"] == NSOrderedSame) {
            return @(AWSSagemakerFrameworkMxnet);
        }
        if ([value caseInsensitiveCompare:@"ONNX"] == NSOrderedSame) {
            return @(AWSSagemakerFrameworkOnnx);
        }
        if ([value caseInsensitiveCompare:@"PYTORCH"] == NSOrderedSame) {
            return @(AWSSagemakerFrameworkPytorch);
        }
        if ([value caseInsensitiveCompare:@"XGBOOST"] == NSOrderedSame) {
            return @(AWSSagemakerFrameworkXgboost);
        }
        if ([value caseInsensitiveCompare:@"TFLITE"] == NSOrderedSame) {
            return @(AWSSagemakerFrameworkTflite);
        }
        return @(AWSSagemakerFrameworkUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerFrameworkTensorflow:
                return @"TENSORFLOW";
            case AWSSagemakerFrameworkKeras:
                return @"KERAS";
            case AWSSagemakerFrameworkMxnet:
                return @"MXNET";
            case AWSSagemakerFrameworkOnnx:
                return @"ONNX";
            case AWSSagemakerFrameworkPytorch:
                return @"PYTORCH";
            case AWSSagemakerFrameworkXgboost:
                return @"XGBOOST";
            case AWSSagemakerFrameworkTflite:
                return @"TFLITE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerIntegerParameterRange

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
            return @(AWSSagemakerHyperParameterScalingTypeAuto);
        }
        if ([value caseInsensitiveCompare:@"Linear"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterScalingTypeLinear);
        }
        if ([value caseInsensitiveCompare:@"Logarithmic"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterScalingTypeLogarithmic);
        }
        if ([value caseInsensitiveCompare:@"ReverseLogarithmic"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterScalingTypeReverseLogarithmic);
        }
        return @(AWSSagemakerHyperParameterScalingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerHyperParameterScalingTypeAuto:
                return @"Auto";
            case AWSSagemakerHyperParameterScalingTypeLinear:
                return @"Linear";
            case AWSSagemakerHyperParameterScalingTypeLogarithmic:
                return @"Logarithmic";
            case AWSSagemakerHyperParameterScalingTypeReverseLogarithmic:
                return @"ReverseLogarithmic";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerIntegerParameterRangeSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxValue" : @"MaxValue",
             @"minValue" : @"MinValue",
             };
}

@end

@implementation AWSSagemakerJupyterServerAppSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultResourceSpec" : @"DefaultResourceSpec",
             };
}

+ (NSValueTransformer *)defaultResourceSpecJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerResourceSpec class]];
}

@end

@implementation AWSSagemakerKernelGatewayAppSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultResourceSpec" : @"DefaultResourceSpec",
             };
}

+ (NSValueTransformer *)defaultResourceSpecJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerResourceSpec class]];
}

@end

@implementation AWSSagemakerLabelCounters

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

@implementation AWSSagemakerLabelCountersForWorkteam

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanLabeled" : @"HumanLabeled",
             @"pendingHuman" : @"PendingHuman",
             @"total" : @"Total",
             };
}

@end

@implementation AWSSagemakerLabelingJobAlgorithmsConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initialActiveLearningModelArn" : @"InitialActiveLearningModelArn",
             @"labelingJobAlgorithmSpecificationArn" : @"LabelingJobAlgorithmSpecificationArn",
             @"labelingJobResourceConfig" : @"LabelingJobResourceConfig",
             };
}

+ (NSValueTransformer *)labelingJobResourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerLabelingJobResourceConfig class]];
}

@end

@implementation AWSSagemakerLabelingJobDataAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentClassifiers" : @"ContentClassifiers",
             };
}

@end

@implementation AWSSagemakerLabelingJobDataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3DataSource" : @"S3DataSource",
             };
}

+ (NSValueTransformer *)s3DataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerLabelingJobS3DataSource class]];
}

@end

@implementation AWSSagemakerLabelingJobForWorkteamSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerLabelCountersForWorkteam class]];
}

@end

@implementation AWSSagemakerLabelingJobInputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAttributes" : @"DataAttributes",
             @"dataSource" : @"DataSource",
             };
}

+ (NSValueTransformer *)dataAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerLabelingJobDataAttributes class]];
}

+ (NSValueTransformer *)dataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerLabelingJobDataSource class]];
}

@end

@implementation AWSSagemakerLabelingJobOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"finalActiveLearningModelArn" : @"FinalActiveLearningModelArn",
             @"outputDatasetS3Uri" : @"OutputDatasetS3Uri",
             };
}

@end

@implementation AWSSagemakerLabelingJobOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"s3OutputPath" : @"S3OutputPath",
             };
}

@end

@implementation AWSSagemakerLabelingJobResourceConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             };
}

@end

@implementation AWSSagemakerLabelingJobS3DataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestS3Uri" : @"ManifestS3Uri",
             };
}

@end

@implementation AWSSagemakerLabelingJobStoppingConditions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxHumanLabeledObjectCount" : @"MaxHumanLabeledObjectCount",
             @"maxPercentageOfInputDatasetLabeled" : @"MaxPercentageOfInputDatasetLabeled",
             };
}

@end

@implementation AWSSagemakerLabelingJobSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerLabelingJobInputConfig class]];
}

+ (NSValueTransformer *)labelCountersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerLabelCounters class]];
}

+ (NSValueTransformer *)labelingJobOutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerLabelingJobOutput class]];
}

+ (NSValueTransformer *)labelingJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerLabelingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerLabelingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerLabelingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerLabelingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerLabelingJobStatusStopped);
        }
        return @(AWSSagemakerLabelingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerLabelingJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerLabelingJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerLabelingJobStatusFailed:
                return @"Failed";
            case AWSSagemakerLabelingJobStatusStopping:
                return @"Stopping";
            case AWSSagemakerLabelingJobStatusStopped:
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

@implementation AWSSagemakerListAlgorithmsInput

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
            return @(AWSSagemakerAlgorithmSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSagemakerAlgorithmSortByCreationTime);
        }
        return @(AWSSagemakerAlgorithmSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAlgorithmSortByName:
                return @"Name";
            case AWSSagemakerAlgorithmSortByCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderDescending);
        }
        return @(AWSSagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListAlgorithmsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmSummaryList" : @"AlgorithmSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)algorithmSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerAlgorithmSummary class]];
}

@end

@implementation AWSSagemakerListAppsRequest

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
            return @(AWSSagemakerAppSortKeyCreationTime);
        }
        return @(AWSSagemakerAppSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAppSortKeyCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderDescending);
        }
        return @(AWSSagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListAppsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apps" : @"Apps",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)appsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerAppDetails class]];
}

@end

@implementation AWSSagemakerListAutoMLJobsRequest

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
            return @(AWSSagemakerAutoMLSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLSortByStatus);
        }
        return @(AWSSagemakerAutoMLSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAutoMLSortByName:
                return @"Name";
            case AWSSagemakerAutoMLSortByCreationTime:
                return @"CreationTime";
            case AWSSagemakerAutoMLSortByStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLSortOrderDescending);
        }
        return @(AWSSagemakerAutoMLSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAutoMLSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerAutoMLSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLJobStatusStopping);
        }
        return @(AWSSagemakerAutoMLJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAutoMLJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerAutoMLJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerAutoMLJobStatusFailed:
                return @"Failed";
            case AWSSagemakerAutoMLJobStatusStopped:
                return @"Stopped";
            case AWSSagemakerAutoMLJobStatusStopping:
                return @"Stopping";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListAutoMLJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLJobSummaries" : @"AutoMLJobSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)autoMLJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerAutoMLJobSummary class]];
}

@end

@implementation AWSSagemakerListCandidatesForAutoMLJobRequest

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
            return @(AWSSagemakerCandidateSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSagemakerCandidateSortByStatus);
        }
        if ([value caseInsensitiveCompare:@"FinalObjectiveMetricValue"] == NSOrderedSame) {
            return @(AWSSagemakerCandidateSortByFinalObjectiveMetricValue);
        }
        return @(AWSSagemakerCandidateSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerCandidateSortByCreationTime:
                return @"CreationTime";
            case AWSSagemakerCandidateSortByStatus:
                return @"Status";
            case AWSSagemakerCandidateSortByFinalObjectiveMetricValue:
                return @"FinalObjectiveMetricValue";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerAutoMLSortOrderDescending);
        }
        return @(AWSSagemakerAutoMLSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAutoMLSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerAutoMLSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerCandidateStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerCandidateStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerCandidateStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerCandidateStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerCandidateStatusStopping);
        }
        return @(AWSSagemakerCandidateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerCandidateStatusCompleted:
                return @"Completed";
            case AWSSagemakerCandidateStatusInProgress:
                return @"InProgress";
            case AWSSagemakerCandidateStatusFailed:
                return @"Failed";
            case AWSSagemakerCandidateStatusStopped:
                return @"Stopped";
            case AWSSagemakerCandidateStatusStopping:
                return @"Stopping";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListCandidatesForAutoMLJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"candidates" : @"Candidates",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)candidatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerAutoMLCandidate class]];
}

@end

@implementation AWSSagemakerListCodeRepositoriesInput

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
            return @(AWSSagemakerCodeRepositorySortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSagemakerCodeRepositorySortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"LastModifiedTime"] == NSOrderedSame) {
            return @(AWSSagemakerCodeRepositorySortByLastModifiedTime);
        }
        return @(AWSSagemakerCodeRepositorySortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerCodeRepositorySortByName:
                return @"Name";
            case AWSSagemakerCodeRepositorySortByCreationTime:
                return @"CreationTime";
            case AWSSagemakerCodeRepositorySortByLastModifiedTime:
                return @"LastModifiedTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerCodeRepositorySortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerCodeRepositorySortOrderDescending);
        }
        return @(AWSSagemakerCodeRepositorySortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerCodeRepositorySortOrderAscending:
                return @"Ascending";
            case AWSSagemakerCodeRepositorySortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListCodeRepositoriesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositorySummaryList" : @"CodeRepositorySummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)codeRepositorySummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerCodeRepositorySummary class]];
}

@end

@implementation AWSSagemakerListCompilationJobsRequest

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
            return @(AWSSagemakerListCompilationJobsSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSagemakerListCompilationJobsSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSagemakerListCompilationJobsSortByStatus);
        }
        return @(AWSSagemakerListCompilationJobsSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerListCompilationJobsSortByName:
                return @"Name";
            case AWSSagemakerListCompilationJobsSortByCreationTime:
                return @"CreationTime";
            case AWSSagemakerListCompilationJobsSortByStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderDescending);
        }
        return @(AWSSagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INPROGRESS"] == NSOrderedSame) {
            return @(AWSSagemakerCompilationJobStatusInprogress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSSagemakerCompilationJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSagemakerCompilationJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSSagemakerCompilationJobStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSSagemakerCompilationJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSSagemakerCompilationJobStatusStopped);
        }
        return @(AWSSagemakerCompilationJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerCompilationJobStatusInprogress:
                return @"INPROGRESS";
            case AWSSagemakerCompilationJobStatusCompleted:
                return @"COMPLETED";
            case AWSSagemakerCompilationJobStatusFailed:
                return @"FAILED";
            case AWSSagemakerCompilationJobStatusStarting:
                return @"STARTING";
            case AWSSagemakerCompilationJobStatusStopping:
                return @"STOPPING";
            case AWSSagemakerCompilationJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListCompilationJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compilationJobSummaries" : @"CompilationJobSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)compilationJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerCompilationJobSummary class]];
}

@end

@implementation AWSSagemakerListDomainsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSagemakerListDomainsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domains" : @"Domains",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)domainsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerDomainDetails class]];
}

@end

@implementation AWSSagemakerListEndpointConfigsInput

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
            return @(AWSSagemakerEndpointConfigSortKeyName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointConfigSortKeyCreationTime);
        }
        return @(AWSSagemakerEndpointConfigSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerEndpointConfigSortKeyName:
                return @"Name";
            case AWSSagemakerEndpointConfigSortKeyCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerOrderKeyAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerOrderKeyDescending);
        }
        return @(AWSSagemakerOrderKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerOrderKeyAscending:
                return @"Ascending";
            case AWSSagemakerOrderKeyDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListEndpointConfigsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointConfigs" : @"EndpointConfigs",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)endpointConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerEndpointConfigSummary class]];
}

@end

@implementation AWSSagemakerListEndpointsInput

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
            return @(AWSSagemakerEndpointSortKeyName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointSortKeyCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointSortKeyStatus);
        }
        return @(AWSSagemakerEndpointSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerEndpointSortKeyName:
                return @"Name";
            case AWSSagemakerEndpointSortKeyCreationTime:
                return @"CreationTime";
            case AWSSagemakerEndpointSortKeyStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerOrderKeyAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerOrderKeyDescending);
        }
        return @(AWSSagemakerOrderKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerOrderKeyAscending:
                return @"Ascending";
            case AWSSagemakerOrderKeyDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OutOfService"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusOutOfService);
        }
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"SystemUpdating"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusSystemUpdating);
        }
        if ([value caseInsensitiveCompare:@"RollingBack"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusRollingBack);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerEndpointStatusFailed);
        }
        return @(AWSSagemakerEndpointStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerEndpointStatusOutOfService:
                return @"OutOfService";
            case AWSSagemakerEndpointStatusCreating:
                return @"Creating";
            case AWSSagemakerEndpointStatusUpdating:
                return @"Updating";
            case AWSSagemakerEndpointStatusSystemUpdating:
                return @"SystemUpdating";
            case AWSSagemakerEndpointStatusRollingBack:
                return @"RollingBack";
            case AWSSagemakerEndpointStatusInService:
                return @"InService";
            case AWSSagemakerEndpointStatusDeleting:
                return @"Deleting";
            case AWSSagemakerEndpointStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListEndpointsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoints" : @"Endpoints",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)endpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerEndpointSummary class]];
}

@end

@implementation AWSSagemakerListExperimentsRequest

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
            return @(AWSSagemakerSortExperimentsByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSagemakerSortExperimentsByCreationTime);
        }
        return @(AWSSagemakerSortExperimentsByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortExperimentsByName:
                return @"Name";
            case AWSSagemakerSortExperimentsByCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderDescending);
        }
        return @(AWSSagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListExperimentsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentSummaries" : @"ExperimentSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)experimentSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerExperimentSummary class]];
}

@end

@implementation AWSSagemakerListFlowDefinitionsRequest

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
            return @(AWSSagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderDescending);
        }
        return @(AWSSagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListFlowDefinitionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flowDefinitionSummaries" : @"FlowDefinitionSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)flowDefinitionSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerFlowDefinitionSummary class]];
}

@end

@implementation AWSSagemakerListHumanTaskUisRequest

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
            return @(AWSSagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderDescending);
        }
        return @(AWSSagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListHumanTaskUisResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanTaskUiSummaries" : @"HumanTaskUiSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)humanTaskUiSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerHumanTaskUiSummary class]];
}

@end

@implementation AWSSagemakerListHyperParameterTuningJobsRequest

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
            return @(AWSSagemakerHyperParameterTuningJobSortByOptionsName);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobSortByOptionsStatus);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobSortByOptionsCreationTime);
        }
        return @(AWSSagemakerHyperParameterTuningJobSortByOptionsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerHyperParameterTuningJobSortByOptionsName:
                return @"Name";
            case AWSSagemakerHyperParameterTuningJobSortByOptionsStatus:
                return @"Status";
            case AWSSagemakerHyperParameterTuningJobSortByOptionsCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderDescending);
        }
        return @(AWSSagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerHyperParameterTuningJobStatusStopping);
        }
        return @(AWSSagemakerHyperParameterTuningJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerHyperParameterTuningJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerHyperParameterTuningJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerHyperParameterTuningJobStatusFailed:
                return @"Failed";
            case AWSSagemakerHyperParameterTuningJobStatusStopped:
                return @"Stopped";
            case AWSSagemakerHyperParameterTuningJobStatusStopping:
                return @"Stopping";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListHyperParameterTuningJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hyperParameterTuningJobSummaries" : @"HyperParameterTuningJobSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)hyperParameterTuningJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerHyperParameterTuningJobSummary class]];
}

@end

@implementation AWSSagemakerListLabelingJobsForWorkteamRequest

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
            return @(AWSSagemakerListLabelingJobsForWorkteamSortByOptionsCreationTime);
        }
        return @(AWSSagemakerListLabelingJobsForWorkteamSortByOptionsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerListLabelingJobsForWorkteamSortByOptionsCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderDescending);
        }
        return @(AWSSagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListLabelingJobsForWorkteamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelingJobSummaryList" : @"LabelingJobSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)labelingJobSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerLabelingJobForWorkteamSummary class]];
}

@end

@implementation AWSSagemakerListLabelingJobsRequest

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
            return @(AWSSagemakerSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSagemakerSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSagemakerSortByStatus);
        }
        return @(AWSSagemakerSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortByName:
                return @"Name";
            case AWSSagemakerSortByCreationTime:
                return @"CreationTime";
            case AWSSagemakerSortByStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderDescending);
        }
        return @(AWSSagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerLabelingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerLabelingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerLabelingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerLabelingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerLabelingJobStatusStopped);
        }
        return @(AWSSagemakerLabelingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerLabelingJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerLabelingJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerLabelingJobStatusFailed:
                return @"Failed";
            case AWSSagemakerLabelingJobStatusStopping:
                return @"Stopping";
            case AWSSagemakerLabelingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListLabelingJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelingJobSummaryList" : @"LabelingJobSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)labelingJobSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerLabelingJobSummary class]];
}

@end

@implementation AWSSagemakerListModelPackagesInput

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
            return @(AWSSagemakerModelPackageSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSagemakerModelPackageSortByCreationTime);
        }
        return @(AWSSagemakerModelPackageSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerModelPackageSortByName:
                return @"Name";
            case AWSSagemakerModelPackageSortByCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderDescending);
        }
        return @(AWSSagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListModelPackagesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelPackageSummaryList" : @"ModelPackageSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)modelPackageSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerModelPackageSummary class]];
}

@end

@implementation AWSSagemakerListModelsInput

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
            return @(AWSSagemakerModelSortKeyName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSagemakerModelSortKeyCreationTime);
        }
        return @(AWSSagemakerModelSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerModelSortKeyName:
                return @"Name";
            case AWSSagemakerModelSortKeyCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerOrderKeyAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerOrderKeyDescending);
        }
        return @(AWSSagemakerOrderKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerOrderKeyAscending:
                return @"Ascending";
            case AWSSagemakerOrderKeyDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListModelsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"models" : @"Models",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)modelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerModelSummary class]];
}

@end

@implementation AWSSagemakerListMonitoringExecutionsRequest

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
            return @(AWSSagemakerMonitoringExecutionSortKeyCreationTime);
        }
        if ([value caseInsensitiveCompare:@"ScheduledTime"] == NSOrderedSame) {
            return @(AWSSagemakerMonitoringExecutionSortKeyScheduledTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSagemakerMonitoringExecutionSortKeyStatus);
        }
        return @(AWSSagemakerMonitoringExecutionSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerMonitoringExecutionSortKeyCreationTime:
                return @"CreationTime";
            case AWSSagemakerMonitoringExecutionSortKeyScheduledTime:
                return @"ScheduledTime";
            case AWSSagemakerMonitoringExecutionSortKeyStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderDescending);
        }
        return @(AWSSagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSagemakerExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerExecutionStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"CompletedWithViolations"] == NSOrderedSame) {
            return @(AWSSagemakerExecutionStatusCompletedWithViolations);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerExecutionStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerExecutionStatusStopped);
        }
        return @(AWSSagemakerExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerExecutionStatusPending:
                return @"Pending";
            case AWSSagemakerExecutionStatusCompleted:
                return @"Completed";
            case AWSSagemakerExecutionStatusCompletedWithViolations:
                return @"CompletedWithViolations";
            case AWSSagemakerExecutionStatusInProgress:
                return @"InProgress";
            case AWSSagemakerExecutionStatusFailed:
                return @"Failed";
            case AWSSagemakerExecutionStatusStopping:
                return @"Stopping";
            case AWSSagemakerExecutionStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListMonitoringExecutionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringExecutionSummaries" : @"MonitoringExecutionSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)monitoringExecutionSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerMonitoringExecutionSummary class]];
}

@end

@implementation AWSSagemakerListMonitoringSchedulesRequest

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
            return @(AWSSagemakerMonitoringScheduleSortKeyName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSagemakerMonitoringScheduleSortKeyCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSagemakerMonitoringScheduleSortKeyStatus);
        }
        return @(AWSSagemakerMonitoringScheduleSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerMonitoringScheduleSortKeyName:
                return @"Name";
            case AWSSagemakerMonitoringScheduleSortKeyCreationTime:
                return @"CreationTime";
            case AWSSagemakerMonitoringScheduleSortKeyStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderDescending);
        }
        return @(AWSSagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSagemakerScheduleStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerScheduleStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Scheduled"] == NSOrderedSame) {
            return @(AWSSagemakerScheduleStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerScheduleStatusStopped);
        }
        return @(AWSSagemakerScheduleStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerScheduleStatusPending:
                return @"Pending";
            case AWSSagemakerScheduleStatusFailed:
                return @"Failed";
            case AWSSagemakerScheduleStatusScheduled:
                return @"Scheduled";
            case AWSSagemakerScheduleStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListMonitoringSchedulesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleSummaries" : @"MonitoringScheduleSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)monitoringScheduleSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerMonitoringScheduleSummary class]];
}

@end

@implementation AWSSagemakerListNotebookInstanceLifecycleConfigsInput

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
            return @(AWSSagemakerNotebookInstanceLifecycleConfigSortKeyName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceLifecycleConfigSortKeyCreationTime);
        }
        if ([value caseInsensitiveCompare:@"LastModifiedTime"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceLifecycleConfigSortKeyLastModifiedTime);
        }
        return @(AWSSagemakerNotebookInstanceLifecycleConfigSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerNotebookInstanceLifecycleConfigSortKeyName:
                return @"Name";
            case AWSSagemakerNotebookInstanceLifecycleConfigSortKeyCreationTime:
                return @"CreationTime";
            case AWSSagemakerNotebookInstanceLifecycleConfigSortKeyLastModifiedTime:
                return @"LastModifiedTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceLifecycleConfigSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceLifecycleConfigSortOrderDescending);
        }
        return @(AWSSagemakerNotebookInstanceLifecycleConfigSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerNotebookInstanceLifecycleConfigSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerNotebookInstanceLifecycleConfigSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListNotebookInstanceLifecycleConfigsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"notebookInstanceLifecycleConfigs" : @"NotebookInstanceLifecycleConfigs",
             };
}

+ (NSValueTransformer *)notebookInstanceLifecycleConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerNotebookInstanceLifecycleConfigSummary class]];
}

@end

@implementation AWSSagemakerListNotebookInstancesInput

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
            return @(AWSSagemakerNotebookInstanceSortKeyName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceSortKeyCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceSortKeyStatus);
        }
        return @(AWSSagemakerNotebookInstanceSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerNotebookInstanceSortKeyName:
                return @"Name";
            case AWSSagemakerNotebookInstanceSortKeyCreationTime:
                return @"CreationTime";
            case AWSSagemakerNotebookInstanceSortKeyStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceSortOrderDescending);
        }
        return @(AWSSagemakerNotebookInstanceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerNotebookInstanceSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerNotebookInstanceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceStatusUpdating);
        }
        return @(AWSSagemakerNotebookInstanceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerNotebookInstanceStatusPending:
                return @"Pending";
            case AWSSagemakerNotebookInstanceStatusInService:
                return @"InService";
            case AWSSagemakerNotebookInstanceStatusStopping:
                return @"Stopping";
            case AWSSagemakerNotebookInstanceStatusStopped:
                return @"Stopped";
            case AWSSagemakerNotebookInstanceStatusFailed:
                return @"Failed";
            case AWSSagemakerNotebookInstanceStatusDeleting:
                return @"Deleting";
            case AWSSagemakerNotebookInstanceStatusUpdating:
                return @"Updating";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListNotebookInstancesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"notebookInstances" : @"NotebookInstances",
             };
}

+ (NSValueTransformer *)notebookInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerNotebookInstanceSummary class]];
}

@end

@implementation AWSSagemakerListProcessingJobsRequest

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
            return @(AWSSagemakerSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSagemakerSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSagemakerSortByStatus);
        }
        return @(AWSSagemakerSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortByName:
                return @"Name";
            case AWSSagemakerSortByCreationTime:
                return @"CreationTime";
            case AWSSagemakerSortByStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderDescending);
        }
        return @(AWSSagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingJobStatusStopped);
        }
        return @(AWSSagemakerProcessingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerProcessingJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerProcessingJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerProcessingJobStatusFailed:
                return @"Failed";
            case AWSSagemakerProcessingJobStatusStopping:
                return @"Stopping";
            case AWSSagemakerProcessingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListProcessingJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"processingJobSummaries" : @"ProcessingJobSummaries",
             };
}

+ (NSValueTransformer *)processingJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerProcessingJobSummary class]];
}

@end

@implementation AWSSagemakerListSubscribedWorkteamsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSagemakerListSubscribedWorkteamsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"subscribedWorkteams" : @"SubscribedWorkteams",
             };
}

+ (NSValueTransformer *)subscribedWorkteamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerSubscribedWorkteam class]];
}

@end

@implementation AWSSagemakerListTagsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSSagemakerListTagsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerListTrainingJobsForHyperParameterTuningJobRequest

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
            return @(AWSSagemakerTrainingJobSortByOptionsName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobSortByOptionsCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobSortByOptionsStatus);
        }
        if ([value caseInsensitiveCompare:@"FinalObjectiveMetricValue"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobSortByOptionsFinalObjectiveMetricValue);
        }
        return @(AWSSagemakerTrainingJobSortByOptionsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerTrainingJobSortByOptionsName:
                return @"Name";
            case AWSSagemakerTrainingJobSortByOptionsCreationTime:
                return @"CreationTime";
            case AWSSagemakerTrainingJobSortByOptionsStatus:
                return @"Status";
            case AWSSagemakerTrainingJobSortByOptionsFinalObjectiveMetricValue:
                return @"FinalObjectiveMetricValue";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderDescending);
        }
        return @(AWSSagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusStopped);
        }
        return @(AWSSagemakerTrainingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerTrainingJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerTrainingJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerTrainingJobStatusFailed:
                return @"Failed";
            case AWSSagemakerTrainingJobStatusStopping:
                return @"Stopping";
            case AWSSagemakerTrainingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListTrainingJobsForHyperParameterTuningJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"trainingJobSummaries" : @"TrainingJobSummaries",
             };
}

+ (NSValueTransformer *)trainingJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerHyperParameterTrainingJobSummary class]];
}

@end

@implementation AWSSagemakerListTrainingJobsRequest

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
            return @(AWSSagemakerSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSagemakerSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSagemakerSortByStatus);
        }
        return @(AWSSagemakerSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortByName:
                return @"Name";
            case AWSSagemakerSortByCreationTime:
                return @"CreationTime";
            case AWSSagemakerSortByStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderDescending);
        }
        return @(AWSSagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusStopped);
        }
        return @(AWSSagemakerTrainingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerTrainingJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerTrainingJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerTrainingJobStatusFailed:
                return @"Failed";
            case AWSSagemakerTrainingJobStatusStopping:
                return @"Stopping";
            case AWSSagemakerTrainingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListTrainingJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"trainingJobSummaries" : @"TrainingJobSummaries",
             };
}

+ (NSValueTransformer *)trainingJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTrainingJobSummary class]];
}

@end

@implementation AWSSagemakerListTransformJobsRequest

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
            return @(AWSSagemakerSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSagemakerSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSagemakerSortByStatus);
        }
        return @(AWSSagemakerSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortByName:
                return @"Name";
            case AWSSagemakerSortByCreationTime:
                return @"CreationTime";
            case AWSSagemakerSortByStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderDescending);
        }
        return @(AWSSagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerTransformJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerTransformJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerTransformJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerTransformJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerTransformJobStatusStopped);
        }
        return @(AWSSagemakerTransformJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerTransformJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerTransformJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerTransformJobStatusFailed:
                return @"Failed";
            case AWSSagemakerTransformJobStatusStopping:
                return @"Stopping";
            case AWSSagemakerTransformJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListTransformJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"transformJobSummaries" : @"TransformJobSummaries",
             };
}

+ (NSValueTransformer *)transformJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTransformJobSummary class]];
}

@end

@implementation AWSSagemakerListTrialComponentsRequest

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
            return @(AWSSagemakerSortTrialComponentsByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSagemakerSortTrialComponentsByCreationTime);
        }
        return @(AWSSagemakerSortTrialComponentsByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortTrialComponentsByName:
                return @"Name";
            case AWSSagemakerSortTrialComponentsByCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderDescending);
        }
        return @(AWSSagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListTrialComponentsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"trialComponentSummaries" : @"TrialComponentSummaries",
             };
}

+ (NSValueTransformer *)trialComponentSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTrialComponentSummary class]];
}

@end

@implementation AWSSagemakerListTrialsRequest

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
            return @(AWSSagemakerSortTrialsByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSagemakerSortTrialsByCreationTime);
        }
        return @(AWSSagemakerSortTrialsByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortTrialsByName:
                return @"Name";
            case AWSSagemakerSortTrialsByCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderDescending);
        }
        return @(AWSSagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListTrialsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"trialSummaries" : @"TrialSummaries",
             };
}

+ (NSValueTransformer *)trialSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTrialSummary class]];
}

@end

@implementation AWSSagemakerListUserProfilesRequest

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
            return @(AWSSagemakerUserProfileSortKeyCreationTime);
        }
        if ([value caseInsensitiveCompare:@"LastModifiedTime"] == NSOrderedSame) {
            return @(AWSSagemakerUserProfileSortKeyLastModifiedTime);
        }
        return @(AWSSagemakerUserProfileSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerUserProfileSortKeyCreationTime:
                return @"CreationTime";
            case AWSSagemakerUserProfileSortKeyLastModifiedTime:
                return @"LastModifiedTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderDescending);
        }
        return @(AWSSagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListUserProfilesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"userProfiles" : @"UserProfiles",
             };
}

+ (NSValueTransformer *)userProfilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerUserProfileDetails class]];
}

@end

@implementation AWSSagemakerListWorkteamsRequest

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
            return @(AWSSagemakerListWorkteamsSortByOptionsName);
        }
        if ([value caseInsensitiveCompare:@"CreateDate"] == NSOrderedSame) {
            return @(AWSSagemakerListWorkteamsSortByOptionsCreateDate);
        }
        return @(AWSSagemakerListWorkteamsSortByOptionsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerListWorkteamsSortByOptionsName:
                return @"Name";
            case AWSSagemakerListWorkteamsSortByOptionsCreateDate:
                return @"CreateDate";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSortOrderDescending);
        }
        return @(AWSSagemakerSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerListWorkteamsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"workteams" : @"Workteams",
             };
}

+ (NSValueTransformer *)workteamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerWorkteam class]];
}

@end

@implementation AWSSagemakerMemberDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cognitoMemberDefinition" : @"CognitoMemberDefinition",
             };
}

+ (NSValueTransformer *)cognitoMemberDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerCognitoMemberDefinition class]];
}

@end

@implementation AWSSagemakerMetricData

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

@implementation AWSSagemakerMetricDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"regex" : @"Regex",
             };
}

@end

@implementation AWSSagemakerModelArtifacts

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3ModelArtifacts" : @"S3ModelArtifacts",
             };
}

@end

@implementation AWSSagemakerModelPackageContainerDefinition

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

@implementation AWSSagemakerModelPackageStatusDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageScanStatuses" : @"ImageScanStatuses",
             @"validationStatuses" : @"ValidationStatuses",
             };
}

+ (NSValueTransformer *)imageScanStatusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerModelPackageStatusItem class]];
}

+ (NSValueTransformer *)validationStatusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerModelPackageStatusItem class]];
}

@end

@implementation AWSSagemakerModelPackageStatusItem

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
            return @(AWSSagemakerDetailedModelPackageStatusNotStarted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerDetailedModelPackageStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerDetailedModelPackageStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerDetailedModelPackageStatusFailed);
        }
        return @(AWSSagemakerDetailedModelPackageStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerDetailedModelPackageStatusNotStarted:
                return @"NotStarted";
            case AWSSagemakerDetailedModelPackageStatusInProgress:
                return @"InProgress";
            case AWSSagemakerDetailedModelPackageStatusCompleted:
                return @"Completed";
            case AWSSagemakerDetailedModelPackageStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerModelPackageSummary

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
            return @(AWSSagemakerModelPackageStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerModelPackageStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerModelPackageStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerModelPackageStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSagemakerModelPackageStatusDeleting);
        }
        return @(AWSSagemakerModelPackageStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerModelPackageStatusPending:
                return @"Pending";
            case AWSSagemakerModelPackageStatusInProgress:
                return @"InProgress";
            case AWSSagemakerModelPackageStatusCompleted:
                return @"Completed";
            case AWSSagemakerModelPackageStatusFailed:
                return @"Failed";
            case AWSSagemakerModelPackageStatusDeleting:
                return @"Deleting";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerModelPackageValidationProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"profileName" : @"ProfileName",
             @"transformJobDefinition" : @"TransformJobDefinition",
             };
}

+ (NSValueTransformer *)transformJobDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTransformJobDefinition class]];
}

@end

@implementation AWSSagemakerModelPackageValidationSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"validationProfiles" : @"ValidationProfiles",
             @"validationRole" : @"ValidationRole",
             };
}

+ (NSValueTransformer *)validationProfilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerModelPackageValidationProfile class]];
}

@end

@implementation AWSSagemakerModelSummary

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

@implementation AWSSagemakerMonitoringAppSpecification

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

@implementation AWSSagemakerMonitoringBaselineConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constraintsResource" : @"ConstraintsResource",
             @"statisticsResource" : @"StatisticsResource",
             };
}

+ (NSValueTransformer *)constraintsResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerMonitoringConstraintsResource class]];
}

+ (NSValueTransformer *)statisticsResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerMonitoringStatisticsResource class]];
}

@end

@implementation AWSSagemakerMonitoringClusterConfig

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
            return @(AWSSagemakerProcessingInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.large"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR58xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR516xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.24xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR524xlarge);
        }
        return @(AWSSagemakerProcessingInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerProcessingInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSSagemakerProcessingInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSSagemakerProcessingInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSSagemakerProcessingInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSSagemakerProcessingInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSSagemakerProcessingInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSagemakerProcessingInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSSagemakerProcessingInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR5Large:
                return @"ml.r5.large";
            case AWSSagemakerProcessingInstanceTypeMlR5Xlarge:
                return @"ml.r5.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR52xlarge:
                return @"ml.r5.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR54xlarge:
                return @"ml.r5.4xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR58xlarge:
                return @"ml.r5.8xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR512xlarge:
                return @"ml.r5.12xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR516xlarge:
                return @"ml.r5.16xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR524xlarge:
                return @"ml.r5.24xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerMonitoringConstraintsResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSSagemakerMonitoringExecutionSummary

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
            return @(AWSSagemakerExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerExecutionStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"CompletedWithViolations"] == NSOrderedSame) {
            return @(AWSSagemakerExecutionStatusCompletedWithViolations);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerExecutionStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerExecutionStatusStopped);
        }
        return @(AWSSagemakerExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerExecutionStatusPending:
                return @"Pending";
            case AWSSagemakerExecutionStatusCompleted:
                return @"Completed";
            case AWSSagemakerExecutionStatusCompletedWithViolations:
                return @"CompletedWithViolations";
            case AWSSagemakerExecutionStatusInProgress:
                return @"InProgress";
            case AWSSagemakerExecutionStatusFailed:
                return @"Failed";
            case AWSSagemakerExecutionStatusStopping:
                return @"Stopping";
            case AWSSagemakerExecutionStatusStopped:
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

@implementation AWSSagemakerMonitoringInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointInput" : @"EndpointInput",
             };
}

+ (NSValueTransformer *)endpointInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerEndpointInput class]];
}

@end

@implementation AWSSagemakerMonitoringJobDefinition

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerMonitoringBaselineConfig class]];
}

+ (NSValueTransformer *)monitoringAppSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerMonitoringAppSpecification class]];
}

+ (NSValueTransformer *)monitoringInputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerMonitoringInput class]];
}

+ (NSValueTransformer *)monitoringOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerMonitoringOutputConfig class]];
}

+ (NSValueTransformer *)monitoringResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerMonitoringResources class]];
}

+ (NSValueTransformer *)networkConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerNetworkConfig class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerMonitoringStoppingCondition class]];
}

@end

@implementation AWSSagemakerMonitoringOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Output" : @"S3Output",
             };
}

+ (NSValueTransformer *)s3OutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerMonitoringS3Output class]];
}

@end

@implementation AWSSagemakerMonitoringOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"monitoringOutputs" : @"MonitoringOutputs",
             };
}

+ (NSValueTransformer *)monitoringOutputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerMonitoringOutput class]];
}

@end

@implementation AWSSagemakerMonitoringResources

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterConfig" : @"ClusterConfig",
             };
}

+ (NSValueTransformer *)clusterConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerMonitoringClusterConfig class]];
}

@end

@implementation AWSSagemakerMonitoringS3Output

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
            return @(AWSSagemakerProcessingS3UploadModeContinuous);
        }
        if ([value caseInsensitiveCompare:@"EndOfJob"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingS3UploadModeEndOfJob);
        }
        return @(AWSSagemakerProcessingS3UploadModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerProcessingS3UploadModeContinuous:
                return @"Continuous";
            case AWSSagemakerProcessingS3UploadModeEndOfJob:
                return @"EndOfJob";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerMonitoringScheduleConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringJobDefinition" : @"MonitoringJobDefinition",
             @"scheduleConfig" : @"ScheduleConfig",
             };
}

+ (NSValueTransformer *)monitoringJobDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerMonitoringJobDefinition class]];
}

+ (NSValueTransformer *)scheduleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerScheduleConfig class]];
}

@end

@implementation AWSSagemakerMonitoringScheduleSummary

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
            return @(AWSSagemakerScheduleStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerScheduleStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Scheduled"] == NSOrderedSame) {
            return @(AWSSagemakerScheduleStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerScheduleStatusStopped);
        }
        return @(AWSSagemakerScheduleStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerScheduleStatusPending:
                return @"Pending";
            case AWSSagemakerScheduleStatusFailed:
                return @"Failed";
            case AWSSagemakerScheduleStatusScheduled:
                return @"Scheduled";
            case AWSSagemakerScheduleStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerMonitoringStatisticsResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSSagemakerMonitoringStoppingCondition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxRuntimeInSeconds" : @"MaxRuntimeInSeconds",
             };
}

@end

@implementation AWSSagemakerNestedFilters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"nestedPropertyName" : @"NestedPropertyName",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerFilter class]];
}

@end

@implementation AWSSagemakerNetworkConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enableInterContainerTrafficEncryption" : @"EnableInterContainerTrafficEncryption",
             @"enableNetworkIsolation" : @"EnableNetworkIsolation",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerVpcConfig class]];
}

@end

@implementation AWSSagemakerNotebookInstanceLifecycleConfigSummary

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

@implementation AWSSagemakerNotebookInstanceLifecycleHook

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             };
}

@end

@implementation AWSSagemakerNotebookInstanceSummary

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
            return @(AWSSagemakerInstanceTypeMlT2Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.large"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT2Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT22xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.medium"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.9xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5d9xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.18xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5d18xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP316xlarge);
        }
        return @(AWSSagemakerInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerInstanceTypeMlT2Medium:
                return @"ml.t2.medium";
            case AWSSagemakerInstanceTypeMlT2Large:
                return @"ml.t2.large";
            case AWSSagemakerInstanceTypeMlT2Xlarge:
                return @"ml.t2.xlarge";
            case AWSSagemakerInstanceTypeMlT22xlarge:
                return @"ml.t2.2xlarge";
            case AWSSagemakerInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSSagemakerInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSSagemakerInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSSagemakerInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSSagemakerInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSSagemakerInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSSagemakerInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSSagemakerInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSSagemakerInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSSagemakerInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSagemakerInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSagemakerInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSagemakerInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSagemakerInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSSagemakerInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSSagemakerInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSSagemakerInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSSagemakerInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSSagemakerInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSagemakerInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSagemakerInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSagemakerInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSagemakerInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSagemakerInstanceTypeMlC5dXlarge:
                return @"ml.c5d.xlarge";
            case AWSSagemakerInstanceTypeMlC5d2xlarge:
                return @"ml.c5d.2xlarge";
            case AWSSagemakerInstanceTypeMlC5d4xlarge:
                return @"ml.c5d.4xlarge";
            case AWSSagemakerInstanceTypeMlC5d9xlarge:
                return @"ml.c5d.9xlarge";
            case AWSSagemakerInstanceTypeMlC5d18xlarge:
                return @"ml.c5d.18xlarge";
            case AWSSagemakerInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSSagemakerInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSSagemakerInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSSagemakerInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSagemakerInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSagemakerInstanceTypeMlP316xlarge:
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
            return @(AWSSagemakerNotebookInstanceStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookInstanceStatusUpdating);
        }
        return @(AWSSagemakerNotebookInstanceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerNotebookInstanceStatusPending:
                return @"Pending";
            case AWSSagemakerNotebookInstanceStatusInService:
                return @"InService";
            case AWSSagemakerNotebookInstanceStatusStopping:
                return @"Stopping";
            case AWSSagemakerNotebookInstanceStatusStopped:
                return @"Stopped";
            case AWSSagemakerNotebookInstanceStatusFailed:
                return @"Failed";
            case AWSSagemakerNotebookInstanceStatusDeleting:
                return @"Deleting";
            case AWSSagemakerNotebookInstanceStatusUpdating:
                return @"Updating";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerNotificationConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notificationTopicArn" : @"NotificationTopicArn",
             };
}

@end

@implementation AWSSagemakerObjectiveStatusCounters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failed" : @"Failed",
             @"pending" : @"Pending",
             @"succeeded" : @"Succeeded",
             };
}

@end

@implementation AWSSagemakerOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3OutputLocation" : @"S3OutputLocation",
             @"targetDevice" : @"TargetDevice",
             };
}

+ (NSValueTransformer *)targetDeviceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceLambda);
        }
        if ([value caseInsensitiveCompare:@"ml_m4"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceMlM4);
        }
        if ([value caseInsensitiveCompare:@"ml_m5"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceMlM5);
        }
        if ([value caseInsensitiveCompare:@"ml_c4"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceMlC4);
        }
        if ([value caseInsensitiveCompare:@"ml_c5"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceMlC5);
        }
        if ([value caseInsensitiveCompare:@"ml_p2"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceMlP2);
        }
        if ([value caseInsensitiveCompare:@"ml_p3"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceMlP3);
        }
        if ([value caseInsensitiveCompare:@"ml_inf1"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceMlInf1);
        }
        if ([value caseInsensitiveCompare:@"jetson_tx1"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceJetsonTx1);
        }
        if ([value caseInsensitiveCompare:@"jetson_tx2"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceJetsonTx2);
        }
        if ([value caseInsensitiveCompare:@"jetson_nano"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceJetsonNano);
        }
        if ([value caseInsensitiveCompare:@"jetson_xavier"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceJetsonXavier);
        }
        if ([value caseInsensitiveCompare:@"rasp3b"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceRasp3b);
        }
        if ([value caseInsensitiveCompare:@"imx8qm"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceImx8qm);
        }
        if ([value caseInsensitiveCompare:@"deeplens"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceDeeplens);
        }
        if ([value caseInsensitiveCompare:@"rk3399"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceRk3399);
        }
        if ([value caseInsensitiveCompare:@"rk3288"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceRk3288);
        }
        if ([value caseInsensitiveCompare:@"aisage"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceAisage);
        }
        if ([value caseInsensitiveCompare:@"sbe_c"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceSbeC);
        }
        if ([value caseInsensitiveCompare:@"qcs605"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceQcs605);
        }
        if ([value caseInsensitiveCompare:@"qcs603"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceQcs603);
        }
        if ([value caseInsensitiveCompare:@"sitara_am57x"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceSitaraAm57x);
        }
        if ([value caseInsensitiveCompare:@"amba_cv22"] == NSOrderedSame) {
            return @(AWSSagemakerTargetDeviceAmbaCv22);
        }
        return @(AWSSagemakerTargetDeviceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerTargetDeviceLambda:
                return @"lambda";
            case AWSSagemakerTargetDeviceMlM4:
                return @"ml_m4";
            case AWSSagemakerTargetDeviceMlM5:
                return @"ml_m5";
            case AWSSagemakerTargetDeviceMlC4:
                return @"ml_c4";
            case AWSSagemakerTargetDeviceMlC5:
                return @"ml_c5";
            case AWSSagemakerTargetDeviceMlP2:
                return @"ml_p2";
            case AWSSagemakerTargetDeviceMlP3:
                return @"ml_p3";
            case AWSSagemakerTargetDeviceMlInf1:
                return @"ml_inf1";
            case AWSSagemakerTargetDeviceJetsonTx1:
                return @"jetson_tx1";
            case AWSSagemakerTargetDeviceJetsonTx2:
                return @"jetson_tx2";
            case AWSSagemakerTargetDeviceJetsonNano:
                return @"jetson_nano";
            case AWSSagemakerTargetDeviceJetsonXavier:
                return @"jetson_xavier";
            case AWSSagemakerTargetDeviceRasp3b:
                return @"rasp3b";
            case AWSSagemakerTargetDeviceImx8qm:
                return @"imx8qm";
            case AWSSagemakerTargetDeviceDeeplens:
                return @"deeplens";
            case AWSSagemakerTargetDeviceRk3399:
                return @"rk3399";
            case AWSSagemakerTargetDeviceRk3288:
                return @"rk3288";
            case AWSSagemakerTargetDeviceAisage:
                return @"aisage";
            case AWSSagemakerTargetDeviceSbeC:
                return @"sbe_c";
            case AWSSagemakerTargetDeviceQcs605:
                return @"qcs605";
            case AWSSagemakerTargetDeviceQcs603:
                return @"qcs603";
            case AWSSagemakerTargetDeviceSitaraAm57x:
                return @"sitara_am57x";
            case AWSSagemakerTargetDeviceAmbaCv22:
                return @"amba_cv22";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerOutputDataConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"s3OutputPath" : @"S3OutputPath",
             };
}

@end

@implementation AWSSagemakerParameterRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"categoricalParameterRangeSpecification" : @"CategoricalParameterRangeSpecification",
             @"continuousParameterRangeSpecification" : @"ContinuousParameterRangeSpecification",
             @"integerParameterRangeSpecification" : @"IntegerParameterRangeSpecification",
             };
}

+ (NSValueTransformer *)categoricalParameterRangeSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerCategoricalParameterRangeSpecification class]];
}

+ (NSValueTransformer *)continuousParameterRangeSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerContinuousParameterRangeSpecification class]];
}

+ (NSValueTransformer *)integerParameterRangeSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerIntegerParameterRangeSpecification class]];
}

@end

@implementation AWSSagemakerParameterRanges

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"categoricalParameterRanges" : @"CategoricalParameterRanges",
             @"continuousParameterRanges" : @"ContinuousParameterRanges",
             @"integerParameterRanges" : @"IntegerParameterRanges",
             };
}

+ (NSValueTransformer *)categoricalParameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerCategoricalParameterRange class]];
}

+ (NSValueTransformer *)continuousParameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerContinuousParameterRange class]];
}

+ (NSValueTransformer *)integerParameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerIntegerParameterRange class]];
}

@end

@implementation AWSSagemakerParent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentName" : @"ExperimentName",
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSSagemakerParentHyperParameterTuningJob

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hyperParameterTuningJobName" : @"HyperParameterTuningJobName",
             };
}

@end

@implementation AWSSagemakerProcessingClusterConfig

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
            return @(AWSSagemakerProcessingInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.large"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR58xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR516xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.24xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingInstanceTypeMlR524xlarge);
        }
        return @(AWSSagemakerProcessingInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerProcessingInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSSagemakerProcessingInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSSagemakerProcessingInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSSagemakerProcessingInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSSagemakerProcessingInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSSagemakerProcessingInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSagemakerProcessingInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSagemakerProcessingInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSSagemakerProcessingInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSagemakerProcessingInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR5Large:
                return @"ml.r5.large";
            case AWSSagemakerProcessingInstanceTypeMlR5Xlarge:
                return @"ml.r5.xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR52xlarge:
                return @"ml.r5.2xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR54xlarge:
                return @"ml.r5.4xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR58xlarge:
                return @"ml.r5.8xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR512xlarge:
                return @"ml.r5.12xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR516xlarge:
                return @"ml.r5.16xlarge";
            case AWSSagemakerProcessingInstanceTypeMlR524xlarge:
                return @"ml.r5.24xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerProcessingInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputName" : @"InputName",
             @"s3Input" : @"S3Input",
             };
}

+ (NSValueTransformer *)s3InputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerProcessingS3Input class]];
}

@end

@implementation AWSSagemakerProcessingJob

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAppSpecification class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerExperimentConfig class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)networkConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerNetworkConfig class]];
}

+ (NSValueTransformer *)processingEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)processingInputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerProcessingInput class]];
}

+ (NSValueTransformer *)processingJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingJobStatusStopped);
        }
        return @(AWSSagemakerProcessingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerProcessingJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerProcessingJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerProcessingJobStatusFailed:
                return @"Failed";
            case AWSSagemakerProcessingJobStatusStopping:
                return @"Stopping";
            case AWSSagemakerProcessingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)processingOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerProcessingOutputConfig class]];
}

+ (NSValueTransformer *)processingResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerProcessingResources class]];
}

+ (NSValueTransformer *)processingStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerProcessingStoppingCondition class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerProcessingJobSummary

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
            return @(AWSSagemakerProcessingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingJobStatusStopped);
        }
        return @(AWSSagemakerProcessingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerProcessingJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerProcessingJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerProcessingJobStatusFailed:
                return @"Failed";
            case AWSSagemakerProcessingJobStatusStopping:
                return @"Stopping";
            case AWSSagemakerProcessingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerProcessingOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputName" : @"OutputName",
             @"s3Output" : @"S3Output",
             };
}

+ (NSValueTransformer *)s3OutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerProcessingS3Output class]];
}

@end

@implementation AWSSagemakerProcessingOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"outputs" : @"Outputs",
             };
}

+ (NSValueTransformer *)outputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerProcessingOutput class]];
}

@end

@implementation AWSSagemakerProcessingResources

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterConfig" : @"ClusterConfig",
             };
}

+ (NSValueTransformer *)clusterConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerProcessingClusterConfig class]];
}

@end

@implementation AWSSagemakerProcessingS3Input

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
            return @(AWSSagemakerProcessingS3CompressionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"Gzip"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingS3CompressionTypeGzip);
        }
        return @(AWSSagemakerProcessingS3CompressionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerProcessingS3CompressionTypeNone:
                return @"None";
            case AWSSagemakerProcessingS3CompressionTypeGzip:
                return @"Gzip";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3DataDistributionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FullyReplicated"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingS3DataDistributionTypeFullyReplicated);
        }
        if ([value caseInsensitiveCompare:@"ShardedByS3Key"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingS3DataDistributionTypeShardedByS3Key);
        }
        return @(AWSSagemakerProcessingS3DataDistributionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerProcessingS3DataDistributionTypeFullyReplicated:
                return @"FullyReplicated";
            case AWSSagemakerProcessingS3DataDistributionTypeShardedByS3Key:
                return @"ShardedByS3Key";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3DataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ManifestFile"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingS3DataTypeManifestFile);
        }
        if ([value caseInsensitiveCompare:@"S3Prefix"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingS3DataTypeS3Prefix);
        }
        return @(AWSSagemakerProcessingS3DataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerProcessingS3DataTypeManifestFile:
                return @"ManifestFile";
            case AWSSagemakerProcessingS3DataTypeS3Prefix:
                return @"S3Prefix";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3InputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pipe"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingS3InputModePipe);
        }
        if ([value caseInsensitiveCompare:@"File"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingS3InputModeFile);
        }
        return @(AWSSagemakerProcessingS3InputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerProcessingS3InputModePipe:
                return @"Pipe";
            case AWSSagemakerProcessingS3InputModeFile:
                return @"File";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerProcessingS3Output

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
            return @(AWSSagemakerProcessingS3UploadModeContinuous);
        }
        if ([value caseInsensitiveCompare:@"EndOfJob"] == NSOrderedSame) {
            return @(AWSSagemakerProcessingS3UploadModeEndOfJob);
        }
        return @(AWSSagemakerProcessingS3UploadModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerProcessingS3UploadModeContinuous:
                return @"Continuous";
            case AWSSagemakerProcessingS3UploadModeEndOfJob:
                return @"EndOfJob";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerProcessingStoppingCondition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxRuntimeInSeconds" : @"MaxRuntimeInSeconds",
             };
}

@end

@implementation AWSSagemakerProductionVariant

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
            return @(AWSSagemakerProductionVariantAcceleratorTypeMlEia1Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.eia1.large"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantAcceleratorTypeMlEia1Large);
        }
        if ([value caseInsensitiveCompare:@"ml.eia1.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantAcceleratorTypeMlEia1Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.eia2.medium"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantAcceleratorTypeMlEia2Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.eia2.large"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantAcceleratorTypeMlEia2Large);
        }
        if ([value caseInsensitiveCompare:@"ml.eia2.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantAcceleratorTypeMlEia2Xlarge);
        }
        return @(AWSSagemakerProductionVariantAcceleratorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerProductionVariantAcceleratorTypeMlEia1Medium:
                return @"ml.eia1.medium";
            case AWSSagemakerProductionVariantAcceleratorTypeMlEia1Large:
                return @"ml.eia1.large";
            case AWSSagemakerProductionVariantAcceleratorTypeMlEia1Xlarge:
                return @"ml.eia1.xlarge";
            case AWSSagemakerProductionVariantAcceleratorTypeMlEia2Medium:
                return @"ml.eia2.medium";
            case AWSSagemakerProductionVariantAcceleratorTypeMlEia2Large:
                return @"ml.eia2.large";
            case AWSSagemakerProductionVariantAcceleratorTypeMlEia2Xlarge:
                return @"ml.eia2.xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ml.t2.medium"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlT2Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.large"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlT2Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlT2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlT22xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5d.large"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlM5dLarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5d.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlM5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5d.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlM5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5d.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlM5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5d.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlM5d12xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5d.24xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlM5d24xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.large"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlC4Large);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.large"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlC5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.large"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlC5dLarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlC5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlC5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlC5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.9xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlC5d9xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.18xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlC5d18xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlG4dnXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlG4dn2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlG4dn4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlG4dn8xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlG4dn12xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlG4dn16xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.large"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlR5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlR5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlR52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlR54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlR512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.24xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlR524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5d.large"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlR5dLarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5d.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlR5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5d.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlR5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5d.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlR5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5d.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlR5d12xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5d.24xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlR5d24xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.inf1.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlInf1Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.inf1.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlInf12xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.inf1.6xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlInf16xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.inf1.24xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerProductionVariantInstanceTypeMlInf124xlarge);
        }
        return @(AWSSagemakerProductionVariantInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerProductionVariantInstanceTypeMlT2Medium:
                return @"ml.t2.medium";
            case AWSSagemakerProductionVariantInstanceTypeMlT2Large:
                return @"ml.t2.large";
            case AWSSagemakerProductionVariantInstanceTypeMlT2Xlarge:
                return @"ml.t2.xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlT22xlarge:
                return @"ml.t2.2xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSSagemakerProductionVariantInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlM5dLarge:
                return @"ml.m5d.large";
            case AWSSagemakerProductionVariantInstanceTypeMlM5dXlarge:
                return @"ml.m5d.xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlM5d2xlarge:
                return @"ml.m5d.2xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlM5d4xlarge:
                return @"ml.m5d.4xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlM5d12xlarge:
                return @"ml.m5d.12xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlM5d24xlarge:
                return @"ml.m5d.24xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlC4Large:
                return @"ml.c4.large";
            case AWSSagemakerProductionVariantInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlC5Large:
                return @"ml.c5.large";
            case AWSSagemakerProductionVariantInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlC5dLarge:
                return @"ml.c5d.large";
            case AWSSagemakerProductionVariantInstanceTypeMlC5dXlarge:
                return @"ml.c5d.xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlC5d2xlarge:
                return @"ml.c5d.2xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlC5d4xlarge:
                return @"ml.c5d.4xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlC5d9xlarge:
                return @"ml.c5d.9xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlC5d18xlarge:
                return @"ml.c5d.18xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlG4dnXlarge:
                return @"ml.g4dn.xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlG4dn2xlarge:
                return @"ml.g4dn.2xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlG4dn4xlarge:
                return @"ml.g4dn.4xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlG4dn8xlarge:
                return @"ml.g4dn.8xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlG4dn12xlarge:
                return @"ml.g4dn.12xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlG4dn16xlarge:
                return @"ml.g4dn.16xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlR5Large:
                return @"ml.r5.large";
            case AWSSagemakerProductionVariantInstanceTypeMlR5Xlarge:
                return @"ml.r5.xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlR52xlarge:
                return @"ml.r5.2xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlR54xlarge:
                return @"ml.r5.4xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlR512xlarge:
                return @"ml.r5.12xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlR524xlarge:
                return @"ml.r5.24xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlR5dLarge:
                return @"ml.r5d.large";
            case AWSSagemakerProductionVariantInstanceTypeMlR5dXlarge:
                return @"ml.r5d.xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlR5d2xlarge:
                return @"ml.r5d.2xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlR5d4xlarge:
                return @"ml.r5d.4xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlR5d12xlarge:
                return @"ml.r5d.12xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlR5d24xlarge:
                return @"ml.r5d.24xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlInf1Xlarge:
                return @"ml.inf1.xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlInf12xlarge:
                return @"ml.inf1.2xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlInf16xlarge:
                return @"ml.inf1.6xlarge";
            case AWSSagemakerProductionVariantInstanceTypeMlInf124xlarge:
                return @"ml.inf1.24xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerProductionVariantSummary

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerDeployedImage class]];
}

@end

@implementation AWSSagemakerPropertyNameQuery

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"propertyNameHint" : @"PropertyNameHint",
             };
}

@end

@implementation AWSSagemakerPropertyNameSuggestion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"propertyName" : @"PropertyName",
             };
}

@end

@implementation AWSSagemakerPublicWorkforceTaskPrice

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amountInUsd" : @"AmountInUsd",
             };
}

+ (NSValueTransformer *)amountInUsdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUSD class]];
}

@end

@implementation AWSSagemakerRenderUiTemplateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanTaskUiArn" : @"HumanTaskUiArn",
             @"roleArn" : @"RoleArn",
             @"task" : @"Task",
             @"uiTemplate" : @"UiTemplate",
             };
}

+ (NSValueTransformer *)taskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerRenderableTask class]];
}

+ (NSValueTransformer *)uiTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUiTemplate class]];
}

@end

@implementation AWSSagemakerRenderUiTemplateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             @"renderedContent" : @"RenderedContent",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerRenderingError class]];
}

@end

@implementation AWSSagemakerRenderableTask

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"input" : @"Input",
             };
}

@end

@implementation AWSSagemakerRenderingError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

@end

@implementation AWSSagemakerResolvedAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLJobObjective" : @"AutoMLJobObjective",
             @"completionCriteria" : @"CompletionCriteria",
             @"problemType" : @"ProblemType",
             };
}

+ (NSValueTransformer *)autoMLJobObjectiveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAutoMLJobObjective class]];
}

+ (NSValueTransformer *)completionCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAutoMLJobCompletionCriteria class]];
}

+ (NSValueTransformer *)problemTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BinaryClassification"] == NSOrderedSame) {
            return @(AWSSagemakerProblemTypeBinaryClassification);
        }
        if ([value caseInsensitiveCompare:@"MulticlassClassification"] == NSOrderedSame) {
            return @(AWSSagemakerProblemTypeMulticlassClassification);
        }
        if ([value caseInsensitiveCompare:@"Regression"] == NSOrderedSame) {
            return @(AWSSagemakerProblemTypeRegression);
        }
        return @(AWSSagemakerProblemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerProblemTypeBinaryClassification:
                return @"BinaryClassification";
            case AWSSagemakerProblemTypeMulticlassClassification:
                return @"MulticlassClassification";
            case AWSSagemakerProblemTypeRegression:
                return @"Regression";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerResourceConfig

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
            return @(AWSSagemakerTrainingInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlG4dnXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlG4dn2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlG4dn4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlG4dn8xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlG4dn12xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlG4dn16xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3dn.24xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlP3dn24xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5n.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlC5nXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5n.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlC5n2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5n.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlC5n4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5n.9xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlC5n9xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5n.18xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInstanceTypeMlC5n18xlarge);
        }
        return @(AWSSagemakerTrainingInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerTrainingInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSSagemakerTrainingInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSSagemakerTrainingInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSSagemakerTrainingInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSSagemakerTrainingInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSSagemakerTrainingInstanceTypeMlG4dnXlarge:
                return @"ml.g4dn.xlarge";
            case AWSSagemakerTrainingInstanceTypeMlG4dn2xlarge:
                return @"ml.g4dn.2xlarge";
            case AWSSagemakerTrainingInstanceTypeMlG4dn4xlarge:
                return @"ml.g4dn.4xlarge";
            case AWSSagemakerTrainingInstanceTypeMlG4dn8xlarge:
                return @"ml.g4dn.8xlarge";
            case AWSSagemakerTrainingInstanceTypeMlG4dn12xlarge:
                return @"ml.g4dn.12xlarge";
            case AWSSagemakerTrainingInstanceTypeMlG4dn16xlarge:
                return @"ml.g4dn.16xlarge";
            case AWSSagemakerTrainingInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSSagemakerTrainingInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSagemakerTrainingInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSagemakerTrainingInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSagemakerTrainingInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSagemakerTrainingInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSSagemakerTrainingInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSSagemakerTrainingInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSSagemakerTrainingInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSSagemakerTrainingInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSSagemakerTrainingInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSSagemakerTrainingInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSSagemakerTrainingInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSSagemakerTrainingInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSagemakerTrainingInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSagemakerTrainingInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSSagemakerTrainingInstanceTypeMlP3dn24xlarge:
                return @"ml.p3dn.24xlarge";
            case AWSSagemakerTrainingInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSagemakerTrainingInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSagemakerTrainingInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSagemakerTrainingInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSagemakerTrainingInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSagemakerTrainingInstanceTypeMlC5nXlarge:
                return @"ml.c5n.xlarge";
            case AWSSagemakerTrainingInstanceTypeMlC5n2xlarge:
                return @"ml.c5n.2xlarge";
            case AWSSagemakerTrainingInstanceTypeMlC5n4xlarge:
                return @"ml.c5n.4xlarge";
            case AWSSagemakerTrainingInstanceTypeMlC5n9xlarge:
                return @"ml.c5n.9xlarge";
            case AWSSagemakerTrainingInstanceTypeMlC5n18xlarge:
                return @"ml.c5n.18xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerResourceLimits

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxNumberOfTrainingJobs" : @"MaxNumberOfTrainingJobs",
             @"maxParallelTrainingJobs" : @"MaxParallelTrainingJobs",
             };
}

@end

@implementation AWSSagemakerResourceSpec

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceType" : @"InstanceType",
             @"sageMakerImageArn" : @"SageMakerImageArn",
             };
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"system"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeSystem);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.micro"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlT3Micro);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.small"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlT3Small);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.medium"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlM58xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlM516xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.large"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlC5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlC512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.24xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlC524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlG4dnXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlG4dn2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlG4dn4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlG4dn8xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlG4dn12xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerAppInstanceTypeMlG4dn16xlarge);
        }
        return @(AWSSagemakerAppInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAppInstanceTypeSystem:
                return @"system";
            case AWSSagemakerAppInstanceTypeMlT3Micro:
                return @"ml.t3.micro";
            case AWSSagemakerAppInstanceTypeMlT3Small:
                return @"ml.t3.small";
            case AWSSagemakerAppInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSSagemakerAppInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSSagemakerAppInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSSagemakerAppInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSSagemakerAppInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSSagemakerAppInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSagemakerAppInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSagemakerAppInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSagemakerAppInstanceTypeMlM58xlarge:
                return @"ml.m5.8xlarge";
            case AWSSagemakerAppInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSagemakerAppInstanceTypeMlM516xlarge:
                return @"ml.m5.16xlarge";
            case AWSSagemakerAppInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSSagemakerAppInstanceTypeMlC5Large:
                return @"ml.c5.large";
            case AWSSagemakerAppInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSagemakerAppInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSagemakerAppInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSagemakerAppInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSagemakerAppInstanceTypeMlC512xlarge:
                return @"ml.c5.12xlarge";
            case AWSSagemakerAppInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSagemakerAppInstanceTypeMlC524xlarge:
                return @"ml.c5.24xlarge";
            case AWSSagemakerAppInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSagemakerAppInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSagemakerAppInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSSagemakerAppInstanceTypeMlG4dnXlarge:
                return @"ml.g4dn.xlarge";
            case AWSSagemakerAppInstanceTypeMlG4dn2xlarge:
                return @"ml.g4dn.2xlarge";
            case AWSSagemakerAppInstanceTypeMlG4dn4xlarge:
                return @"ml.g4dn.4xlarge";
            case AWSSagemakerAppInstanceTypeMlG4dn8xlarge:
                return @"ml.g4dn.8xlarge";
            case AWSSagemakerAppInstanceTypeMlG4dn12xlarge:
                return @"ml.g4dn.12xlarge";
            case AWSSagemakerAppInstanceTypeMlG4dn16xlarge:
                return @"ml.g4dn.16xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerRetentionPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"homeEfsFileSystem" : @"HomeEfsFileSystem",
             };
}

+ (NSValueTransformer *)homeEfsFileSystemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Retain"] == NSOrderedSame) {
            return @(AWSSagemakerRetentionTypeRetain);
        }
        if ([value caseInsensitiveCompare:@"Delete"] == NSOrderedSame) {
            return @(AWSSagemakerRetentionTypeDelete);
        }
        return @(AWSSagemakerRetentionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerRetentionTypeRetain:
                return @"Retain";
            case AWSSagemakerRetentionTypeDelete:
                return @"Delete";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerS3DataSource

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
            return @(AWSSagemakerS3DataDistributionFullyReplicated);
        }
        if ([value caseInsensitiveCompare:@"ShardedByS3Key"] == NSOrderedSame) {
            return @(AWSSagemakerS3DataDistributionShardedByS3Key);
        }
        return @(AWSSagemakerS3DataDistributionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerS3DataDistributionFullyReplicated:
                return @"FullyReplicated";
            case AWSSagemakerS3DataDistributionShardedByS3Key:
                return @"ShardedByS3Key";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3DataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ManifestFile"] == NSOrderedSame) {
            return @(AWSSagemakerS3DataTypeManifestFile);
        }
        if ([value caseInsensitiveCompare:@"S3Prefix"] == NSOrderedSame) {
            return @(AWSSagemakerS3DataTypeS3Prefix);
        }
        if ([value caseInsensitiveCompare:@"AugmentedManifestFile"] == NSOrderedSame) {
            return @(AWSSagemakerS3DataTypeAugmentedManifestFile);
        }
        return @(AWSSagemakerS3DataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerS3DataTypeManifestFile:
                return @"ManifestFile";
            case AWSSagemakerS3DataTypeS3Prefix:
                return @"S3Prefix";
            case AWSSagemakerS3DataTypeAugmentedManifestFile:
                return @"AugmentedManifestFile";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerScheduleConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduleExpression" : @"ScheduleExpression",
             };
}

@end

@implementation AWSSagemakerSearchExpression

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"nestedFilters" : @"NestedFilters",
             @"operator" : @"Operator",
             @"subExpressions" : @"SubExpressions",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerFilter class]];
}

+ (NSValueTransformer *)nestedFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerNestedFilters class]];
}

+ (NSValueTransformer *)operatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"And"] == NSOrderedSame) {
            return @(AWSSagemakerBooleanOperatorAnd);
        }
        if ([value caseInsensitiveCompare:@"Or"] == NSOrderedSame) {
            return @(AWSSagemakerBooleanOperatorOr);
        }
        return @(AWSSagemakerBooleanOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerBooleanOperatorAnd:
                return @"And";
            case AWSSagemakerBooleanOperatorOr:
                return @"Or";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)subExpressionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerSearchExpression class]];
}

@end

@implementation AWSSagemakerSearchRecord

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experiment" : @"Experiment",
             @"trainingJob" : @"TrainingJob",
             @"trial" : @"Trial",
             @"trialComponent" : @"TrialComponent",
             };
}

+ (NSValueTransformer *)experimentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerExperiment class]];
}

+ (NSValueTransformer *)trainingJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrainingJob class]];
}

+ (NSValueTransformer *)trialJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrial class]];
}

+ (NSValueTransformer *)trialComponentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrialComponent class]];
}

@end

@implementation AWSSagemakerSearchRequest

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
            return @(AWSSagemakerResourceTypeTrainingJob);
        }
        if ([value caseInsensitiveCompare:@"Experiment"] == NSOrderedSame) {
            return @(AWSSagemakerResourceTypeExperiment);
        }
        if ([value caseInsensitiveCompare:@"ExperimentTrial"] == NSOrderedSame) {
            return @(AWSSagemakerResourceTypeExperimentTrial);
        }
        if ([value caseInsensitiveCompare:@"ExperimentTrialComponent"] == NSOrderedSame) {
            return @(AWSSagemakerResourceTypeExperimentTrialComponent);
        }
        return @(AWSSagemakerResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerResourceTypeTrainingJob:
                return @"TrainingJob";
            case AWSSagemakerResourceTypeExperiment:
                return @"Experiment";
            case AWSSagemakerResourceTypeExperimentTrial:
                return @"ExperimentTrial";
            case AWSSagemakerResourceTypeExperimentTrialComponent:
                return @"ExperimentTrialComponent";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)searchExpressionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerSearchExpression class]];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSagemakerSearchSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSagemakerSearchSortOrderDescending);
        }
        return @(AWSSagemakerSearchSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSearchSortOrderAscending:
                return @"Ascending";
            case AWSSagemakerSearchSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerSearchResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"results" : @"Results",
             };
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerSearchRecord class]];
}

@end

@implementation AWSSagemakerSecondaryStatusTransition

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
            return @(AWSSagemakerSecondaryStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"LaunchingMLInstances"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusLaunchingMLInstances);
        }
        if ([value caseInsensitiveCompare:@"PreparingTrainingStack"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusPreparingTrainingStack);
        }
        if ([value caseInsensitiveCompare:@"Downloading"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusDownloading);
        }
        if ([value caseInsensitiveCompare:@"DownloadingTrainingImage"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusDownloadingTrainingImage);
        }
        if ([value caseInsensitiveCompare:@"Training"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusTraining);
        }
        if ([value caseInsensitiveCompare:@"Uploading"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusUploading);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"MaxRuntimeExceeded"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusMaxRuntimeExceeded);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Interrupted"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusInterrupted);
        }
        if ([value caseInsensitiveCompare:@"MaxWaitTimeExceeded"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusMaxWaitTimeExceeded);
        }
        return @(AWSSagemakerSecondaryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSecondaryStatusStarting:
                return @"Starting";
            case AWSSagemakerSecondaryStatusLaunchingMLInstances:
                return @"LaunchingMLInstances";
            case AWSSagemakerSecondaryStatusPreparingTrainingStack:
                return @"PreparingTrainingStack";
            case AWSSagemakerSecondaryStatusDownloading:
                return @"Downloading";
            case AWSSagemakerSecondaryStatusDownloadingTrainingImage:
                return @"DownloadingTrainingImage";
            case AWSSagemakerSecondaryStatusTraining:
                return @"Training";
            case AWSSagemakerSecondaryStatusUploading:
                return @"Uploading";
            case AWSSagemakerSecondaryStatusStopping:
                return @"Stopping";
            case AWSSagemakerSecondaryStatusStopped:
                return @"Stopped";
            case AWSSagemakerSecondaryStatusMaxRuntimeExceeded:
                return @"MaxRuntimeExceeded";
            case AWSSagemakerSecondaryStatusCompleted:
                return @"Completed";
            case AWSSagemakerSecondaryStatusFailed:
                return @"Failed";
            case AWSSagemakerSecondaryStatusInterrupted:
                return @"Interrupted";
            case AWSSagemakerSecondaryStatusMaxWaitTimeExceeded:
                return @"MaxWaitTimeExceeded";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerSharingSettings

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
            return @(AWSSagemakerNotebookOutputOptionAllowed);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSSagemakerNotebookOutputOptionDisabled);
        }
        return @(AWSSagemakerNotebookOutputOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerNotebookOutputOptionAllowed:
                return @"Allowed";
            case AWSSagemakerNotebookOutputOptionDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerShuffleConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"seed" : @"Seed",
             };
}

@end

@implementation AWSSagemakerSourceAlgorithm

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmName" : @"AlgorithmName",
             @"modelDataUrl" : @"ModelDataUrl",
             };
}

@end

@implementation AWSSagemakerSourceAlgorithmSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceAlgorithms" : @"SourceAlgorithms",
             };
}

+ (NSValueTransformer *)sourceAlgorithmsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerSourceAlgorithm class]];
}

@end

@implementation AWSSagemakerSourceIpConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrs" : @"Cidrs",
             };
}

@end

@implementation AWSSagemakerStartMonitoringScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             };
}

@end

@implementation AWSSagemakerStartNotebookInstanceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceName" : @"NotebookInstanceName",
             };
}

@end

@implementation AWSSagemakerStopAutoMLJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLJobName" : @"AutoMLJobName",
             };
}

@end

@implementation AWSSagemakerStopCompilationJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compilationJobName" : @"CompilationJobName",
             };
}

@end

@implementation AWSSagemakerStopHyperParameterTuningJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hyperParameterTuningJobName" : @"HyperParameterTuningJobName",
             };
}

@end

@implementation AWSSagemakerStopLabelingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelingJobName" : @"LabelingJobName",
             };
}

@end

@implementation AWSSagemakerStopMonitoringScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             };
}

@end

@implementation AWSSagemakerStopNotebookInstanceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceName" : @"NotebookInstanceName",
             };
}

@end

@implementation AWSSagemakerStopProcessingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"processingJobName" : @"ProcessingJobName",
             };
}

@end

@implementation AWSSagemakerStopTrainingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trainingJobName" : @"TrainingJobName",
             };
}

@end

@implementation AWSSagemakerStopTransformJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformJobName" : @"TransformJobName",
             };
}

@end

@implementation AWSSagemakerStoppingCondition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxRuntimeInSeconds" : @"MaxRuntimeInSeconds",
             @"maxWaitTimeInSeconds" : @"MaxWaitTimeInSeconds",
             };
}

@end

@implementation AWSSagemakerSubscribedWorkteam

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

@implementation AWSSagemakerSuggestionQuery

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"propertyNameQuery" : @"PropertyNameQuery",
             };
}

+ (NSValueTransformer *)propertyNameQueryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerPropertyNameQuery class]];
}

@end

@implementation AWSSagemakerTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSSagemakerTensorBoardAppSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultResourceSpec" : @"DefaultResourceSpec",
             };
}

+ (NSValueTransformer *)defaultResourceSpecJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerResourceSpec class]];
}

@end

@implementation AWSSagemakerTensorBoardOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"localPath" : @"LocalPath",
             @"s3OutputPath" : @"S3OutputPath",
             };
}

@end

@implementation AWSSagemakerTrainingJob

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerAlgorithmSpecification class]];
}

+ (NSValueTransformer *)checkpointConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerCheckpointConfig class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)debugHookConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerDebugHookConfig class]];
}

+ (NSValueTransformer *)debugRuleConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerDebugRuleConfiguration class]];
}

+ (NSValueTransformer *)debugRuleEvaluationStatusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerDebugRuleEvaluationStatus class]];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerExperimentConfig class]];
}

+ (NSValueTransformer *)finalMetricDataListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerMetricData class]];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerChannel class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)modelArtifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerModelArtifacts class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerOutputDataConfig class]];
}

+ (NSValueTransformer *)resourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerResourceConfig class]];
}

+ (NSValueTransformer *)secondaryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Starting"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"LaunchingMLInstances"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusLaunchingMLInstances);
        }
        if ([value caseInsensitiveCompare:@"PreparingTrainingStack"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusPreparingTrainingStack);
        }
        if ([value caseInsensitiveCompare:@"Downloading"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusDownloading);
        }
        if ([value caseInsensitiveCompare:@"DownloadingTrainingImage"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusDownloadingTrainingImage);
        }
        if ([value caseInsensitiveCompare:@"Training"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusTraining);
        }
        if ([value caseInsensitiveCompare:@"Uploading"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusUploading);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"MaxRuntimeExceeded"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusMaxRuntimeExceeded);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Interrupted"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusInterrupted);
        }
        if ([value caseInsensitiveCompare:@"MaxWaitTimeExceeded"] == NSOrderedSame) {
            return @(AWSSagemakerSecondaryStatusMaxWaitTimeExceeded);
        }
        return @(AWSSagemakerSecondaryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSecondaryStatusStarting:
                return @"Starting";
            case AWSSagemakerSecondaryStatusLaunchingMLInstances:
                return @"LaunchingMLInstances";
            case AWSSagemakerSecondaryStatusPreparingTrainingStack:
                return @"PreparingTrainingStack";
            case AWSSagemakerSecondaryStatusDownloading:
                return @"Downloading";
            case AWSSagemakerSecondaryStatusDownloadingTrainingImage:
                return @"DownloadingTrainingImage";
            case AWSSagemakerSecondaryStatusTraining:
                return @"Training";
            case AWSSagemakerSecondaryStatusUploading:
                return @"Uploading";
            case AWSSagemakerSecondaryStatusStopping:
                return @"Stopping";
            case AWSSagemakerSecondaryStatusStopped:
                return @"Stopped";
            case AWSSagemakerSecondaryStatusMaxRuntimeExceeded:
                return @"MaxRuntimeExceeded";
            case AWSSagemakerSecondaryStatusCompleted:
                return @"Completed";
            case AWSSagemakerSecondaryStatusFailed:
                return @"Failed";
            case AWSSagemakerSecondaryStatusInterrupted:
                return @"Interrupted";
            case AWSSagemakerSecondaryStatusMaxWaitTimeExceeded:
                return @"MaxWaitTimeExceeded";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)secondaryStatusTransitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerSecondaryStatusTransition class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerStoppingCondition class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

+ (NSValueTransformer *)tensorBoardOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTensorBoardOutputConfig class]];
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
            return @(AWSSagemakerTrainingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusStopped);
        }
        return @(AWSSagemakerTrainingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerTrainingJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerTrainingJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerTrainingJobStatusFailed:
                return @"Failed";
            case AWSSagemakerTrainingJobStatusStopping:
                return @"Stopping";
            case AWSSagemakerTrainingJobStatusStopped:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerVpcConfig class]];
}

@end

@implementation AWSSagemakerTrainingJobDefinition

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerChannel class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerOutputDataConfig class]];
}

+ (NSValueTransformer *)resourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerResourceConfig class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerStoppingCondition class]];
}

+ (NSValueTransformer *)trainingInputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pipe"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInputModePipe);
        }
        if ([value caseInsensitiveCompare:@"File"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingInputModeFile);
        }
        return @(AWSSagemakerTrainingInputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerTrainingInputModePipe:
                return @"Pipe";
            case AWSSagemakerTrainingInputModeFile:
                return @"File";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerTrainingJobStatusCounters

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

@implementation AWSSagemakerTrainingJobSummary

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
            return @(AWSSagemakerTrainingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerTrainingJobStatusStopped);
        }
        return @(AWSSagemakerTrainingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerTrainingJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerTrainingJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerTrainingJobStatusFailed:
                return @"Failed";
            case AWSSagemakerTrainingJobStatusStopping:
                return @"Stopping";
            case AWSSagemakerTrainingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerTrainingSpecification

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerMetricDefinition class]];
}

+ (NSValueTransformer *)supportedHyperParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerHyperParameterSpecification class]];
}

+ (NSValueTransformer *)supportedTuningJobObjectiveMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerHyperParameterTuningJobObjective class]];
}

+ (NSValueTransformer *)trainingChannelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerChannelSpecification class]];
}

@end

@implementation AWSSagemakerTransformDataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3DataSource" : @"S3DataSource",
             };
}

+ (NSValueTransformer *)s3DataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTransformS3DataSource class]];
}

@end

@implementation AWSSagemakerTransformInput

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
            return @(AWSSagemakerCompressionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"Gzip"] == NSOrderedSame) {
            return @(AWSSagemakerCompressionTypeGzip);
        }
        return @(AWSSagemakerCompressionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerCompressionTypeNone:
                return @"None";
            case AWSSagemakerCompressionTypeGzip:
                return @"Gzip";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTransformDataSource class]];
}

+ (NSValueTransformer *)splitTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSSagemakerSplitTypeNone);
        }
        if ([value caseInsensitiveCompare:@"Line"] == NSOrderedSame) {
            return @(AWSSagemakerSplitTypeLine);
        }
        if ([value caseInsensitiveCompare:@"RecordIO"] == NSOrderedSame) {
            return @(AWSSagemakerSplitTypeRecordIO);
        }
        if ([value caseInsensitiveCompare:@"TFRecord"] == NSOrderedSame) {
            return @(AWSSagemakerSplitTypeTFRecord);
        }
        return @(AWSSagemakerSplitTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerSplitTypeNone:
                return @"None";
            case AWSSagemakerSplitTypeLine:
                return @"Line";
            case AWSSagemakerSplitTypeRecordIO:
                return @"RecordIO";
            case AWSSagemakerSplitTypeTFRecord:
                return @"TFRecord";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerTransformJobDefinition

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
            return @(AWSSagemakerBatchStrategyMultiRecord);
        }
        if ([value caseInsensitiveCompare:@"SingleRecord"] == NSOrderedSame) {
            return @(AWSSagemakerBatchStrategySingleRecord);
        }
        return @(AWSSagemakerBatchStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerBatchStrategyMultiRecord:
                return @"MultiRecord";
            case AWSSagemakerBatchStrategySingleRecord:
                return @"SingleRecord";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transformInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTransformInput class]];
}

+ (NSValueTransformer *)transformOutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTransformOutput class]];
}

+ (NSValueTransformer *)transformResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTransformResources class]];
}

@end

@implementation AWSSagemakerTransformJobSummary

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
            return @(AWSSagemakerTransformJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerTransformJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerTransformJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerTransformJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerTransformJobStatusStopped);
        }
        return @(AWSSagemakerTransformJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerTransformJobStatusInProgress:
                return @"InProgress";
            case AWSSagemakerTransformJobStatusCompleted:
                return @"Completed";
            case AWSSagemakerTransformJobStatusFailed:
                return @"Failed";
            case AWSSagemakerTransformJobStatusStopping:
                return @"Stopping";
            case AWSSagemakerTransformJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerTransformOutput

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
            return @(AWSSagemakerAssemblyTypeNone);
        }
        if ([value caseInsensitiveCompare:@"Line"] == NSOrderedSame) {
            return @(AWSSagemakerAssemblyTypeLine);
        }
        return @(AWSSagemakerAssemblyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerAssemblyTypeNone:
                return @"None";
            case AWSSagemakerAssemblyTypeLine:
                return @"Line";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerTransformResources

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
            return @(AWSSagemakerTransformInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerTransformInstanceTypeMlM524xlarge);
        }
        return @(AWSSagemakerTransformInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerTransformInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSSagemakerTransformInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSSagemakerTransformInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSSagemakerTransformInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSSagemakerTransformInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSSagemakerTransformInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSSagemakerTransformInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSSagemakerTransformInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSSagemakerTransformInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSSagemakerTransformInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSSagemakerTransformInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSSagemakerTransformInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSSagemakerTransformInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSagemakerTransformInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSagemakerTransformInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSSagemakerTransformInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSagemakerTransformInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSagemakerTransformInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSagemakerTransformInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSagemakerTransformInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSagemakerTransformInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSSagemakerTransformInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSagemakerTransformInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSagemakerTransformInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSagemakerTransformInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSagemakerTransformInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerTransformS3DataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3DataType" : @"S3DataType",
             @"s3Uri" : @"S3Uri",
             };
}

+ (NSValueTransformer *)s3DataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ManifestFile"] == NSOrderedSame) {
            return @(AWSSagemakerS3DataTypeManifestFile);
        }
        if ([value caseInsensitiveCompare:@"S3Prefix"] == NSOrderedSame) {
            return @(AWSSagemakerS3DataTypeS3Prefix);
        }
        if ([value caseInsensitiveCompare:@"AugmentedManifestFile"] == NSOrderedSame) {
            return @(AWSSagemakerS3DataTypeAugmentedManifestFile);
        }
        return @(AWSSagemakerS3DataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerS3DataTypeManifestFile:
                return @"ManifestFile";
            case AWSSagemakerS3DataTypeS3Prefix:
                return @"S3Prefix";
            case AWSSagemakerS3DataTypeAugmentedManifestFile:
                return @"AugmentedManifestFile";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerTrial

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserContext class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserContext class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrialSource class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

+ (NSValueTransformer *)trialComponentSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTrialComponentSimpleSummary class]];
}

@end

@implementation AWSSagemakerTrialComponent

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserContext class]];
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
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSagemakerTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)lastModifiedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserContext class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)metricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTrialComponentMetricSummary class]];
}

+ (NSValueTransformer *)outputArtifactsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSagemakerTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSagemakerTrialComponentParameterValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)parentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerParent class]];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrialComponentSource class]];
}

+ (NSValueTransformer *)sourceDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrialComponentSourceDetail class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrialComponentStatus class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerTag class]];
}

@end

@implementation AWSSagemakerTrialComponentArtifact

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mediaType" : @"MediaType",
             @"value" : @"Value",
             };
}

@end

@implementation AWSSagemakerTrialComponentMetricSummary

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

@implementation AWSSagemakerTrialComponentParameterValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"numberValue" : @"NumberValue",
             @"stringValue" : @"StringValue",
             };
}

@end

@implementation AWSSagemakerTrialComponentSimpleSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserContext class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)trialComponentSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrialComponentSource class]];
}

@end

@implementation AWSSagemakerTrialComponentSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceArn" : @"SourceArn",
             @"sourceType" : @"SourceType",
             };
}

@end

@implementation AWSSagemakerTrialComponentSourceDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"processingJob" : @"ProcessingJob",
             @"sourceArn" : @"SourceArn",
             @"trainingJob" : @"TrainingJob",
             };
}

+ (NSValueTransformer *)processingJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerProcessingJob class]];
}

+ (NSValueTransformer *)trainingJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrainingJob class]];
}

@end

@implementation AWSSagemakerTrialComponentStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"primaryStatus" : @"PrimaryStatus",
             };
}

+ (NSValueTransformer *)primaryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSagemakerTrialComponentPrimaryStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSagemakerTrialComponentPrimaryStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerTrialComponentPrimaryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSagemakerTrialComponentPrimaryStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSagemakerTrialComponentPrimaryStatusStopped);
        }
        return @(AWSSagemakerTrialComponentPrimaryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerTrialComponentPrimaryStatusInProgress:
                return @"InProgress";
            case AWSSagemakerTrialComponentPrimaryStatusCompleted:
                return @"Completed";
            case AWSSagemakerTrialComponentPrimaryStatusFailed:
                return @"Failed";
            case AWSSagemakerTrialComponentPrimaryStatusStopping:
                return @"Stopping";
            case AWSSagemakerTrialComponentPrimaryStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerTrialComponentSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserContext class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserContext class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrialComponentStatus class]];
}

+ (NSValueTransformer *)trialComponentSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrialComponentSource class]];
}

@end

@implementation AWSSagemakerTrialSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceArn" : @"SourceArn",
             @"sourceType" : @"SourceType",
             };
}

@end

@implementation AWSSagemakerTrialSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrialSource class]];
}

@end

@implementation AWSSagemakerTuningJobCompletionCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetObjectiveMetricValue" : @"TargetObjectiveMetricValue",
             };
}

@end

@implementation AWSSagemakerUSD

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cents" : @"Cents",
             @"dollars" : @"Dollars",
             @"tenthFractionsOfACent" : @"TenthFractionsOfACent",
             };
}

@end

@implementation AWSSagemakerUiConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanTaskUiArn" : @"HumanTaskUiArn",
             @"uiTemplateS3Uri" : @"UiTemplateS3Uri",
             };
}

@end

@implementation AWSSagemakerUiTemplate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             };
}

@end

@implementation AWSSagemakerUiTemplateInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentSha256" : @"ContentSha256",
             @"url" : @"Url",
             };
}

@end

@implementation AWSSagemakerUpdateCodeRepositoryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositoryName" : @"CodeRepositoryName",
             @"gitConfig" : @"GitConfig",
             };
}

+ (NSValueTransformer *)gitConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerGitConfigForUpdate class]];
}

@end

@implementation AWSSagemakerUpdateCodeRepositoryOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositoryArn" : @"CodeRepositoryArn",
             };
}

@end

@implementation AWSSagemakerUpdateDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultUserSettings" : @"DefaultUserSettings",
             @"domainId" : @"DomainId",
             };
}

+ (NSValueTransformer *)defaultUserSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserSettings class]];
}

@end

@implementation AWSSagemakerUpdateDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainArn" : @"DomainArn",
             };
}

@end

@implementation AWSSagemakerUpdateEndpointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointConfigName" : @"EndpointConfigName",
             @"endpointName" : @"EndpointName",
             @"excludeRetainedVariantProperties" : @"ExcludeRetainedVariantProperties",
             @"retainAllVariantProperties" : @"RetainAllVariantProperties",
             };
}

+ (NSValueTransformer *)excludeRetainedVariantPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerVariantProperty class]];
}

@end

@implementation AWSSagemakerUpdateEndpointOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSSagemakerUpdateEndpointWeightsAndCapacitiesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"desiredWeightsAndCapacities" : @"DesiredWeightsAndCapacities",
             @"endpointName" : @"EndpointName",
             };
}

+ (NSValueTransformer *)desiredWeightsAndCapacitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerDesiredWeightAndCapacity class]];
}

@end

@implementation AWSSagemakerUpdateEndpointWeightsAndCapacitiesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSSagemakerUpdateExperimentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"displayName" : @"DisplayName",
             @"experimentName" : @"ExperimentName",
             };
}

@end

@implementation AWSSagemakerUpdateExperimentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentArn" : @"ExperimentArn",
             };
}

@end

@implementation AWSSagemakerUpdateMonitoringScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleConfig" : @"MonitoringScheduleConfig",
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             };
}

+ (NSValueTransformer *)monitoringScheduleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerMonitoringScheduleConfig class]];
}

@end

@implementation AWSSagemakerUpdateMonitoringScheduleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleArn" : @"MonitoringScheduleArn",
             };
}

@end

@implementation AWSSagemakerUpdateNotebookInstanceInput

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
            return @(AWSSagemakerInstanceTypeMlT2Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.large"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT2Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT22xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.medium"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.4xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.9xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5d9xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.18xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlC5d18xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSagemakerInstanceTypeMlP316xlarge);
        }
        return @(AWSSagemakerInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerInstanceTypeMlT2Medium:
                return @"ml.t2.medium";
            case AWSSagemakerInstanceTypeMlT2Large:
                return @"ml.t2.large";
            case AWSSagemakerInstanceTypeMlT2Xlarge:
                return @"ml.t2.xlarge";
            case AWSSagemakerInstanceTypeMlT22xlarge:
                return @"ml.t2.2xlarge";
            case AWSSagemakerInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSSagemakerInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSSagemakerInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSSagemakerInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSSagemakerInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSSagemakerInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSSagemakerInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSSagemakerInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSSagemakerInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSSagemakerInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSagemakerInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSagemakerInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSagemakerInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSagemakerInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSSagemakerInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSSagemakerInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSSagemakerInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSSagemakerInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSSagemakerInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSagemakerInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSagemakerInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSagemakerInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSagemakerInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSagemakerInstanceTypeMlC5dXlarge:
                return @"ml.c5d.xlarge";
            case AWSSagemakerInstanceTypeMlC5d2xlarge:
                return @"ml.c5d.2xlarge";
            case AWSSagemakerInstanceTypeMlC5d4xlarge:
                return @"ml.c5d.4xlarge";
            case AWSSagemakerInstanceTypeMlC5d9xlarge:
                return @"ml.c5d.9xlarge";
            case AWSSagemakerInstanceTypeMlC5d18xlarge:
                return @"ml.c5d.18xlarge";
            case AWSSagemakerInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSSagemakerInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSSagemakerInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSSagemakerInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSagemakerInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSagemakerInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rootAccessJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSSagemakerRootAccessEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSSagemakerRootAccessDisabled);
        }
        return @(AWSSagemakerRootAccessUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerRootAccessEnabled:
                return @"Enabled";
            case AWSSagemakerRootAccessDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerUpdateNotebookInstanceLifecycleConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceLifecycleConfigName" : @"NotebookInstanceLifecycleConfigName",
             @"onCreate" : @"OnCreate",
             @"onStart" : @"OnStart",
             };
}

+ (NSValueTransformer *)onCreateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerNotebookInstanceLifecycleHook class]];
}

+ (NSValueTransformer *)onStartJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerNotebookInstanceLifecycleHook class]];
}

@end

@implementation AWSSagemakerUpdateNotebookInstanceLifecycleConfigOutput

@end

@implementation AWSSagemakerUpdateNotebookInstanceOutput

@end

@implementation AWSSagemakerUpdateTrialComponentRequest

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
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSagemakerTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)outputArtifactsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSagemakerTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSagemakerTrialComponentParameterValue class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTrialComponentStatus class]];
}

@end

@implementation AWSSagemakerUpdateTrialComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentArn" : @"TrialComponentArn",
             };
}

@end

@implementation AWSSagemakerUpdateTrialRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSSagemakerUpdateTrialResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialArn" : @"TrialArn",
             };
}

@end

@implementation AWSSagemakerUpdateUserProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             @"userProfileName" : @"UserProfileName",
             @"userSettings" : @"UserSettings",
             };
}

+ (NSValueTransformer *)userSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerUserSettings class]];
}

@end

@implementation AWSSagemakerUpdateUserProfileResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userProfileArn" : @"UserProfileArn",
             };
}

@end

@implementation AWSSagemakerUpdateWorkforceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceIpConfig" : @"SourceIpConfig",
             @"workforceName" : @"WorkforceName",
             };
}

+ (NSValueTransformer *)sourceIpConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerSourceIpConfig class]];
}

@end

@implementation AWSSagemakerUpdateWorkforceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workforce" : @"Workforce",
             };
}

+ (NSValueTransformer *)workforceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerWorkforce class]];
}

@end

@implementation AWSSagemakerUpdateWorkteamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"memberDefinitions" : @"MemberDefinitions",
             @"notificationConfiguration" : @"NotificationConfiguration",
             @"workteamName" : @"WorkteamName",
             };
}

+ (NSValueTransformer *)memberDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerMemberDefinition class]];
}

+ (NSValueTransformer *)notificationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerNotificationConfiguration class]];
}

@end

@implementation AWSSagemakerUpdateWorkteamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workteam" : @"Workteam",
             };
}

+ (NSValueTransformer *)workteamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerWorkteam class]];
}

@end

@implementation AWSSagemakerUserContext

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             @"userProfileArn" : @"UserProfileArn",
             @"userProfileName" : @"UserProfileName",
             };
}

@end

@implementation AWSSagemakerUserProfileDetails

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
            return @(AWSSagemakerUserProfileStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSagemakerUserProfileStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSagemakerUserProfileStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSagemakerUserProfileStatusPending);
        }
        return @(AWSSagemakerUserProfileStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerUserProfileStatusDeleting:
                return @"Deleting";
            case AWSSagemakerUserProfileStatusFailed:
                return @"Failed";
            case AWSSagemakerUserProfileStatusInService:
                return @"InService";
            case AWSSagemakerUserProfileStatusPending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerUserSettings

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerJupyterServerAppSettings class]];
}

+ (NSValueTransformer *)kernelGatewayAppSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerKernelGatewayAppSettings class]];
}

+ (NSValueTransformer *)sharingSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerSharingSettings class]];
}

+ (NSValueTransformer *)tensorBoardAppSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerTensorBoardAppSettings class]];
}

@end

@implementation AWSSagemakerVariantProperty

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"variantPropertyType" : @"VariantPropertyType",
             };
}

+ (NSValueTransformer *)variantPropertyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSSagemakerVariantPropertyTypeDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"DesiredWeight"] == NSOrderedSame) {
            return @(AWSSagemakerVariantPropertyTypeDesiredWeight);
        }
        if ([value caseInsensitiveCompare:@"DataCaptureConfig"] == NSOrderedSame) {
            return @(AWSSagemakerVariantPropertyTypeDataCaptureConfig);
        }
        return @(AWSSagemakerVariantPropertyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSagemakerVariantPropertyTypeDesiredInstanceCount:
                return @"DesiredInstanceCount";
            case AWSSagemakerVariantPropertyTypeDesiredWeight:
                return @"DesiredWeight";
            case AWSSagemakerVariantPropertyTypeDataCaptureConfig:
                return @"DataCaptureConfig";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSagemakerVpcConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnets" : @"Subnets",
             };
}

@end

@implementation AWSSagemakerWorkforce

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerSourceIpConfig class]];
}

@end

@implementation AWSSagemakerWorkteam

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSagemakerMemberDefinition class]];
}

+ (NSValueTransformer *)notificationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSagemakerNotificationConfiguration class]];
}

@end
