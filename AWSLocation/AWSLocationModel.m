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

#import "AWSLocationModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSLocationErrorDomain = @"com.amazonaws.AWSLocationErrorDomain";

@implementation AWSLocationApiKeyFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyStatus" : @"KeyStatus",
             };
}

+ (NSValueTransformer *)keyStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSLocationStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Expired"] == NSOrderedSame) {
            return @(AWSLocationStatusExpired);
        }
        return @(AWSLocationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationStatusActive:
                return @"Active";
            case AWSLocationStatusExpired:
                return @"Expired";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLocationApiKeyRestrictions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowActions" : @"AllowActions",
             @"allowReferers" : @"AllowReferers",
             @"allowResources" : @"AllowResources",
             };
}

@end

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

@implementation AWSLocationBatchDeleteDevicePositionHistoryError

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

@implementation AWSLocationBatchDeleteDevicePositionHistoryRequest

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

@implementation AWSLocationBatchDeleteDevicePositionHistoryResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationBatchDeleteDevicePositionHistoryError class]];
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
             @"geofenceProperties" : @"GeofenceProperties",
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

@implementation AWSLocationCalculateRouteCarModeOptions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"avoidFerries" : @"AvoidFerries",
             @"avoidTolls" : @"AvoidTolls",
             };
}

@end

@implementation AWSLocationCalculateRouteMatrixRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"calculatorName" : @"CalculatorName",
             @"carModeOptions" : @"CarModeOptions",
             @"departNow" : @"DepartNow",
             @"departurePositions" : @"DeparturePositions",
             @"departureTime" : @"DepartureTime",
             @"destinationPositions" : @"DestinationPositions",
             @"distanceUnit" : @"DistanceUnit",
             @"key" : @"Key",
             @"travelMode" : @"TravelMode",
             @"truckModeOptions" : @"TruckModeOptions",
             };
}

+ (NSValueTransformer *)carModeOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationCalculateRouteCarModeOptions class]];
}

+ (NSValueTransformer *)departureTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)distanceUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Kilometers"] == NSOrderedSame) {
            return @(AWSLocationDistanceUnitKilometers);
        }
        if ([value caseInsensitiveCompare:@"Miles"] == NSOrderedSame) {
            return @(AWSLocationDistanceUnitMiles);
        }
        return @(AWSLocationDistanceUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationDistanceUnitKilometers:
                return @"Kilometers";
            case AWSLocationDistanceUnitMiles:
                return @"Miles";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)travelModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Car"] == NSOrderedSame) {
            return @(AWSLocationTravelModeCar);
        }
        if ([value caseInsensitiveCompare:@"Truck"] == NSOrderedSame) {
            return @(AWSLocationTravelModeTruck);
        }
        if ([value caseInsensitiveCompare:@"Walking"] == NSOrderedSame) {
            return @(AWSLocationTravelModeWalking);
        }
        if ([value caseInsensitiveCompare:@"Bicycle"] == NSOrderedSame) {
            return @(AWSLocationTravelModeBicycle);
        }
        if ([value caseInsensitiveCompare:@"Motorcycle"] == NSOrderedSame) {
            return @(AWSLocationTravelModeMotorcycle);
        }
        return @(AWSLocationTravelModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationTravelModeCar:
                return @"Car";
            case AWSLocationTravelModeTruck:
                return @"Truck";
            case AWSLocationTravelModeWalking:
                return @"Walking";
            case AWSLocationTravelModeBicycle:
                return @"Bicycle";
            case AWSLocationTravelModeMotorcycle:
                return @"Motorcycle";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)truckModeOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationCalculateRouteTruckModeOptions class]];
}

@end

@implementation AWSLocationCalculateRouteMatrixResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"routeMatrix" : @"RouteMatrix",
             @"snappedDeparturePositions" : @"SnappedDeparturePositions",
             @"snappedDestinationPositions" : @"SnappedDestinationPositions",
             @"summary" : @"Summary",
             };
}

+ (NSValueTransformer *)summaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationCalculateRouteMatrixSummary class]];
}

@end

@implementation AWSLocationCalculateRouteMatrixSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSource" : @"DataSource",
             @"distanceUnit" : @"DistanceUnit",
             @"errorCount" : @"ErrorCount",
             @"routeCount" : @"RouteCount",
             };
}

