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

#import "AWSCodebuildModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSCodebuildErrorDomain = @"com.amazonaws.AWSCodebuildErrorDomain";

@implementation AWSCodebuildBatchDeleteBuildsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ids" : @"ids",
             };
}

@end

@implementation AWSCodebuildBatchDeleteBuildsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"buildsDeleted" : @"buildsDeleted",
             @"buildsNotDeleted" : @"buildsNotDeleted",
             };
}

+ (NSValueTransformer *)buildsNotDeletedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildBuildNotDeleted class]];
}

@end

@implementation AWSCodebuildBatchGetBuildsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ids" : @"ids",
             };
}

@end

@implementation AWSCodebuildBatchGetBuildsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"builds" : @"builds",
             @"buildsNotFound" : @"buildsNotFound",
             };
}

+ (NSValueTransformer *)buildsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildBuild class]];
}

@end

@implementation AWSCodebuildBatchGetProjectsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"names" : @"names",
             };
}

@end

@implementation AWSCodebuildBatchGetProjectsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projects" : @"projects",
             @"projectsNotFound" : @"projectsNotFound",
             };
}

+ (NSValueTransformer *)projectsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildProject class]];
}

@end

@implementation AWSCodebuildBatchGetReportGroupsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reportGroupArns" : @"reportGroupArns",
             };
}

@end

@implementation AWSCodebuildBatchGetReportGroupsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reportGroups" : @"reportGroups",
             @"reportGroupsNotFound" : @"reportGroupsNotFound",
             };
}

+ (NSValueTransformer *)reportGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildReportGroup class]];
}

@end

@implementation AWSCodebuildBatchGetReportsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reportArns" : @"reportArns",
             };
}

@end

@implementation AWSCodebuildBatchGetReportsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reports" : @"reports",
             @"reportsNotFound" : @"reportsNotFound",
             };
}

+ (NSValueTransformer *)reportsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildReport class]];
}

@end

@implementation AWSCodebuildBuild

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"artifacts" : @"artifacts",
             @"buildComplete" : @"buildComplete",
             @"buildNumber" : @"buildNumber",
             @"buildStatus" : @"buildStatus",
             @"cache" : @"cache",
             @"currentPhase" : @"currentPhase",
             @"encryptionKey" : @"encryptionKey",
             @"endTime" : @"endTime",
             @"environment" : @"environment",
             @"exportedEnvironmentVariables" : @"exportedEnvironmentVariables",
             @"fileSystemLocations" : @"fileSystemLocations",
             @"identifier" : @"id",
             @"initiator" : @"initiator",
             @"logs" : @"logs",
             @"networkInterface" : @"networkInterface",
             @"phases" : @"phases",
             @"projectName" : @"projectName",
             @"queuedTimeoutInMinutes" : @"queuedTimeoutInMinutes",
             @"reportArns" : @"reportArns",
             @"resolvedSourceVersion" : @"resolvedSourceVersion",
             @"secondaryArtifacts" : @"secondaryArtifacts",
             @"secondarySourceVersions" : @"secondarySourceVersions",
             @"secondarySources" : @"secondarySources",
             @"serviceRole" : @"serviceRole",
             @"source" : @"source",
             @"sourceVersion" : @"sourceVersion",
             @"startTime" : @"startTime",
             @"timeoutInMinutes" : @"timeoutInMinutes",
             @"vpcConfig" : @"vpcConfig",
             };
}

+ (NSValueTransformer *)artifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildBuildArtifacts class]];
}

+ (NSValueTransformer *)buildStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSCodebuildStatusTypeSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSCodebuildStatusTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"FAULT"] == NSOrderedSame) {
            return @(AWSCodebuildStatusTypeFault);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSCodebuildStatusTypeTimedOut);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCodebuildStatusTypeInProgress);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSCodebuildStatusTypeStopped);
        }
        return @(AWSCodebuildStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildStatusTypeSucceeded:
                return @"SUCCEEDED";
            case AWSCodebuildStatusTypeFailed:
                return @"FAILED";
            case AWSCodebuildStatusTypeFault:
                return @"FAULT";
            case AWSCodebuildStatusTypeTimedOut:
                return @"TIMED_OUT";
            case AWSCodebuildStatusTypeInProgress:
                return @"IN_PROGRESS";
            case AWSCodebuildStatusTypeStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)cacheJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildProjectCache class]];
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)environmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildProjectEnvironment class]];
}

+ (NSValueTransformer *)exportedEnvironmentVariablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildExportedEnvironmentVariable class]];
}

+ (NSValueTransformer *)fileSystemLocationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildProjectFileSystemLocation class]];
}

+ (NSValueTransformer *)logsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildLogsLocation class]];
}

+ (NSValueTransformer *)networkInterfaceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildNetworkInterface class]];
}

+ (NSValueTransformer *)phasesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildBuildPhase class]];
}

+ (NSValueTransformer *)secondaryArtifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildBuildArtifacts class]];
}

+ (NSValueTransformer *)secondarySourceVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildProjectSourceVersion class]];
}

+ (NSValueTransformer *)secondarySourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildProjectSource class]];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildProjectSource class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildVpcConfig class]];
}

@end

@implementation AWSCodebuildBuildArtifacts

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"artifactIdentifier" : @"artifactIdentifier",
             @"encryptionDisabled" : @"encryptionDisabled",
             @"location" : @"location",
             @"md5sum" : @"md5sum",
             @"overrideArtifactName" : @"overrideArtifactName",
             @"sha256sum" : @"sha256sum",
             };
}

@end

@implementation AWSCodebuildBuildNotDeleted

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"id",
             @"statusCode" : @"statusCode",
             };
}

@end

@implementation AWSCodebuildBuildPhase

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contexts" : @"contexts",
             @"durationInSeconds" : @"durationInSeconds",
             @"endTime" : @"endTime",
             @"phaseStatus" : @"phaseStatus",
             @"phaseType" : @"phaseType",
             @"startTime" : @"startTime",
             };
}

