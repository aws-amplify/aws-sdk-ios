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

#import "AWSCodeBuildModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSCodeBuildErrorDomain = @"com.amazonaws.AWSCodeBuildErrorDomain";

@implementation AWSCodeBuildBatchDeleteBuildsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ids" : @"ids",
             };
}

@end

@implementation AWSCodeBuildBatchDeleteBuildsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"buildsDeleted" : @"buildsDeleted",
             @"buildsNotDeleted" : @"buildsNotDeleted",
             };
}

+ (NSValueTransformer *)buildsNotDeletedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildBuildNotDeleted class]];
}

@end

@implementation AWSCodeBuildBatchGetBuildsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ids" : @"ids",
             };
}

@end

@implementation AWSCodeBuildBatchGetBuildsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"builds" : @"builds",
             @"buildsNotFound" : @"buildsNotFound",
             };
}

+ (NSValueTransformer *)buildsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildBuild class]];
}

@end

@implementation AWSCodeBuildBatchGetProjectsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"names" : @"names",
             };
}

@end

@implementation AWSCodeBuildBatchGetProjectsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projects" : @"projects",
             @"projectsNotFound" : @"projectsNotFound",
             };
}

+ (NSValueTransformer *)projectsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildProject class]];
}

@end

@implementation AWSCodeBuildBatchGetReportGroupsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reportGroupArns" : @"reportGroupArns",
             };
}

@end

@implementation AWSCodeBuildBatchGetReportGroupsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reportGroups" : @"reportGroups",
             @"reportGroupsNotFound" : @"reportGroupsNotFound",
             };
}

+ (NSValueTransformer *)reportGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildReportGroup class]];
}

@end

@implementation AWSCodeBuildBatchGetReportsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reportArns" : @"reportArns",
             };
}

@end

@implementation AWSCodeBuildBatchGetReportsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reports" : @"reports",
             @"reportsNotFound" : @"reportsNotFound",
             };
}

+ (NSValueTransformer *)reportsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildReport class]];
}

@end

@implementation AWSCodeBuildBuild

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildBuildArtifacts class]];
}

+ (NSValueTransformer *)buildStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSCodeBuildStatusTypeSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSCodeBuildStatusTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"FAULT"] == NSOrderedSame) {
            return @(AWSCodeBuildStatusTypeFault);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSCodeBuildStatusTypeTimedOut);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCodeBuildStatusTypeInProgress);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSCodeBuildStatusTypeStopped);
        }
        return @(AWSCodeBuildStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildStatusTypeSucceeded:
                return @"SUCCEEDED";
            case AWSCodeBuildStatusTypeFailed:
                return @"FAILED";
            case AWSCodeBuildStatusTypeFault:
                return @"FAULT";
            case AWSCodeBuildStatusTypeTimedOut:
                return @"TIMED_OUT";
            case AWSCodeBuildStatusTypeInProgress:
                return @"IN_PROGRESS";
            case AWSCodeBuildStatusTypeStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)cacheJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildProjectCache class]];
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)environmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildProjectEnvironment class]];
}

+ (NSValueTransformer *)exportedEnvironmentVariablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildExportedEnvironmentVariable class]];
}

+ (NSValueTransformer *)fileSystemLocationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildProjectFileSystemLocation class]];
}

+ (NSValueTransformer *)logsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildLogsLocation class]];
}

+ (NSValueTransformer *)networkInterfaceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildNetworkInterface class]];
}

+ (NSValueTransformer *)phasesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildBuildPhase class]];
}

+ (NSValueTransformer *)secondaryArtifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildBuildArtifacts class]];
}

+ (NSValueTransformer *)secondarySourceVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildProjectSourceVersion class]];
}

+ (NSValueTransformer *)secondarySourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildProjectSource class]];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildProjectSource class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildVpcConfig class]];
}

@end

@implementation AWSCodeBuildBuildArtifacts

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

@implementation AWSCodeBuildBuildNotDeleted

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"id",
             @"statusCode" : @"statusCode",
             };
}

@end

@implementation AWSCodeBuildBuildPhase

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildPhaseContext class]];
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
            return @(AWSCodeBuildStatusTypeSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSCodeBuildStatusTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"FAULT"] == NSOrderedSame) {
            return @(AWSCodeBuildStatusTypeFault);
        }
        if ([value caseInsensitiveCompare:@"TIMED_OUT"] == NSOrderedSame) {
            return @(AWSCodeBuildStatusTypeTimedOut);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSCodeBuildStatusTypeInProgress);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSCodeBuildStatusTypeStopped);
        }
        return @(AWSCodeBuildStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildStatusTypeSucceeded:
                return @"SUCCEEDED";
            case AWSCodeBuildStatusTypeFailed:
                return @"FAILED";
            case AWSCodeBuildStatusTypeFault:
                return @"FAULT";
            case AWSCodeBuildStatusTypeTimedOut:
                return @"TIMED_OUT";
            case AWSCodeBuildStatusTypeInProgress:
                return @"IN_PROGRESS";
            case AWSCodeBuildStatusTypeStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)phaseTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSCodeBuildBuildPhaseTypeSubmitted);
        }
        if ([value caseInsensitiveCompare:@"QUEUED"] == NSOrderedSame) {
            return @(AWSCodeBuildBuildPhaseTypeQueued);
        }
        if ([value caseInsensitiveCompare:@"PROVISIONING"] == NSOrderedSame) {
            return @(AWSCodeBuildBuildPhaseTypeProvisioning);
        }
        if ([value caseInsensitiveCompare:@"DOWNLOAD_SOURCE"] == NSOrderedSame) {
            return @(AWSCodeBuildBuildPhaseTypeDownloadSource);
        }
        if ([value caseInsensitiveCompare:@"INSTALL"] == NSOrderedSame) {
            return @(AWSCodeBuildBuildPhaseTypeInstall);
        }
        if ([value caseInsensitiveCompare:@"PRE_BUILD"] == NSOrderedSame) {
            return @(AWSCodeBuildBuildPhaseTypePreBuild);
        }
        if ([value caseInsensitiveCompare:@"BUILD"] == NSOrderedSame) {
            return @(AWSCodeBuildBuildPhaseTypeBuild);
        }
        if ([value caseInsensitiveCompare:@"POST_BUILD"] == NSOrderedSame) {
            return @(AWSCodeBuildBuildPhaseTypePostBuild);
        }
        if ([value caseInsensitiveCompare:@"UPLOAD_ARTIFACTS"] == NSOrderedSame) {
            return @(AWSCodeBuildBuildPhaseTypeUploadArtifacts);
        }
        if ([value caseInsensitiveCompare:@"FINALIZING"] == NSOrderedSame) {
            return @(AWSCodeBuildBuildPhaseTypeFinalizing);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSCodeBuildBuildPhaseTypeCompleted);
        }
        return @(AWSCodeBuildBuildPhaseTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildBuildPhaseTypeSubmitted:
                return @"SUBMITTED";
            case AWSCodeBuildBuildPhaseTypeQueued:
                return @"QUEUED";
            case AWSCodeBuildBuildPhaseTypeProvisioning:
                return @"PROVISIONING";
            case AWSCodeBuildBuildPhaseTypeDownloadSource:
                return @"DOWNLOAD_SOURCE";
            case AWSCodeBuildBuildPhaseTypeInstall:
                return @"INSTALL";
            case AWSCodeBuildBuildPhaseTypePreBuild:
                return @"PRE_BUILD";
            case AWSCodeBuildBuildPhaseTypeBuild:
                return @"BUILD";
            case AWSCodeBuildBuildPhaseTypePostBuild:
                return @"POST_BUILD";
            case AWSCodeBuildBuildPhaseTypeUploadArtifacts:
                return @"UPLOAD_ARTIFACTS";
            case AWSCodeBuildBuildPhaseTypeFinalizing:
                return @"FINALIZING";
            case AWSCodeBuildBuildPhaseTypeCompleted:
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

@implementation AWSCodeBuildCloudWatchLogsConfig

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
            return @(AWSCodeBuildLogsConfigStatusTypeEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSCodeBuildLogsConfigStatusTypeDisabled);
        }
        return @(AWSCodeBuildLogsConfigStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildLogsConfigStatusTypeEnabled:
                return @"ENABLED";
            case AWSCodeBuildLogsConfigStatusTypeDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildCreateProjectInput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildProjectArtifacts class]];
}

