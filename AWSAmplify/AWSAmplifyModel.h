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

FOUNDATION_EXPORT NSString *const AWSAmplifyErrorDomain;

typedef NS_ENUM(NSInteger, AWSAmplifyErrorType) {
    AWSAmplifyErrorUnknown,
    AWSAmplifyErrorBadRequest,
    AWSAmplifyErrorDependentServiceFailure,
    AWSAmplifyErrorInternalFailure,
    AWSAmplifyErrorLimitExceeded,
    AWSAmplifyErrorNotFound,
    AWSAmplifyErrorResourceNotFound,
    AWSAmplifyErrorUnauthorized,
};

typedef NS_ENUM(NSInteger, AWSAmplifyDomainStatus) {
    AWSAmplifyDomainStatusUnknown,
    AWSAmplifyDomainStatusPendingVerification,
    AWSAmplifyDomainStatusInProgress,
    AWSAmplifyDomainStatusAvailable,
    AWSAmplifyDomainStatusPendingDeployment,
    AWSAmplifyDomainStatusFailed,
    AWSAmplifyDomainStatusCreating,
    AWSAmplifyDomainStatusRequestingCertificate,
    AWSAmplifyDomainStatusUpdating,
};

typedef NS_ENUM(NSInteger, AWSAmplifyJobStatus) {
    AWSAmplifyJobStatusUnknown,
    AWSAmplifyJobStatusPending,
    AWSAmplifyJobStatusProvisioning,
    AWSAmplifyJobStatusRunning,
    AWSAmplifyJobStatusFailed,
    AWSAmplifyJobStatusSucceed,
    AWSAmplifyJobStatusCancelling,
    AWSAmplifyJobStatusCancelled,
};

typedef NS_ENUM(NSInteger, AWSAmplifyJobType) {
    AWSAmplifyJobTypeUnknown,
    AWSAmplifyJobTypeRelease,
    AWSAmplifyJobTypeRetry,
    AWSAmplifyJobTypeManual,
    AWSAmplifyJobTypeWebHook,
};

typedef NS_ENUM(NSInteger, AWSAmplifyPlatform) {
    AWSAmplifyPlatformUnknown,
    AWSAmplifyPlatformWeb,
};

typedef NS_ENUM(NSInteger, AWSAmplifyStage) {
    AWSAmplifyStageUnknown,
    AWSAmplifyStageProduction,
    AWSAmplifyStageBeta,
    AWSAmplifyStageDevelopment,
    AWSAmplifyStageExperimental,
    AWSAmplifyStagePullRequest,
};

@class AWSAmplifyApp;
@class AWSAmplifyArtifact;
@class AWSAmplifyAutoBranchCreationConfig;
@class AWSAmplifyBackendEnvironment;
@class AWSAmplifyBranch;
@class AWSAmplifyCreateAppRequest;
@class AWSAmplifyCreateAppResult;
@class AWSAmplifyCreateBackendEnvironmentRequest;
@class AWSAmplifyCreateBackendEnvironmentResult;
@class AWSAmplifyCreateBranchRequest;
@class AWSAmplifyCreateBranchResult;
@class AWSAmplifyCreateDeploymentRequest;
@class AWSAmplifyCreateDeploymentResult;
@class AWSAmplifyCreateDomainAssociationRequest;
@class AWSAmplifyCreateDomainAssociationResult;
@class AWSAmplifyCreateWebhookRequest;
@class AWSAmplifyCreateWebhookResult;
@class AWSAmplifyCustomRule;
@class AWSAmplifyDeleteAppRequest;
@class AWSAmplifyDeleteAppResult;
@class AWSAmplifyDeleteBackendEnvironmentRequest;
@class AWSAmplifyDeleteBackendEnvironmentResult;
@class AWSAmplifyDeleteBranchRequest;
@class AWSAmplifyDeleteBranchResult;
@class AWSAmplifyDeleteDomainAssociationRequest;
@class AWSAmplifyDeleteDomainAssociationResult;
@class AWSAmplifyDeleteJobRequest;
@class AWSAmplifyDeleteJobResult;
@class AWSAmplifyDeleteWebhookRequest;
@class AWSAmplifyDeleteWebhookResult;
@class AWSAmplifyDomainAssociation;
@class AWSAmplifyGenerateAccessLogsRequest;
@class AWSAmplifyGenerateAccessLogsResult;
@class AWSAmplifyGetAppRequest;
@class AWSAmplifyGetAppResult;
@class AWSAmplifyGetArtifactUrlRequest;
@class AWSAmplifyGetArtifactUrlResult;
@class AWSAmplifyGetBackendEnvironmentRequest;
@class AWSAmplifyGetBackendEnvironmentResult;
@class AWSAmplifyGetBranchRequest;
@class AWSAmplifyGetBranchResult;
@class AWSAmplifyGetDomainAssociationRequest;
@class AWSAmplifyGetDomainAssociationResult;
@class AWSAmplifyGetJobRequest;
@class AWSAmplifyGetJobResult;
@class AWSAmplifyGetWebhookRequest;
@class AWSAmplifyGetWebhookResult;
@class AWSAmplifyJob;
@class AWSAmplifyJobSummary;
@class AWSAmplifyListAppsRequest;
@class AWSAmplifyListAppsResult;
@class AWSAmplifyListArtifactsRequest;
@class AWSAmplifyListArtifactsResult;
@class AWSAmplifyListBackendEnvironmentsRequest;
@class AWSAmplifyListBackendEnvironmentsResult;
@class AWSAmplifyListBranchesRequest;
@class AWSAmplifyListBranchesResult;
@class AWSAmplifyListDomainAssociationsRequest;
@class AWSAmplifyListDomainAssociationsResult;
@class AWSAmplifyListJobsRequest;
@class AWSAmplifyListJobsResult;
@class AWSAmplifyListTagsForResourceRequest;
@class AWSAmplifyListTagsForResourceResponse;
@class AWSAmplifyListWebhooksRequest;
@class AWSAmplifyListWebhooksResult;
@class AWSAmplifyProductionBranch;
@class AWSAmplifyStartDeploymentRequest;
@class AWSAmplifyStartDeploymentResult;
@class AWSAmplifyStartJobRequest;
@class AWSAmplifyStartJobResult;
@class AWSAmplifyStep;
@class AWSAmplifyStopJobRequest;
@class AWSAmplifyStopJobResult;
@class AWSAmplifySubDomain;
@class AWSAmplifySubDomainSetting;
@class AWSAmplifyTagResourceRequest;
@class AWSAmplifyTagResourceResponse;
@class AWSAmplifyUntagResourceRequest;
@class AWSAmplifyUntagResourceResponse;
@class AWSAmplifyUpdateAppRequest;
@class AWSAmplifyUpdateAppResult;
@class AWSAmplifyUpdateBranchRequest;
@class AWSAmplifyUpdateBranchResult;
@class AWSAmplifyUpdateDomainAssociationRequest;
@class AWSAmplifyUpdateDomainAssociationResult;
@class AWSAmplifyUpdateWebhookRequest;
@class AWSAmplifyUpdateWebhookResult;
@class AWSAmplifyWebhook;

