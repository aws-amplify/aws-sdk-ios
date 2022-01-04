//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSRekognitionModel.h"

@interface AWSRekognitionNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSRekognitionAgeRange API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionAsset API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionAudioMetadata API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionBeard API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionBlackFrame API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionBoundingBox API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionCelebrity API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionCelebrityDetail API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionCelebrityRecognition API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionCompareFacesMatch API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionCompareFacesRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionCompareFacesResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionComparedFace API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionComparedSourceImageFace API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionContentModerationDetection API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionCoversBodyPart API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionCreateCollectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionCreateCollectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionCreateDatasetRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionCreateDatasetResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionCreateProjectRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionCreateProjectResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionCreateProjectVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionCreateProjectVersionResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionCreateStreamProcessorRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionCreateStreamProcessorResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionCustomLabel API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDatasetChanges API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDatasetDescription API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDatasetLabelDescription API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDatasetLabelStats API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDatasetMetadata API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDatasetSource API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDatasetStats API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDeleteCollectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDeleteCollectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDeleteDatasetRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDeleteDatasetResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDeleteFacesRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDeleteFacesResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDeleteProjectRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDeleteProjectResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDeleteProjectVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDeleteProjectVersionResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDeleteStreamProcessorRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDeleteStreamProcessorResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDescribeCollectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDescribeCollectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDescribeDatasetRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDescribeDatasetResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDescribeProjectVersionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDescribeProjectVersionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDescribeProjectsRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDescribeProjectsResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDescribeStreamProcessorRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDescribeStreamProcessorResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDetectCustomLabelsRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDetectCustomLabelsResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDetectFacesRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDetectFacesResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDetectLabelsRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDetectLabelsResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDetectModerationLabelsRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDetectModerationLabelsResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDetectProtectiveEquipmentRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDetectProtectiveEquipmentResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDetectTextFilters API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDetectTextRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDetectTextResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDetectionFilter API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDistributeDataset API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDistributeDatasetEntriesRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionDistributeDatasetEntriesResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionEmotion API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionEquipmentDetection API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionEvaluationResult API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionEyeOpen API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionEyeglasses API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionFace API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionFaceDetail API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionFaceDetection API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionFaceMatch API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionFaceRecord API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionFaceSearchSettings API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGender API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGeometry API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGetCelebrityInfoRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGetCelebrityInfoResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGetCelebrityRecognitionRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGetCelebrityRecognitionResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGetContentModerationRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGetContentModerationResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGetFaceDetectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGetFaceDetectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGetFaceSearchRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGetFaceSearchResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGetLabelDetectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGetLabelDetectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGetPersonTrackingRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGetPersonTrackingResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGetSegmentDetectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGetSegmentDetectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGetTextDetectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGetTextDetectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionGroundTruthManifest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionHumanLoopActivationOutput API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionHumanLoopConfig API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionHumanLoopDataAttributes API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionImage API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionImageQuality API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionIndexFacesRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionIndexFacesResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionInstance API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionKinesisDataStream API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionKinesisVideoStream API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionKnownGender API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionLabel API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionLabelDetection API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionLandmark API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionListCollectionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionListCollectionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionListDatasetEntriesRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionListDatasetEntriesResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionListDatasetLabelsRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionListDatasetLabelsResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionListFacesRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionListFacesResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionListStreamProcessorsRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionListStreamProcessorsResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionListTagsForResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionListTagsForResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionModerationLabel API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionMouthOpen API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionMustache API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionNotificationChannel API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionOutputConfig API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionParent API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionPersonDetail API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionPersonDetection API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionPersonMatch API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionPoint API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionPose API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionProjectDescription API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionProjectVersionDescription API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionProtectiveEquipmentBodyPart API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionProtectiveEquipmentPerson API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionProtectiveEquipmentSummarizationAttributes API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionProtectiveEquipmentSummary API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionRecognizeCelebritiesRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionRecognizeCelebritiesResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionRegionOfInterest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionS3Object API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionSearchFacesByImageRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionSearchFacesByImageResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionSearchFacesRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionSearchFacesResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionSegmentDetection API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionSegmentTypeInfo API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionShotSegment API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionSmile API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartCelebrityRecognitionRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartCelebrityRecognitionResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartContentModerationRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartContentModerationResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartFaceDetectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartFaceDetectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartFaceSearchRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartFaceSearchResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartLabelDetectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartLabelDetectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartPersonTrackingRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartPersonTrackingResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartProjectVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartProjectVersionResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartSegmentDetectionFilters API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartSegmentDetectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartSegmentDetectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartShotDetectionFilter API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartStreamProcessorRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartStreamProcessorResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartTechnicalCueDetectionFilter API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartTextDetectionFilters API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartTextDetectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStartTextDetectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStopProjectVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStopProjectVersionResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStopStreamProcessorRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStopStreamProcessorResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStreamProcessor API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStreamProcessorInput API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStreamProcessorOutput API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionStreamProcessorSettings API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionSummary API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionSunglasses API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionTagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionTagResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionTechnicalCueSegment API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionTestingData API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionTestingDataResult API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionTextDetection API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionTextDetectionResult API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionTrainingData API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionTrainingDataResult API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionUnindexedFace API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionUntagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionUntagResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionUpdateDatasetEntriesRequest API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionUpdateDatasetEntriesResponse API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionValidationData API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionVideo API_AVAILABLE(ios(11));
- (void) test_AWSRekognitionVideoMetadata API_AVAILABLE(ios(11));