+ (NSValueTransformer *)cacheJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildProjectCache class]];
}

+ (NSValueTransformer *)environmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildProjectEnvironment class]];
}

+ (NSValueTransformer *)fileSystemLocationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildProjectFileSystemLocation class]];
}

+ (NSValueTransformer *)logsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildLogsConfig class]];
}

+ (NSValueTransformer *)secondaryArtifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildProjectArtifacts class]];
}

+ (NSValueTransformer *)secondarySourceVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildProjectSourceVersion class]];
}

+ (NSValueTransformer *)secondarySourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildProjectSource class]];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildProjectSource class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildTag class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildVpcConfig class]];
}

@end

@implementation AWSCodeBuildCreateProjectOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"project" : @"project",
             };
}

+ (NSValueTransformer *)projectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildProject class]];
}

@end

@implementation AWSCodeBuildCreateReportGroupInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportConfig" : @"exportConfig",
             @"name" : @"name",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)exportConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildReportExportConfig class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TEST"] == NSOrderedSame) {
            return @(AWSCodeBuildReportTypeTest);
        }
        return @(AWSCodeBuildReportTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildReportTypeTest:
                return @"TEST";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildCreateReportGroupOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reportGroup" : @"reportGroup",
             };
}

+ (NSValueTransformer *)reportGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildReportGroup class]];
}

@end

@implementation AWSCodeBuildCreateWebhookInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branchFilter" : @"branchFilter",
             @"filterGroups" : @"filterGroups",
             @"projectName" : @"projectName",
             };
}

@end

@implementation AWSCodeBuildCreateWebhookOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"webhook" : @"webhook",
             };
}

+ (NSValueTransformer *)webhookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildWebhook class]];
}

@end

@implementation AWSCodeBuildDeleteProjectInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             };
}

@end

@implementation AWSCodeBuildDeleteProjectOutput

@end

@implementation AWSCodeBuildDeleteReportGroupInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             };
}

@end

@implementation AWSCodeBuildDeleteReportGroupOutput

@end

@implementation AWSCodeBuildDeleteReportInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             };
}

@end

@implementation AWSCodeBuildDeleteReportOutput

@end

@implementation AWSCodeBuildDeleteResourcePolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSCodeBuildDeleteResourcePolicyOutput

@end

@implementation AWSCodeBuildDeleteSourceCredentialsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             };
}

@end

@implementation AWSCodeBuildDeleteSourceCredentialsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             };
}

@end

@implementation AWSCodeBuildDeleteWebhookInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectName" : @"projectName",
             };
}

@end

@implementation AWSCodeBuildDeleteWebhookOutput

@end

@implementation AWSCodeBuildDescribeTestCasesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"filter",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"reportArn" : @"reportArn",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildTestCaseFilter class]];
}

@end

@implementation AWSCodeBuildDescribeTestCasesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"testCases" : @"testCases",
             };
}

+ (NSValueTransformer *)testCasesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildTestCase class]];
}

@end

@implementation AWSCodeBuildEnvironmentImage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"name" : @"name",
             @"versions" : @"versions",
             };
}

@end

@implementation AWSCodeBuildEnvironmentLanguage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"images" : @"images",
             @"language" : @"language",
             };
}

+ (NSValueTransformer *)imagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildEnvironmentImage class]];
}