+ (NSValueTransformer *)contextsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildPhaseContext class]];
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)phaseStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSCodebuildStatusTypeSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSCodebuildStatusTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"FAULT"] == NSOrderedSame) {
            return @(AWSCodebuildStatusTypeFault);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSCodebuildStatusTypeTimedOut);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCodebuildStatusTypeInProgress);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSCodebuildStatusTypeStopped);
        }
        return @(AWSCodebuildStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildStatusTypeSucceeded:
                return @"SUCCEEDED";
            case AWSCodebuildStatusTypeFailed:
                return @"FAILED";
            case AWSCodebuildStatusTypeFault:
                return @"FAULT";
            case AWSCodebuildStatusTypeTimedOut:
                return @"TIMED_OUT";
            case AWSCodebuildStatusTypeInProgress:
                return @"IN_PROGRESS";
            case AWSCodebuildStatusTypeStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)phaseTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSCodebuildBuildPhaseTypeSubmitted);
        }
        if ([value caseInsensitiveCompare:@"QUEUED"] == NSOrderedSame) {
            return @(AWSCodebuildBuildPhaseTypeQueued);
        }
        if ([value caseInsensitiveCompare:@"PROVISIONING"] == NSOrderedSame) {
            return @(AWSCodebuildBuildPhaseTypeProvisioning);
        }
        if ([value caseInsensitiveCompare:@"DOWNLOAD_SOURCE"] == NSOrderedSame) {
            return @(AWSCodebuildBuildPhaseTypeDownloadSource);
        }
        if ([value caseInsensitiveCompare:@"INSTALL"] == NSOrderedSame) {
            return @(AWSCodebuildBuildPhaseTypeInstall);
        }
        if ([value caseInsensitiveCompare:@"PRE_BUILD"] == NSOrderedSame) {
            return @(AWSCodebuildBuildPhaseTypePreBuild);
        }
        if ([value caseInsensitiveCompare:@"BUILD"] == NSOrderedSame) {
            return @(AWSCodebuildBuildPhaseTypeBuild);
        }
        if ([value caseInsensitiveCompare:@"POST_BUILD"] == NSOrderedSame) {
            return @(AWSCodebuildBuildPhaseTypePostBuild);
        }
        if ([value caseInsensitiveCompare:@"UPLOAD_ARTIFACTS"] == NSOrderedSame) {
            return @(AWSCodebuildBuildPhaseTypeUploadArtifacts);
        }
        if ([value caseInsensitiveCompare:@"FINALIZING"] == NSOrderedSame) {
            return @(AWSCodebuildBuildPhaseTypeFinalizing);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSCodebuildBuildPhaseTypeCompleted);
        }
        return @(AWSCodebuildBuildPhaseTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildBuildPhaseTypeSubmitted:
                return @"SUBMITTED";
            case AWSCodebuildBuildPhaseTypeQueued:
                return @"QUEUED";
            case AWSCodebuildBuildPhaseTypeProvisioning:
                return @"PROVISIONING";
            case AWSCodebuildBuildPhaseTypeDownloadSource:
                return @"DOWNLOAD_SOURCE";
            case AWSCodebuildBuildPhaseTypeInstall:
                return @"INSTALL";
            case AWSCodebuildBuildPhaseTypePreBuild:
                return @"PRE_BUILD";
            case AWSCodebuildBuildPhaseTypeBuild:
                return @"BUILD";
            case AWSCodebuildBuildPhaseTypePostBuild:
                return @"POST_BUILD";
            case AWSCodebuildBuildPhaseTypeUploadArtifacts:
                return @"UPLOAD_ARTIFACTS";
            case AWSCodebuildBuildPhaseTypeFinalizing:
                return @"FINALIZING";
            case AWSCodebuildBuildPhaseTypeCompleted:
                return @"COMPLETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSCodebuildCloudWatchLogsConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"groupName",
             @"status" : @"status",
             @"streamName" : @"streamName",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSCodebuildLogsConfigStatusTypeEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSCodebuildLogsConfigStatusTypeDisabled);
        }
        return @(AWSCodebuildLogsConfigStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildLogsConfigStatusTypeEnabled:
                return @"ENABLED";
            case AWSCodebuildLogsConfigStatusTypeDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildCreateProjectInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"artifacts" : @"artifacts",
             @"badgeEnabled" : @"badgeEnabled",
             @"cache" : @"cache",
             @"detail" : @"description",
             @"encryptionKey" : @"encryptionKey",
             @"environment" : @"environment",
             @"fileSystemLocations" : @"fileSystemLocations",
             @"logsConfig" : @"logsConfig",
             @"name" : @"name",
             @"queuedTimeoutInMinutes" : @"queuedTimeoutInMinutes",
             @"secondaryArtifacts" : @"secondaryArtifacts",
             @"secondarySourceVersions" : @"secondarySourceVersions",
             @"secondarySources" : @"secondarySources",
             @"serviceRole" : @"serviceRole",
             @"source" : @"source",
             @"sourceVersion" : @"sourceVersion",
             @"tags" : @"tags",
             @"timeoutInMinutes" : @"timeoutInMinutes",
             @"vpcConfig" : @"vpcConfig",
             };
}

+ (NSValueTransformer *)artifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildProjectArtifacts class]];
}

+ (NSValueTransformer *)cacheJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildProjectCache class]];
}

+ (NSValueTransformer *)environmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildProjectEnvironment class]];
}

+ (NSValueTransformer *)fileSystemLocationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildProjectFileSystemLocation class]];
}

+ (NSValueTransformer *)logsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildLogsConfig class]];
}

+ (NSValueTransformer *)secondaryArtifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildProjectArtifacts class]];
}

+ (NSValueTransformer *)secondarySourceVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildProjectSourceVersion class]];
}

+ (NSValueTransformer *)secondarySourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildProjectSource class]];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildProjectSource class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildTag class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildVpcConfig class]];
}

@end

@implementation AWSCodebuildCreateProjectOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"project" : @"project",
             };
}

+ (NSValueTransformer *)projectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildProject class]];
}

@end

@implementation AWSCodebuildCreateReportGroupInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportConfig" : @"exportConfig",
             @"name" : @"name",
             @"tags" : @"tags",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)exportConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildReportExportConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildTag class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TEST"] == NSOrderedSame) {
            return @(AWSCodebuildReportTypeTest);
        }
        return @(AWSCodebuildReportTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildReportTypeTest:
                return @"TEST";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildCreateReportGroupOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reportGroup" : @"reportGroup",
             };
}

+ (NSValueTransformer *)reportGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildReportGroup class]];
}

@end

@implementation AWSCodebuildCreateWebhookInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branchFilter" : @"branchFilter",
             @"filterGroups" : @"filterGroups",
             @"projectName" : @"projectName",
             };
}

@end

@implementation AWSCodebuildCreateWebhookOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"webhook" : @"webhook",
             };
}

+ (NSValueTransformer *)webhookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildWebhook class]];
}

@end

@implementation AWSCodebuildDeleteProjectInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             };
}

@end

@implementation AWSCodebuildDeleteProjectOutput

@end

@implementation AWSCodebuildDeleteReportGroupInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             };
}

@end

@implementation AWSCodebuildDeleteReportGroupOutput

@end

@implementation AWSCodebuildDeleteReportInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             };
}

@end

@implementation AWSCodebuildDeleteReportOutput

@end

@implementation AWSCodebuildDeleteResourcePolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSCodebuildDeleteResourcePolicyOutput

@end

@implementation AWSCodebuildDeleteSourceCredentialsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             };
}

@end

@implementation AWSCodebuildDeleteSourceCredentialsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             };
}

@end

@implementation AWSCodebuildDeleteWebhookInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectName" : @"projectName",
             };
}

@end

@implementation AWSCodebuildDeleteWebhookOutput

@end

@implementation AWSCodebuildDescribeTestCasesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"filter",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"reportArn" : @"reportArn",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildTestCaseFilter class]];
}

@end

@implementation AWSCodebuildDescribeTestCasesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"testCases" : @"testCases",
             };
}

+ (NSValueTransformer *)testCasesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildTestCase class]];
}

@end

@implementation AWSCodebuildEnvironmentImage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"name" : @"name",
             @"versions" : @"versions",
             };
}

@end

@implementation AWSCodebuildEnvironmentLanguage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"images" : @"images",
             @"language" : @"language",
             };
}

+ (NSValueTransformer *)imagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildEnvironmentImage class]];
}