@end

@implementation AWSRekognitionNSSecureCodingTests

- (void) test_AWSRekognitionAgeRange {
    [self validateSecureCodingForClass:[AWSRekognitionAgeRange class]];
}

- (void) test_AWSRekognitionAsset {
    [self validateSecureCodingForClass:[AWSRekognitionAsset class]];
}

- (void) test_AWSRekognitionAudioMetadata {
    [self validateSecureCodingForClass:[AWSRekognitionAudioMetadata class]];
}

- (void) test_AWSRekognitionBeard {
    [self validateSecureCodingForClass:[AWSRekognitionBeard class]];
}

- (void) test_AWSRekognitionBlackFrame {
    [self validateSecureCodingForClass:[AWSRekognitionBlackFrame class]];
}

- (void) test_AWSRekognitionBoundingBox {
    [self validateSecureCodingForClass:[AWSRekognitionBoundingBox class]];
}

- (void) test_AWSRekognitionCelebrity {
    [self validateSecureCodingForClass:[AWSRekognitionCelebrity class]];
}

- (void) test_AWSRekognitionCelebrityDetail {
    [self validateSecureCodingForClass:[AWSRekognitionCelebrityDetail class]];
}

- (void) test_AWSRekognitionCelebrityRecognition {
    [self validateSecureCodingForClass:[AWSRekognitionCelebrityRecognition class]];
}

- (void) test_AWSRekognitionCompareFacesMatch {
    [self validateSecureCodingForClass:[AWSRekognitionCompareFacesMatch class]];
}

- (void) test_AWSRekognitionCompareFacesRequest {
    [self validateSecureCodingForClass:[AWSRekognitionCompareFacesRequest class]];
}

- (void) test_AWSRekognitionCompareFacesResponse {
    [self validateSecureCodingForClass:[AWSRekognitionCompareFacesResponse class]];
}

- (void) test_AWSRekognitionComparedFace {
    [self validateSecureCodingForClass:[AWSRekognitionComparedFace class]];
}

- (void) test_AWSRekognitionComparedSourceImageFace {
    [self validateSecureCodingForClass:[AWSRekognitionComparedSourceImageFace class]];
}

- (void) test_AWSRekognitionContentModerationDetection {
    [self validateSecureCodingForClass:[AWSRekognitionContentModerationDetection class]];
}

- (void) test_AWSRekognitionCoversBodyPart {
    [self validateSecureCodingForClass:[AWSRekognitionCoversBodyPart class]];
}

- (void) test_AWSRekognitionCreateCollectionRequest {
    [self validateSecureCodingForClass:[AWSRekognitionCreateCollectionRequest class]];
}

- (void) test_AWSRekognitionCreateCollectionResponse {
    [self validateSecureCodingForClass:[AWSRekognitionCreateCollectionResponse class]];
}

- (void) test_AWSRekognitionCreateDatasetRequest {
    [self validateSecureCodingForClass:[AWSRekognitionCreateDatasetRequest class]];
}

- (void) test_AWSRekognitionCreateDatasetResponse {
    [self validateSecureCodingForClass:[AWSRekognitionCreateDatasetResponse class]];
}

- (void) test_AWSRekognitionCreateProjectRequest {
    [self validateSecureCodingForClass:[AWSRekognitionCreateProjectRequest class]];
}

- (void) test_AWSRekognitionCreateProjectResponse {
    [self validateSecureCodingForClass:[AWSRekognitionCreateProjectResponse class]];
}

- (void) test_AWSRekognitionCreateProjectVersionRequest {
    [self validateSecureCodingForClass:[AWSRekognitionCreateProjectVersionRequest class]];
}

- (void) test_AWSRekognitionCreateProjectVersionResponse {
    [self validateSecureCodingForClass:[AWSRekognitionCreateProjectVersionResponse class]];
}

- (void) test_AWSRekognitionCreateStreamProcessorRequest {
    [self validateSecureCodingForClass:[AWSRekognitionCreateStreamProcessorRequest class]];
}

- (void) test_AWSRekognitionCreateStreamProcessorResponse {
    [self validateSecureCodingForClass:[AWSRekognitionCreateStreamProcessorResponse class]];
}

