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

#import <XCTest/XCTest.h>
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSLocationModel.h"

@interface AWSLocationNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSLocationApiKeyFilter API_AVAILABLE(ios(11));
- (void) test_AWSLocationApiKeyRestrictions API_AVAILABLE(ios(11));
- (void) test_AWSLocationAssociateTrackerConsumerRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationAssociateTrackerConsumerResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchDeleteDevicePositionHistoryError API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchDeleteDevicePositionHistoryRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchDeleteDevicePositionHistoryResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchDeleteGeofenceError API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchDeleteGeofenceRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchDeleteGeofenceResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchEvaluateGeofencesError API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchEvaluateGeofencesRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchEvaluateGeofencesResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchGetDevicePositionError API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchGetDevicePositionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchGetDevicePositionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchItemError API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchPutGeofenceError API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchPutGeofenceRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchPutGeofenceRequestEntry API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchPutGeofenceResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchPutGeofenceSuccess API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchUpdateDevicePositionError API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchUpdateDevicePositionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationBatchUpdateDevicePositionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationCalculateRouteCarModeOptions API_AVAILABLE(ios(11));
- (void) test_AWSLocationCalculateRouteMatrixRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationCalculateRouteMatrixResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationCalculateRouteMatrixSummary API_AVAILABLE(ios(11));
- (void) test_AWSLocationCalculateRouteRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationCalculateRouteResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationCalculateRouteSummary API_AVAILABLE(ios(11));
- (void) test_AWSLocationCalculateRouteTruckModeOptions API_AVAILABLE(ios(11));
- (void) test_AWSLocationCellSignals API_AVAILABLE(ios(11));
- (void) test_AWSLocationCircle API_AVAILABLE(ios(11));
- (void) test_AWSLocationCreateGeofenceCollectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationCreateGeofenceCollectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationCreateKeyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationCreateKeyResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationCreateMapRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationCreateMapResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationCreatePlaceIndexRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationCreatePlaceIndexResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationCreateRouteCalculatorRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationCreateRouteCalculatorResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationCreateTrackerRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationCreateTrackerResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDataSourceConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeleteGeofenceCollectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeleteGeofenceCollectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeleteKeyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeleteKeyResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeleteMapRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeleteMapResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeletePlaceIndexRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeletePlaceIndexResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeleteRouteCalculatorRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeleteRouteCalculatorResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeleteTrackerRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeleteTrackerResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDescribeGeofenceCollectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDescribeGeofenceCollectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDescribeKeyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDescribeKeyResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDescribeMapRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDescribeMapResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDescribePlaceIndexRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDescribePlaceIndexResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDescribeRouteCalculatorRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDescribeRouteCalculatorResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDescribeTrackerRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDescribeTrackerResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDevicePosition API_AVAILABLE(ios(11));
- (void) test_AWSLocationDevicePositionUpdate API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeviceState API_AVAILABLE(ios(11));
- (void) test_AWSLocationDisassociateTrackerConsumerRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDisassociateTrackerConsumerResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationForecastGeofenceEventsDeviceState API_AVAILABLE(ios(11));
- (void) test_AWSLocationForecastGeofenceEventsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationForecastGeofenceEventsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationForecastedEvent API_AVAILABLE(ios(11));
- (void) test_AWSLocationGeofenceGeometry API_AVAILABLE(ios(11));
- (void) test_AWSLocationGetDevicePositionHistoryRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationGetDevicePositionHistoryResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationGetDevicePositionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationGetDevicePositionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationGetGeofenceRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationGetGeofenceResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationGetMapGlyphsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationGetMapGlyphsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationGetMapSpritesRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationGetMapSpritesResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationGetMapStyleDescriptorRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationGetMapStyleDescriptorResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationGetMapTileRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationGetMapTileResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationGetPlaceRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationGetPlaceResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationInferredState API_AVAILABLE(ios(11));
- (void) test_AWSLocationLeg API_AVAILABLE(ios(11));
- (void) test_AWSLocationLegGeometry API_AVAILABLE(ios(11));
- (void) test_AWSLocationListDevicePositionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationListDevicePositionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationListDevicePositionsResponseEntry API_AVAILABLE(ios(11));
- (void) test_AWSLocationListGeofenceCollectionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationListGeofenceCollectionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationListGeofenceCollectionsResponseEntry API_AVAILABLE(ios(11));
- (void) test_AWSLocationListGeofenceResponseEntry API_AVAILABLE(ios(11));
- (void) test_AWSLocationListGeofencesRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationListGeofencesResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationListKeysRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationListKeysResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationListKeysResponseEntry API_AVAILABLE(ios(11));
- (void) test_AWSLocationListMapsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationListMapsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationListMapsResponseEntry API_AVAILABLE(ios(11));
- (void) test_AWSLocationListPlaceIndexesRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationListPlaceIndexesResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationListPlaceIndexesResponseEntry API_AVAILABLE(ios(11));
- (void) test_AWSLocationListRouteCalculatorsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationListRouteCalculatorsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationListRouteCalculatorsResponseEntry API_AVAILABLE(ios(11));
- (void) test_AWSLocationListTagsForResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationListTagsForResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationListTrackerConsumersRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationListTrackerConsumersResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationListTrackersRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationListTrackersResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationListTrackersResponseEntry API_AVAILABLE(ios(11));
- (void) test_AWSLocationLteCellDetails API_AVAILABLE(ios(11));
- (void) test_AWSLocationLteLocalId API_AVAILABLE(ios(11));
- (void) test_AWSLocationLteNetworkMeasurements API_AVAILABLE(ios(11));
- (void) test_AWSLocationMapConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSLocationMapConfigurationUpdate API_AVAILABLE(ios(11));
- (void) test_AWSLocationPlace API_AVAILABLE(ios(11));
- (void) test_AWSLocationPlaceGeometry API_AVAILABLE(ios(11));
- (void) test_AWSLocationPositionalAccuracy API_AVAILABLE(ios(11));
- (void) test_AWSLocationPutGeofenceRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationPutGeofenceResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationRouteMatrixEntry API_AVAILABLE(ios(11));
- (void) test_AWSLocationRouteMatrixEntryError API_AVAILABLE(ios(11));
- (void) test_AWSLocationSearchForPositionResult API_AVAILABLE(ios(11));
- (void) test_AWSLocationSearchForSuggestionsResult API_AVAILABLE(ios(11));
- (void) test_AWSLocationSearchForTextResult API_AVAILABLE(ios(11));
- (void) test_AWSLocationSearchPlaceIndexForPositionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationSearchPlaceIndexForPositionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationSearchPlaceIndexForPositionSummary API_AVAILABLE(ios(11));
- (void) test_AWSLocationSearchPlaceIndexForSuggestionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationSearchPlaceIndexForSuggestionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationSearchPlaceIndexForSuggestionsSummary API_AVAILABLE(ios(11));
- (void) test_AWSLocationSearchPlaceIndexForTextRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationSearchPlaceIndexForTextResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationSearchPlaceIndexForTextSummary API_AVAILABLE(ios(11));
- (void) test_AWSLocationStep API_AVAILABLE(ios(11));
- (void) test_AWSLocationTagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationTagResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationTimeZone API_AVAILABLE(ios(11));
- (void) test_AWSLocationTrackingFilterGeometry API_AVAILABLE(ios(11));
- (void) test_AWSLocationTruckDimensions API_AVAILABLE(ios(11));
- (void) test_AWSLocationTruckWeight API_AVAILABLE(ios(11));
- (void) test_AWSLocationUntagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationUntagResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationUpdateGeofenceCollectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationUpdateGeofenceCollectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationUpdateKeyRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationUpdateKeyResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationUpdateMapRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationUpdateMapResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationUpdatePlaceIndexRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationUpdatePlaceIndexResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationUpdateRouteCalculatorRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationUpdateRouteCalculatorResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationUpdateTrackerRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationUpdateTrackerResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationValidationExceptionField API_AVAILABLE(ios(11));
- (void) test_AWSLocationVerifyDevicePositionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationVerifyDevicePositionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationWiFiAccessPoint API_AVAILABLE(ios(11));