+ (NSValueTransformer *)languageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JAVA"] == NSOrderedSame) {
            return @(AWSCodebuildLanguageTypeJava);
        }
        if ([value caseInsensitiveCompare:@"PYTHON"] == NSOrderedSame) {
            return @(AWSCodebuildLanguageTypePython);
        }
        if ([value caseInsensitiveCompare:@"NODE_JS"] == NSOrderedSame) {
            return @(AWSCodebuildLanguageTypeNodeJs);
        }
        if ([value caseInsensitiveCompare:@"RUBY"] == NSOrderedSame) {
            return @(AWSCodebuildLanguageTypeRuby);
        }
        if ([value caseInsensitiveCompare:@"GOLANG"] == NSOrderedSame) {
            return @(AWSCodebuildLanguageTypeGolang);
        }
        if ([value caseInsensitiveCompare:@"DOCKER"] == NSOrderedSame) {
            return @(AWSCodebuildLanguageTypeDocker);
        }
        if ([value caseInsensitiveCompare:@"ANDROID"] == NSOrderedSame) {
            return @(AWSCodebuildLanguageTypeAndroid);
        }
        if ([value caseInsensitiveCompare:@"DOTNET"] == NSOrderedSame) {
            return @(AWSCodebuildLanguageTypeDotnet);
        }
        if ([value caseInsensitiveCompare:@"BASE"] == NSOrderedSame) {
            return @(AWSCodebuildLanguageTypeBase);
        }
        if ([value caseInsensitiveCompare:@"PHP"] == NSOrderedSame) {
            return @(AWSCodebuildLanguageTypePhp);
        }
        return @(AWSCodebuildLanguageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildLanguageTypeJava:
                return @"JAVA";
            case AWSCodebuildLanguageTypePython:
                return @"PYTHON";
            case AWSCodebuildLanguageTypeNodeJs:
                return @"NODE_JS";
            case AWSCodebuildLanguageTypeRuby:
                return @"RUBY";
            case AWSCodebuildLanguageTypeGolang:
                return @"GOLANG";
            case AWSCodebuildLanguageTypeDocker:
                return @"DOCKER";
            case AWSCodebuildLanguageTypeAndroid:
                return @"ANDROID";
            case AWSCodebuildLanguageTypeDotnet:
                return @"DOTNET";
            case AWSCodebuildLanguageTypeBase:
                return @"BASE";
            case AWSCodebuildLanguageTypePhp:
                return @"PHP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildEnvironmentPlatform

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languages" : @"languages",
             @"platform" : @"platform",
             };
}

+ (NSValueTransformer *)languagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildEnvironmentLanguage class]];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEBIAN"] == NSOrderedSame) {
            return @(AWSCodebuildPlatformTypeDebian);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSCodebuildPlatformTypeAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSCodebuildPlatformTypeUbuntu);
        }
        if ([value caseInsensitiveCompare:@"WINDOWS_SERVER"] == NSOrderedSame) {
            return @(AWSCodebuildPlatformTypeWindowsServer);
        }
        return @(AWSCodebuildPlatformTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildPlatformTypeDebian:
                return @"DEBIAN";
            case AWSCodebuildPlatformTypeAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSCodebuildPlatformTypeUbuntu:
                return @"UBUNTU";
            case AWSCodebuildPlatformTypeWindowsServer:
                return @"WINDOWS_SERVER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildEnvironmentVariable

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"types" : @"type",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PLAINTEXT"] == NSOrderedSame) {
            return @(AWSCodebuildEnvironmentVariableTypePlaintext);
        }
        if ([value caseInsensitiveCompare:@"PARAMETER_STORE"] == NSOrderedSame) {
            return @(AWSCodebuildEnvironmentVariableTypeParameterStore);
        }
        if ([value caseInsensitiveCompare:@"SECRETS_MANAGER"] == NSOrderedSame) {
            return @(AWSCodebuildEnvironmentVariableTypeSecretsManager);
        }
        return @(AWSCodebuildEnvironmentVariableTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildEnvironmentVariableTypePlaintext:
                return @"PLAINTEXT";
            case AWSCodebuildEnvironmentVariableTypeParameterStore:
                return @"PARAMETER_STORE";
            case AWSCodebuildEnvironmentVariableTypeSecretsManager:
                return @"SECRETS_MANAGER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildExportedEnvironmentVariable

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"value" : @"value",
             };
}

@end

@implementation AWSCodebuildGetResourcePolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSCodebuildGetResourcePolicyOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"policy",
             };
}

@end

@implementation AWSCodebuildGitSubmodulesConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fetchSubmodules" : @"fetchSubmodules",
             };
}

@end

@implementation AWSCodebuildImportSourceCredentialsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authType" : @"authType",
             @"serverType" : @"serverType",
             @"shouldOverwrite" : @"shouldOverwrite",
             @"token" : @"token",
             @"username" : @"username",
             };
}

+ (NSValueTransformer *)authTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OAUTH"] == NSOrderedSame) {
            return @(AWSCodebuildAuthTypeOauth);
        }
        if ([value caseInsensitiveCompare:@"BASIC_AUTH"] == NSOrderedSame) {
            return @(AWSCodebuildAuthTypeBasicAuth);
        }
        if ([value caseInsensitiveCompare:@"PERSONAL_ACCESS_TOKEN"] == NSOrderedSame) {
            return @(AWSCodebuildAuthTypePersonalAccessToken);
        }
        return @(AWSCodebuildAuthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildAuthTypeOauth:
                return @"OAUTH";
            case AWSCodebuildAuthTypeBasicAuth:
                return @"BASIC_AUTH";
            case AWSCodebuildAuthTypePersonalAccessToken:
                return @"PERSONAL_ACCESS_TOKEN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serverTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GITHUB"] == NSOrderedSame) {
            return @(AWSCodebuildServerTypeGithub);
        }
        if ([value caseInsensitiveCompare:@"BITBUCKET"] == NSOrderedSame) {
            return @(AWSCodebuildServerTypeBitbucket);
        }
        if ([value caseInsensitiveCompare:@"GITHUB_ENTERPRISE"] == NSOrderedSame) {
            return @(AWSCodebuildServerTypeGithubEnterprise);
        }
        return @(AWSCodebuildServerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildServerTypeGithub:
                return @"GITHUB";
            case AWSCodebuildServerTypeBitbucket:
                return @"BITBUCKET";
            case AWSCodebuildServerTypeGithubEnterprise:
                return @"GITHUB_ENTERPRISE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildImportSourceCredentialsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             };
}

@end

@implementation AWSCodebuildInvalidateProjectCacheInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectName" : @"projectName",
             };
}

@end

@implementation AWSCodebuildInvalidateProjectCacheOutput

@end

@implementation AWSCodebuildListBuildsForProjectInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"projectName" : @"projectName",
             @"sortOrder" : @"sortOrder",
             };
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSCodebuildSortOrderTypeAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSCodebuildSortOrderTypeDescending);
        }
        return @(AWSCodebuildSortOrderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildSortOrderTypeAscending:
                return @"ASCENDING";
            case AWSCodebuildSortOrderTypeDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildListBuildsForProjectOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ids" : @"ids",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSCodebuildListBuildsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"sortOrder" : @"sortOrder",
             };
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSCodebuildSortOrderTypeAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSCodebuildSortOrderTypeDescending);
        }
        return @(AWSCodebuildSortOrderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildSortOrderTypeAscending:
                return @"ASCENDING";
            case AWSCodebuildSortOrderTypeDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildListBuildsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ids" : @"ids",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSCodebuildListCuratedEnvironmentImagesInput

@end

@implementation AWSCodebuildListCuratedEnvironmentImagesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"platforms" : @"platforms",
             };
}

+ (NSValueTransformer *)platformsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildEnvironmentPlatform class]];
}

@end

@implementation AWSCodebuildListProjectsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"sortBy" : @"sortBy",
             @"sortOrder" : @"sortOrder",
             };
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NAME"] == NSOrderedSame) {
            return @(AWSCodebuildProjectSortByTypeName);
        }
        if ([value caseInsensitiveCompare:@"CREATED_TIME"] == NSOrderedSame) {
            return @(AWSCodebuildProjectSortByTypeCreatedTime);
        }
        if ([value caseInsensitiveCompare:@"LAST_MODIFIED_TIME"] == NSOrderedSame) {
            return @(AWSCodebuildProjectSortByTypeLastModifiedTime);
        }
        return @(AWSCodebuildProjectSortByTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildProjectSortByTypeName:
                return @"NAME";
            case AWSCodebuildProjectSortByTypeCreatedTime:
                return @"CREATED_TIME";
            case AWSCodebuildProjectSortByTypeLastModifiedTime:
                return @"LAST_MODIFIED_TIME";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSCodebuildSortOrderTypeAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSCodebuildSortOrderTypeDescending);
        }
        return @(AWSCodebuildSortOrderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildSortOrderTypeAscending:
                return @"ASCENDING";
            case AWSCodebuildSortOrderTypeDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildListProjectsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"projects" : @"projects",
             };
}

