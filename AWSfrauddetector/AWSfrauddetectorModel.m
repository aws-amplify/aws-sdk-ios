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

#import "AWSfrauddetectorModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSfrauddetectorErrorDomain = @"com.amazonaws.AWSfrauddetectorErrorDomain";

@implementation AWSfrauddetectorBatchCreateVariableError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"code",
             @"message" : @"message",
             @"name" : @"name",
             };
}

@end

@implementation AWSfrauddetectorBatchCreateVariableRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"variableEntries" : @"variableEntries",
             };
}

+ (NSValueTransformer *)variableEntriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorVariableEntry class]];
}

@end

@implementation AWSfrauddetectorBatchCreateVariableResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorBatchCreateVariableError class]];
}

@end

@implementation AWSfrauddetectorBatchGetVariableError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"code",
             @"message" : @"message",
             @"name" : @"name",
             };
}

@end

@implementation AWSfrauddetectorBatchGetVariableRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"names" : @"names",
             };
}

@end

@implementation AWSfrauddetectorBatchGetVariableResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"errors",
             @"variables" : @"variables",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorBatchGetVariableError class]];
}

+ (NSValueTransformer *)variablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorVariable class]];
}

@end

@implementation AWSfrauddetectorCreateDetectorVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"detectorId" : @"detectorId",
             @"externalModelEndpoints" : @"externalModelEndpoints",
             @"modelVersions" : @"modelVersions",
             @"ruleExecutionMode" : @"ruleExecutionMode",
             @"rules" : @"rules",
             };
}

+ (NSValueTransformer *)modelVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorModelVersion class]];
}

+ (NSValueTransformer *)ruleExecutionModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_MATCHED"] == NSOrderedSame) {
            return @(AWSfrauddetectorRuleExecutionModeAllMatched);
        }
        if ([value caseInsensitiveCompare:@"FIRST_MATCHED"] == NSOrderedSame) {
            return @(AWSfrauddetectorRuleExecutionModeFirstMatched);
        }
        return @(AWSfrauddetectorRuleExecutionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorRuleExecutionModeAllMatched:
                return @"ALL_MATCHED";
            case AWSfrauddetectorRuleExecutionModeFirstMatched:
                return @"FIRST_MATCHED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorRule class]];
}

@end

@implementation AWSfrauddetectorCreateDetectorVersionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"detectorId",
             @"detectorVersionId" : @"detectorVersionId",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSfrauddetectorDetectorVersionStatusDraft);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSfrauddetectorDetectorVersionStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSfrauddetectorDetectorVersionStatusInactive);
        }
        return @(AWSfrauddetectorDetectorVersionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorDetectorVersionStatusDraft:
                return @"DRAFT";
            case AWSfrauddetectorDetectorVersionStatusActive:
                return @"ACTIVE";
            case AWSfrauddetectorDetectorVersionStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfrauddetectorCreateModelVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"modelId" : @"modelId",
             @"modelType" : @"modelType",
             };
}

+ (NSValueTransformer *)modelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONLINE_FRAUD_INSIGHTS"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelTypeEnumOnlineFraudInsights);
        }
        return @(AWSfrauddetectorModelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorModelTypeEnumOnlineFraudInsights:
                return @"ONLINE_FRAUD_INSIGHTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfrauddetectorCreateModelVersionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelId" : @"modelId",
             @"modelType" : @"modelType",
             @"modelVersionNumber" : @"modelVersionNumber",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)modelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONLINE_FRAUD_INSIGHTS"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelTypeEnumOnlineFraudInsights);
        }
        return @(AWSfrauddetectorModelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorModelTypeEnumOnlineFraudInsights:
                return @"ONLINE_FRAUD_INSIGHTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfrauddetectorCreateRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"detectorId" : @"detectorId",
             @"expression" : @"expression",
             @"language" : @"language",
             @"outcomes" : @"outcomes",
             @"ruleId" : @"ruleId",
             };
}

