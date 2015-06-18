/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSMachineLearningModel.h"
#import "AWSCategory.h"

NSString *const AWSMachineLearningErrorDomain = @"com.amazonaws.AWSMachineLearningErrorDomain";

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
             @"createdAt" : @"CreatedAt",
             @"createdByIamUser" : @"CreatedByIamUser",
             @"endpointInfo" : @"EndpointInfo",
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

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)MLModelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"REGRESSION"]) {
            return @(AWSMachineLearningMLModelTypeRegression);
        }
        if ([value isEqualToString:@"BINARY"]) {
            return @(AWSMachineLearningMLModelTypeBinary);
        }
        if ([value isEqualToString:@"MULTICLASS"]) {
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
            case AWSMachineLearningMLModelTypeUnknown:
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

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"PENDING"]) {
            return @(AWSMachineLearningEntityStatusPending);
        }
        if ([value isEqualToString:@"INPROGRESS"]) {
            return @(AWSMachineLearningEntityStatusInprogress);
        }
        if ([value isEqualToString:@"FAILED"]) {
            return @(AWSMachineLearningEntityStatusFailed);
        }
        if ([value isEqualToString:@"COMPLETED"]) {
            return @(AWSMachineLearningEntityStatusCompleted);
        }
        if ([value isEqualToString:@"DELETED"]) {
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
            case AWSMachineLearningEntityStatusUnknown:
            default:
                return nil;
        }
    }];
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
        if ([value isEqualToString:@"NONE"]) {
            return @(AWSMachineLearningRealtimeEndpointStatusNone);
        }
        if ([value isEqualToString:@"READY"]) {
            return @(AWSMachineLearningRealtimeEndpointStatusReady);
        }
        if ([value isEqualToString:@"UPDATING"]) {
            return @(AWSMachineLearningRealtimeEndpointStatusUpdating);
        }
        if ([value isEqualToString:@"FAILED"]) {
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
            case AWSMachineLearningRealtimeEndpointStatusUnknown:
            default:
                return nil;
        }
    }];
}

@end