+ (NSValueTransformer *)languageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JAVA"] == NSOrderedSame) {
            return @(AWSCodeBuildLanguageTypeJava);
        }
        if ([value caseInsensitiveCompare:@"PYTHON"] == NSOrderedSame) {
            return @(AWSCodeBuildLanguageTypePython);
        }
        if ([value caseInsensitiveCompare:@"NODE_JS"] == NSOrderedSame) {
            return @(AWSCodeBuildLanguageTypeNodeJs);
        }
        if ([value caseInsensitiveCompare:@"RUBY"] == NSOrderedSame) {
            return @(AWSCodeBuildLanguageTypeRuby);
        }
        if ([value caseInsensitiveCompare:@"GOLANG"] == NSOrderedSame) {
            return @(AWSCodeBuildLanguageTypeGolang);
        }
        if ([value caseInsensitiveCompare:@"DOCKER"] == NSOrderedSame) {
            return @(AWSCodeBuildLanguageTypeDocker);
        }
        if ([value caseInsensitiveCompare:@"ANDROID"] == NSOrderedSame) {
            return @(AWSCodeBuildLanguageTypeAndroid);
        }
        if ([value caseInsensitiveCompare:@"DOTNET"] == NSOrderedSame) {
            return @(AWSCodeBuildLanguageTypeDotnet);
        }
        if ([value caseInsensitiveCompare:@"BASE"] == NSOrderedSame) {
            return @(AWSCodeBuildLanguageTypeBase);
        }
        if ([value caseInsensitiveCompare:@"PHP"] == NSOrderedSame) {
            return @(AWSCodeBuildLanguageTypePhp);
        }
        return @(AWSCodeBuildLanguageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildLanguageTypeJava:
                return @"JAVA";
            case AWSCodeBuildLanguageTypePython:
                return @"PYTHON";
            case AWSCodeBuildLanguageTypeNodeJs:
                return @"NODE_JS";
            case AWSCodeBuildLanguageTypeRuby:
                return @"RUBY";
            case AWSCodeBuildLanguageTypeGolang:
                return @"GOLANG";
            case AWSCodeBuildLanguageTypeDocker:
                return @"DOCKER";
            case AWSCodeBuildLanguageTypeAndroid:
                return @"ANDROID";
            case AWSCodeBuildLanguageTypeDotnet:
                return @"DOTNET";
            case AWSCodeBuildLanguageTypeBase:
                return @"BASE";
            case AWSCodeBuildLanguageTypePhp:
                return @"PHP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildEnvironmentPlatform

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languages" : @"languages",
             @"platform" : @"platform",
             };
}

+ (NSValueTransformer *)languagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildEnvironmentLanguage class]];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEBIAN"] == NSOrderedSame) {
            return @(AWSCodeBuildPlatformTypeDebian);
        }
        if ([value caseInsensitiveCompare:@"AMAZON_LINUX"] == NSOrderedSame) {
            return @(AWSCodeBuildPlatformTypeAmazonLinux);
        }
        if ([value caseInsensitiveCompare:@"UBUNTU"] == NSOrderedSame) {
            return @(AWSCodeBuildPlatformTypeUbuntu);
        }
        if ([value caseInsensitiveCompare:@"WINDOWS_SERVER"] == NSOrderedSame) {
            return @(AWSCodeBuildPlatformTypeWindowsServer);
        }
        return @(AWSCodeBuildPlatformTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildPlatformTypeDebian:
                return @"DEBIAN";
            case AWSCodeBuildPlatformTypeAmazonLinux:
                return @"AMAZON_LINUX";
            case AWSCodeBuildPlatformTypeUbuntu:
                return @"UBUNTU";
            case AWSCodeBuildPlatformTypeWindowsServer:
                return @"WINDOWS_SERVER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildEnvironmentVariable

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
            return @(AWSCodeBuildEnvironmentVariableTypePlaintext);
        }
        if ([value caseInsensitiveCompare:@"PARAMETER_STORE"] == NSOrderedSame) {
            return @(AWSCodeBuildEnvironmentVariableTypeParameterStore);
        }
        if ([value caseInsensitiveCompare:@"SECRETS_MANAGER"] == NSOrderedSame) {
            return @(AWSCodeBuildEnvironmentVariableTypeSecretsManager);
        }
        return @(AWSCodeBuildEnvironmentVariableTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildEnvironmentVariableTypePlaintext:
                return @"PLAINTEXT";
            case AWSCodeBuildEnvironmentVariableTypeParameterStore:
                return @"PARAMETER_STORE";
            case AWSCodeBuildEnvironmentVariableTypeSecretsManager:
                return @"SECRETS_MANAGER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildExportedEnvironmentVariable

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"value" : @"value",
             };
}

@end

@implementation AWSCodeBuildGetResourcePolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSCodeBuildGetResourcePolicyOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"policy",
             };
}

@end

@implementation AWSCodeBuildGitSubmodulesConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fetchSubmodules" : @"fetchSubmodules",
             };
}

@end

@implementation AWSCodeBuildImportSourceCredentialsInput

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
            return @(AWSCodeBuildAuthTypeOauth);
        }
        if ([value caseInsensitiveCompare:@"BASIC_AUTH"] == NSOrderedSame) {
            return @(AWSCodeBuildAuthTypeBasicAuth);
        }
        if ([value caseInsensitiveCompare:@"PERSONAL_ACCESS_TOKEN"] == NSOrderedSame) {
            return @(AWSCodeBuildAuthTypePersonalAccessToken);
        }
        return @(AWSCodeBuildAuthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildAuthTypeOauth:
                return @"OAUTH";
            case AWSCodeBuildAuthTypeBasicAuth:
                return @"BASIC_AUTH";
            case AWSCodeBuildAuthTypePersonalAccessToken:
                return @"PERSONAL_ACCESS_TOKEN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serverTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GITHUB"] == NSOrderedSame) {
            return @(AWSCodeBuildServerTypeGithub);
        }
        if ([value caseInsensitiveCompare:@"BITBUCKET"] == NSOrderedSame) {
            return @(AWSCodeBuildServerTypeBitbucket);
        }
        if ([value caseInsensitiveCompare:@"GITHUB_ENTERPRISE"] == NSOrderedSame) {
            return @(AWSCodeBuildServerTypeGithubEnterprise);
        }
        return @(AWSCodeBuildServerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildServerTypeGithub:
                return @"GITHUB";
            case AWSCodeBuildServerTypeBitbucket:
                return @"BITBUCKET";
            case AWSCodeBuildServerTypeGithubEnterprise:
                return @"GITHUB_ENTERPRISE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildImportSourceCredentialsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             };
}

@end

@implementation AWSCodeBuildInvalidateProjectCacheInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"projectName" : @"projectName",
             };
}

@end

@implementation AWSCodeBuildInvalidateProjectCacheOutput

@end

@implementation AWSCodeBuildListBuildsForProjectInput

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
            return @(AWSCodeBuildSortOrderTypeAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSCodeBuildSortOrderTypeDescending);
        }
        return @(AWSCodeBuildSortOrderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildSortOrderTypeAscending:
                return @"ASCENDING";
            case AWSCodeBuildSortOrderTypeDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildListBuildsForProjectOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ids" : @"ids",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSCodeBuildListBuildsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"sortOrder" : @"sortOrder",
             };
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSCodeBuildSortOrderTypeAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSCodeBuildSortOrderTypeDescending);
        }
        return @(AWSCodeBuildSortOrderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildSortOrderTypeAscending:
                return @"ASCENDING";
            case AWSCodeBuildSortOrderTypeDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildListBuildsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ids" : @"ids",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSCodeBuildListCuratedEnvironmentImagesInput

@end

@implementation AWSCodeBuildListCuratedEnvironmentImagesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"platforms" : @"platforms",
             };
}