+ (NSValueTransformer *)distanceUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Kilometers"] == NSOrderedSame) {
            return @(AWSLocationDistanceUnitKilometers);
        }
        if ([value caseInsensitiveCompare:@"Miles"] == NSOrderedSame) {
            return @(AWSLocationDistanceUnitMiles);
        }
        return @(AWSLocationDistanceUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationDistanceUnitKilometers:
                return @"Kilometers";
            case AWSLocationDistanceUnitMiles:
                return @"Miles";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLocationCalculateRouteRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arrivalTime" : @"ArrivalTime",
             @"calculatorName" : @"CalculatorName",
             @"carModeOptions" : @"CarModeOptions",
             @"departNow" : @"DepartNow",
             @"departurePosition" : @"DeparturePosition",
             @"departureTime" : @"DepartureTime",
             @"destinationPosition" : @"DestinationPosition",
             @"distanceUnit" : @"DistanceUnit",
             @"includeLegGeometry" : @"IncludeLegGeometry",
             @"key" : @"Key",
             @"optimizeFor" : @"OptimizeFor",
             @"travelMode" : @"TravelMode",
             @"truckModeOptions" : @"TruckModeOptions",
             @"waypointPositions" : @"WaypointPositions",
             };
}

+ (NSValueTransformer *)arrivalTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)carModeOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationCalculateRouteCarModeOptions class]];
}

+ (NSValueTransformer *)departureTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)distanceUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Kilometers"] == NSOrderedSame) {
            return @(AWSLocationDistanceUnitKilometers);
        }
        if ([value caseInsensitiveCompare:@"Miles"] == NSOrderedSame) {
            return @(AWSLocationDistanceUnitMiles);
        }
        return @(AWSLocationDistanceUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationDistanceUnitKilometers:
                return @"Kilometers";
            case AWSLocationDistanceUnitMiles:
                return @"Miles";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)optimizeForJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FastestRoute"] == NSOrderedSame) {
            return @(AWSLocationOptimizationModeFastestRoute);
        }
        if ([value caseInsensitiveCompare:@"ShortestRoute"] == NSOrderedSame) {
            return @(AWSLocationOptimizationModeShortestRoute);
        }
        return @(AWSLocationOptimizationModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationOptimizationModeFastestRoute:
                return @"FastestRoute";
            case AWSLocationOptimizationModeShortestRoute:
                return @"ShortestRoute";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)travelModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Car"] == NSOrderedSame) {
            return @(AWSLocationTravelModeCar);
        }
        if ([value caseInsensitiveCompare:@"Truck"] == NSOrderedSame) {
            return @(AWSLocationTravelModeTruck);
        }
        if ([value caseInsensitiveCompare:@"Walking"] == NSOrderedSame) {
            return @(AWSLocationTravelModeWalking);
        }
        if ([value caseInsensitiveCompare:@"Bicycle"] == NSOrderedSame) {
            return @(AWSLocationTravelModeBicycle);
        }
        if ([value caseInsensitiveCompare:@"Motorcycle"] == NSOrderedSame) {
            return @(AWSLocationTravelModeMotorcycle);
        }
        return @(AWSLocationTravelModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationTravelModeCar:
                return @"Car";
            case AWSLocationTravelModeTruck:
                return @"Truck";
            case AWSLocationTravelModeWalking:
                return @"Walking";
            case AWSLocationTravelModeBicycle:
                return @"Bicycle";
            case AWSLocationTravelModeMotorcycle:
                return @"Motorcycle";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)truckModeOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationCalculateRouteTruckModeOptions class]];
}

@end

@implementation AWSLocationCalculateRouteResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"legs" : @"Legs",
             @"summary" : @"Summary",
             };
}

+ (NSValueTransformer *)legsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationLeg class]];
}

+ (NSValueTransformer *)summaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationCalculateRouteSummary class]];
}

@end

@implementation AWSLocationCalculateRouteSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSource" : @"DataSource",
             @"distance" : @"Distance",
             @"distanceUnit" : @"DistanceUnit",
             @"durationSeconds" : @"DurationSeconds",
             @"routeBBox" : @"RouteBBox",
             };
}

+ (NSValueTransformer *)distanceUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Kilometers"] == NSOrderedSame) {
            return @(AWSLocationDistanceUnitKilometers);
        }
        if ([value caseInsensitiveCompare:@"Miles"] == NSOrderedSame) {
            return @(AWSLocationDistanceUnitMiles);
        }
        return @(AWSLocationDistanceUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationDistanceUnitKilometers:
                return @"Kilometers";
            case AWSLocationDistanceUnitMiles:
                return @"Miles";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLocationCalculateRouteTruckModeOptions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"avoidFerries" : @"AvoidFerries",
             @"avoidTolls" : @"AvoidTolls",
             @"dimensions" : @"Dimensions",
             @"weight" : @"Weight",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationTruckDimensions class]];
}

+ (NSValueTransformer *)weightJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationTruckWeight class]];
}

@end

@implementation AWSLocationCellSignals

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lteCellDetails" : @"LteCellDetails",
             };
}

+ (NSValueTransformer *)lteCellDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationLteCellDetails class]];
}

@end

@implementation AWSLocationCircle

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"center" : @"Center",
             @"radius" : @"Radius",
             };
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
             @"kmsKeyId" : @"KmsKeyId",
             @"pricingPlan" : @"PricingPlan",
             @"pricingPlanDataSource" : @"PricingPlanDataSource",
             @"tags" : @"Tags",
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

