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

FOUNDATION_EXPORT NSString *const AWSCodeBuildErrorDomain;

typedef NS_ENUM(NSInteger, AWSCodeBuildErrorType) {
    AWSCodeBuildErrorUnknown,
    AWSCodeBuildErrorAccountLimitExceeded,
    AWSCodeBuildErrorInvalidInput,
    AWSCodeBuildErrorOAuthProvider,
    AWSCodeBuildErrorResourceAlreadyExists,
    AWSCodeBuildErrorResourceNotFound,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildArtifactNamespace) {
    AWSCodeBuildArtifactNamespaceUnknown,
    AWSCodeBuildArtifactNamespaceNone,
    AWSCodeBuildArtifactNamespaceBuildId,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildArtifactPackaging) {
    AWSCodeBuildArtifactPackagingUnknown,
    AWSCodeBuildArtifactPackagingNone,
    AWSCodeBuildArtifactPackagingZip,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildArtifactsType) {
    AWSCodeBuildArtifactsTypeUnknown,
    AWSCodeBuildArtifactsTypeCodepipeline,
    AWSCodeBuildArtifactsTypeS3,
    AWSCodeBuildArtifactsTypeNoArtifacts,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildAuthType) {
    AWSCodeBuildAuthTypeUnknown,
    AWSCodeBuildAuthTypeOauth,
    AWSCodeBuildAuthTypeBasicAuth,
    AWSCodeBuildAuthTypePersonalAccessToken,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildBuildPhaseType) {
    AWSCodeBuildBuildPhaseTypeUnknown,
    AWSCodeBuildBuildPhaseTypeSubmitted,
    AWSCodeBuildBuildPhaseTypeQueued,
    AWSCodeBuildBuildPhaseTypeProvisioning,
    AWSCodeBuildBuildPhaseTypeDownloadSource,
    AWSCodeBuildBuildPhaseTypeInstall,
    AWSCodeBuildBuildPhaseTypePreBuild,
    AWSCodeBuildBuildPhaseTypeBuild,
    AWSCodeBuildBuildPhaseTypePostBuild,
    AWSCodeBuildBuildPhaseTypeUploadArtifacts,
    AWSCodeBuildBuildPhaseTypeFinalizing,
    AWSCodeBuildBuildPhaseTypeCompleted,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildCacheMode) {
    AWSCodeBuildCacheModeUnknown,
    AWSCodeBuildCacheModeLocalDockerLayerCache,
    AWSCodeBuildCacheModeLocalSourceCache,
    AWSCodeBuildCacheModeLocalCustomCache,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildCacheType) {
    AWSCodeBuildCacheTypeUnknown,
    AWSCodeBuildCacheTypeNoCache,
    AWSCodeBuildCacheTypeS3,
    AWSCodeBuildCacheTypeLocal,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildComputeType) {
    AWSCodeBuildComputeTypeUnknown,
    AWSCodeBuildComputeTypeBuildGeneral1Small,
    AWSCodeBuildComputeTypeBuildGeneral1Medium,
    AWSCodeBuildComputeTypeBuildGeneral1Large,
    AWSCodeBuildComputeTypeBuildGeneral12xlarge,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildCredentialProviderType) {
    AWSCodeBuildCredentialProviderTypeUnknown,
    AWSCodeBuildCredentialProviderTypeSecretsManager,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildEnvironmentType) {
    AWSCodeBuildEnvironmentTypeUnknown,
    AWSCodeBuildEnvironmentTypeWindowsContainer,
    AWSCodeBuildEnvironmentTypeLinuxContainer,
    AWSCodeBuildEnvironmentTypeLinuxGpuContainer,
    AWSCodeBuildEnvironmentTypeArmContainer,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildEnvironmentVariableType) {
    AWSCodeBuildEnvironmentVariableTypeUnknown,
    AWSCodeBuildEnvironmentVariableTypePlaintext,
    AWSCodeBuildEnvironmentVariableTypeParameterStore,
    AWSCodeBuildEnvironmentVariableTypeSecretsManager,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildFileSystemType) {
    AWSCodeBuildFileSystemTypeUnknown,
    AWSCodeBuildFileSystemTypeEfs,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildImagePullCredentialsType) {
    AWSCodeBuildImagePullCredentialsTypeUnknown,
    AWSCodeBuildImagePullCredentialsTypeCodebuild,
    AWSCodeBuildImagePullCredentialsTypeServiceRole,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildLanguageType) {
    AWSCodeBuildLanguageTypeUnknown,
    AWSCodeBuildLanguageTypeJava,
    AWSCodeBuildLanguageTypePython,
    AWSCodeBuildLanguageTypeNodeJs,
    AWSCodeBuildLanguageTypeRuby,
    AWSCodeBuildLanguageTypeGolang,
    AWSCodeBuildLanguageTypeDocker,
    AWSCodeBuildLanguageTypeAndroid,
    AWSCodeBuildLanguageTypeDotnet,
    AWSCodeBuildLanguageTypeBase,
    AWSCodeBuildLanguageTypePhp,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildLogsConfigStatusType) {
    AWSCodeBuildLogsConfigStatusTypeUnknown,
    AWSCodeBuildLogsConfigStatusTypeEnabled,
    AWSCodeBuildLogsConfigStatusTypeDisabled,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildPlatformType) {
    AWSCodeBuildPlatformTypeUnknown,
    AWSCodeBuildPlatformTypeDebian,
    AWSCodeBuildPlatformTypeAmazonLinux,
    AWSCodeBuildPlatformTypeUbuntu,
    AWSCodeBuildPlatformTypeWindowsServer,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildProjectSortByType) {
    AWSCodeBuildProjectSortByTypeUnknown,
    AWSCodeBuildProjectSortByTypeName,
    AWSCodeBuildProjectSortByTypeCreatedTime,
    AWSCodeBuildProjectSortByTypeLastModifiedTime,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildReportExportConfigType) {
    AWSCodeBuildReportExportConfigTypeUnknown,
    AWSCodeBuildReportExportConfigTypeS3,
    AWSCodeBuildReportExportConfigTypeNoExport,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildReportGroupSortByType) {
    AWSCodeBuildReportGroupSortByTypeUnknown,
    AWSCodeBuildReportGroupSortByTypeName,
    AWSCodeBuildReportGroupSortByTypeCreatedTime,
    AWSCodeBuildReportGroupSortByTypeLastModifiedTime,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildReportPackagingType) {
    AWSCodeBuildReportPackagingTypeUnknown,
    AWSCodeBuildReportPackagingTypeZip,
    AWSCodeBuildReportPackagingTypeNone,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildReportStatusType) {
    AWSCodeBuildReportStatusTypeUnknown,
    AWSCodeBuildReportStatusTypeGenerating,
    AWSCodeBuildReportStatusTypeSucceeded,
    AWSCodeBuildReportStatusTypeFailed,
    AWSCodeBuildReportStatusTypeIncomplete,
    AWSCodeBuildReportStatusTypeDeleting,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildReportType) {
    AWSCodeBuildReportTypeUnknown,
    AWSCodeBuildReportTypeTest,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildServerType) {
    AWSCodeBuildServerTypeUnknown,
    AWSCodeBuildServerTypeGithub,
    AWSCodeBuildServerTypeBitbucket,
    AWSCodeBuildServerTypeGithubEnterprise,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildSharedResourceSortByType) {
    AWSCodeBuildSharedResourceSortByTypeUnknown,
    AWSCodeBuildSharedResourceSortByTypeArn,
    AWSCodeBuildSharedResourceSortByTypeModifiedTime,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildSortOrderType) {
    AWSCodeBuildSortOrderTypeUnknown,
    AWSCodeBuildSortOrderTypeAscending,
    AWSCodeBuildSortOrderTypeDescending,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildSourceAuthType) {
    AWSCodeBuildSourceAuthTypeUnknown,
    AWSCodeBuildSourceAuthTypeOauth,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildSourceType) {
    AWSCodeBuildSourceTypeUnknown,
    AWSCodeBuildSourceTypeCodecommit,
    AWSCodeBuildSourceTypeCodepipeline,
    AWSCodeBuildSourceTypeGithub,
    AWSCodeBuildSourceTypeS3,
    AWSCodeBuildSourceTypeBitbucket,
    AWSCodeBuildSourceTypeGithubEnterprise,
    AWSCodeBuildSourceTypeNoSource,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildStatusType) {
    AWSCodeBuildStatusTypeUnknown,
    AWSCodeBuildStatusTypeSucceeded,
    AWSCodeBuildStatusTypeFailed,
    AWSCodeBuildStatusTypeFault,
    AWSCodeBuildStatusTypeTimedOut,
    AWSCodeBuildStatusTypeInProgress,
    AWSCodeBuildStatusTypeStopped,
};

typedef NS_ENUM(NSInteger, AWSCodeBuildWebhookFilterType) {
    AWSCodeBuildWebhookFilterTypeUnknown,
    AWSCodeBuildWebhookFilterTypeEvent,
    AWSCodeBuildWebhookFilterTypeBaseRef,
    AWSCodeBuildWebhookFilterTypeHeadRef,
    AWSCodeBuildWebhookFilterTypeActorAccountId,
    AWSCodeBuildWebhookFilterTypeFilePath,
    AWSCodeBuildWebhookFilterTypeCommitMessage,
};

@class AWSCodeBuildBatchDeleteBuildsInput;
@class AWSCodeBuildBatchDeleteBuildsOutput;
@class AWSCodeBuildBatchGetBuildsInput;
@class AWSCodeBuildBatchGetBuildsOutput;
@class AWSCodeBuildBatchGetProjectsInput;
@class AWSCodeBuildBatchGetProjectsOutput;
@class AWSCodeBuildBatchGetReportGroupsInput;
@class AWSCodeBuildBatchGetReportGroupsOutput;
@class AWSCodeBuildBatchGetReportsInput;
@class AWSCodeBuildBatchGetReportsOutput;
@class AWSCodeBuildBuild;
@class AWSCodeBuildBuildArtifacts;
@class AWSCodeBuildBuildNotDeleted;
@class AWSCodeBuildBuildPhase;
@class AWSCodeBuildCloudWatchLogsConfig;
@class AWSCodeBuildCreateProjectInput;
@class AWSCodeBuildCreateProjectOutput;
@class AWSCodeBuildCreateReportGroupInput;
@class AWSCodeBuildCreateReportGroupOutput;
@class AWSCodeBuildCreateWebhookInput;
@class AWSCodeBuildCreateWebhookOutput;
@class AWSCodeBuildDeleteProjectInput;
@class AWSCodeBuildDeleteProjectOutput;
@class AWSCodeBuildDeleteReportGroupInput;
@class AWSCodeBuildDeleteReportGroupOutput;
@class AWSCodeBuildDeleteReportInput;
@class AWSCodeBuildDeleteReportOutput;
@class AWSCodeBuildDeleteResourcePolicyInput;
@class AWSCodeBuildDeleteResourcePolicyOutput;
@class AWSCodeBuildDeleteSourceCredentialsInput;
@class AWSCodeBuildDeleteSourceCredentialsOutput;
@class AWSCodeBuildDeleteWebhookInput;
@class AWSCodeBuildDeleteWebhookOutput;
@class AWSCodeBuildDescribeTestCasesInput;
@class AWSCodeBuildDescribeTestCasesOutput;
@class AWSCodeBuildEnvironmentImage;
@class AWSCodeBuildEnvironmentLanguage;
@class AWSCodeBuildEnvironmentPlatform;
@class AWSCodeBuildEnvironmentVariable;
@class AWSCodeBuildExportedEnvironmentVariable;
@class AWSCodeBuildGetResourcePolicyInput;
@class AWSCodeBuildGetResourcePolicyOutput;
@class AWSCodeBuildGitSubmodulesConfig;
@class AWSCodeBuildImportSourceCredentialsInput;
@class AWSCodeBuildImportSourceCredentialsOutput;
@class AWSCodeBuildInvalidateProjectCacheInput;
@class AWSCodeBuildInvalidateProjectCacheOutput;
@class AWSCodeBuildListBuildsForProjectInput;
@class AWSCodeBuildListBuildsForProjectOutput;
@class AWSCodeBuildListBuildsInput;
@class AWSCodeBuildListBuildsOutput;
@class AWSCodeBuildListCuratedEnvironmentImagesInput;
@class AWSCodeBuildListCuratedEnvironmentImagesOutput;
@class AWSCodeBuildListProjectsInput;
@class AWSCodeBuildListProjectsOutput;
@class AWSCodeBuildListReportGroupsInput;
@class AWSCodeBuildListReportGroupsOutput;
@class AWSCodeBuildListReportsForReportGroupInput;
@class AWSCodeBuildListReportsForReportGroupOutput;
@class AWSCodeBuildListReportsInput;
@class AWSCodeBuildListReportsOutput;
@class AWSCodeBuildListSharedProjectsInput;
@class AWSCodeBuildListSharedProjectsOutput;
@class AWSCodeBuildListSharedReportGroupsInput;
@class AWSCodeBuildListSharedReportGroupsOutput;
@class AWSCodeBuildListSourceCredentialsInput;
@class AWSCodeBuildListSourceCredentialsOutput;
@class AWSCodeBuildLogsConfig;
@class AWSCodeBuildLogsLocation;
@class AWSCodeBuildNetworkInterface;
@class AWSCodeBuildPhaseContext;
@class AWSCodeBuildProject;
@class AWSCodeBuildProjectArtifacts;
@class AWSCodeBuildProjectBadge;
@class AWSCodeBuildProjectCache;
@class AWSCodeBuildProjectEnvironment;
@class AWSCodeBuildProjectFileSystemLocation;
@class AWSCodeBuildProjectSource;
@class AWSCodeBuildProjectSourceVersion;
@class AWSCodeBuildPutResourcePolicyInput;
@class AWSCodeBuildPutResourcePolicyOutput;
@class AWSCodeBuildRegistryCredential;
@class AWSCodeBuildReport;
@class AWSCodeBuildReportExportConfig;
@class AWSCodeBuildReportFilter;
@class AWSCodeBuildReportGroup;
@class AWSCodeBuildS3LogsConfig;
@class AWSCodeBuildS3ReportExportConfig;
@class AWSCodeBuildSourceAuth;
@class AWSCodeBuildSourceCredentialsInfo;
@class AWSCodeBuildStartBuildInput;
@class AWSCodeBuildStartBuildOutput;
@class AWSCodeBuildStopBuildInput;
@class AWSCodeBuildStopBuildOutput;
@class AWSCodeBuildTag;
@class AWSCodeBuildTestCase;
@class AWSCodeBuildTestCaseFilter;
@class AWSCodeBuildTestReportSummary;
@class AWSCodeBuildUpdateProjectInput;
@class AWSCodeBuildUpdateProjectOutput;
@class AWSCodeBuildUpdateReportGroupInput;
@class AWSCodeBuildUpdateReportGroupOutput;
@class AWSCodeBuildUpdateWebhookInput;
@class AWSCodeBuildUpdateWebhookOutput;
@class AWSCodeBuildVpcConfig;
@class AWSCodeBuildWebhook;
@class AWSCodeBuildWebhookFilter;

