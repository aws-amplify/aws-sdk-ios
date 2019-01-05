//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSMachineLearningModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSMachineLearningErrorDomain = @"com.amazonaws.AWSMachineLearningErrorDomain";

@implementation AWSMachineLearningAddTagsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BatchPrediction"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeBatchPrediction);
        }
        if ([value caseInsensitiveCompare:@"DataSource"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeDataSource);
        }
        if ([value caseInsensitiveCompare:@"Evaluation"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeEvaluation);
        }
        if ([value caseInsensitiveCompare:@"MLModel"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeMLModel);
        }
        return @(AWSMachineLearningTaggableResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningTaggableResourceTypeBatchPrediction:
                return @"BatchPrediction";
            case AWSMachineLearningTaggableResourceTypeDataSource:
                return @"DataSource";
            case AWSMachineLearningTaggableResourceTypeEvaluation:
                return @"Evaluation";
            case AWSMachineLearningTaggableResourceTypeMLModel:
                return @"MLModel";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMachineLearningTag class]];
}

@end

@implementation AWSMachineLearningAddTagsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BatchPrediction"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeBatchPrediction);
        }
        if ([value caseInsensitiveCompare:@"DataSource"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeDataSource);
        }
        if ([value caseInsensitiveCompare:@"Evaluation"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeEvaluation);
        }
        if ([value caseInsensitiveCompare:@"MLModel"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeMLModel);
        }
        return @(AWSMachineLearningTaggableResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningTaggableResourceTypeBatchPrediction:
                return @"BatchPrediction";
            case AWSMachineLearningTaggableResourceTypeDataSource:
                return @"DataSource";
            case AWSMachineLearningTaggableResourceTypeEvaluation:
                return @"Evaluation";
            case AWSMachineLearningTaggableResourceTypeMLModel:
                return @"MLModel";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMachineLearningBatchPrediction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchPredictionDataSourceId" : @"BatchPredictionDataSourceId",
             @"batchPredictionId" : @"BatchPredictionId",
             @"computeTime" : @"ComputeTime",
             @"createdAt" : @"CreatedAt",
             @"createdByIamUser" : @"CreatedByIamUser",
             @"finishedAt" : @"FinishedAt",
             @"inputDataLocationS3" : @"InputDataLocationS3",
             @"invalidRecordCount" : @"InvalidRecordCount",
             @"lastUpdatedAt" : @"LastUpdatedAt",
             @"MLModelId" : @"MLModelId",
             @"message" : @"Message",
             @"name" : @"Name",
             @"outputUri" : @"OutputUri",
             @"startedAt" : @"StartedAt",
             @"status" : @"Status",
             @"totalRecordCount" : @"TotalRecordCount",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)finishedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusPending);
        }
        if ([value caseInsensitiveCompare:@"INPROGRESS"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusInprogress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusDeleted);
        }
        return @(AWSMachineLearningEntityStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningEntityStatusPending:
                return @"PENDING";
            case AWSMachineLearningEntityStatusInprogress:
                return @"INPROGRESS";
            case AWSMachineLearningEntityStatusFailed:
                return @"FAILED";
            case AWSMachineLearningEntityStatusCompleted:
                return @"COMPLETED";
            case AWSMachineLearningEntityStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMachineLearningCreateBatchPredictionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchPredictionDataSourceId" : @"BatchPredictionDataSourceId",
             @"batchPredictionId" : @"BatchPredictionId",
             @"batchPredictionName" : @"BatchPredictionName",
             @"MLModelId" : @"MLModelId",
             @"outputUri" : @"OutputUri",
             };
}

@end

@implementation AWSMachineLearningCreateBatchPredictionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchPredictionId" : @"BatchPredictionId",
             };
}

@end

@implementation AWSMachineLearningCreateDataSourceFromRDSInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"computeStatistics" : @"ComputeStatistics",
             @"dataSourceId" : @"DataSourceId",
             @"dataSourceName" : @"DataSourceName",
             @"RDSData" : @"RDSData",
             @"roleARN" : @"RoleARN",
             };
}

+ (NSValueTransformer *)RDSDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMachineLearningRDSDataSpec class]];
}

@end

@implementation AWSMachineLearningCreateDataSourceFromRDSOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSourceId" : @"DataSourceId",
             };
}

@end

@implementation AWSMachineLearningCreateDataSourceFromRedshiftInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"computeStatistics" : @"ComputeStatistics",
             @"dataSourceId" : @"DataSourceId",
             @"dataSourceName" : @"DataSourceName",
             @"dataSpec" : @"DataSpec",
             @"roleARN" : @"RoleARN",
             };
}

+ (NSValueTransformer *)dataSpecJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMachineLearningRedshiftDataSpec class]];
}

@end

@implementation AWSMachineLearningCreateDataSourceFromRedshiftOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSourceId" : @"DataSourceId",
             };
}

@end

@implementation AWSMachineLearningCreateDataSourceFromS3Input

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"computeStatistics" : @"ComputeStatistics",
             @"dataSourceId" : @"DataSourceId",
             @"dataSourceName" : @"DataSourceName",
             @"dataSpec" : @"DataSpec",
             };
}

+ (NSValueTransformer *)dataSpecJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMachineLearningS3DataSpec class]];
}

@end

@implementation AWSMachineLearningCreateDataSourceFromS3Output

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSourceId" : @"DataSourceId",
             };
}

@end

@implementation AWSMachineLearningCreateEvaluationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"evaluationDataSourceId" : @"EvaluationDataSourceId",
             @"evaluationId" : @"EvaluationId",
             @"evaluationName" : @"EvaluationName",
             @"MLModelId" : @"MLModelId",
             };
}