@end

@implementation AWSLocationNSSecureCodingTests

- (void) test_AWSLocationApiKeyFilter {
    [self validateSecureCodingForClass:[AWSLocationApiKeyFilter class]];
}

- (void) test_AWSLocationApiKeyRestrictions {
    [self validateSecureCodingForClass:[AWSLocationApiKeyRestrictions class]];
}

- (void) test_AWSLocationAssociateTrackerConsumerRequest {
    [self validateSecureCodingForClass:[AWSLocationAssociateTrackerConsumerRequest class]];
}

- (void) test_AWSLocationAssociateTrackerConsumerResponse {
    [self validateSecureCodingForClass:[AWSLocationAssociateTrackerConsumerResponse class]];
}

- (void) test_AWSLocationBatchDeleteDevicePositionHistoryError {
    [self validateSecureCodingForClass:[AWSLocationBatchDeleteDevicePositionHistoryError class]];
}

- (void) test_AWSLocationBatchDeleteDevicePositionHistoryRequest {
    [self validateSecureCodingForClass:[AWSLocationBatchDeleteDevicePositionHistoryRequest class]];
}

- (void) test_AWSLocationBatchDeleteDevicePositionHistoryResponse {
    [self validateSecureCodingForClass:[AWSLocationBatchDeleteDevicePositionHistoryResponse class]];
}