/**
 
 */
@interface AWSCodeBuildBatchDeleteBuildsInput : AWSRequest


/**
 <p>The IDs of the builds to delete.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ids;

@end

/**
 
 */
@interface AWSCodeBuildBatchDeleteBuildsOutput : AWSModel


/**
 <p>The IDs of the builds that were successfully deleted.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable buildsDeleted;

/**
 <p>Information about any builds that could not be successfully deleted.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildBuildNotDeleted *> * _Nullable buildsNotDeleted;

@end

/**
 
 */
@interface AWSCodeBuildBatchGetBuildsInput : AWSRequest


/**
 <p>The IDs of the builds.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ids;

@end

/**
 
 */
@interface AWSCodeBuildBatchGetBuildsOutput : AWSModel


/**
 <p>Information about the requested builds.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildBuild *> * _Nullable builds;

/**
 <p>The IDs of builds for which information could not be found.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable buildsNotFound;

@end

/**
 
 */
@interface AWSCodeBuildBatchGetProjectsInput : AWSRequest


/**
 <p>The names or ARNs of the build projects. To get information about a project shared with your AWS account, its ARN must be specified. You cannot specify a shared project using its name.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable names;

@end

/**
 
 */
@interface AWSCodeBuildBatchGetProjectsOutput : AWSModel


/**
 <p>Information about the requested build projects.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildProject *> * _Nullable projects;

/**
 <p>The names of build projects for which information could not be found.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable projectsNotFound;

@end

/**
 
 */
@interface AWSCodeBuildBatchGetReportGroupsInput : AWSRequest


/**
 <p> An array of report group ARNs that identify the report groups to return. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable reportGroupArns;

@end

/**
 
 */
@interface AWSCodeBuildBatchGetReportGroupsOutput : AWSModel


/**
 <p> The array of report groups returned by <code>BatchGetReportGroups</code>. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildReportGroup *> * _Nullable reportGroups;

/**
 <p> An array of ARNs passed to <code>BatchGetReportGroups</code> that are not associated with a <code>ReportGroup</code>. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable reportGroupsNotFound;

@end

/**
 
 */
@interface AWSCodeBuildBatchGetReportsInput : AWSRequest


/**
 <p> An array of ARNs that identify the <code>Report</code> objects to return. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable reportArns;

@end

/**
 
 */
@interface AWSCodeBuildBatchGetReportsOutput : AWSModel


/**
 <p> The array of <code>Report</code> objects returned by <code>BatchGetReports</code>. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildReport *> * _Nullable reports;

/**
 <p> An array of ARNs passed to <code>BatchGetReportGroups</code> that are not associated with a <code>Report</code>. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable reportsNotFound;

@end

/**
 <p>Information about a build.</p>
 */
@interface AWSCodeBuildBuild : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the build.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>Information about the output artifacts for the build.</p>
 */
@property (nonatomic, strong) AWSCodeBuildBuildArtifacts * _Nullable artifacts;

/**
 <p>Whether the build is complete. True if complete; otherwise, false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable buildComplete;

/**
 <p>The number of the build. For each project, the <code>buildNumber</code> of its first build is <code>1</code>. The <code>buildNumber</code> of each subsequent build is incremented by <code>1</code>. If a build is deleted, the <code>buildNumber</code> of other builds does not change.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable buildNumber;

/**
 <p>The current status of the build. Valid values include:</p><ul><li><p><code>FAILED</code>: The build failed.</p></li><li><p><code>FAULT</code>: The build faulted.</p></li><li><p><code>IN_PROGRESS</code>: The build is still in progress.</p></li><li><p><code>STOPPED</code>: The build stopped.</p></li><li><p><code>SUCCEEDED</code>: The build succeeded.</p></li><li><p><code>TIMED_OUT</code>: The build timed out.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildStatusType buildStatus;

/**
 <p>Information about the cache for the build.</p>
 */
@property (nonatomic, strong) AWSCodeBuildProjectCache * _Nullable cache;

/**
 <p>The current build phase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentPhase;

/**
 <p>The AWS Key Management Service (AWS KMS) customer master key (CMK) to be used for encrypting the build output artifacts.</p><note><p> You can use a cross-account KMS key to encrypt the build output artifacts if your service role has permission to that key. </p></note><p>You can specify either the Amazon Resource Name (ARN) of the CMK or, if available, the CMK's alias (using the format <code>alias/<i>alias-name</i></code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable encryptionKey;

/**
 <p>When the build process ended, expressed in Unix time format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>Information about the build environment for this build.</p>
 */
@property (nonatomic, strong) AWSCodeBuildProjectEnvironment * _Nullable environment;

/**
 <p> A list of exported environment variables for this build. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildExportedEnvironmentVariable *> * _Nullable exportedEnvironmentVariables;

/**
 <p> An array of <code>ProjectFileSystemLocation</code> objects for a CodeBuild build project. A <code>ProjectFileSystemLocation</code> object specifies the <code>identifier</code>, <code>location</code>, <code>mountOptions</code>, <code>mountPoint</code>, and <code>type</code> of a file system created using Amazon Elastic File System. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildProjectFileSystemLocation *> * _Nullable fileSystemLocations;

/**
 <p>The unique ID for the build.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The entity that started the build. Valid values include:</p><ul><li><p>If AWS CodePipeline started the build, the pipeline's name (for example, <code>codepipeline/my-demo-pipeline</code>).</p></li><li><p>If an AWS Identity and Access Management (IAM) user started the build, the user's name (for example, <code>MyUserName</code>).</p></li><li><p>If the Jenkins plugin for AWS CodeBuild started the build, the string <code>CodeBuild-Jenkins-Plugin</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable initiator;

/**
 <p>Information about the build's logs in Amazon CloudWatch Logs.</p>
 */
@property (nonatomic, strong) AWSCodeBuildLogsLocation * _Nullable logs;

/**
 <p>Describes a network interface.</p>
 */
@property (nonatomic, strong) AWSCodeBuildNetworkInterface * _Nullable networkInterface;

/**
 <p>Information about all previous build phases that are complete and information about any current build phase that is not yet complete.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildBuildPhase *> * _Nullable phases;

/**
 <p>The name of the AWS CodeBuild project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectName;

/**
 <p> The number of minutes a build is allowed to be queued before it times out. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable queuedTimeoutInMinutes;

/**
 <p> An array of the ARNs associated with this build's reports. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable reportArns;

/**
 <p> An identifier for the version of this build's source code. </p><ul><li><p> For AWS CodeCommit, GitHub, GitHub Enterprise, and BitBucket, the commit ID. </p></li><li><p> For AWS CodePipeline, the source revision provided by AWS CodePipeline. </p></li><li><p> For Amazon Simple Storage Service (Amazon S3), this does not apply. </p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resolvedSourceVersion;

/**
 <p> An array of <code>ProjectArtifacts</code> objects. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildBuildArtifacts *> * _Nullable secondaryArtifacts;

/**
 <p> An array of <code>ProjectSourceVersion</code> objects. Each <code>ProjectSourceVersion</code> must be one of: </p><ul><li><p>For AWS CodeCommit: the commit ID, branch, or Git tag to use.</p></li><li><p>For GitHub: the commit ID, pull request ID, branch name, or tag name that corresponds to the version of the source code you want to build. If a pull request ID is specified, it must use the format <code>pr/pull-request-ID</code> (for example, <code>pr/25</code>). If a branch name is specified, the branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.</p></li><li><p>For Bitbucket: the commit ID, branch name, or tag name that corresponds to the version of the source code you want to build. If a branch name is specified, the branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.</p></li><li><p>For Amazon Simple Storage Service (Amazon S3): the version ID of the object that represents the build input ZIP file to use.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildProjectSourceVersion *> * _Nullable secondarySourceVersions;

/**
 <p> An array of <code>ProjectSource</code> objects. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildProjectSource *> * _Nullable secondarySources;

/**
 <p>The name of a service role used for this build.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRole;

/**
 <p>Information about the source code to be built.</p>
 */
@property (nonatomic, strong) AWSCodeBuildProjectSource * _Nullable source;

/**
 <p>Any version identifier for the version of the source code to be built. If <code>sourceVersion</code> is specified at the project level, then this <code>sourceVersion</code> (at the build level) takes precedence. </p><p> For more information, see <a href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html">Source Version Sample with CodeBuild</a> in the <i>AWS CodeBuild User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceVersion;

/**
 <p>When the build process started, expressed in Unix time format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>How long, in minutes, for AWS CodeBuild to wait before timing out this build if it does not get marked as completed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutInMinutes;

/**
 <p>If your AWS CodeBuild project accesses resources in an Amazon VPC, you provide this parameter that identifies the VPC ID and the list of security group IDs and subnet IDs. The security groups and subnets must belong to the same VPC. You must provide at least one security group and one subnet ID.</p>
 */
@property (nonatomic, strong) AWSCodeBuildVpcConfig * _Nullable vpcConfig;

@end

/**
 <p>Information about build output artifacts.</p>
 */
@interface AWSCodeBuildBuildArtifacts : AWSModel


/**
 <p> An identifier for this artifact definition. </p>
 */
@property (nonatomic, strong) NSString * _Nullable artifactIdentifier;

/**
 <p> Information that tells you if encryption for build artifacts is disabled. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encryptionDisabled;

/**
 <p>Information about the location of the build artifacts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The MD5 hash of the build artifact.</p><p>You can use this hash along with a checksum tool to confirm file integrity and authenticity.</p><note><p>This value is available only if the build project's <code>packaging</code> value is set to <code>ZIP</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable md5sum;

/**
 <p> If this flag is set, a name specified in the buildspec file overrides the artifact name. The name specified in a buildspec file is calculated at build time and uses the Shell Command Language. For example, you can append a date and time to your artifact name so that it is always unique. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable overrideArtifactName;

/**
 <p>The SHA-256 hash of the build artifact.</p><p>You can use this hash along with a checksum tool to confirm file integrity and authenticity.</p><note><p>This value is available only if the build project's <code>packaging</code> value is set to <code>ZIP</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable sha256sum;

@end

/**
 <p>Information about a build that could not be successfully deleted.</p>
 */
@interface AWSCodeBuildBuildNotDeleted : AWSModel


/**
 <p>The ID of the build that could not be successfully deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Additional information about the build that could not be successfully deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusCode;

@end

/**
 <p>Information about a stage for a build.</p>
 */
@interface AWSCodeBuildBuildPhase : AWSModel


/**
 <p>Additional information about a build phase, especially to help troubleshoot a failed build.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildPhaseContext *> * _Nullable contexts;

/**
 <p>How long, in seconds, between the starting and ending times of the build's phase.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationInSeconds;

/**
 <p>When the build phase ended, expressed in Unix time format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The current status of the build phase. Valid values include:</p><ul><li><p><code>FAILED</code>: The build phase failed.</p></li><li><p><code>FAULT</code>: The build phase faulted.</p></li><li><p><code>IN_PROGRESS</code>: The build phase is still in progress.</p></li><li><p><code>QUEUED</code>: The build has been submitted and is queued behind other submitted builds.</p></li><li><p><code>STOPPED</code>: The build phase stopped.</p></li><li><p><code>SUCCEEDED</code>: The build phase succeeded.</p></li><li><p><code>TIMED_OUT</code>: The build phase timed out.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildStatusType phaseStatus;

/**
 <p>The name of the build phase. Valid values include:</p><ul><li><p><code>BUILD</code>: Core build activities typically occur in this build phase.</p></li><li><p><code>COMPLETED</code>: The build has been completed.</p></li><li><p><code>DOWNLOAD_SOURCE</code>: Source code is being downloaded in this build phase.</p></li><li><p><code>FINALIZING</code>: The build process is completing in this build phase.</p></li><li><p><code>INSTALL</code>: Installation activities typically occur in this build phase.</p></li><li><p><code>POST_BUILD</code>: Post-build activities typically occur in this build phase.</p></li><li><p><code>PRE_BUILD</code>: Pre-build activities typically occur in this build phase.</p></li><li><p><code>PROVISIONING</code>: The build environment is being set up.</p></li><li><p><code>QUEUED</code>: The build has been submitted and is queued behind other submitted builds.</p></li><li><p><code>SUBMITTED</code>: The build has been submitted.</p></li><li><p><code>UPLOAD_ARTIFACTS</code>: Build output artifacts are being uploaded to the output location.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildBuildPhaseType phaseType;

/**
 <p>When the build phase started, expressed in Unix time format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 <p> Information about Amazon CloudWatch Logs for a build project. </p>
 Required parameters: [status]
 */
@interface AWSCodeBuildCloudWatchLogsConfig : AWSModel


/**
 <p> The group name of the logs in Amazon CloudWatch Logs. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html">Working with Log Groups and Log Streams</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The current status of the logs in Amazon CloudWatch Logs for a build project. Valid values are:</p><ul><li><p><code>ENABLED</code>: Amazon CloudWatch Logs are enabled for this build project.</p></li><li><p><code>DISABLED</code>: Amazon CloudWatch Logs are not enabled for this build project.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildLogsConfigStatusType status;

/**
 <p> The prefix of the stream name of the Amazon CloudWatch Logs. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html">Working with Log Groups and Log Streams</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSCodeBuildCreateProjectInput : AWSRequest


/**
 <p>Information about the build output artifacts for the build project.</p>
 */
