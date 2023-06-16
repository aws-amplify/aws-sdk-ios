//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSLocationErrorDomain;

typedef NS_ENUM(NSInteger, AWSLocationErrorType) {
    AWSLocationErrorUnknown,
    AWSLocationErrorAccessDenied,
    AWSLocationErrorConflict,
    AWSLocationErrorInternalServer,
    AWSLocationErrorResourceNotFound,
    AWSLocationErrorServiceQuotaExceeded,
    AWSLocationErrorThrottling,
    AWSLocationErrorValidation,
};

typedef NS_ENUM(NSInteger, AWSLocationBatchItemErrorCode) {
    AWSLocationBatchItemErrorCodeUnknown,
    AWSLocationBatchItemErrorCodeAccessDeniedError,
    AWSLocationBatchItemErrorCodeConflictError,
    AWSLocationBatchItemErrorCodeInternalServerError,
    AWSLocationBatchItemErrorCodeResourceNotFoundError,
    AWSLocationBatchItemErrorCodeThrottlingError,
    AWSLocationBatchItemErrorCodeValidationError,
};

typedef NS_ENUM(NSInteger, AWSLocationDimensionUnit) {
    AWSLocationDimensionUnitUnknown,
    AWSLocationDimensionUnitMeters,
    AWSLocationDimensionUnitFeet,
};

typedef NS_ENUM(NSInteger, AWSLocationDistanceUnit) {
    AWSLocationDistanceUnitUnknown,
    AWSLocationDistanceUnitKilometers,
    AWSLocationDistanceUnitMiles,
};

typedef NS_ENUM(NSInteger, AWSLocationIntendedUse) {
    AWSLocationIntendedUseUnknown,
    AWSLocationIntendedUseSingleUse,
    AWSLocationIntendedUseStorage,
};

typedef NS_ENUM(NSInteger, AWSLocationPositionFiltering) {
    AWSLocationPositionFilteringUnknown,
    AWSLocationPositionFilteringTimeBased,
    AWSLocationPositionFilteringDistanceBased,
    AWSLocationPositionFilteringAccuracyBased,
};

typedef NS_ENUM(NSInteger, AWSLocationPricingPlan) {
    AWSLocationPricingPlanUnknown,
    AWSLocationPricingPlanRequestBasedUsage,
    AWSLocationPricingPlanMobileAssetTracking,
    AWSLocationPricingPlanMobileAssetManagement,
};

typedef NS_ENUM(NSInteger, AWSLocationRouteMatrixErrorCode) {
    AWSLocationRouteMatrixErrorCodeUnknown,
    AWSLocationRouteMatrixErrorCodeRouteNotFound,
    AWSLocationRouteMatrixErrorCodeRouteTooLong,
    AWSLocationRouteMatrixErrorCodePositionsNotFound,
    AWSLocationRouteMatrixErrorCodeDestinationPositionNotFound,
    AWSLocationRouteMatrixErrorCodeDeparturePositionNotFound,
    AWSLocationRouteMatrixErrorCodeOtherValidationError,
};

typedef NS_ENUM(NSInteger, AWSLocationStatus) {
    AWSLocationStatusUnknown,
    AWSLocationStatusActive,
    AWSLocationStatusExpired,
};

typedef NS_ENUM(NSInteger, AWSLocationTravelMode) {
    AWSLocationTravelModeUnknown,
    AWSLocationTravelModeCar,
    AWSLocationTravelModeTruck,
    AWSLocationTravelModeWalking,
    AWSLocationTravelModeBicycle,
    AWSLocationTravelModeMotorcycle,
};

typedef NS_ENUM(NSInteger, AWSLocationValidationExceptionReason) {
    AWSLocationValidationExceptionReasonUnknown,
    AWSLocationValidationExceptionReasonUnknownOperation,
    AWSLocationValidationExceptionReasonMissing,
    AWSLocationValidationExceptionReasonCannotParse,
    AWSLocationValidationExceptionReasonFieldValidationFailed,
    AWSLocationValidationExceptionReasonOther,
};

typedef NS_ENUM(NSInteger, AWSLocationVehicleWeightUnit) {
    AWSLocationVehicleWeightUnitUnknown,
    AWSLocationVehicleWeightUnitKilograms,
    AWSLocationVehicleWeightUnitPounds,
};

@class AWSLocationApiKeyFilter;
@class AWSLocationApiKeyRestrictions;
@class AWSLocationAssociateTrackerConsumerRequest;
@class AWSLocationAssociateTrackerConsumerResponse;
@class AWSLocationBatchDeleteDevicePositionHistoryError;
@class AWSLocationBatchDeleteDevicePositionHistoryRequest;
@class AWSLocationBatchDeleteDevicePositionHistoryResponse;
@class AWSLocationBatchDeleteGeofenceError;
@class AWSLocationBatchDeleteGeofenceRequest;
@class AWSLocationBatchDeleteGeofenceResponse;
@class AWSLocationBatchEvaluateGeofencesError;
@class AWSLocationBatchEvaluateGeofencesRequest;
@class AWSLocationBatchEvaluateGeofencesResponse;
@class AWSLocationBatchGetDevicePositionError;
@class AWSLocationBatchGetDevicePositionRequest;
@class AWSLocationBatchGetDevicePositionResponse;
@class AWSLocationBatchItemError;
@class AWSLocationBatchPutGeofenceError;
@class AWSLocationBatchPutGeofenceRequest;
@class AWSLocationBatchPutGeofenceRequestEntry;
@class AWSLocationBatchPutGeofenceResponse;
@class AWSLocationBatchPutGeofenceSuccess;
@class AWSLocationBatchUpdateDevicePositionError;
@class AWSLocationBatchUpdateDevicePositionRequest;
@class AWSLocationBatchUpdateDevicePositionResponse;
@class AWSLocationCalculateRouteCarModeOptions;
@class AWSLocationCalculateRouteMatrixRequest;
@class AWSLocationCalculateRouteMatrixResponse;
@class AWSLocationCalculateRouteMatrixSummary;
@class AWSLocationCalculateRouteRequest;
@class AWSLocationCalculateRouteResponse;
@class AWSLocationCalculateRouteSummary;
@class AWSLocationCalculateRouteTruckModeOptions;
@class AWSLocationCircle;
@class AWSLocationCreateGeofenceCollectionRequest;
@class AWSLocationCreateGeofenceCollectionResponse;
@class AWSLocationCreateKeyRequest;
@class AWSLocationCreateKeyResponse;
@class AWSLocationCreateMapRequest;
@class AWSLocationCreateMapResponse;
@class AWSLocationCreatePlaceIndexRequest;
@class AWSLocationCreatePlaceIndexResponse;
@class AWSLocationCreateRouteCalculatorRequest;
@class AWSLocationCreateRouteCalculatorResponse;
@class AWSLocationCreateTrackerRequest;
@class AWSLocationCreateTrackerResponse;
@class AWSLocationDataSourceConfiguration;
@class AWSLocationDeleteGeofenceCollectionRequest;
@class AWSLocationDeleteGeofenceCollectionResponse;
@class AWSLocationDeleteKeyRequest;
@class AWSLocationDeleteKeyResponse;
@class AWSLocationDeleteMapRequest;
@class AWSLocationDeleteMapResponse;
@class AWSLocationDeletePlaceIndexRequest;
@class AWSLocationDeletePlaceIndexResponse;
@class AWSLocationDeleteRouteCalculatorRequest;
@class AWSLocationDeleteRouteCalculatorResponse;
@class AWSLocationDeleteTrackerRequest;
@class AWSLocationDeleteTrackerResponse;
@class AWSLocationDescribeGeofenceCollectionRequest;
@class AWSLocationDescribeGeofenceCollectionResponse;
@class AWSLocationDescribeKeyRequest;
@class AWSLocationDescribeKeyResponse;
@class AWSLocationDescribeMapRequest;
@class AWSLocationDescribeMapResponse;
@class AWSLocationDescribePlaceIndexRequest;
@class AWSLocationDescribePlaceIndexResponse;
@class AWSLocationDescribeRouteCalculatorRequest;
@class AWSLocationDescribeRouteCalculatorResponse;
@class AWSLocationDescribeTrackerRequest;
@class AWSLocationDescribeTrackerResponse;
@class AWSLocationDevicePosition;
@class AWSLocationDevicePositionUpdate;
@class AWSLocationDisassociateTrackerConsumerRequest;
@class AWSLocationDisassociateTrackerConsumerResponse;
@class AWSLocationGeofenceGeometry;
@class AWSLocationGetDevicePositionHistoryRequest;
@class AWSLocationGetDevicePositionHistoryResponse;
@class AWSLocationGetDevicePositionRequest;
@class AWSLocationGetDevicePositionResponse;
@class AWSLocationGetGeofenceRequest;
@class AWSLocationGetGeofenceResponse;
@class AWSLocationGetMapGlyphsRequest;
@class AWSLocationGetMapGlyphsResponse;
@class AWSLocationGetMapSpritesRequest;
@class AWSLocationGetMapSpritesResponse;
@class AWSLocationGetMapStyleDescriptorRequest;
@class AWSLocationGetMapStyleDescriptorResponse;
@class AWSLocationGetMapTileRequest;
@class AWSLocationGetMapTileResponse;
@class AWSLocationGetPlaceRequest;
@class AWSLocationGetPlaceResponse;
@class AWSLocationLeg;
@class AWSLocationLegGeometry;
@class AWSLocationListDevicePositionsRequest;
@class AWSLocationListDevicePositionsResponse;
@class AWSLocationListDevicePositionsResponseEntry;
@class AWSLocationListGeofenceCollectionsRequest;
@class AWSLocationListGeofenceCollectionsResponse;
@class AWSLocationListGeofenceCollectionsResponseEntry;
@class AWSLocationListGeofenceResponseEntry;
@class AWSLocationListGeofencesRequest;
@class AWSLocationListGeofencesResponse;
@class AWSLocationListKeysRequest;
@class AWSLocationListKeysResponse;
@class AWSLocationListKeysResponseEntry;
@class AWSLocationListMapsRequest;
@class AWSLocationListMapsResponse;
@class AWSLocationListMapsResponseEntry;
@class AWSLocationListPlaceIndexesRequest;
@class AWSLocationListPlaceIndexesResponse;
@class AWSLocationListPlaceIndexesResponseEntry;
@class AWSLocationListRouteCalculatorsRequest;
@class AWSLocationListRouteCalculatorsResponse;
@class AWSLocationListRouteCalculatorsResponseEntry;
@class AWSLocationListTagsForResourceRequest;
@class AWSLocationListTagsForResourceResponse;
@class AWSLocationListTrackerConsumersRequest;
@class AWSLocationListTrackerConsumersResponse;
@class AWSLocationListTrackersRequest;
@class AWSLocationListTrackersResponse;
@class AWSLocationListTrackersResponseEntry;
@class AWSLocationMapConfiguration;
@class AWSLocationMapConfigurationUpdate;
@class AWSLocationPlace;
@class AWSLocationPlaceGeometry;
@class AWSLocationPositionalAccuracy;
@class AWSLocationPutGeofenceRequest;
@class AWSLocationPutGeofenceResponse;
@class AWSLocationRouteMatrixEntry;
@class AWSLocationRouteMatrixEntryError;
@class AWSLocationSearchForPositionResult;
@class AWSLocationSearchForSuggestionsResult;
@class AWSLocationSearchForTextResult;
@class AWSLocationSearchPlaceIndexForPositionRequest;
@class AWSLocationSearchPlaceIndexForPositionResponse;
@class AWSLocationSearchPlaceIndexForPositionSummary;
@class AWSLocationSearchPlaceIndexForSuggestionsRequest;
@class AWSLocationSearchPlaceIndexForSuggestionsResponse;
@class AWSLocationSearchPlaceIndexForSuggestionsSummary;
@class AWSLocationSearchPlaceIndexForTextRequest;
@class AWSLocationSearchPlaceIndexForTextResponse;
@class AWSLocationSearchPlaceIndexForTextSummary;
@class AWSLocationStep;
@class AWSLocationTagResourceRequest;
@class AWSLocationTagResourceResponse;
@class AWSLocationTimeZone;
@class AWSLocationTruckDimensions;
@class AWSLocationTruckWeight;
@class AWSLocationUntagResourceRequest;
@class AWSLocationUntagResourceResponse;
@class AWSLocationUpdateGeofenceCollectionRequest;
@class AWSLocationUpdateGeofenceCollectionResponse;
@class AWSLocationUpdateKeyRequest;
@class AWSLocationUpdateKeyResponse;
@class AWSLocationUpdateMapRequest;
@class AWSLocationUpdateMapResponse;
@class AWSLocationUpdatePlaceIndexRequest;
@class AWSLocationUpdatePlaceIndexResponse;
@class AWSLocationUpdateRouteCalculatorRequest;
@class AWSLocationUpdateRouteCalculatorResponse;
@class AWSLocationUpdateTrackerRequest;
@class AWSLocationUpdateTrackerResponse;
@class AWSLocationValidationExceptionField;

/**
 <p>Options for filtering API keys.</p>
 */
@interface AWSLocationApiKeyFilter : AWSModel


/**
 <p>Filter on <code>Active</code> or <code>Expired</code> API keys.</p>
 */
@property (nonatomic, assign) AWSLocationStatus keyStatus;

@end

/**
 <p>API Restrictions on the allowed actions, resources, and referers for an API key resource.</p>
 Required parameters: [AllowActions, AllowResources]
 */
@interface AWSLocationApiKeyRestrictions : AWSModel


/**
 <p>A list of allowed actions that an API key resource grants permissions to perform</p><note><p>Currently, the only valid action is <code>geo:GetMap*</code> as an input to the list. For example, <code>["geo:GetMap*"]</code> is valid but <code>["geo:GetMapTile"]</code> is not.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowActions;

/**
 <p>An optional list of allowed HTTP referers for which requests must originate from. Requests using this API key from other domains will not be allowed.</p><p>Requirements:</p><ul><li><p>Contain only alphanumeric characters (A–Z, a–z, 0–9) or any symbols in this list <code>$\-._+!*`(),;/?:@=&amp;</code></p></li><li><p>May contain a percent (%) if followed by 2 hexadecimal digits (A-F, a-f, 0-9); this is used for URL encoding purposes.</p></li><li><p>May contain wildcard characters question mark (?) and asterisk (*).</p><p>Question mark (?) will replace any single character (including hexadecimal digits).</p><p>Asterisk (*) will replace any multiple characters (including multiple hexadecimal digits).</p></li><li><p>No spaces allowed. For example, <code>https://example.com</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowReferers;

/**
 <p>A list of allowed resource ARNs that a API key bearer can perform actions on</p><p>For more information about ARN format, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs)</a>.</p><note><p>In this preview, you can allow only map resources.</p></note><p>Requirements:</p><ul><li><p>Must be prefixed with <code>arn</code>.</p></li><li><p><code>partition</code> and <code>service</code> must not be empty and should begin with only alphanumeric characters (A–Z, a–z, 0–9) and contain only alphanumeric numbers, hyphens (-) and periods (.).</p></li><li><p><code>region</code> and <code>account-id</code> can be empty or should begin with only alphanumeric characters (A–Z, a–z, 0–9) and contain only alphanumeric numbers, hyphens (-) and periods (.).</p></li><li><p><code>resource-id</code> can begin with any character except for forward slash (/) and contain any characters after, including forward slashes to form a path.</p><p><code>resource-id</code> can also include wildcard characters, denoted by an asterisk (*).</p></li><li><p><code>arn</code>, <code>partition</code>, <code>service</code>, <code>region</code>, <code>account-id</code> and <code>resource-id</code> must be delimited by a colon (:).</p></li><li><p>No spaces allowed. For example, <code>arn:aws:geo:region:<i>account-id</i>:map/ExampleMap*</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowResources;

@end

/**
 
 */
@interface AWSLocationAssociateTrackerConsumerRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) for the geofence collection to be associated to tracker resource. Used when you need to specify a resource across all Amazon Web Services.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollectionConsumer</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable consumerArn;

/**
 <p>The name of the tracker resource to be associated with a geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationAssociateTrackerConsumerResponse : AWSModel


@end

/**
 <p>Contains the tracker resource details.</p>
 Required parameters: [DeviceId, Error]
 */
@interface AWSLocationBatchDeleteDevicePositionHistoryError : AWSModel


