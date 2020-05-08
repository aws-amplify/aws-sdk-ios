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

#import "AWSSageMakerServiceModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSSageMakerServiceErrorDomain = @"com.amazonaws.AWSSageMakerServiceErrorDomain";

@implementation AWSSageMakerServiceAddTagsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceAddTagsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceAlgorithmSpecification

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceMetricDefinition class]];
}

+ (NSValueTransformer *)trainingInputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pipe"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInputModePipe);
        }
        if ([value caseInsensitiveCompare:@"File"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInputModeFile);
        }
        return @(AWSSageMakerServiceTrainingInputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceTrainingInputModePipe:
                return @"Pipe";
            case AWSSageMakerServiceTrainingInputModeFile:
                return @"File";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceAlgorithmStatusDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageScanStatuses" : @"ImageScanStatuses",
             @"validationStatuses" : @"ValidationStatuses",
             };
}

+ (NSValueTransformer *)imageScanStatusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceAlgorithmStatusItem class]];
}

+ (NSValueTransformer *)validationStatusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceAlgorithmStatusItem class]];
}

@end

@implementation AWSSageMakerServiceAlgorithmStatusItem

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
            return @(AWSSageMakerServiceDetailedAlgorithmStatusNotStarted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceDetailedAlgorithmStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceDetailedAlgorithmStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceDetailedAlgorithmStatusFailed);
        }
        return @(AWSSageMakerServiceDetailedAlgorithmStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceDetailedAlgorithmStatusNotStarted:
                return @"NotStarted";
            case AWSSageMakerServiceDetailedAlgorithmStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceDetailedAlgorithmStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceDetailedAlgorithmStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceAlgorithmSummary

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
            return @(AWSSageMakerServiceAlgorithmStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAlgorithmStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAlgorithmStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAlgorithmStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAlgorithmStatusDeleting);
        }
        return @(AWSSageMakerServiceAlgorithmStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAlgorithmStatusPending:
                return @"Pending";
            case AWSSageMakerServiceAlgorithmStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceAlgorithmStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceAlgorithmStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceAlgorithmStatusDeleting:
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

@implementation AWSSageMakerServiceAlgorithmValidationProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"profileName" : @"ProfileName",
             @"trainingJobDefinition" : @"TrainingJobDefinition",
             @"transformJobDefinition" : @"TransformJobDefinition",
             };
}

+ (NSValueTransformer *)trainingJobDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrainingJobDefinition class]];
}

+ (NSValueTransformer *)transformJobDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTransformJobDefinition class]];
}

@end

@implementation AWSSageMakerServiceAlgorithmValidationSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"validationProfiles" : @"ValidationProfiles",
             @"validationRole" : @"ValidationRole",
             };
}

+ (NSValueTransformer *)validationProfilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceAlgorithmValidationProfile class]];
}

@end

@implementation AWSSageMakerServiceAnnotationConsolidationConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"annotationConsolidationLambdaArn" : @"AnnotationConsolidationLambdaArn",
             };
}

@end

@implementation AWSSageMakerServiceAppDetails

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
            return @(AWSSageMakerServiceAppTypeJupyterServer);
        }
        if ([value caseInsensitiveCompare:@"KernelGateway"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppTypeKernelGateway);
        }
        if ([value caseInsensitiveCompare:@"TensorBoard"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppTypeTensorBoard);
        }
        return @(AWSSageMakerServiceAppTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAppTypeJupyterServer:
                return @"JupyterServer";
            case AWSSageMakerServiceAppTypeKernelGateway:
                return @"KernelGateway";
            case AWSSageMakerServiceAppTypeTensorBoard:
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
            return @(AWSSageMakerServiceAppStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppStatusPending);
        }
        return @(AWSSageMakerServiceAppStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAppStatusDeleted:
                return @"Deleted";
            case AWSSageMakerServiceAppStatusDeleting:
                return @"Deleting";
            case AWSSageMakerServiceAppStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceAppStatusInService:
                return @"InService";
            case AWSSageMakerServiceAppStatusPending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceAppSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"containerArguments" : @"ContainerArguments",
             @"containerEntrypoint" : @"ContainerEntrypoint",
             @"imageUri" : @"ImageUri",
             };
}

@end

@implementation AWSSageMakerServiceAssociateTrialComponentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentName" : @"TrialComponentName",
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSSageMakerServiceAssociateTrialComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialArn" : @"TrialArn",
             @"trialComponentArn" : @"TrialComponentArn",
             };
}

@end

@implementation AWSSageMakerServiceAutoMLCandidate

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
            return @(AWSSageMakerServiceCandidateStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCandidateStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCandidateStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCandidateStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCandidateStatusStopping);
        }
        return @(AWSSageMakerServiceCandidateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceCandidateStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceCandidateStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceCandidateStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceCandidateStatusStopped:
                return @"Stopped";
            case AWSSageMakerServiceCandidateStatusStopping:
                return @"Stopping";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)candidateStepsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceAutoMLCandidateStep class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceFinalAutoMLJobObjectiveMetric class]];
}

+ (NSValueTransformer *)inferenceContainersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceAutoMLContainerDefinition class]];
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
            return @(AWSSageMakerServiceObjectiveStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceObjectiveStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceObjectiveStatusFailed);
        }
        return @(AWSSageMakerServiceObjectiveStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceObjectiveStatusSucceeded:
                return @"Succeeded";
            case AWSSageMakerServiceObjectiveStatusPending:
                return @"Pending";
            case AWSSageMakerServiceObjectiveStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceAutoMLCandidateStep

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
            return @(AWSSageMakerServiceCandidateStepTypeAWSSageMakerTrainingJob);
        }
        if ([value caseInsensitiveCompare:@"AWS::SageMaker::TransformJob"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCandidateStepTypeAWSSageMakerTransformJob);
        }
        if ([value caseInsensitiveCompare:@"AWS::SageMaker::ProcessingJob"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCandidateStepTypeAWSSageMakerProcessingJob);
        }
        return @(AWSSageMakerServiceCandidateStepTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceCandidateStepTypeAWSSageMakerTrainingJob:
                return @"AWS::SageMaker::TrainingJob";
            case AWSSageMakerServiceCandidateStepTypeAWSSageMakerTransformJob:
                return @"AWS::SageMaker::TransformJob";
            case AWSSageMakerServiceCandidateStepTypeAWSSageMakerProcessingJob:
                return @"AWS::SageMaker::ProcessingJob";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceAutoMLChannel

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
            return @(AWSSageMakerServiceCompressionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"Gzip"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCompressionTypeGzip);
        }
        return @(AWSSageMakerServiceCompressionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceCompressionTypeNone:
                return @"None";
            case AWSSageMakerServiceCompressionTypeGzip:
                return @"Gzip";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAutoMLDataSource class]];
}

@end

@implementation AWSSageMakerServiceAutoMLContainerDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"environment" : @"Environment",
             @"image" : @"Image",
             @"modelDataUrl" : @"ModelDataUrl",
             };
}

@end

@implementation AWSSageMakerServiceAutoMLDataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3DataSource" : @"S3DataSource",
             };
}

+ (NSValueTransformer *)s3DataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAutoMLS3DataSource class]];
}

@end

@implementation AWSSageMakerServiceAutoMLJobArtifacts

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"candidateDefinitionNotebookLocation" : @"CandidateDefinitionNotebookLocation",
             @"dataExplorationNotebookLocation" : @"DataExplorationNotebookLocation",
             };
}

@end

@implementation AWSSageMakerServiceAutoMLJobCompletionCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxAutoMLJobRuntimeInSeconds" : @"MaxAutoMLJobRuntimeInSeconds",
             @"maxCandidates" : @"MaxCandidates",
             @"maxRuntimePerTrainingJobInSeconds" : @"MaxRuntimePerTrainingJobInSeconds",
             };
}

@end

@implementation AWSSageMakerServiceAutoMLJobConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completionCriteria" : @"CompletionCriteria",
             @"securityConfig" : @"SecurityConfig",
             };
}

+ (NSValueTransformer *)completionCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAutoMLJobCompletionCriteria class]];
}

+ (NSValueTransformer *)securityConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAutoMLSecurityConfig class]];
}

@end

@implementation AWSSageMakerServiceAutoMLJobObjective

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricName" : @"MetricName",
             };
}

+ (NSValueTransformer *)metricNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Accuracy"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLMetricEnumAccuracy);
        }
        if ([value caseInsensitiveCompare:@"MSE"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLMetricEnumMse);
        }
        if ([value caseInsensitiveCompare:@"F1"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLMetricEnumF1);
        }
        if ([value caseInsensitiveCompare:@"F1macro"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLMetricEnumF1macro);
        }
        return @(AWSSageMakerServiceAutoMLMetricEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAutoMLMetricEnumAccuracy:
                return @"Accuracy";
            case AWSSageMakerServiceAutoMLMetricEnumMse:
                return @"MSE";
            case AWSSageMakerServiceAutoMLMetricEnumF1:
                return @"F1";
            case AWSSageMakerServiceAutoMLMetricEnumF1macro:
                return @"F1macro";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceAutoMLJobSummary

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
            return @(AWSSageMakerServiceAutoMLJobSecondaryStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"AnalyzingData"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobSecondaryStatusAnalyzingData);
        }
        if ([value caseInsensitiveCompare:@"FeatureEngineering"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobSecondaryStatusFeatureEngineering);
        }
        if ([value caseInsensitiveCompare:@"ModelTuning"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobSecondaryStatusModelTuning);
        }
        if ([value caseInsensitiveCompare:@"MaxCandidatesReached"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobSecondaryStatusMaxCandidatesReached);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobSecondaryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobSecondaryStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"MaxAutoMLJobRuntimeReached"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobSecondaryStatusMaxAutoMLJobRuntimeReached);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobSecondaryStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"CandidateDefinitionsGenerated"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobSecondaryStatusCandidateDefinitionsGenerated);
        }
        return @(AWSSageMakerServiceAutoMLJobSecondaryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAutoMLJobSecondaryStatusStarting:
                return @"Starting";
            case AWSSageMakerServiceAutoMLJobSecondaryStatusAnalyzingData:
                return @"AnalyzingData";
            case AWSSageMakerServiceAutoMLJobSecondaryStatusFeatureEngineering:
                return @"FeatureEngineering";
            case AWSSageMakerServiceAutoMLJobSecondaryStatusModelTuning:
                return @"ModelTuning";
            case AWSSageMakerServiceAutoMLJobSecondaryStatusMaxCandidatesReached:
                return @"MaxCandidatesReached";
            case AWSSageMakerServiceAutoMLJobSecondaryStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceAutoMLJobSecondaryStatusStopped:
                return @"Stopped";
            case AWSSageMakerServiceAutoMLJobSecondaryStatusMaxAutoMLJobRuntimeReached:
                return @"MaxAutoMLJobRuntimeReached";
            case AWSSageMakerServiceAutoMLJobSecondaryStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceAutoMLJobSecondaryStatusCandidateDefinitionsGenerated:
                return @"CandidateDefinitionsGenerated";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)autoMLJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobStatusStopping);
        }
        return @(AWSSageMakerServiceAutoMLJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAutoMLJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceAutoMLJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceAutoMLJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceAutoMLJobStatusStopped:
                return @"Stopped";
            case AWSSageMakerServiceAutoMLJobStatusStopping:
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

@implementation AWSSageMakerServiceAutoMLOutputDataConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"s3OutputPath" : @"S3OutputPath",
             };
}

@end

@implementation AWSSageMakerServiceAutoMLS3DataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3DataType" : @"S3DataType",
             @"s3Uri" : @"S3Uri",
             };
}

+ (NSValueTransformer *)s3DataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ManifestFile"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLS3DataTypeManifestFile);
        }
        if ([value caseInsensitiveCompare:@"S3Prefix"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLS3DataTypeS3Prefix);
        }
        return @(AWSSageMakerServiceAutoMLS3DataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAutoMLS3DataTypeManifestFile:
                return @"ManifestFile";
            case AWSSageMakerServiceAutoMLS3DataTypeS3Prefix:
                return @"S3Prefix";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceAutoMLSecurityConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enableInterContainerTrafficEncryption" : @"EnableInterContainerTrafficEncryption",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceVpcConfig class]];
}

@end

@implementation AWSSageMakerServiceCaptureContentTypeHeader

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"csvContentTypes" : @"CsvContentTypes",
             @"jsonContentTypes" : @"JsonContentTypes",
             };
}

@end

@implementation AWSSageMakerServiceCaptureOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"captureMode" : @"CaptureMode",
             };
}

+ (NSValueTransformer *)captureModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Input"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCaptureModeInput);
        }
        if ([value caseInsensitiveCompare:@"Output"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCaptureModeOutput);
        }
        return @(AWSSageMakerServiceCaptureModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceCaptureModeInput:
                return @"Input";
            case AWSSageMakerServiceCaptureModeOutput:
                return @"Output";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceCategoricalParameterRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

@end

@implementation AWSSageMakerServiceCategoricalParameterRangeSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"values" : @"Values",
             };
}

@end

@implementation AWSSageMakerServiceChannel

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
            return @(AWSSageMakerServiceCompressionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"Gzip"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCompressionTypeGzip);
        }
        return @(AWSSageMakerServiceCompressionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceCompressionTypeNone:
                return @"None";
            case AWSSageMakerServiceCompressionTypeGzip:
                return @"Gzip";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceDataSource class]];
}

+ (NSValueTransformer *)inputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pipe"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInputModePipe);
        }
        if ([value caseInsensitiveCompare:@"File"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInputModeFile);
        }
        return @(AWSSageMakerServiceTrainingInputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceTrainingInputModePipe:
                return @"Pipe";
            case AWSSageMakerServiceTrainingInputModeFile:
                return @"File";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)recordWrapperTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSSageMakerServiceRecordWrapperNone);
        }
        if ([value caseInsensitiveCompare:@"RecordIO"] == NSOrderedSame) {
            return @(AWSSageMakerServiceRecordWrapperRecordIO);
        }
        return @(AWSSageMakerServiceRecordWrapperUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceRecordWrapperNone:
                return @"None";
            case AWSSageMakerServiceRecordWrapperRecordIO:
                return @"RecordIO";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)shuffleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceShuffleConfig class]];
}

@end

@implementation AWSSageMakerServiceChannelSpecification

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

@implementation AWSSageMakerServiceCheckpointConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"localPath" : @"LocalPath",
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSSageMakerServiceCodeRepositorySummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceGitConfig class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSageMakerServiceCognitoMemberDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"userGroup" : @"UserGroup",
             @"userPool" : @"UserPool",
             };
}

@end

@implementation AWSSageMakerServiceCollectionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionName" : @"CollectionName",
             @"collectionParameters" : @"CollectionParameters",
             };
}

@end

@implementation AWSSageMakerServiceCompilationJobSummary

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
            return @(AWSSageMakerServiceCompilationJobStatusInprogress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCompilationJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCompilationJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCompilationJobStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCompilationJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCompilationJobStatusStopped);
        }
        return @(AWSSageMakerServiceCompilationJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceCompilationJobStatusInprogress:
                return @"INPROGRESS";
            case AWSSageMakerServiceCompilationJobStatusCompleted:
                return @"COMPLETED";
            case AWSSageMakerServiceCompilationJobStatusFailed:
                return @"FAILED";
            case AWSSageMakerServiceCompilationJobStatusStarting:
                return @"STARTING";
            case AWSSageMakerServiceCompilationJobStatusStopping:
                return @"STOPPING";
            case AWSSageMakerServiceCompilationJobStatusStopped:
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
            return @(AWSSageMakerServiceTargetDeviceLambda);
        }
        if ([value caseInsensitiveCompare:@"ml_m4"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceMlM4);
        }
        if ([value caseInsensitiveCompare:@"ml_m5"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceMlM5);
        }
        if ([value caseInsensitiveCompare:@"ml_c4"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceMlC4);
        }
        if ([value caseInsensitiveCompare:@"ml_c5"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceMlC5);
        }
        if ([value caseInsensitiveCompare:@"ml_p2"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceMlP2);
        }
        if ([value caseInsensitiveCompare:@"ml_p3"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceMlP3);
        }
        if ([value caseInsensitiveCompare:@"ml_inf1"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceMlInf1);
        }
        if ([value caseInsensitiveCompare:@"jetson_tx1"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceJetsonTx1);
        }
        if ([value caseInsensitiveCompare:@"jetson_tx2"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceJetsonTx2);
        }
        if ([value caseInsensitiveCompare:@"jetson_nano"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceJetsonNano);
        }
        if ([value caseInsensitiveCompare:@"jetson_xavier"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceJetsonXavier);
        }
        if ([value caseInsensitiveCompare:@"rasp3b"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceRasp3b);
        }
        if ([value caseInsensitiveCompare:@"imx8qm"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceImx8qm);
        }
        if ([value caseInsensitiveCompare:@"deeplens"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceDeeplens);
        }
        if ([value caseInsensitiveCompare:@"rk3399"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceRk3399);
        }
        if ([value caseInsensitiveCompare:@"rk3288"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceRk3288);
        }
        if ([value caseInsensitiveCompare:@"aisage"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceAisage);
        }
        if ([value caseInsensitiveCompare:@"sbe_c"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceSbeC);
        }
        if ([value caseInsensitiveCompare:@"qcs605"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceQcs605);
        }
        if ([value caseInsensitiveCompare:@"qcs603"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceQcs603);
        }
        if ([value caseInsensitiveCompare:@"sitara_am57x"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceSitaraAm57x);
        }
        if ([value caseInsensitiveCompare:@"amba_cv22"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceAmbaCv22);
        }
        return @(AWSSageMakerServiceTargetDeviceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceTargetDeviceLambda:
                return @"lambda";
            case AWSSageMakerServiceTargetDeviceMlM4:
                return @"ml_m4";
            case AWSSageMakerServiceTargetDeviceMlM5:
                return @"ml_m5";
            case AWSSageMakerServiceTargetDeviceMlC4:
                return @"ml_c4";
            case AWSSageMakerServiceTargetDeviceMlC5:
                return @"ml_c5";
            case AWSSageMakerServiceTargetDeviceMlP2:
                return @"ml_p2";
            case AWSSageMakerServiceTargetDeviceMlP3:
                return @"ml_p3";
            case AWSSageMakerServiceTargetDeviceMlInf1:
                return @"ml_inf1";
            case AWSSageMakerServiceTargetDeviceJetsonTx1:
                return @"jetson_tx1";
            case AWSSageMakerServiceTargetDeviceJetsonTx2:
                return @"jetson_tx2";
            case AWSSageMakerServiceTargetDeviceJetsonNano:
                return @"jetson_nano";
            case AWSSageMakerServiceTargetDeviceJetsonXavier:
                return @"jetson_xavier";
            case AWSSageMakerServiceTargetDeviceRasp3b:
                return @"rasp3b";
            case AWSSageMakerServiceTargetDeviceImx8qm:
                return @"imx8qm";
            case AWSSageMakerServiceTargetDeviceDeeplens:
                return @"deeplens";
            case AWSSageMakerServiceTargetDeviceRk3399:
                return @"rk3399";
            case AWSSageMakerServiceTargetDeviceRk3288:
                return @"rk3288";
            case AWSSageMakerServiceTargetDeviceAisage:
                return @"aisage";
            case AWSSageMakerServiceTargetDeviceSbeC:
                return @"sbe_c";
            case AWSSageMakerServiceTargetDeviceQcs605:
                return @"qcs605";
            case AWSSageMakerServiceTargetDeviceQcs603:
                return @"qcs603";
            case AWSSageMakerServiceTargetDeviceSitaraAm57x:
                return @"sitara_am57x";
            case AWSSageMakerServiceTargetDeviceAmbaCv22:
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

@implementation AWSSageMakerServiceContainerDefinition

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
            return @(AWSSageMakerServiceContainerModeSingleModel);
        }
        if ([value caseInsensitiveCompare:@"MultiModel"] == NSOrderedSame) {
            return @(AWSSageMakerServiceContainerModeMultiModel);
        }
        return @(AWSSageMakerServiceContainerModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceContainerModeSingleModel:
                return @"SingleModel";
            case AWSSageMakerServiceContainerModeMultiModel:
                return @"MultiModel";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceContinuousParameterRange

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
            return @(AWSSageMakerServiceHyperParameterScalingTypeAuto);
        }
        if ([value caseInsensitiveCompare:@"Linear"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterScalingTypeLinear);
        }
        if ([value caseInsensitiveCompare:@"Logarithmic"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterScalingTypeLogarithmic);
        }
        if ([value caseInsensitiveCompare:@"ReverseLogarithmic"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterScalingTypeReverseLogarithmic);
        }
        return @(AWSSageMakerServiceHyperParameterScalingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceHyperParameterScalingTypeAuto:
                return @"Auto";
            case AWSSageMakerServiceHyperParameterScalingTypeLinear:
                return @"Linear";
            case AWSSageMakerServiceHyperParameterScalingTypeLogarithmic:
                return @"Logarithmic";
            case AWSSageMakerServiceHyperParameterScalingTypeReverseLogarithmic:
                return @"ReverseLogarithmic";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceContinuousParameterRangeSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxValue" : @"MaxValue",
             @"minValue" : @"MinValue",
             };
}

@end

@implementation AWSSageMakerServiceCreateAlgorithmInput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceInferenceSpecification class]];
}

+ (NSValueTransformer *)trainingSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrainingSpecification class]];
}

+ (NSValueTransformer *)validationSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAlgorithmValidationSpecification class]];
}

@end

@implementation AWSSageMakerServiceCreateAlgorithmOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmArn" : @"AlgorithmArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateAppRequest

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
            return @(AWSSageMakerServiceAppTypeJupyterServer);
        }
        if ([value caseInsensitiveCompare:@"KernelGateway"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppTypeKernelGateway);
        }
        if ([value caseInsensitiveCompare:@"TensorBoard"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppTypeTensorBoard);
        }
        return @(AWSSageMakerServiceAppTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAppTypeJupyterServer:
                return @"JupyterServer";
            case AWSSageMakerServiceAppTypeKernelGateway:
                return @"KernelGateway";
            case AWSSageMakerServiceAppTypeTensorBoard:
                return @"TensorBoard";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceSpecJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceResourceSpec class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceCreateAppResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appArn" : @"AppArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateAutoMLJobRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAutoMLJobConfig class]];
}

+ (NSValueTransformer *)autoMLJobObjectiveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAutoMLJobObjective class]];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceAutoMLChannel class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAutoMLOutputDataConfig class]];
}

+ (NSValueTransformer *)problemTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BinaryClassification"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProblemTypeBinaryClassification);
        }
        if ([value caseInsensitiveCompare:@"MulticlassClassification"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProblemTypeMulticlassClassification);
        }
        if ([value caseInsensitiveCompare:@"Regression"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProblemTypeRegression);
        }
        return @(AWSSageMakerServiceProblemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceProblemTypeBinaryClassification:
                return @"BinaryClassification";
            case AWSSageMakerServiceProblemTypeMulticlassClassification:
                return @"MulticlassClassification";
            case AWSSageMakerServiceProblemTypeRegression:
                return @"Regression";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceCreateAutoMLJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLJobArn" : @"AutoMLJobArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateCodeRepositoryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositoryName" : @"CodeRepositoryName",
             @"gitConfig" : @"GitConfig",
             };
}

