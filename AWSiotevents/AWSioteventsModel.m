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

#import "AWSioteventsModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSioteventsErrorDomain = @"com.amazonaws.AWSioteventsErrorDomain";

@implementation AWSioteventsAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clearTimer" : @"clearTimer",
             @"dynamoDB" : @"dynamoDB",
             @"dynamoDBv2" : @"dynamoDBv2",
             @"firehose" : @"firehose",
             @"iotEvents" : @"iotEvents",
             @"iotSiteWise" : @"iotSiteWise",
             @"iotTopicPublish" : @"iotTopicPublish",
             @"lambda" : @"lambda",
             @"resetTimer" : @"resetTimer",
             @"setTimer" : @"setTimer",
             @"setVariable" : @"setVariable",
             @"sns" : @"sns",
             @"sqs" : @"sqs",
             };
}

+ (NSValueTransformer *)clearTimerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsClearTimerAction class]];
}

+ (NSValueTransformer *)dynamoDBJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsDynamoDBAction class]];
}

+ (NSValueTransformer *)dynamoDBv2JSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsDynamoDBv2Action class]];
}

+ (NSValueTransformer *)firehoseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsFirehoseAction class]];
}

+ (NSValueTransformer *)iotEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsIotEventsAction class]];
}

+ (NSValueTransformer *)iotSiteWiseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsIotSiteWiseAction class]];
}

+ (NSValueTransformer *)iotTopicPublishJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsIotTopicPublishAction class]];
}

+ (NSValueTransformer *)lambdaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsLambdaAction class]];
}

+ (NSValueTransformer *)resetTimerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsResetTimerAction class]];
}

+ (NSValueTransformer *)setTimerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsSetTimerAction class]];
}

+ (NSValueTransformer *)setVariableJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsSetVariableAction class]];
}

+ (NSValueTransformer *)snsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsSNSTopicPublishAction class]];
}

+ (NSValueTransformer *)sqsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsSqsAction class]];
}

@end

@implementation AWSioteventsAssetPropertyTimestamp

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"offsetInNanos" : @"offsetInNanos",
             @"timeInSeconds" : @"timeInSeconds",
             };
}

@end

@implementation AWSioteventsAssetPropertyValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"quality" : @"quality",
             @"timestamp" : @"timestamp",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsAssetPropertyTimestamp class]];
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsAssetPropertyVariant class]];
}

@end

@implementation AWSioteventsAssetPropertyVariant

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"booleanValueProperty" : @"booleanValue",
             @"doubleValueProperty" : @"doubleValue",
             @"integerValueProperty" : @"integerValue",
             @"stringValueProperty" : @"stringValue",
             };
}

@end

@implementation AWSioteventsAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jsonPath" : @"jsonPath",
             };
}

@end

@implementation AWSioteventsClearTimerAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"timerName" : @"timerName",
             };
}

@end

@implementation AWSioteventsCreateDetectorModelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorModelDefinition" : @"detectorModelDefinition",
             @"detectorModelDescription" : @"detectorModelDescription",
             @"detectorModelName" : @"detectorModelName",
             @"evaluationMethod" : @"evaluationMethod",
             @"key" : @"key",
             @"roleArn" : @"roleArn",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)detectorModelDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsDetectorModelDefinition class]];
}

+ (NSValueTransformer *)evaluationMethodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BATCH"] == NSOrderedSame) {
            return @(AWSioteventsEvaluationMethodBatch);
        }
        if ([value caseInsensitiveCompare:@"SERIAL"] == NSOrderedSame) {
            return @(AWSioteventsEvaluationMethodSerial);
        }
        return @(AWSioteventsEvaluationMethodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSioteventsEvaluationMethodBatch:
                return @"BATCH";
            case AWSioteventsEvaluationMethodSerial:
                return @"SERIAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSioteventsTag class]];
}

@end

@implementation AWSioteventsCreateDetectorModelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorModelConfiguration" : @"detectorModelConfiguration",
             };
}

+ (NSValueTransformer *)detectorModelConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsDetectorModelConfiguration class]];
}

@end

@implementation AWSioteventsCreateInputRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputDefinition" : @"inputDefinition",
             @"inputDescription" : @"inputDescription",
             @"inputName" : @"inputName",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)inputDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsInputDefinition class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSioteventsTag class]];
}

@end

@implementation AWSioteventsCreateInputResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputConfiguration" : @"inputConfiguration",
             };
}

