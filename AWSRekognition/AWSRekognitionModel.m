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

#import "AWSRekognitionModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSRekognitionErrorDomain = @"com.amazonaws.AWSRekognitionErrorDomain";

@implementation AWSRekognitionAgeRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"high" : @"High",
             @"low" : @"Low",
             };
}

@end

@implementation AWSRekognitionBeard

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"value" : @"Value",
             };
}

@end

@implementation AWSRekognitionBoundingBox

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"height" : @"Height",
             @"left" : @"Left",
             @"top" : @"Top",
             @"width" : @"Width",
             };
}

@end

@implementation AWSRekognitionCompareFacesMatch

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"face" : @"Face",
             @"similarity" : @"Similarity",
             };
}

+ (NSValueTransformer *)faceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionComparedFace class]];
}

@end

@implementation AWSRekognitionCompareFacesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"similarityThreshold" : @"SimilarityThreshold",
             @"sourceImage" : @"SourceImage",
             @"targetImage" : @"TargetImage",
             };
}

+ (NSValueTransformer *)sourceImageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionImage class]];
}

+ (NSValueTransformer *)targetImageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionImage class]];
}

@end

@implementation AWSRekognitionCompareFacesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceMatches" : @"FaceMatches",
             @"sourceImageFace" : @"SourceImageFace",
             };
}

+ (NSValueTransformer *)faceMatchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionCompareFacesMatch class]];
}

+ (NSValueTransformer *)sourceImageFaceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionComparedSourceImageFace class]];
}

@end

@implementation AWSRekognitionComparedFace

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"boundingBox" : @"BoundingBox",
             @"confidence" : @"Confidence",
             };
}

+ (NSValueTransformer *)boundingBoxJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionBoundingBox class]];
}

@end

@implementation AWSRekognitionComparedSourceImageFace

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"boundingBox" : @"BoundingBox",
             @"confidence" : @"Confidence",
             };
}

+ (NSValueTransformer *)boundingBoxJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionBoundingBox class]];
}

@end

@implementation AWSRekognitionCreateCollectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionId" : @"CollectionId",
             };
}

@end

@implementation AWSRekognitionCreateCollectionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionArn" : @"CollectionArn",
             @"statusCode" : @"StatusCode",
             };
}

@end

@implementation AWSRekognitionDeleteCollectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionId" : @"CollectionId",
             };
}

@end

@implementation AWSRekognitionDeleteCollectionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"statusCode" : @"StatusCode",
             };
}

@end

@implementation AWSRekognitionDeleteFacesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionId" : @"CollectionId",
             @"faceIds" : @"FaceIds",
             };
}

@end

@implementation AWSRekognitionDeleteFacesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletedFaces" : @"DeletedFaces",
             };
}

@end

@implementation AWSRekognitionDetectFacesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"image" : @"Image",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionImage class]];
}

@end

@implementation AWSRekognitionDetectFacesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceDetails" : @"FaceDetails",
             @"orientationCorrection" : @"OrientationCorrection",
             };
}

+ (NSValueTransformer *)faceDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionFaceDetail class]];
}

+ (NSValueTransformer *)orientationCorrectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ROTATE_0"] == NSOrderedSame) {
            return @(AWSRekognitionOrientationCorrectionRotate0);
        }
        if ([value caseInsensitiveCompare:@"ROTATE_90"] == NSOrderedSame) {
            return @(AWSRekognitionOrientationCorrectionRotate90);
        }
        if ([value caseInsensitiveCompare:@"ROTATE_180"] == NSOrderedSame) {
            return @(AWSRekognitionOrientationCorrectionRotate180);
        }
        if ([value caseInsensitiveCompare:@"ROTATE_270"] == NSOrderedSame) {
            return @(AWSRekognitionOrientationCorrectionRotate270);
        }
        return @(AWSRekognitionOrientationCorrectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionOrientationCorrectionRotate0:
                return @"ROTATE_0";
            case AWSRekognitionOrientationCorrectionRotate90:
                return @"ROTATE_90";
            case AWSRekognitionOrientationCorrectionRotate180:
                return @"ROTATE_180";
            case AWSRekognitionOrientationCorrectionRotate270:
                return @"ROTATE_270";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionDetectLabelsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"image" : @"Image",
             @"maxLabels" : @"MaxLabels",
             @"minConfidence" : @"MinConfidence",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionImage class]];
}

