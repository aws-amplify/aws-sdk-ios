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

#import <XCTest/XCTest.h>
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSLocationModel.h"

@interface AWSLocationNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSLocationAssociateTrackerConsumerRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationAssociateTrackerConsumerResponse API_AVAILABLE(ios(11));
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
- (void) test_AWSLocationCreateGeofenceCollectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationCreateGeofenceCollectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationCreateMapRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationCreateMapResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationCreatePlaceIndexRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationCreatePlaceIndexResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationCreateTrackerRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationCreateTrackerResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDataSourceConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeleteGeofenceCollectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeleteGeofenceCollectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeleteMapRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeleteMapResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeletePlaceIndexRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeletePlaceIndexResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeleteTrackerRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDeleteTrackerResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDescribeGeofenceCollectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDescribeGeofenceCollectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDescribeMapRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDescribeMapResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDescribePlaceIndexRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDescribePlaceIndexResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDescribeTrackerRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDescribeTrackerResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationDevicePosition API_AVAILABLE(ios(11));
- (void) test_AWSLocationDevicePositionUpdate API_AVAILABLE(ios(11));
- (void) test_AWSLocationDisassociateTrackerConsumerRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationDisassociateTrackerConsumerResponse API_AVAILABLE(ios(11));
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
- (void) test_AWSLocationListGeofenceCollectionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationListGeofenceCollectionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationListGeofenceCollectionsResponseEntry API_AVAILABLE(ios(11));
- (void) test_AWSLocationListGeofenceResponseEntry API_AVAILABLE(ios(11));
- (void) test_AWSLocationListGeofencesRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationListGeofencesResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationListMapsRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationListMapsResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationListMapsResponseEntry API_AVAILABLE(ios(11));
- (void) test_AWSLocationListPlaceIndexesRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationListPlaceIndexesResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationListPlaceIndexesResponseEntry API_AVAILABLE(ios(11));
- (void) test_AWSLocationListTrackerConsumersRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationListTrackerConsumersResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationListTrackersRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationListTrackersResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationListTrackersResponseEntry API_AVAILABLE(ios(11));
- (void) test_AWSLocationMapConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSLocationPlace API_AVAILABLE(ios(11));
- (void) test_AWSLocationPlaceGeometry API_AVAILABLE(ios(11));
- (void) test_AWSLocationPutGeofenceRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationPutGeofenceResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationSearchForPositionResult API_AVAILABLE(ios(11));
- (void) test_AWSLocationSearchForTextResult API_AVAILABLE(ios(11));
- (void) test_AWSLocationSearchPlaceIndexForPositionRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationSearchPlaceIndexForPositionResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationSearchPlaceIndexForPositionSummary API_AVAILABLE(ios(11));
- (void) test_AWSLocationSearchPlaceIndexForTextRequest API_AVAILABLE(ios(11));
- (void) test_AWSLocationSearchPlaceIndexForTextResponse API_AVAILABLE(ios(11));
- (void) test_AWSLocationSearchPlaceIndexForTextSummary API_AVAILABLE(ios(11));
- (void) test_AWSLocationValidationExceptionField API_AVAILABLE(ios(11));

@end

@implementation AWSLocationNSSecureCodingTests

- (void) test_AWSLocationAssociateTrackerConsumerRequest {
    [self validateSecureCodingForClass:[AWSLocationAssociateTrackerConsumerRequest class]];
}

- (void) test_AWSLocationAssociateTrackerConsumerResponse {
    [self validateSecureCodingForClass:[AWSLocationAssociateTrackerConsumerResponse class]];
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

- (void) test_AWSLocationCreateGeofenceCollectionRequest {
    [self validateSecureCodingForClass:[AWSLocationCreateGeofenceCollectionRequest class]];
}

- (void) test_AWSLocationCreateGeofenceCollectionResponse {
    [self validateSecureCodingForClass:[AWSLocationCreateGeofenceCollectionResponse class]];
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

- (void) test_AWSLocationDisassociateTrackerConsumerRequest {
    [self validateSecureCodingForClass:[AWSLocationDisassociateTrackerConsumerRequest class]];
}

- (void) test_AWSLocationDisassociateTrackerConsumerResponse {
    [self validateSecureCodingForClass:[AWSLocationDisassociateTrackerConsumerResponse class]];
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

- (void) test_AWSLocationMapConfiguration {
    [self validateSecureCodingForClass:[AWSLocationMapConfiguration class]];
}

- (void) test_AWSLocationPlace {
    [self validateSecureCodingForClass:[AWSLocationPlace class]];
}

- (void) test_AWSLocationPlaceGeometry {
    [self validateSecureCodingForClass:[AWSLocationPlaceGeometry class]];
}

- (void) test_AWSLocationPutGeofenceRequest {
    [self validateSecureCodingForClass:[AWSLocationPutGeofenceRequest class]];
}

- (void) test_AWSLocationPutGeofenceResponse {
    [self validateSecureCodingForClass:[AWSLocationPutGeofenceResponse class]];
}

- (void) test_AWSLocationSearchForPositionResult {
    [self validateSecureCodingForClass:[AWSLocationSearchForPositionResult class]];
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

- (void) test_AWSLocationSearchPlaceIndexForTextRequest {
    [self validateSecureCodingForClass:[AWSLocationSearchPlaceIndexForTextRequest class]];
}

- (void) test_AWSLocationSearchPlaceIndexForTextResponse {
    [self validateSecureCodingForClass:[AWSLocationSearchPlaceIndexForTextResponse class]];
}

- (void) test_AWSLocationSearchPlaceIndexForTextSummary {
    [self validateSecureCodingForClass:[AWSLocationSearchPlaceIndexForTextSummary class]];
}

- (void) test_AWSLocationValidationExceptionField {
    [self validateSecureCodingForClass:[AWSLocationValidationExceptionField class]];
}

@end

