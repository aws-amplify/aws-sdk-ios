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

#import "AWSAmplifyModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSAmplifyErrorDomain = @"com.amazonaws.AWSAmplifyErrorDomain";

@implementation AWSAmplifyApp

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appArn" : @"appArn",
             @"appId" : @"appId",
             @"autoBranchCreationConfig" : @"autoBranchCreationConfig",
             @"autoBranchCreationPatterns" : @"autoBranchCreationPatterns",
             @"basicAuthCredentials" : @"basicAuthCredentials",
             @"buildSpec" : @"buildSpec",
             @"createTime" : @"createTime",
             @"customRules" : @"customRules",
             @"defaultDomain" : @"defaultDomain",
             @"detail" : @"description",
             @"enableAutoBranchCreation" : @"enableAutoBranchCreation",
             @"enableBasicAuth" : @"enableBasicAuth",
             @"enableBranchAutoBuild" : @"enableBranchAutoBuild",
             @"enableBranchAutoDeletion" : @"enableBranchAutoDeletion",
             @"environmentVariables" : @"environmentVariables",
             @"iamServiceRoleArn" : @"iamServiceRoleArn",
             @"name" : @"name",
             @"platform" : @"platform",
             @"productionBranch" : @"productionBranch",
             @"repository" : @"repository",
             @"tags" : @"tags",
             @"updateTime" : @"updateTime",
             };
}

+ (NSValueTransformer *)autoBranchCreationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyAutoBranchCreationConfig class]];
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)customRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAmplifyCustomRule class]];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WEB"] == NSOrderedSame) {
            return @(AWSAmplifyPlatformWeb);
        }
        return @(AWSAmplifyPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAmplifyPlatformWeb:
                return @"WEB";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)productionBranchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyProductionBranch class]];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSAmplifyArtifact

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"artifactFileName" : @"artifactFileName",
             @"artifactId" : @"artifactId",
             };
}

@end

@implementation AWSAmplifyAutoBranchCreationConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"basicAuthCredentials" : @"basicAuthCredentials",
             @"buildSpec" : @"buildSpec",
             @"enableAutoBuild" : @"enableAutoBuild",
             @"enableBasicAuth" : @"enableBasicAuth",
             @"enablePullRequestPreview" : @"enablePullRequestPreview",
             @"environmentVariables" : @"environmentVariables",
             @"framework" : @"framework",
             @"pullRequestEnvironmentName" : @"pullRequestEnvironmentName",
             @"stage" : @"stage",
             };
}