/**
 <p>The ID of the device for this position.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>Contains the batch request error details associated with the request.</p>
 */
@property (nonatomic, strong) AWSLocationBatchItemError * _Nullable error;

@end

/**
 
 */
@interface AWSLocationBatchDeleteDevicePositionHistoryRequest : AWSRequest


/**
 <p>Devices whose position history you want to delete.</p><ul><li><p>For example, for two devices: <code>“DeviceIds” : [DeviceId1,DeviceId2]</code></p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable deviceIds;

/**
 <p>The name of the tracker resource to delete the device position history from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationBatchDeleteDevicePositionHistoryResponse : AWSModel


/**
 <p>Contains error details for each device history that failed to delete.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationBatchDeleteDevicePositionHistoryError *> * _Nullable errors;

@end

/**
 <p>Contains error details for each geofence that failed to delete from the geofence collection.</p>
 Required parameters: [Error, GeofenceId]
 */
@interface AWSLocationBatchDeleteGeofenceError : AWSModel


/**
 <p>Contains details associated to the batch error.</p>
 */
@property (nonatomic, strong) AWSLocationBatchItemError * _Nullable error;

/**
 <p>The geofence associated with the error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geofenceId;

@end

/**
 
 */
@interface AWSLocationBatchDeleteGeofenceRequest : AWSRequest


/**
 <p>The geofence collection storing the geofences to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>The batch of geofences to be deleted.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable geofenceIds;

@end

/**
 
 */
@interface AWSLocationBatchDeleteGeofenceResponse : AWSModel


/**
 <p>Contains error details for each geofence that failed to delete.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationBatchDeleteGeofenceError *> * _Nullable errors;

@end

/**
 <p>Contains error details for each device that failed to evaluate its position against the geofences in a given geofence collection.</p>
 Required parameters: [DeviceId, Error, SampleTime]
 */
@interface AWSLocationBatchEvaluateGeofencesError : AWSModel


/**
 <p>The device associated with the position evaluation error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>Contains details associated to the batch error.</p>
 */
@property (nonatomic, strong) AWSLocationBatchItemError * _Nullable error;

/**
 <p>Specifies a timestamp for when the error occurred in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable sampleTime;

@end

/**
 
 */
@interface AWSLocationBatchEvaluateGeofencesRequest : AWSRequest


/**
 <p>The geofence collection used in evaluating the position of devices against its geofences.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>Contains device details for each device to be evaluated against the given geofence collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationDevicePositionUpdate *> * _Nullable devicePositionUpdates;

@end

/**
 
 */
@interface AWSLocationBatchEvaluateGeofencesResponse : AWSModel


/**
 <p>Contains error details for each device that failed to evaluate its position against the given geofence collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationBatchEvaluateGeofencesError *> * _Nullable errors;

@end

/**
 <p>Contains error details for each device that didn't return a position.</p>
 Required parameters: [DeviceId, Error]
 */
@interface AWSLocationBatchGetDevicePositionError : AWSModel


/**
 <p>The ID of the device that didn't return a position.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>Contains details related to the error code.</p>
 */
@property (nonatomic, strong) AWSLocationBatchItemError * _Nullable error;

@end

/**
 
 */
@interface AWSLocationBatchGetDevicePositionRequest : AWSRequest


/**
 <p>Devices whose position you want to retrieve.</p><ul><li><p>For example, for two devices: <code>device-ids=DeviceId1&amp;device-ids=DeviceId2</code></p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable deviceIds;

/**
 <p>The tracker resource retrieving the device position.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationBatchGetDevicePositionResponse : AWSModel


/**
 <p>Contains device position details such as the device ID, position, and timestamps for when the position was received and sampled.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationDevicePosition *> * _Nullable devicePositions;

/**
 <p>Contains error details for each device that failed to send its position to the tracker resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationBatchGetDevicePositionError *> * _Nullable errors;

@end

/**
 <p>Contains the batch request error details associated with the request.</p>
 */
@interface AWSLocationBatchItemError : AWSModel


/**
 <p>The error code associated with the batch request error.</p>
 */
@property (nonatomic, assign) AWSLocationBatchItemErrorCode code;

/**
 <p>A message with the reason for the batch request error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Contains error details for each geofence that failed to be stored in a given geofence collection.</p>
 Required parameters: [Error, GeofenceId]
 */
@interface AWSLocationBatchPutGeofenceError : AWSModel


/**
 <p>Contains details associated to the batch error.</p>
 */
@property (nonatomic, strong) AWSLocationBatchItemError * _Nullable error;

/**
 <p>The geofence associated with the error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geofenceId;

@end

/**
 
 */
@interface AWSLocationBatchPutGeofenceRequest : AWSRequest


/**
 <p>The geofence collection storing the geofences.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>The batch of geofences to be stored in a geofence collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationBatchPutGeofenceRequestEntry *> * _Nullable entries;

@end

/**
 <p>Contains geofence geometry details. </p>
 Required parameters: [GeofenceId, Geometry]
 */
@interface AWSLocationBatchPutGeofenceRequestEntry : AWSModel


/**
 <p>The identifier for the geofence to be stored in a given geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geofenceId;

/**
 <p>Specifies additional user-defined properties to store with the Geofence. An array of key-value pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable geofenceProperties;

/**
 <p>Contains the details of the position of the geofence. Can be either a polygon or a circle. Including both will return a validation error.</p><note><p>Each <a href="https://docs.aws.amazon.com/location-geofences/latest/APIReference/API_GeofenceGeometry.html"> geofence polygon</a> can have a maximum of 1,000 vertices.</p></note>
 */
@property (nonatomic, strong) AWSLocationGeofenceGeometry * _Nullable geometry;

@end

/**
 
 */
@interface AWSLocationBatchPutGeofenceResponse : AWSModel


/**
 <p>Contains additional error details for each geofence that failed to be stored in a geofence collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationBatchPutGeofenceError *> * _Nullable errors;

/**
 <p>Contains each geofence that was successfully stored in a geofence collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationBatchPutGeofenceSuccess *> * _Nullable successes;

@end

/**
 <p>Contains a summary of each geofence that was successfully stored in a given geofence collection.</p>
 Required parameters: [CreateTime, GeofenceId, UpdateTime]
 */
@interface AWSLocationBatchPutGeofenceSuccess : AWSModel


/**
 <p>The timestamp for when the geofence was stored in a geofence collection in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The geofence successfully stored in a geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geofenceId;

/**
 <p>The timestamp for when the geofence was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 <p>Contains error details for each device that failed to update its position.</p>
 Required parameters: [DeviceId, Error, SampleTime]
 */
@interface AWSLocationBatchUpdateDevicePositionError : AWSModel


/**
 <p>The device associated with the failed location update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>Contains details related to the error code such as the error code and error message.</p>
 */
@property (nonatomic, strong) AWSLocationBatchItemError * _Nullable error;

/**
 <p>The timestamp at which the device position was determined. Uses <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable sampleTime;

@end

/**
 
 */
@interface AWSLocationBatchUpdateDevicePositionRequest : AWSRequest


/**
 <p>The name of the tracker resource to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

/**
 <p>Contains the position update details for each device, up to 10 devices.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationDevicePositionUpdate *> * _Nullable updates;

@end

/**
 
 */
@interface AWSLocationBatchUpdateDevicePositionResponse : AWSModel


/**
 <p>Contains error details for each device that failed to update its position.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationBatchUpdateDevicePositionError *> * _Nullable errors;

@end

/**
 <p>Contains details about additional route preferences for requests that specify <code>TravelMode</code> as <code>Car</code>.</p>
 */
@interface AWSLocationCalculateRouteCarModeOptions : AWSModel


/**
 <p>Avoids ferries when calculating routes.</p><p>Default Value: <code>false</code></p><p>Valid Values: <code>false</code> | <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable avoidFerries;

/**
 <p>Avoids tolls when calculating routes.</p><p>Default Value: <code>false</code></p><p>Valid Values: <code>false</code> | <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable avoidTolls;

@end

/**
 
 */
@interface AWSLocationCalculateRouteMatrixRequest : AWSRequest


/**
 <p>The name of the route calculator resource that you want to use to calculate the route matrix. </p>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorName;

/**
 <p>Specifies route preferences when traveling by <code>Car</code>, such as avoiding routes that use ferries or tolls.</p><p>Requirements: <code>TravelMode</code> must be specified as <code>Car</code>.</p>
 */
@property (nonatomic, strong) AWSLocationCalculateRouteCarModeOptions * _Nullable carModeOptions;

/**
 <p>Sets the time of departure as the current time. Uses the current time to calculate the route matrix. You can't set both <code>DepartureTime</code> and <code>DepartNow</code>. If neither is set, the best time of day to travel with the best traffic conditions is used to calculate the route matrix.</p><p>Default Value: <code>false</code></p><p>Valid Values: <code>false</code> | <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable departNow;

/**
 <p>The list of departure (origin) positions for the route matrix. An array of points, each of which is itself a 2-value array defined in <a href="https://earth-info.nga.mil/GandG/wgs84/index.html">WGS 84</a> format: <code>[longitude, latitude]</code>. For example, <code>[-123.115, 49.285]</code>.</p><important><p>Depending on the data provider selected in the route calculator resource there may be additional restrictions on the inputs you can choose. See <a href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route-matrix.html#matrix-routing-position-limits"> Position restrictions</a> in the <i>Amazon Location Service Developer Guide</i>.</p></important><note><p>For route calculators that use Esri as the data provider, if you specify a departure that's not located on a road, Amazon Location <a href="https://docs.aws.amazon.com/location/latest/developerguide/snap-to-nearby-road.html"> moves the position to the nearest road</a>. The snapped value is available in the result in <code>SnappedDeparturePositions</code>.</p></note><p>Valid Values: <code>[-180 to 180,-90 to 90]</code></p>
 */
@property (nonatomic, strong) NSArray<NSArray<NSNumber *> *> * _Nullable departurePositions;

/**
 <p>Specifies the desired time of departure. Uses the given time to calculate the route matrix. You can't set both <code>DepartureTime</code> and <code>DepartNow</code>. If neither is set, the best time of day to travel with the best traffic conditions is used to calculate the route matrix.</p><note><p>Setting a departure time in the past returns a <code>400 ValidationException</code> error.</p></note><ul><li><p>In <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. For example, <code>2020–07-2T12:15:20.000Z+01:00</code></p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable departureTime;

/**
 <p>The list of destination positions for the route matrix. An array of points, each of which is itself a 2-value array defined in <a href="https://earth-info.nga.mil/GandG/wgs84/index.html">WGS 84</a> format: <code>[longitude, latitude]</code>. For example, <code>[-122.339, 47.615]</code></p><important><p>Depending on the data provider selected in the route calculator resource there may be additional restrictions on the inputs you can choose. See <a href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route-matrix.html#matrix-routing-position-limits"> Position restrictions</a> in the <i>Amazon Location Service Developer Guide</i>.</p></important><note><p>For route calculators that use Esri as the data provider, if you specify a destination that's not located on a road, Amazon Location <a href="https://docs.aws.amazon.com/location/latest/developerguide/snap-to-nearby-road.html"> moves the position to the nearest road</a>. The snapped value is available in the result in <code>SnappedDestinationPositions</code>.</p></note><p>Valid Values: <code>[-180 to 180,-90 to 90]</code></p>
 */
@property (nonatomic, strong) NSArray<NSArray<NSNumber *> *> * _Nullable destinationPositions;

/**
 <p>Set the unit system to specify the distance.</p><p>Default Value: <code>Kilometers</code></p>
 */
@property (nonatomic, assign) AWSLocationDistanceUnit distanceUnit;

/**
 <p>Specifies the mode of transport when calculating a route. Used in estimating the speed of travel and road compatibility.</p><p>The <code>TravelMode</code> you specify also determines how you specify route preferences: </p><ul><li><p>If traveling by <code>Car</code> use the <code>CarModeOptions</code> parameter.</p></li><li><p>If traveling by <code>Truck</code> use the <code>TruckModeOptions</code> parameter.</p></li></ul><note><p><code>Bicycle</code> or <code>Motorcycle</code> are only valid when using <code>Grab</code> as a data provider, and only within Southeast Asia.</p><p><code>Truck</code> is not available for Grab.</p><p>For more information about using Grab as a data provider, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/grab.html">GrabMaps</a> in the <i>Amazon Location Service Developer Guide</i>.</p></note><p>Default Value: <code>Car</code></p>
 */
@property (nonatomic, assign) AWSLocationTravelMode travelMode;

/**
 <p>Specifies route preferences when traveling by <code>Truck</code>, such as avoiding routes that use ferries or tolls, and truck specifications to consider when choosing an optimal road.</p><p>Requirements: <code>TravelMode</code> must be specified as <code>Truck</code>.</p>
 */
@property (nonatomic, strong) AWSLocationCalculateRouteTruckModeOptions * _Nullable truckModeOptions;

@end

/**
 <p>Returns the result of the route matrix calculation.</p>
 Required parameters: [RouteMatrix, Summary]
 */
@interface AWSLocationCalculateRouteMatrixResponse : AWSModel


/**
 <p>The calculated route matrix containing the results for all pairs of <code>DeparturePositions</code> to <code>DestinationPositions</code>. Each row corresponds to one entry in <code>DeparturePositions</code>. Each entry in the row corresponds to the route from that entry in <code>DeparturePositions</code> to an entry in <code>DestinationPositions</code>. </p>
 */
@property (nonatomic, strong) NSArray<NSArray<AWSLocationRouteMatrixEntry *> *> * _Nullable routeMatrix;

/**
 <p>For routes calculated using an Esri route calculator resource, departure positions are snapped to the closest road. For Esri route calculator resources, this returns the list of departure/origin positions used for calculation of the <code>RouteMatrix</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSArray<NSNumber *> *> * _Nullable snappedDeparturePositions;

/**
 <p>The list of destination positions for the route matrix used for calculation of the <code>RouteMatrix</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSArray<NSNumber *> *> * _Nullable snappedDestinationPositions;

/**
 <p>Contains information about the route matrix, <code>DataSource</code>, <code>DistanceUnit</code>, <code>RouteCount</code> and <code>ErrorCount</code>.</p>
 */
@property (nonatomic, strong) AWSLocationCalculateRouteMatrixSummary * _Nullable summary;

@end

/**
 <p>A summary of the calculated route matrix.</p>
 Required parameters: [DataSource, DistanceUnit, ErrorCount, RouteCount]
 */
@interface AWSLocationCalculateRouteMatrixSummary : AWSModel


/**
 <p>The data provider of traffic and road network data used to calculate the routes. Indicates one of the available providers:</p><ul><li><p><code>Esri</code></p></li><li><p><code>Grab</code></p></li><li><p><code>Here</code></p></li></ul><p>For more information about data providers, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon Location Service data providers</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>The unit of measurement for route distances.</p>
 */
@property (nonatomic, assign) AWSLocationDistanceUnit distanceUnit;

/**
 <p>The count of error results in the route matrix. If this number is 0, all routes were calculated successfully.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable errorCount;

/**
 <p>The count of cells in the route matrix. Equal to the number of <code>DeparturePositions</code> multiplied by the number of <code>DestinationPositions</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable routeCount;

@end

/**
 
 */
@interface AWSLocationCalculateRouteRequest : AWSRequest


/**
 <p>The name of the route calculator resource that you want to use to calculate the route. </p>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorName;

/**
 <p>Specifies route preferences when traveling by <code>Car</code>, such as avoiding routes that use ferries or tolls.</p><p>Requirements: <code>TravelMode</code> must be specified as <code>Car</code>.</p>
 */
@property (nonatomic, strong) AWSLocationCalculateRouteCarModeOptions * _Nullable carModeOptions;

