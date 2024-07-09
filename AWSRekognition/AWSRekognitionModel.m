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

#import "AWSRekognitionModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSRekognitionErrorDomain = @"com.amazonaws.AWSRekognitionErrorDomain";

@implementation AWSRekognitionAgeRange

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"high" : @"High",
             @"low" : @"Low",
             };
}

@end

@implementation AWSRekognitionAsset

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groundTruthManifest" : @"GroundTruthManifest",
             };
}

+ (NSValueTransformer *)groundTruthManifestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionGroundTruthManifest class]];
}

@end

@implementation AWSRekognitionAssociateFacesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"collectionId" : @"CollectionId",
             @"faceIds" : @"FaceIds",
             @"userId" : @"UserId",
             @"userMatchThreshold" : @"UserMatchThreshold",
             };
}

@end

@implementation AWSRekognitionAssociateFacesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associatedFaces" : @"AssociatedFaces",
             @"unsuccessfulFaceAssociations" : @"UnsuccessfulFaceAssociations",
             @"userStatus" : @"UserStatus",
             };
}

+ (NSValueTransformer *)associatedFacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionAssociatedFace class]];
}

+ (NSValueTransformer *)unsuccessfulFaceAssociationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionUnsuccessfulFaceAssociation class]];
}

+ (NSValueTransformer *)userStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSRekognitionUserStatusActive);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSRekognitionUserStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSRekognitionUserStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSRekognitionUserStatusCreated);
        }
        return @(AWSRekognitionUserStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionUserStatusActive:
                return @"ACTIVE";
            case AWSRekognitionUserStatusUpdating:
                return @"UPDATING";
            case AWSRekognitionUserStatusCreating:
                return @"CREATING";
            case AWSRekognitionUserStatusCreated:
                return @"CREATED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionAssociatedFace

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceId" : @"FaceId",
             };
}

@end

@implementation AWSRekognitionAudioMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codec" : @"Codec",
             @"durationMillis" : @"DurationMillis",
             @"numberOfChannels" : @"NumberOfChannels",
             @"sampleRate" : @"SampleRate",
             };
}

@end

@implementation AWSRekognitionAuditImage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"boundingBox" : @"BoundingBox",
             @"bytes" : @"Bytes",
             @"s3Object" : @"S3Object",
             };
}

+ (NSValueTransformer *)boundingBoxJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionBoundingBox class]];
}

+ (NSValueTransformer *)s3ObjectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionS3Object class]];
}

@end

@implementation AWSRekognitionBeard

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"value" : @"Value",
             };
}

@end

@implementation AWSRekognitionBlackFrame

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxPixelThreshold" : @"MaxPixelThreshold",
             @"minCoveragePercentage" : @"MinCoveragePercentage",
             };
}

@end

@implementation AWSRekognitionBoundingBox

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"height" : @"Height",
             @"left" : @"Left",
             @"top" : @"Top",
             @"width" : @"Width",
             };
}

@end

@implementation AWSRekognitionCelebrity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"face" : @"Face",
             @"identifier" : @"Id",
             @"knownGender" : @"KnownGender",
             @"matchConfidence" : @"MatchConfidence",
             @"name" : @"Name",
             @"urls" : @"Urls",
             };
}

+ (NSValueTransformer *)faceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionComparedFace class]];
}

+ (NSValueTransformer *)knownGenderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionKnownGender class]];
}

@end

@implementation AWSRekognitionCelebrityDetail

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"boundingBox" : @"BoundingBox",
             @"confidence" : @"Confidence",
             @"face" : @"Face",
             @"identifier" : @"Id",
             @"knownGender" : @"KnownGender",
             @"name" : @"Name",
             @"urls" : @"Urls",
             };
}

+ (NSValueTransformer *)boundingBoxJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionBoundingBox class]];
}

+ (NSValueTransformer *)faceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionFaceDetail class]];
}

+ (NSValueTransformer *)knownGenderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionKnownGender class]];
}

@end

@implementation AWSRekognitionCelebrityRecognition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"celebrity" : @"Celebrity",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)celebrityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionCelebrityDetail class]];
}

@end

@implementation AWSRekognitionCompareFacesMatch

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"qualityFilter" : @"QualityFilter",
             @"similarityThreshold" : @"SimilarityThreshold",
             @"sourceImage" : @"SourceImage",
             @"targetImage" : @"TargetImage",
             };
}

+ (NSValueTransformer *)qualityFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSRekognitionQualityFilterNone);
        }
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSRekognitionQualityFilterAuto);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSRekognitionQualityFilterLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSRekognitionQualityFilterMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSRekognitionQualityFilterHigh);
        }
        return @(AWSRekognitionQualityFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionQualityFilterNone:
                return @"NONE";
            case AWSRekognitionQualityFilterAuto:
                return @"AUTO";
            case AWSRekognitionQualityFilterLow:
                return @"LOW";
            case AWSRekognitionQualityFilterMedium:
                return @"MEDIUM";
            case AWSRekognitionQualityFilterHigh:
                return @"HIGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourceImageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionImage class]];
}

+ (NSValueTransformer *)targetImageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionImage class]];
}

@end

@implementation AWSRekognitionCompareFacesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceMatches" : @"FaceMatches",
             @"sourceImageFace" : @"SourceImageFace",
             @"sourceImageOrientationCorrection" : @"SourceImageOrientationCorrection",
             @"targetImageOrientationCorrection" : @"TargetImageOrientationCorrection",
             @"unmatchedFaces" : @"UnmatchedFaces",
             };
}

+ (NSValueTransformer *)faceMatchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionCompareFacesMatch class]];
}

+ (NSValueTransformer *)sourceImageFaceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionComparedSourceImageFace class]];
}

+ (NSValueTransformer *)sourceImageOrientationCorrectionJSONTransformer {
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

+ (NSValueTransformer *)targetImageOrientationCorrectionJSONTransformer {
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

+ (NSValueTransformer *)unmatchedFacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionComparedFace class]];
}

@end

@implementation AWSRekognitionComparedFace

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"boundingBox" : @"BoundingBox",
             @"confidence" : @"Confidence",
             @"emotions" : @"Emotions",
             @"landmarks" : @"Landmarks",
             @"pose" : @"Pose",
             @"quality" : @"Quality",
             @"smile" : @"Smile",
             };
}

+ (NSValueTransformer *)boundingBoxJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionBoundingBox class]];
}

+ (NSValueTransformer *)emotionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionEmotion class]];
}

+ (NSValueTransformer *)landmarksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionLandmark class]];
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

@end

@implementation AWSRekognitionComparedSourceImageFace

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSRekognitionConnectedHomeSettings

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labels" : @"Labels",
             @"minConfidence" : @"MinConfidence",
             };
}

@end

@implementation AWSRekognitionConnectedHomeSettingsForUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labels" : @"Labels",
             @"minConfidence" : @"MinConfidence",
             };
}

@end

@implementation AWSRekognitionContentModerationDetection

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentTypes" : @"ContentTypes",
             @"durationMillis" : @"DurationMillis",
             @"endTimestampMillis" : @"EndTimestampMillis",
             @"moderationLabel" : @"ModerationLabel",
             @"startTimestampMillis" : @"StartTimestampMillis",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)contentTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionContentType class]];
}

+ (NSValueTransformer *)moderationLabelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionModerationLabel class]];
}

@end

@implementation AWSRekognitionContentType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"name" : @"Name",
             };
}

@end

@implementation AWSRekognitionReplicateProjectVersionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationProjectArn" : @"DestinationProjectArn",
             @"kmsKeyId" : @"KmsKeyId",
             @"outputConfig" : @"OutputConfig",
             @"sourceProjectArn" : @"SourceProjectArn",
             @"sourceProjectVersionArn" : @"SourceProjectVersionArn",
             @"tags" : @"Tags",
             @"versionName" : @"VersionName",
             };
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionOutputConfig class]];
}

@end

@implementation AWSRekognitionReplicateProjectVersionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectVersionArn" : @"ProjectVersionArn",
             };
}

@end

@implementation AWSRekognitionCoversBodyPart

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"value" : @"Value",
             };
}

@end

@implementation AWSRekognitionCreateCollectionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionId" : @"CollectionId",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSRekognitionCreateCollectionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionArn" : @"CollectionArn",
             @"faceModelVersion" : @"FaceModelVersion",
             @"statusCode" : @"StatusCode",
             };
}

@end

@implementation AWSRekognitionCreateDatasetRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetSource" : @"DatasetSource",
             @"datasetType" : @"DatasetType",
             @"projectArn" : @"ProjectArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)datasetSourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionDatasetSource class]];
}

+ (NSValueTransformer *)datasetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRAIN"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetTypeTrain);
        }
        if ([value caseInsensitiveCompare:@"TEST"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetTypeTest);
        }
        return @(AWSRekognitionDatasetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionDatasetTypeTrain:
                return @"TRAIN";
            case AWSRekognitionDatasetTypeTest:
                return @"TEST";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionCreateDatasetResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetArn" : @"DatasetArn",
             };
}

@end

@implementation AWSRekognitionCreateFaceLivenessSessionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"kmsKeyId" : @"KmsKeyId",
             @"settings" : @"Settings",
             };
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionCreateFaceLivenessSessionRequestSettings class]];
}

@end

@implementation AWSRekognitionCreateFaceLivenessSessionRequestSettings

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"auditImagesLimit" : @"AuditImagesLimit",
             @"outputConfig" : @"OutputConfig",
             };
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionLivenessOutputConfig class]];
}

@end

@implementation AWSRekognitionCreateFaceLivenessSessionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionId" : @"SessionId",
             };
}

@end

@implementation AWSRekognitionCreateProjectRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoUpdate" : @"AutoUpdate",
             @"feature" : @"Feature",
             @"projectName" : @"ProjectName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)autoUpdateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectAutoUpdateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectAutoUpdateDisabled);
        }
        return @(AWSRekognitionProjectAutoUpdateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionProjectAutoUpdateEnabled:
                return @"ENABLED";
            case AWSRekognitionProjectAutoUpdateDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)featureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONTENT_MODERATION"] == NSOrderedSame) {
            return @(AWSRekognitionCustomizationFeatureContentModeration);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM_LABELS"] == NSOrderedSame) {
            return @(AWSRekognitionCustomizationFeatureCustomLabels);
        }
        return @(AWSRekognitionCustomizationFeatureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionCustomizationFeatureContentModeration:
                return @"CONTENT_MODERATION";
            case AWSRekognitionCustomizationFeatureCustomLabels:
                return @"CUSTOM_LABELS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionCreateProjectResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectArn" : @"ProjectArn",
             };
}

@end

@implementation AWSRekognitionCreateProjectVersionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"featureConfig" : @"FeatureConfig",
             @"kmsKeyId" : @"KmsKeyId",
             @"outputConfig" : @"OutputConfig",
             @"projectArn" : @"ProjectArn",
             @"tags" : @"Tags",
             @"testingData" : @"TestingData",
             @"trainingData" : @"TrainingData",
             @"versionDescription" : @"VersionDescription",
             @"versionName" : @"VersionName",
             };
}

+ (NSValueTransformer *)featureConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionCustomizationFeatureConfig class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionOutputConfig class]];
}

+ (NSValueTransformer *)testingDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionTestingData class]];
}

+ (NSValueTransformer *)trainingDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionTrainingData class]];
}

@end

@implementation AWSRekognitionCreateProjectVersionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectVersionArn" : @"ProjectVersionArn",
             };
}

@end

@implementation AWSRekognitionCreateStreamProcessorRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSharingPreference" : @"DataSharingPreference",
             @"input" : @"Input",
             @"kmsKeyId" : @"KmsKeyId",
             @"name" : @"Name",
             @"notificationChannel" : @"NotificationChannel",
             @"output" : @"Output",
             @"regionsOfInterest" : @"RegionsOfInterest",
             @"roleArn" : @"RoleArn",
             @"settings" : @"Settings",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)dataSharingPreferenceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStreamProcessorDataSharingPreference class]];
}

+ (NSValueTransformer *)inputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStreamProcessorInput class]];
}

+ (NSValueTransformer *)notificationChannelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStreamProcessorNotificationChannel class]];
}

+ (NSValueTransformer *)outputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStreamProcessorOutput class]];
}

+ (NSValueTransformer *)regionsOfInterestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionRegionOfInterest class]];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStreamProcessorSettings class]];
}

@end

@implementation AWSRekognitionCreateStreamProcessorResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamProcessorArn" : @"StreamProcessorArn",
             };
}

@end

@implementation AWSRekognitionCreateUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"collectionId" : @"CollectionId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSRekognitionCreateUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSRekognitionCustomLabel

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"geometry" : @"Geometry",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)geometryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionGeometry class]];
}

@end

@implementation AWSRekognitionCustomizationFeatureConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentModeration" : @"ContentModeration",
             };
}

+ (NSValueTransformer *)contentModerationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionCustomizationFeatureContentModerationConfig class]];
}

@end

@implementation AWSRekognitionCustomizationFeatureContentModerationConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidenceThreshold" : @"ConfidenceThreshold",
             };
}

@end

@implementation AWSRekognitionDatasetChanges

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groundTruth" : @"GroundTruth",
             };
}

@end

@implementation AWSRekognitionDatasetDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimestamp" : @"CreationTimestamp",
             @"datasetStats" : @"DatasetStats",
             @"lastUpdatedTimestamp" : @"LastUpdatedTimestamp",
             @"status" : @"Status",
             @"statusMessage" : @"StatusMessage",
             @"statusMessageCode" : @"StatusMessageCode",
             };
}

+ (NSValueTransformer *)creationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)datasetStatsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionDatasetStats class]];
}