@property (nonatomic, strong) AWSCodeBuildProjectArtifacts * _Nullable artifacts;

/**
 <p>Set this to true to generate a publicly accessible URL for your project's build badge.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable badgeEnabled;

/**
 <p>Stores recently used information so that it can be quickly accessed at a later time.</p>
 */
@property (nonatomic, strong) AWSCodeBuildProjectCache * _Nullable cache;

/**
 <p>A description that makes the build project easy to identify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The AWS Key Management Service (AWS KMS) customer master key (CMK) to be used for encrypting the build output artifacts.</p><note><p> You can use a cross-account KMS key to encrypt the build output artifacts if your service role has permission to that key. </p></note><p>You can specify either the Amazon Resource Name (ARN) of the CMK or, if available, the CMK's alias (using the format <code>alias/<i>alias-name</i></code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable encryptionKey;

/**
 <p>Information about the build environment for the build project.</p>
 */
@property (nonatomic, strong) AWSCodeBuildProjectEnvironment * _Nullable environment;

/**
 <p> An array of <code>ProjectFileSystemLocation</code> objects for a CodeBuild build project. A <code>ProjectFileSystemLocation</code> object specifies the <code>identifier</code>, <code>location</code>, <code>mountOptions</code>, <code>mountPoint</code>, and <code>type</code> of a file system created using Amazon Elastic File System. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildProjectFileSystemLocation *> * _Nullable fileSystemLocations;

/**
 <p> Information about logs for the build project. These can be logs in Amazon CloudWatch Logs, logs uploaded to a specified S3 bucket, or both. </p>
 */
@property (nonatomic, strong) AWSCodeBuildLogsConfig * _Nullable logsConfig;

/**
 <p>The name of the build project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> The number of minutes a build is allowed to be queued before it times out. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable queuedTimeoutInMinutes;

/**
 <p> An array of <code>ProjectArtifacts</code> objects. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildProjectArtifacts *> * _Nullable secondaryArtifacts;

/**
 <p> An array of <code>ProjectSourceVersion</code> objects. If <code>secondarySourceVersions</code> is specified at the build level, then they take precedence over these <code>secondarySourceVersions</code> (at the project level). </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildProjectSourceVersion *> * _Nullable secondarySourceVersions;

/**
 <p> An array of <code>ProjectSource</code> objects. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildProjectSource *> * _Nullable secondarySources;

/**
 <p>The ARN of the AWS Identity and Access Management (IAM) role that enables AWS CodeBuild to interact with dependent AWS services on behalf of the AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRole;

/**
 <p>Information about the build input source code for the build project.</p>
 */
@property (nonatomic, strong) AWSCodeBuildProjectSource * _Nullable source;

/**
 <p> A version of the build input to be built for this project. If not specified, the latest version is used. If specified, it must be one of: </p><ul><li><p>For AWS CodeCommit: the commit ID, branch, or Git tag to use.</p></li><li><p>For GitHub: the commit ID, pull request ID, branch name, or tag name that corresponds to the version of the source code you want to build. If a pull request ID is specified, it must use the format <code>pr/pull-request-ID</code> (for example <code>pr/25</code>). If a branch name is specified, the branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.</p></li><li><p>For Bitbucket: the commit ID, branch name, or tag name that corresponds to the version of the source code you want to build. If a branch name is specified, the branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.</p></li><li><p>For Amazon Simple Storage Service (Amazon S3): the version ID of the object that represents the build input ZIP file to use.</p></li></ul><p> If <code>sourceVersion</code> is specified at the build level, then that version takes precedence over this <code>sourceVersion</code> (at the project level). </p><p> For more information, see <a href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html">Source Version Sample with CodeBuild</a> in the <i>AWS CodeBuild User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceVersion;

/**
 <p>A set of tags for this build project.</p><p>These tags are available for use by AWS services that support AWS CodeBuild build project tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildTag *> * _Nullable tags;

/**
 <p>How long, in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait before it times out any build that has not been marked as completed. The default is 60 minutes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutInMinutes;

/**
 <p>VpcConfig enables AWS CodeBuild to access resources in an Amazon VPC.</p>
 */
@property (nonatomic, strong) AWSCodeBuildVpcConfig * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSCodeBuildCreateProjectOutput : AWSModel


/**
 <p>Information about the build project that was created.</p>
 */
@property (nonatomic, strong) AWSCodeBuildProject * _Nullable project;

@end

/**
 
 */
@interface AWSCodeBuildCreateReportGroupInput : AWSRequest


/**
 <p> A <code>ReportExportConfig</code> object that contains information about where the report group test results are exported. </p>
 */
@property (nonatomic, strong) AWSCodeBuildReportExportConfig * _Nullable exportConfig;

/**
 <p> The name of the report group. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> The type of report group. </p>
 */
@property (nonatomic, assign) AWSCodeBuildReportType types;

@end

/**
 
 */
@interface AWSCodeBuildCreateReportGroupOutput : AWSModel


/**
 <p> Information about the report group that was created. </p>
 */
@property (nonatomic, strong) AWSCodeBuildReportGroup * _Nullable reportGroup;

@end

/**
 
 */
@interface AWSCodeBuildCreateWebhookInput : AWSRequest


/**
 <p>A regular expression used to determine which repository branches are built when a webhook is triggered. If the name of a branch matches the regular expression, then it is built. If <code>branchFilter</code> is empty, then all branches are built.</p><note><p> It is recommended that you use <code>filterGroups</code> instead of <code>branchFilter</code>. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable branchFilter;

/**
 <p> An array of arrays of <code>WebhookFilter</code> objects used to determine which webhooks are triggered. At least one <code>WebhookFilter</code> in the array must specify <code>EVENT</code> as its <code>type</code>. </p><p> For a build to be triggered, at least one filter group in the <code>filterGroups</code> array must pass. For a filter group to pass, each of its filters must pass. </p>
 */
@property (nonatomic, strong) NSArray<NSArray<AWSCodeBuildWebhookFilter *> *> * _Nullable filterGroups;

/**
 <p>The name of the AWS CodeBuild project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectName;

@end

/**
 
 */
@interface AWSCodeBuildCreateWebhookOutput : AWSModel


/**
 <p>Information about a webhook that connects repository events to a build project in AWS CodeBuild.</p>
 */
@property (nonatomic, strong) AWSCodeBuildWebhook * _Nullable webhook;

@end

/**
 
 */
@interface AWSCodeBuildDeleteProjectInput : AWSRequest


/**
 <p>The name of the build project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSCodeBuildDeleteProjectOutput : AWSModel


@end

/**
 
 */
@interface AWSCodeBuildDeleteReportGroupInput : AWSRequest


/**
 <p> The ARN of the report group to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 
 */
@interface AWSCodeBuildDeleteReportGroupOutput : AWSModel


@end

/**
 
 */
@interface AWSCodeBuildDeleteReportInput : AWSRequest


/**
 <p> The ARN of the report to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 
 */
@interface AWSCodeBuildDeleteReportOutput : AWSModel


@end

/**
 
 */
@interface AWSCodeBuildDeleteResourcePolicyInput : AWSRequest


/**
 <p> The ARN of the resource that is associated with the resource policy. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSCodeBuildDeleteResourcePolicyOutput : AWSModel


@end

/**
 
 */
@interface AWSCodeBuildDeleteSourceCredentialsInput : AWSRequest


/**
 <p> The Amazon Resource Name (ARN) of the token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 
 */
@interface AWSCodeBuildDeleteSourceCredentialsOutput : AWSModel


/**
 <p> The Amazon Resource Name (ARN) of the token. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 
 */
@interface AWSCodeBuildDeleteWebhookInput : AWSRequest


/**
 <p>The name of the AWS CodeBuild project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectName;

@end

/**
 
 */
@interface AWSCodeBuildDeleteWebhookOutput : AWSModel


@end

/**
 
 */
@interface AWSCodeBuildDescribeTestCasesInput : AWSRequest


/**
 <p> A <code>TestCaseFilter</code> object used to filter the returned reports. </p>
 */
@property (nonatomic, strong) AWSCodeBuildTestCaseFilter * _Nullable filter;

/**
 <p> The maximum number of paginated test cases returned per response. Use <code>nextToken</code> to iterate pages in the list of returned <code>TestCase</code> objects. The default value is 100. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> During a previous call, the maximum number of items that can be returned is the value specified in <code>maxResults</code>. If there more items in the list, then a unique string called a <i>nextToken</i> is returned. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> The ARN of the report for which test cases are returned. </p>
 */
@property (nonatomic, strong) NSString * _Nullable reportArn;

@end

/**
 
 */
@interface AWSCodeBuildDescribeTestCasesOutput : AWSModel


/**
 <p> During a previous call, the maximum number of items that can be returned is the value specified in <code>maxResults</code>. If there more items in the list, then a unique string called a <i>nextToken</i> is returned. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> The returned list of test cases. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildTestCase *> * _Nullable testCases;

@end

/**
 <p>Information about a Docker image that is managed by AWS CodeBuild.</p>
 */
@interface AWSCodeBuildEnvironmentImage : AWSModel


/**
 <p>The description of the Docker image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the Docker image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of environment image versions.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable versions;

@end

/**
 <p>A set of Docker images that are related by programming language and are managed by AWS CodeBuild.</p>
 */
@interface AWSCodeBuildEnvironmentLanguage : AWSModel


/**
 <p>The list of Docker images that are related by the specified programming language.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildEnvironmentImage *> * _Nullable images;

/**
 <p>The programming language for the Docker images.</p>
 */
@property (nonatomic, assign) AWSCodeBuildLanguageType language;

@end

/**
 <p>A set of Docker images that are related by platform and are managed by AWS CodeBuild.</p>
 */
@interface AWSCodeBuildEnvironmentPlatform : AWSModel


/**
 <p>The list of programming languages that are available for the specified platform.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildEnvironmentLanguage *> * _Nullable languages;

/**
 <p>The platform's name.</p>
 */
@property (nonatomic, assign) AWSCodeBuildPlatformType platform;

@end

/**
 <p>Information about an environment variable for a build project or a build.</p>
 Required parameters: [name, value]
 */
@interface AWSCodeBuildEnvironmentVariable : AWSModel


/**
 <p>The name or key of the environment variable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of environment variable. Valid values include:</p><ul><li><p><code>PARAMETER_STORE</code>: An environment variable stored in Amazon EC2 Systems Manager Parameter Store. To learn how to specify a parameter store environment variable, see <a href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html#parameter-store-build-spec"> parameter store reference-key in the buildspec file</a>.</p></li><li><p><code>PLAINTEXT</code>: An environment variable in plain text format. This is the default value.</p></li><li><p><code>SECRETS_MANAGER</code>: An environment variable stored in AWS Secrets Manager. To learn how to specify a secrets manager environment variable, see <a href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html#secrets-manager-build-spec"> secrets manager reference-key in the buildspec file</a>.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildEnvironmentVariableType types;

/**
 <p>The value of the environment variable.</p><important><p>We strongly discourage the use of <code>PLAINTEXT</code> environment variables to store sensitive values, especially AWS secret key IDs and secret access keys. <code>PLAINTEXT</code> environment variables can be displayed in plain text using the AWS CodeBuild console and the AWS Command Line Interface (AWS CLI). For sensitive values, we recommend you use an environment variable of type <code>PARAMETER_STORE</code> or <code>SECRETS_MANAGER</code>. </p></important>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p> Information about an exported environment variable. </p>
 */
@interface AWSCodeBuildExportedEnvironmentVariable : AWSModel


/**
 <p> The name of this exported environment variable. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> The value assigned to this exported environment variable. </p><note><p> During a build, the value of a variable is available starting with the <code>install</code> phase. It can be updated between the start of the <code>install</code> phase and the end of the <code>post_build</code> phase. After the <code>post_build</code> phase ends, the value of exported variables cannot change.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSCodeBuildGetResourcePolicyInput : AWSRequest


/**
 <p> The ARN of the resource that is associated with the resource policy. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSCodeBuildGetResourcePolicyOutput : AWSModel


/**
 <p> The resource policy for the resource identified by the input ARN parameter. </p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

@end

/**
 <p> Information about the Git submodules configuration for an AWS CodeBuild build project. </p>
 Required parameters: [fetchSubmodules]
 */
@interface AWSCodeBuildGitSubmodulesConfig : AWSModel


/**
 <p> Set to true to fetch Git submodules for your AWS CodeBuild build project. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fetchSubmodules;

@end

/**
 
 */
@interface AWSCodeBuildImportSourceCredentialsInput : AWSRequest


/**
 <p> The type of authentication used to connect to a GitHub, GitHub Enterprise, or Bitbucket repository. An OAUTH connection is not supported by the API and must be created using the AWS CodeBuild console. </p>
 */
@property (nonatomic, assign) AWSCodeBuildAuthType authType;

/**
 <p> The source provider used for this project. </p>
 */
@property (nonatomic, assign) AWSCodeBuildServerType serverType;

/**
 <p> Set to <code>false</code> to prevent overwriting the repository source credentials. Set to <code>true</code> to overwrite the repository source credentials. The default value is <code>true</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable shouldOverwrite;

/**
 <p> For GitHub or GitHub Enterprise, this is the personal access token. For Bitbucket, this is the app password. </p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

/**
 <p> The Bitbucket username when the <code>authType</code> is BASIC_AUTH. This parameter is not valid for other types of source providers or connections. </p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCodeBuildImportSourceCredentialsOutput : AWSModel


/**
 <p> The Amazon Resource Name (ARN) of the token. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 
 */
@interface AWSCodeBuildInvalidateProjectCacheInput : AWSRequest


/**
 <p>The name of the AWS CodeBuild build project that the cache is reset for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectName;

@end

/**
 
 */
@interface AWSCodeBuildInvalidateProjectCacheOutput : AWSModel


@end

/**
 
 */
@interface AWSCodeBuildListBuildsForProjectInput : AWSRequest