/**
 <p>Sets the time of departure as the current time. Uses the current time to calculate a route. Otherwise, the best time of day to travel with the best traffic conditions is used to calculate the route.</p><p>Default Value: <code>false</code></p><p>Valid Values: <code>false</code> | <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable departNow;

/**
 <p>The start position for the route. Defined in <a href="https://earth-info.nga.mil/index.php?dir=wgs84&amp;action=wgs84">World Geodetic System (WGS 84)</a> format: <code>[longitude, latitude]</code>.</p><ul><li><p>For example, <code>[-123.115, 49.285]</code></p></li></ul><note><p>If you specify a departure that's not located on a road, Amazon Location <a href="https://docs.aws.amazon.com/location/latest/developerguide/snap-to-nearby-road.html">moves the position to the nearest road</a>. If Esri is the provider for your route calculator, specifying a route that is longer than 400 km returns a <code>400 RoutesValidationException</code> error.</p></note><p>Valid Values: <code>[-180 to 180,-90 to 90]</code></p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable departurePosition;

/**
 <p>Specifies the desired time of departure. Uses the given time to calculate the route. Otherwise, the best time of day to travel with the best traffic conditions is used to calculate the route.</p><note><p>Setting a departure time in the past returns a <code>400 ValidationException</code> error.</p></note><ul><li><p>In <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. For example, <code>2020–07-2T12:15:20.000Z+01:00</code></p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable departureTime;

/**
 <p>The finish position for the route. Defined in <a href="https://earth-info.nga.mil/index.php?dir=wgs84&amp;action=wgs84">World Geodetic System (WGS 84)</a> format: <code>[longitude, latitude]</code>.</p><ul><li><p> For example, <code>[-122.339, 47.615]</code></p></li></ul><note><p>If you specify a destination that's not located on a road, Amazon Location <a href="https://docs.aws.amazon.com/location/latest/developerguide/snap-to-nearby-road.html">moves the position to the nearest road</a>. </p></note><p>Valid Values: <code>[-180 to 180,-90 to 90]</code></p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable destinationPosition;

/**
 <p>Set the unit system to specify the distance.</p><p>Default Value: <code>Kilometers</code></p>
 */
@property (nonatomic, assign) AWSLocationDistanceUnit distanceUnit;

/**
 <p>Set to include the geometry details in the result for each path between a pair of positions.</p><p>Default Value: <code>false</code></p><p>Valid Values: <code>false</code> | <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeLegGeometry;

/**
 <p>Specifies the mode of transport when calculating a route. Used in estimating the speed of travel and road compatibility. You can choose <code>Car</code>, <code>Truck</code>, <code>Walking</code>, <code>Bicycle</code> or <code>Motorcycle</code> as options for the <code>TravelMode</code>.</p><note><p><code>Bicycle</code> and <code>Motorcycle</code> are only valid when using Grab as a data provider, and only within Southeast Asia.</p><p><code>Truck</code> is not available for Grab.</p><p>For more details on the using Grab for routing, including areas of coverage, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/grab.html">GrabMaps</a> in the <i>Amazon Location Service Developer Guide</i>.</p></note><p>The <code>TravelMode</code> you specify also determines how you specify route preferences: </p><ul><li><p>If traveling by <code>Car</code> use the <code>CarModeOptions</code> parameter.</p></li><li><p>If traveling by <code>Truck</code> use the <code>TruckModeOptions</code> parameter.</p></li></ul><p>Default Value: <code>Car</code></p>
 */
@property (nonatomic, assign) AWSLocationTravelMode travelMode;

/**
 <p>Specifies route preferences when traveling by <code>Truck</code>, such as avoiding routes that use ferries or tolls, and truck specifications to consider when choosing an optimal road.</p><p>Requirements: <code>TravelMode</code> must be specified as <code>Truck</code>.</p>
 */
@property (nonatomic, strong) AWSLocationCalculateRouteTruckModeOptions * _Nullable truckModeOptions;

/**
 <p>Specifies an ordered list of up to 23 intermediate positions to include along a route between the departure position and destination position. </p><ul><li><p>For example, from the <code>DeparturePosition</code><code>[-123.115, 49.285]</code>, the route follows the order that the waypoint positions are given <code>[[-122.757, 49.0021],[-122.349, 47.620]]</code></p></li></ul><note><p>If you specify a waypoint position that's not located on a road, Amazon Location <a href="https://docs.aws.amazon.com/location/latest/developerguide/snap-to-nearby-road.html">moves the position to the nearest road</a>. </p><p>Specifying more than 23 waypoints returns a <code>400 ValidationException</code> error.</p><p>If Esri is the provider for your route calculator, specifying a route that is longer than 400 km returns a <code>400 RoutesValidationException</code> error.</p></note><p>Valid Values: <code>[-180 to 180,-90 to 90]</code></p>
 */
@property (nonatomic, strong) NSArray<NSArray<NSNumber *> *> * _Nullable waypointPositions;

@end

/**
 <p>Returns the result of the route calculation. Metadata includes legs and route summary.</p>
 Required parameters: [Legs, Summary]
 */
@interface AWSLocationCalculateRouteResponse : AWSModel


/**
 <p>Contains details about each path between a pair of positions included along a route such as: <code>StartPosition</code>, <code>EndPosition</code>, <code>Distance</code>, <code>DurationSeconds</code>, <code>Geometry</code>, and <code>Steps</code>. The number of legs returned corresponds to one fewer than the total number of positions in the request. </p><p>For example, a route with a departure position and destination position returns one leg with the positions <a href="https://docs.aws.amazon.com/location/latest/developerguide/snap-to-nearby-road.html">snapped to a nearby road</a>:</p><ul><li><p>The <code>StartPosition</code> is the departure position.</p></li><li><p>The <code>EndPosition</code> is the destination position.</p></li></ul><p>A route with a waypoint between the departure and destination position returns two legs with the positions snapped to a nearby road:</p><ul><li><p>Leg 1: The <code>StartPosition</code> is the departure position . The <code>EndPosition</code> is the waypoint positon.</p></li><li><p>Leg 2: The <code>StartPosition</code> is the waypoint position. The <code>EndPosition</code> is the destination position.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSLocationLeg *> * _Nullable legs;

/**
 <p>Contains information about the whole route, such as: <code>RouteBBox</code>, <code>DataSource</code>, <code>Distance</code>, <code>DistanceUnit</code>, and <code>DurationSeconds</code>.</p>
 */
@property (nonatomic, strong) AWSLocationCalculateRouteSummary * _Nullable summary;

@end

/**
 <p>A summary of the calculated route.</p>
 Required parameters: [DataSource, Distance, DistanceUnit, DurationSeconds, RouteBBox]
 */
@interface AWSLocationCalculateRouteSummary : AWSModel


/**
 <p>The data provider of traffic and road network data used to calculate the route. Indicates one of the available providers:</p><ul><li><p><code>Esri</code></p></li><li><p><code>Grab</code></p></li><li><p><code>Here</code></p></li></ul><p>For more information about data providers, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon Location Service data providers</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>The total distance covered by the route. The sum of the distance travelled between every stop on the route.</p><note><p>If Esri is the data source for the route calculator, the route distance can’t be greater than 400 km. If the route exceeds 400 km, the response is a <code>400 RoutesValidationException</code> error.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable distance;

/**
 <p>The unit of measurement for route distances.</p>
 */
@property (nonatomic, assign) AWSLocationDistanceUnit distanceUnit;

/**
 <p>The total travel time for the route measured in seconds. The sum of the travel time between every stop on the route.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

/**
 <p>Specifies a geographical box surrounding a route. Used to zoom into a route when displaying it in a map. For example, <code>[min x, min y, max x, max y]</code>.</p><p>The first 2 <code>bbox</code> parameters describe the lower southwest corner: </p><ul><li><p>The first <code>bbox</code> position is the X coordinate or longitude of the lower southwest corner. </p></li><li><p>The second <code>bbox</code> position is the Y coordinate or latitude of the lower southwest corner. </p></li></ul><p>The next 2 <code>bbox</code> parameters describe the upper northeast corner: </p><ul><li><p>The third <code>bbox</code> position is the X coordinate, or longitude of the upper northeast corner. </p></li><li><p>The fourth <code>bbox</code> position is the Y coordinate, or latitude of the upper northeast corner. </p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable routeBBox;

@end

/**
 <p>Contains details about additional route preferences for requests that specify <code>TravelMode</code> as <code>Truck</code>.</p>
 */
@interface AWSLocationCalculateRouteTruckModeOptions : AWSModel


/**
 <p>Avoids ferries when calculating routes.</p><p>Default Value: <code>false</code></p><p>Valid Values: <code>false</code> | <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable avoidFerries;

/**
 <p>Avoids tolls when calculating routes.</p><p>Default Value: <code>false</code></p><p>Valid Values: <code>false</code> | <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable avoidTolls;

/**
 <p>Specifies the truck's dimension specifications including length, height, width, and unit of measurement. Used to avoid roads that can't support the truck's dimensions.</p>
 */
@property (nonatomic, strong) AWSLocationTruckDimensions * _Nullable dimensions;

/**
 <p>Specifies the truck's weight specifications including total weight and unit of measurement. Used to avoid roads that can't support the truck's weight.</p>
 */
@property (nonatomic, strong) AWSLocationTruckWeight * _Nullable weight;

@end

/**
 <p>A circle on the earth, as defined by a center point and a radius.</p>
 Required parameters: [Center, Radius]
 */
@interface AWSLocationCircle : AWSModel


/**
 <p>A single point geometry, specifying the center of the circle, using <a href="https://gisgeography.com/wgs84-world-geodetic-system/">WGS 84</a> coordinates, in the form <code>[longitude, latitude]</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable center;

/**
 <p>The radius of the circle in meters. Must be greater than zero and no larger than 100,000 (100 kilometers).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable radius;

@end

/**
 
 */
@interface AWSLocationCreateGeofenceCollectionRequest : AWSRequest


/**
 <p>A custom name for the geofence collection.</p><p>Requirements:</p><ul><li><p>Contain only alphanumeric characters (A–Z, a–z, 0–9), hyphens (-), periods (.), and underscores (_). </p></li><li><p>Must be a unique geofence collection name.</p></li><li><p>No spaces allowed. For example, <code>ExampleGeofenceCollection</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>An optional description for the geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A key identifier for an <a href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">Amazon Web Services KMS customer managed key</a>. Enter a key ID, key ARN, alias name, or alias ARN. </p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>No longer used. If included, the only allowed value is <code>RequestBasedUsage</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>This parameter is no longer used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pricingPlanDataSource;

/**
 <p>Applies one or more tags to the geofence collection. A tag is a key-value pair helps manage, identify, search, and filter your resources by labelling them.</p><p>Format: <code>"key" : "value"</code></p><p>Restrictions:</p><ul><li><p>Maximum 50 tags per resource</p></li><li><p>Each resource tag must be unique with a maximum of one value.</p></li><li><p>Maximum key length: 128 Unicode characters in UTF-8</p></li><li><p>Maximum value length: 256 Unicode characters in UTF-8</p></li><li><p>Can use alphanumeric characters (A–Z, a–z, 0–9), and the following characters: + - = . _ : / @. </p></li><li><p>Cannot use "aws:" as a prefix for a key.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLocationCreateGeofenceCollectionResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the geofence collection resource. Used when you need to specify a resource across all Amazon Web Services. </p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollection</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable collectionArn;

/**
 <p>The name for the geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>The timestamp for when the geofence collection was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

@end

/**
 
 */
@interface AWSLocationCreateKeyRequest : AWSRequest


/**
 <p>An optional description for the API key resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The optional timestamp for when the API key resource will expire in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. One of <code>NoExpiry</code> or <code>ExpireTime</code> must be set.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expireTime;

/**
 <p>A custom name for the API key resource.</p><p>Requirements:</p><ul><li><p>Contain only alphanumeric characters (A–Z, a–z, 0–9), hyphens (-), periods (.), and underscores (_). </p></li><li><p>Must be a unique API key name.</p></li><li><p>No spaces allowed. For example, <code>ExampleAPIKey</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

/**
 <p>Optionally set to <code>true</code> to set no expiration time for the API key. One of <code>NoExpiry</code> or <code>ExpireTime</code> must be set.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable noExpiry;

/**
 <p>The API key restrictions for the API key resource.</p>
 */
@property (nonatomic, strong) AWSLocationApiKeyRestrictions * _Nullable restrictions;

/**
 <p>Applies one or more tags to the map resource. A tag is a key-value pair that helps manage, identify, search, and filter your resources by labelling them.</p><p>Format: <code>"key" : "value"</code></p><p>Restrictions:</p><ul><li><p>Maximum 50 tags per resource</p></li><li><p>Each resource tag must be unique with a maximum of one value.</p></li><li><p>Maximum key length: 128 Unicode characters in UTF-8</p></li><li><p>Maximum value length: 256 Unicode characters in UTF-8</p></li><li><p>Can use alphanumeric characters (A–Z, a–z, 0–9), and the following characters: + - = . _ : / @. </p></li><li><p>Cannot use "aws:" as a prefix for a key.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLocationCreateKeyResponse : AWSModel


/**
 <p>The timestamp for when the API key resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The key value/string of an API key. This value is used when making API calls to authorize the call. For example, see <a href="https://docs.aws.amazon.com/location/latest/APIReference/API_GetMapGlyphs.html">GetMapGlyphs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The Amazon Resource Name (ARN) for the API key resource. Used when you need to specify a resource across all Amazon Web Services.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:key/ExampleKey</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyArn;

/**
 <p>The name of the API key resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

@end

/**
 
 */
@interface AWSLocationCreateMapRequest : AWSRequest


/**
 <p>Specifies the <code>MapConfiguration</code>, including the map style, for the map resource that you create. The map style defines the look of maps and the data provider for your map resource.</p>
 */
@property (nonatomic, strong) AWSLocationMapConfiguration * _Nullable configuration;

/**
 <p>An optional description for the map resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name for the map resource.</p><p>Requirements:</p><ul><li><p>Must contain only alphanumeric characters (A–Z, a–z, 0–9), hyphens (-), periods (.), and underscores (_). </p></li><li><p>Must be a unique map resource name. </p></li><li><p>No spaces allowed. For example, <code>ExampleMap</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

/**
 <p>No longer used. If included, the only allowed value is <code>RequestBasedUsage</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>Applies one or more tags to the map resource. A tag is a key-value pair helps manage, identify, search, and filter your resources by labelling them.</p><p>Format: <code>"key" : "value"</code></p><p>Restrictions:</p><ul><li><p>Maximum 50 tags per resource</p></li><li><p>Each resource tag must be unique with a maximum of one value.</p></li><li><p>Maximum key length: 128 Unicode characters in UTF-8</p></li><li><p>Maximum value length: 256 Unicode characters in UTF-8</p></li><li><p>Can use alphanumeric characters (A–Z, a–z, 0–9), and the following characters: + - = . _ : / @. </p></li><li><p>Cannot use "aws:" as a prefix for a key.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLocationCreateMapResponse : AWSModel


/**
 <p>The timestamp for when the map resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The Amazon Resource Name (ARN) for the map resource. Used to specify a resource across all Amazon Web Services.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:map/ExampleMap</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable mapArn;

/**
 <p>The name of the map resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

@end

/**
 
 */
@interface AWSLocationCreatePlaceIndexRequest : AWSRequest


/**
 <p>Specifies the geospatial data provider for the new place index.</p><note><p>This field is case-sensitive. Enter the valid values as shown. For example, entering <code>HERE</code> returns an error.</p></note><p>Valid values include:</p><ul><li><p><code>Esri</code> – For additional information about <a href="https://docs.aws.amazon.com/location/latest/developerguide/esri.html">Esri</a>'s coverage in your region of interest, see <a href="https://developers.arcgis.com/rest/geocode/api-reference/geocode-coverage.htm">Esri details on geocoding coverage</a>.</p></li><li><p><code>Grab</code> – Grab provides place index functionality for Southeast Asia. For additional information about <a href="https://docs.aws.amazon.com/location/latest/developerguide/grab.html">GrabMaps</a>' coverage, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/grab.html#grab-coverage-area">GrabMaps countries and areas covered</a>.</p></li><li><p><code>Here</code> – For additional information about <a href="https://docs.aws.amazon.com/location/latest/developerguide/HERE.html">HERE Technologies</a>' coverage in your region of interest, see <a href="https://developer.here.com/documentation/geocoder/dev_guide/topics/coverage-geocoder.html">HERE details on goecoding coverage</a>.</p><important><p>If you specify HERE Technologies (<code>Here</code>) as the data provider, you may not <a href="https://docs.aws.amazon.com/location-places/latest/APIReference/API_DataSourceConfiguration.html">store results</a> for locations in Japan. For more information, see the <a href="http://aws.amazon.com/service-terms/">Amazon Web Services Service Terms</a> for Amazon Location Service.</p></important></li></ul><p>For additional information , see <a href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Data providers</a> on the <i>Amazon Location Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>Specifies the data storage option requesting Places.</p>
 */
