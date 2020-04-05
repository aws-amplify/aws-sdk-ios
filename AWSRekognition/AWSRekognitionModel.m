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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"high" : @"High",
             @"low" : @"Low",
             };
}

@end

@implementation AWSRekognitionAsset

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groundTruthManifest" : @"GroundTruthManifest",
             };
}

+ (NSValueTransformer *)groundTruthManifestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionGroundTruthManifest class]];
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

@implementation AWSRekognitionCelebrity

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
             @"faceModelVersion" : @"FaceModelVersion",
             @"statusCode" : @"StatusCode",
             };
}

@end

@implementation AWSRekognitionCreateProjectRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectName" : @"ProjectName",
             };
}

@end

@implementation AWSRekognitionCreateProjectResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectArn" : @"ProjectArn",
             };
}

@end

@implementation AWSRekognitionCreateProjectVersionRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectVersionArn" : @"ProjectVersionArn",
             };
}

@end

@implementation AWSRekognitionCreateStreamProcessorRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamProcessorArn" : @"StreamProcessorArn",
             };
}

@end

@implementation AWSRekognitionCustomLabel

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

@implementation AWSRekognitionDeleteProjectRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectArn" : @"ProjectArn",
             };
}

@end

@implementation AWSRekognitionDeleteProjectResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectVersionArn" : @"ProjectVersionArn",
             };
}

@end

@implementation AWSRekognitionDeleteProjectVersionResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSRekognitionDeleteStreamProcessorResponse

@end

@implementation AWSRekognitionDescribeCollectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionId" : @"CollectionId",
             };
}

@end

@implementation AWSRekognitionDescribeCollectionResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSRekognitionDescribeProjectsResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSRekognitionDescribeStreamProcessorResponse

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

@implementation AWSRekognitionDetectTextFilters

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"minBoundingBoxHeight" : @"MinBoundingBoxHeight",
             @"minBoundingBoxWidth" : @"MinBoundingBoxWidth",
             @"minConfidence" : @"MinConfidence",
             };
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

@implementation AWSRekognitionEvaluationResult

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

@implementation AWSRekognitionFaceDetection

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

@implementation AWSRekognitionFaceSearchSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"collectionId" : @"CollectionId",
             @"faceMatchThreshold" : @"FaceMatchThreshold",
             };
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSRekognitionGetCelebrityInfoResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"urls" : @"Urls",
             };
}

@end

@implementation AWSRekognitionGetCelebrityRecognitionRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSRekognitionGetFaceDetectionResponse

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

@implementation AWSRekognitionGetTextDetectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSRekognitionGetTextDetectionResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanLoopActivationConditionsEvaluationResults" : @"HumanLoopActivationConditionsEvaluationResults",
             @"humanLoopActivationReasons" : @"HumanLoopActivationReasons",
             @"humanLoopArn" : @"HumanLoopArn",
             };
}

@end

@implementation AWSRekognitionHumanLoopConfig

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentClassifiers" : @"ContentClassifiers",
             };
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             };
}

@end

@implementation AWSRekognitionKinesisVideoStream

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             };
}

@end

@implementation AWSRekognitionLabel

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
             @"faceModelVersions" : @"FaceModelVersions",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSRekognitionListStreamProcessorsResponse

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

@implementation AWSRekognitionNotificationChannel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"RoleArn",
             @"SNSTopicArn" : @"SNSTopicArn",
             };
}

@end

@implementation AWSRekognitionOutputConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Bucket" : @"S3Bucket",
             @"s3KeyPrefix" : @"S3KeyPrefix",
             };
}

@end

@implementation AWSRekognitionParent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSRekognitionPersonDetail

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"X" : @"X",
             @"Y" : @"Y",
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

@implementation AWSRekognitionProjectDescription

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billableTrainingTimeInSeconds" : @"BillableTrainingTimeInSeconds",
             @"creationTimestamp" : @"CreationTimestamp",
             @"evaluationResult" : @"EvaluationResult",
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

@implementation AWSRekognitionRecognizeCelebritiesRequest

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
             @"faceModelVersion" : @"FaceModelVersion",
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

@implementation AWSRekognitionStartCelebrityRecognitionRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSRekognitionStartContentModerationRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSRekognitionStartFaceDetectionRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSRekognitionStartFaceSearchRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSRekognitionStartLabelDetectionRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSRekognitionStartPersonTrackingRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSRekognitionStartProjectVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"minInferenceUnits" : @"MinInferenceUnits",
             @"projectVersionArn" : @"ProjectVersionArn",
             };
}

@end

@implementation AWSRekognitionStartProjectVersionResponse

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

@implementation AWSRekognitionStartStreamProcessorRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSRekognitionStartStreamProcessorResponse

@end

@implementation AWSRekognitionStartTextDetectionFilters

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSRekognitionStopProjectVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectVersionArn" : @"ProjectVersionArn",
             };
}

@end

@implementation AWSRekognitionStopProjectVersionResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSRekognitionStopStreamProcessorResponse

@end

@implementation AWSRekognitionStreamProcessor

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"value" : @"Value",
             };
}

@end

@implementation AWSRekognitionTestingData

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"input" : @"Input",
             @"output" : @"Output",
             };
}

+ (NSValueTransformer *)inputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionTestingData class]];
}

+ (NSValueTransformer *)outputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionTestingData class]];
}

@end

@implementation AWSRekognitionTextDetection

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"input" : @"Input",
             @"output" : @"Output",
             };
}

+ (NSValueTransformer *)inputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionTrainingData class]];
}

+ (NSValueTransformer *)outputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSRekognitionTrainingData class]];
}

@end

@implementation AWSRekognitionUnindexedFace

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

@implementation AWSRekognitionVideo

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
