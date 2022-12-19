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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSRekognitionErrorDomain;

typedef NS_ENUM(NSInteger, AWSRekognitionErrorType) {
    AWSRekognitionErrorUnknown,
    AWSRekognitionErrorAccessDenied,
    AWSRekognitionErrorHumanLoopQuotaExceeded,
    AWSRekognitionErrorIdempotentParameterMismatch,
    AWSRekognitionErrorImageTooLarge,
    AWSRekognitionErrorInternalServer,
    AWSRekognitionErrorInvalidImageFormat,
    AWSRekognitionErrorInvalidPaginationToken,
    AWSRekognitionErrorInvalidParameter,
    AWSRekognitionErrorInvalidPolicyRevisionId,
    AWSRekognitionErrorInvalidS3Object,
    AWSRekognitionErrorLimitExceeded,
    AWSRekognitionErrorMalformedPolicyDocument,
    AWSRekognitionErrorProvisionedThroughputExceeded,
    AWSRekognitionErrorResourceAlreadyExists,
    AWSRekognitionErrorResourceInUse,
    AWSRekognitionErrorResourceNotFound,
    AWSRekognitionErrorResourceNotReady,
    AWSRekognitionErrorServiceQuotaExceeded,
    AWSRekognitionErrorThrottling,
    AWSRekognitionErrorVideoTooLarge,
};

typedef NS_ENUM(NSInteger, AWSRekognitionAttribute) {
    AWSRekognitionAttributeUnknown,
    AWSRekognitionAttributeDefault,
    AWSRekognitionAttributeAll,
};

typedef NS_ENUM(NSInteger, AWSRekognitionBodyPart) {
    AWSRekognitionBodyPartUnknown,
    AWSRekognitionBodyPartFace,
    AWSRekognitionBodyPartHead,
    AWSRekognitionBodyPartLeftHand,
    AWSRekognitionBodyPartRightHand,
};

typedef NS_ENUM(NSInteger, AWSRekognitionCelebrityRecognitionSortBy) {
    AWSRekognitionCelebrityRecognitionSortByUnknown,
    AWSRekognitionCelebrityRecognitionSortById,
    AWSRekognitionCelebrityRecognitionSortByTimestamp,
};

typedef NS_ENUM(NSInteger, AWSRekognitionContentClassifier) {
    AWSRekognitionContentClassifierUnknown,
    AWSRekognitionContentClassifierFreeOfPersonallyIdentifiableInformation,
    AWSRekognitionContentClassifierFreeOfAdultContent,
};

typedef NS_ENUM(NSInteger, AWSRekognitionContentModerationSortBy) {
    AWSRekognitionContentModerationSortByUnknown,
    AWSRekognitionContentModerationSortByName,
    AWSRekognitionContentModerationSortByTimestamp,
};

typedef NS_ENUM(NSInteger, AWSRekognitionDatasetStatus) {
    AWSRekognitionDatasetStatusUnknown,
    AWSRekognitionDatasetStatusCreateInProgress,
    AWSRekognitionDatasetStatusCreateComplete,
    AWSRekognitionDatasetStatusCreateFailed,
    AWSRekognitionDatasetStatusUpdateInProgress,
    AWSRekognitionDatasetStatusUpdateComplete,
    AWSRekognitionDatasetStatusUpdateFailed,
    AWSRekognitionDatasetStatusDeleteInProgress,
};

typedef NS_ENUM(NSInteger, AWSRekognitionDatasetStatusMessageCode) {
    AWSRekognitionDatasetStatusMessageCodeUnknown,
    AWSRekognitionDatasetStatusMessageCodeSuccess,
    AWSRekognitionDatasetStatusMessageCodeServiceError,
    AWSRekognitionDatasetStatusMessageCodeClientError,
};

typedef NS_ENUM(NSInteger, AWSRekognitionDatasetType) {
    AWSRekognitionDatasetTypeUnknown,
    AWSRekognitionDatasetTypeTrain,
    AWSRekognitionDatasetTypeTest,
};

typedef NS_ENUM(NSInteger, AWSRekognitionDetectLabelsFeatureName) {
    AWSRekognitionDetectLabelsFeatureNameUnknown,
    AWSRekognitionDetectLabelsFeatureNameGeneralLabels,
    AWSRekognitionDetectLabelsFeatureNameImageProperties,
};

typedef NS_ENUM(NSInteger, AWSRekognitionEmotionName) {
    AWSRekognitionEmotionNameUnknown,
    AWSRekognitionEmotionNameHappy,
    AWSRekognitionEmotionNameSad,
    AWSRekognitionEmotionNameAngry,
    AWSRekognitionEmotionNameConfused,
    AWSRekognitionEmotionNameDisgusted,
    AWSRekognitionEmotionNameSurprised,
    AWSRekognitionEmotionNameCalm,
    AWSRekognitionEmotionNameFear,
};

typedef NS_ENUM(NSInteger, AWSRekognitionFaceAttributes) {
    AWSRekognitionFaceAttributesUnknown,
    AWSRekognitionFaceAttributesDefault,
    AWSRekognitionFaceAttributesAll,
};

typedef NS_ENUM(NSInteger, AWSRekognitionFaceSearchSortBy) {
    AWSRekognitionFaceSearchSortByUnknown,
    AWSRekognitionFaceSearchSortByIndex,
    AWSRekognitionFaceSearchSortByTimestamp,
};

typedef NS_ENUM(NSInteger, AWSRekognitionGenderType) {
    AWSRekognitionGenderTypeUnknown,
    AWSRekognitionGenderTypeMale,
    AWSRekognitionGenderTypeFemale,
};

typedef NS_ENUM(NSInteger, AWSRekognitionKnownGenderType) {
    AWSRekognitionKnownGenderTypeUnknown,
    AWSRekognitionKnownGenderTypeMale,
    AWSRekognitionKnownGenderTypeFemale,
    AWSRekognitionKnownGenderTypeNonbinary,
    AWSRekognitionKnownGenderTypeUnlisted,
};

typedef NS_ENUM(NSInteger, AWSRekognitionLabelDetectionAggregateBy) {
    AWSRekognitionLabelDetectionAggregateByUnknown,
    AWSRekognitionLabelDetectionAggregateByTimestamps,
    AWSRekognitionLabelDetectionAggregateBySegments,
};

typedef NS_ENUM(NSInteger, AWSRekognitionLabelDetectionFeatureName) {
    AWSRekognitionLabelDetectionFeatureNameUnknown,
    AWSRekognitionLabelDetectionFeatureNameGeneralLabels,
};

typedef NS_ENUM(NSInteger, AWSRekognitionLabelDetectionSortBy) {
    AWSRekognitionLabelDetectionSortByUnknown,
    AWSRekognitionLabelDetectionSortByName,
    AWSRekognitionLabelDetectionSortByTimestamp,
};

typedef NS_ENUM(NSInteger, AWSRekognitionLandmarkType) {
    AWSRekognitionLandmarkTypeUnknown,
    AWSRekognitionLandmarkTypeEyeLeft,
    AWSRekognitionLandmarkTypeEyeRight,
    AWSRekognitionLandmarkTypeNose,
    AWSRekognitionLandmarkTypeMouthLeft,
    AWSRekognitionLandmarkTypeMouthRight,
    AWSRekognitionLandmarkTypeLeftEyeBrowLeft,
    AWSRekognitionLandmarkTypeLeftEyeBrowRight,
    AWSRekognitionLandmarkTypeLeftEyeBrowUp,
    AWSRekognitionLandmarkTypeRightEyeBrowLeft,
    AWSRekognitionLandmarkTypeRightEyeBrowRight,
    AWSRekognitionLandmarkTypeRightEyeBrowUp,
    AWSRekognitionLandmarkTypeLeftEyeLeft,
    AWSRekognitionLandmarkTypeLeftEyeRight,
    AWSRekognitionLandmarkTypeLeftEyeUp,
    AWSRekognitionLandmarkTypeLeftEyeDown,
    AWSRekognitionLandmarkTypeRightEyeLeft,
    AWSRekognitionLandmarkTypeRightEyeRight,
    AWSRekognitionLandmarkTypeRightEyeUp,
    AWSRekognitionLandmarkTypeRightEyeDown,
    AWSRekognitionLandmarkTypeNoseLeft,
    AWSRekognitionLandmarkTypeNoseRight,
    AWSRekognitionLandmarkTypeMouthUp,
    AWSRekognitionLandmarkTypeMouthDown,
    AWSRekognitionLandmarkTypeLeftPupil,
    AWSRekognitionLandmarkTypeRightPupil,
    AWSRekognitionLandmarkTypeUpperJawlineLeft,
    AWSRekognitionLandmarkTypeMidJawlineLeft,
    AWSRekognitionLandmarkTypeChinBottom,
    AWSRekognitionLandmarkTypeMidJawlineRight,
    AWSRekognitionLandmarkTypeUpperJawlineRight,
};

typedef NS_ENUM(NSInteger, AWSRekognitionOrientationCorrection) {
    AWSRekognitionOrientationCorrectionUnknown,
    AWSRekognitionOrientationCorrectionRotate0,
    AWSRekognitionOrientationCorrectionRotate90,
    AWSRekognitionOrientationCorrectionRotate180,
    AWSRekognitionOrientationCorrectionRotate270,
};

typedef NS_ENUM(NSInteger, AWSRekognitionPersonTrackingSortBy) {
    AWSRekognitionPersonTrackingSortByUnknown,
    AWSRekognitionPersonTrackingSortByIndex,
    AWSRekognitionPersonTrackingSortByTimestamp,
};

typedef NS_ENUM(NSInteger, AWSRekognitionProjectStatus) {
    AWSRekognitionProjectStatusUnknown,
    AWSRekognitionProjectStatusCreating,
    AWSRekognitionProjectStatusCreated,
    AWSRekognitionProjectStatusDeleting,
};

typedef NS_ENUM(NSInteger, AWSRekognitionProjectVersionStatus) {
    AWSRekognitionProjectVersionStatusUnknown,
    AWSRekognitionProjectVersionStatusTrainingInProgress,
    AWSRekognitionProjectVersionStatusTrainingCompleted,
    AWSRekognitionProjectVersionStatusTrainingFailed,
    AWSRekognitionProjectVersionStatusStarting,
    AWSRekognitionProjectVersionStatusRunning,
    AWSRekognitionProjectVersionStatusFailed,
    AWSRekognitionProjectVersionStatusStopping,
    AWSRekognitionProjectVersionStatusStopped,
    AWSRekognitionProjectVersionStatusDeleting,
    AWSRekognitionProjectVersionStatusCopyingInProgress,
    AWSRekognitionProjectVersionStatusCopyingCompleted,
    AWSRekognitionProjectVersionStatusCopyingFailed,
};

typedef NS_ENUM(NSInteger, AWSRekognitionProtectiveEquipmentType) {
    AWSRekognitionProtectiveEquipmentTypeUnknown,
    AWSRekognitionProtectiveEquipmentTypeFaceCover,
    AWSRekognitionProtectiveEquipmentTypeHandCover,
    AWSRekognitionProtectiveEquipmentTypeHeadCover,
};

typedef NS_ENUM(NSInteger, AWSRekognitionQualityFilter) {
    AWSRekognitionQualityFilterUnknown,
    AWSRekognitionQualityFilterNone,
    AWSRekognitionQualityFilterAuto,
    AWSRekognitionQualityFilterLow,
    AWSRekognitionQualityFilterMedium,
    AWSRekognitionQualityFilterHigh,
};

typedef NS_ENUM(NSInteger, AWSRekognitionReason) {
    AWSRekognitionReasonUnknown,
    AWSRekognitionReasonExceedsMaxFaces,
    AWSRekognitionReasonExtremePose,
    AWSRekognitionReasonLowBrightness,
    AWSRekognitionReasonLowSharpness,
    AWSRekognitionReasonLowConfidence,
    AWSRekognitionReasonSmallBoundingBox,
    AWSRekognitionReasonLowFaceQuality,
};

typedef NS_ENUM(NSInteger, AWSRekognitionSegmentType) {
    AWSRekognitionSegmentTypeUnknown,
    AWSRekognitionSegmentTypeTechnicalCue,
    AWSRekognitionSegmentTypeShot,
};

typedef NS_ENUM(NSInteger, AWSRekognitionStreamProcessorParameterToDelete) {
    AWSRekognitionStreamProcessorParameterToDeleteUnknown,
    AWSRekognitionStreamProcessorParameterToDeleteConnectedHomeMinConfidence,
    AWSRekognitionStreamProcessorParameterToDeleteRegionsOfInterest,
};

typedef NS_ENUM(NSInteger, AWSRekognitionStreamProcessorStatus) {
    AWSRekognitionStreamProcessorStatusUnknown,
    AWSRekognitionStreamProcessorStatusStopped,
    AWSRekognitionStreamProcessorStatusStarting,
    AWSRekognitionStreamProcessorStatusRunning,
    AWSRekognitionStreamProcessorStatusFailed,
    AWSRekognitionStreamProcessorStatusStopping,
    AWSRekognitionStreamProcessorStatusUpdating,
};

typedef NS_ENUM(NSInteger, AWSRekognitionTechnicalCueType) {
    AWSRekognitionTechnicalCueTypeUnknown,
    AWSRekognitionTechnicalCueTypeColorBars,
    AWSRekognitionTechnicalCueTypeEndCredits,
    AWSRekognitionTechnicalCueTypeBlackFrames,
    AWSRekognitionTechnicalCueTypeOpeningCredits,
    AWSRekognitionTechnicalCueTypeStudioLogo,
    AWSRekognitionTechnicalCueTypeSlate,
    AWSRekognitionTechnicalCueTypeContent,
};

typedef NS_ENUM(NSInteger, AWSRekognitionTextTypes) {
    AWSRekognitionTextTypesUnknown,
    AWSRekognitionTextTypesLine,
    AWSRekognitionTextTypesWord,
};

typedef NS_ENUM(NSInteger, AWSRekognitionVideoColorRange) {
    AWSRekognitionVideoColorRangeUnknown,
    AWSRekognitionVideoColorRangeFull,
    AWSRekognitionVideoColorRangeLimited,
};

typedef NS_ENUM(NSInteger, AWSRekognitionVideoJobStatus) {
    AWSRekognitionVideoJobStatusUnknown,
    AWSRekognitionVideoJobStatusInProgress,
    AWSRekognitionVideoJobStatusSucceeded,
    AWSRekognitionVideoJobStatusFailed,
};

@class AWSRekognitionAgeRange;
@class AWSRekognitionAsset;
@class AWSRekognitionAudioMetadata;
@class AWSRekognitionBeard;
@class AWSRekognitionBlackFrame;
@class AWSRekognitionBoundingBox;
@class AWSRekognitionCelebrity;
@class AWSRekognitionCelebrityDetail;
@class AWSRekognitionCelebrityRecognition;
@class AWSRekognitionCompareFacesMatch;
@class AWSRekognitionCompareFacesRequest;
@class AWSRekognitionCompareFacesResponse;
@class AWSRekognitionComparedFace;
@class AWSRekognitionComparedSourceImageFace;
@class AWSRekognitionConnectedHomeSettings;
@class AWSRekognitionConnectedHomeSettingsForUpdate;
@class AWSRekognitionContentModerationDetection;
@class AWSRekognitionReplicateProjectVersionRequest;
@class AWSRekognitionReplicateProjectVersionResponse;
@class AWSRekognitionCoversBodyPart;
@class AWSRekognitionCreateCollectionRequest;
@class AWSRekognitionCreateCollectionResponse;
@class AWSRekognitionCreateDatasetRequest;
@class AWSRekognitionCreateDatasetResponse;
@class AWSRekognitionCreateProjectRequest;
@class AWSRekognitionCreateProjectResponse;
@class AWSRekognitionCreateProjectVersionRequest;
@class AWSRekognitionCreateProjectVersionResponse;
@class AWSRekognitionCreateStreamProcessorRequest;
@class AWSRekognitionCreateStreamProcessorResponse;
@class AWSRekognitionCustomLabel;
@class AWSRekognitionDatasetChanges;
@class AWSRekognitionDatasetDescription;
@class AWSRekognitionDatasetLabelDescription;
@class AWSRekognitionDatasetLabelStats;
@class AWSRekognitionDatasetMetadata;
@class AWSRekognitionDatasetSource;
@class AWSRekognitionDatasetStats;
@class AWSRekognitionDeleteCollectionRequest;
@class AWSRekognitionDeleteCollectionResponse;
@class AWSRekognitionDeleteDatasetRequest;
@class AWSRekognitionDeleteDatasetResponse;
@class AWSRekognitionDeleteFacesRequest;
@class AWSRekognitionDeleteFacesResponse;
@class AWSRekognitionDeleteProjectPolicyRequest;
@class AWSRekognitionDeleteProjectPolicyResponse;
@class AWSRekognitionDeleteProjectRequest;
@class AWSRekognitionDeleteProjectResponse;
@class AWSRekognitionDeleteProjectVersionRequest;
@class AWSRekognitionDeleteProjectVersionResponse;
@class AWSRekognitionDeleteStreamProcessorRequest;
@class AWSRekognitionDeleteStreamProcessorResponse;
@class AWSRekognitionDescribeCollectionRequest;
@class AWSRekognitionDescribeCollectionResponse;
@class AWSRekognitionDescribeDatasetRequest;
@class AWSRekognitionDescribeDatasetResponse;
@class AWSRekognitionDescribeProjectVersionsRequest;
@class AWSRekognitionDescribeProjectVersionsResponse;
@class AWSRekognitionDescribeProjectsRequest;
@class AWSRekognitionDescribeProjectsResponse;
@class AWSRekognitionDescribeStreamProcessorRequest;
@class AWSRekognitionDescribeStreamProcessorResponse;
@class AWSRekognitionDetectCustomLabelsRequest;
@class AWSRekognitionDetectCustomLabelsResponse;
@class AWSRekognitionDetectFacesRequest;
@class AWSRekognitionDetectFacesResponse;
@class AWSRekognitionDetectLabelsImageBackground;
@class AWSRekognitionDetectLabelsImageForeground;
@class AWSRekognitionDetectLabelsImageProperties;
@class AWSRekognitionDetectLabelsImagePropertiesSettings;
@class AWSRekognitionDetectLabelsImageQuality;
@class AWSRekognitionDetectLabelsRequest;
@class AWSRekognitionDetectLabelsResponse;
@class AWSRekognitionDetectLabelsSettings;
@class AWSRekognitionDetectModerationLabelsRequest;
@class AWSRekognitionDetectModerationLabelsResponse;
@class AWSRekognitionDetectProtectiveEquipmentRequest;
@class AWSRekognitionDetectProtectiveEquipmentResponse;
@class AWSRekognitionDetectTextFilters;
@class AWSRekognitionDetectTextRequest;
@class AWSRekognitionDetectTextResponse;
@class AWSRekognitionDetectionFilter;
@class AWSRekognitionDistributeDataset;
@class AWSRekognitionDistributeDatasetEntriesRequest;
@class AWSRekognitionDistributeDatasetEntriesResponse;
@class AWSRekognitionDominantColor;
@class AWSRekognitionEmotion;
@class AWSRekognitionEquipmentDetection;
@class AWSRekognitionEvaluationResult;
@class AWSRekognitionEyeOpen;
@class AWSRekognitionEyeglasses;
@class AWSRekognitionFace;
@class AWSRekognitionFaceDetail;
@class AWSRekognitionFaceDetection;
@class AWSRekognitionFaceMatch;
@class AWSRekognitionFaceRecord;
@class AWSRekognitionFaceSearchSettings;
@class AWSRekognitionGender;
@class AWSRekognitionGeneralLabelsSettings;
@class AWSRekognitionGeometry;
@class AWSRekognitionGetCelebrityInfoRequest;
@class AWSRekognitionGetCelebrityInfoResponse;
@class AWSRekognitionGetCelebrityRecognitionRequest;
@class AWSRekognitionGetCelebrityRecognitionResponse;
@class AWSRekognitionGetContentModerationRequest;
@class AWSRekognitionGetContentModerationResponse;
@class AWSRekognitionGetFaceDetectionRequest;
@class AWSRekognitionGetFaceDetectionResponse;
@class AWSRekognitionGetFaceSearchRequest;
@class AWSRekognitionGetFaceSearchResponse;
@class AWSRekognitionGetLabelDetectionRequest;
@class AWSRekognitionGetLabelDetectionResponse;
@class AWSRekognitionGetPersonTrackingRequest;
@class AWSRekognitionGetPersonTrackingResponse;
@class AWSRekognitionGetSegmentDetectionRequest;
@class AWSRekognitionGetSegmentDetectionResponse;
@class AWSRekognitionGetTextDetectionRequest;
@class AWSRekognitionGetTextDetectionResponse;
@class AWSRekognitionGroundTruthManifest;
@class AWSRekognitionHumanLoopActivationOutput;
@class AWSRekognitionHumanLoopConfig;
@class AWSRekognitionHumanLoopDataAttributes;
@class AWSRekognitionImage;
@class AWSRekognitionImageQuality;
@class AWSRekognitionIndexFacesRequest;
@class AWSRekognitionIndexFacesResponse;
@class AWSRekognitionInstance;
@class AWSRekognitionKinesisDataStream;
@class AWSRekognitionKinesisVideoStream;
@class AWSRekognitionKinesisVideoStreamStartSelector;
@class AWSRekognitionKnownGender;
@class AWSRekognitionLabel;
@class AWSRekognitionLabelAlias;
@class AWSRekognitionLabelCategory;
@class AWSRekognitionLabelDetection;
@class AWSRekognitionLabelDetectionSettings;
@class AWSRekognitionLandmark;
@class AWSRekognitionListCollectionsRequest;
@class AWSRekognitionListCollectionsResponse;
@class AWSRekognitionListDatasetEntriesRequest;
@class AWSRekognitionListDatasetEntriesResponse;
@class AWSRekognitionListDatasetLabelsRequest;
@class AWSRekognitionListDatasetLabelsResponse;
@class AWSRekognitionListFacesRequest;
@class AWSRekognitionListFacesResponse;
@class AWSRekognitionListProjectPoliciesRequest;
@class AWSRekognitionListProjectPoliciesResponse;
@class AWSRekognitionListStreamProcessorsRequest;
@class AWSRekognitionListStreamProcessorsResponse;
@class AWSRekognitionListTagsForResourceRequest;
@class AWSRekognitionListTagsForResourceResponse;
@class AWSRekognitionModerationLabel;
@class AWSRekognitionMouthOpen;
@class AWSRekognitionMustache;
@class AWSRekognitionNotificationChannel;
@class AWSRekognitionOutputConfig;
@class AWSRekognitionParent;
@class AWSRekognitionPersonDetail;
@class AWSRekognitionPersonDetection;
@class AWSRekognitionPersonMatch;
@class AWSRekognitionPoint;
@class AWSRekognitionPose;
@class AWSRekognitionProjectDescription;
@class AWSRekognitionProjectPolicy;
@class AWSRekognitionProjectVersionDescription;
@class AWSRekognitionProtectiveEquipmentBodyPart;
@class AWSRekognitionProtectiveEquipmentPerson;
@class AWSRekognitionProtectiveEquipmentSummarizationAttributes;
@class AWSRekognitionProtectiveEquipmentSummary;
@class AWSRekognitionPutProjectPolicyRequest;
@class AWSRekognitionPutProjectPolicyResponse;
@class AWSRekognitionRecognizeCelebritiesRequest;
@class AWSRekognitionRecognizeCelebritiesResponse;
@class AWSRekognitionRegionOfInterest;
@class AWSRekognitionS3Destination;
@class AWSRekognitionS3Object;
@class AWSRekognitionSearchFacesByImageRequest;
@class AWSRekognitionSearchFacesByImageResponse;
@class AWSRekognitionSearchFacesRequest;
@class AWSRekognitionSearchFacesResponse;
@class AWSRekognitionSegmentDetection;
@class AWSRekognitionSegmentTypeInfo;
@class AWSRekognitionShotSegment;
@class AWSRekognitionSmile;
@class AWSRekognitionStartCelebrityRecognitionRequest;
@class AWSRekognitionStartCelebrityRecognitionResponse;
@class AWSRekognitionStartContentModerationRequest;
@class AWSRekognitionStartContentModerationResponse;
@class AWSRekognitionStartFaceDetectionRequest;
@class AWSRekognitionStartFaceDetectionResponse;
@class AWSRekognitionStartFaceSearchRequest;
@class AWSRekognitionStartFaceSearchResponse;
@class AWSRekognitionStartLabelDetectionRequest;
@class AWSRekognitionStartLabelDetectionResponse;
@class AWSRekognitionStartPersonTrackingRequest;
@class AWSRekognitionStartPersonTrackingResponse;
@class AWSRekognitionStartProjectVersionRequest;
@class AWSRekognitionStartProjectVersionResponse;
@class AWSRekognitionStartSegmentDetectionFilters;
@class AWSRekognitionStartSegmentDetectionRequest;
@class AWSRekognitionStartSegmentDetectionResponse;
@class AWSRekognitionStartShotDetectionFilter;
@class AWSRekognitionStartStreamProcessorRequest;
@class AWSRekognitionStartStreamProcessorResponse;
@class AWSRekognitionStartTechnicalCueDetectionFilter;
@class AWSRekognitionStartTextDetectionFilters;
@class AWSRekognitionStartTextDetectionRequest;
@class AWSRekognitionStartTextDetectionResponse;
@class AWSRekognitionStopProjectVersionRequest;
@class AWSRekognitionStopProjectVersionResponse;
@class AWSRekognitionStopStreamProcessorRequest;
@class AWSRekognitionStopStreamProcessorResponse;
@class AWSRekognitionStreamProcessingStartSelector;
@class AWSRekognitionStreamProcessingStopSelector;
@class AWSRekognitionStreamProcessor;
@class AWSRekognitionStreamProcessorDataSharingPreference;
@class AWSRekognitionStreamProcessorInput;
@class AWSRekognitionStreamProcessorNotificationChannel;
@class AWSRekognitionStreamProcessorOutput;
@class AWSRekognitionStreamProcessorSettings;
@class AWSRekognitionStreamProcessorSettingsForUpdate;
@class AWSRekognitionSummary;
@class AWSRekognitionSunglasses;
@class AWSRekognitionTagResourceRequest;
@class AWSRekognitionTagResourceResponse;
@class AWSRekognitionTechnicalCueSegment;
@class AWSRekognitionTestingData;
@class AWSRekognitionTestingDataResult;
@class AWSRekognitionTextDetection;
@class AWSRekognitionTextDetectionResult;
@class AWSRekognitionTrainingData;
@class AWSRekognitionTrainingDataResult;
@class AWSRekognitionUnindexedFace;
@class AWSRekognitionUntagResourceRequest;
@class AWSRekognitionUntagResourceResponse;
@class AWSRekognitionUpdateDatasetEntriesRequest;
@class AWSRekognitionUpdateDatasetEntriesResponse;
@class AWSRekognitionUpdateStreamProcessorRequest;
@class AWSRekognitionUpdateStreamProcessorResponse;
@class AWSRekognitionValidationData;
@class AWSRekognitionVideo;
@class AWSRekognitionVideoMetadata;

