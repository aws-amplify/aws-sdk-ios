//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSLogsModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSLogsErrorDomain = @"com.amazonaws.AWSLogsErrorDomain";

@implementation AWSLogsAccountPolicy

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"accountId",
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"policyDocument" : @"policyDocument",
             @"policyName" : @"policyName",
             @"policyType" : @"policyType",
             @"scope" : @"scope",
             @"selectionCriteria" : @"selectionCriteria",
             };
}

+ (NSValueTransformer *)policyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DATA_PROTECTION_POLICY"] == NSOrderedSame) {
            return @(AWSLogsPolicyTypeDataProtectionPolicy);
        }
        if ([value caseInsensitiveCompare:@"SUBSCRIPTION_FILTER_POLICY"] == NSOrderedSame) {
            return @(AWSLogsPolicyTypeSubscriptionFilterPolicy);
        }
        return @(AWSLogsPolicyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsPolicyTypeDataProtectionPolicy:
                return @"DATA_PROTECTION_POLICY";
            case AWSLogsPolicyTypeSubscriptionFilterPolicy:
                return @"SUBSCRIPTION_FILTER_POLICY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scopeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSLogsScopeAll);
        }
        return @(AWSLogsScopeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsScopeAll:
                return @"ALL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsAnomaly

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"active" : @"active",
             @"anomalyDetectorArn" : @"anomalyDetectorArn",
             @"anomalyId" : @"anomalyId",
             @"detail" : @"description",
             @"firstSeen" : @"firstSeen",
             @"histogram" : @"histogram",
             @"isPatternLevelSuppression" : @"isPatternLevelSuppression",
             @"lastSeen" : @"lastSeen",
             @"logGroupArnList" : @"logGroupArnList",
             @"logSamples" : @"logSamples",
             @"patternId" : @"patternId",
             @"patternRegex" : @"patternRegex",
             @"patternString" : @"patternString",
             @"patternTokens" : @"patternTokens",
             @"priority" : @"priority",
             @"state" : @"state",
             @"suppressed" : @"suppressed",
             @"suppressedDate" : @"suppressedDate",
             @"suppressedUntil" : @"suppressedUntil",
             };
}

+ (NSValueTransformer *)logSamplesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsLogEvent class]];
}

+ (NSValueTransformer *)patternTokensJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsPatternToken class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSLogsStateActive);
        }
        if ([value caseInsensitiveCompare:@"Suppressed"] == NSOrderedSame) {
            return @(AWSLogsStateSuppressed);
        }
        if ([value caseInsensitiveCompare:@"Baseline"] == NSOrderedSame) {
            return @(AWSLogsStateBaseline);
        }
        return @(AWSLogsStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsStateActive:
                return @"Active";
            case AWSLogsStateSuppressed:
                return @"Suppressed";
            case AWSLogsStateBaseline:
                return @"Baseline";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsAnomalyDetector

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"anomalyDetectorArn" : @"anomalyDetectorArn",
             @"anomalyDetectorStatus" : @"anomalyDetectorStatus",
             @"anomalyVisibilityTime" : @"anomalyVisibilityTime",
             @"creationTimeStamp" : @"creationTimeStamp",
             @"detectorName" : @"detectorName",
             @"evaluationFrequency" : @"evaluationFrequency",
             @"filterPattern" : @"filterPattern",
             @"kmsKeyId" : @"kmsKeyId",
             @"lastModifiedTimeStamp" : @"lastModifiedTimeStamp",
             @"logGroupArnList" : @"logGroupArnList",
             };
}

+ (NSValueTransformer *)anomalyDetectorStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZING"] == NSOrderedSame) {
            return @(AWSLogsAnomalyDetectorStatusInitializing);
        }
        if ([value caseInsensitiveCompare:@"TRAINING"] == NSOrderedSame) {
            return @(AWSLogsAnomalyDetectorStatusTraining);
        }
        if ([value caseInsensitiveCompare:@"ANALYZING"] == NSOrderedSame) {
            return @(AWSLogsAnomalyDetectorStatusAnalyzing);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLogsAnomalyDetectorStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSLogsAnomalyDetectorStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"PAUSED"] == NSOrderedSame) {
            return @(AWSLogsAnomalyDetectorStatusPaused);
        }
        return @(AWSLogsAnomalyDetectorStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsAnomalyDetectorStatusInitializing:
                return @"INITIALIZING";
            case AWSLogsAnomalyDetectorStatusTraining:
                return @"TRAINING";
            case AWSLogsAnomalyDetectorStatusAnalyzing:
                return @"ANALYZING";
            case AWSLogsAnomalyDetectorStatusFailed:
                return @"FAILED";
            case AWSLogsAnomalyDetectorStatusDeleted:
                return @"DELETED";
            case AWSLogsAnomalyDetectorStatusPaused:
                return @"PAUSED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)evaluationFrequencyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONE_MIN"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyOneMin);
        }
        if ([value caseInsensitiveCompare:@"FIVE_MIN"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyFiveMin);
        }
        if ([value caseInsensitiveCompare:@"TEN_MIN"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyTenMin);
        }
        if ([value caseInsensitiveCompare:@"FIFTEEN_MIN"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyFifteenMin);
        }
        if ([value caseInsensitiveCompare:@"THIRTY_MIN"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyThirtyMin);
        }
        if ([value caseInsensitiveCompare:@"ONE_HOUR"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyOneHour);
        }
        return @(AWSLogsEvaluationFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsEvaluationFrequencyOneMin:
                return @"ONE_MIN";
            case AWSLogsEvaluationFrequencyFiveMin:
                return @"FIVE_MIN";
            case AWSLogsEvaluationFrequencyTenMin:
                return @"TEN_MIN";
            case AWSLogsEvaluationFrequencyFifteenMin:
                return @"FIFTEEN_MIN";
            case AWSLogsEvaluationFrequencyThirtyMin:
                return @"THIRTY_MIN";
            case AWSLogsEvaluationFrequencyOneHour:
                return @"ONE_HOUR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsAssociateKmsKeyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"kmsKeyId",
             @"logGroupName" : @"logGroupName",
             @"resourceIdentifier" : @"resourceIdentifier",
             };
}

@end

@implementation AWSLogsCancelExportTaskRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSLogsCreateDeliveryRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryDestinationArn" : @"deliveryDestinationArn",
             @"deliverySourceName" : @"deliverySourceName",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSLogsCreateDeliveryResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delivery" : @"delivery",
             };
}

+ (NSValueTransformer *)deliveryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsDelivery class]];
}

@end

@implementation AWSLogsCreateExportTaskRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"destination",
             @"destinationPrefix" : @"destinationPrefix",
             @"from" : @"from",
             @"logGroupName" : @"logGroupName",
             @"logStreamNamePrefix" : @"logStreamNamePrefix",
             @"taskName" : @"taskName",
             @"to" : @"to",
             };
}

@end

@implementation AWSLogsCreateExportTaskResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSLogsCreateLogAnomalyDetectorRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"anomalyVisibilityTime" : @"anomalyVisibilityTime",
             @"detectorName" : @"detectorName",
             @"evaluationFrequency" : @"evaluationFrequency",
             @"filterPattern" : @"filterPattern",
             @"kmsKeyId" : @"kmsKeyId",
             @"logGroupArnList" : @"logGroupArnList",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)evaluationFrequencyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONE_MIN"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyOneMin);
        }
        if ([value caseInsensitiveCompare:@"FIVE_MIN"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyFiveMin);
        }
        if ([value caseInsensitiveCompare:@"TEN_MIN"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyTenMin);
        }
        if ([value caseInsensitiveCompare:@"FIFTEEN_MIN"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyFifteenMin);
        }
        if ([value caseInsensitiveCompare:@"THIRTY_MIN"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyThirtyMin);
        }
        if ([value caseInsensitiveCompare:@"ONE_HOUR"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyOneHour);
        }
        return @(AWSLogsEvaluationFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsEvaluationFrequencyOneMin:
                return @"ONE_MIN";
            case AWSLogsEvaluationFrequencyFiveMin:
                return @"FIVE_MIN";
            case AWSLogsEvaluationFrequencyTenMin:
                return @"TEN_MIN";
            case AWSLogsEvaluationFrequencyFifteenMin:
                return @"FIFTEEN_MIN";
            case AWSLogsEvaluationFrequencyThirtyMin:
                return @"THIRTY_MIN";
            case AWSLogsEvaluationFrequencyOneHour:
                return @"ONE_HOUR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsCreateLogAnomalyDetectorResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"anomalyDetectorArn" : @"anomalyDetectorArn",
             };
}

@end

@implementation AWSLogsCreateLogGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"kmsKeyId",
             @"logGroupClass" : @"logGroupClass",
             @"logGroupName" : @"logGroupName",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)logGroupClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSLogsLogGroupClassStandard);
        }
        if ([value caseInsensitiveCompare:@"INFREQUENT_ACCESS"] == NSOrderedSame) {
            return @(AWSLogsLogGroupClassInfrequentAccess);
        }
        return @(AWSLogsLogGroupClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsLogGroupClassStandard:
                return @"STANDARD";
            case AWSLogsLogGroupClassInfrequentAccess:
                return @"INFREQUENT_ACCESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsCreateLogStreamRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"logStreamName" : @"logStreamName",
             };
}

@end

@implementation AWSLogsDeleteAccountPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             @"policyType" : @"policyType",
             };
}

+ (NSValueTransformer *)policyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DATA_PROTECTION_POLICY"] == NSOrderedSame) {
            return @(AWSLogsPolicyTypeDataProtectionPolicy);
        }
        if ([value caseInsensitiveCompare:@"SUBSCRIPTION_FILTER_POLICY"] == NSOrderedSame) {
            return @(AWSLogsPolicyTypeSubscriptionFilterPolicy);
        }
        return @(AWSLogsPolicyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsPolicyTypeDataProtectionPolicy:
                return @"DATA_PROTECTION_POLICY";
            case AWSLogsPolicyTypeSubscriptionFilterPolicy:
                return @"SUBSCRIPTION_FILTER_POLICY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsDeleteDataProtectionPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupIdentifier" : @"logGroupIdentifier",
             };
}

@end

@implementation AWSLogsDeleteDeliveryDestinationPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryDestinationName" : @"deliveryDestinationName",
             };
}

@end

@implementation AWSLogsDeleteDeliveryDestinationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             };
}

@end

@implementation AWSLogsDeleteDeliveryRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"id",
             };
}

@end

@implementation AWSLogsDeleteDeliverySourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             };
}

@end

@implementation AWSLogsDeleteDestinationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationName" : @"destinationName",
             };
}

@end

@implementation AWSLogsDeleteLogAnomalyDetectorRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"anomalyDetectorArn" : @"anomalyDetectorArn",
             };
}

@end

@implementation AWSLogsDeleteLogGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             };
}

@end

@implementation AWSLogsDeleteLogStreamRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"logStreamName" : @"logStreamName",
             };
}

@end

@implementation AWSLogsDeleteMetricFilterRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterName" : @"filterName",
             @"logGroupName" : @"logGroupName",
             };
}

@end

@implementation AWSLogsDeleteQueryDefinitionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queryDefinitionId" : @"queryDefinitionId",
             };
}

@end

@implementation AWSLogsDeleteQueryDefinitionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"success" : @"success",
             };
}

@end

@implementation AWSLogsDeleteResourcePolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             };
}

@end

@implementation AWSLogsDeleteRetentionPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             };
}

@end

@implementation AWSLogsDeleteSubscriptionFilterRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterName" : @"filterName",
             @"logGroupName" : @"logGroupName",
             };
}

@end

@implementation AWSLogsDelivery

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"deliveryDestinationArn" : @"deliveryDestinationArn",
             @"deliveryDestinationType" : @"deliveryDestinationType",
             @"deliverySourceName" : @"deliverySourceName",
             @"identifier" : @"id",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)deliveryDestinationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSLogsDeliveryDestinationTypeS3);
        }
        if ([value caseInsensitiveCompare:@"CWL"] == NSOrderedSame) {
            return @(AWSLogsDeliveryDestinationTypeCwl);
        }
        if ([value caseInsensitiveCompare:@"FH"] == NSOrderedSame) {
            return @(AWSLogsDeliveryDestinationTypeFh);
        }
        return @(AWSLogsDeliveryDestinationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsDeliveryDestinationTypeS3:
                return @"S3";
            case AWSLogsDeliveryDestinationTypeCwl:
                return @"CWL";
            case AWSLogsDeliveryDestinationTypeFh:
                return @"FH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsDeliveryDestination

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"deliveryDestinationConfiguration" : @"deliveryDestinationConfiguration",
             @"deliveryDestinationType" : @"deliveryDestinationType",
             @"name" : @"name",
             @"outputFormat" : @"outputFormat",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)deliveryDestinationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsDeliveryDestinationConfiguration class]];
}

+ (NSValueTransformer *)deliveryDestinationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSLogsDeliveryDestinationTypeS3);
        }
        if ([value caseInsensitiveCompare:@"CWL"] == NSOrderedSame) {
            return @(AWSLogsDeliveryDestinationTypeCwl);
        }
        if ([value caseInsensitiveCompare:@"FH"] == NSOrderedSame) {
            return @(AWSLogsDeliveryDestinationTypeFh);
        }
        return @(AWSLogsDeliveryDestinationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsDeliveryDestinationTypeS3:
                return @"S3";
            case AWSLogsDeliveryDestinationTypeCwl:
                return @"CWL";
            case AWSLogsDeliveryDestinationTypeFh:
                return @"FH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"json"] == NSOrderedSame) {
            return @(AWSLogsOutputFormatJson);
        }
        if ([value caseInsensitiveCompare:@"plain"] == NSOrderedSame) {
            return @(AWSLogsOutputFormatPlain);
        }
        if ([value caseInsensitiveCompare:@"w3c"] == NSOrderedSame) {
            return @(AWSLogsOutputFormatW3c);
        }
        if ([value caseInsensitiveCompare:@"raw"] == NSOrderedSame) {
            return @(AWSLogsOutputFormatRaw);
        }
        if ([value caseInsensitiveCompare:@"parquet"] == NSOrderedSame) {
            return @(AWSLogsOutputFormatParquet);
        }
        return @(AWSLogsOutputFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsOutputFormatJson:
                return @"json";
            case AWSLogsOutputFormatPlain:
                return @"plain";
            case AWSLogsOutputFormatW3c:
                return @"w3c";
            case AWSLogsOutputFormatRaw:
                return @"raw";
            case AWSLogsOutputFormatParquet:
                return @"parquet";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsDeliveryDestinationConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationResourceArn" : @"destinationResourceArn",
             };
}