@implementation AWSLocationCreateKeyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"expireTime" : @"ExpireTime",
             @"keyName" : @"KeyName",
             @"noExpiry" : @"NoExpiry",
             @"restrictions" : @"Restrictions",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)expireTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)restrictionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationApiKeyRestrictions class]];
}

@end

@implementation AWSLocationCreateKeyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"key" : @"Key",
             @"keyArn" : @"KeyArn",
             @"keyName" : @"KeyName",
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
             @"tags" : @"Tags",
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
             @"tags" : @"Tags",
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

@implementation AWSLocationCreateRouteCalculatorRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"calculatorName" : @"CalculatorName",
             @"dataSource" : @"DataSource",
             @"detail" : @"Description",
             @"pricingPlan" : @"PricingPlan",
             @"tags" : @"Tags",
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

@implementation AWSLocationCreateRouteCalculatorResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"calculatorArn" : @"CalculatorArn",
             @"calculatorName" : @"CalculatorName",
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

@implementation AWSLocationCreateTrackerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"eventBridgeEnabled" : @"EventBridgeEnabled",
             @"kmsKeyEnableGeospatialQueries" : @"KmsKeyEnableGeospatialQueries",
             @"kmsKeyId" : @"KmsKeyId",
             @"positionFiltering" : @"PositionFiltering",
             @"pricingPlan" : @"PricingPlan",
             @"pricingPlanDataSource" : @"PricingPlanDataSource",
             @"tags" : @"Tags",
             @"trackerName" : @"TrackerName",
             };
}

+ (NSValueTransformer *)positionFilteringJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TimeBased"] == NSOrderedSame) {
            return @(AWSLocationPositionFilteringTimeBased);
        }
        if ([value caseInsensitiveCompare:@"DistanceBased"] == NSOrderedSame) {
            return @(AWSLocationPositionFilteringDistanceBased);
        }
        if ([value caseInsensitiveCompare:@"AccuracyBased"] == NSOrderedSame) {
            return @(AWSLocationPositionFilteringAccuracyBased);
        }
        return @(AWSLocationPositionFilteringUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationPositionFilteringTimeBased:
                return @"TimeBased";
            case AWSLocationPositionFilteringDistanceBased:
                return @"DistanceBased";
            case AWSLocationPositionFilteringAccuracyBased:
                return @"AccuracyBased";
            default:
                return nil;
        }
    }];
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

@implementation AWSLocationDeleteKeyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"forceDelete" : @"ForceDelete",
             @"keyName" : @"KeyName",
             };
}

@end

@implementation AWSLocationDeleteKeyResponse

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

@implementation AWSLocationDeleteRouteCalculatorRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"calculatorName" : @"CalculatorName",
             };
}

@end

@implementation AWSLocationDeleteRouteCalculatorResponse

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
             @"geofenceCount" : @"GeofenceCount",
             @"kmsKeyId" : @"KmsKeyId",
             @"pricingPlan" : @"PricingPlan",
             @"pricingPlanDataSource" : @"PricingPlanDataSource",
             @"tags" : @"Tags",
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

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationDescribeKeyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyName" : @"KeyName",
             };
}

@end

@implementation AWSLocationDescribeKeyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"detail" : @"Description",
             @"expireTime" : @"ExpireTime",
             @"key" : @"Key",
             @"keyArn" : @"KeyArn",
             @"keyName" : @"KeyName",
             @"restrictions" : @"Restrictions",
             @"tags" : @"Tags",
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

+ (NSValueTransformer *)expireTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)restrictionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationApiKeyRestrictions class]];
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
             @"pricingPlan" : @"PricingPlan",
             @"tags" : @"Tags",
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
             @"pricingPlan" : @"PricingPlan",
             @"tags" : @"Tags",
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

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationDescribeRouteCalculatorRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"calculatorName" : @"CalculatorName",
             };
}

@end

@implementation AWSLocationDescribeRouteCalculatorResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"calculatorArn" : @"CalculatorArn",
             @"calculatorName" : @"CalculatorName",
             @"createTime" : @"CreateTime",
             @"dataSource" : @"DataSource",
             @"detail" : @"Description",
             @"pricingPlan" : @"PricingPlan",
             @"tags" : @"Tags",
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
             @"eventBridgeEnabled" : @"EventBridgeEnabled",
             @"kmsKeyEnableGeospatialQueries" : @"KmsKeyEnableGeospatialQueries",
             @"kmsKeyId" : @"KmsKeyId",
             @"positionFiltering" : @"PositionFiltering",
             @"pricingPlan" : @"PricingPlan",
             @"pricingPlanDataSource" : @"PricingPlanDataSource",
             @"tags" : @"Tags",
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