+ (NSValueTransformer *)languageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DETECTORPL"] == NSOrderedSame) {
            return @(AWSfrauddetectorLanguageDetectorpl);
        }
        return @(AWSfrauddetectorLanguageUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorLanguageDetectorpl:
                return @"DETECTORPL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfrauddetectorCreateRuleResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rule" : @"rule",
             };
}

+ (NSValueTransformer *)ruleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfrauddetectorRule class]];
}

@end

@implementation AWSfrauddetectorCreateVariableRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSource" : @"dataSource",
             @"dataType" : @"dataType",
             @"defaultValue" : @"defaultValue",
             @"detail" : @"description",
             @"name" : @"name",
             @"variableType" : @"variableType",
             };
}

+ (NSValueTransformer *)dataSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EVENT"] == NSOrderedSame) {
            return @(AWSfrauddetectorDataSourceEvent);
        }
        if ([value caseInsensitiveCompare:@"MODEL_SCORE"] == NSOrderedSame) {
            return @(AWSfrauddetectorDataSourceModelScore);
        }
        if ([value caseInsensitiveCompare:@"EXTERNAL_MODEL_SCORE"] == NSOrderedSame) {
            return @(AWSfrauddetectorDataSourceExternalModelScore);
        }
        return @(AWSfrauddetectorDataSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorDataSourceEvent:
                return @"EVENT";
            case AWSfrauddetectorDataSourceModelScore:
                return @"MODEL_SCORE";
            case AWSfrauddetectorDataSourceExternalModelScore:
                return @"EXTERNAL_MODEL_SCORE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STRING"] == NSOrderedSame) {
            return @(AWSfrauddetectorDataTypeString);
        }
        if ([value caseInsensitiveCompare:@"INTEGER"] == NSOrderedSame) {
            return @(AWSfrauddetectorDataTypeInteger);
        }
        if ([value caseInsensitiveCompare:@"FLOAT"] == NSOrderedSame) {
            return @(AWSfrauddetectorDataTypeFloat);
        }
        if ([value caseInsensitiveCompare:@"BOOLEAN"] == NSOrderedSame) {
            return @(AWSfrauddetectorDataTypeBoolean);
        }
        return @(AWSfrauddetectorDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorDataTypeString:
                return @"STRING";
            case AWSfrauddetectorDataTypeInteger:
                return @"INTEGER";
            case AWSfrauddetectorDataTypeFloat:
                return @"FLOAT";
            case AWSfrauddetectorDataTypeBoolean:
                return @"BOOLEAN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfrauddetectorCreateVariableResult

@end

@implementation AWSfrauddetectorDeleteDetectorRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"detectorId",
             };
}

@end

@implementation AWSfrauddetectorDeleteDetectorResult

@end

@implementation AWSfrauddetectorDeleteDetectorVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"detectorId",
             @"detectorVersionId" : @"detectorVersionId",
             };
}

@end

@implementation AWSfrauddetectorDeleteDetectorVersionResult

@end

@implementation AWSfrauddetectorDeleteEventRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventId" : @"eventId",
             };
}

@end

@implementation AWSfrauddetectorDeleteEventResult

@end

@implementation AWSfrauddetectorDeleteRuleVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"detectorId",
             @"ruleId" : @"ruleId",
             @"ruleVersion" : @"ruleVersion",
             };
}

@end

@implementation AWSfrauddetectorDeleteRuleVersionResult

@end

@implementation AWSfrauddetectorDescribeDetectorRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"detectorId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSfrauddetectorDescribeDetectorResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"detectorId",
             @"detectorVersionSummaries" : @"detectorVersionSummaries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)detectorVersionSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorDetectorVersionSummary class]];
}

@end

@implementation AWSfrauddetectorDescribeModelVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"modelId" : @"modelId",
             @"modelType" : @"modelType",
             @"modelVersionNumber" : @"modelVersionNumber",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)modelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONLINE_FRAUD_INSIGHTS"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelTypeEnumOnlineFraudInsights);
        }
        return @(AWSfrauddetectorModelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorModelTypeEnumOnlineFraudInsights:
                return @"ONLINE_FRAUD_INSIGHTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfrauddetectorDescribeModelVersionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelVersionDetails" : @"modelVersionDetails",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)modelVersionDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorModelVersionDetail class]];
}

@end

@implementation AWSfrauddetectorDetector

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTime" : @"createdTime",
             @"detail" : @"description",
             @"detectorId" : @"detectorId",
             @"lastUpdatedTime" : @"lastUpdatedTime",
             };
}

@end

@implementation AWSfrauddetectorDetectorVersionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"detectorVersionId" : @"detectorVersionId",
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSfrauddetectorDetectorVersionStatusDraft);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSfrauddetectorDetectorVersionStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSfrauddetectorDetectorVersionStatusInactive);
        }
        return @(AWSfrauddetectorDetectorVersionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorDetectorVersionStatusDraft:
                return @"DRAFT";
            case AWSfrauddetectorDetectorVersionStatusActive:
                return @"ACTIVE";
            case AWSfrauddetectorDetectorVersionStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfrauddetectorExternalModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTime" : @"createdTime",
             @"inputConfiguration" : @"inputConfiguration",
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"modelEndpoint" : @"modelEndpoint",
             @"modelEndpointStatus" : @"modelEndpointStatus",
             @"modelSource" : @"modelSource",
             @"outputConfiguration" : @"outputConfiguration",
             @"role" : @"role",
             };
}

+ (NSValueTransformer *)inputConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfrauddetectorModelInputConfiguration class]];
}

+ (NSValueTransformer *)modelEndpointStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASSOCIATED"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelEndpointStatusAssociated);
        }
        if ([value caseInsensitiveCompare:@"DISSOCIATED"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelEndpointStatusDissociated);
        }
        return @(AWSfrauddetectorModelEndpointStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorModelEndpointStatusAssociated:
                return @"ASSOCIATED";
            case AWSfrauddetectorModelEndpointStatusDissociated:
                return @"DISSOCIATED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modelSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SAGEMAKER"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelSourceSagemaker);
        }
        return @(AWSfrauddetectorModelSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorModelSourceSagemaker:
                return @"SAGEMAKER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfrauddetectorModelOutputConfiguration class]];
}

+ (NSValueTransformer *)roleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfrauddetectorRole class]];
}

@end

@implementation AWSfrauddetectorGetDetectorVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"detectorId",
             @"detectorVersionId" : @"detectorVersionId",
             };
}

@end

@implementation AWSfrauddetectorGetDetectorVersionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTime" : @"createdTime",
             @"detail" : @"description",
             @"detectorId" : @"detectorId",
             @"detectorVersionId" : @"detectorVersionId",
             @"externalModelEndpoints" : @"externalModelEndpoints",
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"modelVersions" : @"modelVersions",
             @"ruleExecutionMode" : @"ruleExecutionMode",
             @"rules" : @"rules",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)modelVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorModelVersion class]];
}

+ (NSValueTransformer *)ruleExecutionModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_MATCHED"] == NSOrderedSame) {
            return @(AWSfrauddetectorRuleExecutionModeAllMatched);
        }
        if ([value caseInsensitiveCompare:@"FIRST_MATCHED"] == NSOrderedSame) {
            return @(AWSfrauddetectorRuleExecutionModeFirstMatched);
        }
        return @(AWSfrauddetectorRuleExecutionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorRuleExecutionModeAllMatched:
                return @"ALL_MATCHED";
            case AWSfrauddetectorRuleExecutionModeFirstMatched:
                return @"FIRST_MATCHED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorRule class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSfrauddetectorDetectorVersionStatusDraft);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSfrauddetectorDetectorVersionStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSfrauddetectorDetectorVersionStatusInactive);
        }
        return @(AWSfrauddetectorDetectorVersionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorDetectorVersionStatusDraft:
                return @"DRAFT";
            case AWSfrauddetectorDetectorVersionStatusActive:
                return @"ACTIVE";
            case AWSfrauddetectorDetectorVersionStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfrauddetectorGetDetectorsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"detectorId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSfrauddetectorGetDetectorsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectors" : @"detectors",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)detectorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorDetector class]];
}

