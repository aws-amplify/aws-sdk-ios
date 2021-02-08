//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSLocationModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSLocationErrorDomain = @"com.amazonaws.AWSLocationErrorDomain";

@implementation AWSLocationAssociateTrackerConsumerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consumerArn" : @"ConsumerArn",
             @"trackerName" : @"TrackerName",
             };
}

@end

@implementation AWSLocationAssociateTrackerConsumerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSLocationBatchDeleteGeofenceError

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"error" : @"Error",
             @"geofenceId" : @"GeofenceId",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationBatchItemError class]];
}

@end

@implementation AWSLocationBatchDeleteGeofenceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionName" : @"CollectionName",
             @"geofenceIds" : @"GeofenceIds",
             };
}

@end

@implementation AWSLocationBatchDeleteGeofenceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationBatchDeleteGeofenceError class]];
}

@end

@implementation AWSLocationBatchEvaluateGeofencesError

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceId" : @"DeviceId",
             @"error" : @"Error",
             @"sampleTime" : @"SampleTime",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationBatchItemError class]];
}

+ (NSValueTransformer *)sampleTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationBatchEvaluateGeofencesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionName" : @"CollectionName",
             @"devicePositionUpdates" : @"DevicePositionUpdates",
             };
}

+ (NSValueTransformer *)devicePositionUpdatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationDevicePositionUpdate class]];
}

@end

@implementation AWSLocationBatchEvaluateGeofencesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationBatchEvaluateGeofencesError class]];
}

@end

@implementation AWSLocationBatchGetDevicePositionError

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceId" : @"DeviceId",
             @"error" : @"Error",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationBatchItemError class]];
}

@end

@implementation AWSLocationBatchGetDevicePositionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceIds" : @"DeviceIds",
             @"trackerName" : @"TrackerName",
             };
}

@end

@implementation AWSLocationBatchGetDevicePositionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"devicePositions" : @"DevicePositions",
             @"errors" : @"Errors",
             };
}

+ (NSValueTransformer *)devicePositionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationDevicePosition class]];
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationBatchGetDevicePositionError class]];
}

@end

@implementation AWSLocationBatchItemError

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AccessDeniedError"] == NSOrderedSame) {
            return @(AWSLocationBatchItemErrorCodeAccessDeniedError);
        }
        if ([value caseInsensitiveCompare:@"ConflictError"] == NSOrderedSame) {
            return @(AWSLocationBatchItemErrorCodeConflictError);
        }
        if ([value caseInsensitiveCompare:@"InternalServerError"] == NSOrderedSame) {
            return @(AWSLocationBatchItemErrorCodeInternalServerError);
        }
        if ([value caseInsensitiveCompare:@"ResourceNotFoundError"] == NSOrderedSame) {
            return @(AWSLocationBatchItemErrorCodeResourceNotFoundError);
        }
        if ([value caseInsensitiveCompare:@"ThrottlingError"] == NSOrderedSame) {
            return @(AWSLocationBatchItemErrorCodeThrottlingError);
        }
        if ([value caseInsensitiveCompare:@"ValidationError"] == NSOrderedSame) {
            return @(AWSLocationBatchItemErrorCodeValidationError);
        }
        return @(AWSLocationBatchItemErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationBatchItemErrorCodeAccessDeniedError:
                return @"AccessDeniedError";
            case AWSLocationBatchItemErrorCodeConflictError:
                return @"ConflictError";
            case AWSLocationBatchItemErrorCodeInternalServerError:
                return @"InternalServerError";
            case AWSLocationBatchItemErrorCodeResourceNotFoundError:
                return @"ResourceNotFoundError";
            case AWSLocationBatchItemErrorCodeThrottlingError:
                return @"ThrottlingError";
            case AWSLocationBatchItemErrorCodeValidationError:
                return @"ValidationError";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLocationBatchPutGeofenceError

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"error" : @"Error",
             @"geofenceId" : @"GeofenceId",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationBatchItemError class]];
}

@end

@implementation AWSLocationBatchPutGeofenceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionName" : @"CollectionName",
             @"entries" : @"Entries",
             };
}

+ (NSValueTransformer *)entriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationBatchPutGeofenceRequestEntry class]];
}

