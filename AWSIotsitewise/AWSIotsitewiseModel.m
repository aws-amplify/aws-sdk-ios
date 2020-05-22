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

#import "AWSIotsitewiseModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSIotsitewiseErrorDomain = @"com.amazonaws.AWSIotsitewiseErrorDomain";

@implementation AWSIotsitewiseAccessPolicySummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseIdentity class]];
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
            return @(AWSIotsitewisePermissionAdministrator);
        }
        if ([value caseInsensitiveCompare:@"VIEWER"] == NSOrderedSame) {
            return @(AWSIotsitewisePermissionViewer);
        }
        return @(AWSIotsitewisePermissionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewisePermissionAdministrator:
                return @"ADMINISTRATOR";
            case AWSIotsitewisePermissionViewer:
                return @"VIEWER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseResource class]];
}

@end

@implementation AWSIotsitewiseAggregatedValue

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
            return @(AWSIotsitewiseQualityGood);
        }
        if ([value caseInsensitiveCompare:@"BAD"] == NSOrderedSame) {
            return @(AWSIotsitewiseQualityBad);
        }
        if ([value caseInsensitiveCompare:@"UNCERTAIN"] == NSOrderedSame) {
            return @(AWSIotsitewiseQualityUncertain);
        }
        return @(AWSIotsitewiseQualityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewiseQualityGood:
                return @"GOOD";
            case AWSIotsitewiseQualityBad:
                return @"BAD";
            case AWSIotsitewiseQualityUncertain:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseAggregates class]];
}

@end

@implementation AWSIotsitewiseAggregates

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"average" : @"average",
             @"count" : @"count",
             @"maximum" : @"maximum",
             @"minimum" : @"minimum",
             @"standardDeviation" : @"standardDeviation",
             @"sum" : @"sum",
             };
}

@end

@implementation AWSIotsitewiseAssetErrorDetails

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
            return @(AWSIotsitewiseAssetErrorCodeInternalFailure);
        }
        return @(AWSIotsitewiseAssetErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewiseAssetErrorCodeInternalFailure:
                return @"INTERNAL_FAILURE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIotsitewiseAssetHierarchy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"id",
             @"name" : @"name",
             };
}

@end

@implementation AWSIotsitewiseAssetModelHierarchy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"childAssetModelId" : @"childAssetModelId",
             @"identifier" : @"id",
             @"name" : @"name",
             };
}

@end

@implementation AWSIotsitewiseAssetModelHierarchyDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"childAssetModelId" : @"childAssetModelId",
             @"name" : @"name",
             };
}

@end

@implementation AWSIotsitewiseAssetModelProperty

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
            return @(AWSIotsitewisePropertyDataTypeString);
        }
        if ([value caseInsensitiveCompare:@"INTEGER"] == NSOrderedSame) {
            return @(AWSIotsitewisePropertyDataTypeInteger);
        }
        if ([value caseInsensitiveCompare:@"DOUBLE"] == NSOrderedSame) {
            return @(AWSIotsitewisePropertyDataTypeDouble);
        }
        if ([value caseInsensitiveCompare:@"BOOLEAN"] == NSOrderedSame) {
            return @(AWSIotsitewisePropertyDataTypeBoolean);
        }
        return @(AWSIotsitewisePropertyDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewisePropertyDataTypeString:
                return @"STRING";
            case AWSIotsitewisePropertyDataTypeInteger:
                return @"INTEGER";
            case AWSIotsitewisePropertyDataTypeDouble:
                return @"DOUBLE";
            case AWSIotsitewisePropertyDataTypeBoolean:
                return @"BOOLEAN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewisePropertyType class]];
}

@end

@implementation AWSIotsitewiseAssetModelPropertyDefinition

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
            return @(AWSIotsitewisePropertyDataTypeString);
        }
        if ([value caseInsensitiveCompare:@"INTEGER"] == NSOrderedSame) {
            return @(AWSIotsitewisePropertyDataTypeInteger);
        }
        if ([value caseInsensitiveCompare:@"DOUBLE"] == NSOrderedSame) {
            return @(AWSIotsitewisePropertyDataTypeDouble);
        }
        if ([value caseInsensitiveCompare:@"BOOLEAN"] == NSOrderedSame) {
            return @(AWSIotsitewisePropertyDataTypeBoolean);
        }
        return @(AWSIotsitewisePropertyDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewisePropertyDataTypeString:
                return @"STRING";
            case AWSIotsitewisePropertyDataTypeInteger:
                return @"INTEGER";
            case AWSIotsitewisePropertyDataTypeDouble:
                return @"DOUBLE";
            case AWSIotsitewisePropertyDataTypeBoolean:
                return @"BOOLEAN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewisePropertyType class]];
}

@end

@implementation AWSIotsitewiseAssetModelStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"error" : @"error",
             @"state" : @"state",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseErrorDetails class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSIotsitewiseAssetModelStateCreating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSIotsitewiseAssetModelStateActive);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSIotsitewiseAssetModelStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"PROPAGATING"] == NSOrderedSame) {
            return @(AWSIotsitewiseAssetModelStatePropagating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSIotsitewiseAssetModelStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIotsitewiseAssetModelStateFailed);
        }
        return @(AWSIotsitewiseAssetModelStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewiseAssetModelStateCreating:
                return @"CREATING";
            case AWSIotsitewiseAssetModelStateActive:
                return @"ACTIVE";
            case AWSIotsitewiseAssetModelStateUpdating:
                return @"UPDATING";
            case AWSIotsitewiseAssetModelStatePropagating:
                return @"PROPAGATING";
            case AWSIotsitewiseAssetModelStateDeleting:
                return @"DELETING";
            case AWSIotsitewiseAssetModelStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIotsitewiseAssetModelSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseAssetModelStatus class]];
}

@end

@implementation AWSIotsitewiseAssetProperty

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
            return @(AWSIotsitewisePropertyDataTypeString);
        }
        if ([value caseInsensitiveCompare:@"INTEGER"] == NSOrderedSame) {
            return @(AWSIotsitewisePropertyDataTypeInteger);
        }
        if ([value caseInsensitiveCompare:@"DOUBLE"] == NSOrderedSame) {
            return @(AWSIotsitewisePropertyDataTypeDouble);
        }
        if ([value caseInsensitiveCompare:@"BOOLEAN"] == NSOrderedSame) {
            return @(AWSIotsitewisePropertyDataTypeBoolean);
        }
        return @(AWSIotsitewisePropertyDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewisePropertyDataTypeString:
                return @"STRING";
            case AWSIotsitewisePropertyDataTypeInteger:
                return @"INTEGER";
            case AWSIotsitewisePropertyDataTypeDouble:
                return @"DOUBLE";
            case AWSIotsitewisePropertyDataTypeBoolean:
                return @"BOOLEAN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewisePropertyNotification class]];
}

@end

@implementation AWSIotsitewiseAssetPropertyValue

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
            return @(AWSIotsitewiseQualityGood);
        }
        if ([value caseInsensitiveCompare:@"BAD"] == NSOrderedSame) {
            return @(AWSIotsitewiseQualityBad);
        }
        if ([value caseInsensitiveCompare:@"UNCERTAIN"] == NSOrderedSame) {
            return @(AWSIotsitewiseQualityUncertain);
        }
        return @(AWSIotsitewiseQualityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewiseQualityGood:
                return @"GOOD";
            case AWSIotsitewiseQualityBad:
                return @"BAD";
            case AWSIotsitewiseQualityUncertain:
                return @"UNCERTAIN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseTimeInNanos class]];
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseVariant class]];
}

@end

@implementation AWSIotsitewiseAssetStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"error" : @"error",
             @"state" : @"state",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseErrorDetails class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSIotsitewiseAssetStateCreating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSIotsitewiseAssetStateActive);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSIotsitewiseAssetStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSIotsitewiseAssetStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIotsitewiseAssetStateFailed);
        }
        return @(AWSIotsitewiseAssetStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewiseAssetStateCreating:
                return @"CREATING";
            case AWSIotsitewiseAssetStateActive:
                return @"ACTIVE";
            case AWSIotsitewiseAssetStateUpdating:
                return @"UPDATING";
            case AWSIotsitewiseAssetStateDeleting:
                return @"DELETING";
            case AWSIotsitewiseAssetStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIotsitewiseAssetSummary

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseAssetHierarchy class]];
}

+ (NSValueTransformer *)lastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseAssetStatus class]];
}

@end

@implementation AWSIotsitewiseAssociateAssetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"childAssetId" : @"childAssetId",
             @"clientToken" : @"clientToken",
             @"hierarchyId" : @"hierarchyId",
             };
}

@end

@implementation AWSIotsitewiseAssociatedAssetsSummary

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseAssetHierarchy class]];
}

+ (NSValueTransformer *)lastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseAssetStatus class]];
}

@end

@implementation AWSIotsitewiseAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultValue" : @"defaultValue",
             };
}

@end

@implementation AWSIotsitewiseBatchAssociateProjectAssetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetIds" : @"assetIds",
             @"clientToken" : @"clientToken",
             @"projectId" : @"projectId",
             };
}

@end

@implementation AWSIotsitewiseBatchAssociateProjectAssetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseAssetErrorDetails class]];
}

@end

@implementation AWSIotsitewiseBatchDisassociateProjectAssetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetIds" : @"assetIds",
             @"clientToken" : @"clientToken",
             @"projectId" : @"projectId",
             };
}

@end

@implementation AWSIotsitewiseBatchDisassociateProjectAssetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseAssetErrorDetails class]];
}

@end