@end

@implementation AWSCodebuildListReportGroupsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"sortBy" : @"sortBy",
             @"sortOrder" : @"sortOrder",
             };
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NAME"] == NSOrderedSame) {
            return @(AWSCodebuildReportGroupSortByTypeName);
        }
        if ([value caseInsensitiveCompare:@"CREATED_TIME"] == NSOrderedSame) {
            return @(AWSCodebuildReportGroupSortByTypeCreatedTime);
        }
        if ([value caseInsensitiveCompare:@"LAST_MODIFIED_TIME"] == NSOrderedSame) {
            return @(AWSCodebuildReportGroupSortByTypeLastModifiedTime);
        }
        return @(AWSCodebuildReportGroupSortByTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildReportGroupSortByTypeName:
                return @"NAME";
            case AWSCodebuildReportGroupSortByTypeCreatedTime:
                return @"CREATED_TIME";
            case AWSCodebuildReportGroupSortByTypeLastModifiedTime:
                return @"LAST_MODIFIED_TIME";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSCodebuildSortOrderTypeAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSCodebuildSortOrderTypeDescending);
        }
        return @(AWSCodebuildSortOrderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildSortOrderTypeAscending:
                return @"ASCENDING";
            case AWSCodebuildSortOrderTypeDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildListReportGroupsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"reportGroups" : @"reportGroups",
             };
}

@end

@implementation AWSCodebuildListReportsForReportGroupInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"filter",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"reportGroupArn" : @"reportGroupArn",
             @"sortOrder" : @"sortOrder",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildReportFilter class]];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSCodebuildSortOrderTypeAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSCodebuildSortOrderTypeDescending);
        }
        return @(AWSCodebuildSortOrderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildSortOrderTypeAscending:
                return @"ASCENDING";
            case AWSCodebuildSortOrderTypeDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildListReportsForReportGroupOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"reports" : @"reports",
             };
}

@end

@implementation AWSCodebuildListReportsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"filter",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"sortOrder" : @"sortOrder",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildReportFilter class]];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSCodebuildSortOrderTypeAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSCodebuildSortOrderTypeDescending);
        }
        return @(AWSCodebuildSortOrderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildSortOrderTypeAscending:
                return @"ASCENDING";
            case AWSCodebuildSortOrderTypeDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildListReportsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"reports" : @"reports",
             };
}

@end

@implementation AWSCodebuildListSharedProjectsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"sortBy" : @"sortBy",
             @"sortOrder" : @"sortOrder",
             };
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ARN"] == NSOrderedSame) {
            return @(AWSCodebuildSharedResourceSortByTypeArn);
        }
        if ([value caseInsensitiveCompare:@"MODIFIED_TIME"] == NSOrderedSame) {
            return @(AWSCodebuildSharedResourceSortByTypeModifiedTime);
        }
        return @(AWSCodebuildSharedResourceSortByTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildSharedResourceSortByTypeArn:
                return @"ARN";
            case AWSCodebuildSharedResourceSortByTypeModifiedTime:
                return @"MODIFIED_TIME";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSCodebuildSortOrderTypeAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSCodebuildSortOrderTypeDescending);
        }
        return @(AWSCodebuildSortOrderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildSortOrderTypeAscending:
                return @"ASCENDING";
            case AWSCodebuildSortOrderTypeDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildListSharedProjectsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"projects" : @"projects",
             };
}

@end

@implementation AWSCodebuildListSharedReportGroupsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"sortBy" : @"sortBy",
             @"sortOrder" : @"sortOrder",
             };
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ARN"] == NSOrderedSame) {
            return @(AWSCodebuildSharedResourceSortByTypeArn);
        }
        if ([value caseInsensitiveCompare:@"MODIFIED_TIME"] == NSOrderedSame) {
            return @(AWSCodebuildSharedResourceSortByTypeModifiedTime);
        }
        return @(AWSCodebuildSharedResourceSortByTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildSharedResourceSortByTypeArn:
                return @"ARN";
            case AWSCodebuildSharedResourceSortByTypeModifiedTime:
                return @"MODIFIED_TIME";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSCodebuildSortOrderTypeAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSCodebuildSortOrderTypeDescending);
        }
        return @(AWSCodebuildSortOrderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildSortOrderTypeAscending:
                return @"ASCENDING";
            case AWSCodebuildSortOrderTypeDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildListSharedReportGroupsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"reportGroups" : @"reportGroups",
             };
}

@end

@implementation AWSCodebuildListSourceCredentialsInput

@end

@implementation AWSCodebuildListSourceCredentialsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceCredentialsInfos" : @"sourceCredentialsInfos",
             };
}

+ (NSValueTransformer *)sourceCredentialsInfosJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildSourceCredentialsInfo class]];
}

@end

@implementation AWSCodebuildLogsConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLogs" : @"cloudWatchLogs",
             @"s3Logs" : @"s3Logs",
             };
}

+ (NSValueTransformer *)cloudWatchLogsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildCloudWatchLogsConfig class]];
}

+ (NSValueTransformer *)s3LogsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildS3LogsConfig class]];
}

@end

@implementation AWSCodebuildLogsLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLogs" : @"cloudWatchLogs",
             @"cloudWatchLogsArn" : @"cloudWatchLogsArn",
             @"deepLink" : @"deepLink",
             @"groupName" : @"groupName",
             @"s3DeepLink" : @"s3DeepLink",
             @"s3Logs" : @"s3Logs",
             @"s3LogsArn" : @"s3LogsArn",
             @"streamName" : @"streamName",
             };
}

+ (NSValueTransformer *)cloudWatchLogsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildCloudWatchLogsConfig class]];
}

+ (NSValueTransformer *)s3LogsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildS3LogsConfig class]];
}

@end

@implementation AWSCodebuildNetworkInterface

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"networkInterfaceId" : @"networkInterfaceId",
             @"subnetId" : @"subnetId",
             };
}

@end

@implementation AWSCodebuildPhaseContext

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"message",
             @"statusCode" : @"statusCode",
             };
}

@end

@implementation AWSCodebuildProject

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"artifacts" : @"artifacts",
             @"badge" : @"badge",
             @"cache" : @"cache",
             @"created" : @"created",
             @"detail" : @"description",
             @"encryptionKey" : @"encryptionKey",
             @"environment" : @"environment",
             @"fileSystemLocations" : @"fileSystemLocations",
             @"lastModified" : @"lastModified",
             @"logsConfig" : @"logsConfig",
             @"name" : @"name",
             @"queuedTimeoutInMinutes" : @"queuedTimeoutInMinutes",
             @"secondaryArtifacts" : @"secondaryArtifacts",
             @"secondarySourceVersions" : @"secondarySourceVersions",
             @"secondarySources" : @"secondarySources",
             @"serviceRole" : @"serviceRole",
             @"source" : @"source",
             @"sourceVersion" : @"sourceVersion",
             @"tags" : @"tags",
             @"timeoutInMinutes" : @"timeoutInMinutes",
             @"vpcConfig" : @"vpcConfig",
             @"webhook" : @"webhook",
             };
}

+ (NSValueTransformer *)artifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildProjectArtifacts class]];
}

+ (NSValueTransformer *)badgeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildProjectBadge class]];
}

+ (NSValueTransformer *)cacheJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildProjectCache class]];
}

+ (NSValueTransformer *)createdJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)environmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildProjectEnvironment class]];
}