+ (NSValueTransformer *)lastUpdatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetStatusCreateInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetStatusCreateComplete);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetStatusCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetStatusUpdateInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetStatusUpdateComplete);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetStatusUpdateFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetStatusDeleteInProgress);
        }
        return @(AWSRekognitionDatasetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionDatasetStatusCreateInProgress:
                return @"CREATE_IN_PROGRESS";
            case AWSRekognitionDatasetStatusCreateComplete:
                return @"CREATE_COMPLETE";
            case AWSRekognitionDatasetStatusCreateFailed:
                return @"CREATE_FAILED";
            case AWSRekognitionDatasetStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            case AWSRekognitionDatasetStatusUpdateComplete:
                return @"UPDATE_COMPLETE";
            case AWSRekognitionDatasetStatusUpdateFailed:
                return @"UPDATE_FAILED";
            case AWSRekognitionDatasetStatusDeleteInProgress:
                return @"DELETE_IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusMessageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetStatusMessageCodeSuccess);
        }
        if ([value caseInsensitiveCompare:@"SERVICE_ERROR"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetStatusMessageCodeServiceError);
        }
        if ([value caseInsensitiveCompare:@"CLIENT_ERROR"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetStatusMessageCodeClientError);
        }
        return @(AWSRekognitionDatasetStatusMessageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionDatasetStatusMessageCodeSuccess:
                return @"SUCCESS";
            case AWSRekognitionDatasetStatusMessageCodeServiceError:
                return @"SERVICE_ERROR";
            case AWSRekognitionDatasetStatusMessageCodeClientError:
                return @"CLIENT_ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionDatasetLabelDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelName" : @"LabelName",
             @"labelStats" : @"LabelStats",
             };
}

+ (NSValueTransformer *)labelStatsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionDatasetLabelStats class]];
}

@end

@implementation AWSRekognitionDatasetLabelStats

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"boundingBoxCount" : @"BoundingBoxCount",
             @"entryCount" : @"EntryCount",
             };
}

@end

@implementation AWSRekognitionDatasetMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimestamp" : @"CreationTimestamp",
             @"datasetArn" : @"DatasetArn",
             @"datasetType" : @"DatasetType",
             @"status" : @"Status",
             @"statusMessage" : @"StatusMessage",
             @"statusMessageCode" : @"StatusMessageCode",
             };
}

+ (NSValueTransformer *)creationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)datasetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRAIN"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetTypeTrain);
        }
        if ([value caseInsensitiveCompare:@"TEST"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetTypeTest);
        }
        return @(AWSRekognitionDatasetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionDatasetTypeTrain:
                return @"TRAIN";
            case AWSRekognitionDatasetTypeTest:
                return @"TEST";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetStatusCreateInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetStatusCreateComplete);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetStatusCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetStatusUpdateInProgress);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_COMPLETE"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetStatusUpdateComplete);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetStatusUpdateFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetStatusDeleteInProgress);
        }
        return @(AWSRekognitionDatasetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionDatasetStatusCreateInProgress:
                return @"CREATE_IN_PROGRESS";
            case AWSRekognitionDatasetStatusCreateComplete:
                return @"CREATE_COMPLETE";
            case AWSRekognitionDatasetStatusCreateFailed:
                return @"CREATE_FAILED";
            case AWSRekognitionDatasetStatusUpdateInProgress:
                return @"UPDATE_IN_PROGRESS";
            case AWSRekognitionDatasetStatusUpdateComplete:
                return @"UPDATE_COMPLETE";
            case AWSRekognitionDatasetStatusUpdateFailed:
                return @"UPDATE_FAILED";
            case AWSRekognitionDatasetStatusDeleteInProgress:
                return @"DELETE_IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusMessageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetStatusMessageCodeSuccess);
        }
        if ([value caseInsensitiveCompare:@"SERVICE_ERROR"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetStatusMessageCodeServiceError);
        }
        if ([value caseInsensitiveCompare:@"CLIENT_ERROR"] == NSOrderedSame) {
            return @(AWSRekognitionDatasetStatusMessageCodeClientError);
        }
        return @(AWSRekognitionDatasetStatusMessageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionDatasetStatusMessageCodeSuccess:
                return @"SUCCESS";
            case AWSRekognitionDatasetStatusMessageCodeServiceError:
                return @"SERVICE_ERROR";
            case AWSRekognitionDatasetStatusMessageCodeClientError:
                return @"CLIENT_ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionDatasetSource

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetArn" : @"DatasetArn",
             @"groundTruthManifest" : @"GroundTruthManifest",
             };
}

+ (NSValueTransformer *)groundTruthManifestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionGroundTruthManifest class]];
}

@end

@implementation AWSRekognitionDatasetStats

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorEntries" : @"ErrorEntries",
             @"labeledEntries" : @"LabeledEntries",
             @"totalEntries" : @"TotalEntries",
             @"totalLabels" : @"TotalLabels",
             };
}

@end

@implementation AWSRekognitionDeleteCollectionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionId" : @"CollectionId",
             };
}

@end

@implementation AWSRekognitionDeleteCollectionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"statusCode" : @"StatusCode",
             };
}

@end

@implementation AWSRekognitionDeleteDatasetRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetArn" : @"DatasetArn",
             };
}

@end

@implementation AWSRekognitionDeleteDatasetResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSRekognitionDeleteFacesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionId" : @"CollectionId",
             @"faceIds" : @"FaceIds",
             };
}

@end

@implementation AWSRekognitionDeleteFacesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletedFaces" : @"DeletedFaces",
             @"unsuccessfulFaceDeletions" : @"UnsuccessfulFaceDeletions",
             };
}

+ (NSValueTransformer *)unsuccessfulFaceDeletionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionUnsuccessfulFaceDeletion class]];
}

@end

@implementation AWSRekognitionDeleteProjectPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"PolicyName",
             @"policyRevisionId" : @"PolicyRevisionId",
             @"projectArn" : @"ProjectArn",
             };
}

@end

@implementation AWSRekognitionDeleteProjectPolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSRekognitionDeleteProjectRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectArn" : @"ProjectArn",
             };
}

@end

@implementation AWSRekognitionDeleteProjectResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSRekognitionProjectStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectStatusCreated);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSRekognitionProjectStatusDeleting);
        }
        return @(AWSRekognitionProjectStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionProjectStatusCreating:
                return @"CREATING";
            case AWSRekognitionProjectStatusCreated:
                return @"CREATED";
            case AWSRekognitionProjectStatusDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionDeleteProjectVersionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectVersionArn" : @"ProjectVersionArn",
             };
}

@end

@implementation AWSRekognitionDeleteProjectVersionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRAINING_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusTrainingInProgress);
        }
        if ([value caseInsensitiveCompare:@"TRAINING_COMPLETED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusTrainingCompleted);
        }
        if ([value caseInsensitiveCompare:@"TRAINING_FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusTrainingFailed);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"COPYING_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusCopyingInProgress);
        }
        if ([value caseInsensitiveCompare:@"COPYING_COMPLETED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusCopyingCompleted);
        }
        if ([value caseInsensitiveCompare:@"COPYING_FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusCopyingFailed);
        }
        if ([value caseInsensitiveCompare:@"DEPRECATED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusDeprecated);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusExpired);
        }
        return @(AWSRekognitionProjectVersionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionProjectVersionStatusTrainingInProgress:
                return @"TRAINING_IN_PROGRESS";
            case AWSRekognitionProjectVersionStatusTrainingCompleted:
                return @"TRAINING_COMPLETED";
            case AWSRekognitionProjectVersionStatusTrainingFailed:
                return @"TRAINING_FAILED";
            case AWSRekognitionProjectVersionStatusStarting:
                return @"STARTING";
            case AWSRekognitionProjectVersionStatusRunning:
                return @"RUNNING";
            case AWSRekognitionProjectVersionStatusFailed:
                return @"FAILED";
            case AWSRekognitionProjectVersionStatusStopping:
                return @"STOPPING";
            case AWSRekognitionProjectVersionStatusStopped:
                return @"STOPPED";
            case AWSRekognitionProjectVersionStatusDeleting:
                return @"DELETING";
            case AWSRekognitionProjectVersionStatusCopyingInProgress:
                return @"COPYING_IN_PROGRESS";
            case AWSRekognitionProjectVersionStatusCopyingCompleted:
                return @"COPYING_COMPLETED";
            case AWSRekognitionProjectVersionStatusCopyingFailed:
                return @"COPYING_FAILED";
            case AWSRekognitionProjectVersionStatusDeprecated:
                return @"DEPRECATED";
            case AWSRekognitionProjectVersionStatusExpired:
                return @"EXPIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionDeleteStreamProcessorRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSRekognitionDeleteStreamProcessorResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSRekognitionDeleteUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"collectionId" : @"CollectionId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSRekognitionDeleteUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSRekognitionDescribeCollectionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionId" : @"CollectionId",
             };
}

@end

@implementation AWSRekognitionDescribeCollectionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionARN" : @"CollectionARN",
             @"creationTimestamp" : @"CreationTimestamp",
             @"faceCount" : @"FaceCount",
             @"faceModelVersion" : @"FaceModelVersion",
             @"userCount" : @"UserCount",
             };
}

+ (NSValueTransformer *)creationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSRekognitionDescribeDatasetRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetArn" : @"DatasetArn",
             };
}

@end

@implementation AWSRekognitionDescribeDatasetResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetDescription" : @"DatasetDescription",
             };
}

+ (NSValueTransformer *)datasetDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionDatasetDescription class]];
}

@end

@implementation AWSRekognitionDescribeProjectVersionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"projectArn" : @"ProjectArn",
             @"versionNames" : @"VersionNames",
             };
}

@end

@implementation AWSRekognitionDescribeProjectVersionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"projectVersionDescriptions" : @"ProjectVersionDescriptions",
             };
}

+ (NSValueTransformer *)projectVersionDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionProjectVersionDescription class]];
}

@end

@implementation AWSRekognitionDescribeProjectsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"features" : @"Features",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"projectNames" : @"ProjectNames",
             };
}

@end

@implementation AWSRekognitionDescribeProjectsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"projectDescriptions" : @"ProjectDescriptions",
             };
}

+ (NSValueTransformer *)projectDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionProjectDescription class]];
}

@end

@implementation AWSRekognitionDescribeStreamProcessorRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSRekognitionDescribeStreamProcessorResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimestamp" : @"CreationTimestamp",
             @"dataSharingPreference" : @"DataSharingPreference",
             @"input" : @"Input",
             @"kmsKeyId" : @"KmsKeyId",
             @"lastUpdateTimestamp" : @"LastUpdateTimestamp",
             @"name" : @"Name",
             @"notificationChannel" : @"NotificationChannel",
             @"output" : @"Output",
             @"regionsOfInterest" : @"RegionsOfInterest",
             @"roleArn" : @"RoleArn",
             @"settings" : @"Settings",
             @"status" : @"Status",
             @"statusMessage" : @"StatusMessage",
             @"streamProcessorArn" : @"StreamProcessorArn",
             };
}

+ (NSValueTransformer *)creationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)dataSharingPreferenceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStreamProcessorDataSharingPreference class]];
}

+ (NSValueTransformer *)inputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStreamProcessorInput class]];
}

+ (NSValueTransformer *)lastUpdateTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)notificationChannelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStreamProcessorNotificationChannel class]];
}

+ (NSValueTransformer *)outputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStreamProcessorOutput class]];
}

+ (NSValueTransformer *)regionsOfInterestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionRegionOfInterest class]];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStreamProcessorSettings class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSRekognitionStreamProcessorStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSRekognitionStreamProcessorStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSRekognitionStreamProcessorStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionStreamProcessorStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSRekognitionStreamProcessorStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSRekognitionStreamProcessorStatusUpdating);
        }
        return @(AWSRekognitionStreamProcessorStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionStreamProcessorStatusStopped:
                return @"STOPPED";
            case AWSRekognitionStreamProcessorStatusStarting:
                return @"STARTING";
            case AWSRekognitionStreamProcessorStatusRunning:
                return @"RUNNING";
            case AWSRekognitionStreamProcessorStatusFailed:
                return @"FAILED";
            case AWSRekognitionStreamProcessorStatusStopping:
                return @"STOPPING";
            case AWSRekognitionStreamProcessorStatusUpdating:
                return @"UPDATING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionDetectCustomLabelsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"image" : @"Image",
             @"maxResults" : @"MaxResults",
             @"minConfidence" : @"MinConfidence",
             @"projectVersionArn" : @"ProjectVersionArn",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionImage class]];
}

@end

@implementation AWSRekognitionDetectCustomLabelsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customLabels" : @"CustomLabels",
             };
}

+ (NSValueTransformer *)customLabelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionCustomLabel class]];
}

@end

@implementation AWSRekognitionDetectFacesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSRekognitionDetectLabelsImageBackground

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dominantColors" : @"DominantColors",
             @"quality" : @"Quality",
             };
}

+ (NSValueTransformer *)dominantColorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionDominantColor class]];
}

+ (NSValueTransformer *)qualityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionDetectLabelsImageQuality class]];
}

@end

@implementation AWSRekognitionDetectLabelsImageForeground

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dominantColors" : @"DominantColors",
             @"quality" : @"Quality",
             };
}

+ (NSValueTransformer *)dominantColorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionDominantColor class]];
}

+ (NSValueTransformer *)qualityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionDetectLabelsImageQuality class]];
}

@end

@implementation AWSRekognitionDetectLabelsImageProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"background" : @"Background",
             @"dominantColors" : @"DominantColors",
             @"foreground" : @"Foreground",
             @"quality" : @"Quality",
             };
}

+ (NSValueTransformer *)backgroundJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionDetectLabelsImageBackground class]];
}

+ (NSValueTransformer *)dominantColorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionDominantColor class]];
}

+ (NSValueTransformer *)foregroundJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionDetectLabelsImageForeground class]];
}

+ (NSValueTransformer *)qualityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionDetectLabelsImageQuality class]];
}

@end

@implementation AWSRekognitionDetectLabelsImagePropertiesSettings

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxDominantColors" : @"MaxDominantColors",
             };
}

@end

@implementation AWSRekognitionDetectLabelsImageQuality

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"brightness" : @"Brightness",
             @"contrast" : @"Contrast",
             @"sharpness" : @"Sharpness",
             };
}

@end

@implementation AWSRekognitionDetectLabelsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"features" : @"Features",
             @"image" : @"Image",
             @"maxLabels" : @"MaxLabels",
             @"minConfidence" : @"MinConfidence",
             @"settings" : @"Settings",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionImage class]];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionDetectLabelsSettings class]];
}

@end

@implementation AWSRekognitionDetectLabelsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageProperties" : @"ImageProperties",
             @"labelModelVersion" : @"LabelModelVersion",
             @"labels" : @"Labels",
             @"orientationCorrection" : @"OrientationCorrection",
             };
}

+ (NSValueTransformer *)imagePropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionDetectLabelsImageProperties class]];
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

@implementation AWSRekognitionDetectLabelsSettings

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"generalLabels" : @"GeneralLabels",
             @"imageProperties" : @"ImageProperties",
             };
}

+ (NSValueTransformer *)generalLabelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionGeneralLabelsSettings class]];
}

+ (NSValueTransformer *)imagePropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionDetectLabelsImagePropertiesSettings class]];
}

@end

@implementation AWSRekognitionDetectModerationLabelsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanLoopConfig" : @"HumanLoopConfig",
             @"image" : @"Image",
             @"minConfidence" : @"MinConfidence",
             @"projectVersion" : @"ProjectVersion",
             };
}

+ (NSValueTransformer *)humanLoopConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionHumanLoopConfig class]];
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionImage class]];
}

@end

@implementation AWSRekognitionDetectModerationLabelsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentTypes" : @"ContentTypes",
             @"humanLoopActivationOutput" : @"HumanLoopActivationOutput",
             @"moderationLabels" : @"ModerationLabels",
             @"moderationModelVersion" : @"ModerationModelVersion",
             @"projectVersion" : @"ProjectVersion",
             };
}

+ (NSValueTransformer *)contentTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionContentType class]];
}

+ (NSValueTransformer *)humanLoopActivationOutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionHumanLoopActivationOutput class]];
}

+ (NSValueTransformer *)moderationLabelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionModerationLabel class]];
}

@end

@implementation AWSRekognitionDetectProtectiveEquipmentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"image" : @"Image",
             @"summarizationAttributes" : @"SummarizationAttributes",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionImage class]];
}

+ (NSValueTransformer *)summarizationAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionProtectiveEquipmentSummarizationAttributes class]];
}

@end

@implementation AWSRekognitionDetectProtectiveEquipmentResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"persons" : @"Persons",
             @"protectiveEquipmentModelVersion" : @"ProtectiveEquipmentModelVersion",
             @"summary" : @"Summary",
             };
}

+ (NSValueTransformer *)personsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionProtectiveEquipmentPerson class]];
}

+ (NSValueTransformer *)summaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionProtectiveEquipmentSummary class]];
}

@end

@implementation AWSRekognitionDetectTextFilters

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regionsOfInterest" : @"RegionsOfInterest",
             @"wordFilter" : @"WordFilter",
             };
}

+ (NSValueTransformer *)regionsOfInterestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionRegionOfInterest class]];
}

+ (NSValueTransformer *)wordFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionDetectionFilter class]];
}

@end

@implementation AWSRekognitionDetectTextRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"image" : @"Image",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionDetectTextFilters class]];
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionImage class]];
}

@end

@implementation AWSRekognitionDetectTextResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"textDetections" : @"TextDetections",
             @"textModelVersion" : @"TextModelVersion",
             };
}

+ (NSValueTransformer *)textDetectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionTextDetection class]];
}

@end

@implementation AWSRekognitionDetectionFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"minBoundingBoxHeight" : @"MinBoundingBoxHeight",
             @"minBoundingBoxWidth" : @"MinBoundingBoxWidth",
             @"minConfidence" : @"MinConfidence",
             };
}

@end

@implementation AWSRekognitionDisassociateFacesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"collectionId" : @"CollectionId",
             @"faceIds" : @"FaceIds",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSRekognitionDisassociateFacesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"disassociatedFaces" : @"DisassociatedFaces",
             @"unsuccessfulFaceDisassociations" : @"UnsuccessfulFaceDisassociations",
             @"userStatus" : @"UserStatus",
             };
}

+ (NSValueTransformer *)disassociatedFacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionDisassociatedFace class]];
}

+ (NSValueTransformer *)unsuccessfulFaceDisassociationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionUnsuccessfulFaceDisassociation class]];
}

+ (NSValueTransformer *)userStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSRekognitionUserStatusActive);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSRekognitionUserStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSRekognitionUserStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSRekognitionUserStatusCreated);
        }
        return @(AWSRekognitionUserStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionUserStatusActive:
                return @"ACTIVE";
            case AWSRekognitionUserStatusUpdating:
                return @"UPDATING";
            case AWSRekognitionUserStatusCreating:
                return @"CREATING";
            case AWSRekognitionUserStatusCreated:
                return @"CREATED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionDisassociatedFace

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceId" : @"FaceId",
             };
}

@end

@implementation AWSRekognitionDistributeDataset

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             };
}

@end

@implementation AWSRekognitionDistributeDatasetEntriesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasets" : @"Datasets",
             };
}

+ (NSValueTransformer *)datasetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionDistributeDataset class]];
}

@end

@implementation AWSRekognitionDistributeDatasetEntriesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSRekognitionDominantColor

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blue" : @"Blue",
             @"CSSColor" : @"CSSColor",
             @"green" : @"Green",
             @"hexCode" : @"HexCode",
             @"pixelPercent" : @"PixelPercent",
             @"red" : @"Red",
             @"simplifiedColor" : @"SimplifiedColor",
             };
}

@end

@implementation AWSRekognitionEmotion

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"FEAR"] == NSOrderedSame) {
            return @(AWSRekognitionEmotionNameFear);
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
            case AWSRekognitionEmotionNameFear:
                return @"FEAR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionEquipmentDetection

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"boundingBox" : @"BoundingBox",
             @"confidence" : @"Confidence",
             @"coversBodyPart" : @"CoversBodyPart",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)boundingBoxJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionBoundingBox class]];
}

+ (NSValueTransformer *)coversBodyPartJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionCoversBodyPart class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FACE_COVER"] == NSOrderedSame) {
            return @(AWSRekognitionProtectiveEquipmentTypeFaceCover);
        }
        if ([value caseInsensitiveCompare:@"HAND_COVER"] == NSOrderedSame) {
            return @(AWSRekognitionProtectiveEquipmentTypeHandCover);
        }
        if ([value caseInsensitiveCompare:@"HEAD_COVER"] == NSOrderedSame) {
            return @(AWSRekognitionProtectiveEquipmentTypeHeadCover);
        }
        return @(AWSRekognitionProtectiveEquipmentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionProtectiveEquipmentTypeFaceCover:
                return @"FACE_COVER";
            case AWSRekognitionProtectiveEquipmentTypeHandCover:
                return @"HAND_COVER";
            case AWSRekognitionProtectiveEquipmentTypeHeadCover:
                return @"HEAD_COVER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionEvaluationResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"f1Score" : @"F1Score",
             @"summary" : @"Summary",
             };
}

+ (NSValueTransformer *)summaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionSummary class]];
}

@end

@implementation AWSRekognitionEyeDirection

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"pitch" : @"Pitch",
             @"yaw" : @"Yaw",
             };
}

@end

@implementation AWSRekognitionEyeOpen

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"value" : @"Value",
             };
}

@end

@implementation AWSRekognitionEyeglasses

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"value" : @"Value",
             };
}

@end

@implementation AWSRekognitionFace

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"boundingBox" : @"BoundingBox",
             @"confidence" : @"Confidence",
             @"externalImageId" : @"ExternalImageId",
             @"faceId" : @"FaceId",
             @"imageId" : @"ImageId",
             @"indexFacesModelVersion" : @"IndexFacesModelVersion",
             @"userId" : @"UserId",
             };
}

+ (NSValueTransformer *)boundingBoxJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionBoundingBox class]];
}

@end

@implementation AWSRekognitionFaceDetail

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ageRange" : @"AgeRange",
             @"beard" : @"Beard",
             @"boundingBox" : @"BoundingBox",
             @"confidence" : @"Confidence",
             @"emotions" : @"Emotions",
             @"eyeDirection" : @"EyeDirection",
             @"eyeglasses" : @"Eyeglasses",
             @"eyesOpen" : @"EyesOpen",
             @"faceOccluded" : @"FaceOccluded",
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

+ (NSValueTransformer *)eyeDirectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionEyeDirection class]];
}

+ (NSValueTransformer *)eyeglassesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionEyeglasses class]];
}

+ (NSValueTransformer *)eyesOpenJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionEyeOpen class]];
}

+ (NSValueTransformer *)faceOccludedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionFaceOccluded class]];
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

@implementation AWSRekognitionFaceDetection

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"face" : @"Face",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)faceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionFaceDetail class]];
}

@end

@implementation AWSRekognitionFaceMatch

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSRekognitionFaceOccluded

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"value" : @"Value",
             };
}

@end

@implementation AWSRekognitionFaceRecord

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSRekognitionFaceSearchSettings

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionId" : @"CollectionId",
             @"faceMatchThreshold" : @"FaceMatchThreshold",
             };
}

@end

@implementation AWSRekognitionGender

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Male"] == NSOrderedSame) {
            return @(AWSRekognitionGenderTypeMale);
        }
        if ([value caseInsensitiveCompare:@"Female"] == NSOrderedSame) {
            return @(AWSRekognitionGenderTypeFemale);
        }
        return @(AWSRekognitionGenderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionGenderTypeMale:
                return @"Male";
            case AWSRekognitionGenderTypeFemale:
                return @"Female";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionGeneralLabelsSettings

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelCategoryExclusionFilters" : @"LabelCategoryExclusionFilters",
             @"labelCategoryInclusionFilters" : @"LabelCategoryInclusionFilters",
             @"labelExclusionFilters" : @"LabelExclusionFilters",
             @"labelInclusionFilters" : @"LabelInclusionFilters",
             };
}

@end

@implementation AWSRekognitionGeometry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"boundingBox" : @"BoundingBox",
             @"polygon" : @"Polygon",
             };
}

+ (NSValueTransformer *)boundingBoxJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionBoundingBox class]];
}

+ (NSValueTransformer *)polygonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionPoint class]];
}

@end

@implementation AWSRekognitionGetCelebrityInfoRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSRekognitionGetCelebrityInfoResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"knownGender" : @"KnownGender",
             @"name" : @"Name",
             @"urls" : @"Urls",
             };
}

+ (NSValueTransformer *)knownGenderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionKnownGender class]];
}

@end

@implementation AWSRekognitionGetCelebrityRecognitionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             };
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ID"] == NSOrderedSame) {
            return @(AWSRekognitionCelebrityRecognitionSortById);
        }
        if ([value caseInsensitiveCompare:@"TIMESTAMP"] == NSOrderedSame) {
            return @(AWSRekognitionCelebrityRecognitionSortByTimestamp);
        }
        return @(AWSRekognitionCelebrityRecognitionSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionCelebrityRecognitionSortById:
                return @"ID";
            case AWSRekognitionCelebrityRecognitionSortByTimestamp:
                return @"TIMESTAMP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionGetCelebrityRecognitionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"celebrities" : @"Celebrities",
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             @"jobTag" : @"JobTag",
             @"nextToken" : @"NextToken",
             @"statusMessage" : @"StatusMessage",
             @"video" : @"Video",
             @"videoMetadata" : @"VideoMetadata",
             };
}

+ (NSValueTransformer *)celebritiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionCelebrityRecognition class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusFailed);
        }
        return @(AWSRekognitionVideoJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionVideoJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSRekognitionVideoJobStatusSucceeded:
                return @"SUCCEEDED";
            case AWSRekognitionVideoJobStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)videoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideo class]];
}

+ (NSValueTransformer *)videoMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideoMetadata class]];
}

@end

@implementation AWSRekognitionGetContentModerationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggregateBy" : @"AggregateBy",
             @"jobId" : @"JobId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             };
}

+ (NSValueTransformer *)aggregateByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TIMESTAMPS"] == NSOrderedSame) {
            return @(AWSRekognitionContentModerationAggregateByTimestamps);
        }
        if ([value caseInsensitiveCompare:@"SEGMENTS"] == NSOrderedSame) {
            return @(AWSRekognitionContentModerationAggregateBySegments);
        }
        return @(AWSRekognitionContentModerationAggregateByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionContentModerationAggregateByTimestamps:
                return @"TIMESTAMPS";
            case AWSRekognitionContentModerationAggregateBySegments:
                return @"SEGMENTS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NAME"] == NSOrderedSame) {
            return @(AWSRekognitionContentModerationSortByName);
        }
        if ([value caseInsensitiveCompare:@"TIMESTAMP"] == NSOrderedSame) {
            return @(AWSRekognitionContentModerationSortByTimestamp);
        }
        return @(AWSRekognitionContentModerationSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionContentModerationSortByName:
                return @"NAME";
            case AWSRekognitionContentModerationSortByTimestamp:
                return @"TIMESTAMP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionGetContentModerationRequestMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggregateBy" : @"AggregateBy",
             @"sortBy" : @"SortBy",
             };
}

+ (NSValueTransformer *)aggregateByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TIMESTAMPS"] == NSOrderedSame) {
            return @(AWSRekognitionContentModerationAggregateByTimestamps);
        }
        if ([value caseInsensitiveCompare:@"SEGMENTS"] == NSOrderedSame) {
            return @(AWSRekognitionContentModerationAggregateBySegments);
        }
        return @(AWSRekognitionContentModerationAggregateByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionContentModerationAggregateByTimestamps:
                return @"TIMESTAMPS";
            case AWSRekognitionContentModerationAggregateBySegments:
                return @"SEGMENTS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NAME"] == NSOrderedSame) {
            return @(AWSRekognitionContentModerationSortByName);
        }
        if ([value caseInsensitiveCompare:@"TIMESTAMP"] == NSOrderedSame) {
            return @(AWSRekognitionContentModerationSortByTimestamp);
        }
        return @(AWSRekognitionContentModerationSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionContentModerationSortByName:
                return @"NAME";
            case AWSRekognitionContentModerationSortByTimestamp:
                return @"TIMESTAMP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionGetContentModerationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"getRequestMetadata" : @"GetRequestMetadata",
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             @"jobTag" : @"JobTag",
             @"moderationLabels" : @"ModerationLabels",
             @"moderationModelVersion" : @"ModerationModelVersion",
             @"nextToken" : @"NextToken",
             @"statusMessage" : @"StatusMessage",
             @"video" : @"Video",
             @"videoMetadata" : @"VideoMetadata",
             };
}