@end

@implementation AWSRekognitionDetectLabelsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labels" : @"Labels",
             @"orientationCorrection" : @"OrientationCorrection",
             };
}

+ (NSValueTransformer *)labelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionLabel class]];
}

+ (NSValueTransformer *)orientationCorrectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ROTATE_0"] == NSOrderedSame) {
            return @(AWSRekognitionOrientationCorrectionRotate0);
        }
        if ([value caseInsensitiveCompare:@"ROTATE_90"] == NSOrderedSame) {
            return @(AWSRekognitionOrientationCorrectionRotate90);
        }
        if ([value caseInsensitiveCompare:@"ROTATE_180"] == NSOrderedSame) {
            return @(AWSRekognitionOrientationCorrectionRotate180);
        }
        if ([value caseInsensitiveCompare:@"ROTATE_270"] == NSOrderedSame) {
            return @(AWSRekognitionOrientationCorrectionRotate270);
        }
        return @(AWSRekognitionOrientationCorrectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionOrientationCorrectionRotate0:
                return @"ROTATE_0";
            case AWSRekognitionOrientationCorrectionRotate90:
                return @"ROTATE_90";
            case AWSRekognitionOrientationCorrectionRotate180:
                return @"ROTATE_180";
            case AWSRekognitionOrientationCorrectionRotate270:
                return @"ROTATE_270";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionDetectModerationLabelsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"image" : @"Image",
             @"minConfidence" : @"MinConfidence",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionImage class]];
}

@end

@implementation AWSRekognitionDetectModerationLabelsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"moderationLabels" : @"ModerationLabels",
             };
}

+ (NSValueTransformer *)moderationLabelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionModerationLabel class]];
}

@end

@implementation AWSRekognitionEmotion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HAPPY"] == NSOrderedSame) {
            return @(AWSRekognitionEmotionNameHappy);
        }
        if ([value caseInsensitiveCompare:@"SAD"] == NSOrderedSame) {
            return @(AWSRekognitionEmotionNameSad);
        }
        if ([value caseInsensitiveCompare:@"ANGRY"] == NSOrderedSame) {
            return @(AWSRekognitionEmotionNameAngry);
        }
        if ([value caseInsensitiveCompare:@"CONFUSED"] == NSOrderedSame) {
            return @(AWSRekognitionEmotionNameConfused);
        }
        if ([value caseInsensitiveCompare:@"DISGUSTED"] == NSOrderedSame) {
            return @(AWSRekognitionEmotionNameDisgusted);
        }
        if ([value caseInsensitiveCompare:@"SURPRISED"] == NSOrderedSame) {
            return @(AWSRekognitionEmotionNameSurprised);
        }
        if ([value caseInsensitiveCompare:@"CALM"] == NSOrderedSame) {
            return @(AWSRekognitionEmotionNameCalm);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSRekognitionEmotionNameUnknown);
        }
        return @(AWSRekognitionEmotionNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionEmotionNameHappy:
                return @"HAPPY";
            case AWSRekognitionEmotionNameSad:
                return @"SAD";
            case AWSRekognitionEmotionNameAngry:
                return @"ANGRY";
            case AWSRekognitionEmotionNameConfused:
                return @"CONFUSED";
            case AWSRekognitionEmotionNameDisgusted:
                return @"DISGUSTED";
            case AWSRekognitionEmotionNameSurprised:
                return @"SURPRISED";
            case AWSRekognitionEmotionNameCalm:
                return @"CALM";
            case AWSRekognitionEmotionNameUnknown:
                return @"UNKNOWN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionEyeOpen

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"value" : @"Value",
             };
}

@end

@implementation AWSRekognitionEyeglasses

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"value" : @"Value",
             };
}

@end

@implementation AWSRekognitionFace

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"boundingBox" : @"BoundingBox",
             @"confidence" : @"Confidence",
             @"externalImageId" : @"ExternalImageId",
             @"faceId" : @"FaceId",
             @"imageId" : @"ImageId",
             };
}

+ (NSValueTransformer *)boundingBoxJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionBoundingBox class]];
}

@end