+ (NSValueTransformer *)stageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRODUCTION"] == NSOrderedSame) {
            return @(AWSAmplifyStageProduction);
        }
        if ([value caseInsensitiveCompare:@"BETA"] == NSOrderedSame) {
            return @(AWSAmplifyStageBeta);
        }
        if ([value caseInsensitiveCompare:@"DEVELOPMENT"] == NSOrderedSame) {
            return @(AWSAmplifyStageDevelopment);
        }
        if ([value caseInsensitiveCompare:@"EXPERIMENTAL"] == NSOrderedSame) {
            return @(AWSAmplifyStageExperimental);
        }
        if ([value caseInsensitiveCompare:@"PULL_REQUEST"] == NSOrderedSame) {
            return @(AWSAmplifyStagePullRequest);
        }
        return @(AWSAmplifyStageUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAmplifyStageProduction:
                return @"PRODUCTION";
            case AWSAmplifyStageBeta:
                return @"BETA";
            case AWSAmplifyStageDevelopment:
                return @"DEVELOPMENT";
            case AWSAmplifyStageExperimental:
                return @"EXPERIMENTAL";
            case AWSAmplifyStagePullRequest:
                return @"PULL_REQUEST";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAmplifyBackendEnvironment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backendEnvironmentArn" : @"backendEnvironmentArn",
             @"createTime" : @"createTime",
             @"deploymentArtifacts" : @"deploymentArtifacts",
             @"environmentName" : @"environmentName",
             @"stackName" : @"stackName",
             @"updateTime" : @"updateTime",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSAmplifyBranch

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeJobId" : @"activeJobId",
             @"associatedResources" : @"associatedResources",
             @"backendEnvironmentArn" : @"backendEnvironmentArn",
             @"basicAuthCredentials" : @"basicAuthCredentials",
             @"branchArn" : @"branchArn",
             @"branchName" : @"branchName",
             @"buildSpec" : @"buildSpec",
             @"createTime" : @"createTime",
             @"customDomains" : @"customDomains",
             @"detail" : @"description",
             @"destinationBranch" : @"destinationBranch",
             @"displayName" : @"displayName",
             @"enableAutoBuild" : @"enableAutoBuild",
             @"enableBasicAuth" : @"enableBasicAuth",
             @"enableNotification" : @"enableNotification",
             @"enablePullRequestPreview" : @"enablePullRequestPreview",
             @"environmentVariables" : @"environmentVariables",
             @"framework" : @"framework",
             @"pullRequestEnvironmentName" : @"pullRequestEnvironmentName",
             @"sourceBranch" : @"sourceBranch",
             @"stage" : @"stage",
             @"tags" : @"tags",
             @"thumbnailUrl" : @"thumbnailUrl",
             @"totalNumberOfJobs" : @"totalNumberOfJobs",
             @"ttl" : @"ttl",
             @"updateTime" : @"updateTime",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRODUCTION"] == NSOrderedSame) {
            return @(AWSAmplifyStageProduction);
        }
        if ([value caseInsensitiveCompare:@"BETA"] == NSOrderedSame) {
            return @(AWSAmplifyStageBeta);
        }
        if ([value caseInsensitiveCompare:@"DEVELOPMENT"] == NSOrderedSame) {
            return @(AWSAmplifyStageDevelopment);
        }
        if ([value caseInsensitiveCompare:@"EXPERIMENTAL"] == NSOrderedSame) {
            return @(AWSAmplifyStageExperimental);
        }
        if ([value caseInsensitiveCompare:@"PULL_REQUEST"] == NSOrderedSame) {
            return @(AWSAmplifyStagePullRequest);
        }
        return @(AWSAmplifyStageUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAmplifyStageProduction:
                return @"PRODUCTION";
            case AWSAmplifyStageBeta:
                return @"BETA";
            case AWSAmplifyStageDevelopment:
                return @"DEVELOPMENT";
            case AWSAmplifyStageExperimental:
                return @"EXPERIMENTAL";
            case AWSAmplifyStagePullRequest:
                return @"PULL_REQUEST";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSAmplifyCreateAppRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"accessToken",
             @"autoBranchCreationConfig" : @"autoBranchCreationConfig",
             @"autoBranchCreationPatterns" : @"autoBranchCreationPatterns",
             @"basicAuthCredentials" : @"basicAuthCredentials",
             @"buildSpec" : @"buildSpec",
             @"customRules" : @"customRules",
             @"detail" : @"description",
             @"enableAutoBranchCreation" : @"enableAutoBranchCreation",
             @"enableBasicAuth" : @"enableBasicAuth",
             @"enableBranchAutoBuild" : @"enableBranchAutoBuild",
             @"enableBranchAutoDeletion" : @"enableBranchAutoDeletion",
             @"environmentVariables" : @"environmentVariables",
             @"iamServiceRoleArn" : @"iamServiceRoleArn",
             @"name" : @"name",
             @"oauthToken" : @"oauthToken",
             @"platform" : @"platform",
             @"repository" : @"repository",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)autoBranchCreationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyAutoBranchCreationConfig class]];
}

+ (NSValueTransformer *)customRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAmplifyCustomRule class]];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WEB"] == NSOrderedSame) {
            return @(AWSAmplifyPlatformWeb);
        }
        return @(AWSAmplifyPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAmplifyPlatformWeb:
                return @"WEB";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAmplifyCreateAppResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"app" : @"app",
             };
}

+ (NSValueTransformer *)appJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyApp class]];
}

@end