+ (NSValueTransformer *)gitConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceGitConfig class]];
}

@end

@implementation AWSSageMakerServiceCreateCodeRepositoryOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositoryArn" : @"CodeRepositoryArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateCompilationJobRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceInputConfig class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceOutputConfig class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceStoppingCondition class]];
}

@end

@implementation AWSSageMakerServiceCreateCompilationJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compilationJobArn" : @"CompilationJobArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateDomainRequest

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
            return @(AWSSageMakerServiceAuthModeSso);
        }
        if ([value caseInsensitiveCompare:@"IAM"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAuthModeIam);
        }
        return @(AWSSageMakerServiceAuthModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAuthModeSso:
                return @"SSO";
            case AWSSageMakerServiceAuthModeIam:
                return @"IAM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)defaultUserSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserSettings class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceCreateDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainArn" : @"DomainArn",
             @"url" : @"Url",
             };
}

@end

@implementation AWSSageMakerServiceCreateEndpointConfigInput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceDataCaptureConfig class]];
}

+ (NSValueTransformer *)productionVariantsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceProductionVariant class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceCreateEndpointConfigOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointConfigArn" : @"EndpointConfigArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateEndpointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointConfigName" : @"EndpointConfigName",
             @"endpointName" : @"EndpointName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceCreateEndpointOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateExperimentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"displayName" : @"DisplayName",
             @"experimentName" : @"ExperimentName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceCreateExperimentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentArn" : @"ExperimentArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateFlowDefinitionRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceHumanLoopActivationConfig class]];
}

+ (NSValueTransformer *)humanLoopConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceHumanLoopConfig class]];
}

+ (NSValueTransformer *)humanLoopRequestSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceHumanLoopRequestSource class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceFlowDefinitionOutputConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceCreateFlowDefinitionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flowDefinitionArn" : @"FlowDefinitionArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateHumanTaskUiRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanTaskUiName" : @"HumanTaskUiName",
             @"tags" : @"Tags",
             @"uiTemplate" : @"UiTemplate",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

+ (NSValueTransformer *)uiTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUiTemplate class]];
}

@end

@implementation AWSSageMakerServiceCreateHumanTaskUiResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanTaskUiArn" : @"HumanTaskUiArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateHyperParameterTuningJobRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceHyperParameterTuningJobConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

+ (NSValueTransformer *)trainingJobDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceHyperParameterTrainingJobDefinition class]];
}

+ (NSValueTransformer *)trainingJobDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceHyperParameterTrainingJobDefinition class]];
}

+ (NSValueTransformer *)warmStartConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceHyperParameterTuningJobWarmStartConfig class]];
}

@end

@implementation AWSSageMakerServiceCreateHyperParameterTuningJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hyperParameterTuningJobArn" : @"HyperParameterTuningJobArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateLabelingJobRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceHumanTaskConfig class]];
}

+ (NSValueTransformer *)inputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceLabelingJobInputConfig class]];
}

+ (NSValueTransformer *)labelingJobAlgorithmsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceLabelingJobAlgorithmsConfig class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceLabelingJobOutputConfig class]];
}

+ (NSValueTransformer *)stoppingConditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceLabelingJobStoppingConditions class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceCreateLabelingJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelingJobArn" : @"LabelingJobArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateModelInput

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceContainerDefinition class]];
}

+ (NSValueTransformer *)primaryContainerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceContainerDefinition class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceVpcConfig class]];
}

@end

@implementation AWSSageMakerServiceCreateModelOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelArn" : @"ModelArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateModelPackageInput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceInferenceSpecification class]];
}

+ (NSValueTransformer *)sourceAlgorithmSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceSourceAlgorithmSpecification class]];
}

+ (NSValueTransformer *)validationSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceModelPackageValidationSpecification class]];
}

@end

@implementation AWSSageMakerServiceCreateModelPackageOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelPackageArn" : @"ModelPackageArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateMonitoringScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleConfig" : @"MonitoringScheduleConfig",
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)monitoringScheduleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceMonitoringScheduleConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceCreateMonitoringScheduleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleArn" : @"MonitoringScheduleArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateNotebookInstanceInput

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
            return @(AWSSageMakerServiceDirectInternetAccessEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSSageMakerServiceDirectInternetAccessDisabled);
        }
        return @(AWSSageMakerServiceDirectInternetAccessUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceDirectInternetAccessEnabled:
                return @"Enabled";
            case AWSSageMakerServiceDirectInternetAccessDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ml.t2.medium"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT2Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT2Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT22xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.medium"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.9xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5d9xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.18xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5d18xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP316xlarge);
        }
        return @(AWSSageMakerServiceInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceInstanceTypeMlT2Medium:
                return @"ml.t2.medium";
            case AWSSageMakerServiceInstanceTypeMlT2Large:
                return @"ml.t2.large";
            case AWSSageMakerServiceInstanceTypeMlT2Xlarge:
                return @"ml.t2.xlarge";
            case AWSSageMakerServiceInstanceTypeMlT22xlarge:
                return @"ml.t2.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSSageMakerServiceInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSSageMakerServiceInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSSageMakerServiceInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSSageMakerServiceInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSSageMakerServiceInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSSageMakerServiceInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSSageMakerServiceInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSageMakerServiceInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSageMakerServiceInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSageMakerServiceInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSSageMakerServiceInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSSageMakerServiceInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSSageMakerServiceInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSageMakerServiceInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSageMakerServiceInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSageMakerServiceInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5dXlarge:
                return @"ml.c5d.xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5d2xlarge:
                return @"ml.c5d.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5d4xlarge:
                return @"ml.c5d.4xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5d9xlarge:
                return @"ml.c5d.9xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5d18xlarge:
                return @"ml.c5d.18xlarge";
            case AWSSageMakerServiceInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSSageMakerServiceInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSSageMakerServiceInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSSageMakerServiceInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSageMakerServiceInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rootAccessJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSSageMakerServiceRootAccessEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSSageMakerServiceRootAccessDisabled);
        }
        return @(AWSSageMakerServiceRootAccessUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceRootAccessEnabled:
                return @"Enabled";
            case AWSSageMakerServiceRootAccessDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceLifecycleConfigName" : @"NotebookInstanceLifecycleConfigName",
             @"onCreate" : @"OnCreate",
             @"onStart" : @"OnStart",
             };
}

+ (NSValueTransformer *)onCreateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceNotebookInstanceLifecycleHook class]];
}

+ (NSValueTransformer *)onStartJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceNotebookInstanceLifecycleHook class]];
}

@end

@implementation AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceLifecycleConfigArn" : @"NotebookInstanceLifecycleConfigArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateNotebookInstanceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceArn" : @"NotebookInstanceArn",
             };
}

@end

@implementation AWSSageMakerServiceCreatePresignedDomainUrlRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             @"sessionExpirationDurationInSeconds" : @"SessionExpirationDurationInSeconds",
             @"userProfileName" : @"UserProfileName",
             };
}

@end

@implementation AWSSageMakerServiceCreatePresignedDomainUrlResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizedUrl" : @"AuthorizedUrl",
             };
}

@end

@implementation AWSSageMakerServiceCreatePresignedNotebookInstanceUrlInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceName" : @"NotebookInstanceName",
             @"sessionExpirationDurationInSeconds" : @"SessionExpirationDurationInSeconds",
             };
}

@end

@implementation AWSSageMakerServiceCreatePresignedNotebookInstanceUrlOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizedUrl" : @"AuthorizedUrl",
             };
}

@end

@implementation AWSSageMakerServiceCreateProcessingJobRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAppSpecification class]];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceExperimentConfig class]];
}

+ (NSValueTransformer *)networkConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceNetworkConfig class]];
}

+ (NSValueTransformer *)processingInputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceProcessingInput class]];
}

+ (NSValueTransformer *)processingOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceProcessingOutputConfig class]];
}

+ (NSValueTransformer *)processingResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceProcessingResources class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceProcessingStoppingCondition class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceCreateProcessingJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"processingJobArn" : @"ProcessingJobArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateTrainingJobRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAlgorithmSpecification class]];
}

+ (NSValueTransformer *)checkpointConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceCheckpointConfig class]];
}

+ (NSValueTransformer *)debugHookConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceDebugHookConfig class]];
}

+ (NSValueTransformer *)debugRuleConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceDebugRuleConfiguration class]];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceExperimentConfig class]];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceChannel class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceOutputDataConfig class]];
}

+ (NSValueTransformer *)resourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceResourceConfig class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceStoppingCondition class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

+ (NSValueTransformer *)tensorBoardOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTensorBoardOutputConfig class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceVpcConfig class]];
}

@end

@implementation AWSSageMakerServiceCreateTrainingJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trainingJobArn" : @"TrainingJobArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateTransformJobRequest

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
            return @(AWSSageMakerServiceBatchStrategyMultiRecord);
        }
        if ([value caseInsensitiveCompare:@"SingleRecord"] == NSOrderedSame) {
            return @(AWSSageMakerServiceBatchStrategySingleRecord);
        }
        return @(AWSSageMakerServiceBatchStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceBatchStrategyMultiRecord:
                return @"MultiRecord";
            case AWSSageMakerServiceBatchStrategySingleRecord:
                return @"SingleRecord";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dataProcessingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceDataProcessing class]];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceExperimentConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

+ (NSValueTransformer *)transformInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTransformInput class]];
}

+ (NSValueTransformer *)transformOutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTransformOutput class]];
}

+ (NSValueTransformer *)transformResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTransformResources class]];
}

@end

@implementation AWSSageMakerServiceCreateTransformJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformJobArn" : @"TransformJobArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateTrialComponentRequest

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
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSageMakerServiceTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)outputArtifactsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSageMakerServiceTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSageMakerServiceTrialComponentParameterValue class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrialComponentStatus class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceCreateTrialComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentArn" : @"TrialComponentArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateTrialRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             @"experimentName" : @"ExperimentName",
             @"tags" : @"Tags",
             @"trialName" : @"TrialName",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceCreateTrialResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialArn" : @"TrialArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateUserProfileRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

+ (NSValueTransformer *)userSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserSettings class]];
}

@end

@implementation AWSSageMakerServiceCreateUserProfileResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userProfileArn" : @"UserProfileArn",
             };
}

@end

@implementation AWSSageMakerServiceCreateWorkteamRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceMemberDefinition class]];
}

+ (NSValueTransformer *)notificationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceNotificationConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceCreateWorkteamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workteamArn" : @"WorkteamArn",
             };
}

@end

@implementation AWSSageMakerServiceDataCaptureConfig

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceCaptureContentTypeHeader class]];
}

+ (NSValueTransformer *)captureOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceCaptureOption class]];
}

@end

@implementation AWSSageMakerServiceDataCaptureConfigSummary

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
            return @(AWSSageMakerServiceCaptureStatusStarted);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCaptureStatusStopped);
        }
        return @(AWSSageMakerServiceCaptureStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceCaptureStatusStarted:
                return @"Started";
            case AWSSageMakerServiceCaptureStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceDataProcessing

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
            return @(AWSSageMakerServiceJoinSourceInput);
        }
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSSageMakerServiceJoinSourceNone);
        }
        return @(AWSSageMakerServiceJoinSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceJoinSourceInput:
                return @"Input";
            case AWSSageMakerServiceJoinSourceNone:
                return @"None";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceDataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileSystemDataSource" : @"FileSystemDataSource",
             @"s3DataSource" : @"S3DataSource",
             };
}

+ (NSValueTransformer *)fileSystemDataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceFileSystemDataSource class]];
}

+ (NSValueTransformer *)s3DataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceS3DataSource class]];
}

@end

@implementation AWSSageMakerServiceDebugHookConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionConfigurations" : @"CollectionConfigurations",
             @"hookParameters" : @"HookParameters",
             @"localPath" : @"LocalPath",
             @"s3OutputPath" : @"S3OutputPath",
             };
}

+ (NSValueTransformer *)collectionConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceCollectionConfiguration class]];
}

@end

@implementation AWSSageMakerServiceDebugRuleConfiguration

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
            return @(AWSSageMakerServiceProcessingInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR58xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR516xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.24xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR524xlarge);
        }
        return @(AWSSageMakerServiceProcessingInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceProcessingInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSSageMakerServiceProcessingInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSSageMakerServiceProcessingInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSSageMakerServiceProcessingInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR5Large:
                return @"ml.r5.large";
            case AWSSageMakerServiceProcessingInstanceTypeMlR5Xlarge:
                return @"ml.r5.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR52xlarge:
                return @"ml.r5.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR54xlarge:
                return @"ml.r5.4xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR58xlarge:
                return @"ml.r5.8xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR512xlarge:
                return @"ml.r5.12xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR516xlarge:
                return @"ml.r5.16xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR524xlarge:
                return @"ml.r5.24xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceDebugRuleEvaluationStatus

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
            return @(AWSSageMakerServiceRuleEvaluationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"NoIssuesFound"] == NSOrderedSame) {
            return @(AWSSageMakerServiceRuleEvaluationStatusNoIssuesFound);
        }
        if ([value caseInsensitiveCompare:@"IssuesFound"] == NSOrderedSame) {
            return @(AWSSageMakerServiceRuleEvaluationStatusIssuesFound);
        }
        if ([value caseInsensitiveCompare:@"Error"] == NSOrderedSame) {
            return @(AWSSageMakerServiceRuleEvaluationStatusError);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceRuleEvaluationStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceRuleEvaluationStatusStopped);
        }
        return @(AWSSageMakerServiceRuleEvaluationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceRuleEvaluationStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceRuleEvaluationStatusNoIssuesFound:
                return @"NoIssuesFound";
            case AWSSageMakerServiceRuleEvaluationStatusIssuesFound:
                return @"IssuesFound";
            case AWSSageMakerServiceRuleEvaluationStatusError:
                return @"Error";
            case AWSSageMakerServiceRuleEvaluationStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceRuleEvaluationStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceDeleteAlgorithmInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmName" : @"AlgorithmName",
             };
}

@end

@implementation AWSSageMakerServiceDeleteAppRequest

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
            return @(AWSSageMakerServiceAppTypeJupyterServer);
        }
        if ([value caseInsensitiveCompare:@"KernelGateway"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppTypeKernelGateway);
        }
        if ([value caseInsensitiveCompare:@"TensorBoard"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppTypeTensorBoard);
        }
        return @(AWSSageMakerServiceAppTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAppTypeJupyterServer:
                return @"JupyterServer";
            case AWSSageMakerServiceAppTypeKernelGateway:
                return @"KernelGateway";
            case AWSSageMakerServiceAppTypeTensorBoard:
                return @"TensorBoard";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceDeleteCodeRepositoryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositoryName" : @"CodeRepositoryName",
             };
}

@end

@implementation AWSSageMakerServiceDeleteDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             @"retentionPolicy" : @"RetentionPolicy",
             };
}

+ (NSValueTransformer *)retentionPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceRetentionPolicy class]];
}

@end

@implementation AWSSageMakerServiceDeleteEndpointConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointConfigName" : @"EndpointConfigName",
             };
}

@end

@implementation AWSSageMakerServiceDeleteEndpointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointName" : @"EndpointName",
             };
}

@end

@implementation AWSSageMakerServiceDeleteExperimentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentName" : @"ExperimentName",
             };
}

@end

@implementation AWSSageMakerServiceDeleteExperimentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentArn" : @"ExperimentArn",
             };
}

@end

@implementation AWSSageMakerServiceDeleteFlowDefinitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flowDefinitionName" : @"FlowDefinitionName",
             };
}

@end

@implementation AWSSageMakerServiceDeleteFlowDefinitionResponse

@end

@implementation AWSSageMakerServiceDeleteModelInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelName" : @"ModelName",
             };
}

@end

@implementation AWSSageMakerServiceDeleteModelPackageInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelPackageName" : @"ModelPackageName",
             };
}

@end

@implementation AWSSageMakerServiceDeleteMonitoringScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             };
}

@end

@implementation AWSSageMakerServiceDeleteNotebookInstanceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceName" : @"NotebookInstanceName",
             };
}

@end

@implementation AWSSageMakerServiceDeleteNotebookInstanceLifecycleConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceLifecycleConfigName" : @"NotebookInstanceLifecycleConfigName",
             };
}

@end

@implementation AWSSageMakerServiceDeleteTagsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSSageMakerServiceDeleteTagsOutput

@end

@implementation AWSSageMakerServiceDeleteTrialComponentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentName" : @"TrialComponentName",
             };
}

@end

@implementation AWSSageMakerServiceDeleteTrialComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentArn" : @"TrialComponentArn",
             };
}

@end

@implementation AWSSageMakerServiceDeleteTrialRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSSageMakerServiceDeleteTrialResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialArn" : @"TrialArn",
             };
}

@end

@implementation AWSSageMakerServiceDeleteUserProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             @"userProfileName" : @"UserProfileName",
             };
}

@end

@implementation AWSSageMakerServiceDeleteWorkteamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workteamName" : @"WorkteamName",
             };
}

@end

@implementation AWSSageMakerServiceDeleteWorkteamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"success" : @"Success",
             };
}

@end

@implementation AWSSageMakerServiceDeployedImage

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

@implementation AWSSageMakerServiceDescribeAlgorithmInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmName" : @"AlgorithmName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeAlgorithmOutput

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
            return @(AWSSageMakerServiceAlgorithmStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAlgorithmStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAlgorithmStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAlgorithmStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAlgorithmStatusDeleting);
        }
        return @(AWSSageMakerServiceAlgorithmStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAlgorithmStatusPending:
                return @"Pending";
            case AWSSageMakerServiceAlgorithmStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceAlgorithmStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceAlgorithmStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceAlgorithmStatusDeleting:
                return @"Deleting";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)algorithmStatusDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAlgorithmStatusDetails class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inferenceSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceInferenceSpecification class]];
}

+ (NSValueTransformer *)trainingSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrainingSpecification class]];
}

+ (NSValueTransformer *)validationSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAlgorithmValidationSpecification class]];
}

@end

@implementation AWSSageMakerServiceDescribeAppRequest

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
            return @(AWSSageMakerServiceAppTypeJupyterServer);
        }
        if ([value caseInsensitiveCompare:@"KernelGateway"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppTypeKernelGateway);
        }
        if ([value caseInsensitiveCompare:@"TensorBoard"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppTypeTensorBoard);
        }
        return @(AWSSageMakerServiceAppTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAppTypeJupyterServer:
                return @"JupyterServer";
            case AWSSageMakerServiceAppTypeKernelGateway:
                return @"KernelGateway";
            case AWSSageMakerServiceAppTypeTensorBoard:
                return @"TensorBoard";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceDescribeAppResponse

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
            return @(AWSSageMakerServiceAppTypeJupyterServer);
        }
        if ([value caseInsensitiveCompare:@"KernelGateway"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppTypeKernelGateway);
        }
        if ([value caseInsensitiveCompare:@"TensorBoard"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppTypeTensorBoard);
        }
        return @(AWSSageMakerServiceAppTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAppTypeJupyterServer:
                return @"JupyterServer";
            case AWSSageMakerServiceAppTypeKernelGateway:
                return @"KernelGateway";
            case AWSSageMakerServiceAppTypeTensorBoard:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceResourceSpec class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Deleted"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppStatusPending);
        }
        return @(AWSSageMakerServiceAppStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAppStatusDeleted:
                return @"Deleted";
            case AWSSageMakerServiceAppStatusDeleting:
                return @"Deleting";
            case AWSSageMakerServiceAppStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceAppStatusInService:
                return @"InService";
            case AWSSageMakerServiceAppStatusPending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceDescribeAutoMLJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLJobName" : @"AutoMLJobName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeAutoMLJobResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAutoMLJobArtifacts class]];
}

+ (NSValueTransformer *)autoMLJobConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAutoMLJobConfig class]];
}

+ (NSValueTransformer *)autoMLJobObjectiveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAutoMLJobObjective class]];
}

+ (NSValueTransformer *)autoMLJobSecondaryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Starting"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobSecondaryStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"AnalyzingData"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobSecondaryStatusAnalyzingData);
        }
        if ([value caseInsensitiveCompare:@"FeatureEngineering"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobSecondaryStatusFeatureEngineering);
        }
        if ([value caseInsensitiveCompare:@"ModelTuning"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobSecondaryStatusModelTuning);
        }
        if ([value caseInsensitiveCompare:@"MaxCandidatesReached"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobSecondaryStatusMaxCandidatesReached);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobSecondaryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobSecondaryStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"MaxAutoMLJobRuntimeReached"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobSecondaryStatusMaxAutoMLJobRuntimeReached);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobSecondaryStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"CandidateDefinitionsGenerated"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobSecondaryStatusCandidateDefinitionsGenerated);
        }
        return @(AWSSageMakerServiceAutoMLJobSecondaryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAutoMLJobSecondaryStatusStarting:
                return @"Starting";
            case AWSSageMakerServiceAutoMLJobSecondaryStatusAnalyzingData:
                return @"AnalyzingData";
            case AWSSageMakerServiceAutoMLJobSecondaryStatusFeatureEngineering:
                return @"FeatureEngineering";
            case AWSSageMakerServiceAutoMLJobSecondaryStatusModelTuning:
                return @"ModelTuning";
            case AWSSageMakerServiceAutoMLJobSecondaryStatusMaxCandidatesReached:
                return @"MaxCandidatesReached";
            case AWSSageMakerServiceAutoMLJobSecondaryStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceAutoMLJobSecondaryStatusStopped:
                return @"Stopped";
            case AWSSageMakerServiceAutoMLJobSecondaryStatusMaxAutoMLJobRuntimeReached:
                return @"MaxAutoMLJobRuntimeReached";
            case AWSSageMakerServiceAutoMLJobSecondaryStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceAutoMLJobSecondaryStatusCandidateDefinitionsGenerated:
                return @"CandidateDefinitionsGenerated";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)autoMLJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobStatusStopping);
        }
        return @(AWSSageMakerServiceAutoMLJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAutoMLJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceAutoMLJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceAutoMLJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceAutoMLJobStatusStopped:
                return @"Stopped";
            case AWSSageMakerServiceAutoMLJobStatusStopping:
                return @"Stopping";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)bestCandidateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAutoMLCandidate class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceAutoMLChannel class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAutoMLOutputDataConfig class]];
}