@implementation AWSRekognitionFaceDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ageRange" : @"AgeRange",
             @"beard" : @"Beard",
             @"boundingBox" : @"BoundingBox",
             @"confidence" : @"Confidence",
             @"emotions" : @"Emotions",
             @"eyeglasses" : @"Eyeglasses",
             @"eyesOpen" : @"EyesOpen",
             @"gender" : @"Gender",
             @"landmarks" : @"Landmarks",
             @"mouthOpen" : @"MouthOpen",
             @"mustache" : @"Mustache",
             @"pose" : @"Pose",
             @"quality" : @"Quality",
             @"smile" : @"Smile",
             @"sunglasses" : @"Sunglasses",
             };
}

+ (NSValueTransformer *)ageRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionAgeRange class]];
}

+ (NSValueTransformer *)beardJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionBeard class]];
}

+ (NSValueTransformer *)boundingBoxJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionBoundingBox class]];
}

+ (NSValueTransformer *)emotionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionEmotion class]];
}

+ (NSValueTransformer *)eyeglassesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionEyeglasses class]];
}

+ (NSValueTransformer *)eyesOpenJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionEyeOpen class]];
}

+ (NSValueTransformer *)genderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionGender class]];
}

+ (NSValueTransformer *)landmarksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionLandmark class]];
}

+ (NSValueTransformer *)mouthOpenJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionMouthOpen class]];
}

+ (NSValueTransformer *)mustacheJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionMustache class]];
}

+ (NSValueTransformer *)poseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionPose class]];
}

+ (NSValueTransformer *)qualityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionImageQuality class]];
}

+ (NSValueTransformer *)smileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionSmile class]];
}

+ (NSValueTransformer *)sunglassesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionSunglasses class]];
}

@end

@implementation AWSRekognitionFaceMatch

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"face" : @"Face",
             @"similarity" : @"Similarity",
             };
}

+ (NSValueTransformer *)faceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionFace class]];
}

@end

@implementation AWSRekognitionFaceRecord

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"face" : @"Face",
             @"faceDetail" : @"FaceDetail",
             };
}

+ (NSValueTransformer *)faceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionFace class]];
}

+ (NSValueTransformer *)faceDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionFaceDetail class]];
}

@end

@implementation AWSRekognitionGender

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MALE"] == NSOrderedSame) {
            return @(AWSRekognitionGenderTypeMale);
        }
        if ([value caseInsensitiveCompare:@"FEMALE"] == NSOrderedSame) {
            return @(AWSRekognitionGenderTypeFemale);
        }
        return @(AWSRekognitionGenderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionGenderTypeMale:
                return @"MALE";
            case AWSRekognitionGenderTypeFemale:
                return @"FEMALE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionImage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bytes" : @"Bytes",
             @"s3Object" : @"S3Object",
             };
}

+ (NSValueTransformer *)s3ObjectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionS3Object class]];
}

@end

@implementation AWSRekognitionImageQuality

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"brightness" : @"Brightness",
             @"sharpness" : @"Sharpness",
             };
}

@end

@implementation AWSRekognitionIndexFacesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionId" : @"CollectionId",
             @"detectionAttributes" : @"DetectionAttributes",
             @"externalImageId" : @"ExternalImageId",
             @"image" : @"Image",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionImage class]];
}

@end

@implementation AWSRekognitionIndexFacesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceRecords" : @"FaceRecords",
             @"orientationCorrection" : @"OrientationCorrection",
             };
}

+ (NSValueTransformer *)faceRecordsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionFaceRecord class]];
}

+ (NSValueTransformer *)orientationCorrectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ROTATE_0"] == NSOrderedSame) {
            return @(AWSRekognitionOrientationCorrectionRotate0);
        }
        if ([value caseInsensitiveCompare:@"ROTATE_90"] == NSOrderedSame) {
            return @(AWSRekognitionOrientationCorrectionRotate90);
        }
        if ([value caseInsensitiveCompare:@"ROTATE_180"] == NSOrderedSame) {
            return @(AWSRekognitionOrientationCorrectionRotate180);
        }
        if ([value caseInsensitiveCompare:@"ROTATE_270"] == NSOrderedSame) {
            return @(AWSRekognitionOrientationCorrectionRotate270);
        }
        return @(AWSRekognitionOrientationCorrectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionOrientationCorrectionRotate0:
                return @"ROTATE_0";
            case AWSRekognitionOrientationCorrectionRotate90:
                return @"ROTATE_90";
            case AWSRekognitionOrientationCorrectionRotate180:
                return @"ROTATE_180";
            case AWSRekognitionOrientationCorrectionRotate270:
                return @"ROTATE_270";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionLabel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"name" : @"Name",
             };
}