@implementation AWSAmplifyCreateBackendEnvironmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"deploymentArtifacts" : @"deploymentArtifacts",
             @"environmentName" : @"environmentName",
             @"stackName" : @"stackName",
             };
}

@end

@implementation AWSAmplifyCreateBackendEnvironmentResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backendEnvironment" : @"backendEnvironment",
             };
}

+ (NSValueTransformer *)backendEnvironmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyBackendEnvironment class]];
}

@end

@implementation AWSAmplifyCreateBranchRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"backendEnvironmentArn" : @"backendEnvironmentArn",
             @"basicAuthCredentials" : @"basicAuthCredentials",
             @"branchName" : @"branchName",
             @"buildSpec" : @"buildSpec",
             @"detail" : @"description",
             @"displayName" : @"displayName",
             @"enableAutoBuild" : @"enableAutoBuild",
             @"enableBasicAuth" : @"enableBasicAuth",
             @"enableNotification" : @"enableNotification",
             @"enablePullRequestPreview" : @"enablePullRequestPreview",
             @"environmentVariables" : @"environmentVariables",
             @"framework" : @"framework",
             @"pullRequestEnvironmentName" : @"pullRequestEnvironmentName",
             @"stage" : @"stage",
             @"tags" : @"tags",
             @"ttl" : @"ttl",
             };
}

+ (NSValueTransformer *)stageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRODUCTION"] == NSOrderedSame) {
            return @(AWSAmplifyStageProduction);
        }
        if ([value caseInsensitiveCompare:@"BETA"] == NSOrderedSame) {
            return @(AWSAmplifyStageBeta);
        }
        if ([value caseInsensitiveCompare:@"DEVELOPMENT"] == NSOrderedSame) {
            return @(AWSAmplifyStageDevelopment);
        }
        if ([value caseInsensitiveCompare:@"EXPERIMENTAL"] == NSOrderedSame) {
            return @(AWSAmplifyStageExperimental);
        }
        if ([value caseInsensitiveCompare:@"PULL_REQUEST"] == NSOrderedSame) {
            return @(AWSAmplifyStagePullRequest);
        }
        return @(AWSAmplifyStageUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAmplifyStageProduction:
                return @"PRODUCTION";
            case AWSAmplifyStageBeta:
                return @"BETA";
            case AWSAmplifyStageDevelopment:
                return @"DEVELOPMENT";
            case AWSAmplifyStageExperimental:
                return @"EXPERIMENTAL";
            case AWSAmplifyStagePullRequest:
                return @"PULL_REQUEST";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAmplifyCreateBranchResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branch" : @"branch",
             };
}

+ (NSValueTransformer *)branchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyBranch class]];
}

@end

@implementation AWSAmplifyCreateDeploymentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"branchName" : @"branchName",
             @"fileMap" : @"fileMap",
             };
}

@end

@implementation AWSAmplifyCreateDeploymentResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileUploadUrls" : @"fileUploadUrls",
             @"jobId" : @"jobId",
             @"zipUploadUrl" : @"zipUploadUrl",
             };
}

@end

@implementation AWSAmplifyCreateDomainAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"autoSubDomainCreationPatterns" : @"autoSubDomainCreationPatterns",
             @"autoSubDomainIAMRole" : @"autoSubDomainIAMRole",
             @"domainName" : @"domainName",
             @"enableAutoSubDomain" : @"enableAutoSubDomain",
             @"subDomainSettings" : @"subDomainSettings",
             };
}

+ (NSValueTransformer *)subDomainSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAmplifySubDomainSetting class]];
}

@end

@implementation AWSAmplifyCreateDomainAssociationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainAssociation" : @"domainAssociation",
             };
}

+ (NSValueTransformer *)domainAssociationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyDomainAssociation class]];
}

@end

@implementation AWSAmplifyCreateWebhookRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"branchName" : @"branchName",
             @"detail" : @"description",
             };
}

@end

@implementation AWSAmplifyCreateWebhookResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"webhook" : @"webhook",
             };
}

+ (NSValueTransformer *)webhookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyWebhook class]];
}

@end