@end

@implementation AWSfrauddetectorGetExternalModelsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"modelEndpoint" : @"modelEndpoint",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSfrauddetectorGetExternalModelsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"externalModels" : @"externalModels",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)externalModelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorExternalModel class]];
}

@end

@implementation AWSfrauddetectorGetModelVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelId" : @"modelId",
             @"modelType" : @"modelType",
             @"modelVersionNumber" : @"modelVersionNumber",
             };
}

+ (NSValueTransformer *)modelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONLINE_FRAUD_INSIGHTS"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelTypeEnumOnlineFraudInsights);
        }
        return @(AWSfrauddetectorModelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorModelTypeEnumOnlineFraudInsights:
                return @"ONLINE_FRAUD_INSIGHTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfrauddetectorGetModelVersionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"modelId" : @"modelId",
             @"modelType" : @"modelType",
             @"modelVersionNumber" : @"modelVersionNumber",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)modelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONLINE_FRAUD_INSIGHTS"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelTypeEnumOnlineFraudInsights);
        }
        return @(AWSfrauddetectorModelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorModelTypeEnumOnlineFraudInsights:
                return @"ONLINE_FRAUD_INSIGHTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfrauddetectorGetModelsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"modelId" : @"modelId",
             @"modelType" : @"modelType",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)modelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONLINE_FRAUD_INSIGHTS"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelTypeEnumOnlineFraudInsights);
        }
        return @(AWSfrauddetectorModelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorModelTypeEnumOnlineFraudInsights:
                return @"ONLINE_FRAUD_INSIGHTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfrauddetectorGetModelsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"models" : @"models",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)modelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorModel class]];
}

@end

@implementation AWSfrauddetectorGetOutcomesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"name" : @"name",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSfrauddetectorGetOutcomesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"outcomes" : @"outcomes",
             };
}

+ (NSValueTransformer *)outcomesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorOutcome class]];
}

@end

@implementation AWSfrauddetectorGetPredictionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"detectorId",
             @"detectorVersionId" : @"detectorVersionId",
             @"eventAttributes" : @"eventAttributes",
             @"eventId" : @"eventId",
             @"externalModelEndpointDataBlobs" : @"externalModelEndpointDataBlobs",
             };
}

+ (NSValueTransformer *)externalModelEndpointDataBlobsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSfrauddetectorModelEndpointDataBlob class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSfrauddetectorGetPredictionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelScores" : @"modelScores",
             @"outcomes" : @"outcomes",
             @"ruleResults" : @"ruleResults",
             };
}

+ (NSValueTransformer *)modelScoresJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorModelScores class]];
}

+ (NSValueTransformer *)ruleResultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorRuleResult class]];
}

@end

@implementation AWSfrauddetectorGetRulesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"detectorId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"ruleId" : @"ruleId",
             @"ruleVersion" : @"ruleVersion",
             };
}

@end

@implementation AWSfrauddetectorGetRulesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"ruleDetails" : @"ruleDetails",
             };
}

+ (NSValueTransformer *)ruleDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorRuleDetail class]];
}

@end

@implementation AWSfrauddetectorGetVariablesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"name" : @"name",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSfrauddetectorGetVariablesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"variables" : @"variables",
             };
}

+ (NSValueTransformer *)variablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorVariable class]];
}

@end

@implementation AWSfrauddetectorLabelSchema

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelKey" : @"labelKey",
             @"labelMapper" : @"labelMapper",
             };
}

@end

@implementation AWSfrauddetectorModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTime" : @"createdTime",
             @"detail" : @"description",
             @"labelSchema" : @"labelSchema",
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"modelId" : @"modelId",
             @"modelType" : @"modelType",
             @"modelVariables" : @"modelVariables",
             @"trainingDataSource" : @"trainingDataSource",
             };
}