+ (NSValueTransformer *)platformsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildEnvironmentPlatform class]];
}

@end

@implementation AWSCodeBuildListProjectsInput

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
            return @(AWSCodeBuildProjectSortByTypeName);
        }
        if ([value caseInsensitiveCompare:@"CREATED_TIME"] == NSOrderedSame) {
            return @(AWSCodeBuildProjectSortByTypeCreatedTime);
        }
        if ([value caseInsensitiveCompare:@"LAST_MODIFIED_TIME"] == NSOrderedSame) {
            return @(AWSCodeBuildProjectSortByTypeLastModifiedTime);
        }
        return @(AWSCodeBuildProjectSortByTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildProjectSortByTypeName:
                return @"NAME";
            case AWSCodeBuildProjectSortByTypeCreatedTime:
                return @"CREATED_TIME";
            case AWSCodeBuildProjectSortByTypeLastModifiedTime:
                return @"LAST_MODIFIED_TIME";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSCodeBuildSortOrderTypeAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSCodeBuildSortOrderTypeDescending);
        }
        return @(AWSCodeBuildSortOrderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildSortOrderTypeAscending:
                return @"ASCENDING";
            case AWSCodeBuildSortOrderTypeDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildListProjectsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"projects" : @"projects",
             };
}

@end

@implementation AWSCodeBuildListReportGroupsInput

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
            return @(AWSCodeBuildReportGroupSortByTypeName);
        }
        if ([value caseInsensitiveCompare:@"CREATED_TIME"] == NSOrderedSame) {
            return @(AWSCodeBuildReportGroupSortByTypeCreatedTime);
        }
        if ([value caseInsensitiveCompare:@"LAST_MODIFIED_TIME"] == NSOrderedSame) {
            return @(AWSCodeBuildReportGroupSortByTypeLastModifiedTime);
        }
        return @(AWSCodeBuildReportGroupSortByTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildReportGroupSortByTypeName:
                return @"NAME";
            case AWSCodeBuildReportGroupSortByTypeCreatedTime:
                return @"CREATED_TIME";
            case AWSCodeBuildReportGroupSortByTypeLastModifiedTime:
                return @"LAST_MODIFIED_TIME";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSCodeBuildSortOrderTypeAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSCodeBuildSortOrderTypeDescending);
        }
        return @(AWSCodeBuildSortOrderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildSortOrderTypeAscending:
                return @"ASCENDING";
            case AWSCodeBuildSortOrderTypeDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildListReportGroupsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"reportGroups" : @"reportGroups",
             };
}

@end

@implementation AWSCodeBuildListReportsForReportGroupInput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildReportFilter class]];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSCodeBuildSortOrderTypeAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSCodeBuildSortOrderTypeDescending);
        }
        return @(AWSCodeBuildSortOrderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildSortOrderTypeAscending:
                return @"ASCENDING";
            case AWSCodeBuildSortOrderTypeDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildListReportsForReportGroupOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"reports" : @"reports",
             };
}

@end

@implementation AWSCodeBuildListReportsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"filter",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"sortOrder" : @"sortOrder",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildReportFilter class]];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSCodeBuildSortOrderTypeAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSCodeBuildSortOrderTypeDescending);
        }
        return @(AWSCodeBuildSortOrderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildSortOrderTypeAscending:
                return @"ASCENDING";
            case AWSCodeBuildSortOrderTypeDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildListReportsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"reports" : @"reports",
             };
}

@end

@implementation AWSCodeBuildListSharedProjectsInput

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
            return @(AWSCodeBuildSharedResourceSortByTypeArn);
        }
        if ([value caseInsensitiveCompare:@"MODIFIED_TIME"] == NSOrderedSame) {
            return @(AWSCodeBuildSharedResourceSortByTypeModifiedTime);
        }
        return @(AWSCodeBuildSharedResourceSortByTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildSharedResourceSortByTypeArn:
                return @"ARN";
            case AWSCodeBuildSharedResourceSortByTypeModifiedTime:
                return @"MODIFIED_TIME";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSCodeBuildSortOrderTypeAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSCodeBuildSortOrderTypeDescending);
        }
        return @(AWSCodeBuildSortOrderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildSortOrderTypeAscending:
                return @"ASCENDING";
            case AWSCodeBuildSortOrderTypeDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildListSharedProjectsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"projects" : @"projects",
             };
}

@end

@implementation AWSCodeBuildListSharedReportGroupsInput

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
            return @(AWSCodeBuildSharedResourceSortByTypeArn);
        }
        if ([value caseInsensitiveCompare:@"MODIFIED_TIME"] == NSOrderedSame) {
            return @(AWSCodeBuildSharedResourceSortByTypeModifiedTime);
        }
        return @(AWSCodeBuildSharedResourceSortByTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildSharedResourceSortByTypeArn:
                return @"ARN";
            case AWSCodeBuildSharedResourceSortByTypeModifiedTime:
                return @"MODIFIED_TIME";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSCodeBuildSortOrderTypeAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSCodeBuildSortOrderTypeDescending);
        }
        return @(AWSCodeBuildSortOrderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildSortOrderTypeAscending:
                return @"ASCENDING";
            case AWSCodeBuildSortOrderTypeDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildListSharedReportGroupsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"reportGroups" : @"reportGroups",
             };
}

@end

@implementation AWSCodeBuildListSourceCredentialsInput

@end

@implementation AWSCodeBuildListSourceCredentialsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceCredentialsInfos" : @"sourceCredentialsInfos",
             };
}

+ (NSValueTransformer *)sourceCredentialsInfosJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildSourceCredentialsInfo class]];
}

@end

@implementation AWSCodeBuildLogsConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLogs" : @"cloudWatchLogs",
             @"s3Logs" : @"s3Logs",
             };
}

+ (NSValueTransformer *)cloudWatchLogsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildCloudWatchLogsConfig class]];
}

+ (NSValueTransformer *)s3LogsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildS3LogsConfig class]];
}

@end

@implementation AWSCodeBuildLogsLocation

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildCloudWatchLogsConfig class]];
}

+ (NSValueTransformer *)s3LogsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildS3LogsConfig class]];
}

@end