- (void) test_AWSLocationBatchDeleteGeofenceError {
    [self validateSecureCodingForClass:[AWSLocationBatchDeleteGeofenceError class]];
}

- (void) test_AWSLocationBatchDeleteGeofenceRequest {
    [self validateSecureCodingForClass:[AWSLocationBatchDeleteGeofenceRequest class]];
}

- (void) test_AWSLocationBatchDeleteGeofenceResponse {
    [self validateSecureCodingForClass:[AWSLocationBatchDeleteGeofenceResponse class]];
}

- (void) test_AWSLocationBatchEvaluateGeofencesError {
    [self validateSecureCodingForClass:[AWSLocationBatchEvaluateGeofencesError class]];
}

- (void) test_AWSLocationBatchEvaluateGeofencesRequest {
    [self validateSecureCodingForClass:[AWSLocationBatchEvaluateGeofencesRequest class]];
}

- (void) test_AWSLocationBatchEvaluateGeofencesResponse {
    [self validateSecureCodingForClass:[AWSLocationBatchEvaluateGeofencesResponse class]];
}

- (void) test_AWSLocationBatchGetDevicePositionError {
    [self validateSecureCodingForClass:[AWSLocationBatchGetDevicePositionError class]];
}

- (void) test_AWSLocationBatchGetDevicePositionRequest {
    [self validateSecureCodingForClass:[AWSLocationBatchGetDevicePositionRequest class]];
}

- (void) test_AWSLocationBatchGetDevicePositionResponse {
    [self validateSecureCodingForClass:[AWSLocationBatchGetDevicePositionResponse class]];
}

- (void) test_AWSLocationBatchItemError {
    [self validateSecureCodingForClass:[AWSLocationBatchItemError class]];
}

- (void) test_AWSLocationBatchPutGeofenceError {
    [self validateSecureCodingForClass:[AWSLocationBatchPutGeofenceError class]];
}

- (void) test_AWSLocationBatchPutGeofenceRequest {
    [self validateSecureCodingForClass:[AWSLocationBatchPutGeofenceRequest class]];
}

- (void) test_AWSLocationBatchPutGeofenceRequestEntry {
    [self validateSecureCodingForClass:[AWSLocationBatchPutGeofenceRequestEntry class]];
}

- (void) test_AWSLocationBatchPutGeofenceResponse {
    [self validateSecureCodingForClass:[AWSLocationBatchPutGeofenceResponse class]];
}

- (void) test_AWSLocationBatchPutGeofenceSuccess {
    [self validateSecureCodingForClass:[AWSLocationBatchPutGeofenceSuccess class]];
}

- (void) test_AWSLocationBatchUpdateDevicePositionError {
    [self validateSecureCodingForClass:[AWSLocationBatchUpdateDevicePositionError class]];
}

- (void) test_AWSLocationBatchUpdateDevicePositionRequest {
    [self validateSecureCodingForClass:[AWSLocationBatchUpdateDevicePositionRequest class]];
}

- (void) test_AWSLocationBatchUpdateDevicePositionResponse {
    [self validateSecureCodingForClass:[AWSLocationBatchUpdateDevicePositionResponse class]];
}

- (void) test_AWSLocationCalculateRouteCarModeOptions {
    [self validateSecureCodingForClass:[AWSLocationCalculateRouteCarModeOptions class]];
}

- (void) test_AWSLocationCalculateRouteMatrixRequest {
    [self validateSecureCodingForClass:[AWSLocationCalculateRouteMatrixRequest class]];
}

- (void) test_AWSLocationCalculateRouteMatrixResponse {
    [self validateSecureCodingForClass:[AWSLocationCalculateRouteMatrixResponse class]];
}

- (void) test_AWSLocationCalculateRouteMatrixSummary {
    [self validateSecureCodingForClass:[AWSLocationCalculateRouteMatrixSummary class]];
}

- (void) test_AWSLocationCalculateRouteRequest {
    [self validateSecureCodingForClass:[AWSLocationCalculateRouteRequest class]];
}

- (void) test_AWSLocationCalculateRouteResponse {
    [self validateSecureCodingForClass:[AWSLocationCalculateRouteResponse class]];
}

- (void) test_AWSLocationCalculateRouteSummary {
    [self validateSecureCodingForClass:[AWSLocationCalculateRouteSummary class]];
}