@end

@implementation AWSLogsDeliverySource

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"logType" : @"logType",
             @"name" : @"name",
             @"resourceArns" : @"resourceArns",
             @"service" : @"service",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSLogsDescribeAccountPoliciesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIdentifiers" : @"accountIdentifiers",
             @"policyName" : @"policyName",
             @"policyType" : @"policyType",
             };
}

+ (NSValueTransformer *)policyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DATA_PROTECTION_POLICY"] == NSOrderedSame) {
            return @(AWSLogsPolicyTypeDataProtectionPolicy);
        }
        if ([value caseInsensitiveCompare:@"SUBSCRIPTION_FILTER_POLICY"] == NSOrderedSame) {
            return @(AWSLogsPolicyTypeSubscriptionFilterPolicy);
        }
        return @(AWSLogsPolicyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsPolicyTypeDataProtectionPolicy:
                return @"DATA_PROTECTION_POLICY";
            case AWSLogsPolicyTypeSubscriptionFilterPolicy:
                return @"SUBSCRIPTION_FILTER_POLICY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsDescribeAccountPoliciesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountPolicies" : @"accountPolicies",
             };
}

+ (NSValueTransformer *)accountPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsAccountPolicy class]];
}

@end

@implementation AWSLogsDescribeDeliveriesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"limit",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLogsDescribeDeliveriesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveries" : @"deliveries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)deliveriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsDelivery class]];
}

@end

@implementation AWSLogsDescribeDeliveryDestinationsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"limit",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLogsDescribeDeliveryDestinationsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryDestinations" : @"deliveryDestinations",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)deliveryDestinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsDeliveryDestination class]];
}

@end

@implementation AWSLogsDescribeDeliverySourcesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"limit",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLogsDescribeDeliverySourcesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliverySources" : @"deliverySources",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)deliverySourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsDeliverySource class]];
}

@end

@implementation AWSLogsDescribeDestinationsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationNamePrefix" : @"DestinationNamePrefix",
             @"limit" : @"limit",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLogsDescribeDestinationsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinations" : @"destinations",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsDestination class]];
}

@end

@implementation AWSLogsDescribeExportTasksRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"limit",
             @"nextToken" : @"nextToken",
             @"statusCode" : @"statusCode",
             @"taskId" : @"taskId",
             };
}

+ (NSValueTransformer *)statusCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodeCancelled);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodeCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodeFailed);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodePending);
        }
        if ([value caseInsensitiveCompare:@"PENDING_CANCEL"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodePendingCancel);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodeRunning);
        }
        return @(AWSLogsExportTaskStatusCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsExportTaskStatusCodeCancelled:
                return @"CANCELLED";
            case AWSLogsExportTaskStatusCodeCompleted:
                return @"COMPLETED";
            case AWSLogsExportTaskStatusCodeFailed:
                return @"FAILED";
            case AWSLogsExportTaskStatusCodePending:
                return @"PENDING";
            case AWSLogsExportTaskStatusCodePendingCancel:
                return @"PENDING_CANCEL";
            case AWSLogsExportTaskStatusCodeRunning:
                return @"RUNNING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsDescribeExportTasksResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportTasks" : @"exportTasks",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)exportTasksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsExportTask class]];
}

@end

@implementation AWSLogsDescribeLogGroupsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIdentifiers" : @"accountIdentifiers",
             @"includeLinkedAccounts" : @"includeLinkedAccounts",
             @"limit" : @"limit",
             @"logGroupClass" : @"logGroupClass",
             @"logGroupNamePattern" : @"logGroupNamePattern",
             @"logGroupNamePrefix" : @"logGroupNamePrefix",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)logGroupClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSLogsLogGroupClassStandard);
        }
        if ([value caseInsensitiveCompare:@"INFREQUENT_ACCESS"] == NSOrderedSame) {
            return @(AWSLogsLogGroupClassInfrequentAccess);
        }
        return @(AWSLogsLogGroupClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsLogGroupClassStandard:
                return @"STANDARD";
            case AWSLogsLogGroupClassInfrequentAccess:
                return @"INFREQUENT_ACCESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsDescribeLogGroupsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroups" : @"logGroups",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)logGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsLogGroup class]];
}

@end

@implementation AWSLogsDescribeLogStreamsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"descending" : @"descending",
             @"limit" : @"limit",
             @"logGroupIdentifier" : @"logGroupIdentifier",
             @"logGroupName" : @"logGroupName",
             @"logStreamNamePrefix" : @"logStreamNamePrefix",
             @"nextToken" : @"nextToken",
             @"orderBy" : @"orderBy",
             };
}

+ (NSValueTransformer *)orderByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LogStreamName"] == NSOrderedSame) {
            return @(AWSLogsOrderByLogStreamName);
        }
        if ([value caseInsensitiveCompare:@"LastEventTime"] == NSOrderedSame) {
            return @(AWSLogsOrderByLastEventTime);
        }
        return @(AWSLogsOrderByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsOrderByLogStreamName:
                return @"LogStreamName";
            case AWSLogsOrderByLastEventTime:
                return @"LastEventTime";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsDescribeLogStreamsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logStreams" : @"logStreams",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)logStreamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsLogStream class]];
}

@end

@implementation AWSLogsDescribeMetricFiltersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterNamePrefix" : @"filterNamePrefix",
             @"limit" : @"limit",
             @"logGroupName" : @"logGroupName",
             @"metricName" : @"metricName",
             @"metricNamespace" : @"metricNamespace",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLogsDescribeMetricFiltersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricFilters" : @"metricFilters",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)metricFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsMetricFilter class]];
}

@end

@implementation AWSLogsDescribeQueriesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Scheduled"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"Running"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Timeout"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusTimeout);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusUnknown);
        }
        return @(AWSLogsQueryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsQueryStatusScheduled:
                return @"Scheduled";
            case AWSLogsQueryStatusRunning:
                return @"Running";
            case AWSLogsQueryStatusComplete:
                return @"Complete";
            case AWSLogsQueryStatusFailed:
                return @"Failed";
            case AWSLogsQueryStatusCancelled:
                return @"Cancelled";
            case AWSLogsQueryStatusTimeout:
                return @"Timeout";
            case AWSLogsQueryStatusUnknown:
                return @"Unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsDescribeQueriesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"queries" : @"queries",
             };
}

+ (NSValueTransformer *)queriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsQueryInfo class]];
}

@end

@implementation AWSLogsDescribeQueryDefinitionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"queryDefinitionNamePrefix" : @"queryDefinitionNamePrefix",
             };
}

@end

@implementation AWSLogsDescribeQueryDefinitionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"queryDefinitions" : @"queryDefinitions",
             };
}

+ (NSValueTransformer *)queryDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsQueryDefinition class]];
}

@end