@implementation AWSCodeBuildNetworkInterface

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"networkInterfaceId" : @"networkInterfaceId",
             @"subnetId" : @"subnetId",
             };
}

@end

@implementation AWSCodeBuildPhaseContext

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"message",
             @"statusCode" : @"statusCode",
             };
}

@end

@implementation AWSCodeBuildProject

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildProjectArtifacts class]];
}

+ (NSValueTransformer *)badgeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildProjectBadge class]];
}

+ (NSValueTransformer *)cacheJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildProjectCache class]];
}

+ (NSValueTransformer *)createdJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)environmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildProjectEnvironment class]];
}

+ (NSValueTransformer *)fileSystemLocationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildProjectFileSystemLocation class]];
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)logsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildLogsConfig class]];
}

+ (NSValueTransformer *)secondaryArtifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildProjectArtifacts class]];
}

+ (NSValueTransformer *)secondarySourceVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildProjectSourceVersion class]];
}

+ (NSValueTransformer *)secondarySourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildProjectSource class]];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildProjectSource class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildTag class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildVpcConfig class]];
}

+ (NSValueTransformer *)webhookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildWebhook class]];
}

@end

@implementation AWSCodeBuildProjectArtifacts

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
            return @(AWSCodeBuildArtifactNamespaceNone);
        }
        if ([value caseInsensitiveCompare:@"BUILD_ID"] == NSOrderedSame) {
            return @(AWSCodeBuildArtifactNamespaceBuildId);
        }
        return @(AWSCodeBuildArtifactNamespaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildArtifactNamespaceNone:
                return @"NONE";
            case AWSCodeBuildArtifactNamespaceBuildId:
                return @"BUILD_ID";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)packagingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSCodeBuildArtifactPackagingNone);
        }
        if ([value caseInsensitiveCompare:@"ZIP"] == NSOrderedSame) {
            return @(AWSCodeBuildArtifactPackagingZip);
        }
        return @(AWSCodeBuildArtifactPackagingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildArtifactPackagingNone:
                return @"NONE";
            case AWSCodeBuildArtifactPackagingZip:
                return @"ZIP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODEPIPELINE"] == NSOrderedSame) {
            return @(AWSCodeBuildArtifactsTypeCodepipeline);
        }
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSCodeBuildArtifactsTypeS3);
        }
        if ([value caseInsensitiveCompare:@"NO_ARTIFACTS"] == NSOrderedSame) {
            return @(AWSCodeBuildArtifactsTypeNoArtifacts);
        }
        return @(AWSCodeBuildArtifactsTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildArtifactsTypeCodepipeline:
                return @"CODEPIPELINE";
            case AWSCodeBuildArtifactsTypeS3:
                return @"S3";
            case AWSCodeBuildArtifactsTypeNoArtifacts:
                return @"NO_ARTIFACTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildProjectBadge

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"badgeEnabled" : @"badgeEnabled",
             @"badgeRequestUrl" : @"badgeRequestUrl",
             };
}

@end

@implementation AWSCodeBuildProjectCache

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
            return @(AWSCodeBuildCacheTypeNoCache);
        }
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSCodeBuildCacheTypeS3);
        }
        if ([value caseInsensitiveCompare:@"LOCAL"] == NSOrderedSame) {
            return @(AWSCodeBuildCacheTypeLocal);
        }
        return @(AWSCodeBuildCacheTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildCacheTypeNoCache:
                return @"NO_CACHE";
            case AWSCodeBuildCacheTypeS3:
                return @"S3";
            case AWSCodeBuildCacheTypeLocal:
                return @"LOCAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildProjectEnvironment

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
            return @(AWSCodeBuildComputeTypeBuildGeneral1Small);
        }
        if ([value caseInsensitiveCompare:@"BUILD_GENERAL1_MEDIUM"] == NSOrderedSame) {
            return @(AWSCodeBuildComputeTypeBuildGeneral1Medium);
        }
        if ([value caseInsensitiveCompare:@"BUILD_GENERAL1_LARGE"] == NSOrderedSame) {
            return @(AWSCodeBuildComputeTypeBuildGeneral1Large);
        }
        if ([value caseInsensitiveCompare:@"BUILD_GENERAL1_2XLARGE"] == NSOrderedSame) {
            return @(AWSCodeBuildComputeTypeBuildGeneral12xlarge);
        }
        return @(AWSCodeBuildComputeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildComputeTypeBuildGeneral1Small:
                return @"BUILD_GENERAL1_SMALL";
            case AWSCodeBuildComputeTypeBuildGeneral1Medium:
                return @"BUILD_GENERAL1_MEDIUM";
            case AWSCodeBuildComputeTypeBuildGeneral1Large:
                return @"BUILD_GENERAL1_LARGE";
            case AWSCodeBuildComputeTypeBuildGeneral12xlarge:
                return @"BUILD_GENERAL1_2XLARGE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)environmentVariablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildEnvironmentVariable class]];
}

+ (NSValueTransformer *)imagePullCredentialsTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODEBUILD"] == NSOrderedSame) {
            return @(AWSCodeBuildImagePullCredentialsTypeCodebuild);
        }
        if ([value caseInsensitiveCompare:@"SERVICE_ROLE"] == NSOrderedSame) {
            return @(AWSCodeBuildImagePullCredentialsTypeServiceRole);
        }
        return @(AWSCodeBuildImagePullCredentialsTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildImagePullCredentialsTypeCodebuild:
                return @"CODEBUILD";
            case AWSCodeBuildImagePullCredentialsTypeServiceRole:
                return @"SERVICE_ROLE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)registryCredentialJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildRegistryCredential class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS_CONTAINER"] == NSOrderedSame) {
            return @(AWSCodeBuildEnvironmentTypeWindowsContainer);
        }
        if ([value caseInsensitiveCompare:@"LINUX_CONTAINER"] == NSOrderedSame) {
            return @(AWSCodeBuildEnvironmentTypeLinuxContainer);
        }
        if ([value caseInsensitiveCompare:@"LINUX_GPU_CONTAINER"] == NSOrderedSame) {
            return @(AWSCodeBuildEnvironmentTypeLinuxGpuContainer);
        }
        if ([value caseInsensitiveCompare:@"ARM_CONTAINER"] == NSOrderedSame) {
            return @(AWSCodeBuildEnvironmentTypeArmContainer);
        }
        return @(AWSCodeBuildEnvironmentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildEnvironmentTypeWindowsContainer:
                return @"WINDOWS_CONTAINER";
            case AWSCodeBuildEnvironmentTypeLinuxContainer:
                return @"LINUX_CONTAINER";
            case AWSCodeBuildEnvironmentTypeLinuxGpuContainer:
                return @"LINUX_GPU_CONTAINER";
            case AWSCodeBuildEnvironmentTypeArmContainer:
                return @"ARM_CONTAINER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildProjectFileSystemLocation

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
            return @(AWSCodeBuildFileSystemTypeEfs);
        }
        return @(AWSCodeBuildFileSystemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildFileSystemTypeEfs:
                return @"EFS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildProjectSource

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildSourceAuth class]];
}