/**
 <p>During a previous call, if there are more than 100 items in the list, only the first 100 items are returned, along with a unique string called a <i>nextToken</i>. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the AWS CodeBuild project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectName;

/**
 <p>The order to list build IDs. Valid values include:</p><ul><li><p><code>ASCENDING</code>: List the build IDs in ascending order by build ID.</p></li><li><p><code>DESCENDING</code>: List the build IDs in descending order by build ID.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildSortOrderType sortOrder;

@end

/**
 
 */
@interface AWSCodeBuildListBuildsForProjectOutput : AWSModel


/**
 <p>A list of build IDs for the specified build project, with each build ID representing a single build.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ids;

/**
 <p>If there are more than 100 items in the list, only the first 100 items are returned, along with a unique string called a <i>nextToken</i>. To get the next batch of items in the list, call this operation again, adding the next token to the call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCodeBuildListBuildsInput : AWSRequest


/**
 <p>During a previous call, if there are more than 100 items in the list, only the first 100 items are returned, along with a unique string called a <i>nextToken</i>. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The order to list build IDs. Valid values include:</p><ul><li><p><code>ASCENDING</code>: List the build IDs in ascending order by build ID.</p></li><li><p><code>DESCENDING</code>: List the build IDs in descending order by build ID.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildSortOrderType sortOrder;

@end

/**
 
 */
@interface AWSCodeBuildListBuildsOutput : AWSModel


/**
 <p>A list of build IDs, with each build ID representing a single build.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ids;

/**
 <p>If there are more than 100 items in the list, only the first 100 items are returned, along with a unique string called a <i>nextToken</i>. To get the next batch of items in the list, call this operation again, adding the next token to the call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCodeBuildListCuratedEnvironmentImagesInput : AWSRequest


@end

/**
 
 */
@interface AWSCodeBuildListCuratedEnvironmentImagesOutput : AWSModel


/**
 <p>Information about supported platforms for Docker images that are managed by AWS CodeBuild.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildEnvironmentPlatform *> * _Nullable platforms;

@end

/**
 
 */
@interface AWSCodeBuildListProjectsInput : AWSRequest


/**
 <p>During a previous call, if there are more than 100 items in the list, only the first 100 items are returned, along with a unique string called a <i>nextToken</i>. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The criterion to be used to list build project names. Valid values include:</p><ul><li><p><code>CREATED_TIME</code>: List based on when each build project was created.</p></li><li><p><code>LAST_MODIFIED_TIME</code>: List based on when information about each build project was last changed.</p></li><li><p><code>NAME</code>: List based on each build project's name.</p></li></ul><p>Use <code>sortOrder</code> to specify in what order to list the build project names based on the preceding criteria.</p>
 */
@property (nonatomic, assign) AWSCodeBuildProjectSortByType sortBy;

/**
 <p>The order in which to list build projects. Valid values include:</p><ul><li><p><code>ASCENDING</code>: List in ascending order.</p></li><li><p><code>DESCENDING</code>: List in descending order.</p></li></ul><p>Use <code>sortBy</code> to specify the criterion to be used to list build project names.</p>
 */
@property (nonatomic, assign) AWSCodeBuildSortOrderType sortOrder;

@end

/**
 
 */
@interface AWSCodeBuildListProjectsOutput : AWSModel


/**
 <p>If there are more than 100 items in the list, only the first 100 items are returned, along with a unique string called a <i>nextToken</i>. To get the next batch of items in the list, call this operation again, adding the next token to the call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of build project names, with each build project name representing a single build project.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable projects;

@end

/**
 
 */
@interface AWSCodeBuildListReportGroupsInput : AWSRequest


/**
 <p> The maximum number of paginated report groups returned per response. Use <code>nextToken</code> to iterate pages in the list of returned <code>ReportGroup</code> objects. The default value is 100. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> During a previous call, the maximum number of items that can be returned is the value specified in <code>maxResults</code>. If there more items in the list, then a unique string called a <i>nextToken</i> is returned. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> The criterion to be used to list build report groups. Valid values include: </p><ul><li><p><code>CREATED_TIME</code>: List based on when each report group was created.</p></li><li><p><code>LAST_MODIFIED_TIME</code>: List based on when each report group was last changed.</p></li><li><p><code>NAME</code>: List based on each report group's name.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildReportGroupSortByType sortBy;

/**
 <p> Used to specify the order to sort the list of returned report groups. Valid values are <code>ASCENDING</code> and <code>DESCENDING</code>. </p>
 */
@property (nonatomic, assign) AWSCodeBuildSortOrderType sortOrder;

@end

/**
 
 */
@interface AWSCodeBuildListReportGroupsOutput : AWSModel


/**
 <p> During a previous call, the maximum number of items that can be returned is the value specified in <code>maxResults</code>. If there more items in the list, then a unique string called a <i>nextToken</i> is returned. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> The list of ARNs for the report groups in the current AWS account. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable reportGroups;

@end

/**
 
 */
@interface AWSCodeBuildListReportsForReportGroupInput : AWSRequest


/**
 <p> A <code>ReportFilter</code> object used to filter the returned reports. </p>
 */
@property (nonatomic, strong) AWSCodeBuildReportFilter * _Nullable filter;

/**
 <p> The maximum number of paginated reports in this report group returned per response. Use <code>nextToken</code> to iterate pages in the list of returned <code>Report</code> objects. The default value is 100. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> During a previous call, the maximum number of items that can be returned is the value specified in <code>maxResults</code>. If there more items in the list, then a unique string called a <i>nextToken</i> is returned. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> The ARN of the report group for which you want to return report ARNs. </p>
 */
@property (nonatomic, strong) NSString * _Nullable reportGroupArn;

/**
 <p> Use to specify whether the results are returned in ascending or descending order. </p>
 */
@property (nonatomic, assign) AWSCodeBuildSortOrderType sortOrder;

@end

/**
 
 */
@interface AWSCodeBuildListReportsForReportGroupOutput : AWSModel


/**
 <p> During a previous call, the maximum number of items that can be returned is the value specified in <code>maxResults</code>. If there more items in the list, then a unique string called a <i>nextToken</i> is returned. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> The list of returned report group ARNs. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable reports;

@end

/**
 
 */
@interface AWSCodeBuildListReportsInput : AWSRequest


/**
 <p> A <code>ReportFilter</code> object used to filter the returned reports. </p>
 */
@property (nonatomic, strong) AWSCodeBuildReportFilter * _Nullable filter;

/**
 <p> The maximum number of paginated reports returned per response. Use <code>nextToken</code> to iterate pages in the list of returned <code>Report</code> objects. The default value is 100. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> During a previous call, the maximum number of items that can be returned is the value specified in <code>maxResults</code>. If there more items in the list, then a unique string called a <i>nextToken</i> is returned. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> Specifies the sort order for the list of returned reports. Valid values are: </p><ul><li><p><code>ASCENDING</code>: return reports in chronological order based on their creation date. </p></li><li><p><code>DESCENDING</code>: return reports in the reverse chronological order based on their creation date. </p></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildSortOrderType sortOrder;

@end

/**
 
 */
@interface AWSCodeBuildListReportsOutput : AWSModel


/**
 <p> During a previous call, the maximum number of items that can be returned is the value specified in <code>maxResults</code>. If there more items in the list, then a unique string called a <i>nextToken</i> is returned. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> The list of returned ARNs for the reports in the current AWS account. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable reports;

@end

/**
 
 */
@interface AWSCodeBuildListSharedProjectsInput : AWSRequest


/**
 <p> The maximum number of paginated shared build projects returned per response. Use <code>nextToken</code> to iterate pages in the list of returned <code>Project</code> objects. The default value is 100. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> During a previous call, the maximum number of items that can be returned is the value specified in <code>maxResults</code>. If there more items in the list, then a unique string called a <i>nextToken</i> is returned. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> The criterion to be used to list build projects shared with the current AWS account or user. Valid values include: </p><ul><li><p><code>ARN</code>: List based on the ARN. </p></li><li><p><code>MODIFIED_TIME</code>: List based on when information about the shared project was last changed. </p></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildSharedResourceSortByType sortBy;

/**
 <p>The order in which to list shared build projects. Valid values include:</p><ul><li><p><code>ASCENDING</code>: List in ascending order.</p></li><li><p><code>DESCENDING</code>: List in descending order.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildSortOrderType sortOrder;

@end

/**
 
 */
@interface AWSCodeBuildListSharedProjectsOutput : AWSModel


/**
 <p> During a previous call, the maximum number of items that can be returned is the value specified in <code>maxResults</code>. If there more items in the list, then a unique string called a <i>nextToken</i> is returned. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> The list of ARNs for the build projects shared with the current AWS account or user. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable projects;

@end

/**
 
 */
@interface AWSCodeBuildListSharedReportGroupsInput : AWSRequest


/**
 <p> The maximum number of paginated shared report groups per response. Use <code>nextToken</code> to iterate pages in the list of returned <code>ReportGroup</code> objects. The default value is 100. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> During a previous call, the maximum number of items that can be returned is the value specified in <code>maxResults</code>. If there more items in the list, then a unique string called a <i>nextToken</i> is returned. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> The criterion to be used to list report groups shared with the current AWS account or user. Valid values include: </p><ul><li><p><code>ARN</code>: List based on the ARN. </p></li><li><p><code>MODIFIED_TIME</code>: List based on when information about the shared report group was last changed. </p></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildSharedResourceSortByType sortBy;

/**
 <p>The order in which to list shared report groups. Valid values include:</p><ul><li><p><code>ASCENDING</code>: List in ascending order.</p></li><li><p><code>DESCENDING</code>: List in descending order.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildSortOrderType sortOrder;

@end

/**
 
 */
@interface AWSCodeBuildListSharedReportGroupsOutput : AWSModel


/**
 <p> During a previous call, the maximum number of items that can be returned is the value specified in <code>maxResults</code>. If there more items in the list, then a unique string called a <i>nextToken</i> is returned. To get the next batch of items in the list, call this operation again, adding the next token to the call. To get all of the items in the list, keep calling this operation with each subsequent next token that is returned, until no more next tokens are returned. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> The list of ARNs for the report groups shared with the current AWS account or user. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable reportGroups;

@end

/**
 
 */
@interface AWSCodeBuildListSourceCredentialsInput : AWSRequest


@end

/**
 
 */
@interface AWSCodeBuildListSourceCredentialsOutput : AWSModel


/**
 <p> A list of <code>SourceCredentialsInfo</code> objects. Each <code>SourceCredentialsInfo</code> object includes the authentication type, token ARN, and type of source provider for one set of credentials. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildSourceCredentialsInfo *> * _Nullable sourceCredentialsInfos;

@end

/**
 <p> Information about logs for a build project. These can be logs in Amazon CloudWatch Logs, built in a specified S3 bucket, or both. </p>
 */
@interface AWSCodeBuildLogsConfig : AWSModel


/**
 <p> Information about Amazon CloudWatch Logs for a build project. Amazon CloudWatch Logs are enabled by default. </p>
 */
@property (nonatomic, strong) AWSCodeBuildCloudWatchLogsConfig * _Nullable cloudWatchLogs;

/**
 <p> Information about logs built to an S3 bucket for a build project. S3 logs are not enabled by default. </p>
 */
@property (nonatomic, strong) AWSCodeBuildS3LogsConfig * _Nullable s3Logs;

@end

/**
 <p>Information about build logs in Amazon CloudWatch Logs.</p>
 */
@interface AWSCodeBuildLogsLocation : AWSModel


/**
 <p> Information about Amazon CloudWatch Logs for a build project. </p>
 */
@property (nonatomic, strong) AWSCodeBuildCloudWatchLogsConfig * _Nullable cloudWatchLogs;

/**
 <p> The ARN of Amazon CloudWatch Logs for a build project. Its format is <code>arn:${Partition}:logs:${Region}:${Account}:log-group:${LogGroupName}:log-stream:${LogStreamName}</code>. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazoncloudwatchlogs.html#amazoncloudwatchlogs-resources-for-iam-policies">Resources Defined by Amazon CloudWatch Logs</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable cloudWatchLogsArn;

/**
 <p>The URL to an individual build log in Amazon CloudWatch Logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deepLink;

/**
 <p>The name of the Amazon CloudWatch Logs group for the build logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p> The URL to a build log in an S3 bucket. </p>
 */
@property (nonatomic, strong) NSString * _Nullable s3DeepLink;

/**
 <p> Information about S3 logs for a build project. </p>
 */
@property (nonatomic, strong) AWSCodeBuildS3LogsConfig * _Nullable s3Logs;

/**
 <p> The ARN of S3 logs for a build project. Its format is <code>arn:${Partition}:s3:::${BucketName}/${ObjectName}</code>. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazons3.html#amazons3-resources-for-iam-policies">Resources Defined by Amazon S3</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable s3LogsArn;

/**
 <p>The name of the Amazon CloudWatch Logs stream for the build logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 <p>Describes a network interface.</p>
 */
@interface AWSCodeBuildNetworkInterface : AWSModel


/**
 <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>The ID of the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

@end

/**
 <p>Additional information about a build phase that has an error. You can use this information for troubleshooting.</p>
 */
@interface AWSCodeBuildPhaseContext : AWSModel


/**
 <p>An explanation of the build phase's context. This might include a command ID and an exit code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The status code for the context of the build phase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusCode;

@end

/**
 <p>Information about a build project.</p>
 */
@interface AWSCodeBuildProject : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the build project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>Information about the build output artifacts for the build project.</p>
 */
@property (nonatomic, strong) AWSCodeBuildProjectArtifacts * _Nullable artifacts;

/**
 <p>Information about the build badge for the build project.</p>
 */
@property (nonatomic, strong) AWSCodeBuildProjectBadge * _Nullable badge;

/**
 <p>Information about the cache for the build project.</p>
 */
@property (nonatomic, strong) AWSCodeBuildProjectCache * _Nullable cache;

/**
 <p>When the build project was created, expressed in Unix time format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable created;

/**
 <p>A description that makes the build project easy to identify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The AWS Key Management Service (AWS KMS) customer master key (CMK) to be used for encrypting the build output artifacts.</p><note><p> You can use a cross-account KMS key to encrypt the build output artifacts if your service role has permission to that key. </p></note><p>You can specify either the Amazon Resource Name (ARN) of the CMK or, if available, the CMK's alias (using the format <code>alias/<i>alias-name</i></code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable encryptionKey;

/**
 <p>Information about the build environment for this build project.</p>
 */