/**
 <p> Represents the different branches of a repository for building, deploying, and hosting an Amplify app. </p>
 Required parameters: [appId, appArn, name, description, repository, platform, createTime, updateTime, environmentVariables, defaultDomain, enableBranchAutoBuild, enableBasicAuth]
 */
@interface AWSAmplifyApp : AWSModel


/**
 <p> The Amazon Resource Name (ARN) of the Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appArn;

/**
 <p> The unique ID of the Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> Describes the automated branch creation configuration for the Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyAutoBranchCreationConfig * _Nullable autoBranchCreationConfig;

/**
 <p> Describes the automated branch creation glob patterns for the Amplify app. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoBranchCreationPatterns;

/**
 <p> The basic authorization credentials for branches for the Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable basicAuthCredentials;

/**
 <p> Describes the content of the build specification (build spec) for the Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable buildSpec;

/**
 <p> Creates a date and time for the Amplify app. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p> Describes the custom redirect and rewrite rules for the Amplify app. </p>
 */
@property (nonatomic, strong) NSArray<AWSAmplifyCustomRule *> * _Nullable customRules;

/**
 <p> The default domain for the Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultDomain;

/**
 <p> The description for the Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> Enables automated branch creation for the Amplify app. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableAutoBranchCreation;

/**
 <p> Enables basic authorization for the Amplify app's branches. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableBasicAuth;

/**
 <p> Enables the auto-building of branches for the Amplify app. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableBranchAutoBuild;

/**
 <p> Automatically disconnects a branch in the Amplify Console when you delete a branch from your Git repository. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableBranchAutoDeletion;

/**
 <p> The environment variables for the Amplify app. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable environmentVariables;

/**
 <p> The AWS Identity and Access Management (IAM) service role for the Amazon Resource Name (ARN) of the Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable iamServiceRoleArn;

/**
 <p> The name for the Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> The platform for the Amplify app. </p>
 */
@property (nonatomic, assign) AWSAmplifyPlatform platform;

/**
 <p> Describes the information about a production branch of the Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyProductionBranch * _Nullable productionBranch;

/**
 <p> The repository for the Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable repository;

/**
 <p> The tag for the Amplify app. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p> Updates the date and time for the Amplify app. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 <p> Describes an artifact. </p>
 Required parameters: [artifactFileName, artifactId]
 */
@interface AWSAmplifyArtifact : AWSModel


/**
 <p> The file name for the artifact. </p>
 */
@property (nonatomic, strong) NSString * _Nullable artifactFileName;

/**
 <p> The unique ID for the artifact. </p>
 */
@property (nonatomic, strong) NSString * _Nullable artifactId;

@end

/**
 <p> Describes the automated branch creation configuration. </p>
 */
@interface AWSAmplifyAutoBranchCreationConfig : AWSModel


/**
 <p> The basic authorization credentials for the autocreated branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable basicAuthCredentials;

/**
 <p> The build specification (build spec) for the autocreated branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable buildSpec;

/**
 <p> Enables auto building for the autocreated branch. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableAutoBuild;

/**
 <p> Enables basic authorization for the autocreated branch. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableBasicAuth;

/**
 <p> Enables pull request preview for the autocreated branch. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enablePullRequestPreview;

/**
 <p> The environment variables for the autocreated branch. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable environmentVariables;

/**
 <p> The framework for the autocreated branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable framework;

/**
 <p> The Amplify environment name for the pull request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestEnvironmentName;

/**
 <p> Describes the current stage for the autocreated branch. </p>
 */
@property (nonatomic, assign) AWSAmplifyStage stage;

@end

/**
 <p> Describes the backend environment for an Amplify app. </p>
 Required parameters: [backendEnvironmentArn, environmentName, createTime, updateTime]
 */
@interface AWSAmplifyBackendEnvironment : AWSModel


/**
 <p> The Amazon Resource Name (ARN) for a backend environment that is part of an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable backendEnvironmentArn;

/**
 <p> The creation date and time for a backend environment that is part of an Amplify app. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p> The name of deployment artifacts. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentArtifacts;

/**
 <p> The name for a backend environment that is part of an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p> The AWS CloudFormation stack name of a backend environment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

/**
 <p> The last updated date and time for a backend environment that is part of an Amplify app. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 <p> The branch for an Amplify app, which maps to a third-party repository branch. </p>
 Required parameters: [branchArn, branchName, description, stage, displayName, enableNotification, createTime, updateTime, environmentVariables, enableAutoBuild, customDomains, framework, activeJobId, totalNumberOfJobs, enableBasicAuth, ttl, enablePullRequestPreview]
 */
@interface AWSAmplifyBranch : AWSModel


/**
 <p> The ID of the active job for a branch of an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable activeJobId;

/**
 <p> A list of custom resources that are linked to this branch. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable associatedResources;

/**
 <p> The Amazon Resource Name (ARN) for a backend environment that is part of an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable backendEnvironmentArn;

/**
 <p> The basic authorization credentials for a branch of an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable basicAuthCredentials;

/**
 <p> The Amazon Resource Name (ARN) for a branch that is part of an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable branchArn;

/**
 <p> The name for the branch that is part of an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p> The build specification (build spec) content for the branch of an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable buildSpec;

/**
 <p> The creation date and time for a branch that is part of an Amplify app. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p> The custom domains for a branch of an Amplify app. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable customDomains;

/**
 <p> The description for the branch that is part of an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> The destination branch if the branch is a pull request branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationBranch;

/**
 <p> The display name for the branch. This is used as the default domain prefix. </p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p> Enables auto-building on push for a branch of an Amplify app. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableAutoBuild;

/**
 <p> Enables basic authorization for a branch of an Amplify app. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableBasicAuth;

/**
 <p> Enables notifications for a branch that is part of an Amplify app. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableNotification;

/**
 <p> Enables pull request preview for the branch. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enablePullRequestPreview;

/**
 <p> The environment variables specific to a branch of an Amplify app. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable environmentVariables;

/**
 <p> The framework for a branch of an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable framework;

/**
 <p> The Amplify environment name for the pull request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestEnvironmentName;

/**
 <p> The source branch if the branch is a pull request branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceBranch;

/**
 <p> The current stage for the branch that is part of an Amplify app. </p>
 */