@end

@implementation AWSMachineLearningCreateEvaluationOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"evaluationId" : @"EvaluationId",
             };
}

@end

@implementation AWSMachineLearningCreateMLModelInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"MLModelId" : @"MLModelId",
             @"MLModelName" : @"MLModelName",
             @"MLModelType" : @"MLModelType",
             @"parameters" : @"Parameters",
             @"recipe" : @"Recipe",
             @"recipeUri" : @"RecipeUri",
             @"trainingDataSourceId" : @"TrainingDataSourceId",
             };
}

+ (NSValueTransformer *)MLModelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REGRESSION"] == NSOrderedSame) {
            return @(AWSMachineLearningMLModelTypeRegression);
        }
        if ([value caseInsensitiveCompare:@"BINARY"] == NSOrderedSame) {
            return @(AWSMachineLearningMLModelTypeBinary);
        }
        if ([value caseInsensitiveCompare:@"MULTICLASS"] == NSOrderedSame) {
            return @(AWSMachineLearningMLModelTypeMulticlass);
        }
        return @(AWSMachineLearningMLModelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningMLModelTypeRegression:
                return @"REGRESSION";
            case AWSMachineLearningMLModelTypeBinary:
                return @"BINARY";
            case AWSMachineLearningMLModelTypeMulticlass:
                return @"MULTICLASS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMachineLearningCreateMLModelOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"MLModelId" : @"MLModelId",
             };
}

@end

@implementation AWSMachineLearningCreateRealtimeEndpointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"MLModelId" : @"MLModelId",
             };
}

@end

@implementation AWSMachineLearningCreateRealtimeEndpointOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"MLModelId" : @"MLModelId",
             @"realtimeEndpointInfo" : @"RealtimeEndpointInfo",
             };
}

+ (NSValueTransformer *)realtimeEndpointInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMachineLearningRealtimeEndpointInfo class]];
}

@end

@implementation AWSMachineLearningDataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"computeStatistics" : @"ComputeStatistics",
             @"computeTime" : @"ComputeTime",
             @"createdAt" : @"CreatedAt",
             @"createdByIamUser" : @"CreatedByIamUser",
             @"dataLocationS3" : @"DataLocationS3",
             @"dataRearrangement" : @"DataRearrangement",
             @"dataSizeInBytes" : @"DataSizeInBytes",
             @"dataSourceId" : @"DataSourceId",
             @"finishedAt" : @"FinishedAt",
             @"lastUpdatedAt" : @"LastUpdatedAt",
             @"message" : @"Message",
             @"name" : @"Name",
             @"numberOfFiles" : @"NumberOfFiles",
             @"RDSMetadata" : @"RDSMetadata",
             @"redshiftMetadata" : @"RedshiftMetadata",
             @"roleARN" : @"RoleARN",
             @"startedAt" : @"StartedAt",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)finishedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)RDSMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMachineLearningRDSMetadata class]];
}

+ (NSValueTransformer *)redshiftMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMachineLearningRedshiftMetadata class]];
}

+ (NSValueTransformer *)startedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusPending);
        }
        if ([value caseInsensitiveCompare:@"INPROGRESS"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusInprogress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusDeleted);
        }
        return @(AWSMachineLearningEntityStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningEntityStatusPending:
                return @"PENDING";
            case AWSMachineLearningEntityStatusInprogress:
                return @"INPROGRESS";
            case AWSMachineLearningEntityStatusFailed:
                return @"FAILED";
            case AWSMachineLearningEntityStatusCompleted:
                return @"COMPLETED";
            case AWSMachineLearningEntityStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMachineLearningDeleteBatchPredictionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchPredictionId" : @"BatchPredictionId",
             };
}

@end

@implementation AWSMachineLearningDeleteBatchPredictionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchPredictionId" : @"BatchPredictionId",
             };
}

@end

@implementation AWSMachineLearningDeleteDataSourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSourceId" : @"DataSourceId",
             };
}

@end

@implementation AWSMachineLearningDeleteDataSourceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSourceId" : @"DataSourceId",
             };
}

@end

@implementation AWSMachineLearningDeleteEvaluationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"evaluationId" : @"EvaluationId",
             };
}

@end

@implementation AWSMachineLearningDeleteEvaluationOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"evaluationId" : @"EvaluationId",
             };
}

@end

@implementation AWSMachineLearningDeleteMLModelInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"MLModelId" : @"MLModelId",
             };
}

@end

@implementation AWSMachineLearningDeleteMLModelOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"MLModelId" : @"MLModelId",
             };
}

@end

@implementation AWSMachineLearningDeleteRealtimeEndpointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"MLModelId" : @"MLModelId",
             };
}

@end

@implementation AWSMachineLearningDeleteRealtimeEndpointOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"MLModelId" : @"MLModelId",
             @"realtimeEndpointInfo" : @"RealtimeEndpointInfo",
             };
}

+ (NSValueTransformer *)realtimeEndpointInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMachineLearningRealtimeEndpointInfo class]];
}

@end

@implementation AWSMachineLearningDeleteTagsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             @"tagKeys" : @"TagKeys",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BatchPrediction"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeBatchPrediction);
        }
        if ([value caseInsensitiveCompare:@"DataSource"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeDataSource);
        }
        if ([value caseInsensitiveCompare:@"Evaluation"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeEvaluation);
        }
        if ([value caseInsensitiveCompare:@"MLModel"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeMLModel);
        }
        return @(AWSMachineLearningTaggableResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningTaggableResourceTypeBatchPrediction:
                return @"BatchPrediction";
            case AWSMachineLearningTaggableResourceTypeDataSource:
                return @"DataSource";
            case AWSMachineLearningTaggableResourceTypeEvaluation:
                return @"Evaluation";
            case AWSMachineLearningTaggableResourceTypeMLModel:
                return @"MLModel";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMachineLearningDeleteTagsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BatchPrediction"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeBatchPrediction);
        }
        if ([value caseInsensitiveCompare:@"DataSource"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeDataSource);
        }
        if ([value caseInsensitiveCompare:@"Evaluation"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeEvaluation);
        }
        if ([value caseInsensitiveCompare:@"MLModel"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeMLModel);
        }
        return @(AWSMachineLearningTaggableResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningTaggableResourceTypeBatchPrediction:
                return @"BatchPrediction";
            case AWSMachineLearningTaggableResourceTypeDataSource:
                return @"DataSource";
            case AWSMachineLearningTaggableResourceTypeEvaluation:
                return @"Evaluation";
            case AWSMachineLearningTaggableResourceTypeMLModel:
                return @"MLModel";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMachineLearningDescribeBatchPredictionsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"EQ" : @"EQ",
             @"filterVariable" : @"FilterVariable",
             @"GE" : @"GE",
             @"GT" : @"GT",
             @"LE" : @"LE",
             @"LT" : @"LT",
             @"limit" : @"Limit",
             @"NE" : @"NE",
             @"nextToken" : @"NextToken",
             @"prefix" : @"Prefix",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)filterVariableJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CreatedAt"] == NSOrderedSame) {
            return @(AWSMachineLearningBatchPredictionFilterVariableCreatedAt);
        }
        if ([value caseInsensitiveCompare:@"LastUpdatedAt"] == NSOrderedSame) {
            return @(AWSMachineLearningBatchPredictionFilterVariableLastUpdatedAt);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSMachineLearningBatchPredictionFilterVariableStatus);
        }
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSMachineLearningBatchPredictionFilterVariableName);
        }
        if ([value caseInsensitiveCompare:@"IAMUser"] == NSOrderedSame) {
            return @(AWSMachineLearningBatchPredictionFilterVariableIAMUser);
        }
        if ([value caseInsensitiveCompare:@"MLModelId"] == NSOrderedSame) {
            return @(AWSMachineLearningBatchPredictionFilterVariableMLModelId);
        }
        if ([value caseInsensitiveCompare:@"DataSourceId"] == NSOrderedSame) {
            return @(AWSMachineLearningBatchPredictionFilterVariableDataSourceId);
        }
        if ([value caseInsensitiveCompare:@"DataURI"] == NSOrderedSame) {
            return @(AWSMachineLearningBatchPredictionFilterVariableDataURI);
        }
        return @(AWSMachineLearningBatchPredictionFilterVariableUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningBatchPredictionFilterVariableCreatedAt:
                return @"CreatedAt";
            case AWSMachineLearningBatchPredictionFilterVariableLastUpdatedAt:
                return @"LastUpdatedAt";
            case AWSMachineLearningBatchPredictionFilterVariableStatus:
                return @"Status";
            case AWSMachineLearningBatchPredictionFilterVariableName:
                return @"Name";
            case AWSMachineLearningBatchPredictionFilterVariableIAMUser:
                return @"IAMUser";
            case AWSMachineLearningBatchPredictionFilterVariableMLModelId:
                return @"MLModelId";
            case AWSMachineLearningBatchPredictionFilterVariableDataSourceId:
                return @"DataSourceId";
            case AWSMachineLearningBatchPredictionFilterVariableDataURI:
                return @"DataURI";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"asc"] == NSOrderedSame) {
            return @(AWSMachineLearningSortOrderAsc);
        }
        if ([value caseInsensitiveCompare:@"dsc"] == NSOrderedSame) {
            return @(AWSMachineLearningSortOrderDsc);
        }
        return @(AWSMachineLearningSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningSortOrderAsc:
                return @"asc";
            case AWSMachineLearningSortOrderDsc:
                return @"dsc";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMachineLearningDescribeBatchPredictionsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"results" : @"Results",
             };
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMachineLearningBatchPrediction class]];
}

@end

@implementation AWSMachineLearningDescribeDataSourcesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"EQ" : @"EQ",
             @"filterVariable" : @"FilterVariable",
             @"GE" : @"GE",
             @"GT" : @"GT",
             @"LE" : @"LE",
             @"LT" : @"LT",
             @"limit" : @"Limit",
             @"NE" : @"NE",
             @"nextToken" : @"NextToken",
             @"prefix" : @"Prefix",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)filterVariableJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CreatedAt"] == NSOrderedSame) {
            return @(AWSMachineLearningDataSourceFilterVariableCreatedAt);
        }
        if ([value caseInsensitiveCompare:@"LastUpdatedAt"] == NSOrderedSame) {
            return @(AWSMachineLearningDataSourceFilterVariableLastUpdatedAt);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSMachineLearningDataSourceFilterVariableStatus);
        }
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSMachineLearningDataSourceFilterVariableName);
        }
        if ([value caseInsensitiveCompare:@"DataLocationS3"] == NSOrderedSame) {
            return @(AWSMachineLearningDataSourceFilterVariableDataLocationS3);
        }
        if ([value caseInsensitiveCompare:@"IAMUser"] == NSOrderedSame) {
            return @(AWSMachineLearningDataSourceFilterVariableIAMUser);
        }
        return @(AWSMachineLearningDataSourceFilterVariableUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningDataSourceFilterVariableCreatedAt:
                return @"CreatedAt";
            case AWSMachineLearningDataSourceFilterVariableLastUpdatedAt:
                return @"LastUpdatedAt";
            case AWSMachineLearningDataSourceFilterVariableStatus:
                return @"Status";
            case AWSMachineLearningDataSourceFilterVariableName:
                return @"Name";
            case AWSMachineLearningDataSourceFilterVariableDataLocationS3:
                return @"DataLocationS3";
            case AWSMachineLearningDataSourceFilterVariableIAMUser:
                return @"IAMUser";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"asc"] == NSOrderedSame) {
            return @(AWSMachineLearningSortOrderAsc);
        }
        if ([value caseInsensitiveCompare:@"dsc"] == NSOrderedSame) {
            return @(AWSMachineLearningSortOrderDsc);
        }
        return @(AWSMachineLearningSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningSortOrderAsc:
                return @"asc";
            case AWSMachineLearningSortOrderDsc:
                return @"dsc";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMachineLearningDescribeDataSourcesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"results" : @"Results",
             };
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMachineLearningDataSource class]];
}