@implementation AWSAmplifyCustomRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"condition" : @"condition",
             @"source" : @"source",
             @"status" : @"status",
             @"target" : @"target",
             };
}

@end

@implementation AWSAmplifyDeleteAppRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             };
}

@end

@implementation AWSAmplifyDeleteAppResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"app" : @"app",
             };
}

+ (NSValueTransformer *)appJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyApp class]];
}

@end

@implementation AWSAmplifyDeleteBackendEnvironmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"environmentName" : @"environmentName",
             };
}

@end

@implementation AWSAmplifyDeleteBackendEnvironmentResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backendEnvironment" : @"backendEnvironment",
             };
}

+ (NSValueTransformer *)backendEnvironmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyBackendEnvironment class]];
}

@end

@implementation AWSAmplifyDeleteBranchRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"branchName" : @"branchName",
             };
}

@end

@implementation AWSAmplifyDeleteBranchResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branch" : @"branch",
             };
}

+ (NSValueTransformer *)branchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyBranch class]];
}

@end

@implementation AWSAmplifyDeleteDomainAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"domainName" : @"domainName",
             };
}

@end

@implementation AWSAmplifyDeleteDomainAssociationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainAssociation" : @"domainAssociation",
             };
}

+ (NSValueTransformer *)domainAssociationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyDomainAssociation class]];
}

@end

@implementation AWSAmplifyDeleteJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"branchName" : @"branchName",
             @"jobId" : @"jobId",
             };
}

@end

@implementation AWSAmplifyDeleteJobResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobSummary" : @"jobSummary",
             };
}

+ (NSValueTransformer *)jobSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyJobSummary class]];
}

@end

@implementation AWSAmplifyDeleteWebhookRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"webhookId" : @"webhookId",
             };
}

@end

@implementation AWSAmplifyDeleteWebhookResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"webhook" : @"webhook",
             };
}

+ (NSValueTransformer *)webhookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyWebhook class]];
}

@end

@implementation AWSAmplifyDomainAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoSubDomainCreationPatterns" : @"autoSubDomainCreationPatterns",
             @"autoSubDomainIAMRole" : @"autoSubDomainIAMRole",
             @"certificateVerificationDNSRecord" : @"certificateVerificationDNSRecord",
             @"domainAssociationArn" : @"domainAssociationArn",
             @"domainName" : @"domainName",
             @"domainStatus" : @"domainStatus",
             @"enableAutoSubDomain" : @"enableAutoSubDomain",
             @"statusReason" : @"statusReason",
             @"subDomains" : @"subDomains",
             };
}

+ (NSValueTransformer *)domainStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING_VERIFICATION"] == NSOrderedSame) {
            return @(AWSAmplifyDomainStatusPendingVerification);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSAmplifyDomainStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSAmplifyDomainStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"PENDING_DEPLOYMENT"] == NSOrderedSame) {
            return @(AWSAmplifyDomainStatusPendingDeployment);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSAmplifyDomainStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSAmplifyDomainStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"REQUESTING_CERTIFICATE"] == NSOrderedSame) {
            return @(AWSAmplifyDomainStatusRequestingCertificate);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSAmplifyDomainStatusUpdating);
        }
        return @(AWSAmplifyDomainStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAmplifyDomainStatusPendingVerification:
                return @"PENDING_VERIFICATION";
            case AWSAmplifyDomainStatusInProgress:
                return @"IN_PROGRESS";
            case AWSAmplifyDomainStatusAvailable:
                return @"AVAILABLE";
            case AWSAmplifyDomainStatusPendingDeployment:
                return @"PENDING_DEPLOYMENT";
            case AWSAmplifyDomainStatusFailed:
                return @"FAILED";
            case AWSAmplifyDomainStatusCreating:
                return @"CREATING";
            case AWSAmplifyDomainStatusRequestingCertificate:
                return @"REQUESTING_CERTIFICATE";
            case AWSAmplifyDomainStatusUpdating:
                return @"UPDATING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)subDomainsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAmplifySubDomain class]];
}

@end