- (void) test_AWSLocationCalculateRouteTruckModeOptions {
    [self validateSecureCodingForClass:[AWSLocationCalculateRouteTruckModeOptions class]];
}

- (void) test_AWSLocationCellSignals {
    [self validateSecureCodingForClass:[AWSLocationCellSignals class]];
}

- (void) test_AWSLocationCircle {
    [self validateSecureCodingForClass:[AWSLocationCircle class]];
}

- (void) test_AWSLocationCreateGeofenceCollectionRequest {
    [self validateSecureCodingForClass:[AWSLocationCreateGeofenceCollectionRequest class]];
}

- (void) test_AWSLocationCreateGeofenceCollectionResponse {
    [self validateSecureCodingForClass:[AWSLocationCreateGeofenceCollectionResponse class]];
}

- (void) test_AWSLocationCreateKeyRequest {
    [self validateSecureCodingForClass:[AWSLocationCreateKeyRequest class]];
}

- (void) test_AWSLocationCreateKeyResponse {
    [self validateSecureCodingForClass:[AWSLocationCreateKeyResponse class]];
}

- (void) test_AWSLocationCreateMapRequest {
    [self validateSecureCodingForClass:[AWSLocationCreateMapRequest class]];
}

- (void) test_AWSLocationCreateMapResponse {
    [self validateSecureCodingForClass:[AWSLocationCreateMapResponse class]];
}

- (void) test_AWSLocationCreatePlaceIndexRequest {
    [self validateSecureCodingForClass:[AWSLocationCreatePlaceIndexRequest class]];
}

- (void) test_AWSLocationCreatePlaceIndexResponse {
    [self validateSecureCodingForClass:[AWSLocationCreatePlaceIndexResponse class]];
}

- (void) test_AWSLocationCreateRouteCalculatorRequest {
    [self validateSecureCodingForClass:[AWSLocationCreateRouteCalculatorRequest class]];
}

- (void) test_AWSLocationCreateRouteCalculatorResponse {
    [self validateSecureCodingForClass:[AWSLocationCreateRouteCalculatorResponse class]];
}

- (void) test_AWSLocationCreateTrackerRequest {
    [self validateSecureCodingForClass:[AWSLocationCreateTrackerRequest class]];
}

- (void) test_AWSLocationCreateTrackerResponse {
    [self validateSecureCodingForClass:[AWSLocationCreateTrackerResponse class]];
}

- (void) test_AWSLocationDataSourceConfiguration {
    [self validateSecureCodingForClass:[AWSLocationDataSourceConfiguration class]];
}

- (void) test_AWSLocationDeleteGeofenceCollectionRequest {
    [self validateSecureCodingForClass:[AWSLocationDeleteGeofenceCollectionRequest class]];
}

- (void) test_AWSLocationDeleteGeofenceCollectionResponse {
    [self validateSecureCodingForClass:[AWSLocationDeleteGeofenceCollectionResponse class]];
}

- (void) test_AWSLocationDeleteKeyRequest {
    [self validateSecureCodingForClass:[AWSLocationDeleteKeyRequest class]];
}

- (void) test_AWSLocationDeleteKeyResponse {
    [self validateSecureCodingForClass:[AWSLocationDeleteKeyResponse class]];
}

- (void) test_AWSLocationDeleteMapRequest {
    [self validateSecureCodingForClass:[AWSLocationDeleteMapRequest class]];
}

- (void) test_AWSLocationDeleteMapResponse {
    [self validateSecureCodingForClass:[AWSLocationDeleteMapResponse class]];
}

- (void) test_AWSLocationDeletePlaceIndexRequest {
    [self validateSecureCodingForClass:[AWSLocationDeletePlaceIndexRequest class]];
}

- (void) test_AWSLocationDeletePlaceIndexResponse {
    [self validateSecureCodingForClass:[AWSLocationDeletePlaceIndexResponse class]];
}

- (void) test_AWSLocationDeleteRouteCalculatorRequest {
    [self validateSecureCodingForClass:[AWSLocationDeleteRouteCalculatorRequest class]];
}

- (void) test_AWSLocationDeleteRouteCalculatorResponse {
    [self validateSecureCodingForClass:[AWSLocationDeleteRouteCalculatorResponse class]];
}

- (void) test_AWSLocationDeleteTrackerRequest {
    [self validateSecureCodingForClass:[AWSLocationDeleteTrackerRequest class]];
}

- (void) test_AWSLocationDeleteTrackerResponse {
    [self validateSecureCodingForClass:[AWSLocationDeleteTrackerResponse class]];
}

- (void) test_AWSLocationDescribeGeofenceCollectionRequest {
    [self validateSecureCodingForClass:[AWSLocationDescribeGeofenceCollectionRequest class]];
}