@implementation AWSIotsitewiseBatchPutAssetPropertyError

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
            return @(AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeResourceNotFoundException);
        }
        if ([value caseInsensitiveCompare:@"InvalidRequestException"] == NSOrderedSame) {
            return @(AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeInvalidRequestException);
        }
        if ([value caseInsensitiveCompare:@"InternalFailureException"] == NSOrderedSame) {
            return @(AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeInternalFailureException);
        }
        if ([value caseInsensitiveCompare:@"ServiceUnavailableException"] == NSOrderedSame) {
            return @(AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeServiceUnavailableException);
        }
        if ([value caseInsensitiveCompare:@"ThrottlingException"] == NSOrderedSame) {
            return @(AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeThrottlingException);
        }
        if ([value caseInsensitiveCompare:@"LimitExceededException"] == NSOrderedSame) {
            return @(AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeLimitExceededException);
        }
        if ([value caseInsensitiveCompare:@"ConflictingOperationException"] == NSOrderedSame) {
            return @(AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeConflictingOperationException);
        }
        if ([value caseInsensitiveCompare:@"TimestampOutOfRangeException"] == NSOrderedSame) {
            return @(AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeTimestampOutOfRangeException);
        }
        if ([value caseInsensitiveCompare:@"AccessDeniedException"] == NSOrderedSame) {
            return @(AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeAccessDeniedException);
        }
        return @(AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeResourceNotFoundException:
                return @"ResourceNotFoundException";
            case AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeInvalidRequestException:
                return @"InvalidRequestException";
            case AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeInternalFailureException:
                return @"InternalFailureException";
            case AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeServiceUnavailableException:
                return @"ServiceUnavailableException";
            case AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeThrottlingException:
                return @"ThrottlingException";
            case AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeLimitExceededException:
                return @"LimitExceededException";
            case AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeConflictingOperationException:
                return @"ConflictingOperationException";
            case AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeTimestampOutOfRangeException:
                return @"TimestampOutOfRangeException";
            case AWSIotsitewiseBatchPutAssetPropertyValueErrorCodeAccessDeniedException:
                return @"AccessDeniedException";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseTimeInNanos class]];
}

@end

@implementation AWSIotsitewiseBatchPutAssetPropertyErrorEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entryId" : @"entryId",
             @"errors" : @"errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseBatchPutAssetPropertyError class]];
}

@end

@implementation AWSIotsitewiseBatchPutAssetPropertyValueRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entries" : @"entries",
             };
}

+ (NSValueTransformer *)entriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewisePutAssetPropertyValueEntry class]];
}

@end

@implementation AWSIotsitewiseBatchPutAssetPropertyValueResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorEntries" : @"errorEntries",
             };
}

+ (NSValueTransformer *)errorEntriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseBatchPutAssetPropertyErrorEntry class]];
}

@end

@implementation AWSIotsitewiseCreateAccessPolicyRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseIdentity class]];
}

+ (NSValueTransformer *)accessPolicyPermissionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADMINISTRATOR"] == NSOrderedSame) {
            return @(AWSIotsitewisePermissionAdministrator);
        }
        if ([value caseInsensitiveCompare:@"VIEWER"] == NSOrderedSame) {
            return @(AWSIotsitewisePermissionViewer);
        }
        return @(AWSIotsitewisePermissionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewisePermissionAdministrator:
                return @"ADMINISTRATOR";
            case AWSIotsitewisePermissionViewer:
                return @"VIEWER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)accessPolicyResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseResource class]];
}

@end

@implementation AWSIotsitewiseCreateAccessPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPolicyArn" : @"accessPolicyArn",
             @"accessPolicyId" : @"accessPolicyId",
             };
}

@end

@implementation AWSIotsitewiseCreateAssetModelRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseAssetModelHierarchyDefinition class]];
}

+ (NSValueTransformer *)assetModelPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseAssetModelPropertyDefinition class]];
}

@end

@implementation AWSIotsitewiseCreateAssetModelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetModelArn" : @"assetModelArn",
             @"assetModelId" : @"assetModelId",
             @"assetModelStatus" : @"assetModelStatus",
             };
}

+ (NSValueTransformer *)assetModelStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseAssetModelStatus class]];
}

@end

@implementation AWSIotsitewiseCreateAssetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetModelId" : @"assetModelId",
             @"assetName" : @"assetName",
             @"clientToken" : @"clientToken",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSIotsitewiseCreateAssetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetArn" : @"assetArn",
             @"assetId" : @"assetId",
             @"assetStatus" : @"assetStatus",
             };
}

+ (NSValueTransformer *)assetStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseAssetStatus class]];
}

@end

@implementation AWSIotsitewiseCreateDashboardRequest

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

@implementation AWSIotsitewiseCreateDashboardResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardArn" : @"dashboardArn",
             @"dashboardId" : @"dashboardId",
             };
}

@end

@implementation AWSIotsitewiseCreateGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayName" : @"gatewayName",
             @"gatewayPlatform" : @"gatewayPlatform",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)gatewayPlatformJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseGatewayPlatform class]];
}

@end

@implementation AWSIotsitewiseCreateGatewayResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayArn" : @"gatewayArn",
             @"gatewayId" : @"gatewayId",
             };
}

@end

@implementation AWSIotsitewiseCreatePortalRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseImageFile class]];
}

@end

@implementation AWSIotsitewiseCreatePortalResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewisePortalStatus class]];
}

@end

@implementation AWSIotsitewiseCreateProjectRequest

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

@implementation AWSIotsitewiseCreateProjectResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectArn" : @"projectArn",
             @"projectId" : @"projectId",
             };
}

@end