+ (NSValueTransformer *)inputConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsInputConfiguration class]];
}

@end

@implementation AWSioteventsDeleteDetectorModelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorModelName" : @"detectorModelName",
             };
}

@end

@implementation AWSioteventsDeleteDetectorModelResponse

@end

@implementation AWSioteventsDeleteInputRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputName" : @"inputName",
             };
}

@end

@implementation AWSioteventsDeleteInputResponse

@end

@implementation AWSioteventsDescribeDetectorModelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorModelName" : @"detectorModelName",
             @"detectorModelVersion" : @"detectorModelVersion",
             };
}

@end

@implementation AWSioteventsDescribeDetectorModelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorModel" : @"detectorModel",
             };
}

+ (NSValueTransformer *)detectorModelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsDetectorModel class]];
}

@end

@implementation AWSioteventsDescribeInputRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputName" : @"inputName",
             };
}

@end

@implementation AWSioteventsDescribeInputResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"input" : @"input",
             };
}

+ (NSValueTransformer *)inputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsInput class]];
}

@end

@implementation AWSioteventsDescribeLoggingOptionsRequest

@end

@implementation AWSioteventsDescribeLoggingOptionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loggingOptions" : @"loggingOptions",
             };
}

+ (NSValueTransformer *)loggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsLoggingOptions class]];
}

@end

@implementation AWSioteventsDetectorDebugOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorModelName" : @"detectorModelName",
             @"keyValue" : @"keyValue",
             };
}

@end

@implementation AWSioteventsDetectorModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorModelConfiguration" : @"detectorModelConfiguration",
             @"detectorModelDefinition" : @"detectorModelDefinition",
             };
}

+ (NSValueTransformer *)detectorModelConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsDetectorModelConfiguration class]];
}

+ (NSValueTransformer *)detectorModelDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsDetectorModelDefinition class]];
}

@end

@implementation AWSioteventsDetectorModelConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"creationTime",
             @"detectorModelArn" : @"detectorModelArn",
             @"detectorModelDescription" : @"detectorModelDescription",
             @"detectorModelName" : @"detectorModelName",
             @"detectorModelVersion" : @"detectorModelVersion",
             @"evaluationMethod" : @"evaluationMethod",
             @"key" : @"key",
             @"lastUpdateTime" : @"lastUpdateTime",
             @"roleArn" : @"roleArn",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)evaluationMethodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BATCH"] == NSOrderedSame) {
            return @(AWSioteventsEvaluationMethodBatch);
        }
        if ([value caseInsensitiveCompare:@"SERIAL"] == NSOrderedSame) {
            return @(AWSioteventsEvaluationMethodSerial);
        }
        return @(AWSioteventsEvaluationMethodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSioteventsEvaluationMethodBatch:
                return @"BATCH";
            case AWSioteventsEvaluationMethodSerial:
                return @"SERIAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastUpdateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSioteventsDetectorModelVersionStatusActive);
        }
        if ([value caseInsensitiveCompare:@"ACTIVATING"] == NSOrderedSame) {
            return @(AWSioteventsDetectorModelVersionStatusActivating);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSioteventsDetectorModelVersionStatusInactive);
        }
        if ([value caseInsensitiveCompare:@"DEPRECATED"] == NSOrderedSame) {
            return @(AWSioteventsDetectorModelVersionStatusDeprecated);
        }
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSioteventsDetectorModelVersionStatusDraft);
        }
        if ([value caseInsensitiveCompare:@"PAUSED"] == NSOrderedSame) {
            return @(AWSioteventsDetectorModelVersionStatusPaused);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSioteventsDetectorModelVersionStatusFailed);
        }
        return @(AWSioteventsDetectorModelVersionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSioteventsDetectorModelVersionStatusActive:
                return @"ACTIVE";
            case AWSioteventsDetectorModelVersionStatusActivating:
                return @"ACTIVATING";
            case AWSioteventsDetectorModelVersionStatusInactive:
                return @"INACTIVE";
            case AWSioteventsDetectorModelVersionStatusDeprecated:
                return @"DEPRECATED";
            case AWSioteventsDetectorModelVersionStatusDraft:
                return @"DRAFT";
            case AWSioteventsDetectorModelVersionStatusPaused:
                return @"PAUSED";
            case AWSioteventsDetectorModelVersionStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSioteventsDetectorModelDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initialStateName" : @"initialStateName",
             @"states" : @"states",
             };
}