+ (NSValueTransformer *)problemTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BinaryClassification"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProblemTypeBinaryClassification);
        }
        if ([value caseInsensitiveCompare:@"MulticlassClassification"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProblemTypeMulticlassClassification);
        }
        if ([value caseInsensitiveCompare:@"Regression"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProblemTypeRegression);
        }
        return @(AWSSageMakerServiceProblemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceProblemTypeBinaryClassification:
                return @"BinaryClassification";
            case AWSSageMakerServiceProblemTypeMulticlassClassification:
                return @"MulticlassClassification";
            case AWSSageMakerServiceProblemTypeRegression:
                return @"Regression";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resolvedAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceResolvedAttributes class]];
}

@end

@implementation AWSSageMakerServiceDescribeCodeRepositoryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositoryName" : @"CodeRepositoryName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeCodeRepositoryOutput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceGitConfig class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSageMakerServiceDescribeCompilationJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compilationJobName" : @"CompilationJobName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeCompilationJobResponse

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
            return @(AWSSageMakerServiceCompilationJobStatusInprogress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCompilationJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCompilationJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCompilationJobStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCompilationJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCompilationJobStatusStopped);
        }
        return @(AWSSageMakerServiceCompilationJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceCompilationJobStatusInprogress:
                return @"INPROGRESS";
            case AWSSageMakerServiceCompilationJobStatusCompleted:
                return @"COMPLETED";
            case AWSSageMakerServiceCompilationJobStatusFailed:
                return @"FAILED";
            case AWSSageMakerServiceCompilationJobStatusStarting:
                return @"STARTING";
            case AWSSageMakerServiceCompilationJobStatusStopping:
                return @"STOPPING";
            case AWSSageMakerServiceCompilationJobStatusStopped:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceInputConfig class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)modelArtifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceModelArtifacts class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceOutputConfig class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceStoppingCondition class]];
}

@end

@implementation AWSSageMakerServiceDescribeDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             };
}

@end

@implementation AWSSageMakerServiceDescribeDomainResponse

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
            return @(AWSSageMakerServiceAuthModeSso);
        }
        if ([value caseInsensitiveCompare:@"IAM"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAuthModeIam);
        }
        return @(AWSSageMakerServiceAuthModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAuthModeSso:
                return @"SSO";
            case AWSSageMakerServiceAuthModeIam:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserSettings class]];
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
            return @(AWSSageMakerServiceDomainStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceDomainStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSageMakerServiceDomainStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceDomainStatusPending);
        }
        return @(AWSSageMakerServiceDomainStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceDomainStatusDeleting:
                return @"Deleting";
            case AWSSageMakerServiceDomainStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceDomainStatusInService:
                return @"InService";
            case AWSSageMakerServiceDomainStatusPending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceDescribeEndpointConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointConfigName" : @"EndpointConfigName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeEndpointConfigOutput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceDataCaptureConfig class]];
}

+ (NSValueTransformer *)productionVariantsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceProductionVariant class]];
}

@end

@implementation AWSSageMakerServiceDescribeEndpointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointName" : @"EndpointName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeEndpointOutput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceDataCaptureConfigSummary class]];
}

+ (NSValueTransformer *)endpointStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OutOfService"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusOutOfService);
        }
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"SystemUpdating"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusSystemUpdating);
        }
        if ([value caseInsensitiveCompare:@"RollingBack"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusRollingBack);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusFailed);
        }
        return @(AWSSageMakerServiceEndpointStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceEndpointStatusOutOfService:
                return @"OutOfService";
            case AWSSageMakerServiceEndpointStatusCreating:
                return @"Creating";
            case AWSSageMakerServiceEndpointStatusUpdating:
                return @"Updating";
            case AWSSageMakerServiceEndpointStatusSystemUpdating:
                return @"SystemUpdating";
            case AWSSageMakerServiceEndpointStatusRollingBack:
                return @"RollingBack";
            case AWSSageMakerServiceEndpointStatusInService:
                return @"InService";
            case AWSSageMakerServiceEndpointStatusDeleting:
                return @"Deleting";
            case AWSSageMakerServiceEndpointStatusFailed:
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceProductionVariantSummary class]];
}

@end

@implementation AWSSageMakerServiceDescribeExperimentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentName" : @"ExperimentName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeExperimentResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserContext class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserContext class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceExperimentSource class]];
}

@end

@implementation AWSSageMakerServiceDescribeFlowDefinitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flowDefinitionName" : @"FlowDefinitionName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeFlowDefinitionResponse

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
            return @(AWSSageMakerServiceFlowDefinitionStatusInitializing);
        }
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSSageMakerServiceFlowDefinitionStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceFlowDefinitionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSageMakerServiceFlowDefinitionStatusDeleting);
        }
        return @(AWSSageMakerServiceFlowDefinitionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceFlowDefinitionStatusInitializing:
                return @"Initializing";
            case AWSSageMakerServiceFlowDefinitionStatusActive:
                return @"Active";
            case AWSSageMakerServiceFlowDefinitionStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceFlowDefinitionStatusDeleting:
                return @"Deleting";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)humanLoopActivationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceHumanLoopActivationConfig class]];
}

+ (NSValueTransformer *)humanLoopConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceHumanLoopConfig class]];
}

+ (NSValueTransformer *)humanLoopRequestSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceHumanLoopRequestSource class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceFlowDefinitionOutputConfig class]];
}

@end

@implementation AWSSageMakerServiceDescribeHumanTaskUiRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanTaskUiName" : @"HumanTaskUiName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeHumanTaskUiResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUiTemplateInfo class]];
}

@end

@implementation AWSSageMakerServiceDescribeHyperParameterTuningJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hyperParameterTuningJobName" : @"HyperParameterTuningJobName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeHyperParameterTuningJobResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceHyperParameterTrainingJobSummary class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceHyperParameterTuningJobConfig class]];
}

+ (NSValueTransformer *)hyperParameterTuningJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobStatusStopping);
        }
        return @(AWSSageMakerServiceHyperParameterTuningJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceHyperParameterTuningJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceHyperParameterTuningJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceHyperParameterTuningJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceHyperParameterTuningJobStatusStopped:
                return @"Stopped";
            case AWSSageMakerServiceHyperParameterTuningJobStatusStopping:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceObjectiveStatusCounters class]];
}

+ (NSValueTransformer *)overallBestTrainingJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceHyperParameterTrainingJobSummary class]];
}

+ (NSValueTransformer *)trainingJobDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceHyperParameterTrainingJobDefinition class]];
}

+ (NSValueTransformer *)trainingJobDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceHyperParameterTrainingJobDefinition class]];
}

+ (NSValueTransformer *)trainingJobStatusCountersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrainingJobStatusCounters class]];
}

+ (NSValueTransformer *)warmStartConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceHyperParameterTuningJobWarmStartConfig class]];
}

@end

@implementation AWSSageMakerServiceDescribeLabelingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelingJobName" : @"LabelingJobName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeLabelingJobResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceHumanTaskConfig class]];
}

+ (NSValueTransformer *)inputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceLabelingJobInputConfig class]];
}

+ (NSValueTransformer *)labelCountersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceLabelCounters class]];
}

+ (NSValueTransformer *)labelingJobAlgorithmsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceLabelingJobAlgorithmsConfig class]];
}

+ (NSValueTransformer *)labelingJobOutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceLabelingJobOutput class]];
}

+ (NSValueTransformer *)labelingJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceLabelingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceLabelingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceLabelingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceLabelingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceLabelingJobStatusStopped);
        }
        return @(AWSSageMakerServiceLabelingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceLabelingJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceLabelingJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceLabelingJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceLabelingJobStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceLabelingJobStatusStopped:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceLabelingJobOutputConfig class]];
}

+ (NSValueTransformer *)stoppingConditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceLabelingJobStoppingConditions class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceDescribeModelInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelName" : @"ModelName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeModelOutput

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceContainerDefinition class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)primaryContainerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceContainerDefinition class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceVpcConfig class]];
}

@end

@implementation AWSSageMakerServiceDescribeModelPackageInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelPackageName" : @"ModelPackageName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeModelPackageOutput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceInferenceSpecification class]];
}

+ (NSValueTransformer *)modelPackageStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceModelPackageStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceModelPackageStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceModelPackageStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceModelPackageStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSageMakerServiceModelPackageStatusDeleting);
        }
        return @(AWSSageMakerServiceModelPackageStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceModelPackageStatusPending:
                return @"Pending";
            case AWSSageMakerServiceModelPackageStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceModelPackageStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceModelPackageStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceModelPackageStatusDeleting:
                return @"Deleting";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modelPackageStatusDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceModelPackageStatusDetails class]];
}

+ (NSValueTransformer *)sourceAlgorithmSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceSourceAlgorithmSpecification class]];
}

+ (NSValueTransformer *)validationSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceModelPackageValidationSpecification class]];
}

@end

@implementation AWSSageMakerServiceDescribeMonitoringScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeMonitoringScheduleResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceMonitoringExecutionSummary class]];
}

+ (NSValueTransformer *)monitoringScheduleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceMonitoringScheduleConfig class]];
}

+ (NSValueTransformer *)monitoringScheduleStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceScheduleStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceScheduleStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Scheduled"] == NSOrderedSame) {
            return @(AWSSageMakerServiceScheduleStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceScheduleStatusStopped);
        }
        return @(AWSSageMakerServiceScheduleStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceScheduleStatusPending:
                return @"Pending";
            case AWSSageMakerServiceScheduleStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceScheduleStatusScheduled:
                return @"Scheduled";
            case AWSSageMakerServiceScheduleStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceDescribeNotebookInstanceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceName" : @"NotebookInstanceName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceLifecycleConfigName" : @"NotebookInstanceLifecycleConfigName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigOutput

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceNotebookInstanceLifecycleHook class]];
}

+ (NSValueTransformer *)onStartJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceNotebookInstanceLifecycleHook class]];
}

@end

@implementation AWSSageMakerServiceDescribeNotebookInstanceOutput

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
            return @(AWSSageMakerServiceDirectInternetAccessEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSSageMakerServiceDirectInternetAccessDisabled);
        }
        return @(AWSSageMakerServiceDirectInternetAccessUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceDirectInternetAccessEnabled:
                return @"Enabled";
            case AWSSageMakerServiceDirectInternetAccessDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ml.t2.medium"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT2Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT2Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT22xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.medium"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.9xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5d9xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.18xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5d18xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP316xlarge);
        }
        return @(AWSSageMakerServiceInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceInstanceTypeMlT2Medium:
                return @"ml.t2.medium";
            case AWSSageMakerServiceInstanceTypeMlT2Large:
                return @"ml.t2.large";
            case AWSSageMakerServiceInstanceTypeMlT2Xlarge:
                return @"ml.t2.xlarge";
            case AWSSageMakerServiceInstanceTypeMlT22xlarge:
                return @"ml.t2.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSSageMakerServiceInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSSageMakerServiceInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSSageMakerServiceInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSSageMakerServiceInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSSageMakerServiceInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSSageMakerServiceInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSSageMakerServiceInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSageMakerServiceInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSageMakerServiceInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSageMakerServiceInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSSageMakerServiceInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSSageMakerServiceInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSSageMakerServiceInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSageMakerServiceInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSageMakerServiceInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSageMakerServiceInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5dXlarge:
                return @"ml.c5d.xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5d2xlarge:
                return @"ml.c5d.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5d4xlarge:
                return @"ml.c5d.4xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5d9xlarge:
                return @"ml.c5d.9xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5d18xlarge:
                return @"ml.c5d.18xlarge";
            case AWSSageMakerServiceInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSSageMakerServiceInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSSageMakerServiceInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSSageMakerServiceInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSageMakerServiceInstanceTypeMlP316xlarge:
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
            return @(AWSSageMakerServiceNotebookInstanceStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceStatusUpdating);
        }
        return @(AWSSageMakerServiceNotebookInstanceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceNotebookInstanceStatusPending:
                return @"Pending";
            case AWSSageMakerServiceNotebookInstanceStatusInService:
                return @"InService";
            case AWSSageMakerServiceNotebookInstanceStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceNotebookInstanceStatusStopped:
                return @"Stopped";
            case AWSSageMakerServiceNotebookInstanceStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceNotebookInstanceStatusDeleting:
                return @"Deleting";
            case AWSSageMakerServiceNotebookInstanceStatusUpdating:
                return @"Updating";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rootAccessJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSSageMakerServiceRootAccessEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSSageMakerServiceRootAccessDisabled);
        }
        return @(AWSSageMakerServiceRootAccessUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceRootAccessEnabled:
                return @"Enabled";
            case AWSSageMakerServiceRootAccessDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceDescribeProcessingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"processingJobName" : @"ProcessingJobName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeProcessingJobResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAppSpecification class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceExperimentConfig class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)networkConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceNetworkConfig class]];
}

+ (NSValueTransformer *)processingEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)processingInputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceProcessingInput class]];
}

+ (NSValueTransformer *)processingJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingJobStatusStopped);
        }
        return @(AWSSageMakerServiceProcessingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceProcessingJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceProcessingJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceProcessingJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceProcessingJobStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceProcessingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)processingOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceProcessingOutputConfig class]];
}

+ (NSValueTransformer *)processingResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceProcessingResources class]];
}

+ (NSValueTransformer *)processingStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceProcessingStoppingCondition class]];
}

@end

@implementation AWSSageMakerServiceDescribeSubscribedWorkteamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workteamArn" : @"WorkteamArn",
             };
}

@end

@implementation AWSSageMakerServiceDescribeSubscribedWorkteamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subscribedWorkteam" : @"SubscribedWorkteam",
             };
}

+ (NSValueTransformer *)subscribedWorkteamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceSubscribedWorkteam class]];
}

@end

@implementation AWSSageMakerServiceDescribeTrainingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trainingJobName" : @"TrainingJobName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeTrainingJobResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAlgorithmSpecification class]];
}

+ (NSValueTransformer *)checkpointConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceCheckpointConfig class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)debugHookConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceDebugHookConfig class]];
}

+ (NSValueTransformer *)debugRuleConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceDebugRuleConfiguration class]];
}

+ (NSValueTransformer *)debugRuleEvaluationStatusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceDebugRuleEvaluationStatus class]];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceExperimentConfig class]];
}

+ (NSValueTransformer *)finalMetricDataListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceMetricData class]];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceChannel class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)modelArtifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceModelArtifacts class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceOutputDataConfig class]];
}

+ (NSValueTransformer *)resourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceResourceConfig class]];
}

+ (NSValueTransformer *)secondaryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Starting"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"LaunchingMLInstances"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusLaunchingMLInstances);
        }
        if ([value caseInsensitiveCompare:@"PreparingTrainingStack"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusPreparingTrainingStack);
        }
        if ([value caseInsensitiveCompare:@"Downloading"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusDownloading);
        }
        if ([value caseInsensitiveCompare:@"DownloadingTrainingImage"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusDownloadingTrainingImage);
        }
        if ([value caseInsensitiveCompare:@"Training"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusTraining);
        }
        if ([value caseInsensitiveCompare:@"Uploading"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusUploading);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"MaxRuntimeExceeded"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusMaxRuntimeExceeded);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Interrupted"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusInterrupted);
        }
        if ([value caseInsensitiveCompare:@"MaxWaitTimeExceeded"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusMaxWaitTimeExceeded);
        }
        return @(AWSSageMakerServiceSecondaryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSecondaryStatusStarting:
                return @"Starting";
            case AWSSageMakerServiceSecondaryStatusLaunchingMLInstances:
                return @"LaunchingMLInstances";
            case AWSSageMakerServiceSecondaryStatusPreparingTrainingStack:
                return @"PreparingTrainingStack";
            case AWSSageMakerServiceSecondaryStatusDownloading:
                return @"Downloading";
            case AWSSageMakerServiceSecondaryStatusDownloadingTrainingImage:
                return @"DownloadingTrainingImage";
            case AWSSageMakerServiceSecondaryStatusTraining:
                return @"Training";
            case AWSSageMakerServiceSecondaryStatusUploading:
                return @"Uploading";
            case AWSSageMakerServiceSecondaryStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceSecondaryStatusStopped:
                return @"Stopped";
            case AWSSageMakerServiceSecondaryStatusMaxRuntimeExceeded:
                return @"MaxRuntimeExceeded";
            case AWSSageMakerServiceSecondaryStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceSecondaryStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceSecondaryStatusInterrupted:
                return @"Interrupted";
            case AWSSageMakerServiceSecondaryStatusMaxWaitTimeExceeded:
                return @"MaxWaitTimeExceeded";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)secondaryStatusTransitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceSecondaryStatusTransition class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceStoppingCondition class]];
}

+ (NSValueTransformer *)tensorBoardOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTensorBoardOutputConfig class]];
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
            return @(AWSSageMakerServiceTrainingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusStopped);
        }
        return @(AWSSageMakerServiceTrainingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceTrainingJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceTrainingJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceTrainingJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceTrainingJobStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceTrainingJobStatusStopped:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceVpcConfig class]];
}

@end

@implementation AWSSageMakerServiceDescribeTransformJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformJobName" : @"TransformJobName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeTransformJobResponse

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
            return @(AWSSageMakerServiceBatchStrategyMultiRecord);
        }
        if ([value caseInsensitiveCompare:@"SingleRecord"] == NSOrderedSame) {
            return @(AWSSageMakerServiceBatchStrategySingleRecord);
        }
        return @(AWSSageMakerServiceBatchStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceBatchStrategyMultiRecord:
                return @"MultiRecord";
            case AWSSageMakerServiceBatchStrategySingleRecord:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceDataProcessing class]];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceExperimentConfig class]];
}

+ (NSValueTransformer *)transformEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)transformInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTransformInput class]];
}

+ (NSValueTransformer *)transformJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformJobStatusStopped);
        }
        return @(AWSSageMakerServiceTransformJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceTransformJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceTransformJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceTransformJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceTransformJobStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceTransformJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transformOutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTransformOutput class]];
}

+ (NSValueTransformer *)transformResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTransformResources class]];
}

+ (NSValueTransformer *)transformStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSageMakerServiceDescribeTrialComponentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentName" : @"TrialComponentName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeTrialComponentResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserContext class]];
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
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSageMakerServiceTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)lastModifiedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserContext class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)metricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTrialComponentMetricSummary class]];
}

+ (NSValueTransformer *)outputArtifactsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSageMakerServiceTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSageMakerServiceTrialComponentParameterValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrialComponentSource class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrialComponentStatus class]];
}

@end

@implementation AWSSageMakerServiceDescribeTrialRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeTrialResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserContext class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserContext class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrialSource class]];
}

@end

@implementation AWSSageMakerServiceDescribeUserProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             @"userProfileName" : @"UserProfileName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeUserProfileResponse

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
            return @(AWSSageMakerServiceUserProfileStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceUserProfileStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSageMakerServiceUserProfileStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceUserProfileStatusPending);
        }
        return @(AWSSageMakerServiceUserProfileStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceUserProfileStatusDeleting:
                return @"Deleting";
            case AWSSageMakerServiceUserProfileStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceUserProfileStatusInService:
                return @"InService";
            case AWSSageMakerServiceUserProfileStatusPending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)userSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserSettings class]];
}

@end

@implementation AWSSageMakerServiceDescribeWorkforceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workforceName" : @"WorkforceName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeWorkforceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workforce" : @"Workforce",
             };
}

+ (NSValueTransformer *)workforceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceWorkforce class]];
}

@end

@implementation AWSSageMakerServiceDescribeWorkteamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workteamName" : @"WorkteamName",
             };
}

@end

@implementation AWSSageMakerServiceDescribeWorkteamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workteam" : @"Workteam",
             };
}

+ (NSValueTransformer *)workteamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceWorkteam class]];
}

@end

@implementation AWSSageMakerServiceDesiredWeightAndCapacity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"desiredInstanceCount" : @"DesiredInstanceCount",
             @"desiredWeight" : @"DesiredWeight",
             @"variantName" : @"VariantName",
             };
}

@end

@implementation AWSSageMakerServiceDisassociateTrialComponentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentName" : @"TrialComponentName",
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSSageMakerServiceDisassociateTrialComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialArn" : @"TrialArn",
             @"trialComponentArn" : @"TrialComponentArn",
             };
}

@end

@implementation AWSSageMakerServiceDomainDetails

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
            return @(AWSSageMakerServiceDomainStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceDomainStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSageMakerServiceDomainStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceDomainStatusPending);
        }
        return @(AWSSageMakerServiceDomainStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceDomainStatusDeleting:
                return @"Deleting";
            case AWSSageMakerServiceDomainStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceDomainStatusInService:
                return @"InService";
            case AWSSageMakerServiceDomainStatusPending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceEndpointConfigSummary

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

@implementation AWSSageMakerServiceEndpointInput

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
            return @(AWSSageMakerServiceProcessingS3DataDistributionTypeFullyReplicated);
        }
        if ([value caseInsensitiveCompare:@"ShardedByS3Key"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingS3DataDistributionTypeShardedByS3Key);
        }
        return @(AWSSageMakerServiceProcessingS3DataDistributionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceProcessingS3DataDistributionTypeFullyReplicated:
                return @"FullyReplicated";
            case AWSSageMakerServiceProcessingS3DataDistributionTypeShardedByS3Key:
                return @"ShardedByS3Key";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3InputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pipe"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingS3InputModePipe);
        }
        if ([value caseInsensitiveCompare:@"File"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingS3InputModeFile);
        }
        return @(AWSSageMakerServiceProcessingS3InputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceProcessingS3InputModePipe:
                return @"Pipe";
            case AWSSageMakerServiceProcessingS3InputModeFile:
                return @"File";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceEndpointSummary

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
            return @(AWSSageMakerServiceEndpointStatusOutOfService);
        }
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"SystemUpdating"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusSystemUpdating);
        }
        if ([value caseInsensitiveCompare:@"RollingBack"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusRollingBack);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusFailed);
        }
        return @(AWSSageMakerServiceEndpointStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceEndpointStatusOutOfService:
                return @"OutOfService";
            case AWSSageMakerServiceEndpointStatusCreating:
                return @"Creating";
            case AWSSageMakerServiceEndpointStatusUpdating:
                return @"Updating";
            case AWSSageMakerServiceEndpointStatusSystemUpdating:
                return @"SystemUpdating";
            case AWSSageMakerServiceEndpointStatusRollingBack:
                return @"RollingBack";
            case AWSSageMakerServiceEndpointStatusInService:
                return @"InService";
            case AWSSageMakerServiceEndpointStatusDeleting:
                return @"Deleting";
            case AWSSageMakerServiceEndpointStatusFailed:
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

@implementation AWSSageMakerServiceExperiment

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserContext class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserContext class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceExperimentSource class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceExperimentConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentName" : @"ExperimentName",
             @"trialComponentDisplayName" : @"TrialComponentDisplayName",
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSSageMakerServiceExperimentSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceArn" : @"SourceArn",
             @"sourceType" : @"SourceType",
             };
}