@property (nonatomic, strong) AWSLocationDataSourceConfiguration * _Nullable dataSourceConfiguration;

/**
 <p>The optional description for the place index resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the place index resource. </p><p>Requirements:</p><ul><li><p>Contain only alphanumeric characters (A–Z, a–z, 0–9), hyphens (-), periods (.), and underscores (_).</p></li><li><p>Must be a unique place index resource name.</p></li><li><p>No spaces allowed. For example, <code>ExamplePlaceIndex</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>No longer used. If included, the only allowed value is <code>RequestBasedUsage</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>Applies one or more tags to the place index resource. A tag is a key-value pair that helps you manage, identify, search, and filter your resources.</p><p>Format: <code>"key" : "value"</code></p><p>Restrictions:</p><ul><li><p>Maximum 50 tags per resource.</p></li><li><p>Each tag key must be unique and must have exactly one associated value.</p></li><li><p>Maximum key length: 128 Unicode characters in UTF-8.</p></li><li><p>Maximum value length: 256 Unicode characters in UTF-8.</p></li><li><p>Can use alphanumeric characters (A–Z, a–z, 0–9), and the following characters: + - = . _ : / @</p></li><li><p>Cannot use "aws:" as a prefix for a key.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLocationCreatePlaceIndexResponse : AWSModel


/**
 <p>The timestamp for when the place index resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The Amazon Resource Name (ARN) for the place index resource. Used to specify a resource across Amazon Web Services. </p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:place-index/ExamplePlaceIndex</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable indexArn;

/**
 <p>The name for the place index resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

@end

/**
 
 */
@interface AWSLocationCreateRouteCalculatorRequest : AWSRequest


/**
 <p>The name of the route calculator resource. </p><p>Requirements:</p><ul><li><p>Can use alphanumeric characters (A–Z, a–z, 0–9) , hyphens (-), periods (.), and underscores (_).</p></li><li><p>Must be a unique Route calculator resource name.</p></li><li><p>No spaces allowed. For example, <code>ExampleRouteCalculator</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorName;

/**
 <p>Specifies the data provider of traffic and road network data.</p><note><p>This field is case-sensitive. Enter the valid values as shown. For example, entering <code>HERE</code> returns an error.</p></note><p>Valid values include:</p><ul><li><p><code>Esri</code> – For additional information about <a href="https://docs.aws.amazon.com/location/latest/developerguide/esri.html">Esri</a>'s coverage in your region of interest, see <a href="https://doc.arcgis.com/en/arcgis-online/reference/network-coverage.htm">Esri details on street networks and traffic coverage</a>.</p><p>Route calculators that use Esri as a data source only calculate routes that are shorter than 400 km.</p></li><li><p><code>Grab</code> – Grab provides routing functionality for Southeast Asia. For additional information about <a href="https://docs.aws.amazon.com/location/latest/developerguide/grab.html">GrabMaps</a>' coverage, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/grab.html#grab-coverage-area">GrabMaps countries and areas covered</a>.</p></li><li><p><code>Here</code> – For additional information about <a href="https://docs.aws.amazon.com/location/latest/developerguide/HERE.html">HERE Technologies</a>' coverage in your region of interest, see <a href="https://developer.here.com/documentation/routing-api/dev_guide/topics/coverage/car-routing.html">HERE car routing coverage</a> and <a href="https://developer.here.com/documentation/routing-api/dev_guide/topics/coverage/truck-routing.html">HERE truck routing coverage</a>.</p></li></ul><p>For additional information , see <a href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Data providers</a> on the <i>Amazon Location Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>The optional description for the route calculator resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>No longer used. If included, the only allowed value is <code>RequestBasedUsage</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>Applies one or more tags to the route calculator resource. A tag is a key-value pair helps manage, identify, search, and filter your resources by labelling them.</p><ul><li><p>For example: { <code>"tag1" : "value1"</code>, <code>"tag2" : "value2"</code>}</p></li></ul><p>Format: <code>"key" : "value"</code></p><p>Restrictions:</p><ul><li><p>Maximum 50 tags per resource</p></li><li><p>Each resource tag must be unique with a maximum of one value.</p></li><li><p>Maximum key length: 128 Unicode characters in UTF-8</p></li><li><p>Maximum value length: 256 Unicode characters in UTF-8</p></li><li><p>Can use alphanumeric characters (A–Z, a–z, 0–9), and the following characters: + - = . _ : / @. </p></li><li><p>Cannot use "aws:" as a prefix for a key.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLocationCreateRouteCalculatorResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the route calculator resource. Use the ARN when you specify a resource across all Amazon Web Services.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:route-calculator/ExampleCalculator</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorArn;

/**
 <p>The name of the route calculator resource. </p><ul><li><p>For example, <code>ExampleRouteCalculator</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorName;

/**
 <p>The timestamp when the route calculator resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p><ul><li><p>For example, <code>2020–07-2T12:15:20.000Z+01:00</code></p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

@end

/**
 
 */
@interface AWSLocationCreateTrackerRequest : AWSRequest


/**
 <p>An optional description for the tracker resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A key identifier for an <a href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">Amazon Web Services KMS customer managed key</a>. Enter a key ID, key ARN, alias name, or alias ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>Specifies the position filtering for the tracker resource.</p><p>Valid values:</p><ul><li><p><code>TimeBased</code> - Location updates are evaluated against linked geofence collections, but not every location update is stored. If your update frequency is more often than 30 seconds, only one update per 30 seconds is stored for each unique device ID. </p></li><li><p><code>DistanceBased</code> - If the device has moved less than 30 m (98.4 ft), location updates are ignored. Location updates within this area are neither evaluated against linked geofence collections, nor stored. This helps control costs by reducing the number of geofence evaluations and historical device positions to paginate through. Distance-based filtering can also reduce the effects of GPS noise when displaying device trajectories on a map. </p></li><li><p><code>AccuracyBased</code> - If the device has moved less than the measured accuracy, location updates are ignored. For example, if two consecutive updates from a device have a horizontal accuracy of 5 m and 10 m, the second update is ignored if the device has moved less than 15 m. Ignored location updates are neither evaluated against linked geofence collections, nor stored. This can reduce the effects of GPS noise when displaying device trajectories on a map, and can help control your costs by reducing the number of geofence evaluations. </p></li></ul><p>This field is optional. If not specified, the default value is <code>TimeBased</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPositionFiltering positionFiltering;

/**
 <p>No longer used. If included, the only allowed value is <code>RequestBasedUsage</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>This parameter is no longer used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pricingPlanDataSource;

/**
 <p>Applies one or more tags to the tracker resource. A tag is a key-value pair helps manage, identify, search, and filter your resources by labelling them.</p><p>Format: <code>"key" : "value"</code></p><p>Restrictions:</p><ul><li><p>Maximum 50 tags per resource</p></li><li><p>Each resource tag must be unique with a maximum of one value.</p></li><li><p>Maximum key length: 128 Unicode characters in UTF-8</p></li><li><p>Maximum value length: 256 Unicode characters in UTF-8</p></li><li><p>Can use alphanumeric characters (A–Z, a–z, 0–9), and the following characters: + - = . _ : / @. </p></li><li><p>Cannot use "aws:" as a prefix for a key.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The name for the tracker resource.</p><p>Requirements:</p><ul><li><p>Contain only alphanumeric characters (A-Z, a-z, 0-9) , hyphens (-), periods (.), and underscores (_).</p></li><li><p>Must be a unique tracker resource name.</p></li><li><p>No spaces allowed. For example, <code>ExampleTracker</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationCreateTrackerResponse : AWSModel


/**
 <p>The timestamp for when the tracker resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The Amazon Resource Name (ARN) for the tracker resource. Used when you need to specify a resource across all Amazon Web Services.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:tracker/ExampleTracker</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable trackerArn;

/**
 <p>The name of the tracker resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 <p>Specifies the data storage option chosen for requesting Places.</p><important><p>When using Amazon Location Places:</p><ul><li><p>If using HERE Technologies as a data provider, you can't store results for locations in Japan by setting <code>IntendedUse</code> to <code>Storage</code>. parameter.</p></li><li><p>Under the <code>MobileAssetTracking</code> or <code>MobilAssetManagement</code> pricing plan, you can't store results from your place index resources by setting <code>IntendedUse</code> to <code>Storage</code>. This returns a validation exception error.</p></li></ul><p>For more information, see the <a href="https://aws.amazon.com/service-terms/">AWS Service Terms</a> for Amazon Location Service.</p></important>
 */
@interface AWSLocationDataSourceConfiguration : AWSModel


/**
 <p>Specifies how the results of an operation will be stored by the caller. </p><p>Valid values include:</p><ul><li><p><code>SingleUse</code> specifies that the results won't be stored. </p></li><li><p><code>Storage</code> specifies that the result can be cached or stored in a database.</p></li></ul><p>Default value: <code>SingleUse</code></p>
 */
@property (nonatomic, assign) AWSLocationIntendedUse intendedUse;

@end

/**
 
 */
@interface AWSLocationDeleteGeofenceCollectionRequest : AWSRequest


/**
 <p>The name of the geofence collection to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

@end

/**
 
 */
@interface AWSLocationDeleteGeofenceCollectionResponse : AWSModel


@end

/**
 
 */
@interface AWSLocationDeleteKeyRequest : AWSRequest


/**
 <p>The name of the API key to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

@end

/**
 
 */
@interface AWSLocationDeleteKeyResponse : AWSModel


@end

/**
 
 */
@interface AWSLocationDeleteMapRequest : AWSRequest


/**
 <p>The name of the map resource to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

@end

/**
 
 */
@interface AWSLocationDeleteMapResponse : AWSModel


@end

/**
 
 */
@interface AWSLocationDeletePlaceIndexRequest : AWSRequest


/**
 <p>The name of the place index resource to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

@end

/**
 
 */
@interface AWSLocationDeletePlaceIndexResponse : AWSModel


@end

/**
 
 */
@interface AWSLocationDeleteRouteCalculatorRequest : AWSRequest


/**
 <p>The name of the route calculator resource to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorName;

@end

/**
 
 */
@interface AWSLocationDeleteRouteCalculatorResponse : AWSModel


@end

/**
 
 */
@interface AWSLocationDeleteTrackerRequest : AWSRequest


/**
 <p>The name of the tracker resource to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationDeleteTrackerResponse : AWSModel


@end

/**
 
 */
@interface AWSLocationDescribeGeofenceCollectionRequest : AWSRequest


/**
 <p>The name of the geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

@end

/**
 
 */
@interface AWSLocationDescribeGeofenceCollectionResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the geofence collection resource. Used when you need to specify a resource across all Amazon Web Services. </p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollection</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable collectionArn;

/**
 <p>The name of the geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>The timestamp for when the geofence resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The optional description for the geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A key identifier for an <a href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">Amazon Web Services KMS customer managed key</a> assigned to the Amazon Location resource</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>No longer used. Always returns <code>RequestBasedUsage</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>No longer used. Always returns an empty string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pricingPlanDataSource;

/**
 <p>Displays the key, value pairs of tags associated with this resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The timestamp for when the geofence collection was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationDescribeKeyRequest : AWSRequest


/**
 <p>The name of the API key resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

@end

/**
 
 */
@interface AWSLocationDescribeKeyResponse : AWSModel


/**
 <p>The timestamp for when the API key resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The optional description for the API key resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The timestamp for when the API key resource will expire in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable expireTime;

/**
 <p>The key value/string of an API key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The Amazon Resource Name (ARN) for the API key resource. Used when you need to specify a resource across all Amazon Web Services.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:key/ExampleKey</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyArn;

/**
 <p>The name of the API key resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

/**
 <p>API Restrictions on the allowed actions, resources, and referers for an API key resource.</p>
 */
@property (nonatomic, strong) AWSLocationApiKeyRestrictions * _Nullable restrictions;

/**
 <p>Tags associated with the API key resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The timestamp for when the API key resource was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationDescribeMapRequest : AWSRequest


/**
 <p>The name of the map resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

@end

/**
 
 */
@interface AWSLocationDescribeMapResponse : AWSModel


/**
 <p>Specifies the map tile style selected from a partner data provider.</p>
 */
@property (nonatomic, strong) AWSLocationMapConfiguration * _Nullable configuration;

/**
 <p>The timestamp for when the map resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>Specifies the data provider for the associated map tiles.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>The optional description for the map resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The Amazon Resource Name (ARN) for the map resource. Used to specify a resource across all Amazon Web Services.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:map/ExampleMap</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable mapArn;

/**
 <p>The map style selected from an available provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

/**
 <p>No longer used. Always returns <code>RequestBasedUsage</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>Tags associated with the map resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The timestamp for when the map resource was last update in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationDescribePlaceIndexRequest : AWSRequest


/**
 <p>The name of the place index resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

@end

/**
 
 */
@interface AWSLocationDescribePlaceIndexResponse : AWSModel


/**
 <p>The timestamp for when the place index resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The data provider of geospatial data. Values can be one of the following:</p><ul><li><p><code>Esri</code></p></li><li><p><code>Grab</code></p></li><li><p><code>Here</code></p></li></ul><p>For more information about data providers, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon Location Service data providers</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>The specified data storage option for requesting Places.</p>
 */
@property (nonatomic, strong) AWSLocationDataSourceConfiguration * _Nullable dataSourceConfiguration;

/**
 <p>The optional description for the place index resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The Amazon Resource Name (ARN) for the place index resource. Used to specify a resource across Amazon Web Services. </p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:place-index/ExamplePlaceIndex</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable indexArn;

/**
 <p>The name of the place index resource being described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>No longer used. Always returns <code>RequestBasedUsage</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>Tags associated with place index resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The timestamp for when the place index resource was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationDescribeRouteCalculatorRequest : AWSRequest


/**
 <p>The name of the route calculator resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorName;

@end

/**
 
 */
@interface AWSLocationDescribeRouteCalculatorResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the Route calculator resource. Use the ARN when you specify a resource across Amazon Web Services.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:route-calculator/ExampleCalculator</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorArn;

/**
 <p>The name of the route calculator resource being described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorName;

/**
 <p>The timestamp when the route calculator resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p><ul><li><p>For example, <code>2020–07-2T12:15:20.000Z+01:00</code></p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The data provider of traffic and road network data. Indicates one of the available providers:</p><ul><li><p><code>Esri</code></p></li><li><p><code>Grab</code></p></li><li><p><code>Here</code></p></li></ul><p>For more information about data providers, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon Location Service data providers</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>The optional description of the route calculator resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Always returns <code>RequestBasedUsage</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>Tags associated with route calculator resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The timestamp when the route calculator resource was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p><ul><li><p>For example, <code>2020–07-2T12:15:20.000Z+01:00</code></p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationDescribeTrackerRequest : AWSRequest


/**
 <p>The name of the tracker resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationDescribeTrackerResponse : AWSModel


/**
 <p>The timestamp for when the tracker resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The optional description for the tracker resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A key identifier for an <a href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">Amazon Web Services KMS customer managed key</a> assigned to the Amazon Location resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The position filtering method of the tracker resource.</p>
 */
@property (nonatomic, assign) AWSLocationPositionFiltering positionFiltering;

/**
 <p>Always returns <code>RequestBasedUsage</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>No longer used. Always returns an empty string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pricingPlanDataSource;

/**
 <p>The tags associated with the tracker resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The Amazon Resource Name (ARN) for the tracker resource. Used when you need to specify a resource across all Amazon Web Services.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:tracker/ExampleTracker</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable trackerArn;

/**
 <p>The name of the tracker resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

/**
 <p>The timestamp for when the tracker resource was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 <p>Contains the device position details.</p>
 Required parameters: [Position, ReceivedTime, SampleTime]
 */
@interface AWSLocationDevicePosition : AWSModel


/**
 <p>The accuracy of the device position.</p>
 */
@property (nonatomic, strong) AWSLocationPositionalAccuracy * _Nullable accuracy;