@end

@implementation AWSLocationBatchPutGeofenceRequestEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"geofenceId" : @"GeofenceId",
             @"geometry" : @"Geometry",
             };
}

+ (NSValueTransformer *)geometryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationGeofenceGeometry class]];
}

@end

@implementation AWSLocationBatchPutGeofenceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             @"successes" : @"Successes",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationBatchPutGeofenceError class]];
}

+ (NSValueTransformer *)successesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationBatchPutGeofenceSuccess class]];
}

@end

@implementation AWSLocationBatchPutGeofenceSuccess

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"geofenceId" : @"GeofenceId",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationBatchUpdateDevicePositionError

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceId" : @"DeviceId",
             @"error" : @"Error",
             @"sampleTime" : @"SampleTime",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationBatchItemError class]];
}

+ (NSValueTransformer *)sampleTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationBatchUpdateDevicePositionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trackerName" : @"TrackerName",
             @"updates" : @"Updates",
             };
}

+ (NSValueTransformer *)updatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationDevicePositionUpdate class]];
}

@end

@implementation AWSLocationBatchUpdateDevicePositionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationBatchUpdateDevicePositionError class]];
}

@end

@implementation AWSLocationCreateGeofenceCollectionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionName" : @"CollectionName",
             @"detail" : @"Description",
             @"pricingPlan" : @"PricingPlan",
             };
}

+ (NSValueTransformer *)pricingPlanJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RequestBasedUsage"] == NSOrderedSame) {
            return @(AWSLocationPricingPlanRequestBasedUsage);
        }
        if ([value caseInsensitiveCompare:@"MobileAssetTracking"] == NSOrderedSame) {
            return @(AWSLocationPricingPlanMobileAssetTracking);
        }
        if ([value caseInsensitiveCompare:@"MobileAssetManagement"] == NSOrderedSame) {
            return @(AWSLocationPricingPlanMobileAssetManagement);
        }
        return @(AWSLocationPricingPlanUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationPricingPlanRequestBasedUsage:
                return @"RequestBasedUsage";
            case AWSLocationPricingPlanMobileAssetTracking:
                return @"MobileAssetTracking";
            case AWSLocationPricingPlanMobileAssetManagement:
                return @"MobileAssetManagement";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLocationCreateGeofenceCollectionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionArn" : @"CollectionArn",
             @"collectionName" : @"CollectionName",
             @"createTime" : @"CreateTime",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationCreateMapRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configuration" : @"Configuration",
             @"detail" : @"Description",
             @"mapName" : @"MapName",
             @"pricingPlan" : @"PricingPlan",
             };
}

+ (NSValueTransformer *)configurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationMapConfiguration class]];
}

+ (NSValueTransformer *)pricingPlanJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RequestBasedUsage"] == NSOrderedSame) {
            return @(AWSLocationPricingPlanRequestBasedUsage);
        }
        if ([value caseInsensitiveCompare:@"MobileAssetTracking"] == NSOrderedSame) {
            return @(AWSLocationPricingPlanMobileAssetTracking);
        }
        if ([value caseInsensitiveCompare:@"MobileAssetManagement"] == NSOrderedSame) {
            return @(AWSLocationPricingPlanMobileAssetManagement);
        }
        return @(AWSLocationPricingPlanUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationPricingPlanRequestBasedUsage:
                return @"RequestBasedUsage";
            case AWSLocationPricingPlanMobileAssetTracking:
                return @"MobileAssetTracking";
            case AWSLocationPricingPlanMobileAssetManagement:
                return @"MobileAssetManagement";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLocationCreateMapResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"mapArn" : @"MapArn",
             @"mapName" : @"MapName",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationCreatePlaceIndexRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSource" : @"DataSource",
             @"dataSourceConfiguration" : @"DataSourceConfiguration",
             @"detail" : @"Description",
             @"indexName" : @"IndexName",
             @"pricingPlan" : @"PricingPlan",
             };
}

+ (NSValueTransformer *)dataSourceConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationDataSourceConfiguration class]];
}