+ (NSValueTransformer *)positionFilteringJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TimeBased"] == NSOrderedSame) {
            return @(AWSLocationPositionFilteringTimeBased);
        }
        if ([value caseInsensitiveCompare:@"DistanceBased"] == NSOrderedSame) {
            return @(AWSLocationPositionFilteringDistanceBased);
        }
        if ([value caseInsensitiveCompare:@"AccuracyBased"] == NSOrderedSame) {
            return @(AWSLocationPositionFilteringAccuracyBased);
        }
        return @(AWSLocationPositionFilteringUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationPositionFilteringTimeBased:
                return @"TimeBased";
            case AWSLocationPositionFilteringDistanceBased:
                return @"DistanceBased";
            case AWSLocationPositionFilteringAccuracyBased:
                return @"AccuracyBased";
            default:
                return nil;
        }
    }];
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
             @"accuracy" : @"Accuracy",
             @"deviceId" : @"DeviceId",
             @"position" : @"Position",
             @"positionProperties" : @"PositionProperties",
             @"receivedTime" : @"ReceivedTime",
             @"sampleTime" : @"SampleTime",
             };
}

+ (NSValueTransformer *)accuracyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationPositionalAccuracy class]];
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
             @"accuracy" : @"Accuracy",
             @"deviceId" : @"DeviceId",
             @"position" : @"Position",
             @"positionProperties" : @"PositionProperties",
             @"sampleTime" : @"SampleTime",
             };
}

+ (NSValueTransformer *)accuracyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationPositionalAccuracy class]];
}

+ (NSValueTransformer *)sampleTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationDeviceState

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accuracy" : @"Accuracy",
             @"cellSignals" : @"CellSignals",
             @"deviceId" : @"DeviceId",
             @"ipv4Address" : @"Ipv4Address",
             @"position" : @"Position",
             @"sampleTime" : @"SampleTime",
             @"wiFiAccessPoints" : @"WiFiAccessPoints",
             };
}

+ (NSValueTransformer *)accuracyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationPositionalAccuracy class]];
}

+ (NSValueTransformer *)cellSignalsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationCellSignals class]];
}

+ (NSValueTransformer *)sampleTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)wiFiAccessPointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationWiFiAccessPoint class]];
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

@implementation AWSLocationForecastGeofenceEventsDeviceState

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"position" : @"Position",
             @"speed" : @"Speed",
             };
}

@end

@implementation AWSLocationForecastGeofenceEventsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionName" : @"CollectionName",
             @"deviceState" : @"DeviceState",
             @"distanceUnit" : @"DistanceUnit",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"speedUnit" : @"SpeedUnit",
             @"timeHorizonMinutes" : @"TimeHorizonMinutes",
             };
}

+ (NSValueTransformer *)deviceStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationForecastGeofenceEventsDeviceState class]];
}

+ (NSValueTransformer *)distanceUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Kilometers"] == NSOrderedSame) {
            return @(AWSLocationDistanceUnitKilometers);
        }
        if ([value caseInsensitiveCompare:@"Miles"] == NSOrderedSame) {
            return @(AWSLocationDistanceUnitMiles);
        }
        return @(AWSLocationDistanceUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationDistanceUnitKilometers:
                return @"Kilometers";
            case AWSLocationDistanceUnitMiles:
                return @"Miles";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)speedUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"KilometersPerHour"] == NSOrderedSame) {
            return @(AWSLocationSpeedUnitKilometersPerHour);
        }
        if ([value caseInsensitiveCompare:@"MilesPerHour"] == NSOrderedSame) {
            return @(AWSLocationSpeedUnitMilesPerHour);
        }
        return @(AWSLocationSpeedUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationSpeedUnitKilometersPerHour:
                return @"KilometersPerHour";
            case AWSLocationSpeedUnitMilesPerHour:
                return @"MilesPerHour";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLocationForecastGeofenceEventsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distanceUnit" : @"DistanceUnit",
             @"forecastedEvents" : @"ForecastedEvents",
             @"nextToken" : @"NextToken",
             @"speedUnit" : @"SpeedUnit",
             };
}

+ (NSValueTransformer *)distanceUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Kilometers"] == NSOrderedSame) {
            return @(AWSLocationDistanceUnitKilometers);
        }
        if ([value caseInsensitiveCompare:@"Miles"] == NSOrderedSame) {
            return @(AWSLocationDistanceUnitMiles);
        }
        return @(AWSLocationDistanceUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationDistanceUnitKilometers:
                return @"Kilometers";
            case AWSLocationDistanceUnitMiles:
                return @"Miles";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)forecastedEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationForecastedEvent class]];
}