@implementation AWSLogsDescribeResourcePoliciesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"limit",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLogsDescribeResourcePoliciesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"resourcePolicies" : @"resourcePolicies",
             };
}

+ (NSValueTransformer *)resourcePoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsResourcePolicy class]];
}

@end

@implementation AWSLogsDescribeSubscriptionFiltersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterNamePrefix" : @"filterNamePrefix",
             @"limit" : @"limit",
             @"logGroupName" : @"logGroupName",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLogsDescribeSubscriptionFiltersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"subscriptionFilters" : @"subscriptionFilters",
             };
}

+ (NSValueTransformer *)subscriptionFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsSubscriptionFilter class]];
}

@end

@implementation AWSLogsDestination

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPolicy" : @"accessPolicy",
             @"arn" : @"arn",
             @"creationTime" : @"creationTime",
             @"destinationName" : @"destinationName",
             @"roleArn" : @"roleArn",
             @"targetArn" : @"targetArn",
             };
}

@end

@implementation AWSLogsDisassociateKmsKeyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"resourceIdentifier" : @"resourceIdentifier",
             };
}

@end

@implementation AWSLogsExportTask

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"destination",
             @"destinationPrefix" : @"destinationPrefix",
             @"executionInfo" : @"executionInfo",
             @"from" : @"from",
             @"logGroupName" : @"logGroupName",
             @"status" : @"status",
             @"taskId" : @"taskId",
             @"taskName" : @"taskName",
             @"to" : @"to",
             };
}

+ (NSValueTransformer *)executionInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsExportTaskExecutionInfo class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsExportTaskStatus class]];
}

@end

@implementation AWSLogsExportTaskExecutionInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completionTime" : @"completionTime",
             @"creationTime" : @"creationTime",
             };
}

@end

@implementation AWSLogsExportTaskStatus

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"code",
             @"message" : @"message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodeCancelled);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodeCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodeFailed);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodePending);
        }
        if ([value caseInsensitiveCompare:@"PENDING_CANCEL"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodePendingCancel);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodeRunning);
        }
        return @(AWSLogsExportTaskStatusCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsExportTaskStatusCodeCancelled:
                return @"CANCELLED";
            case AWSLogsExportTaskStatusCodeCompleted:
                return @"COMPLETED";
            case AWSLogsExportTaskStatusCodeFailed:
                return @"FAILED";
            case AWSLogsExportTaskStatusCodePending:
                return @"PENDING";
            case AWSLogsExportTaskStatusCodePendingCancel:
                return @"PENDING_CANCEL";
            case AWSLogsExportTaskStatusCodeRunning:
                return @"RUNNING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsFilterLogEventsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"endTime",
             @"filterPattern" : @"filterPattern",
             @"interleaved" : @"interleaved",
             @"limit" : @"limit",
             @"logGroupIdentifier" : @"logGroupIdentifier",
             @"logGroupName" : @"logGroupName",
             @"logStreamNamePrefix" : @"logStreamNamePrefix",
             @"logStreamNames" : @"logStreamNames",
             @"nextToken" : @"nextToken",
             @"startTime" : @"startTime",
             @"unmask" : @"unmask",
             };
}

@end

@implementation AWSLogsFilterLogEventsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"events",
             @"nextToken" : @"nextToken",
             @"searchedLogStreams" : @"searchedLogStreams",
             };
}

+ (NSValueTransformer *)eventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsFilteredLogEvent class]];
}

+ (NSValueTransformer *)searchedLogStreamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsSearchedLogStream class]];
}

@end

@implementation AWSLogsFilteredLogEvent

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventId" : @"eventId",
             @"ingestionTime" : @"ingestionTime",
             @"logStreamName" : @"logStreamName",
             @"message" : @"message",
             @"timestamp" : @"timestamp",
             };
}

@end

@implementation AWSLogsGetDataProtectionPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupIdentifier" : @"logGroupIdentifier",
             };
}

@end

@implementation AWSLogsGetDataProtectionPolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"logGroupIdentifier" : @"logGroupIdentifier",
             @"policyDocument" : @"policyDocument",
             };
}

@end

@implementation AWSLogsGetDeliveryDestinationPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryDestinationName" : @"deliveryDestinationName",
             };
}

@end

@implementation AWSLogsGetDeliveryDestinationPolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"policy",
             };
}

+ (NSValueTransformer *)policyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsPolicy class]];
}

@end

@implementation AWSLogsGetDeliveryDestinationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             };
}

@end

@implementation AWSLogsGetDeliveryDestinationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryDestination" : @"deliveryDestination",
             };
}

+ (NSValueTransformer *)deliveryDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsDeliveryDestination class]];
}

@end

@implementation AWSLogsGetDeliveryRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"id",
             };
}

@end

@implementation AWSLogsGetDeliveryResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delivery" : @"delivery",
             };
}

+ (NSValueTransformer *)deliveryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsDelivery class]];
}

@end

@implementation AWSLogsGetDeliverySourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             };
}

@end

@implementation AWSLogsGetDeliverySourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliverySource" : @"deliverySource",
             };
}

+ (NSValueTransformer *)deliverySourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsDeliverySource class]];
}

@end

@implementation AWSLogsGetLogAnomalyDetectorRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"anomalyDetectorArn" : @"anomalyDetectorArn",
             };
}

@end

@implementation AWSLogsGetLogAnomalyDetectorResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"anomalyDetectorStatus" : @"anomalyDetectorStatus",
             @"anomalyVisibilityTime" : @"anomalyVisibilityTime",
             @"creationTimeStamp" : @"creationTimeStamp",
             @"detectorName" : @"detectorName",
             @"evaluationFrequency" : @"evaluationFrequency",
             @"filterPattern" : @"filterPattern",
             @"kmsKeyId" : @"kmsKeyId",
             @"lastModifiedTimeStamp" : @"lastModifiedTimeStamp",
             @"logGroupArnList" : @"logGroupArnList",
             };
}