@property (nonatomic, assign) AWSAmplifyStage stage;

/**
 <p> The tag for the branch of an Amplify app. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p> The thumbnail URL for the branch of an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable thumbnailUrl;

/**
 <p> The total number of jobs that are part of an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable totalNumberOfJobs;

/**
 <p> The content Time to Live (TTL) for the website in seconds. </p>
 */
@property (nonatomic, strong) NSString * _Nullable ttl;

/**
 <p> The last updated date and time for a branch that is part of an Amplify app. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 <p> The request structure used to create apps in Amplify. </p>
 Required parameters: [name]
 */
@interface AWSAmplifyCreateAppRequest : AWSRequest


/**
 <p> The personal access token for a third-party source control system for an Amplify app. The personal access token is used to create a webhook and a read-only deploy key. The token is not stored. </p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p> The automated branch creation configuration for the Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyAutoBranchCreationConfig * _Nullable autoBranchCreationConfig;

/**
 <p> The automated branch creation glob patterns for the Amplify app. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoBranchCreationPatterns;

/**
 <p> The credentials for basic authorization for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable basicAuthCredentials;

/**
 <p> The build specification (build spec) for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable buildSpec;

/**
 <p> The custom rewrite and redirect rules for an Amplify app. </p>
 */
@property (nonatomic, strong) NSArray<AWSAmplifyCustomRule *> * _Nullable customRules;

/**
 <p> The description for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> Enables automated branch creation for the Amplify app. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableAutoBranchCreation;

/**
 <p> Enables basic authorization for an Amplify app. This will apply to all branches that are part of this app. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableBasicAuth;

/**
 <p> Enables the auto building of branches for an Amplify app. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableBranchAutoBuild;

/**
 <p> Automatically disconnects a branch in the Amplify Console when you delete a branch from your Git repository. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableBranchAutoDeletion;

/**
 <p> The environment variables map for an Amplify app. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable environmentVariables;

/**
 <p> The AWS Identity and Access Management (IAM) service role for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable iamServiceRoleArn;

/**
 <p> The name for the Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> The OAuth token for a third-party source control system for an Amplify app. The OAuth token is used to create a webhook and a read-only deploy key. The OAuth token is not stored. </p>
 */
@property (nonatomic, strong) NSString * _Nullable oauthToken;

/**
 <p> The platform or framework for an Amplify app. </p>
 */
@property (nonatomic, assign) AWSAmplifyPlatform platform;

/**
 <p> The repository for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable repository;

/**
 <p> The tag for an Amplify app. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAmplifyCreateAppResult : AWSModel


/**
 <p> Represents the different branches of a repository for building, deploying, and hosting an Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyApp * _Nullable app;

@end

/**
 <p> The request structure for the backend environment create request. </p>
 Required parameters: [appId, environmentName]
 */
@interface AWSAmplifyCreateBackendEnvironmentRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The name of deployment artifacts. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentArtifacts;

/**
 <p> The name for the backend environment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p> The AWS CloudFormation stack name of a backend environment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

@end

/**
 <p> The result structure for the create backend environment request. </p>
 Required parameters: [backendEnvironment]
 */
@interface AWSAmplifyCreateBackendEnvironmentResult : AWSModel


/**
 <p> Describes the backend environment for an Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyBackendEnvironment * _Nullable backendEnvironment;

@end

/**
 <p> The request structure for the create branch request. </p>
 Required parameters: [appId, branchName]
 */
@interface AWSAmplifyCreateBranchRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The Amazon Resource Name (ARN) for a backend environment that is part of an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable backendEnvironmentArn;

/**
 <p> The basic authorization credentials for the branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable basicAuthCredentials;

/**
 <p> The name for the branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p> The build specification (build spec) for the branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable buildSpec;

/**
 <p> The description for the branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> The display name for a branch. This is used as the default domain prefix. </p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p> Enables auto building for the branch. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableAutoBuild;

/**
 <p> Enables basic authorization for the branch. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableBasicAuth;

/**
 <p> Enables notifications for the branch. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableNotification;

/**
 <p> Enables pull request preview for this branch. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enablePullRequestPreview;

/**
 <p> The environment variables for the branch. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable environmentVariables;

/**
 <p> The framework for the branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable framework;

/**
 <p> The Amplify environment name for the pull request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestEnvironmentName;

/**
 <p> Describes the current stage for the branch. </p>
 */
@property (nonatomic, assign) AWSAmplifyStage stage;

/**
 <p> The tag for the branch. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p> The content Time To Live (TTL) for the website in seconds. </p>
 */
@property (nonatomic, strong) NSString * _Nullable ttl;

@end

/**
 <p> The result structure for create branch request. </p>
 Required parameters: [branch]
 */
@interface AWSAmplifyCreateBranchResult : AWSModel


/**
 <p> Describes the branch for an Amplify app, which maps to a third-party repository branch. </p>
 */
@property (nonatomic, strong) AWSAmplifyBranch * _Nullable branch;

@end

/**
 <p> The request structure for the create a new deployment request. </p>
 Required parameters: [appId, branchName]
 */
@interface AWSAmplifyCreateDeploymentRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The name for the branch, for the job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p> An optional file map that contains the file name as the key and the file content md5 hash as the value. If this argument is provided, the service will generate a unique upload URL per file. Otherwise, the service will only generate a single upload URL for the zipped files. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable fileMap;

@end

/**
 <p> The result structure for the create a new deployment request. </p>
 Required parameters: [fileUploadUrls, zipUploadUrl]
 */
@interface AWSAmplifyCreateDeploymentResult : AWSModel


