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
    AWSRekognitionErrorInvalidS3Object,
    AWSRekognitionErrorLimitExceeded,
    AWSRekognitionErrorProvisionedThroughputExceeded,
    AWSRekognitionErrorResourceAlreadyExists,
    AWSRekognitionErrorResourceInUse,
    AWSRekognitionErrorResourceNotFound,
    AWSRekognitionErrorResourceNotReady,
    AWSRekognitionErrorThrottling,
    AWSRekognitionErrorVideoTooLarge,
};

typedef NS_ENUM(NSInteger, AWSRekognitionAttribute) {
    AWSRekognitionAttributeUnknown,
    AWSRekognitionAttributeDefault,
    AWSRekognitionAttributeAll,
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

typedef NS_ENUM(NSInteger, AWSRekognitionStreamProcessorStatus) {
    AWSRekognitionStreamProcessorStatusUnknown,
    AWSRekognitionStreamProcessorStatusStopped,
    AWSRekognitionStreamProcessorStatusStarting,
    AWSRekognitionStreamProcessorStatusRunning,
    AWSRekognitionStreamProcessorStatusFailed,
    AWSRekognitionStreamProcessorStatusStopping,
};

typedef NS_ENUM(NSInteger, AWSRekognitionTextTypes) {
    AWSRekognitionTextTypesUnknown,
    AWSRekognitionTextTypesLine,
    AWSRekognitionTextTypesWord,
};

typedef NS_ENUM(NSInteger, AWSRekognitionVideoJobStatus) {
    AWSRekognitionVideoJobStatusUnknown,
    AWSRekognitionVideoJobStatusInProgress,
    AWSRekognitionVideoJobStatusSucceeded,
    AWSRekognitionVideoJobStatusFailed,
};

@class AWSRekognitionAgeRange;
@class AWSRekognitionAsset;
@class AWSRekognitionBeard;
@class AWSRekognitionBoundingBox;
@class AWSRekognitionCelebrity;
@class AWSRekognitionCelebrityDetail;
@class AWSRekognitionCelebrityRecognition;
@class AWSRekognitionCompareFacesMatch;
@class AWSRekognitionCompareFacesRequest;
@class AWSRekognitionCompareFacesResponse;
@class AWSRekognitionComparedFace;
@class AWSRekognitionComparedSourceImageFace;
@class AWSRekognitionContentModerationDetection;
@class AWSRekognitionCreateCollectionRequest;
@class AWSRekognitionCreateCollectionResponse;
@class AWSRekognitionCreateProjectRequest;
@class AWSRekognitionCreateProjectResponse;
@class AWSRekognitionCreateProjectVersionRequest;
@class AWSRekognitionCreateProjectVersionResponse;
@class AWSRekognitionCreateStreamProcessorRequest;
@class AWSRekognitionCreateStreamProcessorResponse;
@class AWSRekognitionCustomLabel;
@class AWSRekognitionDeleteCollectionRequest;
@class AWSRekognitionDeleteCollectionResponse;
@class AWSRekognitionDeleteFacesRequest;
@class AWSRekognitionDeleteFacesResponse;
@class AWSRekognitionDeleteProjectRequest;
@class AWSRekognitionDeleteProjectResponse;
@class AWSRekognitionDeleteProjectVersionRequest;
@class AWSRekognitionDeleteProjectVersionResponse;
@class AWSRekognitionDeleteStreamProcessorRequest;
@class AWSRekognitionDeleteStreamProcessorResponse;
@class AWSRekognitionDescribeCollectionRequest;
@class AWSRekognitionDescribeCollectionResponse;
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
@class AWSRekognitionDetectLabelsRequest;
@class AWSRekognitionDetectLabelsResponse;
@class AWSRekognitionDetectModerationLabelsRequest;
@class AWSRekognitionDetectModerationLabelsResponse;
@class AWSRekognitionDetectTextFilters;
@class AWSRekognitionDetectTextRequest;
@class AWSRekognitionDetectTextResponse;
@class AWSRekognitionDetectionFilter;
@class AWSRekognitionEmotion;
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
@class AWSRekognitionLabel;
@class AWSRekognitionLabelDetection;
@class AWSRekognitionLandmark;
@class AWSRekognitionListCollectionsRequest;
@class AWSRekognitionListCollectionsResponse;
@class AWSRekognitionListFacesRequest;
@class AWSRekognitionListFacesResponse;
@class AWSRekognitionListStreamProcessorsRequest;
@class AWSRekognitionListStreamProcessorsResponse;
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
@class AWSRekognitionProjectVersionDescription;
@class AWSRekognitionRecognizeCelebritiesRequest;
@class AWSRekognitionRecognizeCelebritiesResponse;
@class AWSRekognitionRegionOfInterest;
@class AWSRekognitionS3Object;
@class AWSRekognitionSearchFacesByImageRequest;
@class AWSRekognitionSearchFacesByImageResponse;
@class AWSRekognitionSearchFacesRequest;
@class AWSRekognitionSearchFacesResponse;
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
@class AWSRekognitionStartStreamProcessorRequest;
@class AWSRekognitionStartStreamProcessorResponse;
@class AWSRekognitionStartTextDetectionFilters;
@class AWSRekognitionStartTextDetectionRequest;
@class AWSRekognitionStartTextDetectionResponse;
@class AWSRekognitionStopProjectVersionRequest;
@class AWSRekognitionStopProjectVersionResponse;
@class AWSRekognitionStopStreamProcessorRequest;
@class AWSRekognitionStopStreamProcessorResponse;
@class AWSRekognitionStreamProcessor;
@class AWSRekognitionStreamProcessorInput;
@class AWSRekognitionStreamProcessorOutput;
@class AWSRekognitionStreamProcessorSettings;
@class AWSRekognitionSummary;
@class AWSRekognitionSunglasses;
@class AWSRekognitionTestingData;
@class AWSRekognitionTestingDataResult;
@class AWSRekognitionTextDetection;
@class AWSRekognitionTextDetectionResult;
@class AWSRekognitionTrainingData;
@class AWSRekognitionTrainingDataResult;
@class AWSRekognitionUnindexedFace;
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
 <p>Assets are the images that you use to train and evaluate a model version. Assets are referenced by Sagemaker GroundTruth manifest files. </p>
 */
@interface AWSRekognitionAsset : AWSModel


/**
 <p>The S3 bucket that contains the Ground Truth manifest file.</p>
 */
@property (nonatomic, strong) AWSRekognitionGroundTruthManifest * _Nullable groundTruthManifest;

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
 <p>Identifies the bounding box around the label, face, or text. The <code>left</code> (x-coordinate) and <code>top</code> (y-coordinate) are coordinates representing the top and left sides of the bounding box. Note that the upper-left corner of the image is the origin (0,0). </p><p>The <code>top</code> and <code>left</code> values returned are ratios of the overall image size. For example, if the input image is 700x200 pixels, and the top-left coordinate of the bounding box is 350x50 pixels, the API returns a <code>left</code> value of 0.5 (350/700) and a <code>top</code> value of 0.25 (50/200).</p><p>The <code>width</code> and <code>height</code> values represent the dimensions of the bounding box as a ratio of the overall image dimension. For example, if the input image is 700x200 pixels, and the bounding box width is 70 pixels, the width returned is 0.1. </p><note><p> The bounding box coordinates can have negative values. For example, if Amazon Rekognition is able to detect a face that is at the image edge and is only partially visible, the service can return coordinates that are outside the image bounds and, depending on the image edge, you might get negative values or values greater than 1 for the <code>left</code> or <code>top</code> values. </p></note>
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
 <p>The time, in milliseconds from the start of the video, that the celebrity was recognized.</p>
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
 <p>Information about an unsafe content label detection in a stored video.</p>
 */
@interface AWSRekognitionContentModerationDetection : AWSModel


/**
 <p>The unsafe content label detected by in the stored video.</p>
 */
@property (nonatomic, strong) AWSRekognitionModerationLabel * _Nullable moderationLabel;

/**
 <p>Time, in milliseconds from the beginning of the video, that the unsafe content label was detected.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timestamp;

@end

/**
 
 */
@interface AWSRekognitionCreateCollectionRequest : AWSRequest


/**
 <p>ID for the collection that you are creating.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionId;

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
 <p>The Amazon S3 location to store the results of training.</p>
 */
@property (nonatomic, strong) AWSRekognitionOutputConfig * _Nullable outputConfig;

/**
 <p>The ARN of the Amazon Rekognition Custom Labels project that manages the model that you want to train.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectArn;

/**
 <p>The dataset to use for testing.</p>
 */
@property (nonatomic, strong) AWSRekognitionTestingData * _Nullable testingData;

/**
 <p>The dataset to use for training. </p>
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
 <p>Kinesis video stream stream that provides the source streaming video. If you are using the AWS CLI, the parameter name is <code>StreamProcessorInput</code>.</p>
 */
@property (nonatomic, strong) AWSRekognitionStreamProcessorInput * _Nullable input;

/**
 <p>An identifier you assign to the stream processor. You can use <code>Name</code> to manage the stream processor. For example, you can get the current status of the stream processor by calling <a>DescribeStreamProcessor</a>. <code>Name</code> is idempotent. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Kinesis data stream stream to which Amazon Rekognition Video puts the analysis results. If you are using the AWS CLI, the parameter name is <code>StreamProcessorOutput</code>.</p>
 */
@property (nonatomic, strong) AWSRekognitionStreamProcessorOutput * _Nullable output;

/**
 <p>ARN of the IAM role that allows access to the stream processor.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Face recognition input parameters to be used by the stream processor. Includes the collection to use for face recognition and the face attributes to detect.</p>
 */
@property (nonatomic, strong) AWSRekognitionStreamProcessorSettings * _Nullable settings;

@end

/**
 
 */
@interface AWSRekognitionCreateStreamProcessorResponse : AWSModel


/**
 <p>ARN for the newly create stream processor.</p>
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
 <p>The version of the face model that's used by the collection for face detection.</p><p>For more information, see Model Versioning in the Amazon Rekognition Developer Guide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable faceModelVersion;

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
 <p>A list of model version names that you want to describe. You can add up to 10 model version names to the list. If you don't specify a value, all model descriptions are returned.</p>
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
 <p>Kinesis video stream that provides the source streaming video.</p>
 */
@property (nonatomic, strong) AWSRekognitionStreamProcessorInput * _Nullable input;

/**
 <p>The time, in Unix format, the stream processor was last updated. For example, when the stream processor moves from a running state to a failed state, or when the user starts or stops the stream processor.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateTimestamp;

/**
 <p>Name of the stream processor. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Kinesis data stream to which Amazon Rekognition Video puts the analysis results.</p>
 */
@property (nonatomic, strong) AWSRekognitionStreamProcessorOutput * _Nullable output;

/**
 <p>ARN of the IAM role that allows access to the stream processor.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Face recognition input parameters that are being used by the stream processor. Includes the collection to use for face recognition and the face attributes to detect.</p>
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
 <p>Provides the input image either as bytes or an S3 object.</p><p>You pass image bytes to an Amazon Rekognition API operation by using the <code>Bytes</code> property. For example, you would use the <code>Bytes</code> property to pass an image loaded from a local file system. Image bytes passed by using the <code>Bytes</code> property must be base64-encoded. Your code may not need to encode image bytes if you are using an AWS SDK to call Amazon Rekognition API operations. </p><p>For more information, see Analyzing an Image Loaded from a Local File System in the Amazon Rekognition Developer Guide.</p><p> You pass images stored in an S3 bucket to an Amazon Rekognition API operation by using the <code>S3Object</code> property. Images stored in an S3 bucket do not need to be base64-encoded.</p><p>The region for the S3 bucket containing the S3 object must match the region you use for Amazon Rekognition operations.</p><p>If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes using the Bytes property is not supported. You must first upload the image to an Amazon S3 bucket and then call the operation using the S3Object property.</p><p>For Amazon Rekognition to process an S3 object, the user must have permission to access the S3 object. For more information, see Resource Based Policies in the Amazon Rekognition Developer Guide. </p>
 */
@property (nonatomic, strong) AWSRekognitionImage * _Nullable image;

/**
 <p>Maximum number of results you want the service to return in the response. The service returns the specified number of highest confidence labels ranked from highest confidence to lowest.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Specifies the minimum confidence level for the labels to return. Amazon Rekognition doesn't return any labels with a confidence lower than this specified value. If you specify a value of 0, all labels are return, regardless of the default thresholds that the model version applies.</p>
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
 
 */
@interface AWSRekognitionDetectLabelsRequest : AWSRequest


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

@end

/**
 
 */
@interface AWSRekognitionDetectLabelsResponse : AWSModel


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
 <p>Sets confidence of word detection. Words with detection confidence below this will be excluded from the result. Values should be between 0.5 and 1 as Text in Video will not return any result below 0.5.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minConfidence;

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

@end

/**
 <p>Structure containing attributes of the face that the algorithm detected.</p><p>A <code>FaceDetail</code> object contains either the default facial attributes or all facial attributes. The default attributes are <code>BoundingBox</code>, <code>Confidence</code>, <code>Landmarks</code>, <code>Pose</code>, and <code>Quality</code>.</p><p><a>GetFaceDetection</a> is the only Amazon Rekognition Video stored video operation that can return a <code>FaceDetail</code> object with all attributes. To specify which attributes to return, use the <code>FaceAttributes</code> input parameter for <a>StartFaceDetection</a>. The following Amazon Rekognition Video operations return only the default attributes. The corresponding Start operations don't have a <code>FaceAttributes</code> input parameter.</p><ul><li><p>GetCelebrityRecognition</p></li><li><p>GetPersonTracking</p></li><li><p>GetFaceSearch</p></li></ul><p>The Amazon Rekognition Image <a>DetectFaces</a> and <a>IndexFaces</a> operations can return all facial attributes. To specify which attributes to return, use the <code>Attributes</code> input parameter for <code>DetectFaces</code>. For <code>IndexFaces</code>, use the <code>DetectAttributes</code> input parameter.</p>
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
 <p>Time, in milliseconds from the start of the video, that the face was detected.</p>
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
 <p>Input face recognition parameters for an Amazon Rekognition stream processor. <code>FaceRecognitionSettings</code> is a request parameter for <a>CreateStreamProcessor</a>.</p>
 */
@interface AWSRekognitionFaceSearchSettings : AWSModel


/**
 <p>The ID of a collection that contains faces that you want to search for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionId;

/**
 <p>Minimum face match confidence score that must be met to return a result for a recognized face. Default is 80. 0 is the lowest confidence. 100 is the highest confidence.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable faceMatchThreshold;

@end

/**
 <p>The predicted gender of a detected face. </p><p>Amazon Rekognition makes gender binary (male/female) predictions based on the physical appearance of a face in a particular image. This kind of prediction is not designed to categorize a person’s gender identity, and you shouldn't use Amazon Rekognition to make such a determination. For example, a male actor wearing a long-haired wig and earrings for a role might be predicted as female.</p><p>Using Amazon Rekognition to make gender binary predictions is best suited for use cases where aggregate gender distribution statistics need to be analyzed without identifying specific users. For example, the percentage of female users compared to male users on a social media platform. </p><p>We don't recommend using gender binary predictions to make decisions that impact&#x2028; an individual's rights, privacy, or access to services.</p>
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
 <p>The identifier for the unsafe content job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetContentModeration</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Maximum number of results to return per paginated call. The largest value you can specify is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value is 1000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete (because there is more data to retrieve), Amazon Rekognition returns a pagination token in the response. You can use this pagination token to retrieve the next set of unsafe content labels.</p>
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
 <p>The current status of the unsafe content analysis job.</p>
 */
@property (nonatomic, assign) AWSRekognitionVideoJobStatus jobStatus;

/**
 <p>The detected unsafe content labels and the time(s) they were detected.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionContentModerationDetection *> * _Nullable moderationLabels;

/**
 <p>Version number of the moderation detection model that was used to detect unsafe content.</p>
 */
@property (nonatomic, strong) NSString * _Nullable moderationModelVersion;

/**
 <p>If the response is truncated, Amazon Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of unsafe content labels. </p>
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
@interface AWSRekognitionGetTextDetectionRequest : AWSRequest


/**
 <p>Job identifier for the label detection operation for which you want results returned. You get the job identifer from an initial call to <code>StartTextDetection</code>.</p>
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
 <p>The S3 bucket that contains the Ground Truth manifest file.</p>
 */
@interface AWSRekognitionGroundTruthManifest : AWSModel


/**
 <p>Provides the S3 bucket name and object name.</p><p>The region for the S3 bucket containing the S3 object must match the region you use for Amazon Rekognition operations.</p><p>For Amazon Rekognition to process an S3 object, the user must have permission to access the S3 object. For more information, see Resource-Based Policies in the Amazon Rekognition Developer Guide. </p>
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
 <p>The Amazon Resource Name (ARN) of the flow definition.</p>
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
 <p>Provides the input image either as bytes or an S3 object.</p><p>You pass image bytes to an Amazon Rekognition API operation by using the <code>Bytes</code> property. For example, you would use the <code>Bytes</code> property to pass an image loaded from a local file system. Image bytes passed by using the <code>Bytes</code> property must be base64-encoded. Your code may not need to encode image bytes if you are using an AWS SDK to call Amazon Rekognition API operations. </p><p>For more information, see Analyzing an Image Loaded from a Local File System in the Amazon Rekognition Developer Guide.</p><p> You pass images stored in an S3 bucket to an Amazon Rekognition API operation by using the <code>S3Object</code> property. Images stored in an S3 bucket do not need to be base64-encoded.</p><p>The region for the S3 bucket containing the S3 object must match the region you use for Amazon Rekognition operations.</p><p>If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes using the Bytes property is not supported. You must first upload the image to an Amazon S3 bucket and then call the operation using the S3Object property.</p><p>For Amazon Rekognition to process an S3 object, the user must have permission to access the S3 object. For more information, see Resource Based Policies in the Amazon Rekognition Developer Guide. </p>
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
 <p>Structure containing details about the detected label, including the name, detected instances, parent labels, and level of confidence.</p><p></p>
 */
@interface AWSRekognitionLabel : AWSModel


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
 <p>Information about a label detected in a video analysis request and the time the label was detected in the video. </p>
 */
@interface AWSRekognitionLabelDetection : AWSModel


/**
 <p>Details about the detected label.</p>
 */
@property (nonatomic, strong) AWSRekognitionLabel * _Nullable label;

/**
 <p>Time, in milliseconds from the start of the video, that the label was detected.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timestamp;

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
 <p>The x-coordinate from the top left of the landmark expressed as the ratio of the width of the image. For example, if the image is 700 x 200 and the x-coordinate of the landmark is at 350 pixels, this value is 0.5. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable X;

/**
 <p>The y-coordinate from the top left of the landmark expressed as the ratio of the height of the image. For example, if the image is 700 x 200 and the y-coordinate of the landmark is at 100 pixels, this value is 0.5.</p>
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
 <p>Provides information about a single type of unsafe content found in an image or video. Each type of moderated content has a label within a hierarchical taxonomy. For more information, see Detecting Unsafe Content in the Amazon Rekognition Developer Guide.</p>
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
 <p>The Amazon Simple Notification Service topic to which Amazon Rekognition publishes the completion status of a video analysis operation. For more information, see <a>api-video</a>.</p>
 Required parameters: [SNSTopicArn, RoleArn]
 */
@interface AWSRekognitionNotificationChannel : AWSModel


/**
 <p>The ARN of an IAM role that gives Amazon Rekognition publishing permissions to the Amazon SNS topic. </p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The Amazon SNS topic to which Amazon Rekognition to posts the completion status.</p>
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
 <p>The time, in milliseconds from the start of the video, that the person's path was tracked.</p>
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
 <p>The X and Y coordinates of a point on an image. The X and Y values returned are ratios of the overall image size. For example, if the input image is 700x200 and the operation returns X=0.5 and Y=0.25, then the point is at the (350,50) pixel coordinate on the image.</p><p>An array of <code>Point</code> objects, <code>Polygon</code>, is returned by <a>DetectText</a> and by <a>DetectCustomLabels</a>. <code>Polygon</code> represents a fine-grained polygon around a detected item. For more information, see Geometry in the Amazon Rekognition Developer Guide. </p>
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
 <p>A description of a Amazon Rekognition Custom Labels project.</p>
 */
@interface AWSRekognitionProjectDescription : AWSModel


/**
 <p>The Unix timestamp for the date and time that the project was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimestamp;

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
 <p>The description of a version of a model.</p>
 */
@interface AWSRekognitionProjectVersionDescription : AWSModel


/**
 <p>The duration, in seconds, that the model version has been billed for training. This value is only returned if the model version has been successfully trained.</p>
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
 <p>The current status of the model version.</p>
 */
@property (nonatomic, assign) AWSRekognitionProjectVersionStatus status;

/**
 <p>A descriptive message for an error or warning that occurred.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>The manifest file that represents the testing results.</p>
 */
@property (nonatomic, strong) AWSRekognitionTestingDataResult * _Nullable testingDataResult;

/**
 <p>The manifest file that represents the training results.</p>
 */
@property (nonatomic, strong) AWSRekognitionTrainingDataResult * _Nullable trainingDataResult;

/**
 <p>The Unix date and time that training of the model ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable trainingEndTimestamp;

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
 <p>Details about each celebrity found in the image. Amazon Rekognition can detect a maximum of 15 celebrities in an image.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionCelebrity *> * _Nullable celebrityFaces;

/**
 <p>The orientation of the input image (counterclockwise direction). If your application displays the image, you can use this value to correct the orientation. The bounding box coordinates returned in <code>CelebrityFaces</code> and <code>UnrecognizedFaces</code> represent face locations before the image orientation is corrected. </p><note><p>If the input image is in .jpeg format, it might contain exchangeable image (Exif) metadata that includes the image's orientation. If so, and the Exif metadata for the input image populates the orientation field, the value of <code>OrientationCorrection</code> is null. The <code>CelebrityFaces</code> and <code>UnrecognizedFaces</code> bounding box coordinates represent face locations after Exif metadata is used to correct the image orientation. Images in .png format don't contain Exif metadata. </p></note>
 */
@property (nonatomic, assign) AWSRekognitionOrientationCorrection orientationCorrection;

/**
 <p>Details about each unrecognized face in the image.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionComparedFace *> * _Nullable unrecognizedFaces;

@end

/**
 <p>Specifies a location within the frame that Rekognition checks for text. Uses a <code>BoundingBox</code> object to set a region of the screen.</p><p>A word is included in the region if the word is more than half in that region. If there is more than one region, the word will be compared with all regions of the screen. Any word more than half in a region is kept in the results.</p>
 */
@interface AWSRekognitionRegionOfInterest : AWSModel


/**
 <p>The box representing a region of interest on screen.</p>
 */
@property (nonatomic, strong) AWSRekognitionBoundingBox * _Nullable boundingBox;

@end

/**
 <p>Provides the S3 bucket name and object name.</p><p>The region for the S3 bucket containing the S3 object must match the region you use for Amazon Rekognition operations.</p><p>For Amazon Rekognition to process an S3 object, the user must have permission to access the S3 object. For more information, see Resource-Based Policies in the Amazon Rekognition Developer Guide. </p>
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
 <p>The Amazon SNS topic ARN that you want Amazon Rekognition Video to publish the completion status of the celebrity recognition analysis to.</p>
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
 <p>The Amazon SNS topic ARN that you want Amazon Rekognition Video to publish the completion status of the unsafe content analysis to.</p>
 */
@property (nonatomic, strong) AWSRekognitionNotificationChannel * _Nullable notificationChannel;

/**
 <p>The video in which you want to detect unsafe content. The video must be stored in an Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) AWSRekognitionVideo * _Nullable video;

@end

/**
 
 */
@interface AWSRekognitionStartContentModerationResponse : AWSModel


/**
 <p>The identifier for the unsafe content analysis job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetContentModeration</code>.</p>
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
 <p>The ARN of the Amazon SNS topic to which you want Amazon Rekognition Video to publish the completion status of the face detection operation.</p>
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
 <p>The ARN of the Amazon SNS topic to which you want Amazon Rekognition Video to publish the completion status of the search. </p>
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
 <p>An identifier you specify that's returned in the completion notification that's published to your Amazon Simple Notification Service topic. For example, you can use <code>JobTag</code> to group related jobs and identify them in the completion notification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTag;

/**
 <p>Specifies the minimum confidence that Amazon Rekognition Video must have in order to return a detected label. Confidence represents how certain Amazon Rekognition is that a label is correctly identified.0 is the lowest confidence. 100 is the highest confidence. Amazon Rekognition Video doesn't return any labels with a confidence level lower than this specified value.</p><p>If you don't specify <code>MinConfidence</code>, the operation returns labels with confidence values greater than or equal to 50 percent.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minConfidence;

/**
 <p>The Amazon SNS topic ARN you want Amazon Rekognition Video to publish the completion status of the label detection operation to. </p>
 */
@property (nonatomic, strong) AWSRekognitionNotificationChannel * _Nullable notificationChannel;

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
 <p>The Amazon SNS topic ARN you want Amazon Rekognition Video to publish the completion status of the people detection operation to.</p>
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
 <p>The minimum number of inference units to use. A single inference unit represents 1 hour of processing and can support up to 5 Transaction Pers Second (TPS). Use a higher number to increase the TPS throughput of your model. You are charged for the number of inference units that you use. </p>
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
 
 */
@interface AWSRekognitionStartStreamProcessorRequest : AWSRequest


/**
 <p>The name of the stream processor to start processing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSRekognitionStartStreamProcessorResponse : AWSModel


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
 <p>The Amazon Simple Notification Service topic to which Amazon Rekognition publishes the completion status of a video analysis operation. For more information, see <a>api-video</a>.</p>
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
 <p>An object that recognizes faces in a streaming video. An Amazon Rekognition stream processor is created by a call to <a>CreateStreamProcessor</a>. The request parameters for <code>CreateStreamProcessor</code> describe the Kinesis video stream source for the streaming video, face recognition parameters, and where to stream the analysis resullts. </p>
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
 <p>Information about the source streaming video. </p>
 */
@interface AWSRekognitionStreamProcessorInput : AWSModel


/**
 <p>The Kinesis video stream input stream for the source streaming video.</p>
 */
@property (nonatomic, strong) AWSRekognitionKinesisVideoStream * _Nullable kinesisVideoStream;

@end

/**
 <p>Information about the Amazon Kinesis Data Streams stream to which a Amazon Rekognition Video stream processor streams the results of a video analysis. For more information, see CreateStreamProcessor in the Amazon Rekognition Developer Guide.</p>
 */
@interface AWSRekognitionStreamProcessorOutput : AWSModel


/**
 <p>The Amazon Kinesis Data Streams stream to which the Amazon Rekognition stream processor streams the analysis results.</p>
 */
@property (nonatomic, strong) AWSRekognitionKinesisDataStream * _Nullable kinesisDataStream;

@end

/**
 <p>Input parameters used to recognize faces in a streaming video analyzed by a Amazon Rekognition stream processor.</p>
 */
@interface AWSRekognitionStreamProcessorSettings : AWSModel


/**
 <p>Face search settings to use on a streaming video. </p>
 */
@property (nonatomic, strong) AWSRekognitionFaceSearchSettings * _Nullable faceSearch;

@end

/**
 <p>The S3 bucket that contains the training summary. The training summary includes aggregated evaluation metrics for the entire testing dataset and metrics for each individual label. </p><p>You get the training summary S3 bucket location by calling <a>DescribeProjectVersions</a>. </p>
 */
@interface AWSRekognitionSummary : AWSModel


/**
 <p>Provides the S3 bucket name and object name.</p><p>The region for the S3 bucket containing the S3 object must match the region you use for Amazon Rekognition operations.</p><p>For Amazon Rekognition to process an S3 object, the user must have permission to access the S3 object. For more information, see Resource-Based Policies in the Amazon Rekognition Developer Guide. </p>
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
 <p>The dataset used for testing. Optionally, if <code>AutoCreate</code> is set, Amazon Rekognition Custom Labels creates a testing dataset using an 80/20 split of the training dataset.</p>
 */
@interface AWSRekognitionTestingData : AWSModel


/**
 <p>The assets used for testing.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionAsset *> * _Nullable assets;

/**
 <p>If specified, Amazon Rekognition Custom Labels creates a testing dataset with an 80/20 split of the training dataset.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoCreate;

@end

/**
 <p>A Sagemaker Groundtruth format manifest file representing the dataset used for testing.</p>
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

@end

/**
 <p>Information about a word or line of text detected by <a>DetectText</a>.</p><p>The <code>DetectedText</code> field contains the text that Amazon Rekognition detected in the image. </p><p>Every word and line has an identifier (<code>Id</code>). Each word belongs to a line and has a parent identifier (<code>ParentId</code>) that identifies the line of text in which the word appears. The word <code>Id</code> is also an index for the word within a line of words. </p><p>For more information, see Detecting Text in the Amazon Rekognition Developer Guide.</p>
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
 <p>The time, in milliseconds from the start of the video, that the text was detected.</p>
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
 <p>A Sagemaker Groundtruth format manifest file that represents the dataset used for training.</p>
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