+ (NSValueTransformer *)fileSystemLocationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildProjectFileSystemLocation class]];
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)logsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildLogsConfig class]];
}

+ (NSValueTransformer *)secondaryArtifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildProjectArtifacts class]];
}

+ (NSValueTransformer *)secondarySourceVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildProjectSourceVersion class]];
}

+ (NSValueTransformer *)secondarySourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildProjectSource class]];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildProjectSource class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildTag class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildVpcConfig class]];
}

+ (NSValueTransformer *)webhookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildWebhook class]];
}

@end

@implementation AWSCodebuildProjectArtifacts

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"artifactIdentifier" : @"artifactIdentifier",
             @"encryptionDisabled" : @"encryptionDisabled",
             @"location" : @"location",
             @"name" : @"name",
             @"namespaceType" : @"namespaceType",
             @"overrideArtifactName" : @"overrideArtifactName",
             @"packaging" : @"packaging",
             @"path" : @"path",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)namespaceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSCodebuildArtifactNamespaceNone);
        }
        if ([value caseInsensitiveCompare:@"BUILD_ID"] == NSOrderedSame) {
            return @(AWSCodebuildArtifactNamespaceBuildId);
        }
        return @(AWSCodebuildArtifactNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildArtifactNamespaceNone:
                return @"NONE";
            case AWSCodebuildArtifactNamespaceBuildId:
                return @"BUILD_ID";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)packagingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSCodebuildArtifactPackagingNone);
        }
        if ([value caseInsensitiveCompare:@"ZIP"] == NSOrderedSame) {
            return @(AWSCodebuildArtifactPackagingZip);
        }
        return @(AWSCodebuildArtifactPackagingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildArtifactPackagingNone:
                return @"NONE";
            case AWSCodebuildArtifactPackagingZip:
                return @"ZIP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODEPIPELINE"] == NSOrderedSame) {
            return @(AWSCodebuildArtifactsTypeCodepipeline);
        }
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSCodebuildArtifactsTypeS3);
        }
        if ([value caseInsensitiveCompare:@"NO_ARTIFACTS"] == NSOrderedSame) {
            return @(AWSCodebuildArtifactsTypeNoArtifacts);
        }
        return @(AWSCodebuildArtifactsTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildArtifactsTypeCodepipeline:
                return @"CODEPIPELINE";
            case AWSCodebuildArtifactsTypeS3:
                return @"S3";
            case AWSCodebuildArtifactsTypeNoArtifacts:
                return @"NO_ARTIFACTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildProjectBadge

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"badgeEnabled" : @"badgeEnabled",
             @"badgeRequestUrl" : @"badgeRequestUrl",
             };
}

@end

@implementation AWSCodebuildProjectCache

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"location" : @"location",
             @"modes" : @"modes",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_CACHE"] == NSOrderedSame) {
            return @(AWSCodebuildCacheTypeNoCache);
        }
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSCodebuildCacheTypeS3);
        }
        if ([value caseInsensitiveCompare:@"LOCAL"] == NSOrderedSame) {
            return @(AWSCodebuildCacheTypeLocal);
        }
        return @(AWSCodebuildCacheTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildCacheTypeNoCache:
                return @"NO_CACHE";
            case AWSCodebuildCacheTypeS3:
                return @"S3";
            case AWSCodebuildCacheTypeLocal:
                return @"LOCAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildProjectEnvironment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificate" : @"certificate",
             @"computeType" : @"computeType",
             @"environmentVariables" : @"environmentVariables",
             @"image" : @"image",
             @"imagePullCredentialsType" : @"imagePullCredentialsType",
             @"privilegedMode" : @"privilegedMode",
             @"registryCredential" : @"registryCredential",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)computeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BUILD_GENERAL1_SMALL"] == NSOrderedSame) {
            return @(AWSCodebuildComputeTypeBuildGeneral1Small);
        }
        if ([value caseInsensitiveCompare:@"BUILD_GENERAL1_MEDIUM"] == NSOrderedSame) {
            return @(AWSCodebuildComputeTypeBuildGeneral1Medium);
        }
        if ([value caseInsensitiveCompare:@"BUILD_GENERAL1_LARGE"] == NSOrderedSame) {
            return @(AWSCodebuildComputeTypeBuildGeneral1Large);
        }
        if ([value caseInsensitiveCompare:@"BUILD_GENERAL1_2XLARGE"] == NSOrderedSame) {
            return @(AWSCodebuildComputeTypeBuildGeneral12xlarge);
        }
        return @(AWSCodebuildComputeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildComputeTypeBuildGeneral1Small:
                return @"BUILD_GENERAL1_SMALL";
            case AWSCodebuildComputeTypeBuildGeneral1Medium:
                return @"BUILD_GENERAL1_MEDIUM";
            case AWSCodebuildComputeTypeBuildGeneral1Large:
                return @"BUILD_GENERAL1_LARGE";
            case AWSCodebuildComputeTypeBuildGeneral12xlarge:
                return @"BUILD_GENERAL1_2XLARGE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)environmentVariablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildEnvironmentVariable class]];
}

+ (NSValueTransformer *)imagePullCredentialsTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODEBUILD"] == NSOrderedSame) {
            return @(AWSCodebuildImagePullCredentialsTypeCodebuild);
        }
        if ([value caseInsensitiveCompare:@"SERVICE_ROLE"] == NSOrderedSame) {
            return @(AWSCodebuildImagePullCredentialsTypeServiceRole);
        }
        return @(AWSCodebuildImagePullCredentialsTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildImagePullCredentialsTypeCodebuild:
                return @"CODEBUILD";
            case AWSCodebuildImagePullCredentialsTypeServiceRole:
                return @"SERVICE_ROLE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)registryCredentialJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildRegistryCredential class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS_CONTAINER"] == NSOrderedSame) {
            return @(AWSCodebuildEnvironmentTypeWindowsContainer);
        }
        if ([value caseInsensitiveCompare:@"LINUX_CONTAINER"] == NSOrderedSame) {
            return @(AWSCodebuildEnvironmentTypeLinuxContainer);
        }
        if ([value caseInsensitiveCompare:@"LINUX_GPU_CONTAINER"] == NSOrderedSame) {
            return @(AWSCodebuildEnvironmentTypeLinuxGpuContainer);
        }
        if ([value caseInsensitiveCompare:@"ARM_CONTAINER"] == NSOrderedSame) {
            return @(AWSCodebuildEnvironmentTypeArmContainer);
        }
        return @(AWSCodebuildEnvironmentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildEnvironmentTypeWindowsContainer:
                return @"WINDOWS_CONTAINER";
            case AWSCodebuildEnvironmentTypeLinuxContainer:
                return @"LINUX_CONTAINER";
            case AWSCodebuildEnvironmentTypeLinuxGpuContainer:
                return @"LINUX_GPU_CONTAINER";
            case AWSCodebuildEnvironmentTypeArmContainer:
                return @"ARM_CONTAINER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildProjectFileSystemLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"identifier",
             @"location" : @"location",
             @"mountOptions" : @"mountOptions",
             @"mountPoint" : @"mountPoint",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EFS"] == NSOrderedSame) {
            return @(AWSCodebuildFileSystemTypeEfs);
        }
        return @(AWSCodebuildFileSystemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildFileSystemTypeEfs:
                return @"EFS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildProjectSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"auth" : @"auth",
             @"buildspec" : @"buildspec",
             @"gitCloneDepth" : @"gitCloneDepth",
             @"gitSubmodulesConfig" : @"gitSubmodulesConfig",
             @"insecureSsl" : @"insecureSsl",
             @"location" : @"location",
             @"reportBuildStatus" : @"reportBuildStatus",
             @"sourceIdentifier" : @"sourceIdentifier",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)authJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildSourceAuth class]];
}