/**
 <p> When the <code>fileMap</code> argument is provided in the request, <code>fileUploadUrls</code> will contain a map of file names to upload URLs. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable fileUploadUrls;

/**
 <p> The job ID for this deployment. will supply to start deployment api. </p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p> When the <code>fileMap</code> argument is not provided in the request, this <code>zipUploadUrl</code> is returned. </p>
 */
@property (nonatomic, strong) NSString * _Nullable zipUploadUrl;

@end

/**
 <p> The request structure for the create domain association request. </p>
 Required parameters: [appId, domainName, subDomainSettings]
 */
@interface AWSAmplifyCreateDomainAssociationRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> Sets the branch patterns for automatic subdomain creation. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoSubDomainCreationPatterns;

/**
 <p> The required AWS Identity and Access Management (IAM) service role for the Amazon Resource Name (ARN) for automatically creating subdomains. </p>
 */
@property (nonatomic, strong) NSString * _Nullable autoSubDomainIAMRole;

/**
 <p> The domain name for the domain association. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p> Enables the automated creation of subdomains for branches. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableAutoSubDomain;

/**
 <p> The setting for the subdomain. </p>
 */
@property (nonatomic, strong) NSArray<AWSAmplifySubDomainSetting *> * _Nullable subDomainSettings;

@end

/**
 <p> The result structure for the create domain association request. </p>
 Required parameters: [domainAssociation]
 */
@interface AWSAmplifyCreateDomainAssociationResult : AWSModel


/**
 <p> Describes the structure of a domain association, which associates a custom domain with an Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyDomainAssociation * _Nullable domainAssociation;

@end

/**
 <p> The request structure for the create webhook request. </p>
 Required parameters: [appId, branchName]
 */
@interface AWSAmplifyCreateWebhookRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The name for a branch that is part of an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p> The description for a webhook. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 <p> The result structure for the create webhook request. </p>
 Required parameters: [webhook]
 */
@interface AWSAmplifyCreateWebhookResult : AWSModel


/**
 <p> Describes a webhook that connects repository events to an Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyWebhook * _Nullable webhook;

@end

/**
 <p> Describes a custom rewrite or redirect rule. </p>
 Required parameters: [source, target]
 */
@interface AWSAmplifyCustomRule : AWSModel


/**
 <p> The condition for a URL rewrite or redirect rule, such as a country code. </p>
 */
@property (nonatomic, strong) NSString * _Nullable condition;

/**
 <p> The source pattern for a URL rewrite or redirect rule. </p>
 */
@property (nonatomic, strong) NSString * _Nullable source;

/**
 <p> The status code for a URL rewrite or redirect rule. </p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p> The target pattern for a URL rewrite or redirect rule. </p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

@end

/**
 <p> Describes the request structure for the delete app request. </p>
 Required parameters: [appId]
 */
@interface AWSAmplifyDeleteAppRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

@end

/**
 <p> The result structure for the delete app request. </p>
 Required parameters: [app]
 */
@interface AWSAmplifyDeleteAppResult : AWSModel


/**
 <p> Represents the different branches of a repository for building, deploying, and hosting an Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyApp * _Nullable app;

@end

/**
 <p> The request structure for the delete backend environment request. </p>
 Required parameters: [appId, environmentName]
 */
@interface AWSAmplifyDeleteBackendEnvironmentRequest : AWSRequest


/**
 <p> The unique ID of an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The name of a backend environment of an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

@end

/**
 <p> The result structure of the delete backend environment result. </p>
 Required parameters: [backendEnvironment]
 */
@interface AWSAmplifyDeleteBackendEnvironmentResult : AWSModel


/**
 <p> Describes the backend environment for an Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyBackendEnvironment * _Nullable backendEnvironment;

@end

/**
 <p> The request structure for the delete branch request. </p>
 Required parameters: [appId, branchName]
 */
@interface AWSAmplifyDeleteBranchRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The name for the branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

@end

/**
 <p> The result structure for the delete branch request. </p>
 Required parameters: [branch]
 */
@interface AWSAmplifyDeleteBranchResult : AWSModel


/**
 <p> The branch for an Amplify app, which maps to a third-party repository branch. </p>
 */
@property (nonatomic, strong) AWSAmplifyBranch * _Nullable branch;

@end

/**
 <p> The request structure for the delete domain association request. </p>
 Required parameters: [appId, domainName]
 */
@interface AWSAmplifyDeleteDomainAssociationRequest : AWSRequest


/**
 <p> The unique id for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The name of the domain. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 
 */
@interface AWSAmplifyDeleteDomainAssociationResult : AWSModel


/**
 <p> Describes a domain association that associates a custom domain with an Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyDomainAssociation * _Nullable domainAssociation;

@end

/**
 <p> The request structure for the delete job request. </p>
 Required parameters: [appId, branchName, jobId]
 */
@interface AWSAmplifyDeleteJobRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The name for the branch, for the job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p> The unique ID for the job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 <p> The result structure for the delete job request. </p>
 Required parameters: [jobSummary]
 */
@interface AWSAmplifyDeleteJobResult : AWSModel


/**
 <p> Describes the summary for an execution job for an Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyJobSummary * _Nullable jobSummary;

@end

/**
 <p> The request structure for the delete webhook request. </p>
 Required parameters: [webhookId]
 */
@interface AWSAmplifyDeleteWebhookRequest : AWSRequest


/**
 <p> The unique ID for a webhook. </p>
 */
@property (nonatomic, strong) NSString * _Nullable webhookId;

@end

/**
 <p> The result structure for the delete webhook request. </p>
 Required parameters: [webhook]
 */
@interface AWSAmplifyDeleteWebhookResult : AWSModel


/**
 <p> Describes a webhook that connects repository events to an Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyWebhook * _Nullable webhook;

@end

/**
 <p> Describes a domain association that associates a custom domain with an Amplify app. </p>
 Required parameters: [domainAssociationArn, domainName, enableAutoSubDomain, domainStatus, statusReason, subDomains]
 */
@interface AWSAmplifyDomainAssociation : AWSModel


/**
 <p> Sets branch patterns for automatic subdomain creation. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoSubDomainCreationPatterns;

/**
 <p> The required AWS Identity and Access Management (IAM) service role for the Amazon Resource Name (ARN) for automatically creating subdomains. </p>
 */
@property (nonatomic, strong) NSString * _Nullable autoSubDomainIAMRole;