+ (NSValueTransformer *)labelSchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfrauddetectorLabelSchema class]];
}

+ (NSValueTransformer *)modelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONLINE_FRAUD_INSIGHTS"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelTypeEnumOnlineFraudInsights);
        }
        return @(AWSfrauddetectorModelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorModelTypeEnumOnlineFraudInsights:
                return @"ONLINE_FRAUD_INSIGHTS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modelVariablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorModelVariable class]];
}

+ (NSValueTransformer *)trainingDataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfrauddetectorTrainingDataSource class]];
}

@end

@implementation AWSfrauddetectorModelEndpointDataBlob

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"byteBuffer" : @"byteBuffer",
             @"contentType" : @"contentType",
             };
}

@end

@implementation AWSfrauddetectorModelInputConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"csvInputTemplate" : @"csvInputTemplate",
             @"format" : @"format",
             @"isOpaque" : @"isOpaque",
             @"jsonInputTemplate" : @"jsonInputTemplate",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TEXT_CSV"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelInputDataFormatTextCsv);
        }
        if ([value caseInsensitiveCompare:@"APPLICATION_JSON"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelInputDataFormatApplicationJson);
        }
        return @(AWSfrauddetectorModelInputDataFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorModelInputDataFormatTextCsv:
                return @"TEXT_CSV";
            case AWSfrauddetectorModelInputDataFormatApplicationJson:
                return @"APPLICATION_JSON";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfrauddetectorModelOutputConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"csvIndexToVariableMap" : @"csvIndexToVariableMap",
             @"format" : @"format",
             @"jsonKeyToVariableMap" : @"jsonKeyToVariableMap",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TEXT_CSV"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelOutputDataFormatTextCsv);
        }
        if ([value caseInsensitiveCompare:@"APPLICATION_JSONLINES"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelOutputDataFormatApplicationJsonlines);
        }
        return @(AWSfrauddetectorModelOutputDataFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorModelOutputDataFormatTextCsv:
                return @"TEXT_CSV";
            case AWSfrauddetectorModelOutputDataFormatApplicationJsonlines:
                return @"APPLICATION_JSONLINES";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfrauddetectorModelScores

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelVersion" : @"modelVersion",
             @"scores" : @"scores",
             };
}

+ (NSValueTransformer *)modelVersionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfrauddetectorModelVersion class]];
}

@end

@implementation AWSfrauddetectorModelVariable

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"index" : @"index",
             @"name" : @"name",
             };
}

@end

@implementation AWSfrauddetectorModelVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelId" : @"modelId",
             @"modelType" : @"modelType",
             @"modelVersionNumber" : @"modelVersionNumber",
             };
}

+ (NSValueTransformer *)modelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONLINE_FRAUD_INSIGHTS"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelTypeEnumOnlineFraudInsights);
        }
        return @(AWSfrauddetectorModelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorModelTypeEnumOnlineFraudInsights:
                return @"ONLINE_FRAUD_INSIGHTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfrauddetectorModelVersionDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTime" : @"createdTime",
             @"detail" : @"description",
             @"labelSchema" : @"labelSchema",
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"modelId" : @"modelId",
             @"modelType" : @"modelType",
             @"modelVariables" : @"modelVariables",
             @"modelVersionNumber" : @"modelVersionNumber",
             @"status" : @"status",
             @"trainingDataSource" : @"trainingDataSource",
             @"trainingMetrics" : @"trainingMetrics",
             @"validationMetrics" : @"validationMetrics",
             };
}

+ (NSValueTransformer *)labelSchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfrauddetectorLabelSchema class]];
}

+ (NSValueTransformer *)modelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONLINE_FRAUD_INSIGHTS"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelTypeEnumOnlineFraudInsights);
        }
        return @(AWSfrauddetectorModelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorModelTypeEnumOnlineFraudInsights:
                return @"ONLINE_FRAUD_INSIGHTS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modelVariablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorModelVariable class]];
}