+ (NSValueTransformer *)getRequestMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionGetContentModerationRequestMetadata class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusFailed);
        }
        return @(AWSRekognitionVideoJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionVideoJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSRekognitionVideoJobStatusSucceeded:
                return @"SUCCEEDED";
            case AWSRekognitionVideoJobStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)moderationLabelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionContentModerationDetection class]];
}

+ (NSValueTransformer *)videoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideo class]];
}

+ (NSValueTransformer *)videoMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideoMetadata class]];
}

@end

@implementation AWSRekognitionGetFaceDetectionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSRekognitionGetFaceDetectionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faces" : @"Faces",
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             @"jobTag" : @"JobTag",
             @"nextToken" : @"NextToken",
             @"statusMessage" : @"StatusMessage",
             @"video" : @"Video",
             @"videoMetadata" : @"VideoMetadata",
             };
}

+ (NSValueTransformer *)facesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionFaceDetection class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusFailed);
        }
        return @(AWSRekognitionVideoJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionVideoJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSRekognitionVideoJobStatusSucceeded:
                return @"SUCCEEDED";
            case AWSRekognitionVideoJobStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)videoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideo class]];
}

+ (NSValueTransformer *)videoMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideoMetadata class]];
}

@end

@implementation AWSRekognitionGetFaceLivenessSessionResultsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionId" : @"SessionId",
             };
}

@end

@implementation AWSRekognitionGetFaceLivenessSessionResultsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"auditImages" : @"AuditImages",
             @"confidence" : @"Confidence",
             @"referenceImage" : @"ReferenceImage",
             @"sessionId" : @"SessionId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)auditImagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionAuditImage class]];
}

+ (NSValueTransformer *)referenceImageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionAuditImage class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSRekognitionLivenessSessionStatusCreated);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionLivenessSessionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSRekognitionLivenessSessionStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionLivenessSessionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSRekognitionLivenessSessionStatusExpired);
        }
        return @(AWSRekognitionLivenessSessionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionLivenessSessionStatusCreated:
                return @"CREATED";
            case AWSRekognitionLivenessSessionStatusInProgress:
                return @"IN_PROGRESS";
            case AWSRekognitionLivenessSessionStatusSucceeded:
                return @"SUCCEEDED";
            case AWSRekognitionLivenessSessionStatusFailed:
                return @"FAILED";
            case AWSRekognitionLivenessSessionStatusExpired:
                return @"EXPIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionGetFaceSearchRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             };
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEX"] == NSOrderedSame) {
            return @(AWSRekognitionFaceSearchSortByIndex);
        }
        if ([value caseInsensitiveCompare:@"TIMESTAMP"] == NSOrderedSame) {
            return @(AWSRekognitionFaceSearchSortByTimestamp);
        }
        return @(AWSRekognitionFaceSearchSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionFaceSearchSortByIndex:
                return @"INDEX";
            case AWSRekognitionFaceSearchSortByTimestamp:
                return @"TIMESTAMP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionGetFaceSearchResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             @"jobTag" : @"JobTag",
             @"nextToken" : @"NextToken",
             @"persons" : @"Persons",
             @"statusMessage" : @"StatusMessage",
             @"video" : @"Video",
             @"videoMetadata" : @"VideoMetadata",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusFailed);
        }
        return @(AWSRekognitionVideoJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionVideoJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSRekognitionVideoJobStatusSucceeded:
                return @"SUCCEEDED";
            case AWSRekognitionVideoJobStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)personsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionPersonMatch class]];
}

+ (NSValueTransformer *)videoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideo class]];
}

+ (NSValueTransformer *)videoMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideoMetadata class]];
}

@end

@implementation AWSRekognitionGetLabelDetectionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggregateBy" : @"AggregateBy",
             @"jobId" : @"JobId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             };
}

+ (NSValueTransformer *)aggregateByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TIMESTAMPS"] == NSOrderedSame) {
            return @(AWSRekognitionLabelDetectionAggregateByTimestamps);
        }
        if ([value caseInsensitiveCompare:@"SEGMENTS"] == NSOrderedSame) {
            return @(AWSRekognitionLabelDetectionAggregateBySegments);
        }
        return @(AWSRekognitionLabelDetectionAggregateByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionLabelDetectionAggregateByTimestamps:
                return @"TIMESTAMPS";
            case AWSRekognitionLabelDetectionAggregateBySegments:
                return @"SEGMENTS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NAME"] == NSOrderedSame) {
            return @(AWSRekognitionLabelDetectionSortByName);
        }
        if ([value caseInsensitiveCompare:@"TIMESTAMP"] == NSOrderedSame) {
            return @(AWSRekognitionLabelDetectionSortByTimestamp);
        }
        return @(AWSRekognitionLabelDetectionSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionLabelDetectionSortByName:
                return @"NAME";
            case AWSRekognitionLabelDetectionSortByTimestamp:
                return @"TIMESTAMP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionGetLabelDetectionRequestMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggregateBy" : @"AggregateBy",
             @"sortBy" : @"SortBy",
             };
}

+ (NSValueTransformer *)aggregateByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TIMESTAMPS"] == NSOrderedSame) {
            return @(AWSRekognitionLabelDetectionAggregateByTimestamps);
        }
        if ([value caseInsensitiveCompare:@"SEGMENTS"] == NSOrderedSame) {
            return @(AWSRekognitionLabelDetectionAggregateBySegments);
        }
        return @(AWSRekognitionLabelDetectionAggregateByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionLabelDetectionAggregateByTimestamps:
                return @"TIMESTAMPS";
            case AWSRekognitionLabelDetectionAggregateBySegments:
                return @"SEGMENTS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NAME"] == NSOrderedSame) {
            return @(AWSRekognitionLabelDetectionSortByName);
        }
        if ([value caseInsensitiveCompare:@"TIMESTAMP"] == NSOrderedSame) {
            return @(AWSRekognitionLabelDetectionSortByTimestamp);
        }
        return @(AWSRekognitionLabelDetectionSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionLabelDetectionSortByName:
                return @"NAME";
            case AWSRekognitionLabelDetectionSortByTimestamp:
                return @"TIMESTAMP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionGetLabelDetectionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"getRequestMetadata" : @"GetRequestMetadata",
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             @"jobTag" : @"JobTag",
             @"labelModelVersion" : @"LabelModelVersion",
             @"labels" : @"Labels",
             @"nextToken" : @"NextToken",
             @"statusMessage" : @"StatusMessage",
             @"video" : @"Video",
             @"videoMetadata" : @"VideoMetadata",
             };
}

+ (NSValueTransformer *)getRequestMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionGetLabelDetectionRequestMetadata class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusFailed);
        }
        return @(AWSRekognitionVideoJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionVideoJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSRekognitionVideoJobStatusSucceeded:
                return @"SUCCEEDED";
            case AWSRekognitionVideoJobStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)labelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionLabelDetection class]];
}

+ (NSValueTransformer *)videoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideo class]];
}

+ (NSValueTransformer *)videoMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideoMetadata class]];
}

@end

@implementation AWSRekognitionGetMediaAnalysisJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSRekognitionGetMediaAnalysisJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completionTimestamp" : @"CompletionTimestamp",
             @"creationTimestamp" : @"CreationTimestamp",
             @"failureDetails" : @"FailureDetails",
             @"input" : @"Input",
             @"jobId" : @"JobId",
             @"jobName" : @"JobName",
             @"kmsKeyId" : @"KmsKeyId",
             @"manifestSummary" : @"ManifestSummary",
             @"operationsConfig" : @"OperationsConfig",
             @"outputConfig" : @"OutputConfig",
             @"results" : @"Results",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)completionTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)failureDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionMediaAnalysisJobFailureDetails class]];
}

+ (NSValueTransformer *)inputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionMediaAnalysisInput class]];
}

+ (NSValueTransformer *)manifestSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionMediaAnalysisManifestSummary class]];
}

+ (NSValueTransformer *)operationsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionMediaAnalysisOperationsConfig class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionMediaAnalysisOutputConfig class]];
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionMediaAnalysisResults class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSRekognitionMediaAnalysisJobStatusCreated);
        }
        if ([value caseInsensitiveCompare:@"QUEUED"] == NSOrderedSame) {
            return @(AWSRekognitionMediaAnalysisJobStatusQueued);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionMediaAnalysisJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSRekognitionMediaAnalysisJobStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionMediaAnalysisJobStatusFailed);
        }
        return @(AWSRekognitionMediaAnalysisJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionMediaAnalysisJobStatusCreated:
                return @"CREATED";
            case AWSRekognitionMediaAnalysisJobStatusQueued:
                return @"QUEUED";
            case AWSRekognitionMediaAnalysisJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSRekognitionMediaAnalysisJobStatusSucceeded:
                return @"SUCCEEDED";
            case AWSRekognitionMediaAnalysisJobStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionGetPersonTrackingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             };
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEX"] == NSOrderedSame) {
            return @(AWSRekognitionPersonTrackingSortByIndex);
        }
        if ([value caseInsensitiveCompare:@"TIMESTAMP"] == NSOrderedSame) {
            return @(AWSRekognitionPersonTrackingSortByTimestamp);
        }
        return @(AWSRekognitionPersonTrackingSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionPersonTrackingSortByIndex:
                return @"INDEX";
            case AWSRekognitionPersonTrackingSortByTimestamp:
                return @"TIMESTAMP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionGetPersonTrackingResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             @"jobTag" : @"JobTag",
             @"nextToken" : @"NextToken",
             @"persons" : @"Persons",
             @"statusMessage" : @"StatusMessage",
             @"video" : @"Video",
             @"videoMetadata" : @"VideoMetadata",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusFailed);
        }
        return @(AWSRekognitionVideoJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionVideoJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSRekognitionVideoJobStatusSucceeded:
                return @"SUCCEEDED";
            case AWSRekognitionVideoJobStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)personsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionPersonDetection class]];
}

+ (NSValueTransformer *)videoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideo class]];
}

+ (NSValueTransformer *)videoMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideoMetadata class]];
}

@end

@implementation AWSRekognitionGetSegmentDetectionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSRekognitionGetSegmentDetectionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioMetadata" : @"AudioMetadata",
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             @"jobTag" : @"JobTag",
             @"nextToken" : @"NextToken",
             @"segments" : @"Segments",
             @"selectedSegmentTypes" : @"SelectedSegmentTypes",
             @"statusMessage" : @"StatusMessage",
             @"video" : @"Video",
             @"videoMetadata" : @"VideoMetadata",
             };
}

+ (NSValueTransformer *)audioMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionAudioMetadata class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusFailed);
        }
        return @(AWSRekognitionVideoJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionVideoJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSRekognitionVideoJobStatusSucceeded:
                return @"SUCCEEDED";
            case AWSRekognitionVideoJobStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionSegmentDetection class]];
}

+ (NSValueTransformer *)selectedSegmentTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionSegmentTypeInfo class]];
}

+ (NSValueTransformer *)videoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideo class]];
}

+ (NSValueTransformer *)videoMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionVideoMetadata class]];
}

@end

@implementation AWSRekognitionGetTextDetectionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSRekognitionGetTextDetectionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             @"jobTag" : @"JobTag",
             @"nextToken" : @"NextToken",
             @"statusMessage" : @"StatusMessage",
             @"textDetections" : @"TextDetections",
             @"textModelVersion" : @"TextModelVersion",
             @"video" : @"Video",
             @"videoMetadata" : @"VideoMetadata",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionVideoJobStatusFailed);
        }
        return @(AWSRekognitionVideoJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionVideoJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSRekognitionVideoJobStatusSucceeded:
                return @"SUCCEEDED";
            case AWSRekognitionVideoJobStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)textDetectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionTextDetectionResult class]];
}

+ (NSValueTransformer *)videoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideo class]];
}

+ (NSValueTransformer *)videoMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideoMetadata class]];
}

@end

@implementation AWSRekognitionGroundTruthManifest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Object" : @"S3Object",
             };
}

+ (NSValueTransformer *)s3ObjectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionS3Object class]];
}

@end

@implementation AWSRekognitionHumanLoopActivationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanLoopActivationConditionsEvaluationResults" : @"HumanLoopActivationConditionsEvaluationResults",
             @"humanLoopActivationReasons" : @"HumanLoopActivationReasons",
             @"humanLoopArn" : @"HumanLoopArn",
             };
}

@end

@implementation AWSRekognitionHumanLoopConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAttributes" : @"DataAttributes",
             @"flowDefinitionArn" : @"FlowDefinitionArn",
             @"humanLoopName" : @"HumanLoopName",
             };
}

+ (NSValueTransformer *)dataAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionHumanLoopDataAttributes class]];
}

@end

@implementation AWSRekognitionHumanLoopDataAttributes

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentClassifiers" : @"ContentClassifiers",
             };
}

@end

@implementation AWSRekognitionImage

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"brightness" : @"Brightness",
             @"sharpness" : @"Sharpness",
             };
}

@end

@implementation AWSRekognitionIndexFacesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionId" : @"CollectionId",
             @"detectionAttributes" : @"DetectionAttributes",
             @"externalImageId" : @"ExternalImageId",
             @"image" : @"Image",
             @"maxFaces" : @"MaxFaces",
             @"qualityFilter" : @"QualityFilter",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionImage class]];
}

+ (NSValueTransformer *)qualityFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSRekognitionQualityFilterNone);
        }
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSRekognitionQualityFilterAuto);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSRekognitionQualityFilterLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSRekognitionQualityFilterMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSRekognitionQualityFilterHigh);
        }
        return @(AWSRekognitionQualityFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionQualityFilterNone:
                return @"NONE";
            case AWSRekognitionQualityFilterAuto:
                return @"AUTO";
            case AWSRekognitionQualityFilterLow:
                return @"LOW";
            case AWSRekognitionQualityFilterMedium:
                return @"MEDIUM";
            case AWSRekognitionQualityFilterHigh:
                return @"HIGH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionIndexFacesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceModelVersion" : @"FaceModelVersion",
             @"faceRecords" : @"FaceRecords",
             @"orientationCorrection" : @"OrientationCorrection",
             @"unindexedFaces" : @"UnindexedFaces",
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

+ (NSValueTransformer *)unindexedFacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionUnindexedFace class]];
}