- (void) test_AWSLocationDescribeGeofenceCollectionResponse {
    [self validateSecureCodingForClass:[AWSLocationDescribeGeofenceCollectionResponse class]];
}

- (void) test_AWSLocationDescribeKeyRequest {
    [self validateSecureCodingForClass:[AWSLocationDescribeKeyRequest class]];
}

- (void) test_AWSLocationDescribeKeyResponse {
    [self validateSecureCodingForClass:[AWSLocationDescribeKeyResponse class]];
}

- (void) test_AWSLocationDescribeMapRequest {
    [self validateSecureCodingForClass:[AWSLocationDescribeMapRequest class]];
}

- (void) test_AWSLocationDescribeMapResponse {
    [self validateSecureCodingForClass:[AWSLocationDescribeMapResponse class]];
}

- (void) test_AWSLocationDescribePlaceIndexRequest {
    [self validateSecureCodingForClass:[AWSLocationDescribePlaceIndexRequest class]];
}

- (void) test_AWSLocationDescribePlaceIndexResponse {
    [self validateSecureCodingForClass:[AWSLocationDescribePlaceIndexResponse class]];
}

- (void) test_AWSLocationDescribeRouteCalculatorRequest {
    [self validateSecureCodingForClass:[AWSLocationDescribeRouteCalculatorRequest class]];
}

- (void) test_AWSLocationDescribeRouteCalculatorResponse {
    [self validateSecureCodingForClass:[AWSLocationDescribeRouteCalculatorResponse class]];
}

- (void) test_AWSLocationDescribeTrackerRequest {
    [self validateSecureCodingForClass:[AWSLocationDescribeTrackerRequest class]];
}

- (void) test_AWSLocationDescribeTrackerResponse {
    [self validateSecureCodingForClass:[AWSLocationDescribeTrackerResponse class]];
}

- (void) test_AWSLocationDevicePosition {
    [self validateSecureCodingForClass:[AWSLocationDevicePosition class]];
}

- (void) test_AWSLocationDevicePositionUpdate {
    [self validateSecureCodingForClass:[AWSLocationDevicePositionUpdate class]];
}

- (void) test_AWSLocationDeviceState {
    [self validateSecureCodingForClass:[AWSLocationDeviceState class]];
}

- (void) test_AWSLocationDisassociateTrackerConsumerRequest {
    [self validateSecureCodingForClass:[AWSLocationDisassociateTrackerConsumerRequest class]];
}

- (void) test_AWSLocationDisassociateTrackerConsumerResponse {
    [self validateSecureCodingForClass:[AWSLocationDisassociateTrackerConsumerResponse class]];
}

- (void) test_AWSLocationForecastGeofenceEventsDeviceState {
    [self validateSecureCodingForClass:[AWSLocationForecastGeofenceEventsDeviceState class]];
}

- (void) test_AWSLocationForecastGeofenceEventsRequest {
    [self validateSecureCodingForClass:[AWSLocationForecastGeofenceEventsRequest class]];
}

- (void) test_AWSLocationForecastGeofenceEventsResponse {
    [self validateSecureCodingForClass:[AWSLocationForecastGeofenceEventsResponse class]];
}

- (void) test_AWSLocationForecastedEvent {
    [self validateSecureCodingForClass:[AWSLocationForecastedEvent class]];
}

- (void) test_AWSLocationGeofenceGeometry {
    [self validateSecureCodingForClass:[AWSLocationGeofenceGeometry class]];
}

- (void) test_AWSLocationGetDevicePositionHistoryRequest {
    [self validateSecureCodingForClass:[AWSLocationGetDevicePositionHistoryRequest class]];
}

- (void) test_AWSLocationGetDevicePositionHistoryResponse {
    [self validateSecureCodingForClass:[AWSLocationGetDevicePositionHistoryResponse class]];
}

- (void) test_AWSLocationGetDevicePositionRequest {
    [self validateSecureCodingForClass:[AWSLocationGetDevicePositionRequest class]];
}

- (void) test_AWSLocationGetDevicePositionResponse {
    [self validateSecureCodingForClass:[AWSLocationGetDevicePositionResponse class]];
}

- (void) test_AWSLocationGetGeofenceRequest {
    [self validateSecureCodingForClass:[AWSLocationGetGeofenceRequest class]];
}

- (void) test_AWSLocationGetGeofenceResponse {
    [self validateSecureCodingForClass:[AWSLocationGetGeofenceResponse class]];
}

- (void) test_AWSLocationGetMapGlyphsRequest {
    [self validateSecureCodingForClass:[AWSLocationGetMapGlyphsRequest class]];
}

- (void) test_AWSLocationGetMapGlyphsResponse {
    [self validateSecureCodingForClass:[AWSLocationGetMapGlyphsResponse class]];
}