@end

@implementation AWSSageMakerServiceExperimentSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceExperimentSource class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSageMakerServiceFileSystemDataSource

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
            return @(AWSSageMakerServiceFileSystemAccessModeRw);
        }
        if ([value caseInsensitiveCompare:@"ro"] == NSOrderedSame) {
            return @(AWSSageMakerServiceFileSystemAccessModeRo);
        }
        return @(AWSSageMakerServiceFileSystemAccessModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceFileSystemAccessModeRw:
                return @"rw";
            case AWSSageMakerServiceFileSystemAccessModeRo:
                return @"ro";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)fileSystemTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EFS"] == NSOrderedSame) {
            return @(AWSSageMakerServiceFileSystemTypeEfs);
        }
        if ([value caseInsensitiveCompare:@"FSxLustre"] == NSOrderedSame) {
            return @(AWSSageMakerServiceFileSystemTypeFSxLustre);
        }
        return @(AWSSageMakerServiceFileSystemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceFileSystemTypeEfs:
                return @"EFS";
            case AWSSageMakerServiceFileSystemTypeFSxLustre:
                return @"FSxLustre";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceFilter

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
            return @(AWSSageMakerServiceOperatorEquals);
        }
        if ([value caseInsensitiveCompare:@"NotEquals"] == NSOrderedSame) {
            return @(AWSSageMakerServiceOperatorNotEquals);
        }
        if ([value caseInsensitiveCompare:@"GreaterThan"] == NSOrderedSame) {
            return @(AWSSageMakerServiceOperatorGreaterThan);
        }
        if ([value caseInsensitiveCompare:@"GreaterThanOrEqualTo"] == NSOrderedSame) {
            return @(AWSSageMakerServiceOperatorGreaterThanOrEqualTo);
        }
        if ([value caseInsensitiveCompare:@"LessThan"] == NSOrderedSame) {
            return @(AWSSageMakerServiceOperatorLessThan);
        }
        if ([value caseInsensitiveCompare:@"LessThanOrEqualTo"] == NSOrderedSame) {
            return @(AWSSageMakerServiceOperatorLessThanOrEqualTo);
        }
        if ([value caseInsensitiveCompare:@"Contains"] == NSOrderedSame) {
            return @(AWSSageMakerServiceOperatorContains);
        }
        if ([value caseInsensitiveCompare:@"Exists"] == NSOrderedSame) {
            return @(AWSSageMakerServiceOperatorExists);
        }
        if ([value caseInsensitiveCompare:@"NotExists"] == NSOrderedSame) {
            return @(AWSSageMakerServiceOperatorNotExists);
        }
        if ([value caseInsensitiveCompare:@"In"] == NSOrderedSame) {
            return @(AWSSageMakerServiceOperatorIn);
        }
        return @(AWSSageMakerServiceOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceOperatorEquals:
                return @"Equals";
            case AWSSageMakerServiceOperatorNotEquals:
                return @"NotEquals";
            case AWSSageMakerServiceOperatorGreaterThan:
                return @"GreaterThan";
            case AWSSageMakerServiceOperatorGreaterThanOrEqualTo:
                return @"GreaterThanOrEqualTo";
            case AWSSageMakerServiceOperatorLessThan:
                return @"LessThan";
            case AWSSageMakerServiceOperatorLessThanOrEqualTo:
                return @"LessThanOrEqualTo";
            case AWSSageMakerServiceOperatorContains:
                return @"Contains";
            case AWSSageMakerServiceOperatorExists:
                return @"Exists";
            case AWSSageMakerServiceOperatorNotExists:
                return @"NotExists";
            case AWSSageMakerServiceOperatorIn:
                return @"In";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceFinalAutoMLJobObjectiveMetric

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
            return @(AWSSageMakerServiceAutoMLMetricEnumAccuracy);
        }
        if ([value caseInsensitiveCompare:@"MSE"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLMetricEnumMse);
        }
        if ([value caseInsensitiveCompare:@"F1"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLMetricEnumF1);
        }
        if ([value caseInsensitiveCompare:@"F1macro"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLMetricEnumF1macro);
        }
        return @(AWSSageMakerServiceAutoMLMetricEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAutoMLMetricEnumAccuracy:
                return @"Accuracy";
            case AWSSageMakerServiceAutoMLMetricEnumMse:
                return @"MSE";
            case AWSSageMakerServiceAutoMLMetricEnumF1:
                return @"F1";
            case AWSSageMakerServiceAutoMLMetricEnumF1macro:
                return @"F1macro";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Maximize"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobObjectiveTypeMaximize);
        }
        if ([value caseInsensitiveCompare:@"Minimize"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobObjectiveTypeMinimize);
        }
        return @(AWSSageMakerServiceAutoMLJobObjectiveTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAutoMLJobObjectiveTypeMaximize:
                return @"Maximize";
            case AWSSageMakerServiceAutoMLJobObjectiveTypeMinimize:
                return @"Minimize";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceFinalHyperParameterTuningJobObjectiveMetric

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
            return @(AWSSageMakerServiceHyperParameterTuningJobObjectiveTypeMaximize);
        }
        if ([value caseInsensitiveCompare:@"Minimize"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobObjectiveTypeMinimize);
        }
        return @(AWSSageMakerServiceHyperParameterTuningJobObjectiveTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceHyperParameterTuningJobObjectiveTypeMaximize:
                return @"Maximize";
            case AWSSageMakerServiceHyperParameterTuningJobObjectiveTypeMinimize:
                return @"Minimize";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceFlowDefinitionOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"s3OutputPath" : @"S3OutputPath",
             };
}

@end

@implementation AWSSageMakerServiceFlowDefinitionSummary

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
            return @(AWSSageMakerServiceFlowDefinitionStatusInitializing);
        }
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSSageMakerServiceFlowDefinitionStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceFlowDefinitionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSageMakerServiceFlowDefinitionStatusDeleting);
        }
        return @(AWSSageMakerServiceFlowDefinitionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceFlowDefinitionStatusInitializing:
                return @"Initializing";
            case AWSSageMakerServiceFlowDefinitionStatusActive:
                return @"Active";
            case AWSSageMakerServiceFlowDefinitionStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceFlowDefinitionStatusDeleting:
                return @"Deleting";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceGetSearchSuggestionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resource" : @"Resource",
             @"suggestionQuery" : @"SuggestionQuery",
             };
}

+ (NSValueTransformer *)resourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TrainingJob"] == NSOrderedSame) {
            return @(AWSSageMakerServiceResourceTypeTrainingJob);
        }
        if ([value caseInsensitiveCompare:@"Experiment"] == NSOrderedSame) {
            return @(AWSSageMakerServiceResourceTypeExperiment);
        }
        if ([value caseInsensitiveCompare:@"ExperimentTrial"] == NSOrderedSame) {
            return @(AWSSageMakerServiceResourceTypeExperimentTrial);
        }
        if ([value caseInsensitiveCompare:@"ExperimentTrialComponent"] == NSOrderedSame) {
            return @(AWSSageMakerServiceResourceTypeExperimentTrialComponent);
        }
        return @(AWSSageMakerServiceResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceResourceTypeTrainingJob:
                return @"TrainingJob";
            case AWSSageMakerServiceResourceTypeExperiment:
                return @"Experiment";
            case AWSSageMakerServiceResourceTypeExperimentTrial:
                return @"ExperimentTrial";
            case AWSSageMakerServiceResourceTypeExperimentTrialComponent:
                return @"ExperimentTrialComponent";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)suggestionQueryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceSuggestionQuery class]];
}

@end

@implementation AWSSageMakerServiceGetSearchSuggestionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"propertyNameSuggestions" : @"PropertyNameSuggestions",
             };
}

+ (NSValueTransformer *)propertyNameSuggestionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServicePropertyNameSuggestion class]];
}

@end

@implementation AWSSageMakerServiceGitConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branch" : @"Branch",
             @"repositoryUrl" : @"RepositoryUrl",
             @"secretArn" : @"SecretArn",
             };
}

@end

@implementation AWSSageMakerServiceGitConfigForUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"secretArn" : @"SecretArn",
             };
}

@end

@implementation AWSSageMakerServiceHumanLoopActivationConditionsConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanLoopActivationConditions" : @"HumanLoopActivationConditions",
             };
}

@end

@implementation AWSSageMakerServiceHumanLoopActivationConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanLoopActivationConditionsConfig" : @"HumanLoopActivationConditionsConfig",
             };
}

+ (NSValueTransformer *)humanLoopActivationConditionsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceHumanLoopActivationConditionsConfig class]];
}

@end

@implementation AWSSageMakerServiceHumanLoopConfig

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServicePublicWorkforceTaskPrice class]];
}

@end

@implementation AWSSageMakerServiceHumanLoopRequestSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsManagedHumanLoopRequestSource" : @"AwsManagedHumanLoopRequestSource",
             };
}

+ (NSValueTransformer *)awsManagedHumanLoopRequestSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS/Rekognition/DetectModerationLabels/Image/V3"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAwsManagedHumanLoopRequestSourceAWSRekognitionDetectModerationLabelsImageV3);
        }
        if ([value caseInsensitiveCompare:@"AWS/Textract/AnalyzeDocument/Forms/V1"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAwsManagedHumanLoopRequestSourceAWSTextractAnalyzeDocumentFormsV1);
        }
        return @(AWSSageMakerServiceAwsManagedHumanLoopRequestSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAwsManagedHumanLoopRequestSourceAWSRekognitionDetectModerationLabelsImageV3:
                return @"AWS/Rekognition/DetectModerationLabels/Image/V3";
            case AWSSageMakerServiceAwsManagedHumanLoopRequestSourceAWSTextractAnalyzeDocumentFormsV1:
                return @"AWS/Textract/AnalyzeDocument/Forms/V1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceHumanTaskConfig

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAnnotationConsolidationConfig class]];
}

+ (NSValueTransformer *)publicWorkforceTaskPriceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServicePublicWorkforceTaskPrice class]];
}

+ (NSValueTransformer *)uiConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUiConfig class]];
}

@end

@implementation AWSSageMakerServiceHumanTaskUiSummary

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

@implementation AWSSageMakerServiceHyperParameterAlgorithmSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmName" : @"AlgorithmName",
             @"metricDefinitions" : @"MetricDefinitions",
             @"trainingImage" : @"TrainingImage",
             @"trainingInputMode" : @"TrainingInputMode",
             };
}

+ (NSValueTransformer *)metricDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceMetricDefinition class]];
}

+ (NSValueTransformer *)trainingInputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pipe"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInputModePipe);
        }
        if ([value caseInsensitiveCompare:@"File"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInputModeFile);
        }
        return @(AWSSageMakerServiceTrainingInputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceTrainingInputModePipe:
                return @"Pipe";
            case AWSSageMakerServiceTrainingInputModeFile:
                return @"File";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceHyperParameterSpecification

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceParameterRange class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Integer"] == NSOrderedSame) {
            return @(AWSSageMakerServiceParameterTypeInteger);
        }
        if ([value caseInsensitiveCompare:@"Continuous"] == NSOrderedSame) {
            return @(AWSSageMakerServiceParameterTypeContinuous);
        }
        if ([value caseInsensitiveCompare:@"Categorical"] == NSOrderedSame) {
            return @(AWSSageMakerServiceParameterTypeCategorical);
        }
        if ([value caseInsensitiveCompare:@"FreeText"] == NSOrderedSame) {
            return @(AWSSageMakerServiceParameterTypeFreeText);
        }
        return @(AWSSageMakerServiceParameterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceParameterTypeInteger:
                return @"Integer";
            case AWSSageMakerServiceParameterTypeContinuous:
                return @"Continuous";
            case AWSSageMakerServiceParameterTypeCategorical:
                return @"Categorical";
            case AWSSageMakerServiceParameterTypeFreeText:
                return @"FreeText";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceHyperParameterTrainingJobDefinition

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceHyperParameterAlgorithmSpecification class]];
}

+ (NSValueTransformer *)checkpointConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceCheckpointConfig class]];
}

+ (NSValueTransformer *)hyperParameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceParameterRanges class]];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceChannel class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceOutputDataConfig class]];
}

+ (NSValueTransformer *)resourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceResourceConfig class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceStoppingCondition class]];
}

+ (NSValueTransformer *)tuningObjectiveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceHyperParameterTuningJobObjective class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceVpcConfig class]];
}

@end

@implementation AWSSageMakerServiceHyperParameterTrainingJobSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceFinalHyperParameterTuningJobObjectiveMetric class]];
}

+ (NSValueTransformer *)objectiveStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Succeeded"] == NSOrderedSame) {
            return @(AWSSageMakerServiceObjectiveStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceObjectiveStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceObjectiveStatusFailed);
        }
        return @(AWSSageMakerServiceObjectiveStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceObjectiveStatusSucceeded:
                return @"Succeeded";
            case AWSSageMakerServiceObjectiveStatusPending:
                return @"Pending";
            case AWSSageMakerServiceObjectiveStatusFailed:
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
            return @(AWSSageMakerServiceTrainingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusStopped);
        }
        return @(AWSSageMakerServiceTrainingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceTrainingJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceTrainingJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceTrainingJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceTrainingJobStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceTrainingJobStatusStopped:
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

@implementation AWSSageMakerServiceHyperParameterTuningJobConfig

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceHyperParameterTuningJobObjective class]];
}

+ (NSValueTransformer *)parameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceParameterRanges class]];
}

+ (NSValueTransformer *)resourceLimitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceResourceLimits class]];
}

+ (NSValueTransformer *)strategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Bayesian"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobStrategyTypeBayesian);
        }
        if ([value caseInsensitiveCompare:@"Random"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobStrategyTypeRandom);
        }
        return @(AWSSageMakerServiceHyperParameterTuningJobStrategyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceHyperParameterTuningJobStrategyTypeBayesian:
                return @"Bayesian";
            case AWSSageMakerServiceHyperParameterTuningJobStrategyTypeRandom:
                return @"Random";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)trainingJobEarlyStoppingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Off"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobEarlyStoppingTypeOff);
        }
        if ([value caseInsensitiveCompare:@"Auto"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobEarlyStoppingTypeAuto);
        }
        return @(AWSSageMakerServiceTrainingJobEarlyStoppingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceTrainingJobEarlyStoppingTypeOff:
                return @"Off";
            case AWSSageMakerServiceTrainingJobEarlyStoppingTypeAuto:
                return @"Auto";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tuningJobCompletionCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTuningJobCompletionCriteria class]];
}

@end

@implementation AWSSageMakerServiceHyperParameterTuningJobObjective

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricName" : @"MetricName",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Maximize"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobObjectiveTypeMaximize);
        }
        if ([value caseInsensitiveCompare:@"Minimize"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobObjectiveTypeMinimize);
        }
        return @(AWSSageMakerServiceHyperParameterTuningJobObjectiveTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceHyperParameterTuningJobObjectiveTypeMaximize:
                return @"Maximize";
            case AWSSageMakerServiceHyperParameterTuningJobObjectiveTypeMinimize:
                return @"Minimize";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceHyperParameterTuningJobSummary

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
            return @(AWSSageMakerServiceHyperParameterTuningJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobStatusStopping);
        }
        return @(AWSSageMakerServiceHyperParameterTuningJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceHyperParameterTuningJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceHyperParameterTuningJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceHyperParameterTuningJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceHyperParameterTuningJobStatusStopped:
                return @"Stopped";
            case AWSSageMakerServiceHyperParameterTuningJobStatusStopping:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceObjectiveStatusCounters class]];
}

+ (NSValueTransformer *)resourceLimitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceResourceLimits class]];
}

+ (NSValueTransformer *)strategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Bayesian"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobStrategyTypeBayesian);
        }
        if ([value caseInsensitiveCompare:@"Random"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobStrategyTypeRandom);
        }
        return @(AWSSageMakerServiceHyperParameterTuningJobStrategyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceHyperParameterTuningJobStrategyTypeBayesian:
                return @"Bayesian";
            case AWSSageMakerServiceHyperParameterTuningJobStrategyTypeRandom:
                return @"Random";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)trainingJobStatusCountersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrainingJobStatusCounters class]];
}

@end

@implementation AWSSageMakerServiceHyperParameterTuningJobWarmStartConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parentHyperParameterTuningJobs" : @"ParentHyperParameterTuningJobs",
             @"warmStartType" : @"WarmStartType",
             };
}

+ (NSValueTransformer *)parentHyperParameterTuningJobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceParentHyperParameterTuningJob class]];
}

+ (NSValueTransformer *)warmStartTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IdenticalDataAndAlgorithm"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobWarmStartTypeIdenticalDataAndAlgorithm);
        }
        if ([value caseInsensitiveCompare:@"TransferLearning"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobWarmStartTypeTransferLearning);
        }
        return @(AWSSageMakerServiceHyperParameterTuningJobWarmStartTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceHyperParameterTuningJobWarmStartTypeIdenticalDataAndAlgorithm:
                return @"IdenticalDataAndAlgorithm";
            case AWSSageMakerServiceHyperParameterTuningJobWarmStartTypeTransferLearning:
                return @"TransferLearning";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceInferenceSpecification

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceModelPackageContainerDefinition class]];
}

@end

@implementation AWSSageMakerServiceInputConfig

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
            return @(AWSSageMakerServiceFrameworkTensorflow);
        }
        if ([value caseInsensitiveCompare:@"KERAS"] == NSOrderedSame) {
            return @(AWSSageMakerServiceFrameworkKeras);
        }
        if ([value caseInsensitiveCompare:@"MXNET"] == NSOrderedSame) {
            return @(AWSSageMakerServiceFrameworkMxnet);
        }
        if ([value caseInsensitiveCompare:@"ONNX"] == NSOrderedSame) {
            return @(AWSSageMakerServiceFrameworkOnnx);
        }
        if ([value caseInsensitiveCompare:@"PYTORCH"] == NSOrderedSame) {
            return @(AWSSageMakerServiceFrameworkPytorch);
        }
        if ([value caseInsensitiveCompare:@"XGBOOST"] == NSOrderedSame) {
            return @(AWSSageMakerServiceFrameworkXgboost);
        }
        if ([value caseInsensitiveCompare:@"TFLITE"] == NSOrderedSame) {
            return @(AWSSageMakerServiceFrameworkTflite);
        }
        return @(AWSSageMakerServiceFrameworkUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceFrameworkTensorflow:
                return @"TENSORFLOW";
            case AWSSageMakerServiceFrameworkKeras:
                return @"KERAS";
            case AWSSageMakerServiceFrameworkMxnet:
                return @"MXNET";
            case AWSSageMakerServiceFrameworkOnnx:
                return @"ONNX";
            case AWSSageMakerServiceFrameworkPytorch:
                return @"PYTORCH";
            case AWSSageMakerServiceFrameworkXgboost:
                return @"XGBOOST";
            case AWSSageMakerServiceFrameworkTflite:
                return @"TFLITE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceIntegerParameterRange

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
            return @(AWSSageMakerServiceHyperParameterScalingTypeAuto);
        }
        if ([value caseInsensitiveCompare:@"Linear"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterScalingTypeLinear);
        }
        if ([value caseInsensitiveCompare:@"Logarithmic"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterScalingTypeLogarithmic);
        }
        if ([value caseInsensitiveCompare:@"ReverseLogarithmic"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterScalingTypeReverseLogarithmic);
        }
        return @(AWSSageMakerServiceHyperParameterScalingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceHyperParameterScalingTypeAuto:
                return @"Auto";
            case AWSSageMakerServiceHyperParameterScalingTypeLinear:
                return @"Linear";
            case AWSSageMakerServiceHyperParameterScalingTypeLogarithmic:
                return @"Logarithmic";
            case AWSSageMakerServiceHyperParameterScalingTypeReverseLogarithmic:
                return @"ReverseLogarithmic";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceIntegerParameterRangeSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxValue" : @"MaxValue",
             @"minValue" : @"MinValue",
             };
}

@end

@implementation AWSSageMakerServiceJupyterServerAppSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultResourceSpec" : @"DefaultResourceSpec",
             };
}

+ (NSValueTransformer *)defaultResourceSpecJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceResourceSpec class]];
}

@end

@implementation AWSSageMakerServiceKernelGatewayAppSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultResourceSpec" : @"DefaultResourceSpec",
             };
}

+ (NSValueTransformer *)defaultResourceSpecJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceResourceSpec class]];
}

@end

@implementation AWSSageMakerServiceLabelCounters

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

@implementation AWSSageMakerServiceLabelCountersForWorkteam

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanLabeled" : @"HumanLabeled",
             @"pendingHuman" : @"PendingHuman",
             @"total" : @"Total",
             };
}

@end

@implementation AWSSageMakerServiceLabelingJobAlgorithmsConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initialActiveLearningModelArn" : @"InitialActiveLearningModelArn",
             @"labelingJobAlgorithmSpecificationArn" : @"LabelingJobAlgorithmSpecificationArn",
             @"labelingJobResourceConfig" : @"LabelingJobResourceConfig",
             };
}

+ (NSValueTransformer *)labelingJobResourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceLabelingJobResourceConfig class]];
}

@end

@implementation AWSSageMakerServiceLabelingJobDataAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentClassifiers" : @"ContentClassifiers",
             };
}

@end

@implementation AWSSageMakerServiceLabelingJobDataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3DataSource" : @"S3DataSource",
             };
}

+ (NSValueTransformer *)s3DataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceLabelingJobS3DataSource class]];
}

@end

@implementation AWSSageMakerServiceLabelingJobForWorkteamSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceLabelCountersForWorkteam class]];
}

@end

@implementation AWSSageMakerServiceLabelingJobInputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAttributes" : @"DataAttributes",
             @"dataSource" : @"DataSource",
             };
}

+ (NSValueTransformer *)dataAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceLabelingJobDataAttributes class]];
}

+ (NSValueTransformer *)dataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceLabelingJobDataSource class]];
}

@end

@implementation AWSSageMakerServiceLabelingJobOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"finalActiveLearningModelArn" : @"FinalActiveLearningModelArn",
             @"outputDatasetS3Uri" : @"OutputDatasetS3Uri",
             };
}

@end

@implementation AWSSageMakerServiceLabelingJobOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"s3OutputPath" : @"S3OutputPath",
             };
}

@end

@implementation AWSSageMakerServiceLabelingJobResourceConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             };
}

@end

@implementation AWSSageMakerServiceLabelingJobS3DataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestS3Uri" : @"ManifestS3Uri",
             };
}

@end

@implementation AWSSageMakerServiceLabelingJobStoppingConditions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxHumanLabeledObjectCount" : @"MaxHumanLabeledObjectCount",
             @"maxPercentageOfInputDatasetLabeled" : @"MaxPercentageOfInputDatasetLabeled",
             };
}

@end

@implementation AWSSageMakerServiceLabelingJobSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceLabelingJobInputConfig class]];
}

+ (NSValueTransformer *)labelCountersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceLabelCounters class]];
}

+ (NSValueTransformer *)labelingJobOutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceLabelingJobOutput class]];
}