@implementation AWSIotsitewiseDashboardSummary

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

@implementation AWSIotsitewiseDeleteAccessPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPolicyId" : @"accessPolicyId",
             @"clientToken" : @"clientToken",
             };
}

@end

@implementation AWSIotsitewiseDeleteAccessPolicyResponse

@end

@implementation AWSIotsitewiseDeleteAssetModelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetModelId" : @"assetModelId",
             @"clientToken" : @"clientToken",
             };
}

@end

@implementation AWSIotsitewiseDeleteAssetModelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetModelStatus" : @"assetModelStatus",
             };
}

+ (NSValueTransformer *)assetModelStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseAssetModelStatus class]];
}

@end

@implementation AWSIotsitewiseDeleteAssetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"clientToken" : @"clientToken",
             };
}

@end

@implementation AWSIotsitewiseDeleteAssetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetStatus" : @"assetStatus",
             };
}

+ (NSValueTransformer *)assetStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseAssetStatus class]];
}

@end

@implementation AWSIotsitewiseDeleteDashboardRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"dashboardId" : @"dashboardId",
             };
}

@end

@implementation AWSIotsitewiseDeleteDashboardResponse

@end

@implementation AWSIotsitewiseDeleteGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayId" : @"gatewayId",
             };
}

@end

@implementation AWSIotsitewiseDeletePortalRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"portalId" : @"portalId",
             };
}

@end

@implementation AWSIotsitewiseDeletePortalResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"portalStatus" : @"portalStatus",
             };
}

+ (NSValueTransformer *)portalStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewisePortalStatus class]];
}

@end

@implementation AWSIotsitewiseDeleteProjectRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"projectId" : @"projectId",
             };
}

@end

@implementation AWSIotsitewiseDeleteProjectResponse

@end

@implementation AWSIotsitewiseDescribeAccessPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPolicyId" : @"accessPolicyId",
             };
}

@end

@implementation AWSIotsitewiseDescribeAccessPolicyResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseIdentity class]];
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
            return @(AWSIotsitewisePermissionAdministrator);
        }
        if ([value caseInsensitiveCompare:@"VIEWER"] == NSOrderedSame) {
            return @(AWSIotsitewisePermissionViewer);
        }
        return @(AWSIotsitewisePermissionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewisePermissionAdministrator:
                return @"ADMINISTRATOR";
            case AWSIotsitewisePermissionViewer:
                return @"VIEWER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)accessPolicyResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseResource class]];
}

@end

@implementation AWSIotsitewiseDescribeAssetModelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetModelId" : @"assetModelId",
             };
}

@end

@implementation AWSIotsitewiseDescribeAssetModelResponse

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseAssetModelHierarchy class]];
}

+ (NSValueTransformer *)assetModelLastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)assetModelPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseAssetModelProperty class]];
}

+ (NSValueTransformer *)assetModelStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseAssetModelStatus class]];
}

@end

@implementation AWSIotsitewiseDescribeAssetPropertyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"propertyId" : @"propertyId",
             };
}

@end

@implementation AWSIotsitewiseDescribeAssetPropertyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"assetModelId" : @"assetModelId",
             @"assetName" : @"assetName",
             @"assetProperty" : @"assetProperty",
             };
}

+ (NSValueTransformer *)assetPropertyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseProperty class]];
}

@end

@implementation AWSIotsitewiseDescribeAssetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             };
}

@end

@implementation AWSIotsitewiseDescribeAssetResponse

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseAssetHierarchy class]];
}

+ (NSValueTransformer *)assetLastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)assetPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseAssetProperty class]];
}

+ (NSValueTransformer *)assetStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseAssetStatus class]];
}

@end

@implementation AWSIotsitewiseDescribeDashboardRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardId" : @"dashboardId",
             };
}

@end

@implementation AWSIotsitewiseDescribeDashboardResponse

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

@implementation AWSIotsitewiseDescribeGatewayCapabilityConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capabilityNamespace" : @"capabilityNamespace",
             @"gatewayId" : @"gatewayId",
             };
}

@end

@implementation AWSIotsitewiseDescribeGatewayCapabilityConfigurationResponse

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
            return @(AWSIotsitewiseCapabilitySyncStatusInSync);
        }
        if ([value caseInsensitiveCompare:@"OUT_OF_SYNC"] == NSOrderedSame) {
            return @(AWSIotsitewiseCapabilitySyncStatusOutOfSync);
        }
        if ([value caseInsensitiveCompare:@"SYNC_FAILED"] == NSOrderedSame) {
            return @(AWSIotsitewiseCapabilitySyncStatusSyncFailed);
        }
        return @(AWSIotsitewiseCapabilitySyncStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewiseCapabilitySyncStatusInSync:
                return @"IN_SYNC";
            case AWSIotsitewiseCapabilitySyncStatusOutOfSync:
                return @"OUT_OF_SYNC";
            case AWSIotsitewiseCapabilitySyncStatusSyncFailed:
                return @"SYNC_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIotsitewiseDescribeGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayId" : @"gatewayId",
             };
}

@end