- (void) test_AWSRekognitionCustomLabel {
    [self validateSecureCodingForClass:[AWSRekognitionCustomLabel class]];
}

- (void) test_AWSRekognitionDatasetChanges {
    [self validateSecureCodingForClass:[AWSRekognitionDatasetChanges class]];
}

- (void) test_AWSRekognitionDatasetDescription {
    [self validateSecureCodingForClass:[AWSRekognitionDatasetDescription class]];
}

- (void) test_AWSRekognitionDatasetLabelDescription {
    [self validateSecureCodingForClass:[AWSRekognitionDatasetLabelDescription class]];
}

- (void) test_AWSRekognitionDatasetLabelStats {
    [self validateSecureCodingForClass:[AWSRekognitionDatasetLabelStats class]];
}

- (void) test_AWSRekognitionDatasetMetadata {
    [self validateSecureCodingForClass:[AWSRekognitionDatasetMetadata class]];
}

- (void) test_AWSRekognitionDatasetSource {
    [self validateSecureCodingForClass:[AWSRekognitionDatasetSource class]];
}

- (void) test_AWSRekognitionDatasetStats {
    [self validateSecureCodingForClass:[AWSRekognitionDatasetStats class]];
}

- (void) test_AWSRekognitionDeleteCollectionRequest {
    [self validateSecureCodingForClass:[AWSRekognitionDeleteCollectionRequest class]];
}

- (void) test_AWSRekognitionDeleteCollectionResponse {
    [self validateSecureCodingForClass:[AWSRekognitionDeleteCollectionResponse class]];
}

- (void) test_AWSRekognitionDeleteDatasetRequest {
    [self validateSecureCodingForClass:[AWSRekognitionDeleteDatasetRequest class]];
}

- (void) test_AWSRekognitionDeleteDatasetResponse {
    [self validateSecureCodingForClass:[AWSRekognitionDeleteDatasetResponse class]];
}

- (void) test_AWSRekognitionDeleteFacesRequest {
    [self validateSecureCodingForClass:[AWSRekognitionDeleteFacesRequest class]];
}

- (void) test_AWSRekognitionDeleteFacesResponse {
    [self validateSecureCodingForClass:[AWSRekognitionDeleteFacesResponse class]];
}

- (void) test_AWSRekognitionDeleteProjectRequest {
    [self validateSecureCodingForClass:[AWSRekognitionDeleteProjectRequest class]];
}

- (void) test_AWSRekognitionDeleteProjectResponse {
    [self validateSecureCodingForClass:[AWSRekognitionDeleteProjectResponse class]];
}

- (void) test_AWSRekognitionDeleteProjectVersionRequest {
    [self validateSecureCodingForClass:[AWSRekognitionDeleteProjectVersionRequest class]];
}

- (void) test_AWSRekognitionDeleteProjectVersionResponse {
    [self validateSecureCodingForClass:[AWSRekognitionDeleteProjectVersionResponse class]];
}

- (void) test_AWSRekognitionDeleteStreamProcessorRequest {
    [self validateSecureCodingForClass:[AWSRekognitionDeleteStreamProcessorRequest class]];
}

- (void) test_AWSRekognitionDeleteStreamProcessorResponse {
    [self validateSecureCodingForClass:[AWSRekognitionDeleteStreamProcessorResponse class]];
}

- (void) test_AWSRekognitionDescribeCollectionRequest {
    [self validateSecureCodingForClass:[AWSRekognitionDescribeCollectionRequest class]];
}

- (void) test_AWSRekognitionDescribeCollectionResponse {
    [self validateSecureCodingForClass:[AWSRekognitionDescribeCollectionResponse class]];
}

- (void) test_AWSRekognitionDescribeDatasetRequest {
    [self validateSecureCodingForClass:[AWSRekognitionDescribeDatasetRequest class]];
}

- (void) test_AWSRekognitionDescribeDatasetResponse {
    [self validateSecureCodingForClass:[AWSRekognitionDescribeDatasetResponse class]];
}

- (void) test_AWSRekognitionDescribeProjectVersionsRequest {
    [self validateSecureCodingForClass:[AWSRekognitionDescribeProjectVersionsRequest class]];
}

- (void) test_AWSRekognitionDescribeProjectVersionsResponse {
    [self validateSecureCodingForClass:[AWSRekognitionDescribeProjectVersionsResponse class]];
}

- (void) test_AWSRekognitionDescribeProjectsRequest {
    [self validateSecureCodingForClass:[AWSRekognitionDescribeProjectsRequest class]];
}

- (void) test_AWSRekognitionDescribeProjectsResponse {
    [self validateSecureCodingForClass:[AWSRekognitionDescribeProjectsResponse class]];
}

- (void) test_AWSRekognitionDescribeStreamProcessorRequest {
    [self validateSecureCodingForClass:[AWSRekognitionDescribeStreamProcessorRequest class]];
}

- (void) test_AWSRekognitionDescribeStreamProcessorResponse {
    [self validateSecureCodingForClass:[AWSRekognitionDescribeStreamProcessorResponse class]];
}