+ (NSValueTransformer *)statesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSioteventsState class]];
}

@end

@implementation AWSioteventsDetectorModelSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"creationTime",
             @"detectorModelDescription" : @"detectorModelDescription",
             @"detectorModelName" : @"detectorModelName",
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

@implementation AWSioteventsDetectorModelVersionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"creationTime",
             @"detectorModelArn" : @"detectorModelArn",
             @"detectorModelName" : @"detectorModelName",
             @"detectorModelVersion" : @"detectorModelVersion",
             @"evaluationMethod" : @"evaluationMethod",
             @"lastUpdateTime" : @"lastUpdateTime",
             @"roleArn" : @"roleArn",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)evaluationMethodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BATCH"] == NSOrderedSame) {
            return @(AWSioteventsEvaluationMethodBatch);
        }
        if ([value caseInsensitiveCompare:@"SERIAL"] == NSOrderedSame) {
            return @(AWSioteventsEvaluationMethodSerial);
        }
        return @(AWSioteventsEvaluationMethodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSioteventsEvaluationMethodBatch:
                return @"BATCH";
            case AWSioteventsEvaluationMethodSerial:
                return @"SERIAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastUpdateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSioteventsDetectorModelVersionStatusActive);
        }
        if ([value caseInsensitiveCompare:@"ACTIVATING"] == NSOrderedSame) {
            return @(AWSioteventsDetectorModelVersionStatusActivating);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSioteventsDetectorModelVersionStatusInactive);
        }
        if ([value caseInsensitiveCompare:@"DEPRECATED"] == NSOrderedSame) {
            return @(AWSioteventsDetectorModelVersionStatusDeprecated);
        }
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSioteventsDetectorModelVersionStatusDraft);
        }
        if ([value caseInsensitiveCompare:@"PAUSED"] == NSOrderedSame) {
            return @(AWSioteventsDetectorModelVersionStatusPaused);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSioteventsDetectorModelVersionStatusFailed);
        }
        return @(AWSioteventsDetectorModelVersionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSioteventsDetectorModelVersionStatusActive:
                return @"ACTIVE";
            case AWSioteventsDetectorModelVersionStatusActivating:
                return @"ACTIVATING";
            case AWSioteventsDetectorModelVersionStatusInactive:
                return @"INACTIVE";
            case AWSioteventsDetectorModelVersionStatusDeprecated:
                return @"DEPRECATED";
            case AWSioteventsDetectorModelVersionStatusDraft:
                return @"DRAFT";
            case AWSioteventsDetectorModelVersionStatusPaused:
                return @"PAUSED";
            case AWSioteventsDetectorModelVersionStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSioteventsDynamoDBAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hashKeyField" : @"hashKeyField",
             @"hashKeyType" : @"hashKeyType",
             @"hashKeyValue" : @"hashKeyValue",
             @"operation" : @"operation",
             @"payload" : @"payload",
             @"payloadField" : @"payloadField",
             @"rangeKeyField" : @"rangeKeyField",
             @"rangeKeyType" : @"rangeKeyType",
             @"rangeKeyValue" : @"rangeKeyValue",
             @"tableName" : @"tableName",
             };
}

+ (NSValueTransformer *)payloadJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsPayload class]];
}

@end

@implementation AWSioteventsDynamoDBv2Action

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"payload" : @"payload",
             @"tableName" : @"tableName",
             };
}

+ (NSValueTransformer *)payloadJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsPayload class]];
}

@end

@implementation AWSioteventsEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"actions",
             @"condition" : @"condition",
             @"eventName" : @"eventName",
             };
}

+ (NSValueTransformer *)actionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSioteventsAction class]];
}

@end

@implementation AWSioteventsFirehoseAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStreamName" : @"deliveryStreamName",
             @"payload" : @"payload",
             @"separator" : @"separator",
             };
}

+ (NSValueTransformer *)payloadJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsPayload class]];
}

@end

@implementation AWSioteventsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputConfiguration" : @"inputConfiguration",
             @"inputDefinition" : @"inputDefinition",
             };
}

+ (NSValueTransformer *)inputConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsInputConfiguration class]];
}

+ (NSValueTransformer *)inputDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsInputDefinition class]];
}

@end