+ (NSValueTransformer *)anomalyDetectorStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZING"] == NSOrderedSame) {
            return @(AWSLogsAnomalyDetectorStatusInitializing);
        }
        if ([value caseInsensitiveCompare:@"TRAINING"] == NSOrderedSame) {
            return @(AWSLogsAnomalyDetectorStatusTraining);
        }
        if ([value caseInsensitiveCompare:@"ANALYZING"] == NSOrderedSame) {
            return @(AWSLogsAnomalyDetectorStatusAnalyzing);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLogsAnomalyDetectorStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSLogsAnomalyDetectorStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"PAUSED"] == NSOrderedSame) {
            return @(AWSLogsAnomalyDetectorStatusPaused);
        }
        return @(AWSLogsAnomalyDetectorStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsAnomalyDetectorStatusInitializing:
                return @"INITIALIZING";
            case AWSLogsAnomalyDetectorStatusTraining:
                return @"TRAINING";
            case AWSLogsAnomalyDetectorStatusAnalyzing:
                return @"ANALYZING";
            case AWSLogsAnomalyDetectorStatusFailed:
                return @"FAILED";
            case AWSLogsAnomalyDetectorStatusDeleted:
                return @"DELETED";
            case AWSLogsAnomalyDetectorStatusPaused:
                return @"PAUSED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)evaluationFrequencyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONE_MIN"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyOneMin);
        }
        if ([value caseInsensitiveCompare:@"FIVE_MIN"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyFiveMin);
        }
        if ([value caseInsensitiveCompare:@"TEN_MIN"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyTenMin);
        }
        if ([value caseInsensitiveCompare:@"FIFTEEN_MIN"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyFifteenMin);
        }
        if ([value caseInsensitiveCompare:@"THIRTY_MIN"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyThirtyMin);
        }
        if ([value caseInsensitiveCompare:@"ONE_HOUR"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyOneHour);
        }
        return @(AWSLogsEvaluationFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsEvaluationFrequencyOneMin:
                return @"ONE_MIN";
            case AWSLogsEvaluationFrequencyFiveMin:
                return @"FIVE_MIN";
            case AWSLogsEvaluationFrequencyTenMin:
                return @"TEN_MIN";
            case AWSLogsEvaluationFrequencyFifteenMin:
                return @"FIFTEEN_MIN";
            case AWSLogsEvaluationFrequencyThirtyMin:
                return @"THIRTY_MIN";
            case AWSLogsEvaluationFrequencyOneHour:
                return @"ONE_HOUR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsGetLogEventsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"endTime",
             @"limit" : @"limit",
             @"logGroupIdentifier" : @"logGroupIdentifier",
             @"logGroupName" : @"logGroupName",
             @"logStreamName" : @"logStreamName",
             @"nextToken" : @"nextToken",
             @"startFromHead" : @"startFromHead",
             @"startTime" : @"startTime",
             @"unmask" : @"unmask",
             };
}

@end

@implementation AWSLogsGetLogEventsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"events",
             @"nextBackwardToken" : @"nextBackwardToken",
             @"nextForwardToken" : @"nextForwardToken",
             };
}

+ (NSValueTransformer *)eventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsOutputLogEvent class]];
}

@end

@implementation AWSLogsGetLogGroupFieldsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupIdentifier" : @"logGroupIdentifier",
             @"logGroupName" : @"logGroupName",
             @"time" : @"time",
             };
}

@end

@implementation AWSLogsGetLogGroupFieldsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupFields" : @"logGroupFields",
             };
}

+ (NSValueTransformer *)logGroupFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsLogGroupField class]];
}

@end

@implementation AWSLogsGetLogRecordRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logRecordPointer" : @"logRecordPointer",
             @"unmask" : @"unmask",
             };
}

@end

@implementation AWSLogsGetLogRecordResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logRecord" : @"logRecord",
             };
}

@end

@implementation AWSLogsGetQueryResultsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queryId" : @"queryId",
             };
}

@end

@implementation AWSLogsGetQueryResultsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionKey" : @"encryptionKey",
             @"results" : @"results",
             @"statistics" : @"statistics",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statisticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsQueryStatistics class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Scheduled"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"Running"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Timeout"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusTimeout);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusUnknown);
        }
        return @(AWSLogsQueryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsQueryStatusScheduled:
                return @"Scheduled";
            case AWSLogsQueryStatusRunning:
                return @"Running";
            case AWSLogsQueryStatusComplete:
                return @"Complete";
            case AWSLogsQueryStatusFailed:
                return @"Failed";
            case AWSLogsQueryStatusCancelled:
                return @"Cancelled";
            case AWSLogsQueryStatusTimeout:
                return @"Timeout";
            case AWSLogsQueryStatusUnknown:
                return @"Unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsInputLogEvent

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"message",
             @"timestamp" : @"timestamp",
             };
}

@end

@implementation AWSLogsListAnomaliesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"anomalyDetectorArn" : @"anomalyDetectorArn",
             @"limit" : @"limit",
             @"nextToken" : @"nextToken",
             @"suppressionState" : @"suppressionState",
             };
}

+ (NSValueTransformer *)suppressionStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUPPRESSED"] == NSOrderedSame) {
            return @(AWSLogsSuppressionStateSuppressed);
        }
        if ([value caseInsensitiveCompare:@"UNSUPPRESSED"] == NSOrderedSame) {
            return @(AWSLogsSuppressionStateUnsuppressed);
        }
        return @(AWSLogsSuppressionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsSuppressionStateSuppressed:
                return @"SUPPRESSED";
            case AWSLogsSuppressionStateUnsuppressed:
                return @"UNSUPPRESSED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsListAnomaliesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"anomalies" : @"anomalies",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)anomaliesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsAnomaly class]];
}

@end

@implementation AWSLogsListLogAnomalyDetectorsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterLogGroupArn" : @"filterLogGroupArn",
             @"limit" : @"limit",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLogsListLogAnomalyDetectorsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"anomalyDetectors" : @"anomalyDetectors",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)anomalyDetectorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsAnomalyDetector class]];
}

@end

@implementation AWSLogsListTagsForResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSLogsListTagsForResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             };
}

@end

@implementation AWSLogsListTagsLogGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             };
}

@end

@implementation AWSLogsListTagsLogGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             };
}

@end

@implementation AWSLogsLiveTailSessionLogEvent

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ingestionTime" : @"ingestionTime",
             @"logGroupIdentifier" : @"logGroupIdentifier",
             @"logStreamName" : @"logStreamName",
             @"message" : @"message",
             @"timestamp" : @"timestamp",
             };
}

@end

@implementation AWSLogsLiveTailSessionMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sampled" : @"sampled",
             };
}

@end

@implementation AWSLogsLiveTailSessionStart

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logEventFilterPattern" : @"logEventFilterPattern",
             @"logGroupIdentifiers" : @"logGroupIdentifiers",
             @"logStreamNamePrefixes" : @"logStreamNamePrefixes",
             @"logStreamNames" : @"logStreamNames",
             @"requestId" : @"requestId",
             @"sessionId" : @"sessionId",
             };
}

@end

@implementation AWSLogsLiveTailSessionUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionMetadata" : @"sessionMetadata",
             @"sessionResults" : @"sessionResults",
             };
}

+ (NSValueTransformer *)sessionMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsLiveTailSessionMetadata class]];
}

+ (NSValueTransformer *)sessionResultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsLiveTailSessionLogEvent class]];
}

@end

@implementation AWSLogsLogEvent

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"message",
             @"timestamp" : @"timestamp",
             };
}

@end

@implementation AWSLogsLogGroup

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"creationTime" : @"creationTime",
             @"dataProtectionStatus" : @"dataProtectionStatus",
             @"inheritedProperties" : @"inheritedProperties",
             @"kmsKeyId" : @"kmsKeyId",
             @"logGroupArn" : @"logGroupArn",
             @"logGroupClass" : @"logGroupClass",
             @"logGroupName" : @"logGroupName",
             @"metricFilterCount" : @"metricFilterCount",
             @"retentionInDays" : @"retentionInDays",
             @"storedBytes" : @"storedBytes",
             };
}

