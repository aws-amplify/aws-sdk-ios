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
             @"matchConfidence" : @"MatchConfidence",
             @"name" : @"Name",
             @"urls" : @"Urls",
             };
}

+ (NSValueTransformer *)faceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionComparedFace class]];
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
             @"landmarks" : @"Landmarks",
             @"pose" : @"Pose",
             @"quality" : @"Quality",
             };
}

+ (NSValueTransformer *)boundingBoxJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionBoundingBox class]];
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

@implementation AWSRekognitionContentModerationDetection

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"moderationLabel" : @"ModerationLabel",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)moderationLabelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionModerationLabel class]];
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

@implementation AWSRekognitionCreateProjectRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectName" : @"ProjectName",
             };
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
             @"outputConfig" : @"OutputConfig",
             @"projectArn" : @"ProjectArn",
             @"testingData" : @"TestingData",
             @"trainingData" : @"TrainingData",
             @"versionName" : @"VersionName",
             };
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
             @"input" : @"Input",
             @"name" : @"Name",
             @"output" : @"Output",
             @"roleArn" : @"RoleArn",
             @"settings" : @"Settings",
             };
}

+ (NSValueTransformer *)inputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStreamProcessorInput class]];
}

+ (NSValueTransformer *)outputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStreamProcessorOutput class]];
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
             };
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
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
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
             @"input" : @"Input",
             @"lastUpdateTimestamp" : @"LastUpdateTimestamp",
             @"name" : @"Name",
             @"output" : @"Output",
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

+ (NSValueTransformer *)outputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionStreamProcessorOutput class]];
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

@implementation AWSRekognitionDetectLabelsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelModelVersion" : @"LabelModelVersion",
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanLoopConfig" : @"HumanLoopConfig",
             @"image" : @"Image",
             @"minConfidence" : @"MinConfidence",
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
             @"humanLoopActivationOutput" : @"HumanLoopActivationOutput",
             @"moderationLabels" : @"ModerationLabels",
             @"moderationModelVersion" : @"ModerationModelVersion",
             };
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
             @"name" : @"Name",
             @"urls" : @"Urls",
             };
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
             @"jobStatus" : @"JobStatus",
             @"nextToken" : @"NextToken",
             @"statusMessage" : @"StatusMessage",
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
             @"jobId" : @"JobId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             };
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
             @"jobStatus" : @"JobStatus",
             @"moderationLabels" : @"ModerationLabels",
             @"moderationModelVersion" : @"ModerationModelVersion",
             @"nextToken" : @"NextToken",
             @"statusMessage" : @"StatusMessage",
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

+ (NSValueTransformer *)moderationLabelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionContentModerationDetection class]];
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
             @"jobStatus" : @"JobStatus",
             @"nextToken" : @"NextToken",
             @"statusMessage" : @"StatusMessage",
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

+ (NSValueTransformer *)videoMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideoMetadata class]];
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
             @"jobStatus" : @"JobStatus",
             @"nextToken" : @"NextToken",
             @"persons" : @"Persons",
             @"statusMessage" : @"StatusMessage",
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
             @"jobId" : @"JobId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sortBy" : @"SortBy",
             };
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
             @"jobStatus" : @"JobStatus",
             @"labelModelVersion" : @"LabelModelVersion",
             @"labels" : @"Labels",
             @"nextToken" : @"NextToken",
             @"statusMessage" : @"StatusMessage",
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

+ (NSValueTransformer *)labelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionLabelDetection class]];
}

+ (NSValueTransformer *)videoMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionVideoMetadata class]];
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
             @"jobStatus" : @"JobStatus",
             @"nextToken" : @"NextToken",
             @"persons" : @"Persons",
             @"statusMessage" : @"StatusMessage",
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
             @"jobStatus" : @"JobStatus",
             @"nextToken" : @"NextToken",
             @"segments" : @"Segments",
             @"selectedSegmentTypes" : @"SelectedSegmentTypes",
             @"statusMessage" : @"StatusMessage",
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
             @"jobStatus" : @"JobStatus",
             @"nextToken" : @"NextToken",
             @"statusMessage" : @"StatusMessage",
             @"textDetections" : @"TextDetections",
             @"textModelVersion" : @"TextModelVersion",
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
             };
}

+ (NSValueTransformer *)boundingBoxJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionBoundingBox class]];
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

@implementation AWSRekognitionLabel

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"instances" : @"Instances",
             @"name" : @"Name",
             @"parents" : @"Parents",
             };
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionInstance class]];
}

+ (NSValueTransformer *)parentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSRekognitionParent class]];
}

@end

@implementation AWSRekognitionLabelDetection

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"label" : @"Label",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)labelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionLabel class]];
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

@implementation AWSRekognitionListFacesRequest

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

@implementation AWSRekognitionModerationLabel

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"name" : @"Name",
             @"parentName" : @"ParentName",
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
             @"creationTimestamp" : @"CreationTimestamp",
             @"projectArn" : @"ProjectArn",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)creationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
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

@implementation AWSRekognitionProjectVersionDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billableTrainingTimeInSeconds" : @"BillableTrainingTimeInSeconds",
             @"creationTimestamp" : @"CreationTimestamp",
             @"evaluationResult" : @"EvaluationResult",
             @"manifestSummary" : @"ManifestSummary",
             @"minInferenceUnits" : @"MinInferenceUnits",
             @"outputConfig" : @"OutputConfig",
             @"projectVersionArn" : @"ProjectVersionArn",
             @"status" : @"Status",
             @"statusMessage" : @"StatusMessage",
             @"testingDataResult" : @"TestingDataResult",
             @"trainingDataResult" : @"TrainingDataResult",
             @"trainingEndTimestamp" : @"TrainingEndTimestamp",
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
             };
}

+ (NSValueTransformer *)boundingBoxJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionBoundingBox class]];
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

@implementation AWSRekognitionSegmentDetection

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationMillis" : @"DurationMillis",
             @"durationSMPTE" : @"DurationSMPTE",
             @"endTimecodeSMPTE" : @"EndTimecodeSMPTE",
             @"endTimestampMillis" : @"EndTimestampMillis",
             @"shotSegment" : @"ShotSegment",
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
             };
}

@end

@implementation AWSRekognitionStartStreamProcessorResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSRekognitionStartTechnicalCueDetectionFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"minSegmentConfidence" : @"MinSegmentConfidence",
             };
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
            default:
                return nil;
        }
    }];
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

@implementation AWSRekognitionStreamProcessorOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kinesisDataStream" : @"KinesisDataStream",
             };
}

+ (NSValueTransformer *)kinesisDataStreamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionKinesisDataStream class]];
}

@end

@implementation AWSRekognitionStreamProcessorSettings

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"faceSearch" : @"FaceSearch",
             };
}

+ (NSValueTransformer *)faceSearchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionFaceSearchSettings class]];
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
        return @(AWSRekognitionTechnicalCueTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSRekognitionTechnicalCueTypeColorBars:
                return @"ColorBars";
            case AWSRekognitionTechnicalCueTypeEndCredits:
                return @"EndCredits";
            case AWSRekognitionTechnicalCueTypeBlackFrames:
                return @"BlackFrames";
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
             @"durationMillis" : @"DurationMillis",
             @"format" : @"Format",
             @"frameHeight" : @"FrameHeight",
             @"frameRate" : @"FrameRate",
             @"frameWidth" : @"FrameWidth",
             };
}

@end
