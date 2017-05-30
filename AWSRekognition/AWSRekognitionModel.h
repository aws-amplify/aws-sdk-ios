//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
    AWSRekognitionErrorImageTooLarge,
    AWSRekognitionErrorInternalServer,
    AWSRekognitionErrorInvalidImageFormat,
    AWSRekognitionErrorInvalidPaginationToken,
    AWSRekognitionErrorInvalidParameter,
    AWSRekognitionErrorInvalidS3Object,
    AWSRekognitionErrorProvisionedThroughputExceeded,
    AWSRekognitionErrorResourceAlreadyExists,
    AWSRekognitionErrorResourceNotFound,
    AWSRekognitionErrorThrottling,
};

typedef NS_ENUM(NSInteger, AWSRekognitionAttribute) {
    AWSRekognitionAttributeUnknown,
    AWSRekognitionAttributeDefault,
    AWSRekognitionAttributeAll,
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
};

typedef NS_ENUM(NSInteger, AWSRekognitionGenderType) {
    AWSRekognitionGenderTypeUnknown,
    AWSRekognitionGenderTypeMale,
    AWSRekognitionGenderTypeFemale,
};

typedef NS_ENUM(NSInteger, AWSRekognitionLandmarkType) {
    AWSRekognitionLandmarkTypeUnknown,
    AWSRekognitionLandmarkTypeEyeLeft,
    AWSRekognitionLandmarkTypeEyeRight,
    AWSRekognitionLandmarkTypeNose,
    AWSRekognitionLandmarkTypeMouthLeft,
    AWSRekognitionLandmarkTypeMouthRight,
    AWSRekognitionLandmarkTypeLeftEyebrowLeft,
    AWSRekognitionLandmarkTypeLeftEyebrowRight,
    AWSRekognitionLandmarkTypeLeftEyebrowUp,
    AWSRekognitionLandmarkTypeRightEyebrowLeft,
    AWSRekognitionLandmarkTypeRightEyebrowRight,
    AWSRekognitionLandmarkTypeRightEyebrowUp,
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
};

typedef NS_ENUM(NSInteger, AWSRekognitionOrientationCorrection) {
    AWSRekognitionOrientationCorrectionUnknown,
    AWSRekognitionOrientationCorrectionRotate0,
    AWSRekognitionOrientationCorrectionRotate90,
    AWSRekognitionOrientationCorrectionRotate180,
    AWSRekognitionOrientationCorrectionRotate270,
};

@class AWSRekognitionAgeRange;
@class AWSRekognitionBeard;
@class AWSRekognitionBoundingBox;
@class AWSRekognitionCompareFacesMatch;
@class AWSRekognitionCompareFacesRequest;
@class AWSRekognitionCompareFacesResponse;
@class AWSRekognitionComparedFace;
@class AWSRekognitionComparedSourceImageFace;
@class AWSRekognitionCreateCollectionRequest;
@class AWSRekognitionCreateCollectionResponse;
@class AWSRekognitionDeleteCollectionRequest;
@class AWSRekognitionDeleteCollectionResponse;
@class AWSRekognitionDeleteFacesRequest;
@class AWSRekognitionDeleteFacesResponse;
@class AWSRekognitionDetectFacesRequest;
@class AWSRekognitionDetectFacesResponse;
@class AWSRekognitionDetectLabelsRequest;
@class AWSRekognitionDetectLabelsResponse;
@class AWSRekognitionDetectModerationLabelsRequest;
@class AWSRekognitionDetectModerationLabelsResponse;
@class AWSRekognitionEmotion;
@class AWSRekognitionEyeOpen;
@class AWSRekognitionEyeglasses;
@class AWSRekognitionFace;
@class AWSRekognitionFaceDetail;
@class AWSRekognitionFaceMatch;
@class AWSRekognitionFaceRecord;
@class AWSRekognitionGender;
@class AWSRekognitionImage;
@class AWSRekognitionImageQuality;
@class AWSRekognitionIndexFacesRequest;
@class AWSRekognitionIndexFacesResponse;
@class AWSRekognitionLabel;
@class AWSRekognitionLandmark;
@class AWSRekognitionListCollectionsRequest;
@class AWSRekognitionListCollectionsResponse;
@class AWSRekognitionListFacesRequest;
@class AWSRekognitionListFacesResponse;
@class AWSRekognitionModerationLabel;
@class AWSRekognitionMouthOpen;
@class AWSRekognitionMustache;
@class AWSRekognitionPose;
@class AWSRekognitionS3Object;
@class AWSRekognitionSearchFacesByImageRequest;
@class AWSRekognitionSearchFacesByImageResponse;
@class AWSRekognitionSearchFacesRequest;
@class AWSRekognitionSearchFacesResponse;
@class AWSRekognitionSmile;
@class AWSRekognitionSunglasses;

