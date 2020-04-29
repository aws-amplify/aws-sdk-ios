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

#import "AWSiotsitewiseModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSiotsitewiseErrorDomain = @"com.amazonaws.AWSiotsitewiseErrorDomain";

@implementation AWSiotsitewiseAccessPolicySummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"creationDate",
             @"identifier" : @"id",
             @"identity" : @"identity",
             @"lastUpdateDate" : @"lastUpdateDate",
             @"permission" : @"permission",
             @"resource" : @"resource",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)identityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseIdentity class]];
}

+ (NSValueTransformer *)lastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)permissionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADMINISTRATOR"] == NSOrderedSame) {
            return @(AWSiotsitewisePermissionAdministrator);
        }
        if ([value caseInsensitiveCompare:@"VIEWER"] == NSOrderedSame) {
            return @(AWSiotsitewisePermissionViewer);
        }
        return @(AWSiotsitewisePermissionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewisePermissionAdministrator:
                return @"ADMINISTRATOR";
            case AWSiotsitewisePermissionViewer:
                return @"VIEWER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseResource class]];
}

@end

@implementation AWSiotsitewiseAggregatedValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"quality" : @"quality",
             @"timestamp" : @"timestamp",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)qualityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GOOD"] == NSOrderedSame) {
            return @(AWSiotsitewiseQualityGood);
        }
        if ([value caseInsensitiveCompare:@"BAD"] == NSOrderedSame) {
            return @(AWSiotsitewiseQualityBad);
        }
        if ([value caseInsensitiveCompare:@"UNCERTAIN"] == NSOrderedSame) {
            return @(AWSiotsitewiseQualityUncertain);
        }
        return @(AWSiotsitewiseQualityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewiseQualityGood:
                return @"GOOD";
            case AWSiotsitewiseQualityBad:
                return @"BAD";
            case AWSiotsitewiseQualityUncertain:
                return @"UNCERTAIN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseAggregates class]];
}

@end

@implementation AWSiotsitewiseAggregates

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"average" : @"average",
             @"count" : @"count",
             @"maximum" : @"maximum",
             @"minimum" : @"minimum",
             @"sum" : @"sum",
             };
}

@end

@implementation AWSiotsitewiseAssetErrorDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"code" : @"code",
             @"message" : @"message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERNAL_FAILURE"] == NSOrderedSame) {
            return @(AWSiotsitewiseAssetErrorCodeInternalFailure);
        }
        return @(AWSiotsitewiseAssetErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewiseAssetErrorCodeInternalFailure:
                return @"INTERNAL_FAILURE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSiotsitewiseAssetHierarchy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"id",
             @"name" : @"name",
             };
}

@end

@implementation AWSiotsitewiseAssetModelHierarchy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"childAssetModelId" : @"childAssetModelId",
             @"identifier" : @"id",
             @"name" : @"name",
             };
}

@end

@implementation AWSiotsitewiseAssetModelHierarchyDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"childAssetModelId" : @"childAssetModelId",
             @"name" : @"name",
             };
}

@end

@implementation AWSiotsitewiseAssetModelProperty

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataType" : @"dataType",
             @"identifier" : @"id",
             @"name" : @"name",
             @"types" : @"type",
             @"unit" : @"unit",
             };
}

+ (NSValueTransformer *)dataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STRING"] == NSOrderedSame) {
            return @(AWSiotsitewisePropertyDataTypeString);
        }
        if ([value caseInsensitiveCompare:@"INTEGER"] == NSOrderedSame) {
            return @(AWSiotsitewisePropertyDataTypeInteger);
        }
        if ([value caseInsensitiveCompare:@"DOUBLE"] == NSOrderedSame) {
            return @(AWSiotsitewisePropertyDataTypeDouble);
        }
        if ([value caseInsensitiveCompare:@"BOOLEAN"] == NSOrderedSame) {
            return @(AWSiotsitewisePropertyDataTypeBoolean);
        }
        return @(AWSiotsitewisePropertyDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewisePropertyDataTypeString:
                return @"STRING";
            case AWSiotsitewisePropertyDataTypeInteger:
                return @"INTEGER";
            case AWSiotsitewisePropertyDataTypeDouble:
                return @"DOUBLE";
            case AWSiotsitewisePropertyDataTypeBoolean:
                return @"BOOLEAN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewisePropertyType class]];
}

@end

@implementation AWSiotsitewiseAssetModelPropertyDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataType" : @"dataType",
             @"name" : @"name",
             @"types" : @"type",
             @"unit" : @"unit",
             };
}

+ (NSValueTransformer *)dataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STRING"] == NSOrderedSame) {
            return @(AWSiotsitewisePropertyDataTypeString);
        }
        if ([value caseInsensitiveCompare:@"INTEGER"] == NSOrderedSame) {
            return @(AWSiotsitewisePropertyDataTypeInteger);
        }
        if ([value caseInsensitiveCompare:@"DOUBLE"] == NSOrderedSame) {
            return @(AWSiotsitewisePropertyDataTypeDouble);
        }
        if ([value caseInsensitiveCompare:@"BOOLEAN"] == NSOrderedSame) {
            return @(AWSiotsitewisePropertyDataTypeBoolean);
        }
        return @(AWSiotsitewisePropertyDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewisePropertyDataTypeString:
                return @"STRING";
            case AWSiotsitewisePropertyDataTypeInteger:
                return @"INTEGER";
            case AWSiotsitewisePropertyDataTypeDouble:
                return @"DOUBLE";
            case AWSiotsitewisePropertyDataTypeBoolean:
                return @"BOOLEAN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewisePropertyType class]];
}

@end

@implementation AWSiotsitewiseAssetModelStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"error" : @"error",
             @"state" : @"state",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseErrorDetails class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSiotsitewiseAssetModelStateCreating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSiotsitewiseAssetModelStateActive);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSiotsitewiseAssetModelStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"PROPAGATING"] == NSOrderedSame) {
            return @(AWSiotsitewiseAssetModelStatePropagating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSiotsitewiseAssetModelStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSiotsitewiseAssetModelStateFailed);
        }
        return @(AWSiotsitewiseAssetModelStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewiseAssetModelStateCreating:
                return @"CREATING";
            case AWSiotsitewiseAssetModelStateActive:
                return @"ACTIVE";
            case AWSiotsitewiseAssetModelStateUpdating:
                return @"UPDATING";
            case AWSiotsitewiseAssetModelStatePropagating:
                return @"PROPAGATING";
            case AWSiotsitewiseAssetModelStateDeleting:
                return @"DELETING";
            case AWSiotsitewiseAssetModelStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSiotsitewiseAssetModelSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"creationDate" : @"creationDate",
             @"detail" : @"description",
             @"identifier" : @"id",
             @"lastUpdateDate" : @"lastUpdateDate",
             @"name" : @"name",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseAssetModelStatus class]];
}