@end

@implementation AWSRekognitionLandmark

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"X" : @"X",
             @"Y" : @"Y",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EYE_LEFT"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeEyeLeft);
        }
        if ([value caseInsensitiveCompare:@"EYE_RIGHT"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeEyeRight);
        }
        if ([value caseInsensitiveCompare:@"NOSE"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeNose);
        }
        if ([value caseInsensitiveCompare:@"MOUTH_LEFT"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeMouthLeft);
        }
        if ([value caseInsensitiveCompare:@"MOUTH_RIGHT"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeMouthRight);
        }
        if ([value caseInsensitiveCompare:@"LEFT_EYEBROW_LEFT"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeLeftEyebrowLeft);
        }
        if ([value caseInsensitiveCompare:@"LEFT_EYEBROW_RIGHT"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeLeftEyebrowRight);
        }
        if ([value caseInsensitiveCompare:@"LEFT_EYEBROW_UP"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeLeftEyebrowUp);
        }
        if ([value caseInsensitiveCompare:@"RIGHT_EYEBROW_LEFT"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeRightEyebrowLeft);
        }
        if ([value caseInsensitiveCompare:@"RIGHT_EYEBROW_RIGHT"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeRightEyebrowRight);
        }
        if ([value caseInsensitiveCompare:@"RIGHT_EYEBROW_UP"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeRightEyebrowUp);
        }
        if ([value caseInsensitiveCompare:@"LEFT_EYE_LEFT"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeLeftEyeLeft);
        }
        if ([value caseInsensitiveCompare:@"LEFT_EYE_RIGHT"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeLeftEyeRight);
        }
        if ([value caseInsensitiveCompare:@"LEFT_EYE_UP"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeLeftEyeUp);
        }
        if ([value caseInsensitiveCompare:@"LEFT_EYE_DOWN"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeLeftEyeDown);
        }
        if ([value caseInsensitiveCompare:@"RIGHT_EYE_LEFT"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeRightEyeLeft);
        }
        if ([value caseInsensitiveCompare:@"RIGHT_EYE_RIGHT"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeRightEyeRight);
        }
        if ([value caseInsensitiveCompare:@"RIGHT_EYE_UP"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeRightEyeUp);
        }
        if ([value caseInsensitiveCompare:@"RIGHT_EYE_DOWN"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeRightEyeDown);
        }
        if ([value caseInsensitiveCompare:@"NOSE_LEFT"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeNoseLeft);
        }
        if ([value caseInsensitiveCompare:@"NOSE_RIGHT"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeNoseRight);
        }
        if ([value caseInsensitiveCompare:@"MOUTH_UP"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeMouthUp);
        }
        if ([value caseInsensitiveCompare:@"MOUTH_DOWN"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeMouthDown);
        }
        if ([value caseInsensitiveCompare:@"LEFT_PUPIL"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeLeftPupil);
        }
        if ([value caseInsensitiveCompare:@"RIGHT_PUPIL"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeRightPupil);
        }
        return @(AWSRekognitionLandmarkTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionLandmarkTypeEyeLeft:
                return @"EYE_LEFT";
            case AWSRekognitionLandmarkTypeEyeRight:
                return @"EYE_RIGHT";
            case AWSRekognitionLandmarkTypeNose:
                return @"NOSE";
            case AWSRekognitionLandmarkTypeMouthLeft:
                return @"MOUTH_LEFT";
            case AWSRekognitionLandmarkTypeMouthRight:
                return @"MOUTH_RIGHT";
            case AWSRekognitionLandmarkTypeLeftEyebrowLeft:
                return @"LEFT_EYEBROW_LEFT";
            case AWSRekognitionLandmarkTypeLeftEyebrowRight:
                return @"LEFT_EYEBROW_RIGHT";
            case AWSRekognitionLandmarkTypeLeftEyebrowUp:
                return @"LEFT_EYEBROW_UP";
            case AWSRekognitionLandmarkTypeRightEyebrowLeft:
                return @"RIGHT_EYEBROW_LEFT";
            case AWSRekognitionLandmarkTypeRightEyebrowRight:
                return @"RIGHT_EYEBROW_RIGHT";
            case AWSRekognitionLandmarkTypeRightEyebrowUp:
                return @"RIGHT_EYEBROW_UP";
            case AWSRekognitionLandmarkTypeLeftEyeLeft:
                return @"LEFT_EYE_LEFT";
            case AWSRekognitionLandmarkTypeLeftEyeRight:
                return @"LEFT_EYE_RIGHT";
            case AWSRekognitionLandmarkTypeLeftEyeUp:
                return @"LEFT_EYE_UP";
            case AWSRekognitionLandmarkTypeLeftEyeDown:
                return @"LEFT_EYE_DOWN";
            case AWSRekognitionLandmarkTypeRightEyeLeft:
                return @"RIGHT_EYE_LEFT";
            case AWSRekognitionLandmarkTypeRightEyeRight:
                return @"RIGHT_EYE_RIGHT";
            case AWSRekognitionLandmarkTypeRightEyeUp:
                return @"RIGHT_EYE_UP";
            case AWSRekognitionLandmarkTypeRightEyeDown:
                return @"RIGHT_EYE_DOWN";
            case AWSRekognitionLandmarkTypeNoseLeft:
                return @"NOSE_LEFT";
            case AWSRekognitionLandmarkTypeNoseRight:
                return @"NOSE_RIGHT";
            case AWSRekognitionLandmarkTypeMouthUp:
                return @"MOUTH_UP";
            case AWSRekognitionLandmarkTypeMouthDown:
                return @"MOUTH_DOWN";
            case AWSRekognitionLandmarkTypeLeftPupil:
                return @"LEFT_PUPIL";
            case AWSRekognitionLandmarkTypeRightPupil:
                return @"RIGHT_PUPIL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionListCollectionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSRekognitionListCollectionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionIds" : @"CollectionIds",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSRekognitionListFacesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionId" : @"CollectionId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSRekognitionListFacesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faces" : @"Faces",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)facesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionFace class]];
}