+ (NSValueTransformer *)speedUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"KilometersPerHour"] == NSOrderedSame) {
            return @(AWSLocationSpeedUnitKilometersPerHour);
        }
        if ([value caseInsensitiveCompare:@"MilesPerHour"] == NSOrderedSame) {
            return @(AWSLocationSpeedUnitMilesPerHour);
        }
        return @(AWSLocationSpeedUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationSpeedUnitKilometersPerHour:
                return @"KilometersPerHour";
            case AWSLocationSpeedUnitMilesPerHour:
                return @"MilesPerHour";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLocationForecastedEvent

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventId" : @"EventId",
             @"eventType" : @"EventType",
             @"forecastedBreachTime" : @"ForecastedBreachTime",
             @"geofenceId" : @"GeofenceId",
             @"geofenceProperties" : @"GeofenceProperties",
             @"isDeviceInGeofence" : @"IsDeviceInGeofence",
             @"nearestDistance" : @"NearestDistance",
             };
}

+ (NSValueTransformer *)eventTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENTER"] == NSOrderedSame) {
            return @(AWSLocationForecastedGeofenceEventTypeEnter);
        }
        if ([value caseInsensitiveCompare:@"EXIT"] == NSOrderedSame) {
            return @(AWSLocationForecastedGeofenceEventTypeExit);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSLocationForecastedGeofenceEventTypeIdle);
        }
        return @(AWSLocationForecastedGeofenceEventTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationForecastedGeofenceEventTypeEnter:
                return @"ENTER";
            case AWSLocationForecastedGeofenceEventTypeExit:
                return @"EXIT";
            case AWSLocationForecastedGeofenceEventTypeIdle:
                return @"IDLE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)forecastedBreachTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationGeofenceGeometry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"circle" : @"Circle",
             @"geobuf" : @"Geobuf",
             @"polygon" : @"Polygon",
             };
}

+ (NSValueTransformer *)circleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationCircle class]];
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
             @"maxResults" : @"MaxResults",
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
             @"accuracy" : @"Accuracy",
             @"deviceId" : @"DeviceId",
             @"position" : @"Position",
             @"positionProperties" : @"PositionProperties",
             @"receivedTime" : @"ReceivedTime",
             @"sampleTime" : @"SampleTime",
             };
}

+ (NSValueTransformer *)accuracyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationPositionalAccuracy class]];
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
             @"geofenceProperties" : @"GeofenceProperties",
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
             @"key" : @"Key",
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
             @"cacheControl" : @"CacheControl",
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
             @"key" : @"Key",
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
             @"cacheControl" : @"CacheControl",
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
             @"key" : @"Key",
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
             @"cacheControl" : @"CacheControl",
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
             @"key" : @"Key",
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
             @"cacheControl" : @"CacheControl",
             @"contentType" : @"ContentType",
             };
}

@end

@implementation AWSLocationGetPlaceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"key" : @"Key",
             @"language" : @"Language",
             @"placeId" : @"PlaceId",
             };
}

@end

@implementation AWSLocationGetPlaceResponse

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

@implementation AWSLocationInferredState

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accuracy" : @"Accuracy",
             @"deviationDistance" : @"DeviationDistance",
             @"position" : @"Position",
             @"proxyDetected" : @"ProxyDetected",
             };
}

+ (NSValueTransformer *)accuracyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationPositionalAccuracy class]];
}

@end

@implementation AWSLocationLeg

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distance" : @"Distance",
             @"durationSeconds" : @"DurationSeconds",
             @"endPosition" : @"EndPosition",
             @"geometry" : @"Geometry",
             @"startPosition" : @"StartPosition",
             @"steps" : @"Steps",
             };
}

+ (NSValueTransformer *)geometryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationLegGeometry class]];
}

+ (NSValueTransformer *)stepsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationStep class]];
}

@end

@implementation AWSLocationLegGeometry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lineString" : @"LineString",
             };
}

@end

@implementation AWSLocationListDevicePositionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterGeometry" : @"FilterGeometry",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"trackerName" : @"TrackerName",
             };
}

+ (NSValueTransformer *)filterGeometryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationTrackingFilterGeometry class]];
}

@end

@implementation AWSLocationListDevicePositionsResponse

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationListDevicePositionsResponseEntry class]];
}

@end

@implementation AWSLocationListDevicePositionsResponseEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accuracy" : @"Accuracy",
             @"deviceId" : @"DeviceId",
             @"position" : @"Position",
             @"positionProperties" : @"PositionProperties",
             @"sampleTime" : @"SampleTime",
             };
}

+ (NSValueTransformer *)accuracyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationPositionalAccuracy class]];
}

+ (NSValueTransformer *)sampleTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
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
             @"pricingPlan" : @"PricingPlan",
             @"pricingPlanDataSource" : @"PricingPlanDataSource",
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
             @"geofenceProperties" : @"GeofenceProperties",
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
             @"maxResults" : @"MaxResults",
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

@implementation AWSLocationListKeysRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationApiKeyFilter class]];
}

@end

@implementation AWSLocationListKeysResponse

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationListKeysResponseEntry class]];
}

@end

@implementation AWSLocationListKeysResponseEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"detail" : @"Description",
             @"expireTime" : @"ExpireTime",
             @"keyName" : @"KeyName",
             @"restrictions" : @"Restrictions",
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