+ (NSValueTransformer *)gitSubmodulesConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildGitSubmodulesConfig class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODECOMMIT"] == NSOrderedSame) {
            return @(AWSCodeBuildSourceTypeCodecommit);
        }
        if ([value caseInsensitiveCompare:@"CODEPIPELINE"] == NSOrderedSame) {
            return @(AWSCodeBuildSourceTypeCodepipeline);
        }
        if ([value caseInsensitiveCompare:@"GITHUB"] == NSOrderedSame) {
            return @(AWSCodeBuildSourceTypeGithub);
        }
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSCodeBuildSourceTypeS3);
        }
        if ([value caseInsensitiveCompare:@"BITBUCKET"] == NSOrderedSame) {
            return @(AWSCodeBuildSourceTypeBitbucket);
        }
        if ([value caseInsensitiveCompare:@"GITHUB_ENTERPRISE"] == NSOrderedSame) {
            return @(AWSCodeBuildSourceTypeGithubEnterprise);
        }
        if ([value caseInsensitiveCompare:@"NO_SOURCE"] == NSOrderedSame) {
            return @(AWSCodeBuildSourceTypeNoSource);
        }
        return @(AWSCodeBuildSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildSourceTypeCodecommit:
                return @"CODECOMMIT";
            case AWSCodeBuildSourceTypeCodepipeline:
                return @"CODEPIPELINE";
            case AWSCodeBuildSourceTypeGithub:
                return @"GITHUB";
            case AWSCodeBuildSourceTypeS3:
                return @"S3";
            case AWSCodeBuildSourceTypeBitbucket:
                return @"BITBUCKET";
            case AWSCodeBuildSourceTypeGithubEnterprise:
                return @"GITHUB_ENTERPRISE";
            case AWSCodeBuildSourceTypeNoSource:
                return @"NO_SOURCE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildProjectSourceVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceIdentifier" : @"sourceIdentifier",
             @"sourceVersion" : @"sourceVersion",
             };
}

@end

@implementation AWSCodeBuildPutResourcePolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"policy",
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSCodeBuildPutResourcePolicyOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSCodeBuildRegistryCredential

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"credential" : @"credential",
             @"credentialProvider" : @"credentialProvider",
             };
}

+ (NSValueTransformer *)credentialProviderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECRETS_MANAGER"] == NSOrderedSame) {
            return @(AWSCodeBuildCredentialProviderTypeSecretsManager);
        }
        return @(AWSCodeBuildCredentialProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildCredentialProviderTypeSecretsManager:
                return @"SECRETS_MANAGER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildReport

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildReportExportConfig class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GENERATING"] == NSOrderedSame) {
            return @(AWSCodeBuildReportStatusTypeGenerating);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSCodeBuildReportStatusTypeSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSCodeBuildReportStatusTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"INCOMPLETE"] == NSOrderedSame) {
            return @(AWSCodeBuildReportStatusTypeIncomplete);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSCodeBuildReportStatusTypeDeleting);
        }
        return @(AWSCodeBuildReportStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildReportStatusTypeGenerating:
                return @"GENERATING";
            case AWSCodeBuildReportStatusTypeSucceeded:
                return @"SUCCEEDED";
            case AWSCodeBuildReportStatusTypeFailed:
                return @"FAILED";
            case AWSCodeBuildReportStatusTypeIncomplete:
                return @"INCOMPLETE";
            case AWSCodeBuildReportStatusTypeDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)testSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildTestReportSummary class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TEST"] == NSOrderedSame) {
            return @(AWSCodeBuildReportTypeTest);
        }
        return @(AWSCodeBuildReportTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildReportTypeTest:
                return @"TEST";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildReportExportConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportConfigType" : @"exportConfigType",
             @"s3Destination" : @"s3Destination",
             };
}

+ (NSValueTransformer *)exportConfigTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSCodeBuildReportExportConfigTypeS3);
        }
        if ([value caseInsensitiveCompare:@"NO_EXPORT"] == NSOrderedSame) {
            return @(AWSCodeBuildReportExportConfigTypeNoExport);
        }
        return @(AWSCodeBuildReportExportConfigTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildReportExportConfigTypeS3:
                return @"S3";
            case AWSCodeBuildReportExportConfigTypeNoExport:
                return @"NO_EXPORT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3DestinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildS3ReportExportConfig class]];
}

@end