+ (NSValueTransformer *)labelingJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceLabelingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceLabelingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceLabelingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceLabelingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceLabelingJobStatusStopped);
        }
        return @(AWSSageMakerServiceLabelingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceLabelingJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceLabelingJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceLabelingJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceLabelingJobStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceLabelingJobStatusStopped:
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

@implementation AWSSageMakerServiceListAlgorithmsInput

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
            return @(AWSSageMakerServiceAlgorithmSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAlgorithmSortByCreationTime);
        }
        return @(AWSSageMakerServiceAlgorithmSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAlgorithmSortByName:
                return @"Name";
            case AWSSageMakerServiceAlgorithmSortByCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderDescending);
        }
        return @(AWSSageMakerServiceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListAlgorithmsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmSummaryList" : @"AlgorithmSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)algorithmSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceAlgorithmSummary class]];
}

@end

@implementation AWSSageMakerServiceListAppsRequest

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
            return @(AWSSageMakerServiceAppSortKeyCreationTime);
        }
        return @(AWSSageMakerServiceAppSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAppSortKeyCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderDescending);
        }
        return @(AWSSageMakerServiceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListAppsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apps" : @"Apps",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)appsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceAppDetails class]];
}

@end

@implementation AWSSageMakerServiceListAutoMLJobsRequest

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
            return @(AWSSageMakerServiceAutoMLSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLSortByStatus);
        }
        return @(AWSSageMakerServiceAutoMLSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAutoMLSortByName:
                return @"Name";
            case AWSSageMakerServiceAutoMLSortByCreationTime:
                return @"CreationTime";
            case AWSSageMakerServiceAutoMLSortByStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLSortOrderDescending);
        }
        return @(AWSSageMakerServiceAutoMLSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAutoMLSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceAutoMLSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLJobStatusStopping);
        }
        return @(AWSSageMakerServiceAutoMLJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAutoMLJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceAutoMLJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceAutoMLJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceAutoMLJobStatusStopped:
                return @"Stopped";
            case AWSSageMakerServiceAutoMLJobStatusStopping:
                return @"Stopping";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListAutoMLJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLJobSummaries" : @"AutoMLJobSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)autoMLJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceAutoMLJobSummary class]];
}

@end

@implementation AWSSageMakerServiceListCandidatesForAutoMLJobRequest

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
            return @(AWSSageMakerServiceCandidateSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCandidateSortByStatus);
        }
        if ([value caseInsensitiveCompare:@"FinalObjectiveMetricValue"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCandidateSortByFinalObjectiveMetricValue);
        }
        return @(AWSSageMakerServiceCandidateSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceCandidateSortByCreationTime:
                return @"CreationTime";
            case AWSSageMakerServiceCandidateSortByStatus:
                return @"Status";
            case AWSSageMakerServiceCandidateSortByFinalObjectiveMetricValue:
                return @"FinalObjectiveMetricValue";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAutoMLSortOrderDescending);
        }
        return @(AWSSageMakerServiceAutoMLSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAutoMLSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceAutoMLSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCandidateStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCandidateStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCandidateStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCandidateStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCandidateStatusStopping);
        }
        return @(AWSSageMakerServiceCandidateStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceCandidateStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceCandidateStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceCandidateStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceCandidateStatusStopped:
                return @"Stopped";
            case AWSSageMakerServiceCandidateStatusStopping:
                return @"Stopping";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListCandidatesForAutoMLJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"candidates" : @"Candidates",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)candidatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceAutoMLCandidate class]];
}

@end

@implementation AWSSageMakerServiceListCodeRepositoriesInput

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
            return @(AWSSageMakerServiceCodeRepositorySortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCodeRepositorySortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"LastModifiedTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCodeRepositorySortByLastModifiedTime);
        }
        return @(AWSSageMakerServiceCodeRepositorySortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceCodeRepositorySortByName:
                return @"Name";
            case AWSSageMakerServiceCodeRepositorySortByCreationTime:
                return @"CreationTime";
            case AWSSageMakerServiceCodeRepositorySortByLastModifiedTime:
                return @"LastModifiedTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCodeRepositorySortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCodeRepositorySortOrderDescending);
        }
        return @(AWSSageMakerServiceCodeRepositorySortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceCodeRepositorySortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceCodeRepositorySortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListCodeRepositoriesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositorySummaryList" : @"CodeRepositorySummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)codeRepositorySummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceCodeRepositorySummary class]];
}

@end

@implementation AWSSageMakerServiceListCompilationJobsRequest

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
            return @(AWSSageMakerServiceListCompilationJobsSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceListCompilationJobsSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSageMakerServiceListCompilationJobsSortByStatus);
        }
        return @(AWSSageMakerServiceListCompilationJobsSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceListCompilationJobsSortByName:
                return @"Name";
            case AWSSageMakerServiceListCompilationJobsSortByCreationTime:
                return @"CreationTime";
            case AWSSageMakerServiceListCompilationJobsSortByStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderDescending);
        }
        return @(AWSSageMakerServiceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INPROGRESS"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCompilationJobStatusInprogress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCompilationJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCompilationJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCompilationJobStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCompilationJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCompilationJobStatusStopped);
        }
        return @(AWSSageMakerServiceCompilationJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceCompilationJobStatusInprogress:
                return @"INPROGRESS";
            case AWSSageMakerServiceCompilationJobStatusCompleted:
                return @"COMPLETED";
            case AWSSageMakerServiceCompilationJobStatusFailed:
                return @"FAILED";
            case AWSSageMakerServiceCompilationJobStatusStarting:
                return @"STARTING";
            case AWSSageMakerServiceCompilationJobStatusStopping:
                return @"STOPPING";
            case AWSSageMakerServiceCompilationJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListCompilationJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compilationJobSummaries" : @"CompilationJobSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)compilationJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceCompilationJobSummary class]];
}

@end

@implementation AWSSageMakerServiceListDomainsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSageMakerServiceListDomainsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domains" : @"Domains",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)domainsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceDomainDetails class]];
}

@end

@implementation AWSSageMakerServiceListEndpointConfigsInput

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
            return @(AWSSageMakerServiceEndpointConfigSortKeyName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointConfigSortKeyCreationTime);
        }
        return @(AWSSageMakerServiceEndpointConfigSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceEndpointConfigSortKeyName:
                return @"Name";
            case AWSSageMakerServiceEndpointConfigSortKeyCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceOrderKeyAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceOrderKeyDescending);
        }
        return @(AWSSageMakerServiceOrderKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceOrderKeyAscending:
                return @"Ascending";
            case AWSSageMakerServiceOrderKeyDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListEndpointConfigsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointConfigs" : @"EndpointConfigs",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)endpointConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceEndpointConfigSummary class]];
}

@end

@implementation AWSSageMakerServiceListEndpointsInput

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
            return @(AWSSageMakerServiceEndpointSortKeyName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointSortKeyCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointSortKeyStatus);
        }
        return @(AWSSageMakerServiceEndpointSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceEndpointSortKeyName:
                return @"Name";
            case AWSSageMakerServiceEndpointSortKeyCreationTime:
                return @"CreationTime";
            case AWSSageMakerServiceEndpointSortKeyStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceOrderKeyAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceOrderKeyDescending);
        }
        return @(AWSSageMakerServiceOrderKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceOrderKeyAscending:
                return @"Ascending";
            case AWSSageMakerServiceOrderKeyDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OutOfService"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusOutOfService);
        }
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"SystemUpdating"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusSystemUpdating);
        }
        if ([value caseInsensitiveCompare:@"RollingBack"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusRollingBack);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceEndpointStatusFailed);
        }
        return @(AWSSageMakerServiceEndpointStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceEndpointStatusOutOfService:
                return @"OutOfService";
            case AWSSageMakerServiceEndpointStatusCreating:
                return @"Creating";
            case AWSSageMakerServiceEndpointStatusUpdating:
                return @"Updating";
            case AWSSageMakerServiceEndpointStatusSystemUpdating:
                return @"SystemUpdating";
            case AWSSageMakerServiceEndpointStatusRollingBack:
                return @"RollingBack";
            case AWSSageMakerServiceEndpointStatusInService:
                return @"InService";
            case AWSSageMakerServiceEndpointStatusDeleting:
                return @"Deleting";
            case AWSSageMakerServiceEndpointStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListEndpointsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoints" : @"Endpoints",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)endpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceEndpointSummary class]];
}

@end

@implementation AWSSageMakerServiceListExperimentsRequest

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
            return @(AWSSageMakerServiceSortExperimentsByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortExperimentsByCreationTime);
        }
        return @(AWSSageMakerServiceSortExperimentsByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortExperimentsByName:
                return @"Name";
            case AWSSageMakerServiceSortExperimentsByCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderDescending);
        }
        return @(AWSSageMakerServiceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListExperimentsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentSummaries" : @"ExperimentSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)experimentSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceExperimentSummary class]];
}

@end

@implementation AWSSageMakerServiceListFlowDefinitionsRequest

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
            return @(AWSSageMakerServiceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderDescending);
        }
        return @(AWSSageMakerServiceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListFlowDefinitionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flowDefinitionSummaries" : @"FlowDefinitionSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)flowDefinitionSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceFlowDefinitionSummary class]];
}

@end

@implementation AWSSageMakerServiceListHumanTaskUisRequest

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
            return @(AWSSageMakerServiceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderDescending);
        }
        return @(AWSSageMakerServiceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListHumanTaskUisResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanTaskUiSummaries" : @"HumanTaskUiSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)humanTaskUiSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceHumanTaskUiSummary class]];
}

@end

@implementation AWSSageMakerServiceListHyperParameterTuningJobsRequest

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
            return @(AWSSageMakerServiceHyperParameterTuningJobSortByOptionsName);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobSortByOptionsStatus);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobSortByOptionsCreationTime);
        }
        return @(AWSSageMakerServiceHyperParameterTuningJobSortByOptionsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceHyperParameterTuningJobSortByOptionsName:
                return @"Name";
            case AWSSageMakerServiceHyperParameterTuningJobSortByOptionsStatus:
                return @"Status";
            case AWSSageMakerServiceHyperParameterTuningJobSortByOptionsCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderDescending);
        }
        return @(AWSSageMakerServiceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceHyperParameterTuningJobStatusStopping);
        }
        return @(AWSSageMakerServiceHyperParameterTuningJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceHyperParameterTuningJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceHyperParameterTuningJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceHyperParameterTuningJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceHyperParameterTuningJobStatusStopped:
                return @"Stopped";
            case AWSSageMakerServiceHyperParameterTuningJobStatusStopping:
                return @"Stopping";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListHyperParameterTuningJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hyperParameterTuningJobSummaries" : @"HyperParameterTuningJobSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)hyperParameterTuningJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceHyperParameterTuningJobSummary class]];
}

@end

@implementation AWSSageMakerServiceListLabelingJobsForWorkteamRequest

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
            return @(AWSSageMakerServiceListLabelingJobsForWorkteamSortByOptionsCreationTime);
        }
        return @(AWSSageMakerServiceListLabelingJobsForWorkteamSortByOptionsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceListLabelingJobsForWorkteamSortByOptionsCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderDescending);
        }
        return @(AWSSageMakerServiceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListLabelingJobsForWorkteamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelingJobSummaryList" : @"LabelingJobSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)labelingJobSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceLabelingJobForWorkteamSummary class]];
}

@end

@implementation AWSSageMakerServiceListLabelingJobsRequest

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
            return @(AWSSageMakerServiceSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortByStatus);
        }
        return @(AWSSageMakerServiceSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortByName:
                return @"Name";
            case AWSSageMakerServiceSortByCreationTime:
                return @"CreationTime";
            case AWSSageMakerServiceSortByStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderDescending);
        }
        return @(AWSSageMakerServiceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceLabelingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceLabelingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceLabelingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceLabelingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceLabelingJobStatusStopped);
        }
        return @(AWSSageMakerServiceLabelingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceLabelingJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceLabelingJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceLabelingJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceLabelingJobStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceLabelingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListLabelingJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelingJobSummaryList" : @"LabelingJobSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)labelingJobSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceLabelingJobSummary class]];
}

@end

@implementation AWSSageMakerServiceListModelPackagesInput

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
            return @(AWSSageMakerServiceModelPackageSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceModelPackageSortByCreationTime);
        }
        return @(AWSSageMakerServiceModelPackageSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceModelPackageSortByName:
                return @"Name";
            case AWSSageMakerServiceModelPackageSortByCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderDescending);
        }
        return @(AWSSageMakerServiceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListModelPackagesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelPackageSummaryList" : @"ModelPackageSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)modelPackageSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceModelPackageSummary class]];
}

@end

@implementation AWSSageMakerServiceListModelsInput

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
            return @(AWSSageMakerServiceModelSortKeyName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceModelSortKeyCreationTime);
        }
        return @(AWSSageMakerServiceModelSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceModelSortKeyName:
                return @"Name";
            case AWSSageMakerServiceModelSortKeyCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceOrderKeyAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceOrderKeyDescending);
        }
        return @(AWSSageMakerServiceOrderKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceOrderKeyAscending:
                return @"Ascending";
            case AWSSageMakerServiceOrderKeyDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListModelsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"models" : @"Models",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)modelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceModelSummary class]];
}

@end

@implementation AWSSageMakerServiceListMonitoringExecutionsRequest

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
            return @(AWSSageMakerServiceMonitoringExecutionSortKeyCreationTime);
        }
        if ([value caseInsensitiveCompare:@"ScheduledTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceMonitoringExecutionSortKeyScheduledTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSageMakerServiceMonitoringExecutionSortKeyStatus);
        }
        return @(AWSSageMakerServiceMonitoringExecutionSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceMonitoringExecutionSortKeyCreationTime:
                return @"CreationTime";
            case AWSSageMakerServiceMonitoringExecutionSortKeyScheduledTime:
                return @"ScheduledTime";
            case AWSSageMakerServiceMonitoringExecutionSortKeyStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderDescending);
        }
        return @(AWSSageMakerServiceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceExecutionStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"CompletedWithViolations"] == NSOrderedSame) {
            return @(AWSSageMakerServiceExecutionStatusCompletedWithViolations);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceExecutionStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceExecutionStatusStopped);
        }
        return @(AWSSageMakerServiceExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceExecutionStatusPending:
                return @"Pending";
            case AWSSageMakerServiceExecutionStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceExecutionStatusCompletedWithViolations:
                return @"CompletedWithViolations";
            case AWSSageMakerServiceExecutionStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceExecutionStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceExecutionStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceExecutionStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListMonitoringExecutionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringExecutionSummaries" : @"MonitoringExecutionSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)monitoringExecutionSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceMonitoringExecutionSummary class]];
}

@end

@implementation AWSSageMakerServiceListMonitoringSchedulesRequest

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
            return @(AWSSageMakerServiceMonitoringScheduleSortKeyName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceMonitoringScheduleSortKeyCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSageMakerServiceMonitoringScheduleSortKeyStatus);
        }
        return @(AWSSageMakerServiceMonitoringScheduleSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceMonitoringScheduleSortKeyName:
                return @"Name";
            case AWSSageMakerServiceMonitoringScheduleSortKeyCreationTime:
                return @"CreationTime";
            case AWSSageMakerServiceMonitoringScheduleSortKeyStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderDescending);
        }
        return @(AWSSageMakerServiceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceScheduleStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceScheduleStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Scheduled"] == NSOrderedSame) {
            return @(AWSSageMakerServiceScheduleStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceScheduleStatusStopped);
        }
        return @(AWSSageMakerServiceScheduleStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceScheduleStatusPending:
                return @"Pending";
            case AWSSageMakerServiceScheduleStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceScheduleStatusScheduled:
                return @"Scheduled";
            case AWSSageMakerServiceScheduleStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListMonitoringSchedulesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleSummaries" : @"MonitoringScheduleSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)monitoringScheduleSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceMonitoringScheduleSummary class]];
}

@end

@implementation AWSSageMakerServiceListNotebookInstanceLifecycleConfigsInput

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
            return @(AWSSageMakerServiceNotebookInstanceLifecycleConfigSortKeyName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceLifecycleConfigSortKeyCreationTime);
        }
        if ([value caseInsensitiveCompare:@"LastModifiedTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceLifecycleConfigSortKeyLastModifiedTime);
        }
        return @(AWSSageMakerServiceNotebookInstanceLifecycleConfigSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceNotebookInstanceLifecycleConfigSortKeyName:
                return @"Name";
            case AWSSageMakerServiceNotebookInstanceLifecycleConfigSortKeyCreationTime:
                return @"CreationTime";
            case AWSSageMakerServiceNotebookInstanceLifecycleConfigSortKeyLastModifiedTime:
                return @"LastModifiedTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceLifecycleConfigSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceLifecycleConfigSortOrderDescending);
        }
        return @(AWSSageMakerServiceNotebookInstanceLifecycleConfigSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceNotebookInstanceLifecycleConfigSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceNotebookInstanceLifecycleConfigSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListNotebookInstanceLifecycleConfigsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"notebookInstanceLifecycleConfigs" : @"NotebookInstanceLifecycleConfigs",
             };
}

+ (NSValueTransformer *)notebookInstanceLifecycleConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceNotebookInstanceLifecycleConfigSummary class]];
}

@end

@implementation AWSSageMakerServiceListNotebookInstancesInput

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
            return @(AWSSageMakerServiceNotebookInstanceSortKeyName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceSortKeyCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceSortKeyStatus);
        }
        return @(AWSSageMakerServiceNotebookInstanceSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceNotebookInstanceSortKeyName:
                return @"Name";
            case AWSSageMakerServiceNotebookInstanceSortKeyCreationTime:
                return @"CreationTime";
            case AWSSageMakerServiceNotebookInstanceSortKeyStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceSortOrderDescending);
        }
        return @(AWSSageMakerServiceNotebookInstanceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceNotebookInstanceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceNotebookInstanceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceStatusUpdating);
        }
        return @(AWSSageMakerServiceNotebookInstanceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceNotebookInstanceStatusPending:
                return @"Pending";
            case AWSSageMakerServiceNotebookInstanceStatusInService:
                return @"InService";
            case AWSSageMakerServiceNotebookInstanceStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceNotebookInstanceStatusStopped:
                return @"Stopped";
            case AWSSageMakerServiceNotebookInstanceStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceNotebookInstanceStatusDeleting:
                return @"Deleting";
            case AWSSageMakerServiceNotebookInstanceStatusUpdating:
                return @"Updating";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListNotebookInstancesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"notebookInstances" : @"NotebookInstances",
             };
}

+ (NSValueTransformer *)notebookInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceNotebookInstanceSummary class]];
}

@end

@implementation AWSSageMakerServiceListProcessingJobsRequest

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
            return @(AWSSageMakerServiceSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortByStatus);
        }
        return @(AWSSageMakerServiceSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortByName:
                return @"Name";
            case AWSSageMakerServiceSortByCreationTime:
                return @"CreationTime";
            case AWSSageMakerServiceSortByStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderDescending);
        }
        return @(AWSSageMakerServiceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingJobStatusStopped);
        }
        return @(AWSSageMakerServiceProcessingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceProcessingJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceProcessingJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceProcessingJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceProcessingJobStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceProcessingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListProcessingJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"processingJobSummaries" : @"ProcessingJobSummaries",
             };
}

+ (NSValueTransformer *)processingJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceProcessingJobSummary class]];
}

@end

@implementation AWSSageMakerServiceListSubscribedWorkteamsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSageMakerServiceListSubscribedWorkteamsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"subscribedWorkteams" : @"SubscribedWorkteams",
             };
}

+ (NSValueTransformer *)subscribedWorkteamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceSubscribedWorkteam class]];
}

@end

@implementation AWSSageMakerServiceListTagsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSSageMakerServiceListTagsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobRequest

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
            return @(AWSSageMakerServiceTrainingJobSortByOptionsName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobSortByOptionsCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobSortByOptionsStatus);
        }
        if ([value caseInsensitiveCompare:@"FinalObjectiveMetricValue"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobSortByOptionsFinalObjectiveMetricValue);
        }
        return @(AWSSageMakerServiceTrainingJobSortByOptionsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceTrainingJobSortByOptionsName:
                return @"Name";
            case AWSSageMakerServiceTrainingJobSortByOptionsCreationTime:
                return @"CreationTime";
            case AWSSageMakerServiceTrainingJobSortByOptionsStatus:
                return @"Status";
            case AWSSageMakerServiceTrainingJobSortByOptionsFinalObjectiveMetricValue:
                return @"FinalObjectiveMetricValue";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderDescending);
        }
        return @(AWSSageMakerServiceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusStopped);
        }
        return @(AWSSageMakerServiceTrainingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceTrainingJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceTrainingJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceTrainingJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceTrainingJobStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceTrainingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"trainingJobSummaries" : @"TrainingJobSummaries",
             };
}

+ (NSValueTransformer *)trainingJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceHyperParameterTrainingJobSummary class]];
}

@end

@implementation AWSSageMakerServiceListTrainingJobsRequest

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
            return @(AWSSageMakerServiceSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortByStatus);
        }
        return @(AWSSageMakerServiceSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortByName:
                return @"Name";
            case AWSSageMakerServiceSortByCreationTime:
                return @"CreationTime";
            case AWSSageMakerServiceSortByStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderDescending);
        }
        return @(AWSSageMakerServiceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusStopped);
        }
        return @(AWSSageMakerServiceTrainingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceTrainingJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceTrainingJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceTrainingJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceTrainingJobStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceTrainingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListTrainingJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"trainingJobSummaries" : @"TrainingJobSummaries",
             };
}

+ (NSValueTransformer *)trainingJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTrainingJobSummary class]];
}

@end

@implementation AWSSageMakerServiceListTransformJobsRequest

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
            return @(AWSSageMakerServiceSortByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortByCreationTime);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortByStatus);
        }
        return @(AWSSageMakerServiceSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortByName:
                return @"Name";
            case AWSSageMakerServiceSortByCreationTime:
                return @"CreationTime";
            case AWSSageMakerServiceSortByStatus:
                return @"Status";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderDescending);
        }
        return @(AWSSageMakerServiceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformJobStatusStopped);
        }
        return @(AWSSageMakerServiceTransformJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceTransformJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceTransformJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceTransformJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceTransformJobStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceTransformJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListTransformJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"transformJobSummaries" : @"TransformJobSummaries",
             };
}

+ (NSValueTransformer *)transformJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTransformJobSummary class]];
}

@end

@implementation AWSSageMakerServiceListTrialComponentsRequest

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
            return @(AWSSageMakerServiceSortTrialComponentsByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortTrialComponentsByCreationTime);
        }
        return @(AWSSageMakerServiceSortTrialComponentsByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortTrialComponentsByName:
                return @"Name";
            case AWSSageMakerServiceSortTrialComponentsByCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderDescending);
        }
        return @(AWSSageMakerServiceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListTrialComponentsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"trialComponentSummaries" : @"TrialComponentSummaries",
             };
}