+ (NSValueTransformer *)expireTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)restrictionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationApiKeyRestrictions class]];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
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
             @"pricingPlan" : @"PricingPlan",
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
             @"pricingPlan" : @"PricingPlan",
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

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationListRouteCalculatorsRequest

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

@implementation AWSLocationListRouteCalculatorsResponse

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationListRouteCalculatorsResponseEntry class]];
}

@end

@implementation AWSLocationListRouteCalculatorsResponseEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"calculatorName" : @"CalculatorName",
             @"createTime" : @"CreateTime",
             @"dataSource" : @"DataSource",
             @"detail" : @"Description",
             @"pricingPlan" : @"PricingPlan",
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

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationListTagsForResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSLocationListTagsForResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
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
             @"pricingPlan" : @"PricingPlan",
             @"pricingPlanDataSource" : @"PricingPlanDataSource",
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

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationLteCellDetails

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cellId" : @"CellId",
             @"localId" : @"LocalId",
             @"mcc" : @"Mcc",
             @"mnc" : @"Mnc",
             @"networkMeasurements" : @"NetworkMeasurements",
             @"nrCapable" : @"NrCapable",
             @"rsrp" : @"Rsrp",
             @"rsrq" : @"Rsrq",
             @"tac" : @"Tac",
             @"timingAdvance" : @"TimingAdvance",
             };
}

+ (NSValueTransformer *)localIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationLteLocalId class]];
}

+ (NSValueTransformer *)networkMeasurementsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationLteNetworkMeasurements class]];
}

@end

@implementation AWSLocationLteLocalId

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"earfcn" : @"Earfcn",
             @"pci" : @"Pci",
             };
}

@end

@implementation AWSLocationLteNetworkMeasurements

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cellId" : @"CellId",
             @"earfcn" : @"Earfcn",
             @"pci" : @"Pci",
             @"rsrp" : @"Rsrp",
             @"rsrq" : @"Rsrq",
             };
}

@end

@implementation AWSLocationMapConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customLayers" : @"CustomLayers",
             @"politicalView" : @"PoliticalView",
             @"style" : @"Style",
             };
}

@end

@implementation AWSLocationMapConfigurationUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customLayers" : @"CustomLayers",
             @"politicalView" : @"PoliticalView",
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
             @"categories" : @"Categories",
             @"country" : @"Country",
             @"geometry" : @"Geometry",
             @"interpolated" : @"Interpolated",
             @"label" : @"Label",
             @"municipality" : @"Municipality",
             @"neighborhood" : @"Neighborhood",
             @"postalCode" : @"PostalCode",
             @"region" : @"Region",
             @"street" : @"Street",
             @"subMunicipality" : @"SubMunicipality",
             @"subRegion" : @"SubRegion",
             @"supplementalCategories" : @"SupplementalCategories",
             @"timeZone" : @"TimeZone",
             @"unitNumber" : @"UnitNumber",
             @"unitType" : @"UnitType",
             };
}

+ (NSValueTransformer *)geometryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationPlaceGeometry class]];
}

+ (NSValueTransformer *)timeZoneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationTimeZone class]];
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

@implementation AWSLocationPositionalAccuracy

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"horizontal" : @"Horizontal",
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
             @"geofenceProperties" : @"GeofenceProperties",
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

@implementation AWSLocationRouteMatrixEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distance" : @"Distance",
             @"durationSeconds" : @"DurationSeconds",
             @"error" : @"Error",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationRouteMatrixEntryError class]];
}

@end

@implementation AWSLocationRouteMatrixEntryError

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
        if ([value caseInsensitiveCompare:@"RouteNotFound"] == NSOrderedSame) {
            return @(AWSLocationRouteMatrixErrorCodeRouteNotFound);
        }
        if ([value caseInsensitiveCompare:@"RouteTooLong"] == NSOrderedSame) {
            return @(AWSLocationRouteMatrixErrorCodeRouteTooLong);
        }
        if ([value caseInsensitiveCompare:@"PositionsNotFound"] == NSOrderedSame) {
            return @(AWSLocationRouteMatrixErrorCodePositionsNotFound);
        }
        if ([value caseInsensitiveCompare:@"DestinationPositionNotFound"] == NSOrderedSame) {
            return @(AWSLocationRouteMatrixErrorCodeDestinationPositionNotFound);
        }
        if ([value caseInsensitiveCompare:@"DeparturePositionNotFound"] == NSOrderedSame) {
            return @(AWSLocationRouteMatrixErrorCodeDeparturePositionNotFound);
        }
        if ([value caseInsensitiveCompare:@"OtherValidationError"] == NSOrderedSame) {
            return @(AWSLocationRouteMatrixErrorCodeOtherValidationError);
        }
        return @(AWSLocationRouteMatrixErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationRouteMatrixErrorCodeRouteNotFound:
                return @"RouteNotFound";
            case AWSLocationRouteMatrixErrorCodeRouteTooLong:
                return @"RouteTooLong";
            case AWSLocationRouteMatrixErrorCodePositionsNotFound:
                return @"PositionsNotFound";
            case AWSLocationRouteMatrixErrorCodeDestinationPositionNotFound:
                return @"DestinationPositionNotFound";
            case AWSLocationRouteMatrixErrorCodeDeparturePositionNotFound:
                return @"DeparturePositionNotFound";
            case AWSLocationRouteMatrixErrorCodeOtherValidationError:
                return @"OtherValidationError";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLocationSearchForPositionResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distance" : @"Distance",
             @"place" : @"Place",
             @"placeId" : @"PlaceId",
             };
}