- (void) test_AWSRekognitionDetectCustomLabelsRequest {
    [self validateSecureCodingForClass:[AWSRekognitionDetectCustomLabelsRequest class]];
}

- (void) test_AWSRekognitionDetectCustomLabelsResponse {
    [self validateSecureCodingForClass:[AWSRekognitionDetectCustomLabelsResponse class]];
}

- (void) test_AWSRekognitionDetectFacesRequest {
    [self validateSecureCodingForClass:[AWSRekognitionDetectFacesRequest class]];
}

- (void) test_AWSRekognitionDetectFacesResponse {
    [self validateSecureCodingForClass:[AWSRekognitionDetectFacesResponse class]];
}

- (void) test_AWSRekognitionDetectLabelsRequest {
    [self validateSecureCodingForClass:[AWSRekognitionDetectLabelsRequest class]];
}

- (void) test_AWSRekognitionDetectLabelsResponse {
    [self validateSecureCodingForClass:[AWSRekognitionDetectLabelsResponse class]];
}

- (void) test_AWSRekognitionDetectModerationLabelsRequest {
    [self validateSecureCodingForClass:[AWSRekognitionDetectModerationLabelsRequest class]];
}

- (void) test_AWSRekognitionDetectModerationLabelsResponse {
    [self validateSecureCodingForClass:[AWSRekognitionDetectModerationLabelsResponse class]];
}

- (void) test_AWSRekognitionDetectProtectiveEquipmentRequest {
    [self validateSecureCodingForClass:[AWSRekognitionDetectProtectiveEquipmentRequest class]];
}

- (void) test_AWSRekognitionDetectProtectiveEquipmentResponse {
    [self validateSecureCodingForClass:[AWSRekognitionDetectProtectiveEquipmentResponse class]];
}

- (void) test_AWSRekognitionDetectTextFilters {
    [self validateSecureCodingForClass:[AWSRekognitionDetectTextFilters class]];
}

- (void) test_AWSRekognitionDetectTextRequest {
    [self validateSecureCodingForClass:[AWSRekognitionDetectTextRequest class]];
}

- (void) test_AWSRekognitionDetectTextResponse {
    [self validateSecureCodingForClass:[AWSRekognitionDetectTextResponse class]];
}

- (void) test_AWSRekognitionDetectionFilter {
    [self validateSecureCodingForClass:[AWSRekognitionDetectionFilter class]];
}

- (void) test_AWSRekognitionDistributeDataset {
    [self validateSecureCodingForClass:[AWSRekognitionDistributeDataset class]];
}

- (void) test_AWSRekognitionDistributeDatasetEntriesRequest {
    [self validateSecureCodingForClass:[AWSRekognitionDistributeDatasetEntriesRequest class]];
}

- (void) test_AWSRekognitionDistributeDatasetEntriesResponse {
    [self validateSecureCodingForClass:[AWSRekognitionDistributeDatasetEntriesResponse class]];
}

- (void) test_AWSRekognitionEmotion {
    [self validateSecureCodingForClass:[AWSRekognitionEmotion class]];
}

- (void) test_AWSRekognitionEquipmentDetection {
    [self validateSecureCodingForClass:[AWSRekognitionEquipmentDetection class]];
}

- (void) test_AWSRekognitionEvaluationResult {
    [self validateSecureCodingForClass:[AWSRekognitionEvaluationResult class]];
}

- (void) test_AWSRekognitionEyeOpen {
    [self validateSecureCodingForClass:[AWSRekognitionEyeOpen class]];
}

- (void) test_AWSRekognitionEyeglasses {
    [self validateSecureCodingForClass:[AWSRekognitionEyeglasses class]];
}

- (void) test_AWSRekognitionFace {
    [self validateSecureCodingForClass:[AWSRekognitionFace class]];
}

- (void) test_AWSRekognitionFaceDetail {
    [self validateSecureCodingForClass:[AWSRekognitionFaceDetail class]];
}

- (void) test_AWSRekognitionFaceDetection {
    [self validateSecureCodingForClass:[AWSRekognitionFaceDetection class]];
}

- (void) test_AWSRekognitionFaceMatch {
    [self validateSecureCodingForClass:[AWSRekognitionFaceMatch class]];
}

- (void) test_AWSRekognitionFaceRecord {
    [self validateSecureCodingForClass:[AWSRekognitionFaceRecord class]];
}

- (void) test_AWSRekognitionFaceSearchSettings {
    [self validateSecureCodingForClass:[AWSRekognitionFaceSearchSettings class]];
}

- (void) test_AWSRekognitionGender {
    [self validateSecureCodingForClass:[AWSRekognitionGender class]];
}

- (void) test_AWSRekognitionGeometry {
    [self validateSecureCodingForClass:[AWSRekognitionGeometry class]];
}

- (void) test_AWSRekognitionGetCelebrityInfoRequest {
    [self validateSecureCodingForClass:[AWSRekognitionGetCelebrityInfoRequest class]];
}

- (void) test_AWSRekognitionGetCelebrityInfoResponse {
    [self validateSecureCodingForClass:[AWSRekognitionGetCelebrityInfoResponse class]];
}