@implementation AWSAmplifyGenerateAccessLogsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"domainName" : @"domainName",
             @"endTime" : @"endTime",
             @"startTime" : @"startTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
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

@implementation AWSAmplifyGenerateAccessLogsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logUrl" : @"logUrl",
             };
}

@end

@implementation AWSAmplifyGetAppRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             };
}

@end

@implementation AWSAmplifyGetAppResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"app" : @"app",
             };
}

+ (NSValueTransformer *)appJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyApp class]];
}

@end

@implementation AWSAmplifyGetArtifactUrlRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"artifactId" : @"artifactId",
             };
}

@end

@implementation AWSAmplifyGetArtifactUrlResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"artifactId" : @"artifactId",
             @"artifactUrl" : @"artifactUrl",
             };
}

@end

@implementation AWSAmplifyGetBackendEnvironmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"environmentName" : @"environmentName",
             };
}

@end

@implementation AWSAmplifyGetBackendEnvironmentResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backendEnvironment" : @"backendEnvironment",
             };
}

+ (NSValueTransformer *)backendEnvironmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyBackendEnvironment class]];
}

@end

@implementation AWSAmplifyGetBranchRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"branchName" : @"branchName",
             };
}

@end

@implementation AWSAmplifyGetBranchResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branch" : @"branch",
             };
}

+ (NSValueTransformer *)branchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyBranch class]];
}

@end

@implementation AWSAmplifyGetDomainAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"domainName" : @"domainName",
             };
}

@end

@implementation AWSAmplifyGetDomainAssociationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainAssociation" : @"domainAssociation",
             };
}

+ (NSValueTransformer *)domainAssociationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyDomainAssociation class]];
}

@end

@implementation AWSAmplifyGetJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"branchName" : @"branchName",
             @"jobId" : @"jobId",
             };
}

@end

@implementation AWSAmplifyGetJobResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"job" : @"job",
             };
}

+ (NSValueTransformer *)jobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyJob class]];
}

@end

@implementation AWSAmplifyGetWebhookRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"webhookId" : @"webhookId",
             };
}

@end

@implementation AWSAmplifyGetWebhookResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"webhook" : @"webhook",
             };
}

+ (NSValueTransformer *)webhookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyWebhook class]];
}

@end

@implementation AWSAmplifyJob

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"steps" : @"steps",
             @"summary" : @"summary",
             };
}

+ (NSValueTransformer *)stepsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAmplifyStep class]];
}

+ (NSValueTransformer *)summaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyJobSummary class]];
}

@end

@implementation AWSAmplifyJobSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commitId" : @"commitId",
             @"commitMessage" : @"commitMessage",
             @"commitTime" : @"commitTime",
             @"endTime" : @"endTime",
             @"jobArn" : @"jobArn",
             @"jobId" : @"jobId",
             @"jobType" : @"jobType",
             @"startTime" : @"startTime",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)commitTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)jobTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RELEASE"] == NSOrderedSame) {
            return @(AWSAmplifyJobTypeRelease);
        }
        if ([value caseInsensitiveCompare:@"RETRY"] == NSOrderedSame) {
            return @(AWSAmplifyJobTypeRetry);
        }
        if ([value caseInsensitiveCompare:@"MANUAL"] == NSOrderedSame) {
            return @(AWSAmplifyJobTypeManual);
        }
        if ([value caseInsensitiveCompare:@"WEB_HOOK"] == NSOrderedSame) {
            return @(AWSAmplifyJobTypeWebHook);
        }
        return @(AWSAmplifyJobTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAmplifyJobTypeRelease:
                return @"RELEASE";
            case AWSAmplifyJobTypeRetry:
                return @"RETRY";
            case AWSAmplifyJobTypeManual:
                return @"MANUAL";
            case AWSAmplifyJobTypeWebHook:
                return @"WEB_HOOK";
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

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSAmplifyJobStatusPending);
        }
        if ([value caseInsensitiveCompare:@"PROVISIONING"] == NSOrderedSame) {
            return @(AWSAmplifyJobStatusProvisioning);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSAmplifyJobStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSAmplifyJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"SUCCEED"] == NSOrderedSame) {
            return @(AWSAmplifyJobStatusSucceed);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSAmplifyJobStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSAmplifyJobStatusCancelled);
        }
        return @(AWSAmplifyJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAmplifyJobStatusPending:
                return @"PENDING";
            case AWSAmplifyJobStatusProvisioning:
                return @"PROVISIONING";
            case AWSAmplifyJobStatusRunning:
                return @"RUNNING";
            case AWSAmplifyJobStatusFailed:
                return @"FAILED";
            case AWSAmplifyJobStatusSucceed:
                return @"SUCCEED";
            case AWSAmplifyJobStatusCancelling:
                return @"CANCELLING";
            case AWSAmplifyJobStatusCancelled:
                return @"CANCELLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAmplifyListAppsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSAmplifyListAppsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apps" : @"apps",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)appsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAmplifyApp class]];
}