@end

@implementation AWSMachineLearningDescribeEvaluationsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"EQ" : @"EQ",
             @"filterVariable" : @"FilterVariable",
             @"GE" : @"GE",
             @"GT" : @"GT",
             @"LE" : @"LE",
             @"LT" : @"LT",
             @"limit" : @"Limit",
             @"NE" : @"NE",
             @"nextToken" : @"NextToken",
             @"prefix" : @"Prefix",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)filterVariableJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CreatedAt"] == NSOrderedSame) {
            return @(AWSMachineLearningEvaluationFilterVariableCreatedAt);
        }
        if ([value caseInsensitiveCompare:@"LastUpdatedAt"] == NSOrderedSame) {
            return @(AWSMachineLearningEvaluationFilterVariableLastUpdatedAt);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSMachineLearningEvaluationFilterVariableStatus);
        }
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSMachineLearningEvaluationFilterVariableName);
        }
        if ([value caseInsensitiveCompare:@"IAMUser"] == NSOrderedSame) {
            return @(AWSMachineLearningEvaluationFilterVariableIAMUser);
        }
        if ([value caseInsensitiveCompare:@"MLModelId"] == NSOrderedSame) {
            return @(AWSMachineLearningEvaluationFilterVariableMLModelId);
        }
        if ([value caseInsensitiveCompare:@"DataSourceId"] == NSOrderedSame) {
            return @(AWSMachineLearningEvaluationFilterVariableDataSourceId);
        }
        if ([value caseInsensitiveCompare:@"DataURI"] == NSOrderedSame) {
            return @(AWSMachineLearningEvaluationFilterVariableDataURI);
        }
        return @(AWSMachineLearningEvaluationFilterVariableUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningEvaluationFilterVariableCreatedAt:
                return @"CreatedAt";
            case AWSMachineLearningEvaluationFilterVariableLastUpdatedAt:
                return @"LastUpdatedAt";
            case AWSMachineLearningEvaluationFilterVariableStatus:
                return @"Status";
            case AWSMachineLearningEvaluationFilterVariableName:
                return @"Name";
            case AWSMachineLearningEvaluationFilterVariableIAMUser:
                return @"IAMUser";
            case AWSMachineLearningEvaluationFilterVariableMLModelId:
                return @"MLModelId";
            case AWSMachineLearningEvaluationFilterVariableDataSourceId:
                return @"DataSourceId";
            case AWSMachineLearningEvaluationFilterVariableDataURI:
                return @"DataURI";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"asc"] == NSOrderedSame) {
            return @(AWSMachineLearningSortOrderAsc);
        }
        if ([value caseInsensitiveCompare:@"dsc"] == NSOrderedSame) {
            return @(AWSMachineLearningSortOrderDsc);
        }
        return @(AWSMachineLearningSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningSortOrderAsc:
                return @"asc";
            case AWSMachineLearningSortOrderDsc:
                return @"dsc";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMachineLearningDescribeEvaluationsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"results" : @"Results",
             };
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMachineLearningEvaluation class]];
}

@end