@end

@implementation AWSiotsitewiseAssetProperty

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alias" : @"alias",
             @"dataType" : @"dataType",
             @"identifier" : @"id",
             @"name" : @"name",
             @"notification" : @"notification",
             @"unit" : @"unit",
             };
}

+ (NSValueTransformer *)dataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STRING"] == NSOrderedSame) {
            return @(AWSiotsitewisePropertyDataTypeString);
        }
        if ([value caseInsensitiveCompare:@"INTEGER"] == NSOrderedSame) {
            return @(AWSiotsitewisePropertyDataTypeInteger);
        }
        if ([value caseInsensitiveCompare:@"DOUBLE"] == NSOrderedSame) {
            return @(AWSiotsitewisePropertyDataTypeDouble);
        }
        if ([value caseInsensitiveCompare:@"BOOLEAN"] == NSOrderedSame) {
            return @(AWSiotsitewisePropertyDataTypeBoolean);
        }
        return @(AWSiotsitewisePropertyDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewisePropertyDataTypeString:
                return @"STRING";
            case AWSiotsitewisePropertyDataTypeInteger:
                return @"INTEGER";
            case AWSiotsitewisePropertyDataTypeDouble:
                return @"DOUBLE";
            case AWSiotsitewisePropertyDataTypeBoolean:
                return @"BOOLEAN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewisePropertyNotification class]];
}

@end

@implementation AWSiotsitewiseAssetPropertyValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"quality" : @"quality",
             @"timestamp" : @"timestamp",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)qualityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GOOD"] == NSOrderedSame) {
            return @(AWSiotsitewiseQualityGood);
        }
        if ([value caseInsensitiveCompare:@"BAD"] == NSOrderedSame) {
            return @(AWSiotsitewiseQualityBad);
        }
        if ([value caseInsensitiveCompare:@"UNCERTAIN"] == NSOrderedSame) {
            return @(AWSiotsitewiseQualityUncertain);
        }
        return @(AWSiotsitewiseQualityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewiseQualityGood:
                return @"GOOD";
            case AWSiotsitewiseQualityBad:
                return @"BAD";
            case AWSiotsitewiseQualityUncertain:
                return @"UNCERTAIN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseTimeInNanos class]];
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseVariant class]];
}

@end

@implementation AWSiotsitewiseAssetStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"error" : @"error",
             @"state" : @"state",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseErrorDetails class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSiotsitewiseAssetStateCreating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSiotsitewiseAssetStateActive);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSiotsitewiseAssetStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSiotsitewiseAssetStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSiotsitewiseAssetStateFailed);
        }
        return @(AWSiotsitewiseAssetStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewiseAssetStateCreating:
                return @"CREATING";
            case AWSiotsitewiseAssetStateActive:
                return @"ACTIVE";
            case AWSiotsitewiseAssetStateUpdating:
                return @"UPDATING";
            case AWSiotsitewiseAssetStateDeleting:
                return @"DELETING";
            case AWSiotsitewiseAssetStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSiotsitewiseAssetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"assetModelId" : @"assetModelId",
             @"creationDate" : @"creationDate",
             @"hierarchies" : @"hierarchies",
             @"identifier" : @"id",
             @"lastUpdateDate" : @"lastUpdateDate",
             @"name" : @"name",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)hierarchiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseAssetHierarchy class]];
}

+ (NSValueTransformer *)lastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseAssetStatus class]];
}

@end

@implementation AWSiotsitewiseAssociateAssetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"childAssetId" : @"childAssetId",
             @"clientToken" : @"clientToken",
             @"hierarchyId" : @"hierarchyId",
             };
}

@end

@implementation AWSiotsitewiseAssociatedAssetsSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"assetModelId" : @"assetModelId",
             @"creationDate" : @"creationDate",
             @"hierarchies" : @"hierarchies",
             @"identifier" : @"id",
             @"lastUpdateDate" : @"lastUpdateDate",
             @"name" : @"name",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)hierarchiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseAssetHierarchy class]];
}

+ (NSValueTransformer *)lastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseAssetStatus class]];
}

@end

@implementation AWSiotsitewiseAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultValue" : @"defaultValue",
             };
}

@end

@implementation AWSiotsitewiseBatchAssociateProjectAssetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetIds" : @"assetIds",
             @"clientToken" : @"clientToken",
             @"projectId" : @"projectId",
             };
}

@end

@implementation AWSiotsitewiseBatchAssociateProjectAssetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseAssetErrorDetails class]];
}

@end

@implementation AWSiotsitewiseBatchDisassociateProjectAssetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetIds" : @"assetIds",
             @"clientToken" : @"clientToken",
             @"projectId" : @"projectId",
             };
}

@end

@implementation AWSiotsitewiseBatchDisassociateProjectAssetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseAssetErrorDetails class]];
}

@end

@implementation AWSiotsitewiseBatchPutAssetPropertyError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"errorCode",
             @"errorMessage" : @"errorMessage",
             @"timestamps" : @"timestamps",
             };
}