+ (NSValueTransformer *)gitSubmodulesConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildGitSubmodulesConfig class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODECOMMIT"] == NSOrderedSame) {
            return @(AWSCodebuildSourceTypeCodecommit);
        }
        if ([value caseInsensitiveCompare:@"CODEPIPELINE"] == NSOrderedSame) {
            return @(AWSCodebuildSourceTypeCodepipeline);
        }
        if ([value caseInsensitiveCompare:@"GITHUB"] == NSOrderedSame) {
            return @(AWSCodebuildSourceTypeGithub);
        }
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSCodebuildSourceTypeS3);
        }
        if ([value caseInsensitiveCompare:@"BITBUCKET"] == NSOrderedSame) {
            return @(AWSCodebuildSourceTypeBitbucket);
        }
        if ([value caseInsensitiveCompare:@"GITHUB_ENTERPRISE"] == NSOrderedSame) {
            return @(AWSCodebuildSourceTypeGithubEnterprise);
        }
        if ([value caseInsensitiveCompare:@"NO_SOURCE"] == NSOrderedSame) {
            return @(AWSCodebuildSourceTypeNoSource);
        }
        return @(AWSCodebuildSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildSourceTypeCodecommit:
                return @"CODECOMMIT";
            case AWSCodebuildSourceTypeCodepipeline:
                return @"CODEPIPELINE";
            case AWSCodebuildSourceTypeGithub:
                return @"GITHUB";
            case AWSCodebuildSourceTypeS3:
                return @"S3";
            case AWSCodebuildSourceTypeBitbucket:
                return @"BITBUCKET";
            case AWSCodebuildSourceTypeGithubEnterprise:
                return @"GITHUB_ENTERPRISE";
            case AWSCodebuildSourceTypeNoSource:
                return @"NO_SOURCE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildProjectSourceVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceIdentifier" : @"sourceIdentifier",
             @"sourceVersion" : @"sourceVersion",
             };
}

@end

@implementation AWSCodebuildPutResourcePolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"policy",
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSCodebuildPutResourcePolicyOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSCodebuildRegistryCredential

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"credential" : @"credential",
             @"credentialProvider" : @"credentialProvider",
             };
}

+ (NSValueTransformer *)credentialProviderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECRETS_MANAGER"] == NSOrderedSame) {
            return @(AWSCodebuildCredentialProviderTypeSecretsManager);
        }
        return @(AWSCodebuildCredentialProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildCredentialProviderTypeSecretsManager:
                return @"SECRETS_MANAGER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildReport

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"created" : @"created",
             @"executionId" : @"executionId",
             @"expired" : @"expired",
             @"exportConfig" : @"exportConfig",
             @"name" : @"name",
             @"reportGroupArn" : @"reportGroupArn",
             @"status" : @"status",
             @"testSummary" : @"testSummary",
             @"truncated" : @"truncated",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)createdJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)expiredJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)exportConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildReportExportConfig class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GENERATING"] == NSOrderedSame) {
            return @(AWSCodebuildReportStatusTypeGenerating);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSCodebuildReportStatusTypeSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSCodebuildReportStatusTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"INCOMPLETE"] == NSOrderedSame) {
            return @(AWSCodebuildReportStatusTypeIncomplete);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSCodebuildReportStatusTypeDeleting);
        }
        return @(AWSCodebuildReportStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildReportStatusTypeGenerating:
                return @"GENERATING";
            case AWSCodebuildReportStatusTypeSucceeded:
                return @"SUCCEEDED";
            case AWSCodebuildReportStatusTypeFailed:
                return @"FAILED";
            case AWSCodebuildReportStatusTypeIncomplete:
                return @"INCOMPLETE";
            case AWSCodebuildReportStatusTypeDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)testSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildTestReportSummary class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TEST"] == NSOrderedSame) {
            return @(AWSCodebuildReportTypeTest);
        }
        return @(AWSCodebuildReportTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildReportTypeTest:
                return @"TEST";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildReportExportConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportConfigType" : @"exportConfigType",
             @"s3Destination" : @"s3Destination",
             };
}

+ (NSValueTransformer *)exportConfigTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSCodebuildReportExportConfigTypeS3);
        }
        if ([value caseInsensitiveCompare:@"NO_EXPORT"] == NSOrderedSame) {
            return @(AWSCodebuildReportExportConfigTypeNoExport);
        }
        return @(AWSCodebuildReportExportConfigTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildReportExportConfigTypeS3:
                return @"S3";
            case AWSCodebuildReportExportConfigTypeNoExport:
                return @"NO_EXPORT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3DestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildS3ReportExportConfig class]];
}

@end

@implementation AWSCodebuildReportFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GENERATING"] == NSOrderedSame) {
            return @(AWSCodebuildReportStatusTypeGenerating);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSCodebuildReportStatusTypeSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSCodebuildReportStatusTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"INCOMPLETE"] == NSOrderedSame) {
            return @(AWSCodebuildReportStatusTypeIncomplete);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSCodebuildReportStatusTypeDeleting);
        }
        return @(AWSCodebuildReportStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildReportStatusTypeGenerating:
                return @"GENERATING";
            case AWSCodebuildReportStatusTypeSucceeded:
                return @"SUCCEEDED";
            case AWSCodebuildReportStatusTypeFailed:
                return @"FAILED";
            case AWSCodebuildReportStatusTypeIncomplete:
                return @"INCOMPLETE";
            case AWSCodebuildReportStatusTypeDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildReportGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"created" : @"created",
             @"exportConfig" : @"exportConfig",
             @"lastModified" : @"lastModified",
             @"name" : @"name",
             @"tags" : @"tags",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)createdJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)exportConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildReportExportConfig class]];
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildTag class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TEST"] == NSOrderedSame) {
            return @(AWSCodebuildReportTypeTest);
        }
        return @(AWSCodebuildReportTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildReportTypeTest:
                return @"TEST";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildS3LogsConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionDisabled" : @"encryptionDisabled",
             @"location" : @"location",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSCodebuildLogsConfigStatusTypeEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSCodebuildLogsConfigStatusTypeDisabled);
        }
        return @(AWSCodebuildLogsConfigStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildLogsConfigStatusTypeEnabled:
                return @"ENABLED";
            case AWSCodebuildLogsConfigStatusTypeDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildS3ReportExportConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"bucket",
             @"encryptionDisabled" : @"encryptionDisabled",
             @"encryptionKey" : @"encryptionKey",
             @"packaging" : @"packaging",
             @"path" : @"path",
             };
}

+ (NSValueTransformer *)packagingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ZIP"] == NSOrderedSame) {
            return @(AWSCodebuildReportPackagingTypeZip);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSCodebuildReportPackagingTypeNone);
        }
        return @(AWSCodebuildReportPackagingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildReportPackagingTypeZip:
                return @"ZIP";
            case AWSCodebuildReportPackagingTypeNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildSourceAuth

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resource" : @"resource",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OAUTH"] == NSOrderedSame) {
            return @(AWSCodebuildSourceAuthTypeOauth);
        }
        return @(AWSCodebuildSourceAuthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildSourceAuthTypeOauth:
                return @"OAUTH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildSourceCredentialsInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"authType" : @"authType",
             @"serverType" : @"serverType",
             };
}