/**
 <p>Structure containing the estimated age range, in years, for a face.</p><p>Amazon Rekognition estimates an age range for faces detected in the input image. Estimated age ranges can overlap. A face of a 5-year-old might have an estimated range of 4-6, while the face of a 6-year-old might have an estimated range of 4-8.</p>
 */
@interface AWSRekognitionAgeRange : AWSModel


/**
 <p>The highest estimated age.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable high;

/**
 <p>The lowest estimated age.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable low;

@end

/**
 <p>Assets are the images that you use to train and evaluate a model version. Assets can also contain validation information that you use to debug a failed model training. </p>
 */
@interface AWSRekognitionAsset : AWSModel


/**
 <p>The S3 bucket that contains an Amazon Sagemaker Ground Truth format manifest file. </p>
 */
@property (nonatomic, strong) AWSRekognitionGroundTruthManifest * _Nullable groundTruthManifest;

@end

/**
 <p>Metadata information about an audio stream. An array of <code>AudioMetadata</code> objects for the audio streams found in a stored video is returned by <a>GetSegmentDetection</a>. </p>
 */
@interface AWSRekognitionAudioMetadata : AWSModel


/**
 <p>The audio codec used to encode or decode the audio stream. </p>
 */
@property (nonatomic, strong) NSString * _Nullable codec;

/**
 <p>The duration of the audio stream in milliseconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationMillis;

/**
 <p>The number of audio channels in the segment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfChannels;

/**
 <p>The sample rate for the audio stream.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleRate;

@end

/**
 <p>Indicates whether or not the face has a beard, and the confidence level in the determination.</p>
 */
@interface AWSRekognitionBeard : AWSModel


/**
 <p>Level of confidence in the determination.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>Boolean value that indicates whether the face has beard or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 <p> A filter that allows you to control the black frame detection by specifying the black levels and pixel coverage of black pixels in a frame. As videos can come from multiple sources, formats, and time periods, they may contain different standards and varying noise levels for black frames that need to be accounted for. For more information, see <a>StartSegmentDetection</a>. </p>
 */
@interface AWSRekognitionBlackFrame : AWSModel


/**
 <p> A threshold used to determine the maximum luminance value for a pixel to be considered black. In a full color range video, luminance values range from 0-255. A pixel value of 0 is pure black, and the most strict filter. The maximum black pixel value is computed as follows: max_black_pixel_value = minimum_luminance + MaxPixelThreshold *luminance_range. </p><p>For example, for a full range video with BlackPixelThreshold = 0.1, max_black_pixel_value is 0 + 0.1 * (255-0) = 25.5.</p><p>The default value of MaxPixelThreshold is 0.2, which maps to a max_black_pixel_value of 51 for a full range video. You can lower this threshold to be more strict on black levels.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxPixelThreshold;

/**
 <p> The minimum percentage of pixels in a frame that need to have a luminance below the max_black_pixel_value for a frame to be considered a black frame. Luminance is calculated using the BT.709 matrix. </p><p>The default value is 99, which means at least 99% of all pixels in the frame are black pixels as per the <code>MaxPixelThreshold</code> set. You can reduce this value to allow more noise on the black frame.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minCoveragePercentage;

@end

/**
 <p>Identifies the bounding box around the label, face, text, object of interest, or personal protective equipment. The <code>left</code> (x-coordinate) and <code>top</code> (y-coordinate) are coordinates representing the top and left sides of the bounding box. Note that the upper-left corner of the image is the origin (0,0). </p><p>The <code>top</code> and <code>left</code> values returned are ratios of the overall image size. For example, if the input image is 700x200 pixels, and the top-left coordinate of the bounding box is 350x50 pixels, the API returns a <code>left</code> value of 0.5 (350/700) and a <code>top</code> value of 0.25 (50/200).</p><p>The <code>width</code> and <code>height</code> values represent the dimensions of the bounding box as a ratio of the overall image dimension. For example, if the input image is 700x200 pixels, and the bounding box width is 70 pixels, the width returned is 0.1. </p><note><p> The bounding box coordinates can have negative values. For example, if Amazon Rekognition is able to detect a face that is at the image edge and is only partially visible, the service can return coordinates that are outside the image bounds and, depending on the image edge, you might get negative values or values greater than 1 for the <code>left</code> or <code>top</code> values. </p></note>
 */
@interface AWSRekognitionBoundingBox : AWSModel


/**
 <p>Height of the bounding box as a ratio of the overall image height.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable height;

/**
 <p>Left coordinate of the bounding box as a ratio of overall image width.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable left;

/**
 <p>Top coordinate of the bounding box as a ratio of overall image height.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable top;

/**
 <p>Width of the bounding box as a ratio of the overall image width.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable width;

@end

/**
 <p>Provides information about a celebrity recognized by the <a>RecognizeCelebrities</a> operation.</p>
 */
@interface AWSRekognitionCelebrity : AWSModel


/**
 <p>Provides information about the celebrity's face, such as its location on the image.</p>
 */
@property (nonatomic, strong) AWSRekognitionComparedFace * _Nullable face;

/**
 <p>A unique identifier for the celebrity. </p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The known gender identity for the celebrity that matches the provided ID. The known gender identity can be Male, Female, Nonbinary, or Unlisted.</p>
 */
@property (nonatomic, strong) AWSRekognitionKnownGender * _Nullable knownGender;

/**
 <p>The confidence, in percentage, that Amazon Rekognition has that the recognized face is the celebrity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable matchConfidence;

/**
 <p>The name of the celebrity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>An array of URLs pointing to additional information about the celebrity. If there is no additional information about the celebrity, this list is empty.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable urls;

@end

/**
 <p>Information about a recognized celebrity.</p>
 */
@interface AWSRekognitionCelebrityDetail : AWSModel


/**
 <p>Bounding box around the body of a celebrity.</p>
 */
@property (nonatomic, strong) AWSRekognitionBoundingBox * _Nullable boundingBox;

/**
 <p>The confidence, in percentage, that Amazon Rekognition has that the recognized face is the celebrity. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>Face details for the recognized celebrity.</p>
 */
@property (nonatomic, strong) AWSRekognitionFaceDetail * _Nullable face;

/**
 <p>The unique identifier for the celebrity. </p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Retrieves the known gender for the celebrity.</p>
 */
@property (nonatomic, strong) AWSRekognitionKnownGender * _Nullable knownGender;

/**
 <p>The name of the celebrity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>An array of URLs pointing to additional celebrity information. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable urls;

@end

/**
 <p>Information about a detected celebrity and the time the celebrity was detected in a stored video. For more information, see GetCelebrityRecognition in the Amazon Rekognition Developer Guide.</p>
 */
@interface AWSRekognitionCelebrityRecognition : AWSModel


/**
 <p>Information about a recognized celebrity.</p>
 */
@property (nonatomic, strong) AWSRekognitionCelebrityDetail * _Nullable celebrity;

/**
 <p>The time, in milliseconds from the start of the video, that the celebrity was recognized. Note that <code>Timestamp</code> is not guaranteed to be accurate to the individual frame where the celebrity first appears.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timestamp;

@end

/**
 <p>Provides information about a face in a target image that matches the source image face analyzed by <code>CompareFaces</code>. The <code>Face</code> property contains the bounding box of the face in the target image. The <code>Similarity</code> property is the confidence that the source image face matches the face in the bounding box.</p>
 */
@interface AWSRekognitionCompareFacesMatch : AWSModel


/**
 <p>Provides face metadata (bounding box and confidence that the bounding box actually contains a face).</p>
 */
@property (nonatomic, strong) AWSRekognitionComparedFace * _Nullable face;

/**
 <p>Level of confidence that the faces match.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable similarity;

@end

/**
 
 */
@interface AWSRekognitionCompareFacesRequest : AWSRequest


/**
 <p>A filter that specifies a quality bar for how much filtering is done to identify faces. Filtered faces aren't compared. If you specify <code>AUTO</code>, Amazon Rekognition chooses the quality bar. If you specify <code>LOW</code>, <code>MEDIUM</code>, or <code>HIGH</code>, filtering removes all faces that don’t meet the chosen quality bar. The quality bar is based on a variety of common use cases. Low-quality detections can occur for a number of reasons. Some examples are an object that's misidentified as a face, a face that's too blurry, or a face with a pose that's too extreme to use. If you specify <code>NONE</code>, no filtering is performed. The default value is <code>NONE</code>. </p><p>To use quality filtering, the collection you are using must be associated with version 3 of the face model or higher.</p>
 */
@property (nonatomic, assign) AWSRekognitionQualityFilter qualityFilter;

/**
 <p>The minimum level of confidence in the face matches that a match must meet to be included in the <code>FaceMatches</code> array.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable similarityThreshold;

/**
 <p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported. </p><p>If you are using an AWS SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. For more information, see Images in the Amazon Rekognition developer guide.</p>
 */
@property (nonatomic, strong) AWSRekognitionImage * _Nullable sourceImage;

/**
 <p>The target image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported. </p><p>If you are using an AWS SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. For more information, see Images in the Amazon Rekognition developer guide.</p>
 */
@property (nonatomic, strong) AWSRekognitionImage * _Nullable targetImage;

@end

/**
 
 */
@interface AWSRekognitionCompareFacesResponse : AWSModel


/**
 <p>An array of faces in the target image that match the source image face. Each <code>CompareFacesMatch</code> object provides the bounding box, the confidence level that the bounding box contains a face, and the similarity score for the face in the bounding box and the face in the source image.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionCompareFacesMatch *> * _Nullable faceMatches;

/**
 <p>The face in the source image that was used for comparison.</p>
 */
@property (nonatomic, strong) AWSRekognitionComparedSourceImageFace * _Nullable sourceImageFace;

/**
 <p>The value of <code>SourceImageOrientationCorrection</code> is always null.</p><p>If the input image is in .jpeg format, it might contain exchangeable image file format (Exif) metadata that includes the image's orientation. Amazon Rekognition uses this orientation information to perform image correction. The bounding box coordinates are translated to represent object locations after the orientation information in the Exif metadata is used to correct the image orientation. Images in .png format don't contain Exif metadata.</p><p>Amazon Rekognition doesn’t perform image correction for images in .png format and .jpeg images without orientation information in the image Exif metadata. The bounding box coordinates aren't translated and represent the object locations before the image is rotated. </p>
 */
@property (nonatomic, assign) AWSRekognitionOrientationCorrection sourceImageOrientationCorrection;

/**
 <p>The value of <code>TargetImageOrientationCorrection</code> is always null.</p><p>If the input image is in .jpeg format, it might contain exchangeable image file format (Exif) metadata that includes the image's orientation. Amazon Rekognition uses this orientation information to perform image correction. The bounding box coordinates are translated to represent object locations after the orientation information in the Exif metadata is used to correct the image orientation. Images in .png format don't contain Exif metadata.</p><p>Amazon Rekognition doesn’t perform image correction for images in .png format and .jpeg images without orientation information in the image Exif metadata. The bounding box coordinates aren't translated and represent the object locations before the image is rotated. </p>
 */
@property (nonatomic, assign) AWSRekognitionOrientationCorrection targetImageOrientationCorrection;

/**
 <p>An array of faces in the target image that did not match the source image face.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionComparedFace *> * _Nullable unmatchedFaces;

@end

/**
 <p>Provides face metadata for target image faces that are analyzed by <code>CompareFaces</code> and <code>RecognizeCelebrities</code>.</p>
 */
@interface AWSRekognitionComparedFace : AWSModel


/**
 <p>Bounding box of the face.</p>
 */
@property (nonatomic, strong) AWSRekognitionBoundingBox * _Nullable boundingBox;

/**
 <p>Level of confidence that what the bounding box contains is a face.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p> The emotions that appear to be expressed on the face, and the confidence level in the determination. Valid values include "Happy", "Sad", "Angry", "Confused", "Disgusted", "Surprised", "Calm", "Unknown", and "Fear". </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionEmotion *> * _Nullable emotions;

/**
 <p>An array of facial landmarks.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionLandmark *> * _Nullable landmarks;

/**
 <p>Indicates the pose of the face as determined by its pitch, roll, and yaw.</p>
 */
@property (nonatomic, strong) AWSRekognitionPose * _Nullable pose;

/**
 <p>Identifies face image brightness and sharpness. </p>
 */
@property (nonatomic, strong) AWSRekognitionImageQuality * _Nullable quality;

/**
 <p> Indicates whether or not the face is smiling, and the confidence level in the determination. </p>
 */
@property (nonatomic, strong) AWSRekognitionSmile * _Nullable smile;

@end

/**
 <p>Type that describes the face Amazon Rekognition chose to compare with the faces in the target. This contains a bounding box for the selected face and confidence level that the bounding box contains a face. Note that Amazon Rekognition selects the largest face in the source image for this comparison. </p>
 */
@interface AWSRekognitionComparedSourceImageFace : AWSModel


/**
 <p>Bounding box of the face.</p>
 */
@property (nonatomic, strong) AWSRekognitionBoundingBox * _Nullable boundingBox;

/**
 <p>Confidence level that the selected bounding box contains a face.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

@end

/**
 <p> Label detection settings to use on a streaming video. Defining the settings is required in the request parameter for <a>CreateStreamProcessor</a>. Including this setting in the <code>CreateStreamProcessor</code> request enables you to use the stream processor for label detection. You can then select what you want the stream processor to detect, such as people or pets. When the stream processor has started, one notification is sent for each object class specified. For example, if packages and pets are selected, one SNS notification is published the first time a package is detected and one SNS notification is published the first time a pet is detected, as well as an end-of-session summary. </p>
 Required parameters: [Labels]
 */
@interface AWSRekognitionConnectedHomeSettings : AWSModel


/**
 <p> Specifies what you want to detect in the video, such as people, packages, or pets. The current valid labels you can include in this list are: "PERSON", "PET", "PACKAGE", and "ALL". </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable labels;

/**
 <p> The minimum confidence required to label an object in the video. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minConfidence;

@end

/**
 <p> The label detection settings you want to use in your stream processor. This includes the labels you want the stream processor to detect and the minimum confidence level allowed to label objects. </p>
 */
@interface AWSRekognitionConnectedHomeSettingsForUpdate : AWSModel


/**
 <p> Specifies what you want to detect in the video, such as people, packages, or pets. The current valid labels you can include in this list are: "PERSON", "PET", "PACKAGE", and "ALL". </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable labels;

/**
 <p> The minimum confidence required to label an object in the video. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minConfidence;

@end

/**
 <p>Information about an inappropriate, unwanted, or offensive content label detection in a stored video.</p>
 */
@interface AWSRekognitionContentModerationDetection : AWSModel


/**
 <p>The content moderation label detected by in the stored video.</p>
 */
@property (nonatomic, strong) AWSRekognitionModerationLabel * _Nullable moderationLabel;

/**
 <p>Time, in milliseconds from the beginning of the video, that the content moderation label was detected. Note that <code>Timestamp</code> is not guaranteed to be accurate to the individual frame where the moderated content first appears.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timestamp;

@end

/**
 
 */
@interface AWSRekognitionReplicateProjectVersionRequest : AWSRequest


/**
 <p>The ARN of the project in the trusted AWS account that you want to copy the model version to. </p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationProjectArn;

/**
 <p>The identifier for your AWS Key Management Service key (AWS KMS key). You can supply the Amazon Resource Name (ARN) of your KMS key, the ID of your KMS key, an alias for your KMS key, or an alias ARN. The key is used to encrypt training results and manifest files written to the output Amazon S3 bucket (<code>OutputConfig</code>).</p><p>If you choose to use your own KMS key, you need the following permissions on the KMS key.</p><ul><li><p>kms:CreateGrant</p></li><li><p>kms:DescribeKey</p></li><li><p>kms:GenerateDataKey</p></li><li><p>kms:Decrypt</p></li></ul><p>If you don't specify a value for <code>KmsKeyId</code>, images copied into the service are encrypted using a key that AWS owns and manages.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The S3 bucket and folder location where the training output for the source model version is placed.</p>
 */
@property (nonatomic, strong) AWSRekognitionOutputConfig * _Nullable outputConfig;

/**
 <p>The ARN of the source project in the trusting AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceProjectArn;

/**
 <p>The ARN of the model version in the source project that you want to copy to a destination project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceProjectVersionArn;

/**
 <p>The key-value tags to assign to the model version. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>A name for the version of the model that's copied to the destination project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionName;

@end

/**
 
 */
@interface AWSRekognitionReplicateProjectVersionResponse : AWSModel


/**
 <p>The ARN of the copied model version in the destination project. </p>
 */
@property (nonatomic, strong) NSString * _Nullable projectVersionArn;

@end

/**
 <p>Information about an item of Personal Protective Equipment covering a corresponding body part. For more information, see <a>DetectProtectiveEquipment</a>.</p>
 */
@interface AWSRekognitionCoversBodyPart : AWSModel


/**
 <p>The confidence that Amazon Rekognition has in the value of <code>Value</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>True if the PPE covers the corresponding body part, otherwise false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 
 */
@interface AWSRekognitionCreateCollectionRequest : AWSRequest


/**
 <p>ID for the collection that you are creating.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionId;

/**
 <p> A set of tags (key-value pairs) that you want to attach to the collection. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSRekognitionCreateCollectionResponse : AWSModel


/**
 <p>Amazon Resource Name (ARN) of the collection. You can use this to manage permissions on your resources. </p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionArn;

/**
 <p>Version number of the face detection model associated with the collection you are creating.</p>
 */
@property (nonatomic, strong) NSString * _Nullable faceModelVersion;

/**
 <p>HTTP status code indicating the result of the operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable statusCode;

@end

/**
 
 */
@interface AWSRekognitionCreateDatasetRequest : AWSRequest


/**
 <p> The source files for the dataset. You can specify the ARN of an existing dataset or specify the Amazon S3 bucket location of an Amazon Sagemaker format manifest file. If you don't specify <code>datasetSource</code>, an empty dataset is created. To add labeled images to the dataset, You can use the console or call <a>UpdateDatasetEntries</a>. </p>
 */
@property (nonatomic, strong) AWSRekognitionDatasetSource * _Nullable datasetSource;

/**
 <p> The type of the dataset. Specify <code>train</code> to create a training dataset. Specify <code>test</code> to create a test dataset. </p>
 */
@property (nonatomic, assign) AWSRekognitionDatasetType datasetType;

/**
 <p> The ARN of the Amazon Rekognition Custom Labels project to which you want to asssign the dataset. </p>
 */
@property (nonatomic, strong) NSString * _Nullable projectArn;

@end

/**
 
 */
@interface AWSRekognitionCreateDatasetResponse : AWSModel


/**
 <p> The ARN of the created Amazon Rekognition Custom Labels dataset. </p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetArn;

@end

/**
 
 */
@interface AWSRekognitionCreateProjectRequest : AWSRequest


/**
 <p>The name of the project to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectName;

@end

/**
 
 */
@interface AWSRekognitionCreateProjectResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the new project. You can use the ARN to configure IAM access to the project. </p>
 */
@property (nonatomic, strong) NSString * _Nullable projectArn;

@end

/**
 
 */
@interface AWSRekognitionCreateProjectVersionRequest : AWSRequest