/**
 <p> The DNS record for certificate verification. </p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateVerificationDNSRecord;

/**
 <p> The Amazon Resource Name (ARN) for the domain association. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domainAssociationArn;

/**
 <p> The name of the domain. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p> The current status of the domain association. </p>
 */
@property (nonatomic, assign) AWSAmplifyDomainStatus domainStatus;

/**
 <p> Enables the automated creation of subdomains for branches. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableAutoSubDomain;

/**
 <p> The reason for the current status of the domain association. </p>
 */
@property (nonatomic, strong) NSString * _Nullable statusReason;

/**
 <p> The subdomains for the domain association. </p>
 */
@property (nonatomic, strong) NSArray<AWSAmplifySubDomain *> * _Nullable subDomains;

@end

/**
 <p> The request structure for the generate access logs request. </p>
 Required parameters: [domainName, appId]
 */
@interface AWSAmplifyGenerateAccessLogsRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The name of the domain. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p> The time at which the logs should end. The time range specified is inclusive of the end time. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p> The time at which the logs should start. The time range specified is inclusive of the start time. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 <p> The result structure for the generate access logs request. </p>
 */
@interface AWSAmplifyGenerateAccessLogsResult : AWSModel


/**
 <p> The pre-signed URL for the requested access logs. </p>
 */
@property (nonatomic, strong) NSString * _Nullable logUrl;

@end

/**
 <p> The request structure for the get app request. </p>
 Required parameters: [appId]
 */
@interface AWSAmplifyGetAppRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

@end

/**
 
 */
@interface AWSAmplifyGetAppResult : AWSModel


/**
 <p> Represents the different branches of a repository for building, deploying, and hosting an Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyApp * _Nullable app;

@end

/**
 <p> Returns the request structure for the get artifact request. </p>
 Required parameters: [artifactId]
 */
@interface AWSAmplifyGetArtifactUrlRequest : AWSRequest


/**
 <p> The unique ID for an artifact. </p>
 */
@property (nonatomic, strong) NSString * _Nullable artifactId;

@end

/**
 <p> Returns the result structure for the get artifact request. </p>
 Required parameters: [artifactId, artifactUrl]
 */
@interface AWSAmplifyGetArtifactUrlResult : AWSModel


/**
 <p> The unique ID for an artifact. </p>
 */
@property (nonatomic, strong) NSString * _Nullable artifactId;

/**
 <p> The presigned URL for the artifact. </p>
 */
@property (nonatomic, strong) NSString * _Nullable artifactUrl;

@end

/**
 <p> The request structure for the get backend environment request. </p>
 Required parameters: [appId, environmentName]
 */
@interface AWSAmplifyGetBackendEnvironmentRequest : AWSRequest


/**
 <p> The unique id for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The name for the backend environment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

@end

/**
 <p> The result structure for the get backend environment result. </p>
 Required parameters: [backendEnvironment]
 */
@interface AWSAmplifyGetBackendEnvironmentResult : AWSModel


/**
 <p> Describes the backend environment for an Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyBackendEnvironment * _Nullable backendEnvironment;

@end

/**
 <p> The request structure for the get branch request. </p>
 Required parameters: [appId, branchName]
 */
@interface AWSAmplifyGetBranchRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The name for the branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

@end

/**
 
 */
@interface AWSAmplifyGetBranchResult : AWSModel


/**
 <p> The branch for an Amplify app, which maps to a third-party repository branch. </p>
 */
@property (nonatomic, strong) AWSAmplifyBranch * _Nullable branch;

@end

/**
 <p> The request structure for the get domain association request. </p>
 Required parameters: [appId, domainName]
 */
@interface AWSAmplifyGetDomainAssociationRequest : AWSRequest


/**
 <p> The unique id for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The name of the domain. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p> The result structure for the get domain association request. </p>
 Required parameters: [domainAssociation]
 */
@interface AWSAmplifyGetDomainAssociationResult : AWSModel


/**
 <p> Describes the structure of a domain association, which associates a custom domain with an Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyDomainAssociation * _Nullable domainAssociation;

@end

/**
 <p> The request structure for the get job request. </p>
 Required parameters: [appId, branchName, jobId]
 */
@interface AWSAmplifyGetJobRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The branch name for the job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p> The unique ID for the job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSAmplifyGetJobResult : AWSModel


/**
 <p> Describes an execution job for an Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyJob * _Nullable job;

@end

/**
 <p> The request structure for the get webhook request. </p>
 Required parameters: [webhookId]
 */
@interface AWSAmplifyGetWebhookRequest : AWSRequest


/**
 <p> The unique ID for a webhook. </p>
 */
@property (nonatomic, strong) NSString * _Nullable webhookId;

@end

/**
 <p> The result structure for the get webhook request. </p>
 Required parameters: [webhook]
 */
@interface AWSAmplifyGetWebhookResult : AWSModel


/**
 <p> Describes the structure of a webhook. </p>
 */
@property (nonatomic, strong) AWSAmplifyWebhook * _Nullable webhook;

@end

/**
 <p> Describes an execution job for an Amplify app. </p>
 Required parameters: [summary, steps]
 */
@interface AWSAmplifyJob : AWSModel


/**
 <p> The execution steps for an execution job, for an Amplify app. </p>
 */
@property (nonatomic, strong) NSArray<AWSAmplifyStep *> * _Nullable steps;

/**
 <p> Describes the summary for an execution job for an Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyJobSummary * _Nullable summary;

@end

/**
 <p> Describes the summary for an execution job for an Amplify app. </p>
 Required parameters: [jobArn, jobId, commitId, commitMessage, commitTime, startTime, status, jobType]
 */
@interface AWSAmplifyJobSummary : AWSModel


/**
 <p> The commit ID from a third-party repository provider for the job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable commitId;

/**
 <p> The commit message from a third-party repository provider for the job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable commitMessage;

/**
 <p> The commit date and time for the job. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable commitTime;

/**
 <p> The end date and time for the job. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p> The Amazon Resource Name (ARN) for the job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p> The unique ID for the job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p> The type for the job. If the value is <code>RELEASE</code>, the job was manually released from its source by using the <code>StartJob</code> API. If the value is <code>RETRY</code>, the job was manually retried using the <code>StartJob</code> API. If the value is <code>WEB_HOOK</code>, the job was automatically triggered by webhooks. </p>
 */