- (void) test_AWSRekognitionGetCelebrityRecognitionRequest {
    [self validateSecureCodingForClass:[AWSRekognitionGetCelebrityRecognitionRequest class]];
}

- (void) test_AWSRekognitionGetCelebrityRecognitionResponse {
    [self validateSecureCodingForClass:[AWSRekognitionGetCelebrityRecognitionResponse class]];
}

- (void) test_AWSRekognitionGetContentModerationRequest {
    [self validateSecureCodingForClass:[AWSRekognitionGetContentModerationRequest class]];
}

- (void) test_AWSRekognitionGetContentModerationResponse {
    [self validateSecureCodingForClass:[AWSRekognitionGetContentModerationResponse class]];
}

- (void) test_AWSRekognitionGetFaceDetectionRequest {
    [self validateSecureCodingForClass:[AWSRekognitionGetFaceDetectionRequest class]];
}

- (void) test_AWSRekognitionGetFaceDetectionResponse {
    [self validateSecureCodingForClass:[AWSRekognitionGetFaceDetectionResponse class]];
}

- (void) test_AWSRekognitionGetFaceSearchRequest {
    [self validateSecureCodingForClass:[AWSRekognitionGetFaceSearchRequest class]];
}

- (void) test_AWSRekognitionGetFaceSearchResponse {
    [self validateSecureCodingForClass:[AWSRekognitionGetFaceSearchResponse class]];
}

- (void) test_AWSRekognitionGetLabelDetectionRequest {
    [self validateSecureCodingForClass:[AWSRekognitionGetLabelDetectionRequest class]];
}

- (void) test_AWSRekognitionGetLabelDetectionResponse {
    [self validateSecureCodingForClass:[AWSRekognitionGetLabelDetectionResponse class]];
}

- (void) test_AWSRekognitionGetPersonTrackingRequest {
    [self validateSecureCodingForClass:[AWSRekognitionGetPersonTrackingRequest class]];
}

- (void) test_AWSRekognitionGetPersonTrackingResponse {
    [self validateSecureCodingForClass:[AWSRekognitionGetPersonTrackingResponse class]];
}

- (void) test_AWSRekognitionGetSegmentDetectionRequest {
    [self validateSecureCodingForClass:[AWSRekognitionGetSegmentDetectionRequest class]];
}

- (void) test_AWSRekognitionGetSegmentDetectionResponse {
    [self validateSecureCodingForClass:[AWSRekognitionGetSegmentDetectionResponse class]];
}

- (void) test_AWSRekognitionGetTextDetectionRequest {
    [self validateSecureCodingForClass:[AWSRekognitionGetTextDetectionRequest class]];
}

- (void) test_AWSRekognitionGetTextDetectionResponse {
    [self validateSecureCodingForClass:[AWSRekognitionGetTextDetectionResponse class]];
}

- (void) test_AWSRekognitionGroundTruthManifest {
    [self validateSecureCodingForClass:[AWSRekognitionGroundTruthManifest class]];
}

- (void) test_AWSRekognitionHumanLoopActivationOutput {
    [self validateSecureCodingForClass:[AWSRekognitionHumanLoopActivationOutput class]];
}

- (void) test_AWSRekognitionHumanLoopConfig {
    [self validateSecureCodingForClass:[AWSRekognitionHumanLoopConfig class]];
}

- (void) test_AWSRekognitionHumanLoopDataAttributes {
    [self validateSecureCodingForClass:[AWSRekognitionHumanLoopDataAttributes class]];
}

- (void) test_AWSRekognitionImage {
    [self validateSecureCodingForClass:[AWSRekognitionImage class]];
}

- (void) test_AWSRekognitionImageQuality {
    [self validateSecureCodingForClass:[AWSRekognitionImageQuality class]];
}

- (void) test_AWSRekognitionIndexFacesRequest {
    [self validateSecureCodingForClass:[AWSRekognitionIndexFacesRequest class]];
}

- (void) test_AWSRekognitionIndexFacesResponse {
    [self validateSecureCodingForClass:[AWSRekognitionIndexFacesResponse class]];
}

- (void) test_AWSRekognitionInstance {
    [self validateSecureCodingForClass:[AWSRekognitionInstance class]];
}

- (void) test_AWSRekognitionKinesisDataStream {
    [self validateSecureCodingForClass:[AWSRekognitionKinesisDataStream class]];
}

- (void) test_AWSRekognitionKinesisVideoStream {
    [self validateSecureCodingForClass:[AWSRekognitionKinesisVideoStream class]];
}

- (void) test_AWSRekognitionKnownGender {
    [self validateSecureCodingForClass:[AWSRekognitionKnownGender class]];
}

- (void) test_AWSRekognitionLabel {
    [self validateSecureCodingForClass:[AWSRekognitionLabel class]];
}

- (void) test_AWSRekognitionLabelDetection {
    [self validateSecureCodingForClass:[AWSRekognitionLabelDetection class]];
}