/**
 <p>Structure containing the estimated age range, in years, for a face.</p><p>Rekognition estimates an age-range for faces detected in the input image. Estimated age ranges can overlap; a face of a 5 year old may have an estimated range of 4-6 whilst the face of a 6 year old may have an estimated range of 4-8.</p>
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
 <p>Identifies the bounding box around the object or face. The <code>left</code> (x-coordinate) and <code>top</code> (y-coordinate) are coordinates representing the top and left sides of the bounding box. Note that the upper-left corner of the image is the origin (0,0). </p><p>The <code>top</code> and <code>left</code> values returned are ratios of the overall image size. For example, if the input image is 700x200 pixels, and the top-left coordinate of the bounding box is 350x50 pixels, the API returns a <code>left</code> value of 0.5 (350/700) and a <code>top</code> value of 0.25 (50/200).</p><p> The <code>width</code> and <code>height</code> values represent the dimensions of the bounding box as a ratio of the overall image dimension. For example, if the input image is 700x200 pixels, and the bounding box width is 70 pixels, the width returned is 0.1. </p><note><p> The bounding box coordinates can have negative values. For example, if Amazon Rekognition is able to detect a face that is at the image edge and is only partially visible, the service can return coordinates that are outside the image bounds and, depending on the image edge, you might get negative values or values greater than 1 for the <code>left</code> or <code>top</code> values. </p></note>
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
 <p>For the provided the bounding box, confidence level that the bounding box actually contains a face, and the similarity between the face in the bounding box and the face in the source image.</p>
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
 <p>The minimum level of confidence in the match you want included in the result.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable similarityThreshold;

/**
 <p>Source image either as bytes or an S3 object</p>
 */
@property (nonatomic, strong) AWSRekognitionImage * _Nullable sourceImage;

/**
 <p>Target image either as bytes or an S3 object</p>
 */
@property (nonatomic, strong) AWSRekognitionImage * _Nullable targetImage;

@end

/**
 
 */
@interface AWSRekognitionCompareFacesResponse : AWSModel


/**
 <p>Provides an array of <code>CompareFacesMatch</code> objects. Each object provides the bounding box, confidence that the bounding box contains a face, and the similarity between the face in the bounding box and the face in the source image.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionCompareFacesMatch *> * _Nullable faceMatches;

/**
 <p>The face from the source image that was used for comparison.</p>
 */
@property (nonatomic, strong) AWSRekognitionComparedSourceImageFace * _Nullable sourceImageFace;

@end

/**
 <p>Provides face metadata (bounding box and confidence that the bounding box actually contains a face).</p>
 */
@interface AWSRekognitionComparedFace : AWSModel


/**
 <p>Identifies the bounding box around the object or face. The <code>left</code> (x-coordinate) and <code>top</code> (y-coordinate) are coordinates representing the top and left sides of the bounding box. Note that the upper-left corner of the image is the origin (0,0). </p><p>The <code>top</code> and <code>left</code> values returned are ratios of the overall image size. For example, if the input image is 700x200 pixels, and the top-left coordinate of the bounding box is 350x50 pixels, the API returns a <code>left</code> value of 0.5 (350/700) and a <code>top</code> value of 0.25 (50/200).</p><p> The <code>width</code> and <code>height</code> values represent the dimensions of the bounding box as a ratio of the overall image dimension. For example, if the input image is 700x200 pixels, and the bounding box width is 70 pixels, the width returned is 0.1. </p><note><p> The bounding box coordinates can have negative values. For example, if Amazon Rekognition is able to detect a face that is at the image edge and is only partially visible, the service can return coordinates that are outside the image bounds and, depending on the image edge, you might get negative values or values greater than 1 for the <code>left</code> or <code>top</code> values. </p></note>
 */