+ (NSValueTransformer *)pricingPlanJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RequestBasedUsage"] == NSOrderedSame) {
            return @(AWSLocationPricingPlanRequestBasedUsage);
        }
        if ([value caseInsensitiveCompare:@"MobileAssetTracking"] == NSOrderedSame) {
            return @(AWSLocationPricingPlanMobileAssetTracking);
        }
        if ([value caseInsensitiveCompare:@"MobileAssetManagement"] == NSOrderedSame) {
            return @(AWSLocationPricingPlanMobileAssetManagement);
        }
        return @(AWSLocationPricingPlanUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationPricingPlanRequestBasedUsage:
                return @"RequestBasedUsage";
            case AWSLocationPricingPlanMobileAssetTracking:
                return @"MobileAssetTracking";
            case AWSLocationPricingPlanMobileAssetManagement:
                return @"MobileAssetManagement";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLocationCreatePlaceIndexResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"indexArn" : @"IndexArn",
             @"indexName" : @"IndexName",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationCreateTrackerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"pricingPlan" : @"PricingPlan",
             @"trackerName" : @"TrackerName",
             };
}

+ (NSValueTransformer *)pricingPlanJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RequestBasedUsage"] == NSOrderedSame) {
            return @(AWSLocationPricingPlanRequestBasedUsage);
        }
        if ([value caseInsensitiveCompare:@"MobileAssetTracking"] == NSOrderedSame) {
            return @(AWSLocationPricingPlanMobileAssetTracking);
        }
        if ([value caseInsensitiveCompare:@"MobileAssetManagement"] == NSOrderedSame) {
            return @(AWSLocationPricingPlanMobileAssetManagement);
        }
        return @(AWSLocationPricingPlanUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationPricingPlanRequestBasedUsage:
                return @"RequestBasedUsage";
            case AWSLocationPricingPlanMobileAssetTracking:
                return @"MobileAssetTracking";
            case AWSLocationPricingPlanMobileAssetManagement:
                return @"MobileAssetManagement";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLocationCreateTrackerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"trackerArn" : @"TrackerArn",
             @"trackerName" : @"TrackerName",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationDataSourceConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"intendedUse" : @"IntendedUse",
             };
}

+ (NSValueTransformer *)intendedUseJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SingleUse"] == NSOrderedSame) {
            return @(AWSLocationIntendedUseSingleUse);
        }
        if ([value caseInsensitiveCompare:@"Storage"] == NSOrderedSame) {
            return @(AWSLocationIntendedUseStorage);
        }
        return @(AWSLocationIntendedUseUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationIntendedUseSingleUse:
                return @"SingleUse";
            case AWSLocationIntendedUseStorage:
                return @"Storage";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLocationDeleteGeofenceCollectionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionName" : @"CollectionName",
             };
}

@end

@implementation AWSLocationDeleteGeofenceCollectionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSLocationDeleteMapRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mapName" : @"MapName",
             };
}

@end

@implementation AWSLocationDeleteMapResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSLocationDeletePlaceIndexRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             };
}

@end

@implementation AWSLocationDeletePlaceIndexResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSLocationDeleteTrackerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trackerName" : @"TrackerName",
             };
}

@end

@implementation AWSLocationDeleteTrackerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSLocationDescribeGeofenceCollectionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionName" : @"CollectionName",
             };
}

@end

@implementation AWSLocationDescribeGeofenceCollectionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionArn" : @"CollectionArn",
             @"collectionName" : @"CollectionName",
             @"createTime" : @"CreateTime",
             @"detail" : @"Description",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationDescribeMapRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mapName" : @"MapName",
             };
}

@end

@implementation AWSLocationDescribeMapResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configuration" : @"Configuration",
             @"createTime" : @"CreateTime",
             @"dataSource" : @"DataSource",
             @"detail" : @"Description",
             @"mapArn" : @"MapArn",
             @"mapName" : @"MapName",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)configurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationMapConfiguration class]];
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationDescribePlaceIndexRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             };
}

@end

@implementation AWSLocationDescribePlaceIndexResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"dataSource" : @"DataSource",
             @"dataSourceConfiguration" : @"DataSourceConfiguration",
             @"detail" : @"Description",
             @"indexArn" : @"IndexArn",
             @"indexName" : @"IndexName",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)dataSourceConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationDataSourceConfiguration class]];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationDescribeTrackerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trackerName" : @"TrackerName",
             };
}