- (void) test_AWSLocationGetMapSpritesRequest {
    [self validateSecureCodingForClass:[AWSLocationGetMapSpritesRequest class]];
}

- (void) test_AWSLocationGetMapSpritesResponse {
    [self validateSecureCodingForClass:[AWSLocationGetMapSpritesResponse class]];
}

- (void) test_AWSLocationGetMapStyleDescriptorRequest {
    [self validateSecureCodingForClass:[AWSLocationGetMapStyleDescriptorRequest class]];
}

- (void) test_AWSLocationGetMapStyleDescriptorResponse {
    [self validateSecureCodingForClass:[AWSLocationGetMapStyleDescriptorResponse class]];
}

- (void) test_AWSLocationGetMapTileRequest {
    [self validateSecureCodingForClass:[AWSLocationGetMapTileRequest class]];
}

- (void) test_AWSLocationGetMapTileResponse {
    [self validateSecureCodingForClass:[AWSLocationGetMapTileResponse class]];
}

- (void) test_AWSLocationGetPlaceRequest {
    [self validateSecureCodingForClass:[AWSLocationGetPlaceRequest class]];
}

- (void) test_AWSLocationGetPlaceResponse {
    [self validateSecureCodingForClass:[AWSLocationGetPlaceResponse class]];
}

- (void) test_AWSLocationInferredState {
    [self validateSecureCodingForClass:[AWSLocationInferredState class]];
}

- (void) test_AWSLocationLeg {
    [self validateSecureCodingForClass:[AWSLocationLeg class]];
}

- (void) test_AWSLocationLegGeometry {
    [self validateSecureCodingForClass:[AWSLocationLegGeometry class]];
}

- (void) test_AWSLocationListDevicePositionsRequest {
    [self validateSecureCodingForClass:[AWSLocationListDevicePositionsRequest class]];
}

- (void) test_AWSLocationListDevicePositionsResponse {
    [self validateSecureCodingForClass:[AWSLocationListDevicePositionsResponse class]];
}

- (void) test_AWSLocationListDevicePositionsResponseEntry {
    [self validateSecureCodingForClass:[AWSLocationListDevicePositionsResponseEntry class]];
}

- (void) test_AWSLocationListGeofenceCollectionsRequest {
    [self validateSecureCodingForClass:[AWSLocationListGeofenceCollectionsRequest class]];
}

- (void) test_AWSLocationListGeofenceCollectionsResponse {
    [self validateSecureCodingForClass:[AWSLocationListGeofenceCollectionsResponse class]];
}

- (void) test_AWSLocationListGeofenceCollectionsResponseEntry {
    [self validateSecureCodingForClass:[AWSLocationListGeofenceCollectionsResponseEntry class]];
}

- (void) test_AWSLocationListGeofenceResponseEntry {
    [self validateSecureCodingForClass:[AWSLocationListGeofenceResponseEntry class]];
}

- (void) test_AWSLocationListGeofencesRequest {
    [self validateSecureCodingForClass:[AWSLocationListGeofencesRequest class]];
}

- (void) test_AWSLocationListGeofencesResponse {
    [self validateSecureCodingForClass:[AWSLocationListGeofencesResponse class]];
}

- (void) test_AWSLocationListKeysRequest {
    [self validateSecureCodingForClass:[AWSLocationListKeysRequest class]];
}

- (void) test_AWSLocationListKeysResponse {
    [self validateSecureCodingForClass:[AWSLocationListKeysResponse class]];
}

- (void) test_AWSLocationListKeysResponseEntry {
    [self validateSecureCodingForClass:[AWSLocationListKeysResponseEntry class]];
}

- (void) test_AWSLocationListMapsRequest {
    [self validateSecureCodingForClass:[AWSLocationListMapsRequest class]];
}

- (void) test_AWSLocationListMapsResponse {
    [self validateSecureCodingForClass:[AWSLocationListMapsResponse class]];
}

- (void) test_AWSLocationListMapsResponseEntry {
    [self validateSecureCodingForClass:[AWSLocationListMapsResponseEntry class]];
}

- (void) test_AWSLocationListPlaceIndexesRequest {
    [self validateSecureCodingForClass:[AWSLocationListPlaceIndexesRequest class]];
}

- (void) test_AWSLocationListPlaceIndexesResponse {
    [self validateSecureCodingForClass:[AWSLocationListPlaceIndexesResponse class]];
}

- (void) test_AWSLocationListPlaceIndexesResponseEntry {
    [self validateSecureCodingForClass:[AWSLocationListPlaceIndexesResponseEntry class]];
}

- (void) test_AWSLocationListRouteCalculatorsRequest {
    [self validateSecureCodingForClass:[AWSLocationListRouteCalculatorsRequest class]];
}