@property (nonatomic, assign) AWSAmplifyJobType jobType;

/**
 <p> The start date and time for the job. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p> The current status for the job. </p>
 */
@property (nonatomic, assign) AWSAmplifyJobStatus status;

@end

/**
 <p> The request structure for the list apps request. </p>
 */
@interface AWSAmplifyListAppsRequest : AWSRequest


/**
 <p> The maximum number of records to list in a single response. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> A pagination token. If non-null, the pagination token is returned in a result. Pass its value in another request to retrieve more entries. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> The result structure for an Amplify app list request. </p>
 Required parameters: [apps]
 */
@interface AWSAmplifyListAppsResult : AWSModel


/**
 <p> A list of Amplify apps. </p>
 */
@property (nonatomic, strong) NSArray<AWSAmplifyApp *> * _Nullable apps;

/**
 <p> A pagination token. Set to null to start listing apps from start. If non-null, the pagination token is returned in a result. Pass its value in here to list more projects. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> Describes the request structure for the list artifacts request. </p>
 Required parameters: [appId, branchName, jobId]
 */
@interface AWSAmplifyListArtifactsRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The name of a branch that is part of an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p> The unique ID for a job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p> The maximum number of records to list in a single response. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> A pagination token. Set to null to start listing artifacts from start. If a non-null pagination token is returned in a result, pass its value in here to list more artifacts. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> The result structure for the list artifacts request. </p>
 Required parameters: [artifacts]
 */
@interface AWSAmplifyListArtifactsResult : AWSModel


/**
 <p> A list of artifacts. </p>
 */
@property (nonatomic, strong) NSArray<AWSAmplifyArtifact *> * _Nullable artifacts;

/**
 <p> A pagination token. If a non-null pagination token is returned in a result, pass its value in another request to retrieve more entries. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> The request structure for the list backend environments request. </p>
 Required parameters: [appId]
 */
@interface AWSAmplifyListBackendEnvironmentsRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The name of the backend environment </p>
 */
@property (nonatomic, strong) NSString * _Nullable environmentName;

/**
 <p> The maximum number of records to list in a single response. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> A pagination token. Set to null to start listing backend environments from the start. If a non-null pagination token is returned in a result, pass its value in here to list more backend environments. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> The result structure for the list backend environments result. </p>
 Required parameters: [backendEnvironments]
 */
@interface AWSAmplifyListBackendEnvironmentsResult : AWSModel


/**
 <p> The list of backend environments for an Amplify app. </p>
 */
@property (nonatomic, strong) NSArray<AWSAmplifyBackendEnvironment *> * _Nullable backendEnvironments;

/**
 <p> A pagination token. If a non-null pagination token is returned in a result, pass its value in another request to retrieve more entries. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> The request structure for the list branches request. </p>
 Required parameters: [appId]
 */
@interface AWSAmplifyListBranchesRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The maximum number of records to list in a single response. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> A pagination token. Set to null to start listing branches from the start. If a non-null pagination token is returned in a result, pass its value in here to list more branches. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> The result structure for the list branches request. </p>
 Required parameters: [branches]
 */
@interface AWSAmplifyListBranchesResult : AWSModel


/**
 <p> A list of branches for an Amplify app. </p>
 */
@property (nonatomic, strong) NSArray<AWSAmplifyBranch *> * _Nullable branches;

/**
 <p> A pagination token. If a non-null pagination token is returned in a result, pass its value in another request to retrieve more entries. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> The request structure for the list domain associations request. </p>
 Required parameters: [appId]
 */
@interface AWSAmplifyListDomainAssociationsRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The maximum number of records to list in a single response. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> A pagination token. Set to null to start listing apps from the start. If non-null, a pagination token is returned in a result. Pass its value in here to list more projects. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> The result structure for the list domain association request. </p>
 Required parameters: [domainAssociations]
 */
@interface AWSAmplifyListDomainAssociationsResult : AWSModel


/**
 <p> A list of domain associations. </p>
 */
@property (nonatomic, strong) NSArray<AWSAmplifyDomainAssociation *> * _Nullable domainAssociations;

/**
 <p> A pagination token. If non-null, a pagination token is returned in a result. Pass its value in another request to retrieve more entries. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> The request structure for the list jobs request. </p>
 Required parameters: [appId, branchName]
 */
@interface AWSAmplifyListJobsRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The name for a branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p> The maximum number of records to list in a single response. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> A pagination token. Set to null to start listing steps from the start. If a non-null pagination token is returned in a result, pass its value in here to list more steps. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> The maximum number of records to list in a single response. </p>
 Required parameters: [jobSummaries]
 */
@interface AWSAmplifyListJobsResult : AWSModel


/**
 <p> The result structure for the list job result request. </p>
 */
@property (nonatomic, strong) NSArray<AWSAmplifyJobSummary *> * _Nullable jobSummaries;

/**
 <p> A pagination token. If non-null the pagination token is returned in a result. Pass its value in another request to retrieve more entries. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> The request structure to use to list tags for a resource. </p>
 Required parameters: [resourceArn]
 */
@interface AWSAmplifyListTagsForResourceRequest : AWSRequest


/**
 <p> The Amazon Resource Name (ARN) to use to list tags. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 <p> The response for the list tags for resource request. </p>
 */
@interface AWSAmplifyListTagsForResourceResponse : AWSModel


/**
 <p> A list of tags for the specified The Amazon Resource Name (ARN). </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p> The request structure for the list webhooks request. </p>
 Required parameters: [appId]
 */
@interface AWSAmplifyListWebhooksRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The maximum number of records to list in a single response. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> A pagination token. Set to null to start listing webhooks from the start. If non-null,the pagination token is returned in a result. Pass its value in here to list more webhooks. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> The result structure for the list webhooks request. </p>
 Required parameters: [webhooks]
 */
@interface AWSAmplifyListWebhooksResult : AWSModel


/**
 <p> A pagination token. If non-null, the pagination token is returned in a result. Pass its value in another request to retrieve more entries. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> A list of webhooks. </p>
 */
@property (nonatomic, strong) NSArray<AWSAmplifyWebhook *> * _Nullable webhooks;

@end

/**
 <p> Describes the information about a production branch for an Amplify app. </p>
 */
@interface AWSAmplifyProductionBranch : AWSModel