+ (NSValueTransformer *)authTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OAUTH"] == NSOrderedSame) {
            return @(AWSCodebuildAuthTypeOauth);
        }
        if ([value caseInsensitiveCompare:@"BASIC_AUTH"] == NSOrderedSame) {
            return @(AWSCodebuildAuthTypeBasicAuth);
        }
        if ([value caseInsensitiveCompare:@"PERSONAL_ACCESS_TOKEN"] == NSOrderedSame) {
            return @(AWSCodebuildAuthTypePersonalAccessToken);
        }
        return @(AWSCodebuildAuthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildAuthTypeOauth:
                return @"OAUTH";
            case AWSCodebuildAuthTypeBasicAuth:
                return @"BASIC_AUTH";
            case AWSCodebuildAuthTypePersonalAccessToken:
                return @"PERSONAL_ACCESS_TOKEN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serverTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GITHUB"] == NSOrderedSame) {
            return @(AWSCodebuildServerTypeGithub);
        }
        if ([value caseInsensitiveCompare:@"BITBUCKET"] == NSOrderedSame) {
            return @(AWSCodebuildServerTypeBitbucket);
        }
        if ([value caseInsensitiveCompare:@"GITHUB_ENTERPRISE"] == NSOrderedSame) {
            return @(AWSCodebuildServerTypeGithubEnterprise);
        }
        return @(AWSCodebuildServerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildServerTypeGithub:
                return @"GITHUB";
            case AWSCodebuildServerTypeBitbucket:
                return @"BITBUCKET";
            case AWSCodebuildServerTypeGithubEnterprise:
                return @"GITHUB_ENTERPRISE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildStartBuildInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"artifactsOverride" : @"artifactsOverride",
             @"buildspecOverride" : @"buildspecOverride",
             @"cacheOverride" : @"cacheOverride",
             @"certificateOverride" : @"certificateOverride",
             @"computeTypeOverride" : @"computeTypeOverride",
             @"encryptionKeyOverride" : @"encryptionKeyOverride",
             @"environmentTypeOverride" : @"environmentTypeOverride",
             @"environmentVariablesOverride" : @"environmentVariablesOverride",
             @"gitCloneDepthOverride" : @"gitCloneDepthOverride",
             @"gitSubmodulesConfigOverride" : @"gitSubmodulesConfigOverride",
             @"idempotencyToken" : @"idempotencyToken",
             @"imageOverride" : @"imageOverride",
             @"imagePullCredentialsTypeOverride" : @"imagePullCredentialsTypeOverride",
             @"insecureSslOverride" : @"insecureSslOverride",
             @"logsConfigOverride" : @"logsConfigOverride",
             @"privilegedModeOverride" : @"privilegedModeOverride",
             @"projectName" : @"projectName",
             @"queuedTimeoutInMinutesOverride" : @"queuedTimeoutInMinutesOverride",
             @"registryCredentialOverride" : @"registryCredentialOverride",
             @"reportBuildStatusOverride" : @"reportBuildStatusOverride",
             @"secondaryArtifactsOverride" : @"secondaryArtifactsOverride",
             @"secondarySourcesOverride" : @"secondarySourcesOverride",
             @"secondarySourcesVersionOverride" : @"secondarySourcesVersionOverride",
             @"serviceRoleOverride" : @"serviceRoleOverride",
             @"sourceAuthOverride" : @"sourceAuthOverride",
             @"sourceLocationOverride" : @"sourceLocationOverride",
             @"sourceTypeOverride" : @"sourceTypeOverride",
             @"sourceVersion" : @"sourceVersion",
             @"timeoutInMinutesOverride" : @"timeoutInMinutesOverride",
             };
}

+ (NSValueTransformer *)artifactsOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildProjectArtifacts class]];
}

+ (NSValueTransformer *)cacheOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildProjectCache class]];
}

+ (NSValueTransformer *)computeTypeOverrideJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BUILD_GENERAL1_SMALL"] == NSOrderedSame) {
            return @(AWSCodebuildComputeTypeBuildGeneral1Small);
        }
        if ([value caseInsensitiveCompare:@"BUILD_GENERAL1_MEDIUM"] == NSOrderedSame) {
            return @(AWSCodebuildComputeTypeBuildGeneral1Medium);
        }
        if ([value caseInsensitiveCompare:@"BUILD_GENERAL1_LARGE"] == NSOrderedSame) {
            return @(AWSCodebuildComputeTypeBuildGeneral1Large);
        }
        if ([value caseInsensitiveCompare:@"BUILD_GENERAL1_2XLARGE"] == NSOrderedSame) {
            return @(AWSCodebuildComputeTypeBuildGeneral12xlarge);
        }
        return @(AWSCodebuildComputeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildComputeTypeBuildGeneral1Small:
                return @"BUILD_GENERAL1_SMALL";
            case AWSCodebuildComputeTypeBuildGeneral1Medium:
                return @"BUILD_GENERAL1_MEDIUM";
            case AWSCodebuildComputeTypeBuildGeneral1Large:
                return @"BUILD_GENERAL1_LARGE";
            case AWSCodebuildComputeTypeBuildGeneral12xlarge:
                return @"BUILD_GENERAL1_2XLARGE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)environmentTypeOverrideJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS_CONTAINER"] == NSOrderedSame) {
            return @(AWSCodebuildEnvironmentTypeWindowsContainer);
        }
        if ([value caseInsensitiveCompare:@"LINUX_CONTAINER"] == NSOrderedSame) {
            return @(AWSCodebuildEnvironmentTypeLinuxContainer);
        }
        if ([value caseInsensitiveCompare:@"LINUX_GPU_CONTAINER"] == NSOrderedSame) {
            return @(AWSCodebuildEnvironmentTypeLinuxGpuContainer);
        }
        if ([value caseInsensitiveCompare:@"ARM_CONTAINER"] == NSOrderedSame) {
            return @(AWSCodebuildEnvironmentTypeArmContainer);
        }
        return @(AWSCodebuildEnvironmentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildEnvironmentTypeWindowsContainer:
                return @"WINDOWS_CONTAINER";
            case AWSCodebuildEnvironmentTypeLinuxContainer:
                return @"LINUX_CONTAINER";
            case AWSCodebuildEnvironmentTypeLinuxGpuContainer:
                return @"LINUX_GPU_CONTAINER";
            case AWSCodebuildEnvironmentTypeArmContainer:
                return @"ARM_CONTAINER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)environmentVariablesOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildEnvironmentVariable class]];
}

+ (NSValueTransformer *)gitSubmodulesConfigOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildGitSubmodulesConfig class]];
}

+ (NSValueTransformer *)imagePullCredentialsTypeOverrideJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODEBUILD"] == NSOrderedSame) {
            return @(AWSCodebuildImagePullCredentialsTypeCodebuild);
        }
        if ([value caseInsensitiveCompare:@"SERVICE_ROLE"] == NSOrderedSame) {
            return @(AWSCodebuildImagePullCredentialsTypeServiceRole);
        }
        return @(AWSCodebuildImagePullCredentialsTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildImagePullCredentialsTypeCodebuild:
                return @"CODEBUILD";
            case AWSCodebuildImagePullCredentialsTypeServiceRole:
                return @"SERVICE_ROLE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)logsConfigOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildLogsConfig class]];
}

+ (NSValueTransformer *)registryCredentialOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildRegistryCredential class]];
}

+ (NSValueTransformer *)secondaryArtifactsOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildProjectArtifacts class]];
}

+ (NSValueTransformer *)secondarySourcesOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildProjectSource class]];
}

+ (NSValueTransformer *)secondarySourcesVersionOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildProjectSourceVersion class]];
}

+ (NSValueTransformer *)sourceAuthOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildSourceAuth class]];
}