@implementation AWSIotsitewiseDescribeGatewayResponse

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseGatewayCapabilitySummary class]];
}

+ (NSValueTransformer *)gatewayPlatformJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseGatewayPlatform class]];
}

+ (NSValueTransformer *)lastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSIotsitewiseDescribeLoggingOptionsRequest

@end

@implementation AWSIotsitewiseDescribeLoggingOptionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loggingOptions" : @"loggingOptions",
             };
}

+ (NSValueTransformer *)loggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseLoggingOptions class]];
}

@end

@implementation AWSIotsitewiseDescribePortalRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"portalId" : @"portalId",
             };
}

@end

@implementation AWSIotsitewiseDescribePortalResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"portalArn" : @"portalArn",
             @"portalClientId" : @"portalClientId",
             @"portalContactEmail" : @"portalContactEmail",
             @"portalCreationDate" : @"portalCreationDate",
             @"portalDescription" : @"portalDescription",
             @"portalId" : @"portalId",
             @"portalLastUpdateDate" : @"portalLastUpdateDate",
             @"portalLogoImageLocation" : @"portalLogoImageLocation",
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

+ (NSValueTransformer *)portalLogoImageLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseImageLocation class]];
}

+ (NSValueTransformer *)portalStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewisePortalStatus class]];
}

@end

@implementation AWSIotsitewiseDescribeProjectRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectId" : @"projectId",
             };
}

@end

@implementation AWSIotsitewiseDescribeProjectResponse

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

@implementation AWSIotsitewiseDisassociateAssetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"childAssetId" : @"childAssetId",
             @"clientToken" : @"clientToken",
             @"hierarchyId" : @"hierarchyId",
             };
}

@end

@implementation AWSIotsitewiseErrorDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"code",
             @"message" : @"message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VALIDATION_ERROR"] == NSOrderedSame) {
            return @(AWSIotsitewiseErrorCodeValidationError);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_FAILURE"] == NSOrderedSame) {
            return @(AWSIotsitewiseErrorCodeInternalFailure);
        }
        return @(AWSIotsitewiseErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewiseErrorCodeValidationError:
                return @"VALIDATION_ERROR";
            case AWSIotsitewiseErrorCodeInternalFailure:
                return @"INTERNAL_FAILURE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIotsitewiseExpressionVariable

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseVariableValue class]];
}

@end

@implementation AWSIotsitewiseGatewayCapabilitySummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capabilityNamespace" : @"capabilityNamespace",
             @"capabilitySyncStatus" : @"capabilitySyncStatus",
             };
}

+ (NSValueTransformer *)capabilitySyncStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_SYNC"] == NSOrderedSame) {
            return @(AWSIotsitewiseCapabilitySyncStatusInSync);
        }
        if ([value caseInsensitiveCompare:@"OUT_OF_SYNC"] == NSOrderedSame) {
            return @(AWSIotsitewiseCapabilitySyncStatusOutOfSync);
        }
        if ([value caseInsensitiveCompare:@"SYNC_FAILED"] == NSOrderedSame) {
            return @(AWSIotsitewiseCapabilitySyncStatusSyncFailed);
        }
        return @(AWSIotsitewiseCapabilitySyncStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewiseCapabilitySyncStatusInSync:
                return @"IN_SYNC";
            case AWSIotsitewiseCapabilitySyncStatusOutOfSync:
                return @"OUT_OF_SYNC";
            case AWSIotsitewiseCapabilitySyncStatusSyncFailed:
                return @"SYNC_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIotsitewiseGatewayPlatform

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"greengrass" : @"greengrass",
             };
}

+ (NSValueTransformer *)greengrassJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseGreengrass class]];
}

@end

@implementation AWSIotsitewiseGatewaySummary

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseGatewayCapabilitySummary class]];
}

+ (NSValueTransformer *)lastUpdateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSIotsitewiseGetAssetPropertyAggregatesRequest

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
            return @(AWSIotsitewiseTimeOrderingAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSIotsitewiseTimeOrderingDescending);
        }
        return @(AWSIotsitewiseTimeOrderingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewiseTimeOrderingAscending:
                return @"ASCENDING";
            case AWSIotsitewiseTimeOrderingDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIotsitewiseGetAssetPropertyAggregatesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggregatedValues" : @"aggregatedValues",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)aggregatedValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseAggregatedValue class]];
}

@end

@implementation AWSIotsitewiseGetAssetPropertyValueHistoryRequest

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
            return @(AWSIotsitewiseTimeOrderingAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSIotsitewiseTimeOrderingDescending);
        }
        return @(AWSIotsitewiseTimeOrderingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewiseTimeOrderingAscending:
                return @"ASCENDING";
            case AWSIotsitewiseTimeOrderingDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIotsitewiseGetAssetPropertyValueHistoryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetPropertyValueHistory" : @"assetPropertyValueHistory",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)assetPropertyValueHistoryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseAssetPropertyValue class]];
}

@end

@implementation AWSIotsitewiseGetAssetPropertyValueRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"propertyAlias" : @"propertyAlias",
             @"propertyId" : @"propertyId",
             };
}

@end