+ (NSValueTransformer *)errorCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ResourceNotFoundException"] == NSOrderedSame) {
            return @(AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeResourceNotFoundException);
        }
        if ([value caseInsensitiveCompare:@"InvalidRequestException"] == NSOrderedSame) {
            return @(AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeInvalidRequestException);
        }
        if ([value caseInsensitiveCompare:@"InternalFailureException"] == NSOrderedSame) {
            return @(AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeInternalFailureException);
        }
        if ([value caseInsensitiveCompare:@"ServiceUnavailableException"] == NSOrderedSame) {
            return @(AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeServiceUnavailableException);
        }
        if ([value caseInsensitiveCompare:@"ThrottlingException"] == NSOrderedSame) {
            return @(AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeThrottlingException);
        }
        if ([value caseInsensitiveCompare:@"LimitExceededException"] == NSOrderedSame) {
            return @(AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeLimitExceededException);
        }
        if ([value caseInsensitiveCompare:@"ConflictingOperationException"] == NSOrderedSame) {
            return @(AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeConflictingOperationException);
        }
        if ([value caseInsensitiveCompare:@"TimestampOutOfRangeException"] == NSOrderedSame) {
            return @(AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeTimestampOutOfRangeException);
        }
        if ([value caseInsensitiveCompare:@"AccessDeniedException"] == NSOrderedSame) {
            return @(AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeAccessDeniedException);
        }
        return @(AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeResourceNotFoundException:
                return @"ResourceNotFoundException";
            case AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeInvalidRequestException:
                return @"InvalidRequestException";
            case AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeInternalFailureException:
                return @"InternalFailureException";
            case AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeServiceUnavailableException:
                return @"ServiceUnavailableException";
            case AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeThrottlingException:
                return @"ThrottlingException";
            case AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeLimitExceededException:
                return @"LimitExceededException";
            case AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeConflictingOperationException:
                return @"ConflictingOperationException";
            case AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeTimestampOutOfRangeException:
                return @"TimestampOutOfRangeException";
            case AWSiotsitewiseBatchPutAssetPropertyValueErrorCodeAccessDeniedException:
                return @"AccessDeniedException";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseTimeInNanos class]];
}

@end

@implementation AWSiotsitewiseBatchPutAssetPropertyErrorEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entryId" : @"entryId",
             @"errors" : @"errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseBatchPutAssetPropertyError class]];
}

@end

@implementation AWSiotsitewiseBatchPutAssetPropertyValueRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entries" : @"entries",
             };
}

+ (NSValueTransformer *)entriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewisePutAssetPropertyValueEntry class]];
}

@end

@implementation AWSiotsitewiseBatchPutAssetPropertyValueResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorEntries" : @"errorEntries",
             };
}

+ (NSValueTransformer *)errorEntriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseBatchPutAssetPropertyErrorEntry class]];
}

@end

@implementation AWSiotsitewiseCreateAccessPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPolicyIdentity" : @"accessPolicyIdentity",
             @"accessPolicyPermission" : @"accessPolicyPermission",
             @"accessPolicyResource" : @"accessPolicyResource",
             @"clientToken" : @"clientToken",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)accessPolicyIdentityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseIdentity class]];
}

+ (NSValueTransformer *)accessPolicyPermissionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADMINISTRATOR"] == NSOrderedSame) {
            return @(AWSiotsitewisePermissionAdministrator);
        }
        if ([value caseInsensitiveCompare:@"VIEWER"] == NSOrderedSame) {
            return @(AWSiotsitewisePermissionViewer);
        }
        return @(AWSiotsitewisePermissionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewisePermissionAdministrator:
                return @"ADMINISTRATOR";
            case AWSiotsitewisePermissionViewer:
                return @"VIEWER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)accessPolicyResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseResource class]];
}

@end

@implementation AWSiotsitewiseCreateAccessPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPolicyArn" : @"accessPolicyArn",
             @"accessPolicyId" : @"accessPolicyId",
             };
}

@end

@implementation AWSiotsitewiseCreateAssetModelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetModelDescription" : @"assetModelDescription",
             @"assetModelHierarchies" : @"assetModelHierarchies",
             @"assetModelName" : @"assetModelName",
             @"assetModelProperties" : @"assetModelProperties",
             @"clientToken" : @"clientToken",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)assetModelHierarchiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseAssetModelHierarchyDefinition class]];
}

+ (NSValueTransformer *)assetModelPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseAssetModelPropertyDefinition class]];
}

@end

@implementation AWSiotsitewiseCreateAssetModelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetModelArn" : @"assetModelArn",
             @"assetModelId" : @"assetModelId",
             @"assetModelStatus" : @"assetModelStatus",
             };
}

+ (NSValueTransformer *)assetModelStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseAssetModelStatus class]];
}

@end

@implementation AWSiotsitewiseCreateAssetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetModelId" : @"assetModelId",
             @"assetName" : @"assetName",
             @"clientToken" : @"clientToken",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSiotsitewiseCreateAssetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetArn" : @"assetArn",
             @"assetId" : @"assetId",
             @"assetStatus" : @"assetStatus",
             };
}

+ (NSValueTransformer *)assetStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseAssetStatus class]];
}

@end

@implementation AWSiotsitewiseCreateDashboardRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"dashboardDefinition" : @"dashboardDefinition",
             @"dashboardDescription" : @"dashboardDescription",
             @"dashboardName" : @"dashboardName",
             @"projectId" : @"projectId",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSiotsitewiseCreateDashboardResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardArn" : @"dashboardArn",
             @"dashboardId" : @"dashboardId",
             };
}

@end

@implementation AWSiotsitewiseCreateGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayName" : @"gatewayName",
             @"gatewayPlatform" : @"gatewayPlatform",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)gatewayPlatformJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseGatewayPlatform class]];
}

@end

@implementation AWSiotsitewiseCreateGatewayResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayArn" : @"gatewayArn",
             @"gatewayId" : @"gatewayId",
             };
}

@end

@implementation AWSiotsitewiseCreatePortalRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"portalContactEmail" : @"portalContactEmail",
             @"portalDescription" : @"portalDescription",
             @"portalLogoImageFile" : @"portalLogoImageFile",
             @"portalName" : @"portalName",
             @"roleArn" : @"roleArn",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)portalLogoImageFileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseImageFile class]];
}

@end

@implementation AWSiotsitewiseCreatePortalResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"portalArn" : @"portalArn",
             @"portalId" : @"portalId",
             @"portalStartUrl" : @"portalStartUrl",
             @"portalStatus" : @"portalStatus",
             @"ssoApplicationId" : @"ssoApplicationId",
             };
}

+ (NSValueTransformer *)portalStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewisePortalStatus class]];
}

@end

@implementation AWSiotsitewiseCreateProjectRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"portalId" : @"portalId",
             @"projectDescription" : @"projectDescription",
             @"projectName" : @"projectName",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSiotsitewiseCreateProjectResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectArn" : @"projectArn",
             @"projectId" : @"projectId",
             };
}

@end

@implementation AWSiotsitewiseDashboardSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"creationDate",
             @"detail" : @"description",
             @"identifier" : @"id",
             @"lastUpdateDate" : @"lastUpdateDate",
             @"name" : @"name",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSiotsitewiseDeleteAccessPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPolicyId" : @"accessPolicyId",
             @"clientToken" : @"clientToken",
             };
}

@end