@property (nonatomic, strong) AWSRekognitionBoundingBox * _Nullable boundingBox;

/**
 <p>Level of confidence that what the bounding box contains is a face.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

@end

/**
 <p>Type that describes the face Amazon Rekognition chose to compare with the faces in the target. This contains a bounding box for the selected face and confidence level that the bounding box contains a face. Note that Amazon Rekognition selects the largest face in the source image for this comparison. </p>
 */
@interface AWSRekognitionComparedSourceImageFace : AWSModel


/**
 <p>Identifies the bounding box around the object or face. The <code>left</code> (x-coordinate) and <code>top</code> (y-coordinate) are coordinates representing the top and left sides of the bounding box. Note that the upper-left corner of the image is the origin (0,0). </p><p>The <code>top</code> and <code>left</code> values returned are ratios of the overall image size. For example, if the input image is 700x200 pixels, and the top-left coordinate of the bounding box is 350x50 pixels, the API returns a <code>left</code> value of 0.5 (350/700) and a <code>top</code> value of 0.25 (50/200).</p><p> The <code>width</code> and <code>height</code> values represent the dimensions of the bounding box as a ratio of the overall image dimension. For example, if the input image is 700x200 pixels, and the bounding box width is 70 pixels, the width returned is 0.1. </p><note><p> The bounding box coordinates can have negative values. For example, if Amazon Rekognition is able to detect a face that is at the image edge and is only partially visible, the service can return coordinates that are outside the image bounds and, depending on the image edge, you might get negative values or values greater than 1 for the <code>left</code> or <code>top</code> values. </p></note>
 */
@property (nonatomic, strong) AWSRekognitionBoundingBox * _Nullable boundingBox;

/**
 <p>Confidence level that the selected bounding box contains a face.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

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
 <p>HTTP status code indicating the result of the operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable statusCode;

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
@interface AWSRekognitionDetectFacesRequest : AWSRequest


/**
 <p>A list of facial attributes you want to be returned. This can be the default list of attributes or all attributes. If you don't specify a value for <code>Attributes</code> or if you specify <code>["DEFAULT"]</code>, the API returns the following subset of facial attributes: <code>BoundingBox</code>, <code>Confidence</code>, <code>Pose</code>, <code>Quality</code> and <code>Landmarks</code>. If you provide <code>["ALL"]</code>, all facial attributes are returned but the operation will take longer to complete.</p><p>If you provide both, <code>["ALL", "DEFAULT"]</code>, the service uses a logical AND operator to determine which attributes to return (in this case, all attributes). </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributes;

/**
 <p>The image in which you want to detect faces. You can specify a blob or an S3 object. </p>
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
 <p>The algorithm detects the image orientation. If it detects that the image was rotated, it returns the degrees of rotation. If your application is displaying the image, you can use this value to adjust the orientation. </p><p>For example, if the service detects that the input image was rotated by 90 degrees, it corrects orientation, performs face detection, and then returns the faces. That is, the bounding box coordinates in the response are based on the corrected orientation. </p><note><p>If the source image Exif metadata populates the orientation field, Amazon Rekognition does not perform orientation correction and the value of OrientationCorrection will be nil.</p></note>
 */
@property (nonatomic, assign) AWSRekognitionOrientationCorrection orientationCorrection;

@end

/**
 
 */
@interface AWSRekognitionDetectLabelsRequest : AWSRequest


/**
 <p>The input image. You can provide a blob of image bytes or an S3 object.</p>
 */
@property (nonatomic, strong) AWSRekognitionImage * _Nullable image;