/**
 <p>The identifier for your AWS Key Management Service key (AWS KMS key). You can supply the Amazon Resource Name (ARN) of your KMS key, the ID of your KMS key, an alias for your KMS key, or an alias ARN. The key is used to encrypt training and test images copied into the service for model training. Your source images are unaffected. The key is also used to encrypt training results and manifest files written to the output Amazon S3 bucket (<code>OutputConfig</code>).</p><p>If you choose to use your own KMS key, you need the following permissions on the KMS key.</p><ul><li><p>kms:CreateGrant</p></li><li><p>kms:DescribeKey</p></li><li><p>kms:GenerateDataKey</p></li><li><p>kms:Decrypt</p></li></ul><p>If you don't specify a value for <code>KmsKeyId</code>, images copied into the service are encrypted using a key that AWS owns and manages.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The Amazon S3 bucket location to store the results of training. The S3 bucket can be in any AWS account as long as the caller has <code>s3:PutObject</code> permissions on the S3 bucket.</p>
 */
@property (nonatomic, strong) AWSRekognitionOutputConfig * _Nullable outputConfig;

/**
 <p>The ARN of the Amazon Rekognition Custom Labels project that manages the model that you want to train.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectArn;

/**
 <p> A set of tags (key-value pairs) that you want to attach to the model. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>Specifies an external manifest that the service uses to test the model. If you specify <code>TestingData</code> you must also specify <code>TrainingData</code>. The project must not have any associated datasets.</p>
 */
@property (nonatomic, strong) AWSRekognitionTestingData * _Nullable testingData;

/**
 <p>Specifies an external manifest that the services uses to train the model. If you specify <code>TrainingData</code> you must also specify <code>TestingData</code>. The project must not have any associated datasets. </p>
 */
@property (nonatomic, strong) AWSRekognitionTrainingData * _Nullable trainingData;

/**
 <p>A name for the version of the model. This value must be unique.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionName;

@end

/**
 
 */
@interface AWSRekognitionCreateProjectVersionResponse : AWSModel


/**
 <p>The ARN of the model version that was created. Use <code>DescribeProjectVersion</code> to get the current status of the training operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectVersionArn;

@end

/**
 
 */
@interface AWSRekognitionCreateStreamProcessorRequest : AWSRequest


/**
 <p> Shows whether you are sharing data with Rekognition to improve model performance. You can choose this option at the account level or on a per-stream basis. Note that if you opt out at the account level this setting is ignored on individual streams. </p>
 */
@property (nonatomic, strong) AWSRekognitionStreamProcessorDataSharingPreference * _Nullable dataSharingPreference;

/**
 <p>Kinesis video stream stream that provides the source streaming video. If you are using the AWS CLI, the parameter name is <code>StreamProcessorInput</code>. This is required for both face search and label detection stream processors.</p>
 */
@property (nonatomic, strong) AWSRekognitionStreamProcessorInput * _Nullable input;

/**
 <p> The identifier for your AWS Key Management Service key (AWS KMS key). This is an optional parameter for label detection stream processors and should not be used to create a face search stream processor. You can supply the Amazon Resource Name (ARN) of your KMS key, the ID of your KMS key, an alias for your KMS key, or an alias ARN. The key is used to encrypt results and data published to your Amazon S3 bucket, which includes image frames and hero images. Your source images are unaffected. </p><p></p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>An identifier you assign to the stream processor. You can use <code>Name</code> to manage the stream processor. For example, you can get the current status of the stream processor by calling <a>DescribeStreamProcessor</a>. <code>Name</code> is idempotent. This is required for both face search and label detection stream processors. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Simple Notification Service topic to which Amazon Rekognition publishes the object detection results and completion status of a video analysis operation.</p><p>Amazon Rekognition publishes a notification the first time an object of interest or a person is detected in the video stream. For example, if Amazon Rekognition detects a person at second 2, a pet at second 4, and a person again at second 5, Amazon Rekognition sends 2 object class detected notifications, one for a person at second 2 and one for a pet at second 4.</p><p>Amazon Rekognition also publishes an an end-of-session notification with a summary when the stream processing session is complete.</p>
 */
@property (nonatomic, strong) AWSRekognitionStreamProcessorNotificationChannel * _Nullable notificationChannel;

/**
 <p>Kinesis data stream stream or Amazon S3 bucket location to which Amazon Rekognition Video puts the analysis results. If you are using the AWS CLI, the parameter name is <code>StreamProcessorOutput</code>. This must be a <a>S3Destination</a> of an Amazon S3 bucket that you own for a label detection stream processor or a Kinesis data stream ARN for a face search stream processor.</p>
 */
@property (nonatomic, strong) AWSRekognitionStreamProcessorOutput * _Nullable output;

/**
 <p> Specifies locations in the frames where Amazon Rekognition checks for objects or people. You can specify up to 10 regions of interest, and each region has either a polygon or a bounding box. This is an optional parameter for label detection stream processors and should not be used to create a face search stream processor. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionRegionOfInterest *> * _Nullable regionsOfInterest;

/**
 <p>The Amazon Resource Number (ARN) of the IAM role that allows access to the stream processor. The IAM role provides Rekognition read permissions for a Kinesis stream. It also provides write permissions to an Amazon S3 bucket and Amazon Simple Notification Service topic for a label detection stream processor. This is required for both face search and label detection stream processors.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Input parameters used in a streaming video analyzed by a stream processor. You can use <code>FaceSearch</code> to recognize faces in a streaming video, or you can use <code>ConnectedHome</code> to detect labels.</p>
 */
@property (nonatomic, strong) AWSRekognitionStreamProcessorSettings * _Nullable settings;

/**
 <p> A set of tags (key-value pairs) that you want to attach to the stream processor. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSRekognitionCreateStreamProcessorResponse : AWSModel


/**
 <p>Amazon Resource Number for the newly created stream processor.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamProcessorArn;

@end

/**
 <p>A custom label detected in an image by a call to <a>DetectCustomLabels</a>.</p>
 */
@interface AWSRekognitionCustomLabel : AWSModel


/**
 <p>The confidence that the model has in the detection of the custom label. The range is 0-100. A higher value indicates a higher confidence.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>The location of the detected object on the image that corresponds to the custom label. Includes an axis aligned coarse bounding box surrounding the object and a finer grain polygon for more accurate spatial information.</p>
 */
@property (nonatomic, strong) AWSRekognitionGeometry * _Nullable geometry;

/**
 <p>The name of the custom label.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p> Describes updates or additions to a dataset. A Single update or addition is an entry (JSON Line) that provides information about a single image. To update an existing entry, you match the <code>source-ref</code> field of the update entry with the <code>source-ref</code> filed of the entry that you want to update. If the <code>source-ref</code> field doesn't match an existing entry, the entry is added to dataset as a new entry. </p>
 Required parameters: [GroundTruth]
 */
@interface AWSRekognitionDatasetChanges : AWSModel


/**
 <p>A Base64-encoded binary data object containing one or JSON lines that either update the dataset or are additions to the dataset. You change a dataset by calling <a>UpdateDatasetEntries</a>. If you are using an AWS SDK to call <code>UpdateDatasetEntries</code>, you don't need to encode <code>Changes</code> as the SDK encodes the data for you. </p><p>For example JSON lines, see Image-Level labels in manifest files and and Object localization in manifest files in the <i>Amazon Rekognition Custom Labels Developer Guide</i>. </p>
 */
@property (nonatomic, strong) NSData * _Nullable groundTruth;

@end

/**
 <p> A description for a dataset. For more information, see <a>DescribeDataset</a>.</p><p>The status fields <code>Status</code>, <code>StatusMessage</code>, and <code>StatusMessageCode</code> reflect the last operation on the dataset. </p>
 */
@interface AWSRekognitionDatasetDescription : AWSModel


/**
 <p> The Unix timestamp for the time and date that the dataset was created. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimestamp;

/**
 <p> The status message code for the dataset. </p>
 */
@property (nonatomic, strong) AWSRekognitionDatasetStats * _Nullable datasetStats;

/**
 <p> The Unix timestamp for the date and time that the dataset was last updated. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTimestamp;

/**
 <p> The status of the dataset. </p>
 */
@property (nonatomic, assign) AWSRekognitionDatasetStatus status;

/**
 <p> The status message for the dataset. </p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p> The status message code for the dataset operation. If a service error occurs, try the API call again later. If a client error occurs, check the input parameters to the dataset API call that failed. </p>
 */
@property (nonatomic, assign) AWSRekognitionDatasetStatusMessageCode statusMessageCode;

@end

/**
 <p> Describes a dataset label. For more information, see <a>ListDatasetLabels</a>. </p>
 */
@interface AWSRekognitionDatasetLabelDescription : AWSModel


/**
 <p> The name of the label. </p>
 */
@property (nonatomic, strong) NSString * _Nullable labelName;

/**
 <p> Statistics about the label. </p>
 */
@property (nonatomic, strong) AWSRekognitionDatasetLabelStats * _Nullable labelStats;

@end

/**
 <p> Statistics about a label used in a dataset. For more information, see <a>DatasetLabelDescription</a>. </p>
 */
@interface AWSRekognitionDatasetLabelStats : AWSModel


/**
 <p> The total number of images that have the label assigned to a bounding box. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable boundingBoxCount;

/**
 <p> The total number of images that use the label. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable entryCount;

@end

/**
 <p> Summary information for an Amazon Rekognition Custom Labels dataset. For more information, see <a>ProjectDescription</a>. </p>
 */
@interface AWSRekognitionDatasetMetadata : AWSModel


/**
 <p> The Unix timestamp for the date and time that the dataset was created. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimestamp;

/**
 <p> The Amazon Resource Name (ARN) for the dataset. </p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetArn;

/**
 <p> The type of the dataset. </p>
 */
@property (nonatomic, assign) AWSRekognitionDatasetType datasetType;

/**
 <p> The status for the dataset. </p>
 */
@property (nonatomic, assign) AWSRekognitionDatasetStatus status;

/**
 <p> The status message for the dataset. </p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p> The status message code for the dataset operation. If a service error occurs, try the API call again later. If a client error occurs, check the input parameters to the dataset API call that failed. </p>
 */
@property (nonatomic, assign) AWSRekognitionDatasetStatusMessageCode statusMessageCode;

@end

/**
 <p> The source that Amazon Rekognition Custom Labels uses to create a dataset. To use an Amazon Sagemaker format manifest file, specify the S3 bucket location in the <code>GroundTruthManifest</code> field. The S3 bucket must be in your AWS account. To create a copy of an existing dataset, specify the Amazon Resource Name (ARN) of an existing dataset in <code>DatasetArn</code>.</p><p>You need to specify a value for <code>DatasetArn</code> or <code>GroundTruthManifest</code>, but not both. if you supply both values, or if you don't specify any values, an InvalidParameterException exception occurs. </p><p>For more information, see <a>CreateDataset</a>.</p>
 */
@interface AWSRekognitionDatasetSource : AWSModel


/**
 <p> The ARN of an Amazon Rekognition Custom Labels dataset that you want to copy. </p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetArn;

/**
 <p>The S3 bucket that contains an Amazon Sagemaker Ground Truth format manifest file. </p>
 */
@property (nonatomic, strong) AWSRekognitionGroundTruthManifest * _Nullable groundTruthManifest;

@end

/**
 <p> Provides statistics about a dataset. For more information, see <a>DescribeDataset</a>. </p>
 */
@interface AWSRekognitionDatasetStats : AWSModel


/**
 <p> The total number of entries that contain at least one error. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable errorEntries;

/**
 <p> The total number of images in the dataset that have labels. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable labeledEntries;

/**
 <p> The total number of images in the dataset. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalEntries;

/**
 <p> The total number of labels declared in the dataset. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalLabels;

@end

/**
 
 */
@interface AWSRekognitionDeleteCollectionRequest : AWSRequest


/**
 <p>ID of the collection to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionId;

@end

/**
 
 */
@interface AWSRekognitionDeleteCollectionResponse : AWSModel


/**
 <p>HTTP status code that indicates the result of the operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable statusCode;

@end

/**
 
 */
@interface AWSRekognitionDeleteDatasetRequest : AWSRequest


/**
 <p> The ARN of the Amazon Rekognition Custom Labels dataset that you want to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetArn;

@end

/**
 
 */
@interface AWSRekognitionDeleteDatasetResponse : AWSModel


@end

/**
 
 */
@interface AWSRekognitionDeleteFacesRequest : AWSRequest


/**
 <p>Collection from which to remove the specific faces.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionId;

/**
 <p>An array of face IDs to delete.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable faceIds;

@end

/**
 
 */
@interface AWSRekognitionDeleteFacesResponse : AWSModel


/**
 <p>An array of strings (face IDs) of the faces that were deleted.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable deletedFaces;

@end

/**
 
 */
@interface AWSRekognitionDeleteProjectPolicyRequest : AWSRequest


/**
 <p>The name of the policy that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The ID of the project policy revision that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyRevisionId;

/**
 <p>The Amazon Resource Name (ARN) of the project that the project policy you want to delete is attached to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectArn;

@end

/**
 
 */
@interface AWSRekognitionDeleteProjectPolicyResponse : AWSModel


@end

/**
 
 */
@interface AWSRekognitionDeleteProjectRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the project that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectArn;

@end

/**
 
 */
@interface AWSRekognitionDeleteProjectResponse : AWSModel


/**
 <p>The current status of the delete project operation.</p>
 */
@property (nonatomic, assign) AWSRekognitionProjectStatus status;

@end

/**
 
 */
@interface AWSRekognitionDeleteProjectVersionRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the model version that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectVersionArn;

@end

/**
 
 */
@interface AWSRekognitionDeleteProjectVersionResponse : AWSModel


/**
 <p>The status of the deletion operation.</p>
 */
@property (nonatomic, assign) AWSRekognitionProjectVersionStatus status;

@end

/**
 
 */
@interface AWSRekognitionDeleteStreamProcessorRequest : AWSRequest


/**
 <p>The name of the stream processor you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSRekognitionDeleteStreamProcessorResponse : AWSModel


@end

/**
 
 */
@interface AWSRekognitionDescribeCollectionRequest : AWSRequest


/**
 <p>The ID of the collection to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionId;

@end

/**
 
 */
@interface AWSRekognitionDescribeCollectionResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionARN;

/**
 <p>The number of milliseconds since the Unix epoch time until the creation of the collection. The Unix epoch time is 00:00:00 Coordinated Universal Time (UTC), Thursday, 1 January 1970.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimestamp;

/**
 <p>The number of faces that are indexed into the collection. To index faces into a collection, use <a>IndexFaces</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable faceCount;

/**
 <p>The version of the face model that's used by the collection for face detection.</p><p>For more information, see Model versioning in the Amazon Rekognition Developer Guide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable faceModelVersion;

@end

/**
 
 */
@interface AWSRekognitionDescribeDatasetRequest : AWSRequest


/**
 <p> The Amazon Resource Name (ARN) of the dataset that you want to describe. </p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetArn;

@end

/**
 
 */
@interface AWSRekognitionDescribeDatasetResponse : AWSModel


/**
 <p> The description for the dataset. </p>
 */
@property (nonatomic, strong) AWSRekognitionDatasetDescription * _Nullable datasetDescription;

@end

/**
 
 */
@interface AWSRekognitionDescribeProjectVersionsRequest : AWSRequest


/**
 <p>The maximum number of results to return per paginated call. The largest value you can specify is 100. If you specify a value greater than 100, a ValidationException error occurs. The default value is 100. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete (because there is more results to retrieve), Amazon Rekognition Custom Labels returns a pagination token in the response. You can use this pagination token to retrieve the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The Amazon Resource Name (ARN) of the project that contains the models you want to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectArn;

/**
 <p>A list of model version names that you want to describe. You can add up to 10 model version names to the list. If you don't specify a value, all model descriptions are returned. A version name is part of a model (ProjectVersion) ARN. For example, <code>my-model.2020-01-21T09.10.15</code> is the version name in the following ARN. <code>arn:aws:rekognition:us-east-1:123456789012:project/getting-started/version/<i>my-model.2020-01-21T09.10.15</i>/1234567890123</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable versionNames;

@end

/**
 
 */
@interface AWSRekognitionDescribeProjectVersionsResponse : AWSModel


/**
 <p>If the previous response was incomplete (because there is more results to retrieve), Amazon Rekognition Custom Labels returns a pagination token in the response. You can use this pagination token to retrieve the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of model descriptions. The list is sorted by the creation date and time of the model versions, latest to earliest.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionProjectVersionDescription *> * _Nullable projectVersionDescriptions;

@end

/**
 
 */
@interface AWSRekognitionDescribeProjectsRequest : AWSRequest


/**
 <p>The maximum number of results to return per paginated call. The largest value you can specify is 100. If you specify a value greater than 100, a ValidationException error occurs. The default value is 100. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete (because there is more results to retrieve), Amazon Rekognition Custom Labels returns a pagination token in the response. You can use this pagination token to retrieve the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of the projects that you want Amazon Rekognition Custom Labels to describe. If you don't specify a value, the response includes descriptions for all the projects in your AWS account.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable projectNames;

@end

/**
 
 */
@interface AWSRekognitionDescribeProjectsResponse : AWSModel


/**
 <p>If the previous response was incomplete (because there is more results to retrieve), Amazon Rekognition Custom Labels returns a pagination token in the response. You can use this pagination token to retrieve the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of project descriptions. The list is sorted by the date and time the projects are created.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionProjectDescription *> * _Nullable projectDescriptions;

@end

/**
 
 */
@interface AWSRekognitionDescribeStreamProcessorRequest : AWSRequest


/**
 <p>Name of the stream processor for which you want information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSRekognitionDescribeStreamProcessorResponse : AWSModel


/**
 <p>Date and time the stream processor was created</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimestamp;

/**
 <p> Shows whether you are sharing data with Rekognition to improve model performance. You can choose this option at the account level or on a per-stream basis. Note that if you opt out at the account level this setting is ignored on individual streams. </p>
 */
@property (nonatomic, strong) AWSRekognitionStreamProcessorDataSharingPreference * _Nullable dataSharingPreference;

/**
 <p>Kinesis video stream that provides the source streaming video.</p>
 */
@property (nonatomic, strong) AWSRekognitionStreamProcessorInput * _Nullable input;

/**
 <p> The identifier for your AWS Key Management Service key (AWS KMS key). This is an optional parameter for label detection stream processors. </p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The time, in Unix format, the stream processor was last updated. For example, when the stream processor moves from a running state to a failed state, or when the user starts or stops the stream processor.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateTimestamp;

/**
 <p>Name of the stream processor. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Simple Notification Service topic to which Amazon Rekognition publishes the object detection results and completion status of a video analysis operation.</p><p>Amazon Rekognition publishes a notification the first time an object of interest or a person is detected in the video stream. For example, if Amazon Rekognition detects a person at second 2, a pet at second 4, and a person again at second 5, Amazon Rekognition sends 2 object class detected notifications, one for a person at second 2 and one for a pet at second 4.</p><p>Amazon Rekognition also publishes an an end-of-session notification with a summary when the stream processing session is complete.</p>
 */
@property (nonatomic, strong) AWSRekognitionStreamProcessorNotificationChannel * _Nullable notificationChannel;

/**
 <p>Kinesis data stream to which Amazon Rekognition Video puts the analysis results.</p>
 */
@property (nonatomic, strong) AWSRekognitionStreamProcessorOutput * _Nullable output;

/**
 <p> Specifies locations in the frames where Amazon Rekognition checks for objects or people. This is an optional parameter for label detection stream processors. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionRegionOfInterest *> * _Nullable regionsOfInterest;

/**
 <p>ARN of the IAM role that allows access to the stream processor.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Input parameters used in a streaming video analyzed by a stream processor. You can use <code>FaceSearch</code> to recognize faces in a streaming video, or you can use <code>ConnectedHome</code> to detect labels.</p>
 */
@property (nonatomic, strong) AWSRekognitionStreamProcessorSettings * _Nullable settings;

/**
 <p>Current status of the stream processor.</p>
 */
@property (nonatomic, assign) AWSRekognitionStreamProcessorStatus status;

/**
 <p>Detailed status message about the stream processor.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>ARN of the stream processor.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamProcessorArn;

@end

/**
 
 */
@interface AWSRekognitionDetectCustomLabelsRequest : AWSRequest


/**
 <p>Provides the input image either as bytes or an S3 object.</p><p>You pass image bytes to an Amazon Rekognition API operation by using the <code>Bytes</code> property. For example, you would use the <code>Bytes</code> property to pass an image loaded from a local file system. Image bytes passed by using the <code>Bytes</code> property must be base64-encoded. Your code may not need to encode image bytes if you are using an AWS SDK to call Amazon Rekognition API operations. </p><p>For more information, see Analyzing an Image Loaded from a Local File System in the Amazon Rekognition Developer Guide.</p><p> You pass images stored in an S3 bucket to an Amazon Rekognition API operation by using the <code>S3Object</code> property. Images stored in an S3 bucket do not need to be base64-encoded.</p><p>The region for the S3 bucket containing the S3 object must match the region you use for Amazon Rekognition operations.</p><p>If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes using the Bytes property is not supported. You must first upload the image to an Amazon S3 bucket and then call the operation using the S3Object property.</p><p>For Amazon Rekognition to process an S3 object, the user must have permission to access the S3 object. For more information, see How Amazon Rekognition works with IAM in the Amazon Rekognition Developer Guide. </p>
 */
@property (nonatomic, strong) AWSRekognitionImage * _Nullable image;

/**
 <p>Maximum number of results you want the service to return in the response. The service returns the specified number of highest confidence labels ranked from highest confidence to lowest.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Specifies the minimum confidence level for the labels to return. <code>DetectCustomLabels</code> doesn't return any labels with a confidence value that's lower than this specified value. If you specify a value of 0, <code>DetectCustomLabels</code> returns all labels, regardless of the assumed threshold applied to each label. If you don't specify a value for <code>MinConfidence</code>, <code>DetectCustomLabels</code> returns labels based on the assumed threshold of each label.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minConfidence;

/**
 <p>The ARN of the model version that you want to use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectVersionArn;

@end

/**
 
 */
@interface AWSRekognitionDetectCustomLabelsResponse : AWSModel


/**
 <p>An array of custom labels detected in the input image.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionCustomLabel *> * _Nullable customLabels;

@end

/**
 
 */
@interface AWSRekognitionDetectFacesRequest : AWSRequest


/**
 <p>An array of facial attributes you want to be returned. This can be the default list of attributes or all attributes. If you don't specify a value for <code>Attributes</code> or if you specify <code>["DEFAULT"]</code>, the API returns the following subset of facial attributes: <code>BoundingBox</code>, <code>Confidence</code>, <code>Pose</code>, <code>Quality</code>, and <code>Landmarks</code>. If you provide <code>["ALL"]</code>, all facial attributes are returned, but the operation takes longer to complete.</p><p>If you provide both, <code>["ALL", "DEFAULT"]</code>, the service uses a logical AND operator to determine which attributes to return (in this case, all attributes). </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributes;

/**
 <p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported. </p><p>If you are using an AWS SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. For more information, see Images in the Amazon Rekognition developer guide.</p>
 */
@property (nonatomic, strong) AWSRekognitionImage * _Nullable image;

@end

/**
 
 */
@interface AWSRekognitionDetectFacesResponse : AWSModel


