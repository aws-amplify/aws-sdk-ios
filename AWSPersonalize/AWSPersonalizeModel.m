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

#import "AWSPersonalizeModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSPersonalizeErrorDomain = @"com.amazonaws.AWSPersonalizeErrorDomain";

@implementation AWSPersonalizeAlgorithm

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmArn" : @"algorithmArn",
             @"algorithmImage" : @"algorithmImage",
             @"creationDateTime" : @"creationDateTime",
             @"defaultHyperParameterRanges" : @"defaultHyperParameterRanges",
             @"defaultHyperParameters" : @"defaultHyperParameters",
             @"defaultResourceConfig" : @"defaultResourceConfig",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"name" : @"name",
             @"roleArn" : @"roleArn",
             @"trainingInputMode" : @"trainingInputMode",
             };
}

+ (NSValueTransformer *)algorithmImageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeAlgorithmImage class]];
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)defaultHyperParameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeDefaultHyperParameterRanges class]];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeAlgorithmImage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dockerURI" : @"dockerURI",
             @"name" : @"name",
             };
}

@end

@implementation AWSPersonalizeAutoMLConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricName" : @"metricName",
             @"recipeList" : @"recipeList",
             };
}

@end

@implementation AWSPersonalizeAutoMLResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bestRecipeArn" : @"bestRecipeArn",
             };
}

@end

@implementation AWSPersonalizeBatchInferenceJob

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchInferenceJobArn" : @"batchInferenceJobArn",
             @"creationDateTime" : @"creationDateTime",
             @"failureReason" : @"failureReason",
             @"filterArn" : @"filterArn",
             @"jobInput" : @"jobInput",
             @"jobName" : @"jobName",
             @"jobOutput" : @"jobOutput",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"numResults" : @"numResults",
             @"roleArn" : @"roleArn",
             @"solutionVersionArn" : @"solutionVersionArn",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)jobInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeBatchInferenceJobInput class]];
}

+ (NSValueTransformer *)jobOutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeBatchInferenceJobOutput class]];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeBatchInferenceJobInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3DataSource" : @"s3DataSource",
             };
}

+ (NSValueTransformer *)s3DataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeS3DataConfig class]];
}

@end

@implementation AWSPersonalizeBatchInferenceJobOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3DataDestination" : @"s3DataDestination",
             };
}

+ (NSValueTransformer *)s3DataDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeS3DataConfig class]];
}

@end

@implementation AWSPersonalizeBatchInferenceJobSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchInferenceJobArn" : @"batchInferenceJobArn",
             @"creationDateTime" : @"creationDateTime",
             @"failureReason" : @"failureReason",
             @"jobName" : @"jobName",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"solutionVersionArn" : @"solutionVersionArn",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeCampaign

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignArn" : @"campaignArn",
             @"creationDateTime" : @"creationDateTime",
             @"failureReason" : @"failureReason",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"latestCampaignUpdate" : @"latestCampaignUpdate",
             @"minProvisionedTPS" : @"minProvisionedTPS",
             @"name" : @"name",
             @"solutionVersionArn" : @"solutionVersionArn",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)latestCampaignUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeCampaignUpdateSummary class]];
}

@end

@implementation AWSPersonalizeCampaignSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignArn" : @"campaignArn",
             @"creationDateTime" : @"creationDateTime",
             @"failureReason" : @"failureReason",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"name" : @"name",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeCampaignUpdateSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"creationDateTime",
             @"failureReason" : @"failureReason",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"minProvisionedTPS" : @"minProvisionedTPS",
             @"solutionVersionArn" : @"solutionVersionArn",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeCategoricalHyperParameterRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"values" : @"values",
             };
}

@end

@implementation AWSPersonalizeContinuousHyperParameterRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxValue" : @"maxValue",
             @"minValue" : @"minValue",
             @"name" : @"name",
             };
}

@end

@implementation AWSPersonalizeCreateBatchInferenceJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterArn" : @"filterArn",
             @"jobInput" : @"jobInput",
             @"jobName" : @"jobName",
             @"jobOutput" : @"jobOutput",
             @"numResults" : @"numResults",
             @"roleArn" : @"roleArn",
             @"solutionVersionArn" : @"solutionVersionArn",
             };
}

+ (NSValueTransformer *)jobInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeBatchInferenceJobInput class]];
}

+ (NSValueTransformer *)jobOutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeBatchInferenceJobOutput class]];
}

@end