@implementation AWSiotsitewiseDeleteAccessPolicyResponse

@end

@implementation AWSiotsitewiseDeleteAssetModelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetModelId" : @"assetModelId",
             @"clientToken" : @"clientToken",
             };
}

@end

@implementation AWSiotsitewiseDeleteAssetModelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetModelStatus" : @"assetModelStatus",
             };
}

+ (NSValueTransformer *)assetModelStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseAssetModelStatus class]];
}

@end

@implementation AWSiotsitewiseDeleteAssetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"clientToken" : @"clientToken",
             };
}

@end

@implementation AWSiotsitewiseDeleteAssetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetStatus" : @"assetStatus",
             };
}

+ (NSValueTransformer *)assetStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseAssetStatus class]];
}

@end

@implementation AWSiotsitewiseDeleteDashboardRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"dashboardId" : @"dashboardId",
             };
}

@end

@implementation AWSiotsitewiseDeleteDashboardResponse

@end

@implementation AWSiotsitewiseDeleteGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayId" : @"gatewayId",
             };
}

@end

@implementation AWSiotsitewiseDeletePortalRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"portalId" : @"portalId",
             };
}

@end

@implementation AWSiotsitewiseDeletePortalResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"portalStatus" : @"portalStatus",
             };
}

+ (NSValueTransformer *)portalStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewisePortalStatus class]];
}

@end

@implementation AWSiotsitewiseDeleteProjectRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"projectId" : @"projectId",
             };
}

@end

@implementation AWSiotsitewiseDeleteProjectResponse

@end

@implementation AWSiotsitewiseDescribeAccessPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPolicyId" : @"accessPolicyId",
             };
}

@end

@implementation AWSiotsitewiseDescribeAccessPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPolicyArn" : @"accessPolicyArn",
             @"accessPolicyCreationDate" : @"accessPolicyCreationDate",
             @"accessPolicyId" : @"accessPolicyId",
             @"accessPolicyIdentity" : @"accessPolicyIdentity",
             @"accessPolicyLastUpdateDate" : @"accessPolicyLastUpdateDate",
             @"accessPolicyPermission" : @"accessPolicyPermission",
             @"accessPolicyResource" : @"accessPolicyResource",
             };
}

+ (NSValueTransformer *)accessPolicyCreationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)accessPolicyIdentityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseIdentity class]];
}

+ (NSValueTransformer *)accessPolicyLastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)accessPolicyPermissionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADMINISTRATOR"] == NSOrderedSame) {
            return @(AWSiotsitewisePermissionAdministrator);
        }
        if ([value caseInsensitiveCompare:@"VIEWER"] == NSOrderedSame) {
            return @(AWSiotsitewisePermissionViewer);
        }
        return @(AWSiotsitewisePermissionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewisePermissionAdministrator:
                return @"ADMINISTRATOR";
            case AWSiotsitewisePermissionViewer:
                return @"VIEWER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)accessPolicyResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseResource class]];
}

@end

@implementation AWSiotsitewiseDescribeAssetModelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetModelId" : @"assetModelId",
             };
}

@end

@implementation AWSiotsitewiseDescribeAssetModelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetModelArn" : @"assetModelArn",
             @"assetModelCreationDate" : @"assetModelCreationDate",
             @"assetModelDescription" : @"assetModelDescription",
             @"assetModelHierarchies" : @"assetModelHierarchies",
             @"assetModelId" : @"assetModelId",
             @"assetModelLastUpdateDate" : @"assetModelLastUpdateDate",
             @"assetModelName" : @"assetModelName",
             @"assetModelProperties" : @"assetModelProperties",
             @"assetModelStatus" : @"assetModelStatus",
             };
}

+ (NSValueTransformer *)assetModelCreationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)assetModelHierarchiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseAssetModelHierarchy class]];
}

+ (NSValueTransformer *)assetModelLastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)assetModelPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseAssetModelProperty class]];
}

+ (NSValueTransformer *)assetModelStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseAssetModelStatus class]];
}

@end

@implementation AWSiotsitewiseDescribeAssetPropertyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"propertyId" : @"propertyId",
             };
}

@end

@implementation AWSiotsitewiseDescribeAssetPropertyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"assetModelId" : @"assetModelId",
             @"assetName" : @"assetName",
             @"assetProperty" : @"assetProperty",
             };
}

+ (NSValueTransformer *)assetPropertyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseProperty class]];
}

@end

@implementation AWSiotsitewiseDescribeAssetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             };
}

@end

@implementation AWSiotsitewiseDescribeAssetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetArn" : @"assetArn",
             @"assetCreationDate" : @"assetCreationDate",
             @"assetHierarchies" : @"assetHierarchies",
             @"assetId" : @"assetId",
             @"assetLastUpdateDate" : @"assetLastUpdateDate",
             @"assetModelId" : @"assetModelId",
             @"assetName" : @"assetName",
             @"assetProperties" : @"assetProperties",
             @"assetStatus" : @"assetStatus",
             };
}

+ (NSValueTransformer *)assetCreationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)assetHierarchiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseAssetHierarchy class]];
}

+ (NSValueTransformer *)assetLastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)assetPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseAssetProperty class]];
}

+ (NSValueTransformer *)assetStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseAssetStatus class]];
}

@end

@implementation AWSiotsitewiseDescribeDashboardRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardId" : @"dashboardId",
             };
}

@end

@implementation AWSiotsitewiseDescribeDashboardResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardArn" : @"dashboardArn",
             @"dashboardCreationDate" : @"dashboardCreationDate",
             @"dashboardDefinition" : @"dashboardDefinition",
             @"dashboardDescription" : @"dashboardDescription",
             @"dashboardId" : @"dashboardId",
             @"dashboardLastUpdateDate" : @"dashboardLastUpdateDate",
             @"dashboardName" : @"dashboardName",
             @"projectId" : @"projectId",
             };
}

+ (NSValueTransformer *)dashboardCreationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)dashboardLastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSiotsitewiseDescribeGatewayCapabilityConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capabilityNamespace" : @"capabilityNamespace",
             @"gatewayId" : @"gatewayId",
             };
}

@end

@implementation AWSiotsitewiseDescribeGatewayCapabilityConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capabilityConfiguration" : @"capabilityConfiguration",
             @"capabilityNamespace" : @"capabilityNamespace",
             @"capabilitySyncStatus" : @"capabilitySyncStatus",
             @"gatewayId" : @"gatewayId",
             };
}