+ (NSValueTransformer *)trialComponentSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTrialComponentSummary class]];
}

@end

@implementation AWSSageMakerServiceListTrialsRequest

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
            return @(AWSSageMakerServiceSortTrialsByName);
        }
        if ([value caseInsensitiveCompare:@"CreationTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortTrialsByCreationTime);
        }
        return @(AWSSageMakerServiceSortTrialsByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortTrialsByName:
                return @"Name";
            case AWSSageMakerServiceSortTrialsByCreationTime:
                return @"CreationTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderDescending);
        }
        return @(AWSSageMakerServiceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListTrialsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"trialSummaries" : @"TrialSummaries",
             };
}

+ (NSValueTransformer *)trialSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTrialSummary class]];
}

@end

@implementation AWSSageMakerServiceListUserProfilesRequest

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
            return @(AWSSageMakerServiceUserProfileSortKeyCreationTime);
        }
        if ([value caseInsensitiveCompare:@"LastModifiedTime"] == NSOrderedSame) {
            return @(AWSSageMakerServiceUserProfileSortKeyLastModifiedTime);
        }
        return @(AWSSageMakerServiceUserProfileSortKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceUserProfileSortKeyCreationTime:
                return @"CreationTime";
            case AWSSageMakerServiceUserProfileSortKeyLastModifiedTime:
                return @"LastModifiedTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderDescending);
        }
        return @(AWSSageMakerServiceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListUserProfilesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"userProfiles" : @"UserProfiles",
             };
}

+ (NSValueTransformer *)userProfilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceUserProfileDetails class]];
}

@end

@implementation AWSSageMakerServiceListWorkteamsRequest

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
            return @(AWSSageMakerServiceListWorkteamsSortByOptionsName);
        }
        if ([value caseInsensitiveCompare:@"CreateDate"] == NSOrderedSame) {
            return @(AWSSageMakerServiceListWorkteamsSortByOptionsCreateDate);
        }
        return @(AWSSageMakerServiceListWorkteamsSortByOptionsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceListWorkteamsSortByOptionsName:
                return @"Name";
            case AWSSageMakerServiceListWorkteamsSortByOptionsCreateDate:
                return @"CreateDate";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSortOrderDescending);
        }
        return @(AWSSageMakerServiceSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceListWorkteamsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"workteams" : @"Workteams",
             };
}

+ (NSValueTransformer *)workteamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceWorkteam class]];
}

@end

@implementation AWSSageMakerServiceMemberDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cognitoMemberDefinition" : @"CognitoMemberDefinition",
             };
}

+ (NSValueTransformer *)cognitoMemberDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceCognitoMemberDefinition class]];
}

@end

@implementation AWSSageMakerServiceMetricData

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

@implementation AWSSageMakerServiceMetricDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"regex" : @"Regex",
             };
}

@end

@implementation AWSSageMakerServiceModelArtifacts

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3ModelArtifacts" : @"S3ModelArtifacts",
             };
}

@end

@implementation AWSSageMakerServiceModelPackageContainerDefinition

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

@implementation AWSSageMakerServiceModelPackageStatusDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageScanStatuses" : @"ImageScanStatuses",
             @"validationStatuses" : @"ValidationStatuses",
             };
}

+ (NSValueTransformer *)imageScanStatusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceModelPackageStatusItem class]];
}

+ (NSValueTransformer *)validationStatusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceModelPackageStatusItem class]];
}

@end

@implementation AWSSageMakerServiceModelPackageStatusItem

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
            return @(AWSSageMakerServiceDetailedModelPackageStatusNotStarted);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceDetailedModelPackageStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceDetailedModelPackageStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceDetailedModelPackageStatusFailed);
        }
        return @(AWSSageMakerServiceDetailedModelPackageStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceDetailedModelPackageStatusNotStarted:
                return @"NotStarted";
            case AWSSageMakerServiceDetailedModelPackageStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceDetailedModelPackageStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceDetailedModelPackageStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceModelPackageSummary

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
            return @(AWSSageMakerServiceModelPackageStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceModelPackageStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceModelPackageStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceModelPackageStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSageMakerServiceModelPackageStatusDeleting);
        }
        return @(AWSSageMakerServiceModelPackageStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceModelPackageStatusPending:
                return @"Pending";
            case AWSSageMakerServiceModelPackageStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceModelPackageStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceModelPackageStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceModelPackageStatusDeleting:
                return @"Deleting";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceModelPackageValidationProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"profileName" : @"ProfileName",
             @"transformJobDefinition" : @"TransformJobDefinition",
             };
}

+ (NSValueTransformer *)transformJobDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTransformJobDefinition class]];
}

@end

@implementation AWSSageMakerServiceModelPackageValidationSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"validationProfiles" : @"ValidationProfiles",
             @"validationRole" : @"ValidationRole",
             };
}

+ (NSValueTransformer *)validationProfilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceModelPackageValidationProfile class]];
}

@end

@implementation AWSSageMakerServiceModelSummary

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

@implementation AWSSageMakerServiceMonitoringAppSpecification

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

@implementation AWSSageMakerServiceMonitoringBaselineConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constraintsResource" : @"ConstraintsResource",
             @"statisticsResource" : @"StatisticsResource",
             };
}

+ (NSValueTransformer *)constraintsResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceMonitoringConstraintsResource class]];
}

+ (NSValueTransformer *)statisticsResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceMonitoringStatisticsResource class]];
}

@end

@implementation AWSSageMakerServiceMonitoringClusterConfig

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
            return @(AWSSageMakerServiceProcessingInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR58xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR516xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.24xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR524xlarge);
        }
        return @(AWSSageMakerServiceProcessingInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceProcessingInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSSageMakerServiceProcessingInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSSageMakerServiceProcessingInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSSageMakerServiceProcessingInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR5Large:
                return @"ml.r5.large";
            case AWSSageMakerServiceProcessingInstanceTypeMlR5Xlarge:
                return @"ml.r5.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR52xlarge:
                return @"ml.r5.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR54xlarge:
                return @"ml.r5.4xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR58xlarge:
                return @"ml.r5.8xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR512xlarge:
                return @"ml.r5.12xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR516xlarge:
                return @"ml.r5.16xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR524xlarge:
                return @"ml.r5.24xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceMonitoringConstraintsResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSSageMakerServiceMonitoringExecutionSummary

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
            return @(AWSSageMakerServiceExecutionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceExecutionStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"CompletedWithViolations"] == NSOrderedSame) {
            return @(AWSSageMakerServiceExecutionStatusCompletedWithViolations);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceExecutionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceExecutionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceExecutionStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceExecutionStatusStopped);
        }
        return @(AWSSageMakerServiceExecutionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceExecutionStatusPending:
                return @"Pending";
            case AWSSageMakerServiceExecutionStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceExecutionStatusCompletedWithViolations:
                return @"CompletedWithViolations";
            case AWSSageMakerServiceExecutionStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceExecutionStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceExecutionStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceExecutionStatusStopped:
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

@implementation AWSSageMakerServiceMonitoringInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointInput" : @"EndpointInput",
             };
}

+ (NSValueTransformer *)endpointInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceEndpointInput class]];
}

@end

@implementation AWSSageMakerServiceMonitoringJobDefinition

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceMonitoringBaselineConfig class]];
}

+ (NSValueTransformer *)monitoringAppSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceMonitoringAppSpecification class]];
}

+ (NSValueTransformer *)monitoringInputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceMonitoringInput class]];
}

+ (NSValueTransformer *)monitoringOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceMonitoringOutputConfig class]];
}

+ (NSValueTransformer *)monitoringResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceMonitoringResources class]];
}

+ (NSValueTransformer *)networkConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceNetworkConfig class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceMonitoringStoppingCondition class]];
}

@end

@implementation AWSSageMakerServiceMonitoringOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Output" : @"S3Output",
             };
}

+ (NSValueTransformer *)s3OutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceMonitoringS3Output class]];
}

@end

@implementation AWSSageMakerServiceMonitoringOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"monitoringOutputs" : @"MonitoringOutputs",
             };
}

+ (NSValueTransformer *)monitoringOutputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceMonitoringOutput class]];
}

@end

@implementation AWSSageMakerServiceMonitoringResources

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterConfig" : @"ClusterConfig",
             };
}

+ (NSValueTransformer *)clusterConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceMonitoringClusterConfig class]];
}

@end

@implementation AWSSageMakerServiceMonitoringS3Output

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
            return @(AWSSageMakerServiceProcessingS3UploadModeContinuous);
        }
        if ([value caseInsensitiveCompare:@"EndOfJob"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingS3UploadModeEndOfJob);
        }
        return @(AWSSageMakerServiceProcessingS3UploadModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceProcessingS3UploadModeContinuous:
                return @"Continuous";
            case AWSSageMakerServiceProcessingS3UploadModeEndOfJob:
                return @"EndOfJob";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceMonitoringScheduleConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringJobDefinition" : @"MonitoringJobDefinition",
             @"scheduleConfig" : @"ScheduleConfig",
             };
}

+ (NSValueTransformer *)monitoringJobDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceMonitoringJobDefinition class]];
}

+ (NSValueTransformer *)scheduleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceScheduleConfig class]];
}

@end

@implementation AWSSageMakerServiceMonitoringScheduleSummary

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
            return @(AWSSageMakerServiceScheduleStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceScheduleStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Scheduled"] == NSOrderedSame) {
            return @(AWSSageMakerServiceScheduleStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceScheduleStatusStopped);
        }
        return @(AWSSageMakerServiceScheduleStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceScheduleStatusPending:
                return @"Pending";
            case AWSSageMakerServiceScheduleStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceScheduleStatusScheduled:
                return @"Scheduled";
            case AWSSageMakerServiceScheduleStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceMonitoringStatisticsResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSSageMakerServiceMonitoringStoppingCondition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxRuntimeInSeconds" : @"MaxRuntimeInSeconds",
             };
}

@end

@implementation AWSSageMakerServiceNestedFilters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"nestedPropertyName" : @"NestedPropertyName",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceFilter class]];
}

@end

@implementation AWSSageMakerServiceNetworkConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enableInterContainerTrafficEncryption" : @"EnableInterContainerTrafficEncryption",
             @"enableNetworkIsolation" : @"EnableNetworkIsolation",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceVpcConfig class]];
}

@end

@implementation AWSSageMakerServiceNotebookInstanceLifecycleConfigSummary

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

@implementation AWSSageMakerServiceNotebookInstanceLifecycleHook

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             };
}

@end

@implementation AWSSageMakerServiceNotebookInstanceSummary

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
            return @(AWSSageMakerServiceInstanceTypeMlT2Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT2Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT22xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.medium"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.9xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5d9xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.18xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5d18xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP316xlarge);
        }
        return @(AWSSageMakerServiceInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceInstanceTypeMlT2Medium:
                return @"ml.t2.medium";
            case AWSSageMakerServiceInstanceTypeMlT2Large:
                return @"ml.t2.large";
            case AWSSageMakerServiceInstanceTypeMlT2Xlarge:
                return @"ml.t2.xlarge";
            case AWSSageMakerServiceInstanceTypeMlT22xlarge:
                return @"ml.t2.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSSageMakerServiceInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSSageMakerServiceInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSSageMakerServiceInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSSageMakerServiceInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSSageMakerServiceInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSSageMakerServiceInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSSageMakerServiceInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSageMakerServiceInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSageMakerServiceInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSageMakerServiceInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSSageMakerServiceInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSSageMakerServiceInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSSageMakerServiceInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSageMakerServiceInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSageMakerServiceInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSageMakerServiceInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5dXlarge:
                return @"ml.c5d.xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5d2xlarge:
                return @"ml.c5d.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5d4xlarge:
                return @"ml.c5d.4xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5d9xlarge:
                return @"ml.c5d.9xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5d18xlarge:
                return @"ml.c5d.18xlarge";
            case AWSSageMakerServiceInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSSageMakerServiceInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSSageMakerServiceInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSSageMakerServiceInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSageMakerServiceInstanceTypeMlP316xlarge:
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
            return @(AWSSageMakerServiceNotebookInstanceStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookInstanceStatusUpdating);
        }
        return @(AWSSageMakerServiceNotebookInstanceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceNotebookInstanceStatusPending:
                return @"Pending";
            case AWSSageMakerServiceNotebookInstanceStatusInService:
                return @"InService";
            case AWSSageMakerServiceNotebookInstanceStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceNotebookInstanceStatusStopped:
                return @"Stopped";
            case AWSSageMakerServiceNotebookInstanceStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceNotebookInstanceStatusDeleting:
                return @"Deleting";
            case AWSSageMakerServiceNotebookInstanceStatusUpdating:
                return @"Updating";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceNotificationConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notificationTopicArn" : @"NotificationTopicArn",
             };
}

@end

@implementation AWSSageMakerServiceObjectiveStatusCounters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failed" : @"Failed",
             @"pending" : @"Pending",
             @"succeeded" : @"Succeeded",
             };
}

@end

@implementation AWSSageMakerServiceOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3OutputLocation" : @"S3OutputLocation",
             @"targetDevice" : @"TargetDevice",
             };
}

+ (NSValueTransformer *)targetDeviceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"lambda"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceLambda);
        }
        if ([value caseInsensitiveCompare:@"ml_m4"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceMlM4);
        }
        if ([value caseInsensitiveCompare:@"ml_m5"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceMlM5);
        }
        if ([value caseInsensitiveCompare:@"ml_c4"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceMlC4);
        }
        if ([value caseInsensitiveCompare:@"ml_c5"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceMlC5);
        }
        if ([value caseInsensitiveCompare:@"ml_p2"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceMlP2);
        }
        if ([value caseInsensitiveCompare:@"ml_p3"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceMlP3);
        }
        if ([value caseInsensitiveCompare:@"ml_inf1"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceMlInf1);
        }
        if ([value caseInsensitiveCompare:@"jetson_tx1"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceJetsonTx1);
        }
        if ([value caseInsensitiveCompare:@"jetson_tx2"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceJetsonTx2);
        }
        if ([value caseInsensitiveCompare:@"jetson_nano"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceJetsonNano);
        }
        if ([value caseInsensitiveCompare:@"jetson_xavier"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceJetsonXavier);
        }
        if ([value caseInsensitiveCompare:@"rasp3b"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceRasp3b);
        }
        if ([value caseInsensitiveCompare:@"imx8qm"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceImx8qm);
        }
        if ([value caseInsensitiveCompare:@"deeplens"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceDeeplens);
        }
        if ([value caseInsensitiveCompare:@"rk3399"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceRk3399);
        }
        if ([value caseInsensitiveCompare:@"rk3288"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceRk3288);
        }
        if ([value caseInsensitiveCompare:@"aisage"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceAisage);
        }
        if ([value caseInsensitiveCompare:@"sbe_c"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceSbeC);
        }
        if ([value caseInsensitiveCompare:@"qcs605"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceQcs605);
        }
        if ([value caseInsensitiveCompare:@"qcs603"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceQcs603);
        }
        if ([value caseInsensitiveCompare:@"sitara_am57x"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceSitaraAm57x);
        }
        if ([value caseInsensitiveCompare:@"amba_cv22"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTargetDeviceAmbaCv22);
        }
        return @(AWSSageMakerServiceTargetDeviceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceTargetDeviceLambda:
                return @"lambda";
            case AWSSageMakerServiceTargetDeviceMlM4:
                return @"ml_m4";
            case AWSSageMakerServiceTargetDeviceMlM5:
                return @"ml_m5";
            case AWSSageMakerServiceTargetDeviceMlC4:
                return @"ml_c4";
            case AWSSageMakerServiceTargetDeviceMlC5:
                return @"ml_c5";
            case AWSSageMakerServiceTargetDeviceMlP2:
                return @"ml_p2";
            case AWSSageMakerServiceTargetDeviceMlP3:
                return @"ml_p3";
            case AWSSageMakerServiceTargetDeviceMlInf1:
                return @"ml_inf1";
            case AWSSageMakerServiceTargetDeviceJetsonTx1:
                return @"jetson_tx1";
            case AWSSageMakerServiceTargetDeviceJetsonTx2:
                return @"jetson_tx2";
            case AWSSageMakerServiceTargetDeviceJetsonNano:
                return @"jetson_nano";
            case AWSSageMakerServiceTargetDeviceJetsonXavier:
                return @"jetson_xavier";
            case AWSSageMakerServiceTargetDeviceRasp3b:
                return @"rasp3b";
            case AWSSageMakerServiceTargetDeviceImx8qm:
                return @"imx8qm";
            case AWSSageMakerServiceTargetDeviceDeeplens:
                return @"deeplens";
            case AWSSageMakerServiceTargetDeviceRk3399:
                return @"rk3399";
            case AWSSageMakerServiceTargetDeviceRk3288:
                return @"rk3288";
            case AWSSageMakerServiceTargetDeviceAisage:
                return @"aisage";
            case AWSSageMakerServiceTargetDeviceSbeC:
                return @"sbe_c";
            case AWSSageMakerServiceTargetDeviceQcs605:
                return @"qcs605";
            case AWSSageMakerServiceTargetDeviceQcs603:
                return @"qcs603";
            case AWSSageMakerServiceTargetDeviceSitaraAm57x:
                return @"sitara_am57x";
            case AWSSageMakerServiceTargetDeviceAmbaCv22:
                return @"amba_cv22";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceOutputDataConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"s3OutputPath" : @"S3OutputPath",
             };
}

@end

@implementation AWSSageMakerServiceParameterRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"categoricalParameterRangeSpecification" : @"CategoricalParameterRangeSpecification",
             @"continuousParameterRangeSpecification" : @"ContinuousParameterRangeSpecification",
             @"integerParameterRangeSpecification" : @"IntegerParameterRangeSpecification",
             };
}

+ (NSValueTransformer *)categoricalParameterRangeSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceCategoricalParameterRangeSpecification class]];
}

+ (NSValueTransformer *)continuousParameterRangeSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceContinuousParameterRangeSpecification class]];
}

+ (NSValueTransformer *)integerParameterRangeSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceIntegerParameterRangeSpecification class]];
}

@end

@implementation AWSSageMakerServiceParameterRanges

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"categoricalParameterRanges" : @"CategoricalParameterRanges",
             @"continuousParameterRanges" : @"ContinuousParameterRanges",
             @"integerParameterRanges" : @"IntegerParameterRanges",
             };
}

+ (NSValueTransformer *)categoricalParameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceCategoricalParameterRange class]];
}

+ (NSValueTransformer *)continuousParameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceContinuousParameterRange class]];
}

+ (NSValueTransformer *)integerParameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceIntegerParameterRange class]];
}

@end

@implementation AWSSageMakerServiceParent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentName" : @"ExperimentName",
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSSageMakerServiceParentHyperParameterTuningJob

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hyperParameterTuningJobName" : @"HyperParameterTuningJobName",
             };
}

@end

@implementation AWSSageMakerServiceProcessingClusterConfig

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
            return @(AWSSageMakerServiceProcessingInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR58xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR516xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.24xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingInstanceTypeMlR524xlarge);
        }
        return @(AWSSageMakerServiceProcessingInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceProcessingInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSSageMakerServiceProcessingInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSSageMakerServiceProcessingInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSSageMakerServiceProcessingInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR5Large:
                return @"ml.r5.large";
            case AWSSageMakerServiceProcessingInstanceTypeMlR5Xlarge:
                return @"ml.r5.xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR52xlarge:
                return @"ml.r5.2xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR54xlarge:
                return @"ml.r5.4xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR58xlarge:
                return @"ml.r5.8xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR512xlarge:
                return @"ml.r5.12xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR516xlarge:
                return @"ml.r5.16xlarge";
            case AWSSageMakerServiceProcessingInstanceTypeMlR524xlarge:
                return @"ml.r5.24xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceProcessingInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputName" : @"InputName",
             @"s3Input" : @"S3Input",
             };
}

+ (NSValueTransformer *)s3InputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceProcessingS3Input class]];
}

@end

@implementation AWSSageMakerServiceProcessingJob

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAppSpecification class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceExperimentConfig class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)networkConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceNetworkConfig class]];
}

+ (NSValueTransformer *)processingEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)processingInputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceProcessingInput class]];
}

+ (NSValueTransformer *)processingJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingJobStatusStopped);
        }
        return @(AWSSageMakerServiceProcessingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceProcessingJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceProcessingJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceProcessingJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceProcessingJobStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceProcessingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)processingOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceProcessingOutputConfig class]];
}

+ (NSValueTransformer *)processingResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceProcessingResources class]];
}

+ (NSValueTransformer *)processingStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceProcessingStoppingCondition class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceProcessingJobSummary

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
            return @(AWSSageMakerServiceProcessingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingJobStatusStopped);
        }
        return @(AWSSageMakerServiceProcessingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceProcessingJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceProcessingJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceProcessingJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceProcessingJobStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceProcessingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceProcessingOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputName" : @"OutputName",
             @"s3Output" : @"S3Output",
             };
}

+ (NSValueTransformer *)s3OutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceProcessingS3Output class]];
}

@end

@implementation AWSSageMakerServiceProcessingOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"outputs" : @"Outputs",
             };
}

+ (NSValueTransformer *)outputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceProcessingOutput class]];
}

@end

@implementation AWSSageMakerServiceProcessingResources

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterConfig" : @"ClusterConfig",
             };
}

+ (NSValueTransformer *)clusterConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceProcessingClusterConfig class]];
}

@end

@implementation AWSSageMakerServiceProcessingS3Input

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
            return @(AWSSageMakerServiceProcessingS3CompressionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"Gzip"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingS3CompressionTypeGzip);
        }
        return @(AWSSageMakerServiceProcessingS3CompressionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceProcessingS3CompressionTypeNone:
                return @"None";
            case AWSSageMakerServiceProcessingS3CompressionTypeGzip:
                return @"Gzip";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3DataDistributionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FullyReplicated"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingS3DataDistributionTypeFullyReplicated);
        }
        if ([value caseInsensitiveCompare:@"ShardedByS3Key"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingS3DataDistributionTypeShardedByS3Key);
        }
        return @(AWSSageMakerServiceProcessingS3DataDistributionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceProcessingS3DataDistributionTypeFullyReplicated:
                return @"FullyReplicated";
            case AWSSageMakerServiceProcessingS3DataDistributionTypeShardedByS3Key:
                return @"ShardedByS3Key";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3DataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ManifestFile"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingS3DataTypeManifestFile);
        }
        if ([value caseInsensitiveCompare:@"S3Prefix"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingS3DataTypeS3Prefix);
        }
        return @(AWSSageMakerServiceProcessingS3DataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceProcessingS3DataTypeManifestFile:
                return @"ManifestFile";
            case AWSSageMakerServiceProcessingS3DataTypeS3Prefix:
                return @"S3Prefix";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3InputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pipe"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingS3InputModePipe);
        }
        if ([value caseInsensitiveCompare:@"File"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingS3InputModeFile);
        }
        return @(AWSSageMakerServiceProcessingS3InputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceProcessingS3InputModePipe:
                return @"Pipe";
            case AWSSageMakerServiceProcessingS3InputModeFile:
                return @"File";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceProcessingS3Output

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
            return @(AWSSageMakerServiceProcessingS3UploadModeContinuous);
        }
        if ([value caseInsensitiveCompare:@"EndOfJob"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProcessingS3UploadModeEndOfJob);
        }
        return @(AWSSageMakerServiceProcessingS3UploadModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceProcessingS3UploadModeContinuous:
                return @"Continuous";
            case AWSSageMakerServiceProcessingS3UploadModeEndOfJob:
                return @"EndOfJob";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceProcessingStoppingCondition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxRuntimeInSeconds" : @"MaxRuntimeInSeconds",
             };
}