@implementation AWSIotsitewiseGetAssetPropertyValueResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"propertyValue" : @"propertyValue",
             };
}

+ (NSValueTransformer *)propertyValueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseAssetPropertyValue class]];
}

@end

@implementation AWSIotsitewiseGreengrass

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupArn" : @"groupArn",
             };
}

@end

@implementation AWSIotsitewiseGroupIdentity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"id",
             };
}

@end

@implementation AWSIotsitewiseIdentity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"group" : @"group",
             @"user" : @"user",
             };
}

+ (NSValueTransformer *)groupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseGroupIdentity class]];
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseUserIdentity class]];
}

@end

@implementation AWSIotsitewiseImage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"file" : @"file",
             @"identifier" : @"id",
             };
}

+ (NSValueTransformer *)fileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseImageFile class]];
}

@end

@implementation AWSIotsitewiseImageFile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"data",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PNG"] == NSOrderedSame) {
            return @(AWSIotsitewiseImageFileTypePng);
        }
        return @(AWSIotsitewiseImageFileTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewiseImageFileTypePng:
                return @"PNG";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIotsitewiseImageLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"id",
             @"url" : @"url",
             };
}

@end

@implementation AWSIotsitewiseListAccessPoliciesRequest

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
            return @(AWSIotsitewiseIdentityTypeUser);
        }
        if ([value caseInsensitiveCompare:@"GROUP"] == NSOrderedSame) {
            return @(AWSIotsitewiseIdentityTypeGroup);
        }
        return @(AWSIotsitewiseIdentityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewiseIdentityTypeUser:
                return @"USER";
            case AWSIotsitewiseIdentityTypeGroup:
                return @"GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PORTAL"] == NSOrderedSame) {
            return @(AWSIotsitewiseResourceTypePortal);
        }
        if ([value caseInsensitiveCompare:@"PROJECT"] == NSOrderedSame) {
            return @(AWSIotsitewiseResourceTypeProject);
        }
        return @(AWSIotsitewiseResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewiseResourceTypePortal:
                return @"PORTAL";
            case AWSIotsitewiseResourceTypeProject:
                return @"PROJECT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIotsitewiseListAccessPoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPolicySummaries" : @"accessPolicySummaries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)accessPolicySummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseAccessPolicySummary class]];
}

@end

@implementation AWSIotsitewiseListAssetModelsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIotsitewiseListAssetModelsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetModelSummaries" : @"assetModelSummaries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)assetModelSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseAssetModelSummary class]];
}

@end

@implementation AWSIotsitewiseListAssetsRequest

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
            return @(AWSIotsitewiseListAssetsFilterAll);
        }
        if ([value caseInsensitiveCompare:@"TOP_LEVEL"] == NSOrderedSame) {
            return @(AWSIotsitewiseListAssetsFilterTopLevel);
        }
        return @(AWSIotsitewiseListAssetsFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewiseListAssetsFilterAll:
                return @"ALL";
            case AWSIotsitewiseListAssetsFilterTopLevel:
                return @"TOP_LEVEL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIotsitewiseListAssetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetSummaries" : @"assetSummaries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)assetSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseAssetSummary class]];
}

@end

@implementation AWSIotsitewiseListAssociatedAssetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"hierarchyId" : @"hierarchyId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIotsitewiseListAssociatedAssetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetSummaries" : @"assetSummaries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)assetSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseAssociatedAssetsSummary class]];
}

@end

@implementation AWSIotsitewiseListDashboardsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"projectId" : @"projectId",
             };
}

@end

@implementation AWSIotsitewiseListDashboardsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashboardSummaries" : @"dashboardSummaries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)dashboardSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseDashboardSummary class]];
}

@end

@implementation AWSIotsitewiseListGatewaysRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIotsitewiseListGatewaysResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewaySummaries" : @"gatewaySummaries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)gatewaySummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseGatewaySummary class]];
}

@end

@implementation AWSIotsitewiseListPortalsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIotsitewiseListPortalsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"portalSummaries" : @"portalSummaries",
             };
}

+ (NSValueTransformer *)portalSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewisePortalSummary class]];
}

@end

@implementation AWSIotsitewiseListProjectAssetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"projectId" : @"projectId",
             };
}

@end

@implementation AWSIotsitewiseListProjectAssetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetIds" : @"assetIds",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSIotsitewiseListProjectsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"portalId" : @"portalId",
             };
}

@end

@implementation AWSIotsitewiseListProjectsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"projectSummaries" : @"projectSummaries",
             };
}

+ (NSValueTransformer *)projectSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseProjectSummary class]];
}

@end

@implementation AWSIotsitewiseListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSIotsitewiseListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             };
}

@end

@implementation AWSIotsitewiseLoggingOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"level" : @"level",
             };
}

+ (NSValueTransformer *)levelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSIotsitewiseLoggingLevelError);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSIotsitewiseLoggingLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSIotsitewiseLoggingLevelOff);
        }
        return @(AWSIotsitewiseLoggingLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewiseLoggingLevelError:
                return @"ERROR";
            case AWSIotsitewiseLoggingLevelInfo:
                return @"INFO";
            case AWSIotsitewiseLoggingLevelOff:
                return @"OFF";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIotsitewiseMeasurement

@end

@implementation AWSIotsitewiseMetric

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expression" : @"expression",
             @"variables" : @"variables",
             @"window" : @"window",
             };
}