/**
 <p>Details of each face found in the image. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionFaceDetail *> * _Nullable faceDetails;

/**
 <p>The value of <code>OrientationCorrection</code> is always null.</p><p>If the input image is in .jpeg format, it might contain exchangeable image file format (Exif) metadata that includes the image's orientation. Amazon Rekognition uses this orientation information to perform image correction. The bounding box coordinates are translated to represent object locations after the orientation information in the Exif metadata is used to correct the image orientation. Images in .png format don't contain Exif metadata.</p><p>Amazon Rekognition doesn’t perform image correction for images in .png format and .jpeg images without orientation information in the image Exif metadata. The bounding box coordinates aren't translated and represent the object locations before the image is rotated. </p>
 */
@property (nonatomic, assign) AWSRekognitionOrientationCorrection orientationCorrection;

@end

/**
 <p>The background of the image with regard to image quality and dominant colors.</p>
 */
@interface AWSRekognitionDetectLabelsImageBackground : AWSModel


/**
 <p>The dominant colors found in the background of an image, defined with RGB values, CSS color name, simplified color name, and PixelPercentage (the percentage of image pixels that have a particular color).</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionDominantColor *> * _Nullable dominantColors;

/**
 <p>The quality of the image background as defined by brightness and sharpness.</p>
 */
@property (nonatomic, strong) AWSRekognitionDetectLabelsImageQuality * _Nullable quality;

@end

/**
 <p>The foreground of the image with regard to image quality and dominant colors.</p>
 */
@interface AWSRekognitionDetectLabelsImageForeground : AWSModel


/**
 <p>The dominant colors found in the foreground of an image, defined with RGB values, CSS color name, simplified color name, and PixelPercentage (the percentage of image pixels that have a particular color).</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionDominantColor *> * _Nullable dominantColors;

/**
 <p>The quality of the image foreground as defined by brightness and sharpness.</p>
 */
@property (nonatomic, strong) AWSRekognitionDetectLabelsImageQuality * _Nullable quality;

@end

/**
 <p>Information about the quality and dominant colors of an input image. Quality and color information is returned for the entire image, foreground, and background.</p>
 */
@interface AWSRekognitionDetectLabelsImageProperties : AWSModel


/**
 <p>Information about the properties of an image’s background, including the background’s quality and dominant colors, including the quality and dominant colors of the image.</p>
 */
@property (nonatomic, strong) AWSRekognitionDetectLabelsImageBackground * _Nullable background;

/**
 <p>Information about the dominant colors found in an image, described with RGB values, CSS color name, simplified color name, and PixelPercentage (the percentage of image pixels that have a particular color).</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionDominantColor *> * _Nullable dominantColors;

/**
 <p>Information about the properties of an image’s foreground, including the foreground’s quality and dominant colors, including the quality and dominant colors of the image.</p>
 */
@property (nonatomic, strong) AWSRekognitionDetectLabelsImageForeground * _Nullable foreground;

/**
 <p>Information about the quality of the image foreground as defined by brightness, sharpness, and contrast. The higher the value the greater the brightness, sharpness, and contrast respectively.</p>
 */
@property (nonatomic, strong) AWSRekognitionDetectLabelsImageQuality * _Nullable quality;

@end

/**
 <p>Settings for the IMAGE_PROPERTIES feature type.</p>
 */
@interface AWSRekognitionDetectLabelsImagePropertiesSettings : AWSModel


/**
 <p>The maximum number of dominant colors to return when detecting labels in an image. The default value is 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxDominantColors;

@end

/**
 <p>The quality of an image provided for label detection, with regard to brightness, sharpness, and contrast.</p>
 */
@interface AWSRekognitionDetectLabelsImageQuality : AWSModel


/**
 <p>The brightness of an image provided for label detection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable brightness;

/**
 <p>The contrast of an image provided for label detection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable contrast;

/**
 <p>The sharpness of an image provided for label detection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sharpness;

@end

/**
 
 */
@interface AWSRekognitionDetectLabelsRequest : AWSRequest


/**
 <p>A list of the types of analysis to perform. Specifying GENERAL_LABELS uses the label detection feature, while specifying IMAGE_PROPERTIES returns information regarding image color and quality. If no option is specified GENERAL_LABELS is used by default.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable features;

/**
 <p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. Images stored in an S3 Bucket do not need to be base64-encoded.</p><p>If you are using an AWS SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. For more information, see Images in the Amazon Rekognition developer guide.</p>
 */
@property (nonatomic, strong) AWSRekognitionImage * _Nullable image;

/**
 <p>Maximum number of labels you want the service to return in the response. The service returns the specified number of highest confidence labels. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxLabels;

/**
 <p>Specifies the minimum confidence level for the labels to return. Amazon Rekognition doesn't return any labels with confidence lower than this specified value.</p><p>If <code>MinConfidence</code> is not specified, the operation returns labels with a confidence values greater than or equal to 55 percent.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minConfidence;

/**
 <p>A list of the filters to be applied to returned detected labels and image properties. Specified filters can be inclusive, exclusive, or a combination of both. Filters can be used for individual labels or label categories. The exact label names or label categories must be supplied. For a full list of labels and label categories, see LINK HERE.</p>
 */
@property (nonatomic, strong) AWSRekognitionDetectLabelsSettings * _Nullable settings;

@end

/**
 
 */
@interface AWSRekognitionDetectLabelsResponse : AWSModel


/**
 <p>Information about the properties of the input image, such as brightness, sharpness, contrast, and dominant colors.</p>
 */
@property (nonatomic, strong) AWSRekognitionDetectLabelsImageProperties * _Nullable imageProperties;

/**
 <p>Version number of the label detection model that was used to detect labels.</p>
 */
@property (nonatomic, strong) NSString * _Nullable labelModelVersion;

/**
 <p>An array of labels for the real-world objects detected. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionLabel *> * _Nullable labels;

/**
 <p>The value of <code>OrientationCorrection</code> is always null.</p><p>If the input image is in .jpeg format, it might contain exchangeable image file format (Exif) metadata that includes the image's orientation. Amazon Rekognition uses this orientation information to perform image correction. The bounding box coordinates are translated to represent object locations after the orientation information in the Exif metadata is used to correct the image orientation. Images in .png format don't contain Exif metadata.</p><p>Amazon Rekognition doesn’t perform image correction for images in .png format and .jpeg images without orientation information in the image Exif metadata. The bounding box coordinates aren't translated and represent the object locations before the image is rotated. </p>
 */
@property (nonatomic, assign) AWSRekognitionOrientationCorrection orientationCorrection;

@end

/**
 <p>Settings for the DetectLabels request. Settings can include filters for both GENERAL_LABELS and IMAGE_PROPERTIES. GENERAL_LABELS filters can be inclusive or exclusive and applied to individual labels or label categories. IMAGE_PROPERTIES filters allow specification of a maximum number of dominant colors.</p>
 */
@interface AWSRekognitionDetectLabelsSettings : AWSModel


/**
 <p>Contains the specified filters for GENERAL_LABELS.</p>
 */
@property (nonatomic, strong) AWSRekognitionGeneralLabelsSettings * _Nullable generalLabels;

/**
 <p>Contains the chosen number of maximum dominant colors in an image.</p>
 */
@property (nonatomic, strong) AWSRekognitionDetectLabelsImagePropertiesSettings * _Nullable imageProperties;

@end

/**
 
 */
@interface AWSRekognitionDetectModerationLabelsRequest : AWSRequest


/**
 <p>Sets up the configuration for human evaluation, including the FlowDefinition the image will be sent to.</p>
 */
@property (nonatomic, strong) AWSRekognitionHumanLoopConfig * _Nullable humanLoopConfig;

/**
 <p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported. </p><p>If you are using an AWS SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. For more information, see Images in the Amazon Rekognition developer guide.</p>
 */
@property (nonatomic, strong) AWSRekognitionImage * _Nullable image;

/**
 <p>Specifies the minimum confidence level for the labels to return. Amazon Rekognition doesn't return any labels with a confidence level lower than this specified value.</p><p>If you don't specify <code>MinConfidence</code>, the operation returns labels with confidence values greater than or equal to 50 percent.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minConfidence;

@end

/**
 
 */
@interface AWSRekognitionDetectModerationLabelsResponse : AWSModel


/**
 <p>Shows the results of the human in the loop evaluation.</p>
 */
@property (nonatomic, strong) AWSRekognitionHumanLoopActivationOutput * _Nullable humanLoopActivationOutput;

/**
 <p>Array of detected Moderation labels and the time, in milliseconds from the start of the video, they were detected.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionModerationLabel *> * _Nullable moderationLabels;

/**
 <p>Version number of the moderation detection model that was used to detect unsafe content.</p>
 */
@property (nonatomic, strong) NSString * _Nullable moderationModelVersion;

@end

/**
 
 */
@interface AWSRekognitionDetectProtectiveEquipmentRequest : AWSRequest


/**
 <p>The image in which you want to detect PPE on detected persons. The image can be passed as image bytes or you can reference an image stored in an Amazon S3 bucket. </p>
 */
@property (nonatomic, strong) AWSRekognitionImage * _Nullable image;

/**
 <p>An array of PPE types that you want to summarize.</p>
 */
@property (nonatomic, strong) AWSRekognitionProtectiveEquipmentSummarizationAttributes * _Nullable summarizationAttributes;

@end

/**
 
 */
@interface AWSRekognitionDetectProtectiveEquipmentResponse : AWSModel


/**
 <p>An array of persons detected in the image (including persons not wearing PPE).</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionProtectiveEquipmentPerson *> * _Nullable persons;

/**
 <p>The version number of the PPE detection model used to detect PPE in the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable protectiveEquipmentModelVersion;

/**
 <p>Summary information for the types of PPE specified in the <code>SummarizationAttributes</code> input parameter.</p>
 */
@property (nonatomic, strong) AWSRekognitionProtectiveEquipmentSummary * _Nullable summary;

@end

/**
 <p>A set of optional parameters that you can use to set the criteria that the text must meet to be included in your response. <code>WordFilter</code> looks at a word’s height, width, and minimum confidence. <code>RegionOfInterest</code> lets you set a specific region of the image to look for text in. </p>
 */
@interface AWSRekognitionDetectTextFilters : AWSModel


/**
 <p> A Filter focusing on a certain area of the image. Uses a <code>BoundingBox</code> object to set the region of the image.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionRegionOfInterest *> * _Nullable regionsOfInterest;

/**
 <p>A set of parameters that allow you to filter out certain results from your returned results.</p>
 */
@property (nonatomic, strong) AWSRekognitionDetectionFilter * _Nullable wordFilter;

@end

/**
 
 */
@interface AWSRekognitionDetectTextRequest : AWSRequest


/**
 <p>Optional parameters that let you set the criteria that the text must meet to be included in your response.</p>
 */
@property (nonatomic, strong) AWSRekognitionDetectTextFilters * _Nullable filters;

/**
 <p>The input image as base64-encoded bytes or an Amazon S3 object. If you use the AWS CLI to call Amazon Rekognition operations, you can't pass image bytes. </p><p>If you are using an AWS SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. For more information, see Images in the Amazon Rekognition developer guide.</p>
 */
@property (nonatomic, strong) AWSRekognitionImage * _Nullable image;

@end

/**
 
 */
@interface AWSRekognitionDetectTextResponse : AWSModel


/**
 <p>An array of text that was detected in the input image.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionTextDetection *> * _Nullable textDetections;

/**
 <p>The model version used to detect text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable textModelVersion;

@end

/**
 <p>A set of parameters that allow you to filter out certain results from your returned results.</p>
 */
@interface AWSRekognitionDetectionFilter : AWSModel


/**
 <p>Sets the minimum height of the word bounding box. Words with bounding box heights lesser than this value will be excluded from the result. Value is relative to the video frame height.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minBoundingBoxHeight;

/**
 <p>Sets the minimum width of the word bounding box. Words with bounding boxes widths lesser than this value will be excluded from the result. Value is relative to the video frame width.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minBoundingBoxWidth;

/**
 <p>Sets the confidence of word detection. Words with detection confidence below this will be excluded from the result. Values should be between 0 and 100. The default MinConfidence is 80.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minConfidence;

@end

/**
 <p> A training dataset or a test dataset used in a dataset distribution operation. For more information, see <a>DistributeDatasetEntries</a>. </p>
 Required parameters: [Arn]
 */
@interface AWSRekognitionDistributeDataset : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the dataset that you want to use. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 
 */
@interface AWSRekognitionDistributeDatasetEntriesRequest : AWSRequest


/**
 <p>The ARNS for the training dataset and test dataset that you want to use. The datasets must belong to the same project. The test dataset must be empty. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionDistributeDataset *> * _Nullable datasets;

@end

/**
 
 */
@interface AWSRekognitionDistributeDatasetEntriesResponse : AWSModel


@end

/**
 <p>A description of the dominant colors in an image.</p>
 */
@interface AWSRekognitionDominantColor : AWSModel


/**
 <p>The Blue RGB value for a dominant color.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable blue;

/**
 <p>The CSS color name of a dominant color.</p>
 */
@property (nonatomic, strong) NSString * _Nullable CSSColor;

/**
 <p>The Green RGB value for a dominant color.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable green;

/**
 <p>The Hex code equivalent of the RGB values for a dominant color.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hexCode;

/**
 <p>The percentage of image pixels that have a given dominant color.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pixelPercent;

/**
 <p>The Red RGB value for a dominant color.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable red;

/**
 <p>One of 12 simplified color names applied to a dominant color.</p>
 */
@property (nonatomic, strong) NSString * _Nullable simplifiedColor;

@end

/**
 <p>The emotions that appear to be expressed on the face, and the confidence level in the determination. The API is only making a determination of the physical appearance of a person's face. It is not a determination of the person’s internal emotional state and should not be used in such a way. For example, a person pretending to have a sad face might not be sad emotionally.</p>
 */
@interface AWSRekognitionEmotion : AWSModel


/**
 <p>Level of confidence in the determination.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>Type of emotion detected.</p>
 */
@property (nonatomic, assign) AWSRekognitionEmotionName types;

@end

/**
 <p>Information about an item of Personal Protective Equipment (PPE) detected by <a>DetectProtectiveEquipment</a>. For more information, see <a>DetectProtectiveEquipment</a>.</p>
 */
@interface AWSRekognitionEquipmentDetection : AWSModel


/**
 <p>A bounding box surrounding the item of detected PPE.</p>
 */
@property (nonatomic, strong) AWSRekognitionBoundingBox * _Nullable boundingBox;

/**
 <p>The confidence that Amazon Rekognition has that the bounding box (<code>BoundingBox</code>) contains an item of PPE.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>Information about the body part covered by the detected PPE.</p>
 */
@property (nonatomic, strong) AWSRekognitionCoversBodyPart * _Nullable coversBodyPart;

/**
 <p>The type of detected PPE.</p>
 */
@property (nonatomic, assign) AWSRekognitionProtectiveEquipmentType types;

@end

/**
 <p>The evaluation results for the training of a model.</p>
 */
@interface AWSRekognitionEvaluationResult : AWSModel


/**
 <p>The F1 score for the evaluation of all labels. The F1 score metric evaluates the overall precision and recall performance of the model as a single value. A higher value indicates better precision and recall performance. A lower score indicates that precision, recall, or both are performing poorly. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable f1Score;

/**
 <p>The S3 bucket that contains the training summary.</p>
 */
@property (nonatomic, strong) AWSRekognitionSummary * _Nullable summary;

@end

/**
 <p>Indicates whether or not the eyes on the face are open, and the confidence level in the determination.</p>
 */
@interface AWSRekognitionEyeOpen : AWSModel


/**
 <p>Level of confidence in the determination.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>Boolean value that indicates whether the eyes on the face are open.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 <p>Indicates whether or not the face is wearing eye glasses, and the confidence level in the determination.</p>
 */
@interface AWSRekognitionEyeglasses : AWSModel


/**
 <p>Level of confidence in the determination.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>Boolean value that indicates whether the face is wearing eye glasses or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 <p>Describes the face properties such as the bounding box, face ID, image ID of the input image, and external image ID that you assigned. </p>
 */
@interface AWSRekognitionFace : AWSModel


/**
 <p>Bounding box of the face.</p>
 */
@property (nonatomic, strong) AWSRekognitionBoundingBox * _Nullable boundingBox;

/**
 <p>Confidence level that the bounding box contains a face (and not a different object such as a tree).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>Identifier that you assign to all the faces in the input image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalImageId;

/**
 <p>Unique identifier that Amazon Rekognition assigns to the face.</p>
 */
@property (nonatomic, strong) NSString * _Nullable faceId;

/**
 <p>Unique identifier that Amazon Rekognition assigns to the input image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

/**
 <p> The version of the face detect and storage model that was used when indexing the face vector. </p>
 */
@property (nonatomic, strong) NSString * _Nullable indexFacesModelVersion;

@end

/**
 <p>Structure containing attributes of the face that the algorithm detected.</p><p>A <code>FaceDetail</code> object contains either the default facial attributes or all facial attributes. The default attributes are <code>BoundingBox</code>, <code>Confidence</code>, <code>Landmarks</code>, <code>Pose</code>, and <code>Quality</code>.</p><p><a>GetFaceDetection</a> is the only Amazon Rekognition Video stored video operation that can return a <code>FaceDetail</code> object with all attributes. To specify which attributes to return, use the <code>FaceAttributes</code> input parameter for <a>StartFaceDetection</a>. The following Amazon Rekognition Video operations return only the default attributes. The corresponding Start operations don't have a <code>FaceAttributes</code> input parameter:</p><ul><li><p>GetCelebrityRecognition</p></li><li><p>GetPersonTracking</p></li><li><p>GetFaceSearch</p></li></ul><p>The Amazon Rekognition Image <a>DetectFaces</a> and <a>IndexFaces</a> operations can return all facial attributes. To specify which attributes to return, use the <code>Attributes</code> input parameter for <code>DetectFaces</code>. For <code>IndexFaces</code>, use the <code>DetectAttributes</code> input parameter.</p>
 */
@interface AWSRekognitionFaceDetail : AWSModel


/**
 <p>The estimated age range, in years, for the face. Low represents the lowest estimated age and High represents the highest estimated age.</p>
 */
@property (nonatomic, strong) AWSRekognitionAgeRange * _Nullable ageRange;

/**
 <p>Indicates whether or not the face has a beard, and the confidence level in the determination.</p>
 */
@property (nonatomic, strong) AWSRekognitionBeard * _Nullable beard;

/**
 <p>Bounding box of the face. Default attribute.</p>
 */
@property (nonatomic, strong) AWSRekognitionBoundingBox * _Nullable boundingBox;

/**
 <p>Confidence level that the bounding box contains a face (and not a different object such as a tree). Default attribute.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>The emotions that appear to be expressed on the face, and the confidence level in the determination. The API is only making a determination of the physical appearance of a person's face. It is not a determination of the person’s internal emotional state and should not be used in such a way. For example, a person pretending to have a sad face might not be sad emotionally.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionEmotion *> * _Nullable emotions;

/**
 <p>Indicates whether or not the face is wearing eye glasses, and the confidence level in the determination.</p>
 */
@property (nonatomic, strong) AWSRekognitionEyeglasses * _Nullable eyeglasses;

/**
 <p>Indicates whether or not the eyes on the face are open, and the confidence level in the determination.</p>
 */
@property (nonatomic, strong) AWSRekognitionEyeOpen * _Nullable eyesOpen;

/**
 <p>The predicted gender of a detected face. </p>
 */
@property (nonatomic, strong) AWSRekognitionGender * _Nullable gender;

/**
 <p>Indicates the location of landmarks on the face. Default attribute.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionLandmark *> * _Nullable landmarks;

/**
 <p>Indicates whether or not the mouth on the face is open, and the confidence level in the determination.</p>
 */
@property (nonatomic, strong) AWSRekognitionMouthOpen * _Nullable mouthOpen;

/**
 <p>Indicates whether or not the face has a mustache, and the confidence level in the determination.</p>
 */
@property (nonatomic, strong) AWSRekognitionMustache * _Nullable mustache;

/**
 <p>Indicates the pose of the face as determined by its pitch, roll, and yaw. Default attribute.</p>
 */
@property (nonatomic, strong) AWSRekognitionPose * _Nullable pose;

/**
 <p>Identifies image brightness and sharpness. Default attribute.</p>
 */
@property (nonatomic, strong) AWSRekognitionImageQuality * _Nullable quality;

/**
 <p>Indicates whether or not the face is smiling, and the confidence level in the determination.</p>
 */
@property (nonatomic, strong) AWSRekognitionSmile * _Nullable smile;

/**
 <p>Indicates whether or not the face is wearing sunglasses, and the confidence level in the determination.</p>
 */
@property (nonatomic, strong) AWSRekognitionSunglasses * _Nullable sunglasses;

@end

/**
 <p>Information about a face detected in a video analysis request and the time the face was detected in the video. </p>
 */
@interface AWSRekognitionFaceDetection : AWSModel


/**
 <p>The face properties for the detected face.</p>
 */
@property (nonatomic, strong) AWSRekognitionFaceDetail * _Nullable face;

/**
 <p>Time, in milliseconds from the start of the video, that the face was detected. Note that <code>Timestamp</code> is not guaranteed to be accurate to the individual frame where the face first appears.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timestamp;

@end

/**
 <p>Provides face metadata. In addition, it also provides the confidence in the match of this face with the input face.</p>
 */
@interface AWSRekognitionFaceMatch : AWSModel


/**
 <p>Describes the face properties such as the bounding box, face ID, image ID of the source image, and external image ID that you assigned.</p>
 */
@property (nonatomic, strong) AWSRekognitionFace * _Nullable face;

/**
 <p>Confidence in the match of this face with the input face.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable similarity;

@end

/**
 <p>Object containing both the face metadata (stored in the backend database), and facial attributes that are detected but aren't stored in the database.</p>
 */
@interface AWSRekognitionFaceRecord : AWSModel


/**
 <p>Describes the face properties such as the bounding box, face ID, image ID of the input image, and external image ID that you assigned. </p>
 */
@property (nonatomic, strong) AWSRekognitionFace * _Nullable face;

/**
 <p>Structure containing attributes of the face that the algorithm detected.</p>
 */
@property (nonatomic, strong) AWSRekognitionFaceDetail * _Nullable faceDetail;

@end

/**
 <p>Input face recognition parameters for an Amazon Rekognition stream processor. Includes the collection to use for face recognition and the face attributes to detect. Defining the settings is required in the request parameter for <a>CreateStreamProcessor</a>.</p>
 */
@interface AWSRekognitionFaceSearchSettings : AWSModel


/**
 <p>The ID of a collection that contains faces that you want to search for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionId;

/**
 <p>Minimum face match confidence score that must be met to return a result for a recognized face. The default is 80. 0 is the lowest confidence. 100 is the highest confidence. Values between 0 and 100 are accepted, and values lower than 80 are set to 80.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable faceMatchThreshold;

@end

/**
 <p>The predicted gender of a detected face. </p><p>Amazon Rekognition makes gender binary (male/female) predictions based on the physical appearance of a face in a particular image. This kind of prediction is not designed to categorize a person’s gender identity, and you shouldn't use Amazon Rekognition to make such a determination. For example, a male actor wearing a long-haired wig and earrings for a role might be predicted as female.</p><p>Using Amazon Rekognition to make gender binary predictions is best suited for use cases where aggregate gender distribution statistics need to be analyzed without identifying specific users. For example, the percentage of female users compared to male users on a social media platform. </p><p>We don't recommend using gender binary predictions to make decisions that impact an individual's rights, privacy, or access to services.</p>
 */