+ (NSValueTransformer *)capabilitySyncStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_SYNC"] == NSOrderedSame) {
            return @(AWSiotsitewiseCapabilitySyncStatusInSync);
        }
        if ([value caseInsensitiveCompare:@"OUT_OF_SYNC"] == NSOrderedSame) {
            return @(AWSiotsitewiseCapabilitySyncStatusOutOfSync);
        }
        if ([value caseInsensitiveCompare:@"SYNC_FAILED"] == NSOrderedSame) {
            return @(AWSiotsitewiseCapabilitySyncStatusSyncFailed);
        }
        return @(AWSiotsitewiseCapabilitySyncStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewiseCapabilitySyncStatusInSync:
                return @"IN_SYNC";
            case AWSiotsitewiseCapabilitySyncStatusOutOfSync:
                return @"OUT_OF_SYNC";
            case AWSiotsitewiseCapabilitySyncStatusSyncFailed:
                return @"SYNC_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSiotsitewiseDescribeGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayId" : @"gatewayId",
             };
}

@end

@implementation AWSiotsitewiseDescribeGatewayResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"creationDate",
             @"gatewayArn" : @"gatewayArn",
             @"gatewayCapabilitySummaries" : @"gatewayCapabilitySummaries",
             @"gatewayId" : @"gatewayId",
             @"gatewayName" : @"gatewayName",
             @"gatewayPlatform" : @"gatewayPlatform",
             @"lastUpdateDate" : @"lastUpdateDate",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)gatewayCapabilitySummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseGatewayCapabilitySummary class]];
}

+ (NSValueTransformer *)gatewayPlatformJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseGatewayPlatform class]];
}

+ (NSValueTransformer *)lastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSiotsitewiseDescribeLoggingOptionsRequest

@end

@implementation AWSiotsitewiseDescribeLoggingOptionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loggingOptions" : @"loggingOptions",
             };
}

+ (NSValueTransformer *)loggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseLoggingOptions class]];
}

@end

@implementation AWSiotsitewiseDescribePortalRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"portalId" : @"portalId",
             };
}

@end

@implementation AWSiotsitewiseDescribePortalResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"portalArn" : @"portalArn",
             @"portalClientId" : @"portalClientId",
             @"portalContactEmail" : @"portalContactEmail",
             @"portalCreationDate" : @"portalCreationDate",
             @"portalDescription" : @"portalDescription",
             @"portalId" : @"portalId",
             @"portalLastUpdateDate" : @"portalLastUpdateDate",
             @"portalLogoImage" : @"portalLogoImage",
             @"portalName" : @"portalName",
             @"portalStartUrl" : @"portalStartUrl",
             @"portalStatus" : @"portalStatus",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)portalCreationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)portalLastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)portalLogoImageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseImage class]];
}

+ (NSValueTransformer *)portalStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewisePortalStatus class]];
}

@end

@implementation AWSiotsitewiseDescribeProjectRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectId" : @"projectId",
             };
}

@end

@implementation AWSiotsitewiseDescribeProjectResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"portalId" : @"portalId",
             @"projectArn" : @"projectArn",
             @"projectCreationDate" : @"projectCreationDate",
             @"projectDescription" : @"projectDescription",
             @"projectId" : @"projectId",
             @"projectLastUpdateDate" : @"projectLastUpdateDate",
             @"projectName" : @"projectName",
             };
}

+ (NSValueTransformer *)projectCreationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)projectLastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSiotsitewiseDisassociateAssetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"childAssetId" : @"childAssetId",
             @"clientToken" : @"clientToken",
             @"hierarchyId" : @"hierarchyId",
             };
}

@end

@implementation AWSiotsitewiseErrorDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"code",
             @"message" : @"message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VALIDATION_ERROR"] == NSOrderedSame) {
            return @(AWSiotsitewiseErrorCodeValidationError);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_FAILURE"] == NSOrderedSame) {
            return @(AWSiotsitewiseErrorCodeInternalFailure);
        }
        return @(AWSiotsitewiseErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewiseErrorCodeValidationError:
                return @"VALIDATION_ERROR";
            case AWSiotsitewiseErrorCodeInternalFailure:
                return @"INTERNAL_FAILURE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSiotsitewiseExpressionVariable

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseVariableValue class]];
}

@end

@implementation AWSiotsitewiseGatewayCapabilitySummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capabilityNamespace" : @"capabilityNamespace",
             @"capabilitySyncStatus" : @"capabilitySyncStatus",
             };
}

+ (NSValueTransformer *)capabilitySyncStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_SYNC"] == NSOrderedSame) {
            return @(AWSiotsitewiseCapabilitySyncStatusInSync);
        }
        if ([value caseInsensitiveCompare:@"OUT_OF_SYNC"] == NSOrderedSame) {
            return @(AWSiotsitewiseCapabilitySyncStatusOutOfSync);
        }
        if ([value caseInsensitiveCompare:@"SYNC_FAILED"] == NSOrderedSame) {
            return @(AWSiotsitewiseCapabilitySyncStatusSyncFailed);
        }
        return @(AWSiotsitewiseCapabilitySyncStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewiseCapabilitySyncStatusInSync:
                return @"IN_SYNC";
            case AWSiotsitewiseCapabilitySyncStatusOutOfSync:
                return @"OUT_OF_SYNC";
            case AWSiotsitewiseCapabilitySyncStatusSyncFailed:
                return @"SYNC_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSiotsitewiseGatewayPlatform

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"greengrass" : @"greengrass",
             };
}

+ (NSValueTransformer *)greengrassJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseGreengrass class]];
}

@end

@implementation AWSiotsitewiseGatewaySummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"creationDate",
             @"gatewayCapabilitySummaries" : @"gatewayCapabilitySummaries",
             @"gatewayId" : @"gatewayId",
             @"gatewayName" : @"gatewayName",
             @"lastUpdateDate" : @"lastUpdateDate",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)gatewayCapabilitySummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseGatewayCapabilitySummary class]];
}

+ (NSValueTransformer *)lastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSiotsitewiseGetAssetPropertyAggregatesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggregateTypes" : @"aggregateTypes",
             @"assetId" : @"assetId",
             @"endDate" : @"endDate",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"propertyAlias" : @"propertyAlias",
             @"propertyId" : @"propertyId",
             @"qualities" : @"qualities",
             @"resolution" : @"resolution",
             @"startDate" : @"startDate",
             @"timeOrdering" : @"timeOrdering",
             };
}