+ (NSValueTransformer *)placeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationPlace class]];
}

@end

@implementation AWSLocationSearchForSuggestionsResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"categories" : @"Categories",
             @"placeId" : @"PlaceId",
             @"supplementalCategories" : @"SupplementalCategories",
             @"text" : @"Text",
             };
}

@end

@implementation AWSLocationSearchForTextResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distance" : @"Distance",
             @"place" : @"Place",
             @"placeId" : @"PlaceId",
             @"relevance" : @"Relevance",
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
             @"key" : @"Key",
             @"language" : @"Language",
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
             @"language" : @"Language",
             @"maxResults" : @"MaxResults",
             @"position" : @"Position",
             };
}

@end

@implementation AWSLocationSearchPlaceIndexForSuggestionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"biasPosition" : @"BiasPosition",
             @"filterBBox" : @"FilterBBox",
             @"filterCategories" : @"FilterCategories",
             @"filterCountries" : @"FilterCountries",
             @"indexName" : @"IndexName",
             @"key" : @"Key",
             @"language" : @"Language",
             @"maxResults" : @"MaxResults",
             @"text" : @"Text",
             };
}

@end

@implementation AWSLocationSearchPlaceIndexForSuggestionsResponse

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLocationSearchForSuggestionsResult class]];
}

+ (NSValueTransformer *)summaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationSearchPlaceIndexForSuggestionsSummary class]];
}

@end

@implementation AWSLocationSearchPlaceIndexForSuggestionsSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"biasPosition" : @"BiasPosition",
             @"dataSource" : @"DataSource",
             @"filterBBox" : @"FilterBBox",
             @"filterCategories" : @"FilterCategories",
             @"filterCountries" : @"FilterCountries",
             @"language" : @"Language",
             @"maxResults" : @"MaxResults",
             @"text" : @"Text",
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
             @"filterCategories" : @"FilterCategories",
             @"filterCountries" : @"FilterCountries",
             @"indexName" : @"IndexName",
             @"key" : @"Key",
             @"language" : @"Language",
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
             @"filterCategories" : @"FilterCategories",
             @"filterCountries" : @"FilterCountries",
             @"language" : @"Language",
             @"maxResults" : @"MaxResults",
             @"resultBBox" : @"ResultBBox",
             @"text" : @"Text",
             };
}

@end

@implementation AWSLocationStep

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distance" : @"Distance",
             @"durationSeconds" : @"DurationSeconds",
             @"endPosition" : @"EndPosition",
             @"geometryOffset" : @"GeometryOffset",
             @"startPosition" : @"StartPosition",
             };
}

@end

@implementation AWSLocationTagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSLocationTagResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSLocationTimeZone

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"offset" : @"Offset",
             };
}

@end

@implementation AWSLocationTrackingFilterGeometry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"polygon" : @"Polygon",
             };
}

@end

@implementation AWSLocationTruckDimensions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"height" : @"Height",
             @"length" : @"Length",
             @"unit" : @"Unit",
             @"width" : @"Width",
             };
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Meters"] == NSOrderedSame) {
            return @(AWSLocationDimensionUnitMeters);
        }
        if ([value caseInsensitiveCompare:@"Feet"] == NSOrderedSame) {
            return @(AWSLocationDimensionUnitFeet);
        }
        return @(AWSLocationDimensionUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationDimensionUnitMeters:
                return @"Meters";
            case AWSLocationDimensionUnitFeet:
                return @"Feet";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLocationTruckWeight

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"total" : @"Total",
             @"unit" : @"Unit",
             };
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Kilograms"] == NSOrderedSame) {
            return @(AWSLocationVehicleWeightUnitKilograms);
        }
        if ([value caseInsensitiveCompare:@"Pounds"] == NSOrderedSame) {
            return @(AWSLocationVehicleWeightUnitPounds);
        }
        return @(AWSLocationVehicleWeightUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationVehicleWeightUnitKilograms:
                return @"Kilograms";
            case AWSLocationVehicleWeightUnitPounds:
                return @"Pounds";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLocationUntagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSLocationUntagResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSLocationUpdateGeofenceCollectionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionName" : @"CollectionName",
             @"detail" : @"Description",
             @"pricingPlan" : @"PricingPlan",
             @"pricingPlanDataSource" : @"PricingPlanDataSource",
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

@implementation AWSLocationUpdateGeofenceCollectionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionArn" : @"CollectionArn",
             @"collectionName" : @"CollectionName",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationUpdateKeyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"expireTime" : @"ExpireTime",
             @"forceUpdate" : @"ForceUpdate",
             @"keyName" : @"KeyName",
             @"noExpiry" : @"NoExpiry",
             @"restrictions" : @"Restrictions",
             };
}