- (void) test_AWSLocationListRouteCalculatorsResponse {
    [self validateSecureCodingForClass:[AWSLocationListRouteCalculatorsResponse class]];
}

- (void) test_AWSLocationListRouteCalculatorsResponseEntry {
    [self validateSecureCodingForClass:[AWSLocationListRouteCalculatorsResponseEntry class]];
}

- (void) test_AWSLocationListTagsForResourceRequest {
    [self validateSecureCodingForClass:[AWSLocationListTagsForResourceRequest class]];
}

- (void) test_AWSLocationListTagsForResourceResponse {
    [self validateSecureCodingForClass:[AWSLocationListTagsForResourceResponse class]];
}

- (void) test_AWSLocationListTrackerConsumersRequest {
    [self validateSecureCodingForClass:[AWSLocationListTrackerConsumersRequest class]];
}

- (void) test_AWSLocationListTrackerConsumersResponse {
    [self validateSecureCodingForClass:[AWSLocationListTrackerConsumersResponse class]];
}

- (void) test_AWSLocationListTrackersRequest {
    [self validateSecureCodingForClass:[AWSLocationListTrackersRequest class]];
}

- (void) test_AWSLocationListTrackersResponse {
    [self validateSecureCodingForClass:[AWSLocationListTrackersResponse class]];
}

- (void) test_AWSLocationListTrackersResponseEntry {
    [self validateSecureCodingForClass:[AWSLocationListTrackersResponseEntry class]];
}

- (void) test_AWSLocationLteCellDetails {
    [self validateSecureCodingForClass:[AWSLocationLteCellDetails class]];
}

- (void) test_AWSLocationLteLocalId {
    [self validateSecureCodingForClass:[AWSLocationLteLocalId class]];
}

- (void) test_AWSLocationLteNetworkMeasurements {
    [self validateSecureCodingForClass:[AWSLocationLteNetworkMeasurements class]];
}

- (void) test_AWSLocationMapConfiguration {
    [self validateSecureCodingForClass:[AWSLocationMapConfiguration class]];
}

- (void) test_AWSLocationMapConfigurationUpdate {
    [self validateSecureCodingForClass:[AWSLocationMapConfigurationUpdate class]];
}

- (void) test_AWSLocationPlace {
    [self validateSecureCodingForClass:[AWSLocationPlace class]];
}

- (void) test_AWSLocationPlaceGeometry {
    [self validateSecureCodingForClass:[AWSLocationPlaceGeometry class]];
}

- (void) test_AWSLocationPositionalAccuracy {
    [self validateSecureCodingForClass:[AWSLocationPositionalAccuracy class]];
}

- (void) test_AWSLocationPutGeofenceRequest {
    [self validateSecureCodingForClass:[AWSLocationPutGeofenceRequest class]];
}

- (void) test_AWSLocationPutGeofenceResponse {
    [self validateSecureCodingForClass:[AWSLocationPutGeofenceResponse class]];
}

- (void) test_AWSLocationRouteMatrixEntry {
    [self validateSecureCodingForClass:[AWSLocationRouteMatrixEntry class]];
}

- (void) test_AWSLocationRouteMatrixEntryError {
    [self validateSecureCodingForClass:[AWSLocationRouteMatrixEntryError class]];
}

- (void) test_AWSLocationSearchForPositionResult {
    [self validateSecureCodingForClass:[AWSLocationSearchForPositionResult class]];
}

- (void) test_AWSLocationSearchForSuggestionsResult {
    [self validateSecureCodingForClass:[AWSLocationSearchForSuggestionsResult class]];
}

- (void) test_AWSLocationSearchForTextResult {
    [self validateSecureCodingForClass:[AWSLocationSearchForTextResult class]];
}

- (void) test_AWSLocationSearchPlaceIndexForPositionRequest {
    [self validateSecureCodingForClass:[AWSLocationSearchPlaceIndexForPositionRequest class]];
}

- (void) test_AWSLocationSearchPlaceIndexForPositionResponse {
    [self validateSecureCodingForClass:[AWSLocationSearchPlaceIndexForPositionResponse class]];
}

- (void) test_AWSLocationSearchPlaceIndexForPositionSummary {
    [self validateSecureCodingForClass:[AWSLocationSearchPlaceIndexForPositionSummary class]];
}

- (void) test_AWSLocationSearchPlaceIndexForSuggestionsRequest {
    [self validateSecureCodingForClass:[AWSLocationSearchPlaceIndexForSuggestionsRequest class]];
}

- (void) test_AWSLocationSearchPlaceIndexForSuggestionsResponse {
    [self validateSecureCodingForClass:[AWSLocationSearchPlaceIndexForSuggestionsResponse class]];
}