/**
 <p>The device whose position you retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>The last known device position.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable position;

/**
 <p>The properties associated with the position.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable positionProperties;

/**
 <p>The timestamp for when the tracker resource received the device position in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable receivedTime;

/**
 <p>The timestamp at which the device's position was determined. Uses <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable sampleTime;

@end

/**
 <p>Contains the position update details for a device.</p>
 Required parameters: [DeviceId, Position, SampleTime]
 */
@interface AWSLocationDevicePositionUpdate : AWSModel


/**
 <p>The accuracy of the device position.</p>
 */
@property (nonatomic, strong) AWSLocationPositionalAccuracy * _Nullable accuracy;

/**
 <p>The device associated to the position update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>The latest device position defined in <a href="https://earth-info.nga.mil/index.php?dir=wgs84&amp;action=wgs84">WGS 84</a> format: <code>[X or longitude, Y or latitude]</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable position;

/**
 <p>Associates one of more properties with the position update. A property is a key-value pair stored with the position update and added to any geofence event the update may trigger.</p><p>Format: <code>"key" : "value"</code></p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable positionProperties;

/**
 <p>The timestamp at which the device's position was determined. Uses <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable sampleTime;

@end

/**
 
 */
@interface AWSLocationDisassociateTrackerConsumerRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) for the geofence collection to be disassociated from the tracker resource. Used when you need to specify a resource across all Amazon Web Services. </p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollectionConsumer</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable consumerArn;

/**
 <p>The name of the tracker resource to be dissociated from the consumer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationDisassociateTrackerConsumerResponse : AWSModel


@end

/**
 <p>Contains the geofence geometry details.</p><p>A geofence geometry is made up of either a polygon or a circle. Can be either a polygon or a circle. Including both will return a validation error.</p><note><p>Amazon Location doesn't currently support polygons with holes, multipolygons, polygons that are wound clockwise, or that cross the antimeridian. </p></note>
 */
@interface AWSLocationGeofenceGeometry : AWSModel


/**
 <p>A circle on the earth, as defined by a center point and a radius.</p>
 */
@property (nonatomic, strong) AWSLocationCircle * _Nullable circle;

/**
 <p>A polygon is a list of linear rings which are each made up of a list of vertices.</p><p>Each vertex is a 2-dimensional point of the form: <code>[longitude, latitude]</code>. This is represented as an array of doubles of length 2 (so <code>[double, double]</code>).</p><p>An array of 4 or more vertices, where the first and last vertex are the same (to form a closed boundary), is called a linear ring. The linear ring vertices must be listed in counter-clockwise order around the ring’s interior. The linear ring is represented as an array of vertices, or an array of arrays of doubles (<code>[[double, double], ...]</code>).</p><p>A geofence consists of a single linear ring. To allow for future expansion, the Polygon parameter takes an array of linear rings, which is represented as an array of arrays of arrays of doubles (<code>[[[double, double], ...], ...]</code>).</p><p>A linear ring for use in geofences can consist of between 4 and 1,000 vertices.</p>
 */
@property (nonatomic, strong) NSArray<NSArray<NSArray<NSNumber *> *> *> * _Nullable polygon;

@end

/**
 
 */
@interface AWSLocationGetDevicePositionHistoryRequest : AWSRequest


/**
 <p>The device whose position history you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>Specify the end time for the position history in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. By default, the value will be the time that the request is made.</p><p>Requirement:</p><ul><li><p>The time specified for <code>EndTimeExclusive</code> must be after the time for <code>StartTimeInclusive</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable endTimeExclusive;

/**
 <p>An optional limit for the number of device positions returned in a single call.</p><p>Default value: <code>100</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p><p>Default value: <code>null</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Specify the start time for the position history in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. By default, the value will be 24 hours prior to the time that the request is made.</p><p>Requirement:</p><ul><li><p>The time specified for <code>StartTimeInclusive</code> must be before <code>EndTimeExclusive</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable startTimeInclusive;

/**
 <p>The tracker resource receiving the request for the device position history.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationGetDevicePositionHistoryResponse : AWSModel


/**
 <p>Contains the position history details for the requested device.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationDevicePosition *> * _Nullable devicePositions;

/**
 <p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLocationGetDevicePositionRequest : AWSRequest


/**
 <p>The device whose position you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>The tracker resource receiving the position update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationGetDevicePositionResponse : AWSModel


/**
 <p>The accuracy of the device position.</p>
 */
@property (nonatomic, strong) AWSLocationPositionalAccuracy * _Nullable accuracy;

/**
 <p>The device whose position you retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>The last known device position.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable position;

/**
 <p>The properties associated with the position.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable positionProperties;

/**
 <p>The timestamp for when the tracker resource received the device position in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601 </a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable receivedTime;

/**
 <p>The timestamp at which the device's position was determined. Uses <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601 </a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable sampleTime;

@end

/**
 
 */
@interface AWSLocationGetGeofenceRequest : AWSRequest


/**
 <p>The geofence collection storing the target geofence.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>The geofence you're retrieving details for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geofenceId;

@end

/**
 
 */
@interface AWSLocationGetGeofenceResponse : AWSModel


/**
 <p>The timestamp for when the geofence collection was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The geofence identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geofenceId;

/**
 <p>Contains additional user-defined properties stored with the geofence. An array of key-value pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable geofenceProperties;

/**
 <p>Contains the geofence geometry details describing a polygon or a circle.</p>
 */
@property (nonatomic, strong) AWSLocationGeofenceGeometry * _Nullable geometry;

/**
 <p>Identifies the state of the geofence. A geofence will hold one of the following states:</p><ul><li><p><code>ACTIVE</code> — The geofence has been indexed by the system. </p></li><li><p><code>PENDING</code> — The geofence is being processed by the system.</p></li><li><p><code>FAILED</code> — The geofence failed to be indexed by the system.</p></li><li><p><code>DELETED</code> — The geofence has been deleted from the system index.</p></li><li><p><code>DELETING</code> — The geofence is being deleted from the system index.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The timestamp for when the geofence collection was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationGetMapGlyphsRequest : AWSRequest


/**
 <p>A comma-separated list of fonts to load glyphs from in order of preference. For example, <code>Noto Sans Regular, Arial Unicode</code>.</p><p>Valid fonts stacks for <a href="https://docs.aws.amazon.com/location/latest/developerguide/esri.html">Esri</a> styles: </p><ul><li><p>VectorEsriDarkGrayCanvas – <code>Ubuntu Medium Italic</code> | <code>Ubuntu Medium</code> | <code>Ubuntu Italic</code> | <code>Ubuntu Regular</code> | <code>Ubuntu Bold</code></p></li><li><p>VectorEsriLightGrayCanvas – <code>Ubuntu Italic</code> | <code>Ubuntu Regular</code> | <code>Ubuntu Light</code> | <code>Ubuntu Bold</code></p></li><li><p>VectorEsriTopographic – <code>Noto Sans Italic</code> | <code>Noto Sans Regular</code> | <code>Noto Sans Bold</code> | <code>Noto Serif Regular</code> | <code>Roboto Condensed Light Italic</code></p></li><li><p>VectorEsriStreets – <code>Arial Regular</code> | <code>Arial Italic</code> | <code>Arial Bold</code></p></li><li><p>VectorEsriNavigation – <code>Arial Regular</code> | <code>Arial Italic</code> | <code>Arial Bold</code></p></li></ul><p>Valid font stacks for <a href="https://docs.aws.amazon.com/location/latest/developerguide/HERE.html">HERE Technologies</a> styles:</p><ul><li><p>VectorHereContrast – <code>Fira GO Regular</code> | <code>Fira GO Bold</code></p></li><li><p>VectorHereExplore, VectorHereExploreTruck, HybridHereExploreSatellite – <code>Fira GO Italic</code> | <code>Fira GO Map</code> | <code>Fira GO Map Bold</code> | <code>Noto Sans CJK JP Bold</code> | <code>Noto Sans CJK JP Light</code> | <code>Noto Sans CJK JP Regular</code></p></li></ul><p>Valid font stacks for <a href="https://docs.aws.amazon.com/location/latest/developerguide/grab.html">GrabMaps</a> styles:</p><ul><li><p>VectorGrabStandardLight, VectorGrabStandardDark – <code>Noto Sans Regular</code> | <code>Noto Sans Medium</code> | <code>Noto Sans Bold</code></p></li></ul><p>Valid font stacks for <a href="https://docs.aws.amazon.com/location/latest/developerguide/open-data.html">Open Data</a> styles:</p><ul><li><p>VectorOpenDataStandardLight, VectorOpenDataStandardDark, VectorOpenDataVisualizationLight, VectorOpenDataVisualizationDark – <code>Amazon Ember Regular,Noto Sans Regular</code> | <code>Amazon Ember Bold,Noto Sans Bold</code> | <code>Amazon Ember Medium,Noto Sans Medium</code> | <code>Amazon Ember Regular Italic,Noto Sans Italic</code> | <code>Amazon Ember Condensed RC Regular,Noto Sans Regular</code> | <code>Amazon Ember Condensed RC Bold,Noto Sans Bold</code> | <code>Amazon Ember Regular,Noto Sans Regular,Noto Sans Arabic Regular</code> | <code>Amazon Ember Condensed RC Bold,Noto Sans Bold,Noto Sans Arabic Condensed Bold</code> | <code>Amazon Ember Bold,Noto Sans Bold,Noto Sans Arabic Bold</code> | <code>Amazon Ember Regular Italic,Noto Sans Italic,Noto Sans Arabic Regular</code> | <code>Amazon Ember Condensed RC Regular,Noto Sans Regular,Noto Sans Arabic Condensed Regular</code> | <code>Amazon Ember Medium,Noto Sans Medium,Noto Sans Arabic Medium</code></p></li></ul><note><p>The fonts used by the Open Data map styles are combined fonts that use <code>Amazon Ember</code> for most glyphs but <code>Noto Sans</code> for glyphs unsupported by <code>Amazon Ember</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable fontStack;

/**
 <p>A Unicode range of characters to download glyphs for. Each response will contain 256 characters. For example, 0–255 includes all characters from range <code>U+0000</code> to <code>00FF</code>. Must be aligned to multiples of 256.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fontUnicodeRange;

/**
 <p>The optional <a href="https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html">API key</a> to authorize the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The map resource associated with the glyph ﬁle.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

@end

/**
 
 */
@interface AWSLocationGetMapGlyphsResponse : AWSModel


/**
 <p>The glyph, as binary blob.</p>
 */
@property (nonatomic, strong) NSData * _Nullable blob;

/**
 <p>The HTTP Cache-Control directive for the value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheControl;

/**
 <p>The map glyph content type. For example, <code>application/octet-stream</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

@end

/**
 
 */
@interface AWSLocationGetMapSpritesRequest : AWSRequest


/**
 <p>The name of the sprite ﬁle. Use the following ﬁle names for the sprite sheet:</p><ul><li><p><code>sprites.png</code></p></li><li><p><code>sprites@2x.png</code> for high pixel density displays</p></li></ul><p>For the JSON document containing image offsets. Use the following ﬁle names:</p><ul><li><p><code>sprites.json</code></p></li><li><p><code>sprites@2x.json</code> for high pixel density displays</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable fileName;

/**
 <p>The optional <a href="https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html">API key</a> to authorize the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The map resource associated with the sprite ﬁle.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

@end

/**
 
 */
@interface AWSLocationGetMapSpritesResponse : AWSModel


/**
 <p>Contains the body of the sprite sheet or JSON offset ﬁle.</p>
 */
@property (nonatomic, strong) NSData * _Nullable blob;

/**
 <p>The HTTP Cache-Control directive for the value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheControl;

/**
 <p>The content type of the sprite sheet and offsets. For example, the sprite sheet content type is <code>image/png</code>, and the sprite offset JSON document is <code>application/json</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

@end

/**
 
 */
@interface AWSLocationGetMapStyleDescriptorRequest : AWSRequest


/**
 <p>The optional <a href="https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html">API key</a> to authorize the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The map resource to retrieve the style descriptor from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

@end

/**
 
 */
@interface AWSLocationGetMapStyleDescriptorResponse : AWSModel


/**
 <p>Contains the body of the style descriptor.</p>
 */
@property (nonatomic, strong) NSData * _Nullable blob;

/**
 <p>The HTTP Cache-Control directive for the value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheControl;

/**
 <p>The style descriptor's content type. For example, <code>application/json</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

@end

/**
 
 */
@interface AWSLocationGetMapTileRequest : AWSRequest


/**
 <p>The optional <a href="https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html">API key</a> to authorize the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The map resource to retrieve the map tiles from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

/**
 <p>The X axis value for the map tile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable X;

/**
 <p>The Y axis value for the map tile. </p>
 */
@property (nonatomic, strong) NSString * _Nullable Y;

/**
 <p>The zoom value for the map tile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable Z;

@end

/**
 
 */
@interface AWSLocationGetMapTileResponse : AWSModel


/**
 <p>Contains Mapbox Vector Tile (MVT) data.</p>
 */
@property (nonatomic, strong) NSData * _Nullable blob;

/**
 <p>The HTTP Cache-Control directive for the value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheControl;

/**
 <p>The map tile's content type. For example, <code>application/vnd.mapbox-vector-tile</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

@end

/**
 
 */
@interface AWSLocationGetPlaceRequest : AWSRequest


/**
 <p>The name of the place index resource that you want to use for the search.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The preferred language used to return results. The value must be a valid <a href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for example, <code>en</code> for English.</p><p>This setting affects the languages used in the results, but not the results themselves. If no language is specified, or not supported for a particular result, the partner automatically chooses a language for the result.</p><p>For an example, we'll use the Greek language. You search for a location around Athens, Greece, with the <code>language</code> parameter set to <code>en</code>. The <code>city</code> in the results will most likely be returned as <code>Athens</code>.</p><p>If you set the <code>language</code> parameter to <code>el</code>, for Greek, then the <code>city</code> in the results will more likely be returned as <code>Αθήνα</code>.</p><p>If the data provider does not have a value for Greek, the result will be in a language that the provider does support.</p>
 */
@property (nonatomic, strong) NSString * _Nullable language;

/**
 <p>The identifier of the place to find.</p>
 */
@property (nonatomic, strong) NSString * _Nullable placeId;

@end

/**
 
 */
@interface AWSLocationGetPlaceResponse : AWSModel


/**
 <p>Details about the result, such as its address and position.</p>
 */
@property (nonatomic, strong) AWSLocationPlace * _Nullable place;

@end

/**
 <p>Contains the calculated route's details for each path between a pair of positions. The number of legs returned corresponds to one fewer than the total number of positions in the request. </p><p>For example, a route with a departure position and destination position returns one leg with the positions <a href="https://docs.aws.amazon.com/location/latest/developerguide/snap-to-nearby-road.html">snapped to a nearby road</a>:</p><ul><li><p>The <code>StartPosition</code> is the departure position.</p></li><li><p>The <code>EndPosition</code> is the destination position.</p></li></ul><p>A route with a waypoint between the departure and destination position returns two legs with the positions snapped to a nearby road:</p><ul><li><p>Leg 1: The <code>StartPosition</code> is the departure position . The <code>EndPosition</code> is the waypoint positon.</p></li><li><p>Leg 2: The <code>StartPosition</code> is the waypoint position. The <code>EndPosition</code> is the destination position.</p></li></ul>
 Required parameters: [Distance, DurationSeconds, EndPosition, StartPosition, Steps]
 */
@interface AWSLocationLeg : AWSModel


/**
 <p>The distance between the leg's <code>StartPosition</code> and <code>EndPosition</code> along a calculated route. </p><ul><li><p>The default measurement is <code>Kilometers</code> unless the request specifies a <code>DistanceUnit</code> of <code>Miles</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable distance;

/**
 <p>The estimated travel time between the leg's <code>StartPosition</code> and <code>EndPosition</code>. The travel mode and departure time that you specify in the request determines the calculated time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

/**
 <p>The terminating position of the leg. Follows the format <code>[longitude,latitude]</code>.</p><note><p>If the <code>EndPosition</code> isn't located on a road, it's <a href="https://docs.aws.amazon.com/location/latest/developerguide/nap-to-nearby-road.html">snapped to a nearby road</a>. </p></note>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable endPosition;

/**
 <p>Contains the calculated route's path as a linestring geometry.</p>
 */
@property (nonatomic, strong) AWSLocationLegGeometry * _Nullable geometry;