@property (nonatomic, strong) AWSCodeBuildProjectEnvironment * _Nullable environment;

/**
 <p> An array of <code>ProjectFileSystemLocation</code> objects for a CodeBuild build project. A <code>ProjectFileSystemLocation</code> object specifies the <code>identifier</code>, <code>location</code>, <code>mountOptions</code>, <code>mountPoint</code>, and <code>type</code> of a file system created using Amazon Elastic File System. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildProjectFileSystemLocation *> * _Nullable fileSystemLocations;

/**
 <p>When the build project's settings were last modified, expressed in Unix time format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p> Information about logs for the build project. A project can create logs in Amazon CloudWatch Logs, an S3 bucket, or both. </p>
 */
@property (nonatomic, strong) AWSCodeBuildLogsConfig * _Nullable logsConfig;

/**
 <p>The name of the build project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> The number of minutes a build is allowed to be queued before it times out. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable queuedTimeoutInMinutes;

/**
 <p> An array of <code>ProjectArtifacts</code> objects. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildProjectArtifacts *> * _Nullable secondaryArtifacts;

/**
 <p> An array of <code>ProjectSourceVersion</code> objects. If <code>secondarySourceVersions</code> is specified at the build level, then they take over these <code>secondarySourceVersions</code> (at the project level). </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildProjectSourceVersion *> * _Nullable secondarySourceVersions;

/**
 <p> An array of <code>ProjectSource</code> objects. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildProjectSource *> * _Nullable secondarySources;

/**
 <p>The ARN of the AWS Identity and Access Management (IAM) role that enables AWS CodeBuild to interact with dependent AWS services on behalf of the AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRole;

/**
 <p>Information about the build input source code for this build project.</p>
 */
@property (nonatomic, strong) AWSCodeBuildProjectSource * _Nullable source;

/**
 <p>A version of the build input to be built for this project. If not specified, the latest version is used. If specified, it must be one of:</p><ul><li><p>For AWS CodeCommit: the commit ID, branch, or Git tag to use.</p></li><li><p>For GitHub: the commit ID, pull request ID, branch name, or tag name that corresponds to the version of the source code you want to build. If a pull request ID is specified, it must use the format <code>pr/pull-request-ID</code> (for example <code>pr/25</code>). If a branch name is specified, the branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.</p></li><li><p>For Bitbucket: the commit ID, branch name, or tag name that corresponds to the version of the source code you want to build. If a branch name is specified, the branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.</p></li><li><p>For Amazon Simple Storage Service (Amazon S3): the version ID of the object that represents the build input ZIP file to use.</p></li></ul><p> If <code>sourceVersion</code> is specified at the build level, then that version takes precedence over this <code>sourceVersion</code> (at the project level). </p><p> For more information, see <a href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html">Source Version Sample with CodeBuild</a> in the <i>AWS CodeBuild User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceVersion;

/**
 <p>The tags for this build project.</p><p>These tags are available for use by AWS services that support AWS CodeBuild build project tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildTag *> * _Nullable tags;

/**
 <p>How long, in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait before timing out any related build that did not get marked as completed. The default is 60 minutes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutInMinutes;

/**
 <p>Information about the VPC configuration that AWS CodeBuild accesses.</p>
 */
@property (nonatomic, strong) AWSCodeBuildVpcConfig * _Nullable vpcConfig;

/**
 <p>Information about a webhook that connects repository events to a build project in AWS CodeBuild.</p>
 */
@property (nonatomic, strong) AWSCodeBuildWebhook * _Nullable webhook;

@end

/**
 <p>Information about the build output artifacts for the build project.</p>
 Required parameters: [type]
 */
@interface AWSCodeBuildProjectArtifacts : AWSModel


/**
 <p> An identifier for this artifact definition. </p>
 */
@property (nonatomic, strong) NSString * _Nullable artifactIdentifier;

/**
 <p> Set to true if you do not want your output artifacts encrypted. This option is valid only if your artifacts type is Amazon Simple Storage Service (Amazon S3). If this is set with another artifacts type, an invalidInputException is thrown. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encryptionDisabled;

/**
 <p>Information about the build output artifact location:</p><ul><li><p>If <code>type</code> is set to <code>CODEPIPELINE</code>, AWS CodePipeline ignores this value if specified. This is because AWS CodePipeline manages its build output locations instead of AWS CodeBuild.</p></li><li><p>If <code>type</code> is set to <code>NO_ARTIFACTS</code>, this value is ignored if specified, because no build output is produced.</p></li><li><p>If <code>type</code> is set to <code>S3</code>, this is the name of the output bucket.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>Along with <code>path</code> and <code>namespaceType</code>, the pattern that AWS CodeBuild uses to name and store the output artifact:</p><ul><li><p>If <code>type</code> is set to <code>CODEPIPELINE</code>, AWS CodePipeline ignores this value if specified. This is because AWS CodePipeline manages its build output names instead of AWS CodeBuild.</p></li><li><p>If <code>type</code> is set to <code>NO_ARTIFACTS</code>, this value is ignored if specified, because no build output is produced.</p></li><li><p>If <code>type</code> is set to <code>S3</code>, this is the name of the output artifact object. If you set the name to be a forward slash ("/"), the artifact is stored in the root of the output bucket.</p></li></ul><p>For example:</p><ul><li><p> If <code>path</code> is set to <code>MyArtifacts</code>, <code>namespaceType</code> is set to <code>BUILD_ID</code>, and <code>name</code> is set to <code>MyArtifact.zip</code>, then the output artifact is stored in <code>MyArtifacts/<i>build-ID</i>/MyArtifact.zip</code>. </p></li><li><p> If <code>path</code> is empty, <code>namespaceType</code> is set to <code>NONE</code>, and <code>name</code> is set to "<code>/</code>", the output artifact is stored in the root of the output bucket. </p></li><li><p> If <code>path</code> is set to <code>MyArtifacts</code>, <code>namespaceType</code> is set to <code>BUILD_ID</code>, and <code>name</code> is set to "<code>/</code>", the output artifact is stored in <code>MyArtifacts/<i>build-ID</i></code>. </p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Along with <code>path</code> and <code>name</code>, the pattern that AWS CodeBuild uses to determine the name and location to store the output artifact:</p><ul><li><p>If <code>type</code> is set to <code>CODEPIPELINE</code>, AWS CodePipeline ignores this value if specified. This is because AWS CodePipeline manages its build output names instead of AWS CodeBuild.</p></li><li><p>If <code>type</code> is set to <code>NO_ARTIFACTS</code>, this value is ignored if specified, because no build output is produced.</p></li><li><p>If <code>type</code> is set to <code>S3</code>, valid values include:</p><ul><li><p><code>BUILD_ID</code>: Include the build ID in the location of the build output artifact.</p></li><li><p><code>NONE</code>: Do not include the build ID. This is the default if <code>namespaceType</code> is not specified.</p></li></ul></li></ul><p>For example, if <code>path</code> is set to <code>MyArtifacts</code>, <code>namespaceType</code> is set to <code>BUILD_ID</code>, and <code>name</code> is set to <code>MyArtifact.zip</code>, the output artifact is stored in <code>MyArtifacts/<i>build-ID</i>/MyArtifact.zip</code>.</p>
 */
@property (nonatomic, assign) AWSCodeBuildArtifactNamespace namespaceType;

/**
 <p> If this flag is set, a name specified in the buildspec file overrides the artifact name. The name specified in a buildspec file is calculated at build time and uses the Shell Command Language. For example, you can append a date and time to your artifact name so that it is always unique. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable overrideArtifactName;

/**
 <p>The type of build output artifact to create:</p><ul><li><p>If <code>type</code> is set to <code>CODEPIPELINE</code>, AWS CodePipeline ignores this value if specified. This is because AWS CodePipeline manages its build output artifacts instead of AWS CodeBuild.</p></li><li><p>If <code>type</code> is set to <code>NO_ARTIFACTS</code>, this value is ignored if specified, because no build output is produced.</p></li><li><p>If <code>type</code> is set to <code>S3</code>, valid values include:</p><ul><li><p><code>NONE</code>: AWS CodeBuild creates in the output bucket a folder that contains the build output. This is the default if <code>packaging</code> is not specified.</p></li><li><p><code>ZIP</code>: AWS CodeBuild creates in the output bucket a ZIP file that contains the build output.</p></li></ul></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildArtifactPackaging packaging;

/**
 <p>Along with <code>namespaceType</code> and <code>name</code>, the pattern that AWS CodeBuild uses to name and store the output artifact:</p><ul><li><p>If <code>type</code> is set to <code>CODEPIPELINE</code>, AWS CodePipeline ignores this value if specified. This is because AWS CodePipeline manages its build output names instead of AWS CodeBuild.</p></li><li><p>If <code>type</code> is set to <code>NO_ARTIFACTS</code>, this value is ignored if specified, because no build output is produced.</p></li><li><p>If <code>type</code> is set to <code>S3</code>, this is the path to the output artifact. If <code>path</code> is not specified, <code>path</code> is not used.</p></li></ul><p>For example, if <code>path</code> is set to <code>MyArtifacts</code>, <code>namespaceType</code> is set to <code>NONE</code>, and <code>name</code> is set to <code>MyArtifact.zip</code>, the output artifact is stored in the output bucket at <code>MyArtifacts/MyArtifact.zip</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The type of build output artifact. Valid values include:</p><ul><li><p><code>CODEPIPELINE</code>: The build project has build output generated through AWS CodePipeline. </p><note><p>The <code>CODEPIPELINE</code> type is not supported for <code>secondaryArtifacts</code>.</p></note></li><li><p><code>NO_ARTIFACTS</code>: The build project does not produce any build output.</p></li><li><p><code>S3</code>: The build project stores build output in Amazon Simple Storage Service (Amazon S3).</p></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildArtifactsType types;

@end

/**
 <p>Information about the build badge for the build project.</p>
 */
@interface AWSCodeBuildProjectBadge : AWSModel


/**
 <p>Set this to true to generate a publicly accessible URL for your project's build badge.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable badgeEnabled;

/**
 <p>The publicly-accessible URL through which you can access the build badge for your project. </p><p>The publicly accessible URL through which you can access the build badge for your project. </p>
 */
@property (nonatomic, strong) NSString * _Nullable badgeRequestUrl;

@end

/**
 <p>Information about the cache for the build project.</p>
 Required parameters: [type]
 */
@interface AWSCodeBuildProjectCache : AWSModel


/**
 <p>Information about the cache location: </p><ul><li><p><code>NO_CACHE</code> or <code>LOCAL</code>: This value is ignored.</p></li><li><p><code>S3</code>: This is the S3 bucket name/prefix.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p> If you use a <code>LOCAL</code> cache, the local cache mode. You can use one or more local cache modes at the same time. </p><ul><li><p><code>LOCAL_SOURCE_CACHE</code> mode caches Git metadata for primary and secondary sources. After the cache is created, subsequent builds pull only the change between commits. This mode is a good choice for projects with a clean working directory and a source that is a large Git repository. If you choose this option and your project does not use a Git repository (GitHub, GitHub Enterprise, or Bitbucket), the option is ignored. </p></li><li><p><code>LOCAL_DOCKER_LAYER_CACHE</code> mode caches existing Docker layers. This mode is a good choice for projects that build or pull large Docker images. It can prevent the performance issues caused by pulling large Docker images down from the network. </p><note><ul><li><p> You can use a Docker layer cache in the Linux environment only. </p></li><li><p> The <code>privileged</code> flag must be set so that your project has the required Docker permissions. </p></li><li><p> You should consider the security implications before you use a Docker layer cache. </p></li></ul></note></li></ul><ul><li><p><code>LOCAL_CUSTOM_CACHE</code> mode caches directories you specify in the buildspec file. This mode is a good choice if your build scenario is not suited to one of the other three local cache modes. If you use a custom cache: </p><ul><li><p> Only directories can be specified for caching. You cannot specify individual files. </p></li><li><p> Symlinks are used to reference cached directories. </p></li><li><p> Cached directories are linked to your build before it downloads its project sources. Cached items are overridden if a source item has the same name. Directories are specified using cache paths in the buildspec file. </p></li></ul></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable modes;

/**
 <p>The type of cache used by the build project. Valid values include:</p><ul><li><p><code>NO_CACHE</code>: The build project does not use any cache.</p></li><li><p><code>S3</code>: The build project reads and writes from and to S3.</p></li><li><p><code>LOCAL</code>: The build project stores a cache locally on a build host that is only available to that build host.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildCacheType types;

@end

/**
 <p>Information about the build environment of the build project.</p>
 Required parameters: [type, image, computeType]
 */
@interface AWSCodeBuildProjectEnvironment : AWSModel


/**
 <p>The certificate to use with this build project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificate;

/**
 <p>Information about the compute resources the build project uses. Available values include:</p><ul><li><p><code>BUILD_GENERAL1_SMALL</code>: Use up to 3 GB memory and 2 vCPUs for builds.</p></li><li><p><code>BUILD_GENERAL1_MEDIUM</code>: Use up to 7 GB memory and 4 vCPUs for builds.</p></li><li><p><code>BUILD_GENERAL1_LARGE</code>: Use up to 16 GB memory and 8 vCPUs for builds, depending on your environment type.</p></li><li><p><code>BUILD_GENERAL1_2XLARGE</code>: Use up to 145 GB memory, 72 vCPUs, and 824 GB of SSD storage for builds. This compute type supports Docker images up to 100 GB uncompressed.</p></li></ul><p> If you use <code>BUILD_GENERAL1_LARGE</code>: </p><ul><li><p> For environment type <code>LINUX_CONTAINER</code>, you can use up to 15 GB memory and 8 vCPUs for builds. </p></li><li><p> For environment type <code>LINUX_GPU_CONTAINER</code>, you can use up to 255 GB memory, 32 vCPUs, and 4 NVIDIA Tesla V100 GPUs for builds.</p></li><li><p> For environment type <code>ARM_CONTAINER</code>, you can use up to 16 GB memory and 8 vCPUs on ARM-based processors for builds.</p></li></ul><p> For more information, see <a href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html">Build Environment Compute Types</a> in the <i>AWS CodeBuild User Guide.</i></p>
 */