@implementation AWSCodeBuildReportFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GENERATING"] == NSOrderedSame) {
            return @(AWSCodeBuildReportStatusTypeGenerating);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSCodeBuildReportStatusTypeSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSCodeBuildReportStatusTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"INCOMPLETE"] == NSOrderedSame) {
            return @(AWSCodeBuildReportStatusTypeIncomplete);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSCodeBuildReportStatusTypeDeleting);
        }
        return @(AWSCodeBuildReportStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildReportStatusTypeGenerating:
                return @"GENERATING";
            case AWSCodeBuildReportStatusTypeSucceeded:
                return @"SUCCEEDED";
            case AWSCodeBuildReportStatusTypeFailed:
                return @"FAILED";
            case AWSCodeBuildReportStatusTypeIncomplete:
                return @"INCOMPLETE";
            case AWSCodeBuildReportStatusTypeDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildReportGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"created" : @"created",
             @"exportConfig" : @"exportConfig",
             @"lastModified" : @"lastModified",
             @"name" : @"name",
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildReportExportConfig class]];
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TEST"] == NSOrderedSame) {
            return @(AWSCodeBuildReportTypeTest);
        }
        return @(AWSCodeBuildReportTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildReportTypeTest:
                return @"TEST";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildS3LogsConfig

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
            return @(AWSCodeBuildLogsConfigStatusTypeEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSCodeBuildLogsConfigStatusTypeDisabled);
        }
        return @(AWSCodeBuildLogsConfigStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildLogsConfigStatusTypeEnabled:
                return @"ENABLED";
            case AWSCodeBuildLogsConfigStatusTypeDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildS3ReportExportConfig

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
            return @(AWSCodeBuildReportPackagingTypeZip);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSCodeBuildReportPackagingTypeNone);
        }
        return @(AWSCodeBuildReportPackagingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildReportPackagingTypeZip:
                return @"ZIP";
            case AWSCodeBuildReportPackagingTypeNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildSourceAuth

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resource" : @"resource",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OAUTH"] == NSOrderedSame) {
            return @(AWSCodeBuildSourceAuthTypeOauth);
        }
        return @(AWSCodeBuildSourceAuthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildSourceAuthTypeOauth:
                return @"OAUTH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildSourceCredentialsInfo

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
            return @(AWSCodeBuildAuthTypeOauth);
        }
        if ([value caseInsensitiveCompare:@"BASIC_AUTH"] == NSOrderedSame) {
            return @(AWSCodeBuildAuthTypeBasicAuth);
        }
        if ([value caseInsensitiveCompare:@"PERSONAL_ACCESS_TOKEN"] == NSOrderedSame) {
            return @(AWSCodeBuildAuthTypePersonalAccessToken);
        }
        return @(AWSCodeBuildAuthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildAuthTypeOauth:
                return @"OAUTH";
            case AWSCodeBuildAuthTypeBasicAuth:
                return @"BASIC_AUTH";
            case AWSCodeBuildAuthTypePersonalAccessToken:
                return @"PERSONAL_ACCESS_TOKEN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serverTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GITHUB"] == NSOrderedSame) {
            return @(AWSCodeBuildServerTypeGithub);
        }
        if ([value caseInsensitiveCompare:@"BITBUCKET"] == NSOrderedSame) {
            return @(AWSCodeBuildServerTypeBitbucket);
        }
        if ([value caseInsensitiveCompare:@"GITHUB_ENTERPRISE"] == NSOrderedSame) {
            return @(AWSCodeBuildServerTypeGithubEnterprise);
        }
        return @(AWSCodeBuildServerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildServerTypeGithub:
                return @"GITHUB";
            case AWSCodeBuildServerTypeBitbucket:
                return @"BITBUCKET";
            case AWSCodeBuildServerTypeGithubEnterprise:
                return @"GITHUB_ENTERPRISE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildStartBuildInput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildProjectArtifacts class]];
}

+ (NSValueTransformer *)cacheOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildProjectCache class]];
}

+ (NSValueTransformer *)computeTypeOverrideJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BUILD_GENERAL1_SMALL"] == NSOrderedSame) {
            return @(AWSCodeBuildComputeTypeBuildGeneral1Small);
        }
        if ([value caseInsensitiveCompare:@"BUILD_GENERAL1_MEDIUM"] == NSOrderedSame) {
            return @(AWSCodeBuildComputeTypeBuildGeneral1Medium);
        }
        if ([value caseInsensitiveCompare:@"BUILD_GENERAL1_LARGE"] == NSOrderedSame) {
            return @(AWSCodeBuildComputeTypeBuildGeneral1Large);
        }
        if ([value caseInsensitiveCompare:@"BUILD_GENERAL1_2XLARGE"] == NSOrderedSame) {
            return @(AWSCodeBuildComputeTypeBuildGeneral12xlarge);
        }
        return @(AWSCodeBuildComputeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildComputeTypeBuildGeneral1Small:
                return @"BUILD_GENERAL1_SMALL";
            case AWSCodeBuildComputeTypeBuildGeneral1Medium:
                return @"BUILD_GENERAL1_MEDIUM";
            case AWSCodeBuildComputeTypeBuildGeneral1Large:
                return @"BUILD_GENERAL1_LARGE";
            case AWSCodeBuildComputeTypeBuildGeneral12xlarge:
                return @"BUILD_GENERAL1_2XLARGE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)environmentTypeOverrideJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WINDOWS_CONTAINER"] == NSOrderedSame) {
            return @(AWSCodeBuildEnvironmentTypeWindowsContainer);
        }
        if ([value caseInsensitiveCompare:@"LINUX_CONTAINER"] == NSOrderedSame) {
            return @(AWSCodeBuildEnvironmentTypeLinuxContainer);
        }
        if ([value caseInsensitiveCompare:@"LINUX_GPU_CONTAINER"] == NSOrderedSame) {
            return @(AWSCodeBuildEnvironmentTypeLinuxGpuContainer);
        }
        if ([value caseInsensitiveCompare:@"ARM_CONTAINER"] == NSOrderedSame) {
            return @(AWSCodeBuildEnvironmentTypeArmContainer);
        }
        return @(AWSCodeBuildEnvironmentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildEnvironmentTypeWindowsContainer:
                return @"WINDOWS_CONTAINER";
            case AWSCodeBuildEnvironmentTypeLinuxContainer:
                return @"LINUX_CONTAINER";
            case AWSCodeBuildEnvironmentTypeLinuxGpuContainer:
                return @"LINUX_GPU_CONTAINER";
            case AWSCodeBuildEnvironmentTypeArmContainer:
                return @"ARM_CONTAINER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)environmentVariablesOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildEnvironmentVariable class]];
}

+ (NSValueTransformer *)gitSubmodulesConfigOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildGitSubmodulesConfig class]];
}

+ (NSValueTransformer *)imagePullCredentialsTypeOverrideJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODEBUILD"] == NSOrderedSame) {
            return @(AWSCodeBuildImagePullCredentialsTypeCodebuild);
        }
        if ([value caseInsensitiveCompare:@"SERVICE_ROLE"] == NSOrderedSame) {
            return @(AWSCodeBuildImagePullCredentialsTypeServiceRole);
        }
        return @(AWSCodeBuildImagePullCredentialsTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildImagePullCredentialsTypeCodebuild:
                return @"CODEBUILD";
            case AWSCodeBuildImagePullCredentialsTypeServiceRole:
                return @"SERVICE_ROLE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)logsConfigOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildLogsConfig class]];
}

+ (NSValueTransformer *)registryCredentialOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildRegistryCredential class]];
}

+ (NSValueTransformer *)secondaryArtifactsOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildProjectArtifacts class]];
}

+ (NSValueTransformer *)secondarySourcesOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildProjectSource class]];
}

+ (NSValueTransformer *)secondarySourcesVersionOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildProjectSourceVersion class]];
}