+ (NSValueTransformer *)expireTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)restrictionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationApiKeyRestrictions class]];
}

@end

@implementation AWSLocationUpdateKeyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyArn" : @"KeyArn",
             @"keyName" : @"KeyName",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationUpdateMapRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationUpdate" : @"ConfigurationUpdate",
             @"detail" : @"Description",
             @"mapName" : @"MapName",
             @"pricingPlan" : @"PricingPlan",
             };
}

+ (NSValueTransformer *)configurationUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationMapConfigurationUpdate class]];
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

@implementation AWSLocationUpdateMapResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mapArn" : @"MapArn",
             @"mapName" : @"MapName",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationUpdatePlaceIndexRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
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

@implementation AWSLocationUpdatePlaceIndexResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexArn" : @"IndexArn",
             @"indexName" : @"IndexName",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationUpdateRouteCalculatorRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"calculatorName" : @"CalculatorName",
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

@implementation AWSLocationUpdateRouteCalculatorResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"calculatorArn" : @"CalculatorArn",
             @"calculatorName" : @"CalculatorName",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSLocationUpdateTrackerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"eventBridgeEnabled" : @"EventBridgeEnabled",
             @"kmsKeyEnableGeospatialQueries" : @"KmsKeyEnableGeospatialQueries",
             @"positionFiltering" : @"PositionFiltering",
             @"pricingPlan" : @"PricingPlan",
             @"pricingPlanDataSource" : @"PricingPlanDataSource",
             @"trackerName" : @"TrackerName",
             };
}

+ (NSValueTransformer *)positionFilteringJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TimeBased"] == NSOrderedSame) {
            return @(AWSLocationPositionFilteringTimeBased);
        }
        if ([value caseInsensitiveCompare:@"DistanceBased"] == NSOrderedSame) {
            return @(AWSLocationPositionFilteringDistanceBased);
        }
        if ([value caseInsensitiveCompare:@"AccuracyBased"] == NSOrderedSame) {
            return @(AWSLocationPositionFilteringAccuracyBased);
        }
        return @(AWSLocationPositionFilteringUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationPositionFilteringTimeBased:
                return @"TimeBased";
            case AWSLocationPositionFilteringDistanceBased:
                return @"DistanceBased";
            case AWSLocationPositionFilteringAccuracyBased:
                return @"AccuracyBased";
            default:
                return nil;
        }
    }];
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

@implementation AWSLocationUpdateTrackerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trackerArn" : @"TrackerArn",
             @"trackerName" : @"TrackerName",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
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

@implementation AWSLocationVerifyDevicePositionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceState" : @"DeviceState",
             @"distanceUnit" : @"DistanceUnit",
             @"trackerName" : @"TrackerName",
             };
}

+ (NSValueTransformer *)deviceStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationDeviceState class]];
}

+ (NSValueTransformer *)distanceUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Kilometers"] == NSOrderedSame) {
            return @(AWSLocationDistanceUnitKilometers);
        }
        if ([value caseInsensitiveCompare:@"Miles"] == NSOrderedSame) {
            return @(AWSLocationDistanceUnitMiles);
        }
        return @(AWSLocationDistanceUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationDistanceUnitKilometers:
                return @"Kilometers";
            case AWSLocationDistanceUnitMiles:
                return @"Miles";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLocationVerifyDevicePositionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceId" : @"DeviceId",
             @"distanceUnit" : @"DistanceUnit",
             @"inferredState" : @"InferredState",
             @"receivedTime" : @"ReceivedTime",
             @"sampleTime" : @"SampleTime",
             };
}

+ (NSValueTransformer *)distanceUnitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Kilometers"] == NSOrderedSame) {
            return @(AWSLocationDistanceUnitKilometers);
        }
        if ([value caseInsensitiveCompare:@"Miles"] == NSOrderedSame) {
            return @(AWSLocationDistanceUnitMiles);
        }
        return @(AWSLocationDistanceUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLocationDistanceUnitKilometers:
                return @"Kilometers";
            case AWSLocationDistanceUnitMiles:
                return @"Miles";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inferredStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLocationInferredState class]];
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

@implementation AWSLocationWiFiAccessPoint

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"macAddress" : @"MacAddress",
             @"rss" : @"Rss",
             };
}

@end