@property (nonatomic, assign) AWSCodeBuildComputeType computeType;

/**
 <p>A set of environment variables to make available to builds for this build project.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildEnvironmentVariable *> * _Nullable environmentVariables;

/**
 <p>The image tag or image digest that identifies the Docker image to use for this build project. Use the following formats:</p><ul><li><p>For an image tag: <code>registry/repository:tag</code>. For example, to specify an image with the tag "latest," use <code>registry/repository:latest</code>.</p></li><li><p>For an image digest: <code>registry/repository@digest</code>. For example, to specify an image with the digest "sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf," use <code>registry/repository@sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable image;

/**
 <p> The type of credentials AWS CodeBuild uses to pull images in your build. There are two valid values: </p><ul><li><p><code>CODEBUILD</code> specifies that AWS CodeBuild uses its own credentials. This requires that you modify your ECR repository policy to trust AWS CodeBuild's service principal. </p></li><li><p><code>SERVICE_ROLE</code> specifies that AWS CodeBuild uses your build project's service role. </p></li></ul><p> When you use a cross-account or private registry image, you must use SERVICE_ROLE credentials. When you use an AWS CodeBuild curated image, you must use CODEBUILD credentials. </p>
 */
@property (nonatomic, assign) AWSCodeBuildImagePullCredentialsType imagePullCredentialsType;

/**
 <p>Enables running the Docker daemon inside a Docker container. Set to true only if the build project is used to build Docker images. Otherwise, a build that attempts to interact with the Docker daemon fails. The default setting is <code>false</code>.</p><p>You can initialize the Docker daemon during the install phase of your build by adding one of the following sets of commands to the install phase of your buildspec file:</p><p>If the operating system's base image is Ubuntu Linux:</p><p><code>- nohup /usr/local/bin/dockerd --host=unix:///var/run/docker.sock --host=tcp://0.0.0.0:2375 --storage-driver=overlay&amp;</code></p><p><code>- timeout 15 sh -c "until docker info; do echo .; sleep 1; done"</code></p><p>If the operating system's base image is Alpine Linux and the previous command does not work, add the <code>-t</code> argument to <code>timeout</code>:</p><p><code>- nohup /usr/local/bin/dockerd --host=unix:///var/run/docker.sock --host=tcp://0.0.0.0:2375 --storage-driver=overlay&amp;</code></p><p><code>- timeout -t 15 sh -c "until docker info; do echo .; sleep 1; done"</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable privilegedMode;

/**
 <p> The credentials for access to a private registry.</p>
 */
@property (nonatomic, strong) AWSCodeBuildRegistryCredential * _Nullable registryCredential;

/**
 <p>The type of build environment to use for related builds.</p><ul><li><p>The environment type <code>ARM_CONTAINER</code> is available only in regions US East (N. Virginia), US East (Ohio), US West (Oregon), EU (Ireland), Asia Pacific (Mumbai), Asia Pacific (Tokyo), Asia Pacific (Sydney), and EU (Frankfurt).</p></li><li><p>The environment type <code>LINUX_CONTAINER</code> with compute type <code>build.general1.2xlarge</code> is available only in regions US East (N. Virginia), US East (Ohio), US West (Oregon), Canada (Central), EU (Ireland), EU (London), EU (Frankfurt), Asia Pacific (Tokyo), Asia Pacific (Seoul), Asia Pacific (Singapore), Asia Pacific (Sydney), China (Beijing), and China (Ningxia).</p></li><li><p>The environment type <code>LINUX_GPU_CONTAINER</code> is available only in regions US East (N. Virginia), US East (Ohio), US West (Oregon), Canada (Central), EU (Ireland), EU (London), EU (Frankfurt), Asia Pacific (Tokyo), Asia Pacific (Seoul), Asia Pacific (Singapore), Asia Pacific (Sydney) , China (Beijing), and China (Ningxia).</p></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildEnvironmentType types;

@end

/**
 <p> Information about a file system created by Amazon Elastic File System (EFS). For more information, see <a href="https://docs.aws.amazon.com/efs/latest/ug/whatisefs.html">What Is Amazon Elastic File System?</a></p>
 */
@interface AWSCodeBuildProjectFileSystemLocation : AWSModel


/**
 <p> The name used to access a file system created by Amazon EFS. CodeBuild creates an environment variable by appending the <code>identifier</code> in all capital letters to <code>CODEBUILD_</code>. For example, if you specify <code>my-efs</code> for <code>identifier</code>, a new environment variable is create named <code>CODEBUILD_MY-EFS</code>. </p><p> The <code>identifier</code> is used to mount your file system. </p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p> A string that specifies the location of the file system created by Amazon EFS. Its format is <code>efs-dns-name:/directory-path</code>. You can find the DNS name of file system when you view it in the AWS EFS console. The directory path is a path to a directory in the file system that CodeBuild mounts. For example, if the DNS name of a file system is <code>fs-abcd1234.efs.us-west-2.amazonaws.com</code>, and its mount directory is <code>my-efs-mount-directory</code>, then the <code>location</code> is <code>fs-abcd1234.efs.us-west-2.amazonaws.com:/my-efs-mount-directory</code>. </p><p> The directory path in the format <code>efs-dns-name:/directory-path</code> is optional. If you do not specify a directory path, the location is only the DNS name and CodeBuild mounts the entire file system. </p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p> The mount options for a file system created by AWS EFS. The default mount options used by CodeBuild are <code>nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2</code>. For more information, see <a href="https://docs.aws.amazon.com/efs/latest/ug/mounting-fs-nfs-mount-settings.html">Recommended NFS Mount Options</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable mountOptions;

/**
 <p> The location in the container where you mount the file system. </p>
 */
@property (nonatomic, strong) NSString * _Nullable mountPoint;

/**
 <p> The type of the file system. The one supported type is <code>EFS</code>. </p>
 */
@property (nonatomic, assign) AWSCodeBuildFileSystemType types;

@end

/**
 <p>Information about the build input source code for the build project.</p>
 Required parameters: [type]
 */
@interface AWSCodeBuildProjectSource : AWSModel


/**
 <p>Information about the authorization settings for AWS CodeBuild to access the source code to be built.</p><p>This information is for the AWS CodeBuild console's use only. Your code should not get or set this information directly.</p>
 */
@property (nonatomic, strong) AWSCodeBuildSourceAuth * _Nullable auth;

/**
 <p>The buildspec file declaration to use for the builds in this build project.</p><p> If this value is set, it can be either an inline buildspec definition, the path to an alternate buildspec file relative to the value of the built-in <code>CODEBUILD_SRC_DIR</code> environment variable, or the path to an S3 bucket. The bucket must be in the same AWS Region as the build project. Specify the buildspec file using its ARN (for example, <code>arn:aws:s3:::my-codebuild-sample2/buildspec.yml</code>). If this value is not provided or is set to an empty string, the source code must contain a buildspec file in its root directory. For more information, see <a href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html#build-spec-ref-name-storage">Buildspec File Name and Storage Location</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable buildspec;

/**
 <p>Information about the Git clone depth for the build project.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable gitCloneDepth;

/**
 <p> Information about the Git submodules configuration for the build project. </p>
 */
@property (nonatomic, strong) AWSCodeBuildGitSubmodulesConfig * _Nullable gitSubmodulesConfig;

/**
 <p>Enable this flag to ignore SSL warnings while connecting to the project source code.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable insecureSsl;

/**
 <p>Information about the location of the source code to be built. Valid values include:</p><ul><li><p>For source code settings that are specified in the source action of a pipeline in AWS CodePipeline, <code>location</code> should not be specified. If it is specified, AWS CodePipeline ignores it. This is because AWS CodePipeline uses the settings in a pipeline's source action instead of this value.</p></li><li><p>For source code in an AWS CodeCommit repository, the HTTPS clone URL to the repository that contains the source code and the buildspec file (for example, <code>https://git-codecommit.<i>region-ID</i>.amazonaws.com/v1/repos/<i>repo-name</i></code>).</p></li><li><p>For source code in an Amazon Simple Storage Service (Amazon S3) input bucket, one of the following. </p><ul><li><p> The path to the ZIP file that contains the source code (for example, <code><i>bucket-name</i>/<i>path</i>/<i>to</i>/<i>object-name</i>.zip</code>). </p></li><li><p> The path to the folder that contains the source code (for example, <code><i>bucket-name</i>/<i>path</i>/<i>to</i>/<i>source-code</i>/<i>folder</i>/</code>). </p></li></ul></li><li><p>For source code in a GitHub repository, the HTTPS clone URL to the repository that contains the source and the buildspec file. You must connect your AWS account to your GitHub account. Use the AWS CodeBuild console to start creating a build project. When you use the console to connect (or reconnect) with GitHub, on the GitHub <b>Authorize application</b> page, for <b>Organization access</b>, choose <b>Request access</b> next to each repository you want to allow AWS CodeBuild to have access to, and then choose <b>Authorize application</b>. (After you have connected to your GitHub account, you do not need to finish creating the build project. You can leave the AWS CodeBuild console.) To instruct AWS CodeBuild to use this connection, in the <code>source</code> object, set the <code>auth</code> object's <code>type</code> value to <code>OAUTH</code>.</p></li><li><p>For source code in a Bitbucket repository, the HTTPS clone URL to the repository that contains the source and the buildspec file. You must connect your AWS account to your Bitbucket account. Use the AWS CodeBuild console to start creating a build project. When you use the console to connect (or reconnect) with Bitbucket, on the Bitbucket <b>Confirm access to your account</b> page, choose <b>Grant access</b>. (After you have connected to your Bitbucket account, you do not need to finish creating the build project. You can leave the AWS CodeBuild console.) To instruct AWS CodeBuild to use this connection, in the <code>source</code> object, set the <code>auth</code> object's <code>type</code> value to <code>OAUTH</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p> Set to true to report the status of a build's start and finish to your source provider. This option is valid only when your source provider is GitHub, GitHub Enterprise, or Bitbucket. If this is set and you use a different source provider, an invalidInputException is thrown. </p><note><p> The status of a build triggered by a webhook is always reported to your source provider. </p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable reportBuildStatus;

/**
 <p> An identifier for this project source. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceIdentifier;

/**
 <p>The type of repository that contains the source code to be built. Valid values include:</p><ul><li><p><code>BITBUCKET</code>: The source code is in a Bitbucket repository.</p></li><li><p><code>CODECOMMIT</code>: The source code is in an AWS CodeCommit repository.</p></li><li><p><code>CODEPIPELINE</code>: The source code settings are specified in the source action of a pipeline in AWS CodePipeline.</p></li><li><p><code>GITHUB</code>: The source code is in a GitHub repository.</p></li><li><p><code>GITHUB_ENTERPRISE</code>: The source code is in a GitHub Enterprise repository.</p></li><li><p><code>NO_SOURCE</code>: The project does not have input source code.</p></li><li><p><code>S3</code>: The source code is in an Amazon Simple Storage Service (Amazon S3) input bucket.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildSourceType types;

@end

/**
 <p> A source identifier and its corresponding version. </p>
 Required parameters: [sourceIdentifier, sourceVersion]
 */
@interface AWSCodeBuildProjectSourceVersion : AWSModel


/**
 <p>An identifier for a source in the build project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceIdentifier;

/**
 <p>The source version for the corresponding source identifier. If specified, must be one of:</p><ul><li><p>For AWS CodeCommit: the commit ID, branch, or Git tag to use.</p></li><li><p>For GitHub: the commit ID, pull request ID, branch name, or tag name that corresponds to the version of the source code you want to build. If a pull request ID is specified, it must use the format <code>pr/pull-request-ID</code> (for example, <code>pr/25</code>). If a branch name is specified, the branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.</p></li><li><p>For Bitbucket: the commit ID, branch name, or tag name that corresponds to the version of the source code you want to build. If a branch name is specified, the branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.</p></li><li><p>For Amazon Simple Storage Service (Amazon S3): the version ID of the object that represents the build input ZIP file to use.</p></li></ul><p> For more information, see <a href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html">Source Version Sample with CodeBuild</a> in the <i>AWS CodeBuild User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceVersion;

@end

/**
 
 */
@interface AWSCodeBuildPutResourcePolicyInput : AWSRequest


/**
 <p> A JSON-formatted resource policy. For more information, see <a href="https://docs.aws.amazon.com/codebuild/latest/userguide/project-sharing.html#project-sharing-share">Sharing a Project</a> and <a href="https://docs.aws.amazon.com/codebuild/latest/userguide/report-groups-sharing.html#report-groups-sharing-share">Sharing a Report Group</a> in the <i>AWS CodeBuild User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p> The ARN of the <code>Project</code> or <code>ReportGroup</code> resource you want to associate with a resource policy. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSCodeBuildPutResourcePolicyOutput : AWSModel


/**
 <p> The ARN of the <code>Project</code> or <code>ReportGroup</code> resource that is associated with a resource policy. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 <p> Information about credentials that provide access to a private Docker registry. When this is set: </p><ul><li><p><code>imagePullCredentialsType</code> must be set to <code>SERVICE_ROLE</code>. </p></li><li><p> images cannot be curated or an Amazon ECR image.</p></li></ul><p> For more information, see <a href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-private-registry.html">Private Registry with AWS Secrets Manager Sample for AWS CodeBuild</a>. </p>
 Required parameters: [credential, credentialProvider]
 */
@interface AWSCodeBuildRegistryCredential : AWSModel


/**
 <p> The Amazon Resource Name (ARN) or name of credentials created using AWS Secrets Manager. </p><note><p> The <code>credential</code> can use the name of the credentials only if they exist in your current AWS Region. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable credential;

/**
 <p> The service that created the credentials to access a private Docker registry. The valid value, SECRETS_MANAGER, is for AWS Secrets Manager. </p>
 */
@property (nonatomic, assign) AWSCodeBuildCredentialProviderType credentialProvider;

@end

/**
 <p> Information about the results from running a series of test cases during the run of a build project. The test cases are specified in the buildspec for the build project using one or more paths to the test case files. You can specify any type of tests you want, such as unit tests, integration tests, and functional tests. </p>
 */