@end

@implementation AWSAmplifyListArtifactsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"branchName" : @"branchName",
             @"jobId" : @"jobId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSAmplifyListArtifactsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"artifacts" : @"artifacts",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)artifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAmplifyArtifact class]];
}

@end

@implementation AWSAmplifyListBackendEnvironmentsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"environmentName" : @"environmentName",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSAmplifyListBackendEnvironmentsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backendEnvironments" : @"backendEnvironments",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)backendEnvironmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAmplifyBackendEnvironment class]];
}

@end

@implementation AWSAmplifyListBranchesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSAmplifyListBranchesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branches" : @"branches",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)branchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAmplifyBranch class]];
}

@end

@implementation AWSAmplifyListDomainAssociationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSAmplifyListDomainAssociationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainAssociations" : @"domainAssociations",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)domainAssociationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAmplifyDomainAssociation class]];
}

@end

@implementation AWSAmplifyListJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"branchName" : @"branchName",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSAmplifyListJobsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobSummaries" : @"jobSummaries",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)jobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAmplifyJobSummary class]];
}

@end

@implementation AWSAmplifyListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSAmplifyListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             };
}

@end

@implementation AWSAmplifyListWebhooksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSAmplifyListWebhooksResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"webhooks" : @"webhooks",
             };
}

+ (NSValueTransformer *)webhooksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAmplifyWebhook class]];
}

@end

@implementation AWSAmplifyProductionBranch

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branchName" : @"branchName",
             @"lastDeployTime" : @"lastDeployTime",
             @"status" : @"status",
             @"thumbnailUrl" : @"thumbnailUrl",
             };
}

+ (NSValueTransformer *)lastDeployTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSAmplifyStartDeploymentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"branchName" : @"branchName",
             @"jobId" : @"jobId",
             @"sourceUrl" : @"sourceUrl",
             };
}

@end

@implementation AWSAmplifyStartDeploymentResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobSummary" : @"jobSummary",
             };
}

+ (NSValueTransformer *)jobSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyJobSummary class]];
}

@end

@implementation AWSAmplifyStartJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"branchName" : @"branchName",
             @"commitId" : @"commitId",
             @"commitMessage" : @"commitMessage",
             @"commitTime" : @"commitTime",
             @"jobId" : @"jobId",
             @"jobReason" : @"jobReason",
             @"jobType" : @"jobType",
             };
}

+ (NSValueTransformer *)commitTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)jobTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RELEASE"] == NSOrderedSame) {
            return @(AWSAmplifyJobTypeRelease);
        }
        if ([value caseInsensitiveCompare:@"RETRY"] == NSOrderedSame) {
            return @(AWSAmplifyJobTypeRetry);
        }
        if ([value caseInsensitiveCompare:@"MANUAL"] == NSOrderedSame) {
            return @(AWSAmplifyJobTypeManual);
        }
        if ([value caseInsensitiveCompare:@"WEB_HOOK"] == NSOrderedSame) {
            return @(AWSAmplifyJobTypeWebHook);
        }
        return @(AWSAmplifyJobTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAmplifyJobTypeRelease:
                return @"RELEASE";
            case AWSAmplifyJobTypeRetry:
                return @"RETRY";
            case AWSAmplifyJobTypeManual:
                return @"MANUAL";
            case AWSAmplifyJobTypeWebHook:
                return @"WEB_HOOK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAmplifyStartJobResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobSummary" : @"jobSummary",
             };
}