+ (NSValueTransformer *)dataProtectionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVATED"] == NSOrderedSame) {
            return @(AWSLogsDataProtectionStatusActivated);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSLogsDataProtectionStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVED"] == NSOrderedSame) {
            return @(AWSLogsDataProtectionStatusArchived);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSLogsDataProtectionStatusDisabled);
        }
        return @(AWSLogsDataProtectionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsDataProtectionStatusActivated:
                return @"ACTIVATED";
            case AWSLogsDataProtectionStatusDeleted:
                return @"DELETED";
            case AWSLogsDataProtectionStatusArchived:
                return @"ARCHIVED";
            case AWSLogsDataProtectionStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)logGroupClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSLogsLogGroupClassStandard);
        }
        if ([value caseInsensitiveCompare:@"INFREQUENT_ACCESS"] == NSOrderedSame) {
            return @(AWSLogsLogGroupClassInfrequentAccess);
        }
        return @(AWSLogsLogGroupClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsLogGroupClassStandard:
                return @"STANDARD";
            case AWSLogsLogGroupClassInfrequentAccess:
                return @"INFREQUENT_ACCESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsLogGroupField

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"percent" : @"percent",
             };
}

@end

@implementation AWSLogsLogStream

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"creationTime" : @"creationTime",
             @"firstEventTimestamp" : @"firstEventTimestamp",
             @"lastEventTimestamp" : @"lastEventTimestamp",
             @"lastIngestionTime" : @"lastIngestionTime",
             @"logStreamName" : @"logStreamName",
             @"storedBytes" : @"storedBytes",
             @"uploadSequenceToken" : @"uploadSequenceToken",
             };
}

@end

@implementation AWSLogsMetricFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"creationTime",
             @"filterName" : @"filterName",
             @"filterPattern" : @"filterPattern",
             @"logGroupName" : @"logGroupName",
             @"metricTransformations" : @"metricTransformations",
             };
}

+ (NSValueTransformer *)metricTransformationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsMetricTransformation class]];
}

@end

@implementation AWSLogsMetricFilterMatchRecord

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventMessage" : @"eventMessage",
             @"eventNumber" : @"eventNumber",
             @"extractedValues" : @"extractedValues",
             };
}

@end

@implementation AWSLogsMetricTransformation

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultValue" : @"defaultValue",
             @"dimensions" : @"dimensions",
             @"metricName" : @"metricName",
             @"metricNamespace" : @"metricNamespace",
             @"metricValue" : @"metricValue",
             @"unit" : @"unit",
             };
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Seconds"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitSeconds);
        }
        if ([value caseInsensitiveCompare:@"Microseconds"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitMicroseconds);
        }
        if ([value caseInsensitiveCompare:@"Milliseconds"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitMilliseconds);
        }
        if ([value caseInsensitiveCompare:@"Bytes"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitBytes);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitKilobytes);
        }
        if ([value caseInsensitiveCompare:@"Megabytes"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitMegabytes);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitGigabytes);
        }
        if ([value caseInsensitiveCompare:@"Terabytes"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitTerabytes);
        }
        if ([value caseInsensitiveCompare:@"Bits"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitBits);
        }
        if ([value caseInsensitiveCompare:@"Kilobits"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitKilobits);
        }
        if ([value caseInsensitiveCompare:@"Megabits"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitMegabits);
        }
        if ([value caseInsensitiveCompare:@"Gigabits"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitGigabits);
        }
        if ([value caseInsensitiveCompare:@"Terabits"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitTerabits);
        }
        if ([value caseInsensitiveCompare:@"Percent"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitPercent);
        }
        if ([value caseInsensitiveCompare:@"Count"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitCount);
        }
        if ([value caseInsensitiveCompare:@"Bytes/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitBytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitKilobytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabytes/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitMegabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitGigabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabytes/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitTerabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Bits/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitBitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobits/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitKilobitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabits/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitMegabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabits/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitGigabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabits/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitTerabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Count/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitCountSecond);
        }
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitNone);
        }
        return @(AWSLogsStandardUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsStandardUnitSeconds:
                return @"Seconds";
            case AWSLogsStandardUnitMicroseconds:
                return @"Microseconds";
            case AWSLogsStandardUnitMilliseconds:
                return @"Milliseconds";
            case AWSLogsStandardUnitBytes:
                return @"Bytes";
            case AWSLogsStandardUnitKilobytes:
                return @"Kilobytes";
            case AWSLogsStandardUnitMegabytes:
                return @"Megabytes";
            case AWSLogsStandardUnitGigabytes:
                return @"Gigabytes";
            case AWSLogsStandardUnitTerabytes:
                return @"Terabytes";
            case AWSLogsStandardUnitBits:
                return @"Bits";
            case AWSLogsStandardUnitKilobits:
                return @"Kilobits";
            case AWSLogsStandardUnitMegabits:
                return @"Megabits";
            case AWSLogsStandardUnitGigabits:
                return @"Gigabits";
            case AWSLogsStandardUnitTerabits:
                return @"Terabits";
            case AWSLogsStandardUnitPercent:
                return @"Percent";
            case AWSLogsStandardUnitCount:
                return @"Count";
            case AWSLogsStandardUnitBytesSecond:
                return @"Bytes/Second";
            case AWSLogsStandardUnitKilobytesSecond:
                return @"Kilobytes/Second";
            case AWSLogsStandardUnitMegabytesSecond:
                return @"Megabytes/Second";
            case AWSLogsStandardUnitGigabytesSecond:
                return @"Gigabytes/Second";
            case AWSLogsStandardUnitTerabytesSecond:
                return @"Terabytes/Second";
            case AWSLogsStandardUnitBitsSecond:
                return @"Bits/Second";
            case AWSLogsStandardUnitKilobitsSecond:
                return @"Kilobits/Second";
            case AWSLogsStandardUnitMegabitsSecond:
                return @"Megabits/Second";
            case AWSLogsStandardUnitGigabitsSecond:
                return @"Gigabits/Second";
            case AWSLogsStandardUnitTerabitsSecond:
                return @"Terabits/Second";
            case AWSLogsStandardUnitCountSecond:
                return @"Count/Second";
            case AWSLogsStandardUnitNone:
                return @"None";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsOutputLogEvent

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ingestionTime" : @"ingestionTime",
             @"message" : @"message",
             @"timestamp" : @"timestamp",
             };
}

@end

@implementation AWSLogsPatternToken

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dynamicTokenPosition" : @"dynamicTokenPosition",
             @"enumerations" : @"enumerations",
             @"isDynamic" : @"isDynamic",
             @"tokenString" : @"tokenString",
             };
}

@end

@implementation AWSLogsPolicy

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryDestinationPolicy" : @"deliveryDestinationPolicy",
             };
}

@end

@implementation AWSLogsPutAccountPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyDocument" : @"policyDocument",
             @"policyName" : @"policyName",
             @"policyType" : @"policyType",
             @"scope" : @"scope",
             @"selectionCriteria" : @"selectionCriteria",
             };
}

+ (NSValueTransformer *)policyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DATA_PROTECTION_POLICY"] == NSOrderedSame) {
            return @(AWSLogsPolicyTypeDataProtectionPolicy);
        }
        if ([value caseInsensitiveCompare:@"SUBSCRIPTION_FILTER_POLICY"] == NSOrderedSame) {
            return @(AWSLogsPolicyTypeSubscriptionFilterPolicy);
        }
        return @(AWSLogsPolicyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsPolicyTypeDataProtectionPolicy:
                return @"DATA_PROTECTION_POLICY";
            case AWSLogsPolicyTypeSubscriptionFilterPolicy:
                return @"SUBSCRIPTION_FILTER_POLICY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scopeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSLogsScopeAll);
        }
        return @(AWSLogsScopeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsScopeAll:
                return @"ALL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsPutAccountPolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountPolicy" : @"accountPolicy",
             };
}