- (void) test_AWSRekognitionLandmark {
    [self validateSecureCodingForClass:[AWSRekognitionLandmark class]];
}

- (void) test_AWSRekognitionListCollectionsRequest {
    [self validateSecureCodingForClass:[AWSRekognitionListCollectionsRequest class]];
}

- (void) test_AWSRekognitionListCollectionsResponse {
    [self validateSecureCodingForClass:[AWSRekognitionListCollectionsResponse class]];
}

- (void) test_AWSRekognitionListDatasetEntriesRequest {
    [self validateSecureCodingForClass:[AWSRekognitionListDatasetEntriesRequest class]];
}

- (void) test_AWSRekognitionListDatasetEntriesResponse {
    [self validateSecureCodingForClass:[AWSRekognitionListDatasetEntriesResponse class]];
}

- (void) test_AWSRekognitionListDatasetLabelsRequest {
    [self validateSecureCodingForClass:[AWSRekognitionListDatasetLabelsRequest class]];
}

- (void) test_AWSRekognitionListDatasetLabelsResponse {
    [self validateSecureCodingForClass:[AWSRekognitionListDatasetLabelsResponse class]];
}

- (void) test_AWSRekognitionListFacesRequest {
    [self validateSecureCodingForClass:[AWSRekognitionListFacesRequest class]];
}

- (void) test_AWSRekognitionListFacesResponse {
    [self validateSecureCodingForClass:[AWSRekognitionListFacesResponse class]];
}

- (void) test_AWSRekognitionListStreamProcessorsRequest {
    [self validateSecureCodingForClass:[AWSRekognitionListStreamProcessorsRequest class]];
}

- (void) test_AWSRekognitionListStreamProcessorsResponse {
    [self validateSecureCodingForClass:[AWSRekognitionListStreamProcessorsResponse class]];
}

- (void) test_AWSRekognitionListTagsForResourceRequest {
    [self validateSecureCodingForClass:[AWSRekognitionListTagsForResourceRequest class]];
}

- (void) test_AWSRekognitionListTagsForResourceResponse {
    [self validateSecureCodingForClass:[AWSRekognitionListTagsForResourceResponse class]];
}

- (void) test_AWSRekognitionModerationLabel {
    [self validateSecureCodingForClass:[AWSRekognitionModerationLabel class]];
}

- (void) test_AWSRekognitionMouthOpen {
    [self validateSecureCodingForClass:[AWSRekognitionMouthOpen class]];
}

- (void) test_AWSRekognitionMustache {
    [self validateSecureCodingForClass:[AWSRekognitionMustache class]];
}

- (void) test_AWSRekognitionNotificationChannel {
    [self validateSecureCodingForClass:[AWSRekognitionNotificationChannel class]];
}

- (void) test_AWSRekognitionOutputConfig {
    [self validateSecureCodingForClass:[AWSRekognitionOutputConfig class]];
}

- (void) test_AWSRekognitionParent {
    [self validateSecureCodingForClass:[AWSRekognitionParent class]];
}

- (void) test_AWSRekognitionPersonDetail {
    [self validateSecureCodingForClass:[AWSRekognitionPersonDetail class]];
}

- (void) test_AWSRekognitionPersonDetection {
    [self validateSecureCodingForClass:[AWSRekognitionPersonDetection class]];
}

- (void) test_AWSRekognitionPersonMatch {
    [self validateSecureCodingForClass:[AWSRekognitionPersonMatch class]];
}

- (void) test_AWSRekognitionPoint {
    [self validateSecureCodingForClass:[AWSRekognitionPoint class]];
}

- (void) test_AWSRekognitionPose {
    [self validateSecureCodingForClass:[AWSRekognitionPose class]];
}

- (void) test_AWSRekognitionProjectDescription {
    [self validateSecureCodingForClass:[AWSRekognitionProjectDescription class]];
}

- (void) test_AWSRekognitionProjectVersionDescription {
    [self validateSecureCodingForClass:[AWSRekognitionProjectVersionDescription class]];
}

- (void) test_AWSRekognitionProtectiveEquipmentBodyPart {
    [self validateSecureCodingForClass:[AWSRekognitionProtectiveEquipmentBodyPart class]];
}

- (void) test_AWSRekognitionProtectiveEquipmentPerson {
    [self validateSecureCodingForClass:[AWSRekognitionProtectiveEquipmentPerson class]];
}

- (void) test_AWSRekognitionProtectiveEquipmentSummarizationAttributes {
    [self validateSecureCodingForClass:[AWSRekognitionProtectiveEquipmentSummarizationAttributes class]];
}

- (void) test_AWSRekognitionProtectiveEquipmentSummary {
    [self validateSecureCodingForClass:[AWSRekognitionProtectiveEquipmentSummary class]];
}

- (void) test_AWSRekognitionRecognizeCelebritiesRequest {
    [self validateSecureCodingForClass:[AWSRekognitionRecognizeCelebritiesRequest class]];
}

- (void) test_AWSRekognitionRecognizeCelebritiesResponse {
    [self validateSecureCodingForClass:[AWSRekognitionRecognizeCelebritiesResponse class]];
}