@implementation AWSPersonalizeCreateBatchInferenceJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchInferenceJobArn" : @"batchInferenceJobArn",
             };
}

@end

@implementation AWSPersonalizeCreateCampaignRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"minProvisionedTPS" : @"minProvisionedTPS",
             @"name" : @"name",
             @"solutionVersionArn" : @"solutionVersionArn",
             };
}

@end

@implementation AWSPersonalizeCreateCampaignResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignArn" : @"campaignArn",
             };
}

@end

@implementation AWSPersonalizeCreateDatasetGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyArn" : @"kmsKeyArn",
             @"name" : @"name",
             @"roleArn" : @"roleArn",
             };
}

@end

@implementation AWSPersonalizeCreateDatasetGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetGroupArn" : @"datasetGroupArn",
             };
}

@end

@implementation AWSPersonalizeCreateDatasetImportJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSource" : @"dataSource",
             @"datasetArn" : @"datasetArn",
             @"jobName" : @"jobName",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)dataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeDataSource class]];
}

@end

@implementation AWSPersonalizeCreateDatasetImportJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetImportJobArn" : @"datasetImportJobArn",
             };
}

@end

@implementation AWSPersonalizeCreateDatasetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetGroupArn" : @"datasetGroupArn",
             @"datasetType" : @"datasetType",
             @"name" : @"name",
             @"schemaArn" : @"schemaArn",
             };
}

@end

@implementation AWSPersonalizeCreateDatasetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetArn" : @"datasetArn",
             };
}

@end

@implementation AWSPersonalizeCreateEventTrackerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetGroupArn" : @"datasetGroupArn",
             @"name" : @"name",
             };
}

@end

@implementation AWSPersonalizeCreateEventTrackerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventTrackerArn" : @"eventTrackerArn",
             @"trackingId" : @"trackingId",
             };
}

@end

@implementation AWSPersonalizeCreateFilterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetGroupArn" : @"datasetGroupArn",
             @"filterExpression" : @"filterExpression",
             @"name" : @"name",
             };
}

@end

@implementation AWSPersonalizeCreateFilterResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterArn" : @"filterArn",
             };
}

@end

@implementation AWSPersonalizeCreateSchemaRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"schema" : @"schema",
             };
}

@end

@implementation AWSPersonalizeCreateSchemaResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"schemaArn" : @"schemaArn",
             };
}

@end

@implementation AWSPersonalizeCreateSolutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetGroupArn" : @"datasetGroupArn",
             @"eventType" : @"eventType",
             @"name" : @"name",
             @"performAutoML" : @"performAutoML",
             @"performHPO" : @"performHPO",
             @"recipeArn" : @"recipeArn",
             @"solutionConfig" : @"solutionConfig",
             };
}

+ (NSValueTransformer *)solutionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeSolutionConfig class]];
}

@end

@implementation AWSPersonalizeCreateSolutionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"solutionArn" : @"solutionArn",
             };
}

@end

@implementation AWSPersonalizeCreateSolutionVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"solutionArn" : @"solutionArn",
             @"trainingMode" : @"trainingMode",
             };
}

+ (NSValueTransformer *)trainingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FULL"] == NSOrderedSame) {
            return @(AWSPersonalizeTrainingModeFull);
        }
        if ([value caseInsensitiveCompare:@"UPDATE"] == NSOrderedSame) {
            return @(AWSPersonalizeTrainingModeUpdate);
        }
        return @(AWSPersonalizeTrainingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPersonalizeTrainingModeFull:
                return @"FULL";
            case AWSPersonalizeTrainingModeUpdate:
                return @"UPDATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPersonalizeCreateSolutionVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"solutionVersionArn" : @"solutionVersionArn",
             };
}

@end

@implementation AWSPersonalizeDataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataLocation" : @"dataLocation",
             };
}

@end