+ (NSValueTransformer *)endDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)timeOrderingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSiotsitewiseTimeOrderingAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSiotsitewiseTimeOrderingDescending);
        }
        return @(AWSiotsitewiseTimeOrderingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewiseTimeOrderingAscending:
                return @"ASCENDING";
            case AWSiotsitewiseTimeOrderingDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSiotsitewiseGetAssetPropertyAggregatesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggregatedValues" : @"aggregatedValues",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)aggregatedValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseAggregatedValue class]];
}

@end

@implementation AWSiotsitewiseGetAssetPropertyValueHistoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"endDate" : @"endDate",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"propertyAlias" : @"propertyAlias",
             @"propertyId" : @"propertyId",
             @"qualities" : @"qualities",
             @"startDate" : @"startDate",
             @"timeOrdering" : @"timeOrdering",
             };
}

+ (NSValueTransformer *)endDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)timeOrderingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSiotsitewiseTimeOrderingAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSiotsitewiseTimeOrderingDescending);
        }
        return @(AWSiotsitewiseTimeOrderingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewiseTimeOrderingAscending:
                return @"ASCENDING";
            case AWSiotsitewiseTimeOrderingDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSiotsitewiseGetAssetPropertyValueHistoryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetPropertyValueHistory" : @"assetPropertyValueHistory",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)assetPropertyValueHistoryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseAssetPropertyValue class]];
}

@end

@implementation AWSiotsitewiseGetAssetPropertyValueRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"propertyAlias" : @"propertyAlias",
             @"propertyId" : @"propertyId",
             };
}

@end

@implementation AWSiotsitewiseGetAssetPropertyValueResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"propertyValue" : @"propertyValue",
             };
}

+ (NSValueTransformer *)propertyValueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseAssetPropertyValue class]];
}

@end

@implementation AWSiotsitewiseGreengrass

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupArn" : @"groupArn",
             };
}

@end

@implementation AWSiotsitewiseGroupIdentity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"id",
             };
}

@end

@implementation AWSiotsitewiseIdentity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"group" : @"group",
             @"user" : @"user",
             };
}

+ (NSValueTransformer *)groupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseGroupIdentity class]];
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseUserIdentity class]];
}

@end

@implementation AWSiotsitewiseImage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastUpdateDate" : @"lastUpdateDate",
             @"locationUrl" : @"locationUrl",
             };
}

+ (NSValueTransformer *)lastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSiotsitewiseImageFile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encodedString" : @"encodedString",
             @"fileType" : @"fileType",
             };
}

+ (NSValueTransformer *)fileTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PNG"] == NSOrderedSame) {
            return @(AWSiotsitewiseImageFileTypePng);
        }
        return @(AWSiotsitewiseImageFileTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewiseImageFileTypePng:
                return @"PNG";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSiotsitewiseListAccessPoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"identityId",
             @"identityType" : @"identityType",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"resourceId" : @"resourceId",
             @"resourceType" : @"resourceType",
             };
}

+ (NSValueTransformer *)identityTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USER"] == NSOrderedSame) {
            return @(AWSiotsitewiseIdentityTypeUser);
        }
        if ([value caseInsensitiveCompare:@"GROUP"] == NSOrderedSame) {
            return @(AWSiotsitewiseIdentityTypeGroup);
        }
        return @(AWSiotsitewiseIdentityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewiseIdentityTypeUser:
                return @"USER";
            case AWSiotsitewiseIdentityTypeGroup:
                return @"GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PORTAL"] == NSOrderedSame) {
            return @(AWSiotsitewiseResourceTypePortal);
        }
        if ([value caseInsensitiveCompare:@"PROJECT"] == NSOrderedSame) {
            return @(AWSiotsitewiseResourceTypeProject);
        }
        return @(AWSiotsitewiseResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewiseResourceTypePortal:
                return @"PORTAL";
            case AWSiotsitewiseResourceTypeProject:
                return @"PROJECT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSiotsitewiseListAccessPoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPolicySummaries" : @"accessPolicySummaries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)accessPolicySummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseAccessPolicySummary class]];
}

@end

@implementation AWSiotsitewiseListAssetModelsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSiotsitewiseListAssetModelsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetModelSummaries" : @"assetModelSummaries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)assetModelSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseAssetModelSummary class]];
}

@end

@implementation AWSiotsitewiseListAssetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetModelId" : @"assetModelId",
             @"filter" : @"filter",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSiotsitewiseListAssetsFilterAll);
        }
        if ([value caseInsensitiveCompare:@"TOP_LEVEL"] == NSOrderedSame) {
            return @(AWSiotsitewiseListAssetsFilterTopLevel);
        }
        return @(AWSiotsitewiseListAssetsFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewiseListAssetsFilterAll:
                return @"ALL";
            case AWSiotsitewiseListAssetsFilterTopLevel:
                return @"TOP_LEVEL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSiotsitewiseListAssetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetSummaries" : @"assetSummaries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)assetSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseAssetSummary class]];
}

@end

@implementation AWSiotsitewiseListAssociatedAssetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"hierarchyId" : @"hierarchyId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSiotsitewiseListAssociatedAssetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetSummaries" : @"assetSummaries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)assetSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseAssociatedAssetsSummary class]];
}

@end

@implementation AWSiotsitewiseListDashboardsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"projectId" : @"projectId",
             };
}

@end

@implementation AWSiotsitewiseListDashboardsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardSummaries" : @"dashboardSummaries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)dashboardSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseDashboardSummary class]];
}

@end

@implementation AWSiotsitewiseListGatewaysRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSiotsitewiseListGatewaysResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewaySummaries" : @"gatewaySummaries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)gatewaySummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseGatewaySummary class]];
}

@end

@implementation AWSiotsitewiseListPortalsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSiotsitewiseListPortalsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"portalSummaries" : @"portalSummaries",
             };
}

+ (NSValueTransformer *)portalSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewisePortalSummary class]];
}

@end

@implementation AWSiotsitewiseListProjectAssetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"projectId" : @"projectId",
             };
}

@end

@implementation AWSiotsitewiseListProjectAssetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetIds" : @"assetIds",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSiotsitewiseListProjectsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"portalId" : @"portalId",
             };
}

@end

@implementation AWSiotsitewiseListProjectsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"projectSummaries" : @"projectSummaries",
             };
}

+ (NSValueTransformer *)projectSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseProjectSummary class]];
}