@end

@implementation AWSLocationDescribeTrackerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"detail" : @"Description",
             @"trackerArn" : @"TrackerArn",
             @"trackerName" : @"TrackerName",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationDevicePosition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceId" : @"DeviceId",
             @"position" : @"Position",
             @"receivedTime" : @"ReceivedTime",
             @"sampleTime" : @"SampleTime",
             };
}

+ (NSValueTransformer *)receivedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sampleTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationDevicePositionUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceId" : @"DeviceId",
             @"position" : @"Position",
             @"sampleTime" : @"SampleTime",
             };
}

+ (NSValueTransformer *)sampleTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationDisassociateTrackerConsumerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consumerArn" : @"ConsumerArn",
             @"trackerName" : @"TrackerName",
             };
}

@end

@implementation AWSLocationDisassociateTrackerConsumerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSLocationGeofenceGeometry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"polygon" : @"Polygon",
             };
}

@end

@implementation AWSLocationGetDevicePositionHistoryRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceId" : @"DeviceId",
             @"endTimeExclusive" : @"EndTimeExclusive",
             @"nextToken" : @"NextToken",
             @"startTimeInclusive" : @"StartTimeInclusive",
             @"trackerName" : @"TrackerName",
             };
}

+ (NSValueTransformer *)endTimeExclusiveJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimeInclusiveJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationGetDevicePositionHistoryResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"devicePositions" : @"DevicePositions",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)devicePositionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationDevicePosition class]];
}

@end

@implementation AWSLocationGetDevicePositionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceId" : @"DeviceId",
             @"trackerName" : @"TrackerName",
             };
}

@end

@implementation AWSLocationGetDevicePositionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceId" : @"DeviceId",
             @"position" : @"Position",
             @"receivedTime" : @"ReceivedTime",
             @"sampleTime" : @"SampleTime",
             };
}

+ (NSValueTransformer *)receivedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sampleTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationGetGeofenceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionName" : @"CollectionName",
             @"geofenceId" : @"GeofenceId",
             };
}

@end

@implementation AWSLocationGetGeofenceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"geofenceId" : @"GeofenceId",
             @"geometry" : @"Geometry",
             @"status" : @"Status",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)geometryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationGeofenceGeometry class]];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationGetMapGlyphsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fontStack" : @"FontStack",
             @"fontUnicodeRange" : @"FontUnicodeRange",
             @"mapName" : @"MapName",
             };
}

@end

@implementation AWSLocationGetMapGlyphsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blob" : @"Blob",
             @"contentType" : @"ContentType",
             };
}

@end

@implementation AWSLocationGetMapSpritesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileName" : @"FileName",
             @"mapName" : @"MapName",
             };
}

@end

@implementation AWSLocationGetMapSpritesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blob" : @"Blob",
             @"contentType" : @"ContentType",
             };
}

@end

@implementation AWSLocationGetMapStyleDescriptorRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mapName" : @"MapName",
             };
}

@end

@implementation AWSLocationGetMapStyleDescriptorResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blob" : @"Blob",
             @"contentType" : @"ContentType",
             };
}

@end

@implementation AWSLocationGetMapTileRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mapName" : @"MapName",
             @"X" : @"X",
             @"Y" : @"Y",
             @"Z" : @"Z",
             };
}

@end

@implementation AWSLocationGetMapTileResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blob" : @"Blob",
             @"contentType" : @"ContentType",
             };
}

@end

@implementation AWSLocationListGeofenceCollectionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSLocationListGeofenceCollectionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entries" : @"Entries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)entriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationListGeofenceCollectionsResponseEntry class]];
}

@end

@implementation AWSLocationListGeofenceCollectionsResponseEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionName" : @"CollectionName",
             @"createTime" : @"CreateTime",
             @"detail" : @"Description",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationListGeofenceResponseEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"geofenceId" : @"GeofenceId",
             @"geometry" : @"Geometry",
             @"status" : @"Status",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)geometryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationGeofenceGeometry class]];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationListGeofencesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionName" : @"CollectionName",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSLocationListGeofencesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entries" : @"Entries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)entriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationListGeofenceResponseEntry class]];
}