+ (NSValueTransformer *)variablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseExpressionVariable class]];
}

+ (NSValueTransformer *)windowJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseMetricWindow class]];
}

@end

@implementation AWSIotsitewiseMetricWindow

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tumbling" : @"tumbling",
             };
}

+ (NSValueTransformer *)tumblingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseTumblingWindow class]];
}

@end

@implementation AWSIotsitewiseMonitorErrorDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"code",
             @"message" : @"message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERNAL_FAILURE"] == NSOrderedSame) {
            return @(AWSIotsitewiseMonitorErrorCodeInternalFailure);
        }
        return @(AWSIotsitewiseMonitorErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewiseMonitorErrorCodeInternalFailure:
                return @"INTERNAL_FAILURE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIotsitewisePortalResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"id",
             };
}

@end

@implementation AWSIotsitewisePortalStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"error" : @"error",
             @"state" : @"state",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseMonitorErrorDetails class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSIotsitewisePortalStateCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSIotsitewisePortalStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSIotsitewisePortalStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSIotsitewisePortalStateActive);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSIotsitewisePortalStateFailed);
        }
        return @(AWSIotsitewisePortalStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewisePortalStateCreating:
                return @"CREATING";
            case AWSIotsitewisePortalStateUpdating:
                return @"UPDATING";
            case AWSIotsitewisePortalStateDeleting:
                return @"DELETING";
            case AWSIotsitewisePortalStateActive:
                return @"ACTIVE";
            case AWSIotsitewisePortalStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIotsitewisePortalSummary

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

@implementation AWSIotsitewiseProjectResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"id",
             };
}

@end

@implementation AWSIotsitewiseProjectSummary

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

@implementation AWSIotsitewiseProperty

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
            return @(AWSIotsitewisePropertyDataTypeString);
        }
        if ([value caseInsensitiveCompare:@"INTEGER"] == NSOrderedSame) {
            return @(AWSIotsitewisePropertyDataTypeInteger);
        }
        if ([value caseInsensitiveCompare:@"DOUBLE"] == NSOrderedSame) {
            return @(AWSIotsitewisePropertyDataTypeDouble);
        }
        if ([value caseInsensitiveCompare:@"BOOLEAN"] == NSOrderedSame) {
            return @(AWSIotsitewisePropertyDataTypeBoolean);
        }
        return @(AWSIotsitewisePropertyDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewisePropertyDataTypeString:
                return @"STRING";
            case AWSIotsitewisePropertyDataTypeInteger:
                return @"INTEGER";
            case AWSIotsitewisePropertyDataTypeDouble:
                return @"DOUBLE";
            case AWSIotsitewisePropertyDataTypeBoolean:
                return @"BOOLEAN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewisePropertyNotification class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewisePropertyType class]];
}

@end

@implementation AWSIotsitewisePropertyNotification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"state" : @"state",
             @"topic" : @"topic",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSIotsitewisePropertyNotificationStateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSIotsitewisePropertyNotificationStateDisabled);
        }
        return @(AWSIotsitewisePropertyNotificationStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewisePropertyNotificationStateEnabled:
                return @"ENABLED";
            case AWSIotsitewisePropertyNotificationStateDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIotsitewisePropertyType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attribute" : @"attribute",
             @"measurement" : @"measurement",
             @"metric" : @"metric",
             @"transform" : @"transform",
             };
}

+ (NSValueTransformer *)attributeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseAttribute class]];
}

+ (NSValueTransformer *)measurementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseMeasurement class]];
}

+ (NSValueTransformer *)metricJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseMetric class]];
}

+ (NSValueTransformer *)transformJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseTransform class]];
}

@end

@implementation AWSIotsitewisePutAssetPropertyValueEntry

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseAssetPropertyValue class]];
}

@end

@implementation AWSIotsitewisePutLoggingOptionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loggingOptions" : @"loggingOptions",
             };
}

+ (NSValueTransformer *)loggingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseLoggingOptions class]];
}

@end

@implementation AWSIotsitewisePutLoggingOptionsResponse

@end

@implementation AWSIotsitewiseResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"portal" : @"portal",
             @"project" : @"project",
             };
}

+ (NSValueTransformer *)portalJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewisePortalResource class]];
}

+ (NSValueTransformer *)projectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseProjectResource class]];
}

@end

@implementation AWSIotsitewiseTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSIotsitewiseTagResourceResponse

@end

@implementation AWSIotsitewiseTimeInNanos

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"offsetInNanos" : @"offsetInNanos",
             @"timeInSeconds" : @"timeInSeconds",
             };
}

@end

@implementation AWSIotsitewiseTransform

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expression" : @"expression",
             @"variables" : @"variables",
             };
}

+ (NSValueTransformer *)variablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseExpressionVariable class]];
}

@end

@implementation AWSIotsitewiseTumblingWindow

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"interval" : @"interval",
             };
}