@end

@implementation AWSiotsitewiseListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSiotsitewiseListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             };
}

@end

@implementation AWSiotsitewiseLoggingOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"level" : @"level",
             };
}

+ (NSValueTransformer *)levelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSiotsitewiseLoggingLevelError);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSiotsitewiseLoggingLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSiotsitewiseLoggingLevelOff);
        }
        return @(AWSiotsitewiseLoggingLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewiseLoggingLevelError:
                return @"ERROR";
            case AWSiotsitewiseLoggingLevelInfo:
                return @"INFO";
            case AWSiotsitewiseLoggingLevelOff:
                return @"OFF";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSiotsitewiseMeasurement

@end

@implementation AWSiotsitewiseMetric

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expression" : @"expression",
             @"variables" : @"variables",
             @"window" : @"window",
             };
}

+ (NSValueTransformer *)variablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseExpressionVariable class]];
}

+ (NSValueTransformer *)windowJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseMetricWindow class]];
}

@end

@implementation AWSiotsitewiseMetricWindow

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tumbling" : @"tumbling",
             };
}

+ (NSValueTransformer *)tumblingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseTumblingWindow class]];
}

@end

@implementation AWSiotsitewiseMonitorErrorDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"code",
             @"message" : @"message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERNAL_FAILURE"] == NSOrderedSame) {
            return @(AWSiotsitewiseMonitorErrorCodeInternalFailure);
        }
        return @(AWSiotsitewiseMonitorErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewiseMonitorErrorCodeInternalFailure:
                return @"INTERNAL_FAILURE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSiotsitewisePortalResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"id",
             };
}

@end

@implementation AWSiotsitewisePortalStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"error" : @"error",
             @"state" : @"state",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseMonitorErrorDetails class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSiotsitewisePortalStateCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSiotsitewisePortalStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSiotsitewisePortalStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSiotsitewisePortalStateActive);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSiotsitewisePortalStateFailed);
        }
        return @(AWSiotsitewisePortalStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewisePortalStateCreating:
                return @"CREATING";
            case AWSiotsitewisePortalStateUpdating:
                return @"UPDATING";
            case AWSiotsitewisePortalStateDeleting:
                return @"DELETING";
            case AWSiotsitewisePortalStateActive:
                return @"ACTIVE";
            case AWSiotsitewisePortalStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSiotsitewisePortalSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"creationDate",
             @"detail" : @"description",
             @"identifier" : @"id",
             @"lastUpdateDate" : @"lastUpdateDate",
             @"name" : @"name",
             @"roleArn" : @"roleArn",
             @"startUrl" : @"startUrl",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSiotsitewiseProjectResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"id",
             };
}

@end

@implementation AWSiotsitewiseProjectSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"creationDate",
             @"detail" : @"description",
             @"identifier" : @"id",
             @"lastUpdateDate" : @"lastUpdateDate",
             @"name" : @"name",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSiotsitewiseProperty

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alias" : @"alias",
             @"dataType" : @"dataType",
             @"identifier" : @"id",
             @"name" : @"name",
             @"notification" : @"notification",
             @"types" : @"type",
             @"unit" : @"unit",
             };
}

+ (NSValueTransformer *)dataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STRING"] == NSOrderedSame) {
            return @(AWSiotsitewisePropertyDataTypeString);
        }
        if ([value caseInsensitiveCompare:@"INTEGER"] == NSOrderedSame) {
            return @(AWSiotsitewisePropertyDataTypeInteger);
        }
        if ([value caseInsensitiveCompare:@"DOUBLE"] == NSOrderedSame) {
            return @(AWSiotsitewisePropertyDataTypeDouble);
        }
        if ([value caseInsensitiveCompare:@"BOOLEAN"] == NSOrderedSame) {
            return @(AWSiotsitewisePropertyDataTypeBoolean);
        }
        return @(AWSiotsitewisePropertyDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewisePropertyDataTypeString:
                return @"STRING";
            case AWSiotsitewisePropertyDataTypeInteger:
                return @"INTEGER";
            case AWSiotsitewisePropertyDataTypeDouble:
                return @"DOUBLE";
            case AWSiotsitewisePropertyDataTypeBoolean:
                return @"BOOLEAN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewisePropertyNotification class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewisePropertyType class]];
}

@end

@implementation AWSiotsitewisePropertyNotification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"state" : @"state",
             @"topic" : @"topic",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSiotsitewisePropertyNotificationStateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSiotsitewisePropertyNotificationStateDisabled);
        }
        return @(AWSiotsitewisePropertyNotificationStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewisePropertyNotificationStateEnabled:
                return @"ENABLED";
            case AWSiotsitewisePropertyNotificationStateDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSiotsitewisePropertyType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attribute" : @"attribute",
             @"measurement" : @"measurement",
             @"metric" : @"metric",
             @"transform" : @"transform",
             };
}

+ (NSValueTransformer *)attributeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseAttribute class]];
}

+ (NSValueTransformer *)measurementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseMeasurement class]];
}

+ (NSValueTransformer *)metricJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseMetric class]];
}

+ (NSValueTransformer *)transformJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseTransform class]];
}

@end

@implementation AWSiotsitewisePutAssetPropertyValueEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"entryId" : @"entryId",
             @"propertyAlias" : @"propertyAlias",
             @"propertyId" : @"propertyId",
             @"propertyValues" : @"propertyValues",
             };
}

+ (NSValueTransformer *)propertyValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseAssetPropertyValue class]];
}

@end

@implementation AWSiotsitewisePutLoggingOptionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loggingOptions" : @"loggingOptions",
             };
}

+ (NSValueTransformer *)loggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseLoggingOptions class]];
}

@end

@implementation AWSiotsitewisePutLoggingOptionsResponse

@end

@implementation AWSiotsitewiseResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"portal" : @"portal",
             @"project" : @"project",
             };
}

+ (NSValueTransformer *)portalJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewisePortalResource class]];
}

+ (NSValueTransformer *)projectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseProjectResource class]];
}

@end

@implementation AWSiotsitewiseTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSiotsitewiseTagResourceResponse

@end

@implementation AWSiotsitewiseTimeInNanos

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"offsetInNanos" : @"offsetInNanos",
             @"timeInSeconds" : @"timeInSeconds",
             };
}

@end

@implementation AWSiotsitewiseTransform

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expression" : @"expression",
             @"variables" : @"variables",
             };
}