+ (NSValueTransformer *)jobSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyJobSummary class]];
}

@end

@implementation AWSAmplifyStep

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"artifactsUrl" : @"artifactsUrl",
             @"context" : @"context",
             @"endTime" : @"endTime",
             @"logUrl" : @"logUrl",
             @"screenshots" : @"screenshots",
             @"startTime" : @"startTime",
             @"status" : @"status",
             @"statusReason" : @"statusReason",
             @"stepName" : @"stepName",
             @"testArtifactsUrl" : @"testArtifactsUrl",
             @"testConfigUrl" : @"testConfigUrl",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSAmplifyJobStatusPending);
        }
        if ([value caseInsensitiveCompare:@"PROVISIONING"] == NSOrderedSame) {
            return @(AWSAmplifyJobStatusProvisioning);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSAmplifyJobStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSAmplifyJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"SUCCEED"] == NSOrderedSame) {
            return @(AWSAmplifyJobStatusSucceed);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSAmplifyJobStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSAmplifyJobStatusCancelled);
        }
        return @(AWSAmplifyJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAmplifyJobStatusPending:
                return @"PENDING";
            case AWSAmplifyJobStatusProvisioning:
                return @"PROVISIONING";
            case AWSAmplifyJobStatusRunning:
                return @"RUNNING";
            case AWSAmplifyJobStatusFailed:
                return @"FAILED";
            case AWSAmplifyJobStatusSucceed:
                return @"SUCCEED";
            case AWSAmplifyJobStatusCancelling:
                return @"CANCELLING";
            case AWSAmplifyJobStatusCancelled:
                return @"CANCELLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAmplifyStopJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"branchName" : @"branchName",
             @"jobId" : @"jobId",
             };
}

@end

@implementation AWSAmplifyStopJobResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobSummary" : @"jobSummary",
             };
}

+ (NSValueTransformer *)jobSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyJobSummary class]];
}

@end

@implementation AWSAmplifySubDomain

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dnsRecord" : @"dnsRecord",
             @"subDomainSetting" : @"subDomainSetting",
             @"verified" : @"verified",
             };
}

+ (NSValueTransformer *)subDomainSettingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifySubDomainSetting class]];
}

@end

@implementation AWSAmplifySubDomainSetting

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branchName" : @"branchName",
             @"prefix" : @"prefix",
             };
}

@end

@implementation AWSAmplifyTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSAmplifyTagResourceResponse

@end

@implementation AWSAmplifyUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSAmplifyUntagResourceResponse

@end

@implementation AWSAmplifyUpdateAppRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"accessToken",
             @"appId" : @"appId",
             @"autoBranchCreationConfig" : @"autoBranchCreationConfig",
             @"autoBranchCreationPatterns" : @"autoBranchCreationPatterns",
             @"basicAuthCredentials" : @"basicAuthCredentials",
             @"buildSpec" : @"buildSpec",
             @"customRules" : @"customRules",
             @"detail" : @"description",
             @"enableAutoBranchCreation" : @"enableAutoBranchCreation",
             @"enableBasicAuth" : @"enableBasicAuth",
             @"enableBranchAutoBuild" : @"enableBranchAutoBuild",
             @"enableBranchAutoDeletion" : @"enableBranchAutoDeletion",
             @"environmentVariables" : @"environmentVariables",
             @"iamServiceRoleArn" : @"iamServiceRoleArn",
             @"name" : @"name",
             @"oauthToken" : @"oauthToken",
             @"platform" : @"platform",
             @"repository" : @"repository",
             };
}

+ (NSValueTransformer *)autoBranchCreationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyAutoBranchCreationConfig class]];
}