+ (NSValueTransformer *)accountPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsAccountPolicy class]];
}

@end

@implementation AWSLogsPutDataProtectionPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupIdentifier" : @"logGroupIdentifier",
             @"policyDocument" : @"policyDocument",
             };
}

@end

@implementation AWSLogsPutDataProtectionPolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"logGroupIdentifier" : @"logGroupIdentifier",
             @"policyDocument" : @"policyDocument",
             };
}

@end

@implementation AWSLogsPutDeliveryDestinationPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryDestinationName" : @"deliveryDestinationName",
             @"deliveryDestinationPolicy" : @"deliveryDestinationPolicy",
             };
}

@end

@implementation AWSLogsPutDeliveryDestinationPolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"policy",
             };
}

+ (NSValueTransformer *)policyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsPolicy class]];
}

@end

@implementation AWSLogsPutDeliveryDestinationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryDestinationConfiguration" : @"deliveryDestinationConfiguration",
             @"name" : @"name",
             @"outputFormat" : @"outputFormat",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)deliveryDestinationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsDeliveryDestinationConfiguration class]];
}

+ (NSValueTransformer *)outputFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"json"] == NSOrderedSame) {
            return @(AWSLogsOutputFormatJson);
        }
        if ([value caseInsensitiveCompare:@"plain"] == NSOrderedSame) {
            return @(AWSLogsOutputFormatPlain);
        }
        if ([value caseInsensitiveCompare:@"w3c"] == NSOrderedSame) {
            return @(AWSLogsOutputFormatW3c);
        }
        if ([value caseInsensitiveCompare:@"raw"] == NSOrderedSame) {
            return @(AWSLogsOutputFormatRaw);
        }
        if ([value caseInsensitiveCompare:@"parquet"] == NSOrderedSame) {
            return @(AWSLogsOutputFormatParquet);
        }
        return @(AWSLogsOutputFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsOutputFormatJson:
                return @"json";
            case AWSLogsOutputFormatPlain:
                return @"plain";
            case AWSLogsOutputFormatW3c:
                return @"w3c";
            case AWSLogsOutputFormatRaw:
                return @"raw";
            case AWSLogsOutputFormatParquet:
                return @"parquet";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsPutDeliveryDestinationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryDestination" : @"deliveryDestination",
             };
}

+ (NSValueTransformer *)deliveryDestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsDeliveryDestination class]];
}

@end

@implementation AWSLogsPutDeliverySourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logType" : @"logType",
             @"name" : @"name",
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSLogsPutDeliverySourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliverySource" : @"deliverySource",
             };
}

+ (NSValueTransformer *)deliverySourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsDeliverySource class]];
}

@end

@implementation AWSLogsPutDestinationPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPolicy" : @"accessPolicy",
             @"destinationName" : @"destinationName",
             @"forceUpdate" : @"forceUpdate",
             };
}

@end

@implementation AWSLogsPutDestinationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationName" : @"destinationName",
             @"roleArn" : @"roleArn",
             @"tags" : @"tags",
             @"targetArn" : @"targetArn",
             };
}

@end

@implementation AWSLogsPutDestinationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"destination",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsDestination class]];
}

@end

@implementation AWSLogsPutLogEventsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logEvents" : @"logEvents",
             @"logGroupName" : @"logGroupName",
             @"logStreamName" : @"logStreamName",
             @"sequenceToken" : @"sequenceToken",
             };
}

+ (NSValueTransformer *)logEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsInputLogEvent class]];
}

@end

@implementation AWSLogsPutLogEventsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextSequenceToken" : @"nextSequenceToken",
             @"rejectedLogEventsInfo" : @"rejectedLogEventsInfo",
             };
}

+ (NSValueTransformer *)rejectedLogEventsInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsRejectedLogEventsInfo class]];
}

@end

@implementation AWSLogsPutMetricFilterRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterName" : @"filterName",
             @"filterPattern" : @"filterPattern",
             @"logGroupName" : @"logGroupName",
             @"metricTransformations" : @"metricTransformations",
             };
}

+ (NSValueTransformer *)metricTransformationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsMetricTransformation class]];
}

@end

@implementation AWSLogsPutQueryDefinitionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"logGroupNames" : @"logGroupNames",
             @"name" : @"name",
             @"queryDefinitionId" : @"queryDefinitionId",
             @"queryString" : @"queryString",
             };
}

@end

@implementation AWSLogsPutQueryDefinitionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queryDefinitionId" : @"queryDefinitionId",
             };
}

@end

@implementation AWSLogsPutResourcePolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyDocument" : @"policyDocument",
             @"policyName" : @"policyName",
             };
}

@end

@implementation AWSLogsPutResourcePolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourcePolicy" : @"resourcePolicy",
             };
}

+ (NSValueTransformer *)resourcePolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsResourcePolicy class]];
}

@end

@implementation AWSLogsPutRetentionPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"retentionInDays" : @"retentionInDays",
             };
}

@end

@implementation AWSLogsPutSubscriptionFilterRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationArn" : @"destinationArn",
             @"distribution" : @"distribution",
             @"filterName" : @"filterName",
             @"filterPattern" : @"filterPattern",
             @"logGroupName" : @"logGroupName",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)distributionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Random"] == NSOrderedSame) {
            return @(AWSLogsDistributionRandom);
        }
        if ([value caseInsensitiveCompare:@"ByLogStream"] == NSOrderedSame) {
            return @(AWSLogsDistributionByLogStream);
        }
        return @(AWSLogsDistributionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsDistributionRandom:
                return @"Random";
            case AWSLogsDistributionByLogStream:
                return @"ByLogStream";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsQueryCompileError

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"location" : @"location",
             @"message" : @"message",
             };
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsQueryCompileErrorLocation class]];
}

@end

@implementation AWSLogsQueryCompileErrorLocation

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endCharOffset" : @"endCharOffset",
             @"startCharOffset" : @"startCharOffset",
             };
}

@end

@implementation AWSLogsQueryDefinition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastModified" : @"lastModified",
             @"logGroupNames" : @"logGroupNames",
             @"name" : @"name",
             @"queryDefinitionId" : @"queryDefinitionId",
             @"queryString" : @"queryString",
             };
}

@end

@implementation AWSLogsQueryInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"createTime",
             @"logGroupName" : @"logGroupName",
             @"queryId" : @"queryId",
             @"queryString" : @"queryString",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Scheduled"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"Running"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Timeout"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusTimeout);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusUnknown);
        }
        return @(AWSLogsQueryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsQueryStatusScheduled:
                return @"Scheduled";
            case AWSLogsQueryStatusRunning:
                return @"Running";
            case AWSLogsQueryStatusComplete:
                return @"Complete";
            case AWSLogsQueryStatusFailed:
                return @"Failed";
            case AWSLogsQueryStatusCancelled:
                return @"Cancelled";
            case AWSLogsQueryStatusTimeout:
                return @"Timeout";
            case AWSLogsQueryStatusUnknown:
                return @"Unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsQueryStatistics

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bytesScanned" : @"bytesScanned",
             @"recordsMatched" : @"recordsMatched",
             @"recordsScanned" : @"recordsScanned",
             };
}