@implementation AWSMachineLearningDescribeMLModelsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"EQ" : @"EQ",
             @"filterVariable" : @"FilterVariable",
             @"GE" : @"GE",
             @"GT" : @"GT",
             @"LE" : @"LE",
             @"LT" : @"LT",
             @"limit" : @"Limit",
             @"NE" : @"NE",
             @"nextToken" : @"NextToken",
             @"prefix" : @"Prefix",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)filterVariableJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CreatedAt"] == NSOrderedSame) {
            return @(AWSMachineLearningMLModelFilterVariableCreatedAt);
        }
        if ([value caseInsensitiveCompare:@"LastUpdatedAt"] == NSOrderedSame) {
            return @(AWSMachineLearningMLModelFilterVariableLastUpdatedAt);
        }
        if ([value caseInsensitiveCompare:@"Status"] == NSOrderedSame) {
            return @(AWSMachineLearningMLModelFilterVariableStatus);
        }
        if ([value caseInsensitiveCompare:@"Name"] == NSOrderedSame) {
            return @(AWSMachineLearningMLModelFilterVariableName);
        }
        if ([value caseInsensitiveCompare:@"IAMUser"] == NSOrderedSame) {
            return @(AWSMachineLearningMLModelFilterVariableIAMUser);
        }
        if ([value caseInsensitiveCompare:@"TrainingDataSourceId"] == NSOrderedSame) {
            return @(AWSMachineLearningMLModelFilterVariableTrainingDataSourceId);
        }
        if ([value caseInsensitiveCompare:@"RealtimeEndpointStatus"] == NSOrderedSame) {
            return @(AWSMachineLearningMLModelFilterVariableRealtimeEndpointStatus);
        }
        if ([value caseInsensitiveCompare:@"MLModelType"] == NSOrderedSame) {
            return @(AWSMachineLearningMLModelFilterVariableMLModelType);
        }
        if ([value caseInsensitiveCompare:@"Algorithm"] == NSOrderedSame) {
            return @(AWSMachineLearningMLModelFilterVariableAlgorithm);
        }
        if ([value caseInsensitiveCompare:@"TrainingDataURI"] == NSOrderedSame) {
            return @(AWSMachineLearningMLModelFilterVariableTrainingDataURI);
        }
        return @(AWSMachineLearningMLModelFilterVariableUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningMLModelFilterVariableCreatedAt:
                return @"CreatedAt";
            case AWSMachineLearningMLModelFilterVariableLastUpdatedAt:
                return @"LastUpdatedAt";
            case AWSMachineLearningMLModelFilterVariableStatus:
                return @"Status";
            case AWSMachineLearningMLModelFilterVariableName:
                return @"Name";
            case AWSMachineLearningMLModelFilterVariableIAMUser:
                return @"IAMUser";
            case AWSMachineLearningMLModelFilterVariableTrainingDataSourceId:
                return @"TrainingDataSourceId";
            case AWSMachineLearningMLModelFilterVariableRealtimeEndpointStatus:
                return @"RealtimeEndpointStatus";
            case AWSMachineLearningMLModelFilterVariableMLModelType:
                return @"MLModelType";
            case AWSMachineLearningMLModelFilterVariableAlgorithm:
                return @"Algorithm";
            case AWSMachineLearningMLModelFilterVariableTrainingDataURI:
                return @"TrainingDataURI";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"asc"] == NSOrderedSame) {
            return @(AWSMachineLearningSortOrderAsc);
        }
        if ([value caseInsensitiveCompare:@"dsc"] == NSOrderedSame) {
            return @(AWSMachineLearningSortOrderDsc);
        }
        return @(AWSMachineLearningSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningSortOrderAsc:
                return @"asc";
            case AWSMachineLearningSortOrderDsc:
                return @"dsc";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMachineLearningDescribeMLModelsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"results" : @"Results",
             };
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMachineLearningMLModel class]];
}

@end

@implementation AWSMachineLearningDescribeTagsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BatchPrediction"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeBatchPrediction);
        }
        if ([value caseInsensitiveCompare:@"DataSource"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeDataSource);
        }
        if ([value caseInsensitiveCompare:@"Evaluation"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeEvaluation);
        }
        if ([value caseInsensitiveCompare:@"MLModel"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeMLModel);
        }
        return @(AWSMachineLearningTaggableResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningTaggableResourceTypeBatchPrediction:
                return @"BatchPrediction";
            case AWSMachineLearningTaggableResourceTypeDataSource:
                return @"DataSource";
            case AWSMachineLearningTaggableResourceTypeEvaluation:
                return @"Evaluation";
            case AWSMachineLearningTaggableResourceTypeMLModel:
                return @"MLModel";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMachineLearningDescribeTagsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BatchPrediction"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeBatchPrediction);
        }
        if ([value caseInsensitiveCompare:@"DataSource"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeDataSource);
        }
        if ([value caseInsensitiveCompare:@"Evaluation"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeEvaluation);
        }
        if ([value caseInsensitiveCompare:@"MLModel"] == NSOrderedSame) {
            return @(AWSMachineLearningTaggableResourceTypeMLModel);
        }
        return @(AWSMachineLearningTaggableResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningTaggableResourceTypeBatchPrediction:
                return @"BatchPrediction";
            case AWSMachineLearningTaggableResourceTypeDataSource:
                return @"DataSource";
            case AWSMachineLearningTaggableResourceTypeEvaluation:
                return @"Evaluation";
            case AWSMachineLearningTaggableResourceTypeMLModel:
                return @"MLModel";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMachineLearningTag class]];
}

@end

@implementation AWSMachineLearningEvaluation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"computeTime" : @"ComputeTime",
             @"createdAt" : @"CreatedAt",
             @"createdByIamUser" : @"CreatedByIamUser",
             @"evaluationDataSourceId" : @"EvaluationDataSourceId",
             @"evaluationId" : @"EvaluationId",
             @"finishedAt" : @"FinishedAt",
             @"inputDataLocationS3" : @"InputDataLocationS3",
             @"lastUpdatedAt" : @"LastUpdatedAt",
             @"MLModelId" : @"MLModelId",
             @"message" : @"Message",
             @"name" : @"Name",
             @"performanceMetrics" : @"PerformanceMetrics",
             @"startedAt" : @"StartedAt",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)finishedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)performanceMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMachineLearningPerformanceMetrics class]];
}

+ (NSValueTransformer *)startedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusPending);
        }
        if ([value caseInsensitiveCompare:@"INPROGRESS"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusInprogress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusDeleted);
        }
        return @(AWSMachineLearningEntityStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningEntityStatusPending:
                return @"PENDING";
            case AWSMachineLearningEntityStatusInprogress:
                return @"INPROGRESS";
            case AWSMachineLearningEntityStatusFailed:
                return @"FAILED";
            case AWSMachineLearningEntityStatusCompleted:
                return @"COMPLETED";
            case AWSMachineLearningEntityStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMachineLearningGetBatchPredictionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchPredictionId" : @"BatchPredictionId",
             };
}