+ (NSValueTransformer *)trainingDataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfrauddetectorTrainingDataSource class]];
}

@end

@implementation AWSfrauddetectorOutcome

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTime" : @"createdTime",
             @"detail" : @"description",
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"name" : @"name",
             };
}

@end

@implementation AWSfrauddetectorPutDetectorRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"detectorId" : @"detectorId",
             };
}

@end

@implementation AWSfrauddetectorPutDetectorResult

@end

@implementation AWSfrauddetectorPutExternalModelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputConfiguration" : @"inputConfiguration",
             @"modelEndpoint" : @"modelEndpoint",
             @"modelEndpointStatus" : @"modelEndpointStatus",
             @"modelSource" : @"modelSource",
             @"outputConfiguration" : @"outputConfiguration",
             @"role" : @"role",
             };
}

+ (NSValueTransformer *)inputConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfrauddetectorModelInputConfiguration class]];
}

+ (NSValueTransformer *)modelEndpointStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASSOCIATED"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelEndpointStatusAssociated);
        }
        if ([value caseInsensitiveCompare:@"DISSOCIATED"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelEndpointStatusDissociated);
        }
        return @(AWSfrauddetectorModelEndpointStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorModelEndpointStatusAssociated:
                return @"ASSOCIATED";
            case AWSfrauddetectorModelEndpointStatusDissociated:
                return @"DISSOCIATED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modelSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SAGEMAKER"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelSourceSagemaker);
        }
        return @(AWSfrauddetectorModelSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorModelSourceSagemaker:
                return @"SAGEMAKER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfrauddetectorModelOutputConfiguration class]];
}

+ (NSValueTransformer *)roleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfrauddetectorRole class]];
}

@end

@implementation AWSfrauddetectorPutExternalModelResult

@end

@implementation AWSfrauddetectorPutModelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"labelSchema" : @"labelSchema",
             @"modelId" : @"modelId",
             @"modelType" : @"modelType",
             @"modelVariables" : @"modelVariables",
             @"trainingDataSource" : @"trainingDataSource",
             };
}

+ (NSValueTransformer *)labelSchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfrauddetectorLabelSchema class]];
}

+ (NSValueTransformer *)modelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONLINE_FRAUD_INSIGHTS"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelTypeEnumOnlineFraudInsights);
        }
        return @(AWSfrauddetectorModelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorModelTypeEnumOnlineFraudInsights:
                return @"ONLINE_FRAUD_INSIGHTS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modelVariablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorModelVariable class]];
}

+ (NSValueTransformer *)trainingDataSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfrauddetectorTrainingDataSource class]];
}

@end

@implementation AWSfrauddetectorPutModelResult

@end

@implementation AWSfrauddetectorPutOutcomeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"name" : @"name",
             };
}

@end

@implementation AWSfrauddetectorPutOutcomeResult

@end

@implementation AWSfrauddetectorRole

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"name" : @"name",
             };
}

@end

@implementation AWSfrauddetectorRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"detectorId",
             @"ruleId" : @"ruleId",
             @"ruleVersion" : @"ruleVersion",
             };
}

@end

@implementation AWSfrauddetectorRuleDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTime" : @"createdTime",
             @"detail" : @"description",
             @"detectorId" : @"detectorId",
             @"expression" : @"expression",
             @"language" : @"language",
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"outcomes" : @"outcomes",
             @"ruleId" : @"ruleId",
             @"ruleVersion" : @"ruleVersion",
             };
}

+ (NSValueTransformer *)languageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DETECTORPL"] == NSOrderedSame) {
            return @(AWSfrauddetectorLanguageDetectorpl);
        }
        return @(AWSfrauddetectorLanguageUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorLanguageDetectorpl:
                return @"DETECTORPL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfrauddetectorRuleResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outcomes" : @"outcomes",
             @"ruleId" : @"ruleId",
             };
}

@end

@implementation AWSfrauddetectorTrainingDataSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"dataAccessRoleArn",
             @"dataLocation" : @"dataLocation",
             };
}

@end

@implementation AWSfrauddetectorUpdateDetectorVersionMetadataRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"detectorId" : @"detectorId",
             @"detectorVersionId" : @"detectorVersionId",
             };
}

@end

@implementation AWSfrauddetectorUpdateDetectorVersionMetadataResult

@end

@implementation AWSfrauddetectorUpdateDetectorVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"detectorId" : @"detectorId",
             @"detectorVersionId" : @"detectorVersionId",
             @"externalModelEndpoints" : @"externalModelEndpoints",
             @"modelVersions" : @"modelVersions",
             @"ruleExecutionMode" : @"ruleExecutionMode",
             @"rules" : @"rules",
             };
}

+ (NSValueTransformer *)modelVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorModelVersion class]];
}

+ (NSValueTransformer *)ruleExecutionModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_MATCHED"] == NSOrderedSame) {
            return @(AWSfrauddetectorRuleExecutionModeAllMatched);
        }
        if ([value caseInsensitiveCompare:@"FIRST_MATCHED"] == NSOrderedSame) {
            return @(AWSfrauddetectorRuleExecutionModeFirstMatched);
        }
        return @(AWSfrauddetectorRuleExecutionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorRuleExecutionModeAllMatched:
                return @"ALL_MATCHED";
            case AWSfrauddetectorRuleExecutionModeFirstMatched:
                return @"FIRST_MATCHED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfrauddetectorRule class]];
}

@end

@implementation AWSfrauddetectorUpdateDetectorVersionResult

@end

@implementation AWSfrauddetectorUpdateDetectorVersionStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorId" : @"detectorId",
             @"detectorVersionId" : @"detectorVersionId",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSfrauddetectorDetectorVersionStatusDraft);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSfrauddetectorDetectorVersionStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSfrauddetectorDetectorVersionStatusInactive);
        }
        return @(AWSfrauddetectorDetectorVersionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorDetectorVersionStatusDraft:
                return @"DRAFT";
            case AWSfrauddetectorDetectorVersionStatusActive:
                return @"ACTIVE";
            case AWSfrauddetectorDetectorVersionStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfrauddetectorUpdateDetectorVersionStatusResult

@end

@implementation AWSfrauddetectorUpdateModelVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"modelId" : @"modelId",
             @"modelType" : @"modelType",
             @"modelVersionNumber" : @"modelVersionNumber",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)modelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONLINE_FRAUD_INSIGHTS"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelTypeEnumOnlineFraudInsights);
        }
        return @(AWSfrauddetectorModelTypeEnumUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorModelTypeEnumOnlineFraudInsights:
                return @"ONLINE_FRAUD_INSIGHTS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRAINING_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelVersionStatusTrainingInProgress);
        }
        if ([value caseInsensitiveCompare:@"TRAINING_COMPLETE"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelVersionStatusTrainingComplete);
        }
        if ([value caseInsensitiveCompare:@"ACTIVATE_REQUESTED"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelVersionStatusActivateRequested);
        }
        if ([value caseInsensitiveCompare:@"ACTIVATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelVersionStatusActivateInProgress);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelVersionStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelVersionStatusInactivateInProgress);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelVersionStatusInactive);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSfrauddetectorModelVersionStatusError);
        }
        return @(AWSfrauddetectorModelVersionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorModelVersionStatusTrainingInProgress:
                return @"TRAINING_IN_PROGRESS";
            case AWSfrauddetectorModelVersionStatusTrainingComplete:
                return @"TRAINING_COMPLETE";
            case AWSfrauddetectorModelVersionStatusActivateRequested:
                return @"ACTIVATE_REQUESTED";
            case AWSfrauddetectorModelVersionStatusActivateInProgress:
                return @"ACTIVATE_IN_PROGRESS";
            case AWSfrauddetectorModelVersionStatusActive:
                return @"ACTIVE";
            case AWSfrauddetectorModelVersionStatusInactivateInProgress:
                return @"INACTIVATE_IN_PROGRESS";
            case AWSfrauddetectorModelVersionStatusInactive:
                return @"INACTIVE";
            case AWSfrauddetectorModelVersionStatusError:
                return @"ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfrauddetectorUpdateModelVersionResult

@end

@implementation AWSfrauddetectorUpdateRuleMetadataRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"rule" : @"rule",
             };
}