@end

@implementation AWSLogsRejectedLogEventsInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expiredLogEventEndIndex" : @"expiredLogEventEndIndex",
             @"tooNewLogEventStartIndex" : @"tooNewLogEventStartIndex",
             @"tooOldLogEventEndIndex" : @"tooOldLogEventEndIndex",
             };
}

@end

@implementation AWSLogsResourcePolicy

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"policyDocument" : @"policyDocument",
             @"policyName" : @"policyName",
             };
}

@end

@implementation AWSLogsResultField

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"field" : @"field",
             @"value" : @"value",
             };
}

@end

@implementation AWSLogsSearchedLogStream

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logStreamName" : @"logStreamName",
             @"searchedCompletely" : @"searchedCompletely",
             };
}

@end

@implementation AWSLogsStartLiveTailRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logEventFilterPattern" : @"logEventFilterPattern",
             @"logGroupIdentifiers" : @"logGroupIdentifiers",
             @"logStreamNamePrefixes" : @"logStreamNamePrefixes",
             @"logStreamNames" : @"logStreamNames",
             };
}

@end

@implementation AWSLogsStartLiveTailResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"responseStream" : @"responseStream",
             };
}

+ (NSValueTransformer *)responseStreamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsStartLiveTailResponseStream class]];
}

@end

@implementation AWSLogsStartLiveTailResponseStream

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionStreamingException" : @"SessionStreamingException",
             @"sessionTimeoutException" : @"SessionTimeoutException",
             @"sessionStart" : @"sessionStart",
             @"sessionUpdate" : @"sessionUpdate",
             };
}

+ (NSValueTransformer *)sessionStartJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsLiveTailSessionStart class]];
}

+ (NSValueTransformer *)sessionUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsLiveTailSessionUpdate class]];
}

@end

@implementation AWSLogsStartQueryRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"endTime",
             @"limit" : @"limit",
             @"logGroupIdentifiers" : @"logGroupIdentifiers",
             @"logGroupName" : @"logGroupName",
             @"logGroupNames" : @"logGroupNames",
             @"queryString" : @"queryString",
             @"startTime" : @"startTime",
             };
}

@end

@implementation AWSLogsStartQueryResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queryId" : @"queryId",
             };
}

@end

@implementation AWSLogsStopQueryRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queryId" : @"queryId",
             };
}

@end

@implementation AWSLogsStopQueryResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"success" : @"success",
             };
}

@end

@implementation AWSLogsSubscriptionFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"creationTime",
             @"destinationArn" : @"destinationArn",
             @"distribution" : @"distribution",
             @"filterName" : @"filterName",
             @"filterPattern" : @"filterPattern",
             @"logGroupName" : @"logGroupName",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)distributionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Random"] == NSOrderedSame) {
            return @(AWSLogsDistributionRandom);
        }
        if ([value caseInsensitiveCompare:@"ByLogStream"] == NSOrderedSame) {
            return @(AWSLogsDistributionByLogStream);
        }
        return @(AWSLogsDistributionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsDistributionRandom:
                return @"Random";
            case AWSLogsDistributionByLogStream:
                return @"ByLogStream";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsSuppressionPeriod

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"suppressionUnit" : @"suppressionUnit",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)suppressionUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECONDS"] == NSOrderedSame) {
            return @(AWSLogsSuppressionUnitSeconds);
        }
        if ([value caseInsensitiveCompare:@"MINUTES"] == NSOrderedSame) {
            return @(AWSLogsSuppressionUnitMinutes);
        }
        if ([value caseInsensitiveCompare:@"HOURS"] == NSOrderedSame) {
            return @(AWSLogsSuppressionUnitHours);
        }
        return @(AWSLogsSuppressionUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsSuppressionUnitSeconds:
                return @"SECONDS";
            case AWSLogsSuppressionUnitMinutes:
                return @"MINUTES";
            case AWSLogsSuppressionUnitHours:
                return @"HOURS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsTagLogGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSLogsTagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSLogsTestMetricFilterRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterPattern" : @"filterPattern",
             @"logEventMessages" : @"logEventMessages",
             };
}

@end

@implementation AWSLogsTestMetricFilterResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"matches" : @"matches",
             };
}

+ (NSValueTransformer *)matchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsMetricFilterMatchRecord class]];
}

@end

@implementation AWSLogsUntagLogGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSLogsUntagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSLogsUpdateAnomalyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"anomalyDetectorArn" : @"anomalyDetectorArn",
             @"anomalyId" : @"anomalyId",
             @"patternId" : @"patternId",
             @"suppressionPeriod" : @"suppressionPeriod",
             @"suppressionType" : @"suppressionType",
             };
}

+ (NSValueTransformer *)suppressionPeriodJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsSuppressionPeriod class]];
}

+ (NSValueTransformer *)suppressionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LIMITED"] == NSOrderedSame) {
            return @(AWSLogsSuppressionTypeLimited);
        }
        if ([value caseInsensitiveCompare:@"INFINITE"] == NSOrderedSame) {
            return @(AWSLogsSuppressionTypeInfinite);
        }
        return @(AWSLogsSuppressionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsSuppressionTypeLimited:
                return @"LIMITED";
            case AWSLogsSuppressionTypeInfinite:
                return @"INFINITE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsUpdateLogAnomalyDetectorRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"anomalyDetectorArn" : @"anomalyDetectorArn",
             @"anomalyVisibilityTime" : @"anomalyVisibilityTime",
             @"enabled" : @"enabled",
             @"evaluationFrequency" : @"evaluationFrequency",
             @"filterPattern" : @"filterPattern",
             };
}

+ (NSValueTransformer *)evaluationFrequencyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONE_MIN"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyOneMin);
        }
        if ([value caseInsensitiveCompare:@"FIVE_MIN"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyFiveMin);
        }
        if ([value caseInsensitiveCompare:@"TEN_MIN"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyTenMin);
        }
        if ([value caseInsensitiveCompare:@"FIFTEEN_MIN"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyFifteenMin);
        }
        if ([value caseInsensitiveCompare:@"THIRTY_MIN"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyThirtyMin);
        }
        if ([value caseInsensitiveCompare:@"ONE_HOUR"] == NSOrderedSame) {
            return @(AWSLogsEvaluationFrequencyOneHour);
        }
        return @(AWSLogsEvaluationFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsEvaluationFrequencyOneMin:
                return @"ONE_MIN";
            case AWSLogsEvaluationFrequencyFiveMin:
                return @"FIVE_MIN";
            case AWSLogsEvaluationFrequencyTenMin:
                return @"TEN_MIN";
            case AWSLogsEvaluationFrequencyFifteenMin:
                return @"FIFTEEN_MIN";
            case AWSLogsEvaluationFrequencyThirtyMin:
                return @"THIRTY_MIN";
            case AWSLogsEvaluationFrequencyOneHour:
                return @"ONE_HOUR";
            default:
                return nil;
        }
    }];
}

@end