@end

@implementation AWSMachineLearningGetBatchPredictionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchPredictionDataSourceId" : @"BatchPredictionDataSourceId",
             @"batchPredictionId" : @"BatchPredictionId",
             @"computeTime" : @"ComputeTime",
             @"createdAt" : @"CreatedAt",
             @"createdByIamUser" : @"CreatedByIamUser",
             @"finishedAt" : @"FinishedAt",
             @"inputDataLocationS3" : @"InputDataLocationS3",
             @"invalidRecordCount" : @"InvalidRecordCount",
             @"lastUpdatedAt" : @"LastUpdatedAt",
             @"logUri" : @"LogUri",
             @"MLModelId" : @"MLModelId",
             @"message" : @"Message",
             @"name" : @"Name",
             @"outputUri" : @"OutputUri",
             @"startedAt" : @"StartedAt",
             @"status" : @"Status",
             @"totalRecordCount" : @"TotalRecordCount",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)finishedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusPending);
        }
        if ([value caseInsensitiveCompare:@"INPROGRESS"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusInprogress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusDeleted);
        }
        return @(AWSMachineLearningEntityStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningEntityStatusPending:
                return @"PENDING";
            case AWSMachineLearningEntityStatusInprogress:
                return @"INPROGRESS";
            case AWSMachineLearningEntityStatusFailed:
                return @"FAILED";
            case AWSMachineLearningEntityStatusCompleted:
                return @"COMPLETED";
            case AWSMachineLearningEntityStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMachineLearningGetDataSourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSourceId" : @"DataSourceId",
             @"verbose" : @"Verbose",
             };
}

@end

@implementation AWSMachineLearningGetDataSourceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"computeStatistics" : @"ComputeStatistics",
             @"computeTime" : @"ComputeTime",
             @"createdAt" : @"CreatedAt",
             @"createdByIamUser" : @"CreatedByIamUser",
             @"dataLocationS3" : @"DataLocationS3",
             @"dataRearrangement" : @"DataRearrangement",
             @"dataSizeInBytes" : @"DataSizeInBytes",
             @"dataSourceId" : @"DataSourceId",
             @"dataSourceSchema" : @"DataSourceSchema",
             @"finishedAt" : @"FinishedAt",
             @"lastUpdatedAt" : @"LastUpdatedAt",
             @"logUri" : @"LogUri",
             @"message" : @"Message",
             @"name" : @"Name",
             @"numberOfFiles" : @"NumberOfFiles",
             @"RDSMetadata" : @"RDSMetadata",
             @"redshiftMetadata" : @"RedshiftMetadata",
             @"roleARN" : @"RoleARN",
             @"startedAt" : @"StartedAt",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)finishedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)RDSMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMachineLearningRDSMetadata class]];
}

+ (NSValueTransformer *)redshiftMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMachineLearningRedshiftMetadata class]];
}

+ (NSValueTransformer *)startedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusPending);
        }
        if ([value caseInsensitiveCompare:@"INPROGRESS"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusInprogress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusDeleted);
        }
        return @(AWSMachineLearningEntityStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningEntityStatusPending:
                return @"PENDING";
            case AWSMachineLearningEntityStatusInprogress:
                return @"INPROGRESS";
            case AWSMachineLearningEntityStatusFailed:
                return @"FAILED";
            case AWSMachineLearningEntityStatusCompleted:
                return @"COMPLETED";
            case AWSMachineLearningEntityStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMachineLearningGetEvaluationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"evaluationId" : @"EvaluationId",
             };
}

@end

@implementation AWSMachineLearningGetEvaluationOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"computeTime" : @"ComputeTime",
             @"createdAt" : @"CreatedAt",
             @"createdByIamUser" : @"CreatedByIamUser",
             @"evaluationDataSourceId" : @"EvaluationDataSourceId",
             @"evaluationId" : @"EvaluationId",
             @"finishedAt" : @"FinishedAt",
             @"inputDataLocationS3" : @"InputDataLocationS3",
             @"lastUpdatedAt" : @"LastUpdatedAt",
             @"logUri" : @"LogUri",
             @"MLModelId" : @"MLModelId",
             @"message" : @"Message",
             @"name" : @"Name",
             @"performanceMetrics" : @"PerformanceMetrics",
             @"startedAt" : @"StartedAt",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)finishedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)performanceMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMachineLearningPerformanceMetrics class]];
}

+ (NSValueTransformer *)startedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusPending);
        }
        if ([value caseInsensitiveCompare:@"INPROGRESS"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusInprogress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusDeleted);
        }
        return @(AWSMachineLearningEntityStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningEntityStatusPending:
                return @"PENDING";
            case AWSMachineLearningEntityStatusInprogress:
                return @"INPROGRESS";
            case AWSMachineLearningEntityStatusFailed:
                return @"FAILED";
            case AWSMachineLearningEntityStatusCompleted:
                return @"COMPLETED";
            case AWSMachineLearningEntityStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMachineLearningGetMLModelInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"MLModelId" : @"MLModelId",
             @"verbose" : @"Verbose",
             };
}

@end

@implementation AWSMachineLearningGetMLModelOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"computeTime" : @"ComputeTime",
             @"createdAt" : @"CreatedAt",
             @"createdByIamUser" : @"CreatedByIamUser",
             @"endpointInfo" : @"EndpointInfo",
             @"finishedAt" : @"FinishedAt",
             @"inputDataLocationS3" : @"InputDataLocationS3",
             @"lastUpdatedAt" : @"LastUpdatedAt",
             @"logUri" : @"LogUri",
             @"MLModelId" : @"MLModelId",
             @"MLModelType" : @"MLModelType",
             @"message" : @"Message",
             @"name" : @"Name",
             @"recipe" : @"Recipe",
             @"schema" : @"Schema",
             @"scoreThreshold" : @"ScoreThreshold",
             @"scoreThresholdLastUpdatedAt" : @"ScoreThresholdLastUpdatedAt",
             @"sizeInBytes" : @"SizeInBytes",
             @"startedAt" : @"StartedAt",
             @"status" : @"Status",
             @"trainingDataSourceId" : @"TrainingDataSourceId",
             @"trainingParameters" : @"TrainingParameters",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)endpointInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMachineLearningRealtimeEndpointInfo class]];
}

+ (NSValueTransformer *)finishedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)MLModelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REGRESSION"] == NSOrderedSame) {
            return @(AWSMachineLearningMLModelTypeRegression);
        }
        if ([value caseInsensitiveCompare:@"BINARY"] == NSOrderedSame) {
            return @(AWSMachineLearningMLModelTypeBinary);
        }
        if ([value caseInsensitiveCompare:@"MULTICLASS"] == NSOrderedSame) {
            return @(AWSMachineLearningMLModelTypeMulticlass);
        }
        return @(AWSMachineLearningMLModelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningMLModelTypeRegression:
                return @"REGRESSION";
            case AWSMachineLearningMLModelTypeBinary:
                return @"BINARY";
            case AWSMachineLearningMLModelTypeMulticlass:
                return @"MULTICLASS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scoreThresholdLastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusPending);
        }
        if ([value caseInsensitiveCompare:@"INPROGRESS"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusInprogress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusDeleted);
        }
        return @(AWSMachineLearningEntityStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningEntityStatusPending:
                return @"PENDING";
            case AWSMachineLearningEntityStatusInprogress:
                return @"INPROGRESS";
            case AWSMachineLearningEntityStatusFailed:
                return @"FAILED";
            case AWSMachineLearningEntityStatusCompleted:
                return @"COMPLETED";
            case AWSMachineLearningEntityStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMachineLearningMLModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithm" : @"Algorithm",
             @"computeTime" : @"ComputeTime",
             @"createdAt" : @"CreatedAt",
             @"createdByIamUser" : @"CreatedByIamUser",
             @"endpointInfo" : @"EndpointInfo",
             @"finishedAt" : @"FinishedAt",
             @"inputDataLocationS3" : @"InputDataLocationS3",
             @"lastUpdatedAt" : @"LastUpdatedAt",
             @"MLModelId" : @"MLModelId",
             @"MLModelType" : @"MLModelType",
             @"message" : @"Message",
             @"name" : @"Name",
             @"scoreThreshold" : @"ScoreThreshold",
             @"scoreThresholdLastUpdatedAt" : @"ScoreThresholdLastUpdatedAt",
             @"sizeInBytes" : @"SizeInBytes",
             @"startedAt" : @"StartedAt",
             @"status" : @"Status",
             @"trainingDataSourceId" : @"TrainingDataSourceId",
             @"trainingParameters" : @"TrainingParameters",
             };
}

+ (NSValueTransformer *)algorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"sgd"] == NSOrderedSame) {
            return @(AWSMachineLearningAlgorithmSgd);
        }
        return @(AWSMachineLearningAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningAlgorithmSgd:
                return @"sgd";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)endpointInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMachineLearningRealtimeEndpointInfo class]];
}

+ (NSValueTransformer *)finishedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)MLModelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REGRESSION"] == NSOrderedSame) {
            return @(AWSMachineLearningMLModelTypeRegression);
        }
        if ([value caseInsensitiveCompare:@"BINARY"] == NSOrderedSame) {
            return @(AWSMachineLearningMLModelTypeBinary);
        }
        if ([value caseInsensitiveCompare:@"MULTICLASS"] == NSOrderedSame) {
            return @(AWSMachineLearningMLModelTypeMulticlass);
        }
        return @(AWSMachineLearningMLModelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningMLModelTypeRegression:
                return @"REGRESSION";
            case AWSMachineLearningMLModelTypeBinary:
                return @"BINARY";
            case AWSMachineLearningMLModelTypeMulticlass:
                return @"MULTICLASS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scoreThresholdLastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusPending);
        }
        if ([value caseInsensitiveCompare:@"INPROGRESS"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusInprogress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMachineLearningEntityStatusDeleted);
        }
        return @(AWSMachineLearningEntityStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningEntityStatusPending:
                return @"PENDING";
            case AWSMachineLearningEntityStatusInprogress:
                return @"INPROGRESS";
            case AWSMachineLearningEntityStatusFailed:
                return @"FAILED";
            case AWSMachineLearningEntityStatusCompleted:
                return @"COMPLETED";
            case AWSMachineLearningEntityStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMachineLearningPerformanceMetrics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"properties" : @"Properties",
             };
}

@end

@implementation AWSMachineLearningPredictInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"MLModelId" : @"MLModelId",
             @"predictEndpoint" : @"PredictEndpoint",
             @"record" : @"Record",
             };
}

@end

@implementation AWSMachineLearningPredictOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"prediction" : @"Prediction",
             };
}

+ (NSValueTransformer *)predictionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMachineLearningPrediction class]];
}

@end

@implementation AWSMachineLearningPrediction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"details" : @"details",
             @"predictedLabel" : @"predictedLabel",
             @"predictedScores" : @"predictedScores",
             @"predictedValue" : @"predictedValue",
             };
}