@interface AWSRekognitionGender : AWSModel


/**
 <p>Level of confidence in the prediction.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>The predicted gender of the face.</p>
 */
@property (nonatomic, assign) AWSRekognitionGenderType value;

@end

/**
 <p>Contains filters for the object labels returned by DetectLabels. Filters can be inclusive, exclusive, or a combination of both and can be applied to individual l abels or entire label categories.</p>
 */
@interface AWSRekognitionGeneralLabelsSettings : AWSModel


/**
 <p>The label categories that should be excluded from the return from DetectLabels.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable labelCategoryExclusionFilters;

/**
 <p>The label categories that should be included in the return from DetectLabels.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable labelCategoryInclusionFilters;

/**
 <p>The labels that should be excluded from the return from DetectLabels.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable labelExclusionFilters;

/**
 <p>The labels that should be included in the return from DetectLabels.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable labelInclusionFilters;

@end

/**
 <p>Information about where an object (<a>DetectCustomLabels</a>) or text (<a>DetectText</a>) is located on an image.</p>
 */
@interface AWSRekognitionGeometry : AWSModel


/**
 <p>An axis-aligned coarse representation of the detected item's location on the image.</p>
 */
@property (nonatomic, strong) AWSRekognitionBoundingBox * _Nullable boundingBox;

/**
 <p>Within the bounding box, a fine-grained polygon around the detected item.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionPoint *> * _Nullable polygon;

@end

/**
 
 */
@interface AWSRekognitionGetCelebrityInfoRequest : AWSRequest


/**
 <p>The ID for the celebrity. You get the celebrity ID from a call to the <a>RecognizeCelebrities</a> operation, which recognizes celebrities in an image. </p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSRekognitionGetCelebrityInfoResponse : AWSModel


/**
 <p>Retrieves the known gender for the celebrity.</p>
 */
@property (nonatomic, strong) AWSRekognitionKnownGender * _Nullable knownGender;

/**
 <p>The name of the celebrity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>An array of URLs pointing to additional celebrity information. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable urls;

@end

/**
 
 */
@interface AWSRekognitionGetCelebrityRecognitionRequest : AWSRequest


/**
 <p>Job identifier for the required celebrity recognition analysis. You can get the job identifer from a call to <code>StartCelebrityRecognition</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Maximum number of results to return per paginated call. The largest value you can specify is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value is 1000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete (because there is more recognized celebrities to retrieve), Amazon Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of celebrities. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Sort to use for celebrities returned in <code>Celebrities</code> field. Specify <code>ID</code> to sort by the celebrity identifier, specify <code>TIMESTAMP</code> to sort by the time the celebrity was recognized.</p>
 */
@property (nonatomic, assign) AWSRekognitionCelebrityRecognitionSortBy sortBy;

@end

/**
 
 */
@interface AWSRekognitionGetCelebrityRecognitionResponse : AWSModel


/**
 <p>Array of celebrities recognized in the video.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionCelebrityRecognition *> * _Nullable celebrities;

/**
 <p>The current status of the celebrity recognition job.</p>
 */
@property (nonatomic, assign) AWSRekognitionVideoJobStatus jobStatus;

/**
 <p>If the response is truncated, Amazon Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of celebrities.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>Information about a video that Amazon Rekognition Video analyzed. <code>Videometadata</code> is returned in every page of paginated responses from a Amazon Rekognition Video operation.</p>
 */
@property (nonatomic, strong) AWSRekognitionVideoMetadata * _Nullable videoMetadata;

@end

/**
 
 */
@interface AWSRekognitionGetContentModerationRequest : AWSRequest


/**
 <p>The identifier for the inappropriate, unwanted, or offensive content moderation job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetContentModeration</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Maximum number of results to return per paginated call. The largest value you can specify is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value is 1000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete (because there is more data to retrieve), Amazon Rekognition returns a pagination token in the response. You can use this pagination token to retrieve the next set of content moderation labels.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Sort to use for elements in the <code>ModerationLabelDetections</code> array. Use <code>TIMESTAMP</code> to sort array elements by the time labels are detected. Use <code>NAME</code> to alphabetically group elements for a label together. Within each label group, the array element are sorted by detection confidence. The default sort is by <code>TIMESTAMP</code>.</p>
 */
@property (nonatomic, assign) AWSRekognitionContentModerationSortBy sortBy;

@end

/**
 
 */
@interface AWSRekognitionGetContentModerationResponse : AWSModel


/**
 <p>The current status of the content moderation analysis job.</p>
 */
@property (nonatomic, assign) AWSRekognitionVideoJobStatus jobStatus;

/**
 <p>The detected inappropriate, unwanted, or offensive content moderation labels and the time(s) they were detected.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionContentModerationDetection *> * _Nullable moderationLabels;

/**
 <p>Version number of the moderation detection model that was used to detect inappropriate, unwanted, or offensive content.</p>
 */
@property (nonatomic, strong) NSString * _Nullable moderationModelVersion;

/**
 <p>If the response is truncated, Amazon Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of content moderation labels. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>Information about a video that Amazon Rekognition analyzed. <code>Videometadata</code> is returned in every page of paginated responses from <code>GetContentModeration</code>. </p>
 */
@property (nonatomic, strong) AWSRekognitionVideoMetadata * _Nullable videoMetadata;

@end

/**
 
 */
@interface AWSRekognitionGetFaceDetectionRequest : AWSRequest


/**
 <p>Unique identifier for the face detection job. The <code>JobId</code> is returned from <code>StartFaceDetection</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Maximum number of results to return per paginated call. The largest value you can specify is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value is 1000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete (because there are more faces to retrieve), Amazon Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of faces.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSRekognitionGetFaceDetectionResponse : AWSModel


/**
 <p>An array of faces detected in the video. Each element contains a detected face's details and the time, in milliseconds from the start of the video, the face was detected. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionFaceDetection *> * _Nullable faces;

/**
 <p>The current status of the face detection job.</p>
 */
@property (nonatomic, assign) AWSRekognitionVideoJobStatus jobStatus;

/**
 <p>If the response is truncated, Amazon Rekognition returns this token that you can use in the subsequent request to retrieve the next set of faces. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>Information about a video that Amazon Rekognition Video analyzed. <code>Videometadata</code> is returned in every page of paginated responses from a Amazon Rekognition video operation.</p>
 */
@property (nonatomic, strong) AWSRekognitionVideoMetadata * _Nullable videoMetadata;

@end

/**
 
 */
@interface AWSRekognitionGetFaceSearchRequest : AWSRequest


/**
 <p>The job identifer for the search request. You get the job identifier from an initial call to <code>StartFaceSearch</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Maximum number of results to return per paginated call. The largest value you can specify is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value is 1000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete (because there is more search results to retrieve), Amazon Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of search results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Sort to use for grouping faces in the response. Use <code>TIMESTAMP</code> to group faces by the time that they are recognized. Use <code>INDEX</code> to sort by recognized faces. </p>
 */
@property (nonatomic, assign) AWSRekognitionFaceSearchSortBy sortBy;

@end

/**
 
 */
@interface AWSRekognitionGetFaceSearchResponse : AWSModel


/**
 <p>The current status of the face search job.</p>
 */
@property (nonatomic, assign) AWSRekognitionVideoJobStatus jobStatus;

/**
 <p>If the response is truncated, Amazon Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of search results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of persons, <a>PersonMatch</a>, in the video whose face(s) match the face(s) in an Amazon Rekognition collection. It also includes time information for when persons are matched in the video. You specify the input collection in an initial call to <code>StartFaceSearch</code>. Each <code>Persons</code> element includes a time the person was matched, face match details (<code>FaceMatches</code>) for matching faces in the collection, and person information (<code>Person</code>) for the matched person. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionPersonMatch *> * _Nullable persons;

/**
 <p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>Information about a video that Amazon Rekognition analyzed. <code>Videometadata</code> is returned in every page of paginated responses from a Amazon Rekognition Video operation. </p>
 */
@property (nonatomic, strong) AWSRekognitionVideoMetadata * _Nullable videoMetadata;

@end

/**
 
 */
@interface AWSRekognitionGetLabelDetectionRequest : AWSRequest


/**
 <p>Defines how to aggregate the returned results. Results can be aggregated by timestamps or segments.</p>
 */
@property (nonatomic, assign) AWSRekognitionLabelDetectionAggregateBy aggregateBy;

/**
 <p>Job identifier for the label detection operation for which you want results returned. You get the job identifer from an initial call to <code>StartlabelDetection</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Maximum number of results to return per paginated call. The largest value you can specify is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value is 1000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete (because there are more labels to retrieve), Amazon Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of labels. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Sort to use for elements in the <code>Labels</code> array. Use <code>TIMESTAMP</code> to sort array elements by the time labels are detected. Use <code>NAME</code> to alphabetically group elements for a label together. Within each label group, the array element are sorted by detection confidence. The default sort is by <code>TIMESTAMP</code>.</p>
 */
@property (nonatomic, assign) AWSRekognitionLabelDetectionSortBy sortBy;

@end

/**
 
 */
@interface AWSRekognitionGetLabelDetectionResponse : AWSModel


/**
 <p>The current status of the label detection job.</p>
 */
@property (nonatomic, assign) AWSRekognitionVideoJobStatus jobStatus;

/**
 <p>Version number of the label detection model that was used to detect labels.</p>
 */
@property (nonatomic, strong) NSString * _Nullable labelModelVersion;

/**
 <p>An array of labels detected in the video. Each element contains the detected label and the time, in milliseconds from the start of the video, that the label was detected. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionLabelDetection *> * _Nullable labels;

/**
 <p>If the response is truncated, Amazon Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of labels.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>Information about a video that Amazon Rekognition Video analyzed. <code>Videometadata</code> is returned in every page of paginated responses from a Amazon Rekognition video operation.</p>
 */
@property (nonatomic, strong) AWSRekognitionVideoMetadata * _Nullable videoMetadata;

@end

/**
 
 */
@interface AWSRekognitionGetPersonTrackingRequest : AWSRequest


/**
 <p>The identifier for a job that tracks persons in a video. You get the <code>JobId</code> from a call to <code>StartPersonTracking</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Maximum number of results to return per paginated call. The largest value you can specify is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value is 1000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete (because there are more persons to retrieve), Amazon Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of persons. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Sort to use for elements in the <code>Persons</code> array. Use <code>TIMESTAMP</code> to sort array elements by the time persons are detected. Use <code>INDEX</code> to sort by the tracked persons. If you sort by <code>INDEX</code>, the array elements for each person are sorted by detection confidence. The default sort is by <code>TIMESTAMP</code>.</p>
 */
@property (nonatomic, assign) AWSRekognitionPersonTrackingSortBy sortBy;

@end

/**
 
 */
@interface AWSRekognitionGetPersonTrackingResponse : AWSModel


/**
 <p>The current status of the person tracking job.</p>
 */
@property (nonatomic, assign) AWSRekognitionVideoJobStatus jobStatus;

/**
 <p>If the response is truncated, Amazon Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of persons. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of the persons detected in the video and the time(s) their path was tracked throughout the video. An array element will exist for each time a person's path is tracked. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionPersonDetection *> * _Nullable persons;

/**
 <p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>Information about a video that Amazon Rekognition Video analyzed. <code>Videometadata</code> is returned in every page of paginated responses from a Amazon Rekognition Video operation.</p>
 */
@property (nonatomic, strong) AWSRekognitionVideoMetadata * _Nullable videoMetadata;

@end

/**
 
 */
@interface AWSRekognitionGetSegmentDetectionRequest : AWSRequest


/**
 <p>Job identifier for the text detection operation for which you want results returned. You get the job identifer from an initial call to <code>StartSegmentDetection</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Maximum number of results to return per paginated call. The largest value you can specify is 1000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the response is truncated, Amazon Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSRekognitionGetSegmentDetectionResponse : AWSModel


/**
 <p>An array of objects. There can be multiple audio streams. Each <code>AudioMetadata</code> object contains metadata for a single audio stream. Audio information in an <code>AudioMetadata</code> objects includes the audio codec, the number of audio channels, the duration of the audio stream, and the sample rate. Audio metadata is returned in each page of information returned by <code>GetSegmentDetection</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionAudioMetadata *> * _Nullable audioMetadata;

/**
 <p>Current status of the segment detection job.</p>
 */
@property (nonatomic, assign) AWSRekognitionVideoJobStatus jobStatus;

/**
 <p>If the previous response was incomplete (because there are more labels to retrieve), Amazon Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of segments detected in a video. The array is sorted by the segment types (TECHNICAL_CUE or SHOT) specified in the <code>SegmentTypes</code> input parameter of <code>StartSegmentDetection</code>. Within each segment type the array is sorted by timestamp values.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionSegmentDetection *> * _Nullable segments;

/**
 <p>An array containing the segment types requested in the call to <code>StartSegmentDetection</code>. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionSegmentTypeInfo *> * _Nullable selectedSegmentTypes;

/**
 <p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>Currently, Amazon Rekognition Video returns a single object in the <code>VideoMetadata</code> array. The object contains information about the video stream in the input file that Amazon Rekognition Video chose to analyze. The <code>VideoMetadata</code> object includes the video codec, video format and other information. Video metadata is returned in each page of information returned by <code>GetSegmentDetection</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionVideoMetadata *> * _Nullable videoMetadata;

@end

/**
 
 */
@interface AWSRekognitionGetTextDetectionRequest : AWSRequest


/**
 <p>Job identifier for the text detection operation for which you want results returned. You get the job identifer from an initial call to <code>StartTextDetection</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Maximum number of results to return per paginated call. The largest value you can specify is 1000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete (because there are more labels to retrieve), Amazon Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSRekognitionGetTextDetectionResponse : AWSModel


/**
 <p>Current status of the text detection job.</p>
 */
@property (nonatomic, assign) AWSRekognitionVideoJobStatus jobStatus;

/**
 <p>If the response is truncated, Amazon Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>An array of text detected in the video. Each element contains the detected text, the time in milliseconds from the start of the video that the text was detected, and where it was detected on the screen.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionTextDetectionResult *> * _Nullable textDetections;

/**
 <p>Version number of the text detection model that was used to detect text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable textModelVersion;

/**
 <p>Information about a video that Amazon Rekognition analyzed. <code>Videometadata</code> is returned in every page of paginated responses from a Amazon Rekognition video operation.</p>
 */
@property (nonatomic, strong) AWSRekognitionVideoMetadata * _Nullable videoMetadata;

@end

/**
 <p>The S3 bucket that contains an Amazon Sagemaker Ground Truth format manifest file. </p>
 */
@interface AWSRekognitionGroundTruthManifest : AWSModel


/**
 <p>Provides the S3 bucket name and object name.</p><p>The region for the S3 bucket containing the S3 object must match the region you use for Amazon Rekognition operations.</p><p>For Amazon Rekognition to process an S3 object, the user must have permission to access the S3 object. For more information, see How Amazon Rekognition works with IAM in the Amazon Rekognition Developer Guide. </p>
 */
@property (nonatomic, strong) AWSRekognitionS3Object * _Nullable s3Object;

@end

/**
 <p>Shows the results of the human in the loop evaluation. If there is no HumanLoopArn, the input did not trigger human review.</p>
 */
@interface AWSRekognitionHumanLoopActivationOutput : AWSModel


/**
 <p>Shows the result of condition evaluations, including those conditions which activated a human review.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanLoopActivationConditionsEvaluationResults;

/**
 <p>Shows if and why human review was needed.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable humanLoopActivationReasons;

/**
 <p>The Amazon Resource Name (ARN) of the HumanLoop created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanLoopArn;

@end

/**
 <p>Sets up the flow definition the image will be sent to if one of the conditions is met. You can also set certain attributes of the image before review.</p>
 Required parameters: [HumanLoopName, FlowDefinitionArn]
 */
@interface AWSRekognitionHumanLoopConfig : AWSModel


/**
 <p>Sets attributes of the input data.</p>
 */
@property (nonatomic, strong) AWSRekognitionHumanLoopDataAttributes * _Nullable dataAttributes;

/**
 <p>The Amazon Resource Name (ARN) of the flow definition. You can create a flow definition by using the Amazon Sagemaker <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/API_CreateFlowDefinition.html">CreateFlowDefinition</a> Operation. </p>
 */
@property (nonatomic, strong) NSString * _Nullable flowDefinitionArn;

/**
 <p>The name of the human review used for this image. This should be kept unique within a region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanLoopName;

@end

/**
 <p>Allows you to set attributes of the image. Currently, you can declare an image as free of personally identifiable information.</p>
 */
@interface AWSRekognitionHumanLoopDataAttributes : AWSModel


/**
 <p>Sets whether the input image is free of personally identifiable information.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable contentClassifiers;

@end

/**
 <p>Provides the input image either as bytes or an S3 object.</p><p>You pass image bytes to an Amazon Rekognition API operation by using the <code>Bytes</code> property. For example, you would use the <code>Bytes</code> property to pass an image loaded from a local file system. Image bytes passed by using the <code>Bytes</code> property must be base64-encoded. Your code may not need to encode image bytes if you are using an AWS SDK to call Amazon Rekognition API operations. </p><p>For more information, see Analyzing an Image Loaded from a Local File System in the Amazon Rekognition Developer Guide.</p><p> You pass images stored in an S3 bucket to an Amazon Rekognition API operation by using the <code>S3Object</code> property. Images stored in an S3 bucket do not need to be base64-encoded.</p><p>The region for the S3 bucket containing the S3 object must match the region you use for Amazon Rekognition operations.</p><p>If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes using the Bytes property is not supported. You must first upload the image to an Amazon S3 bucket and then call the operation using the S3Object property.</p><p>For Amazon Rekognition to process an S3 object, the user must have permission to access the S3 object. For more information, see How Amazon Rekognition works with IAM in the Amazon Rekognition Developer Guide. </p>
 */
@interface AWSRekognitionImage : AWSModel


/**
 <p>Blob of image bytes up to 5 MBs.</p>
 */
@property (nonatomic, strong) NSData * _Nullable bytes;

/**
 <p>Identifies an S3 object as the image source.</p>
 */
@property (nonatomic, strong) AWSRekognitionS3Object * _Nullable s3Object;

@end

/**
 <p>Identifies face image brightness and sharpness. </p>
 */
@interface AWSRekognitionImageQuality : AWSModel


/**
 <p>Value representing brightness of the face. The service returns a value between 0 and 100 (inclusive). A higher value indicates a brighter face image.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable brightness;

/**
 <p>Value representing sharpness of the face. The service returns a value between 0 and 100 (inclusive). A higher value indicates a sharper face image.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sharpness;

@end

/**
 
 */
@interface AWSRekognitionIndexFacesRequest : AWSRequest


/**
 <p>The ID of an existing collection to which you want to add the faces that are detected in the input images.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionId;

/**
 <p>An array of facial attributes that you want to be returned. This can be the default list of attributes or all attributes. If you don't specify a value for <code>Attributes</code> or if you specify <code>["DEFAULT"]</code>, the API returns the following subset of facial attributes: <code>BoundingBox</code>, <code>Confidence</code>, <code>Pose</code>, <code>Quality</code>, and <code>Landmarks</code>. If you provide <code>["ALL"]</code>, all facial attributes are returned, but the operation takes longer to complete.</p><p>If you provide both, <code>["ALL", "DEFAULT"]</code>, the service uses a logical AND operator to determine which attributes to return (in this case, all attributes). </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable detectionAttributes;

/**
 <p>The ID you want to assign to all the faces detected in the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalImageId;

/**
 <p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes isn't supported. </p><p>If you are using an AWS SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. For more information, see Images in the Amazon Rekognition developer guide.</p>
 */
@property (nonatomic, strong) AWSRekognitionImage * _Nullable image;

/**
 <p>The maximum number of faces to index. The value of <code>MaxFaces</code> must be greater than or equal to 1. <code>IndexFaces</code> returns no more than 100 detected faces in an image, even if you specify a larger value for <code>MaxFaces</code>.</p><p>If <code>IndexFaces</code> detects more faces than the value of <code>MaxFaces</code>, the faces with the lowest quality are filtered out first. If there are still more faces than the value of <code>MaxFaces</code>, the faces with the smallest bounding boxes are filtered out (up to the number that's needed to satisfy the value of <code>MaxFaces</code>). Information about the unindexed faces is available in the <code>UnindexedFaces</code> array. </p><p>The faces that are returned by <code>IndexFaces</code> are sorted by the largest face bounding box size to the smallest size, in descending order.</p><p><code>MaxFaces</code> can be used with a collection associated with any version of the face model.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxFaces;

/**
 <p>A filter that specifies a quality bar for how much filtering is done to identify faces. Filtered faces aren't indexed. If you specify <code>AUTO</code>, Amazon Rekognition chooses the quality bar. If you specify <code>LOW</code>, <code>MEDIUM</code>, or <code>HIGH</code>, filtering removes all faces that don’t meet the chosen quality bar. The default value is <code>AUTO</code>. The quality bar is based on a variety of common use cases. Low-quality detections can occur for a number of reasons. Some examples are an object that's misidentified as a face, a face that's too blurry, or a face with a pose that's too extreme to use. If you specify <code>NONE</code>, no filtering is performed. </p><p>To use quality filtering, the collection you are using must be associated with version 3 of the face model or higher.</p>
 */
@property (nonatomic, assign) AWSRekognitionQualityFilter qualityFilter;

@end

/**
 
 */
@interface AWSRekognitionIndexFacesResponse : AWSModel


/**
 <p>The version number of the face detection model that's associated with the input collection (<code>CollectionId</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable faceModelVersion;

/**
 <p>An array of faces detected and added to the collection. For more information, see Searching Faces in a Collection in the Amazon Rekognition Developer Guide. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionFaceRecord *> * _Nullable faceRecords;

/**
 <p>If your collection is associated with a face detection model that's later than version 3.0, the value of <code>OrientationCorrection</code> is always null and no orientation information is returned.</p><p>If your collection is associated with a face detection model that's version 3.0 or earlier, the following applies:</p><ul><li><p>If the input image is in .jpeg format, it might contain exchangeable image file format (Exif) metadata that includes the image's orientation. Amazon Rekognition uses this orientation information to perform image correction - the bounding box coordinates are translated to represent object locations after the orientation information in the Exif metadata is used to correct the image orientation. Images in .png format don't contain Exif metadata. The value of <code>OrientationCorrection</code> is null.</p></li><li><p>If the image doesn't contain orientation information in its Exif metadata, Amazon Rekognition returns an estimated orientation (ROTATE_0, ROTATE_90, ROTATE_180, ROTATE_270). Amazon Rekognition doesn’t perform image correction for images. The bounding box coordinates aren't translated and represent the object locations before the image is rotated.</p></li></ul><p>Bounding box information is returned in the <code>FaceRecords</code> array. You can get the version of the face detection model by calling <a>DescribeCollection</a>. </p>
 */
@property (nonatomic, assign) AWSRekognitionOrientationCorrection orientationCorrection;

/**
 <p>An array of faces that were detected in the image but weren't indexed. They weren't indexed because the quality filter identified them as low quality, or the <code>MaxFaces</code> request parameter filtered them out. To use the quality filter, you specify the <code>QualityFilter</code> request parameter.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionUnindexedFace *> * _Nullable unindexedFaces;

@end

/**
 <p>An instance of a label returned by Amazon Rekognition Image (<a>DetectLabels</a>) or by Amazon Rekognition Video (<a>GetLabelDetection</a>).</p>
 */