@implementation AWSPersonalizeDataset

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"creationDateTime",
             @"datasetArn" : @"datasetArn",
             @"datasetGroupArn" : @"datasetGroupArn",
             @"datasetType" : @"datasetType",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"name" : @"name",
             @"schemaArn" : @"schemaArn",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeDatasetGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"creationDateTime",
             @"datasetGroupArn" : @"datasetGroupArn",
             @"failureReason" : @"failureReason",
             @"kmsKeyArn" : @"kmsKeyArn",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"name" : @"name",
             @"roleArn" : @"roleArn",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeDatasetGroupSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"creationDateTime",
             @"datasetGroupArn" : @"datasetGroupArn",
             @"failureReason" : @"failureReason",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"name" : @"name",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeDatasetImportJob

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"creationDateTime",
             @"dataSource" : @"dataSource",
             @"datasetArn" : @"datasetArn",
             @"datasetImportJobArn" : @"datasetImportJobArn",
             @"failureReason" : @"failureReason",
             @"jobName" : @"jobName",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"roleArn" : @"roleArn",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)dataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeDataSource class]];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeDatasetImportJobSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"creationDateTime",
             @"datasetImportJobArn" : @"datasetImportJobArn",
             @"failureReason" : @"failureReason",
             @"jobName" : @"jobName",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeDatasetSchema

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"creationDateTime",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"name" : @"name",
             @"schema" : @"schema",
             @"schemaArn" : @"schemaArn",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeDatasetSchemaSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"creationDateTime",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"name" : @"name",
             @"schemaArn" : @"schemaArn",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeDatasetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"creationDateTime",
             @"datasetArn" : @"datasetArn",
             @"datasetType" : @"datasetType",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"name" : @"name",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeDefaultCategoricalHyperParameterRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTunable" : @"isTunable",
             @"name" : @"name",
             @"values" : @"values",
             };
}

@end

@implementation AWSPersonalizeDefaultContinuousHyperParameterRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTunable" : @"isTunable",
             @"maxValue" : @"maxValue",
             @"minValue" : @"minValue",
             @"name" : @"name",
             };
}

@end

@implementation AWSPersonalizeDefaultHyperParameterRanges

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"categoricalHyperParameterRanges" : @"categoricalHyperParameterRanges",
             @"continuousHyperParameterRanges" : @"continuousHyperParameterRanges",
             @"integerHyperParameterRanges" : @"integerHyperParameterRanges",
             };
}

+ (NSValueTransformer *)categoricalHyperParameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPersonalizeDefaultCategoricalHyperParameterRange class]];
}

+ (NSValueTransformer *)continuousHyperParameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPersonalizeDefaultContinuousHyperParameterRange class]];
}

+ (NSValueTransformer *)integerHyperParameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPersonalizeDefaultIntegerHyperParameterRange class]];
}

@end

@implementation AWSPersonalizeDefaultIntegerHyperParameterRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTunable" : @"isTunable",
             @"maxValue" : @"maxValue",
             @"minValue" : @"minValue",
             @"name" : @"name",
             };
}

@end

@implementation AWSPersonalizeDeleteCampaignRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignArn" : @"campaignArn",
             };
}

@end

@implementation AWSPersonalizeDeleteDatasetGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetGroupArn" : @"datasetGroupArn",
             };
}

@end

@implementation AWSPersonalizeDeleteDatasetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetArn" : @"datasetArn",
             };
}

@end

@implementation AWSPersonalizeDeleteEventTrackerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventTrackerArn" : @"eventTrackerArn",
             };
}

@end

@implementation AWSPersonalizeDeleteFilterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterArn" : @"filterArn",
             };
}

@end

@implementation AWSPersonalizeDeleteSchemaRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"schemaArn" : @"schemaArn",
             };
}

@end

@implementation AWSPersonalizeDeleteSolutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"solutionArn" : @"solutionArn",
             };
}

@end

@implementation AWSPersonalizeDescribeAlgorithmRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmArn" : @"algorithmArn",
             };
}

@end

@implementation AWSPersonalizeDescribeAlgorithmResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithm" : @"algorithm",
             };
}

+ (NSValueTransformer *)algorithmJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeAlgorithm class]];
}

@end

@implementation AWSPersonalizeDescribeBatchInferenceJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchInferenceJobArn" : @"batchInferenceJobArn",
             };
}

@end

@implementation AWSPersonalizeDescribeBatchInferenceJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchInferenceJob" : @"batchInferenceJob",
             };
}

+ (NSValueTransformer *)batchInferenceJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeBatchInferenceJob class]];
}

@end

@implementation AWSPersonalizeDescribeCampaignRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignArn" : @"campaignArn",
             };
}

@end

@implementation AWSPersonalizeDescribeCampaignResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaign" : @"campaign",
             };
}

+ (NSValueTransformer *)campaignJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeCampaign class]];
}

@end

@implementation AWSPersonalizeDescribeDatasetGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetGroupArn" : @"datasetGroupArn",
             };
}

@end

@implementation AWSPersonalizeDescribeDatasetGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetGroup" : @"datasetGroup",
             };
}

+ (NSValueTransformer *)datasetGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeDatasetGroup class]];
}

@end

@implementation AWSPersonalizeDescribeDatasetImportJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetImportJobArn" : @"datasetImportJobArn",
             };
}

@end

@implementation AWSPersonalizeDescribeDatasetImportJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetImportJob" : @"datasetImportJob",
             };
}

+ (NSValueTransformer *)datasetImportJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeDatasetImportJob class]];
}

@end

@implementation AWSPersonalizeDescribeDatasetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetArn" : @"datasetArn",
             };
}

@end

@implementation AWSPersonalizeDescribeDatasetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataset" : @"dataset",
             };
}

+ (NSValueTransformer *)datasetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeDataset class]];
}

@end

@implementation AWSPersonalizeDescribeEventTrackerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventTrackerArn" : @"eventTrackerArn",
             };
}

@end

@implementation AWSPersonalizeDescribeEventTrackerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventTracker" : @"eventTracker",
             };
}

+ (NSValueTransformer *)eventTrackerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeEventTracker class]];
}

@end

@implementation AWSPersonalizeDescribeFeatureTransformationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"featureTransformationArn" : @"featureTransformationArn",
             };
}

@end

@implementation AWSPersonalizeDescribeFeatureTransformationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"featureTransformation" : @"featureTransformation",
             };
}

+ (NSValueTransformer *)featureTransformationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeFeatureTransformation class]];
}

@end

@implementation AWSPersonalizeDescribeFilterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterArn" : @"filterArn",
             };
}

@end

@implementation AWSPersonalizeDescribeFilterResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"filter",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeFilter class]];
}

@end

@implementation AWSPersonalizeDescribeRecipeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recipeArn" : @"recipeArn",
             };
}

@end

@implementation AWSPersonalizeDescribeRecipeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recipe" : @"recipe",
             };
}

+ (NSValueTransformer *)recipeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeRecipe class]];
}

@end

@implementation AWSPersonalizeDescribeSchemaRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"schemaArn" : @"schemaArn",
             };
}

@end

@implementation AWSPersonalizeDescribeSchemaResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"schema" : @"schema",
             };
}

+ (NSValueTransformer *)schemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeDatasetSchema class]];
}

@end

@implementation AWSPersonalizeDescribeSolutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"solutionArn" : @"solutionArn",
             };
}

@end

@implementation AWSPersonalizeDescribeSolutionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"solution" : @"solution",
             };
}

+ (NSValueTransformer *)solutionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeSolution class]];
}

@end

@implementation AWSPersonalizeDescribeSolutionVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"solutionVersionArn" : @"solutionVersionArn",
             };
}

@end

@implementation AWSPersonalizeDescribeSolutionVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"solutionVersion" : @"solutionVersion",
             };
}

+ (NSValueTransformer *)solutionVersionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeSolutionVersion class]];
}

@end

@implementation AWSPersonalizeEventTracker

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"accountId",
             @"creationDateTime" : @"creationDateTime",
             @"datasetGroupArn" : @"datasetGroupArn",
             @"eventTrackerArn" : @"eventTrackerArn",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"name" : @"name",
             @"status" : @"status",
             @"trackingId" : @"trackingId",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeEventTrackerSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"creationDateTime",
             @"eventTrackerArn" : @"eventTrackerArn",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"name" : @"name",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeFeatureTransformation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"creationDateTime",
             @"defaultParameters" : @"defaultParameters",
             @"featureTransformationArn" : @"featureTransformationArn",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"name" : @"name",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"creationDateTime",
             @"datasetGroupArn" : @"datasetGroupArn",
             @"failureReason" : @"failureReason",
             @"filterArn" : @"filterArn",
             @"filterExpression" : @"filterExpression",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"name" : @"name",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeFilterSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"creationDateTime",
             @"datasetGroupArn" : @"datasetGroupArn",
             @"failureReason" : @"failureReason",
             @"filterArn" : @"filterArn",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"name" : @"name",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeGetSolutionMetricsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"solutionVersionArn" : @"solutionVersionArn",
             };
}

@end

@implementation AWSPersonalizeGetSolutionMetricsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metrics" : @"metrics",
             @"solutionVersionArn" : @"solutionVersionArn",
             };
}

@end

@implementation AWSPersonalizeHPOConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmHyperParameterRanges" : @"algorithmHyperParameterRanges",
             @"hpoObjective" : @"hpoObjective",
             @"hpoResourceConfig" : @"hpoResourceConfig",
             };
}