@end

@implementation AWSMachineLearningRDSDataSpec

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataRearrangement" : @"DataRearrangement",
             @"dataSchema" : @"DataSchema",
             @"dataSchemaUri" : @"DataSchemaUri",
             @"databaseCredentials" : @"DatabaseCredentials",
             @"databaseInformation" : @"DatabaseInformation",
             @"resourceRole" : @"ResourceRole",
             @"s3StagingLocation" : @"S3StagingLocation",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"selectSqlQuery" : @"SelectSqlQuery",
             @"serviceRole" : @"ServiceRole",
             @"subnetId" : @"SubnetId",
             };
}

+ (NSValueTransformer *)databaseCredentialsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMachineLearningRDSDatabaseCredentials class]];
}

+ (NSValueTransformer *)databaseInformationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMachineLearningRDSDatabase class]];
}

@end

@implementation AWSMachineLearningRDSDatabase

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"databaseName" : @"DatabaseName",
             @"instanceIdentifier" : @"InstanceIdentifier",
             };
}

@end

@implementation AWSMachineLearningRDSDatabaseCredentials

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"password" : @"Password",
             @"username" : @"Username",
             };
}

@end

@implementation AWSMachineLearningRDSMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataPipelineId" : @"DataPipelineId",
             @"database" : @"Database",
             @"databaseUserName" : @"DatabaseUserName",
             @"resourceRole" : @"ResourceRole",
             @"selectSqlQuery" : @"SelectSqlQuery",
             @"serviceRole" : @"ServiceRole",
             };
}

+ (NSValueTransformer *)databaseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMachineLearningRDSDatabase class]];
}

@end

@implementation AWSMachineLearningRealtimeEndpointInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"CreatedAt",
             @"endpointStatus" : @"EndpointStatus",
             @"endpointUrl" : @"EndpointUrl",
             @"peakRequestsPerSecond" : @"PeakRequestsPerSecond",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)endpointStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMachineLearningRealtimeEndpointStatusNone);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSMachineLearningRealtimeEndpointStatusReady);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSMachineLearningRealtimeEndpointStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSMachineLearningRealtimeEndpointStatusFailed);
        }
        return @(AWSMachineLearningRealtimeEndpointStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMachineLearningRealtimeEndpointStatusNone:
                return @"NONE";
            case AWSMachineLearningRealtimeEndpointStatusReady:
                return @"READY";
            case AWSMachineLearningRealtimeEndpointStatusUpdating:
                return @"UPDATING";
            case AWSMachineLearningRealtimeEndpointStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMachineLearningRedshiftDataSpec

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataRearrangement" : @"DataRearrangement",
             @"dataSchema" : @"DataSchema",
             @"dataSchemaUri" : @"DataSchemaUri",
             @"databaseCredentials" : @"DatabaseCredentials",
             @"databaseInformation" : @"DatabaseInformation",
             @"s3StagingLocation" : @"S3StagingLocation",
             @"selectSqlQuery" : @"SelectSqlQuery",
             };
}

+ (NSValueTransformer *)databaseCredentialsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMachineLearningRedshiftDatabaseCredentials class]];
}

+ (NSValueTransformer *)databaseInformationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMachineLearningRedshiftDatabase class]];
}

@end

@implementation AWSMachineLearningRedshiftDatabase

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterIdentifier" : @"ClusterIdentifier",
             @"databaseName" : @"DatabaseName",
             };
}

@end

@implementation AWSMachineLearningRedshiftDatabaseCredentials

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"password" : @"Password",
             @"username" : @"Username",
             };
}

@end

@implementation AWSMachineLearningRedshiftMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"databaseUserName" : @"DatabaseUserName",
             @"redshiftDatabase" : @"RedshiftDatabase",
             @"selectSqlQuery" : @"SelectSqlQuery",
             };
}

+ (NSValueTransformer *)redshiftDatabaseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMachineLearningRedshiftDatabase class]];
}

@end

@implementation AWSMachineLearningS3DataSpec

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataLocationS3" : @"DataLocationS3",
             @"dataRearrangement" : @"DataRearrangement",
             @"dataSchema" : @"DataSchema",
             @"dataSchemaLocationS3" : @"DataSchemaLocationS3",
             };
}

@end

@implementation AWSMachineLearningTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSMachineLearningUpdateBatchPredictionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchPredictionId" : @"BatchPredictionId",
             @"batchPredictionName" : @"BatchPredictionName",
             };
}

@end

@implementation AWSMachineLearningUpdateBatchPredictionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchPredictionId" : @"BatchPredictionId",
             };
}

@end

@implementation AWSMachineLearningUpdateDataSourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSourceId" : @"DataSourceId",
             @"dataSourceName" : @"DataSourceName",
             };
}

@end

@implementation AWSMachineLearningUpdateDataSourceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSourceId" : @"DataSourceId",
             };
}

@end

@implementation AWSMachineLearningUpdateEvaluationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"evaluationId" : @"EvaluationId",
             @"evaluationName" : @"EvaluationName",
             };
}

@end

@implementation AWSMachineLearningUpdateEvaluationOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"evaluationId" : @"EvaluationId",
             };
}

@end

@implementation AWSMachineLearningUpdateMLModelInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"MLModelId" : @"MLModelId",
             @"MLModelName" : @"MLModelName",
             @"scoreThreshold" : @"ScoreThreshold",
             };
}

@end

@implementation AWSMachineLearningUpdateMLModelOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"MLModelId" : @"MLModelId",
             };
}

@end