@interface AWSRekognitionInstance : AWSModel


/**
 <p>The position of the label instance on the image.</p>
 */
@property (nonatomic, strong) AWSRekognitionBoundingBox * _Nullable boundingBox;

/**
 <p>The confidence that Amazon Rekognition has in the accuracy of the bounding box.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>The dominant colors found in an individual instance of a label.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionDominantColor *> * _Nullable dominantColors;

@end

/**
 <p>The Kinesis data stream Amazon Rekognition to which the analysis results of a Amazon Rekognition stream processor are streamed. For more information, see CreateStreamProcessor in the Amazon Rekognition Developer Guide.</p>
 */
@interface AWSRekognitionKinesisDataStream : AWSModel


/**
 <p>ARN of the output Amazon Kinesis Data Streams stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 <p>Kinesis video stream stream that provides the source streaming video for a Amazon Rekognition Video stream processor. For more information, see CreateStreamProcessor in the Amazon Rekognition Developer Guide.</p>
 */
@interface AWSRekognitionKinesisVideoStream : AWSModel


/**
 <p>ARN of the Kinesis video stream stream that streams the source video.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 <p>Specifies the starting point in a Kinesis stream to start processing. You can use the producer timestamp or the fragment number. One of either producer timestamp or fragment number is required. If you use the producer timestamp, you must put the time in milliseconds. For more information about fragment numbers, see <a href="https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/API_reader_Fragment.html">Fragment</a>. </p>
 */
@interface AWSRekognitionKinesisVideoStreamStartSelector : AWSModel


/**
 <p> The unique identifier of the fragment. This value monotonically increases based on the ingestion order. </p>
 */
@property (nonatomic, strong) NSString * _Nullable fragmentNumber;

/**
 <p> The timestamp from the producer corresponding to the fragment, in milliseconds, expressed in unix time format. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable producerTimestamp;

@end

/**
 <p>The known gender identity for the celebrity that matches the provided ID. The known gender identity can be Male, Female, Nonbinary, or Unlisted.</p>
 */
@interface AWSRekognitionKnownGender : AWSModel


/**
 <p>A string value of the KnownGender info about the Celebrity.</p>
 */
@property (nonatomic, assign) AWSRekognitionKnownGenderType types;

@end

/**
 <p>Structure containing details about the detected label, including the name, detected instances, parent labels, and level of confidence.</p><p></p>
 */
@interface AWSRekognitionLabel : AWSModel


/**
 <p>A list of potential aliases for a given label.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionLabelAlias *> * _Nullable aliases;

/**
 <p>A list of the categories associated with a given label.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionLabelCategory *> * _Nullable categories;

/**
 <p>Level of confidence.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>If <code>Label</code> represents an object, <code>Instances</code> contains the bounding boxes for each instance of the detected object. Bounding boxes are returned for common object labels such as people, cars, furniture, apparel or pets.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionInstance *> * _Nullable instances;

/**
 <p>The name (label) of the object or scene.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The parent labels for a label. The response includes all ancestor labels.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionParent *> * _Nullable parents;

@end

/**
 <p>A potential alias of for a given label.</p>
 */
@interface AWSRekognitionLabelAlias : AWSModel


/**
 <p>The name of an alias for a given label.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The category that applies to a given label.</p>
 */
@interface AWSRekognitionLabelCategory : AWSModel


/**
 <p>The name of a category that applies to a given label.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Information about a label detected in a video analysis request and the time the label was detected in the video. </p>
 */
@interface AWSRekognitionLabelDetection : AWSModel


/**
 <p>The time duration of a segment in milliseconds, I.e. time elapsed from StartTimestampMillis to EndTimestampMillis.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationMillis;

/**
 <p>The time in milliseconds defining the end of the timeline segment containing a continuously detected label.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endTimestampMillis;

/**
 <p>Details about the detected label.</p>
 */
@property (nonatomic, strong) AWSRekognitionLabel * _Nullable label;

/**
 <p>The time in milliseconds defining the start of the timeline segment containing a continuously detected label.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startTimestampMillis;

/**
 <p>Time, in milliseconds from the start of the video, that the label was detected. Note that <code>Timestamp</code> is not guaranteed to be accurate to the individual frame where the label first appears.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timestamp;

@end

/**
 <p>Contains the specified filters that should be applied to a list of returned GENERAL_LABELS.</p>
 */
@interface AWSRekognitionLabelDetectionSettings : AWSModel


/**
 <p>Contains filters for the object labels returned by DetectLabels. Filters can be inclusive, exclusive, or a combination of both and can be applied to individual l abels or entire label categories.</p>
 */
@property (nonatomic, strong) AWSRekognitionGeneralLabelsSettings * _Nullable generalLabels;

@end

/**
 <p>Indicates the location of the landmark on the face.</p>
 */
@interface AWSRekognitionLandmark : AWSModel


/**
 <p>Type of landmark.</p>
 */
@property (nonatomic, assign) AWSRekognitionLandmarkType types;

/**
 <p>The x-coordinate of the landmark expressed as a ratio of the width of the image. The x-coordinate is measured from the left-side of the image. For example, if the image is 700 pixels wide and the x-coordinate of the landmark is at 350 pixels, this value is 0.5. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable X;

/**
 <p>The y-coordinate of the landmark expressed as a ratio of the height of the image. The y-coordinate is measured from the top of the image. For example, if the image height is 200 pixels and the y-coordinate of the landmark is at 50 pixels, this value is 0.25.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable Y;

@end

/**
 
 */
@interface AWSRekognitionListCollectionsRequest : AWSRequest


/**
 <p>Maximum number of collection IDs to return. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Pagination token from the previous response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSRekognitionListCollectionsResponse : AWSModel


/**
 <p>An array of collection IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable collectionIds;

/**
 <p>Version numbers of the face detection models associated with the collections in the array <code>CollectionIds</code>. For example, the value of <code>FaceModelVersions[2]</code> is the version number for the face detection model used by the collection in <code>CollectionId[2]</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable faceModelVersions;

/**
 <p>If the result is truncated, the response provides a <code>NextToken</code> that you can use in the subsequent request to fetch the next set of collection IDs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSRekognitionListDatasetEntriesRequest : AWSRequest


/**
 <p>Specifies a label filter for the response. The response includes an entry only if one or more of the labels in <code>ContainsLabels</code> exist in the entry. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable containsLabels;

/**
 <p> The Amazon Resource Name (ARN) for the dataset that you want to use. </p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetArn;

/**
 <p>Specifies an error filter for the response. Specify <code>True</code> to only include entries that have errors. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasErrors;

/**
 <p> Specify <code>true</code> to get only the JSON Lines where the image is labeled. Specify <code>false</code> to get only the JSON Lines where the image isn't labeled. If you don't specify <code>Labeled</code>, <code>ListDatasetEntries</code> returns JSON Lines for labeled and unlabeled images. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable labeled;

/**
 <p>The maximum number of results to return per paginated call. The largest value you can specify is 100. If you specify a value greater than 100, a ValidationException error occurs. The default value is 100. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete (because there is more results to retrieve), Amazon Rekognition Custom Labels returns a pagination token in the response. You can use this pagination token to retrieve the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>If specified, <code>ListDatasetEntries</code> only returns JSON Lines where the value of <code>SourceRefContains</code> is part of the <code>source-ref</code> field. The <code>source-ref</code> field contains the Amazon S3 location of the image. You can use <code>SouceRefContains</code> for tasks such as getting the JSON Line for a single image, or gettting JSON Lines for all images within a specific folder.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceRefContains;

@end

/**
 
 */
@interface AWSRekognitionListDatasetEntriesResponse : AWSModel


/**
 <p> A list of entries (images) in the dataset. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable datasetEntries;

/**
 <p>If the previous response was incomplete (because there is more results to retrieve), Amazon Rekognition Custom Labels returns a pagination token in the response. You can use this pagination token to retrieve the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSRekognitionListDatasetLabelsRequest : AWSRequest


/**
 <p> The Amazon Resource Name (ARN) of the dataset that you want to use. </p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetArn;

/**
 <p>The maximum number of results to return per paginated call. The largest value you can specify is 100. If you specify a value greater than 100, a ValidationException error occurs. The default value is 100. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete (because there is more results to retrieve), Amazon Rekognition Custom Labels returns a pagination token in the response. You can use this pagination token to retrieve the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSRekognitionListDatasetLabelsResponse : AWSModel


/**
 <p> A list of the labels in the dataset. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionDatasetLabelDescription *> * _Nullable datasetLabelDescriptions;

/**
 <p>If the previous response was incomplete (because there is more results to retrieve), Amazon Rekognition Custom Labels returns a pagination token in the response. You can use this pagination token to retrieve the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSRekognitionListFacesRequest : AWSRequest


/**
 <p>ID of the collection from which to list the faces.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionId;

/**
 <p>Maximum number of faces to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete (because there is more data to retrieve), Amazon Rekognition returns a pagination token in the response. You can use this pagination token to retrieve the next set of faces.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSRekognitionListFacesResponse : AWSModel


/**
 <p>Version number of the face detection model associated with the input collection (<code>CollectionId</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable faceModelVersion;

/**
 <p>An array of <code>Face</code> objects. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionFace *> * _Nullable faces;

/**
 <p>If the response is truncated, Amazon Rekognition returns this token that you can use in the subsequent request to retrieve the next set of faces.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSRekognitionListProjectPoliciesRequest : AWSRequest


/**
 <p>The maximum number of results to return per paginated call. The largest value you can specify is 5. If you specify a value greater than 5, a ValidationException error occurs. The default value is 5. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete (because there is more results to retrieve), Amazon Rekognition Custom Labels returns a pagination token in the response. You can use this pagination token to retrieve the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ARN of the project for which you want to list the project policies.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectArn;

@end

/**
 
 */
@interface AWSRekognitionListProjectPoliciesResponse : AWSModel


/**
 <p>If the response is truncated, Amazon Rekognition returns this token that you can use in the subsequent request to retrieve the next set of project policies.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of project policies attached to the project.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionProjectPolicy *> * _Nullable projectPolicies;

@end

/**
 
 */
@interface AWSRekognitionListStreamProcessorsRequest : AWSRequest


/**
 <p>Maximum number of stream processors you want Amazon Rekognition Video to return in the response. The default is 1000. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete (because there are more stream processors to retrieve), Amazon Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of stream processors. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSRekognitionListStreamProcessorsResponse : AWSModel


/**
 <p>If the response is truncated, Amazon Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of stream processors. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>List of stream processors that you have created.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionStreamProcessor *> * _Nullable streamProcessors;

@end

/**
 
 */
@interface AWSRekognitionListTagsForResourceRequest : AWSRequest


/**
 <p> Amazon Resource Name (ARN) of the model, collection, or stream processor that contains the tags that you want a list of. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSRekognitionListTagsForResourceResponse : AWSModel


/**
 <p> A list of key-value tags assigned to the resource. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Provides information about a single type of inappropriate, unwanted, or offensive content found in an image or video. Each type of moderated content has a label within a hierarchical taxonomy. For more information, see Content moderation in the Amazon Rekognition Developer Guide.</p>
 */
@interface AWSRekognitionModerationLabel : AWSModel


/**
 <p>Specifies the confidence that Amazon Rekognition has that the label has been correctly identified.</p><p>If you don't specify the <code>MinConfidence</code> parameter in the call to <code>DetectModerationLabels</code>, the operation returns labels with a confidence value greater than or equal to 50 percent.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>The label name for the type of unsafe content detected in the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The name for the parent label. Labels at the top level of the hierarchy have the parent label <code>""</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentName;

@end

/**
 <p>Indicates whether or not the mouth on the face is open, and the confidence level in the determination.</p>
 */
@interface AWSRekognitionMouthOpen : AWSModel


/**
 <p>Level of confidence in the determination.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>Boolean value that indicates whether the mouth on the face is open or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 <p>Indicates whether or not the face has a mustache, and the confidence level in the determination.</p>
 */
@interface AWSRekognitionMustache : AWSModel


/**
 <p>Level of confidence in the determination.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>Boolean value that indicates whether the face has mustache or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 <p>The Amazon Simple Notification Service topic to which Amazon Rekognition publishes the completion status of a video analysis operation. For more information, see <a href="https://docs.aws.amazon.com/rekognition/latest/dg/api-video.html">Calling Amazon Rekognition Video operations</a>. Note that the Amazon SNS topic must have a topic name that begins with <i>AmazonRekognition</i> if you are using the AmazonRekognitionServiceRole permissions policy to access the topic. For more information, see <a href="https://docs.aws.amazon.com/rekognition/latest/dg/api-video-roles.html#api-video-roles-all-topics">Giving access to multiple Amazon SNS topics</a>.</p>
 Required parameters: [SNSTopicArn, RoleArn]
 */
@interface AWSRekognitionNotificationChannel : AWSModel


/**
 <p>The ARN of an IAM role that gives Amazon Rekognition publishing permissions to the Amazon SNS topic. </p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The Amazon SNS topic to which Amazon Rekognition posts the completion status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SNSTopicArn;

@end

/**
 <p>The S3 bucket and folder location where training output is placed.</p>
 */
@interface AWSRekognitionOutputConfig : AWSModel


/**
 <p>The S3 bucket where training output is placed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

/**
 <p>The prefix applied to the training output files. </p>
 */
@property (nonatomic, strong) NSString * _Nullable s3KeyPrefix;

@end

/**
 <p>A parent label for a label. A label can have 0, 1, or more parents. </p>
 */
@interface AWSRekognitionParent : AWSModel


/**
 <p>The name of the parent label.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Details about a person detected in a video analysis request.</p>
 */
@interface AWSRekognitionPersonDetail : AWSModel


/**
 <p>Bounding box around the detected person.</p>
 */
@property (nonatomic, strong) AWSRekognitionBoundingBox * _Nullable boundingBox;

/**
 <p>Face details for the detected person.</p>
 */
@property (nonatomic, strong) AWSRekognitionFaceDetail * _Nullable face;

/**
 <p>Identifier for the person detected person within a video. Use to keep track of the person throughout the video. The identifier is not stored by Amazon Rekognition.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable index;

@end

/**
 <p>Details and path tracking information for a single time a person's path is tracked in a video. Amazon Rekognition operations that track people's paths return an array of <code>PersonDetection</code> objects with elements for each time a person's path is tracked in a video. </p><p>For more information, see GetPersonTracking in the Amazon Rekognition Developer Guide. </p>
 */
@interface AWSRekognitionPersonDetection : AWSModel


/**
 <p>Details about a person whose path was tracked in a video.</p>
 */
@property (nonatomic, strong) AWSRekognitionPersonDetail * _Nullable person;

/**
 <p>The time, in milliseconds from the start of the video, that the person's path was tracked. Note that <code>Timestamp</code> is not guaranteed to be accurate to the individual frame where the person's path first appears.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timestamp;

@end

/**
 <p>Information about a person whose face matches a face(s) in an Amazon Rekognition collection. Includes information about the faces in the Amazon Rekognition collection (<a>FaceMatch</a>), information about the person (<a>PersonDetail</a>), and the time stamp for when the person was detected in a video. An array of <code>PersonMatch</code> objects is returned by <a>GetFaceSearch</a>. </p>
 */
@interface AWSRekognitionPersonMatch : AWSModel


/**
 <p>Information about the faces in the input collection that match the face of a person in the video.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionFaceMatch *> * _Nullable faceMatches;

/**
 <p>Information about the matched person.</p>
 */
@property (nonatomic, strong) AWSRekognitionPersonDetail * _Nullable person;

/**
 <p>The time, in milliseconds from the beginning of the video, that the person was matched in the video.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timestamp;

@end

/**
 <p>The X and Y coordinates of a point on an image or video frame. The X and Y values are ratios of the overall image size or video resolution. For example, if an input image is 700x200 and the values are X=0.5 and Y=0.25, then the point is at the (350,50) pixel coordinate on the image.</p><p>An array of <code>Point</code> objects makes up a <code>Polygon</code>. A <code>Polygon</code> is returned by <a>DetectText</a> and by <a>DetectCustomLabels</a><code>Polygon</code> represents a fine-grained polygon around a detected item. For more information, see Geometry in the Amazon Rekognition Developer Guide. </p>
 */
@interface AWSRekognitionPoint : AWSModel


/**
 <p>The value of the X coordinate for a point on a <code>Polygon</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable X;

/**
 <p>The value of the Y coordinate for a point on a <code>Polygon</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable Y;

@end

/**
 <p>Indicates the pose of the face as determined by its pitch, roll, and yaw.</p>
 */
@interface AWSRekognitionPose : AWSModel


/**
 <p>Value representing the face rotation on the pitch axis.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pitch;

/**
 <p>Value representing the face rotation on the roll axis.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable roll;

/**
 <p>Value representing the face rotation on the yaw axis.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable yaw;

@end

/**
 <p>A description of an Amazon Rekognition Custom Labels project. For more information, see <a>DescribeProjects</a>.</p>
 */
@interface AWSRekognitionProjectDescription : AWSModel


/**
 <p>The Unix timestamp for the date and time that the project was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimestamp;

/**
 <p> Information about the training and test datasets in the project. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionDatasetMetadata *> * _Nullable datasets;

/**
 <p>The Amazon Resource Name (ARN) of the project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectArn;

/**
 <p>The current status of the project.</p>
 */
@property (nonatomic, assign) AWSRekognitionProjectStatus status;

@end

/**
 <p>Describes a project policy in the response from <a>ListProjectPolicies</a>. </p><p></p>
 */
@interface AWSRekognitionProjectPolicy : AWSModel


/**
 <p>The Unix datetime for the creation of the project policy.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimestamp;

/**
 <p>The Unix datetime for when the project policy was last updated. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTimestamp;

/**
 <p>The JSON document for the project policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The name of the project policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The revision ID of the project policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyRevisionId;

/**
 <p>The Amazon Resource Name (ARN) of the project to which the project policy is attached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectArn;

@end

/**
 <p>A description of a version of an Amazon Rekognition Custom Labels model.</p>
 */
@interface AWSRekognitionProjectVersionDescription : AWSModel


/**
 <p>The duration, in seconds, that you were billed for a successful training of the model version. This value is only returned if the model version has been successfully trained.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable billableTrainingTimeInSeconds;

/**
 <p>The Unix datetime for the date and time that training started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimestamp;

/**
 <p>The training results. <code>EvaluationResult</code> is only returned if training is successful.</p>
 */
@property (nonatomic, strong) AWSRekognitionEvaluationResult * _Nullable evaluationResult;

/**
 <p>The identifer for the AWS Key Management Service key (AWS KMS key) that was used to encrypt the model during training. </p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The location of the summary manifest. The summary manifest provides aggregate data validation results for the training and test datasets.</p>
 */
@property (nonatomic, strong) AWSRekognitionGroundTruthManifest * _Nullable manifestSummary;

/**
 <p>The maximum number of inference units Amazon Rekognition Custom Labels uses to auto-scale the model. For more information, see <a>StartProjectVersion</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxInferenceUnits;

/**
 <p>The minimum number of inference units used by the model. For more information, see <a>StartProjectVersion</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minInferenceUnits;

/**
 <p>The location where training results are saved.</p>
 */
@property (nonatomic, strong) AWSRekognitionOutputConfig * _Nullable outputConfig;

/**
 <p>The Amazon Resource Name (ARN) of the model version. </p>
 */
@property (nonatomic, strong) NSString * _Nullable projectVersionArn;

/**
 <p>If the model version was copied from a different project, <code>SourceProjectVersionArn</code> contains the ARN of the source model version. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceProjectVersionArn;

/**
 <p>The current status of the model version.</p>
 */
@property (nonatomic, assign) AWSRekognitionProjectVersionStatus status;

/**
 <p>A descriptive message for an error or warning that occurred.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>Contains information about the testing results.</p>
 */
@property (nonatomic, strong) AWSRekognitionTestingDataResult * _Nullable testingDataResult;

/**
 <p>Contains information about the training results.</p>
 */
@property (nonatomic, strong) AWSRekognitionTrainingDataResult * _Nullable trainingDataResult;

/**
 <p>The Unix date and time that training of the model ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable trainingEndTimestamp;

@end

/**
 <p>Information about a body part detected by <a>DetectProtectiveEquipment</a> that contains PPE. An array of <code>ProtectiveEquipmentBodyPart</code> objects is returned for each person detected by <code>DetectProtectiveEquipment</code>. </p>
 */
@interface AWSRekognitionProtectiveEquipmentBodyPart : AWSModel


/**
 <p>The confidence that Amazon Rekognition has in the detection accuracy of the detected body part. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>An array of Personal Protective Equipment items detected around a body part.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionEquipmentDetection *> * _Nullable equipmentDetections;

/**
 <p>The detected body part.</p>
 */
@property (nonatomic, assign) AWSRekognitionBodyPart name;

@end

/**
 <p>A person detected by a call to <a>DetectProtectiveEquipment</a>. The API returns all persons detected in the input image in an array of <code>ProtectiveEquipmentPerson</code> objects.</p>
 */
@interface AWSRekognitionProtectiveEquipmentPerson : AWSModel


/**
 <p>An array of body parts detected on a person's body (including body parts without PPE). </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionProtectiveEquipmentBodyPart *> * _Nullable bodyParts;

/**
 <p>A bounding box around the detected person.</p>
 */
@property (nonatomic, strong) AWSRekognitionBoundingBox * _Nullable boundingBox;

/**
 <p>The confidence that Amazon Rekognition has that the bounding box contains a person.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>The identifier for the detected person. The identifier is only unique for a single call to <code>DetectProtectiveEquipment</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable identifier;

@end

/**
 <p>Specifies summary attributes to return from a call to <a>DetectProtectiveEquipment</a>. You can specify which types of PPE to summarize. You can also specify a minimum confidence value for detections. Summary information is returned in the <code>Summary</code> (<a>ProtectiveEquipmentSummary</a>) field of the response from <code>DetectProtectiveEquipment</code>. The summary includes which persons in an image were detected wearing the requested types of person protective equipment (PPE), which persons were detected as not wearing PPE, and the persons in which a determination could not be made. For more information, see <a>ProtectiveEquipmentSummary</a>.</p>
 Required parameters: [MinConfidence, RequiredEquipmentTypes]
 */
@interface AWSRekognitionProtectiveEquipmentSummarizationAttributes : AWSModel