@end

@implementation AWSRekognitionInstance

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"boundingBox" : @"BoundingBox",
             @"confidence" : @"Confidence",
             @"dominantColors" : @"DominantColors",
             };
}

+ (NSValueTransformer *)boundingBoxJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionBoundingBox class]];
}

+ (NSValueTransformer *)dominantColorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionDominantColor class]];
}

@end

@implementation AWSRekognitionKinesisDataStream

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             };
}

@end

@implementation AWSRekognitionKinesisVideoStream

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             };
}

@end

@implementation AWSRekognitionKinesisVideoStreamStartSelector

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fragmentNumber" : @"FragmentNumber",
             @"producerTimestamp" : @"ProducerTimestamp",
             };
}

@end

@implementation AWSRekognitionKnownGender

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Male"] == NSOrderedSame) {
            return @(AWSRekognitionKnownGenderTypeMale);
        }
        if ([value caseInsensitiveCompare:@"Female"] == NSOrderedSame) {
            return @(AWSRekognitionKnownGenderTypeFemale);
        }
        if ([value caseInsensitiveCompare:@"Nonbinary"] == NSOrderedSame) {
            return @(AWSRekognitionKnownGenderTypeNonbinary);
        }
        if ([value caseInsensitiveCompare:@"Unlisted"] == NSOrderedSame) {
            return @(AWSRekognitionKnownGenderTypeUnlisted);
        }
        return @(AWSRekognitionKnownGenderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionKnownGenderTypeMale:
                return @"Male";
            case AWSRekognitionKnownGenderTypeFemale:
                return @"Female";
            case AWSRekognitionKnownGenderTypeNonbinary:
                return @"Nonbinary";
            case AWSRekognitionKnownGenderTypeUnlisted:
                return @"Unlisted";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionLabel

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliases" : @"Aliases",
             @"categories" : @"Categories",
             @"confidence" : @"Confidence",
             @"instances" : @"Instances",
             @"name" : @"Name",
             @"parents" : @"Parents",
             };
}

+ (NSValueTransformer *)aliasesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionLabelAlias class]];
}

+ (NSValueTransformer *)categoriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionLabelCategory class]];
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionInstance class]];
}

+ (NSValueTransformer *)parentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionParent class]];
}

@end

@implementation AWSRekognitionLabelAlias

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSRekognitionLabelCategory

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSRekognitionLabelDetection

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationMillis" : @"DurationMillis",
             @"endTimestampMillis" : @"EndTimestampMillis",
             @"label" : @"Label",
             @"startTimestampMillis" : @"StartTimestampMillis",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)labelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionLabel class]];
}

@end

@implementation AWSRekognitionLabelDetectionSettings

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"generalLabels" : @"GeneralLabels",
             };
}

+ (NSValueTransformer *)generalLabelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionGeneralLabelsSettings class]];
}

@end

@implementation AWSRekognitionLandmark

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"X" : @"X",
             @"Y" : @"Y",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"eyeLeft"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeEyeLeft);
        }
        if ([value caseInsensitiveCompare:@"eyeRight"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeEyeRight);
        }
        if ([value caseInsensitiveCompare:@"nose"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeNose);
        }
        if ([value caseInsensitiveCompare:@"mouthLeft"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeMouthLeft);
        }
        if ([value caseInsensitiveCompare:@"mouthRight"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeMouthRight);
        }
        if ([value caseInsensitiveCompare:@"leftEyeBrowLeft"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeLeftEyeBrowLeft);
        }
        if ([value caseInsensitiveCompare:@"leftEyeBrowRight"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeLeftEyeBrowRight);
        }
        if ([value caseInsensitiveCompare:@"leftEyeBrowUp"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeLeftEyeBrowUp);
        }
        if ([value caseInsensitiveCompare:@"rightEyeBrowLeft"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeRightEyeBrowLeft);
        }
        if ([value caseInsensitiveCompare:@"rightEyeBrowRight"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeRightEyeBrowRight);
        }
        if ([value caseInsensitiveCompare:@"rightEyeBrowUp"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeRightEyeBrowUp);
        }
        if ([value caseInsensitiveCompare:@"leftEyeLeft"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeLeftEyeLeft);
        }
        if ([value caseInsensitiveCompare:@"leftEyeRight"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeLeftEyeRight);
        }
        if ([value caseInsensitiveCompare:@"leftEyeUp"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeLeftEyeUp);
        }
        if ([value caseInsensitiveCompare:@"leftEyeDown"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeLeftEyeDown);
        }
        if ([value caseInsensitiveCompare:@"rightEyeLeft"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeRightEyeLeft);
        }
        if ([value caseInsensitiveCompare:@"rightEyeRight"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeRightEyeRight);
        }
        if ([value caseInsensitiveCompare:@"rightEyeUp"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeRightEyeUp);
        }
        if ([value caseInsensitiveCompare:@"rightEyeDown"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeRightEyeDown);
        }
        if ([value caseInsensitiveCompare:@"noseLeft"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeNoseLeft);
        }
        if ([value caseInsensitiveCompare:@"noseRight"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeNoseRight);
        }
        if ([value caseInsensitiveCompare:@"mouthUp"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeMouthUp);
        }
        if ([value caseInsensitiveCompare:@"mouthDown"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeMouthDown);
        }
        if ([value caseInsensitiveCompare:@"leftPupil"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeLeftPupil);
        }
        if ([value caseInsensitiveCompare:@"rightPupil"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeRightPupil);
        }
        if ([value caseInsensitiveCompare:@"upperJawlineLeft"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeUpperJawlineLeft);
        }
        if ([value caseInsensitiveCompare:@"midJawlineLeft"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeMidJawlineLeft);
        }
        if ([value caseInsensitiveCompare:@"chinBottom"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeChinBottom);
        }
        if ([value caseInsensitiveCompare:@"midJawlineRight"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeMidJawlineRight);
        }
        if ([value caseInsensitiveCompare:@"upperJawlineRight"] == NSOrderedSame) {
            return @(AWSRekognitionLandmarkTypeUpperJawlineRight);
        }
        return @(AWSRekognitionLandmarkTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionLandmarkTypeEyeLeft:
                return @"eyeLeft";
            case AWSRekognitionLandmarkTypeEyeRight:
                return @"eyeRight";
            case AWSRekognitionLandmarkTypeNose:
                return @"nose";
            case AWSRekognitionLandmarkTypeMouthLeft:
                return @"mouthLeft";
            case AWSRekognitionLandmarkTypeMouthRight:
                return @"mouthRight";
            case AWSRekognitionLandmarkTypeLeftEyeBrowLeft:
                return @"leftEyeBrowLeft";
            case AWSRekognitionLandmarkTypeLeftEyeBrowRight:
                return @"leftEyeBrowRight";
            case AWSRekognitionLandmarkTypeLeftEyeBrowUp:
                return @"leftEyeBrowUp";
            case AWSRekognitionLandmarkTypeRightEyeBrowLeft:
                return @"rightEyeBrowLeft";
            case AWSRekognitionLandmarkTypeRightEyeBrowRight:
                return @"rightEyeBrowRight";
            case AWSRekognitionLandmarkTypeRightEyeBrowUp:
                return @"rightEyeBrowUp";
            case AWSRekognitionLandmarkTypeLeftEyeLeft:
                return @"leftEyeLeft";
            case AWSRekognitionLandmarkTypeLeftEyeRight:
                return @"leftEyeRight";
            case AWSRekognitionLandmarkTypeLeftEyeUp:
                return @"leftEyeUp";
            case AWSRekognitionLandmarkTypeLeftEyeDown:
                return @"leftEyeDown";
            case AWSRekognitionLandmarkTypeRightEyeLeft:
                return @"rightEyeLeft";
            case AWSRekognitionLandmarkTypeRightEyeRight:
                return @"rightEyeRight";
            case AWSRekognitionLandmarkTypeRightEyeUp:
                return @"rightEyeUp";
            case AWSRekognitionLandmarkTypeRightEyeDown:
                return @"rightEyeDown";
            case AWSRekognitionLandmarkTypeNoseLeft:
                return @"noseLeft";
            case AWSRekognitionLandmarkTypeNoseRight:
                return @"noseRight";
            case AWSRekognitionLandmarkTypeMouthUp:
                return @"mouthUp";
            case AWSRekognitionLandmarkTypeMouthDown:
                return @"mouthDown";
            case AWSRekognitionLandmarkTypeLeftPupil:
                return @"leftPupil";
            case AWSRekognitionLandmarkTypeRightPupil:
                return @"rightPupil";
            case AWSRekognitionLandmarkTypeUpperJawlineLeft:
                return @"upperJawlineLeft";
            case AWSRekognitionLandmarkTypeMidJawlineLeft:
                return @"midJawlineLeft";
            case AWSRekognitionLandmarkTypeChinBottom:
                return @"chinBottom";
            case AWSRekognitionLandmarkTypeMidJawlineRight:
                return @"midJawlineRight";
            case AWSRekognitionLandmarkTypeUpperJawlineRight:
                return @"upperJawlineRight";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionListCollectionsRequest

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

@implementation AWSRekognitionListCollectionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionIds" : @"CollectionIds",
             @"faceModelVersions" : @"FaceModelVersions",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSRekognitionListDatasetEntriesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"containsLabels" : @"ContainsLabels",
             @"datasetArn" : @"DatasetArn",
             @"hasErrors" : @"HasErrors",
             @"labeled" : @"Labeled",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sourceRefContains" : @"SourceRefContains",
             };
}

@end

@implementation AWSRekognitionListDatasetEntriesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetEntries" : @"DatasetEntries",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSRekognitionListDatasetLabelsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetArn" : @"DatasetArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSRekognitionListDatasetLabelsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetLabelDescriptions" : @"DatasetLabelDescriptions",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)datasetLabelDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionDatasetLabelDescription class]];
}

@end

@implementation AWSRekognitionListFacesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionId" : @"CollectionId",
             @"faceIds" : @"FaceIds",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSRekognitionListFacesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceModelVersion" : @"FaceModelVersion",
             @"faces" : @"Faces",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)facesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionFace class]];
}

@end

@implementation AWSRekognitionListMediaAnalysisJobsRequest

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

@implementation AWSRekognitionListMediaAnalysisJobsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mediaAnalysisJobs" : @"MediaAnalysisJobs",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)mediaAnalysisJobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionMediaAnalysisJobDescription class]];
}

@end

@implementation AWSRekognitionListProjectPoliciesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"projectArn" : @"ProjectArn",
             };
}

@end

@implementation AWSRekognitionListProjectPoliciesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"projectPolicies" : @"ProjectPolicies",
             };
}

+ (NSValueTransformer *)projectPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionProjectPolicy class]];
}

@end

@implementation AWSRekognitionListStreamProcessorsRequest

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

@implementation AWSRekognitionListStreamProcessorsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"streamProcessors" : @"StreamProcessors",
             };
}

+ (NSValueTransformer *)streamProcessorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionStreamProcessor class]];
}

@end

@implementation AWSRekognitionListTagsForResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSRekognitionListTagsForResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSRekognitionListUsersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionId" : @"CollectionId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSRekognitionListUsersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"users" : @"Users",
             };
}

+ (NSValueTransformer *)usersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionUser class]];
}

@end

@implementation AWSRekognitionLivenessOutputConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Bucket" : @"S3Bucket",
             @"s3KeyPrefix" : @"S3KeyPrefix",
             };
}

@end

@implementation AWSRekognitionMatchedUser

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userId" : @"UserId",
             @"userStatus" : @"UserStatus",
             };
}

+ (NSValueTransformer *)userStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSRekognitionUserStatusActive);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSRekognitionUserStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSRekognitionUserStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSRekognitionUserStatusCreated);
        }
        return @(AWSRekognitionUserStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionUserStatusActive:
                return @"ACTIVE";
            case AWSRekognitionUserStatusUpdating:
                return @"UPDATING";
            case AWSRekognitionUserStatusCreating:
                return @"CREATING";
            case AWSRekognitionUserStatusCreated:
                return @"CREATED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionMediaAnalysisDetectModerationLabelsConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"minConfidence" : @"MinConfidence",
             @"projectVersion" : @"ProjectVersion",
             };
}

@end

@implementation AWSRekognitionMediaAnalysisInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Object" : @"S3Object",
             };
}

+ (NSValueTransformer *)s3ObjectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionS3Object class]];
}

@end

@implementation AWSRekognitionMediaAnalysisJobDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completionTimestamp" : @"CompletionTimestamp",
             @"creationTimestamp" : @"CreationTimestamp",
             @"failureDetails" : @"FailureDetails",
             @"input" : @"Input",
             @"jobId" : @"JobId",
             @"jobName" : @"JobName",
             @"kmsKeyId" : @"KmsKeyId",
             @"manifestSummary" : @"ManifestSummary",
             @"operationsConfig" : @"OperationsConfig",
             @"outputConfig" : @"OutputConfig",
             @"results" : @"Results",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)completionTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)failureDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionMediaAnalysisJobFailureDetails class]];
}

+ (NSValueTransformer *)inputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionMediaAnalysisInput class]];
}

+ (NSValueTransformer *)manifestSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionMediaAnalysisManifestSummary class]];
}