@end

@implementation AWSLocationListMapsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSLocationListMapsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entries" : @"Entries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)entriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationListMapsResponseEntry class]];
}

@end

@implementation AWSLocationListMapsResponseEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"dataSource" : @"DataSource",
             @"detail" : @"Description",
             @"mapName" : @"MapName",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationListPlaceIndexesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSLocationListPlaceIndexesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entries" : @"Entries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)entriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationListPlaceIndexesResponseEntry class]];
}

@end

@implementation AWSLocationListPlaceIndexesResponseEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"dataSource" : @"DataSource",
             @"detail" : @"Description",
             @"indexName" : @"IndexName",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationListTrackerConsumersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"trackerName" : @"TrackerName",
             };
}

@end

@implementation AWSLocationListTrackerConsumersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consumerArns" : @"ConsumerArns",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSLocationListTrackersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSLocationListTrackersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entries" : @"Entries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)entriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationListTrackersResponseEntry class]];
}

@end

@implementation AWSLocationListTrackersResponseEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"detail" : @"Description",
             @"trackerName" : @"TrackerName",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationMapConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"style" : @"Style",
             };
}

@end

@implementation AWSLocationPlace

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressNumber" : @"AddressNumber",
             @"country" : @"Country",
             @"geometry" : @"Geometry",
             @"label" : @"Label",
             @"municipality" : @"Municipality",
             @"neighborhood" : @"Neighborhood",
             @"postalCode" : @"PostalCode",
             @"region" : @"Region",
             @"street" : @"Street",
             @"subRegion" : @"SubRegion",
             };
}

+ (NSValueTransformer *)geometryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationPlaceGeometry class]];
}

@end

@implementation AWSLocationPlaceGeometry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"point" : @"Point",
             };
}

@end

@implementation AWSLocationPutGeofenceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionName" : @"CollectionName",
             @"geofenceId" : @"GeofenceId",
             @"geometry" : @"Geometry",
             };
}

+ (NSValueTransformer *)geometryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationGeofenceGeometry class]];
}

@end

@implementation AWSLocationPutGeofenceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"geofenceId" : @"GeofenceId",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationSearchForPositionResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"place" : @"Place",
             };
}

+ (NSValueTransformer *)placeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationPlace class]];
}

@end

@implementation AWSLocationSearchForTextResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"place" : @"Place",
             };
}

+ (NSValueTransformer *)placeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationPlace class]];
}

@end

@implementation AWSLocationSearchPlaceIndexForPositionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"maxResults" : @"MaxResults",
             @"position" : @"Position",
             };
}

@end

@implementation AWSLocationSearchPlaceIndexForPositionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"results" : @"Results",
             @"summary" : @"Summary",
             };
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationSearchForPositionResult class]];
}

+ (NSValueTransformer *)summaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationSearchPlaceIndexForPositionSummary class]];
}

@end

@implementation AWSLocationSearchPlaceIndexForPositionSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSource" : @"DataSource",
             @"maxResults" : @"MaxResults",
             @"position" : @"Position",
             };
}

@end

@implementation AWSLocationSearchPlaceIndexForTextRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"biasPosition" : @"BiasPosition",
             @"filterBBox" : @"FilterBBox",
             @"filterCountries" : @"FilterCountries",
             @"indexName" : @"IndexName",
             @"maxResults" : @"MaxResults",
             @"text" : @"Text",
             };
}

@end

@implementation AWSLocationSearchPlaceIndexForTextResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"results" : @"Results",
             @"summary" : @"Summary",
             };
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationSearchForTextResult class]];
}

+ (NSValueTransformer *)summaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationSearchPlaceIndexForTextSummary class]];
}

@end

@implementation AWSLocationSearchPlaceIndexForTextSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"biasPosition" : @"BiasPosition",
             @"dataSource" : @"DataSource",
             @"filterBBox" : @"FilterBBox",
             @"filterCountries" : @"FilterCountries",
             @"maxResults" : @"MaxResults",
             @"resultBBox" : @"ResultBBox",
             @"text" : @"Text",
             };
}

@end

@implementation AWSLocationValidationExceptionField

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"name" : @"Name",
             };
}

@end