- (void) test_AWSRekognitionRegionOfInterest {
    [self validateSecureCodingForClass:[AWSRekognitionRegionOfInterest class]];
}

- (void) test_AWSRekognitionS3Object {
    [self validateSecureCodingForClass:[AWSRekognitionS3Object class]];
}

- (void) test_AWSRekognitionSearchFacesByImageRequest {
    [self validateSecureCodingForClass:[AWSRekognitionSearchFacesByImageRequest class]];
}

- (void) test_AWSRekognitionSearchFacesByImageResponse {
    [self validateSecureCodingForClass:[AWSRekognitionSearchFacesByImageResponse class]];
}

- (void) test_AWSRekognitionSearchFacesRequest {
    [self validateSecureCodingForClass:[AWSRekognitionSearchFacesRequest class]];
}

- (void) test_AWSRekognitionSearchFacesResponse {
    [self validateSecureCodingForClass:[AWSRekognitionSearchFacesResponse class]];
}

- (void) test_AWSRekognitionSegmentDetection {
    [self validateSecureCodingForClass:[AWSRekognitionSegmentDetection class]];
}

- (void) test_AWSRekognitionSegmentTypeInfo {
    [self validateSecureCodingForClass:[AWSRekognitionSegmentTypeInfo class]];
}

- (void) test_AWSRekognitionShotSegment {
    [self validateSecureCodingForClass:[AWSRekognitionShotSegment class]];
}

- (void) test_AWSRekognitionSmile {
    [self validateSecureCodingForClass:[AWSRekognitionSmile class]];
}

- (void) test_AWSRekognitionStartCelebrityRecognitionRequest {
    [self validateSecureCodingForClass:[AWSRekognitionStartCelebrityRecognitionRequest class]];
}

- (void) test_AWSRekognitionStartCelebrityRecognitionResponse {
    [self validateSecureCodingForClass:[AWSRekognitionStartCelebrityRecognitionResponse class]];
}

- (void) test_AWSRekognitionStartContentModerationRequest {
    [self validateSecureCodingForClass:[AWSRekognitionStartContentModerationRequest class]];
}

- (void) test_AWSRekognitionStartContentModerationResponse {
    [self validateSecureCodingForClass:[AWSRekognitionStartContentModerationResponse class]];
}

- (void) test_AWSRekognitionStartFaceDetectionRequest {
    [self validateSecureCodingForClass:[AWSRekognitionStartFaceDetectionRequest class]];
}

- (void) test_AWSRekognitionStartFaceDetectionResponse {
    [self validateSecureCodingForClass:[AWSRekognitionStartFaceDetectionResponse class]];
}

- (void) test_AWSRekognitionStartFaceSearchRequest {
    [self validateSecureCodingForClass:[AWSRekognitionStartFaceSearchRequest class]];
}

- (void) test_AWSRekognitionStartFaceSearchResponse {
    [self validateSecureCodingForClass:[AWSRekognitionStartFaceSearchResponse class]];
}

- (void) test_AWSRekognitionStartLabelDetectionRequest {
    [self validateSecureCodingForClass:[AWSRekognitionStartLabelDetectionRequest class]];
}

- (void) test_AWSRekognitionStartLabelDetectionResponse {
    [self validateSecureCodingForClass:[AWSRekognitionStartLabelDetectionResponse class]];
}

- (void) test_AWSRekognitionStartPersonTrackingRequest {
    [self validateSecureCodingForClass:[AWSRekognitionStartPersonTrackingRequest class]];
}

- (void) test_AWSRekognitionStartPersonTrackingResponse {
    [self validateSecureCodingForClass:[AWSRekognitionStartPersonTrackingResponse class]];
}

- (void) test_AWSRekognitionStartProjectVersionRequest {
    [self validateSecureCodingForClass:[AWSRekognitionStartProjectVersionRequest class]];
}

- (void) test_AWSRekognitionStartProjectVersionResponse {
    [self validateSecureCodingForClass:[AWSRekognitionStartProjectVersionResponse class]];
}

- (void) test_AWSRekognitionStartSegmentDetectionFilters {
    [self validateSecureCodingForClass:[AWSRekognitionStartSegmentDetectionFilters class]];
}

- (void) test_AWSRekognitionStartSegmentDetectionRequest {
    [self validateSecureCodingForClass:[AWSRekognitionStartSegmentDetectionRequest class]];
}

- (void) test_AWSRekognitionStartSegmentDetectionResponse {
    [self validateSecureCodingForClass:[AWSRekognitionStartSegmentDetectionResponse class]];
}

- (void) test_AWSRekognitionStartShotDetectionFilter {
    [self validateSecureCodingForClass:[AWSRekognitionStartShotDetectionFilter class]];
}

- (void) test_AWSRekognitionStartStreamProcessorRequest {
    [self validateSecureCodingForClass:[AWSRekognitionStartStreamProcessorRequest class]];
}