+ (NSValueTransformer *)operationsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionMediaAnalysisOperationsConfig class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionMediaAnalysisOutputConfig class]];
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionMediaAnalysisResults class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSRekognitionMediaAnalysisJobStatusCreated);
        }
        if ([value caseInsensitiveCompare:@"QUEUED"] == NSOrderedSame) {
            return @(AWSRekognitionMediaAnalysisJobStatusQueued);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionMediaAnalysisJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSRekognitionMediaAnalysisJobStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionMediaAnalysisJobStatusFailed);
        }
        return @(AWSRekognitionMediaAnalysisJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionMediaAnalysisJobStatusCreated:
                return @"CREATED";
            case AWSRekognitionMediaAnalysisJobStatusQueued:
                return @"QUEUED";
            case AWSRekognitionMediaAnalysisJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSRekognitionMediaAnalysisJobStatusSucceeded:
                return @"SUCCEEDED";
            case AWSRekognitionMediaAnalysisJobStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionMediaAnalysisJobFailureDetails

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
        if ([value caseInsensitiveCompare:@"INTERNAL_ERROR"] == NSOrderedSame) {
            return @(AWSRekognitionMediaAnalysisJobFailureCodeInternalError);
        }
        if ([value caseInsensitiveCompare:@"INVALID_S3_OBJECT"] == NSOrderedSame) {
            return @(AWSRekognitionMediaAnalysisJobFailureCodeInvalidS3Object);
        }
        if ([value caseInsensitiveCompare:@"INVALID_MANIFEST"] == NSOrderedSame) {
            return @(AWSRekognitionMediaAnalysisJobFailureCodeInvalidManifest);
        }
        if ([value caseInsensitiveCompare:@"INVALID_OUTPUT_CONFIG"] == NSOrderedSame) {
            return @(AWSRekognitionMediaAnalysisJobFailureCodeInvalidOutputConfig);
        }
        if ([value caseInsensitiveCompare:@"INVALID_KMS_KEY"] == NSOrderedSame) {
            return @(AWSRekognitionMediaAnalysisJobFailureCodeInvalidKmsKey);
        }
        if ([value caseInsensitiveCompare:@"ACCESS_DENIED"] == NSOrderedSame) {
            return @(AWSRekognitionMediaAnalysisJobFailureCodeAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSRekognitionMediaAnalysisJobFailureCodeResourceNotFound);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_NOT_READY"] == NSOrderedSame) {
            return @(AWSRekognitionMediaAnalysisJobFailureCodeResourceNotReady);
        }
        if ([value caseInsensitiveCompare:@"THROTTLED"] == NSOrderedSame) {
            return @(AWSRekognitionMediaAnalysisJobFailureCodeThrottled);
        }
        return @(AWSRekognitionMediaAnalysisJobFailureCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionMediaAnalysisJobFailureCodeInternalError:
                return @"INTERNAL_ERROR";
            case AWSRekognitionMediaAnalysisJobFailureCodeInvalidS3Object:
                return @"INVALID_S3_OBJECT";
            case AWSRekognitionMediaAnalysisJobFailureCodeInvalidManifest:
                return @"INVALID_MANIFEST";
            case AWSRekognitionMediaAnalysisJobFailureCodeInvalidOutputConfig:
                return @"INVALID_OUTPUT_CONFIG";
            case AWSRekognitionMediaAnalysisJobFailureCodeInvalidKmsKey:
                return @"INVALID_KMS_KEY";
            case AWSRekognitionMediaAnalysisJobFailureCodeAccessDenied:
                return @"ACCESS_DENIED";
            case AWSRekognitionMediaAnalysisJobFailureCodeResourceNotFound:
                return @"RESOURCE_NOT_FOUND";
            case AWSRekognitionMediaAnalysisJobFailureCodeResourceNotReady:
                return @"RESOURCE_NOT_READY";
            case AWSRekognitionMediaAnalysisJobFailureCodeThrottled:
                return @"THROTTLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionMediaAnalysisManifestSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Object" : @"S3Object",
             };
}

+ (NSValueTransformer *)s3ObjectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionS3Object class]];
}

@end

@implementation AWSRekognitionMediaAnalysisModelVersions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"moderation" : @"Moderation",
             };
}

@end

@implementation AWSRekognitionMediaAnalysisOperationsConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectModerationLabels" : @"DetectModerationLabels",
             };
}

+ (NSValueTransformer *)detectModerationLabelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionMediaAnalysisDetectModerationLabelsConfig class]];
}

@end

@implementation AWSRekognitionMediaAnalysisOutputConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Bucket" : @"S3Bucket",
             @"s3KeyPrefix" : @"S3KeyPrefix",
             };
}

@end

@implementation AWSRekognitionMediaAnalysisResults

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelVersions" : @"ModelVersions",
             @"s3Object" : @"S3Object",
             };
}

+ (NSValueTransformer *)modelVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionMediaAnalysisModelVersions class]];
}

+ (NSValueTransformer *)s3ObjectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionS3Object class]];
}

@end

@implementation AWSRekognitionModerationLabel

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"name" : @"Name",
             @"parentName" : @"ParentName",
             @"taxonomyLevel" : @"TaxonomyLevel",
             };
}

@end

@implementation AWSRekognitionMouthOpen

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"value" : @"Value",
             };
}

@end

@implementation AWSRekognitionMustache

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"value" : @"Value",
             };
}

@end

@implementation AWSRekognitionNotificationChannel

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"RoleArn",
             @"SNSTopicArn" : @"SNSTopicArn",
             };
}

@end

@implementation AWSRekognitionOutputConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Bucket" : @"S3Bucket",
             @"s3KeyPrefix" : @"S3KeyPrefix",
             };
}

@end

@implementation AWSRekognitionParent

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSRekognitionPersonDetail

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"boundingBox" : @"BoundingBox",
             @"face" : @"Face",
             @"index" : @"Index",
             };
}

+ (NSValueTransformer *)boundingBoxJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionBoundingBox class]];
}

+ (NSValueTransformer *)faceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionFaceDetail class]];
}

@end

@implementation AWSRekognitionPersonDetection

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"person" : @"Person",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)personJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionPersonDetail class]];
}

@end

@implementation AWSRekognitionPersonMatch

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceMatches" : @"FaceMatches",
             @"person" : @"Person",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)faceMatchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionFaceMatch class]];
}

+ (NSValueTransformer *)personJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionPersonDetail class]];
}

@end

@implementation AWSRekognitionPoint

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"X" : @"X",
             @"Y" : @"Y",
             };
}

@end

@implementation AWSRekognitionPose

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pitch" : @"Pitch",
             @"roll" : @"Roll",
             @"yaw" : @"Yaw",
             };
}

@end

@implementation AWSRekognitionProjectDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoUpdate" : @"AutoUpdate",
             @"creationTimestamp" : @"CreationTimestamp",
             @"datasets" : @"Datasets",
             @"feature" : @"Feature",
             @"projectArn" : @"ProjectArn",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)autoUpdateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectAutoUpdateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectAutoUpdateDisabled);
        }
        return @(AWSRekognitionProjectAutoUpdateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionProjectAutoUpdateEnabled:
                return @"ENABLED";
            case AWSRekognitionProjectAutoUpdateDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)creationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)datasetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionDatasetMetadata class]];
}

+ (NSValueTransformer *)featureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONTENT_MODERATION"] == NSOrderedSame) {
            return @(AWSRekognitionCustomizationFeatureContentModeration);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM_LABELS"] == NSOrderedSame) {
            return @(AWSRekognitionCustomizationFeatureCustomLabels);
        }
        return @(AWSRekognitionCustomizationFeatureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionCustomizationFeatureContentModeration:
                return @"CONTENT_MODERATION";
            case AWSRekognitionCustomizationFeatureCustomLabels:
                return @"CUSTOM_LABELS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSRekognitionProjectStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectStatusCreated);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSRekognitionProjectStatusDeleting);
        }
        return @(AWSRekognitionProjectStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionProjectStatusCreating:
                return @"CREATING";
            case AWSRekognitionProjectStatusCreated:
                return @"CREATED";
            case AWSRekognitionProjectStatusDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionProjectPolicy

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimestamp" : @"CreationTimestamp",
             @"lastUpdatedTimestamp" : @"LastUpdatedTimestamp",
             @"policyDocument" : @"PolicyDocument",
             @"policyName" : @"PolicyName",
             @"policyRevisionId" : @"PolicyRevisionId",
             @"projectArn" : @"ProjectArn",
             };
}

+ (NSValueTransformer *)creationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSRekognitionProjectVersionDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baseModelVersion" : @"BaseModelVersion",
             @"billableTrainingTimeInSeconds" : @"BillableTrainingTimeInSeconds",
             @"creationTimestamp" : @"CreationTimestamp",
             @"evaluationResult" : @"EvaluationResult",
             @"feature" : @"Feature",
             @"featureConfig" : @"FeatureConfig",
             @"kmsKeyId" : @"KmsKeyId",
             @"manifestSummary" : @"ManifestSummary",
             @"maxInferenceUnits" : @"MaxInferenceUnits",
             @"minInferenceUnits" : @"MinInferenceUnits",
             @"outputConfig" : @"OutputConfig",
             @"projectVersionArn" : @"ProjectVersionArn",
             @"sourceProjectVersionArn" : @"SourceProjectVersionArn",
             @"status" : @"Status",
             @"statusMessage" : @"StatusMessage",
             @"testingDataResult" : @"TestingDataResult",
             @"trainingDataResult" : @"TrainingDataResult",
             @"trainingEndTimestamp" : @"TrainingEndTimestamp",
             @"versionDescription" : @"VersionDescription",
             };
}

+ (NSValueTransformer *)creationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)evaluationResultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionEvaluationResult class]];
}

+ (NSValueTransformer *)featureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONTENT_MODERATION"] == NSOrderedSame) {
            return @(AWSRekognitionCustomizationFeatureContentModeration);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM_LABELS"] == NSOrderedSame) {
            return @(AWSRekognitionCustomizationFeatureCustomLabels);
        }
        return @(AWSRekognitionCustomizationFeatureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionCustomizationFeatureContentModeration:
                return @"CONTENT_MODERATION";
            case AWSRekognitionCustomizationFeatureCustomLabels:
                return @"CUSTOM_LABELS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)featureConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionCustomizationFeatureConfig class]];
}

+ (NSValueTransformer *)manifestSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionGroundTruthManifest class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionOutputConfig class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRAINING_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusTrainingInProgress);
        }
        if ([value caseInsensitiveCompare:@"TRAINING_COMPLETED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusTrainingCompleted);
        }
        if ([value caseInsensitiveCompare:@"TRAINING_FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusTrainingFailed);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"COPYING_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusCopyingInProgress);
        }
        if ([value caseInsensitiveCompare:@"COPYING_COMPLETED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusCopyingCompleted);
        }
        if ([value caseInsensitiveCompare:@"COPYING_FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusCopyingFailed);
        }
        if ([value caseInsensitiveCompare:@"DEPRECATED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusDeprecated);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusExpired);
        }
        return @(AWSRekognitionProjectVersionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionProjectVersionStatusTrainingInProgress:
                return @"TRAINING_IN_PROGRESS";
            case AWSRekognitionProjectVersionStatusTrainingCompleted:
                return @"TRAINING_COMPLETED";
            case AWSRekognitionProjectVersionStatusTrainingFailed:
                return @"TRAINING_FAILED";
            case AWSRekognitionProjectVersionStatusStarting:
                return @"STARTING";
            case AWSRekognitionProjectVersionStatusRunning:
                return @"RUNNING";
            case AWSRekognitionProjectVersionStatusFailed:
                return @"FAILED";
            case AWSRekognitionProjectVersionStatusStopping:
                return @"STOPPING";
            case AWSRekognitionProjectVersionStatusStopped:
                return @"STOPPED";
            case AWSRekognitionProjectVersionStatusDeleting:
                return @"DELETING";
            case AWSRekognitionProjectVersionStatusCopyingInProgress:
                return @"COPYING_IN_PROGRESS";
            case AWSRekognitionProjectVersionStatusCopyingCompleted:
                return @"COPYING_COMPLETED";
            case AWSRekognitionProjectVersionStatusCopyingFailed:
                return @"COPYING_FAILED";
            case AWSRekognitionProjectVersionStatusDeprecated:
                return @"DEPRECATED";
            case AWSRekognitionProjectVersionStatusExpired:
                return @"EXPIRED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)testingDataResultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionTestingDataResult class]];
}

+ (NSValueTransformer *)trainingDataResultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionTrainingDataResult class]];
}

+ (NSValueTransformer *)trainingEndTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSRekognitionProtectiveEquipmentBodyPart

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"equipmentDetections" : @"EquipmentDetections",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)equipmentDetectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionEquipmentDetection class]];
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FACE"] == NSOrderedSame) {
            return @(AWSRekognitionBodyPartFace);
        }
        if ([value caseInsensitiveCompare:@"HEAD"] == NSOrderedSame) {
            return @(AWSRekognitionBodyPartHead);
        }
        if ([value caseInsensitiveCompare:@"LEFT_HAND"] == NSOrderedSame) {
            return @(AWSRekognitionBodyPartLeftHand);
        }
        if ([value caseInsensitiveCompare:@"RIGHT_HAND"] == NSOrderedSame) {
            return @(AWSRekognitionBodyPartRightHand);
        }
        return @(AWSRekognitionBodyPartUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionBodyPartFace:
                return @"FACE";
            case AWSRekognitionBodyPartHead:
                return @"HEAD";
            case AWSRekognitionBodyPartLeftHand:
                return @"LEFT_HAND";
            case AWSRekognitionBodyPartRightHand:
                return @"RIGHT_HAND";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionProtectiveEquipmentPerson

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bodyParts" : @"BodyParts",
             @"boundingBox" : @"BoundingBox",
             @"confidence" : @"Confidence",
             @"identifier" : @"Id",
             };
}

+ (NSValueTransformer *)bodyPartsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionProtectiveEquipmentBodyPart class]];
}

+ (NSValueTransformer *)boundingBoxJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionBoundingBox class]];
}

@end

@implementation AWSRekognitionProtectiveEquipmentSummarizationAttributes

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"minConfidence" : @"MinConfidence",
             @"requiredEquipmentTypes" : @"RequiredEquipmentTypes",
             };
}

@end

@implementation AWSRekognitionProtectiveEquipmentSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"personsIndeterminate" : @"PersonsIndeterminate",
             @"personsWithRequiredEquipment" : @"PersonsWithRequiredEquipment",
             @"personsWithoutRequiredEquipment" : @"PersonsWithoutRequiredEquipment",
             };
}

@end

@implementation AWSRekognitionPutProjectPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyDocument" : @"PolicyDocument",
             @"policyName" : @"PolicyName",
             @"policyRevisionId" : @"PolicyRevisionId",
             @"projectArn" : @"ProjectArn",
             };
}

@end

@implementation AWSRekognitionPutProjectPolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyRevisionId" : @"PolicyRevisionId",
             };
}