/**
 <p>The starting position of the leg. Follows the format <code>[longitude,latitude]</code>.</p><note><p>If the <code>StartPosition</code> isn't located on a road, it's <a href="https://docs.aws.amazon.com/location/latest/developerguide/snap-to-nearby-road.html">snapped to a nearby road</a>. </p></note>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable startPosition;

/**
 <p>Contains a list of steps, which represent subsections of a leg. Each step provides instructions for how to move to the next step in the leg such as the step's start position, end position, travel distance, travel duration, and geometry offset.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationStep *> * _Nullable steps;

@end

/**
 <p>Contains the geometry details for each path between a pair of positions. Used in plotting a route leg on a map.</p>
 */
@interface AWSLocationLegGeometry : AWSModel


/**
 <p>An ordered list of positions used to plot a route on a map. </p><p>The first position is closest to the start position for the leg, and the last position is the closest to the end position for the leg.</p><ul><li><p>For example, <code>[[-123.117, 49.284],[-123.115, 49.285],[-123.115, 49.285]]</code></p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSArray<NSNumber *> *> * _Nullable lineString;

@end

/**
 
 */
@interface AWSLocationListDevicePositionsRequest : AWSRequest


/**
 <p>An optional limit for the number of entries returned in a single call.</p><p>Default value: <code>100</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page.</p><p>Default value: <code>null</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The tracker resource containing the requested devices.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationListDevicePositionsResponse : AWSModel


/**
 <p>Contains details about each device's last known position. These details includes the device ID, the time when the position was sampled on the device, the time that the service received the update, and the most recent coordinates.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationListDevicePositionsResponseEntry *> * _Nullable entries;

/**
 <p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the tracker resource details.</p>
 Required parameters: [DeviceId, Position, SampleTime]
 */
@interface AWSLocationListDevicePositionsResponseEntry : AWSModel


/**
 <p>The accuracy of the device position.</p>
 */
@property (nonatomic, strong) AWSLocationPositionalAccuracy * _Nullable accuracy;

/**
 <p>The ID of the device for this position.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>The last known device position. Empty if no positions currently stored.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable position;

/**
 <p>The properties associated with the position.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable positionProperties;

/**
 <p>The timestamp at which the device position was determined. Uses <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable sampleTime;

@end

/**
 
 */
@interface AWSLocationListGeofenceCollectionsRequest : AWSRequest


/**
 <p>An optional limit for the number of resources returned in a single call. </p><p>Default value: <code>100</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p><p>Default value: <code>null</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLocationListGeofenceCollectionsResponse : AWSModel


/**
 <p>Lists the geofence collections that exist in your Amazon Web Services account.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationListGeofenceCollectionsResponseEntry *> * _Nullable entries;

/**
 <p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the geofence collection details.</p>
 Required parameters: [CollectionName, CreateTime, Description, UpdateTime]
 */
@interface AWSLocationListGeofenceCollectionsResponseEntry : AWSModel


/**
 <p>The name of the geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>The timestamp for when the geofence collection was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The description for the geofence collection</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>No longer used. Always returns <code>RequestBasedUsage</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>No longer used. Always returns an empty string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pricingPlanDataSource;

/**
 <p>Specifies a timestamp for when the resource was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 <p>Contains a list of geofences stored in a given geofence collection.</p>
 Required parameters: [CreateTime, GeofenceId, Geometry, Status, UpdateTime]
 */
@interface AWSLocationListGeofenceResponseEntry : AWSModel


/**
 <p>The timestamp for when the geofence was stored in a geofence collection in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The geofence identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geofenceId;

/**
 <p>Contains additional user-defined properties stored with the geofence. An array of key-value pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable geofenceProperties;

/**
 <p>Contains the geofence geometry details describing a polygon or a circle.</p>
 */
@property (nonatomic, strong) AWSLocationGeofenceGeometry * _Nullable geometry;

/**
 <p>Identifies the state of the geofence. A geofence will hold one of the following states:</p><ul><li><p><code>ACTIVE</code> — The geofence has been indexed by the system. </p></li><li><p><code>PENDING</code> — The geofence is being processed by the system.</p></li><li><p><code>FAILED</code> — The geofence failed to be indexed by the system.</p></li><li><p><code>DELETED</code> — The geofence has been deleted from the system index.</p></li><li><p><code>DELETING</code> — The geofence is being deleted from the system index.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The timestamp for when the geofence was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationListGeofencesRequest : AWSRequest


/**
 <p>The name of the geofence collection storing the list of geofences.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>An optional limit for the number of geofences returned in a single call. </p><p>Default value: <code>100</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p><p>Default value: <code>null</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLocationListGeofencesResponse : AWSModel


/**
 <p>Contains a list of geofences stored in the geofence collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationListGeofenceResponseEntry *> * _Nullable entries;

/**
 <p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLocationListKeysRequest : AWSRequest


/**
 <p>Optionally filter the list to only <code>Active</code> or <code>Expired</code> API keys.</p>
 */
@property (nonatomic, strong) AWSLocationApiKeyFilter * _Nullable filter;

/**
 <p>An optional limit for the number of resources returned in a single call. </p><p>Default value: <code>100</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p><p>Default value: <code>null</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLocationListKeysResponse : AWSModel


/**
 <p>Contains API key resources in your Amazon Web Services account. Details include API key name, allowed referers and timestamp for when the API key will expire.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationListKeysResponseEntry *> * _Nullable entries;

/**
 <p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>An API key resource listed in your Amazon Web Services account.</p>
 Required parameters: [CreateTime, ExpireTime, KeyName, Restrictions, UpdateTime]
 */
@interface AWSLocationListKeysResponseEntry : AWSModel


/**
 <p>The timestamp of when the API key was created, in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The optional description for the API key resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The timestamp for when the API key resource will expire, in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expireTime;

/**
 <p>The name of the API key resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

/**
 <p>API Restrictions on the allowed actions, resources, and referers for an API key resource.</p>
 */
@property (nonatomic, strong) AWSLocationApiKeyRestrictions * _Nullable restrictions;

/**
 <p>The timestamp of when the API key was last updated, in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationListMapsRequest : AWSRequest


/**
 <p>An optional limit for the number of resources returned in a single call. </p><p>Default value: <code>100</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page.</p><p>Default value: <code>null</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLocationListMapsResponse : AWSModel


/**
 <p>Contains a list of maps in your Amazon Web Services account</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationListMapsResponseEntry *> * _Nullable entries;

/**
 <p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains details of an existing map resource in your Amazon Web Services account.</p>
 Required parameters: [CreateTime, DataSource, Description, MapName, UpdateTime]
 */
@interface AWSLocationListMapsResponseEntry : AWSModel


/**
 <p>The timestamp for when the map resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>Specifies the data provider for the associated map tiles.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>The description for the map resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the associated map resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

/**
 <p>No longer used. Always returns <code>RequestBasedUsage</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>The timestamp for when the map resource was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationListPlaceIndexesRequest : AWSRequest


/**
 <p>An optional limit for the maximum number of results returned in a single call.</p><p>Default value: <code>100</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page.</p><p>Default value: <code>null</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLocationListPlaceIndexesResponse : AWSModel


/**
 <p>Lists the place index resources that exist in your Amazon Web Services account</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationListPlaceIndexesResponseEntry *> * _Nullable entries;

/**
 <p>A pagination token indicating that there are additional pages available. You can use the token in a new request to fetch the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>A place index resource listed in your Amazon Web Services account.</p>
 Required parameters: [CreateTime, DataSource, Description, IndexName, UpdateTime]
 */
@interface AWSLocationListPlaceIndexesResponseEntry : AWSModel


/**
 <p>The timestamp for when the place index resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The data provider of geospatial data. Values can be one of the following:</p><ul><li><p><code>Esri</code></p></li><li><p><code>Grab</code></p></li><li><p><code>Here</code></p></li></ul><p>For more information about data providers, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon Location Service data providers</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>The optional description for the place index resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the place index resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>No longer used. Always returns <code>RequestBasedUsage</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>The timestamp for when the place index resource was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationListRouteCalculatorsRequest : AWSRequest


/**
 <p>An optional maximum number of results returned in a single call.</p><p>Default Value: <code>100</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page.</p><p>Default Value: <code>null</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLocationListRouteCalculatorsResponse : AWSModel


/**
 <p>Lists the route calculator resources that exist in your Amazon Web Services account</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationListRouteCalculatorsResponseEntry *> * _Nullable entries;

/**
 <p>A pagination token indicating there are additional pages available. You can use the token in a subsequent request to fetch the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>A route calculator resource listed in your Amazon Web Services account.</p>
 Required parameters: [CalculatorName, CreateTime, DataSource, Description, UpdateTime]
 */
@interface AWSLocationListRouteCalculatorsResponseEntry : AWSModel


/**
 <p>The name of the route calculator resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorName;

/**
 <p>The timestamp when the route calculator resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p><ul><li><p>For example, <code>2020–07-2T12:15:20.000Z+01:00</code></p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The data provider of traffic and road network data. Indicates one of the available providers:</p><ul><li><p><code>Esri</code></p></li><li><p><code>Grab</code></p></li><li><p><code>Here</code></p></li></ul><p>For more information about data providers, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon Location Service data providers</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>The optional description of the route calculator resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Always returns <code>RequestBasedUsage</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>The timestamp when the route calculator resource was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p><ul><li><p>For example, <code>2020–07-2T12:15:20.000Z+01:00</code></p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource whose tags you want to retrieve.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:resourcetype/ExampleResource</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSLocationListTagsForResourceResponse : AWSModel


/**
 <p>Tags that have been applied to the specified resource. Tags are mapped from the tag key to the tag value: <code>"TagKey" : "TagValue"</code>.</p><ul><li><p>Format example: <code>{"tag1" : "value1", "tag2" : "value2"} </code></p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLocationListTrackerConsumersRequest : AWSRequest


/**
 <p>An optional limit for the number of resources returned in a single call. </p><p>Default value: <code>100</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p><p>Default value: <code>null</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The tracker resource whose associated geofence collections you want to list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationListTrackerConsumersResponse : AWSModel


/**
 <p>Contains the list of geofence collection ARNs associated to the tracker resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable consumerArns;

/**
 <p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLocationListTrackersRequest : AWSRequest


/**
 <p>An optional limit for the number of resources returned in a single call. </p><p>Default value: <code>100</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p><p>Default value: <code>null</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLocationListTrackersResponse : AWSModel


/**
 <p>Contains tracker resources in your Amazon Web Services account. Details include tracker name, description and timestamps for when the tracker was created and last updated.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationListTrackersResponseEntry *> * _Nullable entries;

/**
 <p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the tracker resource details.</p>
 Required parameters: [CreateTime, Description, TrackerName, UpdateTime]
 */
@interface AWSLocationListTrackersResponseEntry : AWSModel


/**
 <p>The timestamp for when the tracker resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The description for the tracker resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Always returns <code>RequestBasedUsage</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>No longer used. Always returns an empty string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pricingPlanDataSource;

/**
 <p>The name of the tracker resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

/**
 <p>The timestamp at which the device's position was determined. Uses <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 <p>Specifies the map tile style selected from an available provider.</p>
 Required parameters: [Style]
 */
@interface AWSLocationMapConfiguration : AWSModel


/**
 <p>Specifies the political view for the style. Leave unset to not use a political view, or, for styles that support specific political views, you can choose a view, such as <code>IND</code> for the Indian view.</p><p>Default is unset.</p><note><p>Not all map resources or styles support political view styles. See <a href="https://docs.aws.amazon.com/location/latest/developerguide/map-concepts.html#political-views">Political views</a> for more information.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable politicalView;

/**
 <p>Specifies the map style selected from an available data provider.</p><p>Valid <a href="https://docs.aws.amazon.com/location/latest/developerguide/esri.html">Esri map styles</a>:</p><ul><li><p><code>VectorEsriDarkGrayCanvas</code> – The Esri Dark Gray Canvas map style. A vector basemap with a dark gray, neutral background with minimal colors, labels, and features that's designed to draw attention to your thematic content. </p></li><li><p><code>RasterEsriImagery</code> – The Esri Imagery map style. A raster basemap that provides one meter or better satellite and aerial imagery in many parts of the world and lower resolution satellite imagery worldwide. </p></li><li><p><code>VectorEsriLightGrayCanvas</code> – The Esri Light Gray Canvas map style, which provides a detailed vector basemap with a light gray, neutral background style with minimal colors, labels, and features that's designed to draw attention to your thematic content. </p></li><li><p><code>VectorEsriTopographic</code> – The Esri Light map style, which provides a detailed vector basemap with a classic Esri map style.</p></li><li><p><code>VectorEsriStreets</code> – The Esri Street Map style, which provides a detailed vector basemap for the world symbolized with a classic Esri street map style. The vector tile layer is similar in content and style to the World Street Map raster map.</p></li><li><p><code>VectorEsriNavigation</code> – The Esri Navigation map style, which provides a detailed basemap for the world symbolized with a custom navigation map style that's designed for use during the day in mobile devices.</p></li></ul><p>Valid <a href="https://docs.aws.amazon.com/location/latest/developerguide/HERE.html">HERE Technologies map styles</a>:</p><ul><li><p><code>VectorHereContrast</code> – The HERE Contrast (Berlin) map style is a high contrast detailed base map of the world that blends 3D and 2D rendering.</p><note><p>The <code>VectorHereContrast</code> style has been renamed from <code>VectorHereBerlin</code>. <code>VectorHereBerlin</code> has been deprecated, but will continue to work in applications that use it.</p></note></li><li><p><code>VectorHereExplore</code> – A default HERE map style containing a neutral, global map and its features including roads, buildings, landmarks, and water features. It also now includes a fully designed map of Japan.</p></li><li><p><code>VectorHereExploreTruck</code> – A global map containing truck restrictions and attributes (e.g. width / height / HAZMAT) symbolized with highlighted segments and icons on top of HERE Explore to support use cases within transport and logistics.</p></li><li><p><code>RasterHereExploreSatellite</code> – A global map containing high resolution satellite imagery.</p></li><li><p><code>HybridHereExploreSatellite</code> – A global map displaying the road network, street names, and city labels over satellite imagery. This style will automatically retrieve both raster and vector tiles, and your charges will be based on total tiles retrieved.</p><note><p>Hybrid styles use both vector and raster tiles when rendering the map that you see. This means that more tiles are retrieved than when using either vector or raster tiles alone. Your charges will include all tiles retrieved.</p></note></li></ul><p>Valid <a href="https://docs.aws.amazon.com/location/latest/developerguide/grab.html">GrabMaps map styles</a>:</p><ul><li><p><code>VectorGrabStandardLight</code> – The Grab Standard Light map style provides a basemap with detailed land use coloring, area names, roads, landmarks, and points of interest covering Southeast Asia.</p></li><li><p><code>VectorGrabStandardDark</code> – The Grab Standard Dark map style provides a dark variation of the standard basemap covering Southeast Asia.</p></li></ul><note><p>Grab provides maps only for countries in Southeast Asia, and is only available in the Asia Pacific (Singapore) Region (<code>ap-southeast-1</code>). For more information, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/grab.html#grab-coverage-area">GrabMaps countries and area covered</a>.</p></note><p>Valid <a href="https://docs.aws.amazon.com/location/latest/developerguide/open-data.html">Open Data map styles</a>:</p><ul><li><p><code>VectorOpenDataStandardLight</code> – The Open Data Standard Light map style provides a detailed basemap for the world suitable for website and mobile application use. The map includes highways major roads, minor roads, railways, water features, cities, parks, landmarks, building footprints, and administrative boundaries.</p></li><li><p><code>VectorOpenDataStandardDark</code> – Open Data Standard Dark is a dark-themed map style that provides a detailed basemap for the world suitable for website and mobile application use. The map includes highways major roads, minor roads, railways, water features, cities, parks, landmarks, building footprints, and administrative boundaries.</p></li><li><p><code>VectorOpenDataVisualizationLight</code> – The Open Data Visualization Light map style is a light-themed style with muted colors and fewer features that aids in understanding overlaid data.</p></li><li><p><code>VectorOpenDataVisualizationDark</code> – The Open Data Visualization Dark map style is a dark-themed style with muted colors and fewer features that aids in understanding overlaid data.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable style;

@end

/**
 <p>Specifies the political view for the style.</p>
 */