@implementation AWSioteventsInputConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"creationTime",
             @"inputArn" : @"inputArn",
             @"inputDescription" : @"inputDescription",
             @"inputName" : @"inputName",
             @"lastUpdateTime" : @"lastUpdateTime",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSioteventsInputStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSioteventsInputStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSioteventsInputStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSioteventsInputStatusDeleting);
        }
        return @(AWSioteventsInputStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSioteventsInputStatusCreating:
                return @"CREATING";
            case AWSioteventsInputStatusUpdating:
                return @"UPDATING";
            case AWSioteventsInputStatusActive:
                return @"ACTIVE";
            case AWSioteventsInputStatusDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSioteventsInputDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"attributes",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSioteventsAttribute class]];
}

@end

@implementation AWSioteventsInputSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"creationTime",
             @"inputArn" : @"inputArn",
             @"inputDescription" : @"inputDescription",
             @"inputName" : @"inputName",
             @"lastUpdateTime" : @"lastUpdateTime",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSioteventsInputStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSioteventsInputStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSioteventsInputStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSioteventsInputStatusDeleting);
        }
        return @(AWSioteventsInputStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSioteventsInputStatusCreating:
                return @"CREATING";
            case AWSioteventsInputStatusUpdating:
                return @"UPDATING";
            case AWSioteventsInputStatusActive:
                return @"ACTIVE";
            case AWSioteventsInputStatusDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSioteventsIotEventsAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputName" : @"inputName",
             @"payload" : @"payload",
             };
}

+ (NSValueTransformer *)payloadJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsPayload class]];
}

@end

@implementation AWSioteventsIotSiteWiseAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"entryId" : @"entryId",
             @"propertyAlias" : @"propertyAlias",
             @"propertyId" : @"propertyId",
             @"propertyValue" : @"propertyValue",
             };
}

+ (NSValueTransformer *)propertyValueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsAssetPropertyValue class]];
}

@end

@implementation AWSioteventsIotTopicPublishAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mqttTopic" : @"mqttTopic",
             @"payload" : @"payload",
             };
}

+ (NSValueTransformer *)payloadJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsPayload class]];
}

@end

@implementation AWSioteventsLambdaAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionArn" : @"functionArn",
             @"payload" : @"payload",
             };
}

+ (NSValueTransformer *)payloadJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsPayload class]];
}

@end

@implementation AWSioteventsListDetectorModelVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorModelName" : @"detectorModelName",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSioteventsListDetectorModelVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorModelVersionSummaries" : @"detectorModelVersionSummaries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)detectorModelVersionSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSioteventsDetectorModelVersionSummary class]];
}

@end

@implementation AWSioteventsListDetectorModelsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSioteventsListDetectorModelsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorModelSummaries" : @"detectorModelSummaries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)detectorModelSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSioteventsDetectorModelSummary class]];
}

@end

@implementation AWSioteventsListInputsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSioteventsListInputsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputSummaries" : @"inputSummaries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)inputSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSioteventsInputSummary class]];
}

@end

@implementation AWSioteventsListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSioteventsListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSioteventsTag class]];
}

@end

@implementation AWSioteventsLoggingOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorDebugOptions" : @"detectorDebugOptions",
             @"enabled" : @"enabled",
             @"level" : @"level",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)detectorDebugOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSioteventsDetectorDebugOption class]];
}

+ (NSValueTransformer *)levelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSioteventsLoggingLevelError);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSioteventsLoggingLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSioteventsLoggingLevelDebug);
        }
        return @(AWSioteventsLoggingLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSioteventsLoggingLevelError:
                return @"ERROR";
            case AWSioteventsLoggingLevelInfo:
                return @"INFO";
            case AWSioteventsLoggingLevelDebug:
                return @"DEBUG";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSioteventsOnEnterLifecycle

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"events",
             };
}

+ (NSValueTransformer *)eventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSioteventsEvent class]];
}

@end

@implementation AWSioteventsOnExitLifecycle

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"events",
             };
}

+ (NSValueTransformer *)eventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSioteventsEvent class]];
}

@end

@implementation AWSioteventsOnInputLifecycle

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"events",
             @"transitionEvents" : @"transitionEvents",
             };
}

+ (NSValueTransformer *)eventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSioteventsEvent class]];
}

+ (NSValueTransformer *)transitionEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSioteventsTransitionEvent class]];
}

@end

@implementation AWSioteventsPayload

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentExpression" : @"contentExpression",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STRING"] == NSOrderedSame) {
            return @(AWSioteventsPayloadTypeString);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSioteventsPayloadTypeJson);
        }
        return @(AWSioteventsPayloadTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSioteventsPayloadTypeString:
                return @"STRING";
            case AWSioteventsPayloadTypeJson:
                return @"JSON";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSioteventsPutLoggingOptionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loggingOptions" : @"loggingOptions",
             };
}