@end

@implementation AWSRekognitionRecognizeCelebritiesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"image" : @"Image",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionImage class]];
}

@end

@implementation AWSRekognitionRecognizeCelebritiesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"celebrityFaces" : @"CelebrityFaces",
             @"orientationCorrection" : @"OrientationCorrection",
             @"unrecognizedFaces" : @"UnrecognizedFaces",
             };
}

+ (NSValueTransformer *)celebrityFacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionCelebrity class]];
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

+ (NSValueTransformer *)unrecognizedFacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionComparedFace class]];
}

@end

@implementation AWSRekognitionRegionOfInterest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"boundingBox" : @"BoundingBox",
             @"polygon" : @"Polygon",
             };
}

+ (NSValueTransformer *)boundingBoxJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionBoundingBox class]];
}

+ (NSValueTransformer *)polygonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionPoint class]];
}

@end

@implementation AWSRekognitionS3Destination

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"keyPrefix" : @"KeyPrefix",
             };
}

@end

@implementation AWSRekognitionS3Object

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"name" : @"Name",
             @"version" : @"Version",
             };
}

@end

@implementation AWSRekognitionSearchFacesByImageRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionId" : @"CollectionId",
             @"faceMatchThreshold" : @"FaceMatchThreshold",
             @"image" : @"Image",
             @"maxFaces" : @"MaxFaces",
             @"qualityFilter" : @"QualityFilter",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionImage class]];
}

+ (NSValueTransformer *)qualityFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSRekognitionQualityFilterNone);
        }
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSRekognitionQualityFilterAuto);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSRekognitionQualityFilterLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSRekognitionQualityFilterMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSRekognitionQualityFilterHigh);
        }
        return @(AWSRekognitionQualityFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionQualityFilterNone:
                return @"NONE";
            case AWSRekognitionQualityFilterAuto:
                return @"AUTO";
            case AWSRekognitionQualityFilterLow:
                return @"LOW";
            case AWSRekognitionQualityFilterMedium:
                return @"MEDIUM";
            case AWSRekognitionQualityFilterHigh:
                return @"HIGH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionSearchFacesByImageResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceMatches" : @"FaceMatches",
             @"faceModelVersion" : @"FaceModelVersion",
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceMatches" : @"FaceMatches",
             @"faceModelVersion" : @"FaceModelVersion",
             @"searchedFaceId" : @"SearchedFaceId",
             };
}

+ (NSValueTransformer *)faceMatchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionFaceMatch class]];
}

@end

@implementation AWSRekognitionSearchUsersByImageRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionId" : @"CollectionId",
             @"image" : @"Image",
             @"maxUsers" : @"MaxUsers",
             @"qualityFilter" : @"QualityFilter",
             @"userMatchThreshold" : @"UserMatchThreshold",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionImage class]];
}

+ (NSValueTransformer *)qualityFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSRekognitionQualityFilterNone);
        }
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSRekognitionQualityFilterAuto);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSRekognitionQualityFilterLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSRekognitionQualityFilterMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSRekognitionQualityFilterHigh);
        }
        return @(AWSRekognitionQualityFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionQualityFilterNone:
                return @"NONE";
            case AWSRekognitionQualityFilterAuto:
                return @"AUTO";
            case AWSRekognitionQualityFilterLow:
                return @"LOW";
            case AWSRekognitionQualityFilterMedium:
                return @"MEDIUM";
            case AWSRekognitionQualityFilterHigh:
                return @"HIGH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionSearchUsersByImageResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceModelVersion" : @"FaceModelVersion",
             @"searchedFace" : @"SearchedFace",
             @"unsearchedFaces" : @"UnsearchedFaces",
             @"userMatches" : @"UserMatches",
             };
}

+ (NSValueTransformer *)searchedFaceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionSearchedFaceDetails class]];
}

+ (NSValueTransformer *)unsearchedFacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionUnsearchedFace class]];
}

+ (NSValueTransformer *)userMatchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionUserMatch class]];
}

@end

@implementation AWSRekognitionSearchUsersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionId" : @"CollectionId",
             @"faceId" : @"FaceId",
             @"maxUsers" : @"MaxUsers",
             @"userId" : @"UserId",
             @"userMatchThreshold" : @"UserMatchThreshold",
             };
}

@end

@implementation AWSRekognitionSearchUsersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceModelVersion" : @"FaceModelVersion",
             @"searchedFace" : @"SearchedFace",
             @"searchedUser" : @"SearchedUser",
             @"userMatches" : @"UserMatches",
             };
}

+ (NSValueTransformer *)searchedFaceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionSearchedFace class]];
}

+ (NSValueTransformer *)searchedUserJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionSearchedUser class]];
}

+ (NSValueTransformer *)userMatchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionUserMatch class]];
}

@end

@implementation AWSRekognitionSearchedFace

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceId" : @"FaceId",
             };
}

@end

@implementation AWSRekognitionSearchedFaceDetails

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceDetail" : @"FaceDetail",
             };
}

+ (NSValueTransformer *)faceDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionFaceDetail class]];
}

@end

@implementation AWSRekognitionSearchedUser

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSRekognitionSegmentDetection

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationFrames" : @"DurationFrames",
             @"durationMillis" : @"DurationMillis",
             @"durationSMPTE" : @"DurationSMPTE",
             @"endFrameNumber" : @"EndFrameNumber",
             @"endTimecodeSMPTE" : @"EndTimecodeSMPTE",
             @"endTimestampMillis" : @"EndTimestampMillis",
             @"shotSegment" : @"ShotSegment",
             @"startFrameNumber" : @"StartFrameNumber",
             @"startTimecodeSMPTE" : @"StartTimecodeSMPTE",
             @"startTimestampMillis" : @"StartTimestampMillis",
             @"technicalCueSegment" : @"TechnicalCueSegment",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)shotSegmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionShotSegment class]];
}

+ (NSValueTransformer *)technicalCueSegmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionTechnicalCueSegment class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TECHNICAL_CUE"] == NSOrderedSame) {
            return @(AWSRekognitionSegmentTypeTechnicalCue);
        }
        if ([value caseInsensitiveCompare:@"SHOT"] == NSOrderedSame) {
            return @(AWSRekognitionSegmentTypeShot);
        }
        return @(AWSRekognitionSegmentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionSegmentTypeTechnicalCue:
                return @"TECHNICAL_CUE";
            case AWSRekognitionSegmentTypeShot:
                return @"SHOT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionSegmentTypeInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelVersion" : @"ModelVersion",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TECHNICAL_CUE"] == NSOrderedSame) {
            return @(AWSRekognitionSegmentTypeTechnicalCue);
        }
        if ([value caseInsensitiveCompare:@"SHOT"] == NSOrderedSame) {
            return @(AWSRekognitionSegmentTypeShot);
        }
        return @(AWSRekognitionSegmentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionSegmentTypeTechnicalCue:
                return @"TECHNICAL_CUE";
            case AWSRekognitionSegmentTypeShot:
                return @"SHOT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionShotSegment

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"index" : @"Index",
             };
}

@end

@implementation AWSRekognitionSmile

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"value" : @"Value",
             };
}

@end

@implementation AWSRekognitionStartCelebrityRecognitionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"jobTag" : @"JobTag",
             @"notificationChannel" : @"NotificationChannel",
             @"video" : @"Video",
             };
}

+ (NSValueTransformer *)notificationChannelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionNotificationChannel class]];
}

+ (NSValueTransformer *)videoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideo class]];
}

@end

@implementation AWSRekognitionStartCelebrityRecognitionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSRekognitionStartContentModerationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"jobTag" : @"JobTag",
             @"minConfidence" : @"MinConfidence",
             @"notificationChannel" : @"NotificationChannel",
             @"video" : @"Video",
             };
}

+ (NSValueTransformer *)notificationChannelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionNotificationChannel class]];
}

+ (NSValueTransformer *)videoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideo class]];
}

@end

@implementation AWSRekognitionStartContentModerationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSRekognitionStartFaceDetectionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"faceAttributes" : @"FaceAttributes",
             @"jobTag" : @"JobTag",
             @"notificationChannel" : @"NotificationChannel",
             @"video" : @"Video",
             };
}

+ (NSValueTransformer *)faceAttributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSRekognitionFaceAttributesDefault);
        }
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSRekognitionFaceAttributesAll);
        }
        return @(AWSRekognitionFaceAttributesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionFaceAttributesDefault:
                return @"DEFAULT";
            case AWSRekognitionFaceAttributesAll:
                return @"ALL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notificationChannelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionNotificationChannel class]];
}

+ (NSValueTransformer *)videoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideo class]];
}

@end

@implementation AWSRekognitionStartFaceDetectionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSRekognitionStartFaceSearchRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"collectionId" : @"CollectionId",
             @"faceMatchThreshold" : @"FaceMatchThreshold",
             @"jobTag" : @"JobTag",
             @"notificationChannel" : @"NotificationChannel",
             @"video" : @"Video",
             };
}

+ (NSValueTransformer *)notificationChannelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionNotificationChannel class]];
}

+ (NSValueTransformer *)videoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideo class]];
}

@end

@implementation AWSRekognitionStartFaceSearchResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSRekognitionStartLabelDetectionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"features" : @"Features",
             @"jobTag" : @"JobTag",
             @"minConfidence" : @"MinConfidence",
             @"notificationChannel" : @"NotificationChannel",
             @"settings" : @"Settings",
             @"video" : @"Video",
             };
}

+ (NSValueTransformer *)notificationChannelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionNotificationChannel class]];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionLabelDetectionSettings class]];
}

+ (NSValueTransformer *)videoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideo class]];
}

@end

@implementation AWSRekognitionStartLabelDetectionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSRekognitionStartMediaAnalysisJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"input" : @"Input",
             @"jobName" : @"JobName",
             @"kmsKeyId" : @"KmsKeyId",
             @"operationsConfig" : @"OperationsConfig",
             @"outputConfig" : @"OutputConfig",
             };
}

+ (NSValueTransformer *)inputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionMediaAnalysisInput class]];
}

+ (NSValueTransformer *)operationsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionMediaAnalysisOperationsConfig class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionMediaAnalysisOutputConfig class]];
}

@end

@implementation AWSRekognitionStartMediaAnalysisJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSRekognitionStartPersonTrackingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"jobTag" : @"JobTag",
             @"notificationChannel" : @"NotificationChannel",
             @"video" : @"Video",
             };
}

+ (NSValueTransformer *)notificationChannelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionNotificationChannel class]];
}

+ (NSValueTransformer *)videoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideo class]];
}

@end

@implementation AWSRekognitionStartPersonTrackingResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSRekognitionStartProjectVersionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxInferenceUnits" : @"MaxInferenceUnits",
             @"minInferenceUnits" : @"MinInferenceUnits",
             @"projectVersionArn" : @"ProjectVersionArn",
             };
}

@end

@implementation AWSRekognitionStartProjectVersionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRAINING_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusTrainingInProgress);
        }
        if ([value caseInsensitiveCompare:@"TRAINING_COMPLETED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusTrainingCompleted);
        }
        if ([value caseInsensitiveCompare:@"TRAINING_FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusTrainingFailed);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"COPYING_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusCopyingInProgress);
        }
        if ([value caseInsensitiveCompare:@"COPYING_COMPLETED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusCopyingCompleted);
        }
        if ([value caseInsensitiveCompare:@"COPYING_FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusCopyingFailed);
        }
        if ([value caseInsensitiveCompare:@"DEPRECATED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusDeprecated);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusExpired);
        }
        return @(AWSRekognitionProjectVersionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionProjectVersionStatusTrainingInProgress:
                return @"TRAINING_IN_PROGRESS";
            case AWSRekognitionProjectVersionStatusTrainingCompleted:
                return @"TRAINING_COMPLETED";
            case AWSRekognitionProjectVersionStatusTrainingFailed:
                return @"TRAINING_FAILED";
            case AWSRekognitionProjectVersionStatusStarting:
                return @"STARTING";
            case AWSRekognitionProjectVersionStatusRunning:
                return @"RUNNING";
            case AWSRekognitionProjectVersionStatusFailed:
                return @"FAILED";
            case AWSRekognitionProjectVersionStatusStopping:
                return @"STOPPING";
            case AWSRekognitionProjectVersionStatusStopped:
                return @"STOPPED";
            case AWSRekognitionProjectVersionStatusDeleting:
                return @"DELETING";
            case AWSRekognitionProjectVersionStatusCopyingInProgress:
                return @"COPYING_IN_PROGRESS";
            case AWSRekognitionProjectVersionStatusCopyingCompleted:
                return @"COPYING_COMPLETED";
            case AWSRekognitionProjectVersionStatusCopyingFailed:
                return @"COPYING_FAILED";
            case AWSRekognitionProjectVersionStatusDeprecated:
                return @"DEPRECATED";
            case AWSRekognitionProjectVersionStatusExpired:
                return @"EXPIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionStartSegmentDetectionFilters

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"shotFilter" : @"ShotFilter",
             @"technicalCueFilter" : @"TechnicalCueFilter",
             };
}

+ (NSValueTransformer *)shotFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStartShotDetectionFilter class]];
}

+ (NSValueTransformer *)technicalCueFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStartTechnicalCueDetectionFilter class]];
}

@end

@implementation AWSRekognitionStartSegmentDetectionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"filters" : @"Filters",
             @"jobTag" : @"JobTag",
             @"notificationChannel" : @"NotificationChannel",
             @"segmentTypes" : @"SegmentTypes",
             @"video" : @"Video",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStartSegmentDetectionFilters class]];
}

+ (NSValueTransformer *)notificationChannelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionNotificationChannel class]];
}

+ (NSValueTransformer *)videoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideo class]];
}

@end

@implementation AWSRekognitionStartSegmentDetectionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSRekognitionStartShotDetectionFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"minSegmentConfidence" : @"MinSegmentConfidence",
             };
}

@end

@implementation AWSRekognitionStartStreamProcessorRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"startSelector" : @"StartSelector",
             @"stopSelector" : @"StopSelector",
             };
}

+ (NSValueTransformer *)startSelectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStreamProcessingStartSelector class]];
}