+ (NSValueTransformer *)algorithmHyperParameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeHyperParameterRanges class]];
}

+ (NSValueTransformer *)hpoObjectiveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeHPOObjective class]];
}

+ (NSValueTransformer *)hpoResourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeHPOResourceConfig class]];
}

@end

@implementation AWSPersonalizeHPOObjective

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricName" : @"metricName",
             @"metricRegex" : @"metricRegex",
             @"types" : @"type",
             };
}

@end

@implementation AWSPersonalizeHPOResourceConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxNumberOfTrainingJobs" : @"maxNumberOfTrainingJobs",
             @"maxParallelTrainingJobs" : @"maxParallelTrainingJobs",
             };
}

@end

@implementation AWSPersonalizeHyperParameterRanges

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"categoricalHyperParameterRanges" : @"categoricalHyperParameterRanges",
             @"continuousHyperParameterRanges" : @"continuousHyperParameterRanges",
             @"integerHyperParameterRanges" : @"integerHyperParameterRanges",
             };
}

+ (NSValueTransformer *)categoricalHyperParameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPersonalizeCategoricalHyperParameterRange class]];
}

+ (NSValueTransformer *)continuousHyperParameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPersonalizeContinuousHyperParameterRange class]];
}

+ (NSValueTransformer *)integerHyperParameterRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPersonalizeIntegerHyperParameterRange class]];
}

@end

@implementation AWSPersonalizeIntegerHyperParameterRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxValue" : @"maxValue",
             @"minValue" : @"minValue",
             @"name" : @"name",
             };
}

@end

@implementation AWSPersonalizeListBatchInferenceJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"solutionVersionArn" : @"solutionVersionArn",
             };
}

@end

@implementation AWSPersonalizeListBatchInferenceJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchInferenceJobs" : @"batchInferenceJobs",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)batchInferenceJobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPersonalizeBatchInferenceJobSummary class]];
}

@end

@implementation AWSPersonalizeListCampaignsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"solutionArn" : @"solutionArn",
             };
}

@end

@implementation AWSPersonalizeListCampaignsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaigns" : @"campaigns",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)campaignsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPersonalizeCampaignSummary class]];
}

@end

@implementation AWSPersonalizeListDatasetGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSPersonalizeListDatasetGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetGroups" : @"datasetGroups",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)datasetGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPersonalizeDatasetGroupSummary class]];
}

@end

@implementation AWSPersonalizeListDatasetImportJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetArn" : @"datasetArn",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSPersonalizeListDatasetImportJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetImportJobs" : @"datasetImportJobs",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)datasetImportJobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPersonalizeDatasetImportJobSummary class]];
}

@end

@implementation AWSPersonalizeListDatasetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetGroupArn" : @"datasetGroupArn",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSPersonalizeListDatasetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasets" : @"datasets",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)datasetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPersonalizeDatasetSummary class]];
}

@end

@implementation AWSPersonalizeListEventTrackersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetGroupArn" : @"datasetGroupArn",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSPersonalizeListEventTrackersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventTrackers" : @"eventTrackers",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)eventTrackersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPersonalizeEventTrackerSummary class]];
}

@end

@implementation AWSPersonalizeListFiltersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetGroupArn" : @"datasetGroupArn",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSPersonalizeListFiltersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPersonalizeFilterSummary class]];
}

@end

@implementation AWSPersonalizeListRecipesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"recipeProvider" : @"recipeProvider",
             };
}

+ (NSValueTransformer *)recipeProviderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE"] == NSOrderedSame) {
            return @(AWSPersonalizeRecipeProviderService);
        }
        return @(AWSPersonalizeRecipeProviderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPersonalizeRecipeProviderService:
                return @"SERVICE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPersonalizeListRecipesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"recipes" : @"recipes",
             };
}

+ (NSValueTransformer *)recipesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPersonalizeRecipeSummary class]];
}

@end

@implementation AWSPersonalizeListSchemasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSPersonalizeListSchemasResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"schemas" : @"schemas",
             };
}

+ (NSValueTransformer *)schemasJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPersonalizeDatasetSchemaSummary class]];
}

@end

@implementation AWSPersonalizeListSolutionVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"solutionArn" : @"solutionArn",
             };
}

@end

@implementation AWSPersonalizeListSolutionVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"solutionVersions" : @"solutionVersions",
             };
}