@interface AWSCodeBuildReport : AWSModel


/**
 <p> The ARN of the report run. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p> The date and time this report run occurred. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable created;

/**
 <p> The ARN of the build run that generated this report. </p>
 */
@property (nonatomic, strong) NSString * _Nullable executionId;

/**
 <p> The date and time a report expires. A report expires 30 days after it is created. An expired report is not available to view in CodeBuild. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable expired;

/**
 <p> Information about where the raw data used to generate this report was exported. </p>
 */
@property (nonatomic, strong) AWSCodeBuildReportExportConfig * _Nullable exportConfig;

/**
 <p> The name of the report that was run. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> The ARN of the report group associated with this report. </p>
 */
@property (nonatomic, strong) NSString * _Nullable reportGroupArn;

/**
 <p> The status of this report. </p>
 */
@property (nonatomic, assign) AWSCodeBuildReportStatusType status;

/**
 <p> A <code>TestReportSummary</code> object that contains information about this test report. </p>
 */
@property (nonatomic, strong) AWSCodeBuildTestReportSummary * _Nullable testSummary;

/**
 <p> A boolean that specifies if this report run is truncated. The list of test cases is truncated after the maximum number of test cases is reached. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable truncated;

/**
 <p> The type of the report that was run. </p>
 */
@property (nonatomic, assign) AWSCodeBuildReportType types;

@end

/**
 <p> Information about the location where the run of a report is exported. </p>
 */
@interface AWSCodeBuildReportExportConfig : AWSModel


/**
 <p> The export configuration type. Valid values are: </p><ul><li><p><code>S3</code>: The report results are exported to an S3 bucket. </p></li><li><p><code>NO_EXPORT</code>: The report results are not exported. </p></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildReportExportConfigType exportConfigType;

/**
 <p> A <code>S3ReportExportConfig</code> object that contains information about the S3 bucket where the run of a report is exported. </p>
 */
@property (nonatomic, strong) AWSCodeBuildS3ReportExportConfig * _Nullable s3Destination;

@end

/**
 <p> A filter used to return reports with the status specified by the input <code>status</code> parameter. </p>
 */
@interface AWSCodeBuildReportFilter : AWSModel


/**
 <p> The status used to filter reports. You can filter using one status only. </p>
 */
@property (nonatomic, assign) AWSCodeBuildReportStatusType status;

@end

/**
 <p> A series of reports. Each report contains information about the results from running a series of test cases. You specify the test cases for a report group in the buildspec for a build project using one or more paths to the test case files. </p>
 */
@interface AWSCodeBuildReportGroup : AWSModel


/**
 <p> The ARN of a <code>ReportGroup</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p> The date and time this <code>ReportGroup</code> was created. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable created;

/**
 <p> Information about the destination where the raw data of this <code>ReportGroup</code> is exported. </p>
 */
@property (nonatomic, strong) AWSCodeBuildReportExportConfig * _Nullable exportConfig;

/**
 <p> The date and time this <code>ReportGroup</code> was last modified. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p> The name of a <code>ReportGroup</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> The type of the <code>ReportGroup</code>. The one valid value is <code>TEST</code>. </p>
 */
@property (nonatomic, assign) AWSCodeBuildReportType types;

@end

/**
 <p> Information about S3 logs for a build project. </p>
 Required parameters: [status]
 */
@interface AWSCodeBuildS3LogsConfig : AWSModel


/**
 <p> Set to true if you do not want your S3 build log output encrypted. By default S3 build logs are encrypted. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encryptionDisabled;

/**
 <p> The ARN of an S3 bucket and the path prefix for S3 logs. If your Amazon S3 bucket name is <code>my-bucket</code>, and your path prefix is <code>build-log</code>, then acceptable formats are <code>my-bucket/build-log</code> or <code>arn:aws:s3:::my-bucket/build-log</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The current status of the S3 build logs. Valid values are:</p><ul><li><p><code>ENABLED</code>: S3 build logs are enabled for this build project.</p></li><li><p><code>DISABLED</code>: S3 build logs are not enabled for this build project.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildLogsConfigStatusType status;

@end

/**
 <p> Information about the S3 bucket where the raw data of a report are exported. </p>
 */
@interface AWSCodeBuildS3ReportExportConfig : AWSModel


/**
 <p> The name of the S3 bucket where the raw data of a report are exported. </p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p> A boolean value that specifies if the results of a report are encrypted. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encryptionDisabled;

/**
 <p> The encryption key for the report's encrypted raw data. </p>
 */
@property (nonatomic, strong) NSString * _Nullable encryptionKey;

/**
 <p> The type of build output artifact to create. Valid values include: </p><ul><li><p><code>NONE</code>: AWS CodeBuild creates the raw data in the output bucket. This is the default if packaging is not specified. </p></li><li><p><code>ZIP</code>: AWS CodeBuild creates a ZIP file with the raw data in the output bucket. </p></li></ul>
 */
@property (nonatomic, assign) AWSCodeBuildReportPackagingType packaging;

/**
 <p> The path to the exported report's raw data results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

@end

/**
 <p>Information about the authorization settings for AWS CodeBuild to access the source code to be built.</p><p>This information is for the AWS CodeBuild console's use only. Your code should not get or set this information directly.</p>
 Required parameters: [type]
 */
@interface AWSCodeBuildSourceAuth : AWSModel


/**
 <p>The resource value that applies to the specified authorization type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resource;

/**
 <note><p> This data type is deprecated and is no longer accurate or used. </p></note><p>The authorization type to use. The only valid value is <code>OAUTH</code>, which represents the OAuth authorization type.</p>
 */
@property (nonatomic, assign) AWSCodeBuildSourceAuthType types;

@end

/**
 <p> Information about the credentials for a GitHub, GitHub Enterprise, or Bitbucket repository. </p>
 */
@interface AWSCodeBuildSourceCredentialsInfo : AWSModel


/**
 <p> The Amazon Resource Name (ARN) of the token. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p> The type of authentication used by the credentials. Valid options are OAUTH, BASIC_AUTH, or PERSONAL_ACCESS_TOKEN. </p>
 */
@property (nonatomic, assign) AWSCodeBuildAuthType authType;

/**
 <p> The type of source provider. The valid options are GITHUB, GITHUB_ENTERPRISE, or BITBUCKET. </p>
 */
@property (nonatomic, assign) AWSCodeBuildServerType serverType;

@end

/**
 
 */
@interface AWSCodeBuildStartBuildInput : AWSRequest


/**
 <p>Build output artifact settings that override, for this build only, the latest ones already defined in the build project.</p>
 */
@property (nonatomic, strong) AWSCodeBuildProjectArtifacts * _Nullable artifactsOverride;

/**
 <p>A buildspec file declaration that overrides, for this build only, the latest one already defined in the build project.</p><p> If this value is set, it can be either an inline buildspec definition, the path to an alternate buildspec file relative to the value of the built-in <code>CODEBUILD_SRC_DIR</code> environment variable, or the path to an S3 bucket. The bucket must be in the same AWS Region as the build project. Specify the buildspec file using its ARN (for example, <code>arn:aws:s3:::my-codebuild-sample2/buildspec.yml</code>). If this value is not provided or is set to an empty string, the source code must contain a buildspec file in its root directory. For more information, see <a href="https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html#build-spec-ref-name-storage">Buildspec File Name and Storage Location</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable buildspecOverride;

/**
 <p>A ProjectCache object specified for this build that overrides the one defined in the build project.</p>
 */
@property (nonatomic, strong) AWSCodeBuildProjectCache * _Nullable cacheOverride;

/**
 <p>The name of a certificate for this build that overrides the one specified in the build project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateOverride;

/**
 <p>The name of a compute type for this build that overrides the one specified in the build project.</p>
 */
@property (nonatomic, assign) AWSCodeBuildComputeType computeTypeOverride;

/**
 <p>The AWS Key Management Service (AWS KMS) customer master key (CMK) that overrides the one specified in the build project. The CMK key encrypts the build output artifacts.</p><note><p> You can use a cross-account KMS key to encrypt the build output artifacts if your service role has permission to that key. </p></note><p>You can specify either the Amazon Resource Name (ARN) of the CMK or, if available, the CMK's alias (using the format <code>alias/<i>alias-name</i></code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable encryptionKeyOverride;

/**
 <p>A container type for this build that overrides the one specified in the build project.</p>
 */
@property (nonatomic, assign) AWSCodeBuildEnvironmentType environmentTypeOverride;

/**
 <p>A set of environment variables that overrides, for this build only, the latest ones already defined in the build project.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildEnvironmentVariable *> * _Nullable environmentVariablesOverride;

/**
 <p>The user-defined depth of history, with a minimum value of 0, that overrides, for this build only, any previous depth of history defined in the build project.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable gitCloneDepthOverride;

/**
 <p> Information about the Git submodules configuration for this build of an AWS CodeBuild build project. </p>
 */
@property (nonatomic, strong) AWSCodeBuildGitSubmodulesConfig * _Nullable gitSubmodulesConfigOverride;

/**
 <p>A unique, case sensitive identifier you provide to ensure the idempotency of the StartBuild request. The token is included in the StartBuild request and is valid for 5 minutes. If you repeat the StartBuild request with the same token, but change a parameter, AWS CodeBuild returns a parameter mismatch error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable idempotencyToken;

/**
 <p>The name of an image for this build that overrides the one specified in the build project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageOverride;

/**
 <p> The type of credentials AWS CodeBuild uses to pull images in your build. There are two valid values: </p><ul><li><p><code>CODEBUILD</code> specifies that AWS CodeBuild uses its own credentials. This requires that you modify your ECR repository policy to trust AWS CodeBuild's service principal.</p></li><li><p><code>SERVICE_ROLE</code> specifies that AWS CodeBuild uses your build project's service role. </p></li></ul><p> When using a cross-account or private registry image, you must use SERVICE_ROLE credentials. When using an AWS CodeBuild curated image, you must use CODEBUILD credentials. </p>
 */
@property (nonatomic, assign) AWSCodeBuildImagePullCredentialsType imagePullCredentialsTypeOverride;

/**
 <p>Enable this flag to override the insecure SSL setting that is specified in the build project. The insecure SSL setting determines whether to ignore SSL warnings while connecting to the project source code. This override applies only if the build's source is GitHub Enterprise.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable insecureSslOverride;

/**
 <p> Log settings for this build that override the log settings defined in the build project. </p>
 */
@property (nonatomic, strong) AWSCodeBuildLogsConfig * _Nullable logsConfigOverride;

/**
 <p>Enable this flag to override privileged mode in the build project.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable privilegedModeOverride;

/**
 <p>The name of the AWS CodeBuild build project to start running a build.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectName;

/**
 <p> The number of minutes a build is allowed to be queued before it times out. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable queuedTimeoutInMinutesOverride;

/**
 <p> The credentials for access to a private registry. </p>
 */
@property (nonatomic, strong) AWSCodeBuildRegistryCredential * _Nullable registryCredentialOverride;

/**
 <p> Set to true to report to your source provider the status of a build's start and completion. If you use this option with a source provider other than GitHub, GitHub Enterprise, or Bitbucket, an invalidInputException is thrown. </p><note><p> The status of a build triggered by a webhook is always reported to your source provider. </p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable reportBuildStatusOverride;

/**
 <p> An array of <code>ProjectArtifacts</code> objects. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildProjectArtifacts *> * _Nullable secondaryArtifactsOverride;

/**
 <p> An array of <code>ProjectSource</code> objects. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildProjectSource *> * _Nullable secondarySourcesOverride;

/**
 <p> An array of <code>ProjectSourceVersion</code> objects that specify one or more versions of the project's secondary sources to be used for this build only. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildProjectSourceVersion *> * _Nullable secondarySourcesVersionOverride;

/**
 <p>The name of a service role for this build that overrides the one specified in the build project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRoleOverride;

/**
 <p>An authorization type for this build that overrides the one defined in the build project. This override applies only if the build project's source is BitBucket or GitHub.</p>
 */
@property (nonatomic, strong) AWSCodeBuildSourceAuth * _Nullable sourceAuthOverride;

/**
 <p>A location that overrides, for this build, the source location for the one defined in the build project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceLocationOverride;

/**
 <p>A source input type, for this build, that overrides the source input defined in the build project.</p>
 */
@property (nonatomic, assign) AWSCodeBuildSourceType sourceTypeOverride;

/**
 <p>A version of the build input to be built, for this build only. If not specified, the latest version is used. If specified, must be one of:</p><ul><li><p>For AWS CodeCommit: the commit ID, branch, or Git tag to use.</p></li><li><p>For GitHub: the commit ID, pull request ID, branch name, or tag name that corresponds to the version of the source code you want to build. If a pull request ID is specified, it must use the format <code>pr/pull-request-ID</code> (for example <code>pr/25</code>). If a branch name is specified, the branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.</p></li><li><p>For Bitbucket: the commit ID, branch name, or tag name that corresponds to the version of the source code you want to build. If a branch name is specified, the branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.</p></li><li><p>For Amazon Simple Storage Service (Amazon S3): the version ID of the object that represents the build input ZIP file to use.</p></li></ul><p> If <code>sourceVersion</code> is specified at the project level, then this <code>sourceVersion</code> (at the build level) takes precedence. </p><p> For more information, see <a href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html">Source Version Sample with CodeBuild</a> in the <i>AWS CodeBuild User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceVersion;

/**
 <p>The number of build timeout minutes, from 5 to 480 (8 hours), that overrides, for this build only, the latest setting already defined in the build project.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutInMinutesOverride;

@end

/**
 
 */
@interface AWSCodeBuildStartBuildOutput : AWSModel


/**
 <p>Information about the build to be run.</p>
 */
@property (nonatomic, strong) AWSCodeBuildBuild * _Nullable build;

@end

/**
 
 */
@interface AWSCodeBuildStopBuildInput : AWSRequest


/**
 <p>The ID of the build.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSCodeBuildStopBuildOutput : AWSModel


/**
 <p>Information about the build.</p>
 */
@property (nonatomic, strong) AWSCodeBuildBuild * _Nullable build;

@end

/**
 <p>A tag, consisting of a key and a value.</p><p>This tag is available for use by AWS services that support tags in AWS CodeBuild.</p>
 */