+ (NSValueTransformer *)stopSelectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStreamProcessingStopSelector class]];
}

@end

@implementation AWSRekognitionStartStreamProcessorResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionId" : @"SessionId",
             };
}

@end

@implementation AWSRekognitionStartTechnicalCueDetectionFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blackFrame" : @"BlackFrame",
             @"minSegmentConfidence" : @"MinSegmentConfidence",
             };
}

+ (NSValueTransformer *)blackFrameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionBlackFrame class]];
}

@end

@implementation AWSRekognitionStartTextDetectionFilters

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regionsOfInterest" : @"RegionsOfInterest",
             @"wordFilter" : @"WordFilter",
             };
}

+ (NSValueTransformer *)regionsOfInterestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionRegionOfInterest class]];
}

+ (NSValueTransformer *)wordFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionDetectionFilter class]];
}

@end

@implementation AWSRekognitionStartTextDetectionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"filters" : @"Filters",
             @"jobTag" : @"JobTag",
             @"notificationChannel" : @"NotificationChannel",
             @"video" : @"Video",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStartTextDetectionFilters class]];
}

+ (NSValueTransformer *)notificationChannelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionNotificationChannel class]];
}

+ (NSValueTransformer *)videoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideo class]];
}

@end

@implementation AWSRekognitionStartTextDetectionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSRekognitionStopProjectVersionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectVersionArn" : @"ProjectVersionArn",
             };
}

@end

@implementation AWSRekognitionStopProjectVersionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRAINING_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusTrainingInProgress);
        }
        if ([value caseInsensitiveCompare:@"TRAINING_COMPLETED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusTrainingCompleted);
        }
        if ([value caseInsensitiveCompare:@"TRAINING_FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusTrainingFailed);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"COPYING_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusCopyingInProgress);
        }
        if ([value caseInsensitiveCompare:@"COPYING_COMPLETED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusCopyingCompleted);
        }
        if ([value caseInsensitiveCompare:@"COPYING_FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusCopyingFailed);
        }
        if ([value caseInsensitiveCompare:@"DEPRECATED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusDeprecated);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSRekognitionProjectVersionStatusExpired);
        }
        return @(AWSRekognitionProjectVersionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionProjectVersionStatusTrainingInProgress:
                return @"TRAINING_IN_PROGRESS";
            case AWSRekognitionProjectVersionStatusTrainingCompleted:
                return @"TRAINING_COMPLETED";
            case AWSRekognitionProjectVersionStatusTrainingFailed:
                return @"TRAINING_FAILED";
            case AWSRekognitionProjectVersionStatusStarting:
                return @"STARTING";
            case AWSRekognitionProjectVersionStatusRunning:
                return @"RUNNING";
            case AWSRekognitionProjectVersionStatusFailed:
                return @"FAILED";
            case AWSRekognitionProjectVersionStatusStopping:
                return @"STOPPING";
            case AWSRekognitionProjectVersionStatusStopped:
                return @"STOPPED";
            case AWSRekognitionProjectVersionStatusDeleting:
                return @"DELETING";
            case AWSRekognitionProjectVersionStatusCopyingInProgress:
                return @"COPYING_IN_PROGRESS";
            case AWSRekognitionProjectVersionStatusCopyingCompleted:
                return @"COPYING_COMPLETED";
            case AWSRekognitionProjectVersionStatusCopyingFailed:
                return @"COPYING_FAILED";
            case AWSRekognitionProjectVersionStatusDeprecated:
                return @"DEPRECATED";
            case AWSRekognitionProjectVersionStatusExpired:
                return @"EXPIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionStopStreamProcessorRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSRekognitionStopStreamProcessorResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSRekognitionStreamProcessingStartSelector

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"KVSStreamStartSelector" : @"KVSStreamStartSelector",
             };
}

+ (NSValueTransformer *)KVSStreamStartSelectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionKinesisVideoStreamStartSelector class]];
}

@end

@implementation AWSRekognitionStreamProcessingStopSelector

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxDurationInSeconds" : @"MaxDurationInSeconds",
             };
}

@end

@implementation AWSRekognitionStreamProcessor

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSRekognitionStreamProcessorStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSRekognitionStreamProcessorStatusStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSRekognitionStreamProcessorStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSRekognitionStreamProcessorStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSRekognitionStreamProcessorStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSRekognitionStreamProcessorStatusUpdating);
        }
        return @(AWSRekognitionStreamProcessorStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionStreamProcessorStatusStopped:
                return @"STOPPED";
            case AWSRekognitionStreamProcessorStatusStarting:
                return @"STARTING";
            case AWSRekognitionStreamProcessorStatusRunning:
                return @"RUNNING";
            case AWSRekognitionStreamProcessorStatusFailed:
                return @"FAILED";
            case AWSRekognitionStreamProcessorStatusStopping:
                return @"STOPPING";
            case AWSRekognitionStreamProcessorStatusUpdating:
                return @"UPDATING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionStreamProcessorDataSharingPreference

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"optIn" : @"OptIn",
             };
}

@end

@implementation AWSRekognitionStreamProcessorInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kinesisVideoStream" : @"KinesisVideoStream",
             };
}

+ (NSValueTransformer *)kinesisVideoStreamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionKinesisVideoStream class]];
}

@end

@implementation AWSRekognitionStreamProcessorNotificationChannel

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SNSTopicArn" : @"SNSTopicArn",
             };
}

@end

@implementation AWSRekognitionStreamProcessorOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kinesisDataStream" : @"KinesisDataStream",
             @"s3Destination" : @"S3Destination",
             };
}

+ (NSValueTransformer *)kinesisDataStreamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionKinesisDataStream class]];
}

+ (NSValueTransformer *)s3DestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionS3Destination class]];
}

@end

@implementation AWSRekognitionStreamProcessorSettings

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectedHome" : @"ConnectedHome",
             @"faceSearch" : @"FaceSearch",
             };
}

+ (NSValueTransformer *)connectedHomeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionConnectedHomeSettings class]];
}

+ (NSValueTransformer *)faceSearchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionFaceSearchSettings class]];
}

@end

@implementation AWSRekognitionStreamProcessorSettingsForUpdate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectedHomeForUpdate" : @"ConnectedHomeForUpdate",
             };
}

+ (NSValueTransformer *)connectedHomeForUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionConnectedHomeSettingsForUpdate class]];
}

@end

@implementation AWSRekognitionSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Object" : @"S3Object",
             };
}

+ (NSValueTransformer *)s3ObjectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionS3Object class]];
}

@end

@implementation AWSRekognitionSunglasses

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"value" : @"Value",
             };
}

@end

@implementation AWSRekognitionTagResourceRequest

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

@implementation AWSRekognitionTagResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSRekognitionTechnicalCueSegment

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ColorBars"] == NSOrderedSame) {
            return @(AWSRekognitionTechnicalCueTypeColorBars);
        }
        if ([value caseInsensitiveCompare:@"EndCredits"] == NSOrderedSame) {
            return @(AWSRekognitionTechnicalCueTypeEndCredits);
        }
        if ([value caseInsensitiveCompare:@"BlackFrames"] == NSOrderedSame) {
            return @(AWSRekognitionTechnicalCueTypeBlackFrames);
        }
        if ([value caseInsensitiveCompare:@"OpeningCredits"] == NSOrderedSame) {
            return @(AWSRekognitionTechnicalCueTypeOpeningCredits);
        }
        if ([value caseInsensitiveCompare:@"StudioLogo"] == NSOrderedSame) {
            return @(AWSRekognitionTechnicalCueTypeStudioLogo);
        }
        if ([value caseInsensitiveCompare:@"Slate"] == NSOrderedSame) {
            return @(AWSRekognitionTechnicalCueTypeSlate);
        }
        if ([value caseInsensitiveCompare:@"Content"] == NSOrderedSame) {
            return @(AWSRekognitionTechnicalCueTypeContent);
        }
        return @(AWSRekognitionTechnicalCueTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionTechnicalCueTypeColorBars:
                return @"ColorBars";
            case AWSRekognitionTechnicalCueTypeEndCredits:
                return @"EndCredits";
            case AWSRekognitionTechnicalCueTypeBlackFrames:
                return @"BlackFrames";
            case AWSRekognitionTechnicalCueTypeOpeningCredits:
                return @"OpeningCredits";
            case AWSRekognitionTechnicalCueTypeStudioLogo:
                return @"StudioLogo";
            case AWSRekognitionTechnicalCueTypeSlate:
                return @"Slate";
            case AWSRekognitionTechnicalCueTypeContent:
                return @"Content";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionTestingData

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assets" : @"Assets",
             @"autoCreate" : @"AutoCreate",
             };
}

+ (NSValueTransformer *)assetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionAsset class]];
}

@end

@implementation AWSRekognitionTestingDataResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"input" : @"Input",
             @"output" : @"Output",
             @"validation" : @"Validation",
             };
}

+ (NSValueTransformer *)inputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionTestingData class]];
}

+ (NSValueTransformer *)outputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionTestingData class]];
}

+ (NSValueTransformer *)validationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionValidationData class]];
}

@end

@implementation AWSRekognitionTextDetection

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"detectedText" : @"DetectedText",
             @"geometry" : @"Geometry",
             @"identifier" : @"Id",
             @"parentId" : @"ParentId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)geometryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionGeometry class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LINE"] == NSOrderedSame) {
            return @(AWSRekognitionTextTypesLine);
        }
        if ([value caseInsensitiveCompare:@"WORD"] == NSOrderedSame) {
            return @(AWSRekognitionTextTypesWord);
        }
        return @(AWSRekognitionTextTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionTextTypesLine:
                return @"LINE";
            case AWSRekognitionTextTypesWord:
                return @"WORD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionTextDetectionResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"textDetection" : @"TextDetection",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)textDetectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionTextDetection class]];
}

@end

@implementation AWSRekognitionTrainingData

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assets" : @"Assets",
             };
}

+ (NSValueTransformer *)assetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionAsset class]];
}

@end

@implementation AWSRekognitionTrainingDataResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"input" : @"Input",
             @"output" : @"Output",
             @"validation" : @"Validation",
             };
}

+ (NSValueTransformer *)inputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionTrainingData class]];
}

+ (NSValueTransformer *)outputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionTrainingData class]];
}

+ (NSValueTransformer *)validationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionValidationData class]];
}

@end

@implementation AWSRekognitionUnindexedFace

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceDetail" : @"FaceDetail",
             @"reasons" : @"Reasons",
             };
}

+ (NSValueTransformer *)faceDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionFaceDetail class]];
}

@end

@implementation AWSRekognitionUnsearchedFace

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceDetails" : @"FaceDetails",
             @"reasons" : @"Reasons",
             };
}

+ (NSValueTransformer *)faceDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionFaceDetail class]];
}

@end

@implementation AWSRekognitionUnsuccessfulFaceAssociation

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"faceId" : @"FaceId",
             @"reasons" : @"Reasons",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSRekognitionUnsuccessfulFaceDeletion

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceId" : @"FaceId",
             @"reasons" : @"Reasons",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSRekognitionUnsuccessfulFaceDisassociation

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceId" : @"FaceId",
             @"reasons" : @"Reasons",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSRekognitionUntagResourceRequest

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

@implementation AWSRekognitionUntagResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSRekognitionUpdateDatasetEntriesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changes" : @"Changes",
             @"datasetArn" : @"DatasetArn",
             };
}

+ (NSValueTransformer *)changesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionDatasetChanges class]];
}

@end

@implementation AWSRekognitionUpdateDatasetEntriesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSRekognitionUpdateStreamProcessorRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataSharingPreferenceForUpdate" : @"DataSharingPreferenceForUpdate",
             @"name" : @"Name",
             @"parametersToDelete" : @"ParametersToDelete",
             @"regionsOfInterestForUpdate" : @"RegionsOfInterestForUpdate",
             @"settingsForUpdate" : @"SettingsForUpdate",
             };
}

+ (NSValueTransformer *)dataSharingPreferenceForUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStreamProcessorDataSharingPreference class]];
}

+ (NSValueTransformer *)regionsOfInterestForUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionRegionOfInterest class]];
}

+ (NSValueTransformer *)settingsForUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStreamProcessorSettingsForUpdate class]];
}

@end

@implementation AWSRekognitionUpdateStreamProcessorResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSRekognitionUser

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userId" : @"UserId",
             @"userStatus" : @"UserStatus",
             };
}

+ (NSValueTransformer *)userStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSRekognitionUserStatusActive);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSRekognitionUserStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSRekognitionUserStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSRekognitionUserStatusCreated);
        }
        return @(AWSRekognitionUserStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionUserStatusActive:
                return @"ACTIVE";
            case AWSRekognitionUserStatusUpdating:
                return @"UPDATING";
            case AWSRekognitionUserStatusCreating:
                return @"CREATING";
            case AWSRekognitionUserStatusCreated:
                return @"CREATED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSRekognitionUserMatch

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"similarity" : @"Similarity",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionMatchedUser class]];
}

@end

@implementation AWSRekognitionValidationData

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assets" : @"Assets",
             };
}

+ (NSValueTransformer *)assetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionAsset class]];
}

@end

@implementation AWSRekognitionVideo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Object" : @"S3Object",
             };
}

+ (NSValueTransformer *)s3ObjectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionS3Object class]];
}

@end

@implementation AWSRekognitionVideoMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codec" : @"Codec",
             @"colorRange" : @"ColorRange",
             @"durationMillis" : @"DurationMillis",
             @"format" : @"Format",
             @"frameHeight" : @"FrameHeight",
             @"frameRate" : @"FrameRate",
             @"frameWidth" : @"FrameWidth",
             };
}

+ (NSValueTransformer *)colorRangeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FULL"] == NSOrderedSame) {
            return @(AWSRekognitionVideoColorRangeFull);
        }
        if ([value caseInsensitiveCompare:@"LIMITED"] == NSOrderedSame) {
            return @(AWSRekognitionVideoColorRangeLimited);
        }
        return @(AWSRekognitionVideoColorRangeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionVideoColorRangeFull:
                return @"FULL";
            case AWSRekognitionVideoColorRangeLimited:
                return @"LIMITED";
            default:
                return nil;
        }
    }];
}

@end