@end

@implementation AWSIotsitewiseUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSIotsitewiseUntagResourceResponse

@end

@implementation AWSIotsitewiseUpdateAccessPolicyRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseIdentity class]];
}

+ (NSValueTransformer *)accessPolicyPermissionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADMINISTRATOR"] == NSOrderedSame) {
            return @(AWSIotsitewisePermissionAdministrator);
        }
        if ([value caseInsensitiveCompare:@"VIEWER"] == NSOrderedSame) {
            return @(AWSIotsitewisePermissionViewer);
        }
        return @(AWSIotsitewisePermissionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewisePermissionAdministrator:
                return @"ADMINISTRATOR";
            case AWSIotsitewisePermissionViewer:
                return @"VIEWER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)accessPolicyResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseResource class]];
}

@end

@implementation AWSIotsitewiseUpdateAccessPolicyResponse

@end

@implementation AWSIotsitewiseUpdateAssetModelRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseAssetModelHierarchy class]];
}

+ (NSValueTransformer *)assetModelPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSIotsitewiseAssetModelProperty class]];
}

@end

@implementation AWSIotsitewiseUpdateAssetModelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetModelStatus" : @"assetModelStatus",
             };
}

+ (NSValueTransformer *)assetModelStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseAssetModelStatus class]];
}

@end

@implementation AWSIotsitewiseUpdateAssetPropertyRequest

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
            return @(AWSIotsitewisePropertyNotificationStateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSIotsitewisePropertyNotificationStateDisabled);
        }
        return @(AWSIotsitewisePropertyNotificationStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewisePropertyNotificationStateEnabled:
                return @"ENABLED";
            case AWSIotsitewisePropertyNotificationStateDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIotsitewiseUpdateAssetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetId" : @"assetId",
             @"assetName" : @"assetName",
             @"clientToken" : @"clientToken",
             };
}

@end

@implementation AWSIotsitewiseUpdateAssetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assetStatus" : @"assetStatus",
             };
}

+ (NSValueTransformer *)assetStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseAssetStatus class]];
}

@end

@implementation AWSIotsitewiseUpdateDashboardRequest

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

@implementation AWSIotsitewiseUpdateDashboardResponse

@end

@implementation AWSIotsitewiseUpdateGatewayCapabilityConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capabilityConfiguration" : @"capabilityConfiguration",
             @"capabilityNamespace" : @"capabilityNamespace",
             @"gatewayId" : @"gatewayId",
             };
}

@end

@implementation AWSIotsitewiseUpdateGatewayCapabilityConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capabilityNamespace" : @"capabilityNamespace",
             @"capabilitySyncStatus" : @"capabilitySyncStatus",
             };
}

+ (NSValueTransformer *)capabilitySyncStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_SYNC"] == NSOrderedSame) {
            return @(AWSIotsitewiseCapabilitySyncStatusInSync);
        }
        if ([value caseInsensitiveCompare:@"OUT_OF_SYNC"] == NSOrderedSame) {
            return @(AWSIotsitewiseCapabilitySyncStatusOutOfSync);
        }
        if ([value caseInsensitiveCompare:@"SYNC_FAILED"] == NSOrderedSame) {
            return @(AWSIotsitewiseCapabilitySyncStatusSyncFailed);
        }
        return @(AWSIotsitewiseCapabilitySyncStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSIotsitewiseCapabilitySyncStatusInSync:
                return @"IN_SYNC";
            case AWSIotsitewiseCapabilitySyncStatusOutOfSync:
                return @"OUT_OF_SYNC";
            case AWSIotsitewiseCapabilitySyncStatusSyncFailed:
                return @"SYNC_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSIotsitewiseUpdateGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayId" : @"gatewayId",
             @"gatewayName" : @"gatewayName",
             };
}

@end

@implementation AWSIotsitewiseUpdatePortalRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"portalContactEmail" : @"portalContactEmail",
             @"portalDescription" : @"portalDescription",
             @"portalId" : @"portalId",
             @"portalLogoImage" : @"portalLogoImage",
             @"portalName" : @"portalName",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)portalLogoImageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewiseImage class]];
}

@end

@implementation AWSIotsitewiseUpdatePortalResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"portalStatus" : @"portalStatus",
             };
}

+ (NSValueTransformer *)portalStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSIotsitewisePortalStatus class]];
}

@end

@implementation AWSIotsitewiseUpdateProjectRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"projectDescription" : @"projectDescription",
             @"projectId" : @"projectId",
             @"projectName" : @"projectName",
             };
}

@end

@implementation AWSIotsitewiseUpdateProjectResponse

@end

@implementation AWSIotsitewiseUserIdentity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"id",
             };
}

@end

@implementation AWSIotsitewiseVariableValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hierarchyId" : @"hierarchyId",
             @"propertyId" : @"propertyId",
             };
}

@end

@implementation AWSIotsitewiseVariant

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"booleanValueProperty" : @"booleanValue",
             @"doubleValueProperty" : @"doubleValue",
             @"integerValueProperty" : @"integerValue",
             @"stringValueProperty" : @"stringValue",
             };
}

@end