@end

@implementation AWSRekognitionModerationLabel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"name" : @"Name",
             @"parentName" : @"ParentName",
             };
}

@end

@implementation AWSRekognitionMouthOpen

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"value" : @"Value",
             };
}

@end

@implementation AWSRekognitionMustache

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"value" : @"Value",
             };
}

@end

@implementation AWSRekognitionPose

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pitch" : @"Pitch",
             @"roll" : @"Roll",
             @"yaw" : @"Yaw",
             };
}

@end

@implementation AWSRekognitionS3Object

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"name" : @"Name",
             @"version" : @"Version",
             };
}

@end

@implementation AWSRekognitionSearchFacesByImageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionId" : @"CollectionId",
             @"faceMatchThreshold" : @"FaceMatchThreshold",
             @"image" : @"Image",
             @"maxFaces" : @"MaxFaces",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionImage class]];
}

@end

@implementation AWSRekognitionSearchFacesByImageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceMatches" : @"FaceMatches",
             @"searchedFaceBoundingBox" : @"SearchedFaceBoundingBox",
             @"searchedFaceConfidence" : @"SearchedFaceConfidence",
             };
}

+ (NSValueTransformer *)faceMatchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionFaceMatch class]];
}

+ (NSValueTransformer *)searchedFaceBoundingBoxJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionBoundingBox class]];
}

@end

@implementation AWSRekognitionSearchFacesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionId" : @"CollectionId",
             @"faceId" : @"FaceId",
             @"faceMatchThreshold" : @"FaceMatchThreshold",
             @"maxFaces" : @"MaxFaces",
             };
}

@end

@implementation AWSRekognitionSearchFacesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceMatches" : @"FaceMatches",
             @"searchedFaceId" : @"SearchedFaceId",
             };
}

+ (NSValueTransformer *)faceMatchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionFaceMatch class]];
}

@end

@implementation AWSRekognitionSmile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"value" : @"Value",
             };
}

@end

@implementation AWSRekognitionSunglasses

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"value" : @"Value",
             };
}

@end