/**
 <p> The branch name for the production branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p> The last deploy time of the production branch. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastDeployTime;

/**
 <p> The status of the production branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p> The thumbnail URL for the production branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable thumbnailUrl;

@end

/**
 <p> The request structure for the start a deployment request. </p>
 Required parameters: [appId, branchName]
 */
@interface AWSAmplifyStartDeploymentRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The name for the branch, for the job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p> The job ID for this deployment, generated by the create deployment request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p> The source URL for this deployment, used when calling start deployment without create deployment. The source URL can be any HTTP GET URL that is publicly accessible and downloads a single .zip file. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceUrl;

@end

/**
 <p> The result structure for the start a deployment request. </p>
 Required parameters: [jobSummary]
 */
@interface AWSAmplifyStartDeploymentResult : AWSModel


/**
 <p> The summary for the job. </p>
 */
@property (nonatomic, strong) AWSAmplifyJobSummary * _Nullable jobSummary;

@end

/**
 <p> The request structure for the start job request. </p>
 Required parameters: [appId, branchName, jobType]
 */
@interface AWSAmplifyStartJobRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The branch name for the job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p> The commit ID from a third-party repository provider for the job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable commitId;

/**
 <p> The commit message from a third-party repository provider for the job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable commitMessage;

/**
 <p> The commit date and time for the job. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable commitTime;

/**
 <p> The unique ID for an existing job. This is required if the value of <code>jobType</code> is <code>RETRY</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p> A descriptive reason for starting this job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable jobReason;

/**
 <p> Describes the type for the job. The job type <code>RELEASE</code> starts a new job with the latest change from the specified branch. This value is available only for apps that are connected to a repository. The job type <code>RETRY</code> retries an existing job. If the job type value is <code>RETRY</code>, the <code>jobId</code> is also required. </p>
 */
@property (nonatomic, assign) AWSAmplifyJobType jobType;

@end

/**
 <p> The result structure for the run job request. </p>
 Required parameters: [jobSummary]
 */
@interface AWSAmplifyStartJobResult : AWSModel


/**
 <p> The summary for the job. </p>
 */
@property (nonatomic, strong) AWSAmplifyJobSummary * _Nullable jobSummary;

@end

/**
 <p> Describes an execution step, for an execution job, for an Amplify app. </p>
 Required parameters: [stepName, startTime, status, endTime]
 */
@interface AWSAmplifyStep : AWSModel


/**
 <p> The URL to the artifact for the execution step. </p>
 */
@property (nonatomic, strong) NSString * _Nullable artifactsUrl;

/**
 <p> The context for the current step. Includes a build image if the step is build. </p>
 */
@property (nonatomic, strong) NSString * _Nullable context;

/**
 <p> The end date and time of the execution step. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p> The URL to the logs for the execution step. </p>
 */
@property (nonatomic, strong) NSString * _Nullable logUrl;

/**
 <p> The list of screenshot URLs for the execution step, if relevant. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable screenshots;

/**
 <p> The start date and time of the execution step. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p> The status of the execution step. </p>
 */
@property (nonatomic, assign) AWSAmplifyJobStatus status;

/**
 <p> The reason for the current step status. </p>
 */
@property (nonatomic, strong) NSString * _Nullable statusReason;

/**
 <p> The name of the execution step. </p>
 */
@property (nonatomic, strong) NSString * _Nullable stepName;

/**
 <p> The URL to the test artifact for the execution step. </p>
 */
@property (nonatomic, strong) NSString * _Nullable testArtifactsUrl;

/**
 <p> The URL to the test configuration for the execution step. </p>
 */
@property (nonatomic, strong) NSString * _Nullable testConfigUrl;

@end

/**
 <p> The request structure for the stop job request. </p>
 Required parameters: [appId, branchName, jobId]
 */
@interface AWSAmplifyStopJobRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The name for the branch, for the job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p> The unique id for the job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 <p> The result structure for the stop job request. </p>
 Required parameters: [jobSummary]
 */
@interface AWSAmplifyStopJobResult : AWSModel


/**
 <p> The summary for the job. </p>
 */
@property (nonatomic, strong) AWSAmplifyJobSummary * _Nullable jobSummary;

@end

/**
 <p> The subdomain for the domain association. </p>
 Required parameters: [subDomainSetting, verified, dnsRecord]
 */
@interface AWSAmplifySubDomain : AWSModel


/**
 <p> The DNS record for the subdomain. </p>
 */
@property (nonatomic, strong) NSString * _Nullable dnsRecord;

/**
 <p> Describes the settings for the subdomain. </p>
 */
@property (nonatomic, strong) AWSAmplifySubDomainSetting * _Nullable subDomainSetting;

/**
 <p> The verified status of the subdomain </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable verified;

@end

/**
 <p> Describes the settings for the subdomain. </p>
 Required parameters: [prefix, branchName]
 */
@interface AWSAmplifySubDomainSetting : AWSModel


/**
 <p> The branch name setting for the subdomain. </p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p> The prefix setting for the subdomain. </p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 <p> The request structure to tag a resource with a tag key and value. </p>
 Required parameters: [resourceArn, tags]
 */
@interface AWSAmplifyTagResourceRequest : AWSRequest


/**
 <p> The Amazon Resource Name (ARN) to use to tag a resource. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p> The tags used to tag the resource. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p> The response for the tag resource request. </p>
 */
@interface AWSAmplifyTagResourceResponse : AWSModel


@end

/**
 <p> The request structure for the untag resource request. </p>
 Required parameters: [resourceArn, tagKeys]
 */
@interface AWSAmplifyUntagResourceRequest : AWSRequest


/**
 <p> The Amazon Resource Name (ARN) to use to untag a resource. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p> The tag keys to use to untag a resource. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 <p> The response for the untag resource request. </p>
 */
@interface AWSAmplifyUntagResourceResponse : AWSModel


@end

/**
 <p> The request structure for the update app request. </p>
 Required parameters: [appId]
 */
@interface AWSAmplifyUpdateAppRequest : AWSRequest


/**
 <p> The personal access token for a third-party source control system for an Amplify app. The token is used to create webhook and a read-only deploy key. The token is not stored. </p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The automated branch creation configuration for the Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyAutoBranchCreationConfig * _Nullable autoBranchCreationConfig;

/**
 <p> Describes the automated branch creation glob patterns for the Amplify app. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoBranchCreationPatterns;

/**
 <p> The basic authorization credentials for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable basicAuthCredentials;

/**
 <p> The build specification (build spec) for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable buildSpec;

/**
 <p> The custom redirect and rewrite rules for an Amplify app. </p>
 */