+ (NSValueTransformer *)variablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseExpressionVariable class]];
}

@end

@implementation AWSiotsitewiseTumblingWindow

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"interval" : @"interval",
             };
}

@end

@implementation AWSiotsitewiseUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSiotsitewiseUntagResourceResponse

@end

@implementation AWSiotsitewiseUpdateAccessPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPolicyId" : @"accessPolicyId",
             @"accessPolicyIdentity" : @"accessPolicyIdentity",
             @"accessPolicyPermission" : @"accessPolicyPermission",
             @"accessPolicyResource" : @"accessPolicyResource",
             @"clientToken" : @"clientToken",
             };
}

+ (NSValueTransformer *)accessPolicyIdentityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseIdentity class]];
}

+ (NSValueTransformer *)accessPolicyPermissionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADMINISTRATOR"] == NSOrderedSame) {
            return @(AWSiotsitewisePermissionAdministrator);
        }
        if ([value caseInsensitiveCompare:@"VIEWER"] == NSOrderedSame) {
            return @(AWSiotsitewisePermissionViewer);
        }
        return @(AWSiotsitewisePermissionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewisePermissionAdministrator:
                return @"ADMINISTRATOR";
            case AWSiotsitewisePermissionViewer:
                return @"VIEWER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)accessPolicyResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseResource class]];
}

@end

@implementation AWSiotsitewiseUpdateAccessPolicyResponse

@end

@implementation AWSiotsitewiseUpdateAssetModelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetModelDescription" : @"assetModelDescription",
             @"assetModelHierarchies" : @"assetModelHierarchies",
             @"assetModelId" : @"assetModelId",
             @"assetModelName" : @"assetModelName",
             @"assetModelProperties" : @"assetModelProperties",
             @"clientToken" : @"clientToken",
             };
}

+ (NSValueTransformer *)assetModelHierarchiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseAssetModelHierarchy class]];
}

+ (NSValueTransformer *)assetModelPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSiotsitewiseAssetModelProperty class]];
}

@end

@implementation AWSiotsitewiseUpdateAssetModelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetModelStatus" : @"assetModelStatus",
             };
}

+ (NSValueTransformer *)assetModelStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseAssetModelStatus class]];
}

@end

@implementation AWSiotsitewiseUpdateAssetPropertyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"clientToken" : @"clientToken",
             @"propertyAlias" : @"propertyAlias",
             @"propertyId" : @"propertyId",
             @"propertyNotificationState" : @"propertyNotificationState",
             };
}

+ (NSValueTransformer *)propertyNotificationStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSiotsitewisePropertyNotificationStateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSiotsitewisePropertyNotificationStateDisabled);
        }
        return @(AWSiotsitewisePropertyNotificationStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewisePropertyNotificationStateEnabled:
                return @"ENABLED";
            case AWSiotsitewisePropertyNotificationStateDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSiotsitewiseUpdateAssetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"assetName" : @"assetName",
             @"clientToken" : @"clientToken",
             };
}

@end

@implementation AWSiotsitewiseUpdateAssetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetStatus" : @"assetStatus",
             };
}

+ (NSValueTransformer *)assetStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseAssetStatus class]];
}

@end

@implementation AWSiotsitewiseUpdateDashboardRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"dashboardDefinition" : @"dashboardDefinition",
             @"dashboardDescription" : @"dashboardDescription",
             @"dashboardId" : @"dashboardId",
             @"dashboardName" : @"dashboardName",
             };
}

@end

@implementation AWSiotsitewiseUpdateDashboardResponse

@end

@implementation AWSiotsitewiseUpdateGatewayCapabilityConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capabilityConfiguration" : @"capabilityConfiguration",
             @"capabilityNamespace" : @"capabilityNamespace",
             @"gatewayId" : @"gatewayId",
             };
}

@end

@implementation AWSiotsitewiseUpdateGatewayCapabilityConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capabilityNamespace" : @"capabilityNamespace",
             @"capabilitySyncStatus" : @"capabilitySyncStatus",
             };
}

+ (NSValueTransformer *)capabilitySyncStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_SYNC"] == NSOrderedSame) {
            return @(AWSiotsitewiseCapabilitySyncStatusInSync);
        }
        if ([value caseInsensitiveCompare:@"OUT_OF_SYNC"] == NSOrderedSame) {
            return @(AWSiotsitewiseCapabilitySyncStatusOutOfSync);
        }
        if ([value caseInsensitiveCompare:@"SYNC_FAILED"] == NSOrderedSame) {
            return @(AWSiotsitewiseCapabilitySyncStatusSyncFailed);
        }
        return @(AWSiotsitewiseCapabilitySyncStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSiotsitewiseCapabilitySyncStatusInSync:
                return @"IN_SYNC";
            case AWSiotsitewiseCapabilitySyncStatusOutOfSync:
                return @"OUT_OF_SYNC";
            case AWSiotsitewiseCapabilitySyncStatusSyncFailed:
                return @"SYNC_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSiotsitewiseUpdateGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayId" : @"gatewayId",
             @"gatewayName" : @"gatewayName",
             };
}

@end

@implementation AWSiotsitewiseUpdatePortalRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"portalContactEmail" : @"portalContactEmail",
             @"portalDescription" : @"portalDescription",
             @"portalId" : @"portalId",
             @"portalLogoImageFile" : @"portalLogoImageFile",
             @"portalName" : @"portalName",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)portalLogoImageFileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewiseImageFile class]];
}

@end

@implementation AWSiotsitewiseUpdatePortalResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"portalStatus" : @"portalStatus",
             };
}

+ (NSValueTransformer *)portalStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSiotsitewisePortalStatus class]];
}

@end

@implementation AWSiotsitewiseUpdateProjectRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"projectDescription" : @"projectDescription",
             @"projectId" : @"projectId",
             @"projectName" : @"projectName",
             };
}

@end

@implementation AWSiotsitewiseUpdateProjectResponse

@end

@implementation AWSiotsitewiseUserIdentity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"id",
             };
}

@end

@implementation AWSiotsitewiseVariableValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hierarchyId" : @"hierarchyId",
             @"propertyId" : @"propertyId",
             };
}

@end

@implementation AWSiotsitewiseVariant

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"booleanValueProperty" : @"booleanValue",
             @"doubleValueProperty" : @"doubleValue",
             @"integerValueProperty" : @"integerValue",
             @"stringValueProperty" : @"stringValue",
             };
}

@end