/**
 <p>The minimum confidence level for which you want summary information. The confidence level applies to person detection, body part detection, equipment detection, and body part coverage. Amazon Rekognition doesn't return summary information with a confidence than this specified value. There isn't a default value.</p><p>Specify a <code>MinConfidence</code> value that is between 50-100% as <code>DetectProtectiveEquipment</code> returns predictions only where the detection confidence is between 50% - 100%. If you specify a value that is less than 50%, the results are the same specifying a value of 50%.</p><p></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minConfidence;

/**
 <p>An array of personal protective equipment types for which you want summary information. If a person is detected wearing a required requipment type, the person's ID is added to the <code>PersonsWithRequiredEquipment</code> array field returned in <a>ProtectiveEquipmentSummary</a> by <code>DetectProtectiveEquipment</code>. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable requiredEquipmentTypes;

@end

/**
 <p>Summary information for required items of personal protective equipment (PPE) detected on persons by a call to <a>DetectProtectiveEquipment</a>. You specify the required type of PPE in the <code>SummarizationAttributes</code> (<a>ProtectiveEquipmentSummarizationAttributes</a>) input parameter. The summary includes which persons were detected wearing the required personal protective equipment (<code>PersonsWithRequiredEquipment</code>), which persons were detected as not wearing the required PPE (<code>PersonsWithoutRequiredEquipment</code>), and the persons in which a determination could not be made (<code>PersonsIndeterminate</code>).</p><p>To get a total for each category, use the size of the field array. For example, to find out how many people were detected as wearing the specified PPE, use the size of the <code>PersonsWithRequiredEquipment</code> array. If you want to find out more about a person, such as the location (<a>BoundingBox</a>) of the person on the image, use the person ID in each array element. Each person ID matches the ID field of a <a>ProtectiveEquipmentPerson</a> object returned in the <code>Persons</code> array by <code>DetectProtectiveEquipment</code>.</p>
 */
@interface AWSRekognitionProtectiveEquipmentSummary : AWSModel


/**
 <p>An array of IDs for persons where it was not possible to determine if they are wearing personal protective equipment. </p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable personsIndeterminate;

/**
 <p>An array of IDs for persons who are wearing detected personal protective equipment. </p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable personsWithRequiredEquipment;

/**
 <p>An array of IDs for persons who are not wearing all of the types of PPE specified in the <code>RequiredEquipmentTypes</code> field of the detected personal protective equipment. </p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable personsWithoutRequiredEquipment;

@end

/**
 
 */
@interface AWSRekognitionPutProjectPolicyRequest : AWSRequest


/**
 <p>A resource policy to add to the model. The policy is a JSON structure that contains one or more statements that define the policy. The policy must follow the IAM syntax. For more information about the contents of a JSON policy document, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html">IAM JSON policy reference</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>A name for the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The revision ID for the Project Policy. Each time you modify a policy, Amazon Rekognition Custom Labels generates and assigns a new <code>PolicyRevisionId</code> and then deletes the previous version of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyRevisionId;

/**
 <p>The Amazon Resource Name (ARN) of the project that the project policy is attached to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectArn;

@end

/**
 
 */
@interface AWSRekognitionPutProjectPolicyResponse : AWSModel


/**
 <p>The ID of the project policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyRevisionId;

@end

/**
 
 */
@interface AWSRekognitionRecognizeCelebritiesRequest : AWSRequest


/**
 <p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported. </p><p>If you are using an AWS SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. For more information, see Images in the Amazon Rekognition developer guide.</p>
 */
@property (nonatomic, strong) AWSRekognitionImage * _Nullable image;

@end

/**
 
 */
@interface AWSRekognitionRecognizeCelebritiesResponse : AWSModel


/**
 <p>Details about each celebrity found in the image. Amazon Rekognition can detect a maximum of 64 celebrities in an image. Each celebrity object includes the following attributes: <code>Face</code>, <code>Confidence</code>, <code>Emotions</code>, <code>Landmarks</code>, <code>Pose</code>, <code>Quality</code>, <code>Smile</code>, <code>Id</code>, <code>KnownGender</code>, <code>MatchConfidence</code>, <code>Name</code>, <code>Urls</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionCelebrity *> * _Nullable celebrityFaces;

/**
 <note><p>Support for estimating image orientation using the the OrientationCorrection field has ceased as of August 2021. Any returned values for this field included in an API response will always be NULL.</p></note><p>The orientation of the input image (counterclockwise direction). If your application displays the image, you can use this value to correct the orientation. The bounding box coordinates returned in <code>CelebrityFaces</code> and <code>UnrecognizedFaces</code> represent face locations before the image orientation is corrected. </p><note><p>If the input image is in .jpeg format, it might contain exchangeable image (Exif) metadata that includes the image's orientation. If so, and the Exif metadata for the input image populates the orientation field, the value of <code>OrientationCorrection</code> is null. The <code>CelebrityFaces</code> and <code>UnrecognizedFaces</code> bounding box coordinates represent face locations after Exif metadata is used to correct the image orientation. Images in .png format don't contain Exif metadata. </p></note>
 */
@property (nonatomic, assign) AWSRekognitionOrientationCorrection orientationCorrection;

/**
 <p>Details about each unrecognized face in the image.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionComparedFace *> * _Nullable unrecognizedFaces;

@end

/**
 <p>Specifies a location within the frame that Rekognition checks for objects of interest such as text, labels, or faces. It uses a <code>BoundingBox</code> or <code>Polygon</code> to set a region of the screen.</p><p>A word, face, or label is included in the region if it is more than half in that region. If there is more than one region, the word, face, or label is compared with all regions of the screen. Any object of interest that is more than half in a region is kept in the results.</p>
 */
@interface AWSRekognitionRegionOfInterest : AWSModel


/**
 <p>The box representing a region of interest on screen.</p>
 */
@property (nonatomic, strong) AWSRekognitionBoundingBox * _Nullable boundingBox;

/**
 <p> Specifies a shape made up of up to 10 <code>Point</code> objects to define a region of interest. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionPoint *> * _Nullable polygon;

@end

/**
 <p> The Amazon S3 bucket location to which Amazon Rekognition publishes the detailed inference results of a video analysis operation. These results include the name of the stream processor resource, the session ID of the stream processing session, and labeled timestamps and bounding boxes for detected labels. </p>
 */
@interface AWSRekognitionS3Destination : AWSModel


/**
 <p> The name of the Amazon S3 bucket you want to associate with the streaming video project. You must be the owner of the Amazon S3 bucket. </p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p> The prefix value of the location within the bucket that you want the information to be published to. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-prefixes.html">Using prefixes</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable keyPrefix;

@end

/**
 <p>Provides the S3 bucket name and object name.</p><p>The region for the S3 bucket containing the S3 object must match the region you use for Amazon Rekognition operations.</p><p>For Amazon Rekognition to process an S3 object, the user must have permission to access the S3 object. For more information, see How Amazon Rekognition works with IAM in the Amazon Rekognition Developer Guide. </p>
 */
@interface AWSRekognitionS3Object : AWSModel


/**
 <p>Name of the S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>S3 object key name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>If the bucket is versioning enabled, you can specify the object version. </p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSRekognitionSearchFacesByImageRequest : AWSRequest


/**
 <p>ID of the collection to search.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionId;

/**
 <p>(Optional) Specifies the minimum confidence in the face match to return. For example, don't return any matches where confidence in matches is less than 70%. The default value is 80%.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable faceMatchThreshold;

/**
 <p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported. </p><p>If you are using an AWS SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. For more information, see Images in the Amazon Rekognition developer guide.</p>
 */
@property (nonatomic, strong) AWSRekognitionImage * _Nullable image;

/**
 <p>Maximum number of faces to return. The operation returns the maximum number of faces with the highest confidence in the match.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxFaces;

/**
 <p>A filter that specifies a quality bar for how much filtering is done to identify faces. Filtered faces aren't searched for in the collection. If you specify <code>AUTO</code>, Amazon Rekognition chooses the quality bar. If you specify <code>LOW</code>, <code>MEDIUM</code>, or <code>HIGH</code>, filtering removes all faces that don’t meet the chosen quality bar. The quality bar is based on a variety of common use cases. Low-quality detections can occur for a number of reasons. Some examples are an object that's misidentified as a face, a face that's too blurry, or a face with a pose that's too extreme to use. If you specify <code>NONE</code>, no filtering is performed. The default value is <code>NONE</code>. </p><p>To use quality filtering, the collection you are using must be associated with version 3 of the face model or higher.</p>
 */
@property (nonatomic, assign) AWSRekognitionQualityFilter qualityFilter;

@end

/**
 
 */
@interface AWSRekognitionSearchFacesByImageResponse : AWSModel


/**
 <p>An array of faces that match the input face, along with the confidence in the match.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionFaceMatch *> * _Nullable faceMatches;

/**
 <p>Version number of the face detection model associated with the input collection (<code>CollectionId</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable faceModelVersion;

/**
 <p>The bounding box around the face in the input image that Amazon Rekognition used for the search.</p>
 */
@property (nonatomic, strong) AWSRekognitionBoundingBox * _Nullable searchedFaceBoundingBox;

/**
 <p>The level of confidence that the <code>searchedFaceBoundingBox</code>, contains a face.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable searchedFaceConfidence;

@end

/**
 
 */
@interface AWSRekognitionSearchFacesRequest : AWSRequest


/**
 <p>ID of the collection the face belongs to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionId;

/**
 <p>ID of a face to find matches for in the collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable faceId;

/**
 <p>Optional value specifying the minimum confidence in the face match to return. For example, don't return any matches where confidence in matches is less than 70%. The default value is 80%. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable faceMatchThreshold;

/**
 <p>Maximum number of faces to return. The operation returns the maximum number of faces with the highest confidence in the match.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxFaces;

@end

/**
 
 */
@interface AWSRekognitionSearchFacesResponse : AWSModel


/**
 <p>An array of faces that matched the input face, along with the confidence in the match.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionFaceMatch *> * _Nullable faceMatches;

/**
 <p>Version number of the face detection model associated with the input collection (<code>CollectionId</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable faceModelVersion;

/**
 <p>ID of the face that was searched for matches in a collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable searchedFaceId;

@end

/**
 <p>A technical cue or shot detection segment detected in a video. An array of <code>SegmentDetection</code> objects containing all segments detected in a stored video is returned by <a>GetSegmentDetection</a>. </p>
 */
@interface AWSRekognitionSegmentDetection : AWSModel


/**
 <p> The duration of a video segment, expressed in frames. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationFrames;

/**
 <p>The duration of the detected segment in milliseconds. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationMillis;

/**
 <p>The duration of the timecode for the detected segment in SMPTE format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable durationSMPTE;

/**
 <p> The frame number at the end of a video segment, using a frame index that starts with 0. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endFrameNumber;

/**
 <p>The frame-accurate SMPTE timecode, from the start of a video, for the end of a detected segment. <code>EndTimecode</code> is in <i>HH:MM:SS:fr</i> format (and <i>;fr</i> for drop frame-rates).</p>
 */
@property (nonatomic, strong) NSString * _Nullable endTimecodeSMPTE;

/**
 <p>The end time of the detected segment, in milliseconds, from the start of the video. This value is rounded down.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endTimestampMillis;

/**
 <p>If the segment is a shot detection, contains information about the shot detection.</p>
 */
@property (nonatomic, strong) AWSRekognitionShotSegment * _Nullable shotSegment;

/**
 <p> The frame number of the start of a video segment, using a frame index that starts with 0. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startFrameNumber;

/**
 <p>The frame-accurate SMPTE timecode, from the start of a video, for the start of a detected segment. <code>StartTimecode</code> is in <i>HH:MM:SS:fr</i> format (and <i>;fr</i> for drop frame-rates). </p>
 */
@property (nonatomic, strong) NSString * _Nullable startTimecodeSMPTE;

/**
 <p>The start time of the detected segment in milliseconds from the start of the video. This value is rounded down. For example, if the actual timestamp is 100.6667 milliseconds, Amazon Rekognition Video returns a value of 100 millis.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startTimestampMillis;

/**
 <p>If the segment is a technical cue, contains information about the technical cue.</p>
 */
@property (nonatomic, strong) AWSRekognitionTechnicalCueSegment * _Nullable technicalCueSegment;

/**
 <p>The type of the segment. Valid values are <code>TECHNICAL_CUE</code> and <code>SHOT</code>.</p>
 */
@property (nonatomic, assign) AWSRekognitionSegmentType types;

@end

/**
 <p>Information about the type of a segment requested in a call to <a>StartSegmentDetection</a>. An array of <code>SegmentTypeInfo</code> objects is returned by the response from <a>GetSegmentDetection</a>.</p>
 */
@interface AWSRekognitionSegmentTypeInfo : AWSModel


/**
 <p>The version of the model used to detect segments.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelVersion;

/**
 <p>The type of a segment (technical cue or shot detection).</p>
 */
@property (nonatomic, assign) AWSRekognitionSegmentType types;

@end

/**
 <p>Information about a shot detection segment detected in a video. For more information, see <a>SegmentDetection</a>.</p>
 */
@interface AWSRekognitionShotSegment : AWSModel


/**
 <p>The confidence that Amazon Rekognition Video has in the accuracy of the detected segment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>An Identifier for a shot detection segment detected in a video. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable index;

@end

/**
 <p>Indicates whether or not the face is smiling, and the confidence level in the determination.</p>
 */
@interface AWSRekognitionSmile : AWSModel


/**
 <p>Level of confidence in the determination.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>Boolean value that indicates whether the face is smiling or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 
 */
@interface AWSRekognitionStartCelebrityRecognitionRequest : AWSRequest


/**
 <p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartCelebrityRecognition</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidently started more than once. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>An identifier you specify that's returned in the completion notification that's published to your Amazon Simple Notification Service topic. For example, you can use <code>JobTag</code> to group related jobs and identify them in the completion notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTag;

/**
 <p>The Amazon SNS topic ARN that you want Amazon Rekognition Video to publish the completion status of the celebrity recognition analysis to. The Amazon SNS topic must have a topic name that begins with <i>AmazonRekognition</i> if you are using the AmazonRekognitionServiceRole permissions policy.</p>
 */
@property (nonatomic, strong) AWSRekognitionNotificationChannel * _Nullable notificationChannel;

/**
 <p>The video in which you want to recognize celebrities. The video must be stored in an Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) AWSRekognitionVideo * _Nullable video;

@end

/**
 
 */
@interface AWSRekognitionStartCelebrityRecognitionResponse : AWSModel


/**
 <p>The identifier for the celebrity recognition analysis job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetCelebrityRecognition</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSRekognitionStartContentModerationRequest : AWSRequest


/**
 <p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartContentModeration</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidently started more than once. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>An identifier you specify that's returned in the completion notification that's published to your Amazon Simple Notification Service topic. For example, you can use <code>JobTag</code> to group related jobs and identify them in the completion notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTag;

/**
 <p>Specifies the minimum confidence that Amazon Rekognition must have in order to return a moderated content label. Confidence represents how certain Amazon Rekognition is that the moderated content is correctly identified. 0 is the lowest confidence. 100 is the highest confidence. Amazon Rekognition doesn't return any moderated content labels with a confidence level lower than this specified value. If you don't specify <code>MinConfidence</code>, <code>GetContentModeration</code> returns labels with confidence values greater than or equal to 50 percent.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minConfidence;

/**
 <p>The Amazon SNS topic ARN that you want Amazon Rekognition Video to publish the completion status of the content analysis to. The Amazon SNS topic must have a topic name that begins with <i>AmazonRekognition</i> if you are using the AmazonRekognitionServiceRole permissions policy to access the topic.</p>
 */
@property (nonatomic, strong) AWSRekognitionNotificationChannel * _Nullable notificationChannel;

/**
 <p>The video in which you want to detect inappropriate, unwanted, or offensive content. The video must be stored in an Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) AWSRekognitionVideo * _Nullable video;

@end

/**
 
 */
@interface AWSRekognitionStartContentModerationResponse : AWSModel


/**
 <p>The identifier for the content analysis job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetContentModeration</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSRekognitionStartFaceDetectionRequest : AWSRequest


/**
 <p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartFaceDetection</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidently started more than once. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The face attributes you want returned.</p><p><code>DEFAULT</code> - The following subset of facial attributes are returned: BoundingBox, Confidence, Pose, Quality and Landmarks. </p><p><code>ALL</code> - All facial attributes are returned.</p>
 */
@property (nonatomic, assign) AWSRekognitionFaceAttributes faceAttributes;

/**
 <p>An identifier you specify that's returned in the completion notification that's published to your Amazon Simple Notification Service topic. For example, you can use <code>JobTag</code> to group related jobs and identify them in the completion notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTag;

/**
 <p>The ARN of the Amazon SNS topic to which you want Amazon Rekognition Video to publish the completion status of the face detection operation. The Amazon SNS topic must have a topic name that begins with <i>AmazonRekognition</i> if you are using the AmazonRekognitionServiceRole permissions policy.</p>
 */
@property (nonatomic, strong) AWSRekognitionNotificationChannel * _Nullable notificationChannel;

/**
 <p>The video in which you want to detect faces. The video must be stored in an Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) AWSRekognitionVideo * _Nullable video;

@end

/**
 
 */
@interface AWSRekognitionStartFaceDetectionResponse : AWSModel


/**
 <p>The identifier for the face detection job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetFaceDetection</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSRekognitionStartFaceSearchRequest : AWSRequest


/**
 <p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartFaceSearch</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidently started more than once. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>ID of the collection that contains the faces you want to search for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionId;

/**
 <p>The minimum confidence in the person match to return. For example, don't return any matches where confidence in matches is less than 70%. The default value is 80%.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable faceMatchThreshold;

/**
 <p>An identifier you specify that's returned in the completion notification that's published to your Amazon Simple Notification Service topic. For example, you can use <code>JobTag</code> to group related jobs and identify them in the completion notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTag;

/**
 <p>The ARN of the Amazon SNS topic to which you want Amazon Rekognition Video to publish the completion status of the search. The Amazon SNS topic must have a topic name that begins with <i>AmazonRekognition</i> if you are using the AmazonRekognitionServiceRole permissions policy to access the topic.</p>
 */
@property (nonatomic, strong) AWSRekognitionNotificationChannel * _Nullable notificationChannel;

/**
 <p>The video you want to search. The video must be stored in an Amazon S3 bucket. </p>
 */
@property (nonatomic, strong) AWSRekognitionVideo * _Nullable video;

@end

/**
 
 */
@interface AWSRekognitionStartFaceSearchResponse : AWSModel


/**
 <p>The identifier for the search job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetFaceSearch</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSRekognitionStartLabelDetectionRequest : AWSRequest


/**
 <p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartLabelDetection</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidently started more than once. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The features to return after video analysis. You can specify that GENERAL_LABELS are returned.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable features;

/**
 <p>An identifier you specify that's returned in the completion notification that's published to your Amazon Simple Notification Service topic. For example, you can use <code>JobTag</code> to group related jobs and identify them in the completion notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTag;

/**
 <p>Specifies the minimum confidence that Amazon Rekognition Video must have in order to return a detected label. Confidence represents how certain Amazon Rekognition is that a label is correctly identified.0 is the lowest confidence. 100 is the highest confidence. Amazon Rekognition Video doesn't return any labels with a confidence level lower than this specified value.</p><p>If you don't specify <code>MinConfidence</code>, the operation returns labels and bounding boxes (if detected) with confidence values greater than or equal to 50 percent.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minConfidence;

/**
 <p>The Amazon SNS topic ARN you want Amazon Rekognition Video to publish the completion status of the label detection operation to. The Amazon SNS topic must have a topic name that begins with <i>AmazonRekognition</i> if you are using the AmazonRekognitionServiceRole permissions policy.</p>
 */
@property (nonatomic, strong) AWSRekognitionNotificationChannel * _Nullable notificationChannel;

/**
 <p>The settings for a StartLabelDetection request.Contains the specified parameters for the label detection request of an asynchronous label analysis operation. Settings can include filters for GENERAL_LABELS.</p>
 */
@property (nonatomic, strong) AWSRekognitionLabelDetectionSettings * _Nullable settings;

/**
 <p>The video in which you want to detect labels. The video must be stored in an Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) AWSRekognitionVideo * _Nullable video;

@end

/**
 
 */
@interface AWSRekognitionStartLabelDetectionResponse : AWSModel


/**
 <p>The identifier for the label detection job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetLabelDetection</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSRekognitionStartPersonTrackingRequest : AWSRequest


/**
 <p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartPersonTracking</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidently started more than once. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>An identifier you specify that's returned in the completion notification that's published to your Amazon Simple Notification Service topic. For example, you can use <code>JobTag</code> to group related jobs and identify them in the completion notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTag;

/**
 <p>The Amazon SNS topic ARN you want Amazon Rekognition Video to publish the completion status of the people detection operation to. The Amazon SNS topic must have a topic name that begins with <i>AmazonRekognition</i> if you are using the AmazonRekognitionServiceRole permissions policy.</p>
 */
@property (nonatomic, strong) AWSRekognitionNotificationChannel * _Nullable notificationChannel;

/**
 <p>The video in which you want to detect people. The video must be stored in an Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) AWSRekognitionVideo * _Nullable video;

@end

/**
 
 */
@interface AWSRekognitionStartPersonTrackingResponse : AWSModel


/**
 <p>The identifier for the person detection job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetPersonTracking</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSRekognitionStartProjectVersionRequest : AWSRequest


/**
 <p>The maximum number of inference units to use for auto-scaling the model. If you don't specify a value, Amazon Rekognition Custom Labels doesn't auto-scale the model.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxInferenceUnits;

/**
 <p>The minimum number of inference units to use. A single inference unit represents 1 hour of processing. </p><p>For information about the number of transactions per second (TPS) that an inference unit can support, see <i>Running a trained Amazon Rekognition Custom Labels model</i> in the Amazon Rekognition Custom Labels Guide. </p><p>Use a higher number to increase the TPS throughput of your model. You are charged for the number of inference units that you use. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minInferenceUnits;

/**
 <p>The Amazon Resource Name(ARN) of the model version that you want to start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectVersionArn;

@end

/**
 
 */
@interface AWSRekognitionStartProjectVersionResponse : AWSModel


/**
 <p>The current running status of the model. </p>
 */
@property (nonatomic, assign) AWSRekognitionProjectVersionStatus status;

@end

/**
 <p>Filters applied to the technical cue or shot detection segments. For more information, see <a>StartSegmentDetection</a>. </p>
 */
@interface AWSRekognitionStartSegmentDetectionFilters : AWSModel


/**
 <p>Filters that are specific to shot detections.</p>
 */
@property (nonatomic, strong) AWSRekognitionStartShotDetectionFilter * _Nullable shotFilter;

/**
 <p>Filters that are specific to technical cues.</p>
 */
@property (nonatomic, strong) AWSRekognitionStartTechnicalCueDetectionFilter * _Nullable technicalCueFilter;

@end

/**
 
 */
@interface AWSRekognitionStartSegmentDetectionRequest : AWSRequest


/**
 <p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartSegmentDetection</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidently started more than once. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>Filters for technical cue or shot detection.</p>
 */
@property (nonatomic, strong) AWSRekognitionStartSegmentDetectionFilters * _Nullable filters;

/**
 <p>An identifier you specify that's returned in the completion notification that's published to your Amazon Simple Notification Service topic. For example, you can use <code>JobTag</code> to group related jobs and identify them in the completion notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTag;

/**
 <p>The ARN of the Amazon SNS topic to which you want Amazon Rekognition Video to publish the completion status of the segment detection operation. Note that the Amazon SNS topic must have a topic name that begins with <i>AmazonRekognition</i> if you are using the AmazonRekognitionServiceRole permissions policy to access the topic.</p>
 */
@property (nonatomic, strong) AWSRekognitionNotificationChannel * _Nullable notificationChannel;