+ (NSValueTransformer *)loggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsLoggingOptions class]];
}

@end

@implementation AWSioteventsResetTimerAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"timerName" : @"timerName",
             };
}

@end

@implementation AWSioteventsSNSTopicPublishAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"payload" : @"payload",
             @"targetArn" : @"targetArn",
             };
}

+ (NSValueTransformer *)payloadJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsPayload class]];
}

@end

@implementation AWSioteventsSetTimerAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationExpression" : @"durationExpression",
             @"seconds" : @"seconds",
             @"timerName" : @"timerName",
             };
}

@end

@implementation AWSioteventsSetVariableAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"value" : @"value",
             @"variableName" : @"variableName",
             };
}

@end

@implementation AWSioteventsSqsAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"payload" : @"payload",
             @"queueUrl" : @"queueUrl",
             @"useBase64" : @"useBase64",
             };
}

+ (NSValueTransformer *)payloadJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsPayload class]];
}

@end

@implementation AWSioteventsState

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"onEnter" : @"onEnter",
             @"onExit" : @"onExit",
             @"onInput" : @"onInput",
             @"stateName" : @"stateName",
             };
}

+ (NSValueTransformer *)onEnterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsOnEnterLifecycle class]];
}

+ (NSValueTransformer *)onExitJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsOnExitLifecycle class]];
}

+ (NSValueTransformer *)onInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsOnInputLifecycle class]];
}

@end

@implementation AWSioteventsTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

@end

@implementation AWSioteventsTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSioteventsTag class]];
}

@end

@implementation AWSioteventsTagResourceResponse

@end

@implementation AWSioteventsTagrisSweepListItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagrisAccountId" : @"TagrisAccountId",
             @"tagrisAmazonResourceName" : @"TagrisAmazonResourceName",
             @"tagrisInternalId" : @"TagrisInternalId",
             @"tagrisVersion" : @"TagrisVersion",
             };
}

@end

@implementation AWSioteventsTagrisVerifyResourcesExistInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagrisSweepList" : @"TagrisSweepList",
             };
}

+ (NSValueTransformer *)tagrisSweepListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSioteventsTagrisSweepListItem class]];
}

@end

@implementation AWSioteventsTagrisVerifyResourcesExistOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagrisSweepListResult" : @"TagrisSweepListResult",
             };
}

@end

@implementation AWSioteventsTransitionEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"actions",
             @"condition" : @"condition",
             @"eventName" : @"eventName",
             @"nextState" : @"nextState",
             };
}

+ (NSValueTransformer *)actionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSioteventsAction class]];
}

@end

@implementation AWSioteventsUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSioteventsUntagResourceResponse

@end

@implementation AWSioteventsUpdateDetectorModelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorModelDefinition" : @"detectorModelDefinition",
             @"detectorModelDescription" : @"detectorModelDescription",
             @"detectorModelName" : @"detectorModelName",
             @"evaluationMethod" : @"evaluationMethod",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)detectorModelDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsDetectorModelDefinition class]];
}

+ (NSValueTransformer *)evaluationMethodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BATCH"] == NSOrderedSame) {
            return @(AWSioteventsEvaluationMethodBatch);
        }
        if ([value caseInsensitiveCompare:@"SERIAL"] == NSOrderedSame) {
            return @(AWSioteventsEvaluationMethodSerial);
        }
        return @(AWSioteventsEvaluationMethodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSioteventsEvaluationMethodBatch:
                return @"BATCH";
            case AWSioteventsEvaluationMethodSerial:
                return @"SERIAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSioteventsUpdateDetectorModelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectorModelConfiguration" : @"detectorModelConfiguration",
             };
}

+ (NSValueTransformer *)detectorModelConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsDetectorModelConfiguration class]];
}

@end

@implementation AWSioteventsUpdateInputRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputDefinition" : @"inputDefinition",
             @"inputDescription" : @"inputDescription",
             @"inputName" : @"inputName",
             };
}

+ (NSValueTransformer *)inputDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsInputDefinition class]];
}

@end

@implementation AWSioteventsUpdateInputResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputConfiguration" : @"inputConfiguration",
             };
}

+ (NSValueTransformer *)inputConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSioteventsInputConfiguration class]];
}

@end