@end

@implementation AWSSageMakerServiceProductionVariant

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
            return @(AWSSageMakerServiceProductionVariantAcceleratorTypeMlEia1Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.eia1.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantAcceleratorTypeMlEia1Large);
        }
        if ([value caseInsensitiveCompare:@"ml.eia1.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantAcceleratorTypeMlEia1Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.eia2.medium"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantAcceleratorTypeMlEia2Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.eia2.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantAcceleratorTypeMlEia2Large);
        }
        if ([value caseInsensitiveCompare:@"ml.eia2.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantAcceleratorTypeMlEia2Xlarge);
        }
        return @(AWSSageMakerServiceProductionVariantAcceleratorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceProductionVariantAcceleratorTypeMlEia1Medium:
                return @"ml.eia1.medium";
            case AWSSageMakerServiceProductionVariantAcceleratorTypeMlEia1Large:
                return @"ml.eia1.large";
            case AWSSageMakerServiceProductionVariantAcceleratorTypeMlEia1Xlarge:
                return @"ml.eia1.xlarge";
            case AWSSageMakerServiceProductionVariantAcceleratorTypeMlEia2Medium:
                return @"ml.eia2.medium";
            case AWSSageMakerServiceProductionVariantAcceleratorTypeMlEia2Large:
                return @"ml.eia2.large";
            case AWSSageMakerServiceProductionVariantAcceleratorTypeMlEia2Xlarge:
                return @"ml.eia2.xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ml.t2.medium"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlT2Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlT2Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlT2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlT22xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5d.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlM5dLarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5d.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlM5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5d.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlM5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5d.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlM5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5d.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlM5d12xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5d.24xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlM5d24xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlC4Large);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlC5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlC5dLarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlC5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlC5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlC5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.9xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlC5d9xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.18xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlC5d18xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlG4dnXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlG4dn2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlG4dn4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlG4dn8xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlG4dn12xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlG4dn16xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlR5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlR5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlR52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlR54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlR512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5.24xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlR524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5d.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlR5dLarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5d.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlR5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5d.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlR5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5d.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlR5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5d.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlR5d12xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.r5d.24xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlR5d24xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.inf1.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlInf1Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.inf1.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlInf12xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.inf1.6xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlInf16xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.inf1.24xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProductionVariantInstanceTypeMlInf124xlarge);
        }
        return @(AWSSageMakerServiceProductionVariantInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceProductionVariantInstanceTypeMlT2Medium:
                return @"ml.t2.medium";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlT2Large:
                return @"ml.t2.large";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlT2Xlarge:
                return @"ml.t2.xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlT22xlarge:
                return @"ml.t2.2xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlM5dLarge:
                return @"ml.m5d.large";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlM5dXlarge:
                return @"ml.m5d.xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlM5d2xlarge:
                return @"ml.m5d.2xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlM5d4xlarge:
                return @"ml.m5d.4xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlM5d12xlarge:
                return @"ml.m5d.12xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlM5d24xlarge:
                return @"ml.m5d.24xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlC4Large:
                return @"ml.c4.large";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlC5Large:
                return @"ml.c5.large";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlC5dLarge:
                return @"ml.c5d.large";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlC5dXlarge:
                return @"ml.c5d.xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlC5d2xlarge:
                return @"ml.c5d.2xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlC5d4xlarge:
                return @"ml.c5d.4xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlC5d9xlarge:
                return @"ml.c5d.9xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlC5d18xlarge:
                return @"ml.c5d.18xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlG4dnXlarge:
                return @"ml.g4dn.xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlG4dn2xlarge:
                return @"ml.g4dn.2xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlG4dn4xlarge:
                return @"ml.g4dn.4xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlG4dn8xlarge:
                return @"ml.g4dn.8xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlG4dn12xlarge:
                return @"ml.g4dn.12xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlG4dn16xlarge:
                return @"ml.g4dn.16xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlR5Large:
                return @"ml.r5.large";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlR5Xlarge:
                return @"ml.r5.xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlR52xlarge:
                return @"ml.r5.2xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlR54xlarge:
                return @"ml.r5.4xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlR512xlarge:
                return @"ml.r5.12xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlR524xlarge:
                return @"ml.r5.24xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlR5dLarge:
                return @"ml.r5d.large";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlR5dXlarge:
                return @"ml.r5d.xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlR5d2xlarge:
                return @"ml.r5d.2xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlR5d4xlarge:
                return @"ml.r5d.4xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlR5d12xlarge:
                return @"ml.r5d.12xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlR5d24xlarge:
                return @"ml.r5d.24xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlInf1Xlarge:
                return @"ml.inf1.xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlInf12xlarge:
                return @"ml.inf1.2xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlInf16xlarge:
                return @"ml.inf1.6xlarge";
            case AWSSageMakerServiceProductionVariantInstanceTypeMlInf124xlarge:
                return @"ml.inf1.24xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceProductionVariantSummary

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceDeployedImage class]];
}

@end

@implementation AWSSageMakerServicePropertyNameQuery

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"propertyNameHint" : @"PropertyNameHint",
             };
}

@end

@implementation AWSSageMakerServicePropertyNameSuggestion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"propertyName" : @"PropertyName",
             };
}

@end

@implementation AWSSageMakerServicePublicWorkforceTaskPrice

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amountInUsd" : @"AmountInUsd",
             };
}

+ (NSValueTransformer *)amountInUsdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUSD class]];
}

@end

@implementation AWSSageMakerServiceRenderUiTemplateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"RoleArn",
             @"task" : @"Task",
             @"uiTemplate" : @"UiTemplate",
             };
}

+ (NSValueTransformer *)taskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceRenderableTask class]];
}

+ (NSValueTransformer *)uiTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUiTemplate class]];
}

@end

@implementation AWSSageMakerServiceRenderUiTemplateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             @"renderedContent" : @"RenderedContent",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceRenderingError class]];
}

@end

@implementation AWSSageMakerServiceRenderableTask

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"input" : @"Input",
             };
}

@end

@implementation AWSSageMakerServiceRenderingError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

@end

@implementation AWSSageMakerServiceResolvedAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLJobObjective" : @"AutoMLJobObjective",
             @"completionCriteria" : @"CompletionCriteria",
             @"problemType" : @"ProblemType",
             };
}

+ (NSValueTransformer *)autoMLJobObjectiveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAutoMLJobObjective class]];
}

+ (NSValueTransformer *)completionCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAutoMLJobCompletionCriteria class]];
}

+ (NSValueTransformer *)problemTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BinaryClassification"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProblemTypeBinaryClassification);
        }
        if ([value caseInsensitiveCompare:@"MulticlassClassification"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProblemTypeMulticlassClassification);
        }
        if ([value caseInsensitiveCompare:@"Regression"] == NSOrderedSame) {
            return @(AWSSageMakerServiceProblemTypeRegression);
        }
        return @(AWSSageMakerServiceProblemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceProblemTypeBinaryClassification:
                return @"BinaryClassification";
            case AWSSageMakerServiceProblemTypeMulticlassClassification:
                return @"MulticlassClassification";
            case AWSSageMakerServiceProblemTypeRegression:
                return @"Regression";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceResourceConfig

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
            return @(AWSSageMakerServiceTrainingInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlG4dnXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlG4dn2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlG4dn4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlG4dn8xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlG4dn12xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlG4dn16xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3dn.24xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlP3dn24xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5n.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlC5nXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5n.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlC5n2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5n.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlC5n4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5n.9xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlC5n9xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5n.18xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInstanceTypeMlC5n18xlarge);
        }
        return @(AWSSageMakerServiceTrainingInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceTrainingInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlG4dnXlarge:
                return @"ml.g4dn.xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlG4dn2xlarge:
                return @"ml.g4dn.2xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlG4dn4xlarge:
                return @"ml.g4dn.4xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlG4dn8xlarge:
                return @"ml.g4dn.8xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlG4dn12xlarge:
                return @"ml.g4dn.12xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlG4dn16xlarge:
                return @"ml.g4dn.16xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSSageMakerServiceTrainingInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlP3dn24xlarge:
                return @"ml.p3dn.24xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlC5nXlarge:
                return @"ml.c5n.xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlC5n2xlarge:
                return @"ml.c5n.2xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlC5n4xlarge:
                return @"ml.c5n.4xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlC5n9xlarge:
                return @"ml.c5n.9xlarge";
            case AWSSageMakerServiceTrainingInstanceTypeMlC5n18xlarge:
                return @"ml.c5n.18xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceResourceLimits

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxNumberOfTrainingJobs" : @"MaxNumberOfTrainingJobs",
             @"maxParallelTrainingJobs" : @"MaxParallelTrainingJobs",
             };
}

@end

@implementation AWSSageMakerServiceResourceSpec

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceType" : @"InstanceType",
             @"sageMakerImageArn" : @"SageMakerImageArn",
             };
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"system"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeSystem);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.micro"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlT3Micro);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.small"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlT3Small);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.medium"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlM58xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlM516xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlC5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlC512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.24xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlC524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlG4dnXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlG4dn2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlG4dn4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlG4dn8xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlG4dn12xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.g4dn.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAppInstanceTypeMlG4dn16xlarge);
        }
        return @(AWSSageMakerServiceAppInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAppInstanceTypeSystem:
                return @"system";
            case AWSSageMakerServiceAppInstanceTypeMlT3Micro:
                return @"ml.t3.micro";
            case AWSSageMakerServiceAppInstanceTypeMlT3Small:
                return @"ml.t3.small";
            case AWSSageMakerServiceAppInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSSageMakerServiceAppInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSSageMakerServiceAppInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSSageMakerServiceAppInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlM58xlarge:
                return @"ml.m5.8xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlM516xlarge:
                return @"ml.m5.16xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlC5Large:
                return @"ml.c5.large";
            case AWSSageMakerServiceAppInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlC512xlarge:
                return @"ml.c5.12xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlC524xlarge:
                return @"ml.c5.24xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlG4dnXlarge:
                return @"ml.g4dn.xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlG4dn2xlarge:
                return @"ml.g4dn.2xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlG4dn4xlarge:
                return @"ml.g4dn.4xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlG4dn8xlarge:
                return @"ml.g4dn.8xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlG4dn12xlarge:
                return @"ml.g4dn.12xlarge";
            case AWSSageMakerServiceAppInstanceTypeMlG4dn16xlarge:
                return @"ml.g4dn.16xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceRetentionPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"homeEfsFileSystem" : @"HomeEfsFileSystem",
             };
}

+ (NSValueTransformer *)homeEfsFileSystemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Retain"] == NSOrderedSame) {
            return @(AWSSageMakerServiceRetentionTypeRetain);
        }
        if ([value caseInsensitiveCompare:@"Delete"] == NSOrderedSame) {
            return @(AWSSageMakerServiceRetentionTypeDelete);
        }
        return @(AWSSageMakerServiceRetentionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceRetentionTypeRetain:
                return @"Retain";
            case AWSSageMakerServiceRetentionTypeDelete:
                return @"Delete";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceS3DataSource

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
            return @(AWSSageMakerServiceS3DataDistributionFullyReplicated);
        }
        if ([value caseInsensitiveCompare:@"ShardedByS3Key"] == NSOrderedSame) {
            return @(AWSSageMakerServiceS3DataDistributionShardedByS3Key);
        }
        return @(AWSSageMakerServiceS3DataDistributionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceS3DataDistributionFullyReplicated:
                return @"FullyReplicated";
            case AWSSageMakerServiceS3DataDistributionShardedByS3Key:
                return @"ShardedByS3Key";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3DataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ManifestFile"] == NSOrderedSame) {
            return @(AWSSageMakerServiceS3DataTypeManifestFile);
        }
        if ([value caseInsensitiveCompare:@"S3Prefix"] == NSOrderedSame) {
            return @(AWSSageMakerServiceS3DataTypeS3Prefix);
        }
        if ([value caseInsensitiveCompare:@"AugmentedManifestFile"] == NSOrderedSame) {
            return @(AWSSageMakerServiceS3DataTypeAugmentedManifestFile);
        }
        return @(AWSSageMakerServiceS3DataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceS3DataTypeManifestFile:
                return @"ManifestFile";
            case AWSSageMakerServiceS3DataTypeS3Prefix:
                return @"S3Prefix";
            case AWSSageMakerServiceS3DataTypeAugmentedManifestFile:
                return @"AugmentedManifestFile";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceScheduleConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduleExpression" : @"ScheduleExpression",
             };
}

@end

@implementation AWSSageMakerServiceSearchExpression

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"nestedFilters" : @"NestedFilters",
             @"operator" : @"Operator",
             @"subExpressions" : @"SubExpressions",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceFilter class]];
}

+ (NSValueTransformer *)nestedFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceNestedFilters class]];
}

+ (NSValueTransformer *)operatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"And"] == NSOrderedSame) {
            return @(AWSSageMakerServiceBooleanOperatorAnd);
        }
        if ([value caseInsensitiveCompare:@"Or"] == NSOrderedSame) {
            return @(AWSSageMakerServiceBooleanOperatorOr);
        }
        return @(AWSSageMakerServiceBooleanOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceBooleanOperatorAnd:
                return @"And";
            case AWSSageMakerServiceBooleanOperatorOr:
                return @"Or";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)subExpressionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceSearchExpression class]];
}

@end

@implementation AWSSageMakerServiceSearchRecord

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experiment" : @"Experiment",
             @"trainingJob" : @"TrainingJob",
             @"trial" : @"Trial",
             @"trialComponent" : @"TrialComponent",
             };
}

+ (NSValueTransformer *)experimentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceExperiment class]];
}

+ (NSValueTransformer *)trainingJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrainingJob class]];
}

+ (NSValueTransformer *)trialJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrial class]];
}

+ (NSValueTransformer *)trialComponentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrialComponent class]];
}

@end

@implementation AWSSageMakerServiceSearchRequest

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
            return @(AWSSageMakerServiceResourceTypeTrainingJob);
        }
        if ([value caseInsensitiveCompare:@"Experiment"] == NSOrderedSame) {
            return @(AWSSageMakerServiceResourceTypeExperiment);
        }
        if ([value caseInsensitiveCompare:@"ExperimentTrial"] == NSOrderedSame) {
            return @(AWSSageMakerServiceResourceTypeExperimentTrial);
        }
        if ([value caseInsensitiveCompare:@"ExperimentTrialComponent"] == NSOrderedSame) {
            return @(AWSSageMakerServiceResourceTypeExperimentTrialComponent);
        }
        return @(AWSSageMakerServiceResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceResourceTypeTrainingJob:
                return @"TrainingJob";
            case AWSSageMakerServiceResourceTypeExperiment:
                return @"Experiment";
            case AWSSageMakerServiceResourceTypeExperimentTrial:
                return @"ExperimentTrial";
            case AWSSageMakerServiceResourceTypeExperimentTrialComponent:
                return @"ExperimentTrialComponent";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)searchExpressionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceSearchExpression class]];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Ascending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSearchSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"Descending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSearchSortOrderDescending);
        }
        return @(AWSSageMakerServiceSearchSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSearchSortOrderAscending:
                return @"Ascending";
            case AWSSageMakerServiceSearchSortOrderDescending:
                return @"Descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceSearchResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"results" : @"Results",
             };
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceSearchRecord class]];
}

@end

@implementation AWSSageMakerServiceSecondaryStatusTransition

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
            return @(AWSSageMakerServiceSecondaryStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"LaunchingMLInstances"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusLaunchingMLInstances);
        }
        if ([value caseInsensitiveCompare:@"PreparingTrainingStack"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusPreparingTrainingStack);
        }
        if ([value caseInsensitiveCompare:@"Downloading"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusDownloading);
        }
        if ([value caseInsensitiveCompare:@"DownloadingTrainingImage"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusDownloadingTrainingImage);
        }
        if ([value caseInsensitiveCompare:@"Training"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusTraining);
        }
        if ([value caseInsensitiveCompare:@"Uploading"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusUploading);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"MaxRuntimeExceeded"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusMaxRuntimeExceeded);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Interrupted"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusInterrupted);
        }
        if ([value caseInsensitiveCompare:@"MaxWaitTimeExceeded"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusMaxWaitTimeExceeded);
        }
        return @(AWSSageMakerServiceSecondaryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSecondaryStatusStarting:
                return @"Starting";
            case AWSSageMakerServiceSecondaryStatusLaunchingMLInstances:
                return @"LaunchingMLInstances";
            case AWSSageMakerServiceSecondaryStatusPreparingTrainingStack:
                return @"PreparingTrainingStack";
            case AWSSageMakerServiceSecondaryStatusDownloading:
                return @"Downloading";
            case AWSSageMakerServiceSecondaryStatusDownloadingTrainingImage:
                return @"DownloadingTrainingImage";
            case AWSSageMakerServiceSecondaryStatusTraining:
                return @"Training";
            case AWSSageMakerServiceSecondaryStatusUploading:
                return @"Uploading";
            case AWSSageMakerServiceSecondaryStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceSecondaryStatusStopped:
                return @"Stopped";
            case AWSSageMakerServiceSecondaryStatusMaxRuntimeExceeded:
                return @"MaxRuntimeExceeded";
            case AWSSageMakerServiceSecondaryStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceSecondaryStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceSecondaryStatusInterrupted:
                return @"Interrupted";
            case AWSSageMakerServiceSecondaryStatusMaxWaitTimeExceeded:
                return @"MaxWaitTimeExceeded";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceSharingSettings

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
            return @(AWSSageMakerServiceNotebookOutputOptionAllowed);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSSageMakerServiceNotebookOutputOptionDisabled);
        }
        return @(AWSSageMakerServiceNotebookOutputOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceNotebookOutputOptionAllowed:
                return @"Allowed";
            case AWSSageMakerServiceNotebookOutputOptionDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceShuffleConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"seed" : @"Seed",
             };
}

@end

@implementation AWSSageMakerServiceSourceAlgorithm

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmName" : @"AlgorithmName",
             @"modelDataUrl" : @"ModelDataUrl",
             };
}

@end

@implementation AWSSageMakerServiceSourceAlgorithmSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceAlgorithms" : @"SourceAlgorithms",
             };
}

+ (NSValueTransformer *)sourceAlgorithmsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceSourceAlgorithm class]];
}

@end

@implementation AWSSageMakerServiceSourceIpConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrs" : @"Cidrs",
             };
}

@end

@implementation AWSSageMakerServiceStartMonitoringScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             };
}

@end

@implementation AWSSageMakerServiceStartNotebookInstanceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceName" : @"NotebookInstanceName",
             };
}

@end

@implementation AWSSageMakerServiceStopAutoMLJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLJobName" : @"AutoMLJobName",
             };
}

@end

@implementation AWSSageMakerServiceStopCompilationJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compilationJobName" : @"CompilationJobName",
             };
}

@end

@implementation AWSSageMakerServiceStopHyperParameterTuningJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hyperParameterTuningJobName" : @"HyperParameterTuningJobName",
             };
}

@end

@implementation AWSSageMakerServiceStopLabelingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelingJobName" : @"LabelingJobName",
             };
}

@end

@implementation AWSSageMakerServiceStopMonitoringScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             };
}

@end

@implementation AWSSageMakerServiceStopNotebookInstanceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceName" : @"NotebookInstanceName",
             };
}

@end

@implementation AWSSageMakerServiceStopProcessingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"processingJobName" : @"ProcessingJobName",
             };
}

@end

@implementation AWSSageMakerServiceStopTrainingJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trainingJobName" : @"TrainingJobName",
             };
}

@end

@implementation AWSSageMakerServiceStopTransformJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformJobName" : @"TransformJobName",
             };
}

@end

@implementation AWSSageMakerServiceStoppingCondition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxRuntimeInSeconds" : @"MaxRuntimeInSeconds",
             @"maxWaitTimeInSeconds" : @"MaxWaitTimeInSeconds",
             };
}

@end

@implementation AWSSageMakerServiceSubscribedWorkteam

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

@implementation AWSSageMakerServiceSuggestionQuery

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"propertyNameQuery" : @"PropertyNameQuery",
             };
}

+ (NSValueTransformer *)propertyNameQueryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServicePropertyNameQuery class]];
}

@end

@implementation AWSSageMakerServiceTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSSageMakerServiceTensorBoardAppSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultResourceSpec" : @"DefaultResourceSpec",
             };
}

+ (NSValueTransformer *)defaultResourceSpecJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceResourceSpec class]];
}

@end

@implementation AWSSageMakerServiceTensorBoardOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"localPath" : @"LocalPath",
             @"s3OutputPath" : @"S3OutputPath",
             };
}

@end

@implementation AWSSageMakerServiceTrainingJob

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceAlgorithmSpecification class]];
}

+ (NSValueTransformer *)checkpointConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceCheckpointConfig class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)debugHookConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceDebugHookConfig class]];
}

+ (NSValueTransformer *)debugRuleConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceDebugRuleConfiguration class]];
}

+ (NSValueTransformer *)debugRuleEvaluationStatusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceDebugRuleEvaluationStatus class]];
}

+ (NSValueTransformer *)experimentConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceExperimentConfig class]];
}

+ (NSValueTransformer *)finalMetricDataListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceMetricData class]];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceChannel class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)modelArtifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceModelArtifacts class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceOutputDataConfig class]];
}

+ (NSValueTransformer *)resourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceResourceConfig class]];
}