/**
 <p>Maximum number of labels you want the service to return in the response. The service returns the specified number of highest confidence labels. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxLabels;

/**
 <p>Specifies the minimum confidence level for the labels to return. Amazon Rekognition doesn't return any labels with confidence lower than this specified value.</p><p>If <code>MinConfidence</code> is not specified, the operation returns labels with a confidence values greater than or equal to 50 percent.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minConfidence;

@end

/**
 
 */
@interface AWSRekognitionDetectLabelsResponse : AWSModel


/**
 <p>An array of labels for the real-world objects detected. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionLabel *> * _Nullable labels;

/**
 <p> Amazon Rekognition returns the orientation of the input image that was detected (clockwise direction). If your application displays the image, you can use this value to correct the orientation. If Amazon Rekognition detects that the input image was rotated (for example, by 90 degrees), it first corrects the orientation before detecting the labels. </p><note><p>If the source image Exif metadata populates the orientation field, Amazon Rekognition does not perform orientation correction and the value of OrientationCorrection will be nil.</p></note>
 */
@property (nonatomic, assign) AWSRekognitionOrientationCorrection orientationCorrection;

@end

/**
 
 */
@interface AWSRekognitionDetectModerationLabelsRequest : AWSRequest


/**
 <p>Provides the source image either as bytes or an S3 object.</p><p>The region for the S3 bucket containing the S3 object must match the region you use for Amazon Rekognition operations.</p><p>You may need to Base64-encode the image bytes depending on the language you are using and whether or not you are using the AWS SDK. For more information, see <a>example4</a>.</p><p>If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes using the Bytes property is not supported. You must first upload the image to an Amazon S3 bucket and then call the operation using the S3Object property.</p><p>For Amazon Rekognition to process an S3 object, the user must have permission to access the S3 object. For more information, see <a>manage-access-resource-policies</a>. </p>
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
 <p>A list of labels for explicit or suggestive adult content found in the image. The list includes the top-level label and each child label detected in the image. This is useful for filtering specific categories of content. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionModerationLabel *> * _Nullable moderationLabels;

@end

/**
 <p>The emotions detected on the face, and the confidence level in the determination. For example, HAPPY, SAD, and ANGRY.</p>
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
 <p>Describes the face properties such as the bounding box, face ID, image ID of the source image, and external image ID that you assigned. </p>
 */
@interface AWSRekognitionFace : AWSModel


/**
 <p>Identifies the bounding box around the object or face. The <code>left</code> (x-coordinate) and <code>top</code> (y-coordinate) are coordinates representing the top and left sides of the bounding box. Note that the upper-left corner of the image is the origin (0,0). </p><p>The <code>top</code> and <code>left</code> values returned are ratios of the overall image size. For example, if the input image is 700x200 pixels, and the top-left coordinate of the bounding box is 350x50 pixels, the API returns a <code>left</code> value of 0.5 (350/700) and a <code>top</code> value of 0.25 (50/200).</p><p> The <code>width</code> and <code>height</code> values represent the dimensions of the bounding box as a ratio of the overall image dimension. For example, if the input image is 700x200 pixels, and the bounding box width is 70 pixels, the width returned is 0.1. </p><note><p> The bounding box coordinates can have negative values. For example, if Amazon Rekognition is able to detect a face that is at the image edge and is only partially visible, the service can return coordinates that are outside the image bounds and, depending on the image edge, you might get negative values or values greater than 1 for the <code>left</code> or <code>top</code> values. </p></note>
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
 <p>Unique identifier that Amazon Rekognition assigns to the source image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

@end

/**
 <p>Structure containing attributes of the face that the algorithm detected.</p>
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
 <p>Bounding box of the face.</p>
 */
@property (nonatomic, strong) AWSRekognitionBoundingBox * _Nullable boundingBox;

/**
 <p>Confidence level that the bounding box contains a face (and not a different object such as a tree).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>The emotions detected on the face, and the confidence level in the determination. For example, HAPPY, SAD, and ANGRY. </p>
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
 <p>Gender of the face and the confidence level in the determination.</p>
 */
@property (nonatomic, strong) AWSRekognitionGender * _Nullable gender;