+ (NSValueTransformer *)sourceTypeOverrideJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODECOMMIT"] == NSOrderedSame) {
            return @(AWSCodebuildSourceTypeCodecommit);
        }
        if ([value caseInsensitiveCompare:@"CODEPIPELINE"] == NSOrderedSame) {
            return @(AWSCodebuildSourceTypeCodepipeline);
        }
        if ([value caseInsensitiveCompare:@"GITHUB"] == NSOrderedSame) {
            return @(AWSCodebuildSourceTypeGithub);
        }
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSCodebuildSourceTypeS3);
        }
        if ([value caseInsensitiveCompare:@"BITBUCKET"] == NSOrderedSame) {
            return @(AWSCodebuildSourceTypeBitbucket);
        }
        if ([value caseInsensitiveCompare:@"GITHUB_ENTERPRISE"] == NSOrderedSame) {
            return @(AWSCodebuildSourceTypeGithubEnterprise);
        }
        if ([value caseInsensitiveCompare:@"NO_SOURCE"] == NSOrderedSame) {
            return @(AWSCodebuildSourceTypeNoSource);
        }
        return @(AWSCodebuildSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildSourceTypeCodecommit:
                return @"CODECOMMIT";
            case AWSCodebuildSourceTypeCodepipeline:
                return @"CODEPIPELINE";
            case AWSCodebuildSourceTypeGithub:
                return @"GITHUB";
            case AWSCodebuildSourceTypeS3:
                return @"S3";
            case AWSCodebuildSourceTypeBitbucket:
                return @"BITBUCKET";
            case AWSCodebuildSourceTypeGithubEnterprise:
                return @"GITHUB_ENTERPRISE";
            case AWSCodebuildSourceTypeNoSource:
                return @"NO_SOURCE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodebuildStartBuildOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"build" : @"build",
             };
}

+ (NSValueTransformer *)buildJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildBuild class]];
}

@end

@implementation AWSCodebuildStopBuildInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"id",
             };
}

@end

@implementation AWSCodebuildStopBuildOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"build" : @"build",
             };
}

+ (NSValueTransformer *)buildJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildBuild class]];
}

@end

@implementation AWSCodebuildTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

@end

@implementation AWSCodebuildTestCase

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInNanoSeconds" : @"durationInNanoSeconds",
             @"expired" : @"expired",
             @"message" : @"message",
             @"name" : @"name",
             @"prefix" : @"prefix",
             @"reportArn" : @"reportArn",
             @"status" : @"status",
             @"testRawDataPath" : @"testRawDataPath",
             };
}

+ (NSValueTransformer *)expiredJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSCodebuildTestCaseFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"status",
             };
}

@end

@implementation AWSCodebuildTestReportSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInNanoSeconds" : @"durationInNanoSeconds",
             @"statusCounts" : @"statusCounts",
             @"total" : @"total",
             };
}

@end

@implementation AWSCodebuildUpdateProjectInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"artifacts" : @"artifacts",
             @"badgeEnabled" : @"badgeEnabled",
             @"cache" : @"cache",
             @"detail" : @"description",
             @"encryptionKey" : @"encryptionKey",
             @"environment" : @"environment",
             @"fileSystemLocations" : @"fileSystemLocations",
             @"logsConfig" : @"logsConfig",
             @"name" : @"name",
             @"queuedTimeoutInMinutes" : @"queuedTimeoutInMinutes",
             @"secondaryArtifacts" : @"secondaryArtifacts",
             @"secondarySourceVersions" : @"secondarySourceVersions",
             @"secondarySources" : @"secondarySources",
             @"serviceRole" : @"serviceRole",
             @"source" : @"source",
             @"sourceVersion" : @"sourceVersion",
             @"tags" : @"tags",
             @"timeoutInMinutes" : @"timeoutInMinutes",
             @"vpcConfig" : @"vpcConfig",
             };
}

+ (NSValueTransformer *)artifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildProjectArtifacts class]];
}

+ (NSValueTransformer *)cacheJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildProjectCache class]];
}

+ (NSValueTransformer *)environmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildProjectEnvironment class]];
}

+ (NSValueTransformer *)fileSystemLocationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildProjectFileSystemLocation class]];
}

+ (NSValueTransformer *)logsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildLogsConfig class]];
}

+ (NSValueTransformer *)secondaryArtifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildProjectArtifacts class]];
}

+ (NSValueTransformer *)secondarySourceVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildProjectSourceVersion class]];
}

+ (NSValueTransformer *)secondarySourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildProjectSource class]];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildProjectSource class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildTag class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildVpcConfig class]];
}

@end

@implementation AWSCodebuildUpdateProjectOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"project" : @"project",
             };
}

+ (NSValueTransformer *)projectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildProject class]];
}

@end

@implementation AWSCodebuildUpdateReportGroupInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"exportConfig" : @"exportConfig",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)exportConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildReportExportConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodebuildTag class]];
}

@end

@implementation AWSCodebuildUpdateReportGroupOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reportGroup" : @"reportGroup",
             };
}

+ (NSValueTransformer *)reportGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildReportGroup class]];
}

@end

@implementation AWSCodebuildUpdateWebhookInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branchFilter" : @"branchFilter",
             @"filterGroups" : @"filterGroups",
             @"projectName" : @"projectName",
             @"rotateSecret" : @"rotateSecret",
             };
}

@end

@implementation AWSCodebuildUpdateWebhookOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"webhook" : @"webhook",
             };
}

+ (NSValueTransformer *)webhookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodebuildWebhook class]];
}

@end

@implementation AWSCodebuildVpcConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"securityGroupIds",
             @"subnets" : @"subnets",
             @"vpcId" : @"vpcId",
             };
}

@end

@implementation AWSCodebuildWebhook

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branchFilter" : @"branchFilter",
             @"filterGroups" : @"filterGroups",
             @"lastModifiedSecret" : @"lastModifiedSecret",
             @"payloadUrl" : @"payloadUrl",
             @"secret" : @"secret",
             @"url" : @"url",
             };
}

+ (NSValueTransformer *)lastModifiedSecretJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSCodebuildWebhookFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"excludeMatchedPattern" : @"excludeMatchedPattern",
             @"pattern" : @"pattern",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EVENT"] == NSOrderedSame) {
            return @(AWSCodebuildWebhookFilterTypeEvent);
        }
        if ([value caseInsensitiveCompare:@"BASE_REF"] == NSOrderedSame) {
            return @(AWSCodebuildWebhookFilterTypeBaseRef);
        }
        if ([value caseInsensitiveCompare:@"HEAD_REF"] == NSOrderedSame) {
            return @(AWSCodebuildWebhookFilterTypeHeadRef);
        }
        if ([value caseInsensitiveCompare:@"ACTOR_ACCOUNT_ID"] == NSOrderedSame) {
            return @(AWSCodebuildWebhookFilterTypeActorAccountId);
        }
        if ([value caseInsensitiveCompare:@"FILE_PATH"] == NSOrderedSame) {
            return @(AWSCodebuildWebhookFilterTypeFilePath);
        }
        if ([value caseInsensitiveCompare:@"COMMIT_MESSAGE"] == NSOrderedSame) {
            return @(AWSCodebuildWebhookFilterTypeCommitMessage);
        }
        return @(AWSCodebuildWebhookFilterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodebuildWebhookFilterTypeEvent:
                return @"EVENT";
            case AWSCodebuildWebhookFilterTypeBaseRef:
                return @"BASE_REF";
            case AWSCodebuildWebhookFilterTypeHeadRef:
                return @"HEAD_REF";
            case AWSCodebuildWebhookFilterTypeActorAccountId:
                return @"ACTOR_ACCOUNT_ID";
            case AWSCodebuildWebhookFilterTypeFilePath:
                return @"FILE_PATH";
            case AWSCodebuildWebhookFilterTypeCommitMessage:
                return @"COMMIT_MESSAGE";
            default:
                return nil;
        }
    }];
}

@end