+ (NSValueTransformer *)solutionVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPersonalizeSolutionVersionSummary class]];
}

@end

@implementation AWSPersonalizeListSolutionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetGroupArn" : @"datasetGroupArn",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSPersonalizeListSolutionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"solutions" : @"solutions",
             };
}

+ (NSValueTransformer *)solutionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPersonalizeSolutionSummary class]];
}

@end

@implementation AWSPersonalizeRecipe

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmArn" : @"algorithmArn",
             @"creationDateTime" : @"creationDateTime",
             @"detail" : @"description",
             @"featureTransformationArn" : @"featureTransformationArn",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"name" : @"name",
             @"recipeArn" : @"recipeArn",
             @"recipeType" : @"recipeType",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeRecipeSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"creationDateTime",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"name" : @"name",
             @"recipeArn" : @"recipeArn",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeS3DataConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyArn" : @"kmsKeyArn",
             @"path" : @"path",
             };
}

@end

@implementation AWSPersonalizeSolution

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoMLResult" : @"autoMLResult",
             @"creationDateTime" : @"creationDateTime",
             @"datasetGroupArn" : @"datasetGroupArn",
             @"eventType" : @"eventType",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"latestSolutionVersion" : @"latestSolutionVersion",
             @"name" : @"name",
             @"performAutoML" : @"performAutoML",
             @"performHPO" : @"performHPO",
             @"recipeArn" : @"recipeArn",
             @"solutionArn" : @"solutionArn",
             @"solutionConfig" : @"solutionConfig",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)autoMLResultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeAutoMLResult class]];
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)latestSolutionVersionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeSolutionVersionSummary class]];
}

+ (NSValueTransformer *)solutionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeSolutionConfig class]];
}

@end

@implementation AWSPersonalizeSolutionConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmHyperParameters" : @"algorithmHyperParameters",
             @"autoMLConfig" : @"autoMLConfig",
             @"eventValueThreshold" : @"eventValueThreshold",
             @"featureTransformationParameters" : @"featureTransformationParameters",
             @"hpoConfig" : @"hpoConfig",
             };
}

+ (NSValueTransformer *)autoMLConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeAutoMLConfig class]];
}

+ (NSValueTransformer *)hpoConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeHPOConfig class]];
}

@end

@implementation AWSPersonalizeSolutionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"creationDateTime",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"name" : @"name",
             @"solutionArn" : @"solutionArn",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeSolutionVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"creationDateTime",
             @"datasetGroupArn" : @"datasetGroupArn",
             @"eventType" : @"eventType",
             @"failureReason" : @"failureReason",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"performAutoML" : @"performAutoML",
             @"performHPO" : @"performHPO",
             @"recipeArn" : @"recipeArn",
             @"solutionArn" : @"solutionArn",
             @"solutionConfig" : @"solutionConfig",
             @"solutionVersionArn" : @"solutionVersionArn",
             @"status" : @"status",
             @"trainingHours" : @"trainingHours",
             @"trainingMode" : @"trainingMode",
             @"tunedHPOParams" : @"tunedHPOParams",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)solutionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeSolutionConfig class]];
}

+ (NSValueTransformer *)trainingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FULL"] == NSOrderedSame) {
            return @(AWSPersonalizeTrainingModeFull);
        }
        if ([value caseInsensitiveCompare:@"UPDATE"] == NSOrderedSame) {
            return @(AWSPersonalizeTrainingModeUpdate);
        }
        return @(AWSPersonalizeTrainingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPersonalizeTrainingModeFull:
                return @"FULL";
            case AWSPersonalizeTrainingModeUpdate:
                return @"UPDATE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tunedHPOParamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPersonalizeTunedHPOParams class]];
}

@end

@implementation AWSPersonalizeSolutionVersionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"creationDateTime",
             @"failureReason" : @"failureReason",
             @"lastUpdatedDateTime" : @"lastUpdatedDateTime",
             @"solutionVersionArn" : @"solutionVersionArn",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPersonalizeTunedHPOParams

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithmHyperParameters" : @"algorithmHyperParameters",
             };
}

@end

@implementation AWSPersonalizeUpdateCampaignRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignArn" : @"campaignArn",
             @"minProvisionedTPS" : @"minProvisionedTPS",
             @"solutionVersionArn" : @"solutionVersionArn",
             };
}

@end

@implementation AWSPersonalizeUpdateCampaignResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignArn" : @"campaignArn",
             };
}

@end