/**
 <p>Indicates the location of the landmark on the face.</p>
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
 <p>Indicates the pose of the face as determined by pitch, roll, and the yaw.</p>
 */
@property (nonatomic, strong) AWSRekognitionPose * _Nullable pose;

/**
 <p>Identifies image brightness and sharpness.</p>
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
 <p>Provides face metadata. In addition, it also provides the confidence in the match of this face with the input face.</p>
 */
@interface AWSRekognitionFaceMatch : AWSModel


/**
 <p>Describes the face properties such as the bounding box, face ID, image ID of the source image, and external image ID that you assigned. </p>
 */
@property (nonatomic, strong) AWSRekognitionFace * _Nullable face;

/**
 <p>Confidence in the match of this face with the input face.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable similarity;

@end

/**
 <p>Object containing both the face metadata (stored in the back-end database) and facial attributes that are detected but aren't stored in the database.</p>
 */
@interface AWSRekognitionFaceRecord : AWSModel


/**
 <p>Describes the face properties such as the bounding box, face ID, image ID of the source image, and external image ID that you assigned. </p>
 */
@property (nonatomic, strong) AWSRekognitionFace * _Nullable face;

/**
 <p>Structure containing attributes of the face that the algorithm detected.</p>
 */
@property (nonatomic, strong) AWSRekognitionFaceDetail * _Nullable faceDetail;

@end

/**
 <p>Gender of the face and the confidence level in the determination.</p>
 */
@interface AWSRekognitionGender : AWSModel


/**
 <p>Level of confidence in the determination.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>Gender of the face.</p>
 */
@property (nonatomic, assign) AWSRekognitionGenderType value;

@end

/**
 <p>Provides the source image either as bytes or an S3 object.</p><p>The region for the S3 bucket containing the S3 object must match the region you use for Amazon Rekognition operations.</p><p>You may need to Base64-encode the image bytes depending on the language you are using and whether or not you are using the AWS SDK. For more information, see <a>example4</a>.</p><p>If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes using the Bytes property is not supported. You must first upload the image to an Amazon S3 bucket and then call the operation using the S3Object property.</p><p>For Amazon Rekognition to process an S3 object, the user must have permission to access the S3 object. For more information, see <a>manage-access-resource-policies</a>. </p>
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
 <p>A list of facial attributes that you want to be returned. This can be the default list of attributes or all attributes. If you don't specify a value for <code>Attributes</code> or if you specify <code>["DEFAULT"]</code>, the API returns the following subset of facial attributes: <code>BoundingBox</code>, <code>Confidence</code>, <code>Pose</code>, <code>Quality</code> and <code>Landmarks</code>. If you provide <code>["ALL"]</code>, all facial attributes are returned but the operation will take longer to complete.</p><p>If you provide both, <code>["ALL", "DEFAULT"]</code>, the service uses a logical AND operator to determine which attributes to return (in this case, all attributes). </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable detectionAttributes;

/**
 <p>ID you want to assign to all the faces detected in the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalImageId;

/**
 <p>Provides the source image either as bytes or an S3 object.</p><p>The region for the S3 bucket containing the S3 object must match the region you use for Amazon Rekognition operations.</p><p>You may need to Base64-encode the image bytes depending on the language you are using and whether or not you are using the AWS SDK. For more information, see <a>example4</a>.</p><p>If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes using the Bytes property is not supported. You must first upload the image to an Amazon S3 bucket and then call the operation using the S3Object property.</p><p>For Amazon Rekognition to process an S3 object, the user must have permission to access the S3 object. For more information, see <a>manage-access-resource-policies</a>. </p>
 */
@property (nonatomic, strong) AWSRekognitionImage * _Nullable image;

@end

/**
 
 */
@interface AWSRekognitionIndexFacesResponse : AWSModel


/**
 <p>An array of faces detected and added to the collection. For more information, see <a>howitworks-index-faces</a>. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionFaceRecord *> * _Nullable faceRecords;

/**
 <p>The algorithm detects the image orientation. If it detects that the image was rotated, it returns the degree of rotation. You can use this value to correct the orientation and also appropriately analyze the bounding box coordinates that are returned. </p><note><p>If the source image Exif metadata populates the orientation field, Amazon Rekognition does not perform orientation correction and the value of OrientationCorrection will be nil.</p></note>
 */