- (void) test_AWSRekognitionStartStreamProcessorResponse {
    [self validateSecureCodingForClass:[AWSRekognitionStartStreamProcessorResponse class]];
}

- (void) test_AWSRekognitionStartTechnicalCueDetectionFilter {
    [self validateSecureCodingForClass:[AWSRekognitionStartTechnicalCueDetectionFilter class]];
}

- (void) test_AWSRekognitionStartTextDetectionFilters {
    [self validateSecureCodingForClass:[AWSRekognitionStartTextDetectionFilters class]];
}

- (void) test_AWSRekognitionStartTextDetectionRequest {
    [self validateSecureCodingForClass:[AWSRekognitionStartTextDetectionRequest class]];
}

- (void) test_AWSRekognitionStartTextDetectionResponse {
    [self validateSecureCodingForClass:[AWSRekognitionStartTextDetectionResponse class]];
}

- (void) test_AWSRekognitionStopProjectVersionRequest {
    [self validateSecureCodingForClass:[AWSRekognitionStopProjectVersionRequest class]];
}

- (void) test_AWSRekognitionStopProjectVersionResponse {
    [self validateSecureCodingForClass:[AWSRekognitionStopProjectVersionResponse class]];
}

- (void) test_AWSRekognitionStopStreamProcessorRequest {
    [self validateSecureCodingForClass:[AWSRekognitionStopStreamProcessorRequest class]];
}

- (void) test_AWSRekognitionStopStreamProcessorResponse {
    [self validateSecureCodingForClass:[AWSRekognitionStopStreamProcessorResponse class]];
}

- (void) test_AWSRekognitionStreamProcessor {
    [self validateSecureCodingForClass:[AWSRekognitionStreamProcessor class]];
}

- (void) test_AWSRekognitionStreamProcessorInput {
    [self validateSecureCodingForClass:[AWSRekognitionStreamProcessorInput class]];
}

- (void) test_AWSRekognitionStreamProcessorOutput {
    [self validateSecureCodingForClass:[AWSRekognitionStreamProcessorOutput class]];
}

- (void) test_AWSRekognitionStreamProcessorSettings {
    [self validateSecureCodingForClass:[AWSRekognitionStreamProcessorSettings class]];
}

- (void) test_AWSRekognitionSummary {
    [self validateSecureCodingForClass:[AWSRekognitionSummary class]];
}

- (void) test_AWSRekognitionSunglasses {
    [self validateSecureCodingForClass:[AWSRekognitionSunglasses class]];
}

- (void) test_AWSRekognitionTagResourceRequest {
    [self validateSecureCodingForClass:[AWSRekognitionTagResourceRequest class]];
}

- (void) test_AWSRekognitionTagResourceResponse {
    [self validateSecureCodingForClass:[AWSRekognitionTagResourceResponse class]];
}

- (void) test_AWSRekognitionTechnicalCueSegment {
    [self validateSecureCodingForClass:[AWSRekognitionTechnicalCueSegment class]];
}

- (void) test_AWSRekognitionTestingData {
    [self validateSecureCodingForClass:[AWSRekognitionTestingData class]];
}

- (void) test_AWSRekognitionTestingDataResult {
    [self validateSecureCodingForClass:[AWSRekognitionTestingDataResult class]];
}

- (void) test_AWSRekognitionTextDetection {
    [self validateSecureCodingForClass:[AWSRekognitionTextDetection class]];
}

- (void) test_AWSRekognitionTextDetectionResult {
    [self validateSecureCodingForClass:[AWSRekognitionTextDetectionResult class]];
}

- (void) test_AWSRekognitionTrainingData {
    [self validateSecureCodingForClass:[AWSRekognitionTrainingData class]];
}

- (void) test_AWSRekognitionTrainingDataResult {
    [self validateSecureCodingForClass:[AWSRekognitionTrainingDataResult class]];
}

- (void) test_AWSRekognitionUnindexedFace {
    [self validateSecureCodingForClass:[AWSRekognitionUnindexedFace class]];
}

- (void) test_AWSRekognitionUntagResourceRequest {
    [self validateSecureCodingForClass:[AWSRekognitionUntagResourceRequest class]];
}

- (void) test_AWSRekognitionUntagResourceResponse {
    [self validateSecureCodingForClass:[AWSRekognitionUntagResourceResponse class]];
}

- (void) test_AWSRekognitionUpdateDatasetEntriesRequest {
    [self validateSecureCodingForClass:[AWSRekognitionUpdateDatasetEntriesRequest class]];
}

- (void) test_AWSRekognitionUpdateDatasetEntriesResponse {
    [self validateSecureCodingForClass:[AWSRekognitionUpdateDatasetEntriesResponse class]];
}

- (void) test_AWSRekognitionValidationData {
    [self validateSecureCodingForClass:[AWSRekognitionValidationData class]];
}

- (void) test_AWSRekognitionVideo {
    [self validateSecureCodingForClass:[AWSRekognitionVideo class]];
}

- (void) test_AWSRekognitionVideoMetadata {
    [self validateSecureCodingForClass:[AWSRekognitionVideoMetadata class]];
}

@end