@property (nonatomic, strong) NSArray<AWSAmplifyCustomRule *> * _Nullable customRules;

/**
 <p> The description for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> Enables automated branch creation for the Amplify app. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableAutoBranchCreation;

/**
 <p> Enables basic authorization for an Amplify app. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableBasicAuth;

/**
 <p> Enables branch auto-building for an Amplify app. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableBranchAutoBuild;

/**
 <p> Automatically disconnects a branch in the Amplify Console when you delete a branch from your Git repository. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableBranchAutoDeletion;

/**
 <p> The environment variables for an Amplify app. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable environmentVariables;

/**
 <p> The AWS Identity and Access Management (IAM) service role for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable iamServiceRoleArn;

/**
 <p> The name for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> The OAuth token for a third-party source control system for an Amplify app. The token is used to create a webhook and a read-only deploy key. The OAuth token is not stored. </p>
 */
@property (nonatomic, strong) NSString * _Nullable oauthToken;

/**
 <p> The platform for an Amplify app. </p>
 */
@property (nonatomic, assign) AWSAmplifyPlatform platform;

/**
 <p> The name of the repository for an Amplify app </p>
 */
@property (nonatomic, strong) NSString * _Nullable repository;

@end

/**
 <p> The result structure for an Amplify app update request. </p>
 Required parameters: [app]
 */
@interface AWSAmplifyUpdateAppResult : AWSModel


/**
 <p> Represents the updated Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyApp * _Nullable app;

@end

/**
 <p> The request structure for the update branch request. </p>
 Required parameters: [appId, branchName]
 */
@interface AWSAmplifyUpdateBranchRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> The Amazon Resource Name (ARN) for a backend environment that is part of an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable backendEnvironmentArn;

/**
 <p> The basic authorization credentials for the branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable basicAuthCredentials;

/**
 <p> The name for the branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p> The build specification (build spec) for the branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable buildSpec;

/**
 <p> The description for the branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> The display name for a branch. This is used as the default domain prefix. </p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p> Enables auto building for the branch. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableAutoBuild;

/**
 <p> Enables basic authorization for the branch. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableBasicAuth;

/**
 <p> Enables notifications for the branch. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableNotification;

/**
 <p> Enables pull request preview for this branch. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enablePullRequestPreview;

/**
 <p> The environment variables for the branch. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable environmentVariables;

/**
 <p> The framework for the branch. </p>
 */
@property (nonatomic, strong) NSString * _Nullable framework;

/**
 <p> The Amplify environment name for the pull request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestEnvironmentName;

/**
 <p> Describes the current stage for the branch. </p>
 */
@property (nonatomic, assign) AWSAmplifyStage stage;

/**
 <p> The content Time to Live (TTL) for the website in seconds. </p>
 */
@property (nonatomic, strong) NSString * _Nullable ttl;

@end

/**
 <p> The result structure for the update branch request. </p>
 Required parameters: [branch]
 */
@interface AWSAmplifyUpdateBranchResult : AWSModel


/**
 <p> The branch for an Amplify app, which maps to a third-party repository branch. </p>
 */
@property (nonatomic, strong) AWSAmplifyBranch * _Nullable branch;

@end

/**
 <p> The request structure for the update domain association request. </p>
 Required parameters: [appId, domainName, subDomainSettings]
 */
@interface AWSAmplifyUpdateDomainAssociationRequest : AWSRequest


/**
 <p> The unique ID for an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable appId;

/**
 <p> Sets the branch patterns for automatic subdomain creation. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoSubDomainCreationPatterns;

/**
 <p> The required AWS Identity and Access Management (IAM) service role for the Amazon Resource Name (ARN) for automatically creating subdomains. </p>
 */
@property (nonatomic, strong) NSString * _Nullable autoSubDomainIAMRole;

/**
 <p> The name of the domain. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p> Enables the automated creation of subdomains for branches. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableAutoSubDomain;

/**
 <p> Describes the settings for the subdomain. </p>
 */
@property (nonatomic, strong) NSArray<AWSAmplifySubDomainSetting *> * _Nullable subDomainSettings;

@end

/**
 <p> The result structure for the update domain association request. </p>
 Required parameters: [domainAssociation]
 */
@interface AWSAmplifyUpdateDomainAssociationResult : AWSModel


/**
 <p> Describes a domain association, which associates a custom domain with an Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyDomainAssociation * _Nullable domainAssociation;

@end

/**
 <p> The request structure for the update webhook request. </p>
 Required parameters: [webhookId]
 */
@interface AWSAmplifyUpdateWebhookRequest : AWSRequest


/**
 <p> The name for a branch that is part of an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p> The description for a webhook. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> The unique ID for a webhook. </p>
 */
@property (nonatomic, strong) NSString * _Nullable webhookId;

@end

/**
 <p> The result structure for the update webhook request. </p>
 Required parameters: [webhook]
 */
@interface AWSAmplifyUpdateWebhookResult : AWSModel


/**
 <p> Describes a webhook that connects repository events to an Amplify app. </p>
 */
@property (nonatomic, strong) AWSAmplifyWebhook * _Nullable webhook;

@end

/**
 <p> Describes a webhook that connects repository events to an Amplify app. </p>
 Required parameters: [webhookArn, webhookId, webhookUrl, branchName, description, createTime, updateTime]
 */
@interface AWSAmplifyWebhook : AWSModel


/**
 <p> The name for a branch that is part of an Amplify app. </p>
 */
@property (nonatomic, strong) NSString * _Nullable branchName;

/**
 <p> The create date and time for a webhook. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p> The description for a webhook. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> Updates the date and time for a webhook. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

/**
 <p> The Amazon Resource Name (ARN) for the webhook. </p>
 */
@property (nonatomic, strong) NSString * _Nullable webhookArn;

/**
 <p> The ID of the webhook. </p>
 */
@property (nonatomic, strong) NSString * _Nullable webhookId;

/**
 <p> The URL of the webhook. </p>
 */
@property (nonatomic, strong) NSString * _Nullable webhookUrl;

@end

NS_ASSUME_NONNULL_END