- (void) test_AWSLocationSearchPlaceIndexForSuggestionsSummary {
    [self validateSecureCodingForClass:[AWSLocationSearchPlaceIndexForSuggestionsSummary class]];
}

- (void) test_AWSLocationSearchPlaceIndexForTextRequest {
    [self validateSecureCodingForClass:[AWSLocationSearchPlaceIndexForTextRequest class]];
}

- (void) test_AWSLocationSearchPlaceIndexForTextResponse {
    [self validateSecureCodingForClass:[AWSLocationSearchPlaceIndexForTextResponse class]];
}

- (void) test_AWSLocationSearchPlaceIndexForTextSummary {
    [self validateSecureCodingForClass:[AWSLocationSearchPlaceIndexForTextSummary class]];
}

- (void) test_AWSLocationStep {
    [self validateSecureCodingForClass:[AWSLocationStep class]];
}

- (void) test_AWSLocationTagResourceRequest {
    [self validateSecureCodingForClass:[AWSLocationTagResourceRequest class]];
}

- (void) test_AWSLocationTagResourceResponse {
    [self validateSecureCodingForClass:[AWSLocationTagResourceResponse class]];
}

- (void) test_AWSLocationTimeZone {
    [self validateSecureCodingForClass:[AWSLocationTimeZone class]];
}

- (void) test_AWSLocationTrackingFilterGeometry {
    [self validateSecureCodingForClass:[AWSLocationTrackingFilterGeometry class]];
}

- (void) test_AWSLocationTruckDimensions {
    [self validateSecureCodingForClass:[AWSLocationTruckDimensions class]];
}

- (void) test_AWSLocationTruckWeight {
    [self validateSecureCodingForClass:[AWSLocationTruckWeight class]];
}

- (void) test_AWSLocationUntagResourceRequest {
    [self validateSecureCodingForClass:[AWSLocationUntagResourceRequest class]];
}

- (void) test_AWSLocationUntagResourceResponse {
    [self validateSecureCodingForClass:[AWSLocationUntagResourceResponse class]];
}

- (void) test_AWSLocationUpdateGeofenceCollectionRequest {
    [self validateSecureCodingForClass:[AWSLocationUpdateGeofenceCollectionRequest class]];
}

- (void) test_AWSLocationUpdateGeofenceCollectionResponse {
    [self validateSecureCodingForClass:[AWSLocationUpdateGeofenceCollectionResponse class]];
}

- (void) test_AWSLocationUpdateKeyRequest {
    [self validateSecureCodingForClass:[AWSLocationUpdateKeyRequest class]];
}

- (void) test_AWSLocationUpdateKeyResponse {
    [self validateSecureCodingForClass:[AWSLocationUpdateKeyResponse class]];
}

- (void) test_AWSLocationUpdateMapRequest {
    [self validateSecureCodingForClass:[AWSLocationUpdateMapRequest class]];
}

- (void) test_AWSLocationUpdateMapResponse {
    [self validateSecureCodingForClass:[AWSLocationUpdateMapResponse class]];
}

- (void) test_AWSLocationUpdatePlaceIndexRequest {
    [self validateSecureCodingForClass:[AWSLocationUpdatePlaceIndexRequest class]];
}

- (void) test_AWSLocationUpdatePlaceIndexResponse {
    [self validateSecureCodingForClass:[AWSLocationUpdatePlaceIndexResponse class]];
}

- (void) test_AWSLocationUpdateRouteCalculatorRequest {
    [self validateSecureCodingForClass:[AWSLocationUpdateRouteCalculatorRequest class]];
}

- (void) test_AWSLocationUpdateRouteCalculatorResponse {
    [self validateSecureCodingForClass:[AWSLocationUpdateRouteCalculatorResponse class]];
}

- (void) test_AWSLocationUpdateTrackerRequest {
    [self validateSecureCodingForClass:[AWSLocationUpdateTrackerRequest class]];
}

- (void) test_AWSLocationUpdateTrackerResponse {
    [self validateSecureCodingForClass:[AWSLocationUpdateTrackerResponse class]];
}

- (void) test_AWSLocationValidationExceptionField {
    [self validateSecureCodingForClass:[AWSLocationValidationExceptionField class]];
}

- (void) test_AWSLocationVerifyDevicePositionRequest {
    [self validateSecureCodingForClass:[AWSLocationVerifyDevicePositionRequest class]];
}

- (void) test_AWSLocationVerifyDevicePositionResponse {
    [self validateSecureCodingForClass:[AWSLocationVerifyDevicePositionResponse class]];
}

- (void) test_AWSLocationWiFiAccessPoint {
    [self validateSecureCodingForClass:[AWSLocationWiFiAccessPoint class]];
}

@end