+ (NSValueTransformer *)secondaryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Starting"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"LaunchingMLInstances"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusLaunchingMLInstances);
        }
        if ([value caseInsensitiveCompare:@"PreparingTrainingStack"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusPreparingTrainingStack);
        }
        if ([value caseInsensitiveCompare:@"Downloading"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusDownloading);
        }
        if ([value caseInsensitiveCompare:@"DownloadingTrainingImage"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusDownloadingTrainingImage);
        }
        if ([value caseInsensitiveCompare:@"Training"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusTraining);
        }
        if ([value caseInsensitiveCompare:@"Uploading"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusUploading);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"MaxRuntimeExceeded"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusMaxRuntimeExceeded);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Interrupted"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusInterrupted);
        }
        if ([value caseInsensitiveCompare:@"MaxWaitTimeExceeded"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSecondaryStatusMaxWaitTimeExceeded);
        }
        return @(AWSSageMakerServiceSecondaryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSecondaryStatusStarting:
                return @"Starting";
            case AWSSageMakerServiceSecondaryStatusLaunchingMLInstances:
                return @"LaunchingMLInstances";
            case AWSSageMakerServiceSecondaryStatusPreparingTrainingStack:
                return @"PreparingTrainingStack";
            case AWSSageMakerServiceSecondaryStatusDownloading:
                return @"Downloading";
            case AWSSageMakerServiceSecondaryStatusDownloadingTrainingImage:
                return @"DownloadingTrainingImage";
            case AWSSageMakerServiceSecondaryStatusTraining:
                return @"Training";
            case AWSSageMakerServiceSecondaryStatusUploading:
                return @"Uploading";
            case AWSSageMakerServiceSecondaryStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceSecondaryStatusStopped:
                return @"Stopped";
            case AWSSageMakerServiceSecondaryStatusMaxRuntimeExceeded:
                return @"MaxRuntimeExceeded";
            case AWSSageMakerServiceSecondaryStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceSecondaryStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceSecondaryStatusInterrupted:
                return @"Interrupted";
            case AWSSageMakerServiceSecondaryStatusMaxWaitTimeExceeded:
                return @"MaxWaitTimeExceeded";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)secondaryStatusTransitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceSecondaryStatusTransition class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceStoppingCondition class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

+ (NSValueTransformer *)tensorBoardOutputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTensorBoardOutputConfig class]];
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
            return @(AWSSageMakerServiceTrainingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusStopped);
        }
        return @(AWSSageMakerServiceTrainingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceTrainingJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceTrainingJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceTrainingJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceTrainingJobStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceTrainingJobStatusStopped:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceVpcConfig class]];
}

@end

@implementation AWSSageMakerServiceTrainingJobDefinition

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceChannel class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceOutputDataConfig class]];
}

+ (NSValueTransformer *)resourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceResourceConfig class]];
}

+ (NSValueTransformer *)stoppingConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceStoppingCondition class]];
}

+ (NSValueTransformer *)trainingInputModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pipe"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInputModePipe);
        }
        if ([value caseInsensitiveCompare:@"File"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingInputModeFile);
        }
        return @(AWSSageMakerServiceTrainingInputModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceTrainingInputModePipe:
                return @"Pipe";
            case AWSSageMakerServiceTrainingInputModeFile:
                return @"File";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceTrainingJobStatusCounters

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

@implementation AWSSageMakerServiceTrainingJobSummary

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
            return @(AWSSageMakerServiceTrainingJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrainingJobStatusStopped);
        }
        return @(AWSSageMakerServiceTrainingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceTrainingJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceTrainingJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceTrainingJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceTrainingJobStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceTrainingJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceTrainingSpecification

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceMetricDefinition class]];
}

+ (NSValueTransformer *)supportedHyperParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceHyperParameterSpecification class]];
}

+ (NSValueTransformer *)supportedTuningJobObjectiveMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceHyperParameterTuningJobObjective class]];
}

+ (NSValueTransformer *)trainingChannelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceChannelSpecification class]];
}

@end

@implementation AWSSageMakerServiceTransformDataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3DataSource" : @"S3DataSource",
             };
}

+ (NSValueTransformer *)s3DataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTransformS3DataSource class]];
}

@end

@implementation AWSSageMakerServiceTransformInput

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
            return @(AWSSageMakerServiceCompressionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"Gzip"] == NSOrderedSame) {
            return @(AWSSageMakerServiceCompressionTypeGzip);
        }
        return @(AWSSageMakerServiceCompressionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceCompressionTypeNone:
                return @"None";
            case AWSSageMakerServiceCompressionTypeGzip:
                return @"Gzip";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTransformDataSource class]];
}

+ (NSValueTransformer *)splitTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSplitTypeNone);
        }
        if ([value caseInsensitiveCompare:@"Line"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSplitTypeLine);
        }
        if ([value caseInsensitiveCompare:@"RecordIO"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSplitTypeRecordIO);
        }
        if ([value caseInsensitiveCompare:@"TFRecord"] == NSOrderedSame) {
            return @(AWSSageMakerServiceSplitTypeTFRecord);
        }
        return @(AWSSageMakerServiceSplitTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceSplitTypeNone:
                return @"None";
            case AWSSageMakerServiceSplitTypeLine:
                return @"Line";
            case AWSSageMakerServiceSplitTypeRecordIO:
                return @"RecordIO";
            case AWSSageMakerServiceSplitTypeTFRecord:
                return @"TFRecord";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceTransformJobDefinition

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
            return @(AWSSageMakerServiceBatchStrategyMultiRecord);
        }
        if ([value caseInsensitiveCompare:@"SingleRecord"] == NSOrderedSame) {
            return @(AWSSageMakerServiceBatchStrategySingleRecord);
        }
        return @(AWSSageMakerServiceBatchStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceBatchStrategyMultiRecord:
                return @"MultiRecord";
            case AWSSageMakerServiceBatchStrategySingleRecord:
                return @"SingleRecord";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transformInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTransformInput class]];
}

+ (NSValueTransformer *)transformOutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTransformOutput class]];
}

+ (NSValueTransformer *)transformResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTransformResources class]];
}

@end

@implementation AWSSageMakerServiceTransformJobSummary

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
            return @(AWSSageMakerServiceTransformJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformJobStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformJobStatusStopped);
        }
        return @(AWSSageMakerServiceTransformJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceTransformJobStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceTransformJobStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceTransformJobStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceTransformJobStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceTransformJobStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceTransformOutput

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
            return @(AWSSageMakerServiceAssemblyTypeNone);
        }
        if ([value caseInsensitiveCompare:@"Line"] == NSOrderedSame) {
            return @(AWSSageMakerServiceAssemblyTypeLine);
        }
        return @(AWSSageMakerServiceAssemblyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceAssemblyTypeNone:
                return @"None";
            case AWSSageMakerServiceAssemblyTypeLine:
                return @"Line";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceTransformResources

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
            return @(AWSSageMakerServiceTransformInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlP316xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlM5Large);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTransformInstanceTypeMlM524xlarge);
        }
        return @(AWSSageMakerServiceTransformInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceTransformInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlM5Large:
                return @"ml.m5.large";
            case AWSSageMakerServiceTransformInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSageMakerServiceTransformInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceTransformS3DataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3DataType" : @"S3DataType",
             @"s3Uri" : @"S3Uri",
             };
}

+ (NSValueTransformer *)s3DataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ManifestFile"] == NSOrderedSame) {
            return @(AWSSageMakerServiceS3DataTypeManifestFile);
        }
        if ([value caseInsensitiveCompare:@"S3Prefix"] == NSOrderedSame) {
            return @(AWSSageMakerServiceS3DataTypeS3Prefix);
        }
        if ([value caseInsensitiveCompare:@"AugmentedManifestFile"] == NSOrderedSame) {
            return @(AWSSageMakerServiceS3DataTypeAugmentedManifestFile);
        }
        return @(AWSSageMakerServiceS3DataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceS3DataTypeManifestFile:
                return @"ManifestFile";
            case AWSSageMakerServiceS3DataTypeS3Prefix:
                return @"S3Prefix";
            case AWSSageMakerServiceS3DataTypeAugmentedManifestFile:
                return @"AugmentedManifestFile";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceTrial

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserContext class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserContext class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrialSource class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

+ (NSValueTransformer *)trialComponentSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTrialComponentSimpleSummary class]];
}

@end

@implementation AWSSageMakerServiceTrialComponent

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserContext class]];
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
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSageMakerServiceTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)lastModifiedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserContext class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)metricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTrialComponentMetricSummary class]];
}

+ (NSValueTransformer *)outputArtifactsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSageMakerServiceTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSageMakerServiceTrialComponentParameterValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)parentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceParent class]];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrialComponentSource class]];
}

+ (NSValueTransformer *)sourceDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrialComponentSourceDetail class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrialComponentStatus class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceTag class]];
}

@end

@implementation AWSSageMakerServiceTrialComponentArtifact

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mediaType" : @"MediaType",
             @"value" : @"Value",
             };
}

@end

@implementation AWSSageMakerServiceTrialComponentMetricSummary

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

@implementation AWSSageMakerServiceTrialComponentParameterValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"numberValue" : @"NumberValue",
             @"stringValue" : @"StringValue",
             };
}

@end

@implementation AWSSageMakerServiceTrialComponentSimpleSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserContext class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)trialComponentSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrialComponentSource class]];
}

@end

@implementation AWSSageMakerServiceTrialComponentSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceArn" : @"SourceArn",
             @"sourceType" : @"SourceType",
             };
}

@end

@implementation AWSSageMakerServiceTrialComponentSourceDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"processingJob" : @"ProcessingJob",
             @"sourceArn" : @"SourceArn",
             @"trainingJob" : @"TrainingJob",
             };
}

+ (NSValueTransformer *)processingJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceProcessingJob class]];
}

+ (NSValueTransformer *)trainingJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrainingJob class]];
}

@end

@implementation AWSSageMakerServiceTrialComponentStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"primaryStatus" : @"PrimaryStatus",
             };
}

+ (NSValueTransformer *)primaryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrialComponentPrimaryStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrialComponentPrimaryStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrialComponentPrimaryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrialComponentPrimaryStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSSageMakerServiceTrialComponentPrimaryStatusStopped);
        }
        return @(AWSSageMakerServiceTrialComponentPrimaryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceTrialComponentPrimaryStatusInProgress:
                return @"InProgress";
            case AWSSageMakerServiceTrialComponentPrimaryStatusCompleted:
                return @"Completed";
            case AWSSageMakerServiceTrialComponentPrimaryStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceTrialComponentPrimaryStatusStopping:
                return @"Stopping";
            case AWSSageMakerServiceTrialComponentPrimaryStatusStopped:
                return @"Stopped";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceTrialComponentSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserContext class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserContext class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrialComponentStatus class]];
}

+ (NSValueTransformer *)trialComponentSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrialComponentSource class]];
}

@end

@implementation AWSSageMakerServiceTrialSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceArn" : @"SourceArn",
             @"sourceType" : @"SourceType",
             };
}

@end

@implementation AWSSageMakerServiceTrialSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrialSource class]];
}

@end

@implementation AWSSageMakerServiceTuningJobCompletionCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetObjectiveMetricValue" : @"TargetObjectiveMetricValue",
             };
}

@end

@implementation AWSSageMakerServiceUSD

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cents" : @"Cents",
             @"dollars" : @"Dollars",
             @"tenthFractionsOfACent" : @"TenthFractionsOfACent",
             };
}

@end

@implementation AWSSageMakerServiceUiConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"uiTemplateS3Uri" : @"UiTemplateS3Uri",
             };
}

@end

@implementation AWSSageMakerServiceUiTemplate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             };
}

@end

@implementation AWSSageMakerServiceUiTemplateInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentSha256" : @"ContentSha256",
             @"url" : @"Url",
             };
}

@end

@implementation AWSSageMakerServiceUpdateCodeRepositoryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositoryName" : @"CodeRepositoryName",
             @"gitConfig" : @"GitConfig",
             };
}

+ (NSValueTransformer *)gitConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceGitConfigForUpdate class]];
}

@end

@implementation AWSSageMakerServiceUpdateCodeRepositoryOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeRepositoryArn" : @"CodeRepositoryArn",
             };
}

@end

@implementation AWSSageMakerServiceUpdateDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultUserSettings" : @"DefaultUserSettings",
             @"domainId" : @"DomainId",
             };
}

+ (NSValueTransformer *)defaultUserSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserSettings class]];
}

@end

@implementation AWSSageMakerServiceUpdateDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainArn" : @"DomainArn",
             };
}

@end

@implementation AWSSageMakerServiceUpdateEndpointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointConfigName" : @"EndpointConfigName",
             @"endpointName" : @"EndpointName",
             @"excludeRetainedVariantProperties" : @"ExcludeRetainedVariantProperties",
             @"retainAllVariantProperties" : @"RetainAllVariantProperties",
             };
}

+ (NSValueTransformer *)excludeRetainedVariantPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceVariantProperty class]];
}

@end

@implementation AWSSageMakerServiceUpdateEndpointOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"desiredWeightsAndCapacities" : @"DesiredWeightsAndCapacities",
             @"endpointName" : @"EndpointName",
             };
}

+ (NSValueTransformer *)desiredWeightsAndCapacitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceDesiredWeightAndCapacity class]];
}

@end

@implementation AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSSageMakerServiceUpdateExperimentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"displayName" : @"DisplayName",
             @"experimentName" : @"ExperimentName",
             };
}

@end

@implementation AWSSageMakerServiceUpdateExperimentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"experimentArn" : @"ExperimentArn",
             };
}

@end

@implementation AWSSageMakerServiceUpdateMonitoringScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleConfig" : @"MonitoringScheduleConfig",
             @"monitoringScheduleName" : @"MonitoringScheduleName",
             };
}

+ (NSValueTransformer *)monitoringScheduleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceMonitoringScheduleConfig class]];
}

@end

@implementation AWSSageMakerServiceUpdateMonitoringScheduleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"monitoringScheduleArn" : @"MonitoringScheduleArn",
             };
}

@end

@implementation AWSSageMakerServiceUpdateNotebookInstanceInput

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
            return @(AWSSageMakerServiceInstanceTypeMlT2Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT2Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t2.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT22xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.medium"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT3Medium);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.large"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT3Large);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT3Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.t3.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlT32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.10xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM410xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m4.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM416xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.12xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM512xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.m5.24xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlM524xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC4Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC42xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC44xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c4.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC48xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC52xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC54xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.9xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC59xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5.18xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC518xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5dXlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5d2xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.4xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5d4xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.9xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5d9xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.c5d.18xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlC5d18xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP2Xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP28xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p2.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP216xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.2xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP32xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.8xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP38xlarge);
        }
        if ([value caseInsensitiveCompare:@"ml.p3.16xlarge"] == NSOrderedSame) {
            return @(AWSSageMakerServiceInstanceTypeMlP316xlarge);
        }
        return @(AWSSageMakerServiceInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceInstanceTypeMlT2Medium:
                return @"ml.t2.medium";
            case AWSSageMakerServiceInstanceTypeMlT2Large:
                return @"ml.t2.large";
            case AWSSageMakerServiceInstanceTypeMlT2Xlarge:
                return @"ml.t2.xlarge";
            case AWSSageMakerServiceInstanceTypeMlT22xlarge:
                return @"ml.t2.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlT3Medium:
                return @"ml.t3.medium";
            case AWSSageMakerServiceInstanceTypeMlT3Large:
                return @"ml.t3.large";
            case AWSSageMakerServiceInstanceTypeMlT3Xlarge:
                return @"ml.t3.xlarge";
            case AWSSageMakerServiceInstanceTypeMlT32xlarge:
                return @"ml.t3.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlM4Xlarge:
                return @"ml.m4.xlarge";
            case AWSSageMakerServiceInstanceTypeMlM42xlarge:
                return @"ml.m4.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlM44xlarge:
                return @"ml.m4.4xlarge";
            case AWSSageMakerServiceInstanceTypeMlM410xlarge:
                return @"ml.m4.10xlarge";
            case AWSSageMakerServiceInstanceTypeMlM416xlarge:
                return @"ml.m4.16xlarge";
            case AWSSageMakerServiceInstanceTypeMlM5Xlarge:
                return @"ml.m5.xlarge";
            case AWSSageMakerServiceInstanceTypeMlM52xlarge:
                return @"ml.m5.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlM54xlarge:
                return @"ml.m5.4xlarge";
            case AWSSageMakerServiceInstanceTypeMlM512xlarge:
                return @"ml.m5.12xlarge";
            case AWSSageMakerServiceInstanceTypeMlM524xlarge:
                return @"ml.m5.24xlarge";
            case AWSSageMakerServiceInstanceTypeMlC4Xlarge:
                return @"ml.c4.xlarge";
            case AWSSageMakerServiceInstanceTypeMlC42xlarge:
                return @"ml.c4.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlC44xlarge:
                return @"ml.c4.4xlarge";
            case AWSSageMakerServiceInstanceTypeMlC48xlarge:
                return @"ml.c4.8xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5Xlarge:
                return @"ml.c5.xlarge";
            case AWSSageMakerServiceInstanceTypeMlC52xlarge:
                return @"ml.c5.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlC54xlarge:
                return @"ml.c5.4xlarge";
            case AWSSageMakerServiceInstanceTypeMlC59xlarge:
                return @"ml.c5.9xlarge";
            case AWSSageMakerServiceInstanceTypeMlC518xlarge:
                return @"ml.c5.18xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5dXlarge:
                return @"ml.c5d.xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5d2xlarge:
                return @"ml.c5d.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5d4xlarge:
                return @"ml.c5d.4xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5d9xlarge:
                return @"ml.c5d.9xlarge";
            case AWSSageMakerServiceInstanceTypeMlC5d18xlarge:
                return @"ml.c5d.18xlarge";
            case AWSSageMakerServiceInstanceTypeMlP2Xlarge:
                return @"ml.p2.xlarge";
            case AWSSageMakerServiceInstanceTypeMlP28xlarge:
                return @"ml.p2.8xlarge";
            case AWSSageMakerServiceInstanceTypeMlP216xlarge:
                return @"ml.p2.16xlarge";
            case AWSSageMakerServiceInstanceTypeMlP32xlarge:
                return @"ml.p3.2xlarge";
            case AWSSageMakerServiceInstanceTypeMlP38xlarge:
                return @"ml.p3.8xlarge";
            case AWSSageMakerServiceInstanceTypeMlP316xlarge:
                return @"ml.p3.16xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rootAccessJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSSageMakerServiceRootAccessEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSSageMakerServiceRootAccessDisabled);
        }
        return @(AWSSageMakerServiceRootAccessUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceRootAccessEnabled:
                return @"Enabled";
            case AWSSageMakerServiceRootAccessDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notebookInstanceLifecycleConfigName" : @"NotebookInstanceLifecycleConfigName",
             @"onCreate" : @"OnCreate",
             @"onStart" : @"OnStart",
             };
}

+ (NSValueTransformer *)onCreateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceNotebookInstanceLifecycleHook class]];
}

+ (NSValueTransformer *)onStartJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceNotebookInstanceLifecycleHook class]];
}

@end

@implementation AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigOutput

@end

@implementation AWSSageMakerServiceUpdateNotebookInstanceOutput

@end

@implementation AWSSageMakerServiceUpdateTrialComponentRequest

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
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSageMakerServiceTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)outputArtifactsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSageMakerServiceTrialComponentArtifact class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSSageMakerServiceTrialComponentParameterValue class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTrialComponentStatus class]];
}

@end

@implementation AWSSageMakerServiceUpdateTrialComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialComponentArn" : @"TrialComponentArn",
             };
}

@end

@implementation AWSSageMakerServiceUpdateTrialRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             @"trialName" : @"TrialName",
             };
}

@end

@implementation AWSSageMakerServiceUpdateTrialResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trialArn" : @"TrialArn",
             };
}

@end

@implementation AWSSageMakerServiceUpdateUserProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             @"userProfileName" : @"UserProfileName",
             @"userSettings" : @"UserSettings",
             };
}

+ (NSValueTransformer *)userSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceUserSettings class]];
}

@end

@implementation AWSSageMakerServiceUpdateUserProfileResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userProfileArn" : @"UserProfileArn",
             };
}

@end

@implementation AWSSageMakerServiceUpdateWorkforceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceIpConfig" : @"SourceIpConfig",
             @"workforceName" : @"WorkforceName",
             };
}

+ (NSValueTransformer *)sourceIpConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceSourceIpConfig class]];
}

@end

@implementation AWSSageMakerServiceUpdateWorkforceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workforce" : @"Workforce",
             };
}

+ (NSValueTransformer *)workforceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceWorkforce class]];
}

@end

@implementation AWSSageMakerServiceUpdateWorkteamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"memberDefinitions" : @"MemberDefinitions",
             @"notificationConfiguration" : @"NotificationConfiguration",
             @"workteamName" : @"WorkteamName",
             };
}

+ (NSValueTransformer *)memberDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceMemberDefinition class]];
}

+ (NSValueTransformer *)notificationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceNotificationConfiguration class]];
}

@end

@implementation AWSSageMakerServiceUpdateWorkteamResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workteam" : @"Workteam",
             };
}

+ (NSValueTransformer *)workteamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceWorkteam class]];
}

@end

@implementation AWSSageMakerServiceUserContext

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainId" : @"DomainId",
             @"userProfileArn" : @"UserProfileArn",
             @"userProfileName" : @"UserProfileName",
             };
}

@end

@implementation AWSSageMakerServiceUserProfileDetails

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
            return @(AWSSageMakerServiceUserProfileStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSSageMakerServiceUserProfileStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSSageMakerServiceUserProfileStatusInService);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSageMakerServiceUserProfileStatusPending);
        }
        return @(AWSSageMakerServiceUserProfileStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceUserProfileStatusDeleting:
                return @"Deleting";
            case AWSSageMakerServiceUserProfileStatusFailed:
                return @"Failed";
            case AWSSageMakerServiceUserProfileStatusInService:
                return @"InService";
            case AWSSageMakerServiceUserProfileStatusPending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceUserSettings

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceJupyterServerAppSettings class]];
}

+ (NSValueTransformer *)kernelGatewayAppSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceKernelGatewayAppSettings class]];
}

+ (NSValueTransformer *)sharingSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceSharingSettings class]];
}

+ (NSValueTransformer *)tensorBoardAppSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceTensorBoardAppSettings class]];
}

@end

@implementation AWSSageMakerServiceVariantProperty

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"variantPropertyType" : @"VariantPropertyType",
             };
}

+ (NSValueTransformer *)variantPropertyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DesiredInstanceCount"] == NSOrderedSame) {
            return @(AWSSageMakerServiceVariantPropertyTypeDesiredInstanceCount);
        }
        if ([value caseInsensitiveCompare:@"DesiredWeight"] == NSOrderedSame) {
            return @(AWSSageMakerServiceVariantPropertyTypeDesiredWeight);
        }
        if ([value caseInsensitiveCompare:@"DataCaptureConfig"] == NSOrderedSame) {
            return @(AWSSageMakerServiceVariantPropertyTypeDataCaptureConfig);
        }
        return @(AWSSageMakerServiceVariantPropertyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSageMakerServiceVariantPropertyTypeDesiredInstanceCount:
                return @"DesiredInstanceCount";
            case AWSSageMakerServiceVariantPropertyTypeDesiredWeight:
                return @"DesiredWeight";
            case AWSSageMakerServiceVariantPropertyTypeDataCaptureConfig:
                return @"DataCaptureConfig";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSageMakerServiceVpcConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnets" : @"Subnets",
             };
}

@end

@implementation AWSSageMakerServiceWorkforce

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceSourceIpConfig class]];
}

@end

@implementation AWSSageMakerServiceWorkteam

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSageMakerServiceMemberDefinition class]];
}

+ (NSValueTransformer *)notificationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSageMakerServiceNotificationConfiguration class]];
}

@end