/**
 <p>An array of segment types to detect in the video. Valid values are TECHNICAL_CUE and SHOT.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable segmentTypes;

/**
 <p>Video file stored in an Amazon S3 bucket. Amazon Rekognition video start operations such as <a>StartLabelDetection</a> use <code>Video</code> to specify a video for analysis. The supported file formats are .mp4, .mov and .avi.</p>
 */
@property (nonatomic, strong) AWSRekognitionVideo * _Nullable video;

@end

/**
 
 */
@interface AWSRekognitionStartSegmentDetectionResponse : AWSModel


/**
 <p>Unique identifier for the segment detection job. The <code>JobId</code> is returned from <code>StartSegmentDetection</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 <p>Filters for the shot detection segments returned by <code>GetSegmentDetection</code>. For more information, see <a>StartSegmentDetectionFilters</a>.</p>
 */
@interface AWSRekognitionStartShotDetectionFilter : AWSModel


/**
 <p>Specifies the minimum confidence that Amazon Rekognition Video must have in order to return a detected segment. Confidence represents how certain Amazon Rekognition is that a segment is correctly identified. 0 is the lowest confidence. 100 is the highest confidence. Amazon Rekognition Video doesn't return any segments with a confidence level lower than this specified value.</p><p>If you don't specify <code>MinSegmentConfidence</code>, the <code>GetSegmentDetection</code> returns segments with confidence values greater than or equal to 50 percent.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minSegmentConfidence;

@end

/**
 
 */
@interface AWSRekognitionStartStreamProcessorRequest : AWSRequest


/**
 <p>The name of the stream processor to start processing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> Specifies the starting point in the Kinesis stream to start processing. You can use the producer timestamp or the fragment number. If you use the producer timestamp, you must put the time in milliseconds. For more information about fragment numbers, see <a href="https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/API_reader_Fragment.html">Fragment</a>. </p><p>This is a required parameter for label detection stream processors and should not be used to start a face search stream processor.</p>
 */
@property (nonatomic, strong) AWSRekognitionStreamProcessingStartSelector * _Nullable startSelector;

/**
 <p> Specifies when to stop processing the stream. You can specify a maximum amount of time to process the video. </p><p>This is a required parameter for label detection stream processors and should not be used to start a face search stream processor.</p>
 */
@property (nonatomic, strong) AWSRekognitionStreamProcessingStopSelector * _Nullable stopSelector;

@end

/**
 
 */
@interface AWSRekognitionStartStreamProcessorResponse : AWSModel


/**
 <p> A unique identifier for the stream processing session. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionId;

@end

/**
 <p>Filters for the technical segments returned by <a>GetSegmentDetection</a>. For more information, see <a>StartSegmentDetectionFilters</a>.</p>
 */
@interface AWSRekognitionStartTechnicalCueDetectionFilter : AWSModel


/**
 <p> A filter that allows you to control the black frame detection by specifying the black levels and pixel coverage of black pixels in a frame. Videos can come from multiple sources, formats, and time periods, with different standards and varying noise levels for black frames that need to be accounted for. </p>
 */
@property (nonatomic, strong) AWSRekognitionBlackFrame * _Nullable blackFrame;

/**
 <p>Specifies the minimum confidence that Amazon Rekognition Video must have in order to return a detected segment. Confidence represents how certain Amazon Rekognition is that a segment is correctly identified. 0 is the lowest confidence. 100 is the highest confidence. Amazon Rekognition Video doesn't return any segments with a confidence level lower than this specified value.</p><p>If you don't specify <code>MinSegmentConfidence</code>, <code>GetSegmentDetection</code> returns segments with confidence values greater than or equal to 50 percent.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minSegmentConfidence;

@end

/**
 <p>Set of optional parameters that let you set the criteria text must meet to be included in your response. <code>WordFilter</code> looks at a word's height, width and minimum confidence. <code>RegionOfInterest</code> lets you set a specific region of the screen to look for text in.</p>
 */
@interface AWSRekognitionStartTextDetectionFilters : AWSModel


/**
 <p>Filter focusing on a certain area of the frame. Uses a <code>BoundingBox</code> object to set the region of the screen.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionRegionOfInterest *> * _Nullable regionsOfInterest;

/**
 <p>Filters focusing on qualities of the text, such as confidence or size.</p>
 */
@property (nonatomic, strong) AWSRekognitionDetectionFilter * _Nullable wordFilter;

@end

/**
 
 */
@interface AWSRekognitionStartTextDetectionRequest : AWSRequest


/**
 <p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartTextDetection</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidentaly started more than once.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>Optional parameters that let you set criteria the text must meet to be included in your response.</p>
 */
@property (nonatomic, strong) AWSRekognitionStartTextDetectionFilters * _Nullable filters;

/**
 <p>An identifier returned in the completion status published by your Amazon Simple Notification Service topic. For example, you can use <code>JobTag</code> to group related jobs and identify them in the completion notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTag;

/**
 <p>The Amazon Simple Notification Service topic to which Amazon Rekognition publishes the completion status of a video analysis operation. For more information, see <a href="https://docs.aws.amazon.com/rekognition/latest/dg/api-video.html">Calling Amazon Rekognition Video operations</a>. Note that the Amazon SNS topic must have a topic name that begins with <i>AmazonRekognition</i> if you are using the AmazonRekognitionServiceRole permissions policy to access the topic. For more information, see <a href="https://docs.aws.amazon.com/rekognition/latest/dg/api-video-roles.html#api-video-roles-all-topics">Giving access to multiple Amazon SNS topics</a>.</p>
 */
@property (nonatomic, strong) AWSRekognitionNotificationChannel * _Nullable notificationChannel;

/**
 <p>Video file stored in an Amazon S3 bucket. Amazon Rekognition video start operations such as <a>StartLabelDetection</a> use <code>Video</code> to specify a video for analysis. The supported file formats are .mp4, .mov and .avi.</p>
 */
@property (nonatomic, strong) AWSRekognitionVideo * _Nullable video;

@end

/**
 
 */
@interface AWSRekognitionStartTextDetectionResponse : AWSModel


/**
 <p>Identifier for the text detection job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetTextDetection</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSRekognitionStopProjectVersionRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the model version that you want to delete.</p><p>This operation requires permissions to perform the <code>rekognition:StopProjectVersion</code> action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectVersionArn;

@end

/**
 
 */
@interface AWSRekognitionStopProjectVersionResponse : AWSModel


/**
 <p>The current status of the stop operation. </p>
 */
@property (nonatomic, assign) AWSRekognitionProjectVersionStatus status;

@end

/**
 
 */
@interface AWSRekognitionStopStreamProcessorRequest : AWSRequest


/**
 <p>The name of a stream processor created by <a>CreateStreamProcessor</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSRekognitionStopStreamProcessorResponse : AWSModel


@end

/**
 <p>This is a required parameter for label detection stream processors and should not be used to start a face search stream processor.</p>
 */
@interface AWSRekognitionStreamProcessingStartSelector : AWSModel


/**
 <p> Specifies the starting point in the stream to start processing. This can be done with a producer timestamp or a fragment number in a Kinesis stream. </p>
 */
@property (nonatomic, strong) AWSRekognitionKinesisVideoStreamStartSelector * _Nullable KVSStreamStartSelector;

@end

/**
 <p> Specifies when to stop processing the stream. You can specify a maximum amount of time to process the video. </p>
 */
@interface AWSRekognitionStreamProcessingStopSelector : AWSModel


/**
 <p> Specifies the maximum amount of time in seconds that you want the stream to be processed. The largest amount of time is 2 minutes. The default is 10 seconds. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxDurationInSeconds;

@end

/**
 <p>An object that recognizes faces or labels in a streaming video. An Amazon Rekognition stream processor is created by a call to <a>CreateStreamProcessor</a>. The request parameters for <code>CreateStreamProcessor</code> describe the Kinesis video stream source for the streaming video, face recognition parameters, and where to stream the analysis resullts. </p>
 */
@interface AWSRekognitionStreamProcessor : AWSModel


/**
 <p>Name of the Amazon Rekognition stream processor. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Current status of the Amazon Rekognition stream processor.</p>
 */
@property (nonatomic, assign) AWSRekognitionStreamProcessorStatus status;

@end

/**
 <p> Allows you to opt in or opt out to share data with Rekognition to improve model performance. You can choose this option at the account level or on a per-stream basis. Note that if you opt out at the account level this setting is ignored on individual streams. </p>
 Required parameters: [OptIn]
 */
@interface AWSRekognitionStreamProcessorDataSharingPreference : AWSModel


/**
 <p> If this option is set to true, you choose to share data with Rekognition to improve model performance. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable optIn;

@end

/**
 <p>Information about the source streaming video. </p>
 */
@interface AWSRekognitionStreamProcessorInput : AWSModel


/**
 <p>The Kinesis video stream input stream for the source streaming video.</p>
 */
@property (nonatomic, strong) AWSRekognitionKinesisVideoStream * _Nullable kinesisVideoStream;

@end

/**
 <p>The Amazon Simple Notification Service topic to which Amazon Rekognition publishes the object detection results and completion status of a video analysis operation.</p><p>Amazon Rekognition publishes a notification the first time an object of interest or a person is detected in the video stream. For example, if Amazon Rekognition detects a person at second 2, a pet at second 4, and a person again at second 5, Amazon Rekognition sends 2 object class detected notifications, one for a person at second 2 and one for a pet at second 4.</p><p>Amazon Rekognition also publishes an an end-of-session notification with a summary when the stream processing session is complete.</p>
 Required parameters: [SNSTopicArn]
 */
@interface AWSRekognitionStreamProcessorNotificationChannel : AWSModel


/**
 <p> The Amazon Resource Number (ARN) of the Amazon Amazon Simple Notification Service topic to which Amazon Rekognition posts the completion status. </p>
 */
@property (nonatomic, strong) NSString * _Nullable SNSTopicArn;

@end

/**
 <p>Information about the Amazon Kinesis Data Streams stream to which a Amazon Rekognition Video stream processor streams the results of a video analysis. For more information, see CreateStreamProcessor in the Amazon Rekognition Developer Guide.</p>
 */
@interface AWSRekognitionStreamProcessorOutput : AWSModel


/**
 <p>The Amazon Kinesis Data Streams stream to which the Amazon Rekognition stream processor streams the analysis results.</p>
 */
@property (nonatomic, strong) AWSRekognitionKinesisDataStream * _Nullable kinesisDataStream;

/**
 <p> The Amazon S3 bucket location to which Amazon Rekognition publishes the detailed inference results of a video analysis operation. </p>
 */
@property (nonatomic, strong) AWSRekognitionS3Destination * _Nullable s3Destination;

@end

/**
 <p>Input parameters used in a streaming video analyzed by a Amazon Rekognition stream processor. You can use <code>FaceSearch</code> to recognize faces in a streaming video, or you can use <code>ConnectedHome</code> to detect labels. </p>
 */
@interface AWSRekognitionStreamProcessorSettings : AWSModel


/**
 <p> Label detection settings to use on a streaming video. Defining the settings is required in the request parameter for <a>CreateStreamProcessor</a>. Including this setting in the <code>CreateStreamProcessor</code> request enables you to use the stream processor for label detection. You can then select what you want the stream processor to detect, such as people or pets. When the stream processor has started, one notification is sent for each object class specified. For example, if packages and pets are selected, one SNS notification is published the first time a package is detected and one SNS notification is published the first time a pet is detected, as well as an end-of-session summary. </p>
 */
@property (nonatomic, strong) AWSRekognitionConnectedHomeSettings * _Nullable connectedHome;

/**
 <p>Face search settings to use on a streaming video. </p>
 */
@property (nonatomic, strong) AWSRekognitionFaceSearchSettings * _Nullable faceSearch;

@end

/**
 <p> The stream processor settings that you want to update. <code>ConnectedHome</code> settings can be updated to detect different labels with a different minimum confidence. </p>
 */
@interface AWSRekognitionStreamProcessorSettingsForUpdate : AWSModel


/**
 <p> The label detection settings you want to use for your stream processor. </p>
 */
@property (nonatomic, strong) AWSRekognitionConnectedHomeSettingsForUpdate * _Nullable connectedHomeForUpdate;

@end

/**
 <p>The S3 bucket that contains the training summary. The training summary includes aggregated evaluation metrics for the entire testing dataset and metrics for each individual label. </p><p>You get the training summary S3 bucket location by calling <a>DescribeProjectVersions</a>. </p>
 */
@interface AWSRekognitionSummary : AWSModel


/**
 <p>Provides the S3 bucket name and object name.</p><p>The region for the S3 bucket containing the S3 object must match the region you use for Amazon Rekognition operations.</p><p>For Amazon Rekognition to process an S3 object, the user must have permission to access the S3 object. For more information, see How Amazon Rekognition works with IAM in the Amazon Rekognition Developer Guide. </p>
 */
@property (nonatomic, strong) AWSRekognitionS3Object * _Nullable s3Object;

@end

/**
 <p>Indicates whether or not the face is wearing sunglasses, and the confidence level in the determination.</p>
 */
@interface AWSRekognitionSunglasses : AWSModel


/**
 <p>Level of confidence in the determination.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>Boolean value that indicates whether the face is wearing sunglasses or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 
 */
@interface AWSRekognitionTagResourceRequest : AWSRequest


/**
 <p> Amazon Resource Name (ARN) of the model, collection, or stream processor that you want to assign the tags to. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p> The key-value tags to assign to the resource. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSRekognitionTagResourceResponse : AWSModel


@end

/**
 <p>Information about a technical cue segment. For more information, see <a>SegmentDetection</a>.</p>
 */
@interface AWSRekognitionTechnicalCueSegment : AWSModel


/**
 <p>The confidence that Amazon Rekognition Video has in the accuracy of the detected segment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>The type of the technical cue.</p>
 */
@property (nonatomic, assign) AWSRekognitionTechnicalCueType types;

@end

/**
 <p>The dataset used for testing. Optionally, if <code>AutoCreate</code> is set, Amazon Rekognition Custom Labels uses the training dataset to create a test dataset with a temporary split of the training dataset. </p>
 */
@interface AWSRekognitionTestingData : AWSModel


/**
 <p>The assets used for testing.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionAsset *> * _Nullable assets;

/**
 <p>If specified, Amazon Rekognition Custom Labels temporarily splits the training dataset (80%) to create a test dataset (20%) for the training job. After training completes, the test dataset is not stored and the training dataset reverts to its previous size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoCreate;

@end

/**
 <p>Sagemaker Groundtruth format manifest files for the input, output and validation datasets that are used and created during testing.</p>
 */
@interface AWSRekognitionTestingDataResult : AWSModel


/**
 <p>The testing dataset that was supplied for training.</p>
 */
@property (nonatomic, strong) AWSRekognitionTestingData * _Nullable input;

/**
 <p>The subset of the dataset that was actually tested. Some images (assets) might not be tested due to file formatting and other issues. </p>
 */
@property (nonatomic, strong) AWSRekognitionTestingData * _Nullable output;

/**
 <p>The location of the data validation manifest. The data validation manifest is created for the test dataset during model training.</p>
 */
@property (nonatomic, strong) AWSRekognitionValidationData * _Nullable validation;

@end

/**
 <p>Information about a word or line of text detected by <a>DetectText</a>.</p><p>The <code>DetectedText</code> field contains the text that Amazon Rekognition detected in the image. </p><p>Every word and line has an identifier (<code>Id</code>). Each word belongs to a line and has a parent identifier (<code>ParentId</code>) that identifies the line of text in which the word appears. The word <code>Id</code> is also an index for the word within a line of words. </p><p>For more information, see Detecting text in the Amazon Rekognition Developer Guide.</p>
 */
@interface AWSRekognitionTextDetection : AWSModel


/**
 <p>The confidence that Amazon Rekognition has in the accuracy of the detected text and the accuracy of the geometry points around the detected text.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>The word or line of text recognized by Amazon Rekognition. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detectedText;

/**
 <p>The location of the detected text on the image. Includes an axis aligned coarse bounding box surrounding the text and a finer grain polygon for more accurate spatial information.</p>
 */
@property (nonatomic, strong) AWSRekognitionGeometry * _Nullable geometry;

/**
 <p>The identifier for the detected text. The identifier is only unique for a single call to <code>DetectText</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable identifier;

/**
 <p>The Parent identifier for the detected text identified by the value of <code>ID</code>. If the type of detected text is <code>LINE</code>, the value of <code>ParentId</code> is <code>Null</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable parentId;

/**
 <p>The type of text that was detected.</p>
 */
@property (nonatomic, assign) AWSRekognitionTextTypes types;

@end

/**
 <p>Information about text detected in a video. Incudes the detected text, the time in milliseconds from the start of the video that the text was detected, and where it was detected on the screen.</p>
 */
@interface AWSRekognitionTextDetectionResult : AWSModel


/**
 <p>Details about text detected in a video.</p>
 */
@property (nonatomic, strong) AWSRekognitionTextDetection * _Nullable textDetection;

/**
 <p>The time, in milliseconds from the start of the video, that the text was detected. Note that <code>Timestamp</code> is not guaranteed to be accurate to the individual frame where the text first appears.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timestamp;

@end

/**
 <p>The dataset used for training.</p>
 */
@interface AWSRekognitionTrainingData : AWSModel


/**
 <p>A Sagemaker GroundTruth manifest file that contains the training images (assets).</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionAsset *> * _Nullable assets;

@end

/**
 <p>Sagemaker Groundtruth format manifest files for the input, output and validation datasets that are used and created during testing.</p>
 */
@interface AWSRekognitionTrainingDataResult : AWSModel


/**
 <p>The training assets that you supplied for training.</p>
 */
@property (nonatomic, strong) AWSRekognitionTrainingData * _Nullable input;

/**
 <p>The images (assets) that were actually trained by Amazon Rekognition Custom Labels. </p>
 */
@property (nonatomic, strong) AWSRekognitionTrainingData * _Nullable output;

/**
 <p>The location of the data validation manifest. The data validation manifest is created for the training dataset during model training.</p>
 */
@property (nonatomic, strong) AWSRekognitionValidationData * _Nullable validation;

@end

/**
 <p>A face that <a>IndexFaces</a> detected, but didn't index. Use the <code>Reasons</code> response attribute to determine why a face wasn't indexed.</p>
 */
@interface AWSRekognitionUnindexedFace : AWSModel


/**
 <p>The structure that contains attributes of a face that <code>IndexFaces</code>detected, but didn't index. </p>
 */
@property (nonatomic, strong) AWSRekognitionFaceDetail * _Nullable faceDetail;

/**
 <p>An array of reasons that specify why a face wasn't indexed. </p><ul><li><p>EXTREME_POSE - The face is at a pose that can't be detected. For example, the head is turned too far away from the camera.</p></li><li><p>EXCEEDS_MAX_FACES - The number of faces detected is already higher than that specified by the <code>MaxFaces</code> input parameter for <code>IndexFaces</code>.</p></li><li><p>LOW_BRIGHTNESS - The image is too dark.</p></li><li><p>LOW_SHARPNESS - The image is too blurry.</p></li><li><p>LOW_CONFIDENCE - The face was detected with a low confidence.</p></li><li><p>SMALL_BOUNDING_BOX - The bounding box around the face is too small.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable reasons;

@end

/**
 
 */
@interface AWSRekognitionUntagResourceRequest : AWSRequest


/**
 <p> Amazon Resource Name (ARN) of the model, collection, or stream processor that you want to remove the tags from. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p> A list of the tags that you want to remove. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSRekognitionUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSRekognitionUpdateDatasetEntriesRequest : AWSRequest


/**
 <p> The changes that you want to make to the dataset. </p>
 */
@property (nonatomic, strong) AWSRekognitionDatasetChanges * _Nullable changes;

/**
 <p> The Amazon Resource Name (ARN) of the dataset that you want to update. </p>
 */
@property (nonatomic, strong) NSString * _Nullable datasetArn;

@end

/**
 
 */
@interface AWSRekognitionUpdateDatasetEntriesResponse : AWSModel


@end

/**
 
 */
@interface AWSRekognitionUpdateStreamProcessorRequest : AWSRequest


/**
 <p> Shows whether you are sharing data with Rekognition to improve model performance. You can choose this option at the account level or on a per-stream basis. Note that if you opt out at the account level this setting is ignored on individual streams. </p>
 */
@property (nonatomic, strong) AWSRekognitionStreamProcessorDataSharingPreference * _Nullable dataSharingPreferenceForUpdate;

/**
 <p> Name of the stream processor that you want to update. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> A list of parameters you want to delete from the stream processor. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable parametersToDelete;

/**
 <p> Specifies locations in the frames where Amazon Rekognition checks for objects or people. This is an optional parameter for label detection stream processors. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionRegionOfInterest *> * _Nullable regionsOfInterestForUpdate;

/**
 <p> The stream processor settings that you want to update. Label detection settings can be updated to detect different labels with a different minimum confidence. </p>
 */
@property (nonatomic, strong) AWSRekognitionStreamProcessorSettingsForUpdate * _Nullable settingsForUpdate;

@end

/**
 
 */
@interface AWSRekognitionUpdateStreamProcessorResponse : AWSModel


@end

/**
 <p>Contains the Amazon S3 bucket location of the validation data for a model training job. </p><p>The validation data includes error information for individual JSON Lines in the dataset. For more information, see <i>Debugging a Failed Model Training</i> in the Amazon Rekognition Custom Labels Developer Guide. </p><p>You get the <code>ValidationData</code> object for the training dataset (<a>TrainingDataResult</a>) and the test dataset (<a>TestingDataResult</a>) by calling <a>DescribeProjectVersions</a>. </p><p>The assets array contains a single <a>Asset</a> object. The <a>GroundTruthManifest</a> field of the Asset object contains the S3 bucket location of the validation data. </p>
 */
@interface AWSRekognitionValidationData : AWSModel


/**
 <p>The assets that comprise the validation data. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionAsset *> * _Nullable assets;

@end

/**
 <p>Video file stored in an Amazon S3 bucket. Amazon Rekognition video start operations such as <a>StartLabelDetection</a> use <code>Video</code> to specify a video for analysis. The supported file formats are .mp4, .mov and .avi.</p>
 */
@interface AWSRekognitionVideo : AWSModel


/**
 <p>The Amazon S3 bucket name and file name for the video.</p>
 */
@property (nonatomic, strong) AWSRekognitionS3Object * _Nullable s3Object;

@end

/**
 <p>Information about a video that Amazon Rekognition analyzed. <code>Videometadata</code> is returned in every page of paginated responses from a Amazon Rekognition video operation.</p>
 */
@interface AWSRekognitionVideoMetadata : AWSModel


/**
 <p>Type of compression used in the analyzed video. </p>
 */
@property (nonatomic, strong) NSString * _Nullable codec;

/**
 <p> A description of the range of luminance values in a video, either LIMITED (16 to 235) or FULL (0 to 255). </p>
 */
@property (nonatomic, assign) AWSRekognitionVideoColorRange colorRange;

/**
 <p>Length of the video in milliseconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationMillis;

/**
 <p>Format of the analyzed video. Possible values are MP4, MOV and AVI. </p>
 */
@property (nonatomic, strong) NSString * _Nullable format;

/**
 <p>Vertical pixel dimension of the video.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable frameHeight;

/**
 <p>Number of frames per second in the video.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable frameRate;

/**
 <p>Horizontal pixel dimension of the video.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable frameWidth;

@end

NS_ASSUME_NONNULL_END