@interface AWSLocationMapConfigurationUpdate : AWSModel


/**
 <p>Specifies the political view for the style. Set to an empty string to not use a political view, or, for styles that support specific political views, you can choose a view, such as <code>IND</code> for the Indian view.</p><note><p>Not all map resources or styles support political view styles. See <a href="https://docs.aws.amazon.com/location/latest/developerguide/map-concepts.html#political-views">Political views</a> for more information.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable politicalView;

@end

/**
 <p>Contains details about addresses or points of interest that match the search criteria.</p><p>Not all details are included with all responses. Some details may only be returned by specific data partners.</p>
 Required parameters: [Geometry]
 */
@interface AWSLocationPlace : AWSModel


/**
 <p>The numerical portion of an address, such as a building number. </p>
 */
@property (nonatomic, strong) NSString * _Nullable addressNumber;

/**
 <p>The Amazon Location categories that describe this Place.</p><p>For more information about using categories, including a list of Amazon Location categories, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/category-filtering.html">Categories and filtering</a>, in the <i>Amazon Location Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable categories;

/**
 <p>A country/region specified using <a href="https://www.iso.org/iso-3166-country-codes.html">ISO 3166</a> 3-digit country/region code. For example, <code>CAN</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable country;

/**
 <p>Places uses a point geometry to specify a location or a Place.</p>
 */
@property (nonatomic, strong) AWSLocationPlaceGeometry * _Nullable geometry;

/**
 <p><code>True</code> if the result is interpolated from other known places.</p><p><code>False</code> if the Place is a known place.</p><p>Not returned when the partner does not provide the information.</p><p>For example, returns <code>False</code> for an address location that is found in the partner data, but returns <code>True</code> if an address does not exist in the partner data and its location is calculated by interpolating between other known addresses. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable interpolated;

/**
 <p>The full name and address of the point of interest such as a city, region, or country. For example, <code>123 Any Street, Any Town, USA</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable label;

/**
 <p>A name for a local area, such as a city or town name. For example, <code>Toronto</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable municipality;

/**
 <p>The name of a community district. For example, <code>Downtown</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable neighborhood;

/**
 <p>A group of numbers and letters in a country-specific format, which accompanies the address for the purpose of identifying a location. </p>
 */
@property (nonatomic, strong) NSString * _Nullable postalCode;

/**
 <p>A name for an area or geographical division, such as a province or state name. For example, <code>British Columbia</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>The name for a street or a road to identify a location. For example, <code>Main Street</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable street;

/**
 <p>A county, or an area that's part of a larger region. For example, <code>Metro Vancouver</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subRegion;

/**
 <p>Categories from the data provider that describe the Place that are not mapped to any Amazon Location categories.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supplementalCategories;

/**
 <p>The time zone in which the <code>Place</code> is located. Returned only when using HERE or Grab as the selected partner.</p>
 */
@property (nonatomic, strong) AWSLocationTimeZone * _Nullable timeZone;

/**
 <p>For addresses with multiple units, the unit identifier. Can include numbers and letters, for example <code>3B</code> or <code>Unit 123</code>.</p><note><p>Returned only for a place index that uses Esri or Grab as a data provider. Is not returned for <code>SearchPlaceIndexForPosition</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable unitNumber;

/**
 <p>For addresses with a <code>UnitNumber</code>, the type of unit. For example, <code>Apartment</code>.</p><note><p>Returned only for a place index that uses Esri as a data provider.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable unitType;

@end

/**
 <p>Places uses a point geometry to specify a location or a Place.</p>
 */
@interface AWSLocationPlaceGeometry : AWSModel


/**
 <p>A single point geometry specifies a location for a Place using <a href="https://gisgeography.com/wgs84-world-geodetic-system/">WGS 84</a> coordinates:</p><ul><li><p><i>x</i> — Specifies the x coordinate or longitude. </p></li><li><p><i>y</i> — Specifies the y coordinate or latitude. </p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable point;

@end

/**
 <p>Defines the level of certainty of the position.</p>
 Required parameters: [Horizontal]
 */
@interface AWSLocationPositionalAccuracy : AWSModel


/**
 <p>Estimated maximum distance, in meters, between the measured position and the true position of a device, along the Earth's surface.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable horizontal;

@end

/**
 
 */
@interface AWSLocationPutGeofenceRequest : AWSRequest


/**
 <p>The geofence collection to store the geofence in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>An identifier for the geofence. For example, <code>ExampleGeofence-1</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geofenceId;

/**
 <p>Specifies additional user-defined properties to store with the Geofence. An array of key-value pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable geofenceProperties;

/**
 <p>Contains the details to specify the position of the geofence. Can be either a polygon or a circle. Including both will return a validation error.</p><note><p>Each <a href="https://docs.aws.amazon.com/location-geofences/latest/APIReference/API_GeofenceGeometry.html"> geofence polygon</a> can have a maximum of 1,000 vertices.</p></note>
 */
@property (nonatomic, strong) AWSLocationGeofenceGeometry * _Nullable geometry;

@end

/**
 
 */
@interface AWSLocationPutGeofenceResponse : AWSModel


/**
 <p>The timestamp for when the geofence was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The geofence identifier entered in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geofenceId;

/**
 <p>The timestamp for when the geofence was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 <p>The result for the calculated route of one <code>DeparturePosition</code><code>DestinationPosition</code> pair.</p>
 */
@interface AWSLocationRouteMatrixEntry : AWSModel


/**
 <p>The total distance of travel for the route.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable distance;

/**
 <p>The expected duration of travel for the route.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

/**
 <p>An error corresponding to the calculation of a route between the <code>DeparturePosition</code> and <code>DestinationPosition</code>.</p>
 */
@property (nonatomic, strong) AWSLocationRouteMatrixEntryError * _Nullable error;

@end

/**
 <p>An error corresponding to the calculation of a route between the <code>DeparturePosition</code> and <code>DestinationPosition</code>.</p><p>The error code can be one of the following:</p><ul><li><p><code>RouteNotFound</code> - Unable to find a valid route with the given parameters.</p></li></ul><ul><li><p><code>RouteTooLong</code> - Route calculation went beyond the maximum size of a route and was terminated before completion.</p></li></ul><ul><li><p><code>PositionsNotFound</code> - One or more of the input positions were not found on the route network.</p></li></ul><ul><li><p><code>DestinationPositionNotFound</code> - The destination position was not found on the route network.</p></li></ul><ul><li><p><code>DeparturePositionNotFound</code> - The departure position was not found on the route network.</p></li></ul><ul><li><p><code>OtherValidationError</code> - The given inputs were not valid or a route was not found. More information is given in the error <code>Message</code></p></li></ul>
 Required parameters: [Code]
 */
@interface AWSLocationRouteMatrixEntryError : AWSModel


/**
 <p>The type of error which occurred for the route calculation.</p>
 */
@property (nonatomic, assign) AWSLocationRouteMatrixErrorCode code;

/**
 <p>A message about the error that occurred for the route calculation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Contains a search result from a position search query that is run on a place index resource.</p>
 Required parameters: [Distance, Place]
 */
@interface AWSLocationSearchForPositionResult : AWSModel


/**
 <p>The distance in meters of a great-circle arc between the query position and the result.</p><note><p>A great-circle arc is the shortest path on a sphere, in this case the Earth. This returns the shortest distance between two locations.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable distance;

/**
 <p>Details about the search result, such as its address and position.</p>
 */
@property (nonatomic, strong) AWSLocationPlace * _Nullable place;

/**
 <p>The unique identifier of the place. You can use this with the <code>GetPlace</code> operation to find the place again later.</p><note><p>For <code>SearchPlaceIndexForPosition</code> operations, the <code>PlaceId</code> is returned only by place indexes that use HERE or Grab as a data provider.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable placeId;

@end

/**
 <p>Contains a place suggestion resulting from a place suggestion query that is run on a place index resource.</p>
 Required parameters: [Text]
 */
@interface AWSLocationSearchForSuggestionsResult : AWSModel


/**
 <p>The Amazon Location categories that describe the Place.</p><p>For more information about using categories, including a list of Amazon Location categories, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/category-filtering.html">Categories and filtering</a>, in the <i>Amazon Location Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable categories;

/**
 <p>The unique identifier of the Place. You can use this with the <code>GetPlace</code> operation to find the place again later, or to get full information for the Place.</p><p>The <code>GetPlace</code> request must use the same <code>PlaceIndex</code> resource as the <code>SearchPlaceIndexForSuggestions</code> that generated the Place ID.</p><note><p>For <code>SearchPlaceIndexForSuggestions</code> operations, the <code>PlaceId</code> is returned by place indexes that use Esri, Grab, or HERE as data providers.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable placeId;

/**
 <p>Categories from the data provider that describe the Place that are not mapped to any Amazon Location categories.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supplementalCategories;

/**
 <p>The text of the place suggestion, typically formatted as an address string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 <p>Contains a search result from a text search query that is run on a place index resource.</p>
 Required parameters: [Place]
 */
@interface AWSLocationSearchForTextResult : AWSModel


/**
 <p>The distance in meters of a great-circle arc between the bias position specified and the result. <code>Distance</code> will be returned only if a bias position was specified in the query.</p><note><p>A great-circle arc is the shortest path on a sphere, in this case the Earth. This returns the shortest distance between two locations.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable distance;

/**
 <p>Details about the search result, such as its address and position.</p>
 */
@property (nonatomic, strong) AWSLocationPlace * _Nullable place;

/**
 <p>The unique identifier of the place. You can use this with the <code>GetPlace</code> operation to find the place again later.</p><note><p>For <code>SearchPlaceIndexForText</code> operations, the <code>PlaceId</code> is returned only by place indexes that use HERE or Grab as a data provider.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable placeId;

/**
 <p>The relative confidence in the match for a result among the results returned. For example, if more fields for an address match (including house number, street, city, country/region, and postal code), the relevance score is closer to 1.</p><p>Returned only when the partner selected is Esri or Grab.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable relevance;

@end

/**
 
 */
@interface AWSLocationSearchPlaceIndexForPositionRequest : AWSRequest


/**
 <p>The name of the place index resource you want to use for the search.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The preferred language used to return results. The value must be a valid <a href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for example, <code>en</code> for English.</p><p>This setting affects the languages used in the results, but not the results themselves. If no language is specified, or not supported for a particular result, the partner automatically chooses a language for the result.</p><p>For an example, we'll use the Greek language. You search for a location around Athens, Greece, with the <code>language</code> parameter set to <code>en</code>. The <code>city</code> in the results will most likely be returned as <code>Athens</code>.</p><p>If you set the <code>language</code> parameter to <code>el</code>, for Greek, then the <code>city</code> in the results will more likely be returned as <code>Αθήνα</code>.</p><p>If the data provider does not have a value for Greek, the result will be in a language that the provider does support.</p>
 */
@property (nonatomic, strong) NSString * _Nullable language;

/**
 <p>An optional parameter. The maximum number of results returned per request.</p><p>Default value: <code>50</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Specifies the longitude and latitude of the position to query.</p><p> This parameter must contain a pair of numbers. The first number represents the X coordinate, or longitude; the second number represents the Y coordinate, or latitude.</p><p>For example, <code>[-123.1174, 49.2847]</code> represents a position with longitude <code>-123.1174</code> and latitude <code>49.2847</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable position;

@end

/**
 
 */
@interface AWSLocationSearchPlaceIndexForPositionResponse : AWSModel


/**
 <p>Returns a list of Places closest to the specified position. Each result contains additional information about the Places returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationSearchForPositionResult *> * _Nullable results;

/**
 <p>Contains a summary of the request. Echoes the input values for <code>Position</code>, <code>Language</code>, <code>MaxResults</code>, and the <code>DataSource</code> of the place index. </p>
 */
@property (nonatomic, strong) AWSLocationSearchPlaceIndexForPositionSummary * _Nullable summary;

@end

/**
 <p>A summary of the request sent by using <code>SearchPlaceIndexForPosition</code>.</p>
 Required parameters: [DataSource, Position]
 */
@interface AWSLocationSearchPlaceIndexForPositionSummary : AWSModel


/**
 <p>The geospatial data provider attached to the place index resource specified in the request. Values can be one of the following:</p><ul><li><p>Esri</p></li><li><p>Grab</p></li><li><p>Here</p></li></ul><p>For more information about data providers, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon Location Service data providers</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>The preferred language used to return results. Matches the language in the request. The value is a valid <a href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for example, <code>en</code> for English.</p>
 */
@property (nonatomic, strong) NSString * _Nullable language;

/**
 <p>Contains the optional result count limit that is specified in the request.</p><p>Default value: <code>50</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The position specified in the request.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable position;

@end

/**
 
 */
@interface AWSLocationSearchPlaceIndexForSuggestionsRequest : AWSRequest


/**
 <p>An optional parameter that indicates a preference for place suggestions that are closer to a specified position.</p><p> If provided, this parameter must contain a pair of numbers. The first number represents the X coordinate, or longitude; the second number represents the Y coordinate, or latitude.</p><p>For example, <code>[-123.1174, 49.2847]</code> represents the position with longitude <code>-123.1174</code> and latitude <code>49.2847</code>.</p><note><p><code>BiasPosition</code> and <code>FilterBBox</code> are mutually exclusive. Specifying both options results in an error. </p></note>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable biasPosition;

/**
 <p>An optional parameter that limits the search results by returning only suggestions within a specified bounding box.</p><p> If provided, this parameter must contain a total of four consecutive numbers in two pairs. The first pair of numbers represents the X and Y coordinates (longitude and latitude, respectively) of the southwest corner of the bounding box; the second pair of numbers represents the X and Y coordinates (longitude and latitude, respectively) of the northeast corner of the bounding box.</p><p>For example, <code>[-12.7935, -37.4835, -12.0684, -36.9542]</code> represents a bounding box where the southwest corner has longitude <code>-12.7935</code> and latitude <code>-37.4835</code>, and the northeast corner has longitude <code>-12.0684</code> and latitude <code>-36.9542</code>.</p><note><p><code>FilterBBox</code> and <code>BiasPosition</code> are mutually exclusive. Specifying both options results in an error. </p></note>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable filterBBox;

/**
 <p>A list of one or more Amazon Location categories to filter the returned places. If you include more than one category, the results will include results that match <i>any</i> of the categories listed.</p><p>For more information about using categories, including a list of Amazon Location categories, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/category-filtering.html">Categories and filtering</a>, in the <i>Amazon Location Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable filterCategories;

/**
 <p>An optional parameter that limits the search results by returning only suggestions within the provided list of countries.</p><ul><li><p>Use the <a href="https://www.iso.org/iso-3166-country-codes.html">ISO 3166</a> 3-digit country code. For example, Australia uses three upper-case characters: <code>AUS</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable filterCountries;

/**
 <p>The name of the place index resource you want to use for the search.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The preferred language used to return results. The value must be a valid <a href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for example, <code>en</code> for English.</p><p>This setting affects the languages used in the results. If no language is specified, or not supported for a particular result, the partner automatically chooses a language for the result.</p><p>For an example, we'll use the Greek language. You search for <code>Athens, Gr</code> to get suggestions with the <code>language</code> parameter set to <code>en</code>. The results found will most likely be returned as <code>Athens, Greece</code>.</p><p>If you set the <code>language</code> parameter to <code>el</code>, for Greek, then the result found will more likely be returned as <code>Αθήνα, Ελλάδα</code>.</p><p>If the data provider does not have a value for Greek, the result will be in a language that the provider does support.</p>
 */
@property (nonatomic, strong) NSString * _Nullable language;

/**
 <p>An optional parameter. The maximum number of results returned per request. </p><p>The default: <code>5</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The free-form partial text to use to generate place suggestions. For example, <code>eiffel tow</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSLocationSearchPlaceIndexForSuggestionsResponse : AWSModel


/**
 <p>A list of place suggestions that best match the search text.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationSearchForSuggestionsResult *> * _Nullable results;

/**
 <p>Contains a summary of the request. Echoes the input values for <code>BiasPosition</code>, <code>FilterBBox</code>, <code>FilterCountries</code>, <code>Language</code>, <code>MaxResults</code>, and <code>Text</code>. Also includes the <code>DataSource</code> of the place index. </p>
 */
@property (nonatomic, strong) AWSLocationSearchPlaceIndexForSuggestionsSummary * _Nullable summary;

@end