+ (NSValueTransformer *)ruleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfrauddetectorRule class]];
}

@end

@implementation AWSfrauddetectorUpdateRuleMetadataResult

@end

@implementation AWSfrauddetectorUpdateRuleVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"expression" : @"expression",
             @"language" : @"language",
             @"outcomes" : @"outcomes",
             @"rule" : @"rule",
             };
}

+ (NSValueTransformer *)languageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DETECTORPL"] == NSOrderedSame) {
            return @(AWSfrauddetectorLanguageDetectorpl);
        }
        return @(AWSfrauddetectorLanguageUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorLanguageDetectorpl:
                return @"DETECTORPL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)ruleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfrauddetectorRule class]];
}

@end

@implementation AWSfrauddetectorUpdateRuleVersionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rule" : @"rule",
             };
}

+ (NSValueTransformer *)ruleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfrauddetectorRule class]];
}

@end

@implementation AWSfrauddetectorUpdateVariableRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultValue" : @"defaultValue",
             @"detail" : @"description",
             @"name" : @"name",
             @"variableType" : @"variableType",
             };
}

@end

@implementation AWSfrauddetectorUpdateVariableResult

@end

@implementation AWSfrauddetectorVariable

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTime" : @"createdTime",
             @"dataSource" : @"dataSource",
             @"dataType" : @"dataType",
             @"defaultValue" : @"defaultValue",
             @"detail" : @"description",
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"name" : @"name",
             @"variableType" : @"variableType",
             };
}

+ (NSValueTransformer *)dataSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EVENT"] == NSOrderedSame) {
            return @(AWSfrauddetectorDataSourceEvent);
        }
        if ([value caseInsensitiveCompare:@"MODEL_SCORE"] == NSOrderedSame) {
            return @(AWSfrauddetectorDataSourceModelScore);
        }
        if ([value caseInsensitiveCompare:@"EXTERNAL_MODEL_SCORE"] == NSOrderedSame) {
            return @(AWSfrauddetectorDataSourceExternalModelScore);
        }
        return @(AWSfrauddetectorDataSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorDataSourceEvent:
                return @"EVENT";
            case AWSfrauddetectorDataSourceModelScore:
                return @"MODEL_SCORE";
            case AWSfrauddetectorDataSourceExternalModelScore:
                return @"EXTERNAL_MODEL_SCORE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STRING"] == NSOrderedSame) {
            return @(AWSfrauddetectorDataTypeString);
        }
        if ([value caseInsensitiveCompare:@"INTEGER"] == NSOrderedSame) {
            return @(AWSfrauddetectorDataTypeInteger);
        }
        if ([value caseInsensitiveCompare:@"FLOAT"] == NSOrderedSame) {
            return @(AWSfrauddetectorDataTypeFloat);
        }
        if ([value caseInsensitiveCompare:@"BOOLEAN"] == NSOrderedSame) {
            return @(AWSfrauddetectorDataTypeBoolean);
        }
        return @(AWSfrauddetectorDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfrauddetectorDataTypeString:
                return @"STRING";
            case AWSfrauddetectorDataTypeInteger:
                return @"INTEGER";
            case AWSfrauddetectorDataTypeFloat:
                return @"FLOAT";
            case AWSfrauddetectorDataTypeBoolean:
                return @"BOOLEAN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfrauddetectorVariableEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSource" : @"dataSource",
             @"dataType" : @"dataType",
             @"defaultValue" : @"defaultValue",
             @"detail" : @"description",
             @"name" : @"name",
             @"variableType" : @"variableType",
             };
}

@end