+ (NSValueTransformer *)sourceAuthOverrideJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildSourceAuth class]];
}

+ (NSValueTransformer *)sourceTypeOverrideJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODECOMMIT"] == NSOrderedSame) {
            return @(AWSCodeBuildSourceTypeCodecommit);
        }
        if ([value caseInsensitiveCompare:@"CODEPIPELINE"] == NSOrderedSame) {
            return @(AWSCodeBuildSourceTypeCodepipeline);
        }
        if ([value caseInsensitiveCompare:@"GITHUB"] == NSOrderedSame) {
            return @(AWSCodeBuildSourceTypeGithub);
        }
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSCodeBuildSourceTypeS3);
        }
        if ([value caseInsensitiveCompare:@"BITBUCKET"] == NSOrderedSame) {
            return @(AWSCodeBuildSourceTypeBitbucket);
        }
        if ([value caseInsensitiveCompare:@"GITHUB_ENTERPRISE"] == NSOrderedSame) {
            return @(AWSCodeBuildSourceTypeGithubEnterprise);
        }
        if ([value caseInsensitiveCompare:@"NO_SOURCE"] == NSOrderedSame) {
            return @(AWSCodeBuildSourceTypeNoSource);
        }
        return @(AWSCodeBuildSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildSourceTypeCodecommit:
                return @"CODECOMMIT";
            case AWSCodeBuildSourceTypeCodepipeline:
                return @"CODEPIPELINE";
            case AWSCodeBuildSourceTypeGithub:
                return @"GITHUB";
            case AWSCodeBuildSourceTypeS3:
                return @"S3";
            case AWSCodeBuildSourceTypeBitbucket:
                return @"BITBUCKET";
            case AWSCodeBuildSourceTypeGithubEnterprise:
                return @"GITHUB_ENTERPRISE";
            case AWSCodeBuildSourceTypeNoSource:
                return @"NO_SOURCE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeBuildStartBuildOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"build" : @"build",
             };
}

+ (NSValueTransformer *)buildJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildBuild class]];
}

@end

@implementation AWSCodeBuildStopBuildInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"id",
             };
}

@end

@implementation AWSCodeBuildStopBuildOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"build" : @"build",
             };
}

+ (NSValueTransformer *)buildJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildBuild class]];
}

@end

@implementation AWSCodeBuildTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

@end

@implementation AWSCodeBuildTestCase

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

@implementation AWSCodeBuildTestCaseFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"status",
             };
}

@end

@implementation AWSCodeBuildTestReportSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInNanoSeconds" : @"durationInNanoSeconds",
             @"statusCounts" : @"statusCounts",
             @"total" : @"total",
             };
}

@end

@implementation AWSCodeBuildUpdateProjectInput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildProjectArtifacts class]];
}

+ (NSValueTransformer *)cacheJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildProjectCache class]];
}

+ (NSValueTransformer *)environmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildProjectEnvironment class]];
}

+ (NSValueTransformer *)fileSystemLocationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildProjectFileSystemLocation class]];
}

+ (NSValueTransformer *)logsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildLogsConfig class]];
}

+ (NSValueTransformer *)secondaryArtifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildProjectArtifacts class]];
}

+ (NSValueTransformer *)secondarySourceVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildProjectSourceVersion class]];
}

+ (NSValueTransformer *)secondarySourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildProjectSource class]];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildProjectSource class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeBuildTag class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildVpcConfig class]];
}

@end

@implementation AWSCodeBuildUpdateProjectOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"project" : @"project",
             };
}

+ (NSValueTransformer *)projectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildProject class]];
}

@end

@implementation AWSCodeBuildUpdateReportGroupInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"exportConfig" : @"exportConfig",
             };
}

+ (NSValueTransformer *)exportConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildReportExportConfig class]];
}

@end

@implementation AWSCodeBuildUpdateReportGroupOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reportGroup" : @"reportGroup",
             };
}

+ (NSValueTransformer *)reportGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildReportGroup class]];
}

@end

@implementation AWSCodeBuildUpdateWebhookInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branchFilter" : @"branchFilter",
             @"filterGroups" : @"filterGroups",
             @"projectName" : @"projectName",
             @"rotateSecret" : @"rotateSecret",
             };
}

@end

@implementation AWSCodeBuildUpdateWebhookOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"webhook" : @"webhook",
             };
}

+ (NSValueTransformer *)webhookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeBuildWebhook class]];
}

@end

@implementation AWSCodeBuildVpcConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"securityGroupIds",
             @"subnets" : @"subnets",
             @"vpcId" : @"vpcId",
             };
}

@end

@implementation AWSCodeBuildWebhook

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

@implementation AWSCodeBuildWebhookFilter

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
            return @(AWSCodeBuildWebhookFilterTypeEvent);
        }
        if ([value caseInsensitiveCompare:@"BASE_REF"] == NSOrderedSame) {
            return @(AWSCodeBuildWebhookFilterTypeBaseRef);
        }
        if ([value caseInsensitiveCompare:@"HEAD_REF"] == NSOrderedSame) {
            return @(AWSCodeBuildWebhookFilterTypeHeadRef);
        }
        if ([value caseInsensitiveCompare:@"ACTOR_ACCOUNT_ID"] == NSOrderedSame) {
            return @(AWSCodeBuildWebhookFilterTypeActorAccountId);
        }
        if ([value caseInsensitiveCompare:@"FILE_PATH"] == NSOrderedSame) {
            return @(AWSCodeBuildWebhookFilterTypeFilePath);
        }
        if ([value caseInsensitiveCompare:@"COMMIT_MESSAGE"] == NSOrderedSame) {
            return @(AWSCodeBuildWebhookFilterTypeCommitMessage);
        }
        return @(AWSCodeBuildWebhookFilterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeBuildWebhookFilterTypeEvent:
                return @"EVENT";
            case AWSCodeBuildWebhookFilterTypeBaseRef:
                return @"BASE_REF";
            case AWSCodeBuildWebhookFilterTypeHeadRef:
                return @"HEAD_REF";
            case AWSCodeBuildWebhookFilterTypeActorAccountId:
                return @"ACTOR_ACCOUNT_ID";
            case AWSCodeBuildWebhookFilterTypeFilePath:
                return @"FILE_PATH";
            case AWSCodeBuildWebhookFilterTypeCommitMessage:
                return @"COMMIT_MESSAGE";
            default:
                return nil;
        }
    }];
}

@end