+ (NSValueTransformer *)customRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAmplifyCustomRule class]];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WEB"] == NSOrderedSame) {
            return @(AWSAmplifyPlatformWeb);
        }
        return @(AWSAmplifyPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAmplifyPlatformWeb:
                return @"WEB";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAmplifyUpdateAppResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"app" : @"app",
             };
}

+ (NSValueTransformer *)appJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyApp class]];
}

@end

@implementation AWSAmplifyUpdateBranchRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"backendEnvironmentArn" : @"backendEnvironmentArn",
             @"basicAuthCredentials" : @"basicAuthCredentials",
             @"branchName" : @"branchName",
             @"buildSpec" : @"buildSpec",
             @"detail" : @"description",
             @"displayName" : @"displayName",
             @"enableAutoBuild" : @"enableAutoBuild",
             @"enableBasicAuth" : @"enableBasicAuth",
             @"enableNotification" : @"enableNotification",
             @"enablePullRequestPreview" : @"enablePullRequestPreview",
             @"environmentVariables" : @"environmentVariables",
             @"framework" : @"framework",
             @"pullRequestEnvironmentName" : @"pullRequestEnvironmentName",
             @"stage" : @"stage",
             @"ttl" : @"ttl",
             };
}

+ (NSValueTransformer *)stageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRODUCTION"] == NSOrderedSame) {
            return @(AWSAmplifyStageProduction);
        }
        if ([value caseInsensitiveCompare:@"BETA"] == NSOrderedSame) {
            return @(AWSAmplifyStageBeta);
        }
        if ([value caseInsensitiveCompare:@"DEVELOPMENT"] == NSOrderedSame) {
            return @(AWSAmplifyStageDevelopment);
        }
        if ([value caseInsensitiveCompare:@"EXPERIMENTAL"] == NSOrderedSame) {
            return @(AWSAmplifyStageExperimental);
        }
        if ([value caseInsensitiveCompare:@"PULL_REQUEST"] == NSOrderedSame) {
            return @(AWSAmplifyStagePullRequest);
        }
        return @(AWSAmplifyStageUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAmplifyStageProduction:
                return @"PRODUCTION";
            case AWSAmplifyStageBeta:
                return @"BETA";
            case AWSAmplifyStageDevelopment:
                return @"DEVELOPMENT";
            case AWSAmplifyStageExperimental:
                return @"EXPERIMENTAL";
            case AWSAmplifyStagePullRequest:
                return @"PULL_REQUEST";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAmplifyUpdateBranchResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branch" : @"branch",
             };
}

+ (NSValueTransformer *)branchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyBranch class]];
}

@end

@implementation AWSAmplifyUpdateDomainAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appId" : @"appId",
             @"autoSubDomainCreationPatterns" : @"autoSubDomainCreationPatterns",
             @"autoSubDomainIAMRole" : @"autoSubDomainIAMRole",
             @"domainName" : @"domainName",
             @"enableAutoSubDomain" : @"enableAutoSubDomain",
             @"subDomainSettings" : @"subDomainSettings",
             };
}

+ (NSValueTransformer *)subDomainSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAmplifySubDomainSetting class]];
}

@end

@implementation AWSAmplifyUpdateDomainAssociationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainAssociation" : @"domainAssociation",
             };
}

+ (NSValueTransformer *)domainAssociationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyDomainAssociation class]];
}

@end

@implementation AWSAmplifyUpdateWebhookRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branchName" : @"branchName",
             @"detail" : @"description",
             @"webhookId" : @"webhookId",
             };
}

@end

@implementation AWSAmplifyUpdateWebhookResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"webhook" : @"webhook",
             };
}

+ (NSValueTransformer *)webhookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAmplifyWebhook class]];
}

@end

@implementation AWSAmplifyWebhook

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branchName" : @"branchName",
             @"createTime" : @"createTime",
             @"detail" : @"description",
             @"updateTime" : @"updateTime",
             @"webhookArn" : @"webhookArn",
             @"webhookId" : @"webhookId",
             @"webhookUrl" : @"webhookUrl",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end