@interface AWSCodeBuildTag : AWSModel


/**
 <p>The tag's key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The tag's value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p> Information about a test case created using a framework such as NUnit or Cucumber. A test case might be a unit test or a configuration test. </p>
 */
@interface AWSCodeBuildTestCase : AWSModel


/**
 <p> The number of nanoseconds it took to run this test case. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationInNanoSeconds;

/**
 <p> The date and time a test case expires. A test case expires 30 days after it is created. An expired test case is not available to view in CodeBuild. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable expired;

/**
 <p> A message associated with a test case. For example, an error message or stack trace. </p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p> The name of the test case. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> A string that is applied to a series of related test cases. CodeBuild generates the prefix. The prefix depends on the framework used to generate the tests. </p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p> The ARN of the report to which the test case belongs. </p>
 */
@property (nonatomic, strong) NSString * _Nullable reportArn;

/**
 <p> The status returned by the test case after it was run. Valid statuses are <code>SUCCEEDED</code>, <code>FAILED</code>, <code>ERROR</code>, <code>SKIPPED</code>, and <code>UNKNOWN</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p> The path to the raw data file that contains the test result. </p>
 */
@property (nonatomic, strong) NSString * _Nullable testRawDataPath;

@end

/**
 <p> A filter used to return specific types of test cases. </p>
 */
@interface AWSCodeBuildTestCaseFilter : AWSModel


/**
 <p> The status used to filter test cases. Valid statuses are <code>SUCCEEDED</code>, <code>FAILED</code>, <code>ERROR</code>, <code>SKIPPED</code>, and <code>UNKNOWN</code>. A <code>TestCaseFilter</code> can have one status. </p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p> Information about a test report. </p>
 Required parameters: [total, statusCounts, durationInNanoSeconds]
 */
@interface AWSCodeBuildTestReportSummary : AWSModel


/**
 <p> The number of nanoseconds it took to run all of the test cases in this report. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationInNanoSeconds;

/**
 <p> A map that contains the number of each type of status returned by the test results in this <code>TestReportSummary</code>. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable statusCounts;

/**
 <p> The number of test cases in this <code>TestReportSummary</code>. The total includes truncated test cases. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable total;

@end

/**
 
 */
@interface AWSCodeBuildUpdateProjectInput : AWSRequest


/**
 <p>Information to be changed about the build output artifacts for the build project.</p>
 */
@property (nonatomic, strong) AWSCodeBuildProjectArtifacts * _Nullable artifacts;

/**
 <p>Set this to true to generate a publicly accessible URL for your project's build badge.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable badgeEnabled;

/**
 <p>Stores recently used information so that it can be quickly accessed at a later time.</p>
 */
@property (nonatomic, strong) AWSCodeBuildProjectCache * _Nullable cache;

/**
 <p>A new or replacement description of the build project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The AWS Key Management Service (AWS KMS) customer master key (CMK) to be used for encrypting the build output artifacts.</p><note><p> You can use a cross-account KMS key to encrypt the build output artifacts if your service role has permission to that key. </p></note><p>You can specify either the Amazon Resource Name (ARN) of the CMK or, if available, the CMK's alias (using the format <code>alias/<i>alias-name</i></code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable encryptionKey;

/**
 <p>Information to be changed about the build environment for the build project.</p>
 */
@property (nonatomic, strong) AWSCodeBuildProjectEnvironment * _Nullable environment;

/**
 <p> An array of <code>ProjectFileSystemLocation</code> objects for a CodeBuild build project. A <code>ProjectFileSystemLocation</code> object specifies the <code>identifier</code>, <code>location</code>, <code>mountOptions</code>, <code>mountPoint</code>, and <code>type</code> of a file system created using Amazon Elastic File System. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildProjectFileSystemLocation *> * _Nullable fileSystemLocations;

/**
 <p> Information about logs for the build project. A project can create logs in Amazon CloudWatch Logs, logs in an S3 bucket, or both. </p>
 */
@property (nonatomic, strong) AWSCodeBuildLogsConfig * _Nullable logsConfig;

/**
 <p>The name of the build project.</p><note><p>You cannot change a build project's name.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> The number of minutes a build is allowed to be queued before it times out. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable queuedTimeoutInMinutes;

/**
 <p> An array of <code>ProjectSource</code> objects. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildProjectArtifacts *> * _Nullable secondaryArtifacts;

/**
 <p> An array of <code>ProjectSourceVersion</code> objects. If <code>secondarySourceVersions</code> is specified at the build level, then they take over these <code>secondarySourceVersions</code> (at the project level). </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildProjectSourceVersion *> * _Nullable secondarySourceVersions;

/**
 <p> An array of <code>ProjectSource</code> objects. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildProjectSource *> * _Nullable secondarySources;

/**
 <p>The replacement ARN of the AWS Identity and Access Management (IAM) role that enables AWS CodeBuild to interact with dependent AWS services on behalf of the AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRole;

/**
 <p>Information to be changed about the build input source code for the build project.</p>
 */
@property (nonatomic, strong) AWSCodeBuildProjectSource * _Nullable source;

/**
 <p> A version of the build input to be built for this project. If not specified, the latest version is used. If specified, it must be one of: </p><ul><li><p>For AWS CodeCommit: the commit ID, branch, or Git tag to use.</p></li><li><p>For GitHub: the commit ID, pull request ID, branch name, or tag name that corresponds to the version of the source code you want to build. If a pull request ID is specified, it must use the format <code>pr/pull-request-ID</code> (for example <code>pr/25</code>). If a branch name is specified, the branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.</p></li><li><p>For Bitbucket: the commit ID, branch name, or tag name that corresponds to the version of the source code you want to build. If a branch name is specified, the branch's HEAD commit ID is used. If not specified, the default branch's HEAD commit ID is used.</p></li><li><p>For Amazon Simple Storage Service (Amazon S3): the version ID of the object that represents the build input ZIP file to use.</p></li></ul><p> If <code>sourceVersion</code> is specified at the build level, then that version takes precedence over this <code>sourceVersion</code> (at the project level). </p><p> For more information, see <a href="https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html">Source Version Sample with CodeBuild</a> in the <i>AWS CodeBuild User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceVersion;

/**
 <p>The replacement set of tags for this build project.</p><p>These tags are available for use by AWS services that support AWS CodeBuild build project tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodeBuildTag *> * _Nullable tags;

/**
 <p>The replacement value in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait before timing out any related build that did not get marked as completed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutInMinutes;

/**
 <p>VpcConfig enables AWS CodeBuild to access resources in an Amazon VPC.</p>
 */
@property (nonatomic, strong) AWSCodeBuildVpcConfig * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSCodeBuildUpdateProjectOutput : AWSModel


/**
 <p>Information about the build project that was changed.</p>
 */
@property (nonatomic, strong) AWSCodeBuildProject * _Nullable project;

@end

/**
 
 */
@interface AWSCodeBuildUpdateReportGroupInput : AWSRequest


/**
 <p> The ARN of the report group to update. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p> Used to specify an updated export type. Valid values are: </p><ul><li><p><code>S3</code>: The report results are exported to an S3 bucket. </p></li><li><p><code>NO_EXPORT</code>: The report results are not exported. </p></li></ul>
 */
@property (nonatomic, strong) AWSCodeBuildReportExportConfig * _Nullable exportConfig;

@end

/**
 
 */
@interface AWSCodeBuildUpdateReportGroupOutput : AWSModel


/**
 <p> Information about the updated report group. </p>
 */
@property (nonatomic, strong) AWSCodeBuildReportGroup * _Nullable reportGroup;

@end

/**
 
 */
@interface AWSCodeBuildUpdateWebhookInput : AWSRequest


/**
 <p>A regular expression used to determine which repository branches are built when a webhook is triggered. If the name of a branch matches the regular expression, then it is built. If <code>branchFilter</code> is empty, then all branches are built.</p><note><p> It is recommended that you use <code>filterGroups</code> instead of <code>branchFilter</code>. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable branchFilter;

/**
 <p> An array of arrays of <code>WebhookFilter</code> objects used to determine if a webhook event can trigger a build. A filter group must contain at least one <code>EVENT</code><code>WebhookFilter</code>. </p>
 */
@property (nonatomic, strong) NSArray<NSArray<AWSCodeBuildWebhookFilter *> *> * _Nullable filterGroups;

/**
 <p>The name of the AWS CodeBuild project.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectName;

/**
 <p> A boolean value that specifies whether the associated GitHub repository's secret token should be updated. If you use Bitbucket for your repository, <code>rotateSecret</code> is ignored. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rotateSecret;

@end

/**
 
 */
@interface AWSCodeBuildUpdateWebhookOutput : AWSModel


/**
 <p> Information about a repository's webhook that is associated with a project in AWS CodeBuild. </p>
 */
@property (nonatomic, strong) AWSCodeBuildWebhook * _Nullable webhook;

@end

/**
 <p>Information about the VPC configuration that AWS CodeBuild accesses.</p>
 */
@interface AWSCodeBuildVpcConfig : AWSModel


/**
 <p>A list of one or more security groups IDs in your Amazon VPC.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>A list of one or more subnet IDs in your Amazon VPC.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnets;

/**
 <p>The ID of the Amazon VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Information about a webhook that connects repository events to a build project in AWS CodeBuild.</p>
 */
@interface AWSCodeBuildWebhook : AWSModel


/**
 <p>A regular expression used to determine which repository branches are built when a webhook is triggered. If the name of a branch matches the regular expression, then it is built. If <code>branchFilter</code> is empty, then all branches are built.</p><note><p> It is recommended that you use <code>filterGroups</code> instead of <code>branchFilter</code>. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable branchFilter;

/**
 <p> An array of arrays of <code>WebhookFilter</code> objects used to determine which webhooks are triggered. At least one <code>WebhookFilter</code> in the array must specify <code>EVENT</code> as its <code>type</code>. </p><p> For a build to be triggered, at least one filter group in the <code>filterGroups</code> array must pass. For a filter group to pass, each of its filters must pass. </p>
 */
@property (nonatomic, strong) NSArray<NSArray<AWSCodeBuildWebhookFilter *> *> * _Nullable filterGroups;

/**
 <p> A timestamp that indicates the last time a repository's secret token was modified. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedSecret;

/**
 <p> The AWS CodeBuild endpoint where webhook events are sent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable payloadUrl;

/**
 <p> The secret token of the associated repository. </p><note><p> A Bitbucket webhook does not support <code>secret</code>. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable secret;

/**
 <p>The URL to the webhook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 <p> A filter used to determine which webhooks trigger a build. </p>
 Required parameters: [type, pattern]
 */
@interface AWSCodeBuildWebhookFilter : AWSModel


/**
 <p> Used to indicate that the <code>pattern</code> determines which webhook events do not trigger a build. If true, then a webhook event that does not match the <code>pattern</code> triggers a build. If false, then a webhook event that matches the <code>pattern</code> triggers a build. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable excludeMatchedPattern;

/**
 <p> For a <code>WebHookFilter</code> that uses <code>EVENT</code> type, a comma-separated string that specifies one or more events. For example, the webhook filter <code>PUSH, PULL_REQUEST_CREATED, PULL_REQUEST_UPDATED</code> allows all push, pull request created, and pull request updated events to trigger a build. </p><p> For a <code>WebHookFilter</code> that uses any of the other filter types, a regular expression pattern. For example, a <code>WebHookFilter</code> that uses <code>HEAD_REF</code> for its <code>type</code> and the pattern <code>^refs/heads/</code> triggers a build when the head reference is a branch with a reference name <code>refs/heads/branch-name</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable pattern;

/**
 <p> The type of webhook filter. There are six webhook filter types: <code>EVENT</code>, <code>ACTOR_ACCOUNT_ID</code>, <code>HEAD_REF</code>, <code>BASE_REF</code>, <code>FILE_PATH</code>, and <code>COMMIT_MESSAGE</code>. </p><dl><dt> EVENT </dt><dd><p> A webhook event triggers a build when the provided <code>pattern</code> matches one of five event types: <code>PUSH</code>, <code>PULL_REQUEST_CREATED</code>, <code>PULL_REQUEST_UPDATED</code>, <code>PULL_REQUEST_REOPENED</code>, and <code>PULL_REQUEST_MERGED</code>. The <code>EVENT</code> patterns are specified as a comma-separated string. For example, <code>PUSH, PULL_REQUEST_CREATED, PULL_REQUEST_UPDATED</code> filters all push, pull request created, and pull request updated events. </p><note><p> The <code>PULL_REQUEST_REOPENED</code> works with GitHub and GitHub Enterprise only. </p></note></dd><dt> ACTOR_ACCOUNT_ID </dt><dd><p> A webhook event triggers a build when a GitHub, GitHub Enterprise, or Bitbucket account ID matches the regular expression <code>pattern</code>. </p></dd><dt> HEAD_REF </dt><dd><p> A webhook event triggers a build when the head reference matches the regular expression <code>pattern</code>. For example, <code>refs/heads/branch-name</code> and <code>refs/tags/tag-name</code>. </p><p> Works with GitHub and GitHub Enterprise push, GitHub and GitHub Enterprise pull request, Bitbucket push, and Bitbucket pull request events. </p></dd><dt> BASE_REF </dt><dd><p> A webhook event triggers a build when the base reference matches the regular expression <code>pattern</code>. For example, <code>refs/heads/branch-name</code>. </p><note><p> Works with pull request events only. </p></note></dd><dt> FILE_PATH </dt><dd><p> A webhook triggers a build when the path of a changed file matches the regular expression <code>pattern</code>. </p><note><p> Works with GitHub and Bitbucket events push and pull requests events. Also works with GitHub Enterprise push events, but does not work with GitHub Enterprise pull request events. </p></note></dd><dt>COMMIT_MESSAGE</dt><dd><p>A webhook triggers a build when the head commit message matches the regular expression <code>pattern</code>.</p><note><p> Works with GitHub and Bitbucket events push and pull requests events. Also works with GitHub Enterprise push events, but does not work with GitHub Enterprise pull request events. </p></note></dd></dl>
 */
@property (nonatomic, assign) AWSCodeBuildWebhookFilterType types;

@end

NS_ASSUME_NONNULL_END