/**
 <p>A summary of the request sent by using <code>SearchPlaceIndexForSuggestions</code>.</p>
 Required parameters: [DataSource, Text]
 */
@interface AWSLocationSearchPlaceIndexForSuggestionsSummary : AWSModel


/**
 <p>Contains the coordinates for the optional bias position specified in the request.</p><p>This parameter contains a pair of numbers. The first number represents the X coordinate, or longitude; the second number represents the Y coordinate, or latitude.</p><p>For example, <code>[-123.1174, 49.2847]</code> represents the position with longitude <code>-123.1174</code> and latitude <code>49.2847</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable biasPosition;

/**
 <p>The geospatial data provider attached to the place index resource specified in the request. Values can be one of the following:</p><ul><li><p>Esri</p></li><li><p>Grab</p></li><li><p>Here</p></li></ul><p>For more information about data providers, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon Location Service data providers</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>Contains the coordinates for the optional bounding box specified in the request.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable filterBBox;

/**
 <p>The optional category filter specified in the request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable filterCategories;

/**
 <p>Contains the optional country filter specified in the request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable filterCountries;

/**
 <p>The preferred language used to return results. Matches the language in the request. The value is a valid <a href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for example, <code>en</code> for English.</p>
 */
@property (nonatomic, strong) NSString * _Nullable language;

/**
 <p>Contains the optional result count limit specified in the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The free-form partial text input specified in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSLocationSearchPlaceIndexForTextRequest : AWSRequest


/**
 <p>An optional parameter that indicates a preference for places that are closer to a specified position.</p><p> If provided, this parameter must contain a pair of numbers. The first number represents the X coordinate, or longitude; the second number represents the Y coordinate, or latitude.</p><p>For example, <code>[-123.1174, 49.2847]</code> represents the position with longitude <code>-123.1174</code> and latitude <code>49.2847</code>.</p><note><p><code>BiasPosition</code> and <code>FilterBBox</code> are mutually exclusive. Specifying both options results in an error. </p></note>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable biasPosition;

/**
 <p>An optional parameter that limits the search results by returning only places that are within the provided bounding box.</p><p> If provided, this parameter must contain a total of four consecutive numbers in two pairs. The first pair of numbers represents the X and Y coordinates (longitude and latitude, respectively) of the southwest corner of the bounding box; the second pair of numbers represents the X and Y coordinates (longitude and latitude, respectively) of the northeast corner of the bounding box.</p><p>For example, <code>[-12.7935, -37.4835, -12.0684, -36.9542]</code> represents a bounding box where the southwest corner has longitude <code>-12.7935</code> and latitude <code>-37.4835</code>, and the northeast corner has longitude <code>-12.0684</code> and latitude <code>-36.9542</code>.</p><note><p><code>FilterBBox</code> and <code>BiasPosition</code> are mutually exclusive. Specifying both options results in an error. </p></note>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable filterBBox;

/**
 <p>A list of one or more Amazon Location categories to filter the returned places. If you include more than one category, the results will include results that match <i>any</i> of the categories listed.</p><p>For more information about using categories, including a list of Amazon Location categories, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/category-filtering.html">Categories and filtering</a>, in the <i>Amazon Location Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable filterCategories;

/**
 <p>An optional parameter that limits the search results by returning only places that are in a specified list of countries.</p><ul><li><p>Valid values include <a href="https://www.iso.org/iso-3166-country-codes.html">ISO 3166</a> 3-digit country codes. For example, Australia uses three upper-case characters: <code>AUS</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable filterCountries;

/**
 <p>The name of the place index resource you want to use for the search.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The preferred language used to return results. The value must be a valid <a href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for example, <code>en</code> for English.</p><p>This setting affects the languages used in the results, but not the results themselves. If no language is specified, or not supported for a particular result, the partner automatically chooses a language for the result.</p><p>For an example, we'll use the Greek language. You search for <code>Athens, Greece</code>, with the <code>language</code> parameter set to <code>en</code>. The result found will most likely be returned as <code>Athens</code>.</p><p>If you set the <code>language</code> parameter to <code>el</code>, for Greek, then the result found will more likely be returned as <code>Αθήνα</code>.</p><p>If the data provider does not have a value for Greek, the result will be in a language that the provider does support.</p>
 */
@property (nonatomic, strong) NSString * _Nullable language;

/**
 <p>An optional parameter. The maximum number of results returned per request. </p><p>The default: <code>50</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The address, name, city, or region to be used in the search in free-form text format. For example, <code>123 Any Street</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSLocationSearchPlaceIndexForTextResponse : AWSModel


/**
 <p>A list of Places matching the input text. Each result contains additional information about the specific point of interest. </p><p>Not all response properties are included with all responses. Some properties may only be returned by specific data partners.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationSearchForTextResult *> * _Nullable results;

/**
 <p>Contains a summary of the request. Echoes the input values for <code>BiasPosition</code>, <code>FilterBBox</code>, <code>FilterCountries</code>, <code>Language</code>, <code>MaxResults</code>, and <code>Text</code>. Also includes the <code>DataSource</code> of the place index and the bounding box, <code>ResultBBox</code>, which surrounds the search results. </p>
 */
@property (nonatomic, strong) AWSLocationSearchPlaceIndexForTextSummary * _Nullable summary;

@end

/**
 <p>A summary of the request sent by using <code>SearchPlaceIndexForText</code>.</p>
 Required parameters: [DataSource, Text]
 */
@interface AWSLocationSearchPlaceIndexForTextSummary : AWSModel


/**
 <p>Contains the coordinates for the optional bias position specified in the request.</p><p>This parameter contains a pair of numbers. The first number represents the X coordinate, or longitude; the second number represents the Y coordinate, or latitude.</p><p>For example, <code>[-123.1174, 49.2847]</code> represents the position with longitude <code>-123.1174</code> and latitude <code>49.2847</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable biasPosition;

/**
 <p>The geospatial data provider attached to the place index resource specified in the request. Values can be one of the following:</p><ul><li><p>Esri</p></li><li><p>Grab</p></li><li><p>Here</p></li></ul><p>For more information about data providers, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon Location Service data providers</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>Contains the coordinates for the optional bounding box specified in the request.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable filterBBox;

/**
 <p>The optional category filter specified in the request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable filterCategories;

/**
 <p>Contains the optional country filter specified in the request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable filterCountries;

/**
 <p>The preferred language used to return results. Matches the language in the request. The value is a valid <a href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for example, <code>en</code> for English.</p>
 */
@property (nonatomic, strong) NSString * _Nullable language;

/**
 <p>Contains the optional result count limit specified in the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The bounding box that fully contains all search results.</p><note><p>If you specified the optional <code>FilterBBox</code> parameter in the request, <code>ResultBBox</code> is contained within <code>FilterBBox</code>.</p></note>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable resultBBox;

/**
 <p>The search text specified in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 <p> Represents an element of a leg within a route. A step contains instructions for how to move to the next step in the leg. </p>
 Required parameters: [Distance, DurationSeconds, EndPosition, StartPosition]
 */
@interface AWSLocationStep : AWSModel


/**
 <p>The travel distance between the step's <code>StartPosition</code> and <code>EndPosition</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable distance;

/**
 <p>The estimated travel time, in seconds, from the step's <code>StartPosition</code> to the <code>EndPosition</code>. . The travel mode and departure time that you specify in the request determines the calculated time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

/**
 <p>The end position of a step. If the position the last step in the leg, this position is the same as the end position of the leg.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable endPosition;

/**
 <p>Represents the start position, or index, in a sequence of steps within the leg's line string geometry. For example, the index of the first step in a leg geometry is <code>0</code>. </p><p>Included in the response for queries that set <code>IncludeLegGeometry</code> to <code>True</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable geometryOffset;

/**
 <p>The starting position of a step. If the position is the first step in the leg, this position is the same as the start position of the leg.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable startPosition;

@end

/**
 
 */
@interface AWSLocationTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource whose tags you want to update.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:resourcetype/ExampleResource</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>Applies one or more tags to specific resource. A tag is a key-value pair that helps you manage, identify, search, and filter your resources.</p><p>Format: <code>"key" : "value"</code></p><p>Restrictions:</p><ul><li><p>Maximum 50 tags per resource.</p></li><li><p>Each tag key must be unique and must have exactly one associated value.</p></li><li><p>Maximum key length: 128 Unicode characters in UTF-8.</p></li><li><p>Maximum value length: 256 Unicode characters in UTF-8.</p></li><li><p>Can use alphanumeric characters (A–Z, a–z, 0–9), and the following characters: + - = . _ : / @</p></li><li><p>Cannot use "aws:" as a prefix for a key.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLocationTagResourceResponse : AWSModel


@end

/**
 <p>Information about a time zone. Includes the name of the time zone and the offset from UTC in seconds.</p>
 Required parameters: [Name]
 */
@interface AWSLocationTimeZone : AWSModel


/**
 <p>The name of the time zone, following the <a href="https://www.iana.org/time-zones"> IANA time zone standard</a>. For example, <code>America/Los_Angeles</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The time zone's offset, in seconds, from UTC.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable offset;

@end

/**
 <p>Contains details about the truck dimensions in the unit of measurement that you specify. Used to filter out roads that can't support or allow the specified dimensions for requests that specify <code>TravelMode</code> as <code>Truck</code>.</p>
 */
@interface AWSLocationTruckDimensions : AWSModel


/**
 <p>The height of the truck.</p><ul><li><p>For example, <code>4.5</code>.</p></li></ul><note><p> For routes calculated with a HERE resource, this value must be between 0 and 50 meters. </p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable height;

/**
 <p>The length of the truck.</p><ul><li><p>For example, <code>15.5</code>.</p></li></ul><note><p> For routes calculated with a HERE resource, this value must be between 0 and 300 meters. </p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable length;

/**
 <p> Specifies the unit of measurement for the truck dimensions.</p><p>Default Value: <code>Meters</code></p>
 */
@property (nonatomic, assign) AWSLocationDimensionUnit unit;

/**
 <p>The width of the truck.</p><ul><li><p>For example, <code>4.5</code>.</p></li></ul><note><p> For routes calculated with a HERE resource, this value must be between 0 and 50 meters. </p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable width;

@end

/**
 <p>Contains details about the truck's weight specifications. Used to avoid roads that can't support or allow the total weight for requests that specify <code>TravelMode</code> as <code>Truck</code>.</p>
 */
@interface AWSLocationTruckWeight : AWSModel


/**
 <p>The total weight of the truck. </p><ul><li><p>For example, <code>3500</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable total;

/**
 <p>The unit of measurement to use for the truck weight.</p><p>Default Value: <code>Kilograms</code></p>
 */
@property (nonatomic, assign) AWSLocationVehicleWeightUnit unit;

@end

/**
 
 */
@interface AWSLocationUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource from which you want to remove tags.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:resourcetype/ExampleResource</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The list of tag keys to remove from the specified resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSLocationUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSLocationUpdateGeofenceCollectionRequest : AWSRequest


/**
 <p>The name of the geofence collection to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>Updates the description for the geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>No longer used. If included, the only allowed value is <code>RequestBasedUsage</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>This parameter is no longer used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pricingPlanDataSource;

@end

/**
 
 */
@interface AWSLocationUpdateGeofenceCollectionResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the updated geofence collection. Used to specify a resource across Amazon Web Services.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollection</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable collectionArn;

/**
 <p>The name of the updated geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>The time when the geofence collection was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationUpdateKeyRequest : AWSRequest


/**
 <p>Updates the description for the API key resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Updates the timestamp for when the API key resource will expire in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable expireTime;

/**
 <p>The boolean flag to be included for updating <code>ExpireTime</code> or <code>Restrictions</code> details.</p><p>Must be set to <code>true</code> to update an API key resource that has been used in the past 7 days.</p><p><code>False</code> if force update is not preferred</p><p>Default value: <code>False</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceUpdate;

/**
 <p>The name of the API key resource to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

/**
 <p>Whether the API key should expire. Set to <code>true</code> to set the API key to have no expiration time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable noExpiry;

/**
 <p>Updates the API key restrictions for the API key resource.</p>
 */
@property (nonatomic, strong) AWSLocationApiKeyRestrictions * _Nullable restrictions;

@end

/**
 
 */
@interface AWSLocationUpdateKeyResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the API key resource. Used when you need to specify a resource across all Amazon Web Services.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:key/ExampleKey</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyArn;

/**
 <p>The name of the API key resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

/**
 <p>The timestamp for when the API key resource was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationUpdateMapRequest : AWSRequest


/**
 <p>Updates the parts of the map configuration that can be updated, including the political view.</p>
 */
@property (nonatomic, strong) AWSLocationMapConfigurationUpdate * _Nullable configurationUpdate;

/**
 <p>Updates the description for the map resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the map resource to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

/**
 <p>No longer used. If included, the only allowed value is <code>RequestBasedUsage</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

@end

/**
 
 */
@interface AWSLocationUpdateMapResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the updated map resource. Used to specify a resource across AWS.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:map/ExampleMap</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable mapArn;

/**
 <p>The name of the updated map resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

/**
 <p>The timestamp for when the map resource was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationUpdatePlaceIndexRequest : AWSRequest


/**
 <p>Updates the data storage option for the place index resource.</p>
 */
@property (nonatomic, strong) AWSLocationDataSourceConfiguration * _Nullable dataSourceConfiguration;

/**
 <p>Updates the description for the place index resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the place index resource to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>No longer used. If included, the only allowed value is <code>RequestBasedUsage</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

@end

/**
 
 */
@interface AWSLocationUpdatePlaceIndexResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the upated place index resource. Used to specify a resource across Amazon Web Services.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:place- index/ExamplePlaceIndex</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable indexArn;

/**
 <p>The name of the updated place index resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The timestamp for when the place index resource was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationUpdateRouteCalculatorRequest : AWSRequest


/**
 <p>The name of the route calculator resource to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorName;

/**
 <p>Updates the description for the route calculator resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>No longer used. If included, the only allowed value is <code>RequestBasedUsage</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

@end

/**
 
 */
@interface AWSLocationUpdateRouteCalculatorResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the updated route calculator resource. Used to specify a resource across AWS.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:route- calculator/ExampleCalculator</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorArn;

/**
 <p>The name of the updated route calculator resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorName;

/**
 <p>The timestamp for when the route calculator was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationUpdateTrackerRequest : AWSRequest


/**
 <p>Updates the description for the tracker resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Updates the position filtering for the tracker resource.</p><p>Valid values:</p><ul><li><p><code>TimeBased</code> - Location updates are evaluated against linked geofence collections, but not every location update is stored. If your update frequency is more often than 30 seconds, only one update per 30 seconds is stored for each unique device ID. </p></li><li><p><code>DistanceBased</code> - If the device has moved less than 30 m (98.4 ft), location updates are ignored. Location updates within this distance are neither evaluated against linked geofence collections, nor stored. This helps control costs by reducing the number of geofence evaluations and historical device positions to paginate through. Distance-based filtering can also reduce the effects of GPS noise when displaying device trajectories on a map. </p></li><li><p><code>AccuracyBased</code> - If the device has moved less than the measured accuracy, location updates are ignored. For example, if two consecutive updates from a device have a horizontal accuracy of 5 m and 10 m, the second update is ignored if the device has moved less than 15 m. Ignored location updates are neither evaluated against linked geofence collections, nor stored. This helps educe the effects of GPS noise when displaying device trajectories on a map, and can help control costs by reducing the number of geofence evaluations. </p></li></ul>
 */
@property (nonatomic, assign) AWSLocationPositionFiltering positionFiltering;

/**
 <p>No longer used. If included, the only allowed value is <code>RequestBasedUsage</code>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>This parameter is no longer used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pricingPlanDataSource;

/**
 <p>The name of the tracker resource to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationUpdateTrackerResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the updated tracker resource. Used to specify a resource across AWS.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:tracker/ExampleTracker</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable trackerArn;

/**
 <p>The name of the updated tracker resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

/**
 <p>The timestamp for when the tracker resource was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 <p>The input failed to meet the constraints specified by the AWS service in a specified field. </p>
 Required parameters: [Message, Name]
 */
@interface AWSLocationValidationExceptionField : AWSModel


/**
 <p>A message with the reason for the validation exception error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The field name where the invalid entry was detected.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

NS_ASSUME_NONNULL_END