@property (nonatomic, assign) AWSRekognitionOrientationCorrection orientationCorrection;

@end

/**
 <p>Structure containing details about the detected label, including name, and level of confidence.</p>
 */
@interface AWSRekognitionLabel : AWSModel


/**
 <p>Level of confidence.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>The name (label) of the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Indicates the location of the landmark on the face.</p>
 */
@interface AWSRekognitionLandmark : AWSModel


/**
 <p>Type of the landmark.</p>
 */
@property (nonatomic, assign) AWSRekognitionLandmarkType types;

/**
 <p>x-coordinate from the top left of the landmark expressed as the ration of the width of the image. For example, if the images is 700x200 and the x-coordinate of the landmark is at 350 pixels, this value is 0.5. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable X;

/**
 <p>y-coordinate from the top left of the landmark expressed as the ration of the height of the image. For example, if the images is 700x200 and the y-coordinate of the landmark is at 100 pixels, this value is 0.5.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable Y;

@end

/**
 
 */
@interface AWSRekognitionListCollectionsRequest : AWSRequest


/**
 <p>Maximum number of collection IDs to return.</p>
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
 <p>An array of <code>Face</code> objects. </p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionFace *> * _Nullable faces;

/**
 <p>If the response is truncated, Amazon Rekognition returns this token that you can use in the subsequent request to retrieve the next set of faces.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Provides information about a single type of moderated content found in an image. Each type of moderated content has a label within a hierarchical taxonomy. For more information, see <a>howitworks-moderateimage</a>.</p>
 */
@interface AWSRekognitionModerationLabel : AWSModel


/**
 <p>Specifies the confidence that Amazon Rekognition has that the label has been correctly identified.</p><p>If you don't specify the <code>MinConfidence</code> parameter in the call to <code>DetectModerationLabels</code>, the operation returns labels with a confidence value greater than or equal to 50 percent.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>The label name for the type of content detected in the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The name for the parent label. Labels at the top-level of the hierarchy have the parent label <code>""</code>.</p>
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
 <p>Indicates the pose of the face as determined by pitch, roll, and the yaw.</p>
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
 <p>Provides the S3 bucket name and object name.</p><p>The region for the S3 bucket containing the S3 object must match the region you use for Amazon Rekognition operations.</p><p>For Amazon Rekognition to process an S3 object, the user must have permission to access the S3 object. For more information, see <a>manage-access-resource-policies</a>. </p>
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
 <p>(Optional) Specifies the minimum confidence in the face match to return. For example, don't return any matches where confidence in matches is less than 70%.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable faceMatchThreshold;

/**
 <p>Provides the source image either as bytes or an S3 object.</p><p>The region for the S3 bucket containing the S3 object must match the region you use for Amazon Rekognition operations.</p><p>You may need to Base64-encode the image bytes depending on the language you are using and whether or not you are using the AWS SDK. For more information, see <a>example4</a>.</p><p>If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes using the Bytes property is not supported. You must first upload the image to an Amazon S3 bucket and then call the operation using the S3Object property.</p><p>For Amazon Rekognition to process an S3 object, the user must have permission to access the S3 object. For more information, see <a>manage-access-resource-policies</a>. </p>
 */
@property (nonatomic, strong) AWSRekognitionImage * _Nullable image;

/**
 <p>Maximum number of faces to return. The operation returns the maximum number of faces with the highest confidence in the match.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxFaces;

@end

/**
 
 */
@interface AWSRekognitionSearchFacesByImageResponse : AWSModel


/**
 <p>An array of faces that match the input face, along with the confidence in the match.</p>
 */
@property (nonatomic, strong) NSArray<AWSRekognitionFaceMatch *> * _Nullable faceMatches;

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
 <p>Optional value specifying the minimum confidence in the face match to return. For example, don't return any matches where confidence in matches is less than 70%.</p>
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

NS_ASSUME_NONNULL_END
